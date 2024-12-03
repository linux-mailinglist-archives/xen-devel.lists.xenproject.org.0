Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C00329E1598
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847374.1262500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIODp-0004th-Qs; Tue, 03 Dec 2024 08:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847374.1262500; Tue, 03 Dec 2024 08:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIODp-0004rW-OF; Tue, 03 Dec 2024 08:25:29 +0000
Received: by outflank-mailman (input) for mailman id 847374;
 Tue, 03 Dec 2024 08:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIODo-0004rQ-EO
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:25:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25a3e7c2-b150-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:25:26 +0100 (CET)
Received: from BLAPR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:36e::14)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 08:25:20 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::60) by BLAPR05CA0005.outlook.office365.com
 (2603:10b6:208:36e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.8 via Frontend Transport; Tue, 3
 Dec 2024 08:25:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:25:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:18:59 -0600
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
X-Inumbo-ID: 25a3e7c2-b150-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOh0pbkD/pccWa6LSOkuFNQOXUbkhVnnL5tOmw+BUwFkQQg9o511AbB/k5/VsB6O1UPVPDUaKm75x+3v8yJIbDXBnv8dcMiXGcJxoEOhPzDBcLpcSRB66N7FkZVUjP5te3ugh9nyloEAEv0TI2MgqpJvHd4xqqf9uXezGoDezxy6gzSY/nWITAKklVx6ade+ROj4bx7v3FtkwMBBRZfQN/NspLoo4d5aKk8vv9Bua/6M36MifhUlnY1JLaZXdgh/kMhIzMpolQ4g43mqN7Dt6szBRjQMZC+DzYYPspccDMKd+4u9leGAYypFtSXw1lcVQoz0Lb3Ci4EDjS5LWdKgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4dJCl26eHmCdRb0RKikZAAPzPCXi7jxKKOsNs/5cWE=;
 b=Qfey+JeGPHx0jIy1QcrsGnSaZJxDrBmhYunVJlgUUUvEMpgvZJbwlm0niuR+eKFCsDBoc23ewuLWDJENeN+KtxjqLqPc6BUiyqDgnU7hYx0qFpi66MHsBU38+G6h31YdaskjeOsUIgMzGylcvc03Ti0gbqhbdG8RM3mernWdpMH0kpByXM6ZRPRBdeSUV6eU4LIhGPFJ3VjQPmKEm575ID/Zz5FeY5InG7qXc9Wa9GGutlivvGy4hdNqRqEk2sYB1FVVkiruzqdwKho8X7ZByP6B2XparaqsnG8aa4Tk65CFaypA1S5Zu/faapcUsWNWmu5179D5n02mINBG7oI3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4dJCl26eHmCdRb0RKikZAAPzPCXi7jxKKOsNs/5cWE=;
 b=JGQ8nH8z4QGsYpHNbMdSDQvD+Xoa/EMe0UXgfHzIFlEnRD4vjyZHHAJM1BKuQ4H2u/3xiGzOzi+30asfrAdxEPiCVfKPynOOZb31j/EaAEvTEMsUl4Uu06DyGN2C9eMCpN/KP429so875o4SMqMe8alnC/B/fwGYB3yTHVGuEEM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v1 09/11] xen/x86: implement EPP support for the AMD processors
Date: Tue, 3 Dec 2024 16:11:09 +0800
Message-ID: <20241203081111.463400-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f9b21e-0211-4b0a-579f-08dd1374068f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mii5nmVtQOUzMQRU7LY5WkFE44Dmii+pDmEMQah706N/LK7vBIBKcliIWKgD?=
 =?us-ascii?Q?zFOXeqGB/N5yodCnlzNvu37cgS2Sg4YQjq7nXgNo9rWLzOQ4/PCw7JfN+rRr?=
 =?us-ascii?Q?kYtBqX7waFSqP5arYKmVKGRrnc+JGhq3USFu3UzK2tyyisRNgqvdE7Ezwb0H?=
 =?us-ascii?Q?GC9ZgGSEWmFJkAuiQDA7lFpftKX6M6tXO9WWj9Xo6/bMXZv4/KiIZGdHXrAq?=
 =?us-ascii?Q?YoZlWqibgIIX4dGanVBM/zCsEClgI5J7JDfsWV6DqmyJbKHQunu1JnfRqqsb?=
 =?us-ascii?Q?8OXrxZUrgSySOgIOnbU717ggAWzOomLM+cMlTwzHX69P04KwVRAHO8ZR/WUP?=
 =?us-ascii?Q?5Ws1sanJX38M8SKnT042EgqXM+43fRsrpX18PDTjDH6EK3dlwnOZw0uuFHhK?=
 =?us-ascii?Q?2o+bvcercbhAQ1Y3rAC4Rp7M2BRqAHuyJ4pCypr8EJf5zerLExi1z1lxeOrk?=
 =?us-ascii?Q?CALhzXjf8qNwFhoCF23b1/C6jh890hKxAGmFuJQZf//rQ1Kn208HnWv3jo/+?=
 =?us-ascii?Q?Eqckm5gXZHVyIlemCveTwMFBfj04TNbjz0mc80pU3w6JBXAEy8y39tD6AsJg?=
 =?us-ascii?Q?H02Rl9COzq1jRa2E4oji+/Q2St0S9aLu4j7F3pd/TlrEn/+4e/fllogFlI3d?=
 =?us-ascii?Q?bvrTAq6GJukrXa0hbwoBYi4NOFRX2x4vE4T2x+8LjR+yC3/zoZFThdYWRJkg?=
 =?us-ascii?Q?GxC0RYetFv83vKXSBqzaRTMqlyiMGPjx1BEywimMwNwV0j+0yhteFlgUhBcr?=
 =?us-ascii?Q?swQNPkJ6fg20zitjFFPQtPZS3TlV99dNmmidp5sXfj6y4+6QggeT/2pKSwKt?=
 =?us-ascii?Q?aybcGqw7D5jVYH+S6e4KcFrI20G4mn8NK8jniYb04acVEHC7lz/swOKVM0gD?=
 =?us-ascii?Q?K/DxkyDHyF4MpzLQK6ML44lADFOtyIzf+3G+hskfr/EUENVqnpxPAbzLcpL2?=
 =?us-ascii?Q?3u9YQvAcz2ZK6TkWMGrULmBS/foUT+BvEgjZSQ1Argha7gZ4T9Gcaj9ln9NU?=
 =?us-ascii?Q?1k1JwQB7ZuU+RNjeEvw5h+/t8//8vfgINCgN6LglgMnFWM7Uo1VoXnjz4r3Y?=
 =?us-ascii?Q?rLEW8uXd/s8DM/w8AX9HJiKgOitLTyVCsKcqznhus7rrrKKWxKrlatqUd0On?=
 =?us-ascii?Q?3BvzhQdE/IoFS44COZZvjkvpe6y3uqvgAEO7ADyJ+YiAwd8KFoOexjt9da4O?=
 =?us-ascii?Q?ce3pbh1U1kcTQh0m0SXlPXxxHWFRSYFeOIhPPYxczmK2ip/uNgrABd5/B5Iu?=
 =?us-ascii?Q?qzO6UX3XBhLQl26rIDzi3zJ9OS7iVSC0zJUxORV3GA6yd+vxE8ueVI2UR1Jw?=
 =?us-ascii?Q?m1A3IMC6uUGKn0rmG8OqUAL0Apnl4beWfwAdY3KbhVIAXoggFLQ85MPzTpkr?=
 =?us-ascii?Q?INMy/PYCKPbRcV6DqrzFRUQIYhlU44zBqwDG3JUoSKso6CzP4ZHACWqC8Q9m?=
 =?us-ascii?Q?xk2l6s5ovQ2cB5/45+D+zUobZr6uYy4Y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:25:20.3044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f9b21e-0211-4b0a-579f-08dd1374068f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530

amd-pstate has 2 operation modes: autonomous (active) mode,
non-autonomous (passive) mode.
In active mode, platform ignores the requestd done in the Desired
Performance Target register and takes into account only the values
set to the minimum, maximum and energy performance preference(EPP)
registers.
The EPP is used in the CCLK DPM controller to drive the frequency
that a core is going to operate during short periods of activity.

The SOC EPP targets are configured on a scale from 0 to 255 where 0
represents maximum performance and 255 represents maximum efficiency.

This commit implements one new AMD CPU frequency driver `amd-pstate-epp`
for active mode.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/acpi/cpufreq/amd-pstate.c | 122 +++++++++++++++++++++++--
 xen/arch/x86/acpi/cpufreq/hwp.c        |  10 +-
 xen/include/acpi/cpufreq/cpufreq.h     |   5 +
 xen/include/public/sysctl.h            |   2 +-
 4 files changed, 125 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-pstate.c b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
index 43abdd8636..40ecd04259 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-pstate.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
@@ -57,6 +57,8 @@ struct amd_pstate_drv_data
         } req;
     };
     int err;
+    /* EPP feature related attributes */
+    unsigned int policy;
 
     uint32_t max_freq;
     uint32_t min_freq;
@@ -67,6 +69,8 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct amd_pstate_drv_data *, amd_pstate_drv_d
 
 uint16_t __read_mostly dmi_max_speed_mhz;
 
+static bool __ro_after_init epp_mode;
+
 static bool __init amd_pstate_handle_option(const char *s, const char *end)
 {
     int ret;
@@ -223,14 +227,29 @@ static void amd_pstate_write_request_msrs(void *info)
 }
 
 static int cf_check amd_pstate_write_request(int cpu, uint8_t min_perf,
-                                             uint8_t des_perf, uint8_t max_perf)
+                                             uint8_t des_perf, uint8_t max_perf,
+                                             int epp)
 {
     struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
-    uint64_t prev = data->amd_req;
+    uint64_t prev = data->amd_req, val;
 
     data->req.min_perf = min_perf;
     data->req.max_perf = max_perf;
-    data->req.des_perf = des_perf;
+    if ( !epp_mode )
+        data->req.des_perf = des_perf;
+    else
+    {
+        data->req.des_perf = 0;
+        /* Get pre-defined BIOS value */
+        if ( epp < 0 )
+        {
+            if ( rdmsr_safe(MSR_AMD_CPPC_REQ, val) )
+                return -EINVAL;
+            data->req.epp = (val >> 24) & 0xFF;
+        }
+        else
+            data->req.epp = epp;
+    }
 
     if ( prev == data->amd_req )
         return 0;
@@ -257,7 +276,7 @@ static int cf_check amd_pstate_cpufreq_target(struct cpufreq_policy *policy,
     min_perf = data->hw.lowest_nonlinear_perf;
     des_perf = amd_pstate_khz_to_perf(data, target_freq);
 
-    return amd_pstate_write_request(policy->cpu, min_perf, des_perf, max_perf);
+    return amd_pstate_write_request(policy->cpu, min_perf, des_perf, max_perf, -1);
 }
 
 static void cf_check amd_pstate_init_msrs(void *info)
@@ -354,7 +373,7 @@ static void amd_pstate_boost_init(struct cpufreq_policy *policy, struct amd_psta
     policy->turbo = CPUFREQ_TURBO_ENABLED;
 }
 
-static int cf_check amd_pstate_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int amd_pstate_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
     struct amd_pstate_drv_data *data;
@@ -379,10 +398,23 @@ static int cf_check amd_pstate_cpufreq_cpu_init(struct cpufreq_policy *policy)
         return -ENODEV;
     }
 
-    amd_pstate_boost_init(policy, data);
     return 0;
 }
 
+static int cf_check amd_pstate_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    int ret = 0;
+    struct amd_pstate_drv_data *data;
+
+    ret = amd_pstate_cpufreq_init_perf(policy);
+    if ( ret )
+        return ret;
+
+    data = per_cpu(amd_pstate_drv_data, policy->cpu);
+    amd_pstate_boost_init(policy, data);
+    return ret;
+}
+
 static int cf_check amd_pstate_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
     struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, policy->cpu);
@@ -393,6 +425,70 @@ static int cf_check amd_pstate_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
+static void amd_perf_ctl_reset(void *data)
+{
+    wrmsr_safe(MSR_K8_PSTATE_CTRL, 0);
+}
+
+static int cf_check amd_pstate_epp_cpu_init(struct cpufreq_policy *policy)
+{
+    int ret = 0;
+    struct amd_pstate_drv_data *data;
+
+    /*
+     * Resetting P-State Control register will put the CPU in P0 frequency,
+     * which is ideal for initialization process.
+     */
+    on_selected_cpus(cpumask_of(policy->cpu), amd_perf_ctl_reset, NULL, 1);
+
+    ret = amd_pstate_cpufreq_init_perf(policy);
+    if ( ret )
+        return ret;
+
+    data = per_cpu(amd_pstate_drv_data, policy->cpu);
+
+    policy->policy = cpufreq_parse_policy(policy->governor);
+
+    amd_pstate_boost_init(policy, data);
+
+    amd_pstate_verbose("CPU %u initialized with amd-pstate active mode\n", policy->cpu);
+
+    return 0;
+}
+
+static int cf_check amd_pstate_epp_update_limit(struct cpufreq_policy *policy)
+{
+    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, policy->cpu);
+    uint8_t max_perf, min_perf, des_perf;
+    int epp = -1;
+
+    /* Initial min/max values for CPPC Performance Controls Register */
+    max_perf = data->hw.highest_perf;
+    min_perf = data->hw.lowest_perf;
+
+    if ( data->policy == CPUFREQ_POLICY_PERFORMANCE )
+        min_perf = max_perf;
+
+    /* CPPC EPP feature require to set zero to the desire perf bit */
+    des_perf = 0;
+
+    if ( data->policy == CPUFREQ_POLICY_PERFORMANCE )
+        /* Force the epp value to be zero for performance policy */
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+    else if ( data->policy == CPUFREQ_POLICY_POWERSAVE )
+        /* Force the epp value to be 0xff for powersave policy */
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+
+    return amd_pstate_write_request(policy->cpu, min_perf, des_perf, max_perf, epp);
+}
+
+static int cf_check amd_pstate_epp_set_policy(struct cpufreq_policy *policy)
+{
+    amd_pstate_verbose("Set new policy for CPU %u\n", policy->cpu);
+
+    return amd_pstate_epp_update_limit(policy);
+}
+
 static const struct cpufreq_driver __initconstrel amd_pstate_cpufreq_driver =
 {
     .name   = XEN_AMD_PSTATE_DRIVER_NAME,
@@ -402,6 +498,15 @@ static const struct cpufreq_driver __initconstrel amd_pstate_cpufreq_driver =
     .exit   = amd_pstate_cpufreq_cpu_exit,
 };
 
+static const struct cpufreq_driver __initconstrel amd_pstate_epp_driver =
+{
+    .name       = XEN_AMD_PSTATE_EPP_DRIVER_NAME,
+    .verify     = amd_pstate_cpufreq_verify,
+    .setpolicy  = amd_pstate_epp_set_policy,
+    .init       = amd_pstate_epp_cpu_init,
+    .exit       = amd_pstate_cpufreq_cpu_exit,
+};
+
 int __init amd_pstate_register_driver(void)
 {
     if ( !cpu_has_cppc )
@@ -409,4 +514,9 @@ int __init amd_pstate_register_driver(void)
 
     if ( !opt_cpufreq_active )
         return cpufreq_register_driver(&amd_pstate_cpufreq_driver);
+    else
+    {
+        epp_mode = true;
+        return cpufreq_register_driver(&amd_pstate_epp_driver);
+    }
 }
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
index cad27f6811..d2a74d8315 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -83,6 +83,7 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
+    unsigned int        policy;
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
@@ -264,6 +265,10 @@ void cpufreq_dbs_timer_resume(void);
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
+#define CPPC_ENERGY_PERF_MAX_PERFORMANCE 0
+#define CPPC_ENERGY_PERF_BALANCE         0x80
+#define CPPC_ENERGY_PERF_MAX_POWERSAVE   0xff
+
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
 #ifdef CONFIG_INTEL
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index df4f362681..74f73a6bba 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -425,7 +425,7 @@ struct xen_set_cppc_para {
 
 #define XEN_HWP_DRIVER_NAME "hwp"
 #define XEN_AMD_PSTATE_DRIVER_NAME "amd-pstate"
-
+#define XEN_AMD_PSTATE_EPP_DRIVER_NAME "amd-pstate-epp"
 /*
  * cpufreq para name of this structure named
  * same as sysfs file name of native linux
-- 
2.34.1


