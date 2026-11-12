include $(TOPDIR)/rules.mk

PKG_NAME:=uboot-tools
PKG_VERSION:=v2026.01
SHORT_DESCRIPTION:=U-Boot upstream bootloader for tools

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/u-boot/u-boot/archive/refs/tags
PKG_SOURCE_URL_FILE:=$(PKG_VERSION).tar.gz
PKG_HASH:=03bb43c58d2343ee48dd191e0f181f0108425b179d84519add3a977071c3f654
# The top directory of the GitHub archive has no leading v in the version
UBOOT_SRC_DIR:=u-boot-$(patsubst v%,%,$(PKG_VERSION))
PKG_BUILD_DEPENDS:=libopenssl
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=LICENSE

PKG_RELEASE:=1
PYTHON3_PKG_BUILD:=0
HOST_BUILD_DEPENDS:=python3/host

LIBRARIES:= openssl

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host.mk

# Pin PyPI build dependencies (swig) pulled into pip's isolated PEP 517
# build environments, which requirements.txt cannot reach (PPW-2321).
HOST_PYTHON3_PIP_VARS += PIP_CONSTRAINT="$(CURDIR)/constraints.txt"

# Similar to HostPython3/PipInstall() from python3-host.mk but with no check on hashes
# since we use it to install SWUGenerator previously downloaded by OpenWrt with hash
# verification. pip install with --require-hashes cannot work from a local directory.
# --no-deps is also passed to make sure dependencies are not installed without checking
# the hash
define HostPython3/Local/PipInstall
	$(call locked, \
		$(HOST_PYTHON3_VARS) \
		$(HOST_PYTHON3_PIP_VARS) \
		$(HOST_PYTHON3_PIP) \
			install \
			--no-binary :all: \
			--progress-bar off \
			--no-deps \
			file://$(1) \
		$(if $(CONFIG_PYTHON3_HOST_PIP_CACHE_WORLD_READABLE), \
			&& $(FIND) $(HOST_PYTHON3_PIP_CACHE_DIR) -not -type d -exec chmod go+r  '{}' \; \
			&& $(FIND) $(HOST_PYTHON3_PIP_CACHE_DIR)      -type d -exec chmod go+rx '{}' \; \
		), \
		pip \
	)
endef

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=Image Generation
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://source.denx.de/u-boot/u-boot.git
  DEPENDS += +libopenssl
endef

define Package/$(PKG_NAME)/description
	U-Boot tools
endef

UBOOT_CROSS_TOOLS := \
	fit_info \
	fit_check_sign \
	preload_check_sign

PKG_BUILD_DIR:=$(BUILD_DIR)/$(UBOOT_SRC_DIR)

define Build/Compile
	$(MAKE) STAGINGDIR=$(STAGING_DIR) \
		CROSS_COMPILE=$(TOOLCHAIN_BIN_DIRS)/$(TARGET_CROSS) \
		-C $(PKG_BUILD_DIR) \
		tools-only_defconfig \
		cross_tools
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(foreach tool,$(UBOOT_CROSS_TOOLS), \
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/$(tool) $(1)/usr/bin/; \
	)
	if [ -d ./files ]; then \
		$(CP) ./files/* $(1)/; \
	fi
endef

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(UBOOT_SRC_DIR)

define Host/Compile
	$(call HostPython3/PipInstall,-r requirements.txt)
	$(MAKE) STAGINGDIR=$(STAGING_DIR_HOST) \
		-C $(HOST_BUILD_DIR) \
		tools-only_defconfig \
		scripts_dtc tools-only
endef

define Host/Install
	@echo "******* Installing pylib on the host *******"
	$(call HostPython3/Local/PipInstall,$(HOST_BUILD_DIR)/tools/u_boot_pylib)
	@echo "******* Installing dtoc on the host *******"
	$(call HostPython3/Local/PipInstall,$(HOST_BUILD_DIR)/tools/dtoc)
	@echo "******* Installing binman on the host *******"
	$(call HostPython3/Local/PipInstall,$(HOST_BUILD_DIR)/tools/binman)
	@echo "******* Installing mkimage on host *******"
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(CP) $(HOST_BUILD_DIR)/tools/mkimage $(STAGING_DIR_HOST)/bin
	$(CP) $(HOST_BUILD_DIR)/scripts/dtc/dtc $(STAGING_DIR_HOST)/bin
	# Other tools can be installed if required
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOST)/bin/mkimage
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
$(eval $(call HostBuild))
