# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling (version v2.39.3)
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/core/plugins/tr181-zram/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=tr181-zram
PKG_VERSION:=v0.1.0
SHORT_DESCRIPTION:=TR-181 swap and ZRAM plugin

# Temporary: tr181-zram has no v0.1.0 tag yet, so the source is the top of
# branch PCF-2785, which moves, so its hash is not checked. Restore the target
# values below once v0.1.0 is tagged (and set PKG_HASH to the hash of the tag
# tarball).
# PKG_SOURCE:=tr181-zram-v0.1.0.tar.gz
# PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-zram/-/archive/v0.1.0
# PKG_HASH:=skip
# PKG_BUILD_DIR:=$(BUILD_DIR)/tr181-zram-v0.1.0
PKG_SOURCE:=tr181-zram-PCF-2785.tar.gz
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-zram/-/archive/PCF-2785
PKG_HASH:=skip
PKG_BUILD_DIR:=$(BUILD_DIR)/tr181-zram-PCF-2785
PKG_MAINTAINER:=Consult Red <support.opensource@consult.red>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=tr181-zram

PKG_RELEASE:=1

define SAHInit/Install
	install -d $(1)/etc/rc.d/
ifneq ($(CONFIG_PACKAGE_procd),y)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/S$(CONFIG_SAH_AMX_TR181_ZRAM_ORDER)$(COMPONENT)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/K$(CONFIG_SAH_AMX_TR181_ZRAM_ORDER)$(COMPONENT)
endif
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=TR-181 Managers
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-zram
  DEPENDS += +amxrt
  DEPENDS += +libamxc
  DEPENDS += +libamxp
  DEPENDS += +libamxd
  DEPENDS += +libamxb
  DEPENDS += +libsahtrace
  DEPENDS += +libamxo
  DEPENDS += +kmod-zram
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	TR-181 swap and ZRAM plugin
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_ZRAM_ORDER=$(CONFIG_SAH_AMX_TR181_ZRAM_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_PACKAGE_zram-swap=$(CONFIG_PACKAGE_zram-swap))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_ZRAM_ORDER=$(CONFIG_SAH_AMX_TR181_ZRAM_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_PACKAGE_zram-swap=$(CONFIG_PACKAGE_zram-swap))

	$(call SAHInit/Install,$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_ZRAM_ORDER=$(CONFIG_SAH_AMX_TR181_ZRAM_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_PACKAGE_zram-swap=$(CONFIG_PACKAGE_zram-swap))
	$(call SAHInit/Install,$(STAGING_DIR))
endef

define Package/$(PKG_NAME)/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	if [ -d ./files ]; then \
		$(CP) ./files/* $(1)/; \
	fi
	find $(1) -name *.a -exec rm {} +;
	find $(1) -name *.h -exec rm {} +;
	find $(1) -name *.pc -exec rm {} +;
endef

define Package/$(PKG_NAME)/config
	source "$(SOURCE)/Config.in"
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
