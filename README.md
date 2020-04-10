# Evil twin attack automation

I wrote a bash script to automate the evil twin attck
using aircrack-ng.

## Installation

Debian systems:
```bash
sudo apt-get update
git clone https://github.com/yodamaster-code/evil-twin
sudo apt-get install aircrack-ng
```

## Important notes

1. This attack requires wireless interface in monitor mode.
2. This attack requires sudo privileges on the local machine.

To find and put your wireless device in monitor mode do the following:
1. ```airmon-ng check kill``` to kill all the interfering processes.
2. ```iwconfig``` to list all your wireless interfaces.
3. ```sudo airmon-ng start wlan0``` (my interface is wlan0, you should put yours).<br/>
Now you can do ```iwconfig``` and see that the mode is set to monitor mode

To put your wireless device back in manged mode do the following:
1. ```sudo airmon-ng stop wlan0mon```

## Usage

evil-twin.sh bssid essid interface{monitor mode} channel client{optional}<br/>
```[+] example: ./evil-twin.sh 00:0b:86:c1:af:35 yodanet wlan0mon 2```

## Disclamer

This project is for educational purposes only, I am not responsible for any kind of abuse.
