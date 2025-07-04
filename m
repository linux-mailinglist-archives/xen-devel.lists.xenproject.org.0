Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A3AF8EA1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033101.1406587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckn-0001TX-KT; Fri, 04 Jul 2025 09:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033101.1406587; Fri, 04 Jul 2025 09:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckn-0001Ov-GM; Fri, 04 Jul 2025 09:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1033101;
 Fri, 04 Jul 2025 09:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckm-0007ek-1a
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2414::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cb00071-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:41 +0200 (CEST)
Received: from MN2PR15CA0038.namprd15.prod.outlook.com (2603:10b6:208:237::7)
 by CY1PR12MB9698.namprd12.prod.outlook.com (2603:10b6:930:107::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 09:30:36 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:208:237::4) by MN2PR15CA0038.outlook.office365.com
 (2603:10b6:208:237::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 09:30:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:32 -0500
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
X-Inumbo-ID: 8cb00071-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIvzlAABDvzgbyC1MqCBADVxeK0CLO8oHSWYzQz/BLpnBTxNSSr1+/yuYlf3kGcIrmFuhoTKu6DMOwIvfPSedMQANkwR3BzqyhjvMXbGus8vKWhkWiPvtpNsE73u2CCLOvvcnI1+2+cefvmt+ra10Djj7jhD+/uEv/B+Mvd85Dt8+6qHNydh3DsEofKV5zYl4I9RoZHS2/BGrLX2VSRuUQN63mwdD2Lk1zYDt65gkfG8AU4jPRv+YK1yIa8UWSv377upu87QIVSYykFWreRrVmo8tuopSBDB4y3EJY6EzndQDEGUiKdad4DF8txOAEKYeXgEp+XxE0o2ccF363qEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QecYoeOZZxssyXE8XinkAofZ+aon7XKcTK0uGY706Nc=;
 b=gAhJp1YV+i7IEikwBJhlXR5kN9qyvwfeKj+eEDqqYm2asyaI1vIIwYzBTEjH89ztVt0KhdxqR/dRgqvY5l9PUcKHw4ZEqxhpZLb8Nff40UNZ/DEMMPEOUTNk2FAo2DBcBtJQoUXUoegRZuOQ7SiHaWYaiQaaaXmPz6nrvgUMc6SMooVWof/MTjG6pZjOfRbqYBvr2UM/R9i7memN3yxut2NUwrxx2nYdy4y1C2PPfNXWmFds7fhPotZLV3ZmhNzIueAffm3nEuKbjtF4+UrGlr8foTvTFD4rvXcO8GpVWc9IBUYKWoLuEKjJRzAFEPy93dAKRz6zjWr8NHZOQnsoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QecYoeOZZxssyXE8XinkAofZ+aon7XKcTK0uGY706Nc=;
 b=lBM64dSsJa9jZi8IcoHMOEUzlvLsNq4CrM8Vy+mUnk1iNVqXdH4sTikpAdcIr8Oq6byaBJPoLyR39EM5Yk7K1pZoovuJb3eRwNUS3kDaqx+0eUDqAVEO/9l/N/WgjlV0OCmvHG/n70SASmz4jE8P1xIRpEBhRpm3pE3WMbeOwU4=
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
Subject: [PATCH v6 09/18] xen/sysctl: introduce CONFIG_PM_STATS
Date: Fri, 4 Jul 2025 17:29:43 +0800
Message-ID: <20250704092952.822578-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CY1PR12MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: c8daf90a-ea47-4f93-3ffb-08ddbadd6e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YZO8ZQkjBH27U8711xhUyBEc4SflUq+m4BBfRTj+dyWvq9WFDw3v6B3uiUxl?=
 =?us-ascii?Q?9Mn2svgM9PX5WZuiYyFEqIvWO8IZ/g4TdfKNSwi8cRq8Jn1Q1i1FylPX7mXz?=
 =?us-ascii?Q?aydEpHHHP4p3oX1MC+3+JncmA+r4KCncnfxHjBPfyWNJRgM/c5Y1TXfIyEZT?=
 =?us-ascii?Q?srGb+gfUneW6je/kp+dRPvdXCRZhE/NHTenu8F8pcU1pT4oB86hazJZgDiqF?=
 =?us-ascii?Q?VXCdZ8JfLyp5Z+EFISWyv4omg/0bn5XYZLnQB8ItkTy38PPUGKpPdRvyZLS+?=
 =?us-ascii?Q?NcyjwqQo2GB1vFLe1JtSkjxk7TYYHp0K9U4mgWKNuVqic50VwA8ffTS7F7uV?=
 =?us-ascii?Q?TzTYSwYem7rBU7R2u0znKOzb/JzO13W6jUQOP0pQ3cFTtT0JVRUvxSDmB2GZ?=
 =?us-ascii?Q?p0IbKU8PHdemVwfbb/L6q8t2J7rI1oh6XdbIjDo9hFBv6A6aCcylq57UFwGV?=
 =?us-ascii?Q?swbApXCkXMhWoK3NPm8+Eydu1cPYEODjsXA+pqj2NdIepa7lH8JybSXsU4kl?=
 =?us-ascii?Q?x5ByORF/REPgYXKOhBahXMaeYKxr8yqk/rBKmQaXm5Gyla9+ekuGclfwB1II?=
 =?us-ascii?Q?duBowmLWrzCQO8513P4zMvygUxaEwMWBwrijrgp9R5KhUGmSa/0nhHmnoFa+?=
 =?us-ascii?Q?avHhLD0G7e1KY+cUdhFTvgjuNns9pCmf2OCXAzDZGhZlGxh0mRC+hF9Lzhyn?=
 =?us-ascii?Q?IWF7/Ofgj47F8DbZWmvarN8UJ4D2MX9LfqQ54dzSwqToCGzDvBAvb7sWIPL2?=
 =?us-ascii?Q?WkKch8tlTLbv4iMxmZqN/gHht2E2DuA/iMUULCGFZ9b0ExQnIVQzceu7NEgx?=
 =?us-ascii?Q?xKPFUI0mMFwfM3RXtw7XhbkUBBwf5/22efu+RVixQND6DOCDoauAWR3HjnQS?=
 =?us-ascii?Q?aXaLu+ugesHK0lql06m/pZty5EG30D5RdGdUQetEN1lb+Gn5otxkxP0hDmBx?=
 =?us-ascii?Q?e94/ZUgvD7PX59f7JB7jd73/Dozs7nC6jhqI2XtTJrpaaZ8uU7lPf1/DbHfL?=
 =?us-ascii?Q?D0UiENS5qwjl/Aa1kDE74OyxzVXYYq3XLB1l1z0UjN75Bb1ks1DAFLOZX5iI?=
 =?us-ascii?Q?NBBx1K2fL0deadNpTrVncqU8rmzcwDd9xsL/TDQyua2fil40FD85iRtUo97h?=
 =?us-ascii?Q?mWRm7vqC/n5Wsl1JysP5wao4LIVNurAou28nJeap9Q//+6b5ynxjpvvShC2z?=
 =?us-ascii?Q?RnL0QMD14jwyK+aEBskbjXT0qS4s/iGPCbkiO1CUiA1ZSQiSl1pdrGUTdc50?=
 =?us-ascii?Q?lMpbrGwWQVp6BWCLZzKRJvpw3Q13J9PLgA2B4PlSslbbrSfLq2ZP891nBKi2?=
 =?us-ascii?Q?pFeLtjUriwFWJB0P3zjWkcdY9WPvI+mEilq3kFheYSLas/IE0NuhmGlszKsY?=
 =?us-ascii?Q?K2U4VqjBt67/S++JWx/uN+7pcYWmbTwticH6NNkj8p7UM9Px6pn2zn59ROKt?=
 =?us-ascii?Q?XRrfQXBUfT8AAmy8pee8vuMOXCX8TQ1L8+xM5CWmO2uE4UY32QalMLFqiwF0?=
 =?us-ascii?Q?wqpUYRQahNKpHyeMr8HZpOAq2fUrYXcQgk3E?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:35.2565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8daf90a-ea47-4f93-3ffb-08ddbadd6e07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9698

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
index 6c3a10e6fb..3a5524691b 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1490,6 +1490,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
         vendor_override = -1;
 }
 
+#ifdef CONFIG_PM_STATS
 uint32_t pmstat_get_cx_nr(unsigned int cpu)
 {
     return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
@@ -1609,6 +1610,7 @@ int pmstat_reset_cx_stat(unsigned int cpu)
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
index 943cf0a950..998e672fa7 100644
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


