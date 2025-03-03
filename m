Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501EDA4BBB5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900086.1308008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2j1-0004xv-Qh; Mon, 03 Mar 2025 10:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900086.1308008; Mon, 03 Mar 2025 10:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2j1-0004vF-NP; Mon, 03 Mar 2025 10:08:39 +0000
Received: by outflank-mailman (input) for mailman id 900086;
 Mon, 03 Mar 2025 10:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W32C=VW=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1tp2j0-0004ut-Ku
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:08:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 78602d2c-f817-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 11:08:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B27C4113E;
 Mon,  3 Mar 2025 02:08:49 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.37.154])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5835A3F66E;
 Mon,  3 Mar 2025 02:08:34 -0800 (PST)
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
X-Inumbo-ID: 78602d2c-f817-11ef-9898-31a8f345e629
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Fix platforms Kconfig indent
Date: Mon,  3 Mar 2025 11:08:23 +0100
Message-ID: <449a9f85d07aca65f607944c4bdab850760c9445.1740996436.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix platforms/Kconfig help indent to respect the standard (tab + 2
spaces).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/platforms/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 6dbf6ec87b1d..b938de329762 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -2,15 +2,15 @@ choice
 	prompt "Platform Support" if MMU
 	default ALL_PLAT
 	help
-	Choose which hardware platform to enable in Xen.
+	  Choose which hardware platform to enable in Xen.
 
-	If unsure, choose ALL_PLAT.
+	  If unsure, choose ALL_PLAT.
 
 config ALL_PLAT
 	bool "All Platforms"
 	help
-	Enable support for all available hardware platforms. It doesn't
-	automatically select any of the related drivers.
+	  Enable support for all available hardware platforms. It doesn't
+	  automatically select any of the related drivers.
 
 config QEMU
 	bool "QEMU aarch virt machine support"
@@ -18,8 +18,8 @@ config QEMU
 	select GICV3
 	select HAS_PL011
 	help
-	Enable all the required drivers for QEMU aarch64 virt emulated
-	machine.
+	  Enable all the required drivers for QEMU aarch64 virt emulated
+	  machine.
 
 config RCAR3
 	bool "Renesas RCar3 support"
@@ -27,7 +27,7 @@ config RCAR3
 	select HAS_SCIF
 	select IPMMU_VMSA
 	help
-	Enable all the required drivers for Renesas RCar3
+	  Enable all the required drivers for Renesas RCar3
 
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
@@ -35,7 +35,7 @@ config MPSOC
 	select HAS_CADENCE_UART
 	select ARM_SMMU
 	help
-	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
+	  Enable all the required drivers for Xilinx Ultrascale+ MPSoC
 
 config S32G3
 	bool "NXP S32G3 Processors support"
@@ -43,12 +43,12 @@ config S32G3
 	select HAS_LINFLEX
 	select SCMI_SMC
 	help
-	Enable all the required drivers for NXP S32G3 Processors Family
+	  Enable all the required drivers for NXP S32G3 Processors Family
 
 config NO_PLAT
 	bool "No Platforms"
 	help
-	Do not enable specific support for any platform.
+	  Do not enable specific support for any platform.
 
 endchoice
 
-- 
2.47.1


