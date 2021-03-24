Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E149347DAD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101073.193017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6NA-0006zM-ID; Wed, 24 Mar 2021 16:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101073.193017; Wed, 24 Mar 2021 16:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6NA-0006yh-Ao; Wed, 24 Mar 2021 16:28:44 +0000
Received: by outflank-mailman (input) for mailman id 101073;
 Wed, 24 Mar 2021 16:28:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6N7-0006yD-TO
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:28:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6N7-0005Gp-Qp
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:28:41 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6N7-0001ls-Ok
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:28:41 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lP6N5-0005Ub-TI; Wed, 24 Mar 2021 16:28:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=CAKFSKwsySbvmSwBuqmOj4VNvCksUSzlZIh0/BV+8Us=; b=MsAWSK0PWaZtg+lCIkNajI9ijw
	Er4BV6NS5WhzYbK0aUPHkisVfDXlOWR9jr+K37O1vEsw18YFxP923l+hjzAem2523nsFKISZGNN0c
	hw9JgvB0EGWgLV8T6ScAVP8oM7HmB9K2Z5AMERqe/m3d7PPbG6dP/OA1KwDqHFU6+/Ro=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH 1/2] Branching: Update version files etc. for newly unstable
Date: Wed, 24 Mar 2021 16:28:30 +0000
Message-Id: <20210324162831.7587-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 CHANGELOG.md |  2 ++
 Config.mk    |  4 ++--
 README       | 16 ++++++++--------
 SUPPORT.md   |  2 +-
 xen/Makefile |  4 ++--
 5 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c407f6bb2f..f76fadf8c7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,8 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
 ## Added / support upgraded
diff --git a/Config.mk b/Config.mk
index a56a971028..9a174c77f3 100644
--- a/Config.mk
+++ b/Config.mk
@@ -244,7 +244,7 @@ QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
 SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
-OVMF_UPSTREAM_REVISION ?= a3741780fe3535e19e02efa869a7cac481891129
+OVMF_UPSTREAM_REVISION ?= master
 QEMU_UPSTREAM_REVISION ?= 7ea428895af2840d85c524f0bd11a38aac308308
 MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
 
@@ -253,7 +253,7 @@ SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
 ETHERBOOT_NICS ?= rtl8139 8086100e
 
 
-QEMU_TRADITIONAL_REVISION ?= xen-4.15.0-rc1
+QEMU_TRADITIONAL_REVISION ?= 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764
 # Wed Jul 15 10:01:40 2020 +0100
 # qemu-trad: remove Xen path dependencies
 
diff --git a/README b/README
index aa8b4fe126..fad96672af 100644
--- a/README
+++ b/README
@@ -1,11 +1,11 @@
-#################################
- _  _    _ ____
-| || |  / | ___|       _ __ ___
-| || |_ | |___ \ _____| '__/ __|
-|__   _|| |___) |_____| | | (__
-   |_|(_)_|____/      |_|  \___|
-
-#################################
+############################################################
+__  __                                _        _     _
+\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
+ \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
+ /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
+/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
+
+############################################################
 
 https://www.xen.org/
 
diff --git a/SUPPORT.md b/SUPPORT.md
index a1efd8fcfd..3ef072681b 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.15-rc
+    Xen-Version: unstable
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
diff --git a/xen/Makefile b/xen/Makefile
index 0b97e459e2..ab7d86d226 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -1,8 +1,8 @@
 # This is the correct place to edit the build version.
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
-export XEN_SUBVERSION    = 15
-export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
+export XEN_SUBVERSION    = 16
+export XEN_EXTRAVERSION ?= -unstable-rc$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
-- 
2.20.1


