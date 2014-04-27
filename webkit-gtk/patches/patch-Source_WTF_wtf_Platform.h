$NetBSD: patch-Source_WTF_wtf_Platform.h,v 1.1 2014/04/27 10:05:23 leot1990 Exp $

--- Source/WTF/wtf/Platform.h.orig	2014-04-14 06:40:45.000000000 +0000
+++ Source/WTF/wtf/Platform.h
@@ -618,6 +618,11 @@
 #define USE_SYSTEM_MALLOC 1
 #endif
 
+/* Workaround an alignment issue with fastMalloc on NetBSD/arm */
+#if OS(NETBSD) && CPU(ARM)
+#define USE_SYSTEM_MALLOC 1
+#endif
+
 #if !defined(ENABLE_GLOBAL_FASTMALLOC_NEW)
 #define ENABLE_GLOBAL_FASTMALLOC_NEW 1
 #endif
