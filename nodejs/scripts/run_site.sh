export project_name="pakjiddat"

sudo docker exec -it nodejs-apps bash  -c "source /root/.bashrc;cd /home/nodejs/projects/$project_name;gatsby develop --host 0.0.0.0"
