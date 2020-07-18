export $source_dir="/home/nadir/Projects/ionic/source"
export $host_name="ionic.pakjiddat.pk"
export $repo_name="ionic-framework:5.0.1"

sudo docker run -d -it --ionic --mount type=bind,source=$source_dir,target="/home/ionic/projects" -p 8200:8200 -p 8100:8100 --hostname=$hostname $repo_name
