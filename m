Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F277AE2235
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021107.1397176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgVb-0000Qm-MT; Fri, 20 Jun 2025 18:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021107.1397176; Fri, 20 Jun 2025 18:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgVb-0000OI-Dr; Fri, 20 Jun 2025 18:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1021107;
 Fri, 20 Jun 2025 18:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgVU-000575-8F
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:30:32 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3fe9f29-4e04-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 20:30:30 +0200 (CEST)
Received: from BN8PR03CA0016.namprd03.prod.outlook.com (2603:10b6:408:94::29)
 by DS0PR12MB9057.namprd12.prod.outlook.com (2603:10b6:8:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 18:30:26 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:94:cafe::49) by BN8PR03CA0016.outlook.office365.com
 (2603:10b6:408:94::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:30:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:30:25 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:30:17 -0500
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
X-Inumbo-ID: a3fe9f29-4e04-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXldZLee1suRU5jPqXf4Q+TmB1c8NjCZxFoTPzvG2khV8h9pEOgYp9HGo4cD+kwKWxUegU++mumDigmmifUsSzdnaS+sNAOMV3a4rzroXNAOiAlKaZjR/UHFS1qJTZ+9Gwotr+wOeqB6aPDkhvRhE/lkCyjgOCoR2/zP42iuhOJBryTXPph9OMtdvUlquPFe++B4NuOcSAZ997gJciGakcjsVytBSrUIpber/akBebVZhOL8P3AUc+tAR5PHw3ITSb9qiVYiGn2ZUNrIJmYSgDeVXr7BXDhGQ+nWczVmue62cUA3m8R/54vZ+05hLFMLmzU8Dv+rcGXoJky2xL/CfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27UTwRuwh14+8Le/U5yX2jQE9IYhU3yQMi8KNRacHYY=;
 b=U9QO40nnpnBlbyTGWG/pkeGkv6OMY7gRnvJor38pxq13K1ZUH1foULYL+NJbG9WrzsVxN5jx9/53rqC57LfD/Cr3eQT4vJ1LSGohq3dKH3pEfvUslHe1DmMbjfZfdE9YazAiyo4RHvGfh8NXyqh/ZTaIxSOF4H8ryY4dY3F9izdeRB0TypQX/lKMHFj/OfCey6Mx/WahfW4/aKsA6WuihxRJND5leUfvC/MOHmES1bFS+GSpzDZKgsIuJqba3lo4/tKZfJ31MTC9yuNOttvqhCAkC6FUwFCvmFQ9CGBN4BSvvshZozr4kJfBdhyad+EhIo+eMn2RtqvEwcfmpPfm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27UTwRuwh14+8Le/U5yX2jQE9IYhU3yQMi8KNRacHYY=;
 b=4vgJ11auWFSQYmNt2gXJD6zU64hQL0hgvnIUGFoMaLOC7kjPyKcIXgpbDnE8+Emnbjo3UGMoGtndgkOy1famll9/jIYbCr3bD9Wob9qnD2jb4n8+xxIgs3Vie6zqz48CxX8DI/uJjROc1ALFaiWEAYvxR9aPHqHMGc/DbPZZmBo=
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
Subject: [PATCH v4 06/12] xen/dt: Move bootfdt functions to xen/bootfdt.h
Date: Fri, 20 Jun 2025 20:28:52 +0200
Message-ID: <20250620182859.23378-7-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620182859.23378-1-agarciav@amd.com>
References: <20250620182859.23378-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|DS0PR12MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c131b1-033c-40d4-75ec-08ddb028869e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SQwtzao/b9j9QlAjCf7PwVPQTCuO0eaM+NmOgGu6Q7DEJ/124Kfbf8n9lhOA?=
 =?us-ascii?Q?SrNFUHjb/qgrK2GcBSr92fCRxj18wqMDg6Qw14GdxP7mcV5Ju8tRc1a45oNt?=
 =?us-ascii?Q?S6yaScEaXe4lcy/29YjnZWz5BRh4k4rSs7Zs7XCsvtLe9mWrTDcTJ1U0mOKR?=
 =?us-ascii?Q?RB06YrY/5vtbeMP1MJzE2ASBRG168BmtWx9iucSW3YX9M8JSwbPxuOXrsjXE?=
 =?us-ascii?Q?LTjJuRZ1MoJzf1d9/2Odyt098JZyYZrUURBCsrTTCgKIpzCzJwGZWygE3hxz?=
 =?us-ascii?Q?x7JYMHF/DwLZW7nWQIFPeoAg3MLrf/5k171C/Us0RfcbaCmQqtS391afaQcu?=
 =?us-ascii?Q?pM1yaLkOYRPj5vAlVtVnRJaFoE80LCLnOBOufJQT+v/moJ/sDN0TPH/UoViC?=
 =?us-ascii?Q?KVzK2SywPuePdB+JWphg0KpphdKMXmCR5nIX4u18Hgb+Aj1RVOFCiHR5DKjE?=
 =?us-ascii?Q?CmAXxC5/5i53UKAzXHtmleAUmf2tZGtsszkeyAjTcDnUT9Y0vDJ6IH+H8nqn?=
 =?us-ascii?Q?c531ePIT3k9WfTSByazCEwZ5FKZluhhEUQzmcjy5W/Xuh7fU33Ee44PQWwDh?=
 =?us-ascii?Q?WOaSKNPNh3JZn1epGBwboEBZM92we1X3P6qGmzXDf26v7oHIHbWD2U+kOAio?=
 =?us-ascii?Q?+2e3uMHKeqecDBN1mTXS4dJ24MZgbcy5chaFrM74d4v7qFHaJDJ00JkAxosa?=
 =?us-ascii?Q?j1q+d8wNSbMZttCdAHcYhi0P43y7a8AEfkhTPuYBSxF+H23lDS7Wegq7ySbu?=
 =?us-ascii?Q?R1n4vLbxvqvGkzCCpxOfnlm+TTr6aJ6fdq9pPqMuGqD81clP8hLUAQoKn6tI?=
 =?us-ascii?Q?YPF7cxXm0COTFttUA7sDuk+MWHSCZ7yqmvRt4LpKNkjccE7sQyDNog8jF8/W?=
 =?us-ascii?Q?UYYnvfSw3zpqv07f1VgcdTtVknKqmRJy/MEek8i2n8zLZe2ojdc2rVqEuLPv?=
 =?us-ascii?Q?9oeP+GkTAIpluZgk4Sjv29nsJpxSgSaMWcu/hICCFVxmpEowBypBuryj1Nx0?=
 =?us-ascii?Q?bFeYrxJ0iZ9ReZe5MuvWwIXa9M7hSXqwiVovbQi5n19xOCG6H/BH0bI74mZ0?=
 =?us-ascii?Q?cv+xc+AN53I5q17sCIxqUv5yVfUmVpuORO/PcRJ0y/LnEl0xxHbY3dNM9UDw?=
 =?us-ascii?Q?bNB9t6IQSKhvYTDSOaeeUTPSfGalwoFjOPxA6FFBSeJmpcMDaRv0oT8OQUl7?=
 =?us-ascii?Q?bXt7ZuVPFmNic2lMOLmQmkix5X44LK+Yh/tq+SFfspgykfWCwZDhCADHtS0f?=
 =?us-ascii?Q?fm4AyOaizp95nXG9ZdPiw48vcAjRi9sHCn9tQDAhwb++Z4+NNbx5iyBhDg9c?=
 =?us-ascii?Q?tKDtoEzbmzVysamZUbfXLRDWT3BDLVWzA8detR0zrfciMAqjH6R5b+DGbcQe?=
 =?us-ascii?Q?yM7bW/1YcQ9K4nCWleLVP5PJpvEMPSnObcs13wW/Zb4ZZNlElINJN2PKNTDO?=
 =?us-ascii?Q?7RB1bIIhlSldynAK76qhZSTwszZ3MY/smhiv0mSfulECaY3M3gFXfhaChFeM?=
 =?us-ascii?Q?N+JorQvNHhTS8fEfF3bPIE3ly6z39QhBwW0D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:30:25.9769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c131b1-033c-40d4-75ec-08ddb028869e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9057

Part of an unpicking process to extract bootfdt contents independent of bootinfo
to a separate file for x86 to take.

Move functions required for early FDT parsing from device_tree.h and arm's
setup.h onto bootfdt.h

Declaration motion only. Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Remove bootfdt.h include from device_tree.h
    (move dt_read_paddr and fix up
     static-evtchn.c +
     device-tree.c +
     boot-cpupool.c +
     riscv/smpboot.c +
     riscv/cpufeature.c)
---
 xen/arch/riscv/cpufeature.c            |  1 +
 xen/arch/riscv/smpboot.c               |  1 +
 xen/common/device-tree/device-tree.c   |  1 +
 xen/common/device-tree/static-evtchn.c |  1 +
 xen/common/sched/boot-cpupool.c        |  1 +
 xen/include/xen/bootfdt.h              | 91 ++++++++++++++++++++++++++
 xen/include/xen/device_tree.h          | 66 -------------------
 7 files changed, 96 insertions(+), 66 deletions(-)

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
index 75017e4266..b6d16756fc 100644
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
 
@@ -258,43 +243,6 @@ void intc_dt_preinit(void);
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
@@ -307,14 +255,6 @@ static inline int dt_size_to_cells(int bytes)
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
@@ -949,12 +889,6 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
 
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


