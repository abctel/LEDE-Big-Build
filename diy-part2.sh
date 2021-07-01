#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认IP
sed -i 's/192.168.1.1/192.168.100.200/g' package/base-files/files/bin/config_generate

# 增加微信推送姬
# git clone https://github.com/tty228/luci-app-serverchan package/lean/luci-app-serverchan

# 增加关机插件
#git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/uci-app-poweroff

# 增加Chinadns-NG插件
#git clone https://github.com/pexcn/openwrt-chinadns-ng.git package/chinadns-ng

# 增加dockerman插件
rm -rf package/luci-lib-docker/
rm -rf package/lean/luci-app-dockerman/
git clone https://github.com/lisaac/luci-lib-docker package/luci-lib-docker/
git clone https://github.com/lisaac/luci-app-dockerman package/lean/luci-app-dockerman/
#cp -rf package/lean/luci-app-dockerman/applications/luci-app-dockerman package/lean

# 配置定制
mkdir abctel
git clone https://github.com/abctel/LEDE-Firmware-Config.git abctel/config

mv -f abctel/config/passwall package/feeds/kenzo/luci-app-passwall/root/etc/config/passwall

mkdir package/feeds/kenzo/luci-app-smartdns/root/etc/smartdns
mv -f abctel/config/custom.conf package/feeds/kenzo/luci-app-smartdns/root/etc/smartdns/custom.conf
mkdir package/feeds/kenzo/luci-app-smartdns/root/etc/config
mv -f abctel/config/smartdns package/feeds/kenzo/luci-app-smartdns/root/etc/config/smartdns
mv -f abctel/config/AdGuardHome.yaml package/feeds/kenzo/luci-app-adguardhome/root/etc/config/AdGuardHome.yaml
mkdir package/feeds/kenzo/luci-app-adguardhome/root/usr/bin
touch package/feeds/kenzo/luci-app-adguardhome/root/usr/bin/AdGuardHome
mv -f abctel/config/update_core.sh package/feeds/kenzo/luci-app-adguardhome/root/usr/share/AdGuardHome/update_core.sh
mv -f abctel/config/AdGuardHome_template.yaml package/feeds/kenzo/luci-app-adguardhome/root/usr/share/AdGuardHome/AdGuardHome_template.yaml

# Docker
#svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/luci-app-dockerman
#git clone --depth=1 https://github.com/lisaac/luci-lib-docker
#if [ -e feeds/packages/utils/docker-ce ];then
#	sed -i '/dockerd/d' package/luci-app-dockerman/Makefile
#	sed -i 's/+docker/+docker-ce/g' package/luci-app-dockerman/Makefile
#fi

# 增加一套主题
#git clone https://github.com/siropboy/luci-theme-btmod package/lean/luci-theme-btmod

# 删除老argon主题
# rm -rf package/lean/luci-theme-argon
# 拉取argon主题
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# 说不得
git clone https://github.com/ITdesk01/jd_openwrt_script.git package/jd_openwrt_script
