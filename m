Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4D97007DB
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 14:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533819.830763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxRqx-0000S1-TR; Fri, 12 May 2023 12:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533819.830763; Fri, 12 May 2023 12:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxRqx-0000QF-PO; Fri, 12 May 2023 12:26:31 +0000
Received: by outflank-mailman (input) for mailman id 533819;
 Fri, 12 May 2023 12:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uaj=BB=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pxRqw-0000Q9-0g
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 12:26:30 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 377496e5-f0c0-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 14:26:27 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4CCQIJZJ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 12 May 2023 14:26:18 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 377496e5-f0c0-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683894378; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DMMeweWM+GOw5a5NQGApknm8Bb6NFo+Q/LKHo/vyDgIx4cLdpWyhtwq6Jb0oFC2m5j
    choroABBkzYTT7hjvzmt04F3oFPVHXhuqSOfLnNZ59TB9xfbFfohKus0qe+VmdD3Xz+Z
    DVP1XlG098Xk3t1a75U3mgL9gEqKTK/5+b7APNjoU4RloP02dAWC6qRVpD6N6GFdt0lb
    KwKK0QaYdl7xWLLMC7efEucjdKkb5x/mEXgWWYbJxxN6O15vF6UjX+H8wr7EX3BIFN/J
    g4EuYUYkxUKHYVVD+CrwhLP50HmxFCQPdckPZ+xmxSvvKSeVR9C3Wqhkab67BhsrIZLX
    vx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683894378;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=lI93bue9rL3OSJYRvI1INTpKr3FcpXHPrRG3HRdcxkI=;
    b=FTMvtzz7nJRY3TaWB4oX7ynIGCoyRpvN6HWOZJzFwTED8v0z1CDGj5N7GGauyKyEtN
    aca/N736R5a/0hULmSs3oU3F3exgeqSpF8afAzdXee35pSa2oHwUTHkFxadbrAQCfJER
    BsA1Pw+8Tfj+3I1IiBfJXpyKtoLSbG6gpNQG0qS3yQq+iNH2nRZI921bY1ayR//dMtDd
    rWncxMvpZoK4gGyTHyb03gIPIBp5NpHo0+4G2YchDwL2h5SztTiNH9BqmjZH8Wo79uzN
    FntQSBmxHcXo45BsAp4P3o575y0cDK7rFJH2L9jPxsuy99KsG0VRBGHxjWFQWfI3gohQ
    9UtQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683894378;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=lI93bue9rL3OSJYRvI1INTpKr3FcpXHPrRG3HRdcxkI=;
    b=hvKAAk/SUXi/t5+UST7BxAjnDoO8YEZmAZXGowZZsUQm9v5H75KaibXFyB08q2xClG
    B8DdAJcIJZNv/hNnWDlNMS0C8L+UCFjctCDa5mSJ4Lyr4TH9acXpkuRy8P04lPAdmJVf
    gDnJcRaGunIkNWKCbjFgfy8oK8Qz9ByGTTWJICpnoVGkQzoLrnhJhe9vQoxRqt66BPCU
    DGGOVJCBB5UDcKieBDagbL6B6UW290Jq4NGibPHal/rW9z4ITxR01Zls5vCgscrx/9Ns
    0R8cM82FPxJ2ir2TEaGmoMH3VXp6TiZ0cNM0cFnyXLNjT2NbaT08R09Dnp46KHKVnkPG
    7YQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683894378;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=lI93bue9rL3OSJYRvI1INTpKr3FcpXHPrRG3HRdcxkI=;
    b=pY2RavDVbgn1pNE0A6SdhN0HwMQgVYWFTwbMqgNktaq2/9iniW+osG1S1flia7d/WV
    QgyunO8RmrJPVOe+zgBA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xr137Gpot26qU4O0oDB37weYobhAHKAaiA4NsOg=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] tools: drop bogus and obsolete ptyfuncs.m4
Date: Fri, 12 May 2023 12:26:14 +0000
Message-Id: <20230512122614.3724-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

According to openpty(3) it is required to include <pty.h> to get the
prototypes for openpty() and login_tty(). But this is not what the
function AX_CHECK_PTYFUNCS actually does. It makes no attempt to include
the required header.

The two source files which call openpty() and login_tty() already contain
the conditionals to include the required header.

Remove the bogus m4 file to fix build with clang, which complains about
calls to undeclared functions.

Remove usage of INCLUDE_LIBUTIL_H in libxl_bootloader.c, it is already
covered by inclusion of libxl_osdep.h.

Remove usage of PTYFUNCS_LIBS in libxl/Makefile, it is already covered
by UTIL_LIBS from config/StdGNU.mk.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
v2: remove consumers of the macros

 config/Tools.mk.in                  |  2 --
 m4/ptyfuncs.m4                      | 35 -----------------------------
 tools/configure.ac                  |  2 --
 tools/libs/light/Makefile           |  2 +-
 tools/libs/light/libxl_bootloader.c |  4 ----
 5 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 m4/ptyfuncs.m4

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 6abb377564..b7cc2961d8 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -31,8 +31,6 @@ PTHREAD_CFLAGS      := @PTHREAD_CFLAGS@
 PTHREAD_LDFLAGS     := @PTHREAD_LDFLAGS@
 PTHREAD_LIBS        := @PTHREAD_LIBS@
 
-PTYFUNCS_LIBS       := @PTYFUNCS_LIBS@
-
 LIBNL3_LIBS         := @LIBNL3_LIBS@
 LIBNL3_CFLAGS       := @LIBNL3_CFLAGS@
 XEN_TOOLS_RPATH     := @rpath@
diff --git a/m4/ptyfuncs.m4 b/m4/ptyfuncs.m4
deleted file mode 100644
index 3e37b5a23c..0000000000
--- a/m4/ptyfuncs.m4
+++ /dev/null
@@ -1,35 +0,0 @@
-AC_DEFUN([AX_CHECK_PTYFUNCS], [
-    dnl This is a workaround for a bug in Debian package
-    dnl libbsd-dev-0.3.0-1. Once we no longer support that
-    dnl package we can remove the addition of -Werror to
-    dnl CPPFLAGS.
-    AX_SAVEVAR_SAVE(CPPFLAGS)
-    CPPFLAGS="$CPPFLAGS -Werror"
-    AC_CHECK_HEADER([libutil.h],[
-      AC_DEFINE([INCLUDE_LIBUTIL_H],[<libutil.h>],[libutil header file name])
-    ])
-    AX_SAVEVAR_RESTORE(CPPFLAGS)
-    AC_CACHE_CHECK([for openpty et al], [ax_cv_ptyfuncs_libs], [
-        for ax_cv_ptyfuncs_libs in -lutil "" NOT_FOUND; do
-            if test "x$ax_cv_ptyfuncs_libs" = "xNOT_FOUND"; then
-                AC_MSG_FAILURE([Unable to find library for openpty and login_tty])
-            fi
-            AX_SAVEVAR_SAVE(LIBS)
-            LIBS="$LIBS $ax_cv_ptyfuncs_libs"
-            AC_LINK_IFELSE([AC_LANG_SOURCE([
-#ifdef INCLUDE_LIBUTIL_H
-#include INCLUDE_LIBUTIL_H
-#endif
-int main(void) {
-  openpty(0,0,0,0,0);
-  login_tty(0);
-}
-])],[
-                break
-            ],[])
-            AX_SAVEVAR_RESTORE(LIBS)
-        done
-    ])
-    PTYFUNCS_LIBS="$ax_cv_ptyfuncs_libs"
-    AC_SUBST(PTYFUNCS_LIBS)
-])
diff --git a/tools/configure.ac b/tools/configure.ac
index 9bcf42f233..3cccf41960 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -70,7 +70,6 @@ m4_include([../m4/uuid.m4])
 m4_include([../m4/pkg.m4])
 m4_include([../m4/curses.m4])
 m4_include([../m4/pthread.m4])
-m4_include([../m4/ptyfuncs.m4])
 m4_include([../m4/extfs.m4])
 m4_include([../m4/fetcher.m4])
 m4_include([../m4/ax_compare_version.m4])
@@ -416,7 +415,6 @@ AC_SUBST([ZLIB_CFLAGS])
 AC_SUBST([ZLIB_LIBS])
 AX_CHECK_EXTFS
 AX_CHECK_PTHREAD
-AX_CHECK_PTYFUNCS
 AC_CHECK_LIB([yajl], [yajl_alloc], [],
     [AC_MSG_ERROR([Could not find yajl])])
 AC_CHECK_LIB([z], [deflateCopy], [], [AC_MSG_ERROR([Could not find zlib])])
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 96daeabc47..5d7ff94b05 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -158,7 +158,7 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-LDLIBS-y += $(PTYFUNCS_LIBS)
+LDLIBS-y += $(UTIL_LIBS)
 LDLIBS-$(CONFIG_LIBNL) += $(LIBNL3_LIBS)
 LDLIBS-$(CONFIG_Linux) += -luuid
 LDLIBS-$(CONFIG_Linux) += -lrt
diff --git a/tools/libs/light/libxl_bootloader.c b/tools/libs/light/libxl_bootloader.c
index 18e9ebd714..1bc6e51827 100644
--- a/tools/libs/light/libxl_bootloader.c
+++ b/tools/libs/light/libxl_bootloader.c
@@ -19,10 +19,6 @@
 #include <utmp.h>
 #endif
 
-#ifdef INCLUDE_LIBUTIL_H
-#include INCLUDE_LIBUTIL_H
-#endif
-
 #include "libxl_internal.h"
 
 #define BOOTLOADER_BUF_OUT 65536

