# $NetBSD$

DISTNAME=	distro-1.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_PYPI:=d/distro/}

MAINTAINER=	root@zta.lk
HOMEPAGE=	https://github.com/nir0s/distro
COMMENT=	OS platform information API
LICENSE=	apache-2.0

post-install:
	cd ${DESTDIR}${PREFIX}/bin && ${MV} distro distro-${PYVERSSUFFIX}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
