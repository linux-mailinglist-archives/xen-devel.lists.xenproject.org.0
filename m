Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3AEADA88F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016627.1393570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3gw-00013U-LH; Mon, 16 Jun 2025 06:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016627.1393570; Mon, 16 Jun 2025 06:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3gw-00011W-Fh; Mon, 16 Jun 2025 06:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1016627;
 Mon, 16 Jun 2025 06:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Y5-0008AT-GG
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:29 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2413::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 105e7502-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:26 +0200 (CEST)
Received: from CYXPR03CA0033.namprd03.prod.outlook.com (2603:10b6:930:d2::10)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:42:22 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:d2:cafe::9) by CYXPR03CA0033.outlook.office365.com
 (2603:10b6:930:d2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Mon,
 16 Jun 2025 06:42:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:22 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:19 -0500
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
X-Inumbo-ID: 105e7502-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwjKeKpuhSW+Za8Z4m3fix9CR5bTk3k2T45biUhGH75+IS93z3Ls3ycCmgDYA4+PP5dGCg2Yku8Cz9pxBKF6VnIMy2ZPtLtXnT9l0PR47x8ED/aKqN+2dUk81sqqn3rey66Jtg2+FMOaq8sYwbzr40Pdmo2X8N5v7TsAZkawmbH0GI+GZmL90HtWjCnZ55JsR0A3eh+rVxnOeyaJG2RCNPRlbZNa330zrW92mUMIfhNL1+l1E6fgRy8FIW5yqc5qo58gTSFOes5bwoxZDXw5QbrL0xL/XIvRds2dSTLSRafbA6OTreI7meZZfRT7NKs3t73zJjcVdkPsSIGPqYiZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoizLHkC9hrssFkuA6tARof3m6ES0g4Ie5FyhWkflVM=;
 b=nk0vVvVZQJ+6Qo2xpFL3oV3Fz73RKd5WxysRBtLFtSDBEufsoxv4cnA19laMoERlCskF2qqDg9Gb8FNMk/UBGbmzcY6hStFv2WfMtVfJEywfrxolbX82F47cOdV+gSY+W3P8XiftGGgZ2DZcyaUOtWbfQOzlTae/hxuYa7meYdCMJ53YO6ehOWs+citjBdiJhklNT7vYVcf47u/zrE5HCyHBNQVUxI521LLaQGVOVbsUtHbgO1pXqb6F0/A6ZaFOICjuTCdUBYmRkGrGAleNt/D39VMEMbFtBUDag/7p3Eh/7rME5MyirBtth8MCndmDxnqGi7WQvtRKmtX3zt+uNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoizLHkC9hrssFkuA6tARof3m6ES0g4Ie5FyhWkflVM=;
 b=Ns7JNVW1T+kzP/0Tj7sG8U8Kao0ycXs2X2W/f1dBR0/4EO4Gv6KqSGVDGsAAVYjpU7ihZfl91MM/QpHx0GEgCIAcZefR4aiF6sb2TbZE5IVUA7YAiL9V//51mFLhlZ92OICQTOzbTIJo7EKl6+L8+Avwm1ySSBnMQ1jHX0VSMCk=
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
Subject: [PATCH v5 10/18] xen/sysctl: introduce CONFIG_PM_STATS
Date: Mon, 16 Jun 2025 14:41:20 +0800
Message-ID: <20250616064128.581164-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: b716294d-ed1b-41f3-6748-08ddaca0f29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x9h4FfCBcrCkDav5pEspxr8Y45avs+oSeB2HOjgFfB/EdPl17YS2m50WXDwp?=
 =?us-ascii?Q?qyi8js4Y5cosVlphoXbHBf9tood7f5uAVAnNX8LMwNXF/hXQMkmXdA6z12vd?=
 =?us-ascii?Q?l73Noyf7aNW8nqa3RAvEAl7vbUWPT3iU13FwCG1EPNCLnUK1ahtLBQiL6gHi?=
 =?us-ascii?Q?nHi9F4Zu1LaUHDqGd47cceWpjQ/WAADov3HoHEOD+ZoztoIoieENIUheEjLY?=
 =?us-ascii?Q?uX0C0oG8YEAbKdDVNtyeZ4/K8BJVlIH6/RvwOJ3TtfBWLa3BwWqPwCII+Rqh?=
 =?us-ascii?Q?61X54pSqae/JpmLE2GJhmgF6W3K9sFFB3d8NzShEjKTP+PFpftM/XKQLdGMR?=
 =?us-ascii?Q?5bUhC/4ndesXch+5QgSBapeuTWMQKtnCYK+g1zfgvC9iKlVe6VTULLI7krq7?=
 =?us-ascii?Q?UYYrzP7PkWUh2AHH7kI/j8DHrhuJ7dsij4A6DWaRo+kLlbSyVfkfg3J39r7e?=
 =?us-ascii?Q?IZvOCSHpaFIhW2rHgAEGhLm3B7f5wEhWYWCsMVdICZkUur1yOCo1t/5bYaZo?=
 =?us-ascii?Q?eexPg5anlq9Kdh4NZWpGp/o1TeZ59hqf517CrDG1mg+SonBZdscXrpeYVYwN?=
 =?us-ascii?Q?1v2yNawW9larfv2YFpSqBmsliQC9uTs9szRCm16Qob2W5oZTl4jL4dUnuVj+?=
 =?us-ascii?Q?hXcGkHItNausrVw5/zvJTfSOCm4FsJiY+EzHc9TP6ISrr+FJLkjdZlnbYyPj?=
 =?us-ascii?Q?mP9YXek86CBPyyOufGOR7OPguUOv0guHJbJR1p5hj+pcLlIRT893JveAMJhV?=
 =?us-ascii?Q?ydgSsd1MW6p7wC+qCTyIuePCxbV/1DRO+ZmmwWd+DPQ1mD6qAPIsyhVSIjgT?=
 =?us-ascii?Q?fVsU7YYxxmpnBRMe5Q9ZaUC3Jhk7aF6N0YwE13wU9OKfJnAFtUHx9q07XIGF?=
 =?us-ascii?Q?79HZPJkSQPX+tZve4zxlKLRYlPaVdi2lpIs2p/UwxrjeJUPdEjlquhgBwHq2?=
 =?us-ascii?Q?/e3r285tyVQldIYZ848MdDA5M6MUbqmMnyPHoho3r9zyH5wHTFS7Y2raD0jo?=
 =?us-ascii?Q?BqD6MAiRgDVeOdiAqvzppjzZGxIr+6UaGb4fdQbG91v/IYpcNHUJnmN830KV?=
 =?us-ascii?Q?spbmJwnJ2HRAqihXaCkiflaXJjj95Flial8ZO/u6aCxTA5T/JKP+JO6ROMdZ?=
 =?us-ascii?Q?s98xCtzMJBgnu/IzByhpnjv0l40KMS84RqE458qgqegCPKkL/HoUnHfg4gky?=
 =?us-ascii?Q?N1nw7jf1EH5nuROVs53bqrowSi+dIpYdt3NjKq9OSTw1+Eryr2iQ1wJdvTbj?=
 =?us-ascii?Q?Byci6OuJOdZNGaGAscRVdM8ck7KrtqHlqKPJEPB82b5FaIF7wvyToGAjTANu?=
 =?us-ascii?Q?6P8nOya5b++M2xB0/oSUWLgyPZzidksOb4A75ApwYxSSLqA4VrXOyo/59hN2?=
 =?us-ascii?Q?3YiT1KGNgmAF6yR0BsHSNQYFqXKOlIbmeNIz7mwXFeIjXK5WNC8+e5rcCy0a?=
 =?us-ascii?Q?tpSNvPPaqr3I+SCuKENZtcS7FIMg2iu+wSBoiBOHd/SlBWsSW6mlQ9pjDmG2?=
 =?us-ascii?Q?Jf5/INlZIulefa4I35EaysLmQIzBmVN5KIBO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:22.0759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b716294d-ed1b-41f3-6748-08ddaca0f29f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042

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
v4 -> v5
- add blank line before endmenu
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


