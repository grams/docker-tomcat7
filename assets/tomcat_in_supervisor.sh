#!/bin/bash
# Source: https://confluence.atlassian.com/plugins/viewsource/viewpagesrc.action?pageId=252348917
function shutdown()
{
    date
    echo "Shutting down Tomcat"
    "/usr/share/tomcat7/bin/catalina.sh" stop
}

JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"
CATALINA_HOME="/usr/share/tomcat7"
CATALINA_BASE="/var/lib/tomcat7"
CATALINA_PID="/var/run/tomcat7.pid"
CATALINA_TMPDIR="/tmp/tomcat7-tomcat7-tmp"
LANG="fr_FR.UTF-8"
JSSE_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre/"

source "/etc/default/tomcat7"

date
echo "Starting Tomcat"

cd "/var/lib/tomcat7"

source "/usr/share/tomcat7/bin/catalina.sh"

# Allow any signal which would kill a process to stop Tomcat
trap shutdown HUP INT QUIT ABRT KILL ALRM TERM TSTP

echo "Waiting for `cat $CATALINA_PID`"
wait `cat $CATALINA_PID`
