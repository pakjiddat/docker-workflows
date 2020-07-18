export REPO_NAME="pakjiddat/nodejs:12.16.1"
export hostname="nodejs.pakjiddat.pk"
export source_dir="/home/nadir/Projects/nodejs/source"
export target_dir="/home/nodejs/projects"

sudo docker run --cap-add=NET_ADMIN -d -it --name nodejs-apps --mount type=bind,source=$source_dir,target=$target_dir -p 8000:8000 --hostname=$hostname $REPO_NAME
