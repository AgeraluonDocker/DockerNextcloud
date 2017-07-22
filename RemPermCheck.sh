#substr($perms, 2, 1) != '0'
#disable file permissions check
#echo "substr(\$perms, 2, 1) != '0'" | sed -r 's/substr\(\$perms, 2, 1\) != .0./false/'
#! /bin/sh
FILE="sedchangelog.txt"
sed -r 's/substr\(\$perms, 2, 1\) != .0./false/w sedchangelog.txt' /nextcloud/lib/private/legacy/util.php > /nextcloud/lib/private/legacy/util.php_new
sed -r 's/substr\(\$perms, \-1\) !== .0./false/w sedchangelog.txt' /nextcloud/lib/private/legacy/util.php > /nextcloud/lib/private/legacy/util.php_new
if [ -s $FILE ]; then
	mv /nextcloud/lib/private/legacy/util.php_new /nextcloud/lib/private/legacy/util.php
	return 0
else 
	return 1
fi 
