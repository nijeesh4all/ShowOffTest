
# Widget Gallery App : Ruby on Rails
![ruby-2.6.5](https://img.shields.io/badge/Ruby-v2.6.5-green.svg) 
![rails-5.2.4](https://img.shields.io/badge/Rails-v5.2.4-brightgreen.svg) 
![rspec tests](https://github.com/nijeesh4all/ShowOffTest/workflows/run%20rspec%20tests/badge.svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/b6d8755c5a32fcad1073/maintainability)](https://codeclimate.com/github/nijeesh4all/ShowOffTest/maintainability)

check out the demo here : https://warm-river-71480.herokuapp.com/

This is an demo application built for the second round of interview for http://showoff.ie/ 

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
# build all the necessary containers.
$ docker-compose build

# start the application
$ docker-compose up
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
## TESTS
This project uses `rspec` as the testing library

to run the test if you are using docker use this command

```
$ docker-compose run -e "RAILS_ENV=test" web rake spec
```

## License

MIT License

Copyright (c) [2020] [Nijeesh Joshy]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTE2Nzc0MjUzOSwyMTA0ODYyNzc2LDEwMz
UwODQzMywtMTc4ODk1OTEwM119
-->
