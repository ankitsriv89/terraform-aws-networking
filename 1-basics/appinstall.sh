sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
wget https://www.tooplate.com/download/2135_mini_finance
unzip 2135_mini_finance -d finapp
sudo mkdir /var/www/html/app
sudo mv /finapp/2135_mini_finance/* /var/www/html/app/
sudo curl http://169.254.169.254/latest/meta-data/
