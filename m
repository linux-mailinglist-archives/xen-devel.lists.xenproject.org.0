Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFADAC8D61
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000828.1381059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyaO-0008TW-Ki; Fri, 30 May 2025 12:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000828.1381059; Fri, 30 May 2025 12:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyaO-0008RA-Go; Fri, 30 May 2025 12:11:44 +0000
Received: by outflank-mailman (input) for mailman id 1000828;
 Fri, 30 May 2025 12:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySX-00076q-1D
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:37 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ba186f5-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:34 +0200 (CEST)
Received: from CH2PR15CA0014.namprd15.prod.outlook.com (2603:10b6:610:51::24)
 by SJ1PR12MB6218.namprd12.prod.outlook.com (2603:10b6:a03:457::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 30 May
 2025 12:03:30 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::41) by CH2PR15CA0014.outlook.office365.com
 (2603:10b6:610:51::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.26 via Frontend Transport; Fri,
 30 May 2025 12:03:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:30 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:28 -0500
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
X-Inumbo-ID: 1ba186f5-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ax0ij0GS99gpbdJ7fP/qchacW2KBlX59oAms24xUH7g8qEssaOPpDyqPcepgfL/WecUu3ef4NIDiTO+V24lE4l7mic4+fNFgzj7Zp3wFSAX8nTfeD7hkgDV8QQlh/lPGtQHGUbYYPAhz1+g6S9s66IWb8eFw59eMOdFr2DuQfwz0Echvu/BPPdHCjhjAWxMgQHjvtZ+1JrysXFLNNiZngaRULlA688VTtPCwtqmOLnLMi1lj/LNNxd1L/O/wQL5Hef65qNnYryCsNZjicPk/ZagTMCU5t264PESX1fcAjqSGjh9eAr4Rg8JDEWI14ps9i9XvG2NpS9j8fmhSbCyNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34ICjvzD4lVMM+wfqkK97CeOJs6tTTN5/D+GOWUdGNA=;
 b=LuJV9+PW4UtMj6+NYATCeFq4Eo8MV1OARLUp1m2er3Fyi7BUZ+AwUQxr620s7F76CYjNTRfQ3axJulZVil2SQ1K1ovyAM+nUFRVAzr4BQ++miHtLH6c3rNKuQ/vYx5TBXLRC9xKSt7+CB8t8o55XXZ+jVl0+7f4hOV/9ypF34dsdz0aK6yqgZhynjoQEKirVdzYKifrysdhDDq9KBz2dPAc/pMQpO4a6flG5ZercZH47FDsjKjCAKdKznXGxiJaN+7asTQnrVwCbzzxyVDx4UYRIU9fdo5EcYDdGB4S6pp/X5yFMzW94+8FqT1jWe+1yrWEVFuKEOeplQLNqDUfF6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34ICjvzD4lVMM+wfqkK97CeOJs6tTTN5/D+GOWUdGNA=;
 b=TdaZqVmlpOFJTfDpR9WzjFHI9LcWIQdjZ0m3jaldiEWQ36MoM0Lt0N+B7od0kjTwfnoWjuCdHJZgY0ZUc63cJC8TMaADPlB0meN+r/MJwUMzfwv5CRvkaS1sgfUqv6mtFFemwm3ho8R5hIwOH0TIyDqfH6eVSrSTA77nkin/g3Q=
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
Subject: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
Date: Fri, 30 May 2025 14:02:20 +0200
Message-ID: <20250530120242.39398-13-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|SJ1PR12MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c267a6-8ad8-42c8-24ff-08dd9f71fe6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KDW3QzWmpY5+XqfEVARsoPf11ub6wA4h8fgxT4Fi52m8y1TJpy+YcTE1q4RY?=
 =?us-ascii?Q?lMSwlzxbmF1/kXOyEg7vb1cLKIXiLFS8UBPSn3z46g+V/UBzDpJiuRtI+in+?=
 =?us-ascii?Q?sH8qSnwKIcvo4280RLEvhWoR/F0cRw2yXFEjRqg1zpcQBQA1nW2c2MM4QmLx?=
 =?us-ascii?Q?9eoGU4T2QBHGtVl0jLm8Jsy3ApF5pMGyaLyfOEhjXW3nW5bvubJagaFURUF1?=
 =?us-ascii?Q?ztICOE50xR8yRy4IVZiCNMl0V4viMkW/8Sx3eZBvDi6TMZQtzsqrMODL93KT?=
 =?us-ascii?Q?WwSf5AzSErSa7FASd7GU8mi5hvrIyIA0n6o3vqELnw1zQ/ra7I52j4YlYQl9?=
 =?us-ascii?Q?0FMIhS7Ae4THq/hxMPvmaZuFlI7mKnV9k+UXcwrHIFIDjLliMs/ZTVcZ3owu?=
 =?us-ascii?Q?tbYvkJB7NrTeyg4sHM0kM/vgHlxkzVkcxXad7wSyBk3BVSuWJ/lZNuKvX5ph?=
 =?us-ascii?Q?6BpNlwCsksmGppbpPZywemAIQg7kwnfmZ1sNr99jC9tc5+0BeaazkiO2mMZp?=
 =?us-ascii?Q?LppN4PDArFTBL1SDpj1CT4k3sftwHI0N7/g81Ufcj4Qx+kJL7sNY8a6ijLDT?=
 =?us-ascii?Q?Qf25X4u5zrtC/PsZtn+/c81U4ri0wmbl+RKqrM4IbrfjkUznYL3Lg1Mcmnc0?=
 =?us-ascii?Q?6lK4Y41ZMlu5Nx9y2Otm6o+5NhZyWK1SRVcF5+ITY1fs8uw3Nv0eMp4WxC59?=
 =?us-ascii?Q?CKd9Ax0mYqJr630GwsqHEuE7jp5yuxDt2W82/u8tj5JrXX7cDaGLzGqTPrc2?=
 =?us-ascii?Q?Wratskc2bz6/n5Q/pRC82XQXFdTmd0DcXUImYrzn0qx/41VTbsVMwCO0mHiz?=
 =?us-ascii?Q?rlJu8LZYF+kmB/boLr+YRQS/2DkXWzbLN9IAAdgdOl4ZNfEKHYsRzHNaqwlR?=
 =?us-ascii?Q?DUg1AT0hqeJQym3+FCnkHczy7uUVWE24v2453oX9o5yUcnFeumw6AFs/+u3D?=
 =?us-ascii?Q?BqGFYM2RKm+BdXgC6XNhMS+jHAnfquk6h+OIBJ6YmcNDMy4Xa8hJWSV7MyiV?=
 =?us-ascii?Q?Sq9999Fw1ri8dt3otZwosdDY/yCzhDfQbqknbRQwLaxUVBRwwfYL/QSDYncx?=
 =?us-ascii?Q?/YZgC6g8nPeMG/mB1rYL08hnSX6ihaZ5Bc4ZRd/CO/xto5wylfrRKBPs+A16?=
 =?us-ascii?Q?kd+NYEPALDl6lFEoqy+oFNRatA7zjfZGocllCl/QwyRKiq7wx6lSPUV7FS1J?=
 =?us-ascii?Q?Ua+w5cW/8AMSWAijqJxMU1NWhhUhubxJD+CQdm2WpJ5xoxAFZc7HCRqBPFEd?=
 =?us-ascii?Q?CsaWCtmVgDfRZMcjrNP1MEjzz6kpAyOgneoghedwyKP1PwyqUkINand/0bm3?=
 =?us-ascii?Q?Q9V5+S4Yee7oSpZ5QdbWrazOix0YtXlTXOFKyt5ak2JRgXhy6Ts/qoHii8NA?=
 =?us-ascii?Q?Vc/+2+ZWRsqEHaJ34RVggsvj1uuudawLzWrunSzZ+TApxSoYYXziSselXwlK?=
 =?us-ascii?Q?f5A4y/lf+2T+9/9EnK7QkS8vUTSpW6twCN0b4r0tAFhwz+jUnfoF9j5Z6Hap?=
 =?us-ascii?Q?WqyUgwD7rqsvy050lb6sW0aEbxG1KkO5f0vW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:30.4748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c267a6-8ad8-42c8-24ff-08dd9f71fe6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6218

Part of an unpicking process to extract bootfdt contents independent of bootinfo
to a separate file for x86 to take.

Move functions required for early FDT parsing from device_tree.h and arm's
setup.h onto bootfdt.h

Declaration motion only. Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/arm/include/asm/setup.h |  6 ----
 xen/include/xen/bootfdt.h        | 62 ++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h    | 34 +-----------------
 3 files changed, 63 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 0f9e531a34..32308837a9 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -55,12 +55,6 @@ void setup_mm(void);
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
 
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index fa65e8fcf4..079259c719 100644
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
@@ -246,4 +292,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
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


