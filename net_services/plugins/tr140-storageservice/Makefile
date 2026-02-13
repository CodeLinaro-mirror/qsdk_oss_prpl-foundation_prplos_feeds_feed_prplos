# WARNING: Automatically generated file using BAF (Build system Agnostic File) tooling
# WARNING: You should contribute changes to https://gitlab.com/prpl-foundation/components/core/plugins/tr140-storageservice/-/blob/main/baf.yml instead
include $(TOPDIR)/rules.mk

PKG_NAME:=tr140-storageservice
PKG_VERSION:=v0.1.0
SHORT_DESCRIPTION:=TR-140 storage service manager

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2026-08-24
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr140-storageservice
PKG_SOURCE_VERSION:=e7bc1f3cb38c3dc80baad395fd85f7c4e87c38dd
PKG_MIRROR_HASH:=345c96977d219048124dfeb25588e6ee7b9f603b13450f80778873f15f378a74

PKG_BUILD_DIR:=$(BUILD_DIR)/tr140-storageservice-v0.1.0
PKG_MAINTAINER:=Sagemcom <support.opensource@sagemcom.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE

COMPONENT:=tr140-storageservice

PKG_RELEASE:=1

define SAHInit/Install
	install -d $(1)/etc/rc.d/
	if [[ "${CONFIG_PACKAGE_procd}" != "y" ]]; then \
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/S$(CONFIG_AMX_TR140_STORAGE_SERVICE_ORDER)$(COMPONENT); \
	ln -sfr $(1)/etc/init.d/$(COMPONENT) $(1)/etc/rc.d/K$(CONFIG_AMX_TR140_STORAGE_SERVICE_ORDER)$(COMPONENT); \
	fi
endef

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=TR-181 Managers
  TITLE:=$(SHORT_DESCRIPTION)
  URL:=https://gitlab.com/prpl-foundation/components/core/plugins/tr140-storageservice
  DEPENDS += +libamxb
  DEPENDS += +libamxc
  DEPENDS += +libamxd
  DEPENDS += +libamxo
  DEPENDS += +libamxp
  DEPENDS += +libamxm
  DEPENDS += +libsahtrace
  DEPENDS += +libnetmodel
  DEPENDS += +amxrt
  DEPENDS += +libsysfs
  DEPENDS += +lsblk
  DEPENDS += +AMX_TR140_STORAGE_SERVICE_ENABLE_NTFS_3G:ntfs-3g
  DEPENDS += +hfsfsck
  DEPENDS += +ksmbd-server
  DEPENDS += +libbsd
  DEPENDS += +kmod-fs-ext4 +kmod-fs-hfs +kmod-fs-hfsplus +kmod-fs-vfat +kmod-fs-exfat +kmod-fuse +kmod-fs-ntfs +kmod-fs-ntfs3
  MENU:=1
endef

define Package/$(PKG_NAME)/description
	storage service manager
endef

define Build/Compile
	$(call Build/Compile/Default, STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_AMX_TR140_STORAGE_SERVICE_ORDER=$(CONFIG_AMX_TR140_STORAGE_SERVICE_ORDER) CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_USER=$(CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_USER) CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_GROUP=$(CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_GROUP) CONFIG_AMX_TR140_STORAGE_SERVICE_FOLDER_AUTO_ADD_USB_DEVICES_ROOT=$(CONFIG_AMX_TR140_STORAGE_SERVICE_FOLDER_AUTO_ADD_USB_DEVICES_ROOT) CONFIG_AMX_TR140_STORAGE_SERVICE_ENABLE_NTFS_3G=$(CONFIG_AMX_TR140_STORAGE_SERVICE_ENABLE_NTFS_3G) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
endef

define Build/Install
	$(call Build/Install/Default, install INSTALL=install D=$(PKG_INSTALL_DIR) DEST=$(PKG_INSTALL_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_AMX_TR140_STORAGE_SERVICE_ORDER=$(CONFIG_AMX_TR140_STORAGE_SERVICE_ORDER) CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_USER=$(CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_USER) CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_GROUP=$(CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))

	$(call SAHInit/Install,$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(call Build/Install/Default, install INSTALL=install D=$(STAGING_DIR) DEST=$(STAGING_DIR) STAGINGDIR=$(STAGING_DIR) CONFIGDIR=$(STAGING_DIR) PV=$(PKG_VERSION) PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig LIBDIR=/usr/lib INSTALL_LIB_DIR=/lib INSTALL_BIN_DIR=/bin RAW_VERSION=$(PKG_VERSION) HARDCO_HAL_DIR=$(STAGING_DIR)/usr/include CONFIG_AMX_TR140_STORAGE_SERVICE_ORDER=$(CONFIG_AMX_TR140_STORAGE_SERVICE_ORDER) CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_USER=$(CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_USER) CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_GROUP=$(CONFIG_AMX_TR140_STORAGE_SERVICE_RUN_AS_GROUP) CONFIG_PACKAGE_procd=$(CONFIG_PACKAGE_procd))
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
