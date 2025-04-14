Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A959A87976
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949266.1345874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4EdC-0001Ea-Vk; Mon, 14 Apr 2025 07:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949266.1345874; Mon, 14 Apr 2025 07:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4EdC-0001AZ-SR; Mon, 14 Apr 2025 07:53:26 +0000
Received: by outflank-mailman (input) for mailman id 949266;
 Mon, 14 Apr 2025 07:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ESL-0000Ks-LT
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:42:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2416::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1952a7b-1903-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 09:41:59 +0200 (CEST)
Received: from CH2PR11CA0013.namprd11.prod.outlook.com (2603:10b6:610:54::23)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 07:41:51 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::e8) by CH2PR11CA0013.outlook.office365.com
 (2603:10b6:610:54::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 07:41:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:51 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:49 -0500
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
X-Inumbo-ID: f1952a7b-1903-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phKIpdBRFbM1222vzf9Kq89EbGL13tRXj7ttuZ8c+6v/wqwn5ZAQMU7x7of/Ir2pIS3rWWjk6aE/tdCDpg6sPVACeN2Yr9hdpNyw+OayCaMcZsMf5WzIdrafJ/KUtudOPAhdJen4eFQqUPrNwhsO2lmEVaa77GNrdiH0W6GsqxVA/v2UlFPPemF4b5EXbF+ntkTJvgcy9PsJ3WIO7cNgu7D5g1YqXfF0vkstctonPoMZtFrw5mMbWnbONMv1T4pN7bs5UmErpxgSKk09szHvLES5I1g7og9kwYN+GBq4F3EgtnnMe9u3AhCIWQDR4cV6YaUuMyIK34yLBqeb2vmWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hKQBCnl75VVvvg8dGxR6aY0UyWkw8GIJ3S7e5wWPNo=;
 b=wMrKaOShTT32UFOIqCK4mzHV5WIo/Bi7oUkEXd9NqNs+GjRge554ZBl2/gGea8zvaWwzEs8L+vf6VyveBNsqqFIQbq1r0+KeuKsLSeWtLqgb3FK5P6wgwDgbafT1VMhhkFkaji0ahzrgSipAsS3Yir2XkGAfOtK7kwxx0s9Q7IrjAdf1V9RUX7xrbQX7lQyYWpItjuq8D9OUC8cDGEVPbWiqj/6OTPup6APbjDnlqq3p3NlFz/5lpCstFQoj48CE8S6mdo961THIVNtNO380pUMpmLB398G1dDvjVcxqw2nv3C0hO37bMk0C2R1w+DMDIoJJzkTQjSk+38ET9degfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hKQBCnl75VVvvg8dGxR6aY0UyWkw8GIJ3S7e5wWPNo=;
 b=KXhje4o1OjSpk2IxGwq6kjj0H9bj3YScmPVUjiVUG97CMF3nuhJyqsgoxu6F0/Jni63V2x+3Ti662leUw8RuTBJhkr2hhGVfQnBTVDthmuxjxiMH/gqr7NL5BhJR1WgKVbIzmuGoev4XcOP/NcyZaACWu9C+dcW8UuIj0A7ePt4=
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
Subject: [PATCH v4 15/15] xen/xenpm: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Mon, 14 Apr 2025 15:40:56 +0800
Message-ID: <20250414074056.3696888-16-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c43744-ebba-49d2-20f1-08dd7b27d22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rL+MJ9KwDkH0LiIkxDf6BbUKQqHtfPfoUajdf1ryzOhM72ViDssMRursM77Z?=
 =?us-ascii?Q?UvsGWBz0NSe0CdzfsMDYBe9jCxvoPDkQDVLNJZiXXWcDE9yW+qxquX2IrG7V?=
 =?us-ascii?Q?9iMbDp9kcip8UlfmT/yUjjbEAGHbAShBSjwMcQbHswrRlTR2bHWfLYyq1UMo?=
 =?us-ascii?Q?31jMT7xt1VuekZ5BdRvyCjGzq13XNguBUI5fNTDZ48bH+nuzrVwF6NzDyEWh?=
 =?us-ascii?Q?BycaPVahwC1Uq0cljtjUFodTeQIPctwzcL15GLu/wlgtTTltK3YIdkscRZ83?=
 =?us-ascii?Q?qufkJjcjo7C2/MkzyoKeR2NgFEaC3aopwra6mbHc1EeMeOlGjuFlSEWE2kSr?=
 =?us-ascii?Q?gqb7VNeYSWlgV+GmozxEXtxls/MtMtDGZ80KLWnf+j55jM9kWjZoMhX7fSRD?=
 =?us-ascii?Q?ksGKcVmY/KXyum4kLWSLgk6rhKoORwA88t/H2VPjEyL5s3DsdUvbD9S94kPq?=
 =?us-ascii?Q?WQe3oYpw8cWx8TLqmhQQQnoa7axPDVBgQhWo9Zq/mrliZc9sCL5dvfzNzpxX?=
 =?us-ascii?Q?QHNWQB8ZjPhTeRD0tzTE5q9SgzDLtfZ2WB0qWc4PLU1uwOEjkRFSj4/JyIAy?=
 =?us-ascii?Q?v15c5KQ/nbiNZZWU6f7qbS+XrqXvbMdF2cQYN6lK9mJC8B4+1gtd1yHxwVgk?=
 =?us-ascii?Q?JH7bWlQq47vpojou9d/S/gz++IvaRyDizXEl5+ZDRYI1dJDnLknbCEk+f/0M?=
 =?us-ascii?Q?PUdCf/pNg4TYs4s+t8/RFnNhf9dC+7CuB8Q9Yjqk51rgIOg1dUAkq2/QM5kI?=
 =?us-ascii?Q?X3eYkYPWZV4BlVH8OkFvG05CMn1JiWfWUdd885FdFS8hddyAYlTWAZkVHWrD?=
 =?us-ascii?Q?zyV86Hh5KNAb/MYoAfR2Fa7ux/tmy9TfSgSB8QNA0tJww56NzL7N3oMymOpV?=
 =?us-ascii?Q?S2sFhDH6ffx+AiZRsAsD64+NXbD1IWR1J2R3Yy/SWU+rCoiahAF5O1mRV2k4?=
 =?us-ascii?Q?tGlK11VorcsJelpIhsjWIZn47yBsI74Lm61uIxVpXbw4sb3IJvNmmhzJRAEQ?=
 =?us-ascii?Q?B1l3GQ/n6st8MAGyY1JGulc632zeSR1nIUIfomFetPVTW98LaH5MM7fDpyxM?=
 =?us-ascii?Q?Yn9xoGo3M71pnXD2ggpOMDdk2b1yGTArJeOb1+3z1ogg/DcFCKkgcNcj5HKP?=
 =?us-ascii?Q?2oS6vaoZJ1GXyvzN8Ogns6L6XJ5WJiTsE/J551AlxalY3Tku/F9ywLdMlMBL?=
 =?us-ascii?Q?hbYLvGT2nMNTB+0rkkbJJIzGMRl9ibuv3K+83Yu4gfCxH4TteTSJcUOaAdKJ?=
 =?us-ascii?Q?CYd9MPBvFcc7srQ/FedP94Rmp4TVw9at3MJv6suLggXc/hrBzPUZ9YE5rYsQ?=
 =?us-ascii?Q?4k/Gyxei75nNnXlB1S4SeUUlR+yaPXLmeZtTyZwg7cHdJZZJLGcwBNwPfgZt?=
 =?us-ascii?Q?NLi5DzQB17HGCWswOFPh90p3ucdM41U/nbhprN7n9fZl2uy1Ph/eeA4cIJvG?=
 =?us-ascii?Q?NUJVryPswyFiySecqa+t6xhwzQCHedIq6pCTvbo0J20T5dPfxjbUubpkV6vy?=
 =?us-ascii?Q?IfLyX7OZsbJdB31RFfto/eAdgk1NmzC2dwbV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:51.5901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c43744-ebba-49d2-20f1-08dd7b27d22c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528

Introduce helper set_amd_cppc_para and get_amd_cppc_para to
SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Give the variable des_perf an initializer of 0
- Use the strncmp()s directly in the if()
---
v3 -> v4
- refactor comments
- remove double blank lines
- replace amd_cppc_in_use flag with XEN_PROCESSOR_PM_CPPC
---
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 121 +++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c            |  22 ++++-
 xen/include/acpi/cpufreq/cpufreq.h   |   4 +
 3 files changed, 143 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 3a576fd4be..95d04bf77a 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -540,6 +540,127 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
     return 0;
 }
 
+int get_amd_cppc_para(unsigned int cpu,
+                      struct xen_cppc_para *cppc_para)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+
+    if ( data == NULL )
+        return -ENODATA;
+
+    cppc_para->features         = 0;
+    cppc_para->lowest           = data->caps.lowest_perf;
+    cppc_para->lowest_nonlinear = data->caps.lowest_nonlinear_perf;
+    cppc_para->nominal          = data->caps.nominal_perf;
+    cppc_para->highest          = data->caps.highest_perf;
+    cppc_para->minimum          = data->req.min_perf;
+    cppc_para->maximum          = data->req.max_perf;
+    cppc_para->desired          = data->req.des_perf;
+    cppc_para->energy_perf      = data->req.epp;
+
+    return 0;
+}
+
+int set_amd_cppc_para(const struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint8_t max_perf, min_perf, des_perf = 0, epp;
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    /* Validate all parameters - Disallow reserved bits. */
+    if ( set_cppc->minimum > UINT8_MAX || set_cppc->maximum > UINT8_MAX ||
+         set_cppc->desired > UINT8_MAX || set_cppc->energy_perf > UINT8_MAX )
+        return -EINVAL;
+
+    /* Only allow values if params bit is set. */
+    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
+          set_cppc->desired) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
+          set_cppc->minimum) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
+          set_cppc->maximum) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
+          set_cppc->energy_perf) )
+        return -EINVAL;
+
+    /* Activity window not supported in MSR */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        return -EOPNOTSUPP;
+
+    /* Return if there is nothing to do. */
+    if ( set_cppc->set_params == 0 )
+        return 0;
+
+    epp = per_cpu(epp_init, cpu);
+    /*
+     * Apply presets:
+     * XEN_SYSCTL_CPPC_SET_DESIRED reflects whether desired perf is set, which
+     * is also the flag to distiguish between passive mode and active mode.
+     * When it is set, CPPC in passive mode, only
+     * XEN_SYSCTL_CPPC_SET_PRESET_NONE could be chosen, where min_perf =
+     * lowest_nonlinear_perf to ensures performance in P-state range.
+     * when it is not set, CPPC in active mode, three different profile
+     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/BALANCE are provided,
+     * where min_perf = lowest_perf having T-state range of performance.
+     */
+    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->caps.lowest_perf;
+        /* Lower max frequency to nominal */
+        max_perf = data->caps.nominal_perf;
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        /* Increase idle frequency to highest */
+        min_perf = data->caps.highest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->caps.lowest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_BALANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
+        min_perf = data->caps.lowest_nonlinear_perf;
+        max_perf = data->caps.highest_perf;
+        break;
+
+    default:
+        return -EINVAL;
+    }
+
+    /* Further customize presets if needed */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM )
+        min_perf = set_cppc->minimum;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM )
+        max_perf = set_cppc->maximum;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF )
+        epp = set_cppc->energy_perf;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+        des_perf = set_cppc->desired;
+
+    amd_cppc_write_request(cpu, min_perf, des_perf, max_perf, epp);
+    return 0;
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 83cfef398e..876d82036d 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -257,7 +257,18 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
          !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
                   CPUFREQ_NAME_LEN) )
         ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    else if ( !strncmp(op->u.get_para.scaling_driver,
+                       XEN_AMD_CPPC_DRIVER_NAME,
+                       CPUFREQ_NAME_LEN) ||
+              !strncmp(op->u.get_para.scaling_driver,
+                       XEN_AMD_CPPC_EPP_DRIVER_NAME,
+                       CPUFREQ_NAME_LEN) )
+        ret = get_amd_cppc_para(policy->cpu, &op->u.get_para.u.cppc_para);
+
+    if ( strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
+                 CPUFREQ_NAME_LEN) &&
+         strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME,
+                 CPUFREQ_NAME_LEN) )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -413,10 +424,13 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -ENOENT;
 
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
+    if ( hwp_active() )
+        return set_hwp_para(policy, &op->u.set_cppc);
+
+    if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC )
+        return set_amd_cppc_para(policy, &op->u.set_cppc);
 
-    return set_hwp_para(policy, &op->u.set_cppc);
+    return -EOPNOTSUPP;
 }
 
 int do_pm_op(struct xen_sysctl_pm_op *op)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 6f31009e82..4d786ce92b 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -292,5 +292,9 @@ int acpi_cpufreq_register(void);
 
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
+int get_amd_cppc_para(unsigned int cpu,
+                      struct xen_cppc_para *cppc_para);
+int set_amd_cppc_para(const struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.34.1


