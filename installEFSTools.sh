apt-get update
apt-get -y install git binutils
git clone https://github.com/aws/efs-utils
cd /path/efs-utils
./build-deb.sh
apt-get -y install ./build/amazon-efs-utils*deb