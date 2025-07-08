Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7313AFD61C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037037.1409754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCji-0007qo-4C; Tue, 08 Jul 2025 18:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037037.1409754; Tue, 08 Jul 2025 18:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjh-0007l8-Q7; Tue, 08 Jul 2025 18:08:09 +0000
Received: by outflank-mailman (input) for mailman id 1037037;
 Tue, 08 Jul 2025 18:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjf-0005Uq-De
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:08:07 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2413::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e23c76b-5c26-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:08:05 +0200 (CEST)
Received: from BYAPR06CA0005.namprd06.prod.outlook.com (2603:10b6:a03:d4::18)
 by LV3PR12MB9233.namprd12.prod.outlook.com (2603:10b6:408:194::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 18:08:02 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::4a) by BYAPR06CA0005.outlook.office365.com
 (2603:10b6:a03:d4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:08:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:08:01 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:07:58 -0500
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
X-Inumbo-ID: 7e23c76b-5c26-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yotbBMtqe8m/ZKnko263HXYtCyZ32ENs0m0dYsJbbxMMvI4filXmK9g58CvAhyEDsgdTs8jx4yeYitJEndO3kWQA5q9mrNo/qLUau/6mGKpbldMwP3q8TcQUs83fKVvEoipLanHINRy7QCH+20I6tbfyUpb5MNqCT0l2DMkiqH05NYZYlQLJS5m8aWE4LACLkUCtxEmDx4mZNtY4NnSydlJv/oETHK24I8opX65zTKyxIlEBuAfyl7UqSADenu3qLPyve67z+Oc3DPoXt3ooPExm2iUiCZRmEgxtBhNJMVJvaESQp+GHgOt2ReV1bjl/7DmRWTy6kJH9jIAobTmCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuSp+bKQrE/XEUMr5CDqREjTnOdAk7uiSalviiZKreU=;
 b=q+CQzFgQNUSAkLAD0j+3ze/QTj+JIVMeKiahyOmWhRpXXcEbZTPcIxSl/zjC9+Ny3nC5SV9tpM7oAko6NaYFXxAi116RIvG5C5lTpZ4FpYZjQq1S87olsOmzwOZAVIcUryOZUSt9KuPXr0XxCoHn37zvlaTo+S/H7jz9Y9PkCXj402s9Q3OocmxJEHCvqiAcGPfPCzSRWcaUobz7c5KrUsdKGirAFr1pfpRKrgbsH540CtRoa3GlUA23y/w6FBUFTyMr1T86fPlxWKsY5gT2aJBLZse7vqKPJufwPmBSYRubBa1O9yNXgZcQPRhT1jdZWHn1fnUV+EsI7QltXQuf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuSp+bKQrE/XEUMr5CDqREjTnOdAk7uiSalviiZKreU=;
 b=nQUlN+Np9P0zqSxbynaFcqsDN1wo8aRknQ538tTagiByrpxCQix9LMlfKGkQcua2Lfa1QeusAg2GGDP2nSxjCAoxzynASUyzn3+2L4glV+Zru83lWWhuY15+5gKvgsBW2twM/nIg0NVFWTU0k3swsU4diG0jU6RewEi+VtGZAh0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 08/11] xen/dt: Extract helper to map nodes to module kinds
Date: Tue, 8 Jul 2025 20:07:17 +0200
Message-ID: <20250708180721.2338036-9-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|LV3PR12MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b9ddbd-fabe-436a-5f81-08ddbe4a60d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+yeNCSCbmitpyzIAIk9242es3wU+IJyhxehGX+j9TDDw/F/XNg6jEAkCE+Ha?=
 =?us-ascii?Q?uTZ7qX0In2ctZi9LGf1xq/awmLZRzFH1yIjOQS64OHMh84zq43uWl1lVynAS?=
 =?us-ascii?Q?1+RUKPNi6H0+/di/P2DoW6WLKrQmc8fD42FY7AzP0Sf0+0UvKvbFVGI4i96o?=
 =?us-ascii?Q?5N3mKofSTnfJjZ7u4B9RLid1RzgBpJHD7k6hB/xBGiF1M3S3jnRfSvzFNwjE?=
 =?us-ascii?Q?GQVRiV6UJFp7a4MnvOfK5ETonvetvstiDyS+QpqV4AR8QddZOkY2PMZMgKSk?=
 =?us-ascii?Q?z3Y0fKM8AA8d8LJJbzMq8zoJSB4SgwDZnqTqcev+AgpmxxJYCuygwKpIN70T?=
 =?us-ascii?Q?nCVviPv424aqS+jlot4/+8InPI8K7/oJCcib+vgLV7pyO2bYu7J8O5zomz86?=
 =?us-ascii?Q?MFT/bzO8bjohJkZDjuOBWZG8gC+ufOT1CPBZiFNYDkUrxnv2cANsUmv6yIE0?=
 =?us-ascii?Q?QYCuyZLISdi5Ru/FuJNRlrQOKgDBE3uXfw8gtAskCkEQTCLPnRyiYA5iaA9o?=
 =?us-ascii?Q?KBIwsibk1M4AfaUzyKfviWGtTJri/tN867A2TtWdmAjLXBRXMLTjY9++en4p?=
 =?us-ascii?Q?dv9wWtEjXCs/IQfXMljUeoLhFmX48bjZ1HayjmVwx8kOme88GSvGHTilRD84?=
 =?us-ascii?Q?SGn3D1fSlqMPabrim0Llb7c6fJOVPvJ/47S+vOhOhaXlkiWmxU6Jvnszg7tS?=
 =?us-ascii?Q?ePD86WqMr1wLe77fReBatG5mC641gllCQDjUhykElmTQDBdaKEpTiQtwMK5X?=
 =?us-ascii?Q?m8I+7zoSHmyTfnlkU5lKu//cYZm3yxhYaZI4vxQt8SmJwRCQRQDMQhjXYSUF?=
 =?us-ascii?Q?JEDJ+M+XkbWG1Ixm70GappXYZVoqSEv39uzTKPP1I90WJiFYCT6lx72rgtOJ?=
 =?us-ascii?Q?q+g+FUYu/S30Qo6y2+wKbBMTCnCQQDWts70J+035JANaLptU+vJ3SVTJhT3x?=
 =?us-ascii?Q?gXE9Ll/WlnKU3GXR1KtUInsPTs/vlqN1XwHHqjFVHcP7v+MlTRwsXiuaiFeN?=
 =?us-ascii?Q?tyQ4JQ7jHBgPH74diKifXR2WY77RjUv4t5B/SqiQVttdu0NnaeJ86Y73Orx5?=
 =?us-ascii?Q?OMvexSQFDAgis09oVVaBD6kTaOJLe2BDTywuflP5zzdTSZWzXchv98TVlOuV?=
 =?us-ascii?Q?CKSUMixOLUIEjfIl9QoRLKuTAeu6g6G6W4MFL1RmY/h6+8xji8bp3wv46nAu?=
 =?us-ascii?Q?Dd8eklcMUgs9TX5IEIL9PDdtrhsqFe9AHA2VzYzXPiTOQ6KSF++D1pVDG6d3?=
 =?us-ascii?Q?xWLIgI+KsNX/sHfzWF07xgYWgPThi4YhZTrE1dw8Iz+LExjCUpDI7NGFDUKy?=
 =?us-ascii?Q?tNCvxoCDmOxFqK0NfjdN95VpUxO4QuTmmL8X2/0/HZDg1OmuNUoHWAKnRlxS?=
 =?us-ascii?Q?YaLUQ3UHYk1llx5SFzaebnnTu5qy6GxKGcZjv7xiT02zwLmkmQ93D7Y5FgR5?=
 =?us-ascii?Q?5o8FhlLh12BFC4Ikr8BCOhyLypBf9cO9Z3+zUnUGeOdLuPn5O1RVSsIBMPCb?=
 =?us-ascii?Q?qaqG+tkpGpPbQ9N6Wv9a70ZziXH840HggDYA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:08:01.6793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b9ddbd-fabe-436a-5f81-08ddbe4a60d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9233

From: Alejandro Vallejo <agarciav@amd.com>

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
index b886f18027..dc6b7005e3 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -145,4 +145,11 @@ u32 device_tree_get_u32(const void *fdt, int node,
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


