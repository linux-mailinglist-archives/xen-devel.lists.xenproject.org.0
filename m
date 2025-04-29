Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15045AA0BD9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972396.1360773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kGs-0003k1-Qj; Tue, 29 Apr 2025 12:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972396.1360773; Tue, 29 Apr 2025 12:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kGs-0003hf-O6; Tue, 29 Apr 2025 12:41:10 +0000
Received: by outflank-mailman (input) for mailman id 972396;
 Tue, 29 Apr 2025 12:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kDV-0007L9-1s
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:41 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2416::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb26705b-24f6-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:37:38 +0200 (CEST)
Received: from BN0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:e7::15)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 12:37:33 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::83) by BN0PR03CA0040.outlook.office365.com
 (2603:10b6:408:e7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 12:37:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:33 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:29 -0500
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
X-Inumbo-ID: bb26705b-24f6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9e8D8gpduj48qds7TjH9dOPn8ZgbAZN+R++qowLZ0cydbgbp11dBKUYy2f1KmOZ43A7MfLX7i1C2V1Mx243wOsdfJrH/iYvLG1zNmSBvIIitDwbtlxqvaR4KdIf4z0Hz0axiWaVuT6+mdQKnrl7QVLrtnOykyUquy2HbacWO+5JkSTDdRQTdGQ1eVhb1XzFe6RMPz67z8RJ91fwIQ3BVQ9C1Q9rgxvJL4n48rxfklMYc7fFbDXY/dOXO5PMl8HucNJIZVYOmQHmN3jBxkj+qmYitGtYhpI9Z4Ox265epHqHpwZknG97lBvBps+AWbXN0B4bJln/ZfUCUrazz0g0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDrFG98ghx3Lb9O56CXpByERjFCHM6cxhmOuzmZVC7s=;
 b=pPfuc3cYrLFuvJue9vocA455JOec3CKRX8ATNYkg5OIQg0o8ClrxeB3q2tP3+4pSpWVssmlgtAmt+9UuhBFO/IwqHfN2qJbrutP/EzLGpWO4aTfFf3R7SJ2gUCZm2HckX6sGwunLCdDcWK0MgjXPrHBnVqDhfLbF+9IOsxLAJVFE+EZkeYVO8HpWoezHjRaZBI887cn4F5UTWZDZ36KxdD18tc/ma8KGXs2N7MmxzO4ain9WW9NVPDxGIz3EOYXOAEwg+eKMq7eRLf1u/IKzuejPdk5x6hvtnlTmS85ZfBLkWTpVuGtPxQJv+Q9pYsE++i1oIYJYsz8BpY7zBJHJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDrFG98ghx3Lb9O56CXpByERjFCHM6cxhmOuzmZVC7s=;
 b=fIPzAOqgOwM+tlIoXYbBQc7pG+74Z5MmOakPImu0dNsPva3tYqrLjBmzGqVMZ1EvJjdrmEu/+XbiKGq2ztvw9U6n/sDe6S0WGSrAFPdSgEzEbOIu7DuIPAmEBOnSh4KoLj9cQnXv3+1D1ULb8waitPvymxuNFbabskGtHbEDiAo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>,
	"Denis Mukhin" <dmukhin@ford.com>
Subject: [PATCH v6 07/12] x86/hyperlaunch: locate dom0 initrd with hyperlaunch
Date: Tue, 29 Apr 2025 13:36:18 +0100
Message-ID: <20250429123629.20839-8-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429123629.20839-1-agarciav@amd.com>
References: <20250429123629.20839-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 2900730e-0f8a-4ce0-3d73-08dd871a9d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cuXTN9+ozAk+/y+9Y0Mn7+e41jQNNu6AjVeO4xkQnQWnytv6hrplu+ZxTi61?=
 =?us-ascii?Q?bHXQbYwLDDCcH/EgSmT9P6C+L7CDyvvWgwheAc8ZYgtw9rouHui1V31tdENR?=
 =?us-ascii?Q?pvjMhDRYA3FCMeZ1pjwO8jGU1gTIaunyXelPiZhznoTVJAYRIOJbo8qgJWqR?=
 =?us-ascii?Q?umLCFd4HpiFumAzXqxtqbP6QerOSy7rIplqfWvencGk7d+WK/+2OPsIfzovm?=
 =?us-ascii?Q?YvkIZMPU2YRlgpFRCv99rI6GH7RWw5r71z9mPT3KxAJOa14BCmuR6Ed+9pTA?=
 =?us-ascii?Q?GyWnhtx+ks+sUOat3d6ppzGI/c3PiPNJhaLFu/49HKBojX1aIgFXkCOvyB6e?=
 =?us-ascii?Q?vKEQzxw5IB7jNOzliTMAtkvfRJuVLd9/d8zLed/OpcrVPHHgQdJe3FgQIfsM?=
 =?us-ascii?Q?NTeBfPeOVabssfH9H7jdDQiZNSq/RYynJJK488adr5gb9u1gPqC6pXWanswa?=
 =?us-ascii?Q?yFJBTBKE09SPTcvSw6onUwUkFGJBip5A6qYcVtMKLIVrb+djf+/M2/nfWyPs?=
 =?us-ascii?Q?I40glzER5NsSXXYwJopT6mLDDAMRbOZBNOcoYOCKSddVspHYEd5Y9NWe2HTo?=
 =?us-ascii?Q?hN7dGYfqf0TBDTCjgi30CUbccuRlrMwk2AK0DuQwOoCMLOMTBVJ86B1oYUn9?=
 =?us-ascii?Q?NlpXkUMp949Cmu/EW3Usji0kruEiJ1jII65JGFyUYAMPfDxODdDaGn9Yd1JU?=
 =?us-ascii?Q?0wRoDNg/6Z+DQ0fmliomt5fmn0WZhotdS0Jo5rjeTnpBqt6zN40QJgt9g7GB?=
 =?us-ascii?Q?kJAM3c4hcCfdoFlRhL6jOUH+FUxlXchMCc+oiqxThwvFZiI/obYevMv+RBW8?=
 =?us-ascii?Q?GcR1PPjzKumjDKMVeQFjNhcQ24BsCbATgurp+c/XFvn8J1KQuhuavxHNXrnP?=
 =?us-ascii?Q?cbXlxjO5uljdEo2yATM9z4iI+cLXvfD7o2wmXHm9gKGSBYGO7ZpXbpzP4RPD?=
 =?us-ascii?Q?8103XfSmYK0pXC6IXOO4w8UVAgdKmw0y/UOSFA75y7O81WqP+USZpqsYeiuI?=
 =?us-ascii?Q?jvQsgGCgsSY7aToU7CIh8/DrD/66OclIVj2x4QwTBb/dTtFuJRZjml8GbDDy?=
 =?us-ascii?Q?US8y7OOPaLPlmig5MFlW1DNxQbYDnjtE656/Q+Ggw9FEBf7L/3nM18flAYsG?=
 =?us-ascii?Q?hxMM7BOc4bg4y+jBG7iY6x1vFIk+Am3BvHXor27+VtfR5P63roSqEUY64h/Q?=
 =?us-ascii?Q?tgwvKt3gWQYttnx6Q8Fu13X43KoeW3biu4pJSVK0jNgejXBUu2lWq3gKSXa3?=
 =?us-ascii?Q?riQMEKs0ZrCb0UZ85W1nAPC9ACHbZNYCvtmdy1jvV2CG1EhzN17Ph4SUAkev?=
 =?us-ascii?Q?sbbSx0CyqvYIbQFx/vpmbi6cKCsanfmucVnBSFHJmg6pdbYta4dz82CAMijT?=
 =?us-ascii?Q?zx1h7Jxkr+0LpNfBT/1GDuMn0hqkYJLxsM/hcKJz1xfzD5u6K/NIJFjBEm8L?=
 =?us-ascii?Q?sD5gbjB1OZ8kc4BDYcmL8/MnKijiQ2r5vXtIacTgwZQNC7+ZvgVSKTkf1dvn?=
 =?us-ascii?Q?mOvEzUXhAM9hgy0UGqpvS4UR+gQ0vyeAmEvt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:33.2122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2900730e-0f8a-4ce0-3d73-08dd871a9d30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Look for a subnode of type `multiboot,ramdisk` within a domain node and
parse via the fdt_read_multiboot_module() helper. After a successful
helper call, the module index is returned and the module is guaranteed
to be in the module list.

Fix unused typo in adjacent comment.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/setup.c            |  4 ++--
 xen/common/domain-builder/fdt.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 765b690c41..c8de028439 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2172,11 +2172,11 @@ void asmlinkage __init noreturn __start_xen(void)
      * At this point all capabilities that consume boot modules should have
      * claimed their boot modules. Find the first unclaimed boot module and
      * claim it as the initrd ramdisk. Do a second search to see if there are
-     * any remaining unclaimed boot modules, and report them as unusued initrd
+     * any remaining unclaimed boot modules, and report them as unused initrd
      * candidates.
      */
     initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
-    if ( initrdidx < MAX_NR_BOOTMODS )
+    if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
         bi->domains[0].module = &bi->mods[initrdidx];
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index dabe201b04..507f383f8e 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -226,6 +226,30 @@ static int __init fdt_process_domain_node(
                 bd->kernel->fdt_cmdline = fdt_get_prop_offset(
                     fdt, node, "bootargs", &bd->kernel->cmdline_pa);
         }
+        else if ( !fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") )
+        {
+            int idx;
+
+            if ( bd->module )
+            {
+                printk(XENLOG_WARNING
+                       "Duplicate module for domain %s\n", name);
+                continue;
+            }
+
+            idx = fdt_read_multiboot_module(fdt, node, address_cells,
+                                            size_cells, bi);
+            if ( idx < 0 )
+            {
+                printk(XENLOG_ERR "  failed processing module for domain %s\n",
+                       name);
+                return idx;
+            }
+
+            printk(XENLOG_INFO "  module: multiboot-index=%d\n", idx);
+            bi->mods[idx].type = BOOTMOD_RAMDISK;
+            bd->module = &bi->mods[idx];
+        }
     }
 
     if ( !bd->kernel )
-- 
2.43.0


