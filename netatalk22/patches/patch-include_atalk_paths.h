$NetBSD: patch-include_atalk_paths.h,v 1.1 2011/07/28 14:41:18 hfath Exp $

--- include/atalk/paths.h.orig	2011-07-27 11:55:39.000000000 +0000
+++ include/atalk/paths.h
@@ -75,8 +75,8 @@
 #  define _PATH_AFPDLOCK	ATALKPATHCAT(_PATH_LOCKDIR,"afpd.pid")
 #else
 #  define _PATH_AFPDLOCK	ATALKPATHCAT(_PATH_LOCKDIR,"afpd")
-#define _PATH_AFP_IPC       ATALKPATHCAT(_PATH_LOCKDIR,"afpd_ipc")
 #endif
+#define _PATH_AFP_IPC       ATALKPATHCAT(_PATH_LOCKDIR,"afpd_ipc")
 
 /*
  * cnid_metad paths
