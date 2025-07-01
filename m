Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED2AEF5C1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029526.1403338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgP-0004X0-03; Tue, 01 Jul 2025 10:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029526.1403338; Tue, 01 Jul 2025 10:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgO-0004Qf-Rg; Tue, 01 Jul 2025 10:57:48 +0000
Received: by outflank-mailman (input) for mailman id 1029526;
 Tue, 01 Jul 2025 10:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lih=ZO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWYgM-0002T2-F2
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:57:46 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2416::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36a81716-566a-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 12:57:44 +0200 (CEST)
Received: from BL0PR02CA0132.namprd02.prod.outlook.com (2603:10b6:208:35::37)
 by IA1PR12MB8223.namprd12.prod.outlook.com (2603:10b6:208:3f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 10:57:40 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::95) by BL0PR02CA0132.outlook.office365.com
 (2603:10b6:208:35::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 10:57:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 10:57:39 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 05:57:37 -0500
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
X-Inumbo-ID: 36a81716-566a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qh9u1Jwc4C3bRBh1iF3TQjHfXijiDa1nMnlpWecYcfqlbgKMHeHFYqodO2KlURTMEjYqIJ72vt9APFNAclmIaEVAJYCSLJO37ONBZ09GlmoVOb8gWNJ1lZJz0QT6pzQiIQduNsF6VdhxRAJeltdpZOGWDx4DjdBLojbnw3CwshVUtHEGgrtC1RJp40DxfHOv1Je1RWHJprPsdWL/tH9BjUFdY4opD+jROdfeMAY6xF8dTSqWwZkJ949xyzkP3nmfPhqNaZ+rZnzc5XeW6JPvolOwItw6dQF8t50/GnbW5Sdlf3IvcZHCooTdOMgE/8DNyHndPg9y7mH7bBhmf5663g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zd2eubkDW8FKsjdHvMt4efYEdWC1FtbTeDT9SBTH9xo=;
 b=PSOMX9r5FhOT7V5/b54TQ0REaycwbySda3urzVaS2ApHTwHy5DQXXZ3eu3zbbIoIKooI/Qtx7oaeKH5OVLQSzZUHLeBc9oQ5nV3n5oPC+H+R090znCRtcftOK7PmZuy7DhnL6RdPoxjah0CmW3zcn9N1IWcIqPkW64HnKAsd7egeZ2wUjClGry5kLhM2LsbZVFa6rFQjde1sXTPb4hXVt7fEWJ7RocJg3qxvaWwgxmxCB1WpS//66x7b3RyZ050VVueHC8SccBReA2GwDeNlvPPxNN0v0GxW2Es78Yi2uC/lUCn0D2fMOZTFYmVKxq0x33AFMBKEVskLrV06zfH0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd2eubkDW8FKsjdHvMt4efYEdWC1FtbTeDT9SBTH9xo=;
 b=yPzEKXaMrboGRl6SRFy13O6ioy7hUK8SkxWQycrsFsJAyiYKKCGd5fjCunEEzXFvYOfMam2HxAacgrpTgGcxD/VR/TM53kzCTqS09IgsV+901bCoq+TjPKFO3GNCs//1haG2BJpil+VfOE7JpW4xaOGOPKtGMgmHUJ2hlBdpHz8=
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
Subject: [PATCH v5 07/10] xen/dt: Extract helper to map nodes to module kinds
Date: Tue, 1 Jul 2025 12:57:01 +0200
Message-ID: <20250701105706.86133-8-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|IA1PR12MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: a52b7ae1-fb37-4843-b829-08ddb88e18d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i27pIkfvseXJHNxF5qByAGYJA5fuwQSUFkN7fwbuBdNqmji720BdYKhE0x8m?=
 =?us-ascii?Q?K9scY8+1YECBDcf05D06UjngWpQsNOziD1fhq7JAY5kAy3iexv+eXew4LsUr?=
 =?us-ascii?Q?N1cmLCB2qS++lmpH8HSexp6YhRYGoPKBdrJAcF3s5ePrIWIK1qyuf8w8F3AR?=
 =?us-ascii?Q?hvo2iQqyc7Gyps7jZ5sGzuI3USGd/JM+0dgts5QmwzJuzeaBSVaWMAy7Jquq?=
 =?us-ascii?Q?5j/0U1FQ2iQeX9VNs3xmdPhZsrAZ0NJ6kh9HxF/CBY4Lg0jVSVGOUvEOb2uD?=
 =?us-ascii?Q?qEsgBHhL4hPYCL1LMhSTskYOkAkHlRqS6MnrVYjrldUZftOxNIG6ARsZ9i5l?=
 =?us-ascii?Q?TLlWwXRcXh0S3iyNHQ7+CTSpyD9nOFWU89Xh2/wv/bsj2JBgAdaCb9u+Jwj5?=
 =?us-ascii?Q?l0fzopQNAfMB5hTEsb/0EShoj0qcdUk5PZl+jJjkigOxN/DXB06DjjTdaGaW?=
 =?us-ascii?Q?94BlGras+yVPHLnXUBr61swO1QADyveJfRjJpd0fNjUSw91ztECOYSdqQxwl?=
 =?us-ascii?Q?RI1Gcup0BwOp+th8JeVcvv7UeQ0c92jN0nXlBu41u4pkwupHmdqC2WJ+0qde?=
 =?us-ascii?Q?hOMBeIeQ5p1GSNVXcICr/fQ/s/y1bdGqxx9QcqC4kQPAD4JKNL/irS/0L34d?=
 =?us-ascii?Q?kMR4VICMDAV787JJnqM2j7AE7oXCPAiu2sYuusm8e5vMA8clIRWfIpO6ekiu?=
 =?us-ascii?Q?fnZIY2/CtSyVEK/acn9jx/DAWnISKy2MGtpgnKdLI103PYZq31tiufJm6J6h?=
 =?us-ascii?Q?vcxTiorjk2uO9X2fDvVhdNIkDDhUtvLa9s6mQ8/ciEcw/NXHpNuCdKvGp/g6?=
 =?us-ascii?Q?arHUZLC8KavXNHA2SRYKQRfqCUBRLoG+QTLAxTGV2199qkUJQ90dy4CD1Zqt?=
 =?us-ascii?Q?vnYDMvh/x8V85BUbtZs/zU/hREyJyTC59TZwparKQWeQJtghDEXgbzZQqe1J?=
 =?us-ascii?Q?hY0bpDUglDpBz27arqnaoC8szPFL01FA2i079qnLalR9ZcNnC4eBWV9Y5Vhr?=
 =?us-ascii?Q?MBJHNPQmW5MmeqpgYshjRR5TD0zIgfWrSZNVcq/5lxGW+nFgQ0xAUuhNDPNg?=
 =?us-ascii?Q?3/8kkTBTAnEV+MJQQ+Bi/RnpYbs4RnJMZTg3M06EFPeb8mZ+JyMya/pjCplZ?=
 =?us-ascii?Q?BF3XPba41NQSUIdr5da6w3svh/bW1T7uD4U1n7U40h+ry28+0eIwFi8G0KOp?=
 =?us-ascii?Q?oG6SvAm5gx4rwEUZVOj7CAa03onQ4ygeFKN1a4+MdnnDmSbchH629FuorhXq?=
 =?us-ascii?Q?ejXHANY8uBPu+G0MGEFAx0LENJe+mBPdoBw7ymeVkFJfN2e9VhveVQv4IbEv?=
 =?us-ascii?Q?0i6gGCtEVu/+xIdAh2YhKIkNe8eAqYFMGh7+ympUL7NHlHVDFl/zXTPqE8AC?=
 =?us-ascii?Q?6Th7A+8sjPZhEwluWxjJfeGCxzMZLrBfz+dThXOwzqxribn4/sHXZzIe6j2g?=
 =?us-ascii?Q?ktGdVpa/L1+jxv1Hoj9ZPUTwBQm9F1PKaZNM3Zh9+rGrUFuCHsuHq7C+eHfI?=
 =?us-ascii?Q?lGJGwYLlfFx2vw9fvCozDWl+6jvpFve0XzLy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:57:39.7524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52b7ae1-fb37-4843-b829-08ddb88e18d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8223

This will be required later by x86 code in order to do early identification
of boot modules when booting off a DTB.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device-tree/bootfdt.c      | 18 ++++++++++++++++++
 xen/common/device-tree/bootinfo-fdt.c | 16 +---------------
 xen/include/xen/bootfdt.h             |  7 +++++++
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 0d8d9ea357..8218c0a10b 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -4,6 +4,24 @@
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
 
+boot_module_kind __init fdt_node_to_kind(const void *fdt, int node)
+{
+    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
+         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
+        return BOOTMOD_KERNEL;
+    if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
+         fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
+        return BOOTMOD_RAMDISK;
+    if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
+        return BOOTMOD_XSM;
+    if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
+        return BOOTMOD_GUEST_DTB;
+    if ( fdt_node_check_compatible(fdt, node, "multiboot,microcode") == 0 )
+        return BOOTMOD_MICROCODE;
+
+    return BOOTMOD_UNKNOWN;
+}
+
 u32 __init device_tree_get_u32(const void *fdt, int node,
                                const char *prop_name, u32 dflt)
 {
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index 16036472f3..9b426c0a98 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -236,21 +236,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
 
     cell = (const __be32 *)prop->data;
     device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-
-    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
-         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
-        kind = BOOTMOD_KERNEL;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
-              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
-        kind = BOOTMOD_RAMDISK;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
-        kind = BOOTMOD_XSM;
-    else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
-        kind = BOOTMOD_GUEST_DTB;
-    else if ( fdt_node_check_compatible(fdt, node, "multiboot,microcode") == 0 )
-        kind = BOOTMOD_MICROCODE;
-    else
-        kind = BOOTMOD_UNKNOWN;
+    kind = fdt_node_to_kind(fdt, node);
 
     /**
      * Guess the kind of these first two unknowns respectively:
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index ad6b11cb6d..bc5fc995b0 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -143,4 +143,11 @@ u32 device_tree_get_u32(const void *fdt, int node,
 void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
                          uint32_t size_cells, paddr_t *start, paddr_t *size);
 
+/*
+ * Probe an FDT node thought to be a boot module to identify its kind.
+ *
+ * If correctly identified, returns the detected kind, otherwise BOOTMOD_UNKNOWN
+ */
+boot_module_kind fdt_node_to_kind(const void *fdt, int node);
+
 #endif /* XEN_BOOTFDT_H */
-- 
2.43.0


