Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AAAA0BCB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972364.1360744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kD7-0000Tr-QR; Tue, 29 Apr 2025 12:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972364.1360744; Tue, 29 Apr 2025 12:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kD7-0000Rk-MX; Tue, 29 Apr 2025 12:37:17 +0000
Received: by outflank-mailman (input) for mailman id 972364;
 Tue, 29 Apr 2025 12:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kD6-0007L9-40
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:2418::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac624906-24f6-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:37:13 +0200 (CEST)
Received: from BL1PR13CA0334.namprd13.prod.outlook.com (2603:10b6:208:2c6::9)
 by MW4PR12MB6683.namprd12.prod.outlook.com (2603:10b6:303:1e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Tue, 29 Apr
 2025 12:37:07 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::1f) by BL1PR13CA0334.outlook.office365.com
 (2603:10b6:208:2c6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Tue,
 29 Apr 2025 12:37:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:06 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:00 -0500
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
X-Inumbo-ID: ac624906-24f6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ib40iy9n9pbR3M87Ho4i3sy0KfCOSqOt7KvVYec6+/SmThMfpOji27vqEHU7fatfErdqtt36/QPZqTgxiH0actPs9T3pXp2D/JfzAbsnF0lJw/Fs93MjqPHGtuI1yIgbb0SWBoNIub0eHHtgjCIjTSZhtM8APdFm7j0O34MJZdjJqJ9xInd3ooRbfl9vlKutcQ/6cZRjFIJiqiCqQ5AjYTQu6AcFuwOhjD7vHd0AymLZ432bE5i78N8rfFbUn/WBcdRQgN7pOGsVy89RDGcNC8Zr9+u8rFCxK9YRaggxpOVPRnbm+xRIwXYOQZp8m5M6QV4PxJC8ek8hkX+2GpyILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzlDcDxGuBna1NjqeyuBWXITlGSX+G2YYWsKMdoIvyU=;
 b=xpbwj+g8LIEnbLeZIVBW/q4TYlXAmTlGzKRBPFrDJBDCJk6j8xAXuFyRmQwsspSF7Q9fr/NPPbqfoIlamE/hjXxf0nOs2Ng3aRkEfKGOESWSP9lEhxazzoBpTDBLfWt+uU6wg7zX2WvAz76Rqn/PCbYegNkn7uHqCkZW71Lvlx8aEVQ5+RFL70E2s6iYSh0jY8h/ft6MCHPm6iLCuGAP95QMJxRRBZZCx1cMDOq3jrHC3IZ6ZVO7rRNC2yn+BPFuANVEg2eqUSAMt4WFUHJSBB4srcokRU0n4UQrFzCMkGe9tKx64UeaFDoUfiu4lei1zANOuH5S51WS3EgW6Y3FrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzlDcDxGuBna1NjqeyuBWXITlGSX+G2YYWsKMdoIvyU=;
 b=3cRwrxbXpBaQa8RVHsbnrYvcydG7VQUld8VxZgNg7lHhXUE1AUTcZ0N53BhEOJl+yFGMGeKTilFBtAdvv7nV2XR8wENyjOuKEPFelg827i5twnBwF04nWIcpdkB2kOIx2YuFSY/khjv9AMTHv/QD6iGdyqbHT69k7k93OykOzSs=
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
Subject: [PATCH v6 03/12] x86/hyperlaunch: initial support for hyperlaunch device tree
Date: Tue, 29 Apr 2025 13:36:14 +0100
Message-ID: <20250429123629.20839-4-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|MW4PR12MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: e0564233-3571-40ba-612e-08dd871a8d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?75Uj1T9g9GpXOMH0eujD0H+CJzvVxhV08wglyLMi3P4MdjUAJwsFeHUJd66a?=
 =?us-ascii?Q?DS3TygVfXRTW1Xc/H6fYsqjfaAlGE7D+JFoqK/j0Q4Nlaf8Jb2D67L43s2bq?=
 =?us-ascii?Q?EvicItJiQUyr4vAZniP+Ra2TovTfuesLlcFgMW8sbVbpCJxOAzaJ6mOOonWA?=
 =?us-ascii?Q?EwbCa0xD7AHMhaMJ5xpu144TUVRjmtdTD/aPrl+C34c3Ut80nwDc4NLqDlAi?=
 =?us-ascii?Q?V263WotQ+579fb0KVsP5l5Pak2ws9UsgaJRgZH7G8xvnV/LtEC6ItM++GZ9B?=
 =?us-ascii?Q?/PFtPsyO5Ee1vtA2CG3LY+JVZTme4NUbG8JK2XW6JbAHuLqWYHxWIBQYsr7q?=
 =?us-ascii?Q?QzJ+oSSF0uYs/7nUubPOUJg9og0Y2y9xGUjkU2BXH/yzRt3oO16uDsIdIa9j?=
 =?us-ascii?Q?JnzmBgzf3J9Wg7f+B9+0FRKkVWVd0YJB/l57Yf7wggdMFe+b7U5jFEJztZTi?=
 =?us-ascii?Q?QMk9dpN5W+EvRLbfL+RsmLOwaR1d1Ypz0yg8dPi/MQREHjvMP/5ABxioCx5B?=
 =?us-ascii?Q?zu/gIGFe3xQKFvMNNS0wZEAWPEVX8YA6Lj4pOcwt7tFS4J57LdxSNAR63mWA?=
 =?us-ascii?Q?OC4s9izvnYnvFVfkQd6eJ3kokFSgjRy9M25CJIte7UrndXB3c7yRE0bSs1za?=
 =?us-ascii?Q?oewkzlZbtR7H92p56iMWxxu6ig9l2YFUScy7Xcm6YlRwPFPl+95SDpmzLMfF?=
 =?us-ascii?Q?s8OlGVQUIraCXTc2RvzZIzp4ShP/RBABbdUGkwX7ys2g54y0XLl1psrjeFrq?=
 =?us-ascii?Q?lORWchk7ztTNXkR9O6hboGG+y+Q8v/18B/k5lEPSiMXZJkww6tntt1n1nUZa?=
 =?us-ascii?Q?8RiCnolPz0COXfHIj/KQcsIU0Y7yiJuXpKudGVvh2Guq7Sw+rN4D9qG3LEVc?=
 =?us-ascii?Q?4s3L5y3LQPigNJMIr2oiUfD6Cpu3CMMqh7pVyDYK/oPHmLeZMhLnZG4HuJr3?=
 =?us-ascii?Q?k+hZBwunPp4tiVyC4u8FrSfIljlhOT0DTghp5bu+5Iw1jZdUM5PhkwAE4pZA?=
 =?us-ascii?Q?5Dn3yoW/tQzdmzXzFZi19xnKcwemhnYWzZksNQ5UPT8JSP80RLCv1efvcb98?=
 =?us-ascii?Q?wC/DV6x3kx7i82qzCWqnm7YKNikcBDYDEcsKc2w7sOPv0wQadzMtPRUbpUis?=
 =?us-ascii?Q?9qAa4ele+SIUSCbAMs5w6LhXiseEn/9x1EdBn6IVmY7Hb8ZLKKjB44k4kjGa?=
 =?us-ascii?Q?JThCv3P8Weaq83iojocoDEyyo5s+RDMz79k1m3nI8nlppO6NSt7AD97NY92s?=
 =?us-ascii?Q?H3SqVjJRAfq+D15Geri3dUmm/BnJ+XuAPhgv0AbnMPnJK5USn2s/2XnuWT8i?=
 =?us-ascii?Q?J3NPayClj4rGDk7QyY1C9wnVaT5vFH4UD2rvXJfSLyHlfGyXAl2dupsMJw0E?=
 =?us-ascii?Q?E7sCnMrKQeq//d1fXlwU3/x+naeU+lJ7JS6stbHri6bR0YiHOtEJCGpk1FHu?=
 =?us-ascii?Q?hfpYOJJ9AXb6FG5j1iQZfHYNSW18Bn88CtxjlHDmYdbJr2UZomRO9IxzRl4j?=
 =?us-ascii?Q?lgD+TIGsw/E/h1D81QacJik8ReM7GR45zq51?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:06.7947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0564233-3571-40ba-612e-08dd871a8d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6683

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add the ability to detect both a formal hyperlaunch device tree or a dom0less
device tree. If the hyperlaunch device tree is found, then count the number of
domain entries, reporting an error if more than one is found.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/common/domain-builder/core.c    | 15 +++++++
 xen/common/domain-builder/fdt.c     | 62 +++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h     |  1 +
 xen/include/xen/domain-builder.h    |  2 +
 5 files changed, 81 insertions(+)

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
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index 97c92db571..c6917532be 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -16,10 +16,17 @@
 enum fdt_kind __init builder_init(struct boot_info *bi)
 {
     enum fdt_kind kind;
+    int ret;
 
     bi->hyperlaunch_enabled = false;
     switch ( (kind = fdt_detect_kind(bi)) )
     {
+    case FDT_KIND_HYPERLAUNCH:
+        printk(XENLOG_DEBUG "DT found: hyperlaunch\n");
+        bi->hyperlaunch_enabled = true;
+        bi->mods[0].type = BOOTMOD_FDT;
+        break;
+
     case FDT_KIND_NONE:
         /* No DT found */
         return kind;
@@ -32,6 +39,14 @@ enum fdt_kind __init builder_init(struct boot_info *bi)
     default:
         BUG();
     }
+
+    printk(XENLOG_INFO "Hyperlaunch configuration:\n");
+    if ( (ret = fdt_walk_hyperlaunch(bi)) < 0 )
+        panic("Walk of device tree failed (%d)\n", ret);
+
+    printk(XENLOG_INFO "  number of domains: %u\n", bi->nr_domains);
+
+    return FDT_KIND_HYPERLAUNCH;
 }
 
 /*
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 4b07bd22c8..94ccff61e2 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
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
+
+        return hv_node;
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
+            if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+                return chosen_node;
+        }
+    }
+
+    return -ENODATA;
+}
+
 enum fdt_kind __init fdt_detect_kind(const struct boot_info *bi)
 {
     enum fdt_kind kind;
@@ -20,6 +50,8 @@ enum fdt_kind __init fdt_detect_kind(const struct boot_info *bi)
 
     if ( !fdt || fdt_check_header(fdt) < 0 )
         kind = FDT_KIND_NONE;
+    else if ( find_hyperlaunch_node(fdt) >= 0 )
+        kind = FDT_KIND_HYPERLAUNCH;
     else
         kind = FDT_KIND_UNKNOWN;
 
@@ -28,6 +60,36 @@ enum fdt_kind __init fdt_detect_kind(const struct boot_info *bi)
     return kind;
 }
 
+int __init fdt_walk_hyperlaunch(struct boot_info *bi)
+{
+    int ret = 0, hv_node, node;
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    BUG_ON(!fdt);
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
+        if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+            bi->nr_domains++;
+    }
+
+    /* Until multi-domain construction is added, throw an error */
+    if ( bi->nr_domains != 1 )
+        printk(XENLOG_ERR "hyperlaunch only supports dom0 construction\n");
+
+ err_out:
+    bootstrap_unmap();
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
index ef897fc412..d1bcc23fa2 100644
--- a/xen/common/domain-builder/fdt.h
+++ b/xen/common/domain-builder/fdt.h
@@ -10,5 +10,6 @@ struct boot_info;
 #define HYPERLAUNCH_MODULE_IDX 0
 
 enum fdt_kind fdt_detect_kind(const struct boot_info *bi);
+int fdt_walk_hyperlaunch(struct boot_info *bi);
 
 #endif /* __XEN_DOMAIN_BUILDER_FDT_H__ */
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index b9702db735..cbb3cbea7c 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -9,6 +9,8 @@ enum fdt_kind
 {
     /* FDT not found. Skipped builder. */
     FDT_KIND_NONE,
+    /* Found Hyperlaunch FDT */
+    FDT_KIND_HYPERLAUNCH,
     /* Found an FDT that wasn't hyperlaunch. */
     FDT_KIND_UNKNOWN,
 };
-- 
2.43.0


