sudo docker start lamp-apps 
sudo docker exec -it lamp-apps bash  -c "service mysql start;service apache2 start" --ip 172.17.0.2 

