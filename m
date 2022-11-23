Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4CC634E90
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 05:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447379.703532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxgz6-0007x3-Sl; Wed, 23 Nov 2022 04:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447379.703532; Wed, 23 Nov 2022 04:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxgz6-0007ty-Ps; Wed, 23 Nov 2022 04:03:40 +0000
Received: by outflank-mailman (input) for mailman id 447379;
 Wed, 23 Nov 2022 04:03:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYU+=3X=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxgz5-0007eX-8i
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 04:03:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ced911a8-6ae3-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 05:03:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FD8F23A;
 Tue, 22 Nov 2022 20:03:44 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B36B73F587;
 Tue, 22 Nov 2022 20:03:34 -0800 (PST)
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
X-Inumbo-ID: ced911a8-6ae3-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v4 1/3] CHANGELOG: Add missing entries for work during the 4.17 release
Date: Wed, 23 Nov 2022 12:03:13 +0800
Message-Id: <20221123040315.1480112-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123040315.1480112-1-Henry.Wang@arm.com>
References: <20221123040315.1480112-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v3 -> v4:
- Use the corrected sentence for VIRT_SSBD and MSR_SPEC_CTRL
- Clarify that the virtio-mmio toolstack for ARM is only creating the
  device-tree binding.
- Remove the "initial" in i.MX entry.
v2 -> v3:
- Move the uncertain release date to patch #3.
v1 -> v2:
- Correct wording for two x86 entries (clock frequency calibration
and SPR & ADL support) following Jan's suggestion.
- Add missing Arm entries from Oleksandr.
- Add missing i.MX entry following Stefano's suggestion.
---
 CHANGELOG.md | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index adbbb216fa..8fa8b198b3 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,16 +4,43 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
-## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging)
 
 ### Changed
  - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
    this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
+ - The "gnttab" option now has a new command line sub-option for disabling the
+   GNTTABOP_transfer functionality.
+ - The x86 MCE command line option info is now updated.
 
 ### Added / support upgraded
+ - Out-of-tree builds for the hypervisor now supported.
+ - The project has officially adopted 4 directives and 24 rules of MISRA-C,
+   added MISRA-C checker build integration, and defined how to document
+   deviations.
  - IOMMU superpage support on x86, affecting PV guests as well as HVM/PVH ones
    when they don't share page tables with the CPU (HAP / EPT / NPT).
- - Support VIRT_SSBD feature for HVM guests on AMD.
+ - Support for VIRT_SSBD and MSR_SPEC_CTRL for HVM guests on AMD.
+ - Improved TSC, CPU, and APIC clock frequency calibration on x86.
+ - Add mwait-idle support for SPR and ADL on x86.
+ - Extend security support for hosts to 12 TiB of memory on x86.
+ - Add command line option to set cpuid parameters for dom0 at boot time on x86.
+ - Improved static configuration options on Arm.
+ - cpupools can be specified at boot using device tree on Arm.
+ - It is possible to use PV drivers with dom0less guests, allowing statically
+   booted dom0less guests with PV devices.
+ - On Arm, p2m structures are now allocated out of a pool of memory set aside at
+   domain creation.
+ - Improved mitigations against Spectre-BHB on Arm.
+ - Support VirtIO-MMIO devices device-tree binding creation in toolstack on Arm.
+ - Allow setting the number of CPUs to activate at runtime from command line
+   option on Arm.
+ - Grant-table support on Arm was improved and hardened by implementing
+   "simplified M2P-like approach for the xenheap pages"
+ - Add Renesas R-Car Gen4 IPMMU-VMSA support on Arm.
+ - Add i.MX lpuart and i.MX8QM support on Arm.
+ - Improved toolstack build system.
+ - Add Xue - console over USB 3 Debug Capability.
 
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
-- 
2.25.1


