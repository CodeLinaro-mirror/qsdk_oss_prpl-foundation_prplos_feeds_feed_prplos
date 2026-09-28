#!/bin/sh

ROOT_DIR=$1

OPENWRT_SCRIPT="$ROOT_DIR/lib/functions/network.sh"
DDNS_FUNCTIONS_SCRIPTS="$ROOT_DIR/usr/lib/ddns"

LINE_SETS_HTTPS="[ \$use_https -ne 0 ] && __URL=\$(echo \$__URL | sed -e 's#^http:#https:#')"
LINE_SETS_HTTP="[ \$use_https -eq 0 ] && __URL=\$(echo \$__URL | sed -e 's#^https:#http:#')"

echo "Patching ddns-scripts"

if [ ! -d "$DDNS_FUNCTIONS_SCRIPTS" ]; then
    echo "Failed to patch ddns-scripts - Directory '$DDNS_FUNCTIONS_SCRIPTS' does not exist."
    exit 1
fi

if [ ! -f "$OPENWRT_SCRIPT" ]; then
    echo "Failed to patch ddns-scripts - $OPENWRT_SCRIPT doesn't exist"
    exit 1
fi

# Iterate over .sh files in the directory
for file in "$DDNS_FUNCTIONS_SCRIPTS"/*.sh; do
    PATCH_FAILED=0

    # Check if any .sh files exist
    [ -e "$file" ] || continue

    # Add feature to replace https by http
    if ! grep -qF "$LINE_SETS_HTTP" "$file"; then
        escaped_line_sets_https=$(printf "%s\n" "$LINE_SETS_HTTPS" | sed 's/[&/\]/\\&/g')

        if ! sed -i "/$escaped_line_sets_https/a $LINE_SETS_HTTP" "$file"; then
            echo "ERROR: Add feature to replace https by http failed for $file"
            PATCH_FAILED=1
        fi
    fi

    # Replace the network_get_device by ddns_get_device
    if ! grep -q "ddns_get_device" "$file"; then
        if ! sed -i 's/network_get_device/ddns_get_device/g' "$file"; then
            echo "ERROR: Replace network_get_device by ddns_get_device failed."
            PATCH_FAILED=1
        fi
    fi

    # Fix NXDOMAIN in verify_host_port(): if $ERRFILE does NOT contain "timed out" it is an
    # NXDOMAIN / no-record condition — return 0 so the caller does not abort.
    if ! grep -q 'grep -q "timed out" "$ERRFILE" 2>/dev/null || return 0' "$file"; then
        if grep -q 'DNS Resolver Error.*[$]__PROG Error' "$file"; then
            TMPFILE=$(mktemp)
            if [ -z "$TMPFILE" ]; then
                echo "ERROR: NXDOMAIN fix (verify_host) failed (mktemp)."
                PATCH_FAILED=1
            else
                while IFS= read -r line; do
                    if printf '%s' "$line" | grep -q 'DNS Resolver Error.*[$]__PROG Error'; then
                        printf '%s\n' 'grep -q "timed out" "$ERRFILE" 2>/dev/null || return 0'
                    fi
                    printf '%s\n' "$line"
                done < "$file" > "$TMPFILE"
                if ! mv -f "$TMPFILE" "$file"; then
                    echo "ERROR: NXDOMAIN fix (verify_host) failed (mv)."
                    PATCH_FAILED=1
                fi
            fi
        fi
    fi

    # Fix NXDOMAIN in get_registered_ip(): this is the function called during
    # "Detect registered/public IP". On NXDOMAIN, nslookup exits non-zero just like
    # a network timeout, causing infinite retries instead of updating. When $ERRFILE
    # does NOT contain "timed out", treat it as "no record exists": set the registered
    # IP to empty and return 0 so the caller sees registered="" != local_IP and updates.
    if ! grep -q 'grep -q "timed out" "$ERRFILE" 2>/dev/null || { eval' "$file"; then
        if grep -q '"[$]__PROG error: ' "$file"; then
            TMPFILE=$(mktemp)
            if [ -z "$TMPFILE" ]; then
                echo "ERROR: NXDOMAIN fix (get_registered_ip) failed (mktemp)."
                PATCH_FAILED=1
            else
                while IFS= read -r line; do
                    if printf '%s' "$line" | grep -q '"[$]__PROG error: '; then
                        printf '%s\n' 'grep -q "timed out" "$ERRFILE" 2>/dev/null || { eval "$1=\"\""; return 0; }'
                    fi
                    printf '%s\n' "$line"
                done < "$file" > "$TMPFILE"
                if ! mv -f "$TMPFILE" "$file"; then
                    echo "ERROR: NXDOMAIN fix (get_registered_ip) failed (mv)."
                    PATCH_FAILED=1
                fi
            fi
        fi
    fi

    if [ $PATCH_FAILED -eq 1 ]; then
        echo "ERROR: Failed to patch ddns-scripts - Patch of file $file failed."
    fi
done

# Add the ddns_get_device function to /lib/functions/network.sh
if ! grep -q "ddns_get_device" "$OPENWRT_SCRIPT"; then
    echo "ddns_get_device() { __tmp=\"\$1=\$2\"; eval \"\$__tmp\"; }" >> "$OPENWRT_SCRIPT"
fi