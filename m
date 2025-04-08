Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264AA811A6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942939.1341994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BYH-000590-PI; Tue, 08 Apr 2025 16:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942939.1341994; Tue, 08 Apr 2025 16:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BYH-00055q-M7; Tue, 08 Apr 2025 16:11:53 +0000
Received: by outflank-mailman (input) for mailman id 942939;
 Tue, 08 Apr 2025 16:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVm-0000a6-NQ
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1025b54-1493-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:09:16 +0200 (CEST)
Received: from MN2PR19CA0049.namprd19.prod.outlook.com (2603:10b6:208:19b::26)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 16:09:08 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:19b:cafe::bd) by MN2PR19CA0049.outlook.office365.com
 (2603:10b6:208:19b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Tue,
 8 Apr 2025 16:09:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:07 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:06 -0500
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
X-Inumbo-ID: d1025b54-1493-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYv05iQfg6WNmc1bIHo5vDF2Q0LmqRD+mWgqb1Whyd0mS/iNzBR4vFhC5HX17l/X5z0pZe7fv3K079K860uDphwX5ajzQJH9xHZ5+Mx5aJ1uo72JgWWI84MgUQ1FJezEpcE2dJb8YRQpnAMCqxg4T3FvjK+pGYOApjyCiNsppt4MrGrAcQXFqg5Chz5qxHcBvhpcLSkYMVb7iiId3RnatG4dxbJN14HKiri1Baw70F3bqznIbu6tRnivVnbV3gq4O0OzgsIAhHDZIOjOgvl2P2hQAGSScBtzHmtQ2xVJ9hxlTQPDoYd8xXh3YXyNmvDgybsYJ+UJNfvCq1SOLIEKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6cqyaPQF4iDLIVBSm6nomktyAk6q6RkbIKN0PzBBQA=;
 b=w3PHCRiooqcq4Xy7BJZ0SNEe5wyJi/dzX3LZHlyMY/1ZN+aKAvt9vWEwtAXVt43m+UeuU6gRCUNlWNqLp0TKcMX3xUp+kGoY6SKvhdsIcLO4IUcUU5BJKSssPSuD0n0ZlHsvYoZ1ShKKKY/1yJGmLPpW1CzNcrtx0AsZ8+3pVcParcaqE1/7sK/VU4fpxUK7X/QOrGu81fC5ehnFxd5Amt896jRJ3Oihtd4r2Qe+e/8h1bnvf5vzOcmesG5nQYbDq7ytKrMHfyVHzZ85YU0t+qz8jKvFMWI3WoBn6BO/NJzKlWB0BMXc6EN55djL+8YyeIuHyvmUMgDHReOJ3i7RHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6cqyaPQF4iDLIVBSm6nomktyAk6q6RkbIKN0PzBBQA=;
 b=VT/nT6ftY3IbZ1thVqecK0sGHaO91L8a3VlAjzkQJc56hrdQ+roHLq1PF+0xjKjP5uK/kXRdq6QG43qHW+LF6cY4K96ZYV61CdxCW5bXRQ9mciPRjkRWuI5PQgguteyCyS/Y7q896UKNhUtaVkd7TWyJDeeFQ+iCWU97eJOzje4=
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
	<roger.pau@citrix.com>
Subject: [PATCH v3 07/16] x86/hyperlaunch: initial support for hyperlaunch device tree
Date: Tue, 8 Apr 2025 17:07:29 +0100
Message-ID: <20250408160802.49870-8-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 149656ee-e74d-4016-ea66-08dd76b7b11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ntUiWpIzt6KRziyhPOKTQ8SpYjcidUG5MPmV7il90PZRrzOG9HRPxbeQaR19?=
 =?us-ascii?Q?wBukGlAvynOyhpny0lvC68whUvXx1jeu0YSxKUXJomYAaGTBKMHA5vUQNB3w?=
 =?us-ascii?Q?pEee3z+9spmB7Q1QLG70GwYO1Q0zTi11QaBpv50j1Bphu9H8lXYljvzI0l9D?=
 =?us-ascii?Q?X2jcRh5EP2wHgIPAV/E2YSb9o7D1kd7EgHpqe+6wOwiROIULtOjDEjV+mRM/?=
 =?us-ascii?Q?I8r5kLjbCUZWGpBGVqpKzMPCFy1ajVtf0Cz0DN3HshS69e4UAc6JyqpPBHxN?=
 =?us-ascii?Q?NKxc9Q6LWx6InypxjTgP1wJagGn24bankEa+kWYIX69soLXm0+R1XdEyKtOb?=
 =?us-ascii?Q?2jw7+P6YzeftOaniFH1pcQsojJ1vdXH9hJZZ4DxY9KFccQfQHPFYyDRInc8N?=
 =?us-ascii?Q?BFBHYe1G09+h7YfKySCWPwZ3myqNWC+ApfiPFTHuUO3+ZjZc4BGLu54ixMwL?=
 =?us-ascii?Q?zqePIBirVIltZQ/gOCqvg6QHAUizVqMQzfjFhkY1cJ5YcSD8HO6NBIQG9bXY?=
 =?us-ascii?Q?NEE5p/IXOAm2KEwZzUOUeAEJDdENjAaKJpjyr1x5ZdrttW8HjmRmivZYaEfj?=
 =?us-ascii?Q?iLCHfot428w5TIFEqn56E9mfCRWm7q5y8rAujnSXQLDXJdk8Ryrgr/Hixt23?=
 =?us-ascii?Q?COUkrd1YhH7deFYqIdiqbUwXTanDCC2u7aPNbIt6RPrxW/cNKGFC17sfmcl8?=
 =?us-ascii?Q?mG4acL+tnANvW+zw0kjIH5sdLCdSdRA+IGHz0Sk098j6o6uZ0oxnrsGzo8rf?=
 =?us-ascii?Q?BlPHE+6vVl27+OlBkvPSQlnSOcMKOwcfLXV8RJMpBb+dc8sRX06ki7kmU28M?=
 =?us-ascii?Q?bipso82sDKersQVN3ZD7tPf2ylcJ9YVWsvhGeyNOWiOqIjPlODdJCaPtWMry?=
 =?us-ascii?Q?2adKRzHth1LXA0uDHAyXEBd/N7Sg6/afl6+oTNpQOOxQfPhYgF2zA/3pJlWy?=
 =?us-ascii?Q?vwesIneFZGgq8olz+Hf4RoiNgmuFPvgyq0tOJrXnYXLOEWTEFLnY5sTfs9IF?=
 =?us-ascii?Q?Ek5V4xhKJX1zRxB/pXwAb2hxmEFNCu11dxPYcK05qIkWuknlAdgB+MUQ7LiF?=
 =?us-ascii?Q?QkWObrq9U9wjErTz9SX12n68/bT4Nf174x7f0TeOI5lMUvi/Q6hzbuhmbfBF?=
 =?us-ascii?Q?ipjAwWSduoSa9qB7qmSbCOlEEakE4qhWe5WNZQq1qLahgbAW1tPcnJiTPYyE?=
 =?us-ascii?Q?wpIOXrRdAs3PfcapUQenqJuTq1rulOVEh8rNsvyRVZUXIp5AP5oi/Lj29uz0?=
 =?us-ascii?Q?7jwYtBsYejTRgTGxEX0OQJFAX4/+eavH78XfpoKM0nODjgmsQha5sKyJcyN9?=
 =?us-ascii?Q?nw43uIT9P+CpSJpa0eSRcxZMmn/QLH5y+Kvi6il2sKh1XzkMUtMB2vnvqgnI?=
 =?us-ascii?Q?ok6MZZ1hRH6XkdeG44NpIZH9kvE9l0/R7u9TIAqdy3Znp2EVeGOz2LpETZNB?=
 =?us-ascii?Q?C7mT3A/L7yX6EN6dO/+O7m5HNXHGG1W3ozitqrA+nap0tOxkNywjf8CZ4MWo?=
 =?us-ascii?Q?RBWZWVPxUtzRgdI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:07.8564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 149656ee-e74d-4016-ea66-08dd76b7b11c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add the ability to detect both a formal hyperlaunch device tree or a dom0less
device tree. If the hyperlaunch device tree is found, then count the number of
domain entries, reporting an error if more than one is found.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
const not added to walk_hyperlaunch_fdt bi since it is updated while
walking the device tree.

v3:
    * Add a blank between declaration and statement
    * Add const to void *fdt
---
 xen/arch/x86/domain-builder/core.c  | 15 +++++++
 xen/arch/x86/domain-builder/fdt.c   | 64 +++++++++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.h   |  5 +++
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 4 files changed, 85 insertions(+)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index d6ae94f45c..c50eff34fb 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -44,6 +44,21 @@ void __init builder_init(struct boot_info *bi)
             break;
         }
     }
+
+    if ( bi->hyperlaunch_enabled )
+    {
+        int ret;
+
+        printk(XENLOG_INFO "Hyperlaunch configuration:\n");
+        if ( (ret = walk_hyperlaunch_fdt(bi)) < 0 )
+        {
+            printk(XENLOG_INFO "  walk of device tree failed (%d)\n", ret);
+            bi->hyperlaunch_enabled = false;
+            return;
+        }
+
+        printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
+    }
 }
 
 /*
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index aaf8c1cc16..4c5b7747f5 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -13,6 +13,36 @@
 
 #include "fdt.h"
 
+static int __init find_hyperlaunch_node(const void *fdt)
+{
+    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
+
+    if ( hv_node >= 0 )
+    {
+        /* Anything other than zero indicates no match */
+        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
+            return -ENODATA;
+        else
+            return hv_node;
+    }
+    else
+    {
+        /* Look for dom0less config */
+        int node, chosen_node = fdt_path_offset(fdt, "/chosen");
+
+        if ( chosen_node < 0 )
+            return -ENOENT;
+
+        fdt_for_each_subnode(node, fdt, chosen_node)
+        {
+            if ( fdt_node_check_compatible(fdt, node, "xen,domain") == 0 )
+                return chosen_node;
+        }
+    }
+
+    return -ENODATA;
+}
+
 int __init has_hyperlaunch_fdt(const struct boot_info *bi)
 {
     int ret = 0;
@@ -20,7 +50,41 @@ int __init has_hyperlaunch_fdt(const struct boot_info *bi)
 
     if ( !fdt || fdt_check_header(fdt) < 0 )
         ret = -EINVAL;
+    else
+        ret = find_hyperlaunch_node(fdt);
+
+    bootstrap_unmap();
+
+    return ret < 0 ? ret : 0;
+}
+
+int __init walk_hyperlaunch_fdt(struct boot_info *bi)
+{
+    int ret = 0, hv_node, node;
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    if ( unlikely(!fdt) )
+        return -EINVAL;
+
+    hv_node = find_hyperlaunch_node(fdt);
+    if ( hv_node < 0 )
+    {
+        ret = hv_node;
+        goto err_out;
+    }
+
+    fdt_for_each_subnode(node, fdt, hv_node)
+    {
+        ret = fdt_node_check_compatible(fdt, node, "xen,domain");
+        if ( ret == 0 )
+            bi->nr_domains++;
+    }
+
+    /* Until multi-domain construction is added, throw an error */
+    if ( !bi->nr_domains || bi->nr_domains > 1 )
+        printk(XENLOG_ERR "Hyperlaunch only supports dom0 construction\n");
 
+ err_out:
     bootstrap_unmap();
 
     return ret;
diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
index 8e62cd843e..1849656571 100644
--- a/xen/arch/x86/domain-builder/fdt.h
+++ b/xen/arch/x86/domain-builder/fdt.h
@@ -11,11 +11,16 @@ struct boot_info;
 
 #ifdef CONFIG_DOMAIN_BUILDER
 int has_hyperlaunch_fdt(const struct boot_info *bi);
+int walk_hyperlaunch_fdt(struct boot_info *bi);
 #else
 static inline int __init has_hyperlaunch_fdt(const struct boot_info *bi)
 {
     return -EINVAL;
 }
+static inline int __init walk_hyperlaunch_fdt(struct boot_info *bi)
+{
+    return -EINVAL;
+}
 #endif
 
 #endif /* __XEN_X86_FDT_H__ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 82c2650fcf..1e3d582e45 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -84,6 +84,7 @@ struct boot_info {
     bool hyperlaunch_enabled;
 
     unsigned int nr_modules;
+    unsigned int nr_domains;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
     struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
-- 
2.43.0


