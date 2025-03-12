Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62BBA5D4FD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909735.1316663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQR-0004TG-Sl; Wed, 12 Mar 2025 04:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909735.1316663; Wed, 12 Mar 2025 04:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQR-0004Qa-Oe; Wed, 12 Mar 2025 04:10:35 +0000
Received: by outflank-mailman (input) for mailman id 909735;
 Wed, 12 Mar 2025 04:10:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNT-0007Fd-JX
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:31 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2413::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8266893c-fef7-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:07:28 +0100 (CET)
Received: from BN9PR03CA0514.namprd03.prod.outlook.com (2603:10b6:408:131::9)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:18 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::fa) by BN9PR03CA0514.outlook.office365.com
 (2603:10b6:408:131::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 04:07:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:17 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:14 -0500
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
X-Inumbo-ID: 8266893c-fef7-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUkY/skRs6AhGNh00ue+kH0S0YIvqFB4j90+SU/hqO18gOjFxXuIiHo0oP5cyLILuJb7A56dekIvNb3dSiHsIwtsSYYLQHGg8gT0BUketZo11ZgQgBoxUs6gfuW8iLUrb7iGpYiDTHAF/Caq1gYQM196GhXfhvKpStxP8234O7dirJZSUok0riAXoqBqchi2TXucHRssTY00ErF+7+z0RAxtyvIILAqytRbfv6bSgM0KGHN6rtWeqa2Zmf+Zxe+gkLNrCzD71waaOk59gWOym8Hw3/zuIEH4uKgjSn8YkrtlYnFrNNSbUCaXDyUnSpBsx0VlYTk8b3+xiqYbr+UdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAni3E/lzkFT7UKJjTjPYxJbfFgXKFTWJ3maGSuPevQ=;
 b=YAuEoKgXf1qsdUOFtwhPS7lWqzBOsvgdfgd4KgF4teVyGMTILDrrl3HeJcMNTNjTAImKukkyhVoDbtR2OOZUAfHYHCMCT7fe3zbUbXO3ttNjhzrrxMv51EkgEuOi+e9pgcjF/0r9D4Nl9wV+CxCPcntMqBQlLLL01A5vigdj00XsNVFH00qgty0fGGQihv38waTntdPjCIrOGkWhz0ERHP/SRSVhqae6lWXbtPVGs5vQJB4drQFbTmnziDinalgKc9FFsoNatWGOshfRZdCMghtBxZUmLKyPzbsG29G30jrhQQO5yckcoEHsc4fciAN4+3V/v+R+rZZ87NfxXdQdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAni3E/lzkFT7UKJjTjPYxJbfFgXKFTWJ3maGSuPevQ=;
 b=QW1ZEqG1PQEHNkoitMyXYoScDDgR9Hszifea8gRhDo+GVK6bcbYuftyTiu2U6dN/AWlpb9qCIvRpwuzJigAVgnBlds0+/CgGrLHMuAZ/3vn40KkPmTG6M+Zbuig0xGToVFWUlxc3JwrCtJILqIu7bW5F8jn3IEyn1Nok7yeP6sY=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 08/19] xen/sysctl: introduce CONFIG_PM_STATISTIC
Date: Wed, 12 Mar 2025 12:06:21 +0800
Message-ID: <20250312040632.2853485-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d27497d-4eed-495c-b16a-08dd611b6146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t2ArOlywby/dwokjwXLLogmSr8kEl+2fh+CvPQSM1ScEpWv/cNjgnQvZMV7f?=
 =?us-ascii?Q?HQmAYjjqB5QqVeNPQGka9rV/XlyVCccBXVWc8oh7BTURJZ+dL3YzKACnT3lE?=
 =?us-ascii?Q?nW8wjzZ94tEv1NBdqABHqw+tc+6RtZn5xmdINBoxGQ/Hl/uN+JPk9Meoq+qM?=
 =?us-ascii?Q?y3ECQxmGhIqeD2HJMHEQlyj+b7lkhN7Wg8gvQjUtf8xHmIQGBguzXT5SwYKu?=
 =?us-ascii?Q?6yNICZoZpxf2rR2fzQXNv0R9hHxBEn5Qt9emgagkVmmsrTbz8pK+j6TjvNs7?=
 =?us-ascii?Q?a1OxkROtpUQXkg9QO8mGKl12+RiPBb+YFWDc1Tq6nRYDM5hD1s/CJw11d6V2?=
 =?us-ascii?Q?ME1tUdrj9WB5LPrpBL8xSzmjhJMu3VgU1F6c7SNwdlzizFDz0TcoTZFWaXWX?=
 =?us-ascii?Q?KuimgWPF2cCsjlj9kNNPXI7y53U1MgIr7PfT3sCnIUN00kcvqu5+cOij/2TZ?=
 =?us-ascii?Q?DcLahpKJz1e0irbjLsMakfNs3VLWnv4dgt1vaJNIKJXpFzcGmVDBMClLK0U2?=
 =?us-ascii?Q?fBKifRkaIQv8t+8XtqiR4VIHX4i4OiTA5FKzFu7glwjQpIoOBspekL02BS6x?=
 =?us-ascii?Q?WNfE1ssizZZXONvfXHBP/8xpv/kf1qYI1N9+rPgg/Dqy4y3kfEPIG1bo/WZg?=
 =?us-ascii?Q?cOVIuMfEhUlJim2AKJQPug8TzqqNDuatom8atZhabl53MeNu6nVefGDrIkNu?=
 =?us-ascii?Q?hwr6Qt3fDx/M765FkATDKTd1w21GOQshVCVXJeE47VJlB1CZ/UcTMF3WIi6M?=
 =?us-ascii?Q?k71tEAMy0sSZNYrOwVze65F1ATPJYs/6ecFcUgJSVklwSsFZuIrF1IVblD5P?=
 =?us-ascii?Q?HIWJ7wCtJ48slypV3NwLJTZ6DTxwMY5ziyvCWToOQ28FVkM7A/xHQfLHEwCU?=
 =?us-ascii?Q?NbA2qijgVKZqMAS8yo/nDaMMgPcozw8oI9VDO9RXhZzRlP/MUibKDW9xydwT?=
 =?us-ascii?Q?oP/sZGVF+YS/qZdnwaWhEhYajOxcwi2PAEXDpXAUemkEN8UZGOJFnT/0Gpep?=
 =?us-ascii?Q?S2H73CMyOC25VNDx1XdFtg8u3Iz5lua+1J8CTXAzHCvKpUv3WB+4SXeZ5I+6?=
 =?us-ascii?Q?itUSUjFFTBIccyZct87mQcGnVQCbl61hkO4wLBMO+iAlFZQOlczBwXiKnUzJ?=
 =?us-ascii?Q?FrKuxzax7twNHEJUNypjzmha5JDViQdS8LLwBCp+Tx6W4bGiptBcRr9PUEMK?=
 =?us-ascii?Q?mqLy++n4iN0LyI54qONfTRJMu0PqMESpW1y6b/M/Sz5w6reoFiKdiwX4N6A5?=
 =?us-ascii?Q?bG0iNtP5UlweFuWJr17Z22nnYUCP4+DXjhH4mieQpsl3gr3jmazZ0el/Zn6q?=
 =?us-ascii?Q?eYpBbQM2i++s/TYhx/wYhhSIEY58ihXKRkmo9nbtHrnrln4ESzvmIAEQJlhW?=
 =?us-ascii?Q?UVIsCa4kiYr/HwmHYEFNBFYks724eCjQkAXWoAVvUDKU+XAdv9uT1LWryZYp?=
 =?us-ascii?Q?NO/QBwGLQqSVH1+0kGnokfb4pUpgoi/+KLOyyjK6F1LlD41xpYNTJ+xy5i+b?=
 =?us-ascii?Q?aPZbJhL8rWKAesw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:17.9887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d27497d-4eed-495c-b16a-08dd611b6146
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100

This commit introduces CONFIG_PM_STATISTIC for wrapping all operations
regarding performance management statistic operations.
The major codes reside in xen/drivers/acpi/pmstat.c, including two main
pm-related sysctl op: do_get_pm_info() and do_pm_op().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/acpi/cpu_idle.c                 |   2 +
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/common/Kconfig                           |   5 +
 xen/common/sysctl.c                          |   4 +-
 xen/drivers/acpi/Makefile                    |   2 +-
 xen/drivers/acpi/pmstat.c                    | 192 ++++++++++++++++---
 xen/drivers/cpufreq/cpufreq.c                |  31 +++
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                | 164 +---------------
 xen/include/acpi/cpufreq/cpufreq.h           |   6 +
 xen/include/acpi/cpufreq/processor_perf.h    |  12 +-
 xen/include/xen/acpi.h                       |   2 +
 xen/include/xen/pmstat.h                     |   2 +
 15 files changed, 238 insertions(+), 198 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 420198406d..9ea52def42 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1487,6 +1487,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
         vendor_override = -1;
 }
 
+#ifdef CONFIG_PM_STATISTIC
 uint32_t pmstat_get_cx_nr(unsigned int cpu)
 {
     return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
@@ -1606,6 +1607,7 @@ int pmstat_reset_cx_stat(unsigned int cpu)
 {
     return 0;
 }
+#endif /* CONFIG_PM_STATISTIC */
 
 void cpuidle_disable_deep_cstate(void)
 {
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index d5fa3d47ca..d1309e3e0a 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -466,6 +466,7 @@ static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
+#ifdef CONFIG_PM_STATISTIC
 /*
  * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
  * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
@@ -508,6 +509,7 @@ static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *
 
     return per_cpu(hwp_drv_data, cpu)->ret;
 }
+#endif /* CONFIG_PM_STATISTIC */
 
 static const struct cpufreq_driver __initconst_cf_clobber
 hwp_cpufreq_driver = {
@@ -516,9 +518,12 @@ hwp_cpufreq_driver = {
     .target = hwp_cpufreq_target,
     .init   = hwp_cpufreq_cpu_init,
     .exit   = hwp_cpufreq_cpu_exit,
+#ifdef CONFIG_PM_STATISTIC
     .update = hwp_cpufreq_update,
+#endif
 };
 
+#ifdef CONFIG_PM_STATISTIC
 int get_hwp_para(unsigned int cpu,
                  struct xen_cppc_para *cppc_para)
 {
@@ -639,6 +644,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
     return hwp_cpufreq_target(policy, 0, 0);
 }
+#endif /* CONFIG_PM_STATISTIC */
 
 int __init hwp_register_driver(void)
 {
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 69364e1855..0cdeeef883 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -49,6 +49,7 @@ static void cf_check transition_pstate(void *pstate)
     wrmsrl(MSR_PSTATE_CTRL, *(unsigned int *)pstate);
 }
 
+#ifdef CONFIG_PM_STATISTIC
 static void cf_check update_cpb(void *data)
 {
     struct cpufreq_policy *policy = data;
@@ -77,6 +78,7 @@ static int cf_check powernow_cpufreq_update(
 
     return 0;
 }
+#endif /* CONFIG_PM_STATISTIC */
 
 static int cf_check powernow_cpufreq_target(
     struct cpufreq_policy *policy,
@@ -324,7 +326,9 @@ powernow_cpufreq_driver = {
     .target = powernow_cpufreq_target,
     .init   = powernow_cpufreq_cpu_init,
     .exit   = powernow_cpufreq_cpu_exit,
+#ifdef CONFIG_PM_STATISTIC
     .update = powernow_cpufreq_update
+#endif
 };
 
 unsigned int __init powernow_register_driver(void)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index c5f4192b60..ffc6b9d4df 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -107,6 +107,11 @@ config NEEDS_LIBELF
 config NUMA
 	bool
 
+config PM_STATISTIC
+        bool "Enable Performance Management Statistic Operations"
+        depends on ACPI && HAS_CPUFREQ
+        default y
+
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on DOM0LESS_BOOT
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index c2d99ae12e..3d605633cc 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -170,7 +170,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         op->u.availheap.avail_bytes <<= PAGE_SHIFT;
         break;
 
-#if defined (CONFIG_ACPI) && defined (CONFIG_HAS_CPUFREQ)
+#ifdef CONFIG_PM_STATISTIC
     case XEN_SYSCTL_get_pmstat:
         ret = do_get_pm_info(&op->u.get_pmstat);
         break;
@@ -180,7 +180,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         if ( ret == -EAGAIN )
             copyback = 1;
         break;
-#endif
+#endif /* CONFIG_PM_STATISTIC */
 
     case XEN_SYSCTL_page_offline_op:
     {
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 2fc5230253..70156ee0a4 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_X86) += apei/
 obj-bin-y += tables.init.o
 obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
-obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
+obj-$(CONFIG_PM_STATISTIC) += pmstat.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index df309e27b4..58cccd589b 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -43,6 +43,167 @@
 
 DEFINE_PER_CPU_READ_MOSTLY(struct pm_px *, cpufreq_statistic_data);
 
+DEFINE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
+
+/*********************************************************************
+ *                    Px STATISTIC INFO                              *
+ *********************************************************************/
+
+static void cpufreq_residency_update(unsigned int cpu, uint8_t state)
+{
+    uint64_t now, total_idle_ns;
+    int64_t delta;
+    struct pm_px *pxpt = per_cpu(cpufreq_statistic_data, cpu);
+
+    total_idle_ns = get_cpu_idle_time(cpu);
+    now = NOW();
+
+    delta = (now - pxpt->prev_state_wall) -
+            (total_idle_ns - pxpt->prev_idle_wall);
+
+    if ( likely(delta >= 0) )
+        pxpt->u.pt[state].residency += delta;
+
+    pxpt->prev_state_wall = now;
+    pxpt->prev_idle_wall = total_idle_ns;
+}
+
+void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
+{
+    struct pm_px *pxpt;
+    struct processor_pminfo *pmpt = processor_pminfo[cpu];
+    spinlock_t *cpufreq_statistic_lock =
+               &per_cpu(cpufreq_statistic_lock, cpu);
+
+    spin_lock(cpufreq_statistic_lock);
+
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
+    if ( !pxpt || !pmpt ) {
+        spin_unlock(cpufreq_statistic_lock);
+        return;
+    }
+
+    pxpt->u.last = from;
+    pxpt->u.cur = to;
+    pxpt->u.pt[to].count++;
+
+    cpufreq_residency_update(cpu, from);
+
+    (*(pxpt->u.trans_pt + from * pmpt->perf.state_count + to))++;
+
+    spin_unlock(cpufreq_statistic_lock);
+}
+
+int cpufreq_statistic_init(unsigned int cpu)
+{
+    uint32_t i, count;
+    struct pm_px *pxpt;
+    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
+
+    spin_lock_init(cpufreq_statistic_lock);
+
+    if ( !pmpt )
+        return -EINVAL;
+
+    spin_lock(cpufreq_statistic_lock);
+
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
+    if ( pxpt ) {
+        spin_unlock(cpufreq_statistic_lock);
+        return 0;
+    }
+
+    count = pmpt->perf.state_count;
+
+    pxpt = xzalloc(struct pm_px);
+    if ( !pxpt ) {
+        spin_unlock(cpufreq_statistic_lock);
+        return -ENOMEM;
+    }
+    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
+
+    pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
+    if (!pxpt->u.trans_pt) {
+        xfree(pxpt);
+        spin_unlock(cpufreq_statistic_lock);
+        return -ENOMEM;
+    }
+
+    pxpt->u.pt = xzalloc_array(struct pm_px_val, count);
+    if (!pxpt->u.pt) {
+        xfree(pxpt->u.trans_pt);
+        xfree(pxpt);
+        spin_unlock(cpufreq_statistic_lock);
+        return -ENOMEM;
+    }
+
+    pxpt->u.total = pmpt->perf.state_count;
+    pxpt->u.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
+
+    for (i=0; i < pmpt->perf.state_count; i++)
+        pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
+
+    pxpt->prev_state_wall = NOW();
+    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
+
+    spin_unlock(cpufreq_statistic_lock);
+
+    return 0;
+}
+
+void cpufreq_statistic_exit(unsigned int cpu)
+{
+    struct pm_px *pxpt;
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
+
+    spin_lock(cpufreq_statistic_lock);
+
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
+    if (!pxpt) {
+        spin_unlock(cpufreq_statistic_lock);
+        return;
+    }
+
+    xfree(pxpt->u.trans_pt);
+    xfree(pxpt->u.pt);
+    xfree(pxpt);
+    per_cpu(cpufreq_statistic_data, cpu) = NULL;
+
+    spin_unlock(cpufreq_statistic_lock);
+}
+
+static void cpufreq_statistic_reset(unsigned int cpu)
+{
+    uint32_t i, j, count;
+    struct pm_px *pxpt;
+    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
+
+    spin_lock(cpufreq_statistic_lock);
+
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
+    if ( !pmpt || !pxpt || !pxpt->u.pt || !pxpt->u.trans_pt ) {
+        spin_unlock(cpufreq_statistic_lock);
+        return;
+    }
+
+    count = pmpt->perf.state_count;
+
+    for (i=0; i < count; i++) {
+        pxpt->u.pt[i].residency = 0;
+        pxpt->u.pt[i].count = 0;
+
+        for (j=0; j < count; j++)
+            *(pxpt->u.trans_pt + i*count + j) = 0;
+    }
+
+    pxpt->prev_state_wall = NOW();
+    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
+
+    spin_unlock(cpufreq_statistic_lock);
+}
+
 /*
  * Get PM statistic info
  */
@@ -522,34 +683,3 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
 
     return ret;
 }
-
-int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
-{
-    u32 bits[3];
-    int ret;
-
-    if ( copy_from_guest(bits, pdc, 2) )
-        ret = -EFAULT;
-    else if ( bits[0] != ACPI_PDC_REVISION_ID || !bits[1] )
-        ret = -EINVAL;
-    else if ( copy_from_guest_offset(bits + 2, pdc, 2, 1) )
-        ret = -EFAULT;
-    else
-    {
-        u32 mask = 0;
-
-        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
-            mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
-        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
-            mask |= ACPI_PDC_P_MASK | ACPI_PDC_SMP_C1PT;
-        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_TX )
-            mask |= ACPI_PDC_T_MASK | ACPI_PDC_SMP_C1PT;
-        bits[2] &= (ACPI_PDC_C_MASK | ACPI_PDC_P_MASK | ACPI_PDC_T_MASK |
-                    ACPI_PDC_SMP_C1PT) & ~mask;
-        ret = arch_acpi_set_pdc_bits(acpi_id, bits, mask);
-    }
-    if ( !ret && __copy_to_guest_offset(pdc, 2, bits + 2, 1) )
-        ret = -EFAULT;
-
-    return ret;
-}
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 4a103c6de9..29fcfbe609 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -582,6 +582,37 @@ out:
     return ret;
 }
 
+int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
+{
+    u32 bits[3];
+    int ret;
+
+    if ( copy_from_guest(bits, pdc, 2) )
+        ret = -EFAULT;
+    else if ( bits[0] != ACPI_PDC_REVISION_ID || !bits[1] )
+        ret = -EINVAL;
+    else if ( copy_from_guest_offset(bits + 2, pdc, 2, 1) )
+        ret = -EFAULT;
+    else
+    {
+        u32 mask = 0;
+
+        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
+            mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
+        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
+            mask |= ACPI_PDC_P_MASK | ACPI_PDC_SMP_C1PT;
+        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_TX )
+            mask |= ACPI_PDC_T_MASK | ACPI_PDC_SMP_C1PT;
+        bits[2] &= (ACPI_PDC_C_MASK | ACPI_PDC_P_MASK | ACPI_PDC_T_MASK |
+                    ACPI_PDC_SMP_C1PT) & ~mask;
+        ret = arch_acpi_set_pdc_bits(acpi_id, bits, mask);
+    }
+    if ( !ret && __copy_to_guest_offset(pdc, 2, bits + 2, 1) )
+        ret = -EFAULT;
+
+    return ret;
+}
+
 static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
 {
     if (usr_max_freq)
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index 0327fad23b..efdc954a4e 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -64,6 +64,7 @@ static int cf_check cpufreq_governor_userspace(
     return ret;
 }
 
+#ifdef CONFIG_PM_STATISTIC
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
 {
     struct cpufreq_policy *policy;
@@ -80,6 +81,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
 
     return __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
 }
+#endif /* CONFIG_PM_STATISTIC */
 
 static bool __init cf_check
 cpufreq_userspace_handle_option(const char *name, const char *val)
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 06cfc88d30..ec1e605a59 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -57,6 +57,7 @@ static struct dbs_tuners {
 
 static DEFINE_PER_CPU(struct timer, dbs_timer);
 
+#ifdef CONFIG_PM_STATISTIC
 int write_ondemand_sampling_rate(unsigned int sampling_rate)
 {
     if ( (sampling_rate > MAX_SAMPLING_RATE / MICROSECS(1)) ||
@@ -93,6 +94,7 @@ int get_cpufreq_ondemand_para(uint32_t *sampling_rate_max,
 
     return 0;
 }
+#endif /* CONFIG_PM_STATISTIC */
 
 static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 {
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index e690a484f1..2eb3314694 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -35,168 +35,6 @@ struct cpufreq_driver __read_mostly cpufreq_driver;
 struct processor_pminfo *__read_mostly processor_pminfo[NR_CPUS];
 DEFINE_PER_CPU_READ_MOSTLY(struct cpufreq_policy *, cpufreq_cpu_policy);
 
-DEFINE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
-
-/*********************************************************************
- *                    Px STATISTIC INFO                              *
- *********************************************************************/
-
-void cpufreq_residency_update(unsigned int cpu, uint8_t state)
-{
-    uint64_t now, total_idle_ns;
-    int64_t delta;
-    struct pm_px *pxpt = per_cpu(cpufreq_statistic_data, cpu);
-
-    total_idle_ns = get_cpu_idle_time(cpu);
-    now = NOW();
-
-    delta = (now - pxpt->prev_state_wall) - 
-            (total_idle_ns - pxpt->prev_idle_wall);
-
-    if ( likely(delta >= 0) )
-        pxpt->u.pt[state].residency += delta;
-
-    pxpt->prev_state_wall = now;
-    pxpt->prev_idle_wall = total_idle_ns;
-}
-
-void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
-{
-    struct pm_px *pxpt;
-    struct processor_pminfo *pmpt = processor_pminfo[cpu];
-    spinlock_t *cpufreq_statistic_lock = 
-               &per_cpu(cpufreq_statistic_lock, cpu);
-
-    spin_lock(cpufreq_statistic_lock);
-
-    pxpt = per_cpu(cpufreq_statistic_data, cpu);
-    if ( !pxpt || !pmpt ) {
-        spin_unlock(cpufreq_statistic_lock);
-        return;
-    }
-
-    pxpt->u.last = from;
-    pxpt->u.cur = to;
-    pxpt->u.pt[to].count++;
-
-    cpufreq_residency_update(cpu, from);
-
-    (*(pxpt->u.trans_pt + from * pmpt->perf.state_count + to))++;
-
-    spin_unlock(cpufreq_statistic_lock);
-}
-
-int cpufreq_statistic_init(unsigned int cpu)
-{
-    uint32_t i, count;
-    struct pm_px *pxpt;
-    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
-    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
-
-    spin_lock_init(cpufreq_statistic_lock);
-
-    if ( !pmpt )
-        return -EINVAL;
-
-    spin_lock(cpufreq_statistic_lock);
-
-    pxpt = per_cpu(cpufreq_statistic_data, cpu);
-    if ( pxpt ) {
-        spin_unlock(cpufreq_statistic_lock);
-        return 0;
-    }
-
-    count = pmpt->perf.state_count;
-
-    pxpt = xzalloc(struct pm_px);
-    if ( !pxpt ) {
-        spin_unlock(cpufreq_statistic_lock);
-        return -ENOMEM;
-    }
-    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
-
-    pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
-    if (!pxpt->u.trans_pt) {
-        xfree(pxpt);
-        spin_unlock(cpufreq_statistic_lock);
-        return -ENOMEM;
-    }
-
-    pxpt->u.pt = xzalloc_array(struct pm_px_val, count);
-    if (!pxpt->u.pt) {
-        xfree(pxpt->u.trans_pt);
-        xfree(pxpt);
-        spin_unlock(cpufreq_statistic_lock);
-        return -ENOMEM;
-    }
-
-    pxpt->u.total = pmpt->perf.state_count;
-    pxpt->u.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
-
-    for (i=0; i < pmpt->perf.state_count; i++)
-        pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
-
-    pxpt->prev_state_wall = NOW();
-    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
-
-    spin_unlock(cpufreq_statistic_lock);
-
-    return 0;
-}
-
-void cpufreq_statistic_exit(unsigned int cpu)
-{
-    struct pm_px *pxpt;
-    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
-
-    spin_lock(cpufreq_statistic_lock);
-
-    pxpt = per_cpu(cpufreq_statistic_data, cpu);
-    if (!pxpt) {
-        spin_unlock(cpufreq_statistic_lock);
-        return;
-    }
-
-    xfree(pxpt->u.trans_pt);
-    xfree(pxpt->u.pt);
-    xfree(pxpt);
-    per_cpu(cpufreq_statistic_data, cpu) = NULL;
-
-    spin_unlock(cpufreq_statistic_lock);
-}
-
-void cpufreq_statistic_reset(unsigned int cpu)
-{
-    uint32_t i, j, count;
-    struct pm_px *pxpt;
-    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
-    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
-
-    spin_lock(cpufreq_statistic_lock);
-
-    pxpt = per_cpu(cpufreq_statistic_data, cpu);
-    if ( !pmpt || !pxpt || !pxpt->u.pt || !pxpt->u.trans_pt ) {
-        spin_unlock(cpufreq_statistic_lock);
-        return;
-    }
-
-    count = pmpt->perf.state_count;
-
-    for (i=0; i < count; i++) {
-        pxpt->u.pt[i].residency = 0;
-        pxpt->u.pt[i].count = 0;
-
-        for (j=0; j < count; j++)
-            *(pxpt->u.trans_pt + i*count + j) = 0;
-    }
-
-    pxpt->prev_state_wall = NOW();
-    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
-
-    spin_unlock(cpufreq_statistic_lock);
-}
-
-
 /*********************************************************************
  *                   FREQUENCY TABLE HELPERS                         *
  *********************************************************************/
@@ -386,6 +224,7 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag)
     return policy->cur;
 }
 
+#ifdef CONFIG_PM_STATISTIC
 int cpufreq_update_turbo(unsigned int cpu, int new_state)
 {
     struct cpufreq_policy *policy;
@@ -417,6 +256,7 @@ int cpufreq_update_turbo(unsigned int cpu, int new_state)
 
     return ret;
 }
+#endif /* CONFIG_PM_STATISTIC */
 
 
 int cpufreq_get_turbo_status(unsigned int cpu)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index a3c84143af..bfef9bb523 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -167,7 +167,9 @@ struct cpufreq_driver {
     int    (*init)(struct cpufreq_policy *policy);
     int    (*verify)(struct cpufreq_policy *policy);
     int    (*setpolicy)(struct cpufreq_policy *policy);
+#ifdef CONFIG_PM_STATISTIC
     int    (*update)(unsigned int cpu, struct cpufreq_policy *policy);
+#endif
     int    (*target)(struct cpufreq_policy *policy,
                      unsigned int target_freq,
                      unsigned int relation);
@@ -238,6 +240,7 @@ struct cpu_dbs_info_s {
     int8_t stoppable;
 };
 
+#ifdef CONFIG_PM_STATISTIC
 int get_cpufreq_ondemand_para(uint32_t *sampling_rate_max,
                               uint32_t *sampling_rate_min,
                               uint32_t *sampling_rate,
@@ -246,6 +249,7 @@ int write_ondemand_sampling_rate(unsigned int sampling_rate);
 int write_ondemand_up_threshold(unsigned int up_threshold);
 
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
+#endif /* CONFIG_PM_STATISTIC */
 
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
@@ -270,10 +274,12 @@ bool hwp_active(void);
 static inline bool hwp_active(void) { return false; }
 #endif
 
+#ifdef CONFIG_PM_STATISTIC
 int get_hwp_para(unsigned int cpu,
                  struct xen_cppc_para *cppc_para);
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc);
+#endif /* CONFIG_PM_STATISTIC */
 
 int acpi_cpufreq_register(void);
 
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 301104e16f..2f5a4d2b7b 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -9,11 +9,19 @@
 
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
-void cpufreq_residency_update(unsigned int cpu, uint8_t state);
+#ifdef CONFIG_PM_STATISTIC
 void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
 int  cpufreq_statistic_init(unsigned int cpu);
 void cpufreq_statistic_exit(unsigned int cpu);
-void cpufreq_statistic_reset(unsigned int cpu);
+#else
+static inline  void cpufreq_statistic_update(unsigned int cpu, uint8_t from,
+                                             uint8_t to) {};
+static inline int cpufreq_statistic_init(unsigned int cpu)
+{
+    return 0;
+}
+static inline void cpufreq_statistic_exit(unsigned int cpu) {};
+#endif /* CONFIG_PM_STATISTIC */
 
 int  cpufreq_limit_change(unsigned int cpu);
 
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index bc4818c943..0bbbc3c15d 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -158,6 +158,7 @@ int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
 extern unsigned int max_cstate;
 extern unsigned int max_csubstate;
 
+#ifdef CONFIG_PM_STATISTIC
 static inline unsigned int acpi_get_cstate_limit(void)
 {
 	return max_cstate;
@@ -177,6 +178,7 @@ static inline void acpi_set_csubstate_limit(unsigned int new_limit)
 {
 	max_csubstate = new_limit;
 }
+#endif /* CONFIG_PM_STATISTIC */
 
 #else
 static inline unsigned int acpi_get_cstate_limit(void) { return 0; }
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 8350403e95..ad72665025 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -15,11 +15,13 @@ struct compat_processor_power;
 long compat_set_cx_pminfo(uint32_t acpi_id, struct compat_processor_power *power);
 #endif
 
+#ifdef CONFIG_PM_STATISTIC
 uint32_t pmstat_get_cx_nr(unsigned int cpu);
 int pmstat_get_cx_stat(unsigned int cpu, struct pm_cx_stat *stat);
 int pmstat_reset_cx_stat(unsigned int cpu);
 
 int do_get_pm_info(struct xen_sysctl_get_pmstat *op);
 int do_pm_op(struct xen_sysctl_pm_op *op);
+#endif /* CONFIG_PM_STATISTIC */
 
 #endif /* __XEN_PMSTAT_H_ */
-- 
2.34.1


