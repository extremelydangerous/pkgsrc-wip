# $NetBSD: buildlink3.mk,v 1.9 2009/03/20 19:23:53 joerg Exp $

BUILDLINK_TREE+=	gsm

.if !defined(GSM_BUILDLINK3_MK)
GSM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gsm+=		gsm>=1.0.10
BUILDLINK_ABI_DEPENDS.gsm+=	gsm>=1.0.12
BUILDLINK_PKGSRCDIR.gsm?=	../../wip/gsm
.endif # GSM_BUILDLINK3_MK

BUILDLINK_TREE+=	-gsm
