Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2FA81199
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942801.1341927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXC-0007l3-Qa; Tue, 08 Apr 2025 16:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942801.1341927; Tue, 08 Apr 2025 16:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXC-0007hb-FM; Tue, 08 Apr 2025 16:10:46 +0000
Received: by outflank-mailman (input) for mailman id 942801;
 Tue, 08 Apr 2025 16:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVu-0002e3-31
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2413::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d38f3911-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:20 +0200 (CEST)
Received: from BN9PR03CA0492.namprd03.prod.outlook.com (2603:10b6:408:130::17)
 by PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 16:09:14 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::95) by BN9PR03CA0492.outlook.office365.com
 (2603:10b6:408:130::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Tue,
 8 Apr 2025 16:09:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:14 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:12 -0500
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
X-Inumbo-ID: d38f3911-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezPBTCeETVSnIvFFWmbV+rrkrnLkUpUGc1tfd+KO3Hgs1ki/ts+7PvjPrVzjAujvzf0+kffdYXaTirI2w+tUIGhH8QFNGiZiT42gvPePlG0anYpHmXQfQvV/vu7cUN0axgMcALr7PwfNAxQlQk/WasIxAsPGz8wDIGyotjhibBinOCRDipM1myCgYxegqEoGTtV6sjbf4F09Nkfh380WJr078n0YzjsrZYF9Z8tPeFrDJ07KRjNIHYc0KBHsT/KLFIXru2sDcBAjDVimHTG6Zcyf67UrhPj5NwK0UIy1iMz4Wjn/vgLu98lJyvb77fz0waaKcGqSZH2mel7FFY3LLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NFIwj6TuPe9D1STJbnh5mSq1JDjK37GAwCKyt0ngHY=;
 b=pYyXtixKPr6xiXzkMSOiinUixmtjTLeV3Jxk1U+xL57OzmkK75+1Lyyy9BXj20JekEAqn4SZZqaQnl1r7XW7cr6Oyl5Cc8JpaVT73AH+JnVbNI2oa3OWs40YI3gafxMK4IyHPYOdQxogHtJNxkG5qxK4Hwio1/YvuI/4eiaRYZ0rUw8YAPm0D5PfnBeKpH+mVtAu4FhJlIfdJUUfOQO8r80RL27UbZK7FJIT+fAnV5/wJwGfzhM1mhOTqRYUyLZ1IPJ9oT9dI9Aa/Ae2ZmjiS+9RgcaHVWv+yfx5RGIVaB3O2RVIIBjWfmiKQFqEXoY4OkDHWkiqhePa3SkMgMWXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NFIwj6TuPe9D1STJbnh5mSq1JDjK37GAwCKyt0ngHY=;
 b=VtYlkubDmEV9MszuyKXjx0S9VM2V+4Xfp/h69OEfXJlpmsTMW5hGggKOYdKa8XoLQwLfCXXmIjxeCrOPgFoBhbWihYS5vKLg7LR950xXPjdo0JhvgYUBXGdKKSTlixbya36qFA5GXzEs4rdxcyGOJxLiH/OmXWxiTdeYT7R3Oc8=
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
Subject: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with hyperlaunch
Date: Tue, 8 Apr 2025 17:07:33 +0100
Message-ID: <20250408160802.49870-12-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfb7b7f-e2c6-4e57-74b9-08dd76b7b4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Ny7UKNNSHGJ6VDYCJEO8tFlSeQFczLDNw9HyEjKB2jzNYCuRuzaT0whr/ne?=
 =?us-ascii?Q?1LnCpRAc+8BCqu7ZIQ0fYLCEUP2u4il42jqevvqUAEXbHZFl+MTRY/qvP+XF?=
 =?us-ascii?Q?E68tXhJGNoCkkwlybedymmTVE50jn6PI6ivc3GBR7Tt8PbgprLtZFYu5NbC4?=
 =?us-ascii?Q?+mtByLqBa4pcQ2veN8RTOJ7aKM926mtt0uQCZZCJI/gZV83cHY9yWz6vAWVQ?=
 =?us-ascii?Q?Q7xn+yXgCn+amh9rrebj9Q6zk0/gFNSTB6qNfaHLc118+KOF8xZHguhJY3kb?=
 =?us-ascii?Q?i+yrWgOAGAosSjIDLJ2Ojzv6En6TyLepxOrXZtoytWvQKPliyJmIz2SVJVB6?=
 =?us-ascii?Q?TuHBXwv+9m4ncVZgCiQY/aEdHANr8LtrFyyKanCmrqeDej5MbdUWJfSsfT8g?=
 =?us-ascii?Q?Q+9W/EWpjBzCrcPrqexXpmvhE9YH4c+lJtK8OatZ5IT6kWzASqGSsOJrnY6A?=
 =?us-ascii?Q?zOzJ7eWxS8yUBBxtxEXh9eE99JJQVlD1xNC1/ta6xtJmCs2o7nMS+0z3PKA0?=
 =?us-ascii?Q?qH7IoaFyzDa8R3m+nm2LBmQfAJeVG/IaVXujW4VLlGrHgPul1HiegNw+dL2q?=
 =?us-ascii?Q?0Cn/45ijm1I5MqNqtCBf5LCr3rIVhpQfDVgVgOZzfr3VEhg5p9+3FCH/dHuN?=
 =?us-ascii?Q?7cxVeVsCToYls6OYVv2qshxywKlh8K4JHFHHBfOFmT9uBRiI/6qewtvts9TR?=
 =?us-ascii?Q?xBx2oodrIPIQV1UCFiYlyCaG0JvSoj72AkFCh4zXXKA175MpvqiEAmWNM5nz?=
 =?us-ascii?Q?maS0JF5r574MyjTpeQTMDbcpVd0YXsAgxHxgG6HoMFfgittlJQe13mhD0CO/?=
 =?us-ascii?Q?GtdFK2aGV17cLW+DgNXTMzIkVIIYXTvQdjrgWXwLAbiOFJExSGfs6dNCHcIY?=
 =?us-ascii?Q?QdkfRKOD8MYc6fNO2caB2yr+X5EBvhwZWM3RA0P5ImZBJnZVYX+nOTq1cfZc?=
 =?us-ascii?Q?uqJis2wdViuCEe6m1gtVbzZWAdHi07+ISzBW8+kC+SjGnd/NlbmbfuZuu+/z?=
 =?us-ascii?Q?lNctWCLTT2RJrI3TS6D1WTjiCO6mvkYcN2ppdphdRUowIfWDyA4BgdWeE2Jn?=
 =?us-ascii?Q?bTuDXqV6Ty8kjILr52jAfXqtzNWBdZZmjmc5NG7lBsUArbk6JJWaSudpmotw?=
 =?us-ascii?Q?K3z4Rer4W/WFvGfXAnbywCQhMnI/Vu7Qek6Z5K6R0wlz7P01U2aWEIWWnJOv?=
 =?us-ascii?Q?n00JE3YVdw1JcPXIBijUH0xhEOqXGAg2e4+a0M6F9S1Xg6WQ43d5lsV3BUK7?=
 =?us-ascii?Q?1Ic4RnQ5MjvLpViTltAp/jTDvVqVjH/YlRBZ73tfpsnGeZm2vpReFFKBj5vp?=
 =?us-ascii?Q?M1tMaFOysto1RZJPLWT4wcWk0o+Xg05ccFyT1vtKQ9n+JKtaHpg0R/LGpP0p?=
 =?us-ascii?Q?qo6W318JMFvGZUtrTt4++oz/HPvfT7aJhXfE8eshs/TE37DeV6J30+KD+5Pf?=
 =?us-ascii?Q?b+o+SlvkQI8qPtTbEy4r9RvxO4MuygI35mpzeNXBXLLNBZhTOf0TB95sKQLf?=
 =?us-ascii?Q?ZdS8JkruOMaKn2Mjh3rXz69G0TlqqTV4ixXc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:14.1408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfb7b7f-e2c6-4e57-74b9-08dd76b7b4d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076

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
v3:
    * Reworded commit message to state the helper postconditions.
    * Wrapped long line
    * Fix ramdisk -> module rename
    * Move ramdisk parsing from later patch
    * Remove initrdidx indent
---
 xen/arch/x86/domain-builder/fdt.c | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/setup.c              |  4 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index bc9903a9de..0f5fd01557 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -195,6 +195,35 @@ static int __init process_domain_node(
                  !((char *)__va(bd->kernel->cmdline_pa))[0] )
                 bd->kernel->fdt_cmdline = fdt_get_prop_offset(
                     fdt, node, "bootargs", &bd->kernel->cmdline_pa);
+
+            continue;
+        }
+        else if ( fdt_node_check_compatible(fdt, node,
+                                            "multiboot,ramdisk") == 0 )
+        {
+            int idx;
+
+            if ( bd->module )
+            {
+                printk(XENLOG_ERR "Duplicate ramdisk module for domain %s)\n",
+                       name);
+                continue;
+            }
+
+            idx = fdt_read_multiboot_module(fdt, node, address_cells,
+                                            size_cells,bi);
+            if ( idx < 0 )
+            {
+                printk("  failed processing ramdisk module for domain %s\n",
+                       name);
+                return -EINVAL;
+            }
+
+            printk("  ramdisk: boot module %d\n", idx);
+            bi->mods[idx].type = BOOTMOD_RAMDISK;
+            bd->module = &bi->mods[idx];
+
+            continue;
         }
     }
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ca4415d020..3dfa81b48c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2149,11 +2149,11 @@ void asmlinkage __init noreturn __start_xen(void)
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
-- 
2.43.0


