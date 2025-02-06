Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA7A2A33A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882571.1292762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKV-0003ji-Fj; Thu, 06 Feb 2025 08:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882571.1292762; Thu, 06 Feb 2025 08:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKV-0003fR-Aa; Thu, 06 Feb 2025 08:33:47 +0000
Received: by outflank-mailman (input) for mailman id 882571;
 Thu, 06 Feb 2025 08:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKU-0001Q7-0w
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2405::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1321f971-e465-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 09:33:44 +0100 (CET)
Received: from BN0PR04CA0125.namprd04.prod.outlook.com (2603:10b6:408:ed::10)
 by SA3PR12MB7807.namprd12.prod.outlook.com (2603:10b6:806:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 08:33:41 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::26) by BN0PR04CA0125.outlook.office365.com
 (2603:10b6:408:ed::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 08:33:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:41 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:38 -0600
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
X-Inumbo-ID: 1321f971-e465-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoIHakFOFwGRfgJUdaVoThkHDLDAnlr0wTkNVrmmXlrZ1lmf+SB3x+SkYGxPbn0eKVertp09WIVrlOe2NGTsnVvX1G0Gaq0TUxqrUNvfIrpiY52Z4YvK8ivRWw1AdSsUoyFxe5vTFEee/F/mddlNiebNK6c+G2lOTI9TtqgYsAJCisZyJyLzbVwxCZzwTTCgcPcoWSUMcpCCDoyzwokIP7rglHeaN+tZ3VTtKl+CKHQlSCZTw8JOlfMGpRJOSMIVsnMSO2xlThodIfY3MYiIDJ8WJtoC42Mfsl0I08dTb/2KmsTMdNRDzSqguUIb8Z0maq0pzGf53IgZsoqGE1DNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxlnyc5UjZvBqpld6BJG97I5gaUM3CFbYTdPpTDuksQ=;
 b=ohRmGmgYVuvBJ6tK6i6tuQTPKArvf+tYklGJoMiheFmNnHF/cwhVlyQ7AxpHcNmt4vSPgxfBqHf2vJVgPZkdlYy0A0wLs27ZkPLC1H6LEke6L721TJzVvUVk4XR/8oqf9nGKg15ag9YQd7UhelgvW9FWDRCCIEa9mEW2XJESvuw6GqcxNn0r7fL7d1JWjkyEZK0D6Xj1Uw7iAMI7Is0Gbh5UBDFDq1ukcg2Np2G2+5txigGl4iso/J7E7eDpt+zI/w1XekCo8Yp3PzlY/JCksmknImvTJyVzCTCo1B72cu4s6Hr2bB1zLVecM1aIA8KsosWv8VmrTFAR7yLSe+PiMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxlnyc5UjZvBqpld6BJG97I5gaUM3CFbYTdPpTDuksQ=;
 b=px1oKt09j4jv0lnhRL9UJLr002J8onvWlB2qQGYtAn0C3uERmD/Y1zpoVGy1qs1xFrn9VVdYxu/LFtUTKDCBIP61tZDPC/h8Zjq1KkmSFkevOXlFU7SotdulbbiwXgMRMkRMri9S1/GwkVOP8EzsyCRHp/DiJ0PCvNqOgRmLREw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 09/11] xen/x86: implement EPP support for the amd-cppc driver in active mode
Date: Thu, 6 Feb 2025 16:32:53 +0800
Message-ID: <20250206083255.1296363-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|SA3PR12MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: b50249d8-9b3d-4c87-a61f-08dd4688f60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?faB0nsWBm9W3BdyH8MI8LFhvF+GO8eCmGLkIdKzJ6mc3CpBkKp2zjPpRgHT1?=
 =?us-ascii?Q?JOsysx1mkMy+RbfTzZ8SKGi2MNGHu0Qh3uy6tq9ov5HiuxnjOh1EuBEKeTn2?=
 =?us-ascii?Q?j/dXeQVVZZDu6Ph/06tDgpFCLzmx1EVRir3d6nawj5LpjqSe4JF73gOIFofK?=
 =?us-ascii?Q?riILQKY6djjb6NkG7+kFq2T0O3P5pz5lt4XCAGksyK0LUgv6IFJIOiSkycMU?=
 =?us-ascii?Q?O03dPD1iravkO9p8qsIGHcioB5VpCpxGuTgaXbrcyP/8kqesPzvZJ3RDFsTJ?=
 =?us-ascii?Q?LG7Abqsylvs1965rzqPmX/30z/eSVzoY1G+K8CBmj7lw1BAISsJGV3/DZgW/?=
 =?us-ascii?Q?pPv/sNTpaRHHCr7La3DvNL2RgPlR6oQsRHFBAK+xJK0GEicSTdXF3hilRfIC?=
 =?us-ascii?Q?9erblQPXHg5yVhEGj2xRwtgnsaFvT6zZk53VkdTgcIgR5Fqkb7tAzzxyS8ta?=
 =?us-ascii?Q?Td3HvdKgfv4aVVhCKNvlq2wJxCW4xnGLrqvTqGgZK4LS7nlD/uaIIuZJemza?=
 =?us-ascii?Q?LA+EKnmYWKmV+WWLGTrkRbAQU3DIH9gG4g0SlKiQVjid9caaRtevOiGp6kRg?=
 =?us-ascii?Q?qQJnJvlm3TGBN/FWXBHs/zU6cKidX5+C3QhBjM3wt0eVkzvOXvk3BYNbJQ28?=
 =?us-ascii?Q?GBP38OHPl7+cbtT58ruRYORGR/hxG20BOVeM5rCUJdMAz9B7T3mvZ9EClaRF?=
 =?us-ascii?Q?ecT7KLZQLIl82dTQjDY7of3LWzTPJlLNGikEPSY3KnlrIJR/Cwnad7JaFx6n?=
 =?us-ascii?Q?ygttRRu8iLK/iJpNK9Gyye/rxSvjUusDxLHeohUqaLn5nar/TB8MyaokH45R?=
 =?us-ascii?Q?LWYFdJPlOHvi4Cg9mut/3jeIwyubcxv+xQNkl15k241qjFfDV4jQedu/22AE?=
 =?us-ascii?Q?ySbvL9pkLADHX7cAeYTySXBM8hmHyDeV6zPpnpNmnOBP7S7n7MiePDpexsEH?=
 =?us-ascii?Q?v8FFWzBcZBxlsYvaFGjq1rHK7CmWK2+AR5BW0E21twJm8cYDaJ2mm02AM8zs?=
 =?us-ascii?Q?sJm6VdFf+djseVbYcz1uSn+oSrYUNa+Gx1CFLqvoIxKfGIPILVxxZ2xluEz3?=
 =?us-ascii?Q?8CM+BXyPH5jARSvMSwli45yqEpyYz2ryU2Od0iNLl9EgZukpHP1rDS1e6svg?=
 =?us-ascii?Q?sMptKu6O/JhW1rhGO0n2Wk2od4o0uef2K64PX/NCREKzN3rqeGWtXpr8kasv?=
 =?us-ascii?Q?UCeZMPyu34H/ifAF5fX/Z1yC/JQ6oLEVHRD2hfEAjLupUj/PPGLhnp3DHZBV?=
 =?us-ascii?Q?4Xm7lB0CML91bE7moPI3Tg/Sn2ZTE2aLjt0aOBjDtEn8qbS3jX5oK0ibrwAc?=
 =?us-ascii?Q?noY7Z7Cq2ySa/HxZtcS/9xsVkzZsUl0nXS5kHF4QEr5ahDxqKqJphQxzGvIz?=
 =?us-ascii?Q?tcu65JEuuyoEzp5VAg5+Fiisbru2QN6/YGOKpYibkNQbKyXoNGFoD0l8kzPM?=
 =?us-ascii?Q?fnnSTaWYzH/auHYVNHPQn+EkSFqqLMtNDe48wgGA4usYWcuQzxgIojo20Q+h?=
 =?us-ascii?Q?CgWGlqrhw6L5hOY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:41.3374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b50249d8-9b3d-4c87-a61f-08dd4688f60c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7807

amd-cppc has 2 operation modes: autonomous (active) mode,
non-autonomous (passive) mode.
In active mode, platform ignores the requestd done in the Desired
Performance Target register and takes into account only the values
set to the minimum, maximum and energy performance preference(EPP)
registers.
The EPP is used in the CCLK DPM controller to drive the frequency
that a core is going to operate during short periods of activity.

The SOC EPP targets are configured on a scale from 0 to 255 where 0
represents maximum performance and 255 represents maximum efficiency.

This commit implements one new AMD CPU frequency driver `amd-cppc-epp`
for active mode.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Remove redundant epp_mode
- Remove pointless initializer
- Define sole caller read_epp_init_once and epp_init value to read
pre-defined BIOS epp value only once
- Combine the commit "xen/cpufreq: introduce policy type when
cpufreq_driver->setpolicy exists"
---
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 114 +++++++++++++++++++++++++--
 xen/drivers/cpufreq/utility.c        |  11 +++
 xen/include/acpi/cpufreq/cpufreq.h   |  12 +++
 xen/include/public/sysctl.h          |   1 +
 4 files changed, 132 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 1742c57170..241cce330b 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -34,6 +34,7 @@
     printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)
 
 static bool __ro_after_init opt_cpufreq_active;
+static uint8_t __read_mostly epp_init;
 
 struct amd_cppc_drv_data
 {
@@ -258,14 +259,27 @@ static void amd_cppc_write_request_msrs(void *info)
 }
 
 static int cf_check amd_cppc_write_request(int cpu, uint8_t min_perf,
-                                           uint8_t des_perf, uint8_t max_perf)
+                                           uint8_t des_perf, uint8_t max_perf,
+                                           int epp)
 {
     struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
     uint64_t prev = data->req.raw;
 
     data->req.min_perf = min_perf;
     data->req.max_perf = max_perf;
-    data->req.des_perf = des_perf;
+    if ( !opt_cpufreq_active )
+        data->req.des_perf = des_perf;
+    else
+    {
+        data->req.des_perf = 0;
+        /* Get pre-defined BIOS value */
+        if ( epp < 0 )
+            data->req.epp = epp_init;
+        else if ( epp > UINT8_MAX )
+            return -EINVAL;
+        else
+            data->req.epp = epp;
+    }
 
     if ( prev == data->req.raw )
         return 0;
@@ -292,7 +306,25 @@ static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
         return res;
 
     return amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
-                                  des_perf, data->caps.highest_perf);
+                                  des_perf, data->caps.highest_perf, -1);
+}
+
+static int read_epp_init_once(void)
+{
+    uint64_t val;
+    static bool read_once = false;
+
+    if ( !read_once )
+    {
+        if ( rdmsr_safe(MSR_AMD_CPPC_REQ, val) )
+            return -EINVAL;
+        epp_init = (val >> 24) & 0xFF;
+
+        /* Read pre-defined BIOS value once */
+        read_once = true;
+    }
+
+    return 0;
 }
 
 static void cf_check amd_cppc_init_msrs(void *info)
@@ -381,7 +413,8 @@ static void cf_check amd_cppc_init_msrs(void *info)
     data->nominal_freq = nominal_freq;
     data->max_freq = max_freq;
 
-    return;
+    if ( !read_epp_init_once() )
+        return;
 
  err:
     data->err = -EINVAL;
@@ -402,7 +435,7 @@ static void amd_cppc_boost_init(struct cpufreq_policy *policy, const struct amd_
     policy->turbo = CPUFREQ_TURBO_ENABLED;
 }
 
-static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int amd_cppc_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
     struct amd_cppc_drv_data *data;
@@ -429,6 +462,17 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     amd_cppc_boost_init(policy, data);
 
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    int ret;
+
+    ret = amd_cppc_cpufreq_init_perf(policy);
+    if ( ret )
+        return ret;
+
     amd_cppc_verbose("CPU %u initialized with amd-cppc passive mode\n", policy->cpu);
     return 0;
 }
@@ -443,6 +487,52 @@ static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
+static int cf_check amd_cppc_epp_cpu_init(struct cpufreq_policy *policy)
+{
+    int ret;
+
+    ret = amd_cppc_cpufreq_init_perf(policy);
+    if ( ret )
+        return ret;
+
+    policy->policy = cpufreq_parse_policy(policy->governor);
+
+    amd_cppc_verbose("CPU %u initialized with amd-cppc active mode\n", policy->cpu);
+
+    return 0;
+}
+
+static int amd_cppc_epp_update_limit(const struct cpufreq_policy *policy)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, policy->cpu);
+    uint8_t max_perf, min_perf, des_perf;
+    int epp = -1;
+
+    /* Initial min/max values for CPPC Performance Controls Register */
+    max_perf = data->caps.highest_perf;
+    min_perf = data->caps.lowest_perf;
+
+    /* CPPC EPP feature require to set zero to the desire perf bit */
+    des_perf = 0;
+
+    if ( policy->policy == CPUFREQ_POLICY_PERFORMANCE )
+    {
+        /* Force the epp value to be zero for performance policy */
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        min_perf = max_perf;
+    }
+    else if ( policy->policy == CPUFREQ_POLICY_POWERSAVE )
+        /* Force the epp value to be 0xff for powersave policy */
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+
+    return amd_cppc_write_request(policy->cpu, min_perf, des_perf, max_perf, epp);
+}
+
+static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
+{
+    return amd_cppc_epp_update_limit(policy);
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber amd_cppc_cpufreq_driver =
 {
     .name   = XEN_AMD_CPPC_DRIVER_NAME,
@@ -452,10 +542,22 @@ static const struct cpufreq_driver __initconst_cf_clobber amd_cppc_cpufreq_drive
     .exit   = amd_cppc_cpufreq_cpu_exit,
 };
 
+static const struct cpufreq_driver  __initconst_cf_clobber amd_cppc_epp_driver =
+{
+    .name       = XEN_AMD_CPPC_EPP_DRIVER_NAME,
+    .verify     = amd_cppc_cpufreq_verify,
+    .setpolicy  = amd_cppc_epp_set_policy,
+    .init       = amd_cppc_epp_cpu_init,
+    .exit       = amd_cppc_cpufreq_cpu_exit,
+};
+
 int __init amd_cppc_register_driver(void)
 {
     if ( !cpu_has_cppc )
         return -ENODEV;
 
-    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+    if ( !opt_cpufreq_active )
+        return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+    else
+        return cpufreq_register_driver(&amd_cppc_epp_driver);
 }
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index e690a484f1..13342e8469 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -484,3 +484,14 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
 
     return __cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 }
+
+unsigned int cpufreq_parse_policy(const struct cpufreq_governor *gov)
+{
+    if ( !strncasecmp(gov->name, "performance", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_PERFORMANCE;
+
+    if ( !strncasecmp(gov->name, "powersave", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_POWERSAVE;
+
+    return CPUFREQ_POLICY_UNKNOWN;
+}
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 3c2b951830..fb42d61567 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -83,6 +83,7 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
+    unsigned int        policy;
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
@@ -133,6 +134,17 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
 extern struct cpufreq_governor *__find_governor(const char *governor);
 #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
 
+#define CPUFREQ_POLICY_UNKNOWN      0
+/*
+ * If cpufreq_driver->target() exists, the ->governor decides what frequency
+ * within the limits is used. If cpufreq_driver->setpolicy() exists, these
+ * two generic policies are available:
+ */
+#define CPUFREQ_POLICY_POWERSAVE    1
+#define CPUFREQ_POLICY_PERFORMANCE  2
+
+unsigned int cpufreq_parse_policy(const struct cpufreq_governor *gov);
+
 /* pass a target to the cpufreq driver */
 extern int __cpufreq_driver_target(struct cpufreq_policy *policy,
                                    unsigned int target_freq,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 42997252ef..fa431fd983 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -424,6 +424,7 @@ struct xen_set_cppc_para {
 };
 
 #define XEN_AMD_CPPC_DRIVER_NAME "amd-cppc"
+#define XEN_AMD_CPPC_EPP_DRIVER_NAME "amd-cppc-epp"
 #define XEN_HWP_DRIVER_NAME "hwp"
 
 /*
-- 
2.34.1


