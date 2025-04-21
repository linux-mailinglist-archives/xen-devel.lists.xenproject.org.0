Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D405A94D63
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961085.1352737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lm4-0007vJ-Ah; Mon, 21 Apr 2025 07:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961085.1352737; Mon, 21 Apr 2025 07:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lm4-0007nC-5C; Mon, 21 Apr 2025 07:41:04 +0000
Received: by outflank-mailman (input) for mailman id 961085;
 Mon, 21 Apr 2025 07:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljS-0007m8-6D
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2415::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98238977-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:20 +0200 (CEST)
Received: from BL1P221CA0035.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::8)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 07:38:15 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::de) by BL1P221CA0035.outlook.office365.com
 (2603:10b6:208:5b5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 21 Apr 2025 07:38:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 07:38:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:12 -0500
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
X-Inumbo-ID: 98238977-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7w8BOmdA5Tx9FmmZVUXq4pC2LEaszAz3dAlIcKIa6JyTKe3FYfIolOI/9wyp3piSklmWUkHbGr1UfpQC5zarsyGrIzjF05ASp1z8I/155pgw153Sl/UddSqeWiz3WN0jqesFHJXiGg5Dc+WQEGf2AvzNdRYBGh+BDof2ZguOXI+LkLOygGdQbI5p9nbewm6pfXYkYh2Ky4QGqWoxGiMw4Z+KijW3FrWMEWaXPfHJA7G/26QRe5fa+van/FRbXiZV2qpnIudNWwc3saclS/quHQvOrXK27FIntqt6OuNtqqKdMcBoC2SZI8/m1kVYGZO4qef5MnGcm4oO5xLgnoYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN9U3VJ1DRj2PzopzTPyYNfYmf1OOTSE0ItrPloBlsE=;
 b=yhHk9sRB9oeuibabh9loeHrRNkAsmmWijDbCesvh4JhXtP7tBUMT74c7TjHHdAzsaAmFTKNfPUJ18PvniBaofxX/lvTVAfMDY3gXCv5CKmZhE3oy10PiHWPdB4UhqaRKYdhdNcwIjfPVax2qDkFTEkoLbP25V5V478Vlq6whe/SDg0KLcYFl2hJTwp5I41fVvvYUkB1TJsr9KCXASOVAJ8SofkteCn9J/CtNNy1rNUUUw3/w0yC+xIMbDQuuejBPLwwc0YXQTXVC65KcWRs1xBSFsXd40JflO6w0eKb2Gu86bvo+9nXeLH5tPHaXtKfrSRoU2Ki32hB0T6aW/YEMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN9U3VJ1DRj2PzopzTPyYNfYmf1OOTSE0ItrPloBlsE=;
 b=gdeGS3SQaIOTkBnWPIXD1Qii7SVk4MYCBHatzASHmjt/lpaj7w7sIBwaPushEEVD1Q/QUyVx0104EcyeLboF4snFAmtZKABcckT9GCzqmEiXa6YAguhL4o5nXrk1hrZdduYnmFJd0y7JwX1Pgo2IZL/7uqA51Iufl2VfyG0sd0E=
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
Subject: [PATCH v3 11/20] xen/sysctl: introduce CONFIG_PM_STATS
Date: Mon, 21 Apr 2025 15:37:14 +0800
Message-ID: <20250421073723.3863060-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9ef777-4dd5-49c6-d035-08dd80a779ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2DdB3gCU8qoxU9SI5Rhzt1wORpitvfvyqpUrKIubg+R6mFxNPwG8J/cTrlOl?=
 =?us-ascii?Q?EPd8irBOr6QgAwJIA82MVwIgEgPsZ5TnmiB+iZ/LjYpcGRMFjvPfg1ACavOR?=
 =?us-ascii?Q?rJ7+rBhEAOp+IZrsPxC+z03EIFRNj0x813E6XMKrNmwrsv4Tj4EVTWDNpq5H?=
 =?us-ascii?Q?t2rzUeZB/cGsksKemaQemHTZ+omYIY0umsXo97iySTm9gSLiUnpZLUpYdGai?=
 =?us-ascii?Q?F2rJHPG6xxKCJI71lzGUxyszG3KHnQXXmLcSPSNcWXDFHWaOFQyZliy3YSA2?=
 =?us-ascii?Q?U5KAuZMrBEkS66a4+FKSII1xmuBUWRi/IbsmarZ5Q7MwPiPLcDIkl8IRb12B?=
 =?us-ascii?Q?ny1puaq80OlYy0qvlDzp5vY5pu+u7OXhhaFWdR0Tp+vZj09UmY0LgwKHAUjX?=
 =?us-ascii?Q?AaaPD/zV4L4Iv4cNF6Vdvmg8r0AEkUglgltHTyIC1Un/OGsRdq3EDpL19CtW?=
 =?us-ascii?Q?mfK2Ab25QlNwog8mKaLhwYw97uKJk8IBK4Vs/zkqQNHAVm1AKTq9mtXgerrA?=
 =?us-ascii?Q?FzCl9MsDaWUGLg9pPC9aebU7jOVOMQ3H3y2WOzanZ2bDPyIynJZsd7ufoy4r?=
 =?us-ascii?Q?J0t5tjUMR7uPW3HiRkUVYFrYEEB3PymIlQrpMkt3Rsa3tC7LqW8kxaOY6pbx?=
 =?us-ascii?Q?Qp6SAk8OeID46Eiy4YCprxJ0omYRYqHoBiFhpgPG4cBar46EWwUc1l/7HBN1?=
 =?us-ascii?Q?wJB69+nvZccSkBqnnkwSCoPXkHTjmp6CzCNz8qlhkN39B71DMKTxk84t5Aqa?=
 =?us-ascii?Q?sgIxb369cSaexRXGFZZ4s9mt1YQaXWDW4N++jEyBbT8poUSEx2N8Z+jaTEdD?=
 =?us-ascii?Q?2csvwFlRs/E9p/L8bnsxhhOh58I5OVhiLOrHAMGzYCdnNcJQXPGVowMWc1SQ?=
 =?us-ascii?Q?HIu2dlfoO0TFLXNmbljzsoDD9AUQWlQzZOXbioueTLnEfzvLsPGvoXp9WP1F?=
 =?us-ascii?Q?uBmOpYw+2pZmiq+35JrhOiSI6UMDq2JpzS625b8I+Qi0yvLWl63RoEuTRAkO?=
 =?us-ascii?Q?1f1JZYR3qVgF5xIOMv4zwmM2hZPa8Z+H3UXg9WScFwO5SewZ2dqoVGaLuvXd?=
 =?us-ascii?Q?at6qX+pMHYW5fPrfDMdiL8M2DHx50E1EhUXvdFZMxdBefIMuWuvKQLsTCPgg?=
 =?us-ascii?Q?uc5J+mFvYKkEVeYFFmcSb/f5Wpd6T5bQJYIISuVFmQUdYIvFwdhlUq5sJj+y?=
 =?us-ascii?Q?UuxYjSEHXr3HX+EHbYKypOXcyIdiXuk2Ic1dqGUh2vQT3U31S7ZNf5EpqETL?=
 =?us-ascii?Q?FJqdvlisrA/nF/GcCopirhMyHRYLftyAeJyaK43SmqYA/C5JNjzS2IgjgsQW?=
 =?us-ascii?Q?L5MjfAodnP6RT/0eoWlR8ws6+cigzD3razLMNBn7hnpz9i+U32r1h914gPFr?=
 =?us-ascii?Q?KiT/rg/nuxaY0FcV9TpdNGaicsgqWfJETUrGm2Onw7ppc5OeKV5EjRbCCEy7?=
 =?us-ascii?Q?M4BTMTvkd54HBJExBJf49iPhDJn3tZucAMK1cPypOjRnsVGe2RCfGIhkTrvV?=
 =?us-ascii?Q?Xy1AihSFxh9jWak=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:15.0759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9ef777-4dd5-49c6-d035-08dd80a779ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674

We introduce a new Kconfig CONFIG_PM_STATS for wrapping all operations
regarding performance management statistics.
The major codes reside in xen/drivers/acpi/pmstat.c, including the
pm-statistic-related sysctl op: do_get_pm_info().
CONFIG_PM_STATS also shall depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
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
 xen/arch/x86/acpi/cpu_idle.c              |  2 ++
 xen/common/Kconfig                        |  8 ++++++++
 xen/common/sysctl.c                       |  4 ++--
 xen/drivers/acpi/Makefile                 |  2 +-
 xen/include/acpi/cpufreq/processor_perf.h | 10 ++++++++++
 5 files changed, 23 insertions(+), 3 deletions(-)

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
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index ca1f692487..d8e242eebc 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -600,4 +600,12 @@ config PM_OP
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
index 4ab827b694..baaad3bd42 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -177,11 +177,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         op->u.availheap.avail_bytes <<= PAGE_SHIFT;
         break;
 
-#if defined (CONFIG_ACPI) && defined (CONFIG_HAS_CPUFREQ)
+#ifdef CONFIG_PM_STATS
     case XEN_SYSCTL_get_pmstat:
         ret = do_get_pm_info(&op->u.get_pmstat);
         break;
-#endif
+#endif /* CONFIG_PM_STATS */
 
 #ifdef CONFIG_PM_OP
     case XEN_SYSCTL_pm_op:
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index e1f84a4468..b52b006100 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_X86) += apei/
 obj-bin-y += tables.init.o
 obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
-obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
+obj-$(CONFIG_PM_STATS) += pmstat.o
 obj-$(CONFIG_PM_OP) += pm_op.o
 
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


