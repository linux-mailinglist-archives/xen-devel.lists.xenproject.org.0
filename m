Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B5B0CE8D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051776.1420226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W7-00066j-D9; Tue, 22 Jul 2025 00:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051776.1420226; Tue, 22 Jul 2025 00:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W7-0005yO-4V; Tue, 22 Jul 2025 00:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1051776;
 Tue, 22 Jul 2025 00:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0W5-0005Mp-FI
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:05:57 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2416::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2010e87-668f-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 02:05:54 +0200 (CEST)
Received: from BN8PR15CA0057.namprd15.prod.outlook.com (2603:10b6:408:80::34)
 by CH1PPFC908D89D1.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::623) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:05:47 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:80:cafe::1) by BN8PR15CA0057.outlook.office365.com
 (2603:10b6:408:80::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:05:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:46 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:44 -0500
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
X-Inumbo-ID: a2010e87-668f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouGISFxczYD+g2VZvYroZ+1CiHDZhecMyBnfsZ8Ssf0QNzZOwhbHhdvKo4WBDVZO8x9VM9/FWB1dp14fACw0J91eFY9Ga+dFV4R3TWg/cBrhnTTO+TmBUxcO3CW7K/YjDfXRAwR4o8zCZLmqb+AIOuThaPZlvVK2Po72pczoW+ZzClHOiGUqEWQjAUby2QM1K90hDJnuZ07zQATSOM3etzb6qNqx4jvpW42VpQmUWuA++hSgGaXBAigbAnllSCCKtz3mv1yCOsJQ/Rf/8hB6nbwPbREQ2CNWxROPd6f1D7FmzevCODlx6ELMLiii3nXyQOgt55EZNM8yCsVJwmoajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVmWUOR5tN0/J1VHr5jY2nMc+/jhOV+qqX3RTl/dlGg=;
 b=Bw2rs/T5aD4Zup6WgvCvNU0kgxVTZOD+Tpl5vnp16pf5/53tGapDPNPn2KCkoKmtl3AE9UYs/JU1z48Sx2rjlIbAlkEtxZSssS/UuER2cocWUpSKBne/0DemIO4vxGooFYl+pCBkzFTuSa6Qm4VSvXTJLdO8F+a9Eaa4ruY9ZD/4DUbOOphHzdRLPBfc4J8PKNYfK8VS/d8pvHAN5nAdIqUJos9iEdOsvvxMNsgnl1t4sBga8JshTUtnLHvqLLZ96yHg42Q6WpFhAf9Q9FPOlVs7fOOpHFinohLcG6s7oBu1FLvLKaVsX+Z4BiSK/tTG62BU/F2yzJO7iFTTwaoIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVmWUOR5tN0/J1VHr5jY2nMc+/jhOV+qqX3RTl/dlGg=;
 b=DukQP0aOjVZElzo861dOY7FYmizzx3JiIr9XnhfEmgcjZopIr/NgBbg/zy4RTspBHNM52BZba0iecPPjF2kjogdE5wEyNy6o1obXKNIRYOGyA/+gt2ON2XcfEkXMA2Owg36ZS2gvQBCCYHe4StIdiIMV13UFF3VoL9Tja5dDa9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 02/11] xen: Refactor kernel_info to have a header like boot_domain
Date: Tue, 22 Jul 2025 02:05:14 +0200
Message-ID: <20250722000525.7247-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|CH1PPFC908D89D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 77242410-a2f4-4ff5-3b6b-08ddc8b38244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5sjf8HJDbSLsxrcylHWhyk2OUgqmZZ+DhXozLMBUumjK9BWrWoMHhsUtcxJO?=
 =?us-ascii?Q?HDmIfd4k97I8pahAxWULAdQMkD/OSAr3sLq72RF/85fVTyKNzE+Kh42nDf7D?=
 =?us-ascii?Q?XATC+eD04T60MDRepdxR5RNCN+Qy3O0LkxP8shMy8ZtP7mNx0gnkiDTUUNBd?=
 =?us-ascii?Q?i6rePBLme/KPHKUtLBAHZNHaMrrMNYbD5QZE6wpRIfMFWl7g8SDwd7PkzgVS?=
 =?us-ascii?Q?n85ikgnQmaBuTo7gKF2/6KNimL+UkT694GrCrVVP1wWZKIMvtSiPXU5OwGzY?=
 =?us-ascii?Q?FIEsi+Pc2LcS6/5WueQQCQoPqQSHtiuln0yL81CbpCjQRORPWVNHhqZSxBGX?=
 =?us-ascii?Q?QC8U70eRiV9rS2ElYPgFwlgZNWiHOQVV+sLlXNcO+hz+4JaDgw2g2PfOHLOR?=
 =?us-ascii?Q?livXRdb6dADze8JVIp5YErPHcBxuWXeRs/i4ujaOVlEG8fX+uFR+qMQfM5LS?=
 =?us-ascii?Q?NzYWreXqFb7Ini5TTLIrveP+QhJnKexVqIFWaHLatZLmP2WIjJuwOqJA0sDB?=
 =?us-ascii?Q?dGTIL8E0A8t2IxZ+MQykzpJQFKFf7C62c6U2F2by5cccqRGPQTPVLXWUyWK3?=
 =?us-ascii?Q?MvtAbEj8oFpfAyPPlRfVGr4S/MgbMx/zOt8hsV+eraQLRZpE+hdssfAHZN2C?=
 =?us-ascii?Q?rx7KGUdDsBH4N8j0F5PWLD2AialE64AV/Dn0YbVlbYmRsl4wTl8wRaLcl3MT?=
 =?us-ascii?Q?trnZdcgdTh30uGwty7tOy174+tFsTJQ65kEKHUr4z78reHHoZHl60rFFtgqj?=
 =?us-ascii?Q?Gs4wMolB+NfL4vs9FsarwSb9ZQ0zo16lwdIgiwhkrnYsLfRM46dnizqOAHYr?=
 =?us-ascii?Q?FWoMWOW6fGqumrQtDKRpzrg4EP5Gig8k4FyeU4n3ex8kry210Kxz5xEUG566?=
 =?us-ascii?Q?TKMMB0QPcdoV5H9BMxrr456YVCIma2WdL+UL4E7j/m0JRZugG7Exc6WiAGbD?=
 =?us-ascii?Q?9h85k9p15EOzX+jZob5cSgbUNNqTJjCIzHd/TPFXVsO3vIiSfyySIfkME0WM?=
 =?us-ascii?Q?9FmpiQ6rufLowwGreQ/tlA+CLr8wSsKJd252HYVUFfIV2k0YJEJrMwXeJM5H?=
 =?us-ascii?Q?B7/6BSpqG00OF4uLuUYuagKhilXtl41Iw5q232VDtNj6zD0Ph5mzZUtBlsNB?=
 =?us-ascii?Q?1Y4fAIjkCdDpmSs+WjNjU7qGKI88x0PpzuInk3z0d85ptLOlVqMpOwPxmcH9?=
 =?us-ascii?Q?n6J5692NwcCl67h7wsoiViFjmydjLz7gQb4wmX3rXpQqQc3J+uORX0rVFpxh?=
 =?us-ascii?Q?1SgCfcp3L32GU1KxA2eDfOYV7q3TVsJRWPbTMmg1cd6oyjJdBvybt7+jB57q?=
 =?us-ascii?Q?aU2dbxdusNQy1KMTPcqXuzm63lazKL31e0kQAcTN1NPXGFHZDu7P7kqzLR4j?=
 =?us-ascii?Q?t0WWE6rwXPgUbBPLkq1wcui9fIsi44Q/xX7M8WzERsZ9rclGV0o8thLL8cdi?=
 =?us-ascii?Q?z4/H4NOxKL2Pm02NZ/+ifptnWsDZitZbwpICdS8H/L+lWTMF+NLSlM3XL+wY?=
 =?us-ascii?Q?0NS+bVmadjEn5zMVvtbldz9JLbWOSFxN51Z1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:46.6255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77242410-a2f4-4ff5-3b6b-08ddc8b38244
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC908D89D1

Create a struct field within kernel_info with the contents common to
kernel_info and boot_domain, and define that field in common code. This
enables x86 to use that field as-is and drop x86's boot_domain.

Note that x86 mutates the module when releasing it, calculating headroom,
etc. So they must be made non-const on move.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/arm/dom0less-build.c           |  8 ++++----
 xen/arch/arm/domain_build.c             | 20 ++++++++++----------
 xen/arch/arm/kernel.c                   |  8 ++++----
 xen/common/device-tree/dom0less-build.c | 18 +++++++++---------
 xen/common/device-tree/domain-build.c   | 20 ++++++++++----------
 xen/common/device-tree/kernel.c         | 20 ++++++++++----------
 xen/include/xen/bootfdt.h               |  9 +++++++++
 xen/include/xen/fdt-kernel.h            |  5 ++---
 8 files changed, 58 insertions(+), 50 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4b285cff5e..69b9ea22ce 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -32,7 +32,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
-    const struct domain *d = kinfo->d;
+    const struct domain *d = kinfo->bd.d;
 
     res = domain_fdt_begin_node(fdt, "interrupt-controller",
                                 vgic_dist_base(&d->arch.vgic));
@@ -85,7 +85,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     void *fdt = kinfo->fdt;
     int res = 0;
     __be32 *reg, *cells;
-    const struct domain *d = kinfo->d;
+    const struct domain *d = kinfo->bd.d;
     unsigned int i, len = 0;
 
     res = domain_fdt_begin_node(fdt, "interrupt-controller",
@@ -152,7 +152,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 
 int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
-    switch ( kinfo->d->arch.vgic.version )
+    switch ( kinfo->bd.d->arch.vgic.version )
     {
 #ifdef CONFIG_GICV3
     case GIC_V3:
@@ -175,7 +175,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->bd.d;
 
     res = domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_addr);
     if ( res )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ed668bd61c..5f81d060dd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -459,8 +459,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
     int had_dom0_bootargs = 0;
     struct dt_device_node *iommu_node;
 
-    if ( kinfo->cmdline && kinfo->cmdline[0] )
-        bootargs = &kinfo->cmdline[0];
+    if ( kinfo->bd.cmdline && kinfo->bd.cmdline[0] )
+        bootargs = &kinfo->bd.cmdline[0];
 
     /*
      * We always skip the IOMMU device when creating DT for hwdom if there is
@@ -574,7 +574,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
 
     if ( dt_node_path_is_equal(node, "/chosen") )
     {
-        const struct boot_module *initrd = kinfo->initrd;
+        const struct boot_module *initrd = kinfo->bd.initrd;
 
         if ( bootargs )
         {
@@ -1456,7 +1456,7 @@ int __init make_timer_node(const struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    if ( !is_64bit_domain(kinfo->d) )
+    if ( !is_64bit_domain(kinfo->bd.d) )
         res = fdt_property_string(fdt, "compatible", "arm,armv7-timer");
     else
         res = fdt_property_string(fdt, "compatible", "arm,armv8-timer");
@@ -1468,7 +1468,7 @@ int __init make_timer_node(const struct kernel_info *kinfo)
      * It always exposes an active-low level-sensitive interrupt.
      */
 
-    if ( is_hardware_domain(kinfo->d) )
+    if ( is_hardware_domain(kinfo->bd.d) )
     {
         irq[TIMER_PHYS_SECURE_PPI] = timer_get_irq(TIMER_PHYS_SECURE_PPI);
         irq[TIMER_PHYS_NONSECURE_PPI] =
@@ -1517,7 +1517,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
 {
     int res;
     const char *bootargs = NULL;
-    const struct boot_module *initrd = kinfo->initrd;
+    const struct boot_module *initrd = kinfo->bd.initrd;
     void *fdt = kinfo->fdt;
 
     dt_dprintk("Create chosen node\n");
@@ -1525,9 +1525,9 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    if ( kinfo->cmdline && kinfo->cmdline[0] )
+    if ( kinfo->bd.cmdline && kinfo->bd.cmdline[0] )
     {
-        bootargs = &kinfo->cmdline[0];
+        bootargs = &kinfo->bd.cmdline[0];
         res = fdt_property(fdt, "bootargs", bootargs, strlen(bootargs) + 1);
         if ( res )
            return res;
@@ -1976,7 +1976,7 @@ static int __init construct_dom0(struct domain *d)
     d->max_pages = dom0_mem >> PAGE_SHIFT;
 
     kinfo.unassigned_mem = dom0_mem;
-    kinfo.d = d;
+    kinfo.bd.d = d;
 
     rc = kernel_probe(&kinfo, NULL);
     if ( rc < 0 )
@@ -1988,7 +1988,7 @@ static int __init construct_dom0(struct domain *d)
 int __init construct_hwdom(struct kernel_info *kinfo,
                            const struct dt_device_node *node)
 {
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->bd.d;
     int rc;
 
     iommu_hwdom_init(d);
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index e734ec5c1e..48f4b56d0c 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -46,7 +46,7 @@ static void __init place_modules(struct kernel_info *info,
                                  paddr_t kernbase, paddr_t kernend)
 {
     /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
-    const struct boot_module *mod = info->initrd;
+    const struct boot_module *mod = info->bd.initrd;
     const struct membanks *mem = kernel_info_get_mem(info);
     const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
     const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
@@ -152,12 +152,12 @@ static void __init kernel_zimage_load(struct kernel_info *info)
 
     kernel = ioremap_wc(paddr, len);
     if ( !kernel )
-        panic("Unable to map the %pd kernel\n", info->d);
+        panic("Unable to map the %pd kernel\n", info->bd.d);
 
-    rc = copy_to_guest_phys_flush_dcache(info->d, load_addr,
+    rc = copy_to_guest_phys_flush_dcache(info->bd.d, load_addr,
                                          kernel, len);
     if ( rc != 0 )
-        panic("Unable to copy the kernel in the %pd memory\n", info->d);
+        panic("Unable to copy the kernel in the %pd memory\n", info->bd.d);
 
     iounmap(kernel);
 }
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 0012046574..15b3c4b241 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -170,18 +170,18 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
             return -EINVAL;
         }
 
-        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
+        res = iomem_permit_access(kinfo->bd.d, paddr_to_pfn(mstart),
                                   paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
         if ( res )
         {
             printk(XENLOG_ERR "Unable to permit to dom%d access to"
                    " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
-                   kinfo->d->domain_id,
+                   kinfo->bd.d->domain_id,
                    mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
             return res;
         }
 
-        res = map_regions_p2mt(kinfo->d,
+        res = map_regions_p2mt(kinfo->bd.d,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
                                maddr_to_mfn(mstart),
@@ -220,7 +220,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return -EINVAL;
     }
 
-    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
+    res = map_device_irqs_to_domain(kinfo->bd.d, node, true, NULL);
     if ( res < 0 )
         return res;
 
@@ -232,7 +232,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
 
-    return iommu_assign_dt_device(kinfo->d, node);
+    return iommu_assign_dt_device(kinfo->bd.d, node);
 }
 
 static int __init handle_prop_pfdt(struct kernel_info *kinfo,
@@ -299,14 +299,14 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
                                       address_cells, size_cells);
         if ( res < 0 )
         {
-            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo->d);
+            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo->bd.d);
             return res;
         }
     }
     else if ( (xen_path && !xen_reg) || (xen_reg && !xen_path && !xen_force) )
     {
         printk(XENLOG_ERR "xen,reg or xen,path missing for %pd\n",
-               kinfo->d);
+               kinfo->bd.d);
         return -EINVAL;
     }
 
@@ -608,7 +608,7 @@ static int __init alloc_xenstore_page(struct domain *d)
 
 static int __init alloc_xenstore_params(struct kernel_info *kinfo)
 {
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->bd.d;
     int rc = 0;
 
 #ifdef CONFIG_HVM
@@ -776,7 +776,7 @@ static int __init construct_domU(struct domain *d,
 
     d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
 
-    kinfo.d = d;
+    kinfo.bd.d = d;
 
     rc = kernel_probe(&kinfo, node);
     if ( rc < 0 )
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 4eea095e49..2fdea6624a 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -76,7 +76,7 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                                  paddr_t tot_size)
 {
     struct membanks *mem = kernel_info_get_mem(kinfo);
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->bd.d;
     struct membank *bank;
 
     /*
@@ -170,7 +170,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
     unsigned int i, j;
     int res;
 
-    ASSERT(domain_use_host_layout(kinfo->d));
+    ASSERT(domain_use_host_layout(kinfo->bd.d));
 
     unalloc_mem = rangeset_new(NULL, NULL, 0);
     if ( !unalloc_mem )
@@ -341,23 +341,23 @@ void __init dtb_load(struct kernel_info *kinfo,
     unsigned long left;
 
     printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, kinfo->dtb_paddr,
+           kinfo->bd.d, kinfo->dtb_paddr,
            kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
 
-    left = cb(kinfo->d, kinfo->dtb_paddr,
+    left = cb(kinfo->bd.d, kinfo->dtb_paddr,
               kinfo->fdt,
               fdt_totalsize(kinfo->fdt));
 
     if ( left != 0 )
         panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
-              kinfo->d, left);
+              kinfo->bd.d, left);
     xfree(kinfo->fdt);
 }
 
 void __init initrd_load(struct kernel_info *kinfo,
                         copy_to_guest_phys_cb cb)
 {
-    const struct boot_module *mod = kinfo->initrd;
+    const struct boot_module *mod = kinfo->bd.initrd;
     paddr_t load_addr = kinfo->initrd_paddr;
     paddr_t paddr, len;
     int node;
@@ -373,7 +373,7 @@ void __init initrd_load(struct kernel_info *kinfo,
     len = mod->size;
 
     printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, paddr, load_addr, load_addr + len);
+           kinfo->bd.d, paddr, load_addr, load_addr + len);
 
     /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
     node = fdt_path_offset(kinfo->fdt, "/chosen");
@@ -396,11 +396,11 @@ void __init initrd_load(struct kernel_info *kinfo,
 
     initrd = ioremap_wc(paddr, len);
     if ( !initrd )
-        panic("Unable to map the %pd initrd\n", kinfo->d);
+        panic("Unable to map the %pd initrd\n", kinfo->bd.d);
 
-    res = cb(kinfo->d, load_addr, initrd, len);
+    res = cb(kinfo->bd.d, load_addr, initrd, len);
     if ( res != 0 )
-        panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
+        panic("Unable to copy the initrd in the %pd memory\n", kinfo->bd.d);
 
     iounmap(initrd);
 }
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
index e1b22dc1c7..6de2334dbe 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -136,16 +136,16 @@ int __init kernel_probe(struct kernel_info *info,
     /* domain is NULL only for the hardware domain */
     if ( domain == NULL )
     {
-        ASSERT(is_hardware_domain(info->d));
+        ASSERT(is_hardware_domain(info->bd.d));
 
         mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
 
-        info->kernel = mod;
-        info->initrd = boot_module_find_by_kind(BOOTMOD_RAMDISK);
+        info->bd.kernel = mod;
+        info->bd.initrd = boot_module_find_by_kind(BOOTMOD_RAMDISK);
 
         cmd = boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
         if ( cmd )
-            info->cmdline = &cmd->cmdline[0];
+            info->bd.cmdline = &cmd->cmdline[0];
     }
     else
     {
@@ -162,7 +162,7 @@ int __init kernel_probe(struct kernel_info *info,
                 dt_get_range(&val, node, &kernel_addr, &size);
                 mod = boot_module_find_by_addr_and_kind(
                         BOOTMOD_KERNEL, kernel_addr);
-                info->kernel = mod;
+                info->bd.kernel = mod;
             }
             else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
             {
@@ -171,7 +171,7 @@ int __init kernel_probe(struct kernel_info *info,
 
                 val = dt_get_property(node, "reg", &len);
                 dt_get_range(&val, node, &initrd_addr, &size);
-                info->initrd = boot_module_find_by_addr_and_kind(
+                info->bd.initrd = boot_module_find_by_addr_and_kind(
                         BOOTMOD_RAMDISK, initrd_addr);
             }
             else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
@@ -192,7 +192,7 @@ int __init kernel_probe(struct kernel_info *info,
         name = dt_node_name(domain);
         cmd = boot_cmdline_find_by_name(name);
         if ( cmd )
-            info->cmdline = &cmd->cmdline[0];
+            info->bd.cmdline = &cmd->cmdline[0];
     }
     if ( !mod || !mod->size )
     {
@@ -201,10 +201,10 @@ int __init kernel_probe(struct kernel_info *info,
     }
 
     printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
-           info->d, info->kernel->start);
-    if ( info->initrd )
+           info->bd.d, info->bd.kernel->start);
+    if ( info->bd.initrd )
         printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
-               info->initrd->start);
+               info->bd.initrd->start);
 
     /*
      * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 1218b23bb4..fceffaf2ec 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -100,6 +100,15 @@ struct shared_meminfo {
     struct shmem_membank_extra extra[NR_SHMEM_BANKS];
 };
 
+struct boot_domain {
+    struct domain *d;
+
+    struct boot_module *kernel;
+    struct boot_module *initrd;
+
+    const char *cmdline;
+};
+
 #define BOOTMOD_MAX_CMDLINE 1024
 struct boot_module {
     boot_module_kind kind;
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 12a0b42d17..8363865282 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -16,7 +16,7 @@
 #endif
 
 struct kernel_info {
-    struct domain *d;
+    struct boot_domain bd;
 
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
@@ -34,8 +34,7 @@ struct kernel_info {
     paddr_t gnttab_size;
 
     /* boot blob load addresses */
-    const struct boot_module *kernel, *initrd, *dtb;
-    const char* cmdline;
+    const struct boot_module *dtb;
     paddr_t dtb_paddr;
     paddr_t initrd_paddr;
 
-- 
2.43.0


