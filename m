Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5385FD9D9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422028.667903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixuB-0004a8-A3; Thu, 13 Oct 2022 13:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422028.667903; Thu, 13 Oct 2022 13:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixuB-0004X3-1K; Thu, 13 Oct 2022 13:05:43 +0000
Received: by outflank-mailman (input) for mailman id 422028;
 Thu, 13 Oct 2022 13:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixu9-0002ig-7K
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc1fc814-4af7-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:05:39 +0200 (CEST)
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
X-Inumbo-ID: bc1fc814-4af7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fSnLDaFN3eqPfaJnrSLExq/lPHWyHgAYLE/INZekA2E=;
  b=ZZBbk9BwfzBE5rAHq1K1Hz9isJTRYuJBCDEbu05tOaaSKBoGEbntYOKv
   zDJ3sFPlbZ5n9qk1U8hGnKkLVJ9lvuk2d/wgXXuouZqk+WgZpF0075A12
   06J7EF0IgwQbS92J0d1WtUZ3piWcHpEQJLk127W/RQQ5SduKP1spD+omq
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82635816
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xURsA61h2C0wsxFx8fbD5e1xkn2cJEfYwER7XKvMYLTBsI5bpzNVn
 GIZCzrUM/iMNmX9edFyYdnk9xkA65+DytZgGQtqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GpD5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUjqsdQJX9+6
 sYmdjILcB/TobmP+uOCH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqPJIfXFZwL9qqej
 lLn417oMw06DdOk8zGM9iORo+LfujyuDer+E5Xnr6U30TV/3Fc7EwYKXFG2pf24jE+WWN9FL
 UEQvC00osAa60iDXtT7GRqirxasvBEGXMFLO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/HhvYUygxTnXttlVqmvgbXI9SrYm
 m7Q6nJk3vNK0JBNh/7TEU37byyEncjoaSor1hrtYDyn6B12NKj+Xrb50A2OhRpfF7qxQl6Et
 XkCvsGR6uESEJ2A/BCwrPUx8KKBvKjcbmCF6bJ7N9x4rmn2pSb/FWxFyGsmTHqFJProbtMAj
 KX7nQpKrKFeM3KxBUOcS9LgUp96pUQM+DmMaxw1UjasSsIsHONk1Hs0DaJ144wKuBlErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr5jOTGPCbNF+hcajNii9zVC4vd+W3oH
 yt3bZPWm32zrsWkCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJbJY3VMNeImOtJRmCQt/4K/gs+1
 i3iBxQwJZuWrSGvFDhmnVg6NOOyAsch8yhmVcHuVH7xs0UejU+UxP93X/MKkXMProSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:Cib1kKoY5NRo6t2OBs0jWwcaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82635816"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH for-4.17 v5 10/17] libs: Fix auto-generation of version-script for unstable libs
Date: Thu, 13 Oct 2022 14:05:06 +0100
Message-ID: <20221013130513.52440-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When there isn't a version-script for a shared library (like for
unstable libs), we create one based on the current Xen version. But
that version-script became out-of-date as soon as Xen's version
changes and make as no way to regenerate the version-script on
rebuild.

In order to allow regenerating the script, we'll have a different
filename. In order to check if the content is up-to-date, we'll always
generated it and compare.

But we also need to know if there's already an existing version script
or if we need to generate one, for that we introduce $(version-script)
to be used to point to the path of the existing script. (Guessing if a
version script exist for a stable library with for example $(wildcard)
won't work as a file will exist when building the library without this
patch.)

We don't need the version-script unless we are making the shared
library so it is removed from the "all" target.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Alternatively, we could remove the need for to generate a
version-script, but that would mean the exported symbols won't have a
version anymore (like before, a few versions of Xen ago). Or, we could
use --default-symver, but the symboled would be versionned with the
soname (e.g. "libxenctrl.so.4.16.0") instead of "VERS_4.16.0".
---

Notes:
    v4:
    - new patch

 tools/libs/call/Makefile          |  1 +
 tools/libs/ctrl/Makefile          |  3 ---
 tools/libs/devicemodel/Makefile   |  1 +
 tools/libs/evtchn/Makefile        |  1 +
 tools/libs/foreignmemory/Makefile |  1 +
 tools/libs/gnttab/Makefile        |  1 +
 tools/libs/guest/Makefile         |  3 ---
 tools/libs/hypfs/Makefile         |  1 +
 tools/libs/light/Makefile         |  1 -
 tools/libs/stat/Makefile          |  2 +-
 tools/libs/store/Makefile         |  1 +
 tools/libs/toolcore/Makefile      |  1 +
 tools/libs/toollog/Makefile       |  1 +
 tools/libs/util/Makefile          |  3 ---
 tools/libs/vchan/Makefile         |  3 ---
 tools/libs/libs.mk                | 19 +++++++++++++------
 .gitignore                        |  6 ------
 17 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 103f5ad360..56a964b517 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 3
+version-script := libxencall.map
 
 include Makefile.common
 
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 93442ab389..094e84b8d8 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -10,6 +10,3 @@ PKG_CONFIG_NAME := Xencontrol
 NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-clean::
-	rm -f libxenctrl.map
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index b70dd774e4..20d1d112e7 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 4
+version-script := libxendevicemodel.map
 
 include Makefile.common
 
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index 3dad3840c6..18cdaab89e 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 2
+version-script := libxenevtchn.map
 
 include Makefile.common
 
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index b70dd774e4..81398e88b1 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 4
+version-script := libxenforeignmemory.map
 
 include Makefile.common
 
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index 3dad3840c6..4528830bdc 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 2
+version-script := libxengnttab.map
 
 include Makefile.common
 
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 19d3ff2fdb..93338a9301 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -14,6 +14,3 @@ NO_HEADERS_CHK := y
 include $(XEN_ROOT)/tools/libs/libs.mk
 
 libxenguest.so.$(MAJOR).$(MINOR): LDLIBS += $(ZLIB_LIBS) -lz
-
-clean::
-	rm -f libxenguest.map
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index 630e1e6f3e..7fae5c750d 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 0
+version-script := libxenhypfs.map
 
 LDLIBS += -lz
 
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 13545654c2..1d5716dbba 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -252,6 +252,5 @@ clean::
 	$(RM) testidl.c.new testidl.c *.api-ok
 	$(RM) $(TEST_PROGS) libxenlight_test.so libxl_test_*.opic
 	$(RM) -r __pycache__
-	$(RM) libxenlight.map
 	$(RM) $(AUTOSRCS) $(AUTOINCS)
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 7eaf50e91e..ee5c42bf7b 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -134,4 +134,4 @@ uninstall:: uninstall-perl-bindings
 endif
 
 clean::
-	$(RM) libxenstat.map $(BINDINGS) $(BINDINGSRC)
+	$(RM) $(BINDINGS) $(BINDINGSRC)
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 2334c953bb..300c271eb0 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR = 4
 MINOR = 0
+version-script := libxenstore.map
 
 ifeq ($(CONFIG_Linux),y)
 LDLIBS += -ldl
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 0d92b68b3b..20671dadd0 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
+version-script := libxentoolcore.map
 
 LIBHEADER := xentoolcore.h
 
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index 2361b8cbf1..d612227c85 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
+version-script := libxentoollog.map
 
 include Makefile.common
 
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 493d2e00be..e016baf888 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -47,6 +47,3 @@ $(OBJS-y) $(PIC_OBJS): $(AUTOINCS)
 %.c %.h:: %.l
 	@rm -f $*.[ch]
 	$(FLEX) --header-file=$*.h --outfile=$*.c $<
-
-clean::
-	$(RM) libxenutil.map
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index ac2bff66f5..a1ef60ac8e 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -11,6 +11,3 @@ OBJS-y += io.o
 NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-clean::
-	rm -f libxenvchan.map
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 3eb91fc8f3..cab8e9704a 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -4,6 +4,8 @@
 #   PKG_CONFIG: name of pkg-config file (xen$(LIBNAME).pc if empty)
 #   MAJOR:   major version of lib (Xen version if empty)
 #   MINOR:   minor version of lib (0 if empty)
+#   version-script: Specify the name of a version script to the linker.
+#     (If empty, a temporary one for unstable library is created)
 
 LIBNAME := $(notdir $(CURDIR))
 
@@ -12,6 +14,10 @@ MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 endif
 MINOR ?= 0
 
+ifeq ($(origin version-script), undefined)
+version-script := libxen$(LIBNAME).map.tmp
+endif
+
 CFLAGS   += -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
@@ -53,7 +59,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
+all: $(TARGETS) $(PKG_CONFIG_LOCAL) $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
 all: headers.chk
@@ -71,8 +77,9 @@ headers.lst: FORCE
 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
 	@$(call move-if-changed,$@.tmp,$@)
 
-libxen$(LIBNAME).map:
-	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
+libxen$(LIBNAME).map.tmp: FORCE
+	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >.$@.tmp
+	$(call move-if-changed,.$@.tmp,$@)
 
 lib$(LIB_FILE_NAME).a: $(OBJS-y)
 	$(AR) rc $@ $^
@@ -82,8 +89,8 @@ lib$(LIB_FILE_NAME).so: lib$(LIB_FILE_NAME).so.$(MAJOR)
 lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
-lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=libxen$(LIBNAME).map $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
+lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) $(version-script)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=$(version-script) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
@@ -122,7 +129,7 @@ TAGS:
 clean::
 	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
-	rm -f headers.chk headers.lst
+	rm -f headers.chk headers.lst libxen*.map.tmp
 
 .PHONY: distclean
 distclean: clean
diff --git a/.gitignore b/.gitignore
index 418bdfaebf..7febfc224d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -106,8 +106,6 @@ tools/config.cache
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
-tools/libs/ctrl/libxenctrl.map
-tools/libs/guest/libxenguest.map
 tools/libs/guest/xc_bitops.h
 tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
@@ -117,7 +115,6 @@ tools/libs/light/_*.[ch]
 tools/libs/light/*.pyc
 tools/libs/light/_libxl.api-for-check
 tools/libs/light/*.api-ok
-tools/libs/light/libxenlight.map
 tools/libs/light/libxl-save-helper
 tools/libs/light/dsdt*
 tools/libs/light/mk_dsdt
@@ -127,13 +124,10 @@ tools/libs/light/testidl.c
 tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
-tools/libs/stat/libxenstat.map
 tools/libs/store/list.h
 tools/libs/store/utils.h
 tools/libs/store/xs_lib.c
 tools/libs/util/libxlu_cfg_y.output
-tools/libs/util/libxenutil.map
-tools/libs/vchan/libxenvchan.map
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdb/gdb-6.2.1.tar.bz2
-- 
Anthony PERARD


