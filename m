Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A954C487E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279254.476956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKX-0007wE-2w; Fri, 25 Feb 2022 15:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279254.476956; Fri, 25 Feb 2022 15:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKW-0007u8-Sn; Fri, 25 Feb 2022 15:16:24 +0000
Received: by outflank-mailman (input) for mailman id 279254;
 Fri, 25 Feb 2022 15:16:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIW-0006fy-S9
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98e5e580-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:17 +0100 (CET)
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
X-Inumbo-ID: 98e5e580-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d3piZxqZuNJB/VZp7MMLQLrSEQWkmz/CgMBBNprZ0OE=;
  b=Cy0HYOMWQDvMGGVrqAMhikKvWzPoj9PcC1XZuF4iZUpw5uMzHhBkQz+E
   c11FArnhk54Mgx6ZDCnnBGwZsweSdgyPRi8SNC+K4nv9xs5+zkzzS5oxS
   h5b+tc1OeEQ4QJiTBjNjAABhP5J+gkkK1F5+zi40+EKGTlc72neMEs3FL
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64433086
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ugzeC6BqjmufXRVW/yDjw5YqxClBgxIJ4kV8jS/XYbTApD4r0TYPy
 jAaCG/TPPeDMWajLtt+a4S/9UlVscXXn4I1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhAl
 IpBuJaiaz50N7XgtMIxECJoAyVhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4SQa2FP
 5pHAdZpRDP4RBFSGGwzNI4nzbmagF/ELTNA9GvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru5G38HxwecsCfyDCM73awruLJhmb/SYUUUrqi+ZZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILlv1mVC2IWbAccYcQKmOkaBgcax
 luWyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi8XBm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNrIJrVil
 CJd8yR70AzoJcvc/MBqaL9QdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 BKM5VoNuccLZCPCgUpLj2SZUZVCIU/IT4mNaxwpRoAWPsgZmPGvpkmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacidiBqVcir8JUMLoZu4GNOQQkcNhMY+pt5E6QNokifvrygE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:cZOTB6rBSZWrKJwZSx7rYJYaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64433086"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 24/29] stubdom: introduce xenlibs.mk
Date: Fri, 25 Feb 2022 15:13:16 +0000
Message-ID: <20220225151321.44126-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This new makefile will be used to build libraries that provides
"Makefile.common".

At some point, we will be converting Makefile in tools/ to "subdirmk"
and stubdom build will not be able to use those new makefiles, so we
will put the necessary information for stubdom to build the xen
libraries into a new Makefile.common and xenlibs.mk will use it.
We only need to build static libraries and don't need anything else.

The check for the presence of "Makefile.common" will go aways once
there is one for all libraries used by stubdom build.

Also remove DESTDIR= from "clean" targets, we don't do installation in
this recipe so the value of DESTDIR doesn't matter.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---

Notes:
    v2:
    - reviewed

 stubdom/Makefile   |  9 +++++++--
 stubdom/xenlibs.mk | 13 +++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 stubdom/xenlibs.mk

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 5fb5dbc341..fba4c977ef 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -346,6 +346,7 @@ define do_links
   cd $(dir $@); \
   ln -sf $(dir $<)include/*.h include/; \
   ln -sf $(dir $<)*.[ch] .; \
+  [ -e $(dir $<)Makefile.common ] && ln -sf $(dir $<)Makefile.common . ||:; \
   ln -sf $(dir $<)Makefile .
   touch $@
 endef
@@ -355,10 +356,14 @@ define BUILD_lib
  libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE) .phony
-	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y -C $$(@D) $$(@F)
+	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y $$(if $$(wildcard $$(@D)/Makefile.common),-f $(CURDIR)/xenlibs.mk) -C $$(@D) $$(@F)
 
  clean-libxen$(1):
-	[ ! -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ] || $$(MAKE) DESTDIR= -C libs-$$(XEN_TARGET_ARCH)/$(1) clean
+	if [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile.common ]; then \
+	    $$(MAKE) -f $(CURDIR)/xenlibs.mk -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
+	elif [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ]; then \
+	    $$(MAKE) -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
+	fi
 
  libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile
 	$$(do_links)
diff --git a/stubdom/xenlibs.mk b/stubdom/xenlibs.mk
new file mode 100644
index 0000000000..5c8742ccf9
--- /dev/null
+++ b/stubdom/xenlibs.mk
@@ -0,0 +1,13 @@
+include $(XEN_ROOT)/tools/Rules.mk
+
+include Makefile.common
+
+LIBNAME := $(notdir $(CURDIR))
+FILENAME_$(LIBNAME) ?= xen$(LIBNAME)
+LIB_FILE_NAME = $(FILENAME_$(LIBNAME))
+
+lib$(LIB_FILE_NAME).a: $(OBJS-y)
+	$(AR) rc $@ $^
+
+clean::
+	rm -f $(OBJS-y) lib$(LIB_FILE_NAME).a
-- 
Anthony PERARD


