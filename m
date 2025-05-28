Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286E9AC65A0
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999150.1379895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyF-0000Yx-3w; Wed, 28 May 2025 09:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999150.1379895; Wed, 28 May 2025 09:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyE-0000W4-Tq; Wed, 28 May 2025 09:21:10 +0000
Received: by outflank-mailman (input) for mailman id 999150;
 Wed, 28 May 2025 09:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvZ-0000yL-BG
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2415::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0de1479-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:18:18 +0200 (CEST)
Received: from SN7PR18CA0009.namprd18.prod.outlook.com (2603:10b6:806:f3::17)
 by PH0PR12MB8049.namprd12.prod.outlook.com (2603:10b6:510:28f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 09:18:13 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::69) by SN7PR18CA0009.outlook.office365.com
 (2603:10b6:806:f3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 28 May 2025 09:18:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:12 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:09 -0500
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
X-Inumbo-ID: b0de1479-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQeVAEFQBwvVZKSbcqoFemztvRmo1skfN60fKd6jLfrDpJehsQm3cWlNI2KTuetNJD5UpnhBayqLOGpR+DblkoEwm4RWRqa+5doYY6XtLd9Y422t/L/jOTFeax4VawBl2B+7Y1SPkKtQ6ZjMbgkpz4avN/DB5k2zLRmxBeJvXzBWq6LalRtmGxGttvKtJycKO1K8DSM+uDNZYELe0hIptFtVcZR7+ORSa3U+3T1pZx5sravwj3QOepltyNQIjI3QBphma/toGcRkjcak7YjaNixLUNShDwMHSyh4jQqSroqJVVDiElhbxYjsKmHFCPQMyNVZtrkdgtLimuhPakE8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIqBzSuJ/XN3+20akguQcfadUFZOlGGGnySlPyMwy4g=;
 b=QkBky4/Mx+cpF0jeWUP1FK+O8uBseKg4dYj2CLYCaszOiynxD8Kt8CeOwIIL22pKRQkaerv22ULSewz9FxOZon8jMc/8cAP1PlR4EuzbYgFERFjJEp7zvNXVw6V2oftULv4gbOe5OOmbALwPI3kcWRZoMDl9N3eiPCgO79n1XOAhPhrC2lBXofseV0RVPfJKg/EiV43qIgBvaS6Gh75aobmgEKxqCyt+kOtWM2k4kT7gMuf/goSbaMMJkN+M9MkKYmDAyP5Nsk8ViOOfrcFhh3DFnpNExp5hc97odStXFA5ARlCS/krlvs0PZb/opyaVzLk3qm0mruMNQqS8De9ebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIqBzSuJ/XN3+20akguQcfadUFZOlGGGnySlPyMwy4g=;
 b=ypad468D1fBrDtuea59G688umcvfh8R5eBGu96zDnWPzSB2HtSbBFg18wniKr5dmFjBEcxkX1S+sHuIbPvKdqvk5CvSR6RnT7e+Dg1QwGGsmMVR7LG2OXKtyAA7V5XzXawZQ+DJYUarhqOnwgcQZZExtbC45iZkts/BSv+NDUdw=
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
Subject: [PATCH v4 12/20] xen/sysctl: introduce CONFIG_PM_STATS
Date: Wed, 28 May 2025 17:17:00 +0800
Message-ID: <20250528091708.390767-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|PH0PR12MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 45cf8487-88cb-4750-064e-08dd9dc8924e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lr1nGnRiOflKVtTZ+kiT7WNfvWqcNnrUHsYYZxPWIFZ+kJydpT7gEsH+xhls?=
 =?us-ascii?Q?4yP8Beq8O+COtHsMw1OhtgFO7FztxZe6/QAIPfyPAkOnB8vidOX17+sPZXd/?=
 =?us-ascii?Q?8lh3h3m5QGoQXp+77zD3RvtXYj0mPUJEXh6OuIUMbGSohm7+xSNTLtveCGsU?=
 =?us-ascii?Q?1vtouPAp3XQxbvYxy7UmoA4Rns3UOwgN+vLoG11VA2S++MQeqoIF98N3MlkU?=
 =?us-ascii?Q?MZV8Okiz/iEXQhwxN9/Fg35zLr6hYKnddyghwUqi8WuvKUYz4EuTkkyfO/vU?=
 =?us-ascii?Q?TnydtY7j+p+b3w7XnPfKBPMs/OWdVCei99Ud56H9j1+wWDnq6+b6chbv9Tsi?=
 =?us-ascii?Q?FV5OxmSGoOuPdY587fXksLGWp/EzHAIGsefAN/ShVuCkf/jGo5ag7x9dhj9X?=
 =?us-ascii?Q?LVPPaDf/9CIJE1SvIBMNC3S6iEXPihIk5DWadgMM1yvbkCkvxDNsULkivYK0?=
 =?us-ascii?Q?WAZ/J4nvW+kXTGHYiXWhtxmYgxR++jBu9eSwKEFL+TahG3w2GmwHsc6/seH5?=
 =?us-ascii?Q?Kf9dfcM4buYZpv6iR8chwcbLpjFy3M4dwFd4m1okLXjc52ReJxHJFFY1K4Uv?=
 =?us-ascii?Q?fzux36tu1vAMxZVEcb/6Krq2xyaT5Pwzznjr2XOaef/Rc3S3ee+9YsPPnJqn?=
 =?us-ascii?Q?UW7ph+MmSLGIaJgIbTj/b5kAk4P2hrm+L9kumwI+Nc8QDZtKO+NvntLhvR1V?=
 =?us-ascii?Q?qI5gx/akn4xB5Cq/87gquN2Pk+Ot02tnixBzfpoDARGDrO8L/wLKb/98b9s7?=
 =?us-ascii?Q?mKd+94oPHAz0IraM7vXZZR9cGkCZJlmmmmLLOOZCFk7CUwuZgVca+mSshmF3?=
 =?us-ascii?Q?2z+R2Ud3YTJ8Jd4u9vDWAi9+RW1gXl7XZWpfQxxdamnF8Fr24NHcEk+xq9Qt?=
 =?us-ascii?Q?dJzyo3Zw1FAcLiqoTKUNMhaMvgVBHV+s6HitViSccJpWBeO37BK2K1p7kTNB?=
 =?us-ascii?Q?BSbXytbgaP+Z/qLHRRWuJfdBh/Mq5Pw4M5yZeZcfnypuDL2uikxckdTBK1ej?=
 =?us-ascii?Q?GfiBJasOzBTJ2/LDV5ix9kWT0GaNzvTeCXpr5CJ2t0usdSeYITxGRYgwOB5U?=
 =?us-ascii?Q?i+l+rYXGgpVYUpsp3W+CpbprXivmrMbaYIDbEKNFtvSBegswbb5JvEHtncX3?=
 =?us-ascii?Q?5nY/b7wmi/+FFgEk+ZMjK2xq0uH2HWq1fC1KeBmFCDteEqd9f8JYRjiGkfjj?=
 =?us-ascii?Q?aMt9ofjfRCmcxD39eLRRq1lZ8yJpr76Qm2KI9ct7ytY0mqu8NqZ1y1GyHPSZ?=
 =?us-ascii?Q?eBrVR0Ro488lfYq3PR6DIO9HNLQDXxQm1En8NGVW9WhHoPLiSCfUCZiFKfDb?=
 =?us-ascii?Q?fjbKiV4Sg1o/nKrJ/xOI+ci+APUOXklP1kE0K4TRWsa1eyEvbmul3Ri4DFag?=
 =?us-ascii?Q?tF0641vYdG/euZ6no2MU3gD6ceN/Ar1jYf3sWPscTH3sNcKrNLNPHLTCwrT6?=
 =?us-ascii?Q?gou2dpTg01x7bQ8+vdIbcsk1DvhE2d8IYiJ/0m0qdHn49bxrvCmyF3PjfH50?=
 =?us-ascii?Q?vsmLtDBHthKBIePpl9hLQrpiYi+om0GJWxoF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:12.9439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cf8487-88cb-4750-064e-08dd9dc8924e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8049

We introduce a new Kconfig CONFIG_PM_STATS for wrapping all operations
regarding performance management statistics.
The major codes reside in xen/drivers/acpi/pmstat.c, including the
pm-statistic-related sysctl op: do_get_pm_info().
CONFIG_PM_STATS also shall depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- rename to CONFIG_PM_STATS
- fix indention and stray semicolon
- make code movements into a new commit
- No need to wrap inline functions and declarations
---
v2 -> v3:
- sepearte functions related to do_pm_op() into a new commit
- both braces shall be moved to the line with the closing parenthesis
---
v3 -> v4:
- be consistent with the comment on the #endif
---
 xen/arch/x86/acpi/cpu_idle.c              |  2 ++
 xen/common/Kconfig                        |  8 ++++++++
 xen/common/sysctl.c                       |  2 +-
 xen/drivers/acpi/Makefile                 |  2 +-
 xen/include/acpi/cpufreq/processor_perf.h | 10 ++++++++++
 5 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 1dbf15b01e..974d81b4d6 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1493,6 +1493,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
         vendor_override = -1;
 }
 
+#ifdef CONFIG_PM_STATS
 uint32_t pmstat_get_cx_nr(unsigned int cpu)
 {
     return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
@@ -1612,6 +1613,7 @@ int pmstat_reset_cx_stat(unsigned int cpu)
 {
     return 0;
 }
+#endif /* CONFIG_PM_STATS */
 
 void cpuidle_disable_deep_cstate(void)
 {
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 712c29b1a0..9bf632973e 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -598,4 +598,12 @@ config PM_OP
 	help
 	  This option shall enable userspace performance management control
 	  to do power/performance analyzing and tuning.
+
+config PM_STATS
+	bool "Enable Performance Management Statistics"
+	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	default y
+	help
+	  Enable collection of performance management statistics to aid in
+	  analyzing and tuning power/performance characteristics of the system
 endmenu
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index daf57fbe56..5207664252 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -170,7 +170,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         op->u.availheap.avail_bytes <<= PAGE_SHIFT;
         break;
 
-#if defined (CONFIG_ACPI) && defined (CONFIG_HAS_CPUFREQ)
+#ifdef CONFIG_PM_STATS
     case XEN_SYSCTL_get_pmstat:
         ret = do_get_pm_info(&op->u.get_pmstat);
         break;
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 1d811a51a7..477408afbe 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_X86) += apei/
 obj-bin-y += tables.init.o
 obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
-obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
+obj-$(CONFIG_PM_STATS) += pmstat.o
 obj-$(CONFIG_PM_OP) += pm-op.o
 
 obj-$(CONFIG_X86) += hwregs.o
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 6de43f8602..a9a3b7a372 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -9,9 +9,19 @@
 
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
+#ifdef CONFIG_PM_STATS
 void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
 int  cpufreq_statistic_init(unsigned int cpu);
 void cpufreq_statistic_exit(unsigned int cpu);
+#else
+static inline void cpufreq_statistic_update(unsigned int cpu, uint8_t from,
+                                            uint8_t to) {}
+static inline int cpufreq_statistic_init(unsigned int cpu)
+{
+    return 0;
+}
+static inline void cpufreq_statistic_exit(unsigned int cpu) {}
+#endif /* CONFIG_PM_STATS */
 
 int  cpufreq_limit_change(unsigned int cpu);
 
-- 
2.34.1


