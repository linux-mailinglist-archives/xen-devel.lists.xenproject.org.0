Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A2B943CC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 06:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128124.1468617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uo7-0001SU-G4; Tue, 23 Sep 2025 04:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128124.1468617; Tue, 23 Sep 2025 04:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uo7-0001PI-Bv; Tue, 23 Sep 2025 04:39:15 +0000
Received: by outflank-mailman (input) for mailman id 1128124;
 Tue, 23 Sep 2025 04:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0uo6-0000c8-Ih
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 04:39:14 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40c41230-9837-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 06:39:12 +0200 (CEST)
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 04:39:07 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::8) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 04:39:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Tue, 23 Sep 2025 04:39:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:39:03 -0700
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
X-Inumbo-ID: 40c41230-9837-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNcZiBw+6a7X0e+90Q098D1T7AC4Sn/x6OENPZrNj189KVKYeNn679bNHXKccFaTeHR2qWfkwWYSUBWqXu+9Z1DTGrm2QtSCgqaax0c5aHhO1G6FJah1d0YZxdXqk5JTZ26IUnSALmLnwfI2gHZCEp6odnWqwHcHTHGffa/1017zIifi4c0LJhpIpoFbGKj4gGh+c3F4QFAVAMHN5svZu3Gb2wgEpkPrmbzuRflcnvyo1eCtLBFKJRt7UtHTxId6C8ShBoCvytrzOpNkCgqWHq3PBrVj9P+jpPATKv7G3BdOg88d1q9VLZDgETtmr8VBUnrRU6xCCQWWDREd6rxqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwwi0tW4Ht3ef4KEnk99tP23MKB3LmcikYL/tmBwt+Y=;
 b=Q4BIAofmkcH1u4DWo1V8b65FUYai57bK/apOoWKrCHwJExH+PT5cOTEC2fWVMTfdZuh7D9mxSyOkyvhArF4w+8Zj+rfLTDat53GTcJGnFsxaziE3+o6qgo8XlxsBImjmbUm8Dvm49C8M+lB5PDABn/1SCVlivEwX4s2gKAJX4OGpDZSvcALpnYD3ToSTM6FYBuM2G+EsCnth9AC2s0pOsv8HsTszRNRQrz85g3EKWSXerKTtb+cb3zy7GD6KTD5eyRrLkBnj+mAN5qcT0aNwNTnSCZ7dhODJN+6ZcaiFJAQeNozn3KEjWdXMVU12WYbj/nmV/kHkrVtAAV8HeIQ41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwwi0tW4Ht3ef4KEnk99tP23MKB3LmcikYL/tmBwt+Y=;
 b=4Ne/DI70kOuyNFcw2xMm4e3P7XvJgUk9c+wyd/dodFmCnn3lm0SvjHc+6P5eurIVWQzlieL1UcyLpVul+PGkbCokwQITIn2gESHyDMK3lzRgfU/WaGqtv3DWfRUeKkXxdPhyApNqj6yg6NaA2TQlwPCS6B7n4uaFnct2DzlwqqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v10 4/8] xen/cpufreq: get performance policy from governor set via xenpm
Date: Tue, 23 Sep 2025 12:38:22 +0800
Message-ID: <20250923043826.3831957-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923043826.3831957-1-Penny.Zheng@amd.com>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|MN0PR12MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: d030d804-fb50-43a2-be77-08ddfa5b21bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mr4IqOx7R4bTUc0P4gRQ0/T+6G1WbwMCdYSblIRoSaNw40bBTRL52+Rrgh9l?=
 =?us-ascii?Q?0Ocm88aZHVLG0NcOn/BGKPENP9akON2cttuW5hBC9+eqT26TLdt1VEJ9VQoM?=
 =?us-ascii?Q?zFmYnJQY/X1Uyu3C71+GuV0+51bsbQF64egterYgnySa9kO2CKWGN9H42i0B?=
 =?us-ascii?Q?cDDRRbHWwNPNYAWj7aapMHGdSaKckzJelhGErZ8s5ZXrqJzdeo5UaQz84ksl?=
 =?us-ascii?Q?b7dsU5l5zFAgIzwXGlk9YiA+3CmwEEBXuYqHmymQ+8T7e95hZWn0UGxauuH9?=
 =?us-ascii?Q?xuOtd20XDRQjR8SpApi848dDzdc2hiWw5r0TjaqElNYbyZcXADlZ8YSb5hGT?=
 =?us-ascii?Q?PsBdGn4k4KUuPyHvKcZPL3/7PP1+LotAs4oS0n85rTvBbYRA8bTCXEDyORYc?=
 =?us-ascii?Q?8F5WRfVB/fvwLDR1Ny0LHpvWPNr/nPHUozJbB5ziz7Q2Z2O7WyH/wgzw1IIh?=
 =?us-ascii?Q?s/PhJhG8AaGDsBNV1gGwv486ybjJjevpNX4ZPmoipV4dChCVcr5Fj85nP4h7?=
 =?us-ascii?Q?Yj9fvd/dJEfw9RIo8Qv9hCwClwIOnUyErUVDSJGwDqD9jJ3r5DXkyWE+PDv1?=
 =?us-ascii?Q?j1eOLDMA+4/KLLZ7MesBtaj0SEKafXLPz65kt1a15ucKPwebMRXhqOLo2NHb?=
 =?us-ascii?Q?fK7uh5/Vq1avdY+sgU01nsJgWHmr3oiPR/Uq3bQ25OxkV7fnTLDIlIxCHmyw?=
 =?us-ascii?Q?0WyUjiqk0+4iJFuHg0z0JmuMKWkv7Zra7UYNQwa1xaggQJLs1xnb1lrHDA2A?=
 =?us-ascii?Q?R9C74qvVSK0qHaZfKe0XwpTFY1kMcKZdsySK3s5F5N0Cj0oJ3uazsamTZn0J?=
 =?us-ascii?Q?yz6xx4l8aQySEFpLFeZzC+c2SDC8GMti99MtXdFJtrBsILcIpFGHM0gfEDav?=
 =?us-ascii?Q?aq9xTi9402xyXAu0TCwvLw7C/TTlE2ozvM1yPh+I5w46if8ibRmjeVfMlkFx?=
 =?us-ascii?Q?Vtgk7V+QuLEcoiNyVWnMsxCgG3v15LvelONfN4bgWuV020hp5NDua+VrqiRl?=
 =?us-ascii?Q?68oCFuA9MY5aBk1YXQfTHx1uERKHb/lALeUpcw65tRigIrp4pppMt2jcBwxt?=
 =?us-ascii?Q?MCk16Krjzvzf9fWho8kIvfHwSRPBoWC7WtgkvFkysvlBRDfiWNsfjVwv8u7B?=
 =?us-ascii?Q?X9e6idZYH4iqfWnshiWMA5r+QvMw0taeAaIjtJs6PHCSN8NRxwWj+IdOEeMa?=
 =?us-ascii?Q?fn+ZA3sc3IBXvWUCKlY2TElVPoj5fP8kwTsJZbGUyf33RiETvwKv026ZKoFU?=
 =?us-ascii?Q?MHcGE7Bmnw2BOGG8kGGDFKdzfQ4SQUTnpB6c8FPvHArme5DUaK/IktxjSM7O?=
 =?us-ascii?Q?Igk/7Pbdgi5pCYSCnmtXqG+S8n6YAFkh4qsgccg83KGeEmrhXtmrAm+PxBNp?=
 =?us-ascii?Q?9a8fRk0K/TUopyyfz59RPJQpJgQ7X62qIuypm+iusqrFh+233pDFDIBeSMNb?=
 =?us-ascii?Q?/ApdWi2mCTwcEk07A5U0Y1Yx37O273xEFA+bSpABSoOs3bG1vmrPcgwxbnYL?=
 =?us-ascii?Q?wF7glNK8uTFR/l6ej0tmxLcnWvuAMrv+TF6R?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:39:07.0050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d030d804-fb50-43a2-be77-08ddfa5b21bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930

Even if Xen governor is not used in amd-cppc active mode, we could
somehow deduce which performance policy (CPUFREQ_POLICY_xxx) user wants to
apply through which governor they choose, such as:
If user chooses performance governor, they want maximum performance, then
the policy shall be CPUFREQ_POLICY_PERFORMANCE
If user chooses powersave governor, they want the least power consumption,
then the policy shall be CPUFREQ_POLICY_POWERSAVE
Function cpufreq_policy_from_governor() is responsible for above transition,
and it shall be also effective when users setting new governor through xenpm.

Userspace is a forbidden choice, and if users specify such option, we shall
not only give warning message to suggest using "xenpm set-cpufreq-cppc", but
also error out.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v4 -> v5:
- new commit
---
v5 -> v6:
- refactor warning message
---
v6 -> v7:
- move policy->policy set where it firstly gets introduced
- refactor commit message
---
v7 -> v8:
- policy transition is only limited in CPPC mode
---
 xen/drivers/acpi/pm-op.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 2f516e62b1..a7eaf29c31 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -207,6 +207,17 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
     if ( new_policy.governor == NULL )
         return -EINVAL;
 
+    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
+    {
+        new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
+        if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )
+        {
+            printk("Failed to get performance policy from %s, Try \"xenpm set-cpufreq-cppc\"\n",
+                   new_policy.governor->name);
+            return -EINVAL;
+        }
+    }
+
     return __cpufreq_set_policy(old_policy, &new_policy);
 }
 
-- 
2.34.1


