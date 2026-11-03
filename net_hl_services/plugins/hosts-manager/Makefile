# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling (version v2.39.3)
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/core/plugins/tr181-hosts/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=hosts-manager
PKG_VERSION:=v0.16.0
SHORT_DESCRIPTION:=Implementation of Device

PKG_SOURCE:=tr181-hosts-v0.16.0.tar.gz
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-hosts/-/archive/v0.16.0
PKG_HASH:=9111c1a515305a13ee74fdf6e0ef532f1a1ee6b0ed2480c3458e24880cdcf988
PKG_BUILD_DIR:=$(BUILD_DIR)/tr181-hosts-v0.16.0
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=hosts-manager

PKG_RELEASE:=1
PKG_BUILD_DEPENDS += libamxb

define SAHInit/Install
	install -d $(1)/etc/rc.d/
ifneq ($(CONFIG_PACKAGE_procd),y)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/S$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_START_ORDER)$(COMPONENT)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/K$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_STOP_ORDER)$(COMPONENT)
endif
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=TR-181 Managers
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-hosts
  DEPENDS += +libamxc
  DEPENDS += +libamxd
  DEPENDS += +libamxo
  DEPENDS += +libamxs
  DEPENDS += +libamxm
  DEPENDS += +libgmap-client
  DEPENDS += +libsahtrace
  DEPENDS += +libnetmodel
  DEPENDS += +mod-dmext
  DEPENDS += +gmap-client
  DEPENDS += +gmap-mod-ethernet-dev
  DEPENDS += +gmap-mod-name-selector
  DEPENDS += +gmap-mod-self
  DEPENDS += +gmap-server
  DEPENDS += +libtr181-schedules
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	Implementation of Device.Hosts of the TR-181 datamodel
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_USER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_USER) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_GROUP=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_START_ORDER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_START_ORDER) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_STOP_ORDER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_STOP_ORDER))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_USER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_USER) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_GROUP=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_START_ORDER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_START_ORDER) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_STOP_ORDER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_STOP_ORDER))

	$(call SAHInit/Install,$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_USER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_USER) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_GROUP=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_START_ORDER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_START_ORDER) CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_STOP_ORDER=$(CONFIG_SAH_SERVICES_AMX-HOSTS-MANAGER_STOP_ORDER))
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
	rm $(1)/usr/bin/$(PKG_NAME)
endef

define Package/$(PKG_NAME)/config
	source "$(SOURCE)/Config.in"
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
