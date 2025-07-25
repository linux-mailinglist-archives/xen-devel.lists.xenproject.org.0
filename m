Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23149B11859
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057173.1425134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBj3-00012n-Me; Fri, 25 Jul 2025 06:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057173.1425134; Fri, 25 Jul 2025 06:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBj3-00010W-Gw; Fri, 25 Jul 2025 06:16:13 +0000
Received: by outflank-mailman (input) for mailman id 1057173;
 Fri, 25 Jul 2025 06:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBj2-0007mf-N5
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:12 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2009::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc303fc8-691e-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 08:16:12 +0200 (CEST)
Received: from MW4PR04CA0090.namprd04.prod.outlook.com (2603:10b6:303:6b::35)
 by CH1PPF7A6EE32B1.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::616) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 06:16:08 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::a8) by MW4PR04CA0090.outlook.office365.com
 (2603:10b6:303:6b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 06:16:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:16:08 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:16:06 -0500
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
X-Inumbo-ID: dc303fc8-691e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUPb8Qnt/iKXF7dXuWRpWZyzMJAKe57s1CwU92KG6v7BCfeWfJAOkC163J1XToGro4ONJQ1WpztsezWz20LT5aajBotABH6f6taXf4gCgzBHbcV0HV2oUmzfwf6pgl0xM62sihaCecUQdFrEZwPM9LcmD1W5pfi9KMzh5PdaNvNE/zvv4Qgkx1tGyYz6r8XXCB7iWnaVwUBixKy1TsoG+KPb5XShfYmM24JIg70A6z+X7aR9KsAggrMtynfaqU96tEvWrsJ+/tNk2uKIvURnpP3sr4f9+9vk5X0D1dEUcxnflCTBUOw/GyMBIB4eJJp5HEgJx2Fr5hb8ALpkLNecnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWo4Gp0/CkdsYjzkposWPAs5K0N2Gq89c2dtM3RO0HA=;
 b=RVPEs9o7ffuVc+t6BQlL+tkusncNfpTYWr4uv5UUOZ1YAi7TK2+F0Dpdc+HYFc9u4C9Gl0uLJWwNfyw+qkXet4r+1wlULfjdC4Jhq63t/mugLzLP4qaw+t114Y5XqjXXxr4vS4D8lEnqv8Sl9E4iWbL//GpCjUPdfPJ7pSvR18/Og+MYon5AF4Nrh4x+/Yhayu0A51B7FE7HhZcAcvi6MjDucb11YwumdflMpdDufyw+Hbxg0P/bEwkbvvWADD+FakEq+0PpNYAKJf4zoL16wWfw4zW+yZ1E8/NbGeT36zGXyFmAcPwt0WziB3dQj9y65jIK5NQ7mo17WGVwgrgocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWo4Gp0/CkdsYjzkposWPAs5K0N2Gq89c2dtM3RO0HA=;
 b=NXpTFEhyJ/ot0dvSjdLvmYdplD1nrOKyPRZ9zzEDc/9AGvHaubWg0szIQQ5bhj9xUr5BwRL6yY7Rwp1aQESQUijPjMU07rSQh+qYnpE98Qo04H6BBjlNvmpNHnHbewpHJFa1Hbp1JlKHpu8Y/jxsgZdyd7iE5cTR5VgFDcDExMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/11] xen/platform_op: Wrap around XENPF_set_processor_pminfo
Date: Fri, 25 Jul 2025 14:15:26 +0800
Message-ID: <20250725061530.309953-8-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|CH1PPF7A6EE32B1:EE_
X-MS-Office365-Filtering-Correlation-Id: e06e4043-f138-4fa3-8e34-08ddcb42bead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUhCWHAzTFlFVm9Jc3BUeWdETndFMzZ6YUp2OERkdzZrMzB6NDZLbHZHT3ha?=
 =?utf-8?B?ZHA0R3N2VWtUUGpYVmxmeXRtR253d1JYdGNCTjNJTVdGYlZhRU9SVExtQUVv?=
 =?utf-8?B?RzNjUWExSUUvczNsdGhmSGg1R0ZzMnNscVMxaFYwd1Vsb3VidE9XdkRJMDUr?=
 =?utf-8?B?VVVzcEMzd0pJbEdoSkVza0U2ejFRVHpmaVpTQjQrQ050MFF5c0VESC9rTXdi?=
 =?utf-8?B?NEE0emo5d01LcyswKzJPVnRJaWJpVHVkbmMxT2l1QnFrR2Y5YUNodHh3eU5O?=
 =?utf-8?B?ODJ1MWNKYmg3QlFkWHpCRGhlbTJRSTlyTE1rQTBYRk9jL3g2OGdFSmRXak8z?=
 =?utf-8?B?d3RHdVlmMVdHWk5BUWEyckR0cnNNRDhUUTAzY3FoWTNyY1UyaUtESldUL3Rr?=
 =?utf-8?B?YU9CUlRlMVI1OWd2akFDcFRlRUJxSEU2N21XV1A5WFRpckxkZ3dIZFFrbFor?=
 =?utf-8?B?amVuTFFqWHNpdlJKNVNjYm9wajZWVTZZUEVhNXkvVlhMN1RNTFpnZ1dxL0pp?=
 =?utf-8?B?STRWRTlhTEJ3Zng4aGc3R3JycU44dGZQU2NkUDBrc2FXRFVRc2l0aGVnTTYv?=
 =?utf-8?B?VXJPbEZrMCtFVVVTbVhWcWlTWWlBMFJSVklibUhzVkFpU1JOMDA3NHREdUpD?=
 =?utf-8?B?dnpPNW5vb3Jycmo5M2IyMUJzdzdyajBPUmV0ZmVUU0docityeGZlWlFqVGZG?=
 =?utf-8?B?SjJTM1owMnVyVVJEVlBLN2VRM2tUMUd4VnNTSi9VTVpvNzQrNURMUXVIUW1U?=
 =?utf-8?B?aWpldG9CNmZvOGR6UTdYbFlaakFBUEs1UzJKM0tDM3dGS1JZUjk0RXNZbDlI?=
 =?utf-8?B?REFxZWZGYlpVMVNzSGhvaXBDM09XZU1wRWcrZThLUWIxUkN1YU5hSEpHOFRB?=
 =?utf-8?B?Y3BtMk5TZG0ycHRodXpoWXVRajRYQjVzT2VFVmg3Y2lGZ2ZQSWZmeXJrcFRO?=
 =?utf-8?B?c2FSUnk0VENRcnVhQXFGZSsxVE5PQ0xyT1ZHaHRodSswR2UySFJrWUFsQ2dV?=
 =?utf-8?B?OVQ0cDgrZHFFQUlkNmhzU2IvYXY5QmNSaXlQZ0M0SGthQXIwaWFVNEFkOGZH?=
 =?utf-8?B?RVJ0UXZiRnRCdVdrY0cyZ3JZV0M4dHc2U0VISjhQWVVkZy9lT3FjNFRydUp4?=
 =?utf-8?B?Z1VhSmh0Q2tQNGlhOGJMaDVJU3l6Tks3UEpsOWM3ZVRkN2FwbDRHUVhqYzdH?=
 =?utf-8?B?RUQxTyszOHVFc0pSMUZSd05vaWVCK3B4SXBsQlBmTEJHWmtnQjlIdnI2czdx?=
 =?utf-8?B?MWFvQUd1NHNxdFpPejU1cDBscFBkL3ZUMFhRV28xTWdmaEF2V1I4SE5tVkNZ?=
 =?utf-8?B?U1pPRGtDcm94dE5BZ3h2L3VhUDBjTnoxVmY1NitzTkxUdGpIb2hEYmN2dHdv?=
 =?utf-8?B?MmRDcXVRR1pNbzhycHB3djg5eFhPVXgvaWFZM1A1c2hleDRONUNJUjk5VVpx?=
 =?utf-8?B?b05ROU5XdW94S2hqNGdmWTIvSmlsb0N2emFGZ0thaFBjNXpnS2VvUGVodCtF?=
 =?utf-8?B?ZzVRdUM2a2VxVHg1eTdzNHRrbS9HQ3hFTXVsRUtZZ09uZExMMXhubGhINUpi?=
 =?utf-8?B?dThTY1V3Q0gzU1RUNStUQWRuc2JMa3l6cFZmNXE5QkdVWWJ1Z1ZLN3Rqdm5y?=
 =?utf-8?B?QUxGTkxQb2h1alZBeVRjVVY1a0xIZ1BMdGUzUlU0cUZzTkZFcFViWWFHVlhu?=
 =?utf-8?B?RFhqWjJ5bkY1RkJkcFRvdS9SQ2hNQTA2UG5vSW1raXByQlBjc28yN0krZWJp?=
 =?utf-8?B?bnZrUzlXZEo2MVBqTEwrMWpSNVpKSUNrQno4TWJQWmRpcEVrQWhZYjh0Z2h2?=
 =?utf-8?B?bWdicFREd3FiaU9HNmZuaENHendqeU91eHlHRFFLdVRXbVh2TXhnd2xjK045?=
 =?utf-8?B?UHBpdmhJTjVia0VhRkFZMUloR3orZ25McHUrWHRFVk42QXRyZEh0MGFPNEVR?=
 =?utf-8?B?dk02eUl3V1JJY0gwV0s3YkNycTJVWnBIZ280eWhEUitVbmo1VW5OUStHWDQ0?=
 =?utf-8?B?MUVSZkMxV3JwUE55bVlRMzIzUjc1QUppZkIwT3pxTlpHbVVyTGFyU09NNklz?=
 =?utf-8?Q?Et4jfn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:16:08.2465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e06e4043-f138-4fa3-8e34-08ddcb42bead
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF7A6EE32B1

Wrap around the call stack functions of XENPF_set_processor_pminfo:
set_px_pminfo
	print_PCT
	print_PSS
	print_PSD
	print_PPC
	check_psd_pminfo
	cpufreq_limit_change
	cpufreq_cpu_init
set_cx_pminfo
	copy_from_compat_state
	set_cx
		check_cx
			acpi_processor_ffh_cstate_probe
			acpi_processor_power_init_bm_check
acpi_set_pdc_bits
	arch_acpi_set_pdc_bits
		get_mwait_ecx

And file xen/arch/x86/x86_64/cpufreq.c and xen/arch/x86/x86_64/cpu_idle.c
only have compat_set_px_pminfo and compat_set_cx_pminfo related functions,
also wrap them.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c        | 6 ++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 2 ++
 xen/arch/x86/acpi/lib.c             | 2 ++
 xen/arch/x86/x86_64/Makefile        | 5 +++--
 xen/drivers/cpufreq/cpufreq.c       | 4 ++++
 5 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index d60a07bfd56b..37b3272473f3 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -986,6 +986,7 @@ int cpuidle_init_cpu(unsigned int cpu)
     return 0;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static int acpi_processor_ffh_cstate_probe(xen_processor_cx_t *cx)
 {
     struct cpuinfo_x86 *c = &current_cpu_data;
@@ -1168,10 +1169,12 @@ static int check_cx(struct acpi_processor_power *power, xen_processor_cx_t *cx)
 
     return 0;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 static unsigned int latency_factor = 2;
 integer_param("idle_latency_factor", latency_factor);
 
+#ifdef CONFIG_PLATFORM_OP
 static void set_cx(
     struct acpi_processor_power *acpi_power,
     xen_processor_cx_t *xen_cx)
@@ -1230,6 +1233,7 @@ static void set_cx(
     if ( cx->type == ACPI_STATE_C1 || cx->type == ACPI_STATE_C2 )
         acpi_power->safe_state = cx;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 int get_cpu_id(u32 acpi_id)
 {
@@ -1302,6 +1306,7 @@ static void print_cx_pminfo(uint32_t cpu, struct xen_processor_power *power)
 #define print_cx_pminfo(c, p)
 #endif
 
+#ifdef CONFIG_PLATFORM_OP
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power)
 {
     XEN_GUEST_HANDLE(xen_processor_cx_t) states;
@@ -1389,6 +1394,7 @@ long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power)
 
     return 0;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 static void amd_cpuidle_init(struct acpi_processor_power *power)
 {
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 45f301f354ac..333b57f3e015 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -179,6 +179,7 @@ static int __init cf_check cpufreq_driver_late_init(void)
 }
 __initcall(cpufreq_driver_late_init);
 
+#ifdef CONFIG_PLATFORM_OP
 int cpufreq_cpu_init(unsigned int cpu)
 {
     /* Currently we only handle Intel, AMD and Hygon processor */
@@ -188,3 +189,4 @@ int cpufreq_cpu_init(unsigned int cpu)
 
     return -EOPNOTSUPP;
 }
+#endif /* CONFIG_PLATFORM_OP */
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index 51cb082ca02a..06afc7f3f71a 100644
--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -101,6 +101,7 @@ unsigned int acpi_get_processor_id(unsigned int cpu)
 	return INVALID_ACPIID;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static void cf_check get_mwait_ecx(void *info)
 {
 	*(u32 *)info = cpuid_ecx(CPUID_MWAIT_LEAF);
@@ -147,3 +148,4 @@ int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *pdc, u32 mask)
 
 	return 0;
 }
+#endif /* CONFIG_PLATFORM_OP */
diff --git a/xen/arch/x86/x86_64/Makefile b/xen/arch/x86/x86_64/Makefile
index 472b2bab523d..8778d49870a9 100644
--- a/xen/arch/x86/x86_64/Makefile
+++ b/xen/arch/x86/x86_64/Makefile
@@ -9,6 +9,7 @@ obj-y += mmconf-fam10h.o
 obj-y += mmconfig_64.o
 obj-y += mmconfig-shared.o
 obj-$(CONFIG_COMPAT) += domain.o
-obj-$(CONFIG_COMPAT) += cpu_idle.o
-obj-$(CONFIG_COMPAT) += cpufreq.o
+ifeq ($(CONFIG_COMPAT)$(CONFIG_PLATFORM_OP),yy)
+obj-y += cpu_idle.o cpufreq.o
+endif
 obj-bin-$(CONFIG_KEXEC) += kexec_reloc.o
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index efba1414188a..396a3a9fd092 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -168,6 +168,7 @@ int __init cpufreq_register_governor(struct cpufreq_governor *governor)
     return 0;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 int cpufreq_limit_change(unsigned int cpu)
 {
     struct processor_performance *perf;
@@ -190,6 +191,7 @@ int cpufreq_limit_change(unsigned int cpu)
 
     return __cpufreq_set_policy(data, &policy);
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 static int get_psd_info(unsigned int cpu, unsigned int *shared_type,
                         const struct xen_psd_package **domain_info)
@@ -460,6 +462,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     return 0;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static void print_PCT(struct xen_pct_register *ptr)
 {
     printk("\t_PCT: descriptor=%d, length=%d, space_id=%d, "
@@ -661,6 +664,7 @@ int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
 
     return ret;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
 {
-- 
2.34.1


