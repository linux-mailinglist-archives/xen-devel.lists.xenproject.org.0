Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0136A5F75D8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 11:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417501.662231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjQV-0005PZ-Bo; Fri, 07 Oct 2022 09:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417501.662231; Fri, 07 Oct 2022 09:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjQV-0005Lq-7X; Fri, 07 Oct 2022 09:13:51 +0000
Received: by outflank-mailman (input) for mailman id 417501;
 Fri, 07 Oct 2022 09:13:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ogjQT-000558-Mr
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 09:13:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogjQT-0005sG-Es; Fri, 07 Oct 2022 09:13:49 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogjQT-0000mx-6z; Fri, 07 Oct 2022 09:13:49 +0000
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
	bh=zhLXyn1eLPgxTWR3iixnzmV5WGnFG/Li12mmliMaC5s=; b=irH81NaMHgcHl4I6v2HMqcJnSq
	3eCOaBCm9xt4aFO/4aGy0b2RjFu8DsEd1HP+O4HV3pSHLbUcGZTBei017m5K7x988rWWo8g07wGI3
	6da6sumyk6EjQI+eAmSVLwWtfMSb1MN+mWMh7U/8s7UwC/4VSjWkxqx7y9fCFbfU0/kI=;
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
Subject: [PATCH 3/3] Update Xen version to 4.17-rc
Date: Fri,  7 Oct 2022 10:13:41 +0100
Message-Id: <20221007091341.58542-4-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221007091341.58542-1-julien@xen.org>
References: <20221007091341.58542-1-julien@xen.org>
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
index 89a1d0b43c4c..2fdca8861bef 100644
--- a/README
+++ b/README
@@ -1,11 +1,11 @@
-############################################################
-__  __                                _        _     _
-\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
- \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
- /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
-/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
-
-############################################################
+###############################################
+__  __            _  _    _ _____
+\ \/ /___ _ __   | || |  / |___  |    _ __ ___
+ \  // _ \ '_ \  | || |_ | |  / /____| '__/ __|
+ /  \  __/ | | | |__   _|| | / /_____| | | (__
+/_/\_\___|_| |_|    |_|(_)_|/_/      |_|  \___|
+
+###############################################
 
 https://www.xen.org/
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 29f74ac5063e..cf2ddfacaf09 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: unstable
+    Xen-Version: 4.17-rc
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
diff --git a/xen/Makefile b/xen/Makefile
index 4e6e661261ae..9d0df5e2c543 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 17
-export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= -rc$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
-- 
2.37.1


