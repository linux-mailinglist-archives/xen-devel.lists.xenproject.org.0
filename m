Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB34C486D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279192.476890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcIG-0002b9-HM; Fri, 25 Feb 2022 15:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279192.476890; Fri, 25 Feb 2022 15:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcIG-0002Uw-CV; Fri, 25 Feb 2022 15:14:04 +0000
Received: by outflank-mailman (input) for mailman id 279192;
 Fri, 25 Feb 2022 15:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcID-0006fy-KF
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ea134df-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:00 +0100 (CET)
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
X-Inumbo-ID: 8ea134df-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vttR2ey9IAO0GfyGTtbLDlIQNMB1Ci4jM1PA3CUcb8k=;
  b=KB/LrD5ag1nUBMErNqY/ChMDFWQ/L4vdX+ZeIxXusFwnzpbGIg2j4nux
   /z7s0Aye08Uk0Sz9lCjJZyu//lXdoGIKw2fx8ZZBctivT0dstXfJ46llD
   Xq6Vy/JVNiT7PlBKvws8xv+sXYJ3KKFf6q7ZHM8LeIbygqJCs6dvFo+rf
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65000303
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:D2Lds6sCbDgK7S4cYOrOCa6QDOfnVCxeMUV32f8akzHdYApBsoF/q
 tZmKWyEaf+MNmbxc4sgao23/UsC75+Gy941Gwptri5kEy5G+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1nX5
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9uY4bl3/oMCyVBHmZsJvBC+uPcBCKg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWQyNEyYOEUUUrsRII4dssv5nynAShtnjW6Xi/co6nTLzSUkhdABN/KKI4fXFK25hH2wp
 G3c+H/iKgoHL9HZwj2AmlqzgsffkCW9X5gdfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwEbQ4YOT/RfBOnEJCSxaNdgk6NQTHyN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsacowGWxFADpU
 J04dy62trFm4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJGC1O
 ROO4VsJvPe/2UdGi4ctMupd7OxwkMDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIdQFadSVgXMuuwyGVH8baSjdb9KgaI6e56dscl0ZNxMy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:oa4zPK2qm5e5XYUDTcpd6AqjBLgkLtp133Aq2lEZdPRUGvb2qy
 nIpoV/6faUskd3ZJhOo7G90cW7LE80lqQFg7X5X43DYOCOggLBR+tfBOPZslnd8kbFmNK1u5
 0NT0EHMqySMWRH
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65000303"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v2 15/29] libs: Remove need for *installlocal targets
Date: Fri, 25 Feb 2022 15:13:07 +0000
Message-ID: <20220225151321.44126-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need for an extra "installlocal" target, we can use
double-colon rules instead.

"install-headers" in "libs/store" was introduced for the same reason
that "installlocal" exist, so it is replaced as well.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - fix libs/stat/Makefile, make *install targets of the binding also
      double-column.

 tools/libs/light/Makefile | 10 ++--------
 tools/libs/stat/Makefile  |  8 ++++----
 tools/libs/store/Makefile | 10 ++--------
 tools/libs/libs.mk        |  4 ++--
 4 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 7c0a5dca85..769e2a83e2 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -239,17 +239,11 @@ libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 testidl: testidl.o libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
 
-install: installlocal $(LIBHEADERS)
-
-.PHONY: installlocal
-installlocal: libxl-save-helper
+install:: $(LIBHEADERS) libxl-save-helper
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PROG) libxl-save-helper $(DESTDIR)$(LIBEXEC_BIN)
 
-uninstall: uninstalllocal
-
-.PHONY: uninstalllocal
-uninstalllocal:
+uninstall::
 	rm -f $(DESTDIR)$(LIBEXEC_BIN)/libxl-save-helper
 
 clean: cleanlocal
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 6cd0af5239..1aef25a9bb 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -78,8 +78,8 @@ uninstall-python-bindings:
 ifeq ($(XENSTAT_PYTHON_BINDINGS),y)
 .PHONY: all
 all: python-bindings
-install: install-python-bindings
-uninstall: uninstall-python-bindings
+install:: install-python-bindings
+uninstall:: uninstall-python-bindings
 endif
 
 # Perl bindings
@@ -111,8 +111,8 @@ ifeq ($(XENSTAT_PERL_BINDINGS),y)
 all: perl-bindings
 
 .PHONY: install
-install: install-perl-bindings
-uninstall: uninstall-perl-bindings
+install:: install-perl-bindings
+uninstall:: uninstall-perl-bindings
 endif
 
 clean: cleanlocal
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 18ae1fe94d..b94060be8d 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -30,10 +30,7 @@ xs.opic: CFLAGS += -DUSE_DLSYM
 endif
 
 .PHONY: install
-install: install-headers
-
-.PHONY: install-headers
-install-headers:
+install::
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)/xenstore-compat
 	$(INSTALL_DATA) $(XEN_INCLUDE)/xenstore-compat/xs.h $(DESTDIR)$(includedir)/xenstore-compat/xs.h
@@ -42,10 +39,7 @@ install-headers:
 	ln -sf xenstore-compat/xs_lib.h $(DESTDIR)$(includedir)/xs_lib.h
 
 .PHONY: uninstall
-uninstall: uninstall-headers
-
-.PHONY: uninstall-headers
-uninstall-headers:
+uninstall::
 	rm -f $(DESTDIR)$(includedir)/xs_lib.h
 	rm -f $(DESTDIR)$(includedir)/xs.h
 	rm -f $(DESTDIR)$(includedir)/xenstore-compat/xs_lib.h
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 3118cb4194..a173f59a8b 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -100,7 +100,7 @@ endif
 endif
 
 .PHONY: install
-install: all
+install:: all
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
 	$(INSTALL_SHLIB) lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
@@ -111,7 +111,7 @@ install: all
 	$(INSTALL_DATA) $(PKG_CONFIG) $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
-uninstall:
+uninstall::
 	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/$(LIB_FILE_NAME).pc
 	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$$i; done
 	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so
-- 
Anthony PERARD


