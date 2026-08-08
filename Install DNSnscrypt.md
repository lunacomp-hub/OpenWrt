
Install paket
```
opkg update
opkg install https-dns-proxy
opkg install luci-app-https-dns-proxy
````
```
while uci -q delete https-dns-proxy.@https-dns-proxy[0]; do :; done

uci set https-dns-proxy.cloudflare="https-dns-proxy"
uci set https-dns-proxy.cloudflare.bootstrap_dns="1.1.1.1,1.0.0.1"
uci set https-dns-proxy.cloudflare.resolver_url="https://cloudflare-dns.com/dns-query"
uci set https-dns-proxy.cloudflare.listen_addr="127.0.0.1"
uci set https-dns-proxy.cloudflare.listen_port="5053"

uci commit https-dns-proxy
/etc/init.d/https-dns-proxy enable
/etc/init.d/https-dns-proxy restart
```

Arahkan dnsmasq ke DoH
```
uci set dhcp.@dnsmasq[0].noresolv="1"
uci -q delete dhcp.@dnsmasq[0].server
uci add_list dhcp.@dnsmasq[0].server="127.0.0.1#5053"
uci commit dhcp

/etc/init.d/dnsmasq restart

```

Supaya DNS ISP tidak dipakai

Ini penting kalau tujuanmu semua DNS client lewat Cloudflare DoH
```
uci set network.wan.peerdns='0'
uci set network.wan6.peerdns='0'
uci commit network
```

/etc/init.d/network restart
