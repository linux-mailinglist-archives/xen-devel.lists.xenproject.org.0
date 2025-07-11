Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC86BB011C0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040186.1411610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nV-0002pC-El; Fri, 11 Jul 2025 03:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040186.1411610; Fri, 11 Jul 2025 03:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nV-0002ne-Al; Fri, 11 Jul 2025 03:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1040186;
 Fri, 11 Jul 2025 03:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nT-0002Li-FH
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:39 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2405::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57e3be0d-5e0a-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 05:51:36 +0200 (CEST)
Received: from SJ0PR03CA0062.namprd03.prod.outlook.com (2603:10b6:a03:331::7)
 by DS0PR12MB9445.namprd12.prod.outlook.com (2603:10b6:8:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 03:51:28 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::7c) by SJ0PR03CA0062.outlook.office365.com
 (2603:10b6:a03:331::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 03:51:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:27 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:24 -0500
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
X-Inumbo-ID: 57e3be0d-5e0a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJFBFNAKboCQ6jfkO+d7RJ0fCgKZR0a3GcXa7EsGQjHakBb2+6bLhKBF7vjJZpRnX60lFg/Vul/+fqp2yGsyIR8ds7oa6ppyKkeJOvsSMajEwUhg+voCzqH8a6qf+xmD9lkdzKwbRj7htcbOxxv/HhtJ7wX0JtYxl69SsgVQKEwvBG+4ORTtMaQpfxZ3NWhB7s/YN/n8edE3oWYax6G/1TvtFyES6VjSuM3v+YqgJcAIMp7YKgvX3KBDQhysp/tE0ktMdPCc0LiXQRaIrHssoHCIVITNEJqeESoWq1dT48anLQAXS+DsPLcESNr8sxVY3UT5DGnoVd7dZzhfmpCbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2awlChp7dLL5pIDOe+G8nSJZLVsABrhmbArR1Q1owU=;
 b=BVvkNUi4zasNBG3VP5cxm9jq5M+Dsvfnv4dRz+8uiCrQCsYbdPLjwQyFrqthct78Td8+o6HgaN2YQfGVk1Fgf3CCas6piHLjxzCYrO7JllSokUtBtRFOmiMVvMYnSw9F7NFGy2EGhR9/L8depmuKbmxwdCcvLGpN5Hq+OIrsbVnRRNEW26I32vz3rxCmv4L9HmkPPwNaDPhj9Tm1LxIhhyKXWa+ooX91VTHWjUfCbYCBSDq/Q+r8189xTpCBxJntMc9Lxi79guik1skoZy5MKO1cTrqGlS+TQhOVhJ5S+BQbvyDfQYRrxF8n6U4DvLsFk0u/rHXeNJCsS5FqQhUNMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2awlChp7dLL5pIDOe+G8nSJZLVsABrhmbArR1Q1owU=;
 b=IE9AYglWfR9zZvYtAKlI3hNF9geye/nv22kYlRXKiHCvq3UofoB5jj8ScQSRk/wjgyih+2crA9MHJXa0Xy7Zn5SjJYJdMkTZexoOaxyuF5l0+wMT8AbQGW4hO0nq1Kka0kcxQTtYdH31EYfdIC3GjU1zcmiByTWRyVgjsfAOUjo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 01/19] xen/amd: introduce amd_process_freq() to get processor frequency
Date: Fri, 11 Jul 2025 11:50:48 +0800
Message-ID: <20250711035106.2540522-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|DS0PR12MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 431b7fba-cb8e-4130-70d7-08ddc02e36e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rhIsq9JVz9vMhuFC8+cC0nk+WgOwLwPk0iY+HIC5RZtGxcPcxCHorLS/yFwt?=
 =?us-ascii?Q?KACN+OQXiKmZ+UgCsGoYPrcA5TP3ytoYCn2jNU0tbR3ZhI4xKqeCZ/YKgS01?=
 =?us-ascii?Q?OOzgvc/pkHB63ImKcvMrlTq2uwq3fsoDqLKtxIktJfuJ8DkQpLB/ChH2fyTl?=
 =?us-ascii?Q?q/QOLQt5DgU5RPV/HMUv3sMuuXxaDQ/DLgdmdEHgqGKXx2Ndwi9T4EzsF5lo?=
 =?us-ascii?Q?ZL9qP5jzAo2fambVWA6vAQCUUGDyglmJzHhqzcwKjx6NRMqS8UEqlKZClpz4?=
 =?us-ascii?Q?vj0Ev7/glAtDj37AwImG+pNXcR+5KnriWy8hv+WR3EUCyzbwuCaU+DwAaBLb?=
 =?us-ascii?Q?PCE/lmS1ikpx9NyJWcfmOUHqf5I++kFJ6K6zjv5yOIu7mG6NCNnBxwfPcdjm?=
 =?us-ascii?Q?fHyyL6m3O36QmiX0f1ug/e/qHXglNkAUYkxnfMR/70FibNdQYkHcXO+hg0pQ?=
 =?us-ascii?Q?IVGyF0zSeRBBebUmaA8q34xu53XB+GhLCzlUIVFaG89IvTyHmRXGGjgKRikX?=
 =?us-ascii?Q?QI+7SZA4jEhkEBUji99+uhmPqHVqwc//rYPgVoZRwxaWMjosFAbSMOh2c0D+?=
 =?us-ascii?Q?0sM7j3smQV86tq0iO25PL2m8ZyiEhNrSYTfnqy+k2m35dpBVSPVv5QKHuYRn?=
 =?us-ascii?Q?93gBLC2bCHuiRr7iksdWXI9PiJDBMR4KEv/tL5H0o/0gTmRV6feoIuF2BBGz?=
 =?us-ascii?Q?av2V4V9w8KlQw6daIewRdjiGpTBT6Z5ItoxLMzIlelHvM2j2aWoIwgqIgcz9?=
 =?us-ascii?Q?dvj2JmnJ6YlCIDef0Wem1D6z377yu+Uuk+TDAq3qzNpCBN4zcCylG/piC1ND?=
 =?us-ascii?Q?RcsZFEtewtPe4BFEIt3qZp/e0tTiXiP5Vgbap0GKGh7USYiAYwm7na74LfuT?=
 =?us-ascii?Q?ktLpB91QC4dQGd31YoBc4Jv3hKQ8axxkXhQrNgg1wPhoVK2mmZu72eu7+0Z+?=
 =?us-ascii?Q?I9IBDrKvXVvGwS2BKso92iTgqwq7XDKzXD3N3ODFxIbW3oef3AQfpVWofb7u?=
 =?us-ascii?Q?da7AxgRvv/k0sx0K6ASCIJEgB1J1GAdZoxxOGzf6tKe9BfrBHKRmnGEI87Hd?=
 =?us-ascii?Q?QOSuaPZZiZYcWv4YWa4WUdaaceIj+4b7q92RBXK4XFj3QvNvH2DcMC/Uvd2x?=
 =?us-ascii?Q?B781wNpFGgX00GibUcHVv6tsXZ6NZiiUYYOeJ/edv9jEgh4ScjzZ1EMgxAiQ?=
 =?us-ascii?Q?/pfPcZFp9hxK21Itim1zSJVJYh0znDLgKvqSQQU8hxVQLSvZNO136OJRvyis?=
 =?us-ascii?Q?2S+EmCFcS/sY2oHl2HICluZVPWYIzYGbncu/El6cT4dIq74bCaPktLtd8aOk?=
 =?us-ascii?Q?DgDPJELWrO1pYmpgcxWiBpgsTb0r1IzQbmaDOU6Q3wHhI6k/+Y619KjV9cLL?=
 =?us-ascii?Q?T7HoHbw0/KYsGWVif5CI/WYo2NcAbznU0gbHeedqct5llshmUpgu5/FZgj9Z?=
 =?us-ascii?Q?SXWbspxPBBZJZYcWdIyCUtNJwUpr/iZB50+CEPtqmRjlB7cP76tgC4O1NWgt?=
 =?us-ascii?Q?PN5jFDcYuatxc6MVZcQX8qRA4hU50B8c/ztZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:27.7361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 431b7fba-cb8e-4130-70d7-08ddc02e36e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9445

When _CPC table could not provide processor frequency range
values for Xen governor, we need to read processor max frequency
as anchor point.
So we extract amd cpu core frequency calculation logic from amd_log_freq(),
and wrap it as a new helper amd_process_freq().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- new commit
---
v3 -> v4
- introduce amd_process_freq()
---
v4 -> v5:
- make amd_process_freq() static to statisfy Misra demand
- change "low_mhz", "nom_mhz" and "hi_mhz" parameter to unsigned int
- fix order of logged frequencies
---
v5 -> v6:
- fix bogus non-zero check
---
 xen/arch/x86/cpu/amd.c | 58 +++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index f10e762d76..eb428f284e 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -613,14 +613,15 @@ static unsigned int attr_const amd_parse_freq(unsigned int family,
 	return freq;
 }
 
-void amd_log_freq(const struct cpuinfo_x86 *c)
+static void amd_process_freq(const struct cpuinfo_x86 *c,
+			     unsigned int *low_mhz,
+			     unsigned int *nom_mhz,
+			     unsigned int *hi_mhz)
 {
 	unsigned int idx = 0, h;
 	uint64_t hi, lo, val;
 
-	if (c->x86 < 0x10 || c->x86 > 0x1A ||
-	    (c != &boot_cpu_data &&
-	     (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1)))))
+	if (c->x86 < 0x10 || c->x86 > 0x1A)
 		return;
 
 	if (c->x86 < 0x17) {
@@ -701,20 +702,20 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 
 	if (idx && idx < h &&
 	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
-	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
-		printk("CPU%u: %u (%u ... %u) MHz\n",
-		       smp_processor_id(),
-		       amd_parse_freq(c->x86, val),
-		       amd_parse_freq(c->x86, lo),
-		       amd_parse_freq(c->x86, hi));
-	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
-		printk("CPU%u: %u ... %u MHz\n",
-		       smp_processor_id(),
-		       amd_parse_freq(c->x86, lo),
-		       amd_parse_freq(c->x86, hi));
-	else
-		printk("CPU%u: %u MHz\n", smp_processor_id(),
-		       amd_parse_freq(c->x86, lo));
+	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
+		if (nom_mhz)
+			*nom_mhz = amd_parse_freq(c->x86, val);
+		if (low_mhz)
+			*low_mhz = amd_parse_freq(c->x86, lo);
+		if (hi_mhz)
+			*hi_mhz = amd_parse_freq(c->x86, hi);
+	} else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
+		if (low_mhz)
+			*low_mhz = amd_parse_freq(c->x86, lo);
+		if (hi_mhz)
+			*hi_mhz = amd_parse_freq(c->x86, hi);
+	} else if (low_mhz)
+		*low_mhz = amd_parse_freq(c->x86, lo);
 }
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
@@ -725,6 +726,27 @@ void cf_check early_init_amd(struct cpuinfo_x86 *c)
 	ctxt_switch_levelling(NULL);
 }
 
+void amd_log_freq(const struct cpuinfo_x86 *c)
+{
+	unsigned int low_mhz = 0, nom_mhz = 0, hi_mhz = 0;
+
+	if (c != &boot_cpu_data &&
+	    (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1))))
+		return;
+
+	amd_process_freq(c, &low_mhz, &nom_mhz, &hi_mhz);
+
+	if (low_mhz && nom_mhz && hi_mhz)
+		printk("CPU%u: %u (%u ... %u) MHz\n",
+		       smp_processor_id(),
+		       nom_mhz, low_mhz, hi_mhz);
+	else if (low_mhz && hi_mhz)
+		printk("CPU%u: %u ... %u MHz\n",
+		       smp_processor_id(), low_mhz, hi_mhz);
+	else if (low_mhz)
+		printk("CPU%u: %u MHz\n", smp_processor_id(), low_mhz);
+}
+
 void amd_init_lfence(struct cpuinfo_x86 *c)
 {
 	uint64_t value;
-- 
2.34.1


