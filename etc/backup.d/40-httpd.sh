backup="/backup/httpd"
source="/var/www"

if [ ! -d "$backup" ]; then
	mkdir -p $backup
fi

tar cvfz "$backup/httpd.tar.gz" $source
if [ $? -ne 0 ]; then
	error "httpd: Cannot backup httpd!"
fi

tar cvfz "$backup/etc.tar.gz" /etc/httpd
if [ $? -ne 0 ]; then
	error "httpd: Cannot backup /etc/httpd!"
fi
