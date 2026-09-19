include $(TOPDIR)/rules.mk

PKG_NAME:=softhsm2
PKG_VERSION:=2.6.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/softhsm/SoftHSMv2/archive/refs/tags
PKG_SOURCE:=$(PKG_VERSION).zip
PKG_SOURCE_FILE:=SoftHSMv2-$(PKG_VERSION).zip
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_FORMAT:=zip
PKG_HASH:=c3c6876cb68238b347b55c523e0e332a5cc8223d6ff3c7d606c0aabe4492f4fe

PKG_BUILD_DIR:=$(BUILD_DIR)/SoftHSMv2-$(PKG_VERSION)

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/softhsm2
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=SoftHSMv2
	DEPENDS:=+libopenssl +libpthread +libstdcpp
endef

define Package/softhsm2/description
	SoftHSMv2 is a software implementation of a cryptographic store accessible through a PKCS#11 interface.
endef

define Package/softhsm2/install
	$(INSTALL_DIR) $(1)/usr/lib/softhsm $(1)/usr/bin $(1)/etc/softhsm/tokens $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/root/certs $(1)/etc/config/autocert $(1)/usr/share/ca-certificates/test $(1)/usr/share/ca-certificates/afc
	$(INSTALL_DIR) $(1)/etc/amx/tr181-security/defaults.d
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/softhsm/libsofthsm2.so* $(1)/usr/lib/softhsm/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/softhsm2-util $(1)/usr/bin/
	$(CP) ./files/softhsm2.conf $(1)/etc/softhsm2.conf
	$(CP) ./files/softhsm $(1)/etc/init.d/
	$(CP) ./files/ca.crt $(1)/usr/share/ca-certificates/test/
	$(CP) ./files/ca.key $(1)/root/certs/
	# Manually create all-in-one ca-certificate.crt and precalculated hash.
	# To be replaced with a script based solution.
	$(CP) ./files/ca.crt $(1)/usr/share/ca-certificates/test/ca-certificate.crt
	$(LN) ca.crt $(1)/usr/share/ca-certificates/test/3387b84d.0
	$(CP) ./files/01_softhsm_test_ca.odl $(1)/etc/amx/tr181-security/defaults.d/
	$(CP) ./files/afc_ca.pem $(1)/usr/share/ca-certificates/afc/afc_ca.pem
endef

$(eval $(call BuildPackage,softhsm2))
