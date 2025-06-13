Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7796AD90F8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014463.1392619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ69L-00030G-GJ; Fri, 13 Jun 2025 15:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014463.1392619; Fri, 13 Jun 2025 15:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ69L-0002xo-CK; Fri, 13 Jun 2025 15:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1014463;
 Fri, 13 Jun 2025 15:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ69J-0001Mm-TA
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:16:57 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 707f9579-4869-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:16:55 +0200 (CEST)
Received: from DM6PR02CA0125.namprd02.prod.outlook.com (2603:10b6:5:1b4::27)
 by PH7PR12MB6443.namprd12.prod.outlook.com (2603:10b6:510:1f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Fri, 13 Jun
 2025 15:16:50 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::af) by DM6PR02CA0125.outlook.office365.com
 (2603:10b6:5:1b4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 15:16:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:49 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:47 -0500
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
X-Inumbo-ID: 707f9579-4869-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNt6MSrHIWkXeI8ynO5YJc3tI5GLJcJgNE1F2+VSHeOB4Fg3jxkSOkCE9BgKeQDaX5yxNxSl9xyGU+d8SajE2kyZOgBi1UBH6sLnnL4nMFjnnDoBsu08pmfx9z+4I9hKvkyrxf0zyztM7paQ96aQpE4yXpz2LK7+MIQR/yWzgIpjCvcZ5RtLagInil4JHCp3Cued4HcnMYywhh+7O16Twbs48ehkPtg4mP5a4vx5UoHIrpdLueEucYVYanmyiyvnz9eyyUE4Wyb7TH17MD5vxV0oHv5+LhdYell6WHvsoBr/B0LXdeVc4naTIEwAw3QxUH7ew7uLkx7tw3ghDWXFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nv7HefR3nJ9xc+neaNOBWQ3D4cmv4f7mosLJypHGoOA=;
 b=ViuRhRSLgAdpTxmw2b8qA4aI5fEwZRARUrN1ncSAdrlknFzall8ycSgv8FhVqf2ab/9RXxPYRUJzsu1huS3divj6XZwZYQXVRF65jI4MZ3yvOyRG9H96fvvOnmK078oq0iDSd7o6DdmO7wv+1fjaW3BYBnOp0lfoJVydXMD6M/0fxP9YRWJr5FDhQpZHWPwhv8OsIfTpBcXyoGtwIUsHNEofJp8T/taOR0LQPRiQID4MJcqyPNm5N6+28tMy3tNNmIlCYCTVc44qAr+2hEHyhctHlZswF4uQGAq8ZQB81q1HN9q7hYBBwDZ4sialnSq2smkmkE+JiYKNCoi04gBm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv7HefR3nJ9xc+neaNOBWQ3D4cmv4f7mosLJypHGoOA=;
 b=LCv2rmTDEyr5kz/j2eo726CgbR9Wv+IGvbCu60odiiynl+GXvQht0x9pBOOz8Fvo6PJyJ0oek62PuW43I1FzKDvFbCP0y/cG3Y6ZXVEYBHQe3Yma2om+LBMGsgfAHuoIftWMrqZh/SPqoVHoNtUskmZEzOihMcB0SRAlvUp1Qgo=
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
Subject: [PATCH v3 08/14] xen/dt: Move bootfdt functions to xen/bootfdt.h
Date: Fri, 13 Jun 2025 17:13:17 +0200
Message-ID: <20250613151612.754222-9-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|PH7PR12MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f08ef3f-b1a2-4ef4-ff27-08ddaa8d519a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WKBKXzLaknyAR79cyhsHyMTVhMKAWibAZnIJ8IXDsNlpto2EhBQSxr0O1xkR?=
 =?us-ascii?Q?1vn/Zv+OhvoEToKg4Y6F10JNmOyyTW74uwnTBdrKWR7A0jLUBCaqi/iGc6fv?=
 =?us-ascii?Q?Ye2PKeJcgm7LBg8WVQcpWbj47GNCbIQ0PsIpAnn+EppIlcYfJGd+z8JL9fVY?=
 =?us-ascii?Q?etL8Jtoas1yYkQCqJuqcp6h4pFzJ6IUcDoTsYoy56H/hkOQL2a3e3opSDVMB?=
 =?us-ascii?Q?4PpZIpisByo+zfcSjul6S2edhnJWSFRn3NwUd1RZU4LBaDOQIMQpQqVXpZ+R?=
 =?us-ascii?Q?qxwHZphN9QR5iPfSOOEo/sFIpSmDcC64fD/eEnIX2YaV098o7QEshROSsogk?=
 =?us-ascii?Q?0Cn7SCySguLrIusYksJThzpfr2exCljbOxR8OqxQEGqMQPJOSHcYFJO4dmnq?=
 =?us-ascii?Q?I3TQcYkQIMSGtKtbofJpBYX4J+E4Q1XTwyx/gy2tCtNZHxLLdrLfl3nd1+WB?=
 =?us-ascii?Q?JS1QNwmL63rUcq3qXM8KOaTry02MJJK2W7YKu5RhaPzI31v8D9dh19krMoxd?=
 =?us-ascii?Q?jEpNZw2YcQ3CHqpvRUew5OK2E/OTXm3YIytHdicsgRASif2hXgoilmpPDdEi?=
 =?us-ascii?Q?WufBMYXnvA1ey2oSAfRDR1T24HD4Uq3P2x0jl1AvM5wdrQcF2Znn71I+oh/8?=
 =?us-ascii?Q?MoPJouDhYvYGHlBva6LGVrqAXWavPJXoezuDTb7XzF3Bh79f0agPmCajq3Q9?=
 =?us-ascii?Q?QAsX8OrVULhmYGJaKFMCB6wXHk7pIl8vCwZkR8dn7/1uK2q+N9eZCxSxy2rK?=
 =?us-ascii?Q?3/nLEReQ042gRYL+kA8axCGIPOhqomFZ1rqyevMwaX22AGn1B/2RRowb0hJQ?=
 =?us-ascii?Q?mrOADpqa7RXINeQqg2y1LHLzB4NqK8tpik/h79F9+h9pWAUTFlA6KgTP+Knr?=
 =?us-ascii?Q?eauTkKV9Ie91oPRqiCyaGavDbdOR8CQaArQuU/Q8CLKseTLvse+3QIkEyMp0?=
 =?us-ascii?Q?/tjOoySCZHC6E1rF3vmwgOlCTAnUxBlrvsdz3eRbOfJUpJJHRRj0vwma+aTF?=
 =?us-ascii?Q?LOVhaV4YKT1gEFtnfl5qNTfWXoC4v7jQV+21Eu/gtyKEsXfbJVyrgs4LFr1k?=
 =?us-ascii?Q?P5pGmKuKPbkb24j8iw+USfS7U5A85/8askFGWbEuDr8qaPA/pMwHzaWc8+1y?=
 =?us-ascii?Q?Kri3tcJ6Czo+1i1FiUTTGzjZ/hKjAqnAdyWoUDSB/zXalt5VHAFnb2zA61QW?=
 =?us-ascii?Q?rCseWp2PkN2d9apVCqK3zvT3I3XKjijs+UBX0AqPm0tspjcXZ2ZAolOmrMfm?=
 =?us-ascii?Q?06D1RM0ZhiS7UdRST9qG8eFuUfmpXAW1Dqk6NPV6HS3+fCqXSRNBEF6kZTcL?=
 =?us-ascii?Q?v9J0bt7uESUc1khFOrgdAlVrhNiBSVQ2pSmPEIAg+RSdkqYUZSAVhe9EVZ65?=
 =?us-ascii?Q?faq9WZ4hIp36oD6H5K79X4kTgj2rkP9xxoMp75crUZkd2d0rDmVDXaSt79O+?=
 =?us-ascii?Q?T2tvEedzWTNLoBMi3eRzmVgNMqXYI+LdtRvMUftsnx4HeKpVMgJV1qbVza8w?=
 =?us-ascii?Q?dTIrfaZFMvNI/asxLyWw5qK6uGIVg9hM86rR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:49.1892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f08ef3f-b1a2-4ef4-ff27-08ddaa8d519a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6443

Part of an unpicking process to extract bootfdt contents independent of bootinfo
to a separate file for x86 to take.

Move functions required for early FDT parsing from device_tree.h and arm's
setup.h onto bootfdt.h

Declaration motion only. Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v3:
  * Avoid mutations during code motion
---
 xen/include/xen/bootfdt.h     | 62 +++++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h | 40 +---------------------
 2 files changed, 63 insertions(+), 39 deletions(-)

diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 8ea52290b7..b6ae7d6aa6 100644
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
@@ -260,4 +306,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
     return banks;
 }
 
+/*
+ * Interpret the property `prop_name` of `node` as a u32.
+ *
+ * Returns the property value on success; otherwise returns `dflt`.
+ */
+u32 device_tree_get_u32(const void *fdt, int node,
+                        const char *prop_name, u32 dflt);
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
index 75017e4266..0a22b1ba1d 100644
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
@@ -949,12 +917,6 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
 
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
-void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
-                         uint32_t size_cells, paddr_t *start, paddr_t *size);
-
-u32 device_tree_get_u32(const void *fdt, int node,
-                        const char *prop_name, u32 dflt);
-
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
-- 
2.43.0


