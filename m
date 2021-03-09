Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E801332911
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95516.180356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdgf-00041q-3j; Tue, 09 Mar 2021 14:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95516.180356; Tue, 09 Mar 2021 14:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdge-000414-UT; Tue, 09 Mar 2021 14:50:16 +0000
Received: by outflank-mailman (input) for mailman id 95516;
 Tue, 09 Mar 2021 14:50:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgd-0003zT-PH
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgd-0000wI-OS
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgd-000531-Lo
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lJdgb-0003Go-75; Tue, 09 Mar 2021 14:50:13 +0000
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=f2SvDOkgoMwyvufUctoo6PscqekyzDTdMKmHYXgLkeU=; b=jOJDqHNANVQB9Qta0Avb+WmCFO
	RNk1YlgyWpoJorJjiL3QezzmY598ikJK7JNM8SIKe2LpIlWisimcSIA3MLYaT1vrz2OUE+d96oSEm
	iUf/JloWrmaVyOV9h9CJEUB+2CySt3hsLeeqNxhYF2i/k3QcfFhK4HRfhU2uApejLKv0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 4.15 2/3] CHANGELOG.md: Clear out 4.14 stuff and start 4.15 info
Date: Tue,  9 Mar 2021 14:50:01 +0000
Message-Id: <20210309145002.30359-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309145002.30359-1-iwj@xenproject.org>
References: <20210309145002.30359-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 CHANGELOG.md | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5c3d3c791d..4ecd157a35 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,31 +6,6 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [Unreleased](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog)
 
-### Added
- - This file and MAINTAINERS entry.
- - Use x2APIC mode whenever available, regardless of interrupt remapping
-   support.
- - Performance improvements to guest assisted TLB flushes, either when using
-   the Xen hypercall interface or the viridian one.
- - Assorted pvshim performance and scalability improvements plus some bug
-   fixes.
- - Hypervisor framework to ease porting Xen to run on hypervisors.
- - Initial support to run on Hyper-V.
- - Initial hypervisor file system (hypfs) support.
- - libxl support for running qemu-xen device model in a linux stubdomain.
- - New 'domid_policy', allowing domain-ids to be randomly chosen.
- - Option to preserve domain-id across migrate or save+restore.
- - Support in kdd for initial KD protocol handshake for Win 7, 8 and 10 (64 bit).
- - Tech preview support for Control-flow Execution Technology, with Xen using
-   Supervisor Shadow Stacks for its own protection.
-
-### Changed
- - The CPUID data seen by a guest on boot is now moved in the migration
-   stream.  A guest migrating between non-identical hardware will now no
-   longer observe details such as Family/Model/Stepping, Cache, etc changing.
-   An administrator still needs to take care to ensure the features visible to
-   the guest at boot are compatible with anywhere it might migrate.
-
-## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
+## [4.14.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.14.0) - 2020-07-23
 
 > Pointer to release from which CHANGELOG tracking starts
-- 
2.20.1


