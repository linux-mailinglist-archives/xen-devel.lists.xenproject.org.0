Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDFCB943C5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 06:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128127.1468635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uoA-0001yJ-6k; Tue, 23 Sep 2025 04:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128127.1468635; Tue, 23 Sep 2025 04:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uoA-0001un-2L; Tue, 23 Sep 2025 04:39:18 +0000
Received: by outflank-mailman (input) for mailman id 1128127;
 Tue, 23 Sep 2025 04:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0uo8-00015C-Be
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 04:39:16 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4217b781-9837-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 06:39:15 +0200 (CEST)
Received: from SJ0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:a03:3a1::8)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 04:39:11 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::e) by SJ0PR03CA0363.outlook.office365.com
 (2603:10b6:a03:3a1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 04:39:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Tue, 23 Sep 2025 04:39:11 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:39:07 -0700
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
X-Inumbo-ID: 4217b781-9837-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8QQq2j2Bm6kajFQezWSZYXpYdyDaLrIR64uK8WgQeqUFxdXlk71hXPqtvgfkH26naGzlTjuq/KcPh0a4omMGmyC5UPSEamuCQfaO5V5tOISy+YqMOpcX1BYxjGEtaLDdhpRiIG8R0+AxB0afRWcJUwR1yMJWAX4s6hKZJ+e+s5t3z8VE1N31+OJwTM165CNgOJ2fafcmco2ZEJrjcjkGnWt+Yd0CzaPoZeumQnVdoN9kwM+rknLIBo85dfUSGVp+oCXz84SBccAzLutmjM82mHG5/8KKogJtkVZx7zqK7nBEiGF3plF433lX89uT/2JOVVEVRXq9LPBZwL+VHkERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPU48WtAWFZn4E4aJF1wkdR2jxhJrOPaI8KG+sd+2wA=;
 b=tg6iM8XyawQcW+b2QLxInc76xTIjTNasI7fDhAk/WHWGlofXq5SlWQQVlJT1rO2XOsQn13qz+0e8Jx0CTfn9hjEzDA1NEBd2swYZEZnwxpAT/gR6ZyMlv9YcBK8atFoutToMQH+BcHwU1Wec05jmwPZLYtaP1ad6ckD3zixokPA8HjXmrk5DCopz84GyfSekB6QIB7xAwV/13I9TI5RRA8cQG9eu4Vg7LOruU2Kfu39Jc6pPje/xNcuGCFUwFaM8MjN0UukLMoK3Z7hMHSWB4H3z+RfJ13sHMJq0RM6XY9Toghv36gRZpi+VpYyi589tXfvGHT+u1cVnXhesI30ANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPU48WtAWFZn4E4aJF1wkdR2jxhJrOPaI8KG+sd+2wA=;
 b=rK04ZOurO78xLlij56vcyzYt2uGsgbE/Ct7DK0HE4U0ki9n7GwipktmGR4i2iBCCSrgExDWa1XwneePgIGQF2oRcKajrKZaYyyI6yfaxh/7I2ZfrjHanV8eCU7K7vP8btDNIgCMVS+mIM2tAb+wWxi8Turb8MP29nVdlcg1GIHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v10 6/8] xen/cpufreq: bypass governor-related para for amd-cppc-epp
Date: Tue, 23 Sep 2025 12:38:24 +0800
Message-ID: <20250923043826.3831957-7-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f8526a-c020-439a-7125-08ddfa5b2462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Dp9q2iKOEBG5rBA8D3ku/iIaYFNtxVgNlzzc/kKviOqu2Sf6fIamsWynhze?=
 =?us-ascii?Q?+RHP0adiho5kTqueJ1hHgwQbSE8OS+sgJybI+7fUX+tiJDFzT1eS2rAG0CgG?=
 =?us-ascii?Q?KQ9/UFyt0voZMXzdRSKGZYzjHQ4dM5s7nfIsT5KhcRlf0LKCQ5gwazrrPdkT?=
 =?us-ascii?Q?z6ihfAoirWmq/Mspa28lpY0fjpoLv0gYt9CKlAOhRlfTzK1q1KELHMpcuniY?=
 =?us-ascii?Q?NkyIhDoa8+5Tjz5BmenKH8bmxwO/LMhL8UNi2LK/9G0vT5hBORYmB5hkdrhz?=
 =?us-ascii?Q?A4hPmIx3lvQmADuQzlEHkXjrSAUQ4wcq4xJB7vo7ovza8KOatToU5mdbBo9K?=
 =?us-ascii?Q?vygwMt42PqQUrHYtfIi2XUeGQfSBsJ5MT6+p1OBF/pgDyF0wJ46slxRsGfvv?=
 =?us-ascii?Q?vEC06KUMqwpOIfgZykk9JwlZkXUYv8HVZ8kpyZYgPuXbpmg6ME2FM5xnUNPt?=
 =?us-ascii?Q?popIZtUHdU/B3ZSEfFBixPgU+ZpBmZkvebggJeYl1IZVx3k8Z7S7HloRBuD/?=
 =?us-ascii?Q?zNWIBEZ4yZAVdkV0U3JyJHKPjSPTWcUm//Nde0EWdY8fUFCD0dTMalMkfh4M?=
 =?us-ascii?Q?pdg5WJVi/jMDR/uTnl3d9LHgEcRN5LXVfcoLTBC00RRF/fjB8kwtmTN8D/Ch?=
 =?us-ascii?Q?GkpteMxogu9gavGVk/F+WhP8027xuD+Bfw9StFC0vjflGZK5pboSRLw/jKEL?=
 =?us-ascii?Q?duP2bNGpSd+vgWkx+UPsADWg1S9Etwc9qMCRUDGY2erxv3SfWuwe/5zZT7Ro?=
 =?us-ascii?Q?CJfihhYqmefGfpRN5QnNirZ14/CQ0FVGVbgp3je7N99ypswa1saVk5kTY5q4?=
 =?us-ascii?Q?3Ax6ddl3w18oDI5yCy5NSYQfar1HpYmqSxZsne9JdQ2pLw1f++dsUtUjRJ/s?=
 =?us-ascii?Q?mODQ0GaSyCPPfMRyEr4e87Pge+1hCmZxrbMYvHmZi5jmcXzfT8PCJMWwrJfc?=
 =?us-ascii?Q?ry8HAzyG+9spwwtwmy9su2JJxmxjxD+izvNIcLeQ5M/ANMMBHwJnSQx24bY3?=
 =?us-ascii?Q?WKOyjSK4kWfTOEsjPmB3jHWre25YWqpsnu9aL39MDB9TN2sf8/gXCL46zCRD?=
 =?us-ascii?Q?cPVcd5l0Qs1R6/uqGqkugJ3Cta0lev3/+j5SMqX6Muq3pkzBWsDHvHHRgbOM?=
 =?us-ascii?Q?6IiuOD9rDK+AqhvybLXOEpfTEcQdvitluzC1VQRH9eG2Cnx2lZIZLyIlwnkH?=
 =?us-ascii?Q?oyyEzAlUhSzKmA68DDrhm2xSdWejz5v6UfL4633ux9c4/4PSF5+tQEsUQFkd?=
 =?us-ascii?Q?nn5dnobZl5PcUBp2SJ5rH+M4tTyK8/MDn6mr31xVEG/veSV2f//46/r8mYoY?=
 =?us-ascii?Q?w4g2GJtF9IsJpP2DLCEY2m3L5jqGHAGMXIh7jlWcpVKxyZtGYnjF9jXRZ2cQ?=
 =?us-ascii?Q?dB8j3qvXVyyQLYOBw5rlwLT9zSh6gSY47OYtUyBvxbBXx0RUvUaoZL8OL2Wo?=
 =?us-ascii?Q?MtRjVizrlQcyDdVndot8A3X1bqse0uI/UKPPGhKIfbbeDa+vAYsjT0mMe5+D?=
 =?us-ascii?Q?CycPrYd/a6lDtFCbh0KFSlwHktO5oF9jmvuf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:39:11.4538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f8526a-c020-439a-7125-08ddfa5b2462
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264

HWP and amd-cppc-epp are both governor-less driver, so we introduce
"is_governor_less" flag and cpufreq_is_governorless() to help bypass
governor-related info on dealing with cpufreq para.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
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
v7 -> v8:
- change "is_goverless" to "is_governor_less"
- make cpufreq_is_governorless() inline function
---
 tools/misc/xenpm.c                 | 10 +++++++---
 xen/drivers/acpi/pm-op.c           |  4 ++--
 xen/include/acpi/cpufreq/cpufreq.h | 12 ++++++++++++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index c7f19cea28..682d092479 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -832,9 +832,13 @@ static void print_cppc_para(unsigned int cpuid,
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
+    bool is_governor_less = false;
     int i;
 
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        is_governor_less = true;
+
     printf("cpu id               : %d\n", cpuid);
 
     printf("affected_cpus        :");
@@ -842,7 +846,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if ( hwp )
+    if ( is_governor_less )
         printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
                p_cpufreq->cpuinfo_min_freq,
                p_cpufreq->cpuinfo_max_freq);
@@ -854,7 +858,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( !hwp )
+    if ( !is_governor_less )
     {
         if ( p_cpufreq->gov_num )
             printf("scaling_avail_gov    : %s\n",
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index f50acd7088..4cca42c4fc 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -154,7 +154,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( !hwp_active() )
+    if ( !cpufreq_is_governorless(op->cpuid) )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -240,7 +240,7 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -EINVAL;
 
-    if ( hwp_active() )
+    if ( cpufreq_is_governorless(op->cpuid) )
         return -EOPNOTSUPP;
 
     switch( op->u.set_para.ctrl_type )
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 9ef7c4683a..7caeae26cf 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -294,4 +294,16 @@ int acpi_cpufreq_register(void);
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
 
+/*
+ * Governor-less cpufreq driver indicates the driver doesn't rely on Xen
+ * governor to do performance tuning, mostly it has hardware built-in
+ * algorithm to calculate runtime workload and adjust cores frequency
+ * automatically, like Intel HWP, or CPPC in AMD.
+ */
+static inline bool cpufreq_is_governorless(unsigned int cpuid)
+{
+    return processor_pminfo[cpuid]->init && (hwp_active() ||
+                                             cpufreq_driver.setpolicy);
+}
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.34.1


