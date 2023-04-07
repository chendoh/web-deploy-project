#!/bin/bash

# Run as root user

# variables definition
creator=SKYKIKY
#package=apt-get
tomcat_version=9


exit_error()
{
	echo "UNSUCCESSFUL...GOOD BYE"
	echo " "
	echo " "
exit 0
}

# Functions

magic_user_check()
{
if
  [ ${USER} != root ];
then
	echo " "
	echo " "
	echo "${creator} says you need AFRICAN MAGIC POWERS (root) to run this script"
	echo " "
	echo " "
exit_error
fi
}

using_magic_user()
{
if
  [ ${USER} = root ];
then
	echo " "
	echo " "
	echo "${creator} From Bamenda Has Given You MAGIC POWERS "
	echo " "
    echo "Relax your update and installations will start in few seconds"
    echo " "
	echo " "	
fi
}

system_update()
{
	echo " "
	echo " "
	echo "${creator} Updaing ubuntu operating system now..."
	echo " "
	echo " "
	apt-get update -y
	echo " "
	echo " "
}

install_java()
{
	echo " "
	echo " "
	echo "${creator} Installing Java Jre and Jdk..."
	echo " "
	echo " "
    apt-get install -y tomcat${tomcat_version}
	apt-get install -y tomcat${tomcat_version}-admin
	echo " "
}

check_java_version()
{
	echo " "
	echo " "
	echo "BELOW IS THE JAVA VERSION INSTALLED"
	echo " "
	java -version
	echo " "
  	echo " "
}

confirm_tomcat_running()
{
	TOMCAT_PID=$(ps -ef | awk '/[t]omcat/{print $2}')
echo TOMCAT PROCESSID $TOMCAT_PID

if [ -z "$TOMCAT_PID" ]
then
    echo "TOMCAT IS NOT RUNNING"
    sudo /opt/tomcat/bin/startup.sh
else
   echo "TOMCAT IS RUNNING"
fi
}	

we_done()
{
	echo " "
	echo " "
	echo "CONGRATULATIONS...WE ARE DONE"
	echo " "
	echo " "
}

# execution order
magic_user_check
using_magic_user
sleep 5
system_update
sleep 5
install_java
check_java_version
confirm_tomcat_running
we_done



