#
# Copyright (c) 2020, Broadband Forum
# Copyright (c) 2020, AT&T Communications
# Copyright (c) 2025, Gemtek
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=obudpst
PKG_VERSION:=8.2.0
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/BroadbandForum/obudpst.git
PKG_SOURCE_VERSION:=c5112d519ab6b001a5b56453a2fdda730247ee3b
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_HASH:=b77caa4957d07d72873bee5bf69b06fb6fb393fbfd0b8c3747d60436e9ecbcd8

PKG_RELEASE:=1
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

#include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += -DDISABLE_INT_TIMER=ON
CMAKE_OPTIONS += -DRATE_LIMITING=ON

define Package/obudpst
	CATEGORY:=prpl Foundation
	SUBMENU:=Utilities
	DEPENDS+=+libopenssl
	TITLE:=Open Broadband-UDP Speed Test (OB-UDPST)
endef

define Build/Install
	:
endef

define Package/obudpst/description
	Open Broadband-UDP Speed Test (OB-UDPST) is a client/server software utility to demonstrate
	one approach of doing IP capacity measurements described by Broadband Forum TR-471.
endef

define Package/obudpst/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/udpst $(1)/usr/sbin/udpst
endef

#define Host/Install
#	$(INSTALL_DIR) $(STAGING_DIR_HOST)/obudpst
#	$(CP) $(HOST_BUILD_DIR)/udpst $(STAGING_DIR_HOST)/obudpst/
#endef

#$(eval $(call HostBuild))
$(eval $(call BuildPackage,obudpst))
