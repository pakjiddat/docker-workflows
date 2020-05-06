## Separating source code and development environment using Docker

### Introduction
A common problem faced by developers involves setting up development environments. Tools such as Docker and Vagrant allow separating source code and development environments. These tools can be used in different ways leading to different possible workflows for developers. In this article I will describe a useful workflow based on Docker. The main benefit of this workflow is that it allows separating source code and development environment.

### Concept
The main idea behind the workflow is to keep the application source code on the host computer and mount the source code folder in the Docker container. The Docker container runs all the required services. Each development environment has its own Docker image. For example to develop Ionic applications, you need to use the Ionic Docker image. To develop LAMP based applications, you need to use the LAMP docker image.

### Usage

- [Guide for creating LAMP applications](https://github.com/pakjiddat/docker-workflows/tree/master/lamp/docs)
- [Guide for creating Ionic applications](https://github.com/pakjiddat/docker-workflows/tree/master/ionic/docs)
- [Guide for creating NodeJs applications](https://github.com/pakjiddat/docker-workflows/tree/master/nodejs/docs)
- [Guide for creating R applications](https://github.com/pakjiddat/r-env/tree/master/r-env/docs)
