Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B59A811A5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942919.1341984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BYB-0004cy-JC; Tue, 08 Apr 2025 16:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942919.1341984; Tue, 08 Apr 2025 16:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BYB-0004aO-FF; Tue, 08 Apr 2025 16:11:47 +0000
Received: by outflank-mailman (input) for mailman id 942919;
 Tue, 08 Apr 2025 16:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVk-0000a6-Mx
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2414::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d110691c-1493-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:09:16 +0200 (CEST)
Received: from MN2PR19CA0045.namprd19.prod.outlook.com (2603:10b6:208:19b::22)
 by BY5PR12MB4083.namprd12.prod.outlook.com (2603:10b6:a03:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 16:09:11 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:19b:cafe::b7) by MN2PR19CA0045.outlook.office365.com
 (2603:10b6:208:19b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Tue,
 8 Apr 2025 16:09:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:11 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:09 -0500
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
X-Inumbo-ID: d110691c-1493-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzm/TIM1ny5JgA7mzykF9Vyeavjk9uTGOAmJc8QZ1cQkLOnwKqJYEHOgL5brX21equcvMMycejEnVNJJ6sqDgG1QkRq5jg5EunMgAVg2/98X2jwc23SuQLf4Ev8j42xhPfblnecvtp4Ixc4M/2MdKfSV8AH+Et/XCtu6+cz0OcuKezwpvCeQMgSfUO/nIT8OlmeJgLXVeu1BCu8iieBBrrGtkQTwQSsZnc3iUxzaN23zWE7wW+zhrIav10DdsRM6hyzk0FJGOsZ+VVp04zOs03RfxO9jc3oBwJByUFALU+wlz9/wa65+NhjwchvDTGVd/XbJAD6BWNafzzIcIfG4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YluEnmN5WD5jS/lkB8HBr2wUzOPxNHNZCrXAZnkx2Wg=;
 b=Xuc7uRtvpgRIGGP2DcqcE2drWDL+0DBfQDPU5eQ3WVUOdj1sKCYYIUv/ru+hyWMzb2822t5KxPTUrzWfmSMpwDQ4Yq1vZkgkwdvb/L4GwSTiMYd1DOslJvRBulpibPCyfIeCyfaVaQ/c5BaayVJG8B+lYP+MbU4vu3CkF7Qf+0eO0JErufRK8xCKCDx/i7M4erAqzi74zWkoFqru81hC8EY1Zvxji+iyUATz44eQ3WhYo3N1Zf4wq1z0R1vtTJPbTKLXY78q6t3judwQNM2dRh3Y6ixqepEE+iG5SKD5eRCXIprX0DtUhM+2p/5p8rjJxZYa8/oK8f7lDL/JvQaSlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YluEnmN5WD5jS/lkB8HBr2wUzOPxNHNZCrXAZnkx2Wg=;
 b=nx84FO/8Ix2pseCt7b6yqX+aKzS8mLqBW4RyDEpKJEycqtqvnc5P2bdcyETBB+pKkWdwzZFG5HJJa6NITD6SWHdxZcyTj8UUDuvQD2kIKHoQlRWkWE+qHrd0Kd11QXey7jK32CPXKzUw7kxc8iaOwHSAjE9T7uGtWkCcdKbQTJI=
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
	<roger.pau@citrix.com>, "Alejandro Vallejo" <agarciav@amd.com>
Subject: [PATCH v3 09/16] x86/hyperlaunch: locate dom0 kernel with hyperlaunch
Date: Tue, 8 Apr 2025 17:07:31 +0100
Message-ID: <20250408160802.49870-10-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|BY5PR12MB4083:EE_
X-MS-Office365-Filtering-Correlation-Id: b0545932-d22c-4e9e-fa44-08dd76b7b313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+2Ml4vNicD7HtgRvk5bbZzEPQyWKatkoFyXXhKYJpJzbhGYiM/NCeLjNRitW?=
 =?us-ascii?Q?mS1EKQTGfAptR7Sy+ZsvG6ykHdsLW+jJZC+QM2ym2ZNMW1JZQfk3jma888B6?=
 =?us-ascii?Q?QIkwyp7hs8inA599uUVcroW6LSCEy9b9ylc8HbxX+px9nirJ1e66lAaj4dmg?=
 =?us-ascii?Q?Z+rkFhkTN623hRFvLsU20Jdu3AWHtuGn3V+/8H6mm5TfYPi1dmffzomclxEY?=
 =?us-ascii?Q?hvzzN7oEPmhREx3rAPQ+zN4YbzUluNCCNGRN4T3o5DBtFSNIzelhRTePigWF?=
 =?us-ascii?Q?iBmn9rWKGzWnD8Dcz3wZVNp7eDf92Rz7wc/tfW4HDO+X80bSEc+O50gFYsfq?=
 =?us-ascii?Q?5CK4p/ip2jaSL1Dm8Dntxt2Dz4B8hAUp2MDn0/wHHcpSLCf/e2x9XkwvFdjk?=
 =?us-ascii?Q?AnjGVze9DSt3i/yCLTJpakBBViJ13ufTfVwQ8o2h0kcFhfvlTEmtLz4Mzl4n?=
 =?us-ascii?Q?rTSCGlly82bsda2RxNZ4QOplIAIiaJmO0zFeTUCsZCvpOqZAsrp4mo/gKvBx?=
 =?us-ascii?Q?9lXYykArP6Pwvjxho6+E+5rZwBVk81jQTl8/ReyrfsZnDqtkIZIHgA4MHelg?=
 =?us-ascii?Q?gRKgaxpXop72Rf9q3Xgag7PrZ2hd/b7f65SiiLlylYkbAE9pe/gGkJG2WmTO?=
 =?us-ascii?Q?H/g9U52yX+6gK1VKPdU+3FS+SoFG8ywZeLt6UrQ2EFM5x2NKVizW2i6ySnB8?=
 =?us-ascii?Q?AsbsTu7b+FRJC2uMTVQZABso1uDyCwuT8c68uxyVfTQfM1NsZLTiwAvZBBSM?=
 =?us-ascii?Q?nYnLq5zXi/FcG4G+SRsMVDJtFl1D63rJg9M0e9wfJtQ0A/8H7dtPH/tqIqqf?=
 =?us-ascii?Q?ECZwlcSxATVpfBvp//3/kRCj3eB/wjIqQWAKsMqPUzIQIaRLRsnFt21Xd+rF?=
 =?us-ascii?Q?ZtNNhZlv5UAwpMOGoz4qo7Bvujd+Hg+60qRlIoyZ4sdc4N3VD8L2QtzWDqTd?=
 =?us-ascii?Q?ZQybBE54NP1338Oh9Woh1Q+QSEZSMf8naUZDJLthHrdvA7MmN8tmeHWDB0SJ?=
 =?us-ascii?Q?es+/NMcpYo04lrWXtMPZhjxxP5WNS3a23dQ7Ku+gBFp6BOaVfdrjRm0mdiSf?=
 =?us-ascii?Q?YMC1ryhlROwG5GdIuylUtVeGA/4iyLwHQp/hrJkao3w/F00vdYK5HqnL8Mp9?=
 =?us-ascii?Q?WiEZvj3fpXqyfa4j0++WB/dvZCqcYiO5DQzD0L0we+xjL7Nq02cGxWnUr8tm?=
 =?us-ascii?Q?Ieqta0mIgh2KYNLteo6E1FMnmEWNlEU8ek+CfV0WGA1C0Prs27uxyPuosGpM?=
 =?us-ascii?Q?3o3ZsbtfoZg3ZuXbp5E9WmeGUlWYuyEvJgCyT2unk5s5svQRbPA3M5JuXxFG?=
 =?us-ascii?Q?5+RbvXf0KxLMgXxJEW1qaBFs4gZ28n0UF1/R2VT8rpobygqOa+IzHe8zJ/hf?=
 =?us-ascii?Q?RxcmeHrDIDFev7U4krmReDu+ooEOVfdGxuZ4aUwJ7FfSY0Y21bp1jAu/HqaD?=
 =?us-ascii?Q?ZOi5Qb9yqyFObANsXFrJr/2oyW9KjPcI2/TRchuE6CY5akkKoKFltJ3IbjMf?=
 =?us-ascii?Q?LWLfuDj/mHzG7TgDhnr/eqhQezCZhM4da0ua?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:11.1533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0545932-d22c-4e9e-fa44-08dd76b7b313
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4083

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Look for a subnode of type `multiboot,kernel` within a domain node. If
found, locate it using the multiboot module helper to generically ensure
it lives in the module list. If the bootargs property is present and
there was not an MB1 string, then use the command line from the device
tree definition.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v3:
    * Add const to fdt
    * Remove idx == NULL checks
    * Add BUILD_BUG_ON for MAX_NR_BOOTMODS fitting in a uint32_t
    * Remove trailing ) from printks
    * Return ENODATA for missing kernel
    * Re-work "max domains" warning and print limit
    * fdt_cell_as_u32/directly return values
    * Remove "pairs" looping from fdt_get_reg_prop() and only grab 1.
    * Use addr_cells and size_cells
---
 xen/arch/x86/domain-builder/core.c | 11 ++++++
 xen/arch/x86/domain-builder/fdt.c  | 57 ++++++++++++++++++++++++++++++
 xen/arch/x86/setup.c               |  5 ---
 3 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index c50eff34fb..eda7fa7a8f 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -59,6 +59,17 @@ void __init builder_init(struct boot_info *bi)
 
         printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
     }
+    else
+    {
+        unsigned int i;
+
+        /* Find first unknown boot module to use as Dom0 kernel */
+        printk("Falling back to using first boot module as dom0\n");
+        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+        bi->mods[i].type = BOOTMOD_KERNEL;
+        bi->domains[0].kernel = &bi->mods[i];
+        bi->nr_domains = 1;
+    }
 }
 
 /*
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 9ebc8fd0e4..a037c8b6cb 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -155,6 +155,52 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
     return idx;
 }
 
+static int __init process_domain_node(
+    struct boot_info *bi, const void *fdt, int dom_node)
+{
+    int node;
+    struct boot_domain *bd = &bi->domains[bi->nr_domains];
+    const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
+    int address_cells = fdt_address_cells(fdt, dom_node);
+    int size_cells = fdt_size_cells(fdt, dom_node);
+
+    fdt_for_each_subnode(node, fdt, dom_node)
+    {
+        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
+        {
+            int idx;
+
+            if ( bd->kernel )
+            {
+                printk(XENLOG_ERR "Duplicate kernel module for domain %s\n",
+                       name);
+                continue;
+            }
+
+            idx = fdt_read_multiboot_module(fdt, node, address_cells,
+                                            size_cells, bi);
+            if ( idx < 0 )
+            {
+                printk("  failed processing kernel module for domain %s\n",
+                       name);
+                return idx;
+            }
+
+            printk("  kernel: boot module %d\n", idx);
+            bi->mods[idx].type = BOOTMOD_KERNEL;
+            bd->kernel = &bi->mods[idx];
+        }
+    }
+
+    if ( !bd->kernel )
+    {
+        printk(XENLOG_ERR "ERR: no kernel assigned to domain\n");
+        return -ENODATA;
+    }
+
+    return 0;
+}
+
 static int __init find_hyperlaunch_node(const void *fdt)
 {
     int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
@@ -217,9 +263,20 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi)
 
     fdt_for_each_subnode(node, fdt, hv_node)
     {
+        if ( bi->nr_domains >= MAX_NR_BOOTDOMS )
+        {
+            printk(XENLOG_WARNING
+                   "WARN: only creating first %u domains\n", MAX_NR_BOOTDOMS);
+            break;
+        }
+
         ret = fdt_node_check_compatible(fdt, node, "xen,domain");
         if ( ret == 0 )
+        {
+            if ( (ret = process_domain_node(bi, fdt, node)) < 0 )
+                break;
             bi->nr_domains++;
+        }
     }
 
     /* Until multi-domain construction is added, throw an error */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e5d78bcb48..00e8c8a2a3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1284,11 +1284,6 @@ void asmlinkage __init noreturn __start_xen(void)
 
     builder_init(bi);
 
-    /* Find first unknown boot module to use as Dom0 kernel */
-    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
-    bi->mods[i].type = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[i];
-
     if ( pvh_boot )
     {
         /* pvh_init() already filled in e820_raw */
-- 
2.43.0


