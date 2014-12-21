backup="/backup/system"

if [ ! -d "$backup" ]; then
	mkdir -p $backup
fi

tar cvfz "$backup/boot.tar.gz" /boot --exclude=lost+found > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "system: Cannot backup /boot!"
fi

tar cvfz "$backup/etc.tar.gz" /etc > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "etc: Cannot backup /etc!"
fi

tar cvfz "$backup/opt.tar.gz" /opt > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "system: Cannot backup /opt!"
fi

tar cvfz "$backup/srv.tar.gz" /srv > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "system: Cannot backup /srv!"
fi

tar cvfz "$backup/usr.tar.gz" /usr > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "system: Cannot backup /usr!"
fi

# /var/www - backup separately
# /var/log - backup separately
tar cvfz "$backup/var.tar.gz" /var --exclude=/var/lib/mysql --exclude=/var/tmp --exclude=/var/lock --exclude=/var/cache --exclude=/var/www --exclude=/var/log > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "system: Cannot backup /var!"
fi

