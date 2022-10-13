Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365145FDA23
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422134.667991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy4O-00044U-GE; Thu, 13 Oct 2022 13:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422134.667991; Thu, 13 Oct 2022 13:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy4O-00041Y-CN; Thu, 13 Oct 2022 13:16:16 +0000
Received: by outflank-mailman (input) for mailman id 422134;
 Thu, 13 Oct 2022 13:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixuT-0002ig-7w
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:06:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4a10fd2-4af7-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:05:55 +0200 (CEST)
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
X-Inumbo-ID: c4a10fd2-4af7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xNKHGKv0xiseesErXwvSTNU3NRH6cY3P70E/A0khyJY=;
  b=JKkLA/3JYRZ57DEFovQrgvxhRHuhWN83fhFNKB3SbqWS7ATffIxyIo0b
   qdBQ4OL3Sl1egie0WwLmZdoiVsoGRf8tOF6PDPSl+Bmh1zvqRbqBT7Tct
   3Pb4aWGMy/YGQwMN8aHOEdO2hwLlQUeL06O5yhmCDulStlX0BimWCpRXL
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83071582
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z8VRha29XR4Hg1fS1fbD5dZxkn2cJEfYwER7XKvMYLTBsI5bpzECy
 mobXGyCMvmJNmOhfthxaIvj9htX7MTXnYUwSgZppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GpD5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUeocxpUDl/2
 cc3EzAdKQiPrPK66+O0H7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqOIoPTGJUP9qqej
 n3l7kfcUhcUDsa8+Bq/sW2jtuSMhwquDer+E5Xnr6U30TV/3Fc7BBQIWHOhrPK+i0r4XMhQQ
 2QL/gI+oK5081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3rHPhy3jYRk5FkA5ZT9DVQcu89XI8Y5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1QvHNFBz3oRZPmLy8BxkvTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CK2KNoIWOsYuLVXvEMRSiam4hjmFraTRuftnZ
 cfznTiEVx729piLPBLpHrxAgNfHNwg1xH/JRICT8ilLJYG2PSfNIYrpxXPUMYjVGovY/1iOm
 zueXuPWoyhivBrWO3WHrNFCcw5QcBDWx/ne8qRqSwJKGSI+cElJNhMb6e9Jl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:Y6OquKBfZlxZKZLlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="83071582"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [XEN PATCH for-4.17 v5 17/17] tools: Rework linking options for ocaml binding libraries
Date: Thu, 13 Oct 2022 14:05:13 +0100
Message-ID: <20221013130513.52440-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Using a full path to the C libraries when preparing one of the ocaml
binding for those libraries make the binding unusable by external
project. The full path is somehow embedded and reused by the external
project when linking against the binding.

Instead, we will use the proper way to link a library, by using '-l'.
For in-tree build, we also need to provide the search directory via
'-L'.

(The search path -L are still be embedded, but at least that doesn't
prevent the ocaml binding from been used.)

Related-to: xen-project/xen#96
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    This patch only partially resolve xen-project/xen#96. At least with this
    patch, the ocaml binding can be used by external project, but those
    project will still "see" and try to use the rpath and lib search path as
    the -L and -W,-rpath-link are still embedded in the ocaml binding.
    
    I'm working on a more involve series of patch which would remove the
    unnecessary flags. (This would mean that oxenstored and the ocaml test
    will need those ldflags, instead of the binding.)
    
    v5:
    - new patch

 tools/ocaml/libs/eventchn/Makefile   | 2 +-
 tools/ocaml/libs/xc/Makefile         | 2 +-
 tools/ocaml/libs/xentoollog/Makefile | 2 +-
 tools/ocaml/libs/xl/Makefile         | 2 +-
 tools/Rules.mk                       | 8 ++++++++
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/Makefile b/tools/ocaml/libs/eventchn/Makefile
index 7362a28d9e..dc560ba49b 100644
--- a/tools/ocaml/libs/eventchn/Makefile
+++ b/tools/ocaml/libs/eventchn/Makefile
@@ -8,7 +8,7 @@ OBJS = xeneventchn
 INTF = $(foreach obj, $(OBJS),$(obj).cmi)
 LIBS = xeneventchn.cma xeneventchn.cmxa
 
-LIBS_xeneventchn = $(LDLIBS_libxenevtchn)
+LIBS_xeneventchn = $(call xenlibs-ldflags-ldlibs,evtchn)
 
 all: $(INTF) $(LIBS) $(PROGRAMS)
 
diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefile
index 67acc46bee..3b76e9ad7b 100644
--- a/tools/ocaml/libs/xc/Makefile
+++ b/tools/ocaml/libs/xc/Makefile
@@ -10,7 +10,7 @@ OBJS = xenctrl
 INTF = xenctrl.cmi
 LIBS = xenctrl.cma xenctrl.cmxa
 
-LIBS_xenctrl = $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest)
+LIBS_xenctrl = $(call xenlibs-ldflags-ldlibs,ctrl guest)
 
 xenctrl_OBJS = $(OBJS)
 xenctrl_C_OBJS = xenctrl_stubs
diff --git a/tools/ocaml/libs/xentoollog/Makefile b/tools/ocaml/libs/xentoollog/Makefile
index 9ede2fd124..1645b40faf 100644
--- a/tools/ocaml/libs/xentoollog/Makefile
+++ b/tools/ocaml/libs/xentoollog/Makefile
@@ -13,7 +13,7 @@ OBJS = xentoollog
 INTF = xentoollog.cmi
 LIBS = xentoollog.cma xentoollog.cmxa
 
-LIBS_xentoollog = $(LDLIBS_libxentoollog)
+LIBS_xentoollog = $(call xenlibs-ldflags-ldlibs,toollog)
 
 xentoollog_OBJS = $(OBJS)
 xentoollog_C_OBJS = xentoollog_stubs
diff --git a/tools/ocaml/libs/xl/Makefile b/tools/ocaml/libs/xl/Makefile
index 7c1c4edced..22d6c93aae 100644
--- a/tools/ocaml/libs/xl/Makefile
+++ b/tools/ocaml/libs/xl/Makefile
@@ -15,7 +15,7 @@ LIBS = xenlight.cma xenlight.cmxa
 
 OCAMLINCLUDE += -I ../xentoollog
 
-LIBS_xenlight = $(LDLIBS_libxenlight)
+LIBS_xenlight = $(call xenlibs-ldflags-ldlibs,light)
 
 xenlight_OBJS = $(OBJS)
 xenlight_C_OBJS = xenlight_stubs
diff --git a/tools/Rules.mk b/tools/Rules.mk
index a165dc4bda..34d495fff7 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -113,6 +113,14 @@ define xenlibs-ldflags
     $(foreach lib,$(1),-L$(XEN_ROOT)/tools/libs/$(lib))
 endef
 
+# Flags for linking against all Xen libraries listed in $(1) but by making use
+# of -L and -l instead of providing a path to the shared library.
+define xenlibs-ldflags-ldlibs
+    $(call xenlibs-ldflags,$(1)) \
+    $(foreach lib,$(1), -l$(FILENAME_$(lib))) \
+    $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
+endef
+
 define LIB_defs
  FILENAME_$(1) ?= xen$(1)
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
-- 
Anthony PERARD


