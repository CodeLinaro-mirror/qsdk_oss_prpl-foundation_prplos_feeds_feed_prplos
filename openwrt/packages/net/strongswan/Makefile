#
# Thin wrapper around the strongswan package from the OpenWrt packages feed.
# Builds it with Linux capability support, so charon can run as a non-root
# user with ambient capabilities instead of falling back to a uid 0 check.
#

STRONGSWAN_UPSTREAM_DIR:=$(TOPDIR)/feeds/packages/net/strongswan

PATCH_DIR:=$(STRONGSWAN_UPSTREAM_DIR)/patches
FILES_DIR:=$(STRONGSWAN_UPSTREAM_DIR)/files
PKG_FILE_DEPENDS:=$(STRONGSWAN_UPSTREAM_DIR)

# CONFIGURE_ARGS is expanded when the upstream Makefile calls BuildPackage, so
# it cannot be extended from here. configure also reads --with-* options from
# the environment, which only reaches this package's build.
export with_capabilities=native

include $(STRONGSWAN_UPSTREAM_DIR)/Makefile

# The BuildPackage calls live in the included Makefile. include/scan.mk only
# indexes Makefiles that mention one, hence this marker:
# $(eval $(call BuildPackage,strongswan))
