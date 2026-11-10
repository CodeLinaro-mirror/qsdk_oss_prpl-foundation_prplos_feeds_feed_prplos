# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/core/plugins/tr181-pcm/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=pcm-manager
PKG_VERSION:=dev_PPW-2555_stable4.0
SHORT_DESCRIPTION:=Upgrade Persistent Configuration Manager

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=dev_PPW-2555_stable4.0
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-pcm.git
PKG_MIRROR_HASH:=skip
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=pcm-manager

PKG_RELEASE:=1

define SAHInit/Install
	install -d ${PKG_INSTALL_DIR}/etc/rc.d/
	ln -sfr ${PKG_INSTALL_DIR}/etc/init.d/$(COMPONENT) ${PKG_INSTALL_DIR}/etc/rc.d/S$(CONFIG_SAH_AMX_PCM_ORDER)$(COMPONENT)
	ln -sfr ${PKG_INSTALL_DIR}/etc/init.d/$(COMPONENT) ${PKG_INSTALL_DIR}/etc/rc.d/K$(CONFIG_SAH_AMX_PCM_ORDER)$(COMPONENT)
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=TR-181 Managers
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr181-pcm
  DEPENDS += +amxrt
  DEPENDS += +libamxc
  DEPENDS += +libamxd
  DEPENDS += +libamxp
  DEPENDS += +libamxb
  DEPENDS += +libamxo
  DEPENDS += +libamxm
  DEPENDS += +libamxj
  DEPENDS += +libsahtrace
  DEPENDS += +mod-dmext
  DEPENDS += +mod-pcm-svc
  DEPENDS += +libxml2
  DEPENDS += +SAH_AMX_PCM_TARBALL:libarchive
  DEPENDS += +libopenssl
  DEPENDS += +SAH_AMX_PCM_SECURESTORE:prpl-securestore
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	Upgrade Persistent Configuration Manager
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_SAH_AMX_PCM_ORDER=$(CONFIG_SAH_AMX_PCM_ORDER) CONFIG_SAH_AMX_PCM_TARBALL=$(CONFIG_SAH_AMX_PCM_TARBALL) CONFIG_SAH_AMX_PCM_RUN_AS_USER=$(CONFIG_SAH_AMX_PCM_RUN_AS_USER) CONFIG_SAH_AMX_PCM_RUN_AS_GROUP=$(CONFIG_SAH_AMX_PCM_RUN_AS_GROUP) CONFIG_SAH_AMX_PCM_SECURESTORE=$(CONFIG_SAH_AMX_PCM_SECURESTORE))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_ACCESSPOINT=$(CONFIG_PRPL_CPE_OPMODE_EXTENDER) CONFIG_GATEWAY=$(CONFIG_PRPL_CPE_OPMODE_GATEWAY) CONFIG_SAH_AMX_PCM_ORDER=$(CONFIG_SAH_AMX_PCM_ORDER) CONFIG_SAH_AMX_PCM_TARBALL=$(CONFIG_SAH_AMX_PCM_TARBALL) CONFIG_SAH_AMX_PCM_RUN_AS_USER=$(CONFIG_SAH_AMX_PCM_RUN_AS_USER) CONFIG_SAH_AMX_PCM_RUN_AS_GROUP=$(CONFIG_SAH_AMX_PCM_RUN_AS_GROUP) CONFIG_SAH_AMX_PCM_SECURESTORE=$(CONFIG_SAH_AMX_PCM_SECURESTORE))

	$(call SAHInit/Install)
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_ACCESSPOINT=$(CONFIG_PRPL_CPE_OPMODE_EXTENDER) CONFIG_GATEWAY=$(CONFIG_PRPL_CPE_OPMODE_GATEWAY) CONFIG_SAH_AMX_PCM_ORDER=$(CONFIG_SAH_AMX_PCM_ORDER) CONFIG_SAH_AMX_PCM_TARBALL=$(CONFIG_SAH_AMX_PCM_TARBALL) CONFIG_SAH_AMX_PCM_RUN_AS_USER=$(CONFIG_SAH_AMX_PCM_RUN_AS_USER) CONFIG_SAH_AMX_PCM_RUN_AS_GROUP=$(CONFIG_SAH_AMX_PCM_RUN_AS_GROUP) CONFIG_SAH_AMX_PCM_SECURESTORE=$(CONFIG_SAH_AMX_PCM_SECURESTORE))
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
