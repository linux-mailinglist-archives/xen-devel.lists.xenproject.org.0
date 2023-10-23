Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2B07D2E0A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621126.967251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur89-0000ta-AZ; Mon, 23 Oct 2023 09:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621126.967251; Mon, 23 Oct 2023 09:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur89-0000r7-6W; Mon, 23 Oct 2023 09:21:49 +0000
Received: by outflank-mailman (input) for mailman id 621126;
 Mon, 23 Oct 2023 09:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdWI=GF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qur87-0000os-4q
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:21:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 95861891-7185-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:21:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C6032F4;
 Mon, 23 Oct 2023 02:22:26 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 85A3E3F64C;
 Mon, 23 Oct 2023 02:21:41 -0700 (PDT)
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
X-Inumbo-ID: 95861891-7185-11ee-98d5-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 2/4] CHANGELOG.md: Use "xenbits.xenproject.org" in links
Date: Mon, 23 Oct 2023 17:21:21 +0800
Message-Id: <20231023092123.1756426-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023092123.1756426-1-Henry.Wang@arm.com>
References: <20231023092123.1756426-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compared to "xenbits.xen.org", "xenbits.xenproject.org" appeared
later as a name, with the intention of becoming the canonical one.
Therefore, this commit unifies all the links to use "xenproject"
in the links.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v3:
- New patch.
---
 CHANGELOG.md | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 394a92400a..25d29fe59d 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
-## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+## [unstable UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
  - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
@@ -43,7 +43,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    "cpuid=no-pku".  Visibility of PKU to guests should be via its vm.cfg file.
  - xenpvnetboot removed as unable to convert to Python 3.
 
-## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
+## [4.17.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
 ### Changed
  - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
@@ -89,7 +89,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
 
-## [4.16.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.16.0) - 2021-12-02
+## [4.16.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.16.0) - 2021-12-02
 
 ### Removed
  - XENSTORED_ROOTDIR environment variable from configuartion files and
@@ -132,7 +132,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Support of generic DT IOMMU bindings for Arm SMMU v2.
  - Limit grant table version on a per-domain basis.
 
-## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
+## [4.15.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
 
 ### Added / support upgraded
  - ARM IOREQ servers (device emulation etc.) (Tech Preview)
@@ -166,7 +166,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    support, not recommended".  (Use as stub domain device model is still
    supported - see SUPPORT.md.)
 
-## [4.14.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.14.0) - 2020-07-23
+## [4.14.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.14.0) - 2020-07-23
 
 ### Added
  - This file and MAINTAINERS entry.
@@ -193,6 +193,6 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    An administrator still needs to take care to ensure the features visible to
    the guest at boot are compatible with anywhere it might migrate.
 
-## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
+## [4.13.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
 
 > Pointer to release from which CHANGELOG tracking starts
-- 
2.25.1


