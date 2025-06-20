Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29DBAE2264
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021174.1397225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSggE-000543-U4; Fri, 20 Jun 2025 18:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021174.1397225; Fri, 20 Jun 2025 18:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSggE-00051a-PG; Fri, 20 Jun 2025 18:41:38 +0000
Received: by outflank-mailman (input) for mailman id 1021174;
 Fri, 20 Jun 2025 18:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgVo-00057I-K3
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:30:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2417::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b10e5d76-4e04-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 20:30:51 +0200 (CEST)
Received: from BL6PEPF00016417.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:5) by SA5PPF7F0CA3746.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 20 Jun
 2025 18:30:48 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2a01:111:f403:c803::2) by BL6PEPF00016417.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:30:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:30:47 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:30:42 -0500
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
X-Inumbo-ID: b10e5d76-4e04-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yt7F4NUrK2PgTV2Ogp6d5jWn56vnSYITZGWqe+s4xbIGfj5+jKpQGNOJxRUKM1MPtDvtYskyPRWonaOWzMxm6HYCqyLWsNm4f4/9nQWTdgyEpW2C7lQK9/SCZy53/ubMf5Ntagxq2We60GxoRxnkPSEM7mlWmgHEa6+fzybC4/nLCnzWoMLBkY0AJJ20ywjP0B22sZUrSd+avvgknfGXpSLo9b2W4e5UO60JbR1kAuyXxEgfYVzGC0hTUuRofeemWqxbISbRam6zP3ME5HveN4A41HvKhgWWFOGXQWAAg/3hHzgIRq+t4NTPWIO67hASS+UZNa7P3YJdniV0Q9Gvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zd2eubkDW8FKsjdHvMt4efYEdWC1FtbTeDT9SBTH9xo=;
 b=f2S/4OLuR6h5Le3rnxbw+eaXkzJg0CYjMpWOn2y1LXnzV9R7DPfl0aNFGMyqIp3KrfUMuYzZd9SKC5zmtqMs4uJBIJo8BVMfo2fH+2VDxTLTPnj1Y6c/HeTdQjE8qTBTuU91HbAFNkrPNzpVXI10sfzTLN7lc+46RlXG2HqSF1Allmtr16Xgki/L5of/ctLEzvKvUXkhUvH+ALNoZhMDjsc2vEHYyCP9IafQ67D8C0l/ruKcktdYuAXylBXnP2vjeHDl6DZRg+14UTFSfbPAMoRXsBhjARxz3vXgd9HDy7DiaYQjPvsaMzFLt1PR84zJYPcPM01t5gSGfsVAmsaI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd2eubkDW8FKsjdHvMt4efYEdWC1FtbTeDT9SBTH9xo=;
 b=HvwJiDg6PS+XYyVDiC8oSW8nNY4y/6MEc54gweh7JoqQDLAjvAutA/CuhDIKxGB178MT6POS1gkWB133eCsHvSoAq0XWyJ7DgALZzeXdLIol5e4ljlBFHBs36NU23DMU0a77kynNwHxP3sVg1M1nF7VqcJIps9DES0G2Aphtt6A=
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
Subject: [PATCH v4 09/12] xen/dt: Extract helper to map nodes to module kinds
Date: Fri, 20 Jun 2025 20:28:55 +0200
Message-ID: <20250620182859.23378-10-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|SA5PPF7F0CA3746:EE_
X-MS-Office365-Filtering-Correlation-Id: c98714fb-3854-458a-ceba-08ddb0289390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kAn1nGtAdoV1lEH9OrbMqZt2G8nHN4YmUg/E4+43ldQqmMiQ72nUzR+FKCO9?=
 =?us-ascii?Q?4p2ztTubI8CryB8Yyjt89YUfAXoKqZohbhlByAh5CuyR2B2MrVjIYALLOkfb?=
 =?us-ascii?Q?sEQbXHck4GCUOgZ6uaaZgfY85fVGG/lmZbWOHBM+FOJBE/bt/JXgKA0m1JsW?=
 =?us-ascii?Q?tmm5JniB4YGJWRYKXyq31D6eJr9KAvUvggoIR1y1MDtq0OHDVD1jHvh0Dt4m?=
 =?us-ascii?Q?Mw0DsGJNw0Xg8lzREo4hvOGb29Q5X9mlr8eKNVF9/BZY8MsKp2Raz/7Bg9+J?=
 =?us-ascii?Q?L4k6/Yu7SKDh0UTYbV6mFC3cMuQMSm81XUSMPgjeIaPPBkqUU+e/LWra8pf5?=
 =?us-ascii?Q?ddd7iGM3JeJ1EAQfLQEXVOvYquoJBjx3Pqxm3I0B6wZkB1MtYodTZ3obS3ga?=
 =?us-ascii?Q?gm9/yuYgK9kepOXABWz+/bbkr4whNgwAgzW31RehpRJojspP57ADj3Icb1SL?=
 =?us-ascii?Q?IWWKqJ5u6dhfQl7Eql8ID8PMYKC2k50O4vnFjlNW0mUdGpeaW1JcKx/wIE8G?=
 =?us-ascii?Q?4c/dwIM9ND4aaUgu7MjzhHgVRBEWw3W1PCHY1nEOcqy3QWFtdtThKC5PzkzL?=
 =?us-ascii?Q?C7Dt2ewqfe7T7/op6+GZ/5NUIXMnHRKMFC8eGfyOcPDIvtpjjeDNbW/w7BlM?=
 =?us-ascii?Q?exs4hayYSfanmGhaonyzwVSdvt1thFxeTFDo6uJSEXI7Gy0do2MbJubuUSCf?=
 =?us-ascii?Q?Jatq6dO62VUX0oO5goXzASMAmShACKvhnOuEgC7+yGAaRGE8ZJGGNhTWoZsI?=
 =?us-ascii?Q?lxP90B5lq7WgaW6Wl8cOIq3g3nIq7YcWN2RmtRVoUD4mD5Wx6etrEtkvv+th?=
 =?us-ascii?Q?bbyG5RHKW4BP4JQmKBjJEcIWphw4dSyjLsw4Ys++2Nk0s9it921GngVvNEIh?=
 =?us-ascii?Q?5YDVL4HMIvSmdFEnWIjgRpAQHDJPKuF6tYjhuQZx4jEXu6w0H2xBArSVyYny?=
 =?us-ascii?Q?beDKIvPoEYyLGsLeXGFYiu8x/mt0hx0klh49yXHIY/xqE+qTPXj8oLwMCdkm?=
 =?us-ascii?Q?qVzlu5OmQux7F+UQXsWiiR68KrP2WjaBu0KBegnMD2lkdlkT7lIEPAv6FIya?=
 =?us-ascii?Q?JL9MFq16odjU9eoY36xDuDpFwRhgd16coAIzvjAbMALtqEVdYixyYBpSP9af?=
 =?us-ascii?Q?HJW37+GNtNK5iLCPfvW08gjWTFiMJ+aSaOV9PvoxDOxY6RFDWwVwG3rQTXDw?=
 =?us-ascii?Q?unpHdlsbXuQD7X7j+jrMrIGrqTRK/X1wsnjZRVU/Ycd6Vh+wM1JuGXfTPW1p?=
 =?us-ascii?Q?uF6C21W/zCuynHqBZnt3RXN8zK+UZhfSU8qW60RPfll0FowCdlESXVLBFV5I?=
 =?us-ascii?Q?OLuyQKWBY2DrFaEvcn00HywbLZ0lD2rnA3CPCEVIzJ8mAaf4ueddfPG+iqE+?=
 =?us-ascii?Q?qvglx+hXMSoGIock53ORojAV2ftuaV4nYuGVZzQUUJN6QAIW2m+qCOfjtftc?=
 =?us-ascii?Q?sryycK/gf0Y1UNoRdRPu2qoU3j61LB34JpQQh8qoSbzKZRlp/1BHehjSLpPJ?=
 =?us-ascii?Q?l0jBgQCyIqpxjARsryK0XTuxSFvU/GpeIM0W?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:30:47.6984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c98714fb-3854-458a-ceba-08ddb0289390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7F0CA3746

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


