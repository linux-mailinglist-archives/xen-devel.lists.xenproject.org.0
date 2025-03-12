Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC35A5D4F1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909673.1316602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNB-0007vi-QH; Wed, 12 Mar 2025 04:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909673.1316602; Wed, 12 Mar 2025 04:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNB-0007tY-Mx; Wed, 12 Mar 2025 04:07:13 +0000
Received: by outflank-mailman (input) for mailman id 909673;
 Wed, 12 Mar 2025 04:07:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNA-0006o2-5z
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:12 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2406::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77f99de0-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:10 +0100 (CET)
Received: from BN0PR02CA0001.namprd02.prod.outlook.com (2603:10b6:408:e4::6)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 04:07:06 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::64) by BN0PR02CA0001.outlook.office365.com
 (2603:10b6:408:e4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 04:07:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:06 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:02 -0500
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
X-Inumbo-ID: 77f99de0-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSWGnxpXYMyXJFJuJfCTIgehv8iLZeLVdGGKUpeZC7nLqFsUSlqUTg9XyYGV91L9dgFycLMxLNfanQXSxcw8R1z4j+Q6nhSSoPe4E65pEvzPRdwyKXceKp+91jOuzfrO/Om5vGD12XycvI5Gr359zwA1O/Nhd0P3kAbN5/mgOI3baNxTCOvGGlH0D0dupVPsKfn61iMRheXGfSeviIgK1YrH1xEmnV6NfeiXv6HDthdGs4PSFesL0434BMkknBD4xvckey1Xaa1O0OnIhJmk3dNdtUawhtcczKkYO7ElCYpg8KdWqGl+YchWVGYlOcQBfAU6i+4qFnWpV63wuPTgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axS9aSIXrwBF9jLR7+I/Ojvre/F1Ygmqm4eXLiY7Sw8=;
 b=CJSX0+Ym9S86bFrSka/Qr5JmNc7fqh7rjVAdho+3cwPulJNZrAWjYEHRCI8Ge5wDDgaBbyZPX4ggkXcWooWwlDrSLii2BZ4LHmJEcTdWM829ZQLY0TuS60AeScTTsAVNsvkOxW+jmqx8Lft/C9h5PmOHtmNfRu0zc+PddrHj6ILE6YZ2/ilcw1dTQ7zhDg8s3Hqmjk04mMXcN4WH/W+w3LqWUAf36CkT3mOl+MdSXvJmf8QA+stVfGCznbpGguQgz987sUTJiZIOaoyU0DXhEezjZtksxdou0K19YlxyIv7zAmNWY+mHpnBSP343RBtVcnzGwL0PpKl4UT6n3iwruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axS9aSIXrwBF9jLR7+I/Ojvre/F1Ygmqm4eXLiY7Sw8=;
 b=a6nSn4Vr454FSTn6Dlx7Mr5+na6aAH9mLTjv/kN7+xHlB/1XE1aPxUMSW77WvTuINQ8AraRt+VsvhjkBcA2GpZjcGBd0tPiTL9nITRV3Abh/K8LSfhIWhe0ByqHXDFZxwUKsxgQFiTkZqIi9D4i4la2PKs2rJttprikOXU5X8dw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 04/19] xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
Date: Wed, 12 Mar 2025 12:06:17 +0800
Message-ID: <20250312040632.2853485-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 890266ef-0985-4b39-c445-08dd611b5a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5E/Zkax04/8lL0//Cucc4WmwDakwHc9H42yEWTlmUakTFuhVgm+COQqyYqmz?=
 =?us-ascii?Q?XV7jZU5TtJELzxKNQZlo7D7K1igEjcgC5dwQ3rsmXQlSEM80kPaeAxjuzlk5?=
 =?us-ascii?Q?nDkMuvECYDFCwYt06HgHuHFvrvJQs7nL0paqxLak8G8b27KRAjtXLjJYPoEh?=
 =?us-ascii?Q?1y8heiGzpMJQbyYDxhLxixDjtgnRnEPTWGdxLz8/z7AKcmDXfY5dXesPnZpI?=
 =?us-ascii?Q?/P0ZBwk7gFaPfDtWsA6JgJf7tbGR+XAJfyVaCSj8YgCjuxuCA3izTPkGseUD?=
 =?us-ascii?Q?UXxo2ZDwegN54XcZ8xTK5nMF1peRgUBaO7dtchWCCrp5WkVKVVEkXI7pszHS?=
 =?us-ascii?Q?5ZJXjGMROx33Cn4Fg046SfWvswkj4YZs2YnNM2hl3UBsqWhiv1qDivdwtuOm?=
 =?us-ascii?Q?JgrVrJWtCSwY2BUQmNgABYIWcfux9vmsOviR/1vgrnx52Zl0HYZ4UD39/TKb?=
 =?us-ascii?Q?L5zzuWP+QkCqRQsYb65p0OV0RAXfo+zavbi+eJ2JeyQSDMHOZUiTvIbxHClP?=
 =?us-ascii?Q?W/+V1HxX/Asl6ByILI7U8jHNJHl0Za9eViPCegzrArAzYtCt+L/v9TFps/g0?=
 =?us-ascii?Q?MUPbqtALc21G9novQrmtl2tRR2JIZo09G/5DY3D88Myq86+3a55lRCVcVcMb?=
 =?us-ascii?Q?5Fri0CkZxIBMqkrs2FToM8ElUfi4ryPbLRynjRl65n5Xd35zdnA4OIUBCNNZ?=
 =?us-ascii?Q?8yu6CkK6G2lk2DOPFAQ1kgig9WOfVJaC4AZPHpH3gJAjQ7hw2lP8LDrCFzcl?=
 =?us-ascii?Q?AZZCJxZRp36MPp1rVFCq468zWcHXn/+3hYbnbjSzdnQX0hXW3eA3yBhK3MKe?=
 =?us-ascii?Q?5tSp7z7FyB3lM4hB0DWSPeuH0weeZctJW6tiWPx7fJiEeWNEJCvSOmpLYS/D?=
 =?us-ascii?Q?Ie1EePAqijJ6NdFAmrQiTTMsfgmI+UQ600QXcCu2+rqoU9x/aWFNQHRZR17E?=
 =?us-ascii?Q?rG55LHq1jdmzc4lhopbWAd6jf/grSlY7fpzbcjJgV5DXteFCDFagfJ2GNOGm?=
 =?us-ascii?Q?gqhLZQB5hwe6REVRotIOMFNWbcTM0EORizZov/s3fO1ycy+Txnfr+B1qH+Xh?=
 =?us-ascii?Q?MDd0HND6qZ2qRTecu48tmT5mDoHsB71+0xvUsP54eyx3KJKqbapzXAcZqk7n?=
 =?us-ascii?Q?PiaArG4L5+vGNFNLyka1J4pkYBX0zsNqC4QWO2Us2kqGpEjA71GB1ataFycv?=
 =?us-ascii?Q?ogc5yh0AA3bLbPlJjkgWNGXrRBjfi1h+lFy/e92/TCcPIrBQvcoD7Tp3H1j3?=
 =?us-ascii?Q?FO5ud3sPAFbI+M+RKJ+fOUQAIzg5pXVQBsg1ZtviylER0h4PZTJTPxnFIL4O?=
 =?us-ascii?Q?EGY/24CVhKhojMB8jOljf2itzjiDckfV6LvBwYtU+Lqnub++Oi0Ve9OiMLJB?=
 =?us-ascii?Q?uhS8UQXfyEk4/+pfCI3JqL/+RdOu1GhWg+6sOb4W8C/fM5ienAkpf+3dFmyu?=
 =?us-ascii?Q?lYGOOS2+wf3dXELY6JuiZRl36X/Fnn2er0qmTh2huTcTmoqqBx9ntmBKWYoT?=
 =?us-ascii?Q?AasIDDW2LGO9MEM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:06.1297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 890266ef-0985-4b39-c445-08dd611b5a32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610

Users could only access trace buffers via hypercal XEN_SYSCTL_tbuf_op,
so this commit makes CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 72e1d7ea97..c5f4192b60 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -513,6 +513,7 @@ config DTB_FILE
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
+	depends on SYSCTL
 	help
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
 	  This will allow live information about Xen's execution and performance
-- 
2.34.1


