# Docker Container

This repository **WAS** a Docker source repository for an Ubuntu-based container with my personal configuration.

The repository is now based on Ansible and the dockerfile no longer works and needs to be updated.

## Build and Use the Container

1. Build the image:
```shell
podman build . --tag configuration
```
2. Run the container:
```shell
podman run -it --name configuration localhost/configuration:latest
```

## Password management

The Dockerfile creates an user named **thalfeust** and set its password. To prevent the password from appearing unencrypted in the code, the image file contains an MD5-based hash of the password.

Procedure to modify the password:
1. Create a hash of the new password:
```shell
openssl passwd -1 "new password"
```
2. Update the Dockerfile line:
```shell
RUN echo 'thalfeust:new hash' | chpasswd -e
```
3. Re-build the image