Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030AACF850
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007468.1386810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaQ-0005ZA-3V; Thu, 05 Jun 2025 19:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007468.1386810; Thu, 05 Jun 2025 19:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaP-0005W6-Tv; Thu, 05 Jun 2025 19:49:13 +0000
Received: by outflank-mailman (input) for mailman id 1007468;
 Thu, 05 Jun 2025 19:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGaP-0002tD-2D
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:49:13 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2409::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26b1802c-4246-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 21:49:12 +0200 (CEST)
Received: from BL1PR13CA0134.namprd13.prod.outlook.com (2603:10b6:208:2bb::19)
 by SN7PR12MB6932.namprd12.prod.outlook.com (2603:10b6:806:260::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 19:49:09 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::c7) by BL1PR13CA0134.outlook.office365.com
 (2603:10b6:208:2bb::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.10 via Frontend Transport; Thu,
 5 Jun 2025 19:49:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:49:08 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:49:00 -0500
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
X-Inumbo-ID: 26b1802c-4246-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIe7tuAnxcM7EPDHGGEpLsAy4MMIvrNU5390kH1ikzk5J9OOxmgzwq7ooklboA1qluxUKF0SKPRnm+vRNvnKXaaMquECKwFavMKkn5oWTa3cxizE59HDEr1EBbnFKb9lAes/0nJP2B2r9t7oIPY7wcl6NGmKdK/SBr5aLDRA3xZdk9hE5+64S2sz0d7oZGK2uilFXmvjBXYoE1mI5nmXkPq43JadZi2S0VSFPFGiRIon81nNULslDupRe/EVvSd8omJHGYassr6VtFjePkGgi2LJ6/7n6+d1bgfELhxYxRk3CH7yGhAHzxbgBdyANBXr/nZFXntchlSGM5sT22evZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcW3d8L8LfyXlkpJp/idqPtEvoD18OvPCNwy0JjhwWc=;
 b=dKQz6V5l4WkCnKp5YgEukdy880MzQ1N/TQkD1hwbXcA7/M/pisgsXzZj3niTOIhnyDtDCmAeG7BI4Vkr0kI8206chGr8et2X7ZqrDcJ9Ph5ShPWrpNY0zwUA46eknM0omOSFU+Gjkcq7Ga/Bc6qdYNdDJHtv4ofBSkkayfHguovKbRB12Eppx6O8pzAJPb0DKzY00BtfJx8fAU6oOlFixPNwk+RAt/bvtjFytR7gCW24pDVgv5Q9ap44Us1xOiZ/Q4y5qIe4b94ADBThEw1aLj3DuPOXNjE8KqktWCaFDbCezZKynS2fglIKsuDofmvQ0IKr10d6Dr5zqvbdLUAezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcW3d8L8LfyXlkpJp/idqPtEvoD18OvPCNwy0JjhwWc=;
 b=SdbGoCWIFLJzeY/1nsCPiFYraUSh64mZzkXrZZt2mBciq4UQw1V8ZKa0p6FCvkv8GlWd1OYN289fZ8p/02041Aj/FQDI7FRWjeqZ7TQJX+qk3BEx7xrvY7g04Xkr+j7vE3pACPAkfuArH4+LspmqvC4HK+P0qaQA7IXdkAG8Jro=
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
Subject: [PATCH v2 10/15] xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
Date: Thu, 5 Jun 2025 21:48:02 +0200
Message-ID: <20250605194810.2782031-11-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SN7PR12MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: d496c9a4-f549-4c45-f851-08dda46a0974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wHyOmQhsow9yAH807JTGodDYGGG/Ia/fhmpeIHFg66Kdoyfmii8TtpDjAkIr?=
 =?us-ascii?Q?VXKZ1+4Ug2jw9SpgCKLEkl4MSxqvLGGn63vtqdkYIat3AuQ0FvcUL9to3qmZ?=
 =?us-ascii?Q?IkDkg2E2GT12cxFeWwDQMDNJkToMeQisG6rVACEeR/s+4jzgB7GDjdkBP+k+?=
 =?us-ascii?Q?NPGkmQlssIPePZp+sxVvV2/tGnnI9W4ESlHjoUaM1w2gWwmaNqYdf3QakvIy?=
 =?us-ascii?Q?NFaZuvoJCAxbOKMaegDzOgCtI+OMbf21WkwtdS7l1DFhsf7L+CA+vLXeHt61?=
 =?us-ascii?Q?TLK0i3D/N9r7QRSBJ6hwIQdgR9mdJ8k3mc80C0L4/fU99cvsG4DRgmbySFIc?=
 =?us-ascii?Q?pdLYtxchRLjUjO0fdKN8r5rk6QcDV1H9gkva1hA5lfGCQSgQ3EIw90spcY+M?=
 =?us-ascii?Q?M4zP/cei0xPkfo2s2JiSzfGi89THw5W9aARvyXhv405gGUyPNVo9SKhyU34O?=
 =?us-ascii?Q?xFo65pyuui2/cdMwyYkpJlURJAdVyye8pdDXtlAob9WrEmKHf/H7L/nHct0Z?=
 =?us-ascii?Q?ikxLtb2qKBQA8YgsXPdIbhcncpX6MgKdmJcKfCaZa6aYDan5lSY6cB2RefDF?=
 =?us-ascii?Q?Rux0Gdr/qMDXec3B+StvonklvJTaJsXiwK7Iw0Rjsf2pYQdPmmSkfnJMP/zz?=
 =?us-ascii?Q?5sTBO4kxaO4HoqYijqHhR3p/qtjo2crenTShvMgSxEckdxESDWjRsdNyrRKZ?=
 =?us-ascii?Q?3wQNoWICFU++x811LaImoTjWN+/4H5JGwbLwc/YuvBzAU/ERReMIK1+ppiB8?=
 =?us-ascii?Q?8sxifLL1DMNJMZGRyPpYR7RG429atI+gj2eI7cNkuNDI6yInMgr6qAOrxW3d?=
 =?us-ascii?Q?qNq2qxilENC9snoxt+RJKIeulFdFH8Lvw2UCB3Gdujb7EJH6QGpRctjlhhkl?=
 =?us-ascii?Q?UG6c0gAjIvyVdsMD6mjcOdSun/31elorr+QZn+bkb5tihp4hXkYB/1SWKhAQ?=
 =?us-ascii?Q?anpYTD8iSYPdLzR624bkpDqtWFubikNJS/acJxdhsaJqLjnwsl9DE6U/JFjS?=
 =?us-ascii?Q?1K+7v8BriZzdzWjJ84jfU0OcH2JFhNWbRT1rnMsL4aGvxztNieT2qYhjwK+y?=
 =?us-ascii?Q?dseZ+YJSInXKWzC4bNvKYC/kIXrwmpSzBxo6ONaOocJmOObcwt2nV81/rbFq?=
 =?us-ascii?Q?pBO9YEI1+weGXIcn5hcOCJtd+Cr5NDqOfMR60H10AMaRodgmvJYe1lbht50k?=
 =?us-ascii?Q?zDW+n9iXjXdT6/SqttboXLXNrm/Hsfcj+55jYSnNpERy9U2bWtOZb3PQamaL?=
 =?us-ascii?Q?eO9xKFd6JftM27Pv10JbN9T74E5VoB42taDHFJMIrR1OIBK1V3hQM7tkEP7I?=
 =?us-ascii?Q?Qh/oco4IXLLkY72ElTS1OehFryOMBAzd4RCcGVxaoY7Tnqwm6odjJdO9a2Mq?=
 =?us-ascii?Q?VomC3GkgGBRS0cUMZld+7fQKrBhgObu3RKNf8qTw7EBdMzQPq9ALGAC+zV7K?=
 =?us-ascii?Q?bH0qxt/obalyHuNuue8+09oN6rET4pKEEJEvDSLwh9XKuGYC5KwdK8fi6v46?=
 =?us-ascii?Q?lZb04SLLpQKrZKAmyjcHl0/qc8ijqrxYg8FS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:49:08.8171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d496c9a4-f549-4c45-f851-08dda46a0974
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6932

This file will eventually contain bootfdt helpers that make heavy use of
bootinfo. To simplify git history do the rename here explicitly. A later
patch extracts bootinfo-independent helpers into bootfdt.c.

Doing so here would needlessly pollute the diffs.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device-tree/Makefile                      | 2 +-
 xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} (99%)

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
similarity index 99%
rename from xen/common/device-tree/bootfdt.c
rename to xen/common/device-tree/bootinfo-fdt.c
index 7ff62e1e3e..195249f700 100644
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


