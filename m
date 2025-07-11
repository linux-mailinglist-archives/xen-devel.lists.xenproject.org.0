Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C435B011D8
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040237.1411700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wC-0000rJ-JQ; Fri, 11 Jul 2025 04:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040237.1411700; Fri, 11 Jul 2025 04:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wC-0000pD-GK; Fri, 11 Jul 2025 04:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1040237;
 Fri, 11 Jul 2025 04:00:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4o8-0002Li-Pz
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:52:20 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20607.outbound.protection.outlook.com
 [2a01:111:f403:2409::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70b4eb1f-5e0a-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 05:52:18 +0200 (CEST)
Received: from SJ0PR05CA0188.namprd05.prod.outlook.com (2603:10b6:a03:330::13)
 by PH7PR12MB6694.namprd12.prod.outlook.com (2603:10b6:510:1b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 03:52:11 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::1d) by SJ0PR05CA0188.outlook.office365.com
 (2603:10b6:a03:330::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Fri,
 11 Jul 2025 03:52:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:52:10 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:52:01 -0500
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
X-Inumbo-ID: 70b4eb1f-5e0a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWJSEaFcX70Th6MBnFF/JsBONVLQomJJtVmVb2hoN9QacbyEMCfWvHL4wAiIlLGTPR213IRwL3yBvFyUctmjxyGWt7cR1zrerjmYFDuwLG02mkb6PmAOh3TuezxPZxbtfnNqXyjKkAE4KI9NJ027NrF93Uh953z9Xs1PN1Nhz++gFKoi4KhJuCMLRctdkICG1ZK+Uu8xcBOc4d1xTtVqfQ+ZiAzb1IgA3Lb6iCqCIT39j6HsAjgTpwAKDX/kRZKJEbe8/Lz16IkUieZo3qGkHH9DBWmOqWRYxw2kFV/rh21lXgovkBKyuyvUP3ZCwImqHEgBWgEK5Gsua9Yq1Vr9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvr1qIX1OMQN3xh5Cv/12aw0I4U3su4SvSxnneorVik=;
 b=K+K14nxRrnUDGSXicR6qCEySzNWRHtfrvw2oy4e994ycPnCFdo3dpEPhwrBaE7N6Xm1XCul0yzfAx3VsXVZauwmTYIGaF4+Q/dwYsJYqTW00nq1TyVpUEtOp6KDrlxD3ksQkw/EL+rr08Eioy1QoE1atUgrWf7Ns3euqceNh2xcwOi7Ufu0L38Y6VWLzdqD7Cz2xb64JPk1sk0mUrxFCiwceKC6kSvxBBYsPGP3D58lUEy31Z0L4aMt3XG3FBgkNcZsFdbXQqehAeSmJLN52PBGOEVLtGINIteEv7M/io/SEi0eZ70c0uhXLYoT07QLnrcd54skLPa7MEwKxCZTalA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lvr1qIX1OMQN3xh5Cv/12aw0I4U3su4SvSxnneorVik=;
 b=wltxJgfOtkT2C1FAieBvj1WTvtcRgt3vNGIllia9vKUsV+gUUOyFdw9bex6LHdD9HOIx4UwvAQB7LRIaNcIhSaESbhT1DdJmbg2HpNZAtg184GuVAjelEtm7bqSajTOeYMmx4KKz2obOqgj4mSHVrBW3duEHJYMoH+LYy+4eRYc=
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
Subject: [PATCH v6 18/19] xen/cpufreq: bypass governor-related para for amd-cppc-epp
Date: Fri, 11 Jul 2025 11:51:05 +0800
Message-ID: <20250711035106.2540522-19-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|PH7PR12MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: e02f2d6e-5488-403f-3744-08ddc02e509d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pOtgmWSTwg0MiSMsB2VyMd0RkMkM4RNc4Z4Dh0IIb/0shg7huUbXOcK1KkVJ?=
 =?us-ascii?Q?1zLvy42jpvLnkihuO0AJOwlqLB71LWC/nLTyX/vbWKZXnnMp6k/4Dvo3y13A?=
 =?us-ascii?Q?m4JbKddai8RLEJ1nhGo+oFIm1mDzZRQmg3vvlti1LmgDRzIy9v41Rkcgg5IN?=
 =?us-ascii?Q?5wDZmtNagExYzCjc2MP0oI9+Og6x8lRtc+LrBTf2NC47ikipwx5X6h6uaA7W?=
 =?us-ascii?Q?uI0OxKQX+onG8RtwyoEstai69AmPkyYDkdYAAvIa4IyNIirvCqlZVorQlBFa?=
 =?us-ascii?Q?QkWzWiPGbyQtHR0b88Jv0O91OhGzBzX4lhU06dnZ1CY6+2e4x2w/haPp+4WL?=
 =?us-ascii?Q?FvqrUtOaZjpcv73h/BXmn0SfulFu3Bmv2pmCwdGcq1l9tIyuFmaCIRO7gdvS?=
 =?us-ascii?Q?PuTyXH7iOX9IZrouK6XQ/AzJNgJgvPsY2pT2lik58UuadYDW91w6u+H6WH9s?=
 =?us-ascii?Q?aNRdnO3njDQzUg/OXwCdZzvQtSkAb+Hog/RAEgVrA8ruGznadP+8JOYbJ1a9?=
 =?us-ascii?Q?HSeIDkeTjWC6AWg4kgRtRhpLiz6KXc/eUPQcvpq2dlSpusgXRamFCWH5K6ea?=
 =?us-ascii?Q?bZPoMT1s4kVs0y54vo44T5fsdr03vdNwjM82cm3JK7vOMqGLd6PGGMASjqQ0?=
 =?us-ascii?Q?znY9GsOB5nKV2KA/E47dUxn1+obM+yVZJNcMBDjdTMdoZCZ84t10qbTVqBuP?=
 =?us-ascii?Q?yfhvYLaHK5WkscPmKx8KdbWy/D6SB7cPAJOyKuqZqKrd2hjE0ZfnC4/rMl5E?=
 =?us-ascii?Q?q/mZQWP+WVcVHmfJ/ze8aSliDO8Ytmfpqf8CB50TrOzSSQFYw7Ny5iMTlJdb?=
 =?us-ascii?Q?6C07BC13ue0hipCcVR3MZCoPgFTxAzkM/Tsyf38W18S2Ofszft1tJ/LJc24t?=
 =?us-ascii?Q?lt3NUEhaPjgmyIZQJm0+juw8+yxyf+B8n/M+Hw2TxSb/JRmjY63jtPl4nmyO?=
 =?us-ascii?Q?4aIlXXfo8XxszA/W9qbSir0iMzS0ULpHzuw8qrprtY5eqfd2rLfB6I6B+tgj?=
 =?us-ascii?Q?XjvEbZC9HP1WEzS0uCpm/rHgGiqxJW0MH2Hob7oANQXQea3ZEX48zNLqmG2J?=
 =?us-ascii?Q?ZOj3qyaglT7W8HMZugtmYh7PteJHEJlF6bEMK8LGVsedldJZZww6frrXEDq8?=
 =?us-ascii?Q?3Vboo8ydshuyC/9qU06uBEsJzVu5zOag/FrMaeEi+U1nhQjDF/sZIdyKnuy7?=
 =?us-ascii?Q?pZpPN2d18gL6woxOoL8/aOrDUzs98aQUjHHuhHUKvaYzZf1FmcQnja9+dQ+h?=
 =?us-ascii?Q?DksuqcmYx0C7GKAOv744O7ZpftHuad8vHBFkP2CX0LK6mkqIA7ki63IN9wMt?=
 =?us-ascii?Q?/5KR/qpacNurw/053OoPA9sxhYCaEiZVR1lNV9OOBiGBky9QoGxQhr8vpUrE?=
 =?us-ascii?Q?RODf86gdxO/v0qaQUpCa0atoz1gLbEbpvEIHnx4qs1qR5vcF8cRmbbf/UYYl?=
 =?us-ascii?Q?FN6Z85lf5CKKSBAYNLKAJyrmgcXZGC2GisLAf2d68PG+G0SdsMBVZT48166Y?=
 =?us-ascii?Q?U4arxz7aE1vSiP8Dktjo0+misR+R7sm5p2xN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:52:10.8619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e02f2d6e-5488-403f-3744-08ddc02e509d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6694

HWP and amd-cppc-epp are both governor-less driver, so we introduce "hw_auto"
flag to together bypass governor-related print in print_cpufreq_para().

In set_cpufreq_para(), a new helper is introduced to help error out when
cpufreq core intialized in governor-less mode.
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
 tools/misc/xenpm.c                 | 10 +++++++---
 xen/drivers/acpi/pm-op.c           |  4 ++--
 xen/drivers/cpufreq/cpufreq.c      |  6 ++++++
 xen/include/acpi/cpufreq/cpufreq.h |  1 +
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index bdc09f468a..9cb30ea9ce 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -830,9 +830,13 @@ static void print_cppc_para(unsigned int cpuid,
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
+    bool hw_auto = false;
     int i;
 
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        hw_auto = true;
+
     printf("cpu id               : %d\n", cpuid);
 
     printf("affected_cpus        :");
@@ -840,7 +844,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if ( hwp )
+    if ( hw_auto )
         printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
                p_cpufreq->cpuinfo_min_freq,
                p_cpufreq->cpuinfo_max_freq);
@@ -852,7 +856,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( hwp )
+    if ( hw_auto )
         print_cppc_para(cpuid, &p_cpufreq->u.cppc_para);
     else
     {
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 077efdfc5c..54815c444b 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -244,8 +244,8 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -EINVAL;
 
-    if ( hwp_active() )
-        return -EOPNOTSUPP;
+    if ( cpufreq_is_governorless(op->cpuid) )
+         return -EOPNOTSUPP;
 
     switch( op->u.set_para.ctrl_type )
     {
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 431f2903f8..26aaef6008 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -968,3 +968,9 @@ bool cpufreq_in_cppc_passive_mode(unsigned int cpuid)
     return processor_pminfo[cpuid]->init & XEN_CPPC_INIT &&
            cpufreq_driver.target;
 }
+
+bool cpufreq_is_governorless(unsigned int cpuid)
+{
+    return processor_pminfo[cpuid]->init && (hwp_active() ||
+                                             cpufreq_driver.setpolicy);
+}
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index dd55d268c0..da0456f46d 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -296,5 +296,6 @@ int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
 
 bool cpufreq_in_cppc_passive_mode(unsigned int cpuid);
+bool cpufreq_is_governorless(unsigned int cpuid);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.34.1


