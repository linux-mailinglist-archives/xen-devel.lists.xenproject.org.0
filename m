Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC0AEF5C2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029521.1403308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgH-0003Wz-Hl; Tue, 01 Jul 2025 10:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029521.1403308; Tue, 01 Jul 2025 10:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgH-0003Ta-Cv; Tue, 01 Jul 2025 10:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1029521;
 Tue, 01 Jul 2025 10:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lih=ZO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWYgF-0002hE-QG
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:57:39 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20626.outbound.protection.outlook.com
 [2a01:111:f403:2407::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3326318d-566a-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 12:57:38 +0200 (CEST)
Received: from BLAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:335::7)
 by MN2PR12MB4288.namprd12.prod.outlook.com (2603:10b6:208:1d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 1 Jul
 2025 10:57:33 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::7a) by BLAPR05CA0027.outlook.office365.com
 (2603:10b6:208:335::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 10:57:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 10:57:32 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 05:57:28 -0500
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
X-Inumbo-ID: 3326318d-566a-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjkb3jcLfPVgz1bK1EZf2KDiKqUfkACMNhPPUdr8NR5K5PKAF3ia328iNAxhhzi6YtQRJ+GCSyh90NFfVSsHKaoAMJ4AMdn2pS3jQ5B+i+6f/cHp/WtRyUQmGE0pnpZkOy+dvmKqBJZXMib3lY+/9HdOduXNN5DD3lDVpxEBiwo2BZ1rVfdMiVNFO1Daz50AVuYFIrry1ty/sXV9ik90NQHmmLgfWVUah4H7WR5Cq5XxV0ppmr3Q+w7y6Hp9KA5WuB+KQN7nJ5ky/M/TlDhOFokZqqr79jXZA4WcdZPy/Fjcwl5mRAzf97irs8eC4ett2wYJ/605c9Nq3jXlvM5urw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndMUqJ5v26UYy2Vo7yrxtc0yO6wxlNoKeS3pngBUHxs=;
 b=Yr1+8KSlfFHCP3svtfm5TYEw83GZI5+YLd3dDry0VJvF4FBsnCOk6fWFl9ikSv204vYj/cdJglt1mmiD9JThYSSI3vsZ+AaxwZGWO/aARqCqNEZ7lQPjTWkYj97CDE515TBx6VRkTXgRqXCoIC3qGZaptcN3/pFuNycpvJedQNmtDHNaL5WlpTgKROn6/KcHuLinU7kn89uNvcROX+ehQnfz+0Hq07agoAKSczHwf8Vw2v7yVaNJ/nY1H2LvR9niH3Vxje8TpgqJFgpTtNg7bqKfpbK2oEif/dQw4nafj1IhppOG6j4+E0jmYpvjU1J/sH5xcJqFbvQpK/1cvf19ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndMUqJ5v26UYy2Vo7yrxtc0yO6wxlNoKeS3pngBUHxs=;
 b=j37jwRqWTdqHrNjkfQBCg6G95dgGzsmBhugzoWIBiR3oAgG1++1ZZ2yLCEl9OisETFDQP1BrB6Bdt2Itp2jst+jOIiltDX9vYva5z7VvIgy6abuRlLABo3M0Zl754KARfiaeW2AjmR5CZdKnqrSIMTB2ITDvPk6i+j3ouWaRmb0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH v5 04/10] xen/dt: Move bootfdt functions to xen/bootfdt.h
Date: Tue, 1 Jul 2025 12:56:58 +0200
Message-ID: <20250701105706.86133-5-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701105706.86133-1-agarciav@amd.com>
References: <20250701105706.86133-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|MN2PR12MB4288:EE_
X-MS-Office365-Filtering-Correlation-Id: 850acc4b-fd55-4b23-1e56-08ddb88e14b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5CPE7q3Na9YCT1zWE27G0OnHrnNqNE1rCQs2OQ1S8OwkqCfy85/JO9sbF1im?=
 =?us-ascii?Q?jxSIb+9zIlmmlbLJNByx62AXSXu2wi6Bum7CBmsUj4DK9OobmmxNudbhC3go?=
 =?us-ascii?Q?aFVVuARJXoyEpCys/IObdrAQET6ChAyUbSX48vHE753qoemiA73HIyzQxGWL?=
 =?us-ascii?Q?ehDloB5ppZabivQomPF8MBCoTMvH6lMPUXEE/sQA7ItjmsVfVQ5VyZOehdAZ?=
 =?us-ascii?Q?k7zNBX4u4kooqfMfl5+cN4WQyBMpjWoXl/dmLVBMsHjB/KcO5/2rEeRY2W3N?=
 =?us-ascii?Q?nK3y+9Fjre+Zbg4lAyhhBCpbADUCos7wQIU69SEU48ywHuFS2oDb84g2eZMe?=
 =?us-ascii?Q?RerQHK5u3P+4IJ+HxtekmqH/kjTAShFnEe9P421AP7dyh4dOAEJSrOmGG8zj?=
 =?us-ascii?Q?MHuhTX6zscPj1tYEfFihxSSL+K/DMZEzt90ParCAqV/rfM6h9Qp6gYvDT6Oy?=
 =?us-ascii?Q?X+MAFeyAhp9K+ZSCphU1x8fhxAHi7x70RRv4Kp+JnPK2mO6xkWzfaOIvsR8o?=
 =?us-ascii?Q?xVJpjteQoSl0sKaThZ+vWO74aDFxxhE6CPovNB6l1wt36F5VieodEM70hRcb?=
 =?us-ascii?Q?fwqXaeMxGgfIOVEoRNqGRdsJ6An67v/ydxkZaM2eW/L+VEuRdI/e1Q6g0ByS?=
 =?us-ascii?Q?v0DVuD4ENw46Pbz0SGMe09VOCUtMzxu3HC8+d5jUnHS2FMSp4mNdYFXcn951?=
 =?us-ascii?Q?XyG5ta4GW7kexPgOZr/eIIj+vEKGkMvRpU7MDnz/ZcSp6lLtM+S2D533I6xa?=
 =?us-ascii?Q?tuFw/+54qXGbyPVZiEPgqoIJpvFTlxVaDgPXmTJfVtjgiODODYtTf1i1l1CJ?=
 =?us-ascii?Q?ZphB+DHB5+hNYRZgxRArJui7F8F6s/c4yLvE1taU0askm3PO7+aRHOiVKQom?=
 =?us-ascii?Q?Nh2WHvcE4LPxoYsu3drLsNGA0LUENXHbQO7BzMWQlUKgfWneP2XXfZB2yqvp?=
 =?us-ascii?Q?wVCtGVeoDZsYqArnWV4zQXkYYw1XzR9sROKQ1JteyJMvpbF+HCJtJYgt5svv?=
 =?us-ascii?Q?+2q3jc0MrXRbhbHYbwJtwXenLYGqy2Y3ITgBQo6o/Fd8FQrhuB1LKBMXNl74?=
 =?us-ascii?Q?zaO3b6nFvVutzbcLic6irpY18MBl2IGpGxet7FqgWgTAwQIgYMwsqf930MU8?=
 =?us-ascii?Q?b7zroR7BtDpXcfXmDg8tK8ickL6n9zxWgc3aMLeCDN6HxQYzWQ9tT3q6DgTa?=
 =?us-ascii?Q?cibn1kk5iPY8C/wicfahiV71fBHm9jRc63dKRY1Pcn8ROpZQ4rj2TMwz62zY?=
 =?us-ascii?Q?tsO/riDMDxMn6k5/JcEiZLmHVApJPCGl3pKITIjpUx8JauA2hZu7Q3gNegqI?=
 =?us-ascii?Q?m2WaeGVwQpfQviJGSuDX1JAuRwATXvFkNiu/UILMvJlnkeTYH766r076REuj?=
 =?us-ascii?Q?mRUuzvGwaGsNvSmeBuKncGGuAkAltdp+sRWJRlCQK5lelX4ibNfh/nKkA9wM?=
 =?us-ascii?Q?+Avc46SdVNFnoilegWW3O6a1CSVQ7IBDtiiUVdJmqN1cXLRVT3A5Qp+xInxY?=
 =?us-ascii?Q?4gpVbP8/XRU8hx3DutMZaDjsZfWMk6CKdawr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:57:32.8337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 850acc4b-fd55-4b23-1e56-08ddb88e14b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4288

Part of an unpicking process to extract bootfdt contents independent of bootinfo
to a separate file for x86 to take.

Move functions required for early FDT parsing from device_tree.h and arm's
setup.h onto bootfdt.h

Declaration motion only. Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/riscv/cpufeature.c            |  1 +
 xen/arch/riscv/smpboot.c               |  1 +
 xen/common/device-tree/device-tree.c   |  1 +
 xen/common/device-tree/static-evtchn.c |  1 +
 xen/common/sched/boot-cpupool.c        |  1 +
 xen/include/xen/bootfdt.h              | 91 ++++++++++++++++++++++++++
 xen/include/xen/device_tree.h          | 78 ----------------------
 7 files changed, 96 insertions(+), 78 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index b7d5ec6580..b846a106a3 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -8,6 +8,7 @@
  */
 
 #include <xen/bitmap.h>
+#include <xen/bootfdt.h>
 #include <xen/ctype.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
index 470f6d1311..3b8bf98e20 100644
--- a/xen/arch/riscv/smpboot.c
+++ b/xen/arch/riscv/smpboot.c
@@ -1,3 +1,4 @@
+#include <xen/bootfdt.h>
 #include <xen/cpumask.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 886e6c7712..725ff71646 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -7,6 +7,7 @@
  * benh@kernel.crashing.org
  */
 
+#include <xen/bootfdt.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/guest_access.h>
diff --git a/xen/common/device-tree/static-evtchn.c b/xen/common/device-tree/static-evtchn.c
index 8b82e6b3d8..88342b44a1 100644
--- a/xen/common/device-tree/static-evtchn.c
+++ b/xen/common/device-tree/static-evtchn.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bootfdt.h>
 #include <xen/event.h>
 #include <xen/static-evtchn.h>
 
diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpupool.c
index 641f3495cb..03be73efdd 100644
--- a/xen/common/sched/boot-cpupool.c
+++ b/xen/common/sched/boot-cpupool.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2022 Arm Ltd.
  */
 
+#include <xen/bootfdt.h>
 #include <xen/acpi.h>
 #include <xen/sched.h>
 
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 8ea52290b7..0846317f30 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -2,8 +2,11 @@
 #ifndef XEN_BOOTFDT_H
 #define XEN_BOOTFDT_H
 
+#include <xen/byteorder.h>
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/kernel.h>
+#include <xen/lib.h>
 #include <xen/macros.h>
 #include <xen/xmalloc.h>
 
@@ -16,8 +19,80 @@
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
+/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
+static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
+{
+    uint64_t dt_r;
+    paddr_t r;
+
+    /*
+     * dt_read_number will return uint64_t whereas paddr_t may not be 64-bit.
+     * Thus, there is an implicit cast from uint64_t to paddr_t.
+     */
+    dt_r = dt_read_number(cell, size);
+
+    if ( dt_r != (paddr_t)dt_r )
+    {
+        printk("Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
+     */
+    r = dt_r;
+
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
@@ -260,4 +335,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
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
index d2de7c3a13..b6d16756fc 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -22,8 +22,6 @@
 #include <xen/list.h>
 #include <xen/rwlock.h>
 
-#define DEVICE_TREE_MAX_DEPTH 16
-
 /*
  * Struct used for matching a device
  */
@@ -164,17 +162,8 @@ struct dt_raw_irq {
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
@@ -245,10 +234,6 @@ void intc_dt_preinit(void);
 #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
 #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
 
-/* Default #address and #size cells */
-#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
-#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
-
 #define dt_for_each_property_node(dn, pp)                   \
     for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
 
@@ -258,55 +243,6 @@ void intc_dt_preinit(void);
 #define dt_for_each_child_node(dt, dn)                      \
     for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
 
-/* Helper to read a big number; size is in cells (not bytes) */
-static inline u64 dt_read_number(const __be32 *cell, int size)
-{
-    u64 r = be32_to_cpu(*cell);
-
-    switch ( size )
-    {
-    case 1:
-        break;
-    case 2:
-        r = (r << 32) | be32_to_cpu(cell[1]);
-        break;
-    default:
-        /* Nonsensical size. default to 1 */
-        printk(XENLOG_ERR "dt_read_number(,%d) bad size\n", size);
-        ASSERT_UNREACHABLE();
-        break;
-    };
-
-    return r;
-}
-
-/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
-static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
-{
-    uint64_t dt_r;
-    paddr_t r;
-
-    /*
-     * dt_read_number will return uint64_t whereas paddr_t may not be 64-bit.
-     * Thus, there is an implicit cast from uint64_t to paddr_t.
-     */
-    dt_r = dt_read_number(cell, size);
-
-    if ( dt_r != (paddr_t)dt_r )
-    {
-        printk("Physical address greater than max width supported\n");
-        WARN();
-    }
-
-    /*
-     * Xen will truncate the address/size if it is greater than the maximum
-     * supported width and it will give an appropriate warning.
-     */
-    r = dt_r;
-
-    return r;
-}
-
 /* Helper to convert a number of cells to bytes */
 static inline int dt_cells_to_size(int size)
 {
@@ -319,14 +255,6 @@ static inline int dt_size_to_cells(int bytes)
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
@@ -961,12 +889,6 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
 
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


