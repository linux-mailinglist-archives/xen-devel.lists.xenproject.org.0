Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5D62B251
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 05:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444153.699061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovA1Q-0001S0-UK; Wed, 16 Nov 2022 04:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444153.699061; Wed, 16 Nov 2022 04:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovA1Q-0001Q8-R4; Wed, 16 Nov 2022 04:27:36 +0000
Received: by outflank-mailman (input) for mailman id 444153;
 Wed, 16 Nov 2022 04:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ovA1P-0001PM-Iu
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 04:27:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id fdb8fff5-6566-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 05:27:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F8CE13D5;
 Tue, 15 Nov 2022 20:27:39 -0800 (PST)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F0C0D3F663;
 Tue, 15 Nov 2022 20:27:30 -0800 (PST)
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
X-Inumbo-ID: fdb8fff5-6566-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 2/3] Changelog: Add __ro_after_init and CET
Date: Wed, 16 Nov 2022 04:26:33 +0000
Message-Id: <20221116042634.50948-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221116042634.50948-1-Henry.Wang@arm.com>
References: <20221116042634.50948-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v1 -> v2:
- Include this patch in the series
---
 CHANGELOG.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 4f58a82602..7418fc9326 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,7 +22,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    when they don't share page tables with the CPU (HAP / EPT / NPT).
  - Support VIRT_SSBD feature for HVM guests on AMD and MSR_SPEC_CTRL feature for
    SVM guests.
+ - __ro_after_init support on x86, for marking data as immutable after boot.
  - Improved TSC, CPU, and APIC clock frequency calibration on x86.
+ - Support for Xen using x86 Control Flow Enforcement technology for its own
+   protection. Both Shadow Stacks (ROP protection) and Indirect Branch
+   Tracking (COP/JOP protection).
  - Add mwait-idle support for SPR and ADL on x86.
  - Extend security support for hosts to 12 TiB of memory on x86.
  - Add command line option to set cpuid parameters for dom0 at boot time on x86.
-- 
2.17.1


