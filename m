Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4E59050C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384786.620278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMp-0004Am-FZ; Thu, 11 Aug 2022 16:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384786.620278; Thu, 11 Aug 2022 16:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMp-00043n-9I; Thu, 11 Aug 2022 16:49:07 +0000
Received: by outflank-mailman (input) for mailman id 384786;
 Thu, 11 Aug 2022 16:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMo-0003Aq-6M
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82648173-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:05 +0200 (CEST)
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
X-Inumbo-ID: 82648173-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k96LELiDF10OR0dJpj9/L9eHF1chcvy5FKD7ZziqpbI=;
  b=ExhRiGbFJZhVr35o565dACaO3qs6iq6X6qj2p+APfe36UrTmYTjL4yLu
   JwXq58NnpOsQV1bHSCjrTcxLH11ld/8mFL34M7GTsHpvCo0MXT5zt1HeK
   GQPjBldVI+6fjDZf7Mb5/fh1kFCoay9m+pvzVnwZKSiJ47lMIKaD8Qznl
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77650097
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aLWkLKDmIbH8tBVW/0Pjw5YqxClBgxIJ4kV8jS/XYbTApDt2hWBUx
 2BMUW7VOPePZjD9ct90ad61pBsG7ZLcnYMwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEsvvb8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW1zn2OxRCmYzBNMZ/fZGKmRj8
 /JHDS9YO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDeNkVQpgeeF3Nz9SOTbXucEwkiij
 WeBpGvmGz07C4CQ8G/Qmp6rrrCWxn6qMG4IL5Wn8tZ6jVvVwXYcYDUSSFCy5/ewjEWzX9ZCA
 0UO/2wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9bnmG74iSijaLZykSPV4pYAICQ1Qg/Iy2yG0stS4jXuqPAYbs0IOtQWCvm
 mnUxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN51sJu8cKbSv3N/Ufj2eN5yMCk8Dd+SnNDKiIPrKinLAoHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5RrxgsP/Y/V6Fr
 4832gnj40w3bdASqxL/qeY7RW3m51BibXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:2vNaWKikuLfTI5Ni3HsU2p88CnBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77650097"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 05/32] tools/libfsimage: Cleanup makefiles
Date: Thu, 11 Aug 2022 17:48:18 +0100
Message-ID: <20220811164845.38083-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove the need for "fs-*" targets by creating a "common.mk" which
have flags that are common to libfsimage/common/ and the other
libfsimages/*/ directories.

In common.mk, make $(PIC_OBJS) a recursively expanded variable so it
doesn't matter where $(LIB_SRCS-y) is defined, and remove the extra
$(PIC_OBJS) from libfsimage/common/Makefile.

Use a $(TARGETS) variable to list things to be built. And $(TARGETS)
can be use in the clean target in common.mk.

iso9660/:
    Remove the explicit dependency between fsys_iso9660.c and
    iso9660.h, this is handled automaticaly by the .*.d dependency files,
    and iso9660.h already exist.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/libfsimage/common/Makefile     | 11 +++--------
 tools/libfsimage/ext2fs-lib/Makefile |  9 ---------
 tools/libfsimage/ext2fs/Makefile     |  9 ---------
 tools/libfsimage/fat/Makefile        |  9 ---------
 tools/libfsimage/iso9660/Makefile    | 11 -----------
 tools/libfsimage/reiserfs/Makefile   |  9 ---------
 tools/libfsimage/ufs/Makefile        |  9 ---------
 tools/libfsimage/xfs/Makefile        |  9 ---------
 tools/libfsimage/zfs/Makefile        |  9 ---------
 tools/libfsimage/Rules.mk            | 26 ++++++++------------------
 tools/libfsimage/common.mk           | 11 +++++++++++
 11 files changed, 22 insertions(+), 100 deletions(-)
 create mode 100644 tools/libfsimage/common.mk

diff --git a/tools/libfsimage/common/Makefile b/tools/libfsimage/common/Makefile
index 0c5a34baea..79f8cfd28e 100644
--- a/tools/libfsimage/common/Makefile
+++ b/tools/libfsimage/common/Makefile
@@ -1,5 +1,5 @@
 XEN_ROOT = $(CURDIR)/../../..
-include $(XEN_ROOT)/tools/libfsimage/Rules.mk
+include $(XEN_ROOT)/tools/libfsimage/common.mk
 
 MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 MINOR = 0
@@ -13,12 +13,10 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 
 LIB_SRCS-y = fsimage.c fsimage_plugin.c fsimage_grub.c
 
-PIC_OBJS := $(patsubst %.c,%.opic,$(LIB_SRCS-y))
-
-LIB = libxenfsimage.so libxenfsimage.so.$(MAJOR) libxenfsimage.so.$(MAJOR).$(MINOR)
+TARGETS = libxenfsimage.so libxenfsimage.so.$(MAJOR) libxenfsimage.so.$(MAJOR).$(MINOR)
 
 .PHONY: all
-all: $(LIB)
+all: $(TARGETS)
 
 .PHONY: install
 install: all
@@ -40,9 +38,6 @@ uninstall:
 	rm -f $(DESTDIR)$(libdir)/libxenfsimage.so.$(MAJOR)
 	rm -f $(DESTDIR)$(libdir)/libxenfsimage.so.$(MAJOR).$(MINOR)
 
-clean distclean::
-	rm -f $(LIB)
-
 libxenfsimage.so: libxenfsimage.so.$(MAJOR)
 	ln -sf $< $@
 libxenfsimage.so.$(MAJOR): libxenfsimage.so.$(MAJOR).$(MINOR)
diff --git a/tools/libfsimage/ext2fs-lib/Makefile b/tools/libfsimage/ext2fs-lib/Makefile
index 431a79068e..b9b560df75 100644
--- a/tools/libfsimage/ext2fs-lib/Makefile
+++ b/tools/libfsimage/ext2fs-lib/Makefile
@@ -9,13 +9,4 @@ FS_LIBDEPS = $(EXTFS_LIBS)
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/ext2fs/Makefile b/tools/libfsimage/ext2fs/Makefile
index c62ae359ac..fe01f98148 100644
--- a/tools/libfsimage/ext2fs/Makefile
+++ b/tools/libfsimage/ext2fs/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_ext2fs.c
 
 FS = ext2fs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/fat/Makefile b/tools/libfsimage/fat/Makefile
index 7ee5e7588d..58bcc0751d 100644
--- a/tools/libfsimage/fat/Makefile
+++ b/tools/libfsimage/fat/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_fat.c
 
 FS = fat
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/iso9660/Makefile b/tools/libfsimage/iso9660/Makefile
index bc86baf2c0..acf3164046 100644
--- a/tools/libfsimage/iso9660/Makefile
+++ b/tools/libfsimage/iso9660/Makefile
@@ -4,15 +4,4 @@ LIB_SRCS-y = fsys_iso9660.c
 
 FS = iso9660
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
-fsys_iso9660.c: iso9660.h
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/reiserfs/Makefile b/tools/libfsimage/reiserfs/Makefile
index 5acfedf25e..42b751e007 100644
--- a/tools/libfsimage/reiserfs/Makefile
+++ b/tools/libfsimage/reiserfs/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_reiserfs.c
 
 FS = reiserfs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/ufs/Makefile b/tools/libfsimage/ufs/Makefile
index f32b9178bd..cca4f0a588 100644
--- a/tools/libfsimage/ufs/Makefile
+++ b/tools/libfsimage/ufs/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_ufs.c
 
 FS = ufs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/xfs/Makefile b/tools/libfsimage/xfs/Makefile
index 54eeb6e35e..ebac7baf14 100644
--- a/tools/libfsimage/xfs/Makefile
+++ b/tools/libfsimage/xfs/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_xfs.c
 
 FS = xfs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/zfs/Makefile b/tools/libfsimage/zfs/Makefile
index 084e5ec08d..434a9c3580 100644
--- a/tools/libfsimage/zfs/Makefile
+++ b/tools/libfsimage/zfs/Makefile
@@ -28,13 +28,4 @@ LIB_SRCS-y = zfs_lzjb.c zfs_sha256.c zfs_fletcher.c fsi_zfs.c fsys_zfs.c
 
 FS = zfs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/Rules.mk b/tools/libfsimage/Rules.mk
index bb6d42abb4..cf37d6cb0d 100644
--- a/tools/libfsimage/Rules.mk
+++ b/tools/libfsimage/Rules.mk
@@ -1,25 +1,18 @@
-include $(XEN_ROOT)/tools/Rules.mk
-
-CFLAGS += -Wno-unknown-pragmas -I$(XEN_ROOT)/tools/libfsimage/common/ -DFSIMAGE_FSDIR=\"$(FSDIR)\"
-CFLAGS += -Werror -D_GNU_SOURCE
-LDFLAGS += -L../common/
-
-PIC_OBJS := $(patsubst %.c,%.opic,$(LIB_SRCS-y))
-
-FSDIR = $(libdir)/xenfsimage
+include $(XEN_ROOT)/tools/libfsimage/common.mk
 
 FSLIB = fsimage.so
+TARGETS += $(FSLIB)
 
-.PHONY: fs-all
-fs-all: $(FSLIB)
+.PHONY: all
+all: $(TARGETS)
 
-.PHONY: fs-install
-fs-install: fs-all
+.PHONY: install
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(FSDIR)/$(FS)
 	$(INSTALL_PROG) $(FSLIB) $(DESTDIR)$(FSDIR)/$(FS)
 
-.PHONY: fs-uninstall
-fs-uninstall:
+.PHONY: uninstall
+uninstall:
 	rm -f $(addprefix $(DESTDIR)$(FSDIR)/$(FS)/, $(FSLIB))
 	if [ -d $(DESTDIR)$(FSDIR)/$(FS) ]; then \
 		rmdir $(DESTDIR)$(FSDIR)/$(FS); \
@@ -28,7 +21,4 @@ fs-uninstall:
 $(FSLIB): $(PIC_OBJS)
 	$(CC) $(LDFLAGS) $(SHLIB_LDFLAGS) -o $@ $^ -lxenfsimage $(FS_LIBDEPS) $(APPEND_LDFLAGS)
 
-clean distclean::
-	rm -f $(PIC_OBJS) $(FSLIB) $(DEPS_RM)
-
 -include $(DEPS_INCLUDE)
diff --git a/tools/libfsimage/common.mk b/tools/libfsimage/common.mk
new file mode 100644
index 0000000000..77bc957f27
--- /dev/null
+++ b/tools/libfsimage/common.mk
@@ -0,0 +1,11 @@
+include $(XEN_ROOT)/tools/Rules.mk
+
+FSDIR := $(libdir)/xenfsimage
+CFLAGS += -Wno-unknown-pragmas -I$(XEN_ROOT)/tools/libfsimage/common/ -DFSIMAGE_FSDIR=\"$(FSDIR)\"
+CFLAGS += -Werror -D_GNU_SOURCE
+LDFLAGS += -L../common/
+
+PIC_OBJS = $(patsubst %.c,%.opic,$(LIB_SRCS-y))
+
+clean distclean::
+	rm -f $(PIC_OBJS) $(TARGETS) $(DEPS_RM)
-- 
Anthony PERARD


