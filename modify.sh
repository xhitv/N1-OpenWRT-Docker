#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

# 修改主机名字，把N1-OpenWRT修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='N1-OpenWRT'' package/lean/default-settings/files/zzz-default-settings

# 配置自定义主题
#
# > 清除旧版argon主题并拉取最新版
# rm -rf package/lean/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/community/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config package/community/luci-app-argon-config
#
# > 修改默认主题为 Argon
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#

# 集成自定义插件
#
# > AdguardHome
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/community/luci-app-adguardhome
#
# > lean ssr plus
# git clone https://github.com/fw876/helloworld.git package/lean/luci-app-ssr-plus
#
# > KoolProxyR
# git clone https://github.com/jefferymvp/luci-app-koolproxyR package/community/luci-app-koolproxyR
#
# Debug kpr adapt aarch64
# sed -i 's/,arm/,aarch64/' package/luci-app-koolproxyR/Makefile
#
# > Dockerman
# git clone https://github.com/lisaac/luci-lib-docker package/community/luci-lib-docker
# git clone https://github.com/lisaac/luci-app-dockerman package/community/luci-app-dockerman
#
# > DnsFilter
# git clone https://github.com/garypang13/luci-app-dnsfilter package/community/luci-app-dnsfilter
#
# > GoWebDav
# git clone https://github.com/immortalwrt/openwrt-gowebdav package/community/openwrt-gowebdav
#
# > HelloWorld (vssr)
# git clone https://github.com/jerrykuku/lua-maxminddb package/community/lua-maxminddb
# git clone https://github.com/jerrykuku/luci-app-vssr package/community/luci-app-vssr
#
# > iKoolProxy
git clone https://github.com/xhitv/luci-app-ikoolproxy.git package/community/luci-app-ikoolproxy
#
# > OpenClash
# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/community/luci-app-openclash
#
# > Install to emmc script for phicomm n1
# git clone https://github.com/tuanqing/install-program package/install-program
#
#
# 个性化配置修改
#
# > Mod
# sed -i '$i '"sed -i '/luciname/d' /usr/lib/lua/luci/version.lua"'' package/lean/default-settings/files/zzz-default-settings
# sed -i '$i '"echo 'luciname = \"Limitless\"' >> /usr/lib/lua/luci/version.lua"'' package/lean/default-settings/files/zzz-default-settings
sed -i '$i '"sed -i '/luciversion/d' /usr/lib/lua/luci/version.lua"'' package/lean/default-settings/files/zzz-default-settings
sed -i '$i '"echo 'luciversion = \"itvro.com\"' >> /usr/lib/lua/luci/version.lua"'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（itvro build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
# sed -i "s/OpenWrt /itvro build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# firewall custom
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

#
# > 修改插件位置
sed -i 's/\"services\"/\"network\"/g' feeds/luci/applications/luci-app-upnp/luasrc/controller/upnp.lua
# sed -i '/\"NAS\"/d' package/lean/luci-app-rclone/luasrc/controller/rclone.lua
# sed -i 's/\"nas\"/\"services\"/g' package/lean/luci-app-rclone/luasrc/controller/rclone.lua
# sed -i '/\"NAS\"/d' package/community/openwrt-gowebdav/luci-app-gowebdav/luasrc/controller/gowebdav.lua
# sed -i 's/\"nas\"/\"services\"/g' package/community/openwrt-gowebdav/luci-app-gowebdav/luasrc/controller/gowebdav.lua
#
# > 修改插件名字
# sed -i 's/\"Rclone\"/\"RcloneSYNC\"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
# sed -i 's/\"CPU 使用率（%）\"/\"CPU负载\"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
# sed -i 's/\"Argon 主题设置\"/\"主题设置\"/g' package/community/luci-app-argon-config/po/zh-cn/argon-config.po
# sed -i 's/\"TTYD 终端\"/\"网页终端\"/g' package/lean/luci-app-ttyd/po/zh-cn/terminal.po
# sed -i 's/\"解锁网易云灰色歌曲\"/\"NeteaseMusic\"/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
# sed -i 's/\"KMS 服务器\"/\"KMS Activator\"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.zh-cn.po
# sed -i 's/\"Turbo ACC 网络加速\"/\"网络加速\"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
#
