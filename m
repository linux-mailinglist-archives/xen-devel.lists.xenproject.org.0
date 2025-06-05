Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA24ACF84F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007456.1386769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaD-0003r5-Ap; Thu, 05 Jun 2025 19:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007456.1386769; Thu, 05 Jun 2025 19:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaD-0003n1-7c; Thu, 05 Jun 2025 19:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1007456;
 Thu, 05 Jun 2025 19:48:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGaA-0002fZ-WF
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:48:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2413::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d1bde3f-4246-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 21:48:57 +0200 (CEST)
Received: from BN9P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::12)
 by PH0PR12MB8823.namprd12.prod.outlook.com (2603:10b6:510:28e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 5 Jun
 2025 19:48:47 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::cb) by BN9P223CA0007.outlook.office365.com
 (2603:10b6:408:10b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 5 Jun 2025 19:48:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:47 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:44 -0500
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
X-Inumbo-ID: 1d1bde3f-4246-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCkKidObom17MOavgs/GidT57hFvSOGtso0Ar0I1O0/+vikZ+inEVblUxW+12btWFLbOXkbVOLUlXlhfuHjkypgt01ZUHPPcG7bMnsiRaU8M5qdfPgv0UVhHIAL4UFv3aftREVTNpJo4NtjbadP+e4Ewf77WaD0I1+PoC9op1zpFf8C7Hrmq7nNFITRPzPPy09Gle75wQQmUx5+XCVmlm9kLDD1S+eDCorlJPWqRfAmu0+iJa+Nn3MJUyPJaw1hlaG1D+jX+YhN12kZHpaYuHwN6UhubPAlsdD3X9DKPEGEPIY/I7JW1L4aZF2MX3sVG1vvWfWbTKYdIuhgBTlGuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DszMyD20ThXf63bYWe7ewf2cnMilx+Yg49wMmABHUYw=;
 b=GPnp5AB++9S5kpFVS01Yv2wYOHMIuiFls4vU2RJbN8TGuxUF3A/k52Fb31hOs1Yy+Pei+bIFzyUSt56sAxiQ0Zu/oJnEZWNekqGfHyWiTSt44kTWiA2sBo1RxgTpbtvRziXoIWMHJCDrEJ8o0wTp6eKT2P4VoPTXFvrM7iC+silxf6Rz2HloocgZWz5YCNdOiRfcuerr9LHt7oFL6gDEIGGbEwhIH1ruEq1Wpr4IV33mVeD0KUY6+AIY2nh1ybNG1MlyFUfkNt9t+fPCuI65iIVr8wARTLwl4dX7dYXBoCgtp1HxCmp7saOyK4AyjrXn80W4+LyLKF4+CVJ5t3TBmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DszMyD20ThXf63bYWe7ewf2cnMilx+Yg49wMmABHUYw=;
 b=gKoveL4/UOdtyLvMW4VcP2PJajkktXvT5bF8nhD9qmOR6QmTL7nUHoaZn3sQk4EF78bhhMEctI1kjF9xb1k5srK6dEMgc6Sr1Gg6Sh8Nkkzse2YAIkpeP6B+HjkT6Ux2q+1CZUfnPwYGe1qOGaYANVXr0lBcASkg8hFO0R9o6Fg=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 02/15] arm/gnttab: Break links between asm/grant_table.h and xen/grant_table.h
Date: Thu, 5 Jun 2025 21:47:54 +0200
Message-ID: <20250605194810.2782031-3-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|PH0PR12MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 1927f5ab-f940-4e54-c5c9-08dda469fca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1n50+s2bFGK3tOOGk0E/0alKu1ghwWao2pJjpWHjiYm8taOJ6KY4hzPmTwTr?=
 =?us-ascii?Q?/WzjanoK45HsqKeiDBMBsKj+x1V+IfVBAmefxd+eF9ap/9jRZ9W7zRZ75MHV?=
 =?us-ascii?Q?wUw9jsvYYbb35pJlMZOQG+im3YOsGU1kNHzu8sLYi5ySVdA23yDbHHg6DpzO?=
 =?us-ascii?Q?LdL2MkpkHkvIJd6fsWB0zqpMKzuUoSiPsUNTUoSeNSY9g9jwWmIrEueJc8JF?=
 =?us-ascii?Q?yfplsUrUVcsSfCuVkOyG/0UVb5oWw9loxmlFsAh/sUA8BgFcpmt6prYso26N?=
 =?us-ascii?Q?9hvOjOlg1WaYp0hv9xsIZfJ5XJfDeYvu81UX2SpoeWBzg0ePM5cQGQJQtcdm?=
 =?us-ascii?Q?eNlf0YvugXYTL0NClTALtecw6LlfcV/vWGE1ZfMCi5bpFjXWo5Jp1O+n3iTJ?=
 =?us-ascii?Q?4duJnf4K735Geuocwvqh9AWxtuQ5fgqmirsd/r8uiZEPsZE4Q3xJ9wkzfLnQ?=
 =?us-ascii?Q?ZVhe24VNKoLzrJ/gNrWke80Dryh8X3vsyuZd4XCKNZZQUlJaN7g7LSWiWllc?=
 =?us-ascii?Q?g603xXaP6cJEcuJzXUIpYRnWTHYnzc4NKHfEtWiJ3EC2UTD6xH9GIjKqrML/?=
 =?us-ascii?Q?wb+cA6kaoOdjVB2ZdRdN3UK2f6U/bLiFdfOBcwl2U23p6F2pW/tnZVUZ/cC8?=
 =?us-ascii?Q?5nWNG7YZ/idBZqNzwzelxdovV9x9xaBJlVD4PADtmPMrkNnDRfjeckRG+Vta?=
 =?us-ascii?Q?CaKyhg4NJxDNRpa6jFp1AxVbAPiey4LnNd1HtbgwTT5HZ311wbBGD0V+fxnG?=
 =?us-ascii?Q?Tv05qPykEOds9wMgjee/8eLLqRgb3IHrcF7PVM5KeFKC0N+KeKRj7lwOyviJ?=
 =?us-ascii?Q?wMQofoBn7iUvlEg2zZxuIoXWhS3jC18ixR8lxyUdBPJ+plhwgzaf2tsBOvtY?=
 =?us-ascii?Q?Q+++e7TLS4UQ0TW8oSecIrhH+tokOjWqildVqUT0KUkzU0sN4g8JH1/FnB2E?=
 =?us-ascii?Q?KpmT/ZTr5DsWks7rvvM67nGtw5YGtpaje396TEjmPF8z39Nn3nMPj4pRPdW8?=
 =?us-ascii?Q?KFnrsnI924pwdkdfWm5hZPwGlOsc5G3NEn/BFiejWiGE6Zn0MxpRfHcMBaLj?=
 =?us-ascii?Q?SXD0jIlM4x9jvqAdxPHQfZ+jmdUjpS4iJA71rCZgfOdF5CNqMcbcFQuG+Vdv?=
 =?us-ascii?Q?Yu+lM1KQaIrSnUcW4MFvHX0n4AAwaVnbnTBYThocE4WHw59Z/TC8dhfb5qIU?=
 =?us-ascii?Q?oQT6Ze+3fysWnS63rSCea67SPcVgd37nQr5mXlhQ2/ALtcLyDDSwYfHkoTPE?=
 =?us-ascii?Q?Af9KraqQf7q1w4fP5lfie8zIaSJ1mSwctn2lb9uzgm8znSiq3tCWT6X+l3gR?=
 =?us-ascii?Q?pZbmfH+qW7CXebIauwjRUhWWbQm/HFnG4PXjVzv/bhoDXpCtUqOsbdid++nk?=
 =?us-ascii?Q?Ucw0mfKpjcd6eCpk45t42Kqq6eaEm4T5FtjfXVeAdjgqS54VxWeTAajcDSa0?=
 =?us-ascii?Q?envOzjIU183+eOdEx7gw+oiSVhbxr88KJL2hU5vE0HeZ814QX7kjdYuVjYC6?=
 =?us-ascii?Q?72VbcQhT9Ws9AkeRVfbFHWfXUsvPVLjZHoND?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:47.3027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1927f5ab-f940-4e54-c5c9-08dda469fca1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8823

Not a functional change

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v2:
  * Remove both links rather than just one.
---
 xen/arch/arm/include/asm/grant_table.h  | 1 -
 xen/common/device-tree/dom0less-build.c | 1 +
 xen/common/grant_table.c                | 2 ++
 xen/include/xen/grant_table.h           | 4 ----
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index c5d87b60c4..c47058a3a0 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -1,7 +1,6 @@
 #ifndef __ASM_GRANT_TABLE_H__
 #define __ASM_GRANT_TABLE_H__
 
-#include <xen/grant_table.h>
 #include <xen/kernel.h>
 #include <xen/pfn.h>
 #include <xen/sched.h>
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 3d503c6973..d5bb1d5d35 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -26,6 +26,7 @@
 #include <public/io/xs_wire.h>
 
 #include <asm/dom0less-build.h>
+#include <asm/grant_table.h>
 #include <asm/setup.h>
 
 #include <xen/static-memory.h>
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..1e437eff50 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -42,8 +42,10 @@
 #include <xen/xvmalloc.h>
 #include <xen/nospec.h>
 #include <xsm/xsm.h>
+
 #include <asm/flushtlb.h>
 #include <asm/guest_atomics.h>
+#include <asm/grant_table.h>
 
 #ifdef CONFIG_PV_SHIM
 #include <asm/guest.h>
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 297d7669e9..98c4f4136b 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -27,10 +27,6 @@
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
 
-#ifdef CONFIG_GRANT_TABLE
-#include <asm/grant_table.h>
-#endif
-
 struct grant_table;
 
 /* Seed a gnttab entry for Hyperlaunch/dom0less. */
-- 
2.43.0


