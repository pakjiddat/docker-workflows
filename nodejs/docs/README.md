### Overview:
This repository provides an installation of NodeJs. It can be used to develop applications based on NodeJs. The NodeJs installation can be managed using NVM

The version of NodeJs is indicated in the image tag. For example the image: **pakjiddat/nodejs:12.16.1** provides NodeJs version 12.16.1. The image is based on Debian v10 (Buster).

The image in this repository provides an easy to use environment for developing NodeJs applications. The source code for your app is stored on the host computer. The container created from the image runs independently from your NodeJs application. It can be stopped and removed without affecting the application source code.

Post all related issues to the [GitHub Repository](https://github.com/pakjiddat/docker-workflows)

### Usage:
To use the image, follow these steps:

Pull the image from Docker Hub using the command:

```bash
sudo docker pull pakjiddat/nodejs:[tag-name]
```

Create a working directory on your host computer. This will contain the source code for your NodeJs app.

Run a Docker container based on the downloaded image by using following command:

```bash
sudo docker run -d -it --[container-name] --mount type=bind,source="[working-dir-on-host]",target="/home/nodejs/projects" -p 8000:8000 --hostname=[host-name] [image-name]
```

- **container-name** is the name of the container that is created from the Docker image. Set it to lamp-apps
- **path-to-lamp-folder** is the absolute path to the lamp folder mentioned above
- **host-name** is the host name for your container

Login to the newly created container using the command:

```bash
sudo docker exec -it [container-name] /bin/bash
```

You should now be able to access your NodeJs app from the browser using the address: **http://[container-ip]:8100** or **http://localhost:8100**

If the host name of your app is not localhost, then your need to enter the host name in the **/etc/hosts** file on your computer

You should now be able to edit the source code for your app from a code editor installed on your host computer

You may commit the source code for your app to a git version control repository

The scripts folder contains script files for performing common tasks. Following script files are provided:

 - **cli.sh**. It logs the user into the container
 - **run.sh**. It creates a new container from the image name specified in the file
 - **remove.sh**. It removes the container
 - **run_site.sh**. It runs the command given in the file
 - **save.sh**. It saves the current container to an image
 - **start.sh**. It starts the container
 - **stop.sh**. It stops the container
 - **backup.sh**. It zips the contents of the source folder and copies the file to the backup container
