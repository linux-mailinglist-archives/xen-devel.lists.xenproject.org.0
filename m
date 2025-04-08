Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB4A811A9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942916.1341975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BYA-0004NS-C0; Tue, 08 Apr 2025 16:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942916.1341975; Tue, 08 Apr 2025 16:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BYA-0004Ib-8Q; Tue, 08 Apr 2025 16:11:46 +0000
Received: by outflank-mailman (input) for mailman id 942916;
 Tue, 08 Apr 2025 16:11:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVt-0002e3-2y
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:25 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2416::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d33a58f2-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:20 +0200 (CEST)
Received: from MN2PR01CA0065.prod.exchangelabs.com (2603:10b6:208:23f::34) by
 PH0PR12MB7930.namprd12.prod.outlook.com (2603:10b6:510:283::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.31; Tue, 8 Apr 2025 16:09:15 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::a4) by MN2PR01CA0065.outlook.office365.com
 (2603:10b6:208:23f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 16:09:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:15 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:13 -0500
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
X-Inumbo-ID: d33a58f2-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiL40FDYM+sAb2Gj7EPkLHEeAlLCoSSgPLEoAggtvHDcsAJqQtXj2x4Hey20hGFy4H8suVzfjdltgCpWc+VO9CGuLpuldk8OlKjAStSB41HHxb4Af9x300zna8sSgxrhN2xTseffbFZZ/S3+F0aKNsNNfFyZTv0WFqtw8jghIU6sqhfnU/3I3Ev2YtUz6ZGMrZT2sX07etRriTTWeMuMqH9VuPMiTu9XdQOJ68MAx9k5kJptEj6hdqWyx+Z5ZnDuOYtWtvr0LJNTTfO4GmVXFnTujXEEAP+l/5gR4X41hKYytDNtq0MGKVnULonNM8m1tI226dJJe1MVq11ur8x+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R69kvWM740SS/m0F4d2VLUkfGCEI/pSnhi9Oh+3y0I=;
 b=woaG0MEXOW8J/HuZc9dETNUWPaF+RJAnTwYKkAGzRPWKCOLSUky87R6UHQfMy1pjnidzn/N4WKSrder9Svi02+fi1ISWe69pbnm+gQhCz7Je+mI4ItXfDL8uzLQnqRNuaWfYgBYHlYKC2E1x5vz68gJ2GPXiMDLIhFCgUsr2dM5bMg163fLw1Uh9ClBDIEj98T+eP2vtzLmCsGtY3UU8HAtL9w7UpW1WppcPv6+KsKjExb4sGiANkZxKL7gtv5IVuSqA/tDr4eL1C3dUXaPXagjl21sLLCXTZZnfdVrp7tHf03hyClqyt6ZAxdlz5uW40wSJkyuL9gYHgqprbj0v7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R69kvWM740SS/m0F4d2VLUkfGCEI/pSnhi9Oh+3y0I=;
 b=LFjbPpV0rKY5Om0YSskgXjTX83gfXV5Hi8+yPb+ZZiwg4mS4u4colR8ziE1jCYHIjJkONz7XghZ8MGaKJOlcdRHiH5ZBGOGoeNBRFFPbuDTzCEzDLYAkpaXY8xlObX/fItshAKWpFU9bd/ViRIypgSayo6RsO7NKXqO/hdMXHB0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to domain config
Date: Tue, 8 Apr 2025 17:07:34 +0100
Message-ID: <20250408160802.49870-13-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|PH0PR12MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aff5e69-8e2e-46b5-a062-08dd76b7b5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rKkTUdZdIJJrdZL68IABjrqa+X/hqkAXN8RbzdR3mYPJU94dddoDX9uK9fyh?=
 =?us-ascii?Q?cmROn2sDf3fZ8CWFz/Gv5s+xvdvxXp1d/peYK52EmB2engyZ8s2e+0oO+SQx?=
 =?us-ascii?Q?aD8IX8f3eP9jTFm50+uCjKMsRDwZudjjsqw6F4uE2QIp5JS0ipyAKDT6VXJr?=
 =?us-ascii?Q?7B7zcMIi1XaJzMDJjD1Tmt0DqTWalPklpw3Kwi7q2fpPS4Ikce45Dl+6mfQP?=
 =?us-ascii?Q?LH0mJtNriHKXbzd/CoLnIH3yMot7+QPiw6qAKpkfamdST6RvZFiVfxaZKwVO?=
 =?us-ascii?Q?222hHOcDhGYoBtLzKg64JCVmVcLmyJ57XvmJDVMsKIEEvY53OAdXdtE7rkgM?=
 =?us-ascii?Q?p/7g8IXmvhHOVQKQ1h+v+pbmcLx9RlqGZq7E9f9bEduIzb/bl+R6bg6nklZM?=
 =?us-ascii?Q?4tJKOn9Drp5QStXPL0P8J2sTfmMBt6RO1GhzMoJ/n8ZlfoM5O9wseMOd9sxx?=
 =?us-ascii?Q?4Gy8Vlsp6n6YUF6BeKBl9iFY4CHrwxDMX02uxW7QgBdziZMyrJKZlmL77Fg2?=
 =?us-ascii?Q?Vaw73iRH4hA/Zx6tdPlMH5JQxfWBVgVJYBhyVrOkfqSrkA4Ecak8BqnABy33?=
 =?us-ascii?Q?2RzPZk4nAnLj9O+Ev8PAtHaEfGRND1/VnV+K9NTMm9y+G1I6EMeoU5sJjk4J?=
 =?us-ascii?Q?u9gO10pmJwek3YYDK3exJ/bhbAjrvLf/nhqB9EydcqHOh5kOcRhlGPWf5IQO?=
 =?us-ascii?Q?maNnEybdlVIcGIK2u6sdIcAwqKJrqfWGw09UiYi9JTQQS3lwfCETvj5O9nKc?=
 =?us-ascii?Q?1qMH8qsSAAWCrwUyOaOGG/Y2678dw60r6vOfhek8F/zEIuynr+pSKYG2c2uG?=
 =?us-ascii?Q?nO7/sSS+yDtv7AjC9S7YXDqOeQMCMf1lz6AfA1+LscwZ6z3WBuT5zN6ZCR2T?=
 =?us-ascii?Q?X76ra4ZDq5uSwFDT89YAGECI4s38UqnOc04j429+0HVWOxN0uNjQ2r7mHry/?=
 =?us-ascii?Q?OQxQ0gTDEkV9KRpkBHJvk0IYF4wknmvcCPsihT8KBu1uM4mCjyyst5EEryt1?=
 =?us-ascii?Q?VhJbGKbsBjdFLtFTLwXFukSMhX+qsT3T6YQ0ua8e/xGyKUsqyEDaRlSWpD3q?=
 =?us-ascii?Q?32HxFGPeQOXAvzLng2fF82vm1NhhQRlto8N1wWO9cROX3Y6/h05YHdSXID9e?=
 =?us-ascii?Q?wGiYO3lWeCxA1juFP56fU7rEInd6PKFUAweIplLE4mjZ1Kkn3UBgvwzQ0R5Q?=
 =?us-ascii?Q?JMDpssnX614q8hsVcwhOB7Qqac0d+azKT48TghyiZhbRbFIWOM1rZmWjmX4h?=
 =?us-ascii?Q?RmJETp+ScMZT90tT4rNnWJsxIEuzrFbByDPc0yhYJ5h09e57dVwDdZQQc+kZ?=
 =?us-ascii?Q?jmaEflZB6XtMUc2PaGTJHqK5W+kDiwCpDJy1WepXmTCTUFzVNdW/JJSEQqMA?=
 =?us-ascii?Q?vNXefymrRmz0iIvJzwthZHyJQPiRLD9pJJw1jyCgeeO1M73ReYRiQUAXM3r1?=
 =?us-ascii?Q?rDUieffeeW75xhgUdleQ7o7czJKLcTV4VwuypKTTiJCHhWThkGhTDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:15.4461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aff5e69-8e2e-46b5-a062-08dd76b7b5a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7930

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the ability to specify the desired domain id for the domain
definition. The domain id will be populated in the domid property of the
domain
node in the device tree configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
v3:
    * Remove ramdisk parsing
    * Add missing xen/errno.h include
---
 xen/arch/x86/domain-builder/fdt.c   | 39 ++++++++++++++++++++++++++++-
 xen/arch/x86/setup.c                |  5 ++--
 xen/include/xen/libfdt/libfdt-xen.h | 11 ++++++++
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 0f5fd01557..4c6aafe195 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -8,6 +8,7 @@
 #include <xen/libfdt/libfdt.h>
 
 #include <asm/bootinfo.h>
+#include <asm/guest.h>
 #include <asm/page.h>
 #include <asm/setup.h>
 
@@ -158,12 +159,42 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
 static int __init process_domain_node(
     struct boot_info *bi, const void *fdt, int dom_node)
 {
-    int node;
+    int node, property;
     struct boot_domain *bd = &bi->domains[bi->nr_domains];
     const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
     int address_cells = fdt_address_cells(fdt, dom_node);
     int size_cells = fdt_size_cells(fdt, dom_node);
 
+    fdt_for_each_property_offset(property, fdt, dom_node)
+    {
+        const struct fdt_property *prop;
+        const char *prop_name;
+        int name_len;
+
+        prop = fdt_get_property_by_offset(fdt, property, NULL);
+        if ( !prop )
+            continue; /* silently skip */
+
+        prop_name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
+
+        if ( strncmp(prop_name, "domid", name_len) == 0 )
+        {
+            uint32_t val = DOMID_INVALID;
+            if ( fdt_prop_as_u32(prop, &val) != 0 )
+            {
+                printk("  failed processing domain id for domain %s\n", name);
+                return -EINVAL;
+            }
+            if ( val >= DOMID_FIRST_RESERVED )
+            {
+                printk("  invalid domain id for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->domid = (domid_t)val;
+            printk("  domid: %d\n", bd->domid);
+        }
+    }
+
     fdt_for_each_subnode(node, fdt, dom_node)
     {
         if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
@@ -233,6 +264,12 @@ static int __init process_domain_node(
         return -ENODATA;
     }
 
+    if ( bd->domid == DOMID_INVALID )
+        bd->domid = get_initial_domain_id();
+    else if ( bd->domid != get_initial_domain_id() )
+        printk(XENLOG_WARNING
+               "WARN: Booting without initial domid not supported.\n");
+
     return 0;
 }
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3dfa81b48c..db7280225e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1033,8 +1033,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
+    if ( bd->domid == DOMID_INVALID )
+        /* Create initial domain.  Not d0 for pvshim. */
+        bd->domid = get_initial_domain_id();
     d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index e473fbaf0c..3031bec90e 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -12,6 +12,7 @@
 #define LIBFDT_XEN_H
 
 #include <xen/libfdt/libfdt.h>
+#include <xen/errno.h>
 
 static inline int __init fdt_cell_as_u32(const fdt32_t *cell)
 {
@@ -23,6 +24,16 @@ static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)
     return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
 }
 
+static inline int __init fdt_prop_as_u32(
+    const struct fdt_property *prop, uint32_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
+        return -EINVAL;
+
+    *val = fdt_cell_as_u32((fdt32_t *)prop->data);
+    return 0;
+}
+
 static inline bool __init fdt_get_prop_offset(
     const void *fdt, int node, const char *name, unsigned long *offset)
 {
-- 
2.43.0


