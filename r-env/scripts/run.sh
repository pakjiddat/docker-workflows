export $source_dir="/home/nadir/Projects/r-env/source"
export $target_dir="/home/ruser/projects"
export $hostname="r-env.pakjiddat.pk"
export $repo_name="pakjiddat/r-env:3.6.3"

sudo docker run --cap-add=NET_ADMIN -d -it --name r-env --mount type=bind,source=$source_dir,target=$target_dir -p 8787:8787 -p 4242:4242 -p 443:443 --hostname=$hostname $repo_name
