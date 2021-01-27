# Apollodorus

Apollodorus is a great builder. Running the install.sh  bash script builds and installs commonly used penetration testing tools to a cloud vm running Ubunto 20.something.

The following tools will be installed:


* arp-scan
* byp4xx
* cmsmap
* dirb
* dnswalk
* dnsenum
* dnsrecon
* enum4linux
* exploitdb
* feroxbuster
* impacket
* net-tools
* medusa
* metasploit-framework
* mitm6
* nbtscan
* netdiscover
* nmap
* nikto
* openfortivpn
* proxychains
* rinetd
* sipvicious
* sslscan
* sslsplit
* sqlmap
* smbclient
* wireshark
* wireguard
* wpscan
* xsser
* zsh

Note: Other apps/libs have been installed but not mentioned as they are requirements for the tools listed above.

Feel free to inspect the file before running it, always a good idea ;)

## Installation

Before executing the script, ensure that you have completed the fol;owing steps:

1. Fill in the name and email variable if you wan
t metasploit-framework to update, (git details lines:91,93)

2. Uncomment last 3 deb-src lines at end of /etc/
apt/sources.list

This installer should be downloaded whichever way you feel more comfortable.

git:
```bash
git clone https://github.com/1tchyB411z/RedTeam/Apollodorus
cd Apollodorus;sudo bash install.sh
```
curl:
```bash
sudo sh -c "$(curl -fsSL https://github.com/1tchyB411z/RedTeam/main/Apollodorus/install.sh)"
```
wget:
```bash
sudo sh -c "$(wget -O- https://github.com/1tchyB411z/RedTeam/main/Apollodorus/install.sh)"

```
fetch:
```bash
sh -c "$(https://github.com/1tchyB411z/RedTeam/main/Apollodorus/install.sh)"
```

## Usage

Refer to each tools documentation for reference.


## License
This license covers the installer itself.
All apps are subject to their own licenses and this installer does not infringe upon their licensing expectations.
[MIT](https://choosealicense.com/licenses/mit/)
