# Docker Image for Canvas LMS

This docker image of Canvas LMS builds the application in one single container. It still relies on external services for database and caching.

You can run multiple instances of this container for web and bg worker tasks.

Get the build image from [here](https://hub.docker.com/r/scisco/canvas-lms-docker/).

## Build

    $ docker build . -t 'scisco/canvas-lms-docker:some_tag'

## Install

    $ cp .env.sample .env

Update `.env` with correct information

### DB Intial setup

    $ docker-compose run --rm db_initial

### Reset Encryption Key

    $ docker-compose run --rm reset_encryption_key

### SSH to container

    $ docker-compose run --rm bash

### Run with no SSL

    $ docker-compose up web_nossl

### RUN with SSL

    $ docker-compose up web

## Docker RUN

    $ docker run -it --env-file ./.env -p 8000:80 -v ${PWD}/start.sh:/var/canvas/start.sh -v ${PWD}/config/database.yml:/var/canvas/config/database.yml -v ${PWD}/config/domain.yml:/var/canvas/config/domain.yml -v ${PWD}/config/security.yml:/var/canvas/config/security.yml -v ${PWD}/config/canvas_no_ssl.conf:/etc/apache2/sites-enabled/canvas.conf scisco/canvas-lms-docker:release_2017-04-22.20 ./start.sh

    $ docker run -it --env-file ./.env -v ${PWD}/start.sh:/var/canvas/start.sh -v ${PWD}/config/database.yml:/var/canvas/config/database.yml -v ${PWD}/config/domain.yml:/var/canvas/config/domain.yml -v ${PWD}/config/security.yml:/var/canvas/config/security.yml -v ${PWD}/config/canvas_no_ssl.conf:/etc/apache2/sites-enabled/canvas.conf  scisco/canvas-lms-docker:release_2017-04-22.20 ./script/canvas_init run

    $ docker run --rm -it -v ${PWD}/confg:/var/canvas/config -v scisco/canvas-lms-docker:release_2017-04-22.20 rake db:reset_encryption_key_hash

    $ docker run --rm -it -v /tmp/efs/project/config/database.yml:/var/canvas/config/database.yml -v /tmp/efs/project/config/security.yml:/var/canvas/config/security.yml -v /tmp/efs/sad/brandable_css:/var/canvas/public/dist/brandable_css -v /tmp/efs/project/sites-enabled:/etc/apache2/sites-enabled -p 80:80 -p 443:443 scisco/canvas-lms-docker:release_2017-04-22.20 ./start.sh

### Right-to-Left Version of Canvas

I have included a RTL css override for Canvas here. It does't work with the latest version of Canvas but can be fixed with minimal efforts.
