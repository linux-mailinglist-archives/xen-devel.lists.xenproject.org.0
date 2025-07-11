Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA5B011C1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040191.1411657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nZ-0003uf-HA; Fri, 11 Jul 2025 03:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040191.1411657; Fri, 11 Jul 2025 03:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nZ-0003pj-BN; Fri, 11 Jul 2025 03:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1040191;
 Fri, 11 Jul 2025 03:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nY-0002LK-ET
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2414::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c2a5c08-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:51:43 +0200 (CEST)
Received: from SJ0PR03CA0089.namprd03.prod.outlook.com (2603:10b6:a03:331::34)
 by SA3PR12MB9200.namprd12.prod.outlook.com (2603:10b6:806:39c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 11 Jul
 2025 03:51:41 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::1a) by SJ0PR03CA0089.outlook.office365.com
 (2603:10b6:a03:331::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 03:51:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:40 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:37 -0500
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
X-Inumbo-ID: 5c2a5c08-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjLgsWB3erP2V7+2fORacX0qZig5tDvVpi5EDqPrQVYN+Z9OeL/gf82rUuidRbE7+heHx7XtJwjaMuEQ/TRzEx5eXhfI5tbCQ/3Ndc979BRZ9lm5rRsNsFGU+T+NFYAz6lh62HKM0IaBIzWvS4TcFTYrMszvGqD53HqYl7kiAhCorr7ycMZCY0Dnb4pxngzQzsX2CYtt3Vls/sRlovpgVcax7SwrCaLI2MTG1d3PtmWx5paKXJeMTNxfC1+9dSJxq2bhKgE3bnZ4ek6my0VlQzsvmSE293I2OFIYSRD/tlOZpNWE7XEguWn8LxbKDYtFNLxQiRqsNWiutzTVL0ETnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubB/KlIGq6E3CtD5EEmAgK0i67QpIoD721G22hmRCEM=;
 b=sDTbORHryntZsfY9DtT5X+jjqOxF/IoP2E/0ksozpVsfo/KCBQyYTWURFEMlqHHI5gU4Q/DN4mmHYS4LKSAUjaT0/cF3tTzX2be54VWSZ/JfOkQB61XLCReJqMxaquy+SeHK9bB2jKBszGS5OSsagTC/3j6YOdel8NQXilnTcBm8ib+RYh8wRwPMT5DMGXjUS+l6HRDH8NC3cDLu/w9xeeYHPOD3cIFX7/D0dNS9QKvn6fLBAJ8b+4yP3segNsQUYCLJkzoFA+lV3Jw8d2zzd13CtPoclb9U3DpauHo15CpT9epe5c37d/MNBCuBbMqm+ew7//nEldTLvKtTt+jYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubB/KlIGq6E3CtD5EEmAgK0i67QpIoD721G22hmRCEM=;
 b=5RL3lriWoynVyD3csnv287Hl3cin/1iRDBfO9gozaDipuF07CcLCil+YLw5A4KJCLcWhkrOuQkSHnYwUJIcYZm+G12JQH4+0Acn8fu8g6hPunYdQm7G40h/q8D71Cr1JBj5am4XzDjo9ba7smYyJlALm6+vA9RapYpPpiUm4Hqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 08/19] xen/cpufreq: rename cppc preset name to "XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND"
Date: Fri, 11 Jul 2025 11:50:55 +0800
Message-ID: <20250711035106.2540522-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|SA3PR12MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: e59d7fc0-9e12-4daa-f666-08ddc02e3ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ydjXN2WTG45e9Xn5xwttFbW+ANdJJzj6IicOUu6+z4+bgH8rd6Tsi/y4nCYZ?=
 =?us-ascii?Q?GyUH4PeQ6/Ia44gc2305rU7Oy86OADht9lGWRkzDp54NQlZjx+oKyOtDjKp6?=
 =?us-ascii?Q?c2B2XpdYFnLznHqpdKUWODeg+FXeQYs3unZBTKLZ+kjgpVlCvtmRY0NqvOmB?=
 =?us-ascii?Q?aIwKC+Lpog4GT7DzftagFg6iwbwQuC4iDegZ3Ot0oFMMFvIPtUMmQgJYWy8u?=
 =?us-ascii?Q?n7tRPHlsxlEcZ1GyfpPQsx5P+2qoeEmK7uK6+aFtqXUKtfO57IByGy4xVigu?=
 =?us-ascii?Q?QTdEegOBTYtiCn167sqaP1RLEBHN8As4oeLZ1ny1qOC4tmmVu00Q8cvtg3Zp?=
 =?us-ascii?Q?vP3A9yluKLSc8kEqxYN6EWvidExdfrE6QwwUHyqCr/K+YHREeoNqIBX7pIpr?=
 =?us-ascii?Q?Ppur3SAQEfWdY1unM7HhXwekHQN2XXQvKfvRw/flxqgqVwtUfpMBfw9hwayi?=
 =?us-ascii?Q?yjkC8CulhtnxadF4KOyf6PzEnvZt33EjEzfIEWe6v40a/lni3+SdygvKoylg?=
 =?us-ascii?Q?C/K36kBIx87LJGmjabdbT373Ug4GoRx8YMtEPLtymRvCzETd45IRaJFfnYmU?=
 =?us-ascii?Q?OKCwV7hGgc5MWwYyrfZAgiQHewrNohiThKOlqfLlqYQrSdGB61I8/d3MJ1O7?=
 =?us-ascii?Q?gfQGiXaMgIUE6LJvKlrjijPIlIf6GKxXF/lscYV+eqHQpE60OUEfMI/oHnJi?=
 =?us-ascii?Q?UGEZKnL1hq4w7VrNtdRI2mSOYtqjelxy19lQpePMHMkhVc2McKq9noy208zQ?=
 =?us-ascii?Q?4/fBOtvb57dy5hWmvMEwkBoNyU/ZWgmBmd2inI36Cy2WIpAzt2/md0njoNBH?=
 =?us-ascii?Q?0IkcDzNhAN9x1q1ldBo2Ur7s/ohMyN9gqi8p71XeWFU0VxDiIVg/LhFKLgfe?=
 =?us-ascii?Q?Fy+inbNDHncEXpeu2gAw6kRvgDbJJBvEF8CnHMQD0zRIMYQFtzP4XxZwceOH?=
 =?us-ascii?Q?gzgDdBiR4K9IwEYG7C2pYZshCIOEZUECMWg++VOWxF+VAe9jsVzQqvsEFDBz?=
 =?us-ascii?Q?///jK+Iy7Omie3EhM49SELXt1O7XyEE6UICDfeiVlhZAkLzJTIU8yvQeVPE3?=
 =?us-ascii?Q?abPk3+tap6yeuV09C3jZnHL+CKVP0umW6PNjRmyE96CHSHAvbTyhrLZVUsD/?=
 =?us-ascii?Q?JXJNR8G8U0eELO9l4h1XNjY4TXLNBgjPzTX5TFspNjkTt5nP6Fo9E+vqOXlu?=
 =?us-ascii?Q?ltprNlEjY8HptZBTwBZrHzLVnNP6SUJZ266j1UA3UXHWnSE3yik2Owcp+xTo?=
 =?us-ascii?Q?WTaD99UwdfrefzL3AhlwOvClZNHPnRRAIqcZJV7IiLRHz9LFCpyHMGpL8YlM?=
 =?us-ascii?Q?AMhyjfT1eeEaMw3gEb52a0ogBI6zlyBNN8/C8mP/ZBnbSAnZSEDXmUgbZ0ss?=
 =?us-ascii?Q?zGEAtuCIsRgj2ak3iqvajMF3W9BAdmkCqPWAp8pxAbaIVjo11f4KOqcnmVRt?=
 =?us-ascii?Q?cC4Qqb/sT8lWrkeqOhZnRpAnB830sVkkaRJKaXlWMVLqlfl8v9PPDUkAJ3aF?=
 =?us-ascii?Q?cQZrYugCZ6ynUgu8uPVG5dI7ZPG3bWjcYrp1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:40.9690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e59d7fc0-9e12-4daa-f666-08ddc02e3ecb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9200

"ondemand" is more suitable to describe a preset in which epp value is set
with medium(CPPC_ENERGY_PERF_BALANCE), showing no preference over performance or
powersave, minimum with lowest and maximum with highest.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v5 -> v6:
- new commit
---
 tools/misc/xenpm.c              | 4 ++--
 xen/arch/x86/acpi/cpufreq/hwp.c | 2 +-
 xen/include/public/sysctl.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index bbe45fa548..55b0b0c482 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -1445,9 +1445,9 @@ static int parse_cppc_opts(xc_set_cppc_para_t *set_cppc, int *cpuid,
         set_cppc->set_params = XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE;
         i++;
     }
-    else if ( strcasecmp(argv[i], "balance") == 0 )
+    else if ( strcasecmp(argv[i], "ondemand") == 0 )
     {
-        set_cppc->set_params = XEN_SYSCTL_CPPC_SET_PRESET_BALANCE;
+        set_cppc->set_params = XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND;
         i++;
     }
 
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 7bf475ecb5..cec2ee262e 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -610,7 +610,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
         data->desired = 0;
         break;
 
-    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
+    case XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND:
         data->minimum = data->hw.lowest;
         data->maximum = data->hw.highest;
         data->activity_window = 0;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 86b6df30e7..aafa7fcf2b 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -430,7 +430,7 @@ struct xen_set_cppc_para {
 #define XEN_SYSCTL_CPPC_SET_ACT_WINDOW           (1U << 4)
 #define XEN_SYSCTL_CPPC_SET_PRESET_MASK          0xf0000000U
 #define XEN_SYSCTL_CPPC_SET_PRESET_NONE          0x00000000U
-#define XEN_SYSCTL_CPPC_SET_PRESET_BALANCE       0x10000000U
+#define XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND      0x10000000U
 #define XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE     0x20000000U
 #define XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE   0x30000000U
 #define XEN_SYSCTL_CPPC_SET_PARAM_MASK \
-- 
2.34.1


