Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D9AC8D62
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000843.1381069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyaf-0000lA-W2; Fri, 30 May 2025 12:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000843.1381069; Fri, 30 May 2025 12:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyaf-0000h6-Rg; Fri, 30 May 2025 12:12:01 +0000
Received: by outflank-mailman (input) for mailman id 1000843;
 Fri, 30 May 2025 12:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySc-00076q-21
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2416::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f0d2541-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:40 +0200 (CEST)
Received: from CH0PR04CA0104.namprd04.prod.outlook.com (2603:10b6:610:75::19)
 by CH1PR12MB9599.namprd12.prod.outlook.com (2603:10b6:610:2ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 12:03:36 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::f4) by CH0PR04CA0104.outlook.office365.com
 (2603:10b6:610:75::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 30 May 2025 12:03:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:36 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:34 -0500
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
X-Inumbo-ID: 1f0d2541-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiWgRF++OSBMhis7czWdgjd2sNKcxVmoYLNx0l32yPhjGV5+y/9i9wo9JZdDFmQFzN/hsh6ldnI0UD5Xxubrb6hmvg8HsXG5C1NDiuP1amYe7G97jr0GDRD1VgN8tv0jlsKUQkAH08NqJvEp+70M5SFw9pGEv8cfdPALdxp8SniTksunDTvB4M1paHEPyUQSwtrUcwN53u1kgzZHB6tMwwC4RBR/TXXIDg1IAcWt0mjYMnNBV0+1vZr127yPYKz8lGM6MGkaGEFOEfUs7p0o3xFwjt15Y9q9sNnS1zdFX3CKo/euQ3D1WAmU+gS5gCdeW8opMjs2fGw84T4teYktGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QScSHMvynX6vj1N+8sVjrtazka+q1SLtfC56Og9Zthg=;
 b=RuL7uUi1mqqtOe+v30RgOf/l8SoQdZ8Hur5GaRCHv46H6WgwATatFEWdT+5KxDN3BlNWl9A2Peg9D1WfISwjBAzncjERC2YoNfHn/bRSUzDPmmaRZ5Lnnnwsrbeygd9gMhN1l/do6rGmZO4M23BdzsnzRRuxRgFJpv/ckjTiqofzSfDu826uYmam+NOvTIwbnQY93+RvvGd1F/+5OAkKoX7iBA3hK+QVdCY67ky9OPI2vnDfi+Vi5zSoVS5UoIqte6w5Lqrkt2G/tXDw4wlN/TmqNxJ7Y/0ubBzvXnc/v5xCWikQ151BFu5cUN9j7GGQo55eq9wIu/WjQsNCUIclWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QScSHMvynX6vj1N+8sVjrtazka+q1SLtfC56Og9Zthg=;
 b=Lq3oEv9rbQN9s1HeQfPi2U4Fbgxf4GobU+Zv/El9i944nrXN+cb/nKLmBmyeT+wGFutxII8vzQJMPx2HCkjFF6A5bWV4ueWWPfVq6csBIZE6AYBQavtxygqgLUJZtC2Kbqf9Ab5+LZ83llIm8swaY+LQV3Kk3ekyhQL6MCJUnBY=
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
Subject: [PATCH 15/19] xen/dt: Move bootinfo-independent helpers out of bootinfo-fdt.c
Date: Fri, 30 May 2025 14:02:23 +0200
Message-ID: <20250530120242.39398-16-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CH1PR12MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: 489cc566-eb82-4b8b-223f-08dd9f7201fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WNxrTHOoblmj5TT4DE25dJO4q5DxYrM4mdDjCElQxop9yrfhxXF3EmBGvlfH?=
 =?us-ascii?Q?OvQtNZHZxW6U92y3UCVHv/zT3J2QXp62CFcMIcxG2bVeFV6prRBesClJz3do?=
 =?us-ascii?Q?u4duwG6wSTe7q2lSDYtqykp0Yfk8Ud/oabToOvx05xFH7B9F+qJikMQvS8Y4?=
 =?us-ascii?Q?qA137K/+1Pa5yRQYuJa8ga7eegdNrNtWH+7fzlyxUVRSn7y9s68mX5PTO0/H?=
 =?us-ascii?Q?AidlggPPxr+yzvNTOHfREncvxvDinTIK+QCPTgwbAuqN3XTPLvZIU3xAvXmx?=
 =?us-ascii?Q?cf4s8dKL+/e/285MJP8GtTu7pW4DVc6nmjBil41x9vya3GbpEyzt1exQRoJ1?=
 =?us-ascii?Q?847B4E+Jzo7Zps9BNwbR1v+zaTU834x1SnyiCEiXV+EktPHn6vSBVwdrl8Bp?=
 =?us-ascii?Q?oe4yLGJ5GMSx8IwpyLb1I1Jcilw1EEpsUqASZ1ea5QjlMVCZDhHujLM5ZGS5?=
 =?us-ascii?Q?qbFVOjJ5FNeOIamOoRSmYIVCXza3dKwXYm5MWLAJSHvS/ufjRbSGae/jjv2D?=
 =?us-ascii?Q?65h7kD5WoyVSa+Cik8AcIROd67D/mF90nvB1N0EfDiQS95L9iw2OA3pv0rJd?=
 =?us-ascii?Q?teE0gk/K8XSemdvrraU6Bi45asI9fXyKZNdYqsZ18G2Yqf7F52wFbT5zg5C/?=
 =?us-ascii?Q?p/jBnz6E3iFVrwAt9mxrB+CuThX/YRlDsWgSFSsoSLnabXXbrAC2DvkdTJqh?=
 =?us-ascii?Q?lj5X2W25Ya6lQOXldLTgV9a0sErShsjpn+hNVRNVtxdRH2fYoZFdr7Zh1+E7?=
 =?us-ascii?Q?COhmrSZgz6QOp3TGsMu0l/tCMSZ+YzOw+gKYTeJ5TuricSGUfrYv0XiRZFI1?=
 =?us-ascii?Q?xdMNHW4tjpwMdnA+ELqsLS7KVEWj40rBk1GCI3knRiCbGhTmdWI2VRwS5y5n?=
 =?us-ascii?Q?5cpfWQKYICQpDWD6sNRkc1CXCN2ZsG3difK6/Uo2Dw1fV/y5asLTw10K3ORM?=
 =?us-ascii?Q?jk4Nx7yXAZO5FzKhspnMaV+wlTvCvn6GwWAE0j32VhDnR9+w8WFGA++WkA/7?=
 =?us-ascii?Q?z0gNHtcuXnOtEg9SESfti/KxYJ+F3ZsEYRvNH5PwOFtVJZeJXgB6/N80ss1y?=
 =?us-ascii?Q?pQKfSqfyRnGqoBvisBfqmSNQ2w8K7MhZHH7zyvXBPvgQm9aEz2HKijflXBby?=
 =?us-ascii?Q?OHiFlsGLQDRFHAOv+tmK7j/eUsPouishNsx4DfDbY0ZTSPiF7iTeobMqjwkv?=
 =?us-ascii?Q?dRU3MyEM3nZfADgeduJnaOrh67JpT3oiGpqeiEOQcrucVNOs7MSHdX4SHx/c?=
 =?us-ascii?Q?OqoG2jf1JIeFkOfpAGo4CyF+v7LYs9P0T5lTT0eAYDpI2I2wAGihafC3LZGo?=
 =?us-ascii?Q?VOtkNKJOhv8G7/aZVzz6xikYyGIU+J2mlv8wnxXsn2all1SAJTjPOnTsEqoQ?=
 =?us-ascii?Q?IJanIp3cXiwAf7TAVEh5fYSL65NPc+bynkA2hdznjpPSXId6fhZij+0p4xeV?=
 =?us-ascii?Q?56TffGs48Hlkl+6E19V+GJlZ7Ujbz1T4hwPBC2lGu1he3fG9kxfAH7Ve4exz?=
 =?us-ascii?Q?gogaRszHyAMsRxltxXssAYBKYy+K95G2l46/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:36.4320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489cc566-eb82-4b8b-223f-08dd9f7201fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9599

... back into bootfdt.c

These will be required by x86 later on to detect modules in the early scan of
the FDT. They are independent of bootinfo, so it's cleaner for them to exist in
a separate file.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/bootfdt.c      |  97 ++++++++++++++++++++++++
 xen/common/device-tree/bootinfo-fdt.c | 104 --------------------------
 3 files changed, 98 insertions(+), 104 deletions(-)
 create mode 100644 xen/common/device-tree/bootfdt.c

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index bb6d5ddec5..922c5bba9b 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,3 +1,4 @@
+obj-y += bootfdt.init.o
 obj-y += bootinfo-fdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
new file mode 100644
index 0000000000..5decf17faf
--- /dev/null
+++ b/xen/common/device-tree/bootfdt.c
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/bootfdt.h>
+#include <xen/bug.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+
+uint32_t __init device_tree_get_u32(const void *fdt, int node,
+                                    const char *prop_name, uint32_t dflt)
+{
+    const struct fdt_property *prop;
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop || prop->len < sizeof(u32) )
+        return dflt;
+
+    return fdt32_to_cpu(*(uint32_t*)prop->data);
+}
+
+int __init device_tree_for_each_node(const void *fdt, int node,
+                                     device_tree_node_func func,
+                                     void *data)
+{
+    /*
+     * We only care about relative depth increments, assume depth of
+     * node is 0 for simplicity.
+     */
+    int depth = 0;
+    const int first_node = node;
+    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
+    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
+    int ret;
+
+    do {
+        const char *name = fdt_get_name(fdt, node, NULL);
+        u32 as, ss;
+
+        if ( depth >= DEVICE_TREE_MAX_DEPTH )
+        {
+            printk("Warning: device tree node `%s' is nested too deep\n",
+                   name);
+            continue;
+        }
+
+        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
+        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+
+        address_cells[depth] = device_tree_get_u32(fdt, node,
+                                                   "#address-cells", as);
+        size_cells[depth] = device_tree_get_u32(fdt, node,
+                                                "#size-cells", ss);
+
+        /* skip the first node */
+        if ( node != first_node )
+        {
+            ret = func(fdt, node, name, depth, as, ss, data);
+            if ( ret != 0 )
+                return ret;
+        }
+
+        node = fdt_next_node(fdt, node, &depth);
+    } while ( node >= 0 && depth > 0 );
+
+    return 0;
+}
+
+void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                                uint32_t size_cells, paddr_t *start,
+                                paddr_t *size)
+{
+    uint64_t dt_start, dt_size;
+
+    /*
+     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
+     * Thus, there is an implicit cast from uint64_t to paddr_t.
+     */
+    dt_start = dt_next_cell(address_cells, cell);
+    dt_size = dt_next_cell(size_cells, cell);
+
+    if ( dt_start != (paddr_t)dt_start )
+    {
+        printk("Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    if ( dt_size != (paddr_t)dt_size )
+    {
+        printk("Physical size greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
+     */
+    *start = dt_start;
+    *size = dt_size;
+}
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index bb5f45771e..736f877616 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -112,39 +112,6 @@ static bool __init device_tree_is_memory_node(const void *fdt, int node,
     return true;
 }
 
-void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
-                                uint32_t size_cells, paddr_t *start,
-                                paddr_t *size)
-{
-    uint64_t dt_start, dt_size;
-
-    /*
-     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
-     * Thus, there is an implicit cast from uint64_t to paddr_t.
-     */
-    dt_start = dt_next_cell(address_cells, cell);
-    dt_size = dt_next_cell(size_cells, cell);
-
-    if ( dt_start != (paddr_t)dt_start )
-    {
-        printk("Physical address greater than max width supported\n");
-        WARN();
-    }
-
-    if ( dt_size != (paddr_t)dt_size )
-    {
-        printk("Physical size greater than max width supported\n");
-        WARN();
-    }
-
-    /*
-     * Xen will truncate the address/size if it is greater than the maximum
-     * supported width and it will give an appropriate warning.
-     */
-    *start = dt_start;
-    *size = dt_size;
-}
-
 static int __init device_tree_get_meminfo(const void *fdt, int node,
                                           const char *prop_name,
                                           u32 address_cells, u32 size_cells,
@@ -205,77 +172,6 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     return 0;
 }
 
-u32 __init device_tree_get_u32(const void *fdt, int node,
-                               const char *prop_name, u32 dflt)
-{
-    const struct fdt_property *prop;
-
-    prop = fdt_get_property(fdt, node, prop_name, NULL);
-    if ( !prop || prop->len < sizeof(u32) )
-        return dflt;
-
-    return fdt32_to_cpu(*(uint32_t*)prop->data);
-}
-
-/**
- * device_tree_for_each_node - iterate over all device tree sub-nodes
- * @fdt: flat device tree.
- * @node: parent node to start the search from
- * @func: function to call for each sub-node.
- * @data: data to pass to @func.
- *
- * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
- *
- * Returns 0 if all nodes were iterated over successfully.  If @func
- * returns a value different from 0, that value is returned immediately.
- */
-int __init device_tree_for_each_node(const void *fdt, int node,
-                                     device_tree_node_func func,
-                                     void *data)
-{
-    /*
-     * We only care about relative depth increments, assume depth of
-     * node is 0 for simplicity.
-     */
-    int depth = 0;
-    const int first_node = node;
-    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
-    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
-    int ret;
-
-    do {
-        const char *name = fdt_get_name(fdt, node, NULL);
-        u32 as, ss;
-
-        if ( depth >= DEVICE_TREE_MAX_DEPTH )
-        {
-            printk("Warning: device tree node `%s' is nested too deep\n",
-                   name);
-            continue;
-        }
-
-        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
-        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
-
-        address_cells[depth] = device_tree_get_u32(fdt, node,
-                                                   "#address-cells", as);
-        size_cells[depth] = device_tree_get_u32(fdt, node,
-                                                "#size-cells", ss);
-
-        /* skip the first node */
-        if ( node != first_node )
-        {
-            ret = func(fdt, node, name, depth, as, ss, data);
-            if ( ret != 0 )
-                return ret;
-        }
-
-        node = fdt_next_node(fdt, node, &depth);
-    } while ( node >= 0 && depth > 0 );
-
-    return 0;
-}
-
 static int __init process_memory_node(const void *fdt, int node,
                                       const char *name, int depth,
                                       u32 address_cells, u32 size_cells,
-- 
2.43.0


