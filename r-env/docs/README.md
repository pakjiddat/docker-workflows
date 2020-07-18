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

Download the [r-env directory structure file](https://raw.githubusercontent.com/pakjiddat/docker-workflows/master/r-env/backup/r-env.tar.gz). Unzip the contents of the file. Rename the folder to r-env. It contains folders for application source code, data backup and an E-Book on R Programming. It also contains scripts for running a container from the image, starting, stopping container and backing up container data.

Before running a script in the **scripts** folder change the environment variables defined at the top of the script file

Run a Docker container based on the downloaded image by running following command in the **r-env/scripts folder**:

```bash
./run.sh
```

Login to the newly created container by running the following command in the **r-env/scripts folder**:

```bash
./cli.sh
```

Run RStudio server:

```bash
./run_site.sh
```

You should now be able to access R Studio from the browser using the address: **http://[container-ip]:8787** or **http://localhost:8787**

You may change the host name from localhost to some other hostname, by entering the host name in the **/etc/hosts** file on your computer

The scripts folder contains script files for performing common tasks. Following script files are provided:

- **cli.sh**. It logs the user into the container
- **run.sh**. It creates a new container from the image name specified in the file
- **remove.sh**. It removes the container
- **run_site.sh**. It starts RStudio server
- **save.sh**. It saves the current container to an image
- **start.sh**. It starts the container
- **stop.sh**. It stops the container
- **backup.sh**. It zips the contents of the source folder and copies the file to the backup container
