Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B953F5CA5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170993.312205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBc-00085K-Sf; Tue, 24 Aug 2021 11:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170993.312205; Tue, 24 Aug 2021 11:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBc-0007ri-0I; Tue, 24 Aug 2021 11:01:44 +0000
Received: by outflank-mailman (input) for mailman id 170993;
 Tue, 24 Aug 2021 11:01:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3o-0003Ux-Dm
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:40 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 555758b2-04c9-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:10 +0000 (UTC)
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
X-Inumbo-ID: 555758b2-04c9-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9DhKzuHQgtLZwJkkZ8/kcJ7SrlG3Or2a9FCTUzxU3+k=;
  b=hZG1vhybvkCKFzONblFma/ZUHiH/pR1c25yfxyzNnjB+LPJiNR9xR25q
   19PG/JEXdxQGVjldW6xhqOD3P9uyjtsQVpktPBo7qkyoXAAYLtaGbp7MB
   QydHgKKlWLd0UtG3BM2ufG7e0ZxzTljYkPiJDhNpI3/DIzeMs66y0/vOd
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /r2M2TNFXwPbrGLy1IZv6b3W19xSN/7Zks9Cg6hkhJKMndA4VHYE+5RA3wamuigjXwK6lw6w/M
 BLBnYS+WTLj91SwHYROPQdD1aVN0kGu33RFAFSNtp6WaiZxLp2+kPFsHN6wxU0qS9T2mPSl/yw
 n1HZurYZcW9rntabU1x/KwbqvZpdH/wryIcP4kYXrtaiexYjSCk3WMKVHIn39EYs294XcZQIJb
 mXMwU1OQM2sr9Pwj5GF7ZzhOpmz078LT+Cr0zQ3mNtF67vvyhMKXkDBMeB4m7aRK9SSEer/qcN
 3xoU+c0WcbYYCZKMLb9eYuJb
X-SBRS: 5.1
X-MesageID: 52875523
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JWFcvqvGGspTaqJf1dK4XqoL7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875523"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 41/51] build,x86: remove the need for build32.mk
Date: Tue, 24 Aug 2021 11:50:28 +0100
Message-ID: <20210824105038.1257926-42-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rework "arch/x86/boot/Makefile" to allow it to build both file
"cmdline.S" and "reloc.S" without "build32.mk".

These will now use the main rules for "%.o: %.c", and thus generate a
dependency file. (We will not need to track the dependency manually
anymore.)

But for that, we need to override the main CFLAGS to do a 32bit build.
Thus we copy all the necessary flags from "Config.mk", and apply them
only to "cmdline.o" and "reloc.o".

Specificaly apply the rule "%.S: %.bin" to both cmdline.S and reloc.S
to avoid make trying to regenerate other %.S files with it.

There is no change expected to the resulting "cmdline.S" and
"reloc.S", only the *.o file changes as their symbole for FILE goes
from "cmdline.c" to "arch/x86//cmdline.c". (No idea why "boot" is
missing from the string.) (I've only check with gcc, not clang.)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/boot/Makefile   | 60 ++++++++++++++++++++++++++----------
 xen/arch/x86/boot/build32.mk | 40 ------------------------
 2 files changed, 44 insertions(+), 56 deletions(-)
 delete mode 100644 xen/arch/x86/boot/build32.mk

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 73a3b1514965..3580a9b656e8 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,23 +1,51 @@
 obj-bin-y += head.o
+head-objs := cmdline.S reloc.S
 
-DEFS_H_DEPS = $(BASEDIR)/$(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
+nocov-y += $(head-objs:.S=.o)
+noubsan-y += $(head-objs:.S=.o)
+targets += $(head-objs:.S=.o)
 
-CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h \
-	       $(BASEDIR)/include/xen/kconfig.h \
-	       $(BASEDIR)/include/generated/autoconf.h
+head-objs := $(addprefix $(obj)/, $(head-objs))
 
-RELOC_DEPS = $(DEFS_H_DEPS) \
-	     $(BASEDIR)/include/generated/autoconf.h \
-	     $(BASEDIR)/include/xen/kconfig.h \
-	     $(BASEDIR)/include/xen/multiboot.h \
-	     $(BASEDIR)/include/xen/multiboot2.h \
-	     $(BASEDIR)/include/xen/const.h \
-	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
+$(obj)/head.o: $(head-objs)
 
-$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
+LDFLAGS_DIRECT_OpenBSD = _obsd
+LDFLAGS_DIRECT_FreeBSD = _fbsd
+$(head-objs:.S=.lnk): LDFLAGS_DIRECT := -melf_i386$(LDFLAGS_DIRECT_$(XEN_OS))
 
-$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
-	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
+CFLAGS_x86_32 := -m32 -march=i686
+CFLAGS_x86_32 += -fno-strict-aliasing
+CFLAGS_x86_32 += -std=gnu99
+CFLAGS_x86_32 += -Wall -Wstrict-prototypes
+$(call cc-option-add,CFLAGS_x86_32,CC,-Wdeclaration-after-statement)
+$(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-but-set-variable)
+$(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-local-typedefs)
+$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
+CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
+CFLAGS_x86_32 += -I$(srctree)/include
 
-$(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS) $(src)/build32.lds
-	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
+# override for 32bit binaries
+$(head-objs:.S=.o): CFLAGS-stack-boundary :=
+$(head-objs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
+
+$(head-objs): %.S: %.bin
+	(od -v -t x $< | tr -s ' ' | awk 'NR > 1 {print s} {s=$$0}' | \
+	sed 's/ /,0x/g' | sed 's/,0x$$//' | sed 's/^[0-9]*,/ .long /') >$@
+
+# Drop .got.plt during conversion to plain binary format.
+# Please check build32.lds for more details.
+%.bin: %.lnk
+	$(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | \
+		while read idx name sz rest; do \
+			case "$$name" in \
+			.got.plt) \
+				test $$sz != 0c || continue; \
+				echo "Error: non-empty $$name: 0x$$sz" >&2; \
+				exit $$(expr $$idx + 1);; \
+			esac; \
+		done
+	$(OBJCOPY) -O binary -R .got.plt $< $@
+
+
+%.lnk: %.o $(src)/build32.lds
+	$(LD) $(LDFLAGS_DIRECT) -N -T $(filter %.lds,$^) -o $@ $<
diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot/build32.mk
deleted file mode 100644
index e90680cd9f52..000000000000
--- a/xen/arch/x86/boot/build32.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-override XEN_TARGET_ARCH=x86_32
-CFLAGS =
-include $(XEN_ROOT)/Config.mk
-
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
-
-CFLAGS += -Werror -fno-builtin -g0 -msoft-float
-CFLAGS += -I$(BASEDIR)/include
-CFLAGS := $(filter-out -flto,$(CFLAGS)) 
-
-# NB. awk invocation is a portable alternative to 'head -n -1'
-%.S: %.bin
-	(od -v -t x $< | tr -s ' ' | awk 'NR > 1 {print s} {s=$$0}' | \
-	sed 's/ /,0x/g' | sed 's/,0x$$//' | sed 's/^[0-9]*,/ .long /') >$@
-
-# Drop .got.plt during conversion to plain binary format.
-# Please check build32.lds for more details.
-%.bin: %.lnk
-	$(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | \
-		while read idx name sz rest; do \
-			case "$$name" in \
-			.got.plt) \
-				test $$sz != 0c || continue; \
-				echo "Error: non-empty $$name: 0x$$sz" >&2; \
-				exit $$(expr $$idx + 1);; \
-			esac; \
-		done
-	$(OBJCOPY) -O binary -R .got.plt $< $@
-
-%.lnk: %.o build32.lds
-	$(LD) $(LDFLAGS_DIRECT) -N -T build32.lds -o $@ $<
-
-%.o: %.c
-	$(CC) $(CFLAGS) -c -fpic $< -o $@
-
-cmdline.o: cmdline.c $(CMDLINE_DEPS)
-
-reloc.o: reloc.c $(RELOC_DEPS)
-
-.PRECIOUS: %.bin %.lnk
-- 
Anthony PERARD


