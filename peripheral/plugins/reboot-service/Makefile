# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling (version v2.39.3)
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/core/plugins/reboot-service/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=reboot-service
PKG_VERSION:=v1.5.3
SHORT_DESCRIPTION:=Plugin to count and log the reason of each reboot

PKG_SOURCE:=reboot-service-v1.5.3.tar.gz
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/reboot-service/-/archive/v1.5.3
PKG_HASH:=06e8acc87af650f118131968f74b6d202d9bd33179659e42cadc0c26bbfb4ecc
PKG_BUILD_DIR:=$(BUILD_DIR)/reboot-service-v1.5.3
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=reboot-service

PKG_RELEASE:=1

define SAHInit/Install
	install -d $(1)/etc/rc.d/
ifneq ($(CONFIG_PACKAGE_procd),y)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/S$(CONFIG_SAH_REBOOT_SERVICE_START_ORDER)$(COMPONENT)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/K$(CONFIG_SAH_REBOOT_SERVICE_STOP_ORDER)$(COMPONENT)
endif
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=Ambiorix
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/reboot-service
  DEPENDS += +libamxc
  DEPENDS += +libamxp
  DEPENDS += +libamxd
  DEPENDS += +libamxj
  DEPENDS += +libamxo
  DEPENDS += +libamxm
  DEPENDS += +libsahtrace
  DEPENDS += +amxrt
  DEPENDS += +mod-dmext
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	Plugin to count and log the reason of each reboot
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_REBOOT_SERVICE_START_ORDER=$(CONFIG_SAH_REBOOT_SERVICE_START_ORDER) CONFIG_SAH_REBOOT_SERVICE_STOP_ORDER=$(CONFIG_SAH_REBOOT_SERVICE_STOP_ORDER) CONFIG_SAH_REBOOT_SERVICE_RUN_AS_USER=$(CONFIG_SAH_REBOOT_SERVICE_RUN_AS_USER) CONFIG_SAH_REBOOT_SERVICE_RUN_AS_GROUP=$(CONFIG_SAH_REBOOT_SERVICE_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_REBOOT_SERVICE_START_ORDER=$(CONFIG_SAH_REBOOT_SERVICE_START_ORDER) CONFIG_SAH_REBOOT_SERVICE_STOP_ORDER=$(CONFIG_SAH_REBOOT_SERVICE_STOP_ORDER) CONFIG_SAH_REBOOT_SERVICE_RUN_AS_USER=$(CONFIG_SAH_REBOOT_SERVICE_RUN_AS_USER) CONFIG_SAH_REBOOT_SERVICE_RUN_AS_GROUP=$(CONFIG_SAH_REBOOT_SERVICE_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))

	$(call SAHInit/Install,$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_REBOOT_SERVICE_START_ORDER=$(CONFIG_SAH_REBOOT_SERVICE_START_ORDER) CONFIG_SAH_REBOOT_SERVICE_STOP_ORDER=$(CONFIG_SAH_REBOOT_SERVICE_STOP_ORDER) CONFIG_SAH_REBOOT_SERVICE_RUN_AS_USER=$(CONFIG_SAH_REBOOT_SERVICE_RUN_AS_USER) CONFIG_SAH_REBOOT_SERVICE_RUN_AS_GROUP=$(CONFIG_SAH_REBOOT_SERVICE_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
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
