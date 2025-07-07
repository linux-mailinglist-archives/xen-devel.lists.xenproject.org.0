Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA3AFAA11
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035079.1407331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJM-0000Wy-Td; Mon, 07 Jul 2025 03:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035079.1407331; Mon, 07 Jul 2025 03:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJM-0000UC-Qa; Mon, 07 Jul 2025 03:14:32 +0000
Received: by outflank-mailman (input) for mailman id 1035079;
 Mon, 07 Jul 2025 03:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJL-0007mT-22
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2417::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dea3b30-5ae0-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 05:14:29 +0200 (CEST)
Received: from CH2PR19CA0005.namprd19.prod.outlook.com (2603:10b6:610:4d::15)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 03:14:23 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::37) by CH2PR19CA0005.outlook.office365.com
 (2603:10b6:610:4d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:23 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:18 -0500
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
X-Inumbo-ID: 7dea3b30-5ae0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NopGuo+MqNxq6ffPFEkWBiYGhAF85wau8c+pJ4S2eXfaHlfBw/aWDh+skC71ct9qIcRN3jcfHsom8qkhK6cbkUEKvzKKuS3g8DjTTXRagRnujTiu0FAyfh+pTv21m0JBQfJ8Fvcggao12YQ/U9bv340md0lEtdEr1iEJGdSa2OrepCB9OJWiMmtnCsA9/8Ug2UIB3Dl+v7tyyEaH1Dj6jkC+tPtO+5JDXt7VjWj1+o/UMRykHdYa4qtKLDUh7nawBLS3MwEs6mUiP8DWUG+BnW+7tTnCUqWnUtAUUG6l+8eLDf2PVHnXKigws+08+ugGXzEsFnZ1MyYs/qVHABYUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/xn6mKm/IwhMKSwPcUVG9tTIdnkVLy/smOfyn2Vqts=;
 b=uPHGAo7adF0ZxJd8RFXYan7rZLHTngiHpwMHcjb34KvpztjvbYkofII4SlH1WY5Ijpvl2WiV+TJyS76vIn34E/iWScZT/5Y4fJlNuTneDjUIod6YcTn7lC2oETOWdEofgJa2hcyQYVU5XXx6K+uvSZV0K+elLTkBcOb5ePYec4OU9T+AdbNRX5SPP0JI1cPcg3hHFHbREJS3ClinRxOMofYwK3wKdtKM79GVDmH6XWNNE4rYjsHkGj6NdeLkyQfunsdYOw/d/84OYjeZ+AWtCKtjPx1JFdbbubBpU+zDmkGcIIdgibIWPYJYdVl0dko/H1OY2c1UeRxWjWcq8h5OIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/xn6mKm/IwhMKSwPcUVG9tTIdnkVLy/smOfyn2Vqts=;
 b=sJDzkl+/ijYY1F3VSh3jQKjbF5JOfDqd+MtzA9BzKxcpcT9qCI3lr+W8vyLhVqPGaw3nccbsgPaXG7PNRZcSCXlSy3D+U+3mL3AfD0KeTcsKksXQ9O7ljxybn6HLlQgOEY4oiMR8DrU9+elYQSzySdIKoxnscwo14xk8Jo6Xppg=
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
Subject: [PATCH 05/11] xen/sysctl: introduce CONFIG_PM_STATS
Date: Mon, 7 Jul 2025 11:13:40 +0800
Message-ID: <20250707031346.901567-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb2bd20-ce1d-4083-51af-08ddbd045f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FJw+HFG+/hpxWHDsFFg81TIOT6PeqYvClLj5alS494T9muf4ksCcYyKudTx7?=
 =?us-ascii?Q?Rbfyf38QOoI7RcUzwRDxsAhSGCOiUtQ9tsnyM12aVVkosstpFiTDP2WFYKa7?=
 =?us-ascii?Q?CsTFdCBw+dUKgaA9ZC9jk2tbcm65PO1a5F12b95eCeB0zk43O0RNyTnfa1vh?=
 =?us-ascii?Q?cevGr9DC0Ws1uQjHf3BJV3ewHdmJtANWPi+ZaCEzZ6jwESh/tBdD1R2xZW7l?=
 =?us-ascii?Q?DSXE7g8KV9t7uTGUYeeDBcgKTYSk0jiDUza9sO21oAcZiYFJBgUH/c6nT11K?=
 =?us-ascii?Q?7WTLEvqmpEovlRJbAD/rJ22ezOYnfZn8DXa71pFCItniR6pyiSc4KB6KHMYO?=
 =?us-ascii?Q?I4BKDop5QvY0mSE4Z6szlSabrV+ZU6G40ClSRrEf9shX93POPqcLOJSZlg3s?=
 =?us-ascii?Q?8lf9wlQxRbqD6+jAWKrAaYrJLy1TxJD9BLdEfiPUrAjneAl9XBbALy5pbmPQ?=
 =?us-ascii?Q?ZV/TJvCXcUoUu1tjIZd7fkFfqN7+uQ0hkHOl7KH8zXNwJxP6abY6dhakgWKG?=
 =?us-ascii?Q?Drfb8ZmnJ4crkck14b+RxSAiPdhbsjiyPVHDmmITgbRtpeRNejGYbpVfyzRs?=
 =?us-ascii?Q?gmir80yHYQxFDOpU3StRZqAyKSz+thlCGjGoKnVcnNoS2b6pxE5BrURR96ka?=
 =?us-ascii?Q?SjomJRjjhUP2UJqv6O5poJrRjTSvq+kPL5toA/pg0vYQFBu0LW+lOSfg7j2p?=
 =?us-ascii?Q?5nWGOi7EYmmFJ1NyjRhwWN7bqsy/tNA4p7kxvh8SaV5FyKmfGg5LOajsEGbQ?=
 =?us-ascii?Q?vserKpa79KtOai26FqEA5S5tDC6F4aG2DykSrS7UIfmuMDnXE2lOxv2vNB9M?=
 =?us-ascii?Q?SrB3S+UMdQQwGqxNuX5TZul6t0v7AKJrHgS8FBWQ4mFiKr6iMDy1P5yflaAb?=
 =?us-ascii?Q?MrcztEaLqxaVQivExGYdrNzcQ918Td4H6F1SC8chmm8nPdQ+FL4hpbwkFp6D?=
 =?us-ascii?Q?O0kxNZzTxYP5+38YDSP5lHdYiRdiiR65GuUMmlusTcFCQCffStH83GnKxeom?=
 =?us-ascii?Q?hiMq8unxt1aFznVbI0XPKhSDqB5qEVkLJ0+JxWy7v86yqDumsbwvTFmpBt0e?=
 =?us-ascii?Q?1uz9aLNm4+/2qcmDOwIL+TDYKAU6O79SiW45Zod8tyinY9hKnUbG7tJziBWh?=
 =?us-ascii?Q?Gach4Txzertv+udFydOSijLGCvWkfG//DTX3GSgDvSWuez/bvYugQUyikuFZ?=
 =?us-ascii?Q?LTVopgCau27exDtRJMqKNGxCCkNPZzvf03HNkLj1jncJtlmot/erjo/UQqPp?=
 =?us-ascii?Q?CAKhsUNRZj1TYnAmqwvD6m5qddCvwT10W5IfEToTvpTmP+pVyFgoRcrCYvfk?=
 =?us-ascii?Q?w97tMS4TVvv+hG4vhOl9dCTwIZ/afoaD4uHV+WtpqLAFzkjmmCvevOUfKyvf?=
 =?us-ascii?Q?vQ1mo8pLj682IwL+h+7TuFLZ7y+SLPiLOB7SXakaWmYljbNTQ+xxm3xaYvzo?=
 =?us-ascii?Q?gTorEQKwfE801ohEU0yItf7Vx0q2+rS8kVOmDRd34np/CY4nozLEnTmp/0Lc?=
 =?us-ascii?Q?TzKtBOIlCTwCKBoe4surVnw5SyYYWFRW5moN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:23.6428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb2bd20-ce1d-4083-51af-08ddbd045f8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617

We introduce a new Kconfig CONFIG_PM_STATS for wrapping all operations
regarding performance management statistics.
The major codes reside in xen/drivers/acpi/pmstat.c, including the
pm-statistic-related sysctl op: do_get_pm_info().
CONFIG_PM_STATS also shall depend on CONFIG_SYSCTL

We shall also provide "# CONFIG_PM_STATS is not set" in preset configs for
PV shim on x86.

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
v4 -> v5
- add blank line before endmenu
---
v5 -> v6
- add "# CONFIG_PM_STATS is not set" in preset configs for PV shim on x86
---
 xen/arch/x86/acpi/cpu_idle.c              |  2 ++
 xen/arch/x86/configs/pvshim_defconfig     |  1 +
 xen/common/Kconfig                        |  8 ++++++++
 xen/common/sysctl.c                       |  2 +-
 xen/drivers/acpi/Makefile                 |  2 +-
 xen/include/acpi/cpufreq/processor_perf.h | 10 ++++++++++
 6 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index e50a9234a0..6551f360fc 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1476,6 +1476,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
         vendor_override = -1;
 }
 
+#ifdef CONFIG_PM_STATS
 uint32_t pmstat_get_cx_nr(unsigned int cpu)
 {
     return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
@@ -1595,6 +1596,7 @@ int pmstat_reset_cx_stat(unsigned int cpu)
 {
     return 0;
 }
+#endif /* CONFIG_PM_STATS */
 
 void cpuidle_disable_deep_cstate(void)
 {
diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index bacd04c963..9dc91c33e3 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -27,3 +27,4 @@ CONFIG_EXPERT=y
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set
 # CONFIG_PM_OP is not set
+# CONFIG_PM_STATS is not set
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index ed907de268..65f07289dd 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -628,4 +628,12 @@ config PM_OP
 	  This option shall enable userspace performance management control
 	  to do power/performance analyzing and tuning.
 
+config PM_STATS
+	bool "Enable Performance Management Statistics"
+	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	default y
+	help
+	  Enable collection of performance management statistics to aid in
+	  analyzing and tuning power/performance characteristics of the system
+
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
index fa28b14faf..caa768626c 100644
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


