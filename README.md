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
wget -O - | sh
```
