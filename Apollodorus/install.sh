#!/bin/bash
echo "Apollodorus - Ubuntu red team pentest tool builder"
echo "(+) Fill in the name and email variable if you want metasploit-framework to update, (git creds line:93,95)"
echo "(+) Uncomment last 3 deb-src lines at end of /etc/apt/sources.list"
read -n1 -s -r -p $'(+) Once complete press Y to continue...\n' key

if [ "$key" = 'Y' ]; then
    # Space pressed, do something
    # echo [$key] is empty when SPACE is pressed # uncomment to trace
    mkdir tools
    cd tools
    cat > apps <<EOF
screen
tmux
nikto
sslscan
nmap
python2.7
python3
zsh
medusa
hydra
dirb
net-tools
unzip
python3-pip
build-essential
git
zlib1g
zlib1g-dev
libpq-dev
libpcap-dev
libsqlite3-dev
ruby
ruby-dev
wireshark
wireguard
sslsplit
arp-scan
nbtscan
netdiscover
dnswalk
dnsenum
dnsrecon
sqlmap
smbclient
polenum
ldap-utils
python3-pycurl
python3-bs4
python3-geoip
python3-gi
python3-cairocffi
python3-selenium
firefoxdriver
openfortivpn
proxychains
rinetd
EOF

for i in `cat apps`;do apt install -y $i;echo "$i installed >> install.log";done


#sslscan
git clone https://github.com/rbsec/sslscan
cd sslscan
apt-get build-dep openssl
make static
cd ..

#harvester
git clone https://github.com/laramies/theHarvester
cd theHarvester
python3 -m pip install -r requirements.txt
python3 setup.py install
cd ..

#feroxbuster
wget https://github.com/epi052/feroxbuster/releases/latest/download/feroxbuster_amd64.deb.zip
unzip feroxbuster_amd64.deb.zip
apt install ./feroxbuster_amd64.deb
#note: gives an error but still works
cd ..

#msf
git clone https://github.com/rapid7/metasploit-framework.git
cd metasploit-framework/
sudo gem install bundler
bundle install
cd ..

#First set your name using the following command and replacing NAME HERE with your name:
git config --global user.name "NAME HERE"
#Now set your email address replacing email@example.com with your email address:
git config --global user.email "email@example.com"
./msfupdate
cd ..

#exploitdb    
git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb
ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit

#xsser
git clone https://github.com/epsylon/xsser
cd xsser
python3 -m pip pycurl bs4 pygeoip gobject cairocffi selenium
python3 setup.py install
cd ..

#enum4linux
wget --no-check-certificate https://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz
tar xzvf enum4linux-0.8.9.tar.gz

#sipvicious
git clone https://github.com/EnableSecurity/sipvicious
cd sipvicious/
python3 setup.py install
mv /usr/local/bin/sipvicious_svmap /usr/local/bin/svmap
mv /usr/local/bin/sipvicious_svcrack /usr/local/bin/svcrack
mv /usr/local/bin/sipvicious_svcrash /usr/local/bin/svcrash
mv /usr/local/bin/sipvicious_svwar /usr/local/bin/svwar
mv /usr/local/bin/sipvicious_svreport /usr/local/bin/svreport
cd ..

#byp4xx
git clone https://github.com/lobuhi/byp4xx

#impacket
git clone https://github.com/SecureAuthCorp/impacket
cd impacket
python3 -m pip install -r requirements.txt
python3 -m pip install pyasn1==0.4.6
python3 setup.py install
cd ..

#wpscan
git clone https://github.com/wpscanteam/wpscan
gem install wpscan
cd ..

#cmsmap
git clone https://github.com/Dionach/CMSmap
cd CMSmap
python3 setup.py install 
cd ..

#mitm6 
git clone https://github.com/fox-it/mitm6
cd mitm6
python3 setup.py install
cd ..

#SET
git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/
cd setoolkit
pip3 install -r requirements.txt
python setup.py
cd ..

#poshc2
curl -sSL https://raw.githubusercontent.com/nettitude/PoshC2/master/Install.sh | bash

#list of red team usefull CVE's to be used for reference while we build the poc list
cat > red-team-tools.txt <<EOF
Prioritized list of CVEs that should be addressed to limit the effectiveness of the Red Team tools. This is a recommended order and customers may make their own priorities based on their unique environments. 

  1. [CVE-2019-11510](https://nvd.nist.gov/vuln/detail/CVE-2019-11510) – pre-auth arbitrary file reading from Pulse Secure SSL VPNs - CVSS 10.0
  2. [CVE-2020-1472](https://nvd.nist.gov/vuln/detail/CVE-2020-1472) – Microsoft Active Directory escalation of privileges - CVSS 10.0
  3. [CVE-2018-13379](https://nvd.nist.gov/vuln/detail/CVE-2018-13379) – pre-auth arbitrary file reading from Fortinet Fortigate SSL VPN - CVSS 9.8 
  4. [CVE-2018-15961](https://nvd.nist.gov/vuln/detail/CVE-2018-15961) – RCE via Adobe ColdFusion (arbitrary file upload that can be used to upload a JSP web shell) - CVSS 9.8 
  5. [CVE-2019-0604](https://nvd.nist.gov/vuln/detail/CVE-2019-0604) – RCE for Microsoft Sharepoint - CVSS 9.8
  6. [CVE-2019-0708](https://nvd.nist.gov/vuln/detail/CVE-2019-0708) – RCE of Windows Remote Desktop Services (RDS) - CVSS 9.8
  7. [CVE-2019-11580](https://nvd.nist.gov/vuln/detail/CVE-2019-11580) - Atlassian Crowd Remote Code Execution - CVSS 9.8 
  8. [CVE-2019-19781](https://nvd.nist.gov/vuln/detail/CVE-2019-19781) – RCE of Citrix Application Delivery Controller and Citrix Gateway - CVSS 9.8 
  9. [CVE-2020-10189](https://nvd.nist.gov/vuln/detail/CVE-2020-10189) – RCE for ZoHo ManageEngine Desktop Central - CVSS 9.8
  10. [CVE-2014-1812](https://nvd.nist.gov/vuln/detail/CVE-2014-1812) – Windows Local Privilege Escalation - CVSS 9.0  
  11. [CVE-2019-3398](https://nvd.nist.gov/vuln/detail/CVE-2019-3398) – Confluence Authenticated Remote Code Execution - CVSS 8.8 
  12. [CVE-2020-0688](https://nvd.nist.gov/vuln/detail/CVE-2020-0688) – Remote Command Execution in Microsoft Exchange - CVSS 8.8 
  13. [CVE-2016-0167](https://nvd.nist.gov/vuln/detail/CVE-2016-0167) – local privilege escalation on older versions of Microsoft Windows - CVSS 7.8 
  14. [CVE-2017-11774](https://nvd.nist.gov/vuln/detail/CVE-2017-11774) – RCE in Microsoft Outlook via crafted document execution (phishing) - CVSS 7.8 
  15. [CVE-2018-8581](https://nvd.nist.gov/vuln/detail/CVE-2018-8581) - Microsoft Exchange Server escalation of privileges - CVSS 7.4 
  16. [CVE-2019-8394](https://nvd.nist.gov/vuln/detail/CVE-2019-8394) – arbitrary pre-auth file upload to ZoHo ManageEngine ServiceDesk Plus - CVSS 6.5 
EOF


else
    # Anything else pressed, do whatever else.
    # echo [$key] not empty
    echo "(+) No action"
fi
