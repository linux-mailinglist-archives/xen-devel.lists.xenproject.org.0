Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BDCB063F8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044529.1414660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFu-000797-Pp; Tue, 15 Jul 2025 16:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044529.1414660; Tue, 15 Jul 2025 16:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFu-00076c-L3; Tue, 15 Jul 2025 16:11:46 +0000
Received: by outflank-mailman (input) for mailman id 1044529;
 Tue, 15 Jul 2025 16:11:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiFt-00067r-6y
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:11:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65999c5a-6196-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 18:11:44 +0200 (CEST)
Received: from MW4PR03CA0195.namprd03.prod.outlook.com (2603:10b6:303:b8::20)
 by IA4PR12MB9787.namprd12.prod.outlook.com (2603:10b6:208:54d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 15 Jul
 2025 16:11:39 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:b8:cafe::f1) by MW4PR03CA0195.outlook.office365.com
 (2603:10b6:303:b8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Tue,
 15 Jul 2025 16:11:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:37 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:34 -0500
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
X-Inumbo-ID: 65999c5a-6196-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAyxonhK4xq4sLU9B7AZNXROo54Qry2aR+lk5S7NcoDLecx/l9b4vQzVGekf4NGadZQj76My/1zwj8/9PfBQBPWhYy9uIF2dPtyi8i423dT9M/lEjv9uMh84iIqGCY5aSzAeKSyY04YcdTVwYUJ680YVyUt4WMHxFPzTuhIPrJNZj+mGszTsSfJu/z7keQiBo1xoHtRkYTCXNTEiTqPKTPRe5YG6/HAUt8Mzw8D9AAND91q3vpzv3/w86vcvjTz7xBOG9uKGQaaxvgbTSViKcHG+zYE3YjuTWF2VIX4MYYGY0m9AjgleRe7fWElWwX/691pPgv6J4aHyEKzdoBQ2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRfjV0nJ6OYwrZoEaylt/o5NVgGYETJ/z9gInJPgBiY=;
 b=uHer0XNnBwHEbwbt0nZpy3txc8YG2fkQX4BkMlFt3bPRSyMAkpQY2WdASYpfETkXJDfp4wMK3yaVYmqSVUm2qxi9tU3GLNmmsMosdzVO/qMUJQ5OtNEufTaMK/j8uSS09DGTaxiWI5gqyyplRzr4+es2NnME6dyzVMuhtPmz7zvkmScaNTAgQpMeIyVcvIBEnY6f55PW3+JRg8sQJ4Ucjrh8/ewNzFI1w++tC2umrUOuyW86dkpIz6S3MI2F/ZAys16HLsDNwmx7m4dnSeHLSuoZ8epXA7zhOnuFxRisJ849p8dc6/Q1G+XZd1lp81bBr5kgrpDUSdDttXSr2V+1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRfjV0nJ6OYwrZoEaylt/o5NVgGYETJ/z9gInJPgBiY=;
 b=nwAwrwogpUKGQhYriVtVmFxThpR2XLsEiDrJeDwbIeb6z3bZyJnK8C7s7DOfRPdS6fCbCILC5a2Gbcr/bSvX7AvgBCn/6yJ4flOtjcSz9ybAf/fyknYmOarTxXIrGBgHHojjPqODLQ6fgcHXvsTk+Y9HZmgtCPNtDwz3JsAJEws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 03/11] x86: Replace arch-specific boot_domain with the common one
Date: Tue, 15 Jul 2025 18:10:58 +0200
Message-ID: <20250715161108.141126-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|IA4PR12MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: eb98a2f2-2f53-46fb-ef21-08ddc3ba468d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ae7Z0QZiKJlI4PmZjl1RAmzANXx2Bv3okGPnvCk2+c95HK2dG3bMnAIi3p2o?=
 =?us-ascii?Q?wfYQYW8JR/jMbfMeDZTfpmE1VI/lLUA2I1bRx5CQX4Y/mfW5VpvMJ4Ps/3BM?=
 =?us-ascii?Q?IfovGi69zrV8+ZPYfvCzO2bjNCO+IuO9WirBUWX7NvKEnECGOhTcE8kWMZor?=
 =?us-ascii?Q?JOnPH4oK2MHCU2WD/bZpBuq/2fUq/ZWTMuPUGNi63rU2nmijDhwEzHdgM/we?=
 =?us-ascii?Q?3wxxze9HN75WXAKMTnQgHBYPtIt9REGfn1vz+m9dXXC94FZNcrJKxfvHLI+5?=
 =?us-ascii?Q?beZo1xQeDLnOM+yAMM5/w9ixXibGThLVMXX7GwRVxvtmrkjXBdrEkJL9yo80?=
 =?us-ascii?Q?sxvqtgBLqs6QHWkVVqtkG3cHCGzYKE0GDCAR/ZyOtwZEJMI4+ARrWTErOnYk?=
 =?us-ascii?Q?lPand404ywGgGZ+nFRlEh+/OYj3YQbX7MVlCFGL+BlqlGgpUjrQXOTXz/8Xa?=
 =?us-ascii?Q?r+wq06XV3AO6FtTg1oN14mYF9SEmsudoVhNz2bmRXrIJ05GU9DXlUfU5WASg?=
 =?us-ascii?Q?UIo2hRrMFXt0TOb0LT303KbJvaZPUw5XLY1P9AHoswg6QYYE3Qg4aLVGuhxN?=
 =?us-ascii?Q?8A+J2+ezk24VoNeNxslo0qqG1luYFmGZM6E2AeXipXD+3tGqxtlkCYhpRgTI?=
 =?us-ascii?Q?Y4W4gG8q0LkYK7sDR138tpB5mmgic4fuuppezx4vK1QARXfAUiir0EDAxuUv?=
 =?us-ascii?Q?TNoT7gZQzEZBwdfI294pv0O/NJXeoCF/f/9HtWAmfBUcmU9DeiB7ft0EhaKq?=
 =?us-ascii?Q?ueea/UyM4JaOEW9p/1fEh8NeUGR7SjMpTJIDddLmmwrFlDN2Zixi02K+1TS5?=
 =?us-ascii?Q?7pxVxIJRcbbcXTpThbPtRe7/aI0MEnYgXlTv7X98cM05d7HYKPMIhPmQRrYj?=
 =?us-ascii?Q?gAF+R5t3DoDlMccQKiYxn0MhW6FCyaDieZP1GSkdjFJPTw1jhCm+A2KILAsi?=
 =?us-ascii?Q?csuG93eLaLC+R7GZGFodtNWtJ+1BxzRLDmgwEPpR6yc1X/P/uzKn6hXneebg?=
 =?us-ascii?Q?COoEHF1X2RN2n/N8XTe00nSsy9flQih7bUu3npZMTBWWV2Is+H6q/CgVdImP?=
 =?us-ascii?Q?LhM7u3eMg2abv4Hbd0LnV8WPb/YdRHfSoi4LGdAloQjRLTnrqBkVcNXb8zpn?=
 =?us-ascii?Q?0K6fb2Sxd1vIc6QvDpZKnoXh6GyZ/sySn2tM7wJvoYIMCFmWVeSR57W1iRqG?=
 =?us-ascii?Q?muz7XgDYZ2pqwgO7e/uX1aQ/kvU+iIVyws6hISQOqO1F0WykUjR6OggoTHch?=
 =?us-ascii?Q?cRdSkEnt5J9CN8nHRX3SiftGPh63T6o7nF35SniuYa6O/Mwqo3OCqMof5c+X?=
 =?us-ascii?Q?m+qlwahMNLmuijimkFtr8zyli2Ye02qsQPDBtPmg6hAZgGL1QPKj/Zb3uu/f?=
 =?us-ascii?Q?9Af//6yTMpeDEUaBENfBI7o7bArmLRPgDcH8V4jg3qGlhGaiJKS2HeFsDX0h?=
 =?us-ascii?Q?l7PfZ/hbOMhShz8I6rZCd+pRYPtgk4jpSK8ENqHKhsiYjkQplktSRuF4bDx5?=
 =?us-ascii?Q?pC5qngtg2wJZ7pudGKRDPyt3xIVLy4shBmA6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:37.0110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb98a2f2-2f53-46fb-ef21-08ddc3ba468d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9787

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/dom0_build.c          |  2 +-
 xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
 xen/arch/x86/include/asm/bootinfo.h    |  1 -
 xen/arch/x86/pv/dom0_build.c           |  2 +-
 xen/arch/x86/setup.c                   |  2 +-
 xen/include/xen/bootfdt.h              |  4 ++++
 6 files changed, 7 insertions(+), 37 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 2bb8ef355c..8d2734f2b5 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -648,7 +648,7 @@ static int __init pvh_load_kernel(
 {
     struct domain *d = bd->d;
     struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->module;
+    struct boot_module *initrd = bd->initrd;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->arch.headroom;
     unsigned long image_len = image->size;
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
deleted file mode 100644
index d7c6042e25..0000000000
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (c) 2024 Apertus Solutions, LLC
- * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
- * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
- */
-
-#ifndef __XEN_X86_BOOTDOMAIN_H__
-#define __XEN_X86_BOOTDOMAIN_H__
-
-#include <public/xen.h>
-
-struct boot_domain {
-    domid_t domid;
-
-    struct boot_module *kernel;
-    struct boot_module *module;
-    const char *cmdline;
-
-    struct domain *d;
-};
-
-#endif
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index d33b100e04..4f2cc5906e 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -12,7 +12,6 @@
 #include <xen/init.h>
 #include <xen/multiboot.h>
 #include <xen/types.h>
-#include <asm/boot-domain.h>
 
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index a4b5362357..c37bea9454 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
     struct vcpu *v = d->vcpu[0];
 
     struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->module;
+    struct boot_module *initrd = bd->initrd;
     void *image_base;
     unsigned long image_len;
     void *image_start;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 7e70b46332..7380f1053f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2171,7 +2171,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
-        bi->domains[0].module = &bi->mods[initrdidx];
+        bi->domains[0].initrd = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 28f7d18262..ac2a79b59b 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -103,6 +103,10 @@ struct shared_meminfo {
 struct boot_domain {
     struct domain *d;
 
+#ifdef CONFIG_X86
+    domid_t domid;
+#endif
+
     struct boot_module *kernel;
     struct boot_module *initrd;
 
-- 
2.43.0


