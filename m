Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDCB0CE90
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051774.1420211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W6-0005r9-HA; Tue, 22 Jul 2025 00:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051774.1420211; Tue, 22 Jul 2025 00:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W6-0005p5-D2; Tue, 22 Jul 2025 00:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1051774;
 Tue, 22 Jul 2025 00:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0W4-0005aW-Ee
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:05:56 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20615.outbound.protection.outlook.com
 [2a01:111:f403:2408::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a261a0a4-668f-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 02:05:54 +0200 (CEST)
Received: from BN9P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::12)
 by CY3PR12MB9631.namprd12.prod.outlook.com (2603:10b6:930:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Tue, 22 Jul
 2025 00:05:51 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::9a) by BN9P220CA0007.outlook.office365.com
 (2603:10b6:408:13e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:05:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:51 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:48 -0500
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
X-Inumbo-ID: a261a0a4-668f-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAA3hPBQ3zMD0OWaQYwwR//jfj2XLkDOCJZsjN3QR/O597JE42ELJ5ax+dpqUa5zijUL1OcHiVwCvgo0km5JF9dqZmyfVqYjYslZFPR/nuWLEvONBGfdWyfoHMi8JlO7LP1p/JNa+x++yXyNcH30EMIrDG0Y79aCZWKOSbaB1j+Zn5Mbeb06Dd4BkbzSqRniDh79p9L858sGIV//dn1FwAeVKK8CnJeT9FPZMQ6wkQ6HHj5qlJZlFg/TOk8gS/nD2Qthx7n/sNgb0wsqZv1YO3Oq9rAyjVvKVNxDhxjNuXSBVURF1HlXTDgY1ZFre9uDkHGYFsPWw9kYjH9j3Oh5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE2U3OieLRAp19RylJfkfzh2oa2S8x64+UWGht0xC4c=;
 b=muYSG0BfDPO20xaOmpvPa17a568LZfVXT4F12G6kxOLm6nFKcq+Gbm3kB0vCoZkFkGCiQDqvynbC+8JI0rLLWwIKOoe/tkAgUGafPvxVJliCUy9S3UW2FbDHxFqkmch18MQKFkDC+lwuT/OP6y4WeS5mfpB6nnH4KmhQOX4reTjtYMX6wnmEFLpI0+rWGhyb8V23piyI9l83NvZbBgtGtrZj5fU1UYbwVrI5JXihxdpNnJwbV1djzn2wXLn0atwBIHCWthOVyrRePYitUvseDPH4NW1avsBo7pC0LBpkzVw4OY//0mcsKArRNjiJmnlBt/VIo4G657wqZPjIkgyPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE2U3OieLRAp19RylJfkfzh2oa2S8x64+UWGht0xC4c=;
 b=lmkyW8Ridyz4PpBZDATjjDxNgkfXE/NTBZGX7X06+0ZY5rUSt2UnX0m/Ido95/I0eaQyL3Z8PifjSDVi7/Kio/sdKMlcTQAz4srejX02T+coLXfEvxz9WG9wXRuELP+gbUKbovKjfEYf9uQRnXol90mSVc1I3T5WLXhs423/1xY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>
Subject: [PATCH v8 04/11] xen/dt: Move bootfdt functions to xen/bootfdt.h
Date: Tue, 22 Jul 2025 02:05:16 +0200
Message-ID: <20250722000525.7247-5-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|CY3PR12MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: 718ce7f1-0585-4449-171a-08ddc8b38517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Tg9OHeHuPPir0Tegq40f/p5OwUpJMOhdq12rcluPXtt4rSA3fRa7KDc5AYG?=
 =?us-ascii?Q?Z4f8T+vTxB1mDYIBdfLx/d3FIVPhlcwVw0usoPLSfUW7aEyHh493X6mbQrKn?=
 =?us-ascii?Q?U9ksQLFX9Tz7WZ0q5lfc3ORwrEoTp0cggmP72eLyhcGIUIAa9yceuVz63AEX?=
 =?us-ascii?Q?kBLprZdKGcScP2dG8Obv0+MuQ/+DPxXmVrO2myran9zjRCMR0mpvHyovpnee?=
 =?us-ascii?Q?MsU4dPN20LBhcb4JfrdiwwIXtDx0ABSXnu+sOzlSiBXbPqN0HUySMfNYd7Fl?=
 =?us-ascii?Q?g8PxQnXJaI8GqpLtjK/Rh6z/VZYSmre2sn+zmI4L9C1cxRLGKJ4HU6zoui89?=
 =?us-ascii?Q?FP4EtpTJcMf8g2BJ99mD2d5dvLGgyVbVTQU2QmzfvGvMgvNV4vTtf2YYZaJe?=
 =?us-ascii?Q?nnojsvH9VSEkutNCREKX8bpa00F8qSQa8e79SXj3SD3k+6C5JOUrBUvXcbER?=
 =?us-ascii?Q?7ovJCsDLkecKM5vOrDWLGy1qQU33QTMu9de0yn6uAYtajZ8Je/xgjCeMLKrf?=
 =?us-ascii?Q?OtFIN7CxL7GwuGh0M+pOeRn8bC+qyMTRfsQ2/gSyCaoagLWddSohJoNuLBJ2?=
 =?us-ascii?Q?PQSTVgcr+3/PzjBcEdAcFayo7CIdsW66D1fAMVhLu/ny8F70CEhO+CftwjD6?=
 =?us-ascii?Q?J1ozPhApvdbsfMjwmtRVcuftUorPqqvGDx44T2pHOuiYY7olkzinR7BNMCSM?=
 =?us-ascii?Q?jLs9zFON86ThLCn5P7TcYwD3iPzLElbuon6nC77Q35C3HSuwXSMMJ/AdpOst?=
 =?us-ascii?Q?LM2qFmSM9iHbJGS2+8Z/zbTW6XHdl1hnbZe4bKQmZVrAllphFAuukC82973L?=
 =?us-ascii?Q?46XdgBgB5dO3k/JFlZVmNTQmNguNUFy98KNGNGOJlNUrfV9TTsSfUuTxPkYn?=
 =?us-ascii?Q?dLoBcfY/SQqXD5weD9zke9ezPBBeY3Hn2siK1LmowtqHeD8L05BAx7qhpFPw?=
 =?us-ascii?Q?+oR4oZwFgMcGmbu37f9gE6v81jocqwzmA3GNgk+gaJMBm6vsZv+t64sEIKLu?=
 =?us-ascii?Q?MUbJuUpvtNXsh+/++ftCuhZnQqOVeUY5X+FqQOhSQSgt85me5B+F4W8lL/GN?=
 =?us-ascii?Q?JCQJFGIZ8g+qtqSfgKu/yXUriQx1axP+Rbh4lrYyS5jgqlWuDkb5hDFMCsVu?=
 =?us-ascii?Q?khRo3oJQAeoxk9pAmwrLYNOCXMZZQQd++EUw6Gq0pM2z84Ryqo63jcQBXbMy?=
 =?us-ascii?Q?xtSDTK7vNJFmtwUxhrcrXLmTiBfpgJpQFISzq2qGAK4W5Kgtfs8iVsp+kXPQ?=
 =?us-ascii?Q?daCUUTr9FM4hlvjhQTG+m/V3L0eH7FO2oOz53ADt81YUvO+j4b2YCL/8+CZn?=
 =?us-ascii?Q?xr0KRCnSevRtNyittTySvtd7c/NgEJJcLTfx2NmPwaNi46bO1RdaPLIcxKyZ?=
 =?us-ascii?Q?QepUGGzajv8Z6i+3nI9vo5KIraNMGMvGx82upQIHdlKctyrubOfJYy/08ALF?=
 =?us-ascii?Q?FSPa84OyL8DBEY+xtc0NLeP+Z4+fi4S4f2G+nkAJFOXc1Li32KH3je0a6udD?=
 =?us-ascii?Q?q+2uKsBVgzDtAD5Ip1kAPYSMHfs/MjwcXU9D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:51.3632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 718ce7f1-0585-4449-171a-08ddc8b38517
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9631

Part of an unpicking process to extract bootfdt contents independent of bootinfo
to a separate file for x86 to take.

Move functions required for early FDT parsing from device_tree.h and arm's
setup.h onto bootfdt.h

Declaration motion only. Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com> # riscv
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
index 01f475510e..48ecbfd600 100644
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
index 9c2b954121..93c5c357b1 100644
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


