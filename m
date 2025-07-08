Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12876AFD61D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037034.1409747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjh-0007kB-Js; Tue, 08 Jul 2025 18:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037034.1409747; Tue, 08 Jul 2025 18:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjh-0007fv-CD; Tue, 08 Jul 2025 18:08:09 +0000
Received: by outflank-mailman (input) for mailman id 1037034;
 Tue, 08 Jul 2025 18:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCje-0006FB-CA
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:08:06 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20623.outbound.protection.outlook.com
 [2a01:111:f403:2406::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e48fda3-5c26-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 20:08:05 +0200 (CEST)
Received: from PH7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::15)
 by SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 18:07:54 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::52) by PH7P222CA0004.outlook.office365.com
 (2603:10b6:510:33a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:07:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:07:53 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:07:49 -0500
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
X-Inumbo-ID: 7e48fda3-5c26-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhdX18zE0NCUPkAzyzHWZpxvzfRcdIs0E4fRaIdhVYda7hZcOsunMQR0byQq4U71kiNbzpLjS/lzvL9ltcoG9scsgngRO6MLiGCOU0DGn2AUi5TmO0iiS5LbpW+ndoRB8HPw8Ypd5U6gZKEgILO/pYRd0MYxOKLdSsQM15hOA3VjpAb7++zNhbG1/eL56rz91AUtU2swbG5JASKG2VCuTrq0xVh3XmG8c55U0bozLVTp/25pvnmqWvIm2RYjB44Xn+u60KAn+gJdRYypoNj3LKo172/NSYleRKSbZ0mbpTPKHJezQGoQVynL8jEAPxvnQAAXm1907nhrtTtdp5UtGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2yi5GpSBJHPZZ8SCTN0qLV+ryEhgObEm/ZPjs2/PGU=;
 b=IgPf8Gef1LMIBvyS9EGLN4/UKW+wFw6mtIEKEHRKCegdbUCBpujLvAvF15lzgbyWdncIXopZvMF5Pl34kImIVu0HbZjTFy8rONZ0yuuruQvnLB9mUXpjJPgek+Ox2sCRALRM2iCSiB++W+78PHPzF+27Yvku9J+6YOfKBPfs+r3pvqJUKKYiIH+dZAZJNGFCkiMiJLBCWo8eeDh3soOCXWRA89hLIhcJw8SsMYxGfpljDhV/hqQ9OMq1aZXI0dvUl+IoAan86zfrHPNma81geri9iSwD677Nux7g79QmcD3qJKTxyDUb8GtgIEsgY11K3OwEaNj2nU/0hgCXhw3V2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2yi5GpSBJHPZZ8SCTN0qLV+ryEhgObEm/ZPjs2/PGU=;
 b=xhRSIYx/pmD6Q0MECC38rDQYQluLDSwPOEyXcuOpl4JkMNRFYP4vUiHkAxmgaHgsSuh7qhMe5MIk4wKbKejvowaZJPbWOcIAaHbjma5ArujdlOxeqqZe3GMx+tH9P/FIGXPN3guZO1zU+x3/OEIOvCSZeMB84+34jQL+jNDBjRo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 05/11] xen/dt: Move bootfdt functions to xen/bootfdt.h
Date: Tue, 8 Jul 2025 20:07:14 +0200
Message-ID: <20250708180721.2338036-6-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SA3PR12MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 85895286-33ab-4f17-afe2-08ddbe4a5c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CTDjGr/0n/4+N8GKM71/lbsBtiJXX65AomK+dyE1WWTwwpplphcsJYvcrzrx?=
 =?us-ascii?Q?izZ6A5Gd6FrQ6gTgVDMyoGR2bSEWHtrJ6KO7M+qcotkmZGB5b0849vZEIw6k?=
 =?us-ascii?Q?nnUv+3813sTqaFp0XAY6FgCVFKzOacd9S5GxO54Zwv2pv0zqD8hXMBAKbVoM?=
 =?us-ascii?Q?qT25ImkREvfu8l00crIDN2ZNlm+d5/FekeKKMKU0E1+E7+pYQNYDzy1DsPCR?=
 =?us-ascii?Q?aoRRCppa0C7RaBo1cFQpeu9aT8mgvF26sq2I72RwQDz3k+qYrBAphJjXoKW9?=
 =?us-ascii?Q?GiAtNFrHNxJA8sZmy3UIhX31QTRBsZrWqSVWY0LYep8gKTZoaQ4D5E4yVAt0?=
 =?us-ascii?Q?vmrqntTipKQJB+s34YZn8qRF0i3vhtn4C7npGOIb7e/1iMJUvXBX9qxesVsP?=
 =?us-ascii?Q?y1wTH4kQMDb2JYUgGGggoBLGPfjPYFmQTs5d6ZmUXElSs9tqM0lauGLrz4bn?=
 =?us-ascii?Q?rmz+IH9tRQSQ98+Rs7tIwaOp/eCwkTsqOh/H58g2Qphw5SEgTzeOTWgWv9ip?=
 =?us-ascii?Q?VcSTKwyI0MMmf+Sa6Cq04SSsyTPArG50OndnbYhf46i387LkNL3sk7VyQv0V?=
 =?us-ascii?Q?AmZ3BM+BFLEPW+f4/EfKupu+T21z0wTd2K7FKe0i/ucu/XmyD3rLs6rXzsH5?=
 =?us-ascii?Q?gFVD68c4vheFfUk+VeiwUgwdW7ANJ+jespylMNPEkdv2J2pnm+ZUYQB5A4Dr?=
 =?us-ascii?Q?k/JgL1kKkWBtauULaywT+u6KFk+hLoti5t3iAHbGANIZUwGzH/Ht4ZN+GuCQ?=
 =?us-ascii?Q?b89r721dnLU5IEEpJ5BuRY/A/NBMqpSaY9qS8VPGNGFbVH9PPo/Hfa2tm9WE?=
 =?us-ascii?Q?q/183ZXO1FfogAi3PVyIlCMQkKFvUDP4wkf36GqO+29gXMtbmWiYFpiJDaz9?=
 =?us-ascii?Q?KM1oaM8whpyzO0lLaz5pLVS4iikJbHKkM4xSUSzsO+VlvJ7diLs4Lk3CBrUa?=
 =?us-ascii?Q?17Dg2gutSHBCYV/xRP+/alCxql2Lv8zoDRY7fjz2rrJjYzc+VHxf8Rc9VX5W?=
 =?us-ascii?Q?1DArD3z9gLR/EzWpoZT6LJ2BTs0rnWE+mx2/A05mlU4BnJZKwKYmU/ERdPf0?=
 =?us-ascii?Q?LrJ7AgGCxfWomjIUoYN+64CNG18IjSOuHSXszTspAl3hyRNFgKypfjMzCBNp?=
 =?us-ascii?Q?O1iklbAhgZTmvpG8FFTfyO3pUi5AhWj7XVbaxaKrInK5/97Nc/kh6f7/zejB?=
 =?us-ascii?Q?zPbASU9hMfGO88wnm8CCP05Lav/jA3i4EWsyzbZLxTOCxT0HX6M+HH78WIEQ?=
 =?us-ascii?Q?QvilhIQtZU9JakQlM3Oqvxo0q9BZioMJj86vUaPAaLOZU9vGVbKXHNNx0qFp?=
 =?us-ascii?Q?QTYmgGUpXv0NcPm8KGSnutrj482O/fTIiC+PZDf0R6hwgwk5ybPkaoCeLiZz?=
 =?us-ascii?Q?domQT8UoFv7joGMXpJAKiOFj1QEMlo+BHdP3phwyToQkoKLpos/UM8H7v+8s?=
 =?us-ascii?Q?eeJn6QklEi3XGu6iUsXwD+seMGhkhSVEESGFjf3tIPuil7DjZl8cfDWY7HKd?=
 =?us-ascii?Q?By3Md4b8YDCdTKR0alclK6MFauk+VHu5YJhR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:07:53.9739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85895286-33ab-4f17-afe2-08ddbe4a5c39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8761

From: Alejandro Vallejo <agarciav@amd.com>

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
index 65ba818e1a..6cf6c1317c 100644
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
@@ -261,4 +336,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
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


