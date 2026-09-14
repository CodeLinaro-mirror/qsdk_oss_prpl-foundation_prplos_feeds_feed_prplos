include $(TOPDIR)/rules.mk
 
PKG_NAME:=tr181-gps
PKG_VERSION:=feature_PCF_2326
SHORT_DESCRIPTION:=TR-181 GPS Manager

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=feature_PCF_2326
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-gps.git
PKG_MIRROR_HASH:=3dd2f689fdcb81b01acf0eaafba21a7276287ebfe88806626d4b72b79479c6cd
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_MAINTAINER:= Tata Elxsi
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=tr181-gps
 
PKG_RELEASE:=1
 
define SAHInit/Install
	install -d $(1)/etc/rc.d/
ifneq ($(CONFIG_PACKAGE_procd),y)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/S$(CONFIG_AMX_TR181_GPS_ORDER)$(COMPONENT)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/K$(CONFIG_AMX_TR181_GPS_ORDER)$(COMPONENT)
endif
endef

PKG_BUILD_DEPENDS:=gpsd

include $(INCLUDE_DIR)/package.mk
 
define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=TR-181 Managers
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-gps
  DEPENDS += +libamxc
  DEPENDS += +libamxp
  DEPENDS += +libamxd
  DEPENDS += +libamxb
  DEPENDS += +libamxo
  DEPENDS += +libamxm
  DEPENDS += +libsahtrace
  DEPENDS += +libgps
  MENU:=1
endef
 
define Package/$(PKG_NAME)/description
	tr181-gps implementation
endef
 
define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_AMX_TR181_GPS_ORDER=$(CONFIG_AMX_TR181_GPS_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_AMX_TR181_GPS_DEVICE=$(CONFIG_AMX_TR181_GPS_DEVICE) CONFIG_AMX_TR181_GPS_BAUDRATE=$(CONFIG_AMX_TR181_GPS_BAUDRATE))
endef
 
define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_AMX_TR181_GPS_ORDER=$(CONFIG_AMX_TR181_GPS_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_AMX_TR181_GPS_DEVICE=$(CONFIG_AMX_TR181_GPS_DEVICE) CONFIG_AMX_TR181_GPS_BAUDRATE=$(CONFIG_AMX_TR181_GPS_BAUDRATE))	
	$(call SAHInit/Install,$(PKG_INSTALL_DIR))
endef
 
define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_AMX_TR181_GPS_ORDER=$(CONFIG_AMX_TR181_GPS_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_AMX_TR181_GPS_DEVICE=$(CONFIG_AMX_TR181_GPS_DEVICE) CONFIG_AMX_TR181_GPS_BAUDRATE=$(CONFIG_AMX_TR181_GPS_BAUDRATE))
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
