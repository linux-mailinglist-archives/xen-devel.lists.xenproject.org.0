Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329963F5CA9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171002.312241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBm-0001Mv-21; Tue, 24 Aug 2021 11:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171002.312241; Tue, 24 Aug 2021 11:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBk-0000tG-GP; Tue, 24 Aug 2021 11:01:52 +0000
Received: by outflank-mailman (input) for mailman id 171002;
 Tue, 24 Aug 2021 11:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU48-0003Ux-EL
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5edca810-04c9-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:27 +0000 (UTC)
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
X-Inumbo-ID: 5edca810-04c9-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I9w9cGZo+/VGBhzaJdsY6/R/D9f03RAWtGSiZGJZmx8=;
  b=Xb4UFhNgdPB8bBedrWuHMOEsPV6Wq7gU4/5tgu8KRFBYmqXI0pjPuo9a
   VbArppdpKA670v/grMABPRiKBDzThNnoDwaVXjAZxNh+P6Lrl2V+tDNwR
   wgPURRq1g/UA3Kl5ksN6Af/5ELAUOV2csfWlBUkTQvgRvxS/ohT/nUwvo
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gNeFafWRySL8KG/VGtvOqXK9CUK0WgOuppa6GdQ1/USxqAYBskm0qioZ2WUXhL1OcoIl5qN4Pi
 4lUzC2otoIqEYdxstol68v1T36QGPV+Hol974D4YZnLT9GJ7NIIhH3vrGEh4C75ut5GOc47tsk
 TkwdRXjQVAhVOUQwUiYlfGX2mIbZSxuXprckzstzsJXnljBYdVhrDcc8F7kwVLS89T2A3zZQkV
 WP9AgMThlb6dvoEngd/IRsuVj6/zvXG3AEC4SPwhqIjdb2CiLZuk8vbnundq1MUauC5XwSj42x
 YNot8sqnQ53tThpyqApNz/+R
X-SBRS: 5.1
X-MesageID: 51153607
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xGCWeqFsem6QoPbOpLqFVJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJkh8erhBEDyewKkyXcV2/hbAV7MZniDhILFFu9fBOjZsnfd8k/Fh4lgPM
 5bGsATZ+EYZmIK7voSlTPIdurIt+P3kpxA692+815dCSVRL41w5QZwDQiWVmdsQhNdOJY/HJ
 2AouJaujuJYx0sH4iGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3y0ZTyhEzd4ZgC
 f4ek3Cl+ueWsOAu1/hPlzontdrcRzau5l+7fm3+4kow/PX+0OVjcpaKvm/VXsO0ZmSAR4R4a
 LxSlEbTolOAjrqDxuIiAqo1A/63Dk07Xj+jVeenHv4uMT8ACk3EsxbmOtiA23kAmcbzaVBOZ
 hwrhWkXltsfGL9tTW448KNWwBhl0Kyr3ZnmekPj2ZHWY9bbLNKt4QQ8E5cDZ9FRUvBmcgaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATlnFkyEkTwtAZgx47hdsAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yEWDJSQKkChPmHb0mLtB0B5vpke+I3FwY3pDXRHU49upApH
 2aaiIkiYcbQTOQNeSemIZM7g3ABH6gWDiF8LAv26RE
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51153607"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v7 47/51] build: Rework "clean" to clean from the root dir
Date: Tue, 24 Aug 2021 11:50:34 +0100
Message-ID: <20210824105038.1257926-48-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow "clean" to work from an out-of-tree build when
it will be available.

Some of the file been removed in current "clean" target aren't added
to $(clean-files) because they are already listed in $(extra-) or
$(extra-y).

Also clean files in "arch/x86/boot" from that directory by allowing
"clean" to descend into the subdir by adding "boot" into $(subdir-).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile                | 24 ++++++++++++------------
 xen/arch/arm/Makefile       |  5 +----
 xen/arch/x86/Makefile       | 18 ++++++++++--------
 xen/arch/x86/boot/Makefile  |  2 ++
 xen/common/Makefile         |  3 +--
 xen/include/Makefile        |  4 +---
 xen/scripts/Kbuild.include  |  2 +-
 xen/scripts/Makefile.clean  | 14 +++++++++++---
 xen/test/livepatch/Makefile |  4 +---
 xen/xsm/flask/Makefile      |  4 +---
 10 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 1a288b87980a..67ced3e92689 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -398,18 +398,18 @@ _debug:
 
 .PHONY: _clean
 _clean:
-	$(MAKE) $(clean) tools
-	$(MAKE) $(clean) include
-	$(MAKE) $(clean) common
-	$(MAKE) $(clean) drivers
-	$(MAKE) $(clean) lib
-	$(MAKE) $(clean) xsm
-	$(MAKE) $(clean) crypto
-	$(MAKE) $(clean) arch/arm
-	$(MAKE) $(clean) arch/riscv
-	$(MAKE) $(clean) arch/x86
-	$(MAKE) $(clean) test
-	$(MAKE) $(clean) tools/kconfig
+	$(Q)$(MAKE) $(clean)=tools
+	$(Q)$(MAKE) $(clean)=include
+	$(Q)$(MAKE) $(clean)=common
+	$(Q)$(MAKE) $(clean)=drivers
+	$(Q)$(MAKE) $(clean)=lib
+	$(Q)$(MAKE) $(clean)=xsm
+	$(Q)$(MAKE) $(clean)=crypto
+	$(Q)$(MAKE) $(clean)=arch/arm
+	$(Q)$(MAKE) $(clean)=arch/riscv
+	$(Q)$(MAKE) $(clean)=arch/x86
+	$(Q)$(MAKE) $(clean)=test
+	$(Q)$(MAKE) $(clean)=tools/kconfig
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 774648d6296e..3a69b5ef6cc3 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -114,7 +114,4 @@ $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 
 $(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
-.PHONY: clean
-clean::
-	rm -f $(obj)/xen.lds
-	rm -f $(abs_objtree)/.xen-syms.[0-9]*
+clean-files := $(objtree)/.xen-syms.[0-9]*
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 85c44c69ff5a..25bf3cc2ac9a 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -78,6 +78,9 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 obj-y += sysctl.o
 endif
 
+# Allows "clean" to descend into boot/
+subdir- += boot
+
 extra-y += asm-macros.i
 extra-y += xen.lds
 
@@ -197,8 +200,8 @@ note_file :=
 endif
 note_file_option ?= $(note_file)
 
+extra-$(XEN_BUILD_PE) += efi.lds
 ifeq ($(XEN_BUILD_PE),y)
-extra-y += efi.lds
 $(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
@@ -257,10 +260,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
 $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
-.PHONY: clean
-clean::
-	rm -f *.lds
-	rm -f asm-macros.i $(abs_objtree)/arch/x86/include/asm/asm-macros.*
-	rm -f $(abs_objtree)/.xen-syms.[0-9]* $(abs_objtree)/.xen.elf32
-	rm -f $(abs_objtree)/.xen.efi.[0-9]* efi/*.efi
-	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
+clean-files := \
+    include/asm/asm-macros.* \
+    $(objtree)/.xen-syms.[0-9]* \
+    $(objtree)/.xen.elf32 \
+    $(objtree)/.xen.efi.[0-9]* \
+    efi/*.efi
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 3580a9b656e8..c2385e69332d 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -49,3 +49,5 @@ $(head-objs): %.S: %.bin
 
 %.lnk: %.o $(src)/build32.lds
 	$(LD) $(LDFLAGS_DIRECT) -N -T $(filter %.lds,$^) -o $@ $<
+
+clean-files := cmdline.S reloc.S *.lnk *.bin
diff --git a/xen/common/Makefile b/xen/common/Makefile
index db78b06f4a50..9208d233642a 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -84,5 +84,4 @@ $(obj)/config_data.S: $(srctree)/tools/binfile FORCE
 	$(call if_changed,binfile,$(obj)/config.gz xen_config_data)
 targets += config_data.S
 
-clean::
-	rm -f config_data.S config.gz 2>/dev/null
+clean-files := config_data.S config.gz
diff --git a/xen/include/Makefile b/xen/include/Makefile
index f5241b70e7fa..c3172f6636be 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -128,6 +128,4 @@ lib-x86-all:
 all: lib-x86-all
 endif
 
-clean::
-	rm -rf compat config generated headers*.chk
-	rm -f $(BASEDIR)/include/xen/lib/x86/cpuid-autogen.h
+clean-files := compat config generated headers*.chk xen/lib/x86/cpuid-autogen.h
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 81abe4b4aa55..862b2a49c5ac 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -98,7 +98,7 @@ build := -f $(srctree)/Rules.mk obj
 # Shorthand for $(MAKE) clean
 # Usage:
 # $(MAKE) $(clean) dir
-clean := -f $(abs_srctree)/scripts/Makefile.clean clean -C
+clean := -f $(srctree)/scripts/Makefile.clean obj
 
 # echo command.
 # Short version is used, if $(quiet) equals `quiet_', otherwise full one.
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index db1d1f918d42..fa3fee758348 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -3,7 +3,6 @@
 # Cleaning up
 # ==========================================================================
 
-obj := .
 src := $(obj)
 
 clean::
@@ -17,11 +16,20 @@ include $(src)/Makefile
 subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
               $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
+subdir-all := $(addprefix $(obj)/,$(subdir-all))
+
 __clean-files := \
     $(clean-files) $(hostprogs-y) $(hostprogs-) \
+    $(extra-y) $(extra-) \
     $(hostprogs-always-y) $(hostprogs-always-)
 
-__clean-files := $(wildcard $(__clean-files))
+# clean-files is given relative to the current directory, unless it
+# starts with $(objtree)/ (which means "./", so do not add "./" unless
+# you want to delete a file from the toplevel object directory).
+
+__clean-files := $(wildcard \
+		   $(addprefix $(obj)/, $(filter-out /% $(objtree)/%, $(__clean-files))) \
+		   $(filter /% $(objtree)/%, $(__clean-files)))
 
 .PHONY: clean
 clean:: $(subdir-all)
@@ -35,6 +43,6 @@ endif
 
 PHONY += $(subdir-all)
 $(subdir-all):
-	$(MAKE) $(clean) $@
+	$(Q)$(MAKE) $(clean)=$@
 
 .PHONY: $(PHONY)
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index 008e89fc9a47..5807a559b42a 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -160,6 +160,4 @@ install: $(addprefix $(obj)/,$(LIVEPATCHES))
 uninstall:
 	cd $(DESTDIR)$(LIVEPATCH_DEBUG_DIR) && rm -f $(LIVEPATCHES)
 
-.PHONY: clean
-clean::
-	rm -f *.livepatch config.h expect_config.h
+clean-files := config.h expect_config.h
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 1da6de2867ae..d655cf8d1974 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -47,6 +47,4 @@ $(obj)/policy.bin: FORCE
 	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common -C $(XEN_ROOT)/tools/flask/policy FLASK_BUILD_DIR=$(FLASK_BUILD_DIR)
 	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
 
-.PHONY: clean
-clean::
-	rm -f $(ALL_H_FILES) policy.* $(POLICY_SRC) flask-policy.S
+clean-files := policy.* $(POLICY_SRC) flask-policy.S
-- 
Anthony PERARD


