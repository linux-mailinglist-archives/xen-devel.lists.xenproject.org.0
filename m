Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9291FAC4AA3
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997952.1378817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq09-0005DO-8v; Tue, 27 May 2025 08:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997952.1378817; Tue, 27 May 2025 08:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq09-0005AU-1q; Tue, 27 May 2025 08:49:37 +0000
Received: by outflank-mailman (input) for mailman id 997952;
 Tue, 27 May 2025 08:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq06-00031E-S4
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2412::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 822d7d1a-3ad7-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:49:34 +0200 (CEST)
Received: from MW4PR04CA0118.namprd04.prod.outlook.com (2603:10b6:303:83::33)
 by PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 08:49:27 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::e9) by MW4PR04CA0118.outlook.office365.com
 (2603:10b6:303:83::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 27 May 2025 08:49:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:27 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:25 -0500
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
X-Inumbo-ID: 822d7d1a-3ad7-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urRXYl3tw+ppii7D9eVrfmRZztVCoCRuR58fL01kMrhYX8IC2XJwXG6c+sQtPlQd0RgKshAnzgwrceT6orvWs+zt6f0rZEwqZMEkNDDidf31wwL7VlZgjQnOwZjxKawbMEGFPOrL/p0aqUHhZEhIWsfrOqvne6502GCF/lonJzVOoidRF8y078ijc784Ymn/Wb5wnoZLNzUf5xQWDcALcmv/lX2Qx3noqf87b6meo6t5PboBiBgW8fy1saFN+gftiKKny0RZ6Luk7pfgGKNrFP24Hit6qB+kM88W6ULZzWuq9tvVdnFwp3zEq7tGIMYrjyVI7GkDlQ5xzLrKCPy65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BWhhOPQucu2ODRuY7WWAlw1Er6mBiipSyVknf/cvyA=;
 b=KZRMFERKW1dPcfjzPLA8RYdB7mEZQ3Fa3Jer5FmWIWbeEsEih1Q9/NWbwley/De0QPrBoqWDUPHOdRNd5GzTm6ahLZPiaTxhdi+wJF/x2yHxzcWZhqlNFY/HIHGDYCF6tzGg9gMuX/VEJc2x8lgIL6X/LKK8TeVHRwoOpkIM4A4m3bW7oFXf2BaR1ui7eIei+dkWayvZRojr4Em19rjzGl9FrlfxYzZLCq2j6UNck5fwlrjfUI+d98kT9POixFp9K8Q7ulKDjC7teOJPpRv1nCZMWdSRzHe+yWrwx1ktcFRoTSksy2hYBU2dJBLs0o7T56EZm2EvJr8cgzB3jhl26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BWhhOPQucu2ODRuY7WWAlw1Er6mBiipSyVknf/cvyA=;
 b=m5lDl64Mm0RXJXvvX2cbaqx1+3gAQBxQUJjHgxE6fWR1ypsOlIb8fEUkL9htK8tlPRTBisCwsY4lmQX1byoWuUv4zeHw4hQKr2aOQf+NxC8r46ev4mEooMcr4mhBDYRZVxcb+gfOueNaplmwTjjIjT9/6Nd29a3twsDkI8gtjbw=
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
Subject: [PATCH v5 09/18] xen/amd: introduce amd_process_freq() to get processor frequency
Date: Tue, 27 May 2025 16:48:24 +0800
Message-ID: <20250527084833.338427-10-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 3092af6a-75ee-4d88-0e99-08dd9cfb6336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hAikFCHUKY9Vdc34o/wCC1vQHcedoivFVBHtZwrSkfoD6SzUfizKv14SIfKY?=
 =?us-ascii?Q?n3s0D+3O6SDwvA7VqJ1J62qQ0zqdpri6oR0Zylwy3hCP7o7Bl7xhMroa3GB/?=
 =?us-ascii?Q?4xAA3tDUq/uX0STEvtFKHITVR5Aon9JMPqFR8pn9hRzcmmkEf7Uwgmdu0264?=
 =?us-ascii?Q?bbLWdtJlRQsZsJMb7mSDh8Wq3G4ueZDmvfbQy2ctqK5RUFDgh3tXSRjfKYLI?=
 =?us-ascii?Q?3+V3NUCfbsk4SI59ykXrslF+oUnJFP3YlHoi1dPkbrzcSdkZwVckBXex1tYT?=
 =?us-ascii?Q?9MmMt77ipAsAA/CCCPlTfBQTfAJRah4lVUE72qMvN9j/fPEwM59zzsXRGW+H?=
 =?us-ascii?Q?+nBZY+C0Ab7RwdwjLMP2GEUF/AtLwdOsNqpFk6x+AK520G9mww9V+0fWX4pD?=
 =?us-ascii?Q?XuR8aDQZQ610cVv0onuNmZMH/TjIj+roig7pFKKSIgFmAxG2wDJlut37+9Rz?=
 =?us-ascii?Q?ik+IDAJClwNKEo6sWETdqcDNeE5tCaQ++VJmttKDi5ggvFoLx3RF+uK0HOF0?=
 =?us-ascii?Q?hj2gZs8JITOlBRKF6I3qZvOzdWQxfuVoDWAFIAwXszHvW2+lTMh6EpM/9bHT?=
 =?us-ascii?Q?CWGbfKFnVej5sBt979PO1dGrMRQEaPDQ2Ucicygl7r+n/8zL4hxLu4DtVmqU?=
 =?us-ascii?Q?ya9z+9kWEuPJahRH/c6q069x2m56njVsuQmpei0A+mY96YEedFgn/yEOAEZl?=
 =?us-ascii?Q?f1rSqmK6b7pJuvXFNJpO56La/FBBVtD62w/ZALCNppzvU/h6TYUwR2tmgLCl?=
 =?us-ascii?Q?jxFtbyrPtR4V4/Gw65AqqRC2IkacqQ/ZzozPI4nsejbAbqxQyXLAUMGZKceM?=
 =?us-ascii?Q?KVWiLuwUidxuTMzVsOegFNWFncS4GbHMobzyExfvE7WtCq3ZBR1uvpvPZ4In?=
 =?us-ascii?Q?dA00OO2Pd89l0KpMNbcJFZOVrTXgBoN42owe0aezo+YBYOIRsiAuyfWir9Mq?=
 =?us-ascii?Q?voFPWWyLDm/XmoMCedG4pk7+fUmvdZIJVEI5KKTEJIORLZctHhRoZeR3BfWZ?=
 =?us-ascii?Q?5jMWSQ9imDPQSUwAQTNqo3+dMb58AWr2wjZH+GR1WyenY5XH+gPgxvOUByo6?=
 =?us-ascii?Q?YhtPJDW8rWajPR/t9yfde7G7kcfFAO5FIhCpkDgcxsO5aPNdN0mS5kR3fS4d?=
 =?us-ascii?Q?mNHj5RJnSJaF8dHZ9uH3XXPhzmaFV69NsOkgnTaJmmZy3ZYK1AIxJG3UKWOP?=
 =?us-ascii?Q?ryHryK+vtKYYS0qX8y0a8KKOo7gwhG0YHHL0YdPv/XTc/xJXF+t4AavokwwN?=
 =?us-ascii?Q?uCoZRWLbbH8nT45NZDNNNM/C275dM1vzwcMANnmUIq0IYxgxxGMMo6nqUlAp?=
 =?us-ascii?Q?HNR5QOcrNKs+YOCft4uPufciNtHSGGTw+hInaV+2toOgODiZuR0moWE/xtp3?=
 =?us-ascii?Q?uG/nFsrMBNALWCaT4TZfrABJ4IrclMlWaRU133Ra0lgule7jOOS0Ceufqz4V?=
 =?us-ascii?Q?fkI6fSy3HPqWwq03B7WxP1dBiSl3IkA14jGxEz1QAI5XQmmML/arXaGNi+Gv?=
 =?us-ascii?Q?+2imevSLrtwQAAyEDQgTk2QY4/zp8r7I2O3N?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:27.0416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3092af6a-75ee-4d88-0e99-08dd9cfb6336
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076

When _CPC table could not provide processor frequency range
values for Xen governor, we need to read processor max frequency
as anchor point.
So we extract amd cpu core frequency calculation logic from amd_log_freq(),
and wrap it as a new helper amd_process_freq().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
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
 xen/arch/x86/cpu/amd.c | 58 +++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 3770d75150..8c985466fa 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -611,14 +611,15 @@ static unsigned int attr_const amd_parse_freq(unsigned int family,
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
@@ -699,20 +700,20 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 
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
@@ -723,6 +724,27 @@ void cf_check early_init_amd(struct cpuinfo_x86 *c)
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
+	if (!low_mhz && !nom_mhz && !hi_mhz)
+		printk("CPU%u: %u (%u ... %u) MHz\n",
+		       smp_processor_id(),
+		       nom_mhz, low_mhz, hi_mhz);
+	else if (!low_mhz && !hi_mhz)
+		printk("CPU%u: %u ... %u MHz\n",
+		       smp_processor_id(), low_mhz, hi_mhz);
+	else if (!low_mhz)
+		printk("CPU%u: %u MHz\n", smp_processor_id(), low_mhz);
+}
+
 void amd_init_lfence(struct cpuinfo_x86 *c)
 {
 	uint64_t value;
-- 
2.34.1


