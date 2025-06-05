Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E957ACF84B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007457.1386779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaG-00049g-Lp; Thu, 05 Jun 2025 19:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007457.1386779; Thu, 05 Jun 2025 19:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaG-000485-FQ; Thu, 05 Jun 2025 19:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1007457;
 Thu, 05 Jun 2025 19:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGaE-0002tD-0w
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:49:02 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2417::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 206ed3a3-4246-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 21:49:01 +0200 (CEST)
Received: from LV3P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::16)
 by MN6PR12MB8489.namprd12.prod.outlook.com (2603:10b6:208:474::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 19:48:53 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:234:cafe::33) by LV3P220CA0004.outlook.office365.com
 (2603:10b6:408:234::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Thu,
 5 Jun 2025 19:48:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:53 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:51 -0500
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
X-Inumbo-ID: 206ed3a3-4246-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFk/ADoRt8dP9SFysFwSwM3oEbcD50z13W2eHrQHoSBawxX1W/Wd+CFQ19gyAm/M9/UDZFUWzJLo9NSBa8UHwyHaHcIR4Wjm+Nu1x6/M8h1aCnyB5645faHfz6ucH+iefdIYO3ZzB113x4XZJwzlDiXeU/Xo0t/AVRoW4p9koidYfDQVYcJUoOC2pEBGBs2NpNFerQFqyw9A4NMhvgUfZcw2ZptP82tYOdrgEREzIKqtFhWz8dFqtuicwEpDg+NdIfL8hhd1tutwCG04Gf+fmR33PM+ASQnrICca6Ms7gjqvO6YPNjRk6xlpkMA4P9EXpIIc5d7qG2KvpJ+qsuC0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23cn4AM6kYMSovW9UaT7nqIuXlTzvgh1AnMLD88KkLo=;
 b=C+skJ8TNtwMirYYF+ypU3ui82he1TFfrn4NtiTKmTLDi4UZpbMvy6lIInSpEW+uafRDuR/k0RqaX35tmze6uET5kvMLx7WklHurh4ZGVI9JuwcP63pm1RwAJ26SGWiLzTsMc47lzaUELx9ZyWehKDiLnUFAzbuCYh93g9o/aKcH11iOOXHmWZL5BPcpi9mIB4/hGfZTMgmLMtbDAiyWHhQdJ9LMvJKRBYQYapYtYjofQF4EpRNw6ft92fDuBLgAdLg2CYdHzUmceNeYJUNyEDzDhIzhhhWMLsQDHPC47NzUXcqOsshEPU4XQPmcPlPJSVsQfRBZ9piqqZ16xa/Ih1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23cn4AM6kYMSovW9UaT7nqIuXlTzvgh1AnMLD88KkLo=;
 b=mgce521k67/YHPIr6X0sOa36YL0R6Mk4Em1PigbeplRXTqHYzkkXocKfCNKEjinfGoGcdPoO3KoZJKgL+aybXV0WmLv98qAJ1DJnuQmqxX7QsjxWiMP9VIka8wQJSeHSpCNaJrQ2E6RSBiv/c3Xnk/o6dv4ezcXW5YIDbimjS6g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 06/15] xen: Refactor kernel_info to have a header like boot_domain
Date: Thu, 5 Jun 2025 21:47:58 +0200
Message-ID: <20250605194810.2782031-7-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|MN6PR12MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a54ed97-8e85-4b9e-787e-08dda46a008a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gW16kUUzrY2ovJQq9PG90457oO9kqszeQ1sohVwQ/ZtkYhkTP3Mkt7nOZUCk?=
 =?us-ascii?Q?ZBrVikQCHsChOcjxdxaq+KuMJPRX9PxsqWN9hmh3v0xta8Jqb6AQvavO7gu+?=
 =?us-ascii?Q?oDE/yNir0Le3ttoL55+W/MYqez3rQa+3vBwn55I2Cviuq67kz57YxVP5tE81?=
 =?us-ascii?Q?TtA04Ce+G5fx5rh69aOaZ50xVwUYtU7gQDMw6rcvTtrEk0kSVIjQKCsFaZBW?=
 =?us-ascii?Q?KujKkV1Iu1h2eVEryu3dN7eWbqCg+KqcdwiZeBuhX8/JxXdbDe14yy4VIfgp?=
 =?us-ascii?Q?o5oD76YjZfk4KIBRaUvccIduTo/Bj1aT+05xmd2gZPeGwmEuQqMbSAmzGLLq?=
 =?us-ascii?Q?vwddWQ0VKV/YRbSXumS964f+TIDL4sUFfaSZJvxYKNtbJVIIUbfKno1dkQqT?=
 =?us-ascii?Q?arg7r+LKSJmJ6r89yrQZrashVmzMzf1KN53ZWArGaFrraN2XbzfeAin7O2sW?=
 =?us-ascii?Q?FZfcDLF6vxNLiHLdPYSVeQIseaJH75I3ASsBQ9XlzCn/U5bPs+p8Py16S0XZ?=
 =?us-ascii?Q?KG+BvL+Zvd0Hntn6QPLgrjDdAs0q4JilGVN3p2WAPnP1hoIPUcOPqsFF2oCc?=
 =?us-ascii?Q?bnxB0gDvu2g8ZeBk+a5dxna1YK3qjyFBe05DF5qavb6+AUnAtChZEHr2xIks?=
 =?us-ascii?Q?cfDGVpLSLtxNQ1NyHAZlOt/eZlkxjxsso8nI9fip1xOcWEL5+GbudcPchgEM?=
 =?us-ascii?Q?eic9UinoCcV4eBoh3t9fPDP3IvEWPAxIywe/9jj5BoNmdqEv6tiM6sa4rNzp?=
 =?us-ascii?Q?kH/tgdSCw5zcmRIO4YrXbI817+u2NEBr4+ndkf7P+gkTXWctHzWEx6pbWo+S?=
 =?us-ascii?Q?XzFicHR6osPffs4d8OK6pPUnQkFGtlpfzKXVX9I5ozXgV5SJYLqPYu5TLAVj?=
 =?us-ascii?Q?DGUMBojrpbfpJPm0K/9Au/85HRZjhMqFEe4MWEbC1L8jSitcfe+FAy5PR3jl?=
 =?us-ascii?Q?+azigVY0pPOrvgd5OEHxXbkSmkIqlI/pmKU5T/+sshBMAAKiRavnhiD9kvJL?=
 =?us-ascii?Q?T4ULfBWxMZE84O5zuhhlsyEBck7a9x9qdfb4sHR7aua1UAk+Q4PHX+wHE0Pi?=
 =?us-ascii?Q?41ju678xgKGMCIew5kI7BtKavCkZgvb9EC9f31Ms1KGfYSkUVU163MNUZcy1?=
 =?us-ascii?Q?rZFL4RA6OEXWLmuZ/8REzBdsmt4CCOXOJnWZhm/LDNDZOXmLgKgWn3BmdQuV?=
 =?us-ascii?Q?vYhrbgKKaITlYL3ZDaNzYKWWzKNZ/KRvOkKwsH7RQp5YiCUx8jltetg8Xdhx?=
 =?us-ascii?Q?BTU3Tdm6B3XKBHirEkJB08f1XgyMzK/aBaPM0I8MteUCWsNMGS208C3Gbd90?=
 =?us-ascii?Q?tfStptflfc/lq/ShFomuOiyGMMI/gf8GgbfINjgECDC0NOi8lWieQGbJ+VPV?=
 =?us-ascii?Q?e0DtWEwlEmNJudoB7eEgJV3133JI8i4ZS0snjcgBb9ddLYwIcs9g5M+nnlWJ?=
 =?us-ascii?Q?3umef+X9j0/owh/Bnn+U0d2Dl6cz4yEJjGwMs2lZPUWElOlGfXN3P7C+o8bR?=
 =?us-ascii?Q?BQKTTdlGZXtVhrWefBA3KBOBdO1d+h94gD75?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:53.8628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a54ed97-8e85-4b9e-787e-08dda46a008a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8489

Create a struct header with the contents common to kernel_info and
boot_domain, and define that header in common code. This enables x86 to
use that header as-is.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v2:
  * New patch
---
 xen/arch/arm/dom0less-build.c           |  8 ++++----
 xen/arch/arm/domain_build.c             | 20 ++++++++++----------
 xen/arch/arm/kernel.c                   |  8 ++++----
 xen/common/device-tree/dom0less-build.c | 18 +++++++++---------
 xen/common/device-tree/domain-build.c   | 20 ++++++++++----------
 xen/common/device-tree/kernel.c         | 20 ++++++++++----------
 xen/include/xen/bootfdt.h               | 10 ++++++++++
 xen/include/xen/fdt-kernel.h            |  5 ++---
 8 files changed, 59 insertions(+), 50 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 20aabf6be5..a335551484 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -32,7 +32,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
-    const struct domain *d = kinfo->d;
+    const struct domain *d = kinfo->hdr.d;
 
     res = domain_fdt_begin_node(fdt, "interrupt-controller",
                                 vgic_dist_base(&d->arch.vgic));
@@ -85,7 +85,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     void *fdt = kinfo->fdt;
     int res = 0;
     __be32 *reg, *cells;
-    const struct domain *d = kinfo->d;
+    const struct domain *d = kinfo->hdr.d;
     unsigned int i, len = 0;
 
     res = domain_fdt_begin_node(fdt, "interrupt-controller",
@@ -152,7 +152,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 
 int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
-    switch ( kinfo->d->arch.vgic.version )
+    switch ( kinfo->hdr.d->arch.vgic.version )
     {
 #ifdef CONFIG_GICV3
     case GIC_V3:
@@ -175,7 +175,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->hdr.d;
 
     res = domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_addr);
     if ( res )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 590f38e520..5317665555 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -464,8 +464,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
     int had_dom0_bootargs = 0;
     struct dt_device_node *iommu_node;
 
-    if ( kinfo->cmdline && kinfo->cmdline[0] )
-        bootargs = &kinfo->cmdline[0];
+    if ( kinfo->hdr.cmdline && kinfo->hdr.cmdline[0] )
+        bootargs = &kinfo->hdr.cmdline[0];
 
     /*
      * We always skip the IOMMU device when creating DT for hwdom if there is
@@ -579,7 +579,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
 
     if ( dt_node_path_is_equal(node, "/chosen") )
     {
-        const struct bootmodule *initrd = kinfo->initrd_bootmodule;
+        const struct bootmodule *initrd = kinfo->hdr.initrd;
 
         if ( bootargs )
         {
@@ -1386,7 +1386,7 @@ int __init make_timer_node(const struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    if ( !is_64bit_domain(kinfo->d) )
+    if ( !is_64bit_domain(kinfo->hdr.d) )
         res = fdt_property_string(fdt, "compatible", "arm,armv7-timer");
     else
         res = fdt_property_string(fdt, "compatible", "arm,armv8-timer");
@@ -1398,7 +1398,7 @@ int __init make_timer_node(const struct kernel_info *kinfo)
      * It always exposes an active-low level-sensitive interrupt.
      */
 
-    if ( is_hardware_domain(kinfo->d) )
+    if ( is_hardware_domain(kinfo->hdr.d) )
     {
         irq[TIMER_PHYS_SECURE_PPI] = timer_get_irq(TIMER_PHYS_SECURE_PPI);
         irq[TIMER_PHYS_NONSECURE_PPI] =
@@ -1447,7 +1447,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
 {
     int res;
     const char *bootargs = NULL;
-    const struct bootmodule *initrd = kinfo->initrd_bootmodule;
+    const struct bootmodule *initrd = kinfo->hdr.initrd;
     void *fdt = kinfo->fdt;
 
     dt_dprintk("Create chosen node\n");
@@ -1455,9 +1455,9 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    if ( kinfo->cmdline && kinfo->cmdline[0] )
+    if ( kinfo->hdr.cmdline && kinfo->hdr.cmdline[0] )
     {
-        bootargs = &kinfo->cmdline[0];
+        bootargs = &kinfo->hdr.cmdline[0];
         res = fdt_property(fdt, "bootargs", bootargs, strlen(bootargs) + 1);
         if ( res )
            return res;
@@ -1906,7 +1906,7 @@ static int __init construct_dom0(struct domain *d)
     d->max_pages = dom0_mem >> PAGE_SHIFT;
 
     kinfo.unassigned_mem = dom0_mem;
-    kinfo.d = d;
+    kinfo.hdr.d = d;
 
     rc = kernel_probe(&kinfo, NULL);
     if ( rc < 0 )
@@ -1918,7 +1918,7 @@ static int __init construct_dom0(struct domain *d)
 int __init construct_hwdom(struct kernel_info *kinfo,
                            const struct dt_device_node *node)
 {
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->hdr.d;
     int rc;
 
     iommu_hwdom_init(d);
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index cb1efb19e7..0561d60d5a 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -46,7 +46,7 @@ static void __init place_modules(struct kernel_info *info,
                                  paddr_t kernbase, paddr_t kernend)
 {
     /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
-    const struct bootmodule *mod = info->initrd_bootmodule;
+    const struct bootmodule *mod = info->hdr.initrd;
     const struct membanks *mem = kernel_info_get_mem(info);
     const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
     const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
@@ -152,12 +152,12 @@ static void __init kernel_zimage_load(struct kernel_info *info)
 
     kernel = ioremap_wc(paddr, len);
     if ( !kernel )
-        panic("Unable to map the %pd kernel\n", info->d);
+        panic("Unable to map the %pd kernel\n", info->hdr.d);
 
-    rc = copy_to_guest_phys_flush_dcache(info->d, load_addr,
+    rc = copy_to_guest_phys_flush_dcache(info->hdr.d, load_addr,
                                          kernel, len);
     if ( rc != 0 )
-        panic("Unable to copy the kernel in the %pd memory\n", info->d);
+        panic("Unable to copy the kernel in the %pd memory\n", info->hdr.d);
 
     iounmap(kernel);
 }
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index d5bb1d5d35..809cb3c232 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -168,18 +168,18 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
             return -EINVAL;
         }
 
-        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
+        res = iomem_permit_access(kinfo->hdr.d, paddr_to_pfn(mstart),
                                   paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
         if ( res )
         {
             printk(XENLOG_ERR "Unable to permit to dom%d access to"
                    " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
-                   kinfo->d->domain_id,
+                   kinfo->hdr.d->domain_id,
                    mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
             return res;
         }
 
-        res = map_regions_p2mt(kinfo->d,
+        res = map_regions_p2mt(kinfo->hdr.d,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
                                maddr_to_mfn(mstart),
@@ -218,7 +218,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return -EINVAL;
     }
 
-    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
+    res = map_device_irqs_to_domain(kinfo->hdr.d, node, true, NULL);
     if ( res < 0 )
         return res;
 
@@ -230,7 +230,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
 
-    return iommu_assign_dt_device(kinfo->d, node);
+    return iommu_assign_dt_device(kinfo->hdr.d, node);
 }
 
 static int __init handle_prop_pfdt(struct kernel_info *kinfo,
@@ -297,14 +297,14 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
                                       address_cells, size_cells);
         if ( res < 0 )
         {
-            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo->d);
+            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo->hdr.d);
             return res;
         }
     }
     else if ( (xen_path && !xen_reg) || (xen_reg && !xen_path && !xen_force) )
     {
         printk(XENLOG_ERR "xen,reg or xen,path missing for %pd\n",
-               kinfo->d);
+               kinfo->hdr.d);
         return -EINVAL;
     }
 
@@ -607,7 +607,7 @@ static int __init alloc_xenstore_page(struct domain *d)
 
 static int __init alloc_xenstore_params(struct kernel_info *kinfo)
 {
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->hdr.d;
     int rc = 0;
 
 #ifdef CONFIG_HVM
@@ -775,7 +775,7 @@ static int __init construct_domU(struct domain *d,
 
     d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
 
-    kinfo.d = d;
+    kinfo.hdr.d = d;
 
     rc = kernel_probe(&kinfo, node);
     if ( rc < 0 )
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 6b8b8d7cac..e602cb91c9 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -76,7 +76,7 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                                  paddr_t tot_size)
 {
     struct membanks *mem = kernel_info_get_mem(kinfo);
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->hdr.d;
     struct membank *bank;
 
     /*
@@ -170,7 +170,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
     unsigned int i, j;
     int res;
 
-    ASSERT(domain_use_host_layout(kinfo->d));
+    ASSERT(domain_use_host_layout(kinfo->hdr.d));
 
     unalloc_mem = rangeset_new(NULL, NULL, 0);
     if ( !unalloc_mem )
@@ -331,23 +331,23 @@ void __init dtb_load(struct kernel_info *kinfo,
     unsigned long left;
 
     printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, kinfo->dtb_paddr,
+           kinfo->hdr.d, kinfo->dtb_paddr,
            kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
 
-    left = copy_to_guest(kinfo->d, kinfo->dtb_paddr,
+    left = copy_to_guest(kinfo->hdr.d, kinfo->dtb_paddr,
                          kinfo->fdt,
                          fdt_totalsize(kinfo->fdt));
 
     if ( left != 0 )
         panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
-              kinfo->d, left);
+              kinfo->hdr.d, left);
     xfree(kinfo->fdt);
 }
 
 void __init initrd_load(struct kernel_info *kinfo,
                         copy_to_guest_phys_cb copy_to_guest)
 {
-    const struct bootmodule *mod = kinfo->initrd_bootmodule;
+    const struct bootmodule *mod = kinfo->hdr.initrd;
     paddr_t load_addr = kinfo->initrd_paddr;
     paddr_t paddr, len;
     int node;
@@ -363,7 +363,7 @@ void __init initrd_load(struct kernel_info *kinfo,
     len = mod->size;
 
     printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, paddr, load_addr, load_addr + len);
+           kinfo->hdr.d, paddr, load_addr, load_addr + len);
 
     /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
     node = fdt_path_offset(kinfo->fdt, "/chosen");
@@ -386,12 +386,12 @@ void __init initrd_load(struct kernel_info *kinfo,
 
     initrd = ioremap_wc(paddr, len);
     if ( !initrd )
-        panic("Unable to map the %pd initrd\n", kinfo->d);
+        panic("Unable to map the %pd initrd\n", kinfo->hdr.d);
 
-    res = copy_to_guest(kinfo->d, load_addr,
+    res = copy_to_guest(kinfo->hdr.d, load_addr,
                         initrd, len);
     if ( res != 0 )
-        panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
+        panic("Unable to copy the initrd in the %pd memory\n", kinfo->hdr.d);
 
     iounmap(initrd);
 }
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
index cb04cd9d50..3960f951f7 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -136,16 +136,16 @@ int __init kernel_probe(struct kernel_info *info,
     /* domain is NULL only for the hardware domain */
     if ( domain == NULL )
     {
-        ASSERT(is_hardware_domain(info->d));
+        ASSERT(is_hardware_domain(info->hdr.d));
 
         mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
 
-        info->kernel_bootmodule = mod;
-        info->initrd_bootmodule = boot_module_find_by_kind(BOOTMOD_RAMDISK);
+        info->hdr.kernel = mod;
+        info->hdr.initrd = boot_module_find_by_kind(BOOTMOD_RAMDISK);
 
         cmd = boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
         if ( cmd )
-            info->cmdline = &cmd->cmdline[0];
+            info->hdr.cmdline = &cmd->cmdline[0];
     }
     else
     {
@@ -162,7 +162,7 @@ int __init kernel_probe(struct kernel_info *info,
                 dt_get_range(&val, node, &kernel_addr, &size);
                 mod = boot_module_find_by_addr_and_kind(
                         BOOTMOD_KERNEL, kernel_addr);
-                info->kernel_bootmodule = mod;
+                info->hdr.kernel = mod;
             }
             else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
             {
@@ -171,7 +171,7 @@ int __init kernel_probe(struct kernel_info *info,
 
                 val = dt_get_property(node, "reg", &len);
                 dt_get_range(&val, node, &initrd_addr, &size);
-                info->initrd_bootmodule = boot_module_find_by_addr_and_kind(
+                info->hdr.initrd = boot_module_find_by_addr_and_kind(
                         BOOTMOD_RAMDISK, initrd_addr);
             }
             else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
@@ -192,7 +192,7 @@ int __init kernel_probe(struct kernel_info *info,
         name = dt_node_name(domain);
         cmd = boot_cmdline_find_by_name(name);
         if ( cmd )
-            info->cmdline = &cmd->cmdline[0];
+            info->hdr.cmdline = &cmd->cmdline[0];
     }
     if ( !mod || !mod->size )
     {
@@ -201,10 +201,10 @@ int __init kernel_probe(struct kernel_info *info,
     }
 
     printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
-           info->d, info->kernel_bootmodule->start);
-    if ( info->initrd_bootmodule )
+           info->hdr.d, info->hdr.kernel->start);
+    if ( info->hdr.initrd )
         printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
-               info->initrd_bootmodule->start);
+               info->hdr.initrd->start);
 
     /*
      * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 4cab5d5202..e6d52a599f 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -100,6 +100,16 @@ struct shared_meminfo {
     struct shmem_membank_extra extra[NR_SHMEM_BANKS];
 };
 
+
+struct bootdomain {
+    struct domain *d;
+
+    struct bootmodule *kernel;
+    struct bootmodule *initrd;
+
+    const char* cmdline;
+};
+
 /*
  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
  * The purpose of the domU flag is to avoid getting confused in
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 1939c3ebf7..dd009f01d0 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -16,7 +16,7 @@
 #endif
 
 struct kernel_info {
-    struct domain *d;
+    struct bootdomain hdr;
 
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
@@ -34,8 +34,7 @@ struct kernel_info {
     paddr_t gnttab_size;
 
     /* boot blob load addresses */
-    const struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
-    const char* cmdline;
+    const struct bootmodule *dtb_bootmodule;
     paddr_t dtb_paddr;
     paddr_t initrd_paddr;
 
-- 
2.43.0


