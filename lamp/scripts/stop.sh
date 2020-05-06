sudo docker exec -it lamp-apps bash  -c "service mysql stop;service apache2 stop"
sudo docker stop lamp-apps
