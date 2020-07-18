### Overview:
This repository provides an installation of the Ionic Framework. It can be used to develop applications based on Ionic Framework.

The version of Ionic Framework is indicated in the image tag. For example the image: **pakjiddat/ionic-framework:5.0.1** provides Ionic Framework version 5.0.1. The image is based on Debian v10 (Buster).

The image in this repository provides an easy to use environment for developing Ionic applications. The source code for your ionic app is stored on the host computer. The container created from the image runs independently from your ionic application. It can be stopped and removed without affecting the application source code.

Post all related issues to the [GitHub Repository](https://github.com/pakjiddat/docker-workflows).

### Usage:
To use the image, follow these steps:

Pull the image from Docker Hub using the command:
```bash
sudo docker pull pakjiddat/ionic-framework:[tag-name]
```

Download the [ionic directory structure file](https://raw.githubusercontent.com/pakjiddat/docker-workflows/master/ionic/backup/ionic.tar.gz). Unzip the contents of the file. Rename the folder to ionic. It contains folders for application source code, documentation and scripts.

Before running a script in the **scripts** folder change the environment variables defined at the top of the script file.

Run a Docker container based on the downloaded image by running following command in the **ionic/scripts folder**:

```bash
./run.sh
```

Login to the newly created container by running the following command in the **ionic/scripts folder**:

```bash
./cli.sh
```

Start your ionic app by running the following command in the **ionic/scripts folder**:

```bash
./run_site.sh
```

If the host name of your app is not localhost, then you need to enter the host name in the **/etc/hosts** file on your computer.

You should now be able to edit the source code for your app from a code editor installed on your host computer. If you change a file and save it, the browser window should automatically reload because of the live reload feature provided by the Ionic Framework.

You may commit the source code for your app to a git version control repository.

The scripts folder contains script files for performing common tasks. Following script files are provided:

 - **cli.sh**. It logs the user into the container
 - **run.sh**. It creates a new container from the image name specified in the file
 - **remove.sh**. It removes the container
 - **run_site.sh**. It starts the ionic application
 - **save.sh**. It saves the current container to an image
 - **start.sh**. It starts the container
 - **stop.sh**. It stops the container
 - **backup.sh**. It zips the contents of the source folder and copies the file to the backup container
