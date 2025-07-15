Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B5EB06400
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044536.1414690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiG2-0008AJ-BN; Tue, 15 Jul 2025 16:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044536.1414690; Tue, 15 Jul 2025 16:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiG2-00087e-7I; Tue, 15 Jul 2025 16:11:54 +0000
Received: by outflank-mailman (input) for mailman id 1044536;
 Tue, 15 Jul 2025 16:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiG0-00067r-SD
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:11:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2413::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69ded3d0-6196-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 18:11:50 +0200 (CEST)
Received: from BYAPR02CA0024.namprd02.prod.outlook.com (2603:10b6:a02:ee::37)
 by DS0PR12MB9398.namprd12.prod.outlook.com (2603:10b6:8:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 16:11:47 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::66) by BYAPR02CA0024.outlook.office365.com
 (2603:10b6:a02:ee::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 16:11:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:45 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:43 -0500
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
X-Inumbo-ID: 69ded3d0-6196-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngUgPv7ZXmtM7wF1zs8sJ6XZtLx30kqQKTZdApdrzGoc//bOm4/aUfCw35fpSw4xfrorpxAg6OX6bFfYIbmriM/phusTJtZ3Ng7QiGlmrEp/9ONq3Anh79s7jpduQsr2hXG22Vz5wLahEsEzAfoGagbku/HqIun1lQbuVMhDoQ/pGJD91Tm7hWrQvx+xBf8rUnEJYpDXIUwcSjIBXuKDlwn+q3HKnzwlsvfzZ+nS7W7p7DFhU/l5azEjmrx0s3IkjU08aKKV4juPF8T9ktaT3W2baMWw4glD/HSXO08TkjYxMAtSK5RBmwe/vVr4TTzT8hVMjLQQJbWW558hd+3zlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRxILgw0uxuS/h3umxIdhY8WxYfPe8hCl5WODaKq6xc=;
 b=u+1L+NOvRhEsB6CvszWa/fykx2i5BVrHbn+eza85a5GrcJ0nIXJryoiNJDVpSoroIAMfSJiftbDSUX5I3UA4zbOl6j/YyW+f7o+ema/k6tZTLvq6duwvehvx+YcIwIwgSCc/RgqA40lMFpybEWRUVXvj6NjKLGm+d5xmx+ZMbaXbC1W7GlBzUtiyI2FTg9RmIoREYHlk1Lhf8GelAsgjlPxVcgVN1mIo58EjwCGmn4DcfjiqpwItTH+PhciKb1vRfzEZnfQbjhpOm+0/ZTl+I2q471EuDbTd5n0oN/zAw+zvlPsNSIteN36v0+jW64kFogbL3gIaMdn0zhPWFmWrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRxILgw0uxuS/h3umxIdhY8WxYfPe8hCl5WODaKq6xc=;
 b=Tn7Q1YWrmgJMTPshyPp8gGDyKoc7Zy6b0EA6P95vtAtbP0bmnnpkyXGDAalMne4qJRCh550TkTYcrODx2omtnZWq3tl8z67Oa/gpbUPBMaNZ9U2jGAIZIfXuw88rAwI57z/kGA/1xLsPmbWtm9QGwyq6DR7OyDgvC6xPo5kx8Ec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 07/11] xen/dt: Extract bootinfo-independent functions to bootfdt.c
Date: Tue, 15 Jul 2025 18:11:02 +0200
Message-ID: <20250715161108.141126-8-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|DS0PR12MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b787a8-6b2b-4cf1-5c0c-08ddc3ba4bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZdwA/ag17XCDqnDJSwl9xTnBChmTz56zzgNIfCoCCgQJEVijMCjRVId5rmqS?=
 =?us-ascii?Q?iAo3KLjDHWEJc0j60VYbq0VxLxOw9U0lES5Hw+4fqevQABglgRu/Db/EO0OD?=
 =?us-ascii?Q?5lmCKqdHkE3Rvqa2n0sNMKdEYkMi+ZsTpXXf7sBIDaPon2jFhNJptOCywflX?=
 =?us-ascii?Q?CVzccFLgjruYEp2CRVSbLg5g9sliVv+idU5WOz/4uGZO3pdan7GiFUDm4Kg9?=
 =?us-ascii?Q?UqzQTmaDhCn86udiM2QuF9SyhW6blbdrfqiy81K7kLb3b1JXH3jKjr12gVqb?=
 =?us-ascii?Q?tFvCGvUGNY5iPgPVhQ1vPEMVMnAXJTpqSOy5gGQt0V1K07G9ShbunPXBcpHA?=
 =?us-ascii?Q?WZlmhd1oXmBrAcI4jCk+nlq9y+VGQbOp5ohq4ZwnNPyBkFgomAbX3iZHaIJU?=
 =?us-ascii?Q?hMbSeGsObWDGPm9WjnhHAfyJAzIlYaHkIaE9mhguOLQ463kcUXrJ4HzIkl+f?=
 =?us-ascii?Q?8NIi1mkz7K0epwWpbltm1rDRJ11pp2e04j+PO0t41Ubf41Gl/AxREUho9kAY?=
 =?us-ascii?Q?hsn87v0TRuav9EN0YIPeq4zbWo7i5KDZT06+qDaR33VI15XRUvqIYj2SoSYy?=
 =?us-ascii?Q?6xgPVot6qMABKCsacf0h7aZln5GW2UalkIHnqwfn6zn072r3xCdMC5WuFecV?=
 =?us-ascii?Q?R/rH7/HjCPWWFHuNG4VttqtObTxZ2vSZsmL8mZgp6Pd/8yAfgV8YuP/2C+D7?=
 =?us-ascii?Q?WkIe5ngtKLoH/428x1uVXDl9yyl6/i7eYyhHXn3FmKUsNzGOSgNoEbjYEDA9?=
 =?us-ascii?Q?MpqgrpZxDwrEbMsrwLbIg2jP4MqGSrwH2j71sI6LEa8LsCo1hqDe6yFtB0X2?=
 =?us-ascii?Q?8ETtcrm7WBVx2q8mSYLbbiqsTzU7yCCdgHlPZTCJBelU6FEJyN7LVWWLr/Pr?=
 =?us-ascii?Q?rDLpBLvkNMBfN7EVobGuDEiLhI7XSoK7iG3G7k9VFW7aKOsM1wtNoHVgOeKW?=
 =?us-ascii?Q?ceYahr/FUCYuc8hnLEZJpQUoQDW5CfwTlfca2JYkw6nJ/ZKxSJuUfn3F5i0r?=
 =?us-ascii?Q?fLbxf/iQBabB+796OV167MEVOb7xkFIwngpNPPSeeQHGIKwlH+VOBdCRIDAM?=
 =?us-ascii?Q?bZeRGjFKjmWq1KsnYFnQ0KF48IXGB0dOEJ/1HJso4TSey3Quv3MdsV3ASSKw?=
 =?us-ascii?Q?jJ6v34p8ieH52LLLvummKcmWv0iKOASZE4XMPQ9wcOEIS9h6Ndjvxu+NLHvp?=
 =?us-ascii?Q?10jJecqHcrudmQtb5ZHU3naRGX5Ar8GRIdfYhCbpZBNnCsQja5o5x+DSE/gH?=
 =?us-ascii?Q?Ts8NdWm61tKmmoBwaKaS4AM8C9xgARZ/OP4PrF7vcmu1lcLI6eA7VR0P3FGA?=
 =?us-ascii?Q?9BNQIL3Toj0BT5h5Bd/63tKv6CPcxo7YGjAw9C9yvvggArEZ10BphavazOwA?=
 =?us-ascii?Q?p4SyP11y7b+S4PyujV5AG8CyKZ1KPRkfg6Pk2NfmMMcSp9+jwOkLrSP53EKc?=
 =?us-ascii?Q?qOyOQkNNOp7pdDxD/a3tGhjihO930DAdQyv06ZE1CgRfdmv++FwXOLV/Xlj3?=
 =?us-ascii?Q?aHqHxYD1Kh6s9VxMZ6PGkyDvK/xayqrqudZl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:45.5989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b787a8-6b2b-4cf1-5c0c-08ddc3ba4bac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9398

Move all functions independent of "struct bootinfo" back to bootfdt.c

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/common/device-tree/Makefile       |  1 +
 xen/common/device-tree/bootfdt.c      | 99 +++++++++++++++++++++++++++
 xen/common/device-tree/bootinfo-fdt.c | 94 +------------------------
 3 files changed, 101 insertions(+), 93 deletions(-)
 create mode 100644 xen/common/device-tree/bootfdt.c

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 8a3f2be89e..8abc069c4b 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,3 +1,4 @@
+obj-y += bootfdt.init.o
 obj-y += bootinfo-fdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
new file mode 100644
index 0000000000..84520eed30
--- /dev/null
+++ b/xen/common/device-tree/bootfdt.c
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/bootfdt.h>
+#include <xen/bug.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/unaligned.h>
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
+
+u32 __init device_tree_get_u32(const void *fdt, int node,
+                               const char *prop_name, u32 dflt)
+{
+    const struct fdt_property *prop;
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop || prop->len < sizeof(u32) )
+        return dflt;
+
+    return fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));
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
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index e372096b19..a0e20d91af 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Early Device Tree
+ * Early Device Tree with bootinfo hooks
  *
  * Copyright (C) 2012-2014 Citrix Systems, Inc.
  */
@@ -110,39 +110,6 @@ static bool __init device_tree_is_memory_node(const void *fdt, int node,
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
@@ -203,65 +170,6 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
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
-    return fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));
-}
-
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


