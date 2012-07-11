#!/bin/sh
for i in {.awsrc,.bash_profile,.bashrc,.gemrc,.gitconfig,.gitexclude,.vimrc,.ssh/config};
do
	if [ ! -f $PWD/$i -a -f $PWD/$i.sample ]; then
		cp $PWD/$i.sample $PWD/$i
		echo "$PWD/$i.sample $PWD/$i"
	fi
	mv ~/$i ~/$i.original
	ln -s $PWD/$i ~/$i
	echo "ln -s $PWD/$i ~/$i"
done
