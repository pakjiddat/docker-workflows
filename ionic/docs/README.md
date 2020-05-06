### Overview:
This repository provides an installation of the Ionic Framework. It can be used to develop applications based on Ionic Framework.

The version of Ionic Framework is indicated in the image tag. For example the image: **pakjiddat/ionic-framework:5.0.1** provides Ionic Framework version 5.0.1. The image is based on Debian v10 (Buster).

The image in this repository provides an easy to use environment for developing Ionic applications. The source code for your ionic app is stored on the host computer. The container created from the image runs independently from your ionic application. It can be stopped and removed without affecting the application source code.

Post all related issues to the [GitHub Repository](https://github.com/pakjiddat/docker-workflows)

### Usage:
To use the image, follow these steps:

Pull the image from Docker Hub using the command:
```bash
sudo docker pull pakjiddat/ionic-framework:[tag-name]
```

Create a working directory on your host computer. This will contain the source code for your Ionic app.

Run a Docker container based on the downloaded image by using following command:
```bash
sudo docker run -d -it --[container-name] --mount type=bind,source="[working-dir-on-host]",target="/home/ionic/projects" -p 8200:8200 -p 8100:8100 --hostname=[host-name] [image-name]
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

Change directory to your project folder and enter the command:
```bash
ionic start [project-name]
```

Start your ionic app using one of the following commands:

  ```bash
  ionic serve --external --address=[host-name] --lab --lab-host=[host-name] -- --host=[host-name]

  OR

  ionic serve --external --address=[host-name] -- --host=[host-name]
  ```

You should now be able to access your ionic app from the browser using the address: **http://[host-name]:8100** or **http://localhost:8100**

To run your app without logging in to your container, enter the following command:
```bash
sudo docker exec -it [container-name] bash -c "source /root/.bashrc && cd app-folder-on-container && ionic serve --external --address=[host-name] -- --host=[host-name]"
```

If the host name of your app is not localhost, then your need to enter the host name in the **/etc/hosts** file on your computer

You should now be able to edit the source code for your app from a code editor installed on your host computer. If you change a file and save it, the browser window should automatically reload because of the live reload feature provided by the Ionic Framework

You may commit the source code for your app to a git version control repository

The scripts folder contains script files for performing common tasks. Following script files are provided:

 - **cli.sh**. It logs the user into the container
 - **run.sh**. It creates a new container from the image name specified in the file
 - **remove.sh**. It removes the container
 - **run_site.sh**. It starts the ionic application
 - **save.sh**. It saves the current container to an image
 - **start.sh**. It starts the container
 - **stop.sh**. It stops the container
 - **backup.sh**. It zips the contents of the source folder and copies the file to the backup container
