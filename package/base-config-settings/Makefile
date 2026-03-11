#
# Copyright (C) 2017-2019 Chen Minqiang <ptpt52@gmail.com>
# Copyright (C) 2019 X-WRT <dev@x-wrt.com>
# Copyright (C) 2026 Julian Rossbach <contact@juffma.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# This is pretty much a copy of the X-WRT base settings
# However, it removes many of the iWRT shortcuts and intrusive packages

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=base-config-setting-iwrt
PKG_VERSION:=1.1.0
PKG_RELEASE:=2

PKG_MAINTAINER:=Julian Rossbach <contact@juffma.de>
PKG_LICENSE:=GPL-2.0

PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Package/base-config-setting-iwrt/Default
  SECTION:=Applications
  CATEGORY:=X
  SUBMENU:=Base config setting for iWRT
  DEPENDS:=+busybox +base-files +jsonfilter
endef

define Package/base-config-setting-iwrt
  $(call Package/base-config-setting-iwrt/Default)
  TITLE:=base-config-setting-iwrt
endef

define Package/base-config-setting-iwrt/description
  Base config setting for iWRT
  This is pretty much a copy of the X-WRT base settings
  However, it removes many of the iWRT shortcuts and intrusive packages
endef

define Package/base-config-setting-iwrt/conffiles
/etc/config/base_config
endef

define Package/base-config-setting-iwrt/postinst
#!/bin/sh

if [ -z "$$IPKG_INSTROOT" ]; then
  ( . /etc/uci-defaults/95-base-config-setting )
  rm -f /etc/uci-defaults/95-base-config-setting
fi

exit 0
endef

define Package/base-config-setting-ext4fs-iwrt
  $(call Package/base-config-setting-iwrt/Default)
  TITLE:=base-config-setting ext4fs set
  DEPENDS:=+base-config-setting-iwrt \
	   +busybox +@BUSYBOX_CUSTOM \
	   +@BUSYBOX_CONFIG_STAT \
	   +kmod-fs-ext4 \
	   +tune2fs \
	   +ethtool \
	   +blockd \
	   +blkid \
	   +fdisk \
	   +gdisk \
	   +partx-utils \
	   +e2fsprogs
endef

define Package/base-config-setting-ext4fs-iwrt/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/fstab.config $(1)/etc/config/fstab
	$(INSTALL_DIR) $(1)/lib/preinit
	$(INSTALL_DATA) ./files/disk_ready.preinit $(1)/lib/preinit/79_disk_ready
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/disk_ready_done.init $(1)/etc/init.d/disk_ready_done
	$(INSTALL_BIN) ./files/ethtool.init $(1)/etc/init.d/ethtool
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/diskv.sh $(1)/usr/sbin/diskv
endef

define Package/base-config-setting-iwrt/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/base_config.config $(1)/etc/config/base_config
	$(INSTALL_DATA) ./files/uci.defaults $(1)/etc/uci-defaults/95-base-config-setting
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/system_reset.sh $(1)/usr/sbin/system_reset
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/usb_factory_reset.init $(1)/etc/init.d/usb_factory_reset
	$(INSTALL_BIN) ./files/auto_usb_mount.init $(1)/etc/init.d/auto_usb_mount
	$(INSTALL_DATA) ./files/auto_usb_mount.hotplug $(1)/usr/share/base-config-setting/auto_usb_mount.hotplug
	$(INSTALL_DATA) ./files/mount.hotplug $(1)/usr/share/base-config-setting/mount.hotplug
	$(INSTALL_DIR) $(1)/lib/preinit
	$(INSTALL_DATA) ./files/mnt_ready.preinit $(1)/lib/preinit/81_mnt_ready
endef

define Build/Configure
  true
endef

define Build/Prepare
  true
endef

define Build/Compile
  true
endef

$(eval $(call BuildPackage,base-config-setting-iwrt))
$(eval $(call BuildPackage,base-config-setting-ext4fs-iwrt))
