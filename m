Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD2AA0BCC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972369.1360755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kDF-0000zU-4f; Tue, 29 Apr 2025 12:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972369.1360755; Tue, 29 Apr 2025 12:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kDE-0000wB-VM; Tue, 29 Apr 2025 12:37:24 +0000
Received: by outflank-mailman (input) for mailman id 972369;
 Tue, 29 Apr 2025 12:37:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kDC-0007L9-Nd
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2416::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afeee676-24f6-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:37:19 +0200 (CEST)
Received: from BL1PR13CA0307.namprd13.prod.outlook.com (2603:10b6:208:2c1::12)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 12:37:13 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::1d) by BL1PR13CA0307.outlook.office365.com
 (2603:10b6:208:2c1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Tue,
 29 Apr 2025 12:37:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:12 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:06 -0500
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
X-Inumbo-ID: afeee676-24f6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxX4f/TIxoU+7wN/2speL4gTXowFpKB+url1kZBGoGFbhQABEeyiFZx2W76hbDfHpxSHBAKrYjm2TSWDkRVZf/SObXKRYWzhj+oZ9eXZnIv+7q2Zp/bqecJOlpo9g7GohpR31Y+pzY9LXQ1kGSwdPwQLCbxyoqaFHz2Rl5pyb/03fNqVmuQY+RVqNSsakmdYG3zjgavU358Mtjwpe2sKzz3Q81gQeY0vNtgVAwsLGgGTI5uulqOO8WqSmgqTsn3XVKeIffFLMKPbAzJkhBIZ4Dwp2U2FmynO7F79Z2K1OPx0wjk9UupfR5rgJ8QJJ4weJqs3Vwp/z0DVtRV2A3gzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGykJQZXA0HQnaAnFulQBRBoOR4WtonCUdL5Fcu7eLY=;
 b=to0pDMyR5anAa3BKTM8D8zUbIE5Pibc5vcHf5ol4YJuFkJ6DUKpibcdu/3hAtV2KqPGU8Ab3zeV3VleiY1Hrr8NHkQt0h2lK3w6w4v+rDrOa97eVGnbQosAnoLi5CPgm3wXrIh0qcPDvPH6i9Z/0TnUhDtf6KDh9z5ERProF+yrg729BMonqH7AspqR4fq1zwz8t3eD5pO/M0X1avEm5hC79LAORH4KIY7Tq1amYX7kje3RaUnbtnBwCw5u1ce7oLikD94n1KwmYD6XTq5yrtGmavWz3n06X9PQ8WBjugzxwkKI/DQg5BjAc3/z2DSuEEU/bfcUq9MSy4aY+iZuH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGykJQZXA0HQnaAnFulQBRBoOR4WtonCUdL5Fcu7eLY=;
 b=VJ19/Kmt05W+xmYJwwNntqXPmY47+/5Oireookxw0zha6rIWvpbs67gsEvk3BhIaBmL4Ov3sOvkrpzBDKbndoZ/+HEY0RVOwQBHxQ+lpPn+BFRqILquimK4ge0d+qUJ6T7c9CyLwEbHiSRVKZ+Yi9z0q4/+nuXMt3VwqqngJbKI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v6 04/12] x86/hyperlaunch: Add helpers to locate multiboot modules
Date: Tue, 29 Apr 2025 13:36:15 +0100
Message-ID: <20250429123629.20839-5-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SN7PR12MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 633be678-8083-4dc2-4a89-08dd871a9104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EqkAaI7bxKQSI0Vq3StOWNmqaCvttiX4LzfcpghTtJGMUxV56en21dNV44X3?=
 =?us-ascii?Q?O1ru2GzjU7qqsjux7jjrRTBXzPUMScKHsIzx2Di2tmRROl7o6mGOiIYCrOPw?=
 =?us-ascii?Q?VwRReiZ3QoEx7Uc3rBcQrXGCa8kcGctq+duUkmBmYVYUz7Zm4pKKf/skS/Lj?=
 =?us-ascii?Q?Se2SCcUFy7EHlBr9OYPxOa6u71K03QZhBaqeb6v/0oI95WmWtNFeRr5fiF5L?=
 =?us-ascii?Q?GhaT5G9NQFSn7fj2c8RxR5AXJG3EhvW/eZQcEIq4UMTHLhkQzbvAM8xZDffS?=
 =?us-ascii?Q?wx5ghKyvJU8uBad5PMbjCaKCZyltXX9T0+/oxT8SYlcC08kz4OljWnEsYP7Q?=
 =?us-ascii?Q?ofyEdoKRbp2VTQd1sXZ7OamgvVyXBXr8Z5w5264Wh/WbRVUwBVT0J+f/JhCX?=
 =?us-ascii?Q?1q+PeD4aOOxDb2ohukolVGmF1zeqbkKDUDPBtS+8QW7OgItggB+1lcktb/De?=
 =?us-ascii?Q?bNfW5GgamVWtqA2gu/c6NNq+Ei1doa6m4IyJavzKt2a6hjzQs1uyr0tvHUsZ?=
 =?us-ascii?Q?BFi+iw/zIkiw1g64Eqa97bQC86njyUDWOFdu4aJOn3/vuWIAb829tdovSmuy?=
 =?us-ascii?Q?2g+Hfg52I6MlAN8/qpZmzcQKiSblNO1Y7HoNy+YYagx3f41P8fRuhxsvYgL6?=
 =?us-ascii?Q?PdunDIi/es82+TozIrDHUsa4NTQwT9WLldPTv/FuXKrQja44ijhGW3EjGPqo?=
 =?us-ascii?Q?g0mTERRECYve0Gu6MkfbEMsY50eYNDn6SSxJN5RTqG32j1dWbu9J5hWOdVGB?=
 =?us-ascii?Q?ChuoQxs3FsTOeERiGtS9FM1tg6JT2I4vMpMCOKFkoWJ/2SsRmH63yTqClJ8e?=
 =?us-ascii?Q?Xa4WtkUMKGb1VLooqf++SKBum8rxo893+ULSO7KJeJME3iVmXcpSteR6102Q?=
 =?us-ascii?Q?AEIs7FDCHQUTI2sMkQ99ZNyeVJAfIJ8yy4BrG9u84aFeYofT2KAj7N1Nqv/P?=
 =?us-ascii?Q?i/rjZM7FiHdjYzI+8CvFhoHg8uAeO5eXZAgsul7MIkUdHvRtHC6X43vWwYHE?=
 =?us-ascii?Q?zbzExuis7anCF1fb3UaT8MXOd/jPrBwl25uMfRwK9YbY0/LUyRnK5GxA5laY?=
 =?us-ascii?Q?MzkPqaY8VmEB/CV4Ls8NwQYf1+ZZUNH2NJ5c0LKHt3MnQ2gg72cflKOPz2V/?=
 =?us-ascii?Q?rIrcqYofEwFcM0bCTxHtcqiw7Y0Uo3WH6NwKhcEqPRwhIRBkWAsqL2iYo8ZC?=
 =?us-ascii?Q?B6FZs3dqIly/fNXQ1HGGGg30t0+v0h74GlC1hfxiqopcpK5gQNp+GB938ZZj?=
 =?us-ascii?Q?AzS9Ti4uMQ4bsBJY9rntUzWvo8KdDjd97ew8V511ahrnaz26jm+q/1WzvPpo?=
 =?us-ascii?Q?PqL3CejELNpGGrJ5Ag8VY33MDg+pby6YtD/71qyffmT1y8QWhnKtN23Fu6lG?=
 =?us-ascii?Q?RSkJwWPoFqZxpII7F3bUNOovNH8Vy21wXCNng2kz8mhxW+DAthIV3+YTa8zM?=
 =?us-ascii?Q?+cSko2PPKJGAdesF6/pSRxtjClOMwstXlosQaVIcHZGgBvEVlMqTU12WQR9K?=
 =?us-ascii?Q?lheRLz0eCwA5xNthgxV5oP9r7d1FRM/yOKbV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:12.7927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 633be678-8083-4dc2-4a89-08dd871a9104
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716

Hyperlaunch mandates either a reg or module-index DT prop on nodes that
contain `multiboot,module" under their "compatible" prop. This patch
introduces a helper to generically find such index, appending the module
to the list of modules if it wasn't already (i.e: because it's given via
the "reg" prop).

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/domain-builder/fdt.c  | 172 +++++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h  |   1 +
 xen/include/xen/domain-builder.h |   4 +
 3 files changed, 177 insertions(+)

diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 94ccff61e2..05ac3647cf 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -13,6 +13,178 @@
 
 #include "fdt.h"
 
+static int __init fdt_prop_as_u32(const struct fdt_property *prop,
+                                  uint32_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
+        return -EINVAL;
+
+    *val = fdt32_to_cpu(*(const fdt32_t *)prop->data);
+    return 0;
+}
+
+/*
+ * Unpacks a "reg" property into its address and size constituents.
+ *
+ * @param prop          Pointer to an FDT "reg" property.
+ * @param address_cells Number of 4-octet cells that make up an "address".
+ * @param size_cells    Number of 4-octet cells that make up a "size".
+ * @param p_addr[out]   Address encoded in the property.
+ * @param p_size[out]   Size encoded in the property.
+ * @returns             -EINVAL on malformed property, 0 otherwise.
+ */
+static int __init fdt_prop_as_reg(const struct fdt_property *prop,
+                                  int address_cells, int size_cells,
+                                  uint64_t *p_addr, uint64_t *p_size)
+{
+    const fdt32_t *cell = (const fdt32_t *)prop->data;
+    uint64_t addr, size;
+
+    if ( fdt32_to_cpu(prop->len) !=
+         (address_cells + size_cells) * sizeof(*cell) )
+    {
+        printk(XENLOG_ERR "  cannot read reg %lu+%lu from prop len %u\n",
+            address_cells * sizeof(*cell), size_cells * sizeof(*cell),
+            fdt32_to_cpu(prop->len));
+        return -EINVAL;
+    }
+
+    switch ( address_cells )
+    {
+    case 1:
+        addr = fdt32_to_cpu(*cell);
+        break;
+    case 2:
+        addr = fdt64_to_cpu(*(const fdt64_t *)cell);
+        break;
+    default:
+        printk(XENLOG_ERR "  unsupported address_cells=%d\n", address_cells);
+        return -EINVAL;
+    }
+
+    cell += address_cells;
+    switch ( size_cells )
+    {
+    case 1:
+        size = fdt32_to_cpu(*cell);
+        break;
+    case 2:
+        size = fdt64_to_cpu(*(const fdt64_t *)cell);
+        break;
+    default:
+        printk(XENLOG_ERR "  unsupported size_cells=%d\n", size_cells);
+        return -EINVAL;
+    }
+
+    *p_addr = addr;
+    *p_size = size;
+
+    return 0;
+}
+
+/*
+ * Locate a multiboot module given its node offset in the FDT.
+ *
+ * The module location may be given via either FDT property:
+ *     * reg = <address, size>
+ *         * Mutates `bi` to append the module.
+ *     * module-index = <idx>
+ *         * Leaves `bi` unchanged.
+ *
+ * @param fdt           Pointer to the full FDT.
+ * @param node          Offset for the module node.
+ * @param address_cells Number of 4-octet cells that make up an "address".
+ * @param size_cells    Number of 4-octet cells that make up a "size".
+ * @param bi[inout]     Xen's representation of the boot parameters.
+ * @return              -EINVAL on malformed nodes, otherwise
+ *                      index inside `bi->mods`
+ */
+int __init fdt_read_multiboot_module(const void *fdt, int node,
+                                     int address_cells, int size_cells,
+                                     struct boot_info *bi)
+{
+    const struct fdt_property *prop;
+    uint64_t addr, size;
+    int ret;
+    uint32_t idx;
+
+    if ( fdt_node_check_compatible(fdt, node, "multiboot,module") )
+    {
+        printk(XENLOG_ERR "  bad module. multiboot,module not found");
+        return -ENODATA;
+    }
+
+    /* Location given as a `module-index` property. */
+    if ( (prop = fdt_get_property(fdt, node, "module-index", NULL)) )
+    {
+        if ( fdt_get_property(fdt, node, "reg", NULL) )
+        {
+            printk(XENLOG_ERR "  found both reg and module-index for module\n");
+            return -EINVAL;
+        }
+        if ( (ret = fdt_prop_as_u32(prop, &idx)) )
+        {
+            printk(XENLOG_ERR "  bad module-index prop\n");
+            return ret;
+        }
+        if ( idx >= MAX_NR_BOOTMODS )
+        {
+            printk(XENLOG_ERR "  module-index overflow. %s=%u\n",
+                   STR(MAX_NR_BOOTMODS), MAX_NR_BOOTMODS);
+            return -EINVAL;
+        }
+
+        return idx;
+    }
+
+    /* Otherwise location given as a `reg` property. */
+    if ( !(prop = fdt_get_property(fdt, node, "reg", NULL)) )
+    {
+        printk(XENLOG_ERR "  no location for multiboot,module\n");
+        return -EINVAL;
+    }
+    if ( fdt_get_property(fdt, node, "module-index", NULL) )
+    {
+        printk(XENLOG_ERR "  found both reg and module-index for module\n");
+        return -EINVAL;
+    }
+
+    ret = fdt_prop_as_reg(prop, address_cells, size_cells, &addr, &size);
+    if ( ret < 0 )
+    {
+        printk(XENLOG_ERR "  failed reading reg for multiboot,module\n");
+        return -EINVAL;
+    }
+
+    idx = bi->nr_modules;
+    if ( idx > MAX_NR_BOOTMODS )
+    {
+        /*
+         * MAX_NR_BOOTMODS must fit in 31 bits so it's representable in the
+         * positive side of an int; for the return value.
+         */
+        BUILD_BUG_ON(MAX_NR_BOOTMODS > (uint64_t)INT_MAX);
+        printk(XENLOG_ERR "  idx=%u exceeds len=%u\n", idx, MAX_NR_BOOTMODS);
+        return -EINVAL;
+    }
+
+    /*
+     * Append new module to the existing list
+     *
+     * Note that bi->nr_modules points to Xen itself, so we must shift it first
+     */
+    bi->nr_modules++;
+    bi->mods[bi->nr_modules] = bi->mods[idx];
+    bi->mods[idx] = (struct boot_module){
+        .start = addr,
+        .size = size,
+    };
+
+    printk(XENLOG_INFO "  module[%u]: addr %lx size %lx\n", idx, addr, size);
+
+    return idx;
+}
+
 static int __init find_hyperlaunch_node(const void *fdt)
 {
     int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
index d1bcc23fa2..5570fb7a9c 100644
--- a/xen/common/domain-builder/fdt.h
+++ b/xen/common/domain-builder/fdt.h
@@ -3,6 +3,7 @@
 #define __XEN_DOMAIN_BUILDER_FDT_H__
 
 #include <xen/domain-builder.h>
+#include <xen/libfdt/libfdt-xen.h>
 
 struct boot_info;
 
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index cbb3cbea7c..3ac3a0ab84 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -28,4 +28,8 @@ static inline enum fdt_kind builder_init(struct boot_info *bi)
 }
 #endif /* !IS_ENABLED(CONFIG_DOMAIN_BUILDER) */
 
+int fdt_read_multiboot_module(const void *fdt, int node,
+                              int address_cells, int size_cells,
+                              struct boot_info *bi)
+
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.43.0


