Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F7BD1DD4
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 09:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141790.1475958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DFp-0004Ty-E0; Mon, 13 Oct 2025 07:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141790.1475958; Mon, 13 Oct 2025 07:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DFp-0004SW-A9; Mon, 13 Oct 2025 07:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1141790;
 Mon, 13 Oct 2025 07:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2iX=4W=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1v8DFo-0004SO-Cv
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 07:46:00 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a61a470b-a808-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 09:45:55 +0200 (CEST)
Received: from SJ0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:a03:2c0::18)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 07:45:49 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::b7) by SJ0PR13CA0013.outlook.office365.com
 (2603:10b6:a03:2c0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 07:45:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 07:45:48 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Oct
 2025 00:45:46 -0700
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
X-Inumbo-ID: a61a470b-a808-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UofJTwzL74iEzfUvWcpiaJN+95B501sTmwFnWXrrrkQYXfJcDa3ktGqxWCdJd0rrsBsagLNcLzLiMm4dLHeVlrMNL4a6mQE6O0igO8Bz4+QdpvecqVpOld/64MdFGwx2/gDldTrPFBgrkpBM3pqGy/NL6tDwfi7T46DOEtukGh+G/LRPcRDeekcr2Nr2F3zihahJ1/X3tx1T7XQpUP4vMrITduGiJrpGsXzhFaXnhaf1P8VFNAHD1OvpjHr9UHMJsq3fRWLa2iRT6XmQ/NkV74NUAqFvO0ocNEym7X+zapWufCGZ3v6+suhSHD2Re188Ka+SdThBIYu3RljYybGS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKkvZoHOBdDKlx71dnvWCdLS+ZSNf7woIcpOlU/GFLk=;
 b=vhPZheAuZjdEL9t+4OjJRS1iz0qCc2NBHUpE2q8lCazlbbc8/8hqzn+ytZ6tpFcOOctX7W4zqw4DY7qhfT7+Zi+RevOmu/jTibwAhRZ7OGLD+HQ2OuxKknUQar122yJZZVG7nC5Nm9VCEHPVMXwPkZgJl1aTUgCUicpkslPhFoCFHVrtufhLJHXiOHV2XWJCg45DjXkzEoh879uvO3cDyyj01QEUZyAYQ0pS5XjdHZCvVjkul3bGP/vfyY9Ms3NvPQLp4CRTLt3wBXYSpX+SPWMKxmQLAEvSiNi4bYh/txb+r0C7KLw9mm+aSF/LGDYPbjhhM9FkwD5RdlquE/0mYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKkvZoHOBdDKlx71dnvWCdLS+ZSNf7woIcpOlU/GFLk=;
 b=pZzgNCAPGKlF2YOO3b+ELCtwwDZXSFVsqP9Kyv5jfbbzkoAh+K9xnqL3XaBjK5D2OxZgs5ua5JjIcNO/e0fOB7UqdTJ9FJKwlXVT4IpGES+91a5qkqcgdA4tPJDfnDAvtiGochFOTGK9MNdunfeiVqU9tB/Dgk3mpxIExEs97Po=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/1] tools/libs/light: fix BAR memory address truncation
Date: Mon, 13 Oct 2025 15:45:33 +0800
Message-ID: <20251013074533.67478-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|BY5PR12MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5ad68b-ffbe-4505-6db0-08de0a2c86a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JOByrZyWAF43b7b6qIV9W78dq5JpByy1BZ3xdKGZbj85RikkGytrY0YjAs0J?=
 =?us-ascii?Q?3M8m5QEwCQaE48MlLaFXS7woOI9/usnKgodL9L4VFgaw4G6zUUgrhBHhyK3N?=
 =?us-ascii?Q?lmLAnTJlA45NGVfEUMWjLiIqedVpUKlwohvtXAPfQJ8tPcyj7gNg82UUXP4k?=
 =?us-ascii?Q?aLaIRhLh2ejZLAIVNjjKza6gtq/W7m2v0qlwf/QvSWDFZmMjQAGmy25hr4AL?=
 =?us-ascii?Q?A53NZ6+chiw6E0d0H2M6Z7N0pEbeM6qEdhNab8Fxq3BvTYe8vZsZObhQbMiw?=
 =?us-ascii?Q?SfzRn4cKakerc5yLSrD7K/hPvbK9tAcpKTIxDVEkTpe5QkOJDFYLV7iUjScV?=
 =?us-ascii?Q?xlXts2JxJLMtZ8xVVrPdyqVccJ+OUqlffph+y+nIKt7FUWMGETSwrw0q0UOG?=
 =?us-ascii?Q?s/DZCDFv90+wrGjkb7z2e/N/TxR51Wf1DgNlp+G2s1hrWApCLpIGK+176Trb?=
 =?us-ascii?Q?STIcRSvDVLgFv1zgo3VWeq79TN2U/1c72WQxeH/4DgGoJf1U7f5emjDmxRD2?=
 =?us-ascii?Q?FPr6ooGchFZjXwW9L+DmWnxZz31eMpAx4XpaskoT988BTHjZIA4sBgxHhH3I?=
 =?us-ascii?Q?paM554PutI3iYACBTJso1ow99a602i+bW3d2KbExCEBo9Vn6ym/WBQdToUQV?=
 =?us-ascii?Q?e7PKYaWywFGVAliPUYHGcw8pmTJpx4fjEsgZOSCYQl4os7tQG95FjRRMBTUH?=
 =?us-ascii?Q?KHeYX4dUvPNxSpY/2lGtOrU2BmXXbuxiPCqxex6x+BR+MuBi3jKmu/ojnD6T?=
 =?us-ascii?Q?yUtnWExoib0PseXoIEklWaXls2DThdcDv3q1P7x2ybJawP3JHVvMnCWy+yOB?=
 =?us-ascii?Q?0Oeak4beZn9nYscg+ZG4mUC1GywIZokXeQ8QyORsiUPUF0+MzzmT+CU4bSxr?=
 =?us-ascii?Q?XRhFQGPoPLl+W4iRfKKWV7gmYYy2e82urujO2N+8o8yy0pOUfKi2b+gQWReb?=
 =?us-ascii?Q?rF6kScP+lzvu+MQOkPqS7C/OTm9+TUbDI533DvOkL3O6Nr/8B3v1sAtdna0D?=
 =?us-ascii?Q?xIWrPBoAOk0hBvI8foox06GdlxGO9hrOGp8yOQsTq9McYYAHA1ZRmVVDE+Lk?=
 =?us-ascii?Q?sdyQ1p/TelvP0f0z29yepGtyH7nLGCq5oyhy/T2mMB5wYJ+FRdOSO83As+O5?=
 =?us-ascii?Q?ooIv04wHAM3T1jzsdy+bpdJHm4QlktcH446viahAhvj9e82Av5QkcKjPA1BA?=
 =?us-ascii?Q?Z2pl8DpX5w+IE0hzarG+n4ABo6AG/h8JS7Dp3Xzvg5Abnhvpke8XpsSa9IVg?=
 =?us-ascii?Q?YXKVJQTR0Hiy3/tKkuPxCyQBUmtJ/UcZA8ne0DOPpHcOdG0oznCL1Ekk8zOC?=
 =?us-ascii?Q?fNHtTI+t8ytlCQo+vdh4xxgZLecjBc+1e39yWss0WtZQFM4TGLHcXYGGoM0Z?=
 =?us-ascii?Q?Ff2Wgs1E5SPxew2WtrupL/7Lf3W7MBVbjK0KBeNUQEPHPOtluFDw4+UzMJtm?=
 =?us-ascii?Q?iw1I+hdi/nXxtXHhhMXQXjr/dYYVM7te4Lpb9AY40nLJekXsZsw6rOE5rjw1?=
 =?us-ascii?Q?mx0THXHICW+R0uROUppKH/vT8qr/SEd1oFPBLWPYywZco1Ta83j9ICQIjeoj?=
 =?us-ascii?Q?svYfcrMvgwZKG5kPyRc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 07:45:48.5870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5ad68b-ffbe-4505-6db0-08de0a2c86a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321

64-bit BAR memory address is truncated when removing a passthrough
pci device from guest since it uses "unsigned int".

So, change to use 64-bit type to fix this problem.

Fixes: b0a1af61678b ("libxenlight: implement pci passthrough")
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Juergen Gross <jgross@suse.com>
---
v1->v2 changes:
* Change to use uint64_t instead of unsigned long long and change
  corresponding fscanf and LOGED parameters.
---
 tools/libs/light/libxl_pci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 2ea2caeb6624..ae416a162360 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -2001,7 +2001,8 @@ static void pci_remove_detached(libxl__egc *egc,
 {
     STATE_AO_GC(prs->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned int start = 0, end = 0, flags = 0, size = 0, irq = 0;
+    uint64_t start = 0, end = 0, flags = 0, size = 0;
+    unsigned int irq = 0;
     int i, stubdomid = 0;
     const char *sysfs_path;
     FILE *f;
@@ -2031,7 +2032,7 @@ static void pci_remove_detached(libxl__egc *egc,
     }
 
     for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
-        if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
+        if (fscanf(f, "0x%"SCNx64" 0x%"SCNx64" 0x%"SCNx64"\n", &start, &end, &flags) != 3)
             continue;
         size = end - start + 1;
         if (start) {
@@ -2040,7 +2041,7 @@ static void pci_remove_detached(libxl__egc *egc,
                                                  size, 0);
                 if (rc < 0)
                     LOGED(ERROR, domid,
-                          "xc_domain_ioport_permission error 0x%x/0x%x",
+                          "xc_domain_ioport_permission error %#"PRIx64"/%#"PRIx64,
                           start,
                           size);
             } else {
@@ -2050,7 +2051,7 @@ static void pci_remove_detached(libxl__egc *egc,
                                                 0);
                 if (rc < 0)
                     LOGED(ERROR, domid,
-                          "xc_domain_iomem_permission error 0x%x/0x%x",
+                          "xc_domain_ioport_permission error %#"PRIx64"/%#"PRIx64,
                           start,
                           size);
             }
-- 
2.34.1


