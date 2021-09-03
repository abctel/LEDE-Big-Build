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

git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/abctel/luci-app-smartdns
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/abctel/luci-app-adguardhome
git clone https://github.com/xiaorouji/openwrt-passwall package/abctel/openwrt-passwall
git clone https://github.com/abctel/luci-theme-edge package/abctel/luci-theme-edge
git clone -b luci https://github.com/pexcn/openwrt-chinadns-ng.git package/abctel/luci-app-chinadns-ng
git clone https://github.com/abctel/abctel-package package/abctel/dnsmasq-china-list
git clone https://github.com/lisaac/luci-app-dockerman package/abctel/luci-app-dockerman
# git clone https://github.com/ITdesk01/jd_openwrt_script.git package/abctel/jd_openwrt_script
chmod 755 files/etc/init.d/smartdns
chmod 755 files/usr/bin/AdGuardHome/AdGuardHome
