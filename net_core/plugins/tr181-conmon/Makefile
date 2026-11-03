# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/core/plugins/tr181-conmon/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=tr181-conmon
PKG_VERSION:=v0.4.0
SHORT_DESCRIPTION:=Connection Monitor plugin

PKG_SOURCE:=tr181-conmon-v0.4.0.tar.gz
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-conmon/-/archive/v0.4.0
PKG_HASH:=69395ac4f2b83bf3cbdc5d99da7f6bd4ab0cb7b91a1db48e03adb9cab16f9977
PKG_BUILD_DIR:=$(BUILD_DIR)/tr181-conmon-v0.4.0
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=tr181-conmon

PKG_RELEASE:=1
PKG_BUILD_DEPENDS += libamxrt

define SAHInit/Install
	install -d $(1)/etc/rc.d/
	if [[ "${CONFIG_PACKAGE_procd}" != "y" ]]; then \
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/S$(CONFIG_SAH_AMX_TR181_CONMON_START_ORDER)$(COMPONENT); \
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/K$(CONFIG_SAH_AMX_TR181_CONMON_STOP_ORDER)$(COMPONENT); \
	fi
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=Plugins
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-conmon
  DEPENDS += +libamxc
  DEPENDS += +libamxp
  DEPENDS += +libamxd
  DEPENDS += +libamxo
  DEPENDS += +libamxm
  DEPENDS += +amxrt
  DEPENDS += +libsahtrace
  DEPENDS += +mod-dmext
  DEPENDS += +libnetmodel
  DEPENDS += +libdiscoping
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	Connection Monitor plugin
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_CONMON_START_ORDER=$(CONFIG_SAH_AMX_TR181_CONMON_START_ORDER) CONFIG_SAH_AMX_TR181_CONMON_STOP_ORDER=$(CONFIG_SAH_AMX_TR181_CONMON_STOP_ORDER) CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_USER) CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_CONMON_START_ORDER=$(CONFIG_SAH_AMX_TR181_CONMON_START_ORDER) CONFIG_SAH_AMX_TR181_CONMON_STOP_ORDER=$(CONFIG_SAH_AMX_TR181_CONMON_STOP_ORDER) CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_USER) CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))

	$(call SAHInit/Install,$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_CONMON_START_ORDER=$(CONFIG_SAH_AMX_TR181_CONMON_START_ORDER) CONFIG_SAH_AMX_TR181_CONMON_STOP_ORDER=$(CONFIG_SAH_AMX_TR181_CONMON_STOP_ORDER) CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_USER) CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_CONMON_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
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
