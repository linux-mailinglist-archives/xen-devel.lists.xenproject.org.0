Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FBEB063FD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044528.1414650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFt-0006se-IJ; Tue, 15 Jul 2025 16:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044528.1414650; Tue, 15 Jul 2025 16:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFt-0006pj-CK; Tue, 15 Jul 2025 16:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1044528;
 Tue, 15 Jul 2025 16:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiFs-00067r-AQ
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:11:44 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20606.outbound.protection.outlook.com
 [2a01:111:f403:2408::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65a4c68e-6196-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 18:11:43 +0200 (CEST)
Received: from SJ0PR05CA0093.namprd05.prod.outlook.com (2603:10b6:a03:334::8)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 16:11:40 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::bb) by SJ0PR05CA0093.outlook.office365.com
 (2603:10b6:a03:334::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 16:11:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:39 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:36 -0500
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
X-Inumbo-ID: 65a4c68e-6196-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNltdQffOva6ssEvF4/Yk4o4mKj0Mvcsa7awxkFExe9tM+x5EG0kkGulCVRszfuAEwoUJ80z94z6YKguWANUP+5cEViQ8d3nt2ZVsnNB8lawyM08E9F7+gfB2hgHFt+Ss7Uk0CtDSECtGcOcupOi1sU7+eLBF3X0SscthKI1Vdxq87W4n1iLuigrmL3Rvk3l14TAg8kfovAQE7JcDIXGnSH4mm0rGAzaQhTpebTFgKrE90GQFHwbf2LNkSEdodaxPY84VM8uZu9x19qT0pAPrCXhYYkoNXvUYR0GKM8eyeIMyLAjEVcRjtY+ekTSoaKAwOqFXicasAY9jqn02aSryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmyL3Z1tAEuMNG2iHkpZSy+SVqBDLv6+yGWI/26HnBc=;
 b=dewlOo8oMefkAQyHR9woz63atwjFjM4JMF3MGCN4Kr356TAsf4k4u9RedFSYCfy0h5mSeFhUU5qIPsuGO2228I87IfzEYPzM8QSi4YhOMIYdFO/HIXa9lpw1XnuydBEmG7V/e5SjWpO2+rZsDkquY4KR8ZlZCEl6JEn3Re+yEqHjwoSG4nxcZlvA0R13FVIHEd6W9ZYktuEBhycSZgip3REfo2rYu/ys3QDuLGIURAFNBh5Hia1uB3R25lhdvUYUQSSi3nBc0RQy+nUNpghLg5w9M1bmStE2KtRXV1XZXSkHcs9hdyhA5NqFXaFroozh7zOVq1dEcmN3JdZzCDayXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmyL3Z1tAEuMNG2iHkpZSy+SVqBDLv6+yGWI/26HnBc=;
 b=m13s1GTylCAsya0FsmrSh6SPlVrPztWB4NqlC/aE7MIE3LCDf2LL2U86gLNjihromkGDzBEaf3RZ+hkuuL049gnuR3/Pa652meg2TNdrdDyaDJvrCfWngGrthvyKh1rS7f6rKifwzC4tpc510gyvqLAJUxzEXx0P2y9TtG7S0+U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 04/11] xen/dt: Move bootfdt functions to xen/bootfdt.h
Date: Tue, 15 Jul 2025 18:10:59 +0200
Message-ID: <20250715161108.141126-5-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DM6PR12MB4233:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a34131-e184-4e29-bf94-08ddc3ba480d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YEC86SyAdIjWwD2dE6gp7DgfQivCJJp9hpk4nJ5QR6GswOwmKT8UKuIlQexH?=
 =?us-ascii?Q?2sjwAzsqjxwXGASKJusCwkRUG2YaTfT5XFicu6TkciNNofTpsC2fKFpFcRH4?=
 =?us-ascii?Q?NaDotLfQIz523mNDpnVFe8y8P62KB69OoAB5bpBVIl7oArwi4EwB6UV3+pyZ?=
 =?us-ascii?Q?YCK1hOWw1HMlrVD/82bNj9g6Vtk31OWjFquLIyfDlBrQJaQLntUPAIseLdUM?=
 =?us-ascii?Q?FP1mPnzzcENejPrahH3bjoKADU2buAU7IoOdFwl+WAVTXvRSvCBkBi3bI240?=
 =?us-ascii?Q?XfNUShi9k2YenQ4bpldFIFxiO2pvDUrCK/GBFatuolBXmKU2QrytRgOGDCnR?=
 =?us-ascii?Q?e+fxCvnARcfmmLNV/cpYdnjL+qhz1/5xWQiukPtqD5cEe7+7PsMmau/1re5N?=
 =?us-ascii?Q?Ge/aHfVuht7MU5k6B8tPF1+NFbNtvzgzVPG1D2cksminKJ4VA6SjJ/QAaRfZ?=
 =?us-ascii?Q?jnkD2Q6ArwgHK6BZfrBY5trMJhZNo3A4YlMa+esRhxzFdDxUfBTdfNWVJknb?=
 =?us-ascii?Q?JhTUn/KRK20ahpiQ2Swd4kg6U+JTQROtQPk3QloWqgr0F4RxYMXA+6nyc7Io?=
 =?us-ascii?Q?9NHfXL9b0WFnMCP9XybiXwzaIpuIgotIyZ9eU4ykRQdOySefq+wPgkp5NtMS?=
 =?us-ascii?Q?+4bmRo1Jo44IHgZK905yDsQuBvGJz7O6SwRBjfxGFEiYIZiOnwgyqxg8NYeQ?=
 =?us-ascii?Q?lbdqatVU3mDxehbPKY1gVntOMzCZJadbIcx+Jrto4EKM/qw6YCNOs67u9nuQ?=
 =?us-ascii?Q?dPvQynmzHScPd4yrZYCmZd3M4bET1jT8930krh357gyFCZcFuVQBw5xBruCv?=
 =?us-ascii?Q?fZRXyBdXEIMUOweJAv5St6kcJ3jNxjzq7AuAHewiiDhbKi4n4xxCkYma2jqM?=
 =?us-ascii?Q?rT9GgrvxcLwaoO7tPyYDEJj5bR8dGWHYd6sMGQx2eSG9j3TWNTw59AgokBek?=
 =?us-ascii?Q?Lg+EeJn+UNR+54tNY+k6IbPyhnl39MfuqsMrkijEdVtaDZQ43Em2bSNEhgwQ?=
 =?us-ascii?Q?51nlZsEW5W3Tej8U9smXKGC4H7lMpJTNAPXl5I2K1QBet4GpD/DBPvtLOPT8?=
 =?us-ascii?Q?anLXR3oBf7lhCmwBd6G8W5DvDb3qIYQ64lTc7tp3buD1HsGEEUiRjdm5qLEW?=
 =?us-ascii?Q?YGFv+dhTPaA364DAaKkOt4Tg/Z7EXcLL/yaI7arp2hB/76nyeVeFltHVu6wb?=
 =?us-ascii?Q?NfDYbaB0fb8s/iQax83B0w+GFy8LJSfoQwBb8d6gShiLlL4qsw5wmIswM83t?=
 =?us-ascii?Q?BjRP4otrco5/1XgFKPZdNdJd1OgduiBcbLpBx1iaEmgU1+cP1KVd7a8BRe5X?=
 =?us-ascii?Q?wnmWjgcSd/G+XhHFN/adyZ2RleIEokBR9i4h3rHMXtFS2XlhQlml4sRRRlN8?=
 =?us-ascii?Q?RUR/1v8nkmkXCqxgYBddWDg7mrKlRI6Q8l11AH2n/n5fI5G5o32emjD9v0ej?=
 =?us-ascii?Q?53p6YA3tdtPS85cUM1E6zJam7yUX4uLBx8x9Ov1/4MbxWOqBsWEakGE6/P38?=
 =?us-ascii?Q?yzykMWouW+teLtzkvDSDBJSrrSoPSmOm3DEC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:39.5257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a34131-e184-4e29-bf94-08ddc3ba480d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233

Part of an unpicking process to extract bootfdt contents independent of bootinfo
to a separate file for x86 to take.

Move functions required for early FDT parsing from device_tree.h and arm's
setup.h onto bootfdt.h

Declaration motion only. Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v7:
  * v6 was misrebased, and dt_read_number()'s refactor was lost. v7 ensures
    it's preserved in the code motion
---
 xen/arch/riscv/cpufeature.c            |   1 +
 xen/arch/riscv/smpboot.c               |   1 +
 xen/common/device-tree/bootfdt.c       |  12 ---
 xen/common/device-tree/device-tree.c   |   1 +
 xen/common/device-tree/static-evtchn.c |   1 +
 xen/common/sched/boot-cpupool.c        |   1 +
 xen/include/xen/bootfdt.h              | 103 +++++++++++++++++++++++++
 xen/include/xen/device_tree.h          |  78 -------------------
 8 files changed, 108 insertions(+), 90 deletions(-)

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
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 08d919aba6..67fe5c3cc3 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -215,18 +215,6 @@ u32 __init device_tree_get_u32(const void *fdt, int node,
     return fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));
 }
 
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
 int __init device_tree_for_each_node(const void *fdt, int node,
                                      device_tree_node_func func,
                                      void *data)
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 7bede20fa6..4ebdb2e52e 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -8,6 +8,7 @@
  */
 
 #include <xen/bitops.h>
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
index ac2a79b59b..a5dfaa5c1d 100644
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
 
@@ -16,8 +19,92 @@
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
+    u64 r = be32_to_cpu(*cell);
+
+    switch ( size )
+    {
+    case 1:
+        break;
+    case 2:
+        r = (r << 32) | be32_to_cpu(cell[1]);
+        break;
+    default:
+        /* Nonsensical size. default to 1 */
+        printk(XENLOG_ERR "dt_read_number(,%d) bad size\n", size);
+        ASSERT_UNREACHABLE();
+        break;
+    };
+
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
@@ -261,4 +348,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
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
index a7cc092d05..8a39a60c54 100644
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
@@ -984,12 +912,6 @@ int dt_map_id(const struct dt_device_node *np, uint32_t id,
 
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


