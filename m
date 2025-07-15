Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E267B063FE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044531.1414670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFz-0007ac-CL; Tue, 15 Jul 2025 16:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044531.1414670; Tue, 15 Jul 2025 16:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFz-0007WE-66; Tue, 15 Jul 2025 16:11:51 +0000
Received: by outflank-mailman (input) for mailman id 1044531;
 Tue, 15 Jul 2025 16:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiFx-0005t5-QT
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:11:49 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68ef83b0-6196-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 18:11:48 +0200 (CEST)
Received: from MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::9)
 by SN7PR12MB6792.namprd12.prod.outlook.com (2603:10b6:806:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Tue, 15 Jul
 2025 16:11:45 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::d7) by MW4P220CA0004.outlook.office365.com
 (2603:10b6:303:115::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.28 via Frontend Transport; Tue,
 15 Jul 2025 16:11:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:43 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:42 -0500
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
X-Inumbo-ID: 68ef83b0-6196-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fh78ROGblvtyZZQmpWO3+SANezQEy7tMP+mj3xMPyssu3WEpplzBDlyyC121xXdWg1W+yycbjSV9ddDwaZB+VrfhCbyoBVwNxIVN8K/Q3B7Qx9Fa6Yv8IHwS/k0B/HyvgQkp4OAhYNEAaf/WkBuECDX9mDq2DM0Dcrx+Wq9Kv7agkrj2REYfusCtlkiW3pQ5BdUQltcWx8Day22ekZkoAAtymt0RCC/DiHfaH017Veqm6bKuTNqupuYlW4nnECKhhuEtIbhLXn34qlqKur8VXFpMSi/mxIo9S13IBgbYo0Je6OzapjuX5LJ/DcFd6jgH+YKZbDQ1F5g2D90B0NbNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpq1itb7C1yqjdxsKRw25pFQUaO19wAGvasS2MZJbQo=;
 b=pjHufkZUgo9KI5eKUkPwZLwDpWt7KlsyY/qw2D9UGjNi6N1fypa/SuiNML+XEBTP8922ifDbX+LZ7H3VqV2xe4RsqrcJgSYS6sCQpmo5LYwcrIInukfOz+RWtWpjDLz5dkqymxtCDbkXLFq0gSJ44Trxfay+Bhti+hKJaBrQ3QTIJZvvbVvYYopQETeEyLSJz6NW0l/CPaJN6bkcMmLGjMekaO5FYyVrlVgBR3UuDGxW/YfSjKlSrOdrR/GMdzQHfzLAsKyfRV4YzJEDj8odlXfMR3d/yWPbaMl/bgv3Iu9ZPN/GZGR6KKWpfvrPCRNvk2GtiU0FUVhEmsLjDnfKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpq1itb7C1yqjdxsKRw25pFQUaO19wAGvasS2MZJbQo=;
 b=3TqNOMQ7Ke2euhKiyiNfpIAiN9BVlmEzcWyrpitA3ZUNqvPpNMSl1TIG976o+TAb8uI70d8XtnFXU1UOTTfPUIdBduRvYUJebIiFZlp8w0DpJMZ6Va1MADgR8HCfAhKosUgUN2wSYJT/ctPnWYGiaf/FrGIxSLBJQYpsvpYz2sA=
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
Subject: [PATCH v7 06/11] xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
Date: Tue, 15 Jul 2025 18:11:01 +0200
Message-ID: <20250715161108.141126-7-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|SN7PR12MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e087ddf-08a7-46ec-9149-08ddc3ba4ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nqhx6kPxplHw22MDNy6R4/IHbBs5GoR1uXj1HW6Cafkgi30ahK5liMaQ68w+?=
 =?us-ascii?Q?PTDrqSAUQj8LDG1JfrSwP6gzBs/BsZ8aMvl1MPdOKYnPURmqf8/PlGCnCnba?=
 =?us-ascii?Q?5qxovTCvO5RQZdWeEWaz3ufzTBMwt78MM6o9GBbQ4ZAxxo1lcq/BWFB+0bTI?=
 =?us-ascii?Q?7sjif3Szio1971R+PTdvMZ3d8aofmoADFqZPAXlDzeNPWtzJEhzuqaQiLDg9?=
 =?us-ascii?Q?4SkBVwDXzjGylQqeD04T0ErIitZ/Ltr8jCqzbSbBH3n7Np5YYVXI1WLGqUaj?=
 =?us-ascii?Q?ReRhhTzacSeDi1PZA0rI3qA5ouZqUFN2bueHbA3ZokZ7joHzbBF1guAe2nXG?=
 =?us-ascii?Q?m+fq+SH+SSk6N697yj7iJypp/mZponUfYbuNuOPZDrptl05EItihorsKKeOj?=
 =?us-ascii?Q?necnAYKF23NwNRSmPP1DazCqDZHh3HEIae0u7bswnIWTU09wD76yrXaPT6PG?=
 =?us-ascii?Q?3xLL1t+SNcy7uFIBclNKla2DPIAZ8uJjhaq4FVjqE/M/Znrngqm8QD5PehhE?=
 =?us-ascii?Q?l4gYO+6Fw1Ed49c6SHIYS3A8xjjcmcDXSpSaSd3oxPNd4Ce4Fpah9FacG/gi?=
 =?us-ascii?Q?JY0mb4ccInEoeGt9sEc4M0Ey80znPoE6y62j1+CjGtGsO5Ah977TdQLCh3rG?=
 =?us-ascii?Q?hxSOfcc/lhPpD4KwAxjMWqwUFNLcp0rPWnV9iR/qwi3xA1x8la/CdzA2zSuP?=
 =?us-ascii?Q?cup7XErLZiu2sMzAT4iIpmTTrI3+I91DQlOEp1GFT2P+4bmmd8GVX8+rNmvF?=
 =?us-ascii?Q?UxagRNrgJQ/Hu0esWewZgBCRN65T2Xdc6bSZ7rbtqcZdGQAdBeQ8CaTbjqUh?=
 =?us-ascii?Q?PnGEzWi2k+meRqeyE0ewIwdqJvlszTUyhBMsSzrR+WIfejuQNKt8c5OXXU3H?=
 =?us-ascii?Q?tY5HzJvK2H5b2CuGLoVFUEhI/NNOdZclNIbBKgCfv92JPEGA051EZ1xxAZVM?=
 =?us-ascii?Q?S9i1eTfdH1OF5MCvvJV0iWIhaEts+Gi+8Jx77AlNrWo1+bC28xWuRa93h7PZ?=
 =?us-ascii?Q?fLgY4IFN55AI4GGDVYNPeEz6VxZEexpZwFZgg9jVrJzHZRCdhLx1MrsblzfB?=
 =?us-ascii?Q?N2XvAnXJM54yHt0pEtZCM1hGFx5ikYT8Q7pO0uobF9x/HSUxft8LzNxKo/6/?=
 =?us-ascii?Q?l5CB2WWc5tNqQWHZdQjKsdViL4OgMOYFz8XEEPtOgC9X51GHPN8paIgKpAVx?=
 =?us-ascii?Q?tu2aav163meby8J8wfk2KAbp9x/e47WKdUgcQiE3NtHLJWsUjbHFLaopozM4?=
 =?us-ascii?Q?HuBIKaKV6QZuKp0nBOEomGhjtIxVbfcATMqlMeFn/q9LSsBN0u0O6YyhJdSC?=
 =?us-ascii?Q?hKxDWketIaq66n2AU26kUCadyPpjoar+sJpjq5C309sYLI2QZEkSD9Al/ewR?=
 =?us-ascii?Q?7JE9q2bb8CISLrNBe4ac8QE/Owo1jTktaxwDepMFDaSmcRZJpJocsSyMVzO6?=
 =?us-ascii?Q?VK2MfwU52xdc1TcEopU+0wsMmrOjR3PV2HXLb7W8G5BIRcQirO7rZWgJ3bRP?=
 =?us-ascii?Q?m4QMZZ7W5dRrNsrK0KNqN4FCOq0ekK8hJTHR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:43.9924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e087ddf-08a7-46ec-9149-08ddc3ba4ab7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6792

bootinfo-fdt.c will eventually contain bootfdt helpers that make heavy
use of bootinfo. To simplify git history do the rename here explicitly.
A later patch extracts bootinfo-independent helpers into bootfdt.c.

Doing so here would needlessly pollute the diffs.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
Dropped R-by because since v2, this patch and the one following it were
squashed unintionally. v7 brings things back to a cleaner history.
---
 xen/common/device-tree/Makefile                      | 2 +-
 xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} (100%)

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 13127296cb..8a3f2be89e 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,4 +1,4 @@
-obj-y += bootfdt.init.o
+obj-y += bootinfo-fdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootinfo-fdt.c
similarity index 100%
rename from xen/common/device-tree/bootfdt.c
rename to xen/common/device-tree/bootinfo-fdt.c
-- 
2.43.0


