Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E989759050A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384793.620336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMx-0005ru-NK; Thu, 11 Aug 2022 16:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384793.620336; Thu, 11 Aug 2022 16:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMx-0005nr-Ge; Thu, 11 Aug 2022 16:49:15 +0000
Received: by outflank-mailman (input) for mailman id 384793;
 Thu, 11 Aug 2022 16:49:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMw-0003s9-Fx
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8762dcb2-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:13 +0200 (CEST)
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
X-Inumbo-ID: 8762dcb2-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gpM48lpnObCIjWGPGvBVueMdTtMWC0q32u6eUBiFh6U=;
  b=TvHRgEh1n7m2WRGC0A2xLmVMeD9uVWs0mTMvqmzafQ8uLzJcQYDu7zoo
   2XaOmPmlbKyLk/tJiipjV0+aYL6CZivGhDpG6DROExfIvtmEFVJQ8TkcO
   mJUt7yAerLuCoXXcsyRF7ZGJw5Di8DzD50SDaqAubkx5QUCz8ALq85Jkl
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77893912
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SP/Te6IP0IRaLWxpFE+R3pUlxSXFcZb7ZxGr2PjKsXjdYENS0zMEm
 DQXCjvQOayKZDP2f4p1YN++9UNQvsOHmoUyT1BlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Us11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE2q5JL0NoH4Yj+Mk0Gj9W6
 6IeCyEvcUXW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCMk1wgi+m0arI5fPSEFeUNxVegm
 ljL9nn5PBI3Ju6m1BmapyfEaujnwnqgBdN6+KeD3vJym1iS2mw7AQUbT0emuuK+jlOiWtVZM
 Aof/S9Ghbc23FymSJ/6RRLQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceZTEsz
 E7PoNrvChRmqrjTQnWYnop4thvrZ3JTdzVbI3ZZE01VuLEPvb3fkDrWFfFAEvCXheb3NnLrn
 SiU8i4dlpcM2JtjO7qAwbzXv969jsGXEFZtt1qOBzzNAhBRP9D8OdHxgbTPxbMZddvCEAHc1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuKGpxdEdMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QQOsAuLFbWrHw0PyZ8OlwBd2By+ZzTx
 L/BKZr8ZZrkIf0PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYejiIquYe5caDOmM7FmhJ5oVS2Pr
 L6zwePWlEgEOAA/CwGLmbMuwacicSFnWcyr8JwLL4Zu4GNOQQkcNhMY+pt5E6QNokifvr6gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:vS0YTKmMyXb2lFXb79pgXRsRMifpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77893912"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Wei
 Liu" <wl@xen.org>
Subject: [XEN PATCH v4 11/32] tools/flask/utils: list build targets in $(TARGETS)
Date: Thu, 11 Aug 2022 17:48:24 +0100
Message-ID: <20220811164845.38083-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 tools/flask/utils/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/flask/utils/Makefile b/tools/flask/utils/Makefile
index db567b13dc..6be134142a 100644
--- a/tools/flask/utils/Makefile
+++ b/tools/flask/utils/Makefile
@@ -4,10 +4,10 @@ include $(XEN_ROOT)/tools/Rules.mk
 CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenctrl)
 
-CLIENTS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool
+TARGETS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool
 
 .PHONY: all
-all: $(CLIENTS)
+all: $(TARGETS)
 
 flask-loadpolicy: loadpolicy.o
 	$(CC) $(LDFLAGS) $< $(LDLIBS) $(LDLIBS_libxenctrl) -o $@
@@ -29,7 +29,7 @@ flask-set-bool: set-bool.o
 
 .PHONY: clean
 clean:
-	$(RM) *.o $(CLIENTS) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
@@ -37,10 +37,10 @@ distclean: clean
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	$(INSTALL_PROG) $(CLIENTS) $(DESTDIR)$(sbindir)
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(sbindir)
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(CLIENTS))
+	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(TARGETS))
 
 -include $(DEPS_INCLUDE)
-- 
Anthony PERARD


