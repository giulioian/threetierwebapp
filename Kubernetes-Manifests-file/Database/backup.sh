#!/bin/bash

# DB host (secondary preferred as to avoid impacting primary performance)
HOST=localhost

# DB name
DBNAMES=("todo")

# S3 bucket name
BUCKET=wizamole-mongodb-backup

# Linux user account
USER=giulioian

# Current time
TIME=`/bin/date +%d-%m-%Y-%T`

# Backup directory
DEST=/home/$USER/tmp

# Tar file of backup directory
TAR=$DEST/../$TIME.tar

# Create backup dir (-p to avoid warning if already exists)
/bin/mkdir -p $DEST

# Log
echo "Backing up $HOST/$DBNAME to gs://$BUCKET/ on $TIME";

# Dump from mongodb host into backup directory
for DBNAME in "${DBNAMES[@]}"
do
   /usr/bin/mongodump -h $HOST -d $DBNAME -o $DEST
done

# Create tar of backup directory
/bin/tar cvf $TAR -C $DEST .

# Upload tar to GCP bucket
gsutil cp $TAR gs://$BUCKET/
#/usr/bin/aws s3 cp $TAR s3://$BUCKET/

# Remove tar file locally
/bin/rm -f $TAR

# Remove backup directory
/bin/rm -rf $DEST

# All done
echo "Backup available at https://storage.googleapis.com/$BUCKET/$TIME.tar"
