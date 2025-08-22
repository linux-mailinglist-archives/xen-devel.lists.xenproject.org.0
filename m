Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A629B31604
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 13:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089952.1447438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPWN-000739-NI; Fri, 22 Aug 2025 11:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089952.1447438; Fri, 22 Aug 2025 11:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPWN-00070N-Ht; Fri, 22 Aug 2025 11:01:23 +0000
Received: by outflank-mailman (input) for mailman id 1089952;
 Fri, 22 Aug 2025 11:01:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPOU-0008I9-Rc
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:53:14 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2412::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32b556b1-7f46-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 12:53:13 +0200 (CEST)
Received: from BN9PR03CA0068.namprd03.prod.outlook.com (2603:10b6:408:fc::13)
 by PH0PR12MB7930.namprd12.prod.outlook.com (2603:10b6:510:283::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Fri, 22 Aug
 2025 10:53:07 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::ad) by BN9PR03CA0068.outlook.office365.com
 (2603:10b6:408:fc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Fri,
 22 Aug 2025 10:53:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:53:06 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:53:01 -0500
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
X-Inumbo-ID: 32b556b1-7f46-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/Kq0BIOh3bFOoEjS0YP80rhr9n2r6dnp0M7HkDiQMAR+XV+ZQ04XriwDULseOg+dDjOkeQXLSrn/YLkO8XxgozP3eaeBipMO0ytz+fYvM5X7hh0++tf1FDCg14HMYPObpzRjab+eKCow3kjr6S6y2DlZci+mIpYHlNhMxJYAoqgQxxo43QWUFJf6fHdUaX4etbCdhTYE/++BTeqanntLybDCDyQhTh/rLf1zNUz9dfao4c4SAfbw7gdxWuY9nNcxFsqxFFmoM+zJFl2SqV2c9ZyBifOKs0SxOQL5c6BnFZt0iu41EQyLV7OVjQPogp0jhl1nm3OBFWuYx1NuEQ39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTlZDSs77RAc8eyO6/n/oa9e2ajwpZRnfhyHi6uhQhY=;
 b=mINira9xBTjVRDFJPtJ6wzP7S0C6QHIuRpqgAormujkr3f/jwTCOCMAcvQwUbGtC/MVYb4pDJvy6/LN7+jNstr9IIMOpgNHbRAlnsNQEhvVJVtwbpBT+tPCKJYGdQGaZQI0jZ6kLtedIExkENH69qVpqWTdXzQRed7iGXfigqezeEBdfJRkMzu42CaYgRLMXZr/6uNp5MhQRLa49K9Wh3wyLzrM5HZkP4lVMx1teGjB/GlHutkugpxcT6HLl98TIZkqfhwfUvJZ/dO+pztitpnkXLjae3FsqjNKEyPQfBX6IbKalJDjkTQ63AQzIMPDgvGeiUUadE9HqSnn10CJR+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTlZDSs77RAc8eyO6/n/oa9e2ajwpZRnfhyHi6uhQhY=;
 b=PhXfjZSlIIsVQqSWGrJTVhKLHjvSHhtUoiHhDdFw2n/KLKV0vUUGMoWRMJFMaTEEYRAR4EE4NqmxZUWgyBoflzERfWj8ADMf6Twt/pfSfBTwihnqywJauxzCoNjXPdiF+eQPmZSWo1HE4/gjtBF+knVJLF/yt0Qm//vcT/To8SM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 12/13] xen/cpufreq: bypass governor-related para for amd-cppc-epp
Date: Fri, 22 Aug 2025 18:52:17 +0800
Message-ID: <20250822105218.3601273-13-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|PH0PR12MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1b0ff8-e793-4b0d-4ef1-08dde16a13bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?exJ8WdRXwSZDWE0QI3uyDJpeNSm/+0u9UUY2CsmKTxjepYpMSJLZTSvIhv2C?=
 =?us-ascii?Q?9NKlUCpBM3d2ILYx3flclnQvHjLoqXKfS/gplsW6zuElH7/kfX7e/H/xtDNi?=
 =?us-ascii?Q?4q4FQBggoOBrWsYpS7aPkhH0bzIOn1IQ78Amo1tFktgkgh4Vu6WUXneJcQOW?=
 =?us-ascii?Q?jHbLqbPb1dzsojAM4ZTAv96yLNkeWAMc5EoZo+pttEUp3tB6+nwDCv+hj6G1?=
 =?us-ascii?Q?S30Rx+sdbG2nLij0EN2tf9obOocGjenOZqW9ARklIeE0YaVM5wj395p88Uel?=
 =?us-ascii?Q?HtuYtTrxEr6DBzM4Nhpv+2SJLKA09WGlf/JJalNgwf9zzOMdivivLPTz1NXW?=
 =?us-ascii?Q?106tyc3Y40eswydSVG8m49X86r74zqOEbJ2AbU8liP9sulktvOmmUHxnJmLE?=
 =?us-ascii?Q?WsN28b+T8cQeaBokZGnt3gO75rft5/LvoazmCoTFQcKS3F1WGeEn3iwP7Tan?=
 =?us-ascii?Q?AeSS0fWouOpUl4Xl05eLG1l8ps3F8n4HFPbnu2/D7NHAiCNrKoey5UspDwur?=
 =?us-ascii?Q?z3WvXbDw6fyN2dMGdee0XM1LtFfEANF6QYEgFWz1PD5luTl/Vd3V6OLuX8FK?=
 =?us-ascii?Q?nJ7d4gqlPsJg8vt+LMa7YvWF1JIHr2kvni73GGH/7Rn+wBqBhTMGTYBfmufR?=
 =?us-ascii?Q?G/iqTS5RPej0pV9CNKzrrRC1wB/YJCENlCFdRF8fNsleiyHRE07ZuSvm5jKv?=
 =?us-ascii?Q?Ilp/LD8ouVVio1hZ58S22RXmB7eEpKWMqtW6S8AWOiZeLq/7ELJegFMXEgbd?=
 =?us-ascii?Q?f30WS3zIV6ocsrSlmm4ZzFtDy+MiSs3/q91Z54HdnI1tGhAQUJADpBim9SGE?=
 =?us-ascii?Q?zVW4ovbR5tbXaJ8OiBNxmBYxwM27PZoQ2BjCZtitm4i+jzBSSY5xqKbNCQFu?=
 =?us-ascii?Q?igI9KRs5srWdqJwIjN2qE/oLtSySXE+x5Pk4lzFLDiNypMi8cYkWbiu0Qphb?=
 =?us-ascii?Q?CsvtJWl6gkU0WudoYRbwSAjr/c1u/22Vi9OrpX73+QeSon79C+p+C81wBJ5U?=
 =?us-ascii?Q?eL33K8X+FuVtLa7W6A/h/dpgx+H/lSlw57sit7WLv5wBXL35ciMQOkvESvKk?=
 =?us-ascii?Q?Brp9By4P3YB5dpxfJGNooopsd+rHgNtwLk2O3oC2YqcwJCVfpVIHT+1VgQ77?=
 =?us-ascii?Q?+UeKMwtIh9EhnWB3SJAef8q6fS0Mj1EjHFB/8ec2/JpoKnYnKSGGxTpPuPTx?=
 =?us-ascii?Q?cBQAdZ5WVFGstQIWMNU2w/ADPuvmWLbNYNVHwB2puPzFfz2IPNH6mJoAITCQ?=
 =?us-ascii?Q?rgh3UH1zqtxau/ez0DKikm1uPdrZF6q4P6UczfMgGPvLnG/P99KV07F8UmHX?=
 =?us-ascii?Q?E05/pkEVZFTz2NdDd9dMvCtnMsxWKjoLurBrWSESTp/gEl5mErbOpMp9llJ5?=
 =?us-ascii?Q?ZXkFAKPJKPGm9K+CtOd1CcG8vEjRfLqRPbfn47LNXDJcqduhNHnZhif3rHzK?=
 =?us-ascii?Q?+ueL9VTsKRekzRx3cEvG9FPhRscyaZj91ZCAE3Qu7VF6aEXiPeviNHtYCx+x?=
 =?us-ascii?Q?hDo0FLl40DTkOm5K/mKG84dYfHLjAuGZNUHT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:53:06.9962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1b0ff8-e793-4b0d-4ef1-08dde16a13bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7930

HWP and amd-cppc-epp are both governor-less driver, so we introduce
"is_goverless" flag and cpufreq_is_governorless() to help bypass
governor-related info on dealing with cpufreq para.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- Include validation check fix here
---
v4 -> v5:
- validation check has beem moved to where XEN_PROCESSOR_PM_CPPC and
XEN_CPPC_INIT have been firstly introduced
- adding "cpufreq_driver.setpolicy == NULL" check to exclude governor-related
para for amd-cppc-epp driver in get/set_cpufreq_para()
---
v5 -> v6:
- add helper cpufreq_is_governorless() to tell whether cpufreq driver is
governor-less
---
v6 -> v7:
- change "hw_auto" to "is_goverless"
- complement comment
- wrap around with PM_OP to avoid violating Misra rule 2.1
---
 tools/misc/xenpm.c                 | 10 +++++++---
 xen/drivers/acpi/pm-op.c           |  4 ++--
 xen/drivers/cpufreq/cpufreq.c      | 14 ++++++++++++++
 xen/include/acpi/cpufreq/cpufreq.h |  2 ++
 4 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 8fc1d7cc65..02981c4583 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -832,9 +832,13 @@ static void print_cppc_para(unsigned int cpuid,
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
+    bool is_goverless = false;
     int i;
 
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        is_goverless = true;
+
     printf("cpu id               : %d\n", cpuid);
 
     printf("affected_cpus        :");
@@ -842,7 +846,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if ( hwp )
+    if ( is_goverless )
         printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
                p_cpufreq->cpuinfo_min_freq,
                p_cpufreq->cpuinfo_max_freq);
@@ -854,7 +858,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( !hwp )
+    if ( !is_goverless )
     {
         if ( p_cpufreq->gov_num )
             printf("scaling_avail_gov    : %s\n",
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index bf4638927f..2b4c8070aa 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -153,7 +153,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( !hwp_active() )
+    if ( !cpufreq_is_governorless(op->cpuid) )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -236,7 +236,7 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -EINVAL;
 
-    if ( hwp_active() )
+    if ( cpufreq_is_governorless(op->cpuid) )
         return -EOPNOTSUPP;
 
     switch( op->u.set_para.ctrl_type )
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 41e0da3b77..871fe33681 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -956,3 +956,17 @@ int __init cpufreq_register_driver(const struct cpufreq_driver *driver_data)
 
     return 0;
 }
+
+#ifdef CONFIG_PM_OP
+/*
+ * Governor-less cpufreq driver indicates the driver doesn't rely on Xen
+ * governor to do performance tuning, mostly it has hardware built-in
+ * algorithm to calculate runtime workload and adjust cores frequency
+ * automatically. like Intel HWP, or CPPC in AMD.
+ */
+bool cpufreq_is_governorless(unsigned int cpuid)
+{
+    return processor_pminfo[cpuid]->init && (hwp_active() ||
+                                             cpufreq_driver.setpolicy);
+}
+#endif /* CONFIG_PM_OP */
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 9ef7c4683a..babc4a1a2c 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -294,4 +294,6 @@ int acpi_cpufreq_register(void);
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
 
+bool cpufreq_is_governorless(unsigned int cpuid);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.34.1


