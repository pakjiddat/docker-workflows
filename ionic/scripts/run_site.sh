export $host_name="ionic.pakjiddat.pk"

sudo docker exec -it ionic bash  -c "source /root/.bashrc && cd /home/ionic/projects && ionic serve --external --address=$host_name -- --host=$host_name"
