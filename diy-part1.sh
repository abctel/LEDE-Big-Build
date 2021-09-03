#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#增加插件包
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add jerrykuku's vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git ./package/lean/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git ./package/lean/luci-app-vssr

# Add HomeLede prepareCompile.sh
disablePkgsList="
./feeds/lienol/luci-app-guest-wifi
./feeds/lienol/luci-app-pppoe-relay
./feeds/lienol/luci-app-pptp-server
./feeds/lienol/luci-app-ramfree
./feeds/lienol/luci-app-verysync
./feeds/lienol/verysync
./feeds/luci/applications/luci-app-sqm
./feeds/packages/net/adguardhome 
./feeds/packages/net/dnscrypt-proxy2 
./feeds/packages/net/https-dns-proxy 
./feeds/packages/net/kcptun 
./feeds/packages/net/miniupnpd 
./feeds/packages/net/mwan3 
./feeds/packages/net/smartdns 
./feeds/packages/net/xtables-addons 
./feeds/packages/utils/containerd 
./feeds/packages/utils/docker 
./feeds/packages/utils/docker-compose 
./feeds/packages/utils/dockerd 
./feeds/packages/utils/libnetwork 
./feeds/packages/utils/runc 
./feeds/packages/utils/tini 
./feeds/pw/chinadns-ng 
./feeds/pw/dns2socks
./feeds/pw/ipt2socks 
./feeds/pw/microsocks
./feeds/pw/pdnsd-alt
./feeds/pw/simple-obfs
./feeds/pw/trojan
./feeds/xiaoqingfeng/softethervpn5
./package/lean/luci-app-docker 
./package/lean/luci-app-jd-dailybonus 
./package/lean/luci-app-kodexplorer 
./package/lean/luci-app-netdata 
./package/lean/luci-app-softethervpn 
./package/lean/luci-lib-docker 
./package/lean/luci-theme-argon 
"

function disableDulicatedPkg()
{
	if [ -d $1 ];then
		rm -rf $1
		echo $1" Disabled."
	fi
}

./scripts/feeds update -a

for disablePkg in $disablePkgsList
do
	disableDulicatedPkg $disablePkg
done

./scripts/feeds update -i
./scripts/feeds install -a
