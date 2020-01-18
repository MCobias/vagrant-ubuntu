#!/usr/bin/env bash

echo "<<<<<<< READY >>>>>"
echo "<<<<<<< Please a moment, have a coffe cup for while ;) >>>>>"

sudo apt-get update -y

sudo apt-get dist-upgrade -y

sudo apt-get install build-essential -y

sudo apt-get update -y

# unzip is for composer
sudo apt-get install vim unzip -y

sudo apt-get install apache2 -y

sudo ufw app list

sudo ufw app info "Apache Full"

sudo ufw allow in "Apache Full"

sudo apt-get install mysql-client libmysqlclient-dev -y
sudo apt-get install libapache2-mod-php7.2 php7.2 php7.2-mysql php7.2-sqlite -y
sudo apt-get install php7.2-mbstring php7.2-curl php7.2-intl php7.2-gd php7.2-zip php7.2-bz2 -y
sudo apt-get install php7.2-dom php7.2-xml php7.2-soap php7.2-mbstring php7.2-gettext -y
sudo apt-get install php7.2-dev php-curl libmcrypt-dev php7.2-pear php7.2-intl php7.2-xmlrpc -y
sudo apt-get install php7.2-fpm php7.2-cli php7.2-common php7.2-mbstring php7.2-zip php7.2-bcmath -y
sudo apt-get install --reinstall ca-certificates -y

# install the php xdebug extension (only for dev servers!)
sudo apt-get install php-xdebug -y

# add xdebug settings to php.ini
echo 'xdebug.remote_port=9000' >> /etc/php/7.2/apache2/php.ini
echo 'xdebug.remote_enable=true' >> /etc/php/7.2/apache2/php.ini
echo 'xdebug.remote_connect_back=true' >> /etc/php/7.2/apache2/php.ini
echo 'xdebug.remote_autostart=on' >> /etc/php/7.2/apache2/php.ini
echo 'xdebug.remote_host=' >> /etc/php/7.2/apache2/php.ini
echo 'xdebug.max_nesting_level=1000' >> /etc/php/7.2/apache2/php.ini
echo 'xdebug.idekey=PHPSTORM' >> /etc/php/7.2/apache2/php.ini

# Enable apache mod_rewrite
sudo a2enmod rewrite
sudo a2enmod actions

# Change AllowOverride from None to All (between line 170 and 174)
sudo sed -i '170,174 s/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Start the webserver
sudo service apache2 restart

# Install MySQL (optional)
sudo apt-get install mysql-server -y

# Change mysql root password
sudo service mysql start
sudo mysql -u root --password="" -e "update mysql.user set authentication_string=password(''), plugin='mysql_native_password' where user='root';"
sudo mysql -u root --password="" -e "flush privileges;"

#Permission write folder
sudo usermod -a -G root vagrant
sudo usermod -a -G vagrant www-data

# configure phpmyadmin
#sudo apt-get install phpmyadmin -y
#sudo cp -r /usr/share/phpmyadmin /var/www/html/

# Install composer
cd ~
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
composer self-update

echo "<<<<<<< FINISH >>>>>"
echo "<<<<<<< see ya ;) >>>>>"
