# $NetBSD: buildlink3.mk,v 1.2 2011/06/29 19:35:51 reinoudz70 Exp $

BUILDLINK_TREE+=	xfconf

.if !defined(XFCONF_BUILDLINK3_MK)
XFCONF_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfconf+=	xfconf>=4.6.0
BUILDLINK_ABI_DEPENDS.xfconf?=	xfconf>=4.6.1nb5
BUILDLINK_PKGSRCDIR.xfconf?=	../../wip/xfconf

.include "../../devel/glib2/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.endif	# XFCONF_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfconf
