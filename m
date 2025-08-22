Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B54AB315DA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089868.1447406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPOM-0002RY-Fp; Fri, 22 Aug 2025 10:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089868.1447406; Fri, 22 Aug 2025 10:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPOM-0002Oo-9V; Fri, 22 Aug 2025 10:53:06 +0000
Received: by outflank-mailman (input) for mailman id 1089868;
 Fri, 22 Aug 2025 10:53:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPOK-00083s-TS
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:53:04 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:2417::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d344f37-7f46-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 12:53:03 +0200 (CEST)
Received: from BN9PR03CA0542.namprd03.prod.outlook.com (2603:10b6:408:138::7)
 by CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 22 Aug
 2025 10:52:59 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::94) by BN9PR03CA0542.outlook.office365.com
 (2603:10b6:408:138::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Fri,
 22 Aug 2025 10:52:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:58 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:57 -0500
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
X-Inumbo-ID: 2d344f37-7f46-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o93tv/iZkBAB/LD1lXmxm58CvE3bkuDJl/OzKKNRuxeiIOP0coFKgpoDl+TKfWm9n0TSwGmGnAANHFRAcz7saPdPuW7kaAbU0Cm4M8U/sxE5MraCm1AyS4nNXLadWcBXppITMHkLJMmOgxKO+0/6huDk8+RaCTGV9qbl/2kAGXoV2ZjVE4m9+IqIrPX7SY/2YwGtSDkmBwe9wiw30A1qXD2f4D2TN/ZrfS6yj8Fgz44XbZblyScQf0dxFE56HtCZCmtvWbVG5TaenPOGmKS0beEUmR4l3Fx88kMiB112s+28lDujnUOT4h6m113GdQzNk96Pmblc1kSMkNYkm8e+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLTbYK1njhhPAZqsErsutbiJeSbgNEMnbaN3ecpHBeU=;
 b=XSs/pRnEB1ZplZHrUxN90x0k+dNwwkPc2XbQo7L1R3x7QpfQxA/7zUO+f040weV5ZK4aaTJo6LGZ5t5lG/mMBK3B9MaJvFid2ij2wEvKTjo8Y2lrQhy8clNncFBftt4Ezued8cO/t2cIWKY1Q1nKhShaFnq+EPniMLmMQ6ztVQZdw1hj5KmtiybnBzqIiJKEHnpC86CceXuzPIS9Z3T7UJI8B43nAhnBF6rqueLoT1CrRRWqXMZzEFuvgGOFlv/l21zk/eGCF/iJrW8drp55MBOrqE5puJEVa0nlV7V9IDrGy6cl5zplTWJDWk2z1WGAZbXl4KaLEzJ1gw/4q4LtXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLTbYK1njhhPAZqsErsutbiJeSbgNEMnbaN3ecpHBeU=;
 b=RXgjVKt57B7EZhZ2a25ScE5Ib53PDZwOCuropO7p630WLdE1tBf4xI9keal4Avmdt35wn9AMZ69rTguHQkZiAeUWzzdUKphAjtoqhlwTpq3RYH89X6y4oEisMicgpd1gj2DGKH9ApSByz6T2wuNxebg/1EKqZCInJh1jo0c3Y3Q=
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
Subject: [PATCH v7 10/13] xen/cpufreq: get performance policy from governor set via xenpm
Date: Fri, 22 Aug 2025 18:52:15 +0800
Message-ID: <20250822105218.3601273-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822105218.3601273-1-Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 117d4c25-a778-4d9b-de7b-08dde16a0ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?for70UCzxhOhHO5z+o6Av19OWlp13enNA9Vt9a3xm0bVFLtRt/8sAiodfTaY?=
 =?us-ascii?Q?AUA2xtSIUor+qgjnRbksKM3YQBcjmEJT4+mg4eb/rtDTXSkYWUuOUUOxxW1y?=
 =?us-ascii?Q?b1uEVPGms26gqRqaeVjlrxwyrRWGROBw4BYZiQ2BV5iA/oQCUZW5bAfaeJeO?=
 =?us-ascii?Q?HfPEqoQ9kTXTH5zvsD7RqpSTaJC0sTR9tDWyxN6y4CF8+Jz8BnD7YIWunLoY?=
 =?us-ascii?Q?ATUucuvfvBu0AmG+9jzr2OOA+qOJr55DvMFCJT3UB+1FSIYQldF98b51P2vx?=
 =?us-ascii?Q?fper8tlrrrsQfIsPbF3DPDxu1iSvZPMCsxwCw/dm/6eWWxI+T0s9v96K9whF?=
 =?us-ascii?Q?mBPdP6E1DzgH/T5gAp999GefkHPNsnQN/aqF2s9REyQzT8g4LIUZi4w99uEB?=
 =?us-ascii?Q?cKw1d1Is96ivi8XkroT0SDpfJAyFSY9+l0oqtTi6V0sY2TtgyObcADNRYAG1?=
 =?us-ascii?Q?FKIptXA5ijoyWv4N7wKlfsgCEJiPQtC+44YqQWNlIEzDN6e+jwQgQnBAuH4q?=
 =?us-ascii?Q?KB8WuqLehv9+JyOomPk0pTvzOGBtMObIiB6oE3tXTLufSa85Scv2ZoltIdKb?=
 =?us-ascii?Q?eP8cT7AnK/0pJcSK5TlomjaCHAfd6N43t5kBQb03tQ25N1H0HDQimfQ/ETaB?=
 =?us-ascii?Q?cRWxmQhtV2a7yyuddvNjQ/KeExtzem58gG60II+pSSuk1iAtaRlm7PMPhb+C?=
 =?us-ascii?Q?KmVXAO3hdYQmcBwiJqold7a2gU3BoiMZWqb0to4OP+nBH9Rd0T+sce0GFSwi?=
 =?us-ascii?Q?YArBUIGzFT56otfHNwQ7UfP74FqL1zCTVglsF8hnzBNTMV8tptXAnBUaN+eQ?=
 =?us-ascii?Q?AbO553M+/mJtBxiSmqH0pAS2LJxBNbjdpB6d2D6vflf3gxNlbg0h29VF8SFa?=
 =?us-ascii?Q?nIRnW3SUg+nGumsOM6LHwSQtxND3bJyYDb2bGMl1OLU4Pu+QUA+MlZ8QWBDv?=
 =?us-ascii?Q?trhFziIcayVrtwAkEPv6gdShPTd40FpNn9vtINHYe0qiuwnUqaXHv6aWQUmV?=
 =?us-ascii?Q?o4AYMu7FYJlsE2ZnuNedaJM3Z4S+EB+Oi4oPQasLyxZnyZ5uqlYARCNXdf7W?=
 =?us-ascii?Q?3n2AnFzB+4Mqj0SMnzKz+Iko3ag1/4C7nP+qrQQVxsP72fCZFs4kfaTipwFn?=
 =?us-ascii?Q?05vCh1E6RvpEqdu5fzSAjBSd9WfxgOMd47tv7QpfEhLlb5BMijBcRxfcPgK5?=
 =?us-ascii?Q?DpB+VIkHQp3LtJOhqD/6f0RCL3x5oAh+FWWZtXZ5b+4Y7qCz1/jq/gs1krMg?=
 =?us-ascii?Q?+peK2qfg+Kvn1Ne5mjuifPeznWpUU7912LcItdv4XY/zzIVXWdqV9ryqZbU5?=
 =?us-ascii?Q?kYgZPbsrC36MfpSEU2uJiCMjH/oy/i0M+zkPa5nI9Q3zVJJ39jeHxh71+aL1?=
 =?us-ascii?Q?7j/oUhgR4j6ME0fOIzzkiIx2L84WjQofSwD+58Sy1q6gTaVfk87AueOkia02?=
 =?us-ascii?Q?zx5Izxs5YDjSLWnyCzxo/mLC0dJ4bNDQ8ny4PkF8S2ks9hMseLiB+bWQIv+Q?=
 =?us-ascii?Q?3VrHNWZORF5sGPm6qe18j52V3nU6lNWnDSap?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:58.6415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117d4c25-a778-4d9b-de7b-08dde16a0ec1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177

Even if Xen governor is not used in amd-cppc active mode, we could
somehow deduce which performance policy (CPUFREQ_POLICY_xxx) user wants to
apply through which governor they choose, such as:
If user chooses performance governor, they want maximum performance, then
the policy shall be CPUFREQ_POLICY_PERFORMANCE
If user chooses powersave governor, they want the least power consumption,
then the policy shall be CPUFREQ_POLICY_POWERSAVE
Function cpufreq_policy_from_governor() is responsible for above transition,
and it shall be also effective when users setting new governor through xenpm.

userspace are forbidden choices, and if users specify such options, we shall
not only give warning message to suggest using "xenpm set-cpufreq-cppc", but
also error out.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
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
 xen/drivers/acpi/pm-op.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 427656c48c..6991616c1d 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -206,6 +206,14 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
     if ( new_policy.governor == NULL )
         return -EINVAL;
 
+    new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
+    if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )
+    {
+        printk("Failed to get performance policy from %s, Try \"xenpm set-cpufreq-cppc\"\n",
+               new_policy.governor->name);
+        return -EINVAL;
+    }
+
     return __cpufreq_set_policy(old_policy, &new_policy);
 }
 
-- 
2.34.1


