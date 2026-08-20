# Rebuilt Fedora live image kickstart
text
lang en_US.UTF-8
keyboard us
timezone UTC --utc
rootpw --lock disabled
user --name=live --groups=wheel --password=live --plaintext
network --bootproto=dhcp --device=link --activate
selinux --disabled
firewall --disabled
bootloader --location=none
zerombr
clearpart --all --initlabel

%packages
@^workstation-product-environment
gnome-shell
gnome-session
gnome-terminal
NetworkManager
firefox
sudo
xorg-x11-server-Xorg
kernel

# Rebuilt Fedora identity
%end

%post
cat > /etc/os-release <<'EOF'
NAME="Rebuilt Fedora"
VERSION="44"
ID="rebuilt-fedora"
ID_LIKE="fedora"
VERSION_ID="44"
PRETTY_NAME="Rebuilt Fedora 44"
ANSI_COLOR="0;34"
HOME_URL="https://github.com/carjam120443-netizen/rebuilt-fedora"
EOF

cat > /etc/motd <<'EOF'
Welcome to Rebuilt Fedora!
A Fedora-based Linux distribution rebuilt with Fedora's RPM/DNF ecosystem.
EOF
%end
