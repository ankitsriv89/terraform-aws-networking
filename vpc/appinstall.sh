#!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              cd /var/www/html
              sudo wget https://www.tooplate.com/download/2131_wedding_lite
              sudo unzip 2129_crispy_kitchen.zip
              sudo cp -r 2129_crispy_kitchen/* .
              sudo rm -rf 2129_crispy_kitchen 2129_crispy_kitchen.zip
sudo curl http://169.254.169.254/latest/meta-data/
