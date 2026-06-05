# Auto Installer Pingloop
1. Download dan install
```
opkg update
opkg install libustream-mbedtls ca-bundle ca-certificates wget-ssl
```
2. Intall Pingloop menjaga router tetap stabil
```
wget -O - https://raw.githubusercontent.com/lunacomp-hub/OpenWrt/main/install_pingloop.sh | sh
```
3. Install Check-internet Jika gagal ping ke ISP selama 3x router akan reboot otomatis
```
wget -O - https://raw.githubusercontent.com/lunacomp-hub/OpenWrt/refs/heads/main/install_check_internet.sh | sh
```
4. Akses remote LuCI dari WAN di OpenWrt via UCI:
```
uci set uhttpd.main.listen_http='0.0.0.0:80'
uci set uhttpd.main.listen_https='0.0.0.0:443'
uci commit uhttpd
/etc/init.d/uhttpd restart
Lalu buka firewall agar WAN bisa akses LuCI:
```
uci add firewall rule
uci set firewall.@rule[-1].name='Allow-LuCI-WAN'
uci set firewall.@rule[-1].src='wan'
uci set firewall.@rule[-1].proto='tcp'
uci set firewall.@rule[-1].dest_port='80 443'
uci set firewall.@rule[-1].target='ACCEPT'
uci commit firewall
/etc/init.d/firewall restart
```
