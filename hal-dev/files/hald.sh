#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: hald.sh,v 1.1.1.1 2007/07/22 10:46:04 krub1 Exp $
#

# PROVIDE: hald 
# REQUIRE: DAEMON

. /etc/rc.subr

name="hald"
rcvar=$name
command="@PREFIX@/sbin/hald"
command_args="--daemon=yes --use-syslog"
pidfile=/var/run/${name}.pid
required_files="@PKG_SYSCONFDIR@/dbus-1/system.d/hal.conf"

load_rc_config $name
run_rc_command "$1"
