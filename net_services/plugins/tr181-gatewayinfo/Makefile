include $(TOPDIR)/rules.mk

PKG_NAME:=tr181-gatewayinfo
PKG_VERSION:=v0.2.0-ppw414
PKG_RELEASE:=1
PKG_LICENSE:=BSD-2-Clause-Patent

PKG_SOURCE:=tr181-gatewayinfo-v0.2.0-ppw414.tar.gz
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-gatewayinfo/-/archive/11c21314661bd2ab4f1ee37433331e423fecf9b2
PKG_HASH:=2f7a7e4f754cd8edbd884ce9dc948364b34f5213647aacae604e17ebf0530ab9
PKG_BUILD_DIR:=$(BUILD_DIR)/tr181-gatewayinfo-11c21314661bd2ab4f1ee37433331e423fecf9b2

COMPONENT:=tr181-gatewayinfo

define DMMInit/Install
	install -d ${PKG_INSTALL_DIR}/etc/rc.d/
	if [[ "${CONFIG_PACKAGE_procd}" != "y" ]]; then \
	ln -sfr ${PKG_INSTALL_DIR}/etc/init.d/$(COMPONENT) ${PKG_INSTALL_DIR}/etc/rc.d/S$(CONFIG_DMM_TR181_GATEWAYINFO_ORDER)$(COMPONENT); \
	ln -sfr ${PKG_INSTALL_DIR}/etc/init.d/$(COMPONENT) ${PKG_INSTALL_DIR}/etc/rc.d/K$(CONFIG_DMM_TR181_GATEWAYINFO_ORDER)$(COMPONENT); \
	fi
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	CATEGORY:=prpl Foundation
	SUBMENU:=TR-181 Managers
	TITLE:=TR-181 GatewayInfo component
	DEPENDS += +libamxrt
	DEPENDS += +libamxc
	DEPENDS += +libamxd
	DEPENDS += +libamxo
	DEPENDS += +libamxp
	DEPENDS += +libsahtrace
	DEPENDS += +libnetmodel
	MENU:=1
endef

define Package/$(PKG_NAME)/description
	TR-181 .GatewayInfo object support
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_DMM_TR181_GATEWAYINFO_ORDER=$(CONFIG_DMM_TR181_GATEWAYINFO_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include  CONFIG_DMM_TR181_GATEWAYINFO_ORDER=$(CONFIG_DMM_TR181_GATEWAYINFO_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))

	$(call DMMInit/Install)
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include  CONFIG_DMM_TR181_GATEWAYINFO_ORDER=$(CONFIG_DMM_TR181_GATEWAYINFO_ORDER) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
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
