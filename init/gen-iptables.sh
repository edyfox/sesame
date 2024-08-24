#!/bin/sh

cat <<EOF
#!/bin/sh

call_iptables() {
    /sbin/iptables "\$@"
    /sbin/ip6tables "\$@"
}

call_iptables --flush
call_iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT
call_iptables -A INPUT -p tcp --syn --dport 443 -j ACCEPT

EOF

for iface in `/sbin/ifconfig | grep -o '^[^ ]*:' | tr -d ':'`; do
    if [ "$iface" = "lo" ]; then
        continue
    fi
    echo call_iptables -A INPUT -p tcp --syn -i $iface -j DROP
done

cat <<EOF

call_iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Call IPv4 version only because '-f' is not supported in IPv6
/sbin/iptables -A INPUT -f -j DROP

call_iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
call_iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
EOF
