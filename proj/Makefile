# $NetBSD: Makefile,v 1.17 2019/02/27 14:29:58 gdt Exp $

# I have an update to 6 ready, but it is on hold pending an assessment
# of projects.h removal fallout - gdt.
VERSION_BASE=	6.0.0
VERSION_RC=
VERSION=	${VERSION_BASE}${VERSION_RC}
#PKGREVISION=	0
# proj RCs have names like 5.1.0RC1 but unpack to 5.1.0
WRKFINAL=	proj-${VERSION_BASE}
WRKSRC=		${WRKDIR}/${WRKFINAL}
DISTNAME=	proj-${VERSION}
CATEGORIES=	geography
MASTER_SITES=	https://download.osgeo.org/proj/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		proj-datumgrid-1.8${EXTRACT_SUFX} \
		proj-datumgrid-europe-1.2${EXTRACT_SUFX} \
		proj-datumgrid-north-america-1.2${EXTRACT_SUFX} \
		proj-datumgrid-oceania-1.0${EXTRACT_SUFX}

MAINTAINER=	gdt@NetBSD.org
HOMEPAGE=	http://proj4.org/
COMMENT=	Cartographic projection software

# Grid files also have the following "cc-by ish" licenses:
# cc-by, 2-clause-bsd,  License Ouverte, cc0 (eu)
# open-government, cc-by, public-domain (na)
# cc-by (oceania)
LICENSE=	mit

PREV_PKGPATH=		misc/proj

USE_LANGUAGES=		c99 c++11
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake pkg-config
GNU_CONFIGURE=		yes

TEST_TARGET=		check

# \todo Ideally, the files would be unpacked directly in data.
# Assume that all of the stray files in ${WRKDIR} came from datumgrids.
# \todo Some files in the grid tarballs do not get installed by the
# base Makefile.  Consider an alternate approach.
post-extract:
	cd ${WRKDIR} && for f in *; do if [ $$f != ${WRKFINAL} ]; then mv $$f ${WRKFINAL}/data; fi; done

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
