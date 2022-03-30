openvpn --config "config/vpn.ovpn" --auth-user-pass "config/credentials.txt" --daemon;
sleep 3;
danted -D;
echo "Started";

# Artifically keeps the container is the "running" state
tail -f /dev/null
