Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01EA54521
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903109.1311077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mX-0004DC-7R; Thu, 06 Mar 2025 08:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903109.1311077; Thu, 06 Mar 2025 08:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mX-000493-3P; Thu, 06 Mar 2025 08:40:41 +0000
Received: by outflank-mailman (input) for mailman id 903109;
 Thu, 06 Mar 2025 08:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mV-0002me-7F
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2009::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf85bdd-fa66-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:40:38 +0100 (CET)
Received: from CH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::29)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Thu, 6 Mar
 2025 08:40:34 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::c2) by CH5P220CA0006.outlook.office365.com
 (2603:10b6:610:1ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 08:40:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:34 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:32 -0600
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
X-Inumbo-ID: adf85bdd-fa66-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiGkm58SIq3A3nnw6v6N5KFzImrZEmlVc120q/g042Eqj2qXDjS3V0c7fBCSjbK9Lt5x7LlZlwWd2Dpl3lWyTu8lrhrDa+QDD9CRUPFcVEMKdX/nPj6TFmLXYoX+3ltSAVplFD6e1q+354Bs+rht1CT82nanRY/E3WtujiZoX0J5iTBSoqbYHo6Cpqj/JoTkQ6Ee5rPwRJQ1JwjZnNmS7pmHIwFgVm3a0DvCzcATlAQwURwY9oEhwxSCRFeYYnMoWNw856UTpPnEm4Jlk1DJLVqOV755Jk/WpjW+g9vWF6FuI90dmq0nXqHhMu7sJ4en9ZLt2fotG/bERRF1l0O+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSdlpwHNaFj5OS2imbtjum5c5CmmJOs5A2Jk0nNrpsQ=;
 b=WR4ei67p+3Kq6Wp4SuMfFVx+v9y4WBbnhNQFkbvXl7CbDtp35t4Y+DRAeQXO907XbfA47yR+Pqvzh3rq/gXoezW72PlCs2S18bKgSWvcDAAqc5Cj0hDja/h3qP1MXcMDZE8ZeCbg+UXKrzE8359ekM2ofI6jGoU+5YcMFlCTXKFyrBtZoCocm9YH6CHfl+gvd9ijUIYI3hb2xOZfXMwwBwmkTGKte3l9yzfjbt3YqJVmzcS/KgvHdqagMGDw3VeRWOOux8v//dIdpc4QiQa/W1ggVCXl0TCZW8CLAcHZUiVSrFjv6PcKrgjx6+EK2vobpJLGeb5liGkSNP/AatYenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSdlpwHNaFj5OS2imbtjum5c5CmmJOs5A2Jk0nNrpsQ=;
 b=uFz02SrxFqG2q+00nXev7OH9gITS5DQAraXLXZU5azZ9T6JqnPeXzwvxbEcHhL73nSjRPuIdWCCHN2G4fpYMg6sTZrMbAD9QYGH4T412dujZU07WyreHC1qGHGAzWG0jKKfUzYB9VKkuA+WQuQwbCvEDsWQ3HU7G5ifrVZgNVm8=
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
Subject: [PATCH v3 07/15] xen/cpufreq: fix core frequency calculation for AMD Family 1Ah CPUs
Date: Thu, 6 Mar 2025 16:39:41 +0800
Message-ID: <20250306083949.1503385-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d509fc-7ace-409e-4f05-08dd5c8a8fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pr41rT1nieL4lrsw+V4JYD9MPfYoHWN3eArCKJkJxOlHZPIdWyf7H+3JRYRt?=
 =?us-ascii?Q?vIT5/jJR1a6NVLSxeRIVEVXY0E4DmgmOQFjz7IoCTuvqARouBaTQKltZJJJF?=
 =?us-ascii?Q?jl3MtJSlUjxkrkZo7dKcNPkh5z/ScLCjLduOr5BwXzo1d/diD2344OLpxJJy?=
 =?us-ascii?Q?A46kGYfGF6zjq9f/tHNX9pLGN0afPZw2hjFos4HyKmXrYlgN8ULKVqs4DIgZ?=
 =?us-ascii?Q?Y5UxR9XE3rbVeOXHQtQJuCV4WjE+uCdE7lKIFhqSgMKuX8uZxs56Dj5XopKe?=
 =?us-ascii?Q?XhM4vkcIlZu7jW7P8R8Bn90xQRmPZtT0AKilQtwLpGRRIAD4vaSBgglnSoth?=
 =?us-ascii?Q?+e5g7R2Is89me+p2WHkse9Ar+sz+v+X6+fSRMENnju4E4XI/OFaVJrcpaKZM?=
 =?us-ascii?Q?mjrPast2ifERKCkOnz9wCan2805WntrqIx3SZM4QrpVBYpZ/k6Y6zig1xJVu?=
 =?us-ascii?Q?0O0NtkNbk9JYrGo8PzA4ZiXb2CXGn5g4CL1cIwL9MwO1jfsvrrbmomilRI9d?=
 =?us-ascii?Q?Pmd+Aq2OdqRBnT9g8pq35T0PUCaAf2/Nma51/K2+PVNF2HtomnABNNeGjS9U?=
 =?us-ascii?Q?uHCcogdYax9XtQ98uJbUUg9O1DpD8i5+rz+tWLqt6hpQInSYKVDfGNQLDnKg?=
 =?us-ascii?Q?bfAfKfLVVqiRG4A5emuE4j8/sbi40qKxxx1ozLVJ43w7/ESw8Dlea3m/nQZK?=
 =?us-ascii?Q?lNxETwnTSxgJQcRb7QC5ODtEw0Ag4uJyqqMgyahe+b3OEP1w33CNO4OVRrE0?=
 =?us-ascii?Q?nqkA3XMqz2sL9hgbjHYFtQSfmH6FC/kA+v6kQy64TOmgzpPhQLAH1Gnirqsw?=
 =?us-ascii?Q?c69GvADM5svZIhu8BijIbsMFteEn2ZDV7GTIT6w/eaolqTGU1p84/kJvvWla?=
 =?us-ascii?Q?FtQyiIonLTSB/FiFQrb10y+TdZpGlTY9rF8fcybxD/FQ5/moQkVSSI1YIaRB?=
 =?us-ascii?Q?E2swfR+0hE8Uvpsst9DHjeAfT66Nxgg0Fyj7vzf28kIyQaj9NtLo/e+aGr/h?=
 =?us-ascii?Q?XGykxa1llovmX8FPrRF1OzZ7iBZWpvmXbpnoD+i8na9S95ZJdRxJgonZrMMp?=
 =?us-ascii?Q?LykzqBP6q/KxvRDj2DIQ/OH6caxY/EkqqiihrmjnJ9QV/b/W9YvtMHb5NTL9?=
 =?us-ascii?Q?lU3kHSdNkCbi7c90UvHr+qOdhELbfjsCkQ+gtXz/TUAbFt9VPcnclLjru6cN?=
 =?us-ascii?Q?q4A8LAFfyydB7o2McD1S5xlU9eRR4s9+K/aRYFE82aV9t1BH92vUmt3Ep3xo?=
 =?us-ascii?Q?oVrzFihMs0xYJ0L/PRMG5LB6trdnkG5tuHRgkOQk1Vsbj/N5fI1y8lRlDrSB?=
 =?us-ascii?Q?mCoOX8sg7Do190ngjVp8WNe9k0si5yu+aSEQbLKd2B4N9oGbJ29ckHJItjja?=
 =?us-ascii?Q?LLNMS9M+KoRFreQReAzl8c6BatEcJvzG9xaTWHS5mqMyD7fhAprxhan5cXf1?=
 =?us-ascii?Q?77nywQiCf/8vlHdQFQ+MAL9GF37nq/Gt/yjtZ8V0OHlJJT6NXQI3anEOMGmQ?=
 =?us-ascii?Q?MVcZb8mEiwjiKvo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:34.5477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d509fc-7ace-409e-4f05-08dd5c8a8fed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438

This commit fixes core frequency calculation for AMD Family 1Ah CPUs, due to
a change in the PStateDef MSR layout in AMD Family 1Ah+.
In AMD Family 1Ah+, Core current operating frequency in MHz is calculated as
follows:
CoreCOF = Core::X86::Msr::PStateDef[CpuFid[11:0]] * 5MHz

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/arch/x86/cpu/amd.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 597b0f073d..7fb1d76798 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -572,12 +572,24 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
                                                           : c->cpu_core_id);
 }
 
+static uint64_t amd_parse_freq(const struct cpuinfo_x86 *c, uint64_t value)
+{
+	ASSERT(c->x86 <= 0x1A);
+
+	if (c->x86 < 0x17)
+		return (((value & 0x3f) + 0x10) * 100) >> ((value >> 6) & 7);
+	else if (c->x86 <= 0x19)
+		return ((value & 0xff) * 25 * 8) / ((value >> 8) & 0x3f);
+	else
+		return (value & 0xfff) * 5;
+}
+
 void amd_log_freq(const struct cpuinfo_x86 *c)
 {
 	unsigned int idx = 0, h;
 	uint64_t hi, lo, val;
 
-	if (c->x86 < 0x10 || c->x86 > 0x19 ||
+	if (c->x86 < 0x10 || c->x86 > 0x1A ||
 	    (c != &boot_cpu_data &&
 	     (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1)))))
 		return;
@@ -658,19 +670,20 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 	if (!(lo >> 63))
 		return;
 
-#define FREQ(v) (c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> (((v) >> 6) & 7) \
-		                     : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))
 	if (idx && idx < h &&
 	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
 	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
 		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
-		       smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
+		       smp_processor_id(),
+		       amd_parse_freq(c, val),
+		       amd_parse_freq(c, lo), amd_parse_freq(c, hi));
 	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
 		printk("CPU%u: %lu ... %lu MHz\n",
-		       smp_processor_id(), FREQ(lo), FREQ(hi));
+		       smp_processor_id(),
+		       amd_parse_freq(c, lo), amd_parse_freq(c, hi));
 	else
-		printk("CPU%u: %lu MHz\n", smp_processor_id(), FREQ(lo));
-#undef FREQ
+		printk("CPU%u: %lu MHz\n", smp_processor_id(),
+		       amd_parse_freq(c, lo));
 }
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
-- 
2.34.1


