Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D42B28AB55
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 03:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5752.14919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRmNU-00051X-1r; Mon, 12 Oct 2020 01:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5752.14919; Mon, 12 Oct 2020 01:11:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRmNT-000518-Uh; Mon, 12 Oct 2020 01:11:51 +0000
Received: by outflank-mailman (input) for mailman id 5752;
 Mon, 12 Oct 2020 01:11:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kRmNT-000513-3x
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 01:11:51 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24d1fd8b-5620-40ed-9387-23f8e9a20eaa;
 Mon, 12 Oct 2020 01:11:49 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09C1BdHI082874
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 11 Oct 2020 21:11:45 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09C1BdwK082873;
 Sun, 11 Oct 2020 18:11:39 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kRmNT-000513-3x
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 01:11:51 +0000
X-Inumbo-ID: 24d1fd8b-5620-40ed-9387-23f8e9a20eaa
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 24d1fd8b-5620-40ed-9387-23f8e9a20eaa;
	Mon, 12 Oct 2020 01:11:49 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09C1BdHI082874
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 11 Oct 2020 21:11:45 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09C1BdwK082873;
	Sun, 11 Oct 2020 18:11:39 -0700 (PDT)
	(envelope-from ehem)
Date: Sun, 11 Oct 2020 18:11:39 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Marek =?unknown-8bit?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [SECOND RESEND] [PATCH] tools/python: Pass linker to Python build
 process
Message-ID: <20201012011139.GA82449@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Unexpectedly the environment variable which needs to be passed is
$LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
of the host `ld`.

Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
it can load at runtime, not executables.

This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
to $LDFLAGS which breaks many linkers.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
This is now the *third* time this has been sent to the list.  Mark Pryor
has tested and confirms Python cross-building is working.  There is one
wart left which I'm unsure of the best approach for.

Having looked around a bit, I believe this is a Python 2/3 compatibility
issue.  "distutils" for Python 2 likely lacked a separate $LDSHARED or
$LD variable, whereas Python 3 does have this.  Alas this is pointless
due to the above (unless you can cause distutils.py to do the final link
step separately).
---
 tools/pygrub/Makefile | 9 +++++----
 tools/python/Makefile | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
index 3063c4998f..37b2146214 100644
--- a/tools/pygrub/Makefile
+++ b/tools/pygrub/Makefile
@@ -3,20 +3,21 @@ XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
-PY_LDFLAGS = $(LDFLAGS) $(APPEND_LDFLAGS)
+PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
 INSTALL_LOG = build/installed_files.txt
 
 .PHONY: all
 all: build
 .PHONY: build
 build:
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
 
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
-		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
+		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
+		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
 		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
 	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
 	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
diff --git a/tools/python/Makefile b/tools/python/Makefile
index 8d22c03676..b675f5b4de 100644
--- a/tools/python/Makefile
+++ b/tools/python/Makefile
@@ -5,19 +5,20 @@ include $(XEN_ROOT)/tools/Rules.mk
 all: build
 
 PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
-PY_LDFLAGS = $(LDFLAGS) $(APPEND_LDFLAGS)
+PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
 INSTALL_LOG = build/installed_files.txt
 
 .PHONY: build
 build:
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
 
 .PHONY: install
 install:
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
-		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
+		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
+		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
 		--root="$(DESTDIR)" --force
 
 	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
-- 
2.20.1


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



