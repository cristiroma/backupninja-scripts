tar cvfz "/backup/logs.tar.gz" /var/log > /dev/null 2>&1
if [ $? -ne 0 ]; then
	error "system: Cannot backup /var/log!"
fi

