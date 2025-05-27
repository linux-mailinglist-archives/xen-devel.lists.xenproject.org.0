Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE8CAC4AA0
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997950.1378806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq06-0004rX-Ti; Tue, 27 May 2025 08:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997950.1378806; Tue, 27 May 2025 08:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq06-0004pA-P0; Tue, 27 May 2025 08:49:34 +0000
Received: by outflank-mailman (input) for mailman id 997950;
 Tue, 27 May 2025 08:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq05-0002ks-IU
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:33 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2406::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7edf1484-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:27 +0200 (CEST)
Received: from MW4PR04CA0111.namprd04.prod.outlook.com (2603:10b6:303:83::26)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8eb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 27 May
 2025 08:49:26 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::4a) by MW4PR04CA0111.outlook.office365.com
 (2603:10b6:303:83::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 27 May 2025 08:49:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:23 -0500
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
X-Inumbo-ID: 7edf1484-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwoXOERUPPlwihA55ZpHz2ggry8FuEpPnVwi9HdvUVcGYEYfiBs1ZSKb2/LJjdclkjzt9Cqo8u651xvzbnrCwK4hCZKKN4z5QMIecv6VShEp3BOM2dkPVDtky5Mx6ivcroPgFqeg73qh0eqUx+k+aqdOASevopqp6Ta6+NeUT/KQtoOfukNo0cwPod9lUkw50O5bFaGUxpuR5gkAoHWpM83AEPcmj4IxoIdR0apvg9fmpe4Kggh+Uj/NgTFK4to5RabI9BWfbUmN7HcruIixbuou9tmT1uYDOfN8o4+8gS8fn3fkk8arUr4ytHzyVqkI2JeXsyPg/9yJ1kzldpDnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqussZlEDCnPtBb5mzZXqL0cjmGI/C8X5Nz/eBwRzwE=;
 b=qgr0J63srFFuB7XMSJySF5a4WNFEeSrNsDq6UL4n+7c6s2M5QBv6BYJ6dROVRMf+x+nErmnVMQ8ij2Ck3GeBvy0sCcbvCWLwRxst9YAvd+f44qKMDmg5aAxXoYOnMIc4n9gtew3akiNH24V6/G6LPV+p+l/iPhB961zVhhZ13eBz9Cr/OKXGp+NTTJIR+rx18FyG35ZPqq1lQ/wqbwRPUbGvCVJh1rKLIKwfRRD5/rPsDNZpikyv4QRiFFMR0g6r2x2Xl8Vap+LCanI1NuEsXe48Id7e8ymIpOkKeTEyTGNVEW4W30VCTZ8cZFIVPd20QH6o4/I4OO6YoJGtb8li9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqussZlEDCnPtBb5mzZXqL0cjmGI/C8X5Nz/eBwRzwE=;
 b=P5mO4zhWgXhB7jTuBFJnf7C1djQ7zx1IgFJYl16cyY81XHZjBBJs78sbSboJvqRCRGxzOUQqoBdkBd06aaY+bE/21UelU39JrzuvwW7ODTXbFiHthNNt0rS5/kSuZPuRhIL29OK128KxceQJ35Eela4qQ6JdOGT7u7I8EaJ6N8s=
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
Subject: [PATCH v5 08/18] xen/cpu: Expand core frequency calculation for AMD Family 1Ah CPUs
Date: Tue, 27 May 2025 16:48:23 +0800
Message-ID: <20250527084833.338427-9-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: c53ac519-4550-44db-00b0-08dd9cfb623e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DX1FKoRp5aCZj7LmXYX31ELx7kEIWUadWj6/jNGNTvxijWJ5As9eM3Y7F4Xz?=
 =?us-ascii?Q?qDlyH/9niJKKJNJhQlx9aByzjOzUm0Nx40Ml86eoq4pA9YHmWEwtTg39OouM?=
 =?us-ascii?Q?iNR3Zg0YAv2EW7baQdVUHDTProdbnaRmuZbN00oxwiOFdq7fTE3PfgrHMLIK?=
 =?us-ascii?Q?5MESZN8un7kzyo3EmG4+/AMlWcXyCf9AJpg1bXLcp2lsXSn+ZvFAWo6xiupj?=
 =?us-ascii?Q?XI5eHRS2cpU3S95XKHyZ/sglYqAVvVaUrgKsXhJMpI1+8RU/x/m3UoCmNZKi?=
 =?us-ascii?Q?v5NSAzNL+Ah1IdWmNw065VdAcCGcKZcjv+feDtgUGRZOR2+gWWWtogDIzZYk?=
 =?us-ascii?Q?SwpbtXJK5php8mkjQS252nsuuABE1863nMd9AXrsEJTQlmi+j0+YZA2Q1o86?=
 =?us-ascii?Q?YqA8JQ7GTTSirs0oPYUh2yk4tnSkk9oN+G1JdVA7SPzBXGV7FUyg6Iu+oa54?=
 =?us-ascii?Q?DzSU0ulqbAQvliXiNcU7YNbhvm+eefu55LsJwcNtf4ptRpAKPlMrRBkyCqPm?=
 =?us-ascii?Q?r2GkOiNWSsU9JO0BfaWdP1Nu7RotboVZd0izUSXhT+QELEzZe0etBZ+UjEce?=
 =?us-ascii?Q?XdJlJqdCLtyWN3r5xQPSiT+NTPNJ9/Fl6zpEgy/EDCwDyS0D3G3YIWAxCcfb?=
 =?us-ascii?Q?/qkYCvOaxjdqYopXUxEU7q08w4ABOMGqEv2RP6wkO8+jVlqdow2JyE/9HC0e?=
 =?us-ascii?Q?ENYTgZSUE/aUDbh3ydHUulYKxa9BUGt/36Edb8v+1raUKpQXGWnmaE0dSqf6?=
 =?us-ascii?Q?KnLwiffw2B2v3l79DlUqBcYSRBMdvlJnQNrjEAl+diQd2MLRBm4AIL94SAPe?=
 =?us-ascii?Q?5X3Zx4NkWX/rTMJTHIOoykbs8I5UPh3MlTXkbMrLQzVKiHBOo7ZxQwC2oshh?=
 =?us-ascii?Q?NvBuie8CliewznvvUSke5tFPXYwA4ZAeEPy29Q3BhJDrL1FjHPw6D7VUNs9f?=
 =?us-ascii?Q?XEcWOpRDh8G9VVt4c286anA9hc3+78LgCrfp6IvLrI+skIyAzINbMg19caDk?=
 =?us-ascii?Q?UWos78+HmOv0wp14J8t0qK+BGJ6nxuBfkE/qVEALAabFx74ygioPZoBX67IO?=
 =?us-ascii?Q?W2rc2RpDr9LqTGAFNIRM7FVix/S2pu2G/dCYuNJoOP/5cme67xySTY6RWIzj?=
 =?us-ascii?Q?rj1GQjPiZyjKHiKdkzCNaLTICUW8xOwssM25YJulNEqUGXUzOjgb7aswoqKD?=
 =?us-ascii?Q?FKqjm2DANsBUv+/wUYrDRcMbKtlTpphadLVGsXvtylVgE0s58xM7cNv6ST5Q?=
 =?us-ascii?Q?Yx6qrLJbKVhShgIRswsHM2H4wS3wzlcpzZaL4ZO9sD+OSWXie2nmHtXaDnac?=
 =?us-ascii?Q?nbCANK0xpqRpPfRMAeSnqj1u8k6BXGAhRov+F8SE5hYDn/P7R/Vf7goqvDHb?=
 =?us-ascii?Q?SwSuXPe/qFQmPUWSy19ruI1XQGc/LNCGvcXbVs7qNfJeqPlUL43UNAUzyEBc?=
 =?us-ascii?Q?oy48+bSLIBiq7Z5e/BLUR5+g6F8TbQ+oAtYi8KjVPVpzGK4kh7TtU28w/Ic1?=
 =?us-ascii?Q?j6nQUg2rWlYoN7L1tTHPO19GTZ+5FHcoOkz3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:25.4165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c53ac519-4550-44db-00b0-08dd9cfb623e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE

AMD Family 1Ah CPU needs a different COF(Core Operating Frequency) formula,
due to a change in the PStateDef MSR layout in AMD Family 1Ah.
In AMD Family 1Ah, Core current operating frequency in MHz is calculated as
follows:
    CoreCOF = Core::X86::Msr::PStateDef[CpuFid[11:0]] * 5MHz

We introduce a helper amd_parse_freq() to parse COF(Core Operating Frequency)
from PstateDef register, to replace the original macro FREQ(v).
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
v4 -> v5:
- change title from "fix xxx" to "expand xxx"
- change function parameter type and return type to "unsigned int"
- blank lines between non-fall-through case blocks
---
 xen/arch/x86/cpu/amd.c | 49 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 37d67dd15c..3770d75150 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -583,12 +583,40 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
                                                           : c->cpu_core_id);
 }
 
+static unsigned int attr_const amd_parse_freq(unsigned int family,
+					      unsigned int value)
+{
+	unsigned int freq = 0;
+
+	switch (family) {
+	case 0x10 ... 0x16:
+		freq = (((value & 0x3f) + 0x10) * 100) >> ((value >> 6) & 7);
+		break;
+
+	case 0x17 ... 0x19:
+		freq = ((value & 0xff) * 25 * 8) / ((value >> 8) & 0x3f);
+		break;
+
+	case 0x1A:
+		freq = (value & 0xfff) * 5;
+		break;
+
+	default:
+		printk(XENLOG_ERR
+		       "Unsupported cpu family 0x%x on cpufreq parsing",
+		       family);
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
@@ -669,19 +697,22 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 	if (!(lo >> 63))
 		return;
 
-#define FREQ(v) (c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> (((v) >> 6) & 7) \
-		                     : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))
 	if (idx && idx < h &&
 	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
 	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
-		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
-		       smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
+		printk("CPU%u: %u (%u ... %u) MHz\n",
+		       smp_processor_id(),
+		       amd_parse_freq(c->x86, val),
+		       amd_parse_freq(c->x86, lo),
+		       amd_parse_freq(c->x86, hi));
 	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
-		printk("CPU%u: %lu ... %lu MHz\n",
-		       smp_processor_id(), FREQ(lo), FREQ(hi));
+		printk("CPU%u: %u ... %u MHz\n",
+		       smp_processor_id(),
+		       amd_parse_freq(c->x86, lo),
+		       amd_parse_freq(c->x86, hi));
 	else
-		printk("CPU%u: %lu MHz\n", smp_processor_id(), FREQ(lo));
-#undef FREQ
+		printk("CPU%u: %u MHz\n", smp_processor_id(),
+		       amd_parse_freq(c->x86, lo));
 }
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
-- 
2.34.1


