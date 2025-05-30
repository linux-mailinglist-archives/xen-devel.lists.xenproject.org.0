Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9906AC8D59
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000785.1381008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyZZ-0005oM-Br; Fri, 30 May 2025 12:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000785.1381008; Fri, 30 May 2025 12:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyZZ-0005mx-90; Fri, 30 May 2025 12:10:53 +0000
Received: by outflank-mailman (input) for mailman id 1000785;
 Fri, 30 May 2025 12:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySj-00076q-3b
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:49 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20609.outbound.protection.outlook.com
 [2a01:111:f403:240a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21ae17a8-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:45 +0200 (CEST)
Received: from CH2PR15CA0017.namprd15.prod.outlook.com (2603:10b6:610:51::27)
 by PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 12:03:38 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::a9) by CH2PR15CA0017.outlook.office365.com
 (2603:10b6:610:51::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Fri,
 30 May 2025 12:03:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:38 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:36 -0500
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
X-Inumbo-ID: 21ae17a8-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+Tg5zBvbDHeHFt92o1fipbo6/XdcyoigoXuPNjs6yI0wbA8G2XC6HrBRxyUsv3RQIG6rBpDJvb9L3f328bUvNnzlW//ov2j3mIMzIV12o1kB2PhZm772YzIjyqGtIHbhmuy/GguGOegL78lTvURzDU/rpJZBLrRN8pctOGPM5iI2EWa1lfEn33WTCKoQ7ci864EZPJv6VFg1CSwDUiuWMakAdvvWSW0ZvcSc7SklYnbbnLkUFQaKkc1tJk3Ij6BQk48Ryqv9cc+5/9742hiyuuGtJTRx7kPlBbIcNp5VZ6paJJXPx3fT1LwIb6F5C2n0c9j91Pa+VYCXeu2hauTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFb4p1kDcRnAri++z0uQsOLZ3FGqifI7+PMLo97XTlo=;
 b=aRAeX7lmHv1rnK4AUGKRgrUJJaRnDB2ua3f9bglLc4KFjbY02XakreVtbfZ+Pqhkjgsfr/JPs/p1JnaimwjmBAhW+PsrMejKDfQT+M1rvh7f/cLYsQbwha5clWno4KVyjmttHk/I16szWGPWFO7JeCD78NYnsCvOzlpqyi04EehtYn7/9KFccX72uA2wM76w+RdDTV7zrAt6eAEI7JRy66Twvkf5GFUFWU9qkTpAF5UiVjK+lHNReI2tSyP1hLPTMtRd+vwUIZ7CFGVMUKYGZ4D07LP1oJetXvWIOWb7lHF8/JRkfH8BPm9E+H4ji4bsBuOckSTF+m/AmbyhlCu7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFb4p1kDcRnAri++z0uQsOLZ3FGqifI7+PMLo97XTlo=;
 b=fkEmoMHEdD8bPR8Tm+aZxzxl7EuansOM47+zFnbXjFfU43BVCn2Ceh5nVFOUGrGBMMLdW8SsrHhsm28M8opwrKaPunXQ5JLLfLjFf0l4/NK5ycgeOHaXMyEHpb5kHCvCtLhKORKRDIVo1jqsz3sAQDrrLJy/NhJQ+U3G2IFpyFw=
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
Subject: [PATCH 16/19] xen/dt: Extract helper to map nodes to module kinds
Date: Fri, 30 May 2025 14:02:24 +0200
Message-ID: <20250530120242.39398-17-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: d690abd3-dfa5-47ff-1d66-08dd9f7202ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sYsRH4V0DjcsSNik7Y0WgE2sz6POYt1d5P0IwZ79QBx0mUupSgB0fp6gmFSX?=
 =?us-ascii?Q?hGCMpfbJqqTbZxflt5tvsr4d7guZyUOasrBxiUlrRLZckJkaEUQsQ96yLN7Z?=
 =?us-ascii?Q?98y4qpGL1BlKHrUf5xGx85Mkhvw6dRBEh2CqCZAzCvOHSYrWtAhh42/Y6AHF?=
 =?us-ascii?Q?q/GdxZHipIDZBXgryltWPxgA8AXbw29h9swepMP8Yf42FPgLg5aI2yHh6BvG?=
 =?us-ascii?Q?8/nzIOQ1rtjlzQU77VS01hdNMUDsImWJ9/PfMhmpRVDWhtrnUXO+u9WK5tMn?=
 =?us-ascii?Q?D3vGqueBY8r7CLiE8Rlz/f897y1fYLue0d1JMyeLEx8N/u7PoLD9sDy9ARKn?=
 =?us-ascii?Q?PpMRE1e/qX227Mn7/mZyd3i5SiNIRsG10zt82l2cjfsk6Ns5cKgPg+PM2y4Y?=
 =?us-ascii?Q?0uuuzJiNXu7ZZz2ZmlB2Ky7h7AelfvxZf0GQfLOz7vfYtJE6eQPJAWe3S1x9?=
 =?us-ascii?Q?+eR5RZbB64wW1/busf/j4Nrc69E4SUvLZqL2MJJ836UcB9mFHlTx4ygbS7lC?=
 =?us-ascii?Q?/Snd/DKN643k21UpPxd1s7yKFCgr3fekHeTFMdm8I+LncvzjLVnZL6kQqsRs?=
 =?us-ascii?Q?uqhmYP0V8T9EHVcUnfh+cU3hN7La3FlAdkyVc+DE7YFdy0qmyKCOOaegonQ6?=
 =?us-ascii?Q?Tckd1DueGxGTeAbFxr/FPdLmhNu61evYVfJHX8mKCpoBAYgL41ff7tKyX1m5?=
 =?us-ascii?Q?4dUwUzVc8RHaG1JdfNBfJ5M9B83sMfqNsvBbO7PeCnPLT8JCqrPgsTfVEF1e?=
 =?us-ascii?Q?9cqkGB+qv+kFsLas1fcwzbDrDN4ZPA8WEp1rtCZ2nXEpd08ctwbhboV4Uz94?=
 =?us-ascii?Q?3vpT0ps2IQzjj6wsa9gObAwmpoCjeuz3Y9Efj+FSe/Whuyls/dA/C6ek1+2S?=
 =?us-ascii?Q?n134c4B9LxzUjhHq1Ui+oG7AevRGWxGYO4sLdEAvS8VyAS0csj4hQYPUA+Rr?=
 =?us-ascii?Q?WMbjlBSSC4MRttlYgRytNRiqRi0DIQeHsNDjs32mDM4BBXtMKangf8KG7LlR?=
 =?us-ascii?Q?DYPvrkkV6K46fOq1PCufaGxisI2zzZ+NhZLmwuhN5KL7S5bLk8pjKw6Z1zRI?=
 =?us-ascii?Q?aK4NA+6VUdsb66rOzTOVgk789rrJGI022qu6dvEmdtn/kzhoKDhexsWxCdME?=
 =?us-ascii?Q?YXyQHFOUDER0y953Ae1XyoYXZuP7dPa+zjvH7wG8VdhV+VkSLJ/bIO2YolSI?=
 =?us-ascii?Q?Fw2fZX4G6Tbc4Sa4X7i0H0tVonBAXXr8nCs+u+TLPvKnfqEVFpQsIcn2/mjM?=
 =?us-ascii?Q?MWg2AQeOjfDWMsw/rHGAAjhwQLi1Bx31KnVvnejIIQB81uijCSyoq+9sYmlI?=
 =?us-ascii?Q?q3MAnlj6kImeJJEVFfM3GzgoSI6aAYZ7OUYDroergF/RGNlgBNOTVKI5y+JG?=
 =?us-ascii?Q?Jb3XaUgLlnSFuvggpzx5yB4O5ZuczVEMBnj2CuRuKZaBcZ0jc1uYDcfUzj4A?=
 =?us-ascii?Q?HNrp+Cu9FnMq/4SVRKiIljzTpmTMZ+N+U5LS+n+1U4/5AtaPrLj3t+/rE+H0?=
 =?us-ascii?Q?AQa20KLQ4tilgrG4V2+42IksUtUch3q6hGMm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:38.0193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d690abd3-dfa5-47ff-1d66-08dd9f7202ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998

This will be required later by x86 code in order to do early identification
of boot modules when booting off a DTB.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/device-tree/bootfdt.c      | 16 ++++++++++++++++
 xen/common/device-tree/bootinfo-fdt.c | 14 +-------------
 xen/include/xen/bootfdt.h             |  7 +++++++
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 5decf17faf..2dda7a9d19 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -4,6 +4,22 @@
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
 
+bootmodule_kind __init fdt_node_to_kind(const void *fdt, int node)
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
+
+    return BOOTMOD_UNKNOWN;
+}
+
 uint32_t __init device_tree_get_u32(const void *fdt, int node,
                                     const char *prop_name, uint32_t dflt)
 {
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index 736f877616..dc399bbf61 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -239,19 +239,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
 
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
-    else
-        kind = BOOTMOD_UNKNOWN;
+    kind = fdt_node_to_kind(fdt, node);
 
     /**
      * Guess the kind of these first two unknowns respectively:
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 766956e102..7bc6209986 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -102,4 +102,11 @@ uint32_t device_tree_get_u32(const void *fdt, int node,
 void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
                          uint32_t size_cells, paddr_t *start, paddr_t *size);
 
+/*
+ * Probe an FDT node thought to be a boot module to identify its kind.
+ *
+ * If correctly identified, returns the detected kind, otherwise BOOTMOD_UNKNOWN
+ */
+bootmodule_kind fdt_node_to_kind(const void *fdt, int node);
+
 #endif /* XEN_BOOTFDT_H */
-- 
2.43.0


