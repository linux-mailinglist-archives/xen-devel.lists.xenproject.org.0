Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD18BCC044
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 10:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140998.1475611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v783d-0001mW-0v; Fri, 10 Oct 2025 08:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140998.1475611; Fri, 10 Oct 2025 08:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v783c-0001jQ-UC; Fri, 10 Oct 2025 08:00:56 +0000
Received: by outflank-mailman (input) for mailman id 1140998;
 Fri, 10 Oct 2025 08:00:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93a2=4T=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1v783b-0001jK-6q
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 08:00:55 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d6c39f5-a5af-11f0-9809-7dc792cee155;
 Fri, 10 Oct 2025 10:00:52 +0200 (CEST)
Received: from BL6PEPF00013DFC.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:21) by CH3PR12MB7763.namprd12.prod.outlook.com
 (2603:10b6:610:145::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 08:00:47 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2a01:111:f403:f902::3) by BL6PEPF00013DFC.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 08:00:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 08:00:46 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Oct
 2025 01:00:44 -0700
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
X-Inumbo-ID: 3d6c39f5-a5af-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBH0aGdONFqZq2xeyGfG9SwRe822Y4MOEecIdym0B5RMn3aYD8PTvKzZfEP8dO4W5LVWRRm8O05Fr8bN4GE2hQVe1HKlrHrSc+/z1JJXhnYmRM8Ozr5c5psevTzIleqH27abQWme4HE2UITUaMO1kCmxj0mdLVg0mr6Qb4kyObaFYRxzWJaVix/dSI+iwoRswUKz/XSwrePQWZ6Do31UfolH6yEi5TIKTVa4CNi8Yx9C8fjoThO0qQ8Bek9fIXhmIRAcmI1PfjVvJHbZRJ1G3MF/zxr5nlvnhISMgCS2wNNJcW2uvWGWgTXuJatIiobU+TuA6AIx8es5voFTloDOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4X1/7P+8VcqxUR9Kb4zK033MtKsJ1/alb1zAlA3PB8=;
 b=uZMX3B0C6mfa/RvgmiAtOI3aRTekJwhC6m2iAi82Ls0/tuT3uM4gnQHIA9AVeaKm9Uut+DXMuHtSCIP+49OAxAMcrqjznMWdq14dnEbtq2N3OwwGhpmPQyqwTj+hY2j0q411dK+xhh1zdXLRsOzBde6hRN2S7hCEBJVoumJiXSYi0/ysKJR7Szd2Wv0qSGWX/tTO+r0okqMGV9jefT1LVJZQi470zrd1m2T5Yn/X307LRJujeue6VKxOLXsUF+IkIu/QNMioBI/oZXUuUThaAyTq1qdlAOVHWZzdyEptsVLwwxAM+fflumOJ+AagxTgiAiaW2PPDHL+jvvU8B4rqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4X1/7P+8VcqxUR9Kb4zK033MtKsJ1/alb1zAlA3PB8=;
 b=nrwdvg8ziSugw8OQLlTaP9AM+A5qOe3LBJXJisn9KYD3lDVb1OeAoMZ3jtWuH4gGX6S/gA1B7hgNn4iS9np07wYAE8PSaO2I9yuFOcaud7Ga/idHMF/N+tNR+nfgSW3XgAwAoA3IjdGT+gxYyEuVD12swnBx8AskqA1Gnfu9ebk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/1] tools/libs/light: fix BAR memory address truncation
Date: Fri, 10 Oct 2025 16:00:29 +0800
Message-ID: <20251010080029.29328-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|CH3PR12MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d247e4-2cf5-42c5-3e97-08de07d31ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NYTYumR1jwongTuatuHMEZOzIdthHYWQHU4sudRDRffpcumOSozSSsKWwE/U?=
 =?us-ascii?Q?9wLHE6erqbjiFup1+PZr/WsIepLx+UfxKWFc871h+rMUA+LqMcicGU1oWYT8?=
 =?us-ascii?Q?CLD3gCqPjbn8TU1g9bldylG6+bk0nVfG/oOVzbPQO2iH+DpjmgilfDwuuBaH?=
 =?us-ascii?Q?YalBaAwOLU57phqcTVK7xqS0wGzuNs1USsPji6ZbOe8YDsimZ2L7djuQIVVG?=
 =?us-ascii?Q?Lxs15dEru1gyuQDQcVdBMCTKJUeo0z9JiKHCwLcM6sfvlfpfsHbeGlHcE37G?=
 =?us-ascii?Q?ODz33frGXfwRJWmwYxg/bwFKjOOQaBsjjVRWY3RiEb9NKWAT1t9Is5USUwlc?=
 =?us-ascii?Q?VThWgEndCgxGe4zX2K6DvhXyZOBfy2oBuUoiQGP2f+KrIyaH4NY8Tidiu+xx?=
 =?us-ascii?Q?Y4LSmx5mngwVZka+XD6loQDdxascrXjOmWNMHRqjzeTXuw2/pByCnn3/8cJ0?=
 =?us-ascii?Q?tfcpR2biBWrsHdiY5lAIUDsS2V/jWARnjWi5fpU/3WrDtSPcSOE8mSUXO8AT?=
 =?us-ascii?Q?74jdhFS81gJUYiBALIffi5JaKOwkaEyiyMz7CopfFRd7eps65VLoux+D2Z6j?=
 =?us-ascii?Q?/H7bHWg3YEdu1nLZiqdc+HbuNNQaRuIKULPeKWfu59BqPn6jQ0lnv9teNmZp?=
 =?us-ascii?Q?CwKBHs2hl9bxEslPHl+nZ5zzXHs1bbR8nRYL//LhZf8CwpkyecPJR7rckAlw?=
 =?us-ascii?Q?3Hyxpe6QcP86ez4Z70rWwv0NMqw5n7UWMPiMb3G3EcBeCKtG6cffnvfJQBBV?=
 =?us-ascii?Q?MuhJx/mc3mTAD4m9vxwCfjfW/JM5KY+xejCI+vIup2ac0nXNW0gjETs2X4Hb?=
 =?us-ascii?Q?FJxCKteCeKgKfKB88016cGUrM84ZYia6qjp370mt2XS/XeizI1VniWwIoom7?=
 =?us-ascii?Q?fGxKHUDRtKAnrw0lBLuUN7/42458QchSeR8H5KOO+590nww38n/BXek748S8?=
 =?us-ascii?Q?RWf13PQCA6oBida0QbgdR3vAg9PR4XN7dzd+kGvqqx8d0DhURCzyBu7xrC/t?=
 =?us-ascii?Q?31k9RAV0jI4igXtUmCWD/vgwUp0zVfGBdIMh6l6pLBe7k/KIhLGx6tTBHZj8?=
 =?us-ascii?Q?+V6DnxATKSyGY3LXPIaQOX07m7gSzgeFLIGpCrZWQ9TU4Y8Ob3ss4/YMiXhn?=
 =?us-ascii?Q?BSJNz9X0Z/kGN4HliiBl1gZxvakP/7yRB/zbzqwJXdfZMa37LYdluB2qcHv/?=
 =?us-ascii?Q?4JFNvzcJkbpN9Wmaq6RmATmi5T1OXYas+Ln654F5ptZ+VHYBlIlaD/flEfpA?=
 =?us-ascii?Q?YUI0Www6rm5pRtMCYl6LnEAOs+4yaWkDnIWVGKZWvRx/51Tdb9ElnS6ObnHP?=
 =?us-ascii?Q?ggoSz+o2YDVQXP6rkEjzrh0jzgyCplAUYbkWU4VRgEH6CFXV2xY7i9Jp9FnT?=
 =?us-ascii?Q?FZKsxj0F+oSltTln2SXOqlZ87KYfZUVdM94jMdpn19g65/jYGyLvvFAIxw2m?=
 =?us-ascii?Q?ABW2pux/I8KinszxS84FDrwGEu8NJGv0BHkEdjg1wPTxexQ3N1DPsIKyLihl?=
 =?us-ascii?Q?LV3/3cSN7k5vyCxhV3Q7ndM9cO/pC2kRrxYo4xsaiC2zB85ohlej2LGcVa01?=
 =?us-ascii?Q?ndqoCExJgIfWqsMKbOs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:00:46.6483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d247e4-2cf5-42c5-3e97-08de07d31ea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7763

64-bit BAR memory address is truncated when removing a passthrough pci
device from guest since it uses "unsigned int".

So, change to use "unsigned long long" to fix this problem.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Juergen Gross <jgross@suse.com>
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/libs/light/libxl_pci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 2ea2caeb6624..88ffbbf08abe 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -2001,7 +2001,8 @@ static void pci_remove_detached(libxl__egc *egc,
 {
     STATE_AO_GC(prs->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned int start = 0, end = 0, flags = 0, size = 0, irq = 0;
+    unsigned long long start = 0, end = 0, flags = 0, size = 0;
+    unsigned int irq = 0;
     int i, stubdomid = 0;
     const char *sysfs_path;
     FILE *f;
@@ -2031,7 +2032,7 @@ static void pci_remove_detached(libxl__egc *egc,
     }
 
     for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
-        if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
+        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
             continue;
         size = end - start + 1;
         if (start) {
@@ -2040,7 +2041,7 @@ static void pci_remove_detached(libxl__egc *egc,
                                                  size, 0);
                 if (rc < 0)
                     LOGED(ERROR, domid,
-                          "xc_domain_ioport_permission error 0x%x/0x%x",
+                          "xc_domain_ioport_permission error 0x%llx/0x%llx",
                           start,
                           size);
             } else {
@@ -2050,7 +2051,7 @@ static void pci_remove_detached(libxl__egc *egc,
                                                 0);
                 if (rc < 0)
                     LOGED(ERROR, domid,
-                          "xc_domain_iomem_permission error 0x%x/0x%x",
+                          "xc_domain_iomem_permission error 0x%llx/0x%llx",
                           start,
                           size);
             }
-- 
2.34.1


