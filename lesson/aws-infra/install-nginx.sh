#!/bin/bash
sudo apt update -y
sudo apt install nginx -y

# verify installation
nginx --version

# start nginx
sudo systemctl start nginx

# enable nginx
sudo systemctl enable nginx

# create a simple html file
echo "<h1> Terraform Finally Makes Sense </h1>" > /var/www/html/index.html
