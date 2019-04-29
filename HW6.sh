#!/bin/bash



if [ -f "tagsoup-1.2.1.jar" ]; then
	echo "tagsoup currently installed"
else
	touch "tagsoup-1.2.1.jar"
	wget -O "tagsoup-1.2.1.jar" http://vrici.lojban.org/~cowan/XML/tagsoup/tagsoup-1.2.1.jar
fi

minutes=0

while [ $minutes -lt 60 ]; do
	date=`date +%Y-%m-%d-%H-%M-%S`
	datehtml=$date'.html'
	touch $datehtml
	touch $date'.xhtml'

	wget -O $datehtml http://www.wsj.com/mdc/public/page/2_3021-activnnm-actives.html

	java -jar tagsoup-1.2.1.jar $datehtml > ${date}'.xhtml'
	
	python3 pyhw6.py ${date}'.xhtml'
	((minutes++))
	echo "minutes passed: " $minutes
	sleep $[60]
	

done
