Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8589AD90F5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014461.1392600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ69G-0002BE-Td; Fri, 13 Jun 2025 15:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014461.1392600; Fri, 13 Jun 2025 15:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ69G-000275-N2; Fri, 13 Jun 2025 15:16:54 +0000
Received: by outflank-mailman (input) for mailman id 1014461;
 Fri, 13 Jun 2025 15:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ69E-0001Mm-LU
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:16:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d7ea6ae-4869-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:16:50 +0200 (CEST)
Received: from DS7PR03CA0176.namprd03.prod.outlook.com (2603:10b6:5:3b2::31)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Fri, 13 Jun
 2025 15:16:45 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::e5) by DS7PR03CA0176.outlook.office365.com
 (2603:10b6:5:3b2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 15:16:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:45 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:41 -0500
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
X-Inumbo-ID: 6d7ea6ae-4869-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRrcV1wxy/9R3ITreg1GW+QpAfCRt8Cw2HU1Dud2GjrdD5yC7eDpLjQqs+YnGEoBDpWR2RofdgIo0/UQ2YAkbgMrQSWcIfAowbYoqthQZxO0EKlPeZqCs8WIGJQIHrAxrDgSlYibIGLUJWzJY+7NWEoBES7tePYZbcyJ130fxBeRvfmAyo177WeGqxDSsTjc05Dwzxj2loXyBU1fghYule+W8/8bBZeV6XZakLhbe70vDaqyRydyjeMZB+tzJB3dXYmnX/CRjXzeIGqimGo0HI5qZCkUHWeKTX5O/c6bYSKNWf/23U9fXlPwAVyPzVaR93LEXXMEuki7+t3/bYdnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WQXdNCQ4YEFOlOGIA7yPbS/pDs+RBMFXfZvWeMamn8=;
 b=yxJJ27BR1MsWa8mbzQQmoaC9T6NbyQwb0MEgjn2XOvTvhXkZv+30LvvK78+5xWBjxCzYLgyekFgYj+fMQFoQ6r8Qq1OUqQCc4Hx1z9EC5m9wk7cFxi+r9cvT11HE07OizZsyUhGvKYpJKqbRtSdAYw/l0LDQNZMN9dQtBQ4wGc5PiyTIlfY9Y0KVLhwI5Hv3g++pnGpLpKZNGGqw2gFo/O+Tg3axqo0ZJdzUjhXc+V8SGoLJkyhetUeCZXLgyrkB7CNJo5bIpx0IYyJiTAsxjhlQEaKNiz716pL+pDV+ZOteWjwUBXb4qtciPTq+n+6bcTSS6Jd4/hsAZZqFm+0sTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WQXdNCQ4YEFOlOGIA7yPbS/pDs+RBMFXfZvWeMamn8=;
 b=3uSUr01nwq1y+fArkxvdyAxlINDZG5EzlXuuJ161zRkVyhzWSqwDsP5pdOPCK5OBZ+TE8JGaSQFRJ28WVPlRI15Bh+2eUpUZSl9fYx0mxCzs/8Lvl33s1I4m0EnIJCyS2nRSUBgIT8VYnIwFjQbsDByx8ro/GiIz672oZz9q6Vk=
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
Subject: [PATCH v3 06/14] xen: Refactor kernel_info to have a header like boot_domain
Date: Fri, 13 Jun 2025 17:13:15 +0200
Message-ID: <20250613151612.754222-7-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b0e233-9149-42e7-75f7-08ddaa8d4f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LHith88iTN5vFu3ItrV6WgdAvW94M5qsOdxy0vUwfy9yMDzr7U8x9Kk7rY0M?=
 =?us-ascii?Q?C8hRDaGpgJ65wELVdYJsMTCj77xQ8TixaW2WB4OCHLPmRJAgfbhwQIXhvBas?=
 =?us-ascii?Q?tFhA33F0LYgRDdth5v21Dvuh5u2qzHyZ/5vdSs5TTrskaKXNpKT+28Pduk1I?=
 =?us-ascii?Q?RBi/2ZOgb7fcihDrWApvnqhoBfOe9FZOxBFoE6mud/wtgT9TBdU7lB/wxSZj?=
 =?us-ascii?Q?6iJOCWeLcWsD4SA7EVTfW+aXQrNuDqmyvF9DCa0TFA1Z+SzmiFcwcCkRA68s?=
 =?us-ascii?Q?WNmZ0dxPR21KjbiFPS8gIXAUCnCIbYa3+jTfmriq/sBkAOS0u4z/rSujnEUB?=
 =?us-ascii?Q?J47RWCvtsHsPGS6bJu9rRjzYyyiGPGd6IZ2VfRzVSCYFfHa/KKAWcLUeywa7?=
 =?us-ascii?Q?e2zkRg0GbPmwrWeggpRFizwMiU2OO/wIHF4ZJdBIxnd0ELZ2VV3w9PWtearE?=
 =?us-ascii?Q?bINkPCs5nohZNVYWhXkgx3sO1Wl1t9Jb2ymjgB/E8SwvoQ2r4clK2p/zModE?=
 =?us-ascii?Q?ydUAs6fgs9ISXSrLMKv15LCIwmWdZjP+K1pNpGYQAn8e94c4p4b/dVNWlKit?=
 =?us-ascii?Q?hLytPeWJr10Fh/Nv2fhG5k2W64BWfDjSYujEkxn3yrhwzOzVhpTqS/JjoOTZ?=
 =?us-ascii?Q?YJynHSZEch/+JC8NoUzlx538Vyb2yX4ZvvQ9qIfWurHSsNCTDWFacXxf2BGk?=
 =?us-ascii?Q?sdIiYgmuF9ouXYF7qrwQLSiaXD23/Nt/zx38cK2uy8+/4z8ORkoOxrvCPuw3?=
 =?us-ascii?Q?N3mvZRq7GN9anT2HPiSDeC1i1X9T98wvfOLGDGjejCyjdzejjqx1c8QoZ02b?=
 =?us-ascii?Q?bI8NU9qKM9XtU1owYR1FIm2OzaAEmVsmZ2t0JIXq0Jzo58ch84CLYeRIlxlQ?=
 =?us-ascii?Q?gb7+uxztV/Cp10Y5GdkbvhbQPwcTpVQWBYQrvkJQRhbcNhDVOpG5n7f8H/CW?=
 =?us-ascii?Q?QrcsiMHjlH5EdNK2f0CKI1PndQ37khmsligTr2LjWfzIxfBXZwVHH0l140VD?=
 =?us-ascii?Q?ps6oz/wIyEjyX6+5CSUqHsubxm1G1P/38lWNOId38GnQEV/1iQ+owtHnqzpN?=
 =?us-ascii?Q?MkeQOvolZ9/hP+Ee2MDZcqSTPtWJkGzdLN/2Uqr73hWSEHR+BoYSFJ2krjwQ?=
 =?us-ascii?Q?9tsVWGzwItNiGh+061SSTtBNqBb716ej4ZJm0A1bhO8pdfcktcJiC2Ph9YSG?=
 =?us-ascii?Q?/9Ny/OHGkUxyxeTLoraG4YCPyvo9E1SN3sKrwit8/Dv0GA2bXDur5RlE02Fi?=
 =?us-ascii?Q?bXglGkcWLK4Wu6ZHxQNsXfNkAhRH2owSpv+AKT50B7ED808nH4hXiaXnM7Gg?=
 =?us-ascii?Q?i694l0OpB5VTMHz4N+kQwNsI2kWEfBSq35WRcu+FmH/iukNJGyUKsm7sQWG8?=
 =?us-ascii?Q?BEJE2f1HcGcX1/00wkQtv7SZ2XiDv0kk3RDTRyYj+IwpreYYr5e9OXxJdI5j?=
 =?us-ascii?Q?kbDIlw4FDYuA2hn/VOrl77sqfez1C0asZVCIRhtq6Q31t+GcIsov8OJewAuV?=
 =?us-ascii?Q?xddq999NBTrw+hqd3U79YazeUlhujjJN2fR9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:45.0276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b0e233-9149-42e7-75f7-08ddaa8d4f20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993

Create a struct header within kernel_info with the contents common to
kernel_info and boot_domain, and define that header in common code. This enables
x86 to use that header as-is and drop x86's boot_domain.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v3:
  * s/bootdomain/boot_domain/
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
index 7096e176ed..4eb1ed0548 100644
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
-        const struct boot_module *initrd = kinfo->initrd;
+        const struct boot_module *initrd = kinfo->hdr.initrd;
 
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
-    const struct boot_module *initrd = kinfo->initrd;
+    const struct boot_module *initrd = kinfo->hdr.initrd;
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
index e734ec5c1e..10e5dcad5e 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -46,7 +46,7 @@ static void __init place_modules(struct kernel_info *info,
                                  paddr_t kernbase, paddr_t kernend)
 {
     /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
-    const struct boot_module *mod = info->initrd;
+    const struct boot_module *mod = info->hdr.initrd;
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
index 221b875a2f..e321747175 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -167,18 +167,18 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
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
@@ -217,7 +217,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return -EINVAL;
     }
 
-    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
+    res = map_device_irqs_to_domain(kinfo->hdr.d, node, true, NULL);
     if ( res < 0 )
         return res;
 
@@ -229,7 +229,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
 
-    return iommu_assign_dt_device(kinfo->d, node);
+    return iommu_assign_dt_device(kinfo->hdr.d, node);
 }
 
 static int __init handle_prop_pfdt(struct kernel_info *kinfo,
@@ -296,14 +296,14 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
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
 
@@ -605,7 +605,7 @@ static int __init alloc_xenstore_page(struct domain *d)
 
 static int __init alloc_xenstore_params(struct kernel_info *kinfo)
 {
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->hdr.d;
     int rc = 0;
 
 #ifdef CONFIG_HVM
@@ -773,7 +773,7 @@ static int __init construct_domU(struct domain *d,
 
     d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
 
-    kinfo.d = d;
+    kinfo.hdr.d = d;
 
     rc = kernel_probe(&kinfo, node);
     if ( rc < 0 )
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index fa4f700597..6014e39fd6 100644
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
-    const struct boot_module *mod = kinfo->initrd;
+    const struct boot_module *mod = kinfo->hdr.initrd;
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
index e1b22dc1c7..7a00768e6b 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -136,16 +136,16 @@ int __init kernel_probe(struct kernel_info *info,
     /* domain is NULL only for the hardware domain */
     if ( domain == NULL )
     {
-        ASSERT(is_hardware_domain(info->d));
+        ASSERT(is_hardware_domain(info->hdr.d));
 
         mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
 
-        info->kernel = mod;
-        info->initrd = boot_module_find_by_kind(BOOTMOD_RAMDISK);
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
-                info->kernel = mod;
+                info->hdr.kernel = mod;
             }
             else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
             {
@@ -171,7 +171,7 @@ int __init kernel_probe(struct kernel_info *info,
 
                 val = dt_get_property(node, "reg", &len);
                 dt_get_range(&val, node, &initrd_addr, &size);
-                info->initrd = boot_module_find_by_addr_and_kind(
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
-           info->d, info->kernel->start);
-    if ( info->initrd )
+           info->hdr.d, info->hdr.kernel->start);
+    if ( info->hdr.initrd )
         printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
-               info->initrd->start);
+               info->hdr.initrd->start);
 
     /*
      * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 854e7f1ed9..be0abe30ef 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -100,6 +100,16 @@ struct shared_meminfo {
     struct shmem_membank_extra extra[NR_SHMEM_BANKS];
 };
 
+
+struct boot_domain {
+    struct domain *d;
+
+    struct boot_module *kernel;
+    struct boot_module *initrd;
+
+    const char* cmdline;
+};
+
 /*
  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
  * The purpose of the domU flag is to avoid getting confused in
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 12a0b42d17..fee8eac1db 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -16,7 +16,7 @@
 #endif
 
 struct kernel_info {
-    struct domain *d;
+    struct boot_domain hdr;
 
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


