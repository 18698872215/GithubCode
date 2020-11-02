#!/bin/bash
#author：luoxf
#write time 2020-10-27 9:00
#author Mob_phone:18698872215 
#E-mail：18698872215@163.com

#defind Variable
Backup_dir="/backup"
Backup_server="172.16.1.7"
#create backup directory
/usr/bin/mkdir -p $Backup_dir/$HOSTNAME

#tar backup local data files
/usr/bin/tar zcPfh $Backup_dir/$HOSTNAME/$HOSTNAME-$(date "+%F_%A" -d -1day).tar.gz /var/spool/cron/root /etc/rc.local /server/scripts/ /etc/hosts /etc/sysconfig/network-scripts/ifcfg-ens*  /etc/sysconfig/iptables-config /var/log/messages /var/log/secure

#delte 7 days ago data
/usr/bin/find $Backup_dir/ -mtime +7 -name "*.tar.gz" -exec rm -f {} \; >/dev/null 2>&1

#create md5 code
/usr/bin/find $Backup_dir/ -type f -mtime -1 ! -name "finger.txt"| xargs md5sum >$Backup_dir/$HOSTNAME/finger.txt

#backup_data push to backup server
/usr/bin/rsync -az $Backup_dir/ rsync_backup@$Backup_server::backup --password-file=/etc/rsync.password