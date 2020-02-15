
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
 
 For developme

You can either use docker to develop this or you can manually install ruby and run the app in the traditional way. 


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
eyJoaXN0b3J5IjpbNTQyOTc5MzA1LC0xNzg4OTU5MTAzXX0=
-->