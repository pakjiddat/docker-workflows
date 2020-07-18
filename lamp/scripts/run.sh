export $source_dir="/home/nadir/Projects/lamp/public_html"
export $sites_available="/home/nadir/Projects/lamp/sites-available"
export $sites_enabled="/home/nadir/Projects/lamp/sites-enabled"
export $backup_dir="/home/nadir/Projects/lamp/backup"
export $mysql_data="/home/nadir/Projects/lamp/mysql_data"
export $host_name="lamp.pakjiddat.pk"
export $repo_name="pakjiddat/lamp:1.0"

sudo docker run -d -it --name lamp-apps --mount type=bind,source=$source_dir,target="/var/www/html" --mount type=bind,source=$sites_available,target="/etc/apache2/sites-available" --mount type=bind,source=$sites_enabled,target="/etc/apache2/sites-enabled" --mount type=bind,source=$backup_dir,target="/var/www/backup" --mount type=bind,source=$mysql_data,target="/var/lib/mysql" -p 80:80 --hostname=$host_name $repo_name
