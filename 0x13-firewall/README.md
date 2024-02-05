# 0x13. Firewall

## 1. Port forwarding
- Steps
- Make sure ufw is installed (sudo apt ufw -y)
- Enable ufw (sudo ufw enable)
- Allow access to port 80 (sudo ufw allow 80/tcp)
- edit the file /etc/default/ufw
- change the line '''DEFAULT_FORWARD_POLICY="DROP"''' to '''DEFAULT_FORWARD_POLICY="ACCEPT"'''
- or edit the file /etc/ufw/sysctl.conf
- uncomment the lines
''' net/ipv4/ip_forward=1
net/ipv6/conf/default/forwarding=1
net/ipv6/conf/all/forwarding=1 '''
- edit the file /etc/ufw/before.rules
- add these lines before the *filter section
'''
*nat
:PREROUTING ACCEPT [0:0]
-A PREROUTING -p tcp --dport 8080 -j REDIRECT --to-port 80
COMMIT
'''
- run the command (sudo ufw disable & sudo ufw enable)
