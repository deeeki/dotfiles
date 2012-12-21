#!/bin/sh
for i in {.awsrc,.bash_profile,.bashrc,.gemrc,.gitconfig,.gitexclude,.rspec,.vimrc,.bundle/config,.ssh/config};
do
	if [ ! -f $PWD/$i -a -f $PWD/$i.sample ]; then
		cp $PWD/$i.sample $PWD/$i
		echo "copied $PWD/$i.sample $PWD/$i"
	fi
	if [ -f ~/$i ]; then
		mv ~/$i ~/$i.original
		echo "moved ~/$i ~/$i.original"
	fi
	ln -s $PWD/$i ~/$i
	echo "linked $PWD/$i ~/$i"
done
