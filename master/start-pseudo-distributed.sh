#/bin/sh
/usr/sbin/sshd 
cd $SPARK_HOME/sbin
./start-all.sh
cd ~
/bin/bash