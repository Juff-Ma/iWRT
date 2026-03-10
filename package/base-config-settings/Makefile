#
# Copyright (C) 2017-2019 Chen Minqiang <ptpt52@gmail.com>
# Copyright (C) 2019 X-WRT <dev@x-wrt.com>
# Copyright (C) 2026 Julian Rossbach <contact@juffma.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=base-config-iwrt
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Julian Rossbach <contact@juffma.de>
PKG_LICENSE:=GPL-2.0

PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Package/base-config-iwrt/description
  Base config setting for iWRT. Derived from X-WRT.
endef

define Package/base-config-iwrt
  SECTION:=Applications
  CATEGORY:=X
  SUBMENU:=Base config setting for iWRT
  TITLE:=base-config-iwrt
  DEPENDS:=+base-files +jsonfilter \
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

define Package/base-config-iwrt/install
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

define Build/Configure
  true
endef

define Build/Prepare
  true
endef

define Build/Compile
  true
endef

$(eval $(call BuildPackage,base-config-iwrt))
