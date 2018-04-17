#!/bin/sh
#
# chkconfig: 345 99 1
# description: Start and stop script for NimBUS monitoring Robot.
#
### BEGIN INIT INFO
# Provides: nimbus
# Required-Start: $local_fs $network +splash_late
# Required-Stop:
# Default-Start: 3 4 5
# Default-Stop: 0 1 2 6
# Short-Description: NimBUS Robot
# Description: NimBUS System Monitoring Software
### END INIT INFO
#
# nimbus - shell script to autostart NimBUS
# Added: Tue Jul 18 22:18:46 UTC 2017
#
# DB2 probe must have the DB2 environment - source the profile so it's available
# Replace $INSTHOME with the DB2 installation directory. Leave the . (dot) as
# the first character in the line!!
# . $INSTHOME/sqllib/db2profile

NIM_RUNNING=1
chk_running() {
        if [ "x$NIM_PID" != "x" ]
        then
                        ps -p $NIM_PID >/dev/null 2>&1
                        if [ $? -eq 0 ]
                        then
                                        NIM_RUNNING=1
                        else
                                        NIM_RUNNING=0
                        fi
        else
                        NIM_RUNNING=0
        fi
}

OP=${1:-"start"}
case "$OP" in
    start)
                echo "Starting NimBUS:"
                cd /fs0/od/nimsoft/bin
                ./nimbus /fs0/od/nimsoft
                if [ -d /var/lock/subsys ]
                then
                        touch /var/lock/subsys/nimbus
                fi
                echo
                ;;
    stop)
                echo "Stopping NimBUS:"
                if [ -f "/fs0/od/nimsoft/robot/pids/nimbus.pid" ]
                then
                        NIM_PID=`cat /fs0/od/nimsoft/robot/pids/nimbus.pid`
                        kill $NIM_PID
                fi
                while [ $NIM_RUNNING -eq 1 ]
                do
                                echo "    waiting for program termination..."
                                sleep 5
                                chk_running
                done
                rm -f /var/lock/subsys/nimbus
                echo
                ;;
    restart)
                $0 stop
                sleep 5
                $0 start
                ;;
    status)
                echo "Status NIMBUS:"
                if [ -f "/fs0/od/nimsoft/robot/pids/nimbus.pid" ]
                then
                        NIM_PID=`cat /fs0/od/nimsoft/robot/pids/nimbus.pid`
                        #OUTPUT=`ps -ef | grep $NIM_PID`
                        echo "Nimbus Service is already running with PID $NIM_PID"
                else
                echo "Nimbus Service is not running"
                exit 1
                fi
                echo
                ;;
    *)
                echo "Usage $0 {start stop restart status}"
                exit 1
                ;;
esac
exit 0
