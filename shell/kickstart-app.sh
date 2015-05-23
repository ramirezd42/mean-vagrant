#!/bin/sh

#development directory
MEAN_DIR=/vagrant/app

cd $MEAN_DIR

if [ -d "$1" ]; then
	#TODO need to be nice and maybe pull latest code and update?
	echo "update your source from git"
else

	#from here let's now create a new application
	cd $1

	#be a good citizen and add in the mongo dep in the package.json file for your application
	mv package.json package_json.orig
	sed '10 i\    "mongoose" : ">= 3.6",' package_json.orig > package.json	

	#run an npm link to all the global packages we installed
	npm link

	#finally change the owner of everything to meandev user and group
	cd $MEAN_DIR

	chown -R meandev:meandev $1	
fi
