Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6692A2A368
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882636.1292773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxSF-0007sh-Cj; Thu, 06 Feb 2025 08:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882636.1292773; Thu, 06 Feb 2025 08:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxSF-0007q7-7X; Thu, 06 Feb 2025 08:41:47 +0000
Received: by outflank-mailman (input) for mailman id 882636;
 Thu, 06 Feb 2025 08:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKa-0000gq-Ly
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2415::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16cf256a-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:50 +0100 (CET)
Received: from BN0PR04CA0182.namprd04.prod.outlook.com (2603:10b6:408:e9::7)
 by SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 08:33:46 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::d7) by BN0PR04CA0182.outlook.office365.com
 (2603:10b6:408:e9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 08:33:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:43 -0600
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
X-Inumbo-ID: 16cf256a-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVbBqLB186Y5OjSJdW3Ix03Dx7ht1ERJz6W+3jhLI4VVciVwLoulE1kVtOJ46Vle+CztBrk9LqwidMUVL6l1//9QQH5MLiieI2ztOgMx26dMSSF7tvDUrBb1ZMdD44nYPN5tuHbVbu7ZrJlfd3m9Q1JEitO+BQxfg64ZsT2fmC9WCBcoKU4phz0pRbd4J60JKWumfU8Iq9I2XUBq0xBeBCwyD6K+ztRpJteEPaibvZ4P2WOkFk2pEQx/JCS/r93qC1Bz91j8j5GfwAsWpiX/9EwLYakMuWLdkcG3/kHS4T2YrnwE0bXR0ERd+rCxV5GYz7AuzroM357h8jFHaM2jwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTwOSClpySqVHtBYS16fXQWk/Uwc9ObT60ZZS2kT9pg=;
 b=odezZccOMKZxv/mc4kN7lziAQqsFhm9rO20jHSHZHat9lSIcyz7n8MSXn6+icnAarTf10QRFBPpZUzhzR6i2axnNBNxtuCopJIK7S8XdMPuWt1PUFgkap1fcnyn7prhVSbLEyud3PUN2D3hznbxfe96lsjg4Q86kRYMjdess9McfDC8wQIuM0+1JbGi77amO+Xvb4UzJl4yXweXPHx7yMqczwon965RdgG/aZSU5B3zm14kpRBRnTPsmv6Di1OVvOc8rR/+2gxtdRPHxFN0WfwVFG1PeTvj9r14B7I+CVxcjXTAcjZNOwee62fBNaDTDbGiNTfCQz273Wd7CGIoX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTwOSClpySqVHtBYS16fXQWk/Uwc9ObT60ZZS2kT9pg=;
 b=uXSgd7OnH1aOKIJsQbGwtF8k1mV2KT7r5iM2Ef+dwYo5PolWH8Tr/y+51F9kWs2JSxCJnBdBvxdt1HpUKnj9gFvDry1mf10xRPDZ+2xp0R2iVIctYYPPWidAgOavPT4KL2KCXUkEVjoxp/YUX7SaCsl6Vg3FSdkrGUHCO/ab6pU=
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
	<roger.pau@citrix.com>
Subject: [PATCH v2 11/11] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Thu, 6 Feb 2025 16:32:55 +0800
Message-ID: <20250206083255.1296363-12-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fc6546-d286-459f-c024-08dd4688f8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Io4nhfol9dciydy7fmRC4LlTvPcuHdHHX4btAqnS8UzwaQ45zmNokd/P9XFp?=
 =?us-ascii?Q?cXo9D8FDXVpxmvlBGrPB5EamPS/LVWn4A0nnob/RyNVOE30wmcD6cpt1+Ppv?=
 =?us-ascii?Q?YVedUiYABQ0IDjq2q9KUEMo0QKDzxYSAiCgQz/GLVrCdt9rbNh8nkAh20zVK?=
 =?us-ascii?Q?ZsIqYII94H9hnH3HTON8nr3Ev3fpughkBfrlv9QdlnZ5sARPaPVC/hZYLnxi?=
 =?us-ascii?Q?zags0te2gfWdZ2Cg5fZ/61f83US9/Sg07kKJVIt1x+FCO94BwrYbgqWlHfD5?=
 =?us-ascii?Q?0yj4Y5owg+U9tvBbRdwtmYzuXE8whDj9Z5+TLOeLRdoiNu3IIgDIZn8j063P?=
 =?us-ascii?Q?oVE256DoCgNxUuk5JMVXZ89m1P8JV7y7YZXpPQY6z54VAmyalSJFxCdqgfwm?=
 =?us-ascii?Q?8sXFNIKsWxhWqTuzglcn5bFnG0bwzyF1dAUNEdkL25tz9Pn9b0KLhKbspkeH?=
 =?us-ascii?Q?URthsrR3d7ICMIqizPpprlkSrLqcgffuH5G26ZUI9+d+EHAbU81Xz80bxc1i?=
 =?us-ascii?Q?Ag6CfcwnLJHWE3FjYZc+aJMvyzyPxpRdxjgLdR3TV1XFEoBiFP3Lxmj9URUY?=
 =?us-ascii?Q?Nm9/aCGRyiAJLB44LYPMHTcB09yKZi9OjlHiX0RRKtacGZs/eFg/uz4+N6Rc?=
 =?us-ascii?Q?gDA/Yq0BVaCFdY3yCEczpkB8QWA1F079KG3+DiLXKLTO4QwVUhdAO/Ert7x7?=
 =?us-ascii?Q?LWVsnqonJcSywJvrhuxqYtSbPgYNPItivWB+w4Ft7JIINHRMclrPayyp+/3R?=
 =?us-ascii?Q?y+pc5giFTPZYcp77sXp4BLzyROnLppdwXegX6RbC30IWxO5bAa96va5CosQd?=
 =?us-ascii?Q?Gd9nCq0FsIMHP1eR3xpZA2fkelKChInEB9nHFP8Ma+gh2ECt3m9oU3eVKNv7?=
 =?us-ascii?Q?YZ2aiWejPWLua7zNLT7sVBVJyxl7thTB5M2gMpYXSJ41pzFj9R8HAZ5Nr49k?=
 =?us-ascii?Q?4lSDo/mEklFbGplfZ9YbN0KaK+66rt0T6+e5dAByM2njzw5pd6SEFT/eV3b8?=
 =?us-ascii?Q?TVG7MDXKLD1KjEXmEDmG/H14NpqeoS8Wwp21X1qitJXC3C+WSWfGxczISQb+?=
 =?us-ascii?Q?MOCx2muqTttRSceL8iVW4kbdcOrVJWlh4OXE+DR8tAM2uOY/VrGN5cn4lfV8?=
 =?us-ascii?Q?LqA47JBkHHSgkU3i8uFbHuWyuqyK3gAngza60YjwEB/eTfISwZlZTWaznzCO?=
 =?us-ascii?Q?A4s29guqxMLonB+4tb4Hk5hIVSkLKb0FDSUv6y14n7YiWh1DDZy/rO42Ztui?=
 =?us-ascii?Q?1Py/uh0VnQwHQuf9PIhlfyunkwAFBKbSA9RkjSlLrSouynSTFvKW5ZKSkXU8?=
 =?us-ascii?Q?XRnAA5bxkmj4eLE33ez7waaH0ZWGG9UiqeJGvA0QB2QYRofWxSI08Sc2Kej/?=
 =?us-ascii?Q?GpQtSipkv6ZFfprmvmWfzy+riarmdf6Qb8Pd7vmdmvKWT3Ta+r7miUylNj37?=
 =?us-ascii?Q?WxsZcNKqZgBRcarhY6ckl3m51OwbsKeiGisjJPyRA1Sc91QFbLhBytCoQ2TV?=
 =?us-ascii?Q?pHfGD6Hhy7A7iLc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:45.6634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fc6546-d286-459f-c024-08dd4688f8a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819

Introduce helper set_amd_cppc_para and get_amd_cppc_para to
SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Give the variable des_perf an initializer of 0
- Use the strncmp()s directly in the if()
---
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 115 +++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c            |  20 ++++-
 xen/include/acpi/cpufreq/cpufreq.h   |   5 ++
 3 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 241cce330b..0e43e32979 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -35,6 +35,7 @@
 
 static bool __ro_after_init opt_cpufreq_active;
 static uint8_t __read_mostly epp_init;
+static bool __ro_after_init amd_cppc_in_use;
 
 struct amd_cppc_drv_data
 {
@@ -533,6 +534,114 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
     return amd_cppc_epp_update_limit(policy);
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
+    uint8_t max_perf, min_perf, des_perf = 0;
+    int epp = -1;
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    /* Validate all parameters - Disallow reserved bits. */
+    if ( set_cppc->minimum > 255 || set_cppc->maximum > 255 ||
+         set_cppc->desired > 255 || set_cppc->energy_perf > 255 )
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
+    /* Activity window not supported */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        return -EINVAL;
+
+    /* Return if there is nothing to do. */
+    if ( set_cppc->set_params == 0 )
+        return 0;
+
+    /* Apply presets */
+    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->caps.lowest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
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
+    return amd_cppc_write_request(cpu, min_perf, des_perf, max_perf, epp);
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber amd_cppc_cpufreq_driver =
 {
     .name   = XEN_AMD_CPPC_DRIVER_NAME,
@@ -551,11 +660,17 @@ static const struct cpufreq_driver  __initconst_cf_clobber amd_cppc_epp_driver =
     .exit       = amd_cppc_cpufreq_cpu_exit,
 };
 
+bool amd_cppc_active(void)
+{
+    return amd_cppc_in_use;
+}
+
 int __init amd_cppc_register_driver(void)
 {
     if ( !cpu_has_cppc )
         return -ENODEV;
 
+    amd_cppc_in_use = true;
     if ( !opt_cpufreq_active )
         return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
     else
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index df309e27b4..46899d99d7 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -258,7 +258,16 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
          !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
                   CPUFREQ_NAME_LEN) )
         ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    else if ( !strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_DRIVER_NAME,
+                       CPUFREQ_NAME_LEN) ||
+              !strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME,
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
@@ -414,10 +423,13 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -ENOENT;
 
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
+    if ( hwp_active() )
+        return set_hwp_para(policy, &op->u.set_cppc);
+
+    if ( amd_cppc_active() )
+        return set_amd_cppc_para(policy, &op->u.set_cppc);
 
-    return set_hwp_para(policy, &op->u.set_cppc);
+    return -EOPNOTSUPP;
 }
 
 int do_pm_op(struct xen_sysctl_pm_op *op)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index fb42d61567..cc5a248193 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -292,5 +292,10 @@ int acpi_cpufreq_register(void);
 
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
+bool amd_cppc_active(void);
+int get_amd_cppc_para(unsigned int cpu,
+                      struct xen_cppc_para *cppc_para);
+int set_amd_cppc_para(const struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.34.1


