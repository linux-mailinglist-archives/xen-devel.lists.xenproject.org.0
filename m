Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1AAD910D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014508.1392650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6D0-0007Cs-NM; Fri, 13 Jun 2025 15:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014508.1392650; Fri, 13 Jun 2025 15:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6D0-0007BC-Ig; Fri, 13 Jun 2025 15:20:46 +0000
Received: by outflank-mailman (input) for mailman id 1014508;
 Fri, 13 Jun 2025 15:20:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ69S-0000Kb-MV
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:17:06 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2406::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76ae4f95-4869-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:17:06 +0200 (CEST)
Received: from DS7PR03CA0167.namprd03.prod.outlook.com (2603:10b6:5:3b2::22)
 by SJ5PPF183341E5B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 13 Jun
 2025 15:16:57 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::75) by DS7PR03CA0167.outlook.office365.com
 (2603:10b6:5:3b2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 13 Jun 2025 15:16:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:56 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:54 -0500
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
X-Inumbo-ID: 76ae4f95-4869-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ye/oR4xH/xWMBPeQ3DXqE+9k6HWMzi+oUL/LEMGCO05eTzDjBMa8zb18OuDMuoiGu7LZN2maPvVobGz50f4OoukePw0wAg8iwnd+c0ifWSgKL8i50WdYQ2Zp/Oh39+LXmQPZT9zaaV51wBXvaM3GSx0+h1juMy+Pu3sGevl0zgYZWnZe5XpfbCEYS3LHgFFm5d82kdLjC/DXxSDRPCKTYbgWAOiDWMVEQvS/4ALkJIgXGA7XY8ohELFfrYxByI0gq+8N0/f9sfXjopebWwOSpYMDNoFXIBN7uzxAJaVQvcqYejBJOhWuF+aJNy5TXX2+W117gR00ACL0GBW0WDnXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uob/oSE+6bN0bWhXyItFJeG5g7WMt2WYss/Pqm5LoVA=;
 b=Qeto5HKOuSbN9jAozaz33lJmHZhjI+F8ftXbjSlrvvyvvd4JT3cqL4eDnBeF00gqYTziwY0MmnVmvq1L5rQqxPWQatoB+g6DJj0bL9rDzS3XwK43iUPJVI0gQAa/yy6IirGo4LarGkGyxT8ZLLtgDJPRQVm/E2WmLeRNXUgADUPo3b4aKSnQWyg4TLi3y2eMoCisXQW2PY3r16iAbY1r3FHu9MB5Xvhqq/FXauyNXfRxQe9agxo2EeAsEgqdrLXzmogVUeKBROnNcQYloTGX6+oZmLyDVMIyeOGB4pB8l2RN4b6gpour5VUSz7YB7HaY58YJK0rUx9IKdQ8sGt35ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uob/oSE+6bN0bWhXyItFJeG5g7WMt2WYss/Pqm5LoVA=;
 b=IUo5OAdGR2wXB7JH5P6kulUGTgVXA+SQTaI/W9TPBQX+eYcWkWkwuJ8w7J7JfHuPlHmimvIagcb58OVgBLv4QLTvtzrxNGSOvH3JPENcYcFgj0EZV/Xk7YVUArLcETMRK+6G+aVHC3scKuIaCLbyMQP4Yh7mnkRWaFkk1amL4yQ=
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
Subject: [PATCH v3 11/14] xen/dt: Extract helper to map nodes to module kinds
Date: Fri, 13 Jun 2025 17:13:20 +0200
Message-ID: <20250613151612.754222-12-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|SJ5PPF183341E5B:EE_
X-MS-Office365-Filtering-Correlation-Id: beaba439-c982-43ca-0404-08ddaa8d5600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eMmTHWD0oQnRe6XWomp4a4zo4+JU13kacCpx+7nqQnyAXzNXFkakaWEOtFAO?=
 =?us-ascii?Q?okUEQrLusK16fgrOht9v4V1vpaxe+k6eUSX5fqsOwCqRPVlLXOaXl7cOKYYS?=
 =?us-ascii?Q?8TSp41VIuN4oFtFFzxue+zEuhC3vlSJNAo+U+3gyOms9QNbN5qT5YPe31pn5?=
 =?us-ascii?Q?WSK6lJ4QZ8XUPjJZrZS89slO9XsHFGL7JfPH+Q8N6oyoxIKHv57GIQ7ZTBSn?=
 =?us-ascii?Q?JnlsjaPxl0u4L2WBwScAsp4x4KVNM3oOD+s6325IZNUBGOdofEvHXmrU70eD?=
 =?us-ascii?Q?jjELIW7ssbmF7vh8rRXCwm1BCHW9HLxDElL1Py5nmL8CvyQY4Reg50/FSXEA?=
 =?us-ascii?Q?tEkh1jDxFDT1QrTrQOdF9J0PNuh6FT07umvSMFrVspk0UWsRlhIUHNYzybct?=
 =?us-ascii?Q?ly5Ob8v+meTTGDnaj7W072fa+OX7pS3PLTRDPsA1olEaQzjIzMOE/kwNQbfD?=
 =?us-ascii?Q?gSV2jTPLNRonqff5tFa1QpxneSiwuMRP2XKhgGP8/IJvgha8HxhowOFti9hn?=
 =?us-ascii?Q?ddlQlptrp8P20WCrnJxBbHLiDjYJsc7cdDYQgDbdlL4hOXyDepnLDwYXSlUE?=
 =?us-ascii?Q?EUKpvDuW1r93sVq2rMEk99jGpB+DzICZ7CkxIipXM0V+ruQNb1roWqGKTWJ0?=
 =?us-ascii?Q?g1J6csKgVQTITvKTtx0x7eo7tzZGjgr9UzSCEqf3SFa53IRM7jwUBYB2pGsj?=
 =?us-ascii?Q?uVuoCozeZZH2KqcK+Ifu6WuwGZxKMNIHHVahDA5tRxwq/+552pi7L0a5vCDZ?=
 =?us-ascii?Q?Me4Cr3n4UHy7SjsMGh2KYQEs2/7/hWhtqcwPDh+U2FC9kHIrr8k6Frt37JPU?=
 =?us-ascii?Q?45HpLbxYcjAWuE+t4kcQpAFRMeACj9eQ0+s+ZMK2DX4C3g7GMsB/itdEqtVi?=
 =?us-ascii?Q?W01gXEtSSJCyG71P0G2qT+T2wYzGvdRoRmkrjRuIjyydQE6Yg0n60g7bvKv7?=
 =?us-ascii?Q?vKfg2BhVnAnEYgX+AL+5GzXPgDBrJ7qNISe2fqUX8M6SLOXovVHS9bULnKn8?=
 =?us-ascii?Q?NIaU9HE/nGz3NJSQ721XLxOiUoGPvEO32DggMBl7yyUm3XWc1KyO7vF/aDic?=
 =?us-ascii?Q?a1wvYLx61Shq4tHpM6kJ8KUOtzMdjhwYsMsv6eoVRaM7YAukQHECwdzlx2hU?=
 =?us-ascii?Q?qbLdUYl9Mt5qCI9d8V3ilvVoPocG7x+cem8s1c/F+uRN31ubu0jOZJ/ei+9x?=
 =?us-ascii?Q?Z9okCt9myi4Z5RTjBVge6fmOZjgyQRn5hVF3eRRXL+CfSaFG62bOWwvhrpg+?=
 =?us-ascii?Q?bSNltK5MKMBgCbOhr0BRgyi3D+7fJLTOGOPmalBz/R/J/AMa8ra0uc4k+rG0?=
 =?us-ascii?Q?DW/5Gb5sf7h2rt44FP6Qof89blFL7NB842fJyH2lsrTegrP8XeyMhWojvytQ?=
 =?us-ascii?Q?xRzjiNw+toboxXFTzR8Ncmd4qByOj2BZ88DVCcNRuj4S0JkiyURLrPLO0ImE?=
 =?us-ascii?Q?UDbz+5DkcombKAHDyea2g5I9a+o6qFhphW/Ru48sZGLSnwVt0BNjeIam6ADw?=
 =?us-ascii?Q?dDv8dC5skMCtfdUQdcdqSo9/jgeyHQzGaP2j?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:56.5614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beaba439-c982-43ca-0404-08ddaa8d5600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183341E5B

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
index 373b548f20..8d3c1dc5ff 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -114,4 +114,11 @@ u32 device_tree_get_u32(const void *fdt, int node,
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


