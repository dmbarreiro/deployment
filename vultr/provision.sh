# $1 - sites-enabled nginx config
# $2 - domain to request Let's Encrypt certificate for (more can be added with extra -d
# $3 - ssh public key to add to list of authorized ssh keys

apt update
apt -y install docker.io
apt -y install nginx
apt -y install python-certbot-nginx
# copy accepted public ssh keys
cat $3 >> ~/.ssh/authorized_keys
# copy nginx configuration
cp $1 /etc/nginx/sites-enabled/
certbot --nginx --rsa-key-size 4096 -d $2
service nginx start
