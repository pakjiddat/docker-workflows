### Overview:
This repository provides an installation of the LAMP (Linux, Apache, MySQL and Php) stack. It can be used to develop applications based on LAMP.

The image in this repository provides an easy to use environment for developing LAMP applications. The source code for your application, the MySQL data and virtual host configuration files are all stored on the host computer. The container created from the image runs independently from your application.

The Docker image runs Debian Buster. it provides Apache version 2.4.38, MariaDb server version 10.3.22 and Php version 7.4.4. The Apache configuration folder, MySQL data folder and public_html folders are all mounted as [docker bind mounts](https://docs.docker.com/storage/bind-mounts/). This allows separation of development environment from the application source code.

Post all related issues to the [GitHub Repository](https://github.com/pakjiddat/docker-workflows)

### Usage:
To use the image, follow these steps:

Pull the image from Docker Hub using the command:

```bash
sudo docker pull pakjiddat/lamp:[tag-name]
```

Download the [lamp backup file](https://raw.githubusercontent.com/pakjiddat/docker-workflows/master/lamp/lamp-backup.zip). Unzip the contents of the file. Rename the folder to lamp. It contains folders for Apache virtual host configuration, application source code and MySQL data. It also contains scripts for running a container from the image, starting, stopping container and backing up container data

Run a Docker container based on the downloaded image by using following command:

```bash
sudo docker run -d -it --name [container-name] --mount type=bind,source="[path-to-lamp-folder]/public_html",target="/var/www/html" --mount type=bind,source="[path-to-lamp-folder]/sites-available",target="/etc/apache2/sites-available" --mount type=bind,source="[path-to-lamp-folder]/sites-enabled",target="/etc/apache2/sites-enabled" --mount type=bind,source="[path-to-lamp-folder]/backup",target="/var/www/backup" --mount type=bind,source="[path-to-lamp-folder]/mysql_data",target="/var/lib/mysql" -p 80:80 --hostname="[host-name]" pakjiddat/lamp:[tag-name]
```

- **container-name** is the name of the container that is created from the Docker image. Set it to lamp-apps
- **path-to-lamp-folder** is the absolute path to the lamp folder mentioned above
- **host-name** is the host name for your container

Login to the newly created container using the command:

```bash
sudo docker exec -it [container-name] /bin/bash
```

Set MySQL root user password using the command:

```bash
mysql_secure_installation
```

Change directory to the lamp folder on your host computer. Create virtual hosts for your applications by copying the **sites-available/000-default.conf** file for each virtual host.

To activate the virtual host, create a symbolic link with source **sites-available/[vhost-name].conf** and target **sites-enabled/[vhost-name].conf**. After that restart Apache web server by running the **script scripts/restart.sh** script. You also need to add entries to **/etc/hosts** file for each virtual host on your host computer. Enter the command: **ip address** in the container to find out the ip address of the container.

The **lamp/public_html** folder contains the application source code. The source code for each application should be in a separate folder. There is already a folder called phpmyadmin. Create a virtual host for your phpmyadmin host, using the instructions mentioned in previous step. You should now be able to access the phpmyadmin site from a browser. You can now create databases for your application from the phpmyadmin site.

To backup your applications, simply run the script: **scripts/backup.sh**. This script simply compresses the contents of the lamp folder and copies the compressed backup file to the **lamp/backup** folder. This folder may point to a shared drive. The backup contains the application source code, Apache virtual host configuration files, MySQL database folder and scripts for working with the Docker container.

The **lamp/scripts** folder contains scripts for starting, stopping the container, restarting Apache and MySQL server, backing up the LAMP installation, saving the running container to a Docker image and logging into the Docker container.

You may commit the source code for your apps to a git version control repository.

The scripts folder contains script files for performing common tasks. Following script files are provided:

 - **cli.sh**. It logs the user into the container
 - **run.sh**. It creates a new container from the image name specified in the file
 - **remove.sh**. It removes the container
 - **run_site.sh**. It starts the Apache and MySQL applications
 - **save.sh**. It saves the current container to an image
 - **start.sh**. It starts the container
 - **stop.sh**. It stops the container
 - **backup.sh**. It zips the contents of the source folder and copies the file to the backup container
