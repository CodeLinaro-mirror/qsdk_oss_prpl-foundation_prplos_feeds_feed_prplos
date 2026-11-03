# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/core/plugins/tr181-dns/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=tr181-dns
PKG_VERSION:=v3.13.0
SHORT_DESCRIPTION:=dns plugin

PKG_SOURCE:=tr181-dns-v3.13.0.tar.gz
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-dns/-/archive/v3.13.0
PKG_HASH:=c4242084149a3b6468ae087b6cac8b25071c8063ca788ee9e84fb18fb289c6ef
PKG_BUILD_DIR:=$(BUILD_DIR)/tr181-dns-v3.13.0
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=tr181-dns

PKG_RELEASE:=1

define SAHInit/Install
	install -d $(1)/etc/rc.d/
	if [[ "${CONFIG_PACKAGE_procd}" != "y" ]]; then \
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/S$(CONFIG_SAH_AMX_TR181_DNS_ORDER)$(COMPONENT); \
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/K$(CONFIG_SAH_AMX_TR181_DNS_ORDER)$(COMPONENT); \
	fi
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=TR-181 Managers
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-dns
  DEPENDS += +libamxb
  DEPENDS += +libamxc
  DEPENDS += +libamxd
  DEPENDS += +libamxo
  DEPENDS += +libamxp
  DEPENDS += +libamxm
  DEPENDS += +libnetmodel
  DEPENDS += +libsahtrace
  DEPENDS += +libipat
  DEPENDS += +amxrt
  DEPENDS += +mod-dmext
  DEPENDS += +mod-fw-amx
  DEPENDS += +rpcd
  DEPENDS += +libcares
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	dns plugin
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_DNS_ORDER=$(CONFIG_SAH_AMX_TR181_DNS_ORDER) CONFIG_SAH_AMX_TR181_DNS_CELLULAR=$(CONFIG_SAH_AMX_TR181_DNS_CELLULAR) CONFIG_SAH_AMX_TR181_DNS_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_DNS_RUN_AS_USER) CONFIG_SAH_AMX_TR181_DNS_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_DNS_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_DNS_ORDER=$(CONFIG_SAH_AMX_TR181_DNS_ORDER) CONFIG_SAH_AMX_TR181_DNS_CELLULAR=$(CONFIG_SAH_AMX_TR181_DNS_CELLULAR) CONFIG_SAH_AMX_TR181_DNS_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_DNS_RUN_AS_USER) CONFIG_SAH_AMX_TR181_DNS_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_DNS_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))

	$(call SAHInit/Install,$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_AMX_TR181_DNS_ORDER=$(CONFIG_SAH_AMX_TR181_DNS_ORDER) CONFIG_SAH_AMX_TR181_DNS_CELLULAR=$(CONFIG_SAH_AMX_TR181_DNS_CELLULAR) CONFIG_SAH_AMX_TR181_DNS_RUN_AS_USER=$(CONFIG_SAH_AMX_TR181_DNS_RUN_AS_USER) CONFIG_SAH_AMX_TR181_DNS_RUN_AS_GROUP=$(CONFIG_SAH_AMX_TR181_DNS_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
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
