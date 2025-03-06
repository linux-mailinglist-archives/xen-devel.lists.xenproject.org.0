Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C34A54525
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903123.1311129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mg-000614-J3; Thu, 06 Mar 2025 08:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903123.1311129; Thu, 06 Mar 2025 08:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mg-0005x9-Ch; Thu, 06 Mar 2025 08:40:50 +0000
Received: by outflank-mailman (input) for mailman id 903123;
 Thu, 06 Mar 2025 08:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6me-0002me-RG
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2009::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b32e965e-fa66-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:40:48 +0100 (CET)
Received: from CH2PR10CA0004.namprd10.prod.outlook.com (2603:10b6:610:4c::14)
 by BL1PR12MB5729.namprd12.prod.outlook.com (2603:10b6:208:384::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 08:40:43 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::67) by CH2PR10CA0004.outlook.office365.com
 (2603:10b6:610:4c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 08:40:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:41 -0600
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
X-Inumbo-ID: b32e965e-fa66-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MH2cikLeq1NYwU6AhzgRsuIUKv1VzYk8B/6dEaGk5WAZKg98mXxG+dgEDwtN8lG0Gll538913DASA9Ud5BOsEkPBD2p80ek4U6Lbw+/9xvM9SfASR/P4UYn+Fjdf+XuUD6wA7Saugb32GlLgdBtgoNLIlxmJ4IlzI18mKar2RSDq2pIuDDu2N1/zSAqX4HSAeaJ254QoSqFkOxyaaEvZj0XZYvc6kJ9jDHNJmx3DDSuLTMvV8EPEr4GbptfEupLL/FS+4DnC2g69/ZaqoX6azHryH7JVaLvuYYYHBgc9gjwAD+hljDQ1SM+ITeamiM9AEJCr2b64HC+QRF1BREKgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BfnQ5dP3CxeHkbX6crdv0E08fIf7w35NJx7zZuBUh4=;
 b=s+mlZgLZocaKe8Vmd5RfaXQZoGzHRA/VfLCC+Vy2Pl9ENdmLhjsrV8RB+8W6qxs9nFFz4RfjAXq4JQDuo37Xyw2qS3zi/wbjaqsDAOa54So4SUgZs0ANM6po0kUNR3N3PoAx494UYA5O3A8MSx3bCml+7oL9lA5tuCWwS4JuFAp2HAvCIDF/u+WtlHlRxm2GYkXu26l72v8g+T8rcU8RJM121LP2SOkGHtZO+aZnNSiJUvXc373fcx9G0zpHtKHVOsNGZUp4yxIFQD3HJOdzY7L6HQ8wfTJ0mlDVQMQlLrejLThCbiU+o54UyHP0d/4Iz2Kvvv8EwscMuaT37XOrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BfnQ5dP3CxeHkbX6crdv0E08fIf7w35NJx7zZuBUh4=;
 b=cj7NvY5wnQ9AsjOJbJebOZZ3Cn+qsePR7DvFIZ84wpQ/lLnzFQ2eAOTd2UmWZQ4Gx53TvvlLG1smm/4eEWPm5pntI5hPLyGiWgvixGOfGH5HZmN7kHyOoumMryjOGAF1LtVRZlg68Xw/5iEpJ+jPimKW17Y6Z2I+Cmek51oPfkw=
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
Subject: [PATCH v3 11/15] xen/cpufreq: abstract Energy Performance Preference value
Date: Thu, 6 Mar 2025 16:39:45 +0800
Message-ID: <20250306083949.1503385-12-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|BL1PR12MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d76491e-93fd-4d54-e324-08dd5c8a952b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kE+g4dO3RxQYO+VoVWwivurkr1tuO6haErHxlQLzTTHVXLsvJRZo1KDZtHVS?=
 =?us-ascii?Q?ePgaq5sHh5SjS7yD1SzicFAgO7pk8Nr4gsmVNvjacoyWZ4iEc3AhXeZelKR7?=
 =?us-ascii?Q?A1zM/ConlX4b+vzSIIt+BCAVHtZakQyetURRXRhOHEjGHP0V4I/8Ag504NLX?=
 =?us-ascii?Q?a9YbzsxNWiNh+a3I1uPbwHYPR1y9AV698e7EiS1SV2JMwMuxSWLOB7eARcXp?=
 =?us-ascii?Q?zwrBvgEdy2sHoulddDoYSz1UuvVvkQpk0+9FXPzE4Y4FA5jxlEyO1WKMWcTS?=
 =?us-ascii?Q?hHeiS7xkiWKdUHAXgyW5sg/tkPkQ5CR4HqR63ICTJDyGOeejHELaq6Uf8cMh?=
 =?us-ascii?Q?jQDvTL09GizGU40Egb0Ny0sLPjpFOLZrjdXPhkeGwmNeyjIQlzd7g0mtow0A?=
 =?us-ascii?Q?0ArSs7p2SYuqmWP7K2AgR4iWROEzKaoAwX9S8XLV1yHLrxrhN6OUjETbuPZ3?=
 =?us-ascii?Q?9MYC8PtPdyGpYs3yS2Yd7D1zrpzYM1v8LH838XLX9fzi7H0A22UUIzo2pK+V?=
 =?us-ascii?Q?RoS8PaPiv98Bz7m2uGrEcCBglSobyDnvHWRGRXi/WpPnxJNbSiIrGaBo6CaF?=
 =?us-ascii?Q?uMiX6tGTtlNzRiyO8rU8IpjkHEkBP2BJ3J4q1VIO6jZWcFkFCUNPqlLUVjmT?=
 =?us-ascii?Q?DlZwKcViPkOes0X1xP2YVkPNvsHk7clhNTh6bFLvoEyzcbi4xBFUIplBE2Pi?=
 =?us-ascii?Q?R6jNNCxWOxddvCnUC3vDmTQRvUlUOnIlkbB4D5NAwgaul+sEaQ48G9ztWUek?=
 =?us-ascii?Q?MnzI6aFs4LnJ4FzINXmmzGNdH74HzR7VX2tOXh2nocbF9z3Bd8CJ/7EFDwDU?=
 =?us-ascii?Q?yT4wxgsaRYgw0s2Q4dRMDfiNOXPbL56dezTSDCD11uMVJpihl269hD/W+bo9?=
 =?us-ascii?Q?pPYFP+a6jni2Xs2TPZkuB7zl49yS0sLSNCChw745YkyzHDsJDSO8AU+D85ak?=
 =?us-ascii?Q?hDh1mLFA+IAHVqGQa1vv7olJyJF53MgfN+tMrg/LZZIIL2LANtvo6I4CoxQn?=
 =?us-ascii?Q?b6LzqfzNeAfEkJ4NqChfwqQIw9kouxbMNf02qdjnzRT6nN+QZgoqoC6qnG7k?=
 =?us-ascii?Q?kz2VS9nwBXZi9ip+Keqei1wsVN+1snFvl/mjp4CY8bxo0AvFTJKXr1XtPvMW?=
 =?us-ascii?Q?9SoKAwvueVhqdT9VkkK+Rl+n99ITRfdwcAWZ/jh0pJM02D1HZNL5U1UNxpFH?=
 =?us-ascii?Q?RJ5sGHOZTiqKrjOwh05qVIPt/mQ0cChiFAFMmP7B20dwyWTOoF4yFCsBShMs?=
 =?us-ascii?Q?dsiPO1ZBTsFP5rrAUcnFDWZx5Kl45bLOyle4cYpBfZMmjBrk8JfMjNxDe4SI?=
 =?us-ascii?Q?JjNMngtRAB4CKJzZCN83Yy/14CPZSVdRVBjO/q43NImuNpBb9LYn5HiNXYfR?=
 =?us-ascii?Q?WwAPxMa/lHZmNBHOsVRR/BwZAtIpkJBGKVjFX9wC+CknSZsEe7+/Jwqe9aHZ?=
 =?us-ascii?Q?84rWNpQ1WHP4/B8A3XJb5wjJRmCOE3rrUGKBqjFtX6goO0T4qMGDSRW6onN/?=
 =?us-ascii?Q?ST11CC7TEs8I78A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:43.3464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d76491e-93fd-4d54-e324-08dd5c8a952b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5729

Intel's hwp Energy Performance Preference value is compatible with
CPPC's Energy Performance Preference value, so this commit abstracts
the value and re-place it in common header file cpufreq.h, to be
used not only for hwp in the future.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 10 +++-------
 xen/include/acpi/cpufreq/cpufreq.h | 10 ++++++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 59b57a4cef..d5fa3d47ca 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -21,10 +21,6 @@ static bool __ro_after_init feature_hdc;
 
 static bool __ro_after_init opt_cpufreq_hdc = true;
 
-#define HWP_ENERGY_PERF_MAX_PERFORMANCE 0
-#define HWP_ENERGY_PERF_BALANCE         0x80
-#define HWP_ENERGY_PERF_MAX_POWERSAVE   0xff
-
 union hwp_request
 {
     struct
@@ -597,7 +593,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
         data->minimum = data->hw.lowest;
         data->maximum = data->hw.lowest;
         data->activity_window = 0;
-        data->energy_perf = HWP_ENERGY_PERF_MAX_POWERSAVE;
+        data->energy_perf = CPPC_ENERGY_PERF_MAX_POWERSAVE;
         data->desired = 0;
         break;
 
@@ -605,7 +601,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
         data->minimum = data->hw.highest;
         data->maximum = data->hw.highest;
         data->activity_window = 0;
-        data->energy_perf = HWP_ENERGY_PERF_MAX_PERFORMANCE;
+        data->energy_perf = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
         data->desired = 0;
         break;
 
@@ -613,7 +609,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
         data->minimum = data->hw.lowest;
         data->maximum = data->hw.highest;
         data->activity_window = 0;
-        data->energy_perf = HWP_ENERGY_PERF_BALANCE;
+        data->energy_perf = CPPC_ENERGY_PERF_BALANCE;
         data->desired = 0;
         break;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index a6fb10ea27..3c2b951830 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -253,6 +253,16 @@ void cpufreq_dbs_timer_resume(void);
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
+/*
+ * If Energy Performance Preference(epp) is supported in the platform,
+ * OSPM may write a range of values from 0(performance preference)
+ * to 0xFF(energy efficiency perference) to control the platform's
+ * energy efficiency and performance optimization policies
+ */
+#define CPPC_ENERGY_PERF_MAX_PERFORMANCE 0
+#define CPPC_ENERGY_PERF_BALANCE         0x80
+#define CPPC_ENERGY_PERF_MAX_POWERSAVE   0xff
+
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
 #ifdef CONFIG_INTEL
-- 
2.34.1


