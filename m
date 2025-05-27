Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74324AC4AA6
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997948.1378797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq04-0004WY-LO; Tue, 27 May 2025 08:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997948.1378797; Tue, 27 May 2025 08:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq04-0004TH-FW; Tue, 27 May 2025 08:49:32 +0000
Received: by outflank-mailman (input) for mailman id 997948;
 Tue, 27 May 2025 08:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq03-0002ks-Dk
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2415::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d9f72c5-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:26 +0200 (CEST)
Received: from MW4PR04CA0168.namprd04.prod.outlook.com (2603:10b6:303:85::23)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 08:49:23 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::ad) by MW4PR04CA0168.outlook.office365.com
 (2603:10b6:303:85::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 27 May 2025 08:49:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:23 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:21 -0500
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
X-Inumbo-ID: 7d9f72c5-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQJuWyfgUcSW5EWmCEOpawdrIcmRWaw44IlnMO/acLFqL150kFStkvIyrIMzLagvVUl10uLnpWIQTFn32ShuYOgQDyZAe33JfCuaxz6rTJQuxd7mZO8bBd9gauwWnz74HE/0OAxi1AmrVrX/yo2/nlFPorJvW4TyRc9PRFrdFRfgjvyYGkNYaAqjrBo0cgZjI7ujoL8iQV6+d5sroEzVjJflUcg/7E4Vdj8Viz8dKezQhoSn6eCP+Pee3QUiMSyzqBve/T6bPWOiRn1AwS6gMkg/q6eHPSwTOEFQwWMvcVIUslWxLEQtB6Qk0+M6ukGqhH5549EmgGrTTUnJ5mLf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93mFFL37UWEreuoxsuCgjzGv/0KWiWMS2KGPmS4EzyY=;
 b=Br9KoLFEX/Wf5n92tFkIsK9UPqaBogzFgYYaHT96hDnb5i6woXHdvZVDLsfla56rgqeXAI0ZprEIWC9LNXh7kDMvG3aBJLFSuULob0X4WHk4UjsBj/jjxHvygWA7HqhrUJUCdfPG2AUNqaI0TPZkoNVQ1BePu8sL0dkCNHwGMRxKz/pl2xinHdE7BYhPMZsAz61Vn9Ya2tKDeO6aCu+oieNWTrCLXPoxRjbGeUFnoRKaKcS8YpUSW6Ud6VVKW5oHNkbbxAp9kDfB1ZS4eJfRaQKhnXsD/pyi194CZEKTlYY9kCRIgGPirePllVxZlowNgX3c/KeeE/TB5y6IGysUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93mFFL37UWEreuoxsuCgjzGv/0KWiWMS2KGPmS4EzyY=;
 b=050QCEvHZcvX3U+EgOE6nmGnxThJFlGVfEqI0DwP5X6VAxIbCXFIqNDMDa/wDklWbBxFvVVMWjy2ED9s0BT7eqnJj3nJDyLiHK8VXQwUIwQc4rkyVlNefblL5qrw82rZ5O21fOE4vFJXDp29ZhThugBSBs59VgwyhYyjeRY4d/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v5 07/18] xen/cpufreq: disable px statistic info in amd-cppc mode
Date: Tue, 27 May 2025 16:48:22 +0800
Message-ID: <20250527084833.338427-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 026dcc5b-e27c-48a9-f7df-08dd9cfb60d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1uChrA5QQCJsBrY/Lg1/t3Df+4WmQZA83uxtXmWRgue53CLw/eSRv91M6lPQ?=
 =?us-ascii?Q?dYJZ5/9f/B0gBKgMwfTHCWt5tfwSX8AwggW5Vdy4X1uWmwPXOeyZieYv3M7f?=
 =?us-ascii?Q?ZLvAsfBCihKyxIxpY6Sk090YKVJAlrMB0Lj34ib2RkupA3uBa2RB8Lw0bO4c?=
 =?us-ascii?Q?n5tKnp9WOgdoHzWfaN7mWh5dyuuif5Cx0V/xLBP9tFmixJgjIaQK++dt+x2s?=
 =?us-ascii?Q?DaquNh+yRvF5Zd1by5z4rbRAn8nWEqHU1rtTjjmr135ihmZLT6qi7axTlXkl?=
 =?us-ascii?Q?8aLZXTwnFtRYJQ1J9OEHZG2Cz24jjgeEVPGqatjdZHzCLbONY5eJcG7uqkTK?=
 =?us-ascii?Q?afEzSQEYtXFndVjP8+dEdhADxIHc4HBelYyLUUTiZOVcvDHjSriF0kuoMxuV?=
 =?us-ascii?Q?ysL6fzIrfyM3yoa5QPTkqcevBXR24EnCDCFJooQQdEx7prBJzFnJbH4jx/2p?=
 =?us-ascii?Q?YOiyDMKnU7a3DeUDAjMc8uEvOyq8SRg11ya18DL0R/xwyzLYJsTOeNY56b2Q?=
 =?us-ascii?Q?q+rlTrWV9xvCXD3i4T3dwaCfszX2v9TZe3UgnUjiR2lCG+0KDhGp/2qBtEt7?=
 =?us-ascii?Q?mucGAoTC95NLJDCW8AHKukUlqzoxnBt8rx91kfPyD/P/x89PL7Bz3w0iULos?=
 =?us-ascii?Q?MGn/LBaO5o3zPST0lah2KLhwc1WDU963+d6OTfMED/3T7/Y4AlKFnFiuF+cL?=
 =?us-ascii?Q?wnhllMEkNrSe5Hc0XsMQSNNHba5wkkLlPXE1POQt8+G3BiiZ0N0Z+YUGZOto?=
 =?us-ascii?Q?PYl1dw9GG97OYdGdjzE6gmB/Ag+RhLnPZhZFqTQhK661F+MAH48iuYfOvf51?=
 =?us-ascii?Q?LjzDILNzYQxwrZbp5mAibIL2IkbzigbNYnCdkNjcr8fAilu4AujYnqQt4s4h?=
 =?us-ascii?Q?ekGrlvjC3vBr0g6ETitfAbGRycTERhAXROkVuQQx1tmXhtzrfUa/A/JaoALe?=
 =?us-ascii?Q?alruiAZSnBNQ2A9fa7kl6VzAYg6amJTHzGvM/3GxhPqsSuSLDr3Q5lYe+DN3?=
 =?us-ascii?Q?NJnApaFMiagli234X8waQ6LUIXETsVN4z8YkwdcEQrlmfFKn1XoFZ+xYTMHn?=
 =?us-ascii?Q?ZvRGWG1zJEY5qLZ1gIPgpxOr/zqjRuhA9zGcFU2yze25J9FoMx5Nn1jtZF79?=
 =?us-ascii?Q?HRJws8nFBaRpZ5c4+UDC3NHzgJLWJXfPtQJjsUSTww67/E4y8iNH6xkU76ou?=
 =?us-ascii?Q?uEuz/p01EWnsEz7y4WZsUbMFw0VQiR9MTyGubctgBaKM1Ytq/aAvELlzWOAr?=
 =?us-ascii?Q?qKHAXzF9LW2rYyHp0IfsbvduKk+Ss/Ryh3QLCN04dieZzdPJrdYAWZTRM2fw?=
 =?us-ascii?Q?J7xCq0ivMf8W7XoyUzyMcGc2dLIK9uuQy5KaL9VBx+NUKqxMYMXYW38uawOF?=
 =?us-ascii?Q?/4QfTMNgwj9eE+kdOr7zPdx2wZS/nedSEKz89ITtfphM3G3903JSVZC+8Qil?=
 =?us-ascii?Q?/p/ERrhNGU5uzW2n36Q1JjXb9rNZzvsCN+vP2WEF8Hr93vADaeh8Rhohf+Yb?=
 =?us-ascii?Q?JQAwUi346cz4lcHHOdRtRHSM617HXGHb0oNa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:23.0639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026dcc5b-e27c-48a9-f7df-08dd9cfb60d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240

We want to bypass construction of px statistic info, while not bypassing
cpufreq_statistic_lock initialization for a good reason, in
cpufreq_statistic_init() for amd-cppc mode, as P-states is not necessary there.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
- remove unnecessary stub for cpufreq_statistic_exit()
---
v4 -> v5:
- refactor commit message
---
 xen/drivers/cpufreq/utility.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index e690a484f1..b35e2eb1b6 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -98,6 +98,9 @@ int cpufreq_statistic_init(unsigned int cpu)
     if ( !pmpt )
         return -EINVAL;
 
+    if ( !(pmpt->init & XEN_PX_INIT) )
+        return 0;
+
     spin_lock(cpufreq_statistic_lock);
 
     pxpt = per_cpu(cpufreq_statistic_data, cpu);
-- 
2.34.1


