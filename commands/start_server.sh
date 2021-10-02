openvpn --config "config/vpn.ovpn" --auth-user-pass "config/credentials.txt" --daemon;
sleep 3;
danted -D;
echo "Started";
tail -f /dev/null
