Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D811AD90F7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014462.1392609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ69I-0002Zx-94; Fri, 13 Jun 2025 15:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014462.1392609; Fri, 13 Jun 2025 15:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ69I-0002VO-4o; Fri, 13 Jun 2025 15:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1014462;
 Fri, 13 Jun 2025 15:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ69G-0001Mm-Fx
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:16:54 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2406::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ebf9bf1-4869-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:16:52 +0200 (CEST)
Received: from DS7PR03CA0153.namprd03.prod.outlook.com (2603:10b6:5:3b2::8) by
 CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.23; Fri, 13 Jun 2025 15:16:48 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::b8) by DS7PR03CA0153.outlook.office365.com
 (2603:10b6:5:3b2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Fri,
 13 Jun 2025 15:16:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:47 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:44 -0500
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
X-Inumbo-ID: 6ebf9bf1-4869-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEhTuLQPuXn+hEucg7cOPvu7xQPnzv5JP4wFF7ZA0Edge0/dX0Qbw9h6HNRdGGkZ0NELvIdro9XW4M4Og0LPSeqaQSpnaI0zMCpV7UYUalt4HqZcM7cyOgDGw4Q9zoASuvaxEGWrgXQMHaLjJDl5zr4e6b3mdNmO3ZVSoRalr0RdS0BxIIv/P4x1M2pAajUEH2T7nZKotZY+9Duz2tXs9PsTc98aF6aSz+LrLRxuiH882w13jTdSgjGycvZtlhcFUHpWQi38RhQp/Co7k5X+5GBx6Roh2YAfB0QqDRCMmPJNtY19zoteujo/Au8fgVktvVevTsUolQPfuZ6jMW8qYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xud/1d9pBbDXUNWwaND3LfMeCwbP67tG/BP4SnNhQU=;
 b=nFgRZj4mrzI3Pe8HQyWfyko1ADekiCzB26j4tSN2mK6YI63tkzb+TkTLpvtGAndHWObejYZ9V896m2Q+dVGRBohy/ibpxLyWGPcJ8yjf30ZhJPqNf/5A8C4OoDhmlwLyT0FLCT2luseRTBPaK/W/3p4HVGRWgqF9TbL/jujM4rnbyhLC2FRxdkYw8j9Dn/eJGffSl0G1HY8HPpM3fSPO9TIF6iWlCOvSOK17/xIQvFbGmN+Yk+DoRezfp3X7trghs12/GTjzlCjEA8ieMszSoAP1RgTXrphbNuVsD3FL3wbMcK87LyTU4GDK+EQvCM1o5tSz4vmQt72r6Lqr3gHWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xud/1d9pBbDXUNWwaND3LfMeCwbP67tG/BP4SnNhQU=;
 b=XIQ6GicmcYjVJDLJisXWk//8c+1wx7L+dLmP0ZMc7TiY0YT6uSVUUQLRG4bf7GsyYurnONyUNdYUtuydqebG9LSnn3fIW38Q2RQArJECPr9kyLbkiYL0TOzqyQQAeZdoASSczeep9pBNg5HA3fYb6RggTkUbv4KRtNabVKcRGNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 07/14] x86: Replace arch-specific boot_domain common one bootdomain
Date: Fri, 13 Jun 2025 17:13:16 +0200
Message-ID: <20250613151612.754222-8-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CY8PR12MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 02664675-41ad-413a-5189-08ddaa8d5090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qVCw8Haq8uvThLSrtQaWvsH1rLLSgnd0Sv/q2jI1blxKYVOC1E16UC020Ke3?=
 =?us-ascii?Q?GsIRhxaMDUs5A+EEWRgAle2OXcjwFR+Cgw1lJknkXdKlxIlvejeCO0Udq3KO?=
 =?us-ascii?Q?CCORadM6wh14jESXKCavAE2rH5z3oR2u2uaM7TkJOIGDyXfyczW1zfnhzqDr?=
 =?us-ascii?Q?sp7vF9R1e2lICEMiURG/L6YsG6oeY1kGxU5qOxNvt9uoLqxXtbCr6qgQWttA?=
 =?us-ascii?Q?4+Cx3LuaMudDu14KOHjOUJ+RuY+saKFU7nXXK+6zdhrHz3fr2winhRGdn4p5?=
 =?us-ascii?Q?yi8n2KKHiO2vaXlIUxSWO7Jc7FHZpX8Ks3MQt9pJCm/kSwsgjzmF9txqHivF?=
 =?us-ascii?Q?/aWUopca3Eqe+tugbTTDwwzoYTu7hpeyw18L3UhR0BqT8IskeWGD8LFQbJ5D?=
 =?us-ascii?Q?4RULkrsLkf3o3vp9ni30hGNs4v+jJ+3f1kziiitG8QNyEKDFeFhU8fNVWvtc?=
 =?us-ascii?Q?BSM7BTacDkIMxUcz5MBXCdubxmNKN9ipTLhs9oLqKlRHNMhMnpe9h+nO/E/S?=
 =?us-ascii?Q?xOZQd9Yq/lD0II9txk5jqyqG/KGuuH2uhT0Wf/XBmN/2c9eDVNZOfW1FxiiN?=
 =?us-ascii?Q?ugkCad5XnX6bKRnbsyUifquVRygaFbmDUHJMdPXhQ5NXxAayQ8myb9ap5jJq?=
 =?us-ascii?Q?pMla6NHdy8NVBmkPaHtNYrhK2l9GsrNpFzsIIv38mhkPkIygKuhOLwT51lq+?=
 =?us-ascii?Q?RGsvzk60lX0xNUQuCq7vxcz/ptrYKpysEuq/+Okcj/jyDNu1qw6WWMFVCw8i?=
 =?us-ascii?Q?aa7VjZb9eFtdIl7tDIKaMX1xqYKE2ULIFWx452ughz0jLncGOFrFWG01GCvi?=
 =?us-ascii?Q?EwyVTFvZ+q/02htzKQrIUYLiRDCoWSY2FLiMlklvf32y9svv32fArqG1b9Mk?=
 =?us-ascii?Q?x0I5U+uWjGxn/SIU5mHgGwemeyUqvOHSsykk+SS+GVB+RC1GWplHfz5UN3kV?=
 =?us-ascii?Q?hvWx64UFDZND2fBsRWSUSwtwNJLBEo1gilU+Xb6U5q0ckUh02chEFnDC9Na7?=
 =?us-ascii?Q?Ope6hqcS0Vp8IuODBoj/uuPl2ZCrBOWpAZMGFkF41T3ZwcZrCy5IxGDmsuLg?=
 =?us-ascii?Q?ZY2lrOdyKadTCsd1alY9M6Lh4Yv3ZLN02gTaVj7jG2TlvjwMIaY1WFoI6ucm?=
 =?us-ascii?Q?zxb7aw6HGcxLtIReLVOmYvsGovAE/uHLjOMGaXx6uiO42xPaJJK/rWUH7BVL?=
 =?us-ascii?Q?r4yyQc0n19/D1NDAdupzqdVtmmknCmyEr9Fe4qU3sJEt/mNJtH80YRHAJHUY?=
 =?us-ascii?Q?dimvaJmUDHopO0WWFBKpmPWqYibNejhET9UelS94r60bewCdLvR6h9CSi6ZP?=
 =?us-ascii?Q?mNytNoe2gMBNJRn1FulvA4K146PPju1S/3YApHQip/Simk9077DdNqlcY+ZC?=
 =?us-ascii?Q?CvlwzbEBaxLac6HyKaJBSsqRzQ866yhGjZXUlT0Oh3EORueP4nlBhgf2A1n3?=
 =?us-ascii?Q?OTQ8g60/NbUuK78T/BVbdigZFggrz66LtFvWsSKY7WIK0RiyZU4+y0Be95fZ?=
 =?us-ascii?Q?hToZ2PP33ZsIWmR0MyIO7SPi+3QimX6otDED?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:47.4410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02664675-41ad-413a-5189-08ddaa8d5090
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7516

Add the single arch-specific field in an "arch" subfield defined in
asm/bootfdt.h.

No functional change intended.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v3:
  * Avoid the bootdomain/boot_domain renames.
---
 xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
 xen/arch/x86/include/asm/bootfdt.h     |  6 +++++
 xen/arch/x86/include/asm/bootinfo.h    |  1 -
 xen/arch/x86/setup.c                   | 12 ++++++----
 xen/include/xen/bootfdt.h              |  4 ++++
 5 files changed, 17 insertions(+), 39 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h

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
diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
index a4c4bf30b9..c21dbe961b 100644
--- a/xen/arch/x86/include/asm/bootfdt.h
+++ b/xen/arch/x86/include/asm/bootfdt.h
@@ -3,6 +3,12 @@
 #define X86_BOOTFDT_H
 
 #include <xen/types.h>
+#include <public/xen.h>
+
+struct arch_boot_domain
+{
+    domid_t domid;
+};
 
 struct arch_boot_module
 {
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
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c00b22205a..f1b11028b5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -297,7 +297,9 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
-    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
+    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = {
+        .arch.domid = DOMID_INVALID
+    }},
     /*
      * There's a MAX_NR_BOOTMODS-th entry in the array. It's not off by one.
      *
@@ -1039,11 +1041,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg,
+    bd->arch.domid = get_initial_domain_id();
+    d = domain_create(bd->arch.domid, &dom0_cfg,
                       pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
+        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
 
     init_dom0_cpuid_policy(d);
 
@@ -2162,7 +2164,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
-        bi->domains[0].module = &bi->mods[initrdidx];
+        bi->domains[0].initrd = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index be0abe30ef..8ea52290b7 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -108,6 +108,10 @@ struct boot_domain {
     struct boot_module *initrd;
 
     const char* cmdline;
+
+#if __has_include(<asm/bootfdt.h>)
+    struct arch_boot_domain arch;
+#endif
 };
 
 /*
-- 
2.43.0


