Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CCAC8D64
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000856.1381079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKybD-0001dp-6r; Fri, 30 May 2025 12:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000856.1381079; Fri, 30 May 2025 12:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKybD-0001ba-4E; Fri, 30 May 2025 12:12:35 +0000
Received: by outflank-mailman (input) for mailman id 1000856;
 Fri, 30 May 2025 12:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySb-00076q-22
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2415::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f42e099-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:40 +0200 (CEST)
Received: from CH2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:610:51::26)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 12:03:34 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::45) by CH2PR15CA0016.outlook.office365.com
 (2603:10b6:610:51::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 30 May 2025 12:03:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:34 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:33 -0500
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
X-Inumbo-ID: 1f42e099-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgMvWIsYFBxbPAR2AGgEeM6EUFlqhhppH4RvMAPMyXPReX3so3pJRhOoSUzXvlkb7/dabFiTdfKc4F3o2uGsyUGpSK2c9dnrUf8D9BNTM2009yMii8woiPrXoHFHKnDwOQEE3OpRbDoR3zVgVvmkUbTGRmXUy1aqMKDDPLlnN1PM+KQ2EEd3TxHGeajgISkRyu4+b611Zt/3eRdciOZQQGKMcCeYuDqlbv/sIjvDte3my7DzokkVwDmlDbFDMUlhIis45UzCVzp0Egw2MIX/IXJ4u7S/itX29v8nce9CCWUkQ/9REOPHy/rlNqtTY7IOJqmTYWBHRmO42pdIVaO4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1Ju23IR+EEatQtsIjEvwx3F7nbCca9u0WIiSRMIQpI=;
 b=iBtoQKLbsckEqlnmSeSENRypM6LzuLjD5ej+3RtzZ2qNPAZaUuf337RN8AmOLW36UDAWsaEvca73tTFep5EA1ApxXLeic6eq2pWQVEISGWCd2cUHGA7CLXqM5stQ+YdIdU4crUsD3P2eOawsdVTI1Fh+8a6oPaEYRyW5SYKMMzs54t+yv5odGXg2YANXaDEMSIPF6qSdCfZEsWLarHCbSorCd6milzLc+/5tUmLuit/0Bv/5IhcihMlAeHKPKMFMq5Lh5Y6vHR+EafciZDWwlpD6KYpyE7cys/wqrPtQ4T61yZ8J3sfXY/xI9VD2HJo31K4HhIrjDQX3/rrnOPptYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1Ju23IR+EEatQtsIjEvwx3F7nbCca9u0WIiSRMIQpI=;
 b=iHCDJkqqctFW7iBVAICAqAuXAQaT6q8HtmRjeRohbdlIr9a9nRAt/SUJqaHR9Rrt5dCU/s7+TuuuuR2pBJKS4iqpxmY/i89YqYAHfsoW1egnqc631hxjvuaYlAh0UUnOOFnpVPVN8ASKaacSJLIdpRb0VGPVzdEXECB5O4ziarc=
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
Subject: [PATCH 14/19] xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
Date: Fri, 30 May 2025 14:02:22 +0200
Message-ID: <20250530120242.39398-15-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|DS0PR12MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 4578e73a-fc87-43d1-e15c-08dd9f720106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v7aJvLyyyzoqPZPJyAzmPebRpKbSIo6rYnkmFMJvZODz65JEk0H5K1+Og9/e?=
 =?us-ascii?Q?84gjSoJEHCAHU7TFM/X3tpBps0BZ5p8B8lGGbqbXcNgtUOFZZEddzgsoaTQz?=
 =?us-ascii?Q?SAA+8qdQX4NnqEhSWnCh7kdwT5CvqnU9yCaxzEChyMDIRy8ZvVis3qUpaOYN?=
 =?us-ascii?Q?KEoJwna+5CvE1Yj9zmVNnNVIq36UYIe19hQDYVWwmQosSb0pGp4B22ByceSF?=
 =?us-ascii?Q?6TU9E5Pc+nRzge1rZPcjaOb1Cd8dBi4LROcsj/JSH9oCeCMWdPyHdzJItcms?=
 =?us-ascii?Q?rc4rQXvQ5D323esfeg61maPvsxbhaEX0rfGfRqycIsKirkmrvYXqBoOOyq6y?=
 =?us-ascii?Q?SalvmOj8WsRTWnnur6aKLiUYUnabF+PWTSTQVcJ4p8maBQgJWocT46s2QDhf?=
 =?us-ascii?Q?+AYMbISQw4aSesbvoq1OWAPM1D188/aaONbp9y4Ds794Md/BAmJyCJ9WY69H?=
 =?us-ascii?Q?QQHlvh1JCiOt56spJX5yV00oLNaA4qvvrRRgt4GQaqEXeeDB8nu8LYAN0QOv?=
 =?us-ascii?Q?HZQLgfjhLyldkdzprS6CIxsqqbkh4KGTbSnEnB6gCEKcbB180S8L4eB9kSqW?=
 =?us-ascii?Q?kLA/FJJdVsfBq9uMmJsdINPfXfSm6b1RX6H75uAbX9PfVvzpr61N9FJpXjN9?=
 =?us-ascii?Q?5BGUIceSsvViEciFnvuElF1Jc1p0yvDBWc10G4gqKZy+buxFbXm6pFuRPZNf?=
 =?us-ascii?Q?emHU6Qeq/5ya0ZcqS3rd3cnDrLxJRHkGHFYIdnVc2mil7VvRdCXdXSv5F7b2?=
 =?us-ascii?Q?0B7AQG2pM3ta1vLJQBLYDli/ksX4btxkydAuH2C2Ho4nGEbaVm2S7mr16kG/?=
 =?us-ascii?Q?Pt33OacD3HznRB3Pq4s9j1+Vc3bcqIGK+Z/p0kVSHdcNWPsgNu+Dmal9/6y5?=
 =?us-ascii?Q?03DBTMuUhehx3Bq0tw1OVW0BK71EjDyKKuJArCiecKNPxY2N0bpAyAAwZsLI?=
 =?us-ascii?Q?HKNwMU6F4Vfg1/2SpA5EDyoudPcJZbsRax3Png7TKTwoHuXNpX5LpYHc2EjW?=
 =?us-ascii?Q?vXBsISdB9+HNwiFc4NKiw4v1zlJyCWYuHPoEkxvrglYoGdI49501MQ9lB7AV?=
 =?us-ascii?Q?gURpzoPgewBuviQ6NOGzR+u1rQc5TQZUUoHAaneSJRP/SqKZXSbizdOEno2B?=
 =?us-ascii?Q?lz8/QPQZysDGfuj1BHMxxqjb8uu/HTWZ1TPrqrKrRmRenuMz5mfRLRZDdrSG?=
 =?us-ascii?Q?7C13/dAVlziRfnYLdX7lx2lJUP+Y+NuHSgbKOVULS07DakHxjIuN2WEZgSp4?=
 =?us-ascii?Q?ovqVATzoJvYMgmcHBqKG2fso3b5tCn5qEuraswK3l5UCTobdgxL8JvgpQSYS?=
 =?us-ascii?Q?b/Hf8mLOb7eWUlRUEl9Y9GvIe1WRmZ9u/IFFNM5HNpmkqdcjNAq1ipnzID1k?=
 =?us-ascii?Q?qs5TODONFHHijThEXu49rFMSnKXEFCQ4U1B92RZsF7KOxmjLX12kJRIxHxr2?=
 =?us-ascii?Q?/elGKKWmZSFJ/rvVjSK45IoxdD7HNySruCFWuzYaPBGZsP7eTWCD7ls3saVq?=
 =?us-ascii?Q?y0GO1JYaEBe0D/ODLKDXjpm8IPs9CpBrROYT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:34.8254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4578e73a-fc87-43d1-e15c-08dd9f720106
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654

This file will eventually contain bootfdt helpers that make heavy use of
bootinfo. To simplify git history do the rename here explicitly. A later
patch extracts bootinfo-independent helpers into bootfdt.c.

Doing so here would needlessly pollute the diffs.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/device-tree/Makefile                      | 2 +-
 xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} (99%)

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 57b9e6ca00..bb6d5ddec5 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,4 +1,4 @@
-obj-y += bootfdt.init.o
+obj-y += bootinfo-fdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootinfo-fdt.c
similarity index 99%
rename from xen/common/device-tree/bootfdt.c
rename to xen/common/device-tree/bootinfo-fdt.c
index fb4ac06390..bb5f45771e 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Early Device Tree
+ * Early Device Tree with bootinfo hooks
  *
  * Copyright (C) 2012-2014 Citrix Systems, Inc.
  */
-- 
2.43.0


