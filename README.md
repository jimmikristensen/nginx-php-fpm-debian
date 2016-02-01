## Introduction
This Dockerfile will build a container running nginx and php-fpm on debian using the debian style sites-available/sites-enabled. The Dockerfile is largely built on the file from ngineerd on github, which can be found here [https://github.com/ngineered/nginx-php-fpm](https://github.com/ngineered/nginx-php-fpm)

### Github
The source can be found here [https://github.com/jimmikristensen/nginx-php-fpm-debian](https://github.com/jimmikristensen/nginx-php-fpm-debian)

### Docker hub
The image can be found in the docker hub registry [https://hub.docker.com/r/picster/nginx-php-fpm-debian/](https://hub.docker.com/r/picster/nginx-php-fpm-debian/)

## Versions
- Nginx: **nginx/1.6.2**
- PHP: **5.6.17-0+deb8u1**
- Debian: **GNU/Linux 8 (Jessie)**

## Starting the container
To start the container, run:
```
sudo docker run --name nginx -p 80:80 -d picster/nginx-php-fpm-debian
```

Access the site here ```http://<DOCKER_HOST>```. The default site will be shown, which is a page displaying ```phpinfo();```.

### Volumes

Sometimes its desirable to mount certain directories to your docker host to create a permanent storage to to be able to manipulate files within the container. E.g. if you want to host multiple websites on a single container.

If you want to be able to upload new files to your website, mount the html dir ```/usr/share/nginx/html```.

If you want to be able to be able to run multiple websites in a single container, mount the ```/etc/nginx/sites-available``` and ```/etc/nginx/sites-enabled```.

The command for doing this:
```
sudo docker run --name nginx -p 80:80 -v /local-dir-on-host:/usr/share/nginx/html -v /local-dir-on-host:/etc/nginx/sites-available -v /local-dir-on-host:/etc/nginx/sites-enabled -d picster/nginx-php-fpm-debian
```

Please not that when creating the config symlink from sites-available to sites-enabled on the host, you should not use the absolute path but the relative path in order to keep the internal linking, i.e. standing i the sites-enabled dir on the host, you should do:
```
ln -s ../sites-available/myconfig myconfig
```

## Logging
All access logs and error logs will be forwarded to docker log collector, which means you will be able to see the errors and access log using:
```
sudo docker logs <CONTAINER_ID>
```
