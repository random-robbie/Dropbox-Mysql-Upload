Mysql Backup To Dropbox
-----------------------


This script you will need to run once manually to link to your dropbox folder.

To Run

````
chmod 777 backupsql.sh
./backupsql.sh
````

Once it's confirmed working then add it to the crontab.


Dropbox uploader script originally from - https://github.com/andreafabrizi/Dropbox-Uploader/



You will need to alter the following in backupsql.sh

``````````

MYSQLUSERNAME="USERNAME"
MYSQLPASSWORD="PASSWORD"
BACKUPPATH="/LOCALPATH/$TIMESTAMP"
DATABASE="DATABASE NAME"
DROPBOXPATH="/PATH ON DROPBOX/"

````````````

It's set to delete files older than 5 days.

You can alter this by changing the following line:

````````````````````
dropbox_uploader.sh delete $DROPBOXPATH/mysql_db_backup-`date +%d-%m-%y-%H --date 'now -5 days'`.bz2
````````````````````

For adding to the crontab you can easily use the following site to generate how often you wish for it to run

http://www.easycron.com/generator/crontab

All should be easy to work out.

Any issues please email me txt3rob@gmail.com
