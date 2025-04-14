Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B572A87923
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949120.1345801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERr-0001aI-Rs; Mon, 14 Apr 2025 07:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949120.1345801; Mon, 14 Apr 2025 07:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERr-0001Sd-N0; Mon, 14 Apr 2025 07:41:43 +0000
Received: by outflank-mailman (input) for mailman id 949120;
 Mon, 14 Apr 2025 07:41:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERp-0008Gw-Rt
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:41 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2414::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e601b433-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:39 +0200 (CEST)
Received: from CH2PR11CA0006.namprd11.prod.outlook.com (2603:10b6:610:54::16)
 by PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 07:41:36 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::e4) by CH2PR11CA0006.outlook.office365.com
 (2603:10b6:610:54::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 07:41:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:33 -0500
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
X-Inumbo-ID: e601b433-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsOBQKWmYWWOpsqD7clXsJ2zCRP+AFcUVGrNE60FJKaAkNIeReMYaq5kdAdjY0JmuY6ARKYBqR2OBPWCsUd1Zs0jFscEpCPxEgQ/PoaGveppz8CsSqRvY0GV/Gic6IveHU55tcDqQ+OUNfGpKrK4t2asU7ElrNY2w84IE2iJ1R2X04XHwBIoFfUsY9HZeQdmRqji6/0KMADC6qGIydgfiFi/RR0clJ27EHrJ7Ofw97LH8FWi1uolCyHDMAiK2+RMRRLBnqsfuueb9pUauHjCRN/4LcTrdIsk5sclCa8dY7zxZYFIwCUXxS4Xa8IL7OgXo898x1C6T2Or+npmMTFgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me5sAYfb9Z0206IEeWjK2IPQ8kh9xFtijBTOrQZLx7s=;
 b=hgFKq9ZMla/ivXxBG+Qg7tavpQy31s4u791EFAyLCIVsPZTfg4IAsJN+HG3m5WYcMsnT8NnGzPGTJM+iqjJjlBXujZXcYJc3ZzvzYyFwra8S+Hap+87XD5ZHCW3i0+ImycgX/fNlnn36pYeENcbU+apiu6CF536EewKPxT5AUTdO/RvWTBOHNlZvJ1rc2VKFHgNNaW/XOWiv1klC/6dBWPiBSaM7d5PWtlEKgxGMEIJ3B1GMW0PZQ0cyAXBco+1nfZ2D4QIRHG8ugs4hsU3dZesnPcfoQ1/Kez2+wunqVwR0VqHxAO4xbAhCfvMY7i6UME1ArP1NLT5awP94V+tY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me5sAYfb9Z0206IEeWjK2IPQ8kh9xFtijBTOrQZLx7s=;
 b=KCW417IUmDL+j1l+Lq0W+oyIQ9FE8ayYQU8ItF7pth7Y/RnOXSP7nTvpnjod/G9KPyzSn+QuD0P/K/rqJKSfdOsE80aMs2t9yBDjYbo5CmbdPxBdXPKdX5iwjl7WqeBkr959derw2MVpq1GS5mRHZ2hhen7voqNd6TdVi4+qjL0=
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
Subject: [PATCH v4 07/15] xen/cpufreq: fix core frequency calculation for AMD Family 1Ah CPUs
Date: Mon, 14 Apr 2025 15:40:48 +0800
Message-ID: <20250414074056.3696888-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|PH0PR12MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a58ff32-fd03-4fa9-3d5f-08dd7b27c8cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yb3V3iA8XiedLqm1m66klhXGpWMmqW2e9gkMCAf+EEWlkyfMN01zzidBLnEU?=
 =?us-ascii?Q?uLlFvElcpV0/JTrnJyTwEV3SlkcA3XQtUQdaWNKoSjQLeqZA9rVw6Yj3swB2?=
 =?us-ascii?Q?RhTsuAy4UfFE8TF7VHvjp9+uewL9EmG4UKhuor0jnhG6nX7FiPwBry//Kk6T?=
 =?us-ascii?Q?VwHV0+xMN7mXlNstM2Yda7A7lc3jl5jQ/413P/QalV50C0x4KdYNISAwJ3Dk?=
 =?us-ascii?Q?Ku6sL5tv35Z8May2Wz83a3LZpuoxWKZC0v5b/PVuiTVPHkntMqacEsAFl0yW?=
 =?us-ascii?Q?PgTW+4hwSIvPY3xlOxBBQWUAFLAuSzuHIAzpgw4ioWvzJmCpMBXQEx2sKAg5?=
 =?us-ascii?Q?1m++RnInSdnNjTwebENNBW3kpcSip214wEAYABphr9t/+RHVcr7z4bNmznv4?=
 =?us-ascii?Q?AZSGSR4IuwVVOLF8ivE70MJtmEmIBKbYYYdqengOdG2OJvIDDt0rVtgOezJN?=
 =?us-ascii?Q?7RHJ8neGt2qPZoV8HBSXTPSdRua7k5KbnpCg3l97fACVSA2d0mFOcjJx9bO2?=
 =?us-ascii?Q?miM5Y0eKbKcVHC8Rnrw2pnTLWIwjX8OudXMQHYDBegKaimNGbWkvU049dz9M?=
 =?us-ascii?Q?61ZefpAFGIiI3vUI0TRY45T3j7TXMsEJBz+Oi5riHacjixHbpKKb73vrV6fv?=
 =?us-ascii?Q?v17z0jTu0gUaUXmPzSMIpK5QP3qoHydFya+asVOcjgE9AisCyXJ1kQuhGO+V?=
 =?us-ascii?Q?eCjqZyQEBJvW9YOfvpmgglxrnTpe+W2Fh5RhgxuYEvbZB9ecoOqLAFLh9wRR?=
 =?us-ascii?Q?bHCHyQmLL3+mFAaKBo34KwEmInMRSnBeYWCMzKxLIlX5ilaz91eg1w3QgrDz?=
 =?us-ascii?Q?XfiWXtmm5LX5EpW5ZyPb6tb8L84FV8biZJ4Eg5Pdv0b8LUHkL0LZZONPbbNE?=
 =?us-ascii?Q?7Oq+eRXPXv2vrBCm2+Zily1qMJeNf+CWu2YvkROwovrnJK/2+p4qpXrUsk8O?=
 =?us-ascii?Q?yUMGE6dzG8M50wrb845/BLbhLy344iF9OyZ5SvhpRw+1FtURTYj3+X4+tX/G?=
 =?us-ascii?Q?9Fdaf42hcq03BDzbx+Wax28JFkf7C3/UU+LI+9vW9eta+7jlqs/63pwcs+4d?=
 =?us-ascii?Q?HSu5KBJxCESC20TbTsTQd0zAyFPhCJIJMrpRmpN909xJlIhKLVE6d9dTIVSO?=
 =?us-ascii?Q?Y3AyhDAxGnocGIGeNl34WszP14Q8lz36W+M/vGAmNw76rRRR2PyZbxN1rwYb?=
 =?us-ascii?Q?N7VObPP1jQk18SNHvsloL6E8/3x3aG7MzYx/LPOSoKvxEvF1ZtLrNnJ0h1KK?=
 =?us-ascii?Q?7jZ8UYah83LgFitmrCI+/0Yv7oSxdUathjOY7pl3ynprewPJJb2CvsrWPUH/?=
 =?us-ascii?Q?W1KExZumb9kMbAX0Cv8Smn+dwDYxF6u1IHXkpy8wMcreV/etk/dnpdILW6xJ?=
 =?us-ascii?Q?dg+Mvr1pZOwrGNjIpah7wTv16FIVjzZlDuO9aSvL0Gq3I1bdPuwtoTicvQEK?=
 =?us-ascii?Q?qHMl+vVyKttmxTFB+X1mtrosLPmH5t9q9eC3QbZBb7QpdmcYSQ7R0N/6PoKC?=
 =?us-ascii?Q?7j8b9pgsy1MC73ii1Dbyw8ReXjJWtxfgq8xh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:35.8557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a58ff32-fd03-4fa9-3d5f-08dd7b27c8cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7982

AMD Family 1Ah CPU needs a different COF(Core Operating Frequency) formula,
due to a change in the PStateDef MSR layout in AMD Family 1Ah.
In AMD Family 1Ah, Core current operating frequency in MHz is calculated as
follows:
    CoreCOF = Core::X86::Msr::PStateDef[CpuFid[11:0]] * 5MHz

We introduce a helper amd_parse_freq() to parse cpu min/nominal/max core
frequency from PstateDef register, to replace the original macro FREQ(v).
amd_parse_freq() is declared as const, as it mainly consists of mathematical
conputation.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
v3 -> v4:
 - introduce amd_parse_freq() and declare it as const
 - express if-else-arry() as switch()
---
 xen/arch/x86/cpu/amd.c | 43 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ce4e1df710..f93dda927e 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -56,6 +56,9 @@ bool __initdata amd_virt_spec_ctrl;
 
 static bool __read_mostly fam17_c6_disabled;
 
+static uint64_t attr_const amd_parse_freq(unsigned char c, uint64_t value);
+#define INVAL_FREQ_MHZ  ~(uint64_t)0
+
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
 {
@@ -570,12 +573,35 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
                                                           : c->cpu_core_id);
 }
 
+static uint64_t amd_parse_freq(unsigned char c, uint64_t value)
+{
+	uint64_t freq = INVAL_FREQ_MHZ;
+
+	switch (c) {
+	case 0x10 ... 0x16:
+		freq = (((value & 0x3f) + 0x10) * 100) >> ((value >> 6) & 7);
+		break;
+	case 0x17 ... 0x19:
+		freq = ((value & 0xff) * 25 * 8) / ((value >> 8) & 0x3f);
+		break;
+	case 0x1A:
+		freq = (value & 0xfff) * 5;
+		break;
+	default:
+		printk(XENLOG_ERR
+		       "Unsupported cpu familly %c on cpufreq parsing", c);
+		break;
+	}
+
+	return freq;
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
@@ -656,19 +682,22 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
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
+		       amd_parse_freq(c->x86, val),
+		       amd_parse_freq(c->x86, lo),
+		       amd_parse_freq(c->x86, hi));
 	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
 		printk("CPU%u: %lu ... %lu MHz\n",
-		       smp_processor_id(), FREQ(lo), FREQ(hi));
+		       smp_processor_id(),
+		       amd_parse_freq(c->x86, lo),
+		       amd_parse_freq(c->x86, hi));
 	else
-		printk("CPU%u: %lu MHz\n", smp_processor_id(), FREQ(lo));
-#undef FREQ
+		printk("CPU%u: %lu MHz\n", smp_processor_id(),
+		       amd_parse_freq(c->x86, lo));
 }
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
-- 
2.34.1


