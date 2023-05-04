apt-get update
apt-get install -y php php-mysql php-xml php-mbstring php-soap php-intl php-gd php-zip php-curl
chmod 777 /etc/php/8.1/apache2/php.ini
echo "max_input_vars = 5000" >> /etc/php/8.1/apache2/php.ini