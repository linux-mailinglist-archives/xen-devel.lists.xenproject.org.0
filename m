Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618DACF861
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007530.1386850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGcS-0002IM-7x; Thu, 05 Jun 2025 19:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007530.1386850; Thu, 05 Jun 2025 19:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGcS-0002FB-1N; Thu, 05 Jun 2025 19:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1007530;
 Thu, 05 Jun 2025 19:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGaR-0002tD-St
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:49:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2415::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 285d73b9-4246-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 21:49:15 +0200 (CEST)
Received: from BL1PR13CA0130.namprd13.prod.outlook.com (2603:10b6:208:2bb::15)
 by CH3PR12MB9080.namprd12.prod.outlook.com (2603:10b6:610:1a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 19:49:10 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::1c) by BL1PR13CA0130.outlook.office365.com
 (2603:10b6:208:2bb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.17 via Frontend Transport; Thu,
 5 Jun 2025 19:49:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:49:09 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:49:03 -0500
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
X-Inumbo-ID: 285d73b9-4246-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xormJYxutVFXv21/aq/SfW1E4oU0hX6Nvvf1gRdaBgwixDt5a8Bnhn2gOqFYAQKQjAkszqondgmfQGrmBdnmIaUAAkzCV+G+yUS3SkqvqY/qRXIKQ2I3VpfbbTuyJ0uZ1NJkP7n7dwRE4w97V3HNxcSNa/xnunnq4Puvzp8Vy02Ptzm2C7UhTlVHZdFrSaRxiqL3Y/wjsknnpMgoarbmt5xiPIx4DF+egvcBxk3PAGf5KtFEOLDTKocg3A6pRNKS4j6k2SxGCSAWftWPn7vJPDPlo4qzxccYiLT6/B0N77twyu9QPu0tKcJzkfayUJqFp+g+aLEQRlxrhtu6lxBqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8prgYMg1Iae8KvOYuV1o/xOVsXEhepIuqEAO+9pqk0=;
 b=OfXAtYuskj1trl3R1JoXrG/2hCvkueDAnLSB/tuYP+t5eqFUkOzzZYZtD4F67nq3MkoIlH0/rFnwMHW6cEUIQwEoz2jyi1wFAlHz3RqzcJV0mqKWVggdHg1V6Adqsau5DkQfAh6+/MpiSxZdR3Y9/4BHfQhNr9S5kfq7EsXUyuJ9TFBBsA2/olf2zBZr0rI8+XV+QSccHabtP6MVKqbwIOIUlQoUQ/drN64c5k0uPy72ATl/OOVulORHnQhNKIJu7jYG+qw+Mw5vdJlIzdFsIVJoOXtxNwGweawLHyhjkuRWxocP/Y6TZX7zfsJ1e4JvlMM+CeopVvqHBOXSXDIwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8prgYMg1Iae8KvOYuV1o/xOVsXEhepIuqEAO+9pqk0=;
 b=yk+vgjtYsTZ7s41tgdKBEMD84kBNDc6fVM0HEaidLADsC6Wy2dTCJy1NCY4FmqVznccsUSFuJ1zfCW2HVEwO446JCUHwKjFR7ncCr94N/niaGy2Oj2AuVjJ/MKl/1fkXnuHm6r8FALnQII2HJ68meYFjQJOahkQfWNeJZj3dwFs=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 12/15] xen/dt: Extract helper to map nodes to module kinds
Date: Thu, 5 Jun 2025 21:48:04 +0200
Message-ID: <20250605194810.2782031-13-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|CH3PR12MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: 096e87a5-0baf-44b1-469e-08dda46a0a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fpi1ABCaJD/TpIuI/nmDMDQAEIkF2wehtiXNEKwx6HTv0LvXWQPLu7Zrd+Jn?=
 =?us-ascii?Q?Y2bzzA7V4iYwicj7EjCrP6p0psV9mjcVJuHKTpY/MwcGKstNSHmi3R8/TLde?=
 =?us-ascii?Q?CyCW5mkVTPoI3Dh8346wyJU/wS3VJDR9GfBfm9JXMfpIX3EhYByJR3sug5Kz?=
 =?us-ascii?Q?vLESLoig+m314MXIflhTBeMe+7GP/cXqFbMmr6KeC24CRNYZeroLr6P8oTYZ?=
 =?us-ascii?Q?13Lcw801qcUkEaNai93aNhQOkRZ9R/uYrZ2OnvWvR5JBtDadX0ovVbO1Gjm3?=
 =?us-ascii?Q?F/ly7xkyHmGYeq0hJjYc34gyeiTHy7mK6esr9GYDjlA2iJu1eFJIhAUwUpFA?=
 =?us-ascii?Q?j4tbvl73RYX605TindMonIKXxYBx2c6ebhpoRTxaYozZJstYKxvwxxDzIZBp?=
 =?us-ascii?Q?Oq1l8plYSjVLajfW05stCvxZHm/Ipm/4Ahnn53alg5v2Ubxlz+Xi0xtweCGk?=
 =?us-ascii?Q?qPqiWQawWV2c0o9JlCbX+A2OOvmBQNso6VDWr0jNjnyYNKqf0bfBhOenop1W?=
 =?us-ascii?Q?hWa8UJHx6jVuDCuhOfrD8plA4xYokXKqjZAfwQOgJCmrfO2+IxRIKbXS27m3?=
 =?us-ascii?Q?lWywvWOGb85LnRpLWBPdJ1G13FbqI46dOE9cnqGlMFxBmR54Gu4vqgRjrTEG?=
 =?us-ascii?Q?w1wNjJTktF+kUaFlLh8iS7mAUlV7B4bbZ/8Smjx4seRcOi7foClfmVVoX2te?=
 =?us-ascii?Q?7X6qFFaWqnpdaa/34SwlC9tVQetYmApCEH8goAhk37xRogU6HzAskaYK5+3d?=
 =?us-ascii?Q?eYx8M6oW3gmPUjdI7Xo6RP69BZHXm9gLOizNUWDBPSdamSzjyPJoYfK0UlkH?=
 =?us-ascii?Q?DrVUtN8jqGQiIDQJdF7f0W+z5rIzgzA9KNbV+J3/z8Dk2BtrO4lAN29bGPHX?=
 =?us-ascii?Q?+sQjjBXdEf9iNZJQ6ck3knxo9ykVtwTeejUQLo9WQswi7eGxrLBrNP/xEjCw?=
 =?us-ascii?Q?/P+Xr5EeVGKRZXdCkRuDv2/FiZihkvqk62sAyzQyW74WCSkGWbaV0Zllr9TH?=
 =?us-ascii?Q?YbDw+mgS1NwAObHhc4Wlwxa/VPMIaInTUoqkrn7qjTLD51+QbtLZ/ATk5Tyk?=
 =?us-ascii?Q?0XHKSxw7F4Zc/poN2bvKFSReb730I7k8zbeBmG4D3GlhhBeRAZ//HLuZlXdj?=
 =?us-ascii?Q?V7NmbmvM/0Gp+MXERWJYZVIjgcPimF1o3C1+hWRZi5D8ggceH5yqIM8HHP2p?=
 =?us-ascii?Q?BCXqj3DQjZHhCc9sc5Q6W0j1YcIjHHRUyX29oBEWJ7vgVqGy7O/S5npHJXij?=
 =?us-ascii?Q?y/SeImO8p7t+Yd4AehgoatZgFwCwn4nEPvh7C1hasL1yolSziZh1eFR1I/KX?=
 =?us-ascii?Q?VDzUG5c1w3h/o3GZu+/f+OpJM1Y35lMbqyzIbF5XZcgPq0fAXCFjA0ZrUCCi?=
 =?us-ascii?Q?ny5IjW+djRJmAc4rATzTsJ4P3diI4j9X1CrFWX2tzciIIeop3g2vOp25OBS6?=
 =?us-ascii?Q?Cbsf1IRk74pqvNd61k59V/4Prm+XKwJvr764rP75r2NkrcSXQyWDjUBo227l?=
 =?us-ascii?Q?p6WYPS1FFLPsm6HtCEPj5JljE/TUkQEQFAwJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:49:09.9891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 096e87a5-0baf-44b1-469e-08dda46a0a27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9080

This will be required later by x86 code in order to do early identification
of boot modules when booting off a DTB.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device-tree/bootfdt.c      | 18 ++++++++++++++++++
 xen/common/device-tree/bootinfo-fdt.c | 16 +---------------
 xen/include/xen/bootfdt.h             |  7 +++++++
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 6acf83d197..474d719d2f 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -4,6 +4,24 @@
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
 
+bootmodule_kind __init fdt_node_to_kind(const void *fdt, int node)
+{
+    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
+         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
+        return BOOTMOD_KERNEL;
+    if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
+         fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
+        return BOOTMOD_RAMDISK;
+    if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
+        return BOOTMOD_XSM;
+    if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
+        return BOOTMOD_GUEST_DTB;
+    if ( fdt_node_check_compatible(fdt, node, "multiboot,microcode") == 0 )
+        return BOOTMOD_MICROCODE;
+
+    return BOOTMOD_UNKNOWN;
+}
+
 uint32_t __init device_tree_get_u32(const void *fdt, int node,
                                     const char *prop_name, uint32_t dflt)
 {
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index 695c4bfc49..20821e9ee8 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -236,21 +236,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
 
     cell = (const __be32 *)prop->data;
     device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-
-    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
-         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
-        kind = BOOTMOD_KERNEL;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
-              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
-        kind = BOOTMOD_RAMDISK;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
-        kind = BOOTMOD_XSM;
-    else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
-        kind = BOOTMOD_GUEST_DTB;
-    else if ( fdt_node_check_compatible(fdt, node, "multiboot,microcode") == 0 )
-        kind = BOOTMOD_MICROCODE;
-    else
-        kind = BOOTMOD_UNKNOWN;
+    kind = fdt_node_to_kind(fdt, node);
 
     /**
      * Guess the kind of these first two unknowns respectively:
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index a87b5212a6..13d19562c7 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -115,4 +115,11 @@ uint32_t device_tree_get_u32(const void *fdt, int node,
 void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
                          uint32_t size_cells, paddr_t *start, paddr_t *size);
 
+/*
+ * Probe an FDT node thought to be a boot module to identify its kind.
+ *
+ * If correctly identified, returns the detected kind, otherwise BOOTMOD_UNKNOWN
+ */
+bootmodule_kind fdt_node_to_kind(const void *fdt, int node);
+
 #endif /* XEN_BOOTFDT_H */
-- 
2.43.0


