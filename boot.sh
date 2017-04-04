set -e
set -x

apt install -y docker.io
apt install -y make
chmod 666 /var/run/docker.sock

REPO=`pwd`

cd ${REPO}/android-build-docker-image/
make

cd ${REPO}/gocd/agent/
make

cd ${REPO}/gocd
make server
make agent SERVER_NAME=`docker ps -q`

