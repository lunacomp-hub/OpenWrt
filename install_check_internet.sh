#!/bin/sh

echo "Downloading check-internet script..."

wget -O /usr/bin/check-internet https://raw.githubusercontent.com/lunacomp-hub/OpenWrt/refs/heads/main/check-internet.sh

chmod +x /usr/bin/check-internet

echo "Creating service..."

cat << "EOF" > /etc/init.d/check-internet
#!/bin/sh /etc/rc.common

START=99
STOP=10

start() {
    echo "Starting check-internet..."
    /usr/bin/check-internet &
}

stop() {
    echo "Stopping check-internet..."
    killall check-internet
}
EOF

chmod +x /etc/init.d/check-internet

echo "Enable service..."

/etc/init.d/check-internet enable
/etc/init.d/check-internet start

echo "Installation complete!"
