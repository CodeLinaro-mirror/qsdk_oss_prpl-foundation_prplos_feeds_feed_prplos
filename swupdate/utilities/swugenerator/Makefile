include $(TOPDIR)/rules.mk

PKG_NAME:=swugenerator
PKG_VERSION:=0.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/sbabic/swugenerator/archive/refs/tags
PKG_SOURCE_URL_FILE:=$(PKG_VERSION).tar.gz
PKG_HASH:=06098c4b3a6c3e5946a11929f95f280baacb512fc4154e16af2262c60a36cbc6
PKG_MAINTAINER:=Soft At Home <support.opensource@softathome.com>
PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PYTHON3_PKG_BUILD:=0
HOST_BUILD_DEPENDS:=python3/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host.mk

# Similar to HostPython3/PipInstall() from python3-host.mk but with no check on hashes
# since we use it to install SWUGenerator previously downloaded by OpenWrt with hash
# verification. pip install with --require-hashes cannot work from a local directory.
# --no-deps is also passed to make sure dependencies are not installed without checking
# the hash
define HostPython3/Local/PipInstall
	$(call locked, \
		$(HOST_PYTHON3_VARS) \
		$(HOST_PYTHON3_PIP_VARS) \
		$(HOST_PYTHON3_PIP) \
			install \
			--no-binary :all: \
			--progress-bar off \
			--no-deps \
			file://$(1) \
		$(if $(CONFIG_PYTHON3_HOST_PIP_CACHE_WORLD_READABLE), \
			&& $(FIND) $(HOST_PYTHON3_PIP_CACHE_DIR) -not -type d -exec chmod go+r  '{}' \; \
			&& $(FIND) $(HOST_PYTHON3_PIP_CACHE_DIR)      -type d -exec chmod go+rx '{}' \; \
		), \
		pip \
	)
endef

define Package/$(PKG_NAME)
  CATEGORY:=prpl Foundation
  SUBMENU:=Image Generation
  TITLE:=SWUgenerator
  URL:=https://github.com/sbabic/swugenerator.git
endef

define Package/$(PKG_NAME)/description
	A host tool to generate SWU update package for SWUpdate
endef

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-$(PKG_VERSION)

define Host/Compile
	echo "Do nothing"
endef

define Host/Install
	@echo "******* Installing swugenerator dependencies on the host *******"
	$(call HostPython3/PipInstall,-r requirements.txt)
	@echo "******* Installing swugenerator on the host *******"
	$(call HostPython3/Local/PipInstall,$(HOST_BUILD_DIR))
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
$(eval $(call HostBuild))
