Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB5A91CD9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957520.1350683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgL-0006ow-Np; Thu, 17 Apr 2025 12:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957520.1350683; Thu, 17 Apr 2025 12:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgL-0006n6-Jf; Thu, 17 Apr 2025 12:49:29 +0000
Received: by outflank-mailman (input) for mailman id 957520;
 Thu, 17 Apr 2025 12:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgK-0004z9-8L
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2414::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 653f2bf1-1b8a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:49:27 +0200 (CEST)
Received: from CH2PR16CA0019.namprd16.prod.outlook.com (2603:10b6:610:50::29)
 by BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 12:49:22 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::67) by CH2PR16CA0019.outlook.office365.com
 (2603:10b6:610:50::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 12:49:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:22 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:20 -0500
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
X-Inumbo-ID: 653f2bf1-1b8a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7xLHoSs02xsyswghDSj7LTogm46+xq8gGxWIe+kXmhpJ/1l2SvrQ43RJEDpxF37e/tfvPY1RyHjCCGrGYLKQ4ZJmXN4rCvKUFwot/f2o+5beVpd67ENfeG5NptX6PaB3zbUcnm45I/yoNp9TUS0IOLbkadc9/5mgFUKGfAcKQenF3lIHJkDDUAAY+xuKsaqG90OATbBAc2Ye4M4MonL59/QaDdgjGtsv1oy15iXTRvqdsAsb4E5MC8+q74bT1f8yqOjEc9m1d99n9lYupVn0FUr5y4fee5gSB+sFlM9auofUPUUe4qtJN4SHHmtUMmPHyd/Brf0fHlVG5EqDoo8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmoofm42WlgUtLxeqf60xNluT8/fPAszyhmDXROd35k=;
 b=h56v0n1PjLjBi6+5BGJYT9K0YvjuLVbUG9qfv/1Z+zxBVVP9wcI1fjpM3KWsGyeuNRdkBesDsonnEvK1BGygriyZOicvPb/D1Yvw4T/yyvnvAXWKRrS4Oqi4GzCVawG8oLmQ16yMlYx0drvSGfGW8iFf4M4s+qnI0k2NMCPOVRWoLkau0HcW+XgWH7ouxhQ1Zxsm9uRpelnTY6WZvxbKdS5g+FZLA07bIDMt6JfabHWSvlARjYp/jU8VlF5zqHy70sxItZZ+E7MzHiLGIHTDYTmNODP88CdmW7fsFeqVHBhmc0URnjNU2fm8tA9REH7PGHLxaW/Khfgrhp3PtjG0Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmoofm42WlgUtLxeqf60xNluT8/fPAszyhmDXROd35k=;
 b=3Ulx6tArJylhpkC6Yof6QkAa3YpZ9wNfAcYcDaqngjm5gLDraO66geQtQM+y8N66LarQcRfDEpI+esm2mC5COu9Y3sYnPzComoMOoQ51xTXTdj3XUCgm865JJDDI0RacPDlOrp4f8NznURqkDbRFrjTsFxAickWA5l/9CMXBl+I=
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
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v4 08/13] x86/hyperlaunch: locate dom0 initrd with hyperlaunch
Date: Thu, 17 Apr 2025 13:48:30 +0100
Message-ID: <20250417124844.11143-9-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417124844.11143-1-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|BN5PR12MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4a6117-d7d8-49dc-101e-08dd7dae46c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3i/A/CdCnR7vthPolO6R6ICa/6U7g0U1T46bZNrYosRO4yEoXMSpJdN36zUv?=
 =?us-ascii?Q?Ee7k5VkYqA4+mJh/GvJheWEW1tqojeOevoqR4EOhlarviXd8AJV7hLnAiT0v?=
 =?us-ascii?Q?rd9lAYIzDTSY1a3+VxjC5gLDrIOLmqqF0eYhkReTqlg6f2w8PB3y3gzEnEZS?=
 =?us-ascii?Q?CF8dtkBgZqPLTMY0ELLEPynuWhBWub71Pt3QlywWcxp+ZCtDPgo0DRkjRG/O?=
 =?us-ascii?Q?mf4lANdx1GpXVAQkOMaqAgeAdZvZZh+dlOX2EnxfYyD3b+V0gqdACiBGnxdI?=
 =?us-ascii?Q?Bw9iHmYrgpJhys7P99Re0GLolknzm3qYIbFSVZP0JFwr0aWr/Bm72kCMBFWv?=
 =?us-ascii?Q?WEJZGiJ1BcKXFWhOglRV0eTjQ9Sa/SNrum5FI7CHB9xFjQGoPsKFJaE9dzoQ?=
 =?us-ascii?Q?z8FZ5HAkmBE1XdIyTrL09ld/DP1sayd1lZd9ajBGO1qcZYW5XhsFe+0Ndn6D?=
 =?us-ascii?Q?H/z3Vx03lS9g2qdErVa9TtZTkhWEJY7mwNUEShu4m3x4w2ex+wuEGdsTUTX1?=
 =?us-ascii?Q?AFO0MB0pP58JMAjK29LXwUU07a0PY1b31eU/wQzbKloFTzRMRfyNjfecE49u?=
 =?us-ascii?Q?1xuwxeZed5vnBG2RGrfX9XHHFXVSXP8UiI8FknQCDBUd7EPFTaF/gy/9tA8a?=
 =?us-ascii?Q?q2fE5zmdmIfuwthXlMo2Bj5uAYpPimuu56/0ogoNWLicweJ4u+umuQzlK5Ch?=
 =?us-ascii?Q?t4LV/kyLYkQzIVXtTBbJHGIUhJn5xOCVdxYVTb1fqVjpGosC9CJKVEbDtXAV?=
 =?us-ascii?Q?GbSWth1X5DIhvcYztyntyVvy91/nGpu+ITRZv/Kuux92khpCOTCtnif/seP5?=
 =?us-ascii?Q?8Qf+iRVufKlFwWnRp1VyiYLvBCrXmnmrZuNGFskv7xiG/TEjWw9c5ZgGucq4?=
 =?us-ascii?Q?zsg33mQITpUVqO07fnvKrQwRs58p8/Ez2qTF6RtZnsokUZ871IZuBz2UJOXB?=
 =?us-ascii?Q?vga73ZP1jbCic3GsZGzI6jQjZ7DGPh54aVVmuGFeO+QJp3+4llm9+uqyVJpp?=
 =?us-ascii?Q?64n+WyUyWKaSgNNhtGnV7cCz0PLTMIR3xFEQNOcc3OILylW/5fY/AnpC84O0?=
 =?us-ascii?Q?TpbDSj0r7lNAih67AE51STXd4UFoNOzhv5+CXL0DXljsqOOIuTWKyhH2Gd7a?=
 =?us-ascii?Q?G5Z6TmYJ9R/ufJSRUHSzKYGZVk4/uFLL6tCCcqjwh8xMegA6s53qN6M6tTQz?=
 =?us-ascii?Q?A0S00lw/RNEa5QaV60uKUfWdeW4UnrAnfKCoSUHSm1VI4zpSCVmljA42w2qf?=
 =?us-ascii?Q?he+Ohu9H2+WsmvyNtIA6tTmXjKlU+oxLL+Grg2bdcE6/OmvvvaJFO75pbV2P?=
 =?us-ascii?Q?FvQkYQ+YIPz9j53z2qC3B+VBQ7GkPL9GDloUMaGVhJ4+25OqgKsvBtYFUxw+?=
 =?us-ascii?Q?ukzQ9vA+Ji1dfJ7+vNNMEGbe1plTya1WgzvDTRH1PdehRAmzzOZTo/c+nX4u?=
 =?us-ascii?Q?EGbwE8T9UYaMuLqAFZUSs4MOmkxds7QjdQz75/FmZdim2wnJJO+uAjqaZeL9?=
 =?us-ascii?Q?9z8dXpACJ4ALYS0y/llSTnJ2bQ5KAwjl6dFD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:22.0985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4a6117-d7d8-49dc-101e-08dd7dae46c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Look for a subnode of type `multiboot,ramdisk` within a domain node and
parse via the fdt_read_multiboot_module() helper. After a successful
helper call, the module index is returned and the module is guaranteed
to be in the module list.

Fix unused typo in adjacent comment.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * s/XENLOG_ERR/XENLOG_WARNING/ on duplicate ramdisk.
  * Removed stray ")" in printk
  * s/else if/if/ (because of continue)
  * Removed trailing continue
---
 xen/arch/x86/setup.c            |  4 ++--
 xen/common/domain-builder/fdt.c | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4cae13163b..76ceb5221f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2150,11 +2150,11 @@ void asmlinkage __init noreturn __start_xen(void)
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
index 50fde2d007..c0f526a4ce 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -216,6 +216,31 @@ static int __init process_domain_node(
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
+                printk(XENLOG_ERR
+                       "  failed processing module for domain %s\n",
+                       name);
+                return -EINVAL;
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


