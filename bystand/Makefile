# $NetBSD$

DISTNAME=	bystand-0.7.3
CATEGORIES=	news
MASTER_SITES=	http://zzo38computer.org/prog/bystand/
EXTRACT_SUFX=	.zip

MAINTAINER=	micha@NetBSD.org
HOMEPAGE=	http://zzo38computer.org/fossil/bystand.ui/
COMMENT=	NNTP client software with command-line interface
LICENSE=	public-domain

USE_LANGUAGES+=	c99

.include "../../mk/bsd.prefs.mk"

INSTALLATION_DIRS=	bin share/doc/bystand/setup

do-build:
		cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
			${MAKE} ${MAKE_FLAGS} -f Makefile.BSD

do-install:
		cd ${WRKSRC} && ${INSTALL_PROGRAM} ${WRKSRC}/bystand \
			${DESTDIR}${PREFIX}/bin/bystand
		cd ${WRKSRC} && ${INSTALL_DATA} ${WRKSRC}/setup/README \
			${DESTDIR}${PREFIX}/share/doc/bystand/setup/README
		cd ${WRKSRC} && ${INSTALL_DATA} ${WRKSRC}/setup/schema \
			${DESTDIR}${PREFIX}/share/doc/bystand/setup/schema
		cd ${WRKSRC} && ${INSTALL_DATA} ${WRKSRC}/setup/template \
			${DESTDIR}${PREFIX}/share/doc/bystand/setup/template

# Builtin version of NetBSD 7 is not sufficient
# Minimum required API version is undocumented (use tested one)
BUILDLINK_API_DEPENDS.sqlite3+=	sqlite3>=3.29.0
.include "../../databases/sqlite3/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
