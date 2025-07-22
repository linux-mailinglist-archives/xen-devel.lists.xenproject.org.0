Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13672B0CE92
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051780.1420262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WF-0007GS-Eg; Tue, 22 Jul 2025 00:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051780.1420262; Tue, 22 Jul 2025 00:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WF-0007C0-8i; Tue, 22 Jul 2025 00:06:07 +0000
Received: by outflank-mailman (input) for mailman id 1051780;
 Tue, 22 Jul 2025 00:06:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0WC-0005Mp-S3
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:06:04 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6fc5fbd-668f-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 02:06:02 +0200 (CEST)
Received: from BN8PR15CA0046.namprd15.prod.outlook.com (2603:10b6:408:80::23)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:05:58 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:80:cafe::c3) by BN8PR15CA0046.outlook.office365.com
 (2603:10b6:408:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:05:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:58 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:55 -0500
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
X-Inumbo-ID: a6fc5fbd-668f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbHfkwGlU0o+9lJJ39u4DsTfkvFhG231rNk2GuofTBO117FewczK6CIZsvzV5IZ+Ae89b1sRx9n0P3YEAwqz8MvhGypRRgie6L8sd3gOnOU1MvGoPrSWDUm+auZ1shmLK4J8X2/tKxShIPUj7Jeeoq7hJiLYkPU61kEi3hy6O999OysalNM6R90vTJnOlEbsCvaNdD54ia91T9QL+Mzy85qWk+gmn18kkf60OmfsryUbZsUWZKcjRn+jn1cI+Wwhq1GMYgp3CjKf2gnyV0otcrL+oIRSKkn5hSYZczcQJa8yO8A4QX9nsZB8qy6GUXWLb/XxQMsQ8viktLIScG5IMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGxaa+dSwgjrriqkjbe2PxTi0btSSmoTABqEFHqTwY4=;
 b=YN2z0UVbNbuCA+zeBFq+iAKuZw8uzgeEStDK+9adUfM9RsAAJtnbZDjraUdjU+SmfXYHK0FO3JgcpZCMvQ6OT3uhdETFWIndRcorM6dx/hSCDe76GczLcNQ/F/df5aRwRaZAqheA60LbISf8aneimhawSEevgdf0Ov1iQlh0NeWyFwC75ekSuo5nMPWAFpbH/f/WMZjieCvVnuhFshb9UF5fWqLg+kwhmkRD2L50RfV2WIU+ALzn8V/CDbP916HhSfp8wGaUyhJ+B+FcMRuXmTFYSPMVarshPOJlvxc1d3BkDveK+OEjCVwjCx9DrRyH4UKEnQjlk+xXzP+uwMqBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGxaa+dSwgjrriqkjbe2PxTi0btSSmoTABqEFHqTwY4=;
 b=P8tjciw7ZmUlwCh31en+nqbYCI9eiwJpW0mU6PCGFLdyuE5VNi5a5uQlznt8X19NWSnVs4e3PMAqo/TIlnTDaBp+XhYW+HCpsLkGyvHJUjGWFj/siM1SS/MAcQWPHZm2XP13RZWKkA7kpM5UKs/ntSYr+GzO4//8snUT7eKmQCk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v8 07/11] xen/dt: Extract bootinfo-independent functions to bootfdt.c
Date: Tue, 22 Jul 2025 02:05:19 +0200
Message-ID: <20250722000525.7247-8-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|CYXPR12MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: c612de2f-352d-441b-4286-08ddc8b38935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nOQ+PFVIR3jumJpBUK3ElliHmZBNhwQoveuU5Sz/lbZ4PtoXtFbceNXsObsl?=
 =?us-ascii?Q?MO5yB1inVVrR2V/Q0tuCPTzioQHigtUA8vszsA1e9wD2V8sd1XPpaRU0vCil?=
 =?us-ascii?Q?KJ1NcoOvKBWpf0p02Usb5C4A3n+thjEYcl8/6YyCsohppvZf0wf7t8zSmSF0?=
 =?us-ascii?Q?WreEA0SI199oEdafbFQ9Dq8U3P5B7dxaXBjRnbfjyONhhstszVQ/VoMd0mNQ?=
 =?us-ascii?Q?lZWXkj24igsaWbY5SLkapsaek1Wn0T6qnavdBncP5Ccoyq8i5ouAZQTveZJC?=
 =?us-ascii?Q?hJOTBZI+4c2UjLPrMZBdZoUD+OUDWv4G2jrYPEzoIpJwL2UEVCteSe5eQAAe?=
 =?us-ascii?Q?JmxvECvpYhzvuCHGCo5jxb7rtHH0nwcqjYAStj6TIHBdpK7jQFWmcxf1Ptfs?=
 =?us-ascii?Q?iIP0lWMDScfZtlI4zThBhTaPzLRfzUfeLu9yJ8XsRs+nlP+LeTVAkK44YaU0?=
 =?us-ascii?Q?ET55C/+Myn1Hkf/sCo4iSfCD1qEA5y4wY+EpVuBHbtEQgqvGgr2yzV4x+3wW?=
 =?us-ascii?Q?miMxjguuEQX87xuaGVJ4KEuV/MLGPxvoRSZkZNRMhfANrjUsufKKjsgNeDao?=
 =?us-ascii?Q?WwFMj1jXK7hS6PRUzvz20KhM2bWpln4gvu3d9X7bFn8IHofZe+igNMiFulDP?=
 =?us-ascii?Q?cZfVeYxUidu6QXZOhqaHcJEW3pd9xdQXaOsGb/diyLj/k5gTTJVoOTKSHN8d?=
 =?us-ascii?Q?vLsR8fHyKHrWj8bJ+HTlHjZXl897tdP1PCL2gi1JHHTv9rHfYWhJOR5/g1zT?=
 =?us-ascii?Q?vxzvkmANoolkRyw4VLs1HdxEALwlON6orusg4ilFtzaVjmehOusszj4vp+L7?=
 =?us-ascii?Q?3anGhF5Ax+EeknlRdBWiOSfBkstaMs2I3MtKzBzMhCCYiI6PiwnYvA7D59H4?=
 =?us-ascii?Q?F8vc9yQVNZ/GiAC3ALs9AylbXzXY+Jco0d8c+Q/tzlrkXmxKKLKygzJzgY6i?=
 =?us-ascii?Q?nNBsDl3x9LBglnOI9erim5B0KwN3t4RbA2HNr64O4C9Mh+AgIAiKO0ZcIa/H?=
 =?us-ascii?Q?mzt/Nqpc0np8iJx4TPhFfv6bx5w4TYsM5JcrTm/11AwAggvXuyLXMbrLOoHC?=
 =?us-ascii?Q?oyokvN+q+BrM+NvkLhYPDrF1kmsPkh+4FpcgKvMmY+GzS0tGk5aTtzCdZfzv?=
 =?us-ascii?Q?tS09Cj3gTOjSZ2gB3r2uFWtJyYgqfJSusAt9Ld4SYeREVpIiHDmlLQ0Fr15H?=
 =?us-ascii?Q?rDrpS/+qMY7t1LD+JgSL8yflBJgpPnTwKegDewitzSbIU0SMG67A4DpoEfDJ?=
 =?us-ascii?Q?ZRxVl1oOqF/dNwpsF+HlnLnUori90+9yOTruluNM6gqFHwrygjMNsrgi3kaL?=
 =?us-ascii?Q?N+P68xVXZjAG0sguxiUW8DTR+BFlP2EJc2fRVT0X2XvRbqwDzCZtvsyfwdCy?=
 =?us-ascii?Q?hVpkXizPQh49/3SNI3vBqENmrc308FKvDaqVpzVcNGgV+3qPEC48RxEdfJ+H?=
 =?us-ascii?Q?s41XGHJxrSGk4aAy8yncGTRxhk7g36Je2An0vecQjrMQhmK6n3Ai8LHHlP7F?=
 =?us-ascii?Q?iZ95FAzbz4GQfdkSAebFMbaK64nRqdRiomFq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:58.2717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c612de2f-352d-441b-4286-08ddc8b38935
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442

Move all functions independent of "struct bootinfo" back to bootfdt.c

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
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
index 8ed8e06872..5111fc9436 100644
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


