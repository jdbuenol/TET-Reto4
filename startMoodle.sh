apt-get install -y apache2
git clone https://github.com/moodle/moodle.git
mv ./moodle /var/www/html/
chmod 777 -R /var/www/html/moodle
service apache2 restart