Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C27ACF84E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007458.1386786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaH-0004Hc-9e; Thu, 05 Jun 2025 19:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007458.1386786; Thu, 05 Jun 2025 19:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaH-0004Bf-0v; Thu, 05 Jun 2025 19:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1007458;
 Thu, 05 Jun 2025 19:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGaF-0002tD-13
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:49:03 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2412::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ff139ef-4246-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 21:49:01 +0200 (CEST)
Received: from LV3P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::25)
 by LV3PR12MB9119.namprd12.prod.outlook.com (2603:10b6:408:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Thu, 5 Jun
 2025 19:48:57 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:234:cafe::3d) by LV3P220CA0015.outlook.office365.com
 (2603:10b6:408:234::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 5 Jun 2025 19:48:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:57 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:55 -0500
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
X-Inumbo-ID: 1ff139ef-4246-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J675nKOhYsqiQO5Kkemo03/UTOmqxx77LGX3EBEFCLmKnC4ZnPYGEJTBniCRG8FU1hZsZarG0drUiow0W10d72MsNDgDCDmRDlbD/TdLvY9No/NOV95+YZjMYmSWltaK258c+iYtFMZly7Ez73KxXdQ7YkXBGgSWSfOOmcfqZthc7qLSWl36Q+Sub+EzBj9oWng2yEdzqnv+AMCtltcVPF3VjMs09zvWHIr9ufKrJyKgGkWmyOrrWLFu5lJC3aHZxqQbyxAIO4Aq9TPqdI6VwmowjYe6QjDbwpdIviei0R2N5d1wr2CC437Wi67sq48rsTdmal+ka4b34VGdVWl72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8nPofpxazoCxEYwpzGMgVEbLO3KBjjKiS7lZ9jpSZU=;
 b=q70gIi1pYEOWQ6jd1vlwwa6a8ioz73+loBnALocqfIN405/277rEdCRKXEw1zE7+KlwqkKFBNpYIbZbNKysDMfU4URvtXDVJ9eSIs/Jv46d8NgroR7mp+v9oP4VWcr3MZSJE4Rlk/r8y43mkvkWU9Hf7ZlcJz5alO6yH0cP1t0Zbrln/VOcsWhLjlMIWKQ25Puf5arddGovlMrB0ekdxE3Bxzbbm3LayGCa6HoNozbFDNDx3FgIq3TknOXR/8x+vzDABYxdaWU6tTY1Kc/FhMvt961wmvqwdldF+KrfWX2Bz2yj/LWK9m5ZlJgTczr7sbvlAzaN46KnFbN+0cDNONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8nPofpxazoCxEYwpzGMgVEbLO3KBjjKiS7lZ9jpSZU=;
 b=xBjC9FTDT5yyWqiKcx58kQKbU5cVTbzihUsLm5cgJ9d7PMPXaji9J3SbimADBqU1ZRbfS8JD2dE1T+BnMAycnd7hiuIaMtw6AbmvGIi8LVpEwsVKZIrLTvWsJ5B97mIf7cSDo8PLrQ0Chpk/9IMXHulxv6o0T+1Pnc5GPKscG8o=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 08/15] xen/dt: Move bootfdt functions to xen/bootfdt.h
Date: Thu, 5 Jun 2025 21:48:00 +0200
Message-ID: <20250605194810.2782031-9-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|LV3PR12MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b0f128-3582-4ff5-ac98-08dda46a02b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xi+rJG6pTly3bY9yCINgvBFSuDZ7PqTXwyfnuWRLDB15yR1ymUtqnV6k3BCB?=
 =?us-ascii?Q?OgF2ID6EZuZPWwDiOogy8FOgkoa7naA1uk/Oje3uBYsBET7wvm7ZB3Q0HvsN?=
 =?us-ascii?Q?Zht/Z6HbCF2lc1wXRKljGNAVj+z+oyRWKeR1q2ZHHoeE6ltKQI7rB5Ug1uFi?=
 =?us-ascii?Q?hHvZ2g2x0LoPQBesznEy2J/iA5H3qi9/t3Impicg9dNwkVDPVsJwPc4t8Vxr?=
 =?us-ascii?Q?kKgZftfpGPJTDSXjnf/AHiV/lnqR7NmLBqw/iayYGb+Qv+qcM8cHtqKvE2RQ?=
 =?us-ascii?Q?0z7eZo8NnDB41CfaLBu1kMHylFTI45gmAIH80Ic5bYLODRtFgmhGbZ76RFv0?=
 =?us-ascii?Q?YGzMn5QvwiAwleu5Ld9ihSAfRTGcV+QL2/stgkJmUqo2MExOO3LglGuMi+7c?=
 =?us-ascii?Q?yUSr5897OoJ/ARq8kJt/XrOVjlrm2iV+VT2TZeoJOzFHTnwbqThV3ubBBosc?=
 =?us-ascii?Q?05DJiyGhltZrFJd507yXJ4w3ZwhCLOBRM9Hk4JNiEMHxED56vgEgkbihuLll?=
 =?us-ascii?Q?Q4CicGhulV+cqmW2PUWAKlMUMHYfbGxQW38NlmDgQDZusoyEc0tL8BFzBGOk?=
 =?us-ascii?Q?Fz+eluGFdx32VVHTbXNFrwSsSQCoJRqEvzve8njNKJQA/3Ar3EQSrJQgARKF?=
 =?us-ascii?Q?JPGupBW63ypLjEiQZ2SvjqjH6NGrQoLREpnMj4GEA7fvbE7vvk0tbFETFbvx?=
 =?us-ascii?Q?8UnTMvcyHdOiEkT8icMz4LZR3sHUlEthK3d6EC5uzU+LuScI76XxGCTUNzsM?=
 =?us-ascii?Q?GevsYGzDKtuRiWPlSkEiw+A9J970mhAdKmk6a3xCavMG2wZ5OE/OVq3FVv+7?=
 =?us-ascii?Q?0xEhlduBgZdgdoiYQmKYgk2gtrmiV5pmcLzR9k7PdwHDgSr5ZYKZIx8MkX2J?=
 =?us-ascii?Q?nfT6BsYer650b9ywoMKDAJ5kvkwcnMmvunVwDpHDEf9Pn5E7+t5UCrfoX3Bs?=
 =?us-ascii?Q?ckmNUHTRphOufuuE/Q8Xn7xvMEqs27q5eDNUDTthvHOv3eZ7x/iHTPry549P?=
 =?us-ascii?Q?8zGUsy4U8w5KnQPTuMRjQ70xXzBECeMrvAFwRepuITTJACF1FTe9TMZcnDz7?=
 =?us-ascii?Q?at7WJr3p2VC81Aq7+7WhedXXSfTIfeV1F8xlkYJKZPU5Usgz2atz7uG2qVxR?=
 =?us-ascii?Q?obzgdlEhyCaEqd73eG9IW71c5FtKPOP/qL3x69iOM/k7gtc28EI/+aZyrymS?=
 =?us-ascii?Q?pbr6F/rVBwKtqvFQlW/XXjxCxDC8jTaXR7OSZYHQZO9H/RGVQvkaqgRZqhCK?=
 =?us-ascii?Q?zDypRJ1kCo+xvxCgHqPykYHhBSRkwVCKEjtOZz8bNcCmTtLtATWl1nd/YZZ0?=
 =?us-ascii?Q?nOiuEC76Ouyob8LDDgh7cpN6eG8Z7EMXtVTIKZNBpDIUWcVirbYB63l7VV+3?=
 =?us-ascii?Q?3/BgzFV9IXSFUacSFvdeXZXBjavqUoAukmHnkm+wbjAH0q1IqJ8XXnUgC5Ux?=
 =?us-ascii?Q?Fh0FZdVq2BFUT7hleb88I4yBQn/r7s69PBUtdAVD5werqpszZ2r5MLTromV7?=
 =?us-ascii?Q?+AbdHT0GRCqAoGHTOJxkLB1NXh9P2vQRgSE0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:57.4665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b0f128-3582-4ff5-ac98-08dda46a02b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9119

Part of an unpicking process to extract bootfdt contents independent of bootinfo
to a separate file for x86 to take.

Move functions required for early FDT parsing from device_tree.h and arm's
setup.h onto bootfdt.h

Declaration motion only. Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v2:
  * Remove the u32 identifiers in the device_tree_get_u32() implementation
  * Fix an existing const-stripping case.
---
 xen/arch/arm/include/asm/setup.h |  6 ----
 xen/common/device-tree/bootfdt.c |  8 ++---
 xen/include/xen/bootfdt.h        | 62 ++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h    | 34 +-----------------
 4 files changed, 67 insertions(+), 43 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 6cf272c160..2b58549c1a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -53,12 +53,6 @@ void setup_mm(void);
 extern uint32_t hyp_traps_vector[];
 void init_traps(void);
 
-void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
-                         uint32_t size_cells, paddr_t *start, paddr_t *size);
-
-u32 device_tree_get_u32(const void *fdt, int node,
-                        const char *prop_name, u32 dflt);
-
 int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
                   struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
 
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 9daea06e57..ab449db8d6 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -202,16 +202,16 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     return 0;
 }
 
-u32 __init device_tree_get_u32(const void *fdt, int node,
-                               const char *prop_name, u32 dflt)
+uint32_t __init device_tree_get_u32(const void *fdt, int node,
+                                    const char *prop_name, uint32_t dflt)
 {
     const struct fdt_property *prop;
 
     prop = fdt_get_property(fdt, node, prop_name, NULL);
-    if ( !prop || prop->len < sizeof(u32) )
+    if ( !prop || prop->len < sizeof(uint32_t) )
         return dflt;
 
-    return fdt32_to_cpu(*(uint32_t*)prop->data);
+    return fdt32_to_cpu(*(const uint32_t*)prop->data);
 }
 
 /**
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 19d2ff0f0c..1b89986e10 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -2,6 +2,7 @@
 #ifndef XEN_BOOTFDT_H
 #define XEN_BOOTFDT_H
 
+#include <xen/byteorder.h>
 #include <xen/types.h>
 #include <xen/kernel.h>
 #include <xen/macros.h>
@@ -16,8 +17,53 @@
 #define NR_MEM_BANKS 256
 #define NR_SHMEM_BANKS 32
 
+/* Default #address and #size cells */
+#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
+#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
+
 #define MAX_MODULES 32 /* Current maximum useful modules */
 
+#define DEVICE_TREE_MAX_DEPTH 16
+
+/* Helper to read a big number; size is in cells (not bytes) */
+static inline u64 dt_read_number(const __be32 *cell, int size)
+{
+    u64 r = 0;
+
+    while ( size-- )
+        r = (r << 32) | be32_to_cpu(*(cell++));
+    return r;
+}
+
+static inline u64 dt_next_cell(int s, const __be32 **cellp)
+{
+    const __be32 *p = *cellp;
+
+    *cellp = p + s;
+    return dt_read_number(p, s);
+}
+
+typedef int (*device_tree_node_func)(const void *fdt,
+                                     int node, const char *name, int depth,
+                                     u32 address_cells, u32 size_cells,
+                                     void *data);
+
+/**
+ * device_tree_for_each_node - iterate over all device tree sub-nodes
+ * @fdt: flat device tree.
+ * @node: parent node to start the search from
+ * @func: function to call for each sub-node.
+ * @data: data to pass to @func.
+ *
+ * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
+ *
+ * Returns 0 if all nodes were iterated over successfully.  If @func
+ * returns a value different from 0, that value is returned immediately.
+ */
+int device_tree_for_each_node(const void *fdt, int node,
+                              device_tree_node_func func,
+                              void *data);
+
 typedef enum {
     BOOTMOD_XEN,
     BOOTMOD_FDT,
@@ -261,4 +307,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
     return banks;
 }
 
+/*
+ * Interpret the property `prop_name` of `node` as a u32.
+ *
+ * Returns the property value on success; otherwise returns `dflt`.
+ */
+uint32_t device_tree_get_u32(const void *fdt, int node,
+                             const char *prop_name, uint32_t dflt);
+
+/*
+ * Interpret the property `prop_name` of `node` as a "reg".
+ *
+ * Returns outputs in `start` and `size`.
+ */
+void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                         uint32_t size_cells, paddr_t *start, paddr_t *size);
+
 #endif /* XEN_BOOTFDT_H */
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 6dc1fb5159..0a22b1ba1d 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -10,6 +10,7 @@
 #ifndef __XEN_DEVICE_TREE_H__
 #define __XEN_DEVICE_TREE_H__
 
+#include <xen/bootfdt.h>
 #include <xen/byteorder.h>
 
 #include <asm/device.h>
@@ -22,8 +23,6 @@
 #include <xen/list.h>
 #include <xen/rwlock.h>
 
-#define DEVICE_TREE_MAX_DEPTH 16
-
 /*
  * Struct used for matching a device
  */
@@ -164,17 +163,8 @@ struct dt_raw_irq {
     u32 specifier[DT_MAX_IRQ_SPEC];
 };
 
-typedef int (*device_tree_node_func)(const void *fdt,
-                                     int node, const char *name, int depth,
-                                     u32 address_cells, u32 size_cells,
-                                     void *data);
-
 extern const void *device_tree_flattened;
 
-int device_tree_for_each_node(const void *fdt, int node,
-                              device_tree_node_func func,
-                              void *data);
-
 /**
  * dt_unflatten_host_device_tree - Unflatten the host device tree
  *
@@ -245,10 +235,6 @@ void intc_dt_preinit(void);
 #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
 #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
 
-/* Default #address and #size cells */
-#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
-#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
-
 #define dt_for_each_property_node(dn, pp)                   \
     for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
 
@@ -258,16 +244,6 @@ void intc_dt_preinit(void);
 #define dt_for_each_child_node(dt, dn)                      \
     for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
 
-/* Helper to read a big number; size is in cells (not bytes) */
-static inline u64 dt_read_number(const __be32 *cell, int size)
-{
-    u64 r = 0;
-
-    while ( size-- )
-        r = (r << 32) | be32_to_cpu(*(cell++));
-    return r;
-}
-
 /* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
 static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
 {
@@ -307,14 +283,6 @@ static inline int dt_size_to_cells(int bytes)
     return (bytes / sizeof(u32));
 }
 
-static inline u64 dt_next_cell(int s, const __be32 **cellp)
-{
-    const __be32 *p = *cellp;
-
-    *cellp = p + s;
-    return dt_read_number(p, s);
-}
-
 static inline const char *dt_node_full_name(const struct dt_device_node *np)
 {
     return (np && np->full_name) ? np->full_name : "<no-node>";
-- 
2.43.0


