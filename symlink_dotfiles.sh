#!/bin/sh
SRC=$(cd "$(dirname "$0")"; pwd)

for i in {.awsrc,.bash_profile,.bashrc,.gemrc,.gitconfig,.gitexclude,.oneliners,.powconfig,.rspec,.vimrc,.brew/Brewfile,.bundle/config,.ssh/config};
do
	if [ ! -f $SRC/$i -a -f $SRC/$i.sample ]; then
		cp $SRC/$i.sample $SRC/$i
		echo "copied $SRC/$i.sample $SRC/$i"
	fi
	if [ ! -d `dirname ~/$i` ]; then
		mkdir -p `dirname ~/$i`
		echo "created `dirname ~/$i`"
	fi
	if [ ! -L ~/$i ]; then
		if [ -f ~/$i ]; then
			mv ~/$i ~/$i.original
			echo "moved ~/$i ~/$i.original"
		fi
		ln -s $SRC/$i ~/$i
		echo "linked $SRC/$i ~/$i"
	fi
done
