# $NetBSD: Makefile,v 1.200 2019/01/31 13:39:10 martin Exp $

DISTNAME=	qemu-4.1.0
PKGNAME=	${DISTNAME:S/qemu/qemu-nvmm/}
CATEGORIES=	emulators
MASTER_SITES=	https://download.qemu.org/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.qemu-project.org/
COMMENT=	CPU emulator using dynamic translation
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2.1 AND mit AND modified-bsd

USE_CURSES=		resize_term wide
USE_LANGUAGES+=		c c++
USE_TOOLS+=		bison flex gmake makeinfo perl:build pod2man pkg-config
FAKE_NCURSES=		yes
UNLIMIT_RESOURCES=	datasize
HAS_CONFIGURE=		yes

GMAKE_REQD=		4.1 # needed for docs

PYTHON_VERSIONED_DEPENDENCIES=	sphinx:tool

SUBST_CLASSES+=			prefix
SUBST_STAGE.prefix=		pre-configure
SUBST_MESSAGE.prefix=		Setting PREFIX
SUBST_FILES.prefix+=		configure
SUBST_VARS.prefix+=		PREFIX

SUBST_CLASSES+=			sphinx-build
SUBST_STAGE.sphinx-build=	pre-configure
SUBST_MESSAGE.sphinx-build=	Fix hardcoded sphinx-build
SUBST_FILES.sphinx-build+=	Makefile configure
SUBST_FILES.sphinx-build+=	roms/skiboot/doc/Makefile
SUBST_FILES.sphinx-build+=	roms/u-boot/Documentation/Makefile
SUBST_SED.sphinx-build+=	-e 's/sphinx-build/sphinx-build-${PYVERSSUFFIX}/g'

.include "options.mk"

.include "../../mk/bsd.prefs.mk"

CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--interp-prefix=${PREFIX}/share/qemu
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--python=${PYTHONBIN}
CONFIGURE_ARGS+=	--smbd=${PREFIX}/sbin/smbd
CONFIGURE_ARGS+=	--mandir=${PREFIX}/${PKGMANDIR}
CONFIGURE_ARGS+=	--enable-curses
CONFIGURE_ARGS+=	--enable-docs
CONFIGURE_ARGS+=	--enable-jemalloc
CONFIGURE_ARGS+=	--disable-opengl
CONFIGURE_ARGS+=	--target-list=x86_64-softmmu
CONFIGURE_ARGS+=	--enable-nvmm
CONFIGURE_ENV+=		mansuffix=/${PKGMANDIR}

.if defined(PKGSRC_USE_SSP)
# do not add flags to everything
PKGSRC_USE_SSP=		no
CONFIGURE_ARGS+=	--enable-stack-protector
.endif

NOT_PAX_MPROTECT_SAFE+=	bin/qemu-system-x86_64

PKG_SYSCONFSUBDIR=	qemu

REPLACE_PERL+=		scripts/texi2pod.pl

INSTALLATION_DIRS=	${PKGMANDIR}/man1 share/doc/qemu

UE_ARCHS+=		x86_64

.if ${OPSYS} == "NetBSD"
USER_EMUL=		i386 x86_64 sparc sparc64
PLIST.nbd=		YES
.elif !empty(OPSYS:M*BSD) || ${OPSYS} == "DragonFly"
USER_EMUL=		i386 x86_64 sparc sparc64
PLIST.nbd=		YES
.elif ${OPSYS} == "Darwin"
USER_EMUL=
CONFIGURE_ARGS+=	--disable-bsd-user
PLIST.nbd=		YES
.elif ${OPSYS} == "Linux"
USER_EMUL=		${UE_ARCHS}
PLIST.nbd=		YES
PLIST.ivshmem=		YES
.elif !empty(MACHINE_PLATFORM:MSunOS-5.11-*)
PLIST.nbd=		YES
CONFIGURE_ARGS+=	--disable-coroutine-pool
.endif

PLIST_VARS+=		${UE_ARCHS} nbd ivshmem
.for pvar in ${USER_EMUL}
PLIST.${pvar}=		YES
.endfor

TEST_TARGET=		check

pre-configure:
	${CP} ${FILESDIR}/accel_stubs_nvmm-stub.c ${WRKSRC}/accel/stubs/nvmm-stub.c
	${CP} ${FILESDIR}/include_sysemu_nvmm.h ${WRKSRC}/include/sysemu/nvmm.h
	${CP} ${FILESDIR}/target_i386_nvmm-all.c ${WRKSRC}/target/i386/nvmm-all.c

post-install:
	${INSTALL_DATA} ${FILESDIR}/Makefile.multinode-NetBSD \
		${DESTDIR}${PREFIX}/share/doc/qemu/

# On Darwin, qemu uses Cocoa and CoreAudio
.if ${OPSYS} != "Darwin"
.include "../../mk/oss.buildlink3.mk"
.endif
.include "../../archivers/lzo/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/jemalloc/buildlink3.mk"
.include "../../devel/snappy/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../lang/python/extension.mk"
.include "../../lang/python/versioned_dependencies.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../x11/pixman/buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
