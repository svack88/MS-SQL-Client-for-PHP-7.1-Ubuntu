apt-get update && apt-get upgrade -y 

apt-get install curl apache2 php7.1 libapache2-mod-php7.1 php7.1-mysql php-common php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-readline php-mbstring php-gettext php7.1-dev &&  a2enmod php7.1 && systemctl restart apache2

curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo bash -c "curl -s https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list"
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get -y install msodbcsql mssql-tools
sudo apt-get install unixodbc unixodbc-dev

sudo pecl install 7.1-sp sqlsrv
sudo pecl install 7.1-sp pdo_sqlsrv

echo "extension=sqlsrv.so" >> /etc/php/7.1/apache2/php.ini
echo "extension=pdo_sqlsrv.so" >> /etc/php/7.1/apache2/php.ini
echo en_US.UTF-8 UTF-8  >> /etc/locale.gen
sudo locale-gen
sudo apachectl restart  




