### Overview:
This repository provides an installation of Rstudio and R. It can be used to develop applications based on R programming language.

The version of R is indicated in the image tag. For example the image: **pakjiddat/r-env:3.6.3** provides R version 3.6.3. The image is based on Debian v10 (Buster).

The image in this repository provides an easy to use environment for developing R applications. The source code for your app is stored on the host computer. The container created from the image runs independently from your R application. It can be stopped and removed without affecting the application source code.

Post all related issues to the [GitHub Repository](https://github.com/pakjiddat/docker-workflows)

### Usage:
To use the image, follow these steps:

Pull the image from Docker Hub using the command:

```bash
sudo docker pull pakjiddat/r-env:[tag-name]
```

Create a working directory on your host computer. This will contain the source code for your R app

Run a Docker container based on the downloaded image by using following command:

```bash
sudo docker run --cap-add=NET_ADMIN -d -it --name --[container-name] --mount type=bind,source="[working-dir-on-host]",target="/home/ruser/projects" -p 8787:8787 -p 4242:4242 -p 443:443 --hostname="[host-name]" r-env:3.6.3
```

- **working-dir-on-host** is the absolute path to working directory on host

- **host-name** is the host name you enter in the web browse to test your app

- **image-name** is the name of the image downloaded from this repository. The image name can be found using:

  ```bash
  sudo docker images --all
  ```

Login to the newly created container using the command:

```bash
sudo docker exec -it [container-name] /bin/bash
```

Run RStudio server:

```bash
sudo docker exec -it [container-name] bash  -c "service rstudio-server start"

Or run the **run_site.sh** script in the **scripts** folder
```

You should now be able to access your R app from the browser using the address: **http://[container-ip]:8787** or **http://localhost:8787**

If the host name of your app is not localhost, then your need to enter the host name in the **/etc/hosts** file on your computer

You should now be able to edit the source code for your app from a code editor installed on your host computer

You may commit the source code for your app to a Git version control repository

The scripts folder contains script files for performing common tasks. Following script files are provided:

- **cli.sh**. It logs the user into the container
- **run.sh**. It creates a new container from the image name specified in the file
- **remove.sh**. It removes the container
- **run_site.sh**. It starts RStudio server
- **save.sh**. It saves the current container to an image
- **start.sh**. It starts the container
- **stop.sh**. It stops the container
- **backup.sh**. It zips the contents of the source folder and copies the file to the backup container
