# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling (version v2.39.3)
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/core/plugins/tr181-ethernet/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=ethernet-manager
PKG_VERSION:=v1.38.2
SHORT_DESCRIPTION:=Ethernet plugin

PKG_SOURCE:=tr181-ethernet-v1.38.2.tar.gz
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-ethernet/-/archive/v1.38.2
PKG_HASH:=a6e42795b36da0659913937a06d0ce67b91c40efc964c7bbca28fa648111b48f
PKG_BUILD_DIR:=$(BUILD_DIR)/tr181-ethernet-v1.38.2
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=ethernet-manager

PKG_RELEASE:=1

define SAHInit/Install
	install -d $(1)/etc/rc.d/
ifneq ($(CONFIG_PACKAGE_procd),y)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/S$(CONFIG_SAH_AMX_TR181_ETHERNET_ORDER)$(COMPONENT)
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/K$(CONFIG_SAH_AMX_TR181_ETHERNET_ORDER)$(COMPONENT)
endif
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=TR-181 Managers
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-ethernet
  DEPENDS += +libamxb
  DEPENDS += +libamxc
  DEPENDS += +libamxp
  DEPENDS += +libamxd
  DEPENDS += +libamxm
  DEPENDS += +libamxo
  DEPENDS += +libamxs
  DEPENDS += +libsahtrace
  DEPENDS += +libnetmodel
  DEPENDS += +amxrt
  DEPENDS += +mod-dmstats
  DEPENDS += +mod-vlan-ioctl
  DEPENDS += +mod-vlan-uci
  DEPENDS += +mod-netmodel
  DEPENDS += +mod-dmext
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	Ethernet plugin
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_ETHERNET_ORDER=$(CONFIG_SAH_AMX_TR181_ETHERNET_ORDER) CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_USER) CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_ETHERNET_ORDER=$(CONFIG_SAH_AMX_TR181_ETHERNET_ORDER) CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_USER) CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))

	$(call SAHInit/Install,$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_ETHERNET_ORDER=$(CONFIG_SAH_AMX_TR181_ETHERNET_ORDER) CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_USER) CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_ETHERNET_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
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
