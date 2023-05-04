apt-get install -y apache2
git clone https://github.com/moodle/moodle.git
mv ./moodle /var/www/html/
service apache2 restart