#
# Copyright (C) 2012-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=odhcp6c
PKG_VERSION:=dev_PPW-2016
PKG_RELEASE:=20

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=dev_PPW-2016
PKG_SOURCE_URL:=https://gitlab.com/prpl-foundation/mirrors/odhcp6c.git
PKG_MIRROR_HASH:=skip
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Hans Dedecker <dedeckeh@gmail.com>
PKG_LICENSE:=GPL-2.0

PKG_CONFIG_DEPENDS:=CONFIG_ODHCP6C_ENABLE_UBUS

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DUSE_LIBUBOX=on

ifneq ($(CONFIG_PACKAGE_odhcp6c_ext_cer_id),0)
  CMAKE_OPTIONS += -DEXT_CER_ID=$(CONFIG_PACKAGE_odhcp6c_ext_cer_id)
endif

ifeq ($(CONFIG_ODHCP6C_ENABLE_UBUS),y)
  CMAKE_OPTIONS += -DENABLE_UBUS=on
endif

define Package/odhcp6c
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Embedded DHCPv6-client for OpenWrt
  DEPENDS:=@IPV6 +libubox +ODHCP6C_ENABLE_UBUS:libubus
endef

define Package/odhcp6c/config
  config PACKAGE_odhcp6c_ext_cer_id
    int "CER-ID Extension ID (0 = disabled)"
    default 0
    config ODHCP6C_ENABLE_UBUS
    bool "Build with ubus support"
    depends on PACKAGE_odhcp6c
endef

define Package/odhcp6c/conffiles
/etc/odhcp6c.user
/etc/odhcp6c.user.d/
endef

define Package/odhcp6c/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/odhcp6c $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/lib/netifd/proto
	$(INSTALL_BIN) ./files/dhcpv6.sh $(1)/lib/netifd/proto/dhcpv6.sh
	$(INSTALL_BIN) ./files/dhcpv6.script $(1)/lib/netifd/
	$(INSTALL_DIR) $(1)/etc/odhcp6c.user.d/
	$(INSTALL_CONF) ./files/odhcp6c.user $(1)/etc/
endef

$(eval $(call BuildPackage,odhcp6c))
