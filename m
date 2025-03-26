Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC6A71048
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927065.1329900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJov-000612-U7; Wed, 26 Mar 2025 06:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927065.1329900; Wed, 26 Mar 2025 06:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJov-000604-Mt; Wed, 26 Mar 2025 06:00:57 +0000
Received: by outflank-mailman (input) for mailman id 927065;
 Wed, 26 Mar 2025 06:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJi7-00083W-5n
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:2418::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b299e4d8-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:53:53 +0100 (CET)
Received: from MW4PR02CA0008.namprd02.prod.outlook.com (2603:10b6:303:16d::27)
 by DS5PPF4A654669B.namprd12.prod.outlook.com (2603:10b6:f:fc00::64b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:53:48 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::18) by MW4PR02CA0008.outlook.office365.com
 (2603:10b6:303:16d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:44 -0500
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
X-Inumbo-ID: b299e4d8-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qw/2TDlIAmX8vAjNkEUJJg3+l7NxXMbZRppyZngjfQmsmpyr86RTEN1l1/u/2ql3BWvy6LBUJjuAeEspS51Ahi0s11ej+O8mGs7IeMIUHHCAQqPTCvw6q7fJg26tyLG54K4wIyI+xqqjsuZiGjUlLVPqm5JdOH70nY1sy7/31YhcgtRzJA+EaaFFfb8KputwYBuX7iR3NiNv0UDkz6aTg1AphUR34gSN7kwcclf9fiYqcTXZPajgnVbsmbT6qwz+EIsNDGGJEsD3Ih2Othv6e8GSbN41lA7LGSmMVIGOBi8X9yV8P06VNQd/Q2x11GO0brTdoeVX0hTsBGelmCndNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ls8xh2qqh/fyLlnJCiGMP2CfPjJruCFbtQS8G3Ssl28=;
 b=ag5OPIHW3lEjYhubpD0eI5pjgCNTj75D+8BoAU2ttKh6qJ5aVHGIc6Uu6fHNlFCmohuhm4nds+wzJW4XUx1siLQuNOlWBfbjwX8hA8Z3mX1zzAanAWvwwCTj/YgZLzbSQNAqOZvnqSnJz0VypY+OmGLmXK6uscsslofQ1odvm/OA8kNKy+SUQ0ECeEHtBS4rRl5PRzrtu8YLXNGD4ETKBQrl7uxvze4EzJy0NGEyaqzmsAkbEZ3C6uT5TKUowJL2PHn9Hdd3tGCVx6QoH0PuJc6CqK8MmexdOSs5IlTo/a5JP7b2+TJAuX63yLlPboQW5GmutBZTa4WxYLPGYfnqrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ls8xh2qqh/fyLlnJCiGMP2CfPjJruCFbtQS8G3Ssl28=;
 b=Wj4izfFkHdp5pGv9OmBcJMXqINU027xE8Z1Dsq0ygK1KiS6kZMiwBH9BOyDyZ1tC98awh3efux6gO2SwLNzqQmkGd5VyS5R94lVfxexvYK+ZaVf+GQ2scJvYN7Djp7H37U3T5VCRi9NOqMgG6UTA2vlJrZ1+m8I4w6tgC5o3Zqo=
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
Subject: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
Date: Wed, 26 Mar 2025 13:50:44 +0800
Message-ID: <20250326055053.3313146-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DS5PPF4A654669B:EE_
X-MS-Office365-Filtering-Correlation-Id: ea751f2c-8eb1-4e53-4a1c-08dd6c2a93af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kuuBpY8PvlYfsHPP+aSZNzwwKb4oYVGig87GP+yR8wi12WURWs90AbNPYYti?=
 =?us-ascii?Q?Tcw/IesKv3K96tc05ewFIyHPD9XjdqjfMI58poA90CO8y+MylVxu1y6GVZlo?=
 =?us-ascii?Q?JQ2X/LUGsHu0qJuyKD4p4OXUT75+UadAd0MumtLNpui0oD3J9vWtT4junQ+n?=
 =?us-ascii?Q?tz/b6KNSvcIXE+l9sU96FtCZYQfSmYYQQvBz0U5/Bs2pMwB1ZQ94cbdN6eV8?=
 =?us-ascii?Q?t7YGU5DB2lbCctbodjemLQxYjbdnV+ljW3xJuG2QfWMryvvUizxH2aqzKZ9f?=
 =?us-ascii?Q?MHUlBNBYgWphAyFg6gHsshM8bZrxYj8v/Vrj5wUJa7oTY6UwCCjsiRsErBzQ?=
 =?us-ascii?Q?O6AlyQH7EeD9JZ7L4K3FM6KLdTBu18XtmWf1UnOaH0Vxh3t1pQBjNbL3OM+o?=
 =?us-ascii?Q?HctdgpVF4WdWFiW0BreAPssdjxKthWAFLiw+PpS0laIkbJ8/hYURwt6BErmv?=
 =?us-ascii?Q?M6ThYi5Ri5n8I7YSTNI8v2oP/e4VVBoPNKJDaFyfNJuuv42ELamzPjJRo8c4?=
 =?us-ascii?Q?Mgj2yPOaE4bYWmkF5Y0j2AGzWit/Mv+myFFv73b6dbWzvxJMTnhRa4N06Cme?=
 =?us-ascii?Q?eg1/RkqyxXR4lQjxHmJkmjq8K5A4vddmbLXOXaRWJmNOWhofIQZ1dDrmRTuh?=
 =?us-ascii?Q?Q2zFlzsvR1AvX9iWsRt3K9mPeHMXEmWEkgkyPbwJvve+T6+Fqn27u22l4DAL?=
 =?us-ascii?Q?O4HWlsNy6Juf+4ICX2qQG4BDkY5N89NVmWb5nWSDEvA+Q9ZZHX9LsJ/nfnDL?=
 =?us-ascii?Q?iKNYbTJRheDCPuWR+oVSYxPn1AAdF1dRHtM0ROTW9s4KFzbQ4uoahblZmz4E?=
 =?us-ascii?Q?Pq3OSuamx649EW2zaerv6DXOb761tNU/HJ53r0/Nc41uTO6JYwwIXePDvGtu?=
 =?us-ascii?Q?BCdi4iMTUQ78ZmPJ/4ye1AnYyXo0X3c4WIj9fHegpjuZTPr6NfJxzLydPdkK?=
 =?us-ascii?Q?gZhv+gsvcIvBCU+5IU9Ve9VGPcp8Nht8UoS480qy8IXHPGjXy74qOjAduERm?=
 =?us-ascii?Q?JgqE2r8jgSdmv3MnqydW2lmc57ukWwwRM8uRtxnceneIm7PTFm3Jfq+ON+yT?=
 =?us-ascii?Q?hQFsVyluOmL6U6D0YqTXhOlxY6v4xI5Y9ntFjwTByYlwgjOKcaTmtwrVBPLH?=
 =?us-ascii?Q?EQ1FxpsIT8xb3zBHCr6geNxPeIo1lMfIWapu2TRXdqBeooqtZLVrtNK8Xfo/?=
 =?us-ascii?Q?TfVpjhYJTEsrF4X3ZUwk2hDGTAGwcncXe91exfwTcZLvNP9Uofs/DC2/Unp8?=
 =?us-ascii?Q?BehCq4VELDMAv4fFzChlEUgKGbkHR6UsSjnkEi4R3B6bk+XzRtDlIgfF07vy?=
 =?us-ascii?Q?Z4MSoXIA/7xfbXk2olJg85KeAZLsq+LGFrpZWfN5sXRCX/8dNFT0rU51vNWA?=
 =?us-ascii?Q?/PumQhQZTGxZkLTn/i8lAlTv4CDWDuAIw/7iYpbIUUWBSqrtTs3WPwfRn7On?=
 =?us-ascii?Q?9UnBiWpO+2Cl0KguoVGNe1bdTe4wwVtefUcogBZsBXrMKGGycRjOnhVwQgml?=
 =?us-ascii?Q?DDZq6W+YNpSljS0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:47.7080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea751f2c-8eb1-4e53-4a1c-08dd6c2a93af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF4A654669B

We intend to introduce CONFIG_PM_STATS for wrapping all operations
regarding performance management statistics.
The major codes reside in xen/drivers/acpi/pmstat.c, including two main
pm-related sysctl op: do_get_pm_info() and do_pm_op().
So This commit also makes CONFIG_PM_STATS depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- rename to CONFIG_PM_STATS
- fix indention and stray semicolon
- make code movements into a new commit
- No need to wrap inline functions and declarations
---
 xen/arch/x86/acpi/cpu_idle.c                 |  2 ++
 xen/arch/x86/acpi/cpufreq/hwp.c              |  6 ++++++
 xen/arch/x86/acpi/cpufreq/powernow.c         |  4 ++++
 xen/common/Kconfig                           |  5 +++++
 xen/common/sysctl.c                          |  4 ++--
 xen/drivers/acpi/Makefile                    |  2 +-
 xen/drivers/cpufreq/cpufreq_misc_governors.c |  2 ++
 xen/drivers/cpufreq/cpufreq_ondemand.c       |  2 ++
 xen/include/acpi/cpufreq/processor_perf.h    | 14 ++++++++++++++
 9 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 420198406d..b537ac4cd6 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1487,6 +1487,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
         vendor_override = -1;
 }
 
+#ifdef CONFIG_PM_STATS
 uint32_t pmstat_get_cx_nr(unsigned int cpu)
 {
     return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
@@ -1606,6 +1607,7 @@ int pmstat_reset_cx_stat(unsigned int cpu)
 {
     return 0;
 }
+#endif /* CONFIG_PM_STATS */
 
 void cpuidle_disable_deep_cstate(void)
 {
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index d5fa3d47ca..98e9d46890 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -466,6 +466,7 @@ static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
+#ifdef CONFIG_PM_STATS
 /*
  * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
  * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
@@ -508,6 +509,7 @@ static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *
 
     return per_cpu(hwp_drv_data, cpu)->ret;
 }
+#endif /* CONFIG_PM_STATS */
 
 static const struct cpufreq_driver __initconst_cf_clobber
 hwp_cpufreq_driver = {
@@ -516,9 +518,12 @@ hwp_cpufreq_driver = {
     .target = hwp_cpufreq_target,
     .init   = hwp_cpufreq_cpu_init,
     .exit   = hwp_cpufreq_cpu_exit,
+#ifdef CONFIG_PM_STATS
     .update = hwp_cpufreq_update,
+#endif
 };
 
+#ifdef CONFIG_PM_STATS
 int get_hwp_para(unsigned int cpu,
                  struct xen_cppc_para *cppc_para)
 {
@@ -639,6 +644,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
     return hwp_cpufreq_target(policy, 0, 0);
 }
+#endif /* CONFIG_PM_STATS */
 
 int __init hwp_register_driver(void)
 {
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 69364e1855..08494d0902 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -49,6 +49,7 @@ static void cf_check transition_pstate(void *pstate)
     wrmsrl(MSR_PSTATE_CTRL, *(unsigned int *)pstate);
 }
 
+#ifdef CONFIG_PM_STATS
 static void cf_check update_cpb(void *data)
 {
     struct cpufreq_policy *policy = data;
@@ -77,6 +78,7 @@ static int cf_check powernow_cpufreq_update(
 
     return 0;
 }
+#endif /* CONFIG_PM_STATS */
 
 static int cf_check powernow_cpufreq_target(
     struct cpufreq_policy *policy,
@@ -324,7 +326,9 @@ powernow_cpufreq_driver = {
     .target = powernow_cpufreq_target,
     .init   = powernow_cpufreq_cpu_init,
     .exit   = powernow_cpufreq_cpu_exit,
+#ifdef CONFIG_PM_STATS
     .update = powernow_cpufreq_update
+#endif
 };
 
 unsigned int __init powernow_register_driver(void)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b55ca6eaa..426fa8fcc2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -557,4 +557,9 @@ config SYSCTL
 	  to reduce Xen footprint.
 endmenu
 
+config PM_STATS
+	bool "Enable Performance Management Statistics"
+	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	default y
+
 endmenu
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 4602d84203..c17f1b3dec 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -176,7 +176,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         op->u.availheap.avail_bytes <<= PAGE_SHIFT;
         break;
 
-#if defined (CONFIG_ACPI) && defined (CONFIG_HAS_CPUFREQ)
+#ifdef CONFIG_PM_STATS
     case XEN_SYSCTL_get_pmstat:
         ret = do_get_pm_info(&op->u.get_pmstat);
         break;
@@ -186,7 +186,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         if ( ret == -EAGAIN )
             copyback = 1;
         break;
-#endif
+#endif /* CONFIG_PM_STATS */
 
     case XEN_SYSCTL_page_offline_op:
     {
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 2fc5230253..a32a505e30 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_X86) += apei/
 obj-bin-y += tables.init.o
 obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
-obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
+obj-$(CONFIG_PM_STATS) += pmstat.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index 0327fad23b..c3877e9f0a 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -64,6 +64,7 @@ static int cf_check cpufreq_governor_userspace(
     return ret;
 }
 
+#ifdef CONFIG_PM_STATS
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
 {
     struct cpufreq_policy *policy;
@@ -80,6 +81,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
 
     return __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
 }
+#endif /* CONFIG_PM_STATS */
 
 static bool __init cf_check
 cpufreq_userspace_handle_option(const char *name, const char *val)
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 06cfc88d30..de10e03ca4 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -57,6 +57,7 @@ static struct dbs_tuners {
 
 static DEFINE_PER_CPU(struct timer, dbs_timer);
 
+#ifdef CONFIG_PM_STATS
 int write_ondemand_sampling_rate(unsigned int sampling_rate)
 {
     if ( (sampling_rate > MAX_SAMPLING_RATE / MICROSECS(1)) ||
@@ -93,6 +94,7 @@ int get_cpufreq_ondemand_para(uint32_t *sampling_rate_max,
 
     return 0;
 }
+#endif /* CONFIG_PM_STATS */
 
 static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 {
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 941e177b6d..b4b3ed7964 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -9,9 +9,23 @@
 
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
+#ifdef CONFIG_PM_STATS
 void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
 int  cpufreq_statistic_init(unsigned int cpu);
 void cpufreq_statistic_exit(unsigned int cpu);
+#else
+static inline void cpufreq_statistic_update(unsigned int cpu, uint8_t from,
+                                            uint8_t to)
+{
+}
+static inline int cpufreq_statistic_init(unsigned int cpu)
+{
+    return 0;
+}
+static inline void cpufreq_statistic_exit(unsigned int cpu)
+{
+}
+#endif /* CONFIG_PM_STATS */
 
 int  cpufreq_limit_change(unsigned int cpu);
 
-- 
2.34.1


