apt update -y 
apt install build-essential libssl-dev -y 
wget -c https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz
tar xzvf openssh-9.8p1.tar.gz
cd openssh-9.8p1/
./configure
make && make install 
sed -i 's#/usr/sbin#/usr/local/sbin#g' /lib/systemd/system/ssh.service
systemctl daemon-reload
systemctl restart ssh 
