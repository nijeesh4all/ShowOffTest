
# Widget Gallery App : Ruby on Rails

check out the demo here : https://warm-river-71480.herokuapp.com/

This is an demo application built for the second round of interview for http://showoff.ie/ 

## Info

|Ruby version  | 2.6.3 |
|--|--|
| **Rails version** | **5.2.4** |

## License

All source code in this repo is available jointly under the MIT License

## Getting started
### Clone
To get started with the app, clone the repo 
```
$ cd /path/to/repos
$ git clone https://github.com/nijeesh4all/ShowOffTest widget_gallery
$ cd widget_gallery
```
### Set Environment Variables

This application make use of these Environment variables for working.

 1. `SHOWOFF_URL`
 2. `SHOWOFF_CLIENT_ID`
 3. `SHOWOFF_CLIENT_SECRET`
 
 For development you can use the `.env.example` file for reference.
 copy the `.env.example` file to `.env` add your variables in there.

>**ITS VERY VERY IMPORTATION THE YOU DON'T COMMIT THIS FILE TO GIT** 

You can either use docker to develop this or you can manually install ruby and run the app in the traditional way. 

### Run using docker

first you have to install docker. 
instructions on installing docker : https://docs.docker.com/machine/install-machine/

once its installed make sure you have added the `.env` file as instructed above. docker-compose make use of it to set the environment variables
 
```
# build the docker 
$ docker-compose build
```

### Run Manually
This application is made using Ruby on Rails. So first you need to install ruby version **2.6.3** to get started.

you can follow this tutorial for setting up ruby with rvm https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html
 

next install all the required gems via bundler
```
$ bundle install --without production
```
If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIxNDUyMTAyNSwtMTc4ODk1OTEwM119
-->