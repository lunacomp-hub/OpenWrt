#!/bin/sh

echo "Downloading pingloop script..."

wget -O /usr/bin/pingloop https://raw.githubusercontent.com/lunacomp-hub/OpenWrt/refs/heads/main/pingloop.sh

chmod +x /usr/bin/pingloop

echo "Creating service..."

cat << "EOF" > /etc/init.d/pingloop
#!/bin/sh /etc/rc.common

START=99
STOP=10

start() {
    echo "Starting pingloop..."
    /usr/bin/pingloop &
}

stop() {
    echo "Stopping pingloop..."
    killall pingloop
}
EOF

chmod +x /etc/init.d/pingloop

echo "Enable service..."

/etc/init.d/pingloop enable
/etc/init.d/pingloop start

echo "Installation complete!"
