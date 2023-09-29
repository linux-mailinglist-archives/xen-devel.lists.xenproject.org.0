Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D47B2D54
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610253.949609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Ov-00023y-RT; Fri, 29 Sep 2023 07:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610253.949609; Fri, 29 Sep 2023 07:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Ov-000207-NX; Fri, 29 Sep 2023 07:59:05 +0000
Received: by outflank-mailman (input) for mailman id 610253;
 Fri, 29 Sep 2023 07:59:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qm8Ou-0001xN-4o
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:59:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm8Ot-000083-DJ; Fri, 29 Sep 2023 07:59:03 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm8Ot-0002Zh-5J; Fri, 29 Sep 2023 07:59:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=FOdLbJYKeSslSGIaMrvCRYHWhhpxx90C/bQZ5zISIQI=; b=u/0jA1qVIXVS8zEwMhlCOzZqjX
	r01CfJlf3yA0+Z2vNgifuX11nupvNkqcKW2STarnuJkS+jHpnWFxGo5qF75mhqaHi+PW8mfTk0NNN
	7xcKrEchO0eJ7ngUIyfZWjnEHK/Jx1mwKzfbMNLS/0CmlXjR9D7wjY9qXUXxr6jDOEmc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] Update Xen version to 4.18-rc
Date: Fri, 29 Sep 2023 08:58:57 +0100
Message-Id: <20230929075857.87092-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929075857.87092-1-julien@xen.org>
References: <20230929075857.87092-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 README       | 16 ++++++++--------
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/README b/README
index a491c8dce55b..f45e1ef1cdca 100644
--- a/README
+++ b/README
@@ -1,11 +1,11 @@
-###############################################
-__  __            _  _    _  ___
-\ \/ /___ _ __   | || |  / |( _ )
- \  // _ \ '_ \  | || |_ | |/ _ \
- /  \  __/ | | | |__   _|| | (_) |
-/_/\_\___|_| |_|    |_|(_)_|\___/
-
-###############################################
+#################################################
+                  _  _    _  ___
+__  _____ _ __   | || |  / |( _ )       _ __ ___
+\ \/ / _ \ '_ \  | || |_ | |/ _ \ _____| '__/ __|
+ >  <  __/ | | | |__   _|| | (_) |_____| | | (__
+/_/\_\___|_| |_|    |_|(_)_|\___/      |_|  \___|
+
+#################################################
 
 https://www.xen.org/
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 3461f5cf2fe3..44dbd4f19040 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.18-unstable
+    Xen-Version: 4.18-rc
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
diff --git a/xen/Makefile b/xen/Makefile
index 2dc5e3526de9..fd0e63d29efb 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 18
-export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= -rc$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
-- 
2.40.1


