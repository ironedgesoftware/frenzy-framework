#!/usr/bin/env bash

# apt-get update

echo ""
echo "Executing apt-get update";
echo "";

apt-get update;

echo "";
echo "Installing Development Tools"
echo ""

# Install dev tools

apt-get install -y multitail graphviz;

echo ""
echo "Installing PHP XDebug"
echo ""

# Install xdebug

pecl install -f xdebug-2.4.0;

echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini

# Add custom php.ini

echo ""
echo "Adding a custom php.ini"
echo ""

ln -s /frenzy/etc/provisioning/dev/php/php.ini /usr/local/etc/php/php.ini

# Expose public dir on Apache

echo "Exposing web directory to Apache"
echo ""

ln -s /frenzy/web /var/www/html/frenzy;

# Start Apache

echo "Starting Apache"
echo ""

service apache2 start;

# Switch to the root project directory

echo "Switching to project working directory"
echo ""

cd /frenzy;

# Execute bash

echo "Done! Executing bash"
echo ""

/bin/bash;