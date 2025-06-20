Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EB5AE2231
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021092.1397155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgVG-0007Vg-PN; Fri, 20 Jun 2025 18:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021092.1397155; Fri, 20 Jun 2025 18:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgVG-0007TV-MP; Fri, 20 Jun 2025 18:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1021092;
 Fri, 20 Jun 2025 18:30:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgVE-00057I-PU
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:30:16 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2416::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b394206-4e04-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 20:30:15 +0200 (CEST)
Received: from BN8PR03CA0024.namprd03.prod.outlook.com (2603:10b6:408:94::37)
 by PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Fri, 20 Jun
 2025 18:30:11 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:94:cafe::9) by BN8PR03CA0024.outlook.office365.com
 (2603:10b6:408:94::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:30:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:30:10 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:30:01 -0500
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
X-Inumbo-ID: 9b394206-4e04-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKqbXYmxlwYOpv+aef1UraqpyNZK87VJ4V8I+7uCGlOH4+KWCy8FlosWg/BlYE7abA5WujSacOjVa4+cM3FseZWYZJfp3P2PR7f7gwFeo8HnoxpUEhTzBU4GgVl9lQDAA+SSIqTBWMQwLVUHYmk4fnWY1KzFX0Y4VEgKG71qgMDkqRVBHFyioaEweHyxgtcifWJKjXtO0MVBsRsjUhs0WrBnLC/WTC4vA6kVZej2wdzdbXw04xsTFP8MMD6WLsVZ0ZLfVbQsds5KSmCsVg3gE5rlTocFJwTopI+3FfwDG7drUHdMxqCTiR/2fFnw5y+G4T34tWrEtc5PNDgxiOYHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud/TQIZp2ue4dBTHWbX6XL/bQtyUjvSVs/0Ir1+e1is=;
 b=yvRRsqEgA5MkNs9cMizPVRQnHCzDdBP8dCpzMt0MnIblVGVai89n1k2J1wC4z8W3gJa2xNM0AAaUqDiMbXa4QM8E9pO5T7pIr5SoR8r9bOQVf/t9LrFuLq9MoDRAeEAf8dHni82H6KiL7hT95efF4q5ud7Q8gzryS71ya6Df1mNTh/OrppONSlo8YJMRjlI09ROw56PzsDA/5SW3aeG6YpCjubElauR8zWZVrd+HB06G0QghZoL+yjkOG63/AVgWh7LlcXBzG5rqDMKmsFNB7LNwcUTIRqFCLBV3GQ0WVrDZUGPta2S+bEvIXKhM+nlfY0v5flpBgqx72jjRKUmLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud/TQIZp2ue4dBTHWbX6XL/bQtyUjvSVs/0Ir1+e1is=;
 b=I5mCXNhl6PdASNCcc2dLD+jznwKbGMa3B8krJFwrVdhq3y9N7KG2FjOT3d5SclNgPC5DH/9zsjtlfrpFahQbR033G9ioOEplxdSQX9JEmlGMehsBk0ZWga7ZkenUVHB/FUA5qZSRvoOHWwPavlGTKwkBnIC2ZMAxaoU7VGmNyyw=
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
	<roger.pau@citrix.com>
Subject: [PATCH v4 04/12] xen: Refactor kernel_info to have a header like boot_domain
Date: Fri, 20 Jun 2025 20:28:50 +0200
Message-ID: <20250620182859.23378-5-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620182859.23378-1-agarciav@amd.com>
References: <20250620182859.23378-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b0441e-caff-4b66-8a63-08ddb0287d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OwwH5J7/PeCQ5KieHIarabJKIWRl8qIrJ/Hqf6qIYoGv5i86CM9NnwvA0Bwx?=
 =?us-ascii?Q?76ifsJf53M2YgvCDjk6WntxYZ52jrj7t/jRckpQqnzMwd8zhyYbFcxdTwiGZ?=
 =?us-ascii?Q?Dx2F5hbb/PdCW3jpggsvJGySX36YnvUSp0CqrqTzU1pFRV5WKx/XIPh7zt3R?=
 =?us-ascii?Q?T45g8cqG9f0h9WVbapY5Cf5xKahPgRa0fV0hiHQyi4Wto+O8CYI28BPHy3/L?=
 =?us-ascii?Q?pd3lv9I7NcWXhxXSXwmN0p3R3Fho32f8edOYOA5Ln3pLBH3jtQfuZN/cuhDx?=
 =?us-ascii?Q?qI6BZ32oBHvuYyn28iGGqtELoOWXfNBjb9XB7D3SJQ0g6iR0DqHnaaF6q3Kl?=
 =?us-ascii?Q?x9Bjg+HoR1P29HQS8RQn/fQ+5kG/dVl6VGVbCu5dXRbeU+nDUU2kIryoYGG4?=
 =?us-ascii?Q?eXy9DSPx1IX+iTzszjarfYQFcTVNXIH0imIW+urtdrarxuJkzVQKxwCPmWAi?=
 =?us-ascii?Q?lElH/yqSKJ/rTbnaImrRgwiNsTgwj6amVIGyUXA91y7UcTc+U2uxiOFxOpjP?=
 =?us-ascii?Q?gpn8nmy0TYRyQFFzH5ZkkFAWEj1+Qls76MJft8h6DobbUhDOuRNs1oim6RFG?=
 =?us-ascii?Q?+d6c0yelB0vHygZSSIGOqmCiZoXNxRWzDKX8DE1U+WSsmReZRK7AVB2Tbut9?=
 =?us-ascii?Q?m0IHLJPzneYEls8LUsCpPNNCdrrQXEHhsC6Trih3tCOMl41ABLWVjeFMcFbU?=
 =?us-ascii?Q?2JpzIWaDcVWa41Nbp2Ec0V03H0Wx5MqGrkhi/EITN7W2nanpQT3OpHH6paca?=
 =?us-ascii?Q?uBLJctYvfsMEYkarxT3z+GnLSqntSvwfQP8vGG7GsrQ3LG0xUlgDd8CVZ3gi?=
 =?us-ascii?Q?9Fk5jd/QySpbkv8zEqUyFg/AjZrdP7l7fZI351Nv/nqDMEgL8R3k5TOe/6h0?=
 =?us-ascii?Q?lKnY+RdIeDoZmqzvci3E5iBGo5qRV3B9YDtyHnXhw5T06T7p2ku64QgQqBL9?=
 =?us-ascii?Q?ug4K0UZ9wcA5TiE1n0RMHATehW8NHydzYhP3LiIGqSo7ETRWLeXl857+PyJ5?=
 =?us-ascii?Q?wUZNlN0TLife9NJCYMEbLcvSatjPd81HBPW1TH+fj323rCP4qgMYqgfQKRXM?=
 =?us-ascii?Q?zF5QAYV3cmaE0Vtcg9ypyzbptABd2ZN7YOSX6xsEtw5fyAl4y7f+dGBcV46y?=
 =?us-ascii?Q?JJD/ucQ467xe7b2C02cWdR5GG3C64hFUuLh7klTCSrXQkENjGRTJzHQkG0jY?=
 =?us-ascii?Q?ve04SvA8CYwg52giaL+77hHqbdY/O1e5GSnnpaRs9pV8fYA+d5sRHJW7qJ/q?=
 =?us-ascii?Q?ZmhEUjpam5H4txOlURnsXuwTljP5xrr/gjLVaOhH2QpI7UUPueKcQHf7VhZW?=
 =?us-ascii?Q?hUAgPVSkci36EGiWaODo9iC63E+NWvIWyN0aEdyw5s8QBCnFYSxRyI8Zwfbr?=
 =?us-ascii?Q?QBKBcCVyx0rvH39UdV/pjloBEeynCPfvdaHmgWzFRLO2UcweeXZ+4+/XFvbn?=
 =?us-ascii?Q?DSaVJ6lPqHH/NfU+5t+SUZwXYaMdJvwNXHws9ZlxQ0zn6z1j2qWqzTLQl8DB?=
 =?us-ascii?Q?omUpIspK9vK+zKHIVDcNNtXdxfQTvbEtRRmn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:30:10.6550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b0441e-caff-4b66-8a63-08ddb0287d7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393

Create a struct header within kernel_info with the contents common to
kernel_info and boot_domain, and define that header in common code. This enables
x86 to use that header as-is and drop x86's boot_domain.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
index 4b285cff5e..08e8424030 100644
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
index 3f5c7c2e5a..fb577f816f 100644
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
@@ -1456,7 +1456,7 @@ int __init make_timer_node(const struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    if ( !is_64bit_domain(kinfo->d) )
+    if ( !is_64bit_domain(kinfo->hdr.d) )
         res = fdt_property_string(fdt, "compatible", "arm,armv7-timer");
     else
         res = fdt_property_string(fdt, "compatible", "arm,armv8-timer");
@@ -1468,7 +1468,7 @@ int __init make_timer_node(const struct kernel_info *kinfo)
      * It always exposes an active-low level-sensitive interrupt.
      */
 
-    if ( is_hardware_domain(kinfo->d) )
+    if ( is_hardware_domain(kinfo->hdr.d) )
     {
         irq[TIMER_PHYS_SECURE_PPI] = timer_get_irq(TIMER_PHYS_SECURE_PPI);
         irq[TIMER_PHYS_NONSECURE_PPI] =
@@ -1517,7 +1517,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
 {
     int res;
     const char *bootargs = NULL;
-    const struct boot_module *initrd = kinfo->initrd;
+    const struct boot_module *initrd = kinfo->hdr.initrd;
     void *fdt = kinfo->fdt;
 
     dt_dprintk("Create chosen node\n");
@@ -1525,9 +1525,9 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
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
@@ -1976,7 +1976,7 @@ static int __init construct_dom0(struct domain *d)
     d->max_pages = dom0_mem >> PAGE_SHIFT;
 
     kinfo.unassigned_mem = dom0_mem;
-    kinfo.d = d;
+    kinfo.hdr.d = d;
 
     rc = kernel_probe(&kinfo, NULL);
     if ( rc < 0 )
@@ -1988,7 +1988,7 @@ static int __init construct_dom0(struct domain *d)
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
index cd01a8b4bc..51182d10ef 100644
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
@@ -336,23 +336,23 @@ void __init dtb_load(struct kernel_info *kinfo,
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
@@ -368,7 +368,7 @@ void __init initrd_load(struct kernel_info *kinfo,
     len = mod->size;
 
     printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, paddr, load_addr, load_addr + len);
+           kinfo->hdr.d, paddr, load_addr, load_addr + len);
 
     /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
     node = fdt_path_offset(kinfo->fdt, "/chosen");
@@ -391,12 +391,12 @@ void __init initrd_load(struct kernel_info *kinfo,
 
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


