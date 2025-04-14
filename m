Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CAA87979
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949306.1345894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Edl-0002c5-Ey; Mon, 14 Apr 2025 07:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949306.1345894; Mon, 14 Apr 2025 07:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Edl-0002Ze-BD; Mon, 14 Apr 2025 07:54:01 +0000
Received: by outflank-mailman (input) for mailman id 949306;
 Mon, 14 Apr 2025 07:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ES3-0008Gw-3V
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec23c13b-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:49 +0200 (CEST)
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by SA3PR12MB9107.namprd12.prod.outlook.com (2603:10b6:806:381::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 14 Apr
 2025 07:41:46 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::d6) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 07:41:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:44 -0500
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
X-Inumbo-ID: ec23c13b-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LV4oHoIy4XA5W/IVSY2nzHMNSDtRTRdPHytgDiv2MdvCJDSG/VRyul04877HHx941tO81UU1PvoirNGjCL4OFIE/Vfnc0MpeJJO1D2h/qRoUlB58JJcNmTpXqqPWpxeBc8CtpzYmuohJYiKgupkcTDPWmLb6eOaXaow4zb3BpLpKQ9TEpWrnn12ReDZweINj7y1C0rltseatBjMXaz80HcYJijkE+5qDSSOGnWHwYItvGZO3v/p0gKCh88WcfcNIceuTt4/1W1XRNpQg7ZpyWni0hmK1nYwLhL5SjYf8SF3ibOiytSMOgeUj/O5OawIrcd+TSkMoXTAxnRzD8gifiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6ebRFKv3vX7UzG38NrYOBnsfCX/PInAR8PHDAJ1f2o=;
 b=jZ9FFT5o9t+52v2Xw+xgb39Go0yLLn/nAWEDaNWF9p4PR7iBYAmaxsXht4do8ry74g4oZ0nKFsyG+T/zgUyoCMhgHbWCk515V05pe/jyGktgSw4iaFdKi5tnJc3NM/KLlOVoG+vOO+n8BAmV7YHYpuiMP9Kz+fwsyKMpRIJFTKVzW8SpyHI/68fel/z+WqAdX2YTWaZmbPD2CEAVSifB2PXZguqXB8ijGXdO2k7b3aQ/+cQWoC/kpmYAGhUyix6fNeCzuqj8GnpV/b9QWUxb2xj4s3sYqmgFcYmMhXY+vdHjta01s1pHwbCfkEFNNElzVZBpp1Tm4durXQUxuZdaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6ebRFKv3vX7UzG38NrYOBnsfCX/PInAR8PHDAJ1f2o=;
 b=gCxzIAeTHBAvEiL+g5fp8stE6ELCo82Bwzk8TVqZ5u3ZKy+Cly00pBT+DrH4ksW3bqE1d7MGowBPTnAmDGzmhYXe2WmSrXD0388FMRuruGCK+otMRFR+kMCV/JakHaORNxDcZo0eGrKirjw/tWii4I/aNXlYsXgpKqRg1MsXC7U=
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
Subject: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc driver
Date: Mon, 14 Apr 2025 15:40:53 +0800
Message-ID: <20250414074056.3696888-13-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SA3PR12MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: e6007686-9095-4eee-f880-08dd7b27ced4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5HOpSKDEB7qgtsV5DQTYhVatmpPKT4s4Ni0Em7KSV6OpFJwEGfWkykZTT+CR?=
 =?us-ascii?Q?MnjBdFaGnbRyQuLaJ9beoiuhF3V11HePOEduSrrLtAHHlhXRlDQF5oYyVUir?=
 =?us-ascii?Q?wqWzbSEQYjiU1ed3Mz1qrA2JbgVg7ZcaUjIzTWyFVnFsvW/t/3vTSo2GK/L6?=
 =?us-ascii?Q?WQaGZOgeUP3eGm26oz+Ke1a9whwWKmWURpwm8Lvk+Wtg75DgBmEBkbpHQX7Z?=
 =?us-ascii?Q?qg7bJTZ1dcbBHxMrbphMk6ZUh1Tc9Eatfbay34MxFsWLuFKEnCRNHTtQCnJc?=
 =?us-ascii?Q?zMu4jcgx5qWjNSmU8sU3URU4S3IDmQh30m8nE57HzywEBI3k4FZqi2+StPBY?=
 =?us-ascii?Q?oQ1BN9/Z01DAj3JByYT9D6gL3Fu4K8ISuL5cuexxn87hXOy4j0XL8DeRHYb+?=
 =?us-ascii?Q?fxBSnIUdYWc5eEv+rN8MC5ZQ+z5/9Lgseecwy9AcopwHxAQibZVkP/+7AoFA?=
 =?us-ascii?Q?TRK2qKmSq+CT1s+I/MB+jsteFVvH4rOs92VO336Zo8xDI10SsgOo4POmhjYL?=
 =?us-ascii?Q?jdoJQHN5C1s8NJEF63ro2cG64MYUl24Xp5l24xLoBas7DZDara+ohZ22kVd4?=
 =?us-ascii?Q?L3kaBdkGxGc1pOi5Rj4ziNJQafb7HlFCV8DXI3Amsgyuq11C71e6p3BiwJBM?=
 =?us-ascii?Q?fTL/NGOfN6OaMGtStfrf0BfAGUyOk2FR58RGuLqRsisERvJqWrAIx9bUyVRi?=
 =?us-ascii?Q?/z38GTeeXhEme3CVeLrgx50Cs1ZiG+JK/l68E+F8VApuVOT8u4LVlRijZpM1?=
 =?us-ascii?Q?0hF/9pc2RqRYYg+/bsudzom/XV4I27Gl1mUmxncDqldkVvWRhIZQvYwTUzSr?=
 =?us-ascii?Q?booUWKjRn0o1a4GM/Ab6FdFMomH+5iQTOIN/UGqcuiGD7C1ZNy1HctZ8FjQn?=
 =?us-ascii?Q?Nz5DTsiBv6zSqxFZj+iR5bh4Onqwsrx+bI+Sn6t2//5YOD3m0GIq3R8Zpq9M?=
 =?us-ascii?Q?IH2esvkugzC8252fljbgkOWKM4zPoA558UsHnxYcILULF8TYBsJM+5ZxnPaU?=
 =?us-ascii?Q?dp3m/OIGM2o0tPR76u0vDE6jo4JswqRIH+ABakjuPbvD3e9YTJDMcyIdWrUc?=
 =?us-ascii?Q?/NeM7vw2ZP5cF+Ig0GDJ6+CmGG4aHfqa9bOFuhpzCzzD1ySjthEzDeg9SfUb?=
 =?us-ascii?Q?8e22Jqs/q2ZQRNx/8BKIkxzziIl1OHmI4KFGzo/a2ymrjjiFy50JAC0GXGWR?=
 =?us-ascii?Q?+0vcmWkqL8tkUlkLjDvOZWtexdj5poeV6Ue+DO0EJpo9lQx8Z+SBKik+bfRz?=
 =?us-ascii?Q?6QaZUD2bCDM+aQYeUZv1fJHgdy3A8qbb82Z10SaXauEdq2IWvMXTizfDFMBu?=
 =?us-ascii?Q?vQRBhx2DTclVQaSLGoprVDVZnqK0W6DIJIfYFL3B9UzmCjl+zeUEYbC6WICu?=
 =?us-ascii?Q?raS+KcR+zsVFCkrQjE2/x2OKq5VR1wQ3fbmrPKUIlWpH3m67Y5i2RFkHHlok?=
 =?us-ascii?Q?fpOtZpATsF7gHDohisShVCjiYM/LDZ97SQxbV15a2DfYAK8WRP6I7MDbuNc9?=
 =?us-ascii?Q?gnd0ZNZHFV2E+J7dCuPmKJbkcfQ9qdFwHce0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:45.9858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6007686-9095-4eee-f880-08dd7b27ced4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9107

HWP, amd-cppc, amd-cppc-epp are all the implementation
of ACPI CPPC (Collaborative Processor Performace Control),
so we introduce cppc_mode flag to print CPPC-related para.

And HWP and amd-cppc-epp are both governor-less driver,
so we introduce hw_auto flag to bypass governor-related print.

Validation check on `xenpm get-cpufreq-para` shall also consider
CPPC scenario.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- Include validation check fix here
---
 tools/misc/xenpm.c        | 18 ++++++++++++++----
 xen/drivers/acpi/pmstat.c |  7 ++++---
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index db658ebadd..29fffebebd 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -790,9 +790,18 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
+    bool cppc_mode = false, hw_auto = false;
     int i;
 
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        cppc_mode = true;
+
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        hw_auto = true;
+
     printf("cpu id               : %d\n", cpuid);
 
     printf("affected_cpus        :");
@@ -800,7 +809,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if ( hwp )
+    if ( hw_auto )
         printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
                p_cpufreq->cpuinfo_min_freq,
                p_cpufreq->cpuinfo_max_freq);
@@ -812,7 +821,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( hwp )
+    if ( cppc_mode )
     {
         const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
 
@@ -838,7 +847,8 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                cppc->desired,
                cppc->desired ? "" : " hw autonomous");
     }
-    else
+
+    if ( !hw_auto )
     {
         if ( p_cpufreq->gov_num )
             printf("scaling_avail_gov    : %s\n",
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 767594908c..0e90ffcc19 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -201,7 +201,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     pmpt = processor_pminfo[op->cpuid];
     policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
 
-    if ( !pmpt || !pmpt->perf.states ||
+    if ( !pmpt || ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
          !policy || !policy->governor )
         return -EINVAL;
 
@@ -461,9 +461,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     switch ( op->cmd & PM_PARA_CATEGORY_MASK )
     {
     case CPUFREQ_PARA:
-        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+        if ( !(xen_processor_pmbits & (XEN_PROCESSOR_PM_PX |
+                                       XEN_PROCESSOR_PM_CPPC)) )
             return -ENODEV;
-        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
         break;
     }
-- 
2.34.1


