# $NetBSD: options.mk,v 1.18 2009/03/30 09:35:19 dillo Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.scummvm-nightly
PKG_SUPPORTED_OPTIONS=	scummvm-nightly-cruise
PKG_SUPPORTED_OPTIONS+=	scummvm-nightly-igor
PKG_SUPPORTED_OPTIONS+=	scummvm-nightly-lol
PKG_SUPPORTED_OPTIONS+=	scummvm-nightly-m4
PKG_SUPPORTED_OPTIONS+=	scummvm-nightly-pn
PKG_SUPPORTED_OPTIONS+=	scummvm-nightly-saga2
PKG_SUPPORTED_OPTIONS+=	scummvm-nightly-sci
PKG_SUPPORTED_OPTIONS+=	scummvm-nightly-sci32
PKG_SUPPORTED_OPTIONS+=	scummvm-nightly-tinsel
PKG_SUGGESTED_OPTIONS=	${PKG_SUPPORTED_OPTIONS}

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mscummvm-nightly-cruise)
CONFIGURE_ARGS+=--enable-cruise
.endif
.if !empty(PKG_OPTIONS:Mscummvm-nightly-igor)
CONFIGURE_ARGS+=--enable-igor
.endif
.if !empty(PKG_OPTIONS:Mscummvm-nightly-lol)
CONFIGURE_ARGS+=--enable-lol
.endif
.if !empty(PKG_OPTIONS:Mscummvm-nightly-m4)
CONFIGURE_ARGS+=--enable-m4
.endif
.if !empty(PKG_OPTIONS:Mscummvm-nightly-pn)
CONFIGURE_ARGS+=--enable-pn
.endif
.if !empty(PKG_OPTIONS:Mscummvm-nightly-saga2)
CONFIGURE_ARGS+=--enable-saga2
.endif
.if !empty(PKG_OPTIONS:Mscummvm-nightly-sci)
CONFIGURE_ARGS+=--enable-sci
.endif
.if !empty(PKG_OPTIONS:Mscummvm-nightly-sci32)
CONFIGURE_ARGS+=--enable-sci32
.endif
.if !empty(PKG_OPTIONS:Mscummvm-nightly-tinsel)
CONFIGURE_ARGS+=--enable-tinsel
.endif
