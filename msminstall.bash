#!/bin/bash
# run "sudo ./msminstall wallpaper-source-folder"


is_user_root () { [ "$(id -u)" -eq 0 ]; }


if is_user_root; then
	./build $1
	echo "python program executed"
	# sed '1s/^\xEF\xBB\xBF//' -i debloantu-wallpapers.xml
	# echo "BOM removed"

	mkdir ./output
	# if output exists, it will throw an error, but will be ignored

	## outputs into a folder for organisation (for easier compilation of packages)
	

	cp --recursive ./$1 /usr/share/backgrounds/
	cp $1.xml /usr/share/gnome-background-properties/
	
	mv -r ./$1 ./output
	mv $1.xml ./output/$1

	echo "== list /usr/share/backgrounds: $(ls /usr/share/backgrounds)"
	echo "== list /usr/share/gnome-background-properties: $(ls /usr/share/gnome-background-properties)"

	## will move the outputs to a directory
else
    echo '[ERROR] Please run the program with admin privillages' >&2
    exit 1
fi


# create var named folder- so it will pass to python program
# and prevent confusions to create now folder
