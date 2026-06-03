include $(TOPDIR)/rules.mk

PKG_NAME:=mcastd-core
PKG_VERSION:=dev_main_PPW-1869
SHORT_DESCRIPTION:=Kernel module for multicast support

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=dev_main_PPW-1869
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/components/core/kmodules/mcastd-core.git
PKG_MIRROR_HASH:=skip
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=BSD-2-Clause-Patent
PKG_LICENSE_FILES:=LICENSE


PKG_RELEASE:=1
PKG_EXTMOD_SUBDIRS+=src/kernel_core
PKG_EXTMOD_SUBDIRS+=src/kernel_proxy

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=Kernel Modules
  TITLE:=$(SHORT_DESCRIPTION)
  FILES+=$(PKG_BUILD_DIR)/src/kernel_core/mcastd-core.$(LINUX_KMOD_SUFFIX)
  FILES+=$(PKG_BUILD_DIR)/src/kernel_proxy/mcastd-proxy.$(LINUX_KMOD_SUFFIX)
  URL:=https://gitlab.com/prpl-foundation/components/core/kmodules/mcastd-core
  DEPENDS += +libxtables
  DEPENDS += +iptables
  MENU:=1
endef

define KernelPackage/$(PKG_NAME)/description
	Kernel module for multicast support
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) compile \
		COMPONENT=$(PKG_NAME) \
		COMPONENT_TOPDIR=$(PKG_BUILD_DIR) \
		STAGINGDIR=$(STAGING_DIR) \
		CONFIGDIR=$(STAGING_DIR) \
		LINUX_DIR=$(LINUX_DIR) \
		CONFIG_MCASTD_CORE_DEBUG=$(CONFIG_MCASTD_CORE_DEBUG) \
		CONFIG_MCASTD_CORE_NICE=$(CONFIG_MCASTD_CORE_NICE) \
		CONFIG_MCASTD_CORE_ACCESS_CONTROL=$(CONFIG_MCASTD_CORE_ACCESS_CONTROL) \
		BUILD_DIR=$(PKG_BUILD_DIR) \
		$(MAKE_FLAGS) \
		$(KERNEL_MAKE_FLAGS)
endef

define Build/Install
	$(MAKE) -C $(PKG_BUILD_DIR) install \
		COMPONENT=$(PKG_NAME) \
		COMPONENT_TOPDIR=$(PKG_BUILD_DIR) \
		STAGINGDIR=$(STAGING_DIR) \
		CONFIGDIR=$(STAGING_DIR) \
		KMOD_INSTALL_PATH_PREFIX=$(PKG_INSTALL_DIR) \
		HARDCO_KERNEL_DIR=$(LINUX_DIR) \
		CONFIG_MCASTD_CORE_DEBUG=$(CONFIG_MCASTD_CORE_DEBUG) \
		CONFIG_MCASTD_CORE_NICE=$(CONFIG_MCASTD_CORE_NICE) \
		CONFIG_MCASTD_CORE_ACCESS_CONTROL=$(CONFIG_MCASTD_CORE_ACCESS_CONTROL) \
		D=$(PKG_INSTALL_DIR) \
		DEST=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(MAKE) -C $(PKG_BUILD_DIR) install \
		COMPONENT=$(PKG_NAME) \
		COMPONENT_TOPDIR=$(PKG_BUILD_DIR) \
		STAGINGDIR=$(STAGING_DIR) \
		CONFIGDIR=$(STAGING_DIR) \
		KMOD_INSTALL_PATH_PREFIX=$(STAGING_DIR) \
		HARDCO_KERNEL_DIR=$(LINUX_DIR) \
		CONFIG_MCASTD_CORE_DEBUG=$(CONFIG_MCASTD_CORE_DEBUG) \
		CONFIG_MCASTD_CORE_NICE=$(CONFIG_MCASTD_CORE_NICE) \
		CONFIG_MCASTD_CORE_ACCESS_CONTROL=$(CONFIG_MCASTD_CORE_ACCESS_CONTROL) \
		D=$(STAGING_DIR) \
		DEST=$(STAGING_DIR)
endef

define KernelPackage/$(PKG_NAME)/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	if [ -d ./files ]; then \
		$(CP) ./files/* $(1)/; \
	fi
	find $(1) -name *.a -exec rm {} +;
	find $(1) -name *.h -exec rm {} +;
	find $(1) -name *.pc -exec rm {} +;
endef

define KernelPackage/$(PKG_NAME)/config
	source "$(SOURCE)/Config.in"
endef

$(eval $(call KernelPackage,$(PKG_NAME)))

