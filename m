Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B786AFD618
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037026.1409707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjV-0006Iw-MZ; Tue, 08 Jul 2025 18:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037026.1409707; Tue, 08 Jul 2025 18:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjV-0006GY-IG; Tue, 08 Jul 2025 18:07:57 +0000
Received: by outflank-mailman (input) for mailman id 1037026;
 Tue, 08 Jul 2025 18:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjU-0005Uq-1m
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:07:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2412::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7669fbd5-5c26-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:07:53 +0200 (CEST)
Received: from BYAPR06CA0009.namprd06.prod.outlook.com (2603:10b6:a03:d4::22)
 by IA1PR12MB6411.namprd12.prod.outlook.com (2603:10b6:208:388::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Tue, 8 Jul
 2025 18:07:48 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::29) by BYAPR06CA0009.outlook.office365.com
 (2603:10b6:a03:d4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:07:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:07:47 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:07:44 -0500
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
X-Inumbo-ID: 7669fbd5-5c26-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqGIppWC2jyd4Pq1dv8MqLYBw/YWDOnvqfm6cjA/Yy00l79AKqkTqISNwcEvyflnUXD0CJhqs3670RdI4L5jlC/4YVup0n7eoj2yTAPzphtIPXFWTKo6hgGbJ62nWp6QyVMRQIqPUVCoJmVOCMpt7yGXMmKHEU7vUWaaavE8ChBGTz0VyWHQYUf5De6Lenxdd+GIp8fWUWeirPUs6ROYNLfjSvRGeeCBY2AjGJGB9FpmQKKL+t+gUSMBMFvxHAbpyef2BKLjEDk7E/VTVR6Uryw4xUUKsV5qNfl2n/PyaB89f2061pcRBD05uPUeImC/6ZvC377sNhDLcLQiXrarWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZH0ds50kWEP222EGsjitYeALVH+fONJgDunBeIXoSo=;
 b=OFrbgit5iwMHJ+VexhL+gCAFSK/bkN1Y9TCPPI26RtDbRHfi/krDdTp5KvdIeo0pvmRWZPEvSW3Sqsk8zgB8lCTueRuuaNtFAWYXHLV5xdEoWOUWV/oJL2xd84Lj68fU9cGx81RIvsVITTMCXROtSbqAYAU+TasDb9gEef2tAoET1TnBkyT9PMCEfRJ6+QQmNvzo6Sp0RkS8EIHCBvp4b/QNZQz1fIg0CsMibSJjb+lpvzcp21LFrJy3qvw9laMKeDigCKWd6Yrc8dFuz2CVr3XNX5H7DzrPH0HUQej5zigqux2THvzabTZa+faimCz1vH0wckZzXI4qS/gE2+AwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZH0ds50kWEP222EGsjitYeALVH+fONJgDunBeIXoSo=;
 b=yiUw3dewpSndlT1Arsm548blg691mn3CDfR9+GE9dP3v/KBbLO5RsMYjoRbJoBQAIlWjn1JWNr3yzZXzjc2CdinkNsceeA4yvinoxJXgA+qaaDPo2t+4iYKONt8PmZLnGhhSss1R4qcCZ3ReIhg1FpCJkLgGBuIg5u47/DmGjhI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 03/11] xen: Refactor kernel_info to have a header like boot_domain
Date: Tue, 8 Jul 2025 20:07:12 +0200
Message-ID: <20250708180721.2338036-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|IA1PR12MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 647b574e-2855-4879-a0a5-08ddbe4a586b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4rWTM+MqPU2TlAsSWaZh8k4OWZiDSoDBi8ze5x0fF43mEjKXKvOhuG4p2fk1?=
 =?us-ascii?Q?8aZreZqPUUtL/inLN/3RPgLkRwT86+82WdlfQ+kAcMlEZNC4OqjJkclf5/dh?=
 =?us-ascii?Q?FToI17eSwgaQE7/c9wAtBUygvygwpL2yM70DRjQ/8cGRY00QXJt6OKWyM0lv?=
 =?us-ascii?Q?MImzE9JjlDgYictgxA1/gw0S7B3lqz62yGL2Quxkrnk81lRav1Lz8cMU6A1v?=
 =?us-ascii?Q?/ZhgxjYPahT/hiLHp8BNVSEwtgCb9WB1Bo6HPEOt9RSjxS4aMv6xje0p5vyP?=
 =?us-ascii?Q?b4O4ksh7ncfyjuBp0mqwNe/vH25dqzMlNJSxd7r4AOeQMKmxCO4G5LssNLRR?=
 =?us-ascii?Q?owgIn1I84O7GT83pabOzus3jnkraYRTxg0ZGla63fuqeUXC1ocdAV0bylIV+?=
 =?us-ascii?Q?fvAhqOKHb96wDs/ywZjih/SwcVHI2gnDcInzAShXYeG8uVJKVrH9Rb+H4KU4?=
 =?us-ascii?Q?bLdvc9n55OFmGKUyY/H9+/PFM7lgtH84IJbeY+vmVqjK3pP4Dml7ZDbsZZEz?=
 =?us-ascii?Q?JpQMi3YDYwMEqPfC0brQHOLvLPnmHTtGqlwsO9v5QniT3y0WpK8y0ikRS0en?=
 =?us-ascii?Q?nx5p+WbtZ7XhEYvg2IGsoorbAjm8slX04QQWKMIIz1/1CEeFJKJxPND6fshG?=
 =?us-ascii?Q?/YmhfQ4cOKy9lEbwJp86kBFRmKpe5x0nEK8PpuyRmgpAJMtbuX8kyiOof5et?=
 =?us-ascii?Q?+zHsxN64BYOKc4/HaHtkjDE/8MsLwp+WtGCGzaFqaUH41EJqAMtZiR+cTZzs?=
 =?us-ascii?Q?p71MZvW1782M4FaoQ/HS8FFM0frMP7Q+t7nvYNuwizoWbkiyG9vJ9VHh9gyG?=
 =?us-ascii?Q?5jiQYnRA5Ef/s5QlizJ1PgcdhNzGmJeTc1oF1MdUDo4dpKg0fZiqgaXF/Een?=
 =?us-ascii?Q?6vblvRGow+JLksBra5MIW6crxLHIyrJXcmFjSXBC6q3wR4qKK85G3wsbqMAj?=
 =?us-ascii?Q?sC67jPsFKo0/4EDN43f+dxz93ZW/ia1ED07X8cJ8xwfkRKI45o4mjd8TyqTb?=
 =?us-ascii?Q?AMYcljcfNcQvADTbbp/Z9ku1Rb+Ilf8wTH8J9F30j/xzCZAystLdPqiAbaY6?=
 =?us-ascii?Q?vH4k8hR7JaJ4Pr2utFxfWJsieBgFO9VtRZPHD7kcns6p9IfULn3We/COrqSi?=
 =?us-ascii?Q?1WIvy6NejOAYnP/luqV7wLfJXx0T8mEtwOt4G+bu3PdM+BVL6SyAANRfSEkJ?=
 =?us-ascii?Q?5tTC0mAEWxNXZMlF0f+c2MIA8oAPLxRIr0O0TJsGYX2ZTNmaJf+wuGPI4B5z?=
 =?us-ascii?Q?Sb+Tr4fHE2Ga6B1XvvaoceFZkkAU8CA0590EJr7WLO25x9eAEuTSUd2Ihj9o?=
 =?us-ascii?Q?e0+/zxORdaTS520D6dSXgHCXLgt8pl6okaSBOnsb64gkJ+x2TCFiw+6G3EXc?=
 =?us-ascii?Q?urZacwRUe19Uxz9PyBOFgYQObA8Wi3yp4pWZU2AzAuWvIa8uqAOaFMqQOtmX?=
 =?us-ascii?Q?rTZcH7iA2cUBapgPFBtjVd0fTO8xTWDxRa6gdcT380aMppuKRnOQeBJ2hVsX?=
 =?us-ascii?Q?aQo2lTRO1kbfpJW3Hh9YgBaHoBKPhgS8sH80?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:07:47.5910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647b574e-2855-4879-a0a5-08ddbe4a586b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6411

From: Alejandro Vallejo <agarciav@amd.com>

Create a struct field within kernel_info with the contents common to
kernel_info and boot_domain, and define that field in common code. This
enables x86 to use that field as-is and drop x86's boot_domain.

Note that x86 mutates the module when releasing it, calculating headroom,
etc. So they must be made non-const on move.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v6:
  * Removed double blank between boot_domain and shared_meminfo
  * s/char */char* /
  * Amended commit message with rationale for loss of const
  * s/hdr/bd/
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
index 04d3dca38a..edc9a82c15 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -464,8 +464,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
     int had_dom0_bootargs = 0;
     struct dt_device_node *iommu_node;
 
-    if ( kinfo->cmdline && kinfo->cmdline[0] )
-        bootargs = &kinfo->cmdline[0];
+    if ( kinfo->bd.cmdline && kinfo->bd.cmdline[0] )
+        bootargs = &kinfo->bd.cmdline[0];
 
     /*
      * We always skip the IOMMU device when creating DT for hwdom if there is
@@ -579,7 +579,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
 
     if ( dt_node_path_is_equal(node, "/chosen") )
     {
-        const struct boot_module *initrd = kinfo->initrd;
+        const struct boot_module *initrd = kinfo->bd.initrd;
 
         if ( bootargs )
         {
@@ -1461,7 +1461,7 @@ int __init make_timer_node(const struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    if ( !is_64bit_domain(kinfo->d) )
+    if ( !is_64bit_domain(kinfo->bd.d) )
         res = fdt_property_string(fdt, "compatible", "arm,armv7-timer");
     else
         res = fdt_property_string(fdt, "compatible", "arm,armv8-timer");
@@ -1473,7 +1473,7 @@ int __init make_timer_node(const struct kernel_info *kinfo)
      * It always exposes an active-low level-sensitive interrupt.
      */
 
-    if ( is_hardware_domain(kinfo->d) )
+    if ( is_hardware_domain(kinfo->bd.d) )
     {
         irq[TIMER_PHYS_SECURE_PPI] = timer_get_irq(TIMER_PHYS_SECURE_PPI);
         irq[TIMER_PHYS_NONSECURE_PPI] =
@@ -1522,7 +1522,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
 {
     int res;
     const char *bootargs = NULL;
-    const struct boot_module *initrd = kinfo->initrd;
+    const struct boot_module *initrd = kinfo->bd.initrd;
     void *fdt = kinfo->fdt;
 
     dt_dprintk("Create chosen node\n");
@@ -1530,9 +1530,9 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
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
@@ -1981,7 +1981,7 @@ static int __init construct_dom0(struct domain *d)
     d->max_pages = dom0_mem >> PAGE_SHIFT;
 
     kinfo.unassigned_mem = dom0_mem;
-    kinfo.d = d;
+    kinfo.bd.d = d;
 
     rc = kernel_probe(&kinfo, NULL);
     if ( rc < 0 )
@@ -1993,7 +1993,7 @@ static int __init construct_dom0(struct domain *d)
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
index 221b875a2f..e950691d1e 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -167,18 +167,18 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
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
@@ -217,7 +217,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return -EINVAL;
     }
 
-    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
+    res = map_device_irqs_to_domain(kinfo->bd.d, node, true, NULL);
     if ( res < 0 )
         return res;
 
@@ -229,7 +229,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
 
-    return iommu_assign_dt_device(kinfo->d, node);
+    return iommu_assign_dt_device(kinfo->bd.d, node);
 }
 
 static int __init handle_prop_pfdt(struct kernel_info *kinfo,
@@ -296,14 +296,14 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
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
 
@@ -605,7 +605,7 @@ static int __init alloc_xenstore_page(struct domain *d)
 
 static int __init alloc_xenstore_params(struct kernel_info *kinfo)
 {
-    struct domain *d = kinfo->d;
+    struct domain *d = kinfo->bd.d;
     int rc = 0;
 
 #ifdef CONFIG_HVM
@@ -773,7 +773,7 @@ static int __init construct_domU(struct domain *d,
 
     d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
 
-    kinfo.d = d;
+    kinfo.bd.d = d;
 
     rc = kernel_probe(&kinfo, node);
     if ( rc < 0 )
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index e6d7b8961e..cc14bea195 100644
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
 
-    left = copy_to_guest(kinfo->d, kinfo->dtb_paddr,
+    left = copy_to_guest(kinfo->bd.d, kinfo->dtb_paddr,
                          kinfo->fdt,
                          fdt_totalsize(kinfo->fdt));
 
     if ( left != 0 )
         panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
-              kinfo->d, left);
+              kinfo->bd.d, left);
     xfree(kinfo->fdt);
 }
 
 void __init initrd_load(struct kernel_info *kinfo,
                         copy_to_guest_phys_cb copy_to_guest)
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
@@ -396,12 +396,12 @@ void __init initrd_load(struct kernel_info *kinfo,
 
     initrd = ioremap_wc(paddr, len);
     if ( !initrd )
-        panic("Unable to map the %pd initrd\n", kinfo->d);
+        panic("Unable to map the %pd initrd\n", kinfo->bd.d);
 
-    res = copy_to_guest(kinfo->d, load_addr,
+    res = copy_to_guest(kinfo->bd.d, load_addr,
                         initrd, len);
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
index 1b19069833..28f7d18262 100644
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


