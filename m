Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012DAACF85B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007491.1386829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGbr-0000mB-HS; Thu, 05 Jun 2025 19:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007491.1386829; Thu, 05 Jun 2025 19:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGbr-0000jr-Dm; Thu, 05 Jun 2025 19:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1007491;
 Thu, 05 Jun 2025 19:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGaT-0002fZ-6i
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:49:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2009::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29334f25-4246-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 21:49:15 +0200 (CEST)
Received: from BL1PR13CA0137.namprd13.prod.outlook.com (2603:10b6:208:2bb::22)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 19:49:09 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::18) by BL1PR13CA0137.outlook.office365.com
 (2603:10b6:208:2bb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.14 via Frontend Transport; Thu,
 5 Jun 2025 19:49:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:49:09 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:49:01 -0500
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
X-Inumbo-ID: 29334f25-4246-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMMU8rbe3/QzAwdQ11F2p682dL93A/MYUBAlykvXLFTpG7E127aUvYwcZjXjsYdI/QXIVp4Pv0IOsWa3r3vMVOIP1ywWajvK3Jlf4cUV20KIxKunZpMccqMhG3M4Qd6dcrmHx0JJVZmI1FA1Du/auYVSOwueLbzvbP7Apx8LHoPWDHbCdDlbQXtGRozbT0KpcRkuTib1thW4y/tGdlwTwguMlqTcB/6RFQLjalqwupvmWqo2ee3LJ47K68s/EcdTKP25k90xsOBJ7IHG+ZpxuVAJVxj6SVlHMthtaSpTt55Xn1o8GW/8TR620yntidCdxwmsHzdxWGouspNPC8eqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv0EfzD3T04lsgipc7vZMP9PeSx4rOo21HvvmAlamVQ=;
 b=PnFOwcZ9EYEFTvshjx9fjIVtqFTSK8L3QcUBnhrk1Qw27mEDHBpvfN+u4wXpc08GZP9gCKk2VpzVsmqUpKYjqJV8Ykl877g9dlhDcgqfYdz39eQMyZmr954qzMjHJysr06BmM6oB4TNo6riFNlHaoHN48ma4WD397ZPcrFGse6NqAPdNICe9WBU/y9Tgh1ma+cX/GofvSfs/g8fwNnjMrTN6dE/m48i9B0/M2+U0uzT6rmRRsrfVkES60lC2AdAegMkgXpKCqMqLw6EAJQz/WtIGmsy+GYQC5G4krhAHW3ucuGjaH1QkOFOc/DNHI5Pcd4O1ZK4cPS0eI8HH1tT5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv0EfzD3T04lsgipc7vZMP9PeSx4rOo21HvvmAlamVQ=;
 b=pKT87fxpLTK7UgkNmqhQZcn1JY6zvbqhLjsVEdCM2P4EYnPkgH9ds94a2kNHhG0cnGqIsxfT1SVwQsqXIRNMe8hQz0Y4/6pQ3jXwAYSVktg4F+rRGXzLrMKQnDRdNLOBFzqnI7t4iBJ2CzaNiyhJbvImuw/M6ZYP5Yd0nk7+i44=
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
Subject: [PATCH v2 11/15] xen/dt: Move bootinfo-independent helpers out of bootinfo-fdt.c
Date: Thu, 5 Jun 2025 21:48:03 +0200
Message-ID: <20250605194810.2782031-12-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c9c659-cce0-47a1-fda4-08dda46a09f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QxIFPJv+YrXur05ETNHacvihuswF+nsPPW9b8IE8rC13PB62PTowruXbJL+J?=
 =?us-ascii?Q?ZQ5UvUSlu7doukQ1eWxzDF0hSntPMo4+VLbO55c7wNBMj1v+ZDFoB6Itxxy8?=
 =?us-ascii?Q?0CjevLJiA7ILanjNkBkwcRfnJWwpe3W6Y0/KwPDAyWfTwdp0dqBtT1qLmHDl?=
 =?us-ascii?Q?mmyUt9y0enp1YwsTLqABdT0Ypkbv1n0EYuF+edL0QlGG7XWQXieDK8IgEtin?=
 =?us-ascii?Q?2Fug4+uknDembLiSnLw2E2askB3LpaCCYul5VBilJTjd9DM6EV6WI8twKFr3?=
 =?us-ascii?Q?o2FOnwIKuT2NuL8q6xUd2unY2E9ltuxrJEBfPZZNK+tr65oJNttVXa+xB5YP?=
 =?us-ascii?Q?Xbn81UobLS+7Ts2qfdVq7OtpoA309CQf4byDrc43PrctVor7crBE1/zNIP6X?=
 =?us-ascii?Q?MmEWD2U87INGLWU3siTw3M6QRK3rFZVf16/XsmVKFMFkT7GmxfgIwCzSH7/l?=
 =?us-ascii?Q?9KSZehNmp2G0RMeLiDmG0FDG+W2BXjExYcgA8KIOiET1vJCVj0cwDmw5Elj3?=
 =?us-ascii?Q?Y0JEZaVnKYWNT1sE8cHz9zGtSco1U5e+ivZoZIBc7gGmmfG2faOEPhqqwCsF?=
 =?us-ascii?Q?5gHtwYQaWN6TQLjCpxym1CZy32dJSaKz7cviYhLZbJa3ieSYCUBVOf3bf3Ap?=
 =?us-ascii?Q?0RtpIL2uvPz5IRVC9chwMuJCRbdICItHRCsa5Eat3fOjp6sL2XdXTTQfFUqe?=
 =?us-ascii?Q?fQbxj3nlsYtvj9Gdri1My1dzoLyEVx8FFP6bKBKHfpuCW6jB9ohGsy+fBCrv?=
 =?us-ascii?Q?BYnszt3F3urnsBzyI4xywPZ9GB4FN4c7hgCq2OSn57eIcGhOUaybktntPiKd?=
 =?us-ascii?Q?fbq3veW3zkoL5ZkmWQ5JM0jmYyCrXc1cwk4/3VfcWiVncLZeWuDD1WPFbKug?=
 =?us-ascii?Q?3McXAZYM6I02zCRiBfSlKdFPhkYQdVRjvKLxDocShXxEJL8Fx3YKmSdqy78m?=
 =?us-ascii?Q?P/F8PTKrZEaL6LLJEyCerMG0PQkSGcKD0pRU0H0yRL9cJv2ka3NDbEEFnhOe?=
 =?us-ascii?Q?oHVAj1A3KgV0felTRoU86jHSY6bxxFkUpFbvgZgEpKLgDMjuENZYlnzjI4ou?=
 =?us-ascii?Q?/oNewcMKEqPecz2E9W5ec9CE1nFPQrEYV4n5+Yw32fboXg58rZgeGWd+rm3m?=
 =?us-ascii?Q?zoYcoHUNQrC9rInN7tqLQstXaiGZ1Bo3+nbn1UZbvAUEiTswu6Vs3u8dTsK2?=
 =?us-ascii?Q?iBBgxzea8ZZfBAL3jipSqYK4yd/TN7X0QK+BUYG1LpcbMd3o4Om1csUwrKHP?=
 =?us-ascii?Q?ZricSHWz0kChPg3qQZFzLHtiv1Izl3DtpWyQjFmKRmMNYUQsTLSyp5sCLmV5?=
 =?us-ascii?Q?5EiI50ahQThoA2MJ4lznGrweNKB7WbtA2MBf3s04Se2Vbs8jUVzN18U/GBsc?=
 =?us-ascii?Q?yBeoPZsL+AsGnMuHeD1Ui/GTD+BqfgKM4YD00Czd0xh+6cMaBwvlclU5yxaj?=
 =?us-ascii?Q?1PZWjVodIPRDOcex1xu/fWbbOvoDet03FTiEyeEycWf3xIrICIKKONk9PcLx?=
 =?us-ascii?Q?xdxZ8YwGetZfzFChk5c1hzeP9Fko7lFFn5X4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:49:09.6921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c9c659-cce0-47a1-fda4-08dda46a09f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223

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
index 0000000000..6acf83d197
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
+    if ( !prop || prop->len < sizeof(uint32_t) )
+        return dflt;
+
+    return fdt32_to_cpu(*(const uint32_t*)prop->data);
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
+    uint32_t address_cells[DEVICE_TREE_MAX_DEPTH];
+    uint32_t size_cells[DEVICE_TREE_MAX_DEPTH];
+    int ret;
+
+    do {
+        const char *name = fdt_get_name(fdt, node, NULL);
+        uint32_t as, ss;
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
index 195249f700..695c4bfc49 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -109,39 +109,6 @@ static bool __init device_tree_is_memory_node(const void *fdt, int node,
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
@@ -202,77 +169,6 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     return 0;
 }
 
-uint32_t __init device_tree_get_u32(const void *fdt, int node,
-                                    const char *prop_name, uint32_t dflt)
-{
-    const struct fdt_property *prop;
-
-    prop = fdt_get_property(fdt, node, prop_name, NULL);
-    if ( !prop || prop->len < sizeof(uint32_t) )
-        return dflt;
-
-    return fdt32_to_cpu(*(const uint32_t*)prop->data);
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


