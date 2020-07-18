### Overview:
This repository provides an installation of NodeJs. It can be used to develop applications based on NodeJs. The NodeJs installation can be managed using NVM.

The version of NodeJs is indicated in the image tag. For example the image: **pakjiddat/nodejs:12.16.1** provides NodeJs version 12.16.1. The image is based on Debian v10 (Buster).

The image in this repository provides an easy to use environment for developing NodeJs applications. The source code for your app is stored on the host computer. The container created from the image runs independently from your NodeJs application. It can be stopped and removed without affecting the application source code.

Post all related issues to the [GitHub Repository](https://github.com/pakjiddat/docker-workflows).

### Usage:
To use the image, follow these steps:

Pull the image from Docker Hub using the command:

```bash
sudo docker pull pakjiddat/nodejs:[tag-name]
```

Download the [nodejs directory structure file](https://raw.githubusercontent.com/pakjiddat/docker-workflows/master/nodejs/backup/nodejs.tar.gz). Unzip the contents of the file. Rename the folder to nodejs. It contains folders for application source code, documentation, data backup and scripts.

Before running a script in the **scripts** folder change the environment variables defined at the top of the script file.

Run a Docker container based on the downloaded image by running following command in the **nodejs/scripts folder**:

```bash
./run.sh
```

Login to the newly created container by running the following command in the **nodejs/scripts folder**:

```bash
./cli.sh
```

After logging in, change directory to your application project folder and use the **npm** command to create your NodeJs project.

You should now be able to edit the source code for your app from a code editor installed on your host computer.

You may commit the source code for your app to a git version control repository.

The scripts folder contains script files for performing common tasks. Following script files are provided:

 - **cli.sh**. It logs the user into the container
 - **run.sh**. It creates a new container from the image name specified in the file
 - **remove.sh**. It removes the container
 - **run_site.sh**. It runs the command given in the file
 - **save.sh**. It saves the current container to an image
 - **start.sh**. It starts the container
 - **stop.sh**. It stops the container
 - **backup.sh**. It zips the contents of the source folder and copies the file to the backup container
