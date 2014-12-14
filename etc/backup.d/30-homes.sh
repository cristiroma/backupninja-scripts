backup="/backup/home"

if [ ! -d "$backup" ]; then
	mkdir -p $backup
fi

tar cvfz "$backup/homes.tar.gz" /home --exclude=/home/*/.gvfs > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "homes: Cannot backup /home!"
fi

tar cvfz "$backup/root.tar.gz" /root > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "homes: Cannot backup /root!"
fi


