Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A8B06401
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044537.1414699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiG3-0008Ps-L7; Tue, 15 Jul 2025 16:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044537.1414699; Tue, 15 Jul 2025 16:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiG3-0008N9-Ff; Tue, 15 Jul 2025 16:11:55 +0000
Received: by outflank-mailman (input) for mailman id 1044537;
 Tue, 15 Jul 2025 16:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiG1-00067r-SA
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:11:53 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [2a01:111:f403:2409::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69d4acfd-6196-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 18:11:50 +0200 (CEST)
Received: from MW4P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::12)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 16:11:47 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::5) by MW4P220CA0007.outlook.office365.com
 (2603:10b6:303:115::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.30 via Frontend Transport; Tue,
 15 Jul 2025 16:11:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:46 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:45 -0500
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
X-Inumbo-ID: 69d4acfd-6196-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTWD5MVuVHV0eVXaHcQP0gg9uU+MKwaUdzssSr0cvC2A6Kgpr9ccOYoKzLk8PkrfuOIgRs5SHfiph3MvfjhPdOm8dul5beWlfwxryf1IyuV9IjuwrKd0D67Lb7Wz4RFgxLNTd7KuOJtiOt/MfZ2t7hSDf8peH5CYQ4sf1z07Gp/kXhSuSaSNAftJT4vGLSTyOFzJyaLkXFWJPsmu117MVMW3UDWx9bk7ZFX8zm9rAt3EDP7CvIPqeQ0i+jCmn+g/5oBMbNyUs+u6N5TKnqBsGZxr0J1IEcz+Q34IAKvPOS4HiZI+YRUkKAT455w64d51kDxT4rtCxY0s0eEx1vbWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB6ZnUukYGXcHJNYwJCX+hPhi5hoUVNF9lKYMk2ENRQ=;
 b=CGZ2EbKzfoncdmRVuNadmDv+23iuncGezEz2G2uqR+ocKvrZ+EvnumkOYxgx8yp+osE3yFPVV1WdKLrKsEuK3tjPJkzqaJHQPbNNKfsapa5YBxlXgjyxSmZGiph+BGTpNMFsMF4H++kMQguvoRVWQOVIRbHnBcIoaw7W1Wp5i39QTTWzwBIdu9JtTskITxIzzvXGWAQD8GxIO6ZXq0okjN5ieVyurQdSJhTJO5DDQd82flG/zpksejkSkRtIUXz6/4kgUOrm/JQM7F5Rvssr0T+XdHovi3Af1a+nSlVz6HaIPiB/FtR25KDau4Rnqa7zzGiwg4NfQ9gUo87/tooizA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB6ZnUukYGXcHJNYwJCX+hPhi5hoUVNF9lKYMk2ENRQ=;
 b=EYpyrsaCP3Kr1VNW8QXK7BtkKygqTQj8Mrv+Rppm7BY6B1T9iIfackJDiAFkTiHZrXttWd8W2OCWBbiBIYGnZzZfpf54HNAhiI4GhXjGBDxxFj6nbfXbYcM8MtLUfduPK4avkyyRMUj5zd7JTcN02vaX+5Yh4n2/FgBH5Tmt2+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 08/11] xen/dt: Extract helper to map nodes to module kinds
Date: Tue, 15 Jul 2025 18:11:03 +0200
Message-ID: <20250715161108.141126-9-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 470af048-867a-4414-a924-08ddc3ba4c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RWsA1r9jRGOZjp9PlHQCK/VV60FWvuvop0UDSlydfcasMVocmYoHV/UW4VAg?=
 =?us-ascii?Q?w/YrpKT8YbX5PWAQdXCHg0K1xVAfyo4qIxvhY94IGYLpWtUefxRXU6ViwHUP?=
 =?us-ascii?Q?/obPcLU+XM9I+xCi8fM205AgH3i0Y4M0iZSfwy4qI5++lFhF2LWZfHuPYBDi?=
 =?us-ascii?Q?lmOlVlp40dyM/QzxUZ/1ty5GGPkRLfGtazUyXvm5EvFzxDo4GQgZgHqOyld8?=
 =?us-ascii?Q?dlnLscDw+RqQHmf1kuqjpZy27KY8aCjVFW0PfWTd7utSkrhmXKUYDfkQTr6k?=
 =?us-ascii?Q?ZTuZDclIUamFb22fen59W08NME5J0viWXVFrZTbRJ6hPgpNGcoI4Fb8xEbUp?=
 =?us-ascii?Q?un/g+tjleVghvgfXRbAxTIaZLuMw9J4mA141SbZhbY1Yc9wIx/BWspckVZkt?=
 =?us-ascii?Q?z1rPLrOa/l0eM0/LkkFDUlamSDSQT2qMhWoMBmjJBq7OJOeXRss5xE/DZzBz?=
 =?us-ascii?Q?jncVgFtvTO/yQoCB8b+XKYSUcxBlCQ1tkPVwBnoAIJB0SSXvBeJ2x4NOJs9K?=
 =?us-ascii?Q?18cr1ByU3INjhm55nr6121rUq1yb570htGdd4Zo2Q/cX6KjmXRQF5Zg+VwDz?=
 =?us-ascii?Q?UYlIDZYVeX/bwSAyjrCTtqBd2PW4c03FvjnzgVFA54iPW5DhFvrkFeHmJsH1?=
 =?us-ascii?Q?WtI09gB0pHQnZHGLj7s/Oy+96MPYGOPsZPkcEHM4sAKb4iUrR7Y8PcKUc9XF?=
 =?us-ascii?Q?6xlWZRbClTP+GrGj0pyeZZI5QRDDL5aRrcHs04UeAxTc/kC6Y6ghPUCRFPie?=
 =?us-ascii?Q?mhItOirJJZn3aQxyKLdQ5tYbsAtMPaGRUOgHq+dIe3dvQhqOUkB4AyYzCsO2?=
 =?us-ascii?Q?2K7ZFwJccjQIqnoF6/dBdJFDZOwD3gKqBFbkrQWttc/ONE/25ppOpoBz8EZm?=
 =?us-ascii?Q?mXWtheWpgyeaJkUROqt+wg1C4KH6j3nm+p9dEgJoiPu1vroUngVPj7+nNBNz?=
 =?us-ascii?Q?qHfNwdmdYqbhWxdAJGM5gXcayCh+lRn5mkztI9Qu6swOhpsQAQzmDZIN9QQA?=
 =?us-ascii?Q?V+OnXF4JHA3bdVs+etEB0JAoz1pD3mx2w81h/9AkqHXq6xSl5ePMnkjQ+Q2v?=
 =?us-ascii?Q?6dq7hyvIP7muF+DPlj6YfJGQZSCFA3xRuR3oqYjn1AaDdGTWkSiQCnEF4TmE?=
 =?us-ascii?Q?R38nde5SYunM7tQrNRa2Uf5f1ZOTH0+X3PK5QpN4LCtPe9foMjEsGCf+XiSG?=
 =?us-ascii?Q?txL2YeKzDCD2kBCd1/jf1N8UtYXeFQ0CFJ2ZGS2WCG+soqunkZJlns+OseUt?=
 =?us-ascii?Q?icu9l7ABgup/FIVOZ2aD8wrEyX09T8kJks93hVkUUBT80CdwUG01sKo8dooD?=
 =?us-ascii?Q?9Urc8ZUDwCikJSHclRsaIUlDl+xWSXcMWR+px2bIvOybfbkH/ROhJdteZujE?=
 =?us-ascii?Q?2LEHJMpKAuMetDcHN7sZhrGe9jOG1njh5mm1MuAtCRFecOtzrqn5iE4vPb/Y?=
 =?us-ascii?Q?zWmNjuLw1sByqz8+40QSk8WXASEm32VCVe0DAdxu+uSXzFc/vS3Ra8dpJB0+?=
 =?us-ascii?Q?1deFgotF0VdSXXRlq79jXMvl8K+IttDglf4Z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:46.9365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 470af048-867a-4414-a924-08ddc3ba4c78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470

This will be required later by x86 code in order to do early identification
of boot modules when booting off a DTB.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device-tree/bootfdt.c      | 18 ++++++++++++++++++
 xen/common/device-tree/bootinfo-fdt.c | 16 +---------------
 xen/include/xen/bootfdt.h             |  7 +++++++
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 84520eed30..7ef158dd7a 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -5,6 +5,24 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/unaligned.h>
 
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
 void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
                                 uint32_t size_cells, paddr_t *start,
                                 paddr_t *size)
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index a0e20d91af..6499b57960 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -237,21 +237,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
 
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
index b22d7b39c2..7cee3e811a 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -157,4 +157,11 @@ u32 device_tree_get_u32(const void *fdt, int node,
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


