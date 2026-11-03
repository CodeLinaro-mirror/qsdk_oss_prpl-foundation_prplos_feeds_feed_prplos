# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling (version v2.39.3)
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/ambiorix/modules/amxb_backends/amxb_usp/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=mod-amxb-usp
PKG_VERSION:=v5.12.1-ppw414
SHORT_DESCRIPTION:=USP backend implementation for amxb

PKG_SOURCE:=amxb_usp-v5.12.1-ppw414.tar.gz
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/ambiorix/modules/amxb_backends/amxb_usp/-/archive/c1b7a4588dc175a639d4e22399fe8dca530eead6
PKG_HASH:=f37e8f7cfec28808558256c6885a34001c5d20e72a0c9aba7f8af4aec01ac805
PKG_BUILD_DIR:=$(BUILD_DIR)/amxb_usp-c1b7a4588dc175a639d4e22399fe8dca530eead6
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE


PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=Modules
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/ambiorix/modules/amxb_backends/amxb_usp
  DEPENDS += +libamxc
  DEPENDS += +libamxp
  DEPENDS += +libamxd
  DEPENDS += +libamxb
  DEPENDS += +libamxo
  DEPENDS += +libimtp
  DEPENDS += +libusp
  DEPENDS += +libuspi
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	USP backend implementation for amxb
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_MOD_AMXB_USP_INSTALL_DIR=$(CONFIG_SAH_MOD_AMXB_USP_INSTALL_DIR) CONFIG_SAH_MOD_AMXB_USP_REQUIRES_DEVICE_PREFIX=$(CONFIG_SAH_MOD_AMXB_USP_REQUIRES_DEVICE_PREFIX) CONFIG_SAH_MOD_AMXB_USP_REGISTER_RETRY=$(CONFIG_SAH_MOD_AMXB_USP_REGISTER_RETRY))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_MOD_AMXB_USP_INSTALL_DIR=$(CONFIG_SAH_MOD_AMXB_USP_INSTALL_DIR) CONFIG_SAH_MOD_AMXB_USP_REQUIRES_DEVICE_PREFIX=$(CONFIG_SAH_MOD_AMXB_USP_REQUIRES_DEVICE_PREFIX) CONFIG_SAH_MOD_AMXB_USP_REGISTER_RETRY=$(CONFIG_SAH_MOD_AMXB_USP_REGISTER_RETRY))
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include PKG_CONFIG=$(PKG_CONFIG) CONFIG_SAH_MOD_AMXB_USP_INSTALL_DIR=$(CONFIG_SAH_MOD_AMXB_USP_INSTALL_DIR) CONFIG_SAH_MOD_AMXB_USP_REQUIRES_DEVICE_PREFIX=$(CONFIG_SAH_MOD_AMXB_USP_REQUIRES_DEVICE_PREFIX) CONFIG_SAH_MOD_AMXB_USP_REGISTER_RETRY=$(CONFIG_SAH_MOD_AMXB_USP_REGISTER_RETRY))
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
