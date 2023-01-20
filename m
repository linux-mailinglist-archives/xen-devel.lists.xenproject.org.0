Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79716675E4A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482110.747492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxK1-0000Ne-C7; Fri, 20 Jan 2023 19:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482110.747492; Fri, 20 Jan 2023 19:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxK1-0000KS-8B; Fri, 20 Jan 2023 19:45:09 +0000
Received: by outflank-mailman (input) for mailman id 482110;
 Fri, 20 Jan 2023 19:45:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIxK0-0006vE-Ca
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:45:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efe55da1-98fa-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 20:45:06 +0100 (CET)
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
X-Inumbo-ID: efe55da1-98fa-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674243906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=czljIDkPlFECumG7RW3BRd1WcvEq3rBtflkOOFMBXuk=;
  b=L9TkPakuEwcpPhaVlAdEo3F4GCluaY577X5AP4Q4IQoPokZDu/Lqifwy
   eEbJesvTDEj2jusmIx1VGIbq26ZoxAOJLXOiTrL4B+asXNVM9Xv0lW/wi
   LotfjsLEUVMkeg5SU+YuyfAFIzHnBaRSR88B5B5vdMnLXPXu6HMFTz1wg
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93989459
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ze4jb681pHhkaKnqqM2hDrUDl36TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2QfWGiCP/uKYjD8fNx3O9/i9RsEuZfSmtNhTAo9qCo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKoT5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklup
 KYSKjMUaiyvqPC65++mYbhz3c8KeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0ExRfI9
 z6brgwVBDk5C4eC0X2f/kmN2PLtuB28froMRI+Bo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80ight68p72SwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9DT5Yby0HVA85z/bxrKZukzmeUY1oOfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWy13N2YDB0xWvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMYYUOcksLV/bpHkGiausM4bFyhBEfUYXY
 MfzTCpRJSxCVfQPIMSeGY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrfaclo7Qzt9V6S5LHFIU9UNopm5X9zgp
 hmVMnK0AnKk2xUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:q5bd6653bndodm+OHQPXweWCI+orL9Y04lQ7vn2ZFiYlFfBwxv
 re+MjziyWE7Qr5AEtQ6+xpOMG7MAnhHO1OkPws1NaZLUrbUQ6TR72KgrGSvQEIdxeOjtK1kJ
 0QAJSWa+eAT2SS7/yKkTVQeuxIqKjkgcbY/Ns2jU0dPT2CAJsQkjuRfzzrbXGeMzM2eabReq
 DsnfavoQDBCBcqhzqAaUXtpNKvmzQ2rvPbiOQ9bSLPFzPjsdpU0tDHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+5g7A23TV55F2nsKk7tdYHsSDhuUcNz2p02+TFcBccozHmApwjPCk6V4snt
 WJixA8P/5r43eUUnCprQDr0wzA1i9rz3P501eXjVbqvMS8bjMnDMhqg55fb3Limg8dleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kMYI5kYvF7c2Wft0l8gy7UlVGJAPEGbR84Y8Ct
 RjC8na+bJ/bU6aVXbEpWNiqebcB0jbXy32GnTqiPbliQS+r0oJknfwA/ZvwkvowahNEKWsId
 60bZiA2os+EPP+JpgNcNvpCfHHfVAlByi8d156aG6XYp0vKjbDrYX6764y4/zvcJsUzIEqkJ
 CES19As3UuEnieR/Fm8ac7viwlel/NEgjF24Vb/dx0q7f8TL3kPWmKT00vidKpp7EaDtfAU/
 i+NZpKC7u7RFGeWbphzkn7Qd1fOHMeWMoatpIyXE+PuNvCLsnvuvbAePjeKbLxGXIvW3/5AH
 EEQD/vTf8wr3yDSzv9mlzcSnntckvw8dZ5F7Xb5fEazMwXOohFomEu+BmEDwGwWHd/W4ANDQ
 BDyenc4+qGTEGNjC7101k=
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="93989459"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v6 5/5] tools: Rework $(xenlibs-ldlibs, ) to provide library flags only.
Date: Fri, 20 Jan 2023 19:44:31 +0000
Message-ID: <20230120194431.55922-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120194431.55922-1-anthony.perard@citrix.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

LDLIBS is usually only the library flags (that is the `-l` flags), as
proposed in GNU make manual, while LDFLAGS would be extra flags such
as `-L`.

Rework the make macro $(xenlibs-ldlibs, ) to only provide the library
flags. $(xenlibs-ldflags, ) already only provide the extra flags like
the -rpath-link flags.

Also fix "test_%" recipe in libs/light as "libxenlight.so" in
$(LDLIBS_libxenlight) is been replaced by "-lxenlight". Instead of
just changing the filter, we will start using the $(xenlibs-*,) macro.
For LDFLAGS, we only needs the one for libxenlight, as the one for
toolcore and toollog are already in $(LDFLAGS), they are dependencies
to build libxenlight.so.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v6:
    - new patch

 tools/console/client/Makefile |  1 +
 tools/console/daemon/Makefile |  1 +
 tools/helpers/Makefile        |  3 +++
 tools/libs/light/Makefile     |  2 +-
 tools/Rules.mk                | 16 +++++++---------
 tools/libs/libs.mk            |  1 +
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
index 071262c9ae..ea7819c03e 100644
--- a/tools/console/client/Makefile
+++ b/tools/console/client/Makefile
@@ -6,6 +6,7 @@ USELIBS := ctrl store
 CFLAGS += $(call xenlibs-cflags,$(USELIBS))
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
+LDFLAGS += $(call xenlibs-ldflags,$(USELIBS))
 LDLIBS += $(call xenlibs-ldlibs,$(USELIBS))
 LDLIBS += $(SOCKET_LIBS)
 
diff --git a/tools/console/daemon/Makefile b/tools/console/daemon/Makefile
index e53c874eee..400611fc2d 100644
--- a/tools/console/daemon/Makefile
+++ b/tools/console/daemon/Makefile
@@ -7,6 +7,7 @@ CFLAGS += $(call xenlibs-cflags,$(USELIBS))
 CFLAGS-$(CONFIG_ARM) += -DCONFIG_ARM
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
+LDFLAGS += $(call xenlibs-ldflags,$(USELIBS))
 LDLIBS += $(call xenlibs-ldlibs,$(USELIBS))
 LDLIBS += $(SOCKET_LIBS)
 LDLIBS += $(UTIL_LIBS)
diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 0d4df01365..5db88dc81b 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -18,17 +18,20 @@ endif
 XEN_INIT_DOM0_USELIBS := ctrl toollog store light
 XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(call xenlibs-cflags,$(XEN_INIT_DOM0_USELIBS))
+xen-init-dom0: LDFLAGS += $(call xenlibs-ldflags,$(XEN_INIT_DOM0_USELIBS))
 xen-init-dom0: LDLIBS += $(call xenlibs-ldlibs,$(XEN_INIT_DOM0_USELIBS))
 
 INIT_XENSTORE_DOMAIN_USELIBS := toollog store ctrl guest light
 INIT_XENSTORE_DOMAIN_OBJS = init-xenstore-domain.o init-dom-json.o
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(call xenlibs-cflags,$(INIT_XENSTORE_DOMAIN_USELIBS))
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
+init-xenstore-domain: LDFLAGS += $(call xenlibs-ldflags,$(INIT_XENSTORE_DOMAIN_USELIBS))
 init-xenstore-domain: LDLIBS += $(call xenlibs-ldlibs,$(INIT_XENSTORE_DOMAIN_USELIBS))
 
 INIT_DOM0LESS_USELIBS := ctrl evtchn toollog store light guest foreignmemory
 INIT_DOM0LESS_OBJS = init-dom0less.o init-dom-json.o
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(call xenlibs-cflags,$(INIT_DOM0LESS_USELIBS))
+init-dom0less: LDFLAGS += $(call xenlibs-ldflags,$(INIT_DOM0LESS_USELIBS))
 init-dom0less: LDLIBS += $(call xenlibs-ldlibs,$(INIT_DOM0LESS_USELIBS))
 
 .PHONY: all
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 96daeabc47..273f3d0864 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -244,7 +244,7 @@ libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 test_%: test_%.o test_common.o libxenlight_test.so
-	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $(call xenlibs-ldflags,light) -o $@ $^ $(call xenlibs-ldlibs,toollog toolcore) -lyajl $(APPEND_LDFLAGS)
 
 libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
diff --git a/tools/Rules.mk b/tools/Rules.mk
index d7c1f61cdf..007a64f2f5 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -105,12 +105,6 @@ define xenlibs-libs
         $(XEN_ROOT)/tools/libs/$(lib)/lib$(FILENAME_$(lib))$(libextension))
 endef
 
-# Flags for linking against all Xen libraries listed in $(1)
-define xenlibs-ldlibs
-    $(call xenlibs-rpath,$(1)) $(call xenlibs-libs,$(1)) \
-    $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
-endef
-
 # Provide needed flags for linking an in-tree Xen library by an external
 # project (or when it is necessary to link with "-lxen$(1)" instead of using
 # the full path to the library).
@@ -119,12 +113,16 @@ define xenlibs-ldflags
     $(foreach lib,$(1),-L$(XEN_ROOT)/tools/libs/$(lib))
 endef
 
+# Flags for linking against all Xen libraries listed in $(1)
+define xenlibs-ldlibs
+    $(foreach lib,$(1),-l$(FILENAME_$(lib)) $(xenlibs-ldlibs-$(lib)))
+endef
+
 # Flags for linking against all Xen libraries listed in $(1) but by making use
 # of -L and -l instead of providing a path to the shared library.
 define xenlibs-ldflags-ldlibs
     $(call xenlibs-ldflags,$(1)) \
-    $(foreach lib,$(1), -l$(FILENAME_$(lib))) \
-    $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
+    $(call xenlibs-ldlibs,$(1))
 endef
 
 define LIB_defs
@@ -132,7 +130,7 @@ define LIB_defs
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
  CFLAGS_libxen$(1) = $$(CFLAGS_xeninclude)
  SHLIB_libxen$(1) = $$(call xenlibs-rpath,$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
- LDLIBS_libxen$(1) = $$(call xenlibs-ldlibs,$(1))
+ LDLIBS_libxen$(1) = $$(call xenlibs-ldflags,$(1)) $$(call xenlibs-ldlibs,$(1))
 endef
 
 $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 0e4b5e0bd0..fc6aa7ede9 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -17,6 +17,7 @@ CFLAGS   += -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
+LDFLAGS += $(call xenlibs-ldflags,$(USELIBS_$(LIBNAME)))
 LDLIBS += $(call xenlibs-ldlibs,$(USELIBS_$(LIBNAME)))
 
 PIC_OBJS := $(OBJS-y:.o=.opic)
-- 
Anthony PERARD


