Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29CB0CE8A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051782.1420270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WG-0007Z7-Qn; Tue, 22 Jul 2025 00:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051782.1420270; Tue, 22 Jul 2025 00:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WG-0007Tw-MW; Tue, 22 Jul 2025 00:06:08 +0000
Received: by outflank-mailman (input) for mailman id 1051782;
 Tue, 22 Jul 2025 00:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0WE-0005aW-Sx
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:06:06 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20605.outbound.protection.outlook.com
 [2a01:111:f403:2409::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a92119c3-668f-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 02:06:06 +0200 (CEST)
Received: from BN8PR15CA0044.namprd15.prod.outlook.com (2603:10b6:408:80::21)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:05:59 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:80:cafe::52) by BN8PR15CA0044.outlook.office365.com
 (2603:10b6:408:80::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:05:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:59 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:57 -0500
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
X-Inumbo-ID: a92119c3-668f-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Us6m6B/HVR7INDA5fI94XPwfflNRuI/KVkKa4KIBo4JHNDZWSRfM3149IpIBUVDv5EAUSDxxmkNNublVtpO/UXsd3QSAaGx6ROi1OhkU6PGj3g1KsUcvIknjDFFA3ul8mSx+d2LCBbIiTmh98i0hpzMaurqUAkdzi2Fwb2eHBzoSzLMOifqcS6gyn1wWsmP3p442Im6JKhEkItRvKngy93pJ6z0cRl/6EoYHaNZtqU4Yx3fmLFok31Rni3AuVFiPnksGzZB61FpCptZaD2oLEhY5m8xoZSS3EIp2tscUBxyi/1xySHJWaCL5HsBh6q1r4YMTiXhkgwYCTIVZjqJGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fHjMn8lHWgcHqriNe2JjLS4lpBIsgJ/0Gm5CwwS0AA=;
 b=j9wpaBNMRztqjz8AXBOukO76H5QU3D7Z7EdGMVEKJXZu1xMaKxHw2115xBHjkzsntR5MkIox54AWTJ3/M3hwdoMBu6D+2fsKhwyrBc7PLYZbvDjhx0drOKj65AwPvfcrsnkHO9uQXN6gO1/VQ+cGf1FMo+D2TLxFi8zDCtuU/ryU71EjUnLqPvtdl+3+cGMVu+tFcShi+2IeADO5VarvZidiyxaT4mX27pXertRwNeqOZqymCv9wX1GQzqZyfLfSg/OrsLAaThXRhnwIy4em0jbw+M+b+UABxfITLmsORNdgfQu8FF+8jZFgt0FSs15U1UT4EeQU4Hy14CtK87sn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fHjMn8lHWgcHqriNe2JjLS4lpBIsgJ/0Gm5CwwS0AA=;
 b=1WSDHv9c+rcl6Q6vTlAnrItJYleJBLtWJnLJWjEyu5NjmvbeiFemiilPMBUq6znnhd4atxMN1+QwjBwa8wdS+q3psyKCqE78Ll3MVFtSlqCwkiL+T7Yq+goaePaGs/oeG9xejcsN5KjlTaWFYib/cCGGcod0Bz8k/O5vq8zSkqo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v8 08/11] xen/dt: Extract helper to map nodes to module kinds
Date: Tue, 22 Jul 2025 02:05:20 +0200
Message-ID: <20250722000525.7247-9-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a175454-2108-4902-7a77-08ddc8b389cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s/WiHgRR8q8DZAC9I6PtZYlv0ETYP0/EAYaff6yvn8w1J7Q6id7voz+QLCZ8?=
 =?us-ascii?Q?b5C9sSxNsvPGNNQ5Q2DP63gIZ0iDLf8/3hltwEotWbsLF3qjtb7zzwyZ5QcX?=
 =?us-ascii?Q?Xea/ZZM0YiWoGKpRRLssQ8s86X+EDHevL7jOLSEHMdTINtGyi4KcUtDVWU0a?=
 =?us-ascii?Q?bK3ZYsKEdclpyO206GI1hWOmImywtWqARhJIP4m0bB+cu0WRLtED+IUplM8Q?=
 =?us-ascii?Q?hAU7ssSrkS+2B/Pk6QDCs1F4qciiAyajjQsksm8C7zzx8U3NxgXoaAi/Uj0e?=
 =?us-ascii?Q?W9tYJn0dOT7qU69Pk750mb90QWMmJZC/IMjHfwxJt2TBstESGsQNCDoAUhBb?=
 =?us-ascii?Q?Xc/9Kz3ju9kpF15zuy8vDu2kKG5bkfFeds7X7NAASLbXOaqFnph/TJdglLFb?=
 =?us-ascii?Q?lE0qolDfpNy1qL51hr85x1+8bY5cpG60HBTRN+lzORGLEEy2JoWbzq7VdlZt?=
 =?us-ascii?Q?aXe6lvISBb2CC2bc4rhFdVqu1Z+oRs05bgYg88LJdISgkVCkry2E+UMfZpW2?=
 =?us-ascii?Q?ozvOlW1OCkyVlRZstTztz55/qiGofnX9aSgVOkmMNOPXWsNnHZAsjpwNOFVe?=
 =?us-ascii?Q?6nXUjJKrLSn+Qe+TQuVzs7MLF9QZ/BOf5arPpDRYahokiZRvT8OTeDKgJjW/?=
 =?us-ascii?Q?2+iUbeBoFWEawmZHmQD9DmZp8ZmutEQZPBv0F2yxIAxyBO7Iglu1PqN775aU?=
 =?us-ascii?Q?yXt3nfMVopmv34dW0dGoZ+ZrCMRfbvjRRc4agHFC/T8Y7MMVDRJP0fFZwENv?=
 =?us-ascii?Q?sTEbwKaEY1WWZxhtWBUOtLyCgy3Qz4ig70ODAXxjLXxtZ0raBwAJm7RPOz2+?=
 =?us-ascii?Q?tGBjWS8QnD7+/YC/y9HSm+C+S+aCHKZ8rmm5ao6nLKCCNjTlxXVNUXnMwG7D?=
 =?us-ascii?Q?36woONdPYjILFnGsvNTrgyqmou8k9IJ1bkLo3Ie4FznlELlHptFLS/aDLAz1?=
 =?us-ascii?Q?zehj7PwUq4my4IRM8Oy/AjH3O+FiJ8NrxX6jwtu5oo2zqmE80pcJWO8Xjq3+?=
 =?us-ascii?Q?qVIcQHe142qs6vT1y2R7IetIuiFVI4zJpFb0B4dfF0i0b52W5f87G7jrkcZ6?=
 =?us-ascii?Q?sdRbRutswF/g4Kh/Is+2JdiOFY7ua6l+S5/E5ZTPfMd7BB2gE8DOdXD9AvNR?=
 =?us-ascii?Q?Q4e31LktvJlcLZHOoNSiXcbfcTI79Xg47qOdpDUxGGsrtd2JYKgdFH2s7Nd6?=
 =?us-ascii?Q?XpSCoDFNdxVB1G+TfZZke1tsP3R1thKvqN8dxkJ5y0OYISPGhhbLyE/P20JT?=
 =?us-ascii?Q?8+R6kpgbaFhNi3NzA5T2F/zrBw1b2G5/h+YYEHoSyzLIsL1l+08lBVjUApkX?=
 =?us-ascii?Q?q9cNzByny1ImqdHxhvHiSTP+AmdUtz6AfOoak7ng0LJ1uOQ0Li6pKbXSrOY7?=
 =?us-ascii?Q?/Fw3ZXHuDevkUw2IfNUSpQKlUmWgnsFi5yQVK0FrGNwWme+0MkboRZ2Fc9av?=
 =?us-ascii?Q?wS8azwlk34Wm1Rps+ShRfh4YMzLd1kkzytLGS0k9czo4+wuC/ArbqxZSO7MP?=
 =?us-ascii?Q?VyvBy6jjmbX0XqZGts4HRpo8JXY6FDobPfsz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:59.2619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a175454-2108-4902-7a77-08ddc8b389cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483

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
index 84520eed30..7c790b9a4d 100644
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
+        return BOOTMOD_XSM_POLICY;
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
index 5111fc9436..2aa94b91a4 100644
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
-        kind = BOOTMOD_XSM_POLICY;
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
index 5719bbfb93..6cf05b5cdd 100644
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


