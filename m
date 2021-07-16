Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C3F3CB76C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 14:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157163.290087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4N6m-0002uB-8A; Fri, 16 Jul 2021 12:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157163.290087; Fri, 16 Jul 2021 12:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4N6m-0002rg-4u; Fri, 16 Jul 2021 12:38:24 +0000
Received: by outflank-mailman (input) for mailman id 157163;
 Fri, 16 Jul 2021 12:38:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KHJG=MI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m4N6k-0002rY-2v
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 12:38:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a4dfd1a-a215-4e34-a052-ffc33b7e2bc4;
 Fri, 16 Jul 2021 12:38:20 +0000 (UTC)
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
X-Inumbo-ID: 5a4dfd1a-a215-4e34-a052-ffc33b7e2bc4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626439100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=azorGvvnspgDnvbmo5EIJBsJCYiGcu1/jeYXmhc3Sao=;
  b=hXpUaArSgUDkUlAvNXXlw4kfGolzVcS468WZp56z3gvbHBksbLZ0OV2w
   y3VLeytPSODJMfVeo3cgN7ZSJe85hDMnaorftKV0PxHv0mnhm+ff3WEOJ
   iMtdM2DJxSrvNyKGCEfEmAiQ46BBVoYOzBdC5nhxIAFFuQK3qQngZBDHA
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: d0i5hlDDdkuS1jW/SZH+dj5FOAGRhLn3YoAu0aAJuiRWqU5YwrWy3NJfcS1wwul7wE/h7aWHRw
 QJLvsNnPNYRU5mp5d8yltE2+KiYoS8QmUq0GyAcT5kiGPRBwPqR7TDP+MU7pkrT+4j6cxAEZxN
 SNfUwN5qmdo1VuxBo1uFK3qkYbVEFyhusfu83tPgyTaNdXErLe9ZbN/bkneFPeFboY10aQ2pI8
 SIqFM/t+2BKAlQ6SpXSMrb+trLlhXhsGX0AAfUT6Tld4wYYmA0VWzE2usJPpHtEk2RNIJJD2B3
 TSM=
X-SBRS: 5.1
X-MesageID: 48125581
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rBC09qlRUAYYIVjZWXQoZl/ymvLpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.84,244,1620705600"; 
   d="scan'208";a="48125581"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy binary is available
Date: Fri, 16 Jul 2021 13:38:12 +0100
Message-ID: <20210716123812.494081-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714161734.256246-1-anthony.perard@citrix.com>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will help prevent the CI loop from having build failures when
`checkpolicy` isn't available, when doing "randconfig" jobs.

Also, move the check out of Config.mk and into xen/ build system.
Nothing in tools/ is using that information as it's done by
./configure.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
We might want to have a new Makefile for this kind of check that
Kconfig is going to use, just to keep the main Makefile a bit cleaner.
But maybe another time, if more are comming.

v2:
- move check to Makefile
---
 Config.mk          | 6 ------
 xen/Makefile       | 4 ++++
 xen/common/Kconfig | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/Config.mk b/Config.mk
index d08fa8d60dd7..97d3633706b3 100644
--- a/Config.mk
+++ b/Config.mk
@@ -137,12 +137,6 @@ export XEN_HAS_BUILD_ID=y
 build_id_linker := --build-id=sha1
 endif
 
-ifndef XEN_HAS_CHECKPOLICY
-    CHECKPOLICY ?= checkpolicy
-    XEN_HAS_CHECKPOLICY := $(shell $(CHECKPOLICY) -h 2>&1 | grep -q xen && echo y || echo n)
-    export XEN_HAS_CHECKPOLICY
-endif
-
 define buildmakevars2shellvars
     export PREFIX="$(prefix)";                                            \
     export XEN_SCRIPT_DIR="$(XEN_SCRIPT_DIR)";                            \
diff --git a/xen/Makefile b/xen/Makefile
index 8023680ffbf2..045ddb18ad68 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -17,6 +17,8 @@ export XEN_BUILD_HOST	?= $(shell hostname)
 PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
+export CHECKPOLICY	?= checkpolicy
+
 export BASEDIR := $(CURDIR)
 export XEN_ROOT := $(BASEDIR)/..
 
@@ -156,6 +158,8 @@ CFLAGS += $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
+export HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
+
 export root-make-done := y
 endif # root-make-done
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11af3..a5ef3814f531 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -235,8 +235,8 @@ config XSM_FLASK_AVC_STATS
 
 config XSM_FLASK_POLICY
 	bool "Compile Xen with a built-in FLASK security policy"
-	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
-	depends on XSM_FLASK
+	default y
+	depends on XSM_FLASK && "$(HAS_CHECKPOLICY)"
 	---help---
 	  This includes a default XSM policy in the hypervisor so that the
 	  bootloader does not need to load a policy to get sane behavior from an
-- 
Anthony PERARD


