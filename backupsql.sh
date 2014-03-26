#! /bin/bash
#################################
#						   		#
# Mysql To Dropbox Backup  		#
#	By Robert Wiggins			#
#	http://github.com/txt3rob/	#				   
#								#
#################################

 
TIMESTAMP=$(date +"%F")
MYSQLUSERNAME="USERNAME"
MYSQLPASSWORD="PASSWORD"
BACKUPPATH="/LOCALPATH/$TIMESTAMP"
DATABASE="DATABASE NAME"
DROPBOXPATH="/PATH ON DROPBOX/"
mkdir -p $BACKUPPATH
echo "Starting Mysql Backup"
mysqldump --user=$MYSQLUSERNAME --password=$MYSQLPASSWORD $DATABASE | bzip2 > $BACKUPPATH/mysql_db_backup-`date +%d-%m-%y-%H`.bz2
echo "Backup Completed"
echo "Upload to Dropbox"
dropbox_uploader.sh upload $BACKUPPATH/mysql_db_backup-`date +%d-%m-%y-%H`.bz2 $DROPBOXPATH/mysql_db_backup-`date +%d-%m-%y-%H`.bz2
echo "Removing Old Database"
dropbox_uploader.sh delete $DROPBOXPATH/mysql_db_backup-`date +%d-%m-%y-%H --date 'now -5 days'`.bz2
