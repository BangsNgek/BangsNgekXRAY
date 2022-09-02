#
#
# CEK SSH OPENSSH
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh=" ${GREEN}Running ${NC}( No Error )"
else
   status_ssh="${RED}  Not Running ${NC}  ( Error )"
fi
#
# CEK SSH DROPBEAR
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE DROPBEAR
if [[ $dropbear_service == "running" ]]; then 
   status_beruangjatuh=" ${GREEN}Running${NC} ( No Error )${NC}"
else
   status_beruangjatuh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# CEK SLOWDNS CLIENT
slowdns_client_service=$(systemctl status client-sldns | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SLOWDNS SERVER
if [[ $slowdns_client_service == "running" ]]; then 
   status_slowdns_client=" ${GREEN}Running${NC} ( No Error )${NC}"
else
   status_slowdns_client="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# CEK SLOWDNS SERVER
slowdns_server_service=$(systemctl status server-sldns | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SLOWDNS SERVER
if [[ $slowdns_server_service == "running" ]]; then 
   status_slowdns_server=" ${GREEN}Running${NC} ( No Error )${NC}"
else
   status_slowdns_server="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# CEK SSLH
sslh_service=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE SSLH / SSH
if [[ $sslh_service == "running" ]]; then 
   status_sslh=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_sslh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi


# STUNNEL5
stunnel_service=$(/etc/init.d/stunnel5 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel=" ${GREEN}Running ${NC}( No Error )"
else
   status_stunnel="${RED}  Not Running ${NC}  ( Error )}"
fi

#
#
# GETTING DOMAIN NAME
Domen="$(cat /etc/xray/domain)"
Slow="$(cat /root/nsdomain)"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ System Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ Hostname    : $HOSTNAME"
echo -e "❇️ OS Name     : $Tipe"
echo -e "❇️ Total RAM   : ${totalram}MB"
echo -e "❇️ Public IP   : $MYIP"
echo -e "❇️ Domain      : $Domen"
echo -e "❇️ NS Domain   : $Slow"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Service Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ SSH OpenSSH             :$status_ssh"
echo -e "❇️ SSH Dropbear            :$status_beruangjatuh"
echo -e "❇️ SlowDNS Server          :$status_slowdns_server"
echo -e "❇️ SlowDNS Client          :$status_slowdns_client"
echo -e "❇️ SSLH                    :$status_sslh"
echo -e "❇️ SSH Stunnel5            :$status_stunnel"
echo -e "❇️ SSH Websocket TLS       :$swstls"
echo -e "❇️ SSH Websocket HTTP      :$swsdrop"
echo -e "❇️ XRAY Multi Port         :$status_xray"
echo -e "❇️ Super XRAY              :$status_super_xray"
echo -e "❇️ NGINX                   :$status_nginx"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo ""