# jun/26/2019 17:24:55 by RouterOS 6.40.8
# software id = 
#
#
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface l2tp-server server
set enabled=yes ipsec-secret=devan12345 use-ipsec=yes
/ip dhcp-client
add dhcp-options=hostname,clientid disabled=no interface=ether1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/ip firewall address-list
add address=0.0.0.0/8 list=private-lokal
add address=10.0.0.0/8 list=private-lokal
add address=100.64.0.0/10 list=private-lokal
add address=127.0.0.0/8 list=private-lokal
add address=169.254.0.0/16 list=private-lokal
add address=172.16.0.0/12 list=private-lokal
add address=192.0.0.0/24 list=private-lokal
add address=192.0.2.0/24 list=private-lokal
add address=192.168.0.0/16 list=private-lokal
add address=198.18.0.0/15 list=private-lokal
add address=198.51.100.0/24 list=private-lokal
add address=203.0.113.0/24 list=private-lokal
add address=224.0.0.0/3 list=private-lokal
/ip firewall mangle
add action=mark-routing chain=prerouting dst-address-list=youtube-ip-list \
    new-routing-mark=YTB passthrough=yes src-address-list=!youtube-ip-list
/ip firewall nat
add action=masquerade chain=srcnat
add action=masquerade chain=srcnat out-interface=all-ppp
add action=masquerade chain=srcnat out-interface=ether1
add action=dst-nat chain=dstnat dst-port=29000 protocol=tcp to-addresses=\
    110.136.20.2 to-ports=2019
add action=dst-nat chain=dstnat dst-port=29001 protocol=tcp to-addresses=\
    110.136.20.2
add action=dst-nat chain=dstnat dst-port=29002 protocol=tcp to-addresses=\
    110.136.20.2
/ip firewall raw
add action=add-dst-to-address-list address-list=youtube-ip-list \
    address-list-timeout=1h chain=prerouting content=.google..com \
    dst-address-list=!private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=youtube-ip-list \
    address-list-timeout=1h chain=prerouting content=.youtube.com \
    dst-address-list=!private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=youtube-ip-list \
    address-list-timeout=1h chain=prerouting content=.ytimg.com \
    dst-address-list=!private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=youtube-ip-list \
    address-list-timeout=1h chain=prerouting content=.googlevideo.com \
    dst-address-list=!private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=facebook-ip-list \
    address-list-timeout=1h chain=prerouting content=.facebook.com disabled=\
    yes dst-address-list=!private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=facebook-ip-list \
    address-list-timeout=1h chain=prerouting content=.fbcdn.net disabled=yes \
    dst-address-list=!private-lokal src-address-list=private-lokal
/ip route
add distance=1 gateway=*2 routing-mark=YTB
add distance=2 gateway=207.148.116.1 routing-mark=YTB
add distance=1 dst-address=157.230.42.166/32 gateway=207.148.124.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ppp secret
add local-address=140.136.20.1 name=firman password=123 remote-address=\
    140.136.20.2
add local-address=100.22.10.1 name=fandym password=123 remote-address=\
    100.22.10.4
add local-address=100.22.10.1 name=nick password=123 remote-address=\
    100.22.10.5
add local-address=100.22.10.1 name=bilqis password=123 remote-address=\
    100.22.10.6
add local-address=100.22.10.1 name=efan password=123 remote-address=\
    100.22.10.7
add local-address=100.200.10.1 name=aja password=123 remote-address=\
    100.200.10.2
/system identity
set name=vps3
/system watchdog
set automatic-supout=no watchdog-timer=no
