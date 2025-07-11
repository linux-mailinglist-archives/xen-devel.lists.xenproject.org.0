Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F20CB011C4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040200.1411689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nl-0005Sc-TP; Fri, 11 Jul 2025 03:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040200.1411689; Fri, 11 Jul 2025 03:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nl-0005Kt-N4; Fri, 11 Jul 2025 03:51:57 +0000
Received: by outflank-mailman (input) for mailman id 1040200;
 Fri, 11 Jul 2025 03:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nj-0002Li-Oz
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2413::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61029423-5e0a-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 05:51:53 +0200 (CEST)
Received: from BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39) by
 SA5PPFA403A61D8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 11 Jul
 2025 03:51:46 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::2d) by BYAPR01CA0062.outlook.office365.com
 (2603:10b6:a03:94::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 03:51:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:42 -0500
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
X-Inumbo-ID: 61029423-5e0a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBmX23A/P5xvHITpUmgy2kH+W9uUxFLTPPMK6NNhc1FkJLLmI5U+qMDjR7WOdzHZtzhi+V57OR1N8gIaRLBc09jQbwqoy/Jp6Qna7866dKHpaKDxYGXCiSbXuD9dTglyCQKMq8WaiPD0HttmexoP7+0HbK95vXM8rboAdcYKIR/9NwAIRHKoVCL11QGI3WDOjgxEFzt8+aEM3yPz8jl+l6KxVDmjLL83RXLfK8MOglXdAyhyi1DxgMqJido9H6ONMSjeTWSVxhvJ7JgTAnQo/+HTAsFot5mCymvThaYJjPxL5yn5otPB47rXCiSieZlApeg4364MwB5BXkM749jNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFT6OKMyW/wtwN7vSr47o2NxClGsTlzj5TRgLg9KIeY=;
 b=T6oh2H5oa7UE5MpmRqBWHM5+PpNyv8FS6S+yhN73rY9jOs02G/+sRrr80YZjP4RvX++c/z8Z17QE2gB6PktvOuWPROxKwYvPjj1dB2lxzkXJlezzkcaQuIVylCz/Fw8JQN4OTwu+AhFKz5O8oSE9QB8mgkVZSn+4y20/SDxBytPDMlloQpUXKDNxXoihJePZx4gonnTVI2KUP5oPEqLpTyi+5CJhz4wwmW7P/iISaaVZovbinyYsH75dSCu9E9IBlp5JJNw4jmVtj+cG9GgQKgc6qYYv1w7YWOcmuQ3f3WboDBmoEQzrmu5OnNuII3i2T1mweDRHlSiE/MH8/o37MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFT6OKMyW/wtwN7vSr47o2NxClGsTlzj5TRgLg9KIeY=;
 b=32Gr8OR9vDe1e1zsoa1Fhzf449Omr7PdzrgPhgVIyobE2njJ2P8nRSZpDbRKDT7cd9uo6zSiIy/V0Qnq7Hg0iXRtooiv9CQEfFgf5wVxRQrTTmI3dVn8Vl11sua6NIFXZYByX433qAoN8VtXY7NgjB7cD27cTGzG5AvFefYtZyo=
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
Subject: [PATCH v6 10/19] xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
Date: Fri, 11 Jul 2025 11:50:57 +0800
Message-ID: <20250711035106.2540522-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|SA5PPFA403A61D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f09626b-d801-4c0c-a713-08ddc02e41b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9GwbYucTtPbU91x/wYIt0VDn5NbSvgegjrDYJN/nZ9nhK/UrnQs7A+PrLSUy?=
 =?us-ascii?Q?jXW4z2CeEN+aqoZENBhhC3D612zcvx/gK0WnlfgsqbDbyQ8fM90PpMA6cduS?=
 =?us-ascii?Q?ZY+O+PAWkp1v5m7dHBmLPl9kVMAgf7mKzGcnTE+Xjuw8h4fj1whjtzg1l1ud?=
 =?us-ascii?Q?p8v7qprClSjndtg/+mwvzlQniOn05YAYlJJwMvxEmKBvsyLHGG0UZeNfypBG?=
 =?us-ascii?Q?bXEo5YM8oFhbenifrocACu4cZDQcMUeY65OLtXj7cbmJbM5+9sFAAyVTq+SB?=
 =?us-ascii?Q?6fSLhG5c1VuvnukOwL6sHyQkyVosc7GD5jkMOebQD/bP5B3p0animqfhJOKW?=
 =?us-ascii?Q?4ekn0XR89OTftHcMVzlAi1GCc1mj/1x1BPpnqyM1PzxBTfDsCNUJiCvnpm/F?=
 =?us-ascii?Q?4XQJmUHqwW9mBGBE/E+v8JXhN2UuiB7dFCQt3aQMy+QllVEIYFGQuGRSJNef?=
 =?us-ascii?Q?847L3APb/eL2yeN15vWoU2v8VGzd2TPyqBRK+H8pG/O8kcUw0oi9rPHfdW6J?=
 =?us-ascii?Q?twLOWeNP+wddf0DMdGE3Z0kdYXNmFKQd3Bk5IGmMG8eLMTM8NliqoGyge6FK?=
 =?us-ascii?Q?A8fz8IUKcl3ezWuJ/YworbeCaxsE9MlsNWEKoUkjsH4SDId44zC3XwEubTF+?=
 =?us-ascii?Q?+fDc05aHggsn7itABGFFT2Cpmiyg0TqaytDWsrouSxoN+FZfhW9iqS2gwCxq?=
 =?us-ascii?Q?SYLeVty+uChFX6zYGWn3/gCQcoG7Bm+sTcG+jv2Qr5uJBouIl48s5b7DkUZ7?=
 =?us-ascii?Q?/8Upmf9xGWMhzd+KVc5VNLhdJ0qDe67m1F9t+Ir7KnXmk3xUKlrpxzayZ+h5?=
 =?us-ascii?Q?5ny8DvpKVwxG+k1ieLJzHf1uTh6+Of2oD5eYx9o7BnajkwABrSiNI1XWhvIJ?=
 =?us-ascii?Q?8mWyOW8+LWBOmkbxbkrGkvTLd++a97MIzCklioODgH64eyry25zJZ8wzzTq7?=
 =?us-ascii?Q?T+MVPseuJkQs8dUc4Qa9EROgVCSOrx5wi6bbfRRPp+9wraiAsCACzOClWvO0?=
 =?us-ascii?Q?+yNrcF7GFVNoHW1t354V3LvcbMjg/KK/wuax1gwcFpxmd1CwymyTEKvDZgQF?=
 =?us-ascii?Q?qDH1aqNcQ/yWhdZ0CDXXDLHFoAqIiLf/SspM7t9o9sfUCG7WuErIP8Ox6xbP?=
 =?us-ascii?Q?6cJ48ugc2FfbC5wuhA3ELTDr7QSGcxub5UzFwkQkcEg6cx0ZIUa/GnY4yI+c?=
 =?us-ascii?Q?0Hdf0betG08kj9G7u3JSIZWZMIB1AbR/XxUPd83nAbD3t66hifN9UgZR7T6k?=
 =?us-ascii?Q?f3NRQSc/eaOynhPsWYCpDa1r3mzXuBk75SN8Tg0M09MxC+vM098udTdsx25V?=
 =?us-ascii?Q?5U1QYXFCYTTLLlBhg6WG6LUJwIB9tNem2vRJ21cskcRYIYwjgVv8uUKAn+H5?=
 =?us-ascii?Q?V634fzwGZ5kCw7sTqtWyIaknHXGOyLk5H8/c7v7+wDy9OYmFPBhoNUs4BNQq?=
 =?us-ascii?Q?IDXcnP080vbojXex1G1bDhtWaEBFzDiiXqgZPbPSmmXQ4TJeGKITjj93QgMW?=
 =?us-ascii?Q?7JsnshMLwRQM3LNFnx+i1JVk7uconmfVrudU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:45.8516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f09626b-d801-4c0c-a713-08ddc02e41b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFA403A61D8

In order to provide backward compatibility with existing governors
that represent performance as frequency, like ondemand, the _CPC
table can optionally provide processor frequency range values, Lowest
frequency and Nominal frequency, to let OS use Lowest Frequency/
Performance and Nominal Frequency/Performance as anchor points to
create linear mapping of CPPC performance to CPU frequency.

As Xen is uncapable of parsing the ACPI dynamic table, we'd like to
introduce a new sub-hypercall "XEN_PM_CPPC" to propagate required CPPC
data from dom0 kernel to Xen.
In the according handler set_cppc_pminfo(), we do _CPC and _PSD
sanitization check, as both _PSD and _CPC info are necessary for correctly
initializing cpufreq cores in CPPC mode.
Users shall be warned that if we failed at this point,
no fallback scheme, like legacy P-state could be switched to.

A new flag "XEN_CPPC_INIT" is also introduced for cpufreq core initialised in
CPPC mode. Then all .init flag checking shall be updated to
consider "XEN_CPPC_INIT" too.

We want to bypass construction of px statistic info in cpufreq_statistic_init()
for CPPC mode, while not bypassing cpufreq_statistic_lock initialization for a
good reason. The same check is unnecessary for cpufreq_statistic_exit(),
since it has already been covered by px statistic variable
"cpufreq_statistic_data" check

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Remove unnecessary figure braces
- Pointer-to-const for print_CPPC and set_cppc_pminfo
- Structure allocation shall use xvzalloc()
- Unnecessary memcpy(), and change it to a (type safe) structure assignment
- Add comment for struct xen_processor_cppc, and keep the chosen fields
in the order _CPC has them
- Obey to alphabetic sorting, and prefix compat structures with ? instead
of !
---
v2 -> v3:
- Trim too long line
- Re-place set_cppc_pminfo() past set_px_pminfo()
- Fix Misra violations: Declaration and definition ought to agree
in parameter names
- Introduce a new flag XEN_PM_CPPC to reflect processor initialised in CPPC
mode
---
v3 -> v4:
- Refactor commit message
- make "acpi_id" unsigned int
- Add warning message when cpufreq_cpu_init() failed only under debug mode
- Expand "struct xen_processor_cppc" to include _PSD and shared type
- add sanity check for ACPI CPPC data
---
v4 -> v5:
- remove the ordering check between lowest_nonlinear_perf and lowest_perf
- use printk_once() for cppc perf value warning
- complement comment for cppc perf value check
- remove redundant check and pointless parenthesizing
- use dprintk() for warning under #ifndef NDEBUG
- refactor warning message when having non-zero ret of cpufreq_cpu_init()
- With introduction of "struct xen_psd_package" in "struct xen_processor_cppc",
use ! and the respective XLAT_* macro(s) to wrap.
---
v5 -> v6:
- remove unnecessary input parameter check
- use print_once() instead of dprintk() and reword the log message
- adhere to designated comment style
- relative ordering shall be consistent between different declaration groups
- add alphabetically in xlat.lst
- in get_cpufreq_para(), add must-zero check for ->perf.state_count in CPPC mode
---
 xen/arch/x86/platform_hypercall.c         |   5 +
 xen/arch/x86/x86_64/cpufreq.c             |  19 ++++
 xen/arch/x86/x86_64/platform_hypercall.c  |   3 +
 xen/drivers/acpi/pm-op.c                  |   5 +-
 xen/drivers/cpufreq/cpufreq.c             | 126 +++++++++++++++++++++-
 xen/include/acpi/cpufreq/processor_perf.h |   4 +-
 xen/include/public/platform.h             |  26 +++++
 xen/include/xen/pmstat.h                  |   5 +
 xen/include/xlat.lst                      |   1 +
 9 files changed, 189 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 3eba791889..42b3b8b95a 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -577,6 +577,11 @@ ret_t do_platform_op(
             break;
         }
 
+        case XEN_PM_CPPC:
+            ret = set_cppc_pminfo(op->u.set_pminfo.id,
+                                  &op->u.set_pminfo.u.cppc_data);
+            break;
+
         default:
             ret = -EINVAL;
             break;
diff --git a/xen/arch/x86/x86_64/cpufreq.c b/xen/arch/x86/x86_64/cpufreq.c
index e4f3d5b436..8d57f67c2e 100644
--- a/xen/arch/x86/x86_64/cpufreq.c
+++ b/xen/arch/x86/x86_64/cpufreq.c
@@ -54,3 +54,22 @@ int compat_set_px_pminfo(uint32_t acpi_id,
 
     return set_px_pminfo(acpi_id, xen_perf);
 }
+
+int compat_set_cppc_pminfo(unsigned int acpi_id,
+                           const struct compat_processor_cppc *cppc_data)
+
+{
+    struct xen_processor_cppc *xen_cppc;
+    unsigned long xlat_page_current;
+
+    xlat_malloc_init(xlat_page_current);
+
+    xen_cppc = xlat_malloc_array(xlat_page_current,
+                                 struct xen_processor_cppc, 1);
+    if ( unlikely(xen_cppc == NULL) )
+        return -EFAULT;
+
+    XLAT_processor_cppc(xen_cppc, cppc_data);
+
+    return set_cppc_pminfo(acpi_id, xen_cppc);
+}
diff --git a/xen/arch/x86/x86_64/platform_hypercall.c b/xen/arch/x86/x86_64/platform_hypercall.c
index 9ab631c17f..0288f68df9 100644
--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -14,6 +14,9 @@ EMIT_FILE;
 #define efi_get_info        efi_compat_get_info
 #define efi_runtime_call(x) efi_compat_runtime_call(x)
 
+#define xen_processor_cppc  compat_processor_cppc
+#define set_cppc_pminfo     compat_set_cppc_pminfo
+
 #define xen_processor_performance compat_processor_performance
 #define set_px_pminfo       compat_set_px_pminfo
 
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 9a1970df34..49b4067dec 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -91,7 +91,8 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     pmpt = processor_pminfo[op->cpuid];
     policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
 
-    if ( !pmpt || !pmpt->perf.states ||
+    if ( !pmpt || ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
+         ((pmpt->init & XEN_CPPC_INIT) && pmpt->perf.state_count) ||
          !policy || !policy->governor )
         return -EINVAL;
 
@@ -351,7 +352,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     case CPUFREQ_PARA:
         if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
             return -ENODEV;
-        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
         break;
     }
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index e387b8a0d9..065fdf4106 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -40,6 +40,7 @@
 #include <xen/domain.h>
 #include <xen/cpu.h>
 #include <xen/pmstat.h>
+#include <xen/xvmalloc.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
@@ -238,6 +239,11 @@ static int get_psd_info(unsigned int cpu, uint32_t *shared_type,
         *domain_info = &processor_pminfo[cpu]->perf.domain_info;
         break;
 
+    case XEN_CPPC_INIT:
+        *shared_type = processor_pminfo[cpu]->cppc_data.shared_type;
+        *domain_info = &processor_pminfo[cpu]->cppc_data.domain_info;
+        break;
+
     default:
         ret = -EINVAL;
         break;
@@ -263,7 +269,7 @@ int cpufreq_add_cpu(unsigned int cpu)
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!cpufreq_driver.init)
@@ -438,7 +444,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
@@ -697,6 +703,122 @@ int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
     return ret;
 }
 
+static void print_CPPC(const struct xen_processor_cppc *cppc_data)
+{
+    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
+           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
+           "nominal_mhz=%uMHz, lowest_mhz=%uMHz\n",
+           cppc_data->cpc.highest_perf, cppc_data->cpc.lowest_perf,
+           cppc_data->cpc.nominal_perf, cppc_data->cpc.lowest_nonlinear_perf,
+           cppc_data->cpc.nominal_mhz, cppc_data->cpc.lowest_mhz);
+}
+
+int set_cppc_pminfo(unsigned int acpi_id,
+                    const struct xen_processor_cppc *cppc_data)
+{
+    int ret = 0, cpuid;
+    struct processor_pminfo *pm_info;
+
+    cpuid = get_cpu_id(acpi_id);
+    if ( cpuid < 0 )
+    {
+        ret = -EINVAL;
+        goto out;
+    }
+
+    if ( cppc_data->pad[0] || cppc_data->pad[1] || cppc_data->pad[2] )
+    {
+        ret = -EINVAL;
+        goto out;
+    }
+
+    if ( cpufreq_verbose )
+        printk("Set CPU acpi_id(%u) cpuid(%d) CPPC State info:\n",
+               acpi_id, cpuid);
+
+    pm_info = processor_pminfo[cpuid];
+    if ( !pm_info )
+    {
+        pm_info = xvzalloc(struct processor_pminfo);
+        if ( !pm_info )
+        {
+            ret = -ENOMEM;
+            goto out;
+        }
+        processor_pminfo[cpuid] = pm_info;
+    }
+    pm_info->acpi_id = acpi_id;
+    pm_info->id = cpuid;
+    pm_info->cppc_data = *cppc_data;
+
+    if ( cppc_data->flags & XEN_CPPC_PSD )
+        if ( !check_psd_pminfo(cppc_data->shared_type) )
+        {
+            ret = -EINVAL;
+            goto out;
+        }
+
+    if ( cppc_data->flags & XEN_CPPC_CPC )
+    {
+        if ( cppc_data->cpc.highest_perf == 0 ||
+             cppc_data->cpc.highest_perf > UINT8_MAX ||
+             cppc_data->cpc.nominal_perf == 0 ||
+             cppc_data->cpc.nominal_perf > UINT8_MAX ||
+             cppc_data->cpc.lowest_nonlinear_perf == 0 ||
+             cppc_data->cpc.lowest_nonlinear_perf > UINT8_MAX ||
+             cppc_data->cpc.lowest_perf == 0 ||
+             cppc_data->cpc.lowest_perf > UINT8_MAX ||
+             cppc_data->cpc.lowest_perf >
+                cppc_data->cpc.lowest_nonlinear_perf ||
+             cppc_data->cpc.lowest_nonlinear_perf >
+                cppc_data->cpc.nominal_perf ||
+             cppc_data->cpc.nominal_perf > cppc_data->cpc.highest_perf )
+            /*
+             * Right now, Xen doesn't actually use highest_perf/nominal_perf/
+             * lowest_nonlinear_perf/lowest_perf values read from ACPI _CPC
+             * table. Xen reads CPPC capability MSR to get these four values.
+             * So warning is enough.
+             */
+            printk_once(XENLOG_WARNING
+                        "Broken CPPC perf values: lowest(%u), nonlinear_lowest(%u), nominal(%u), highest(%u)\n",
+                        cppc_data->cpc.lowest_perf,
+                        cppc_data->cpc.lowest_nonlinear_perf,
+                        cppc_data->cpc.nominal_perf,
+                        cppc_data->cpc.highest_perf);
+
+        /* lowest_mhz and nominal_mhz are optional value */
+        if ( cppc_data->cpc.lowest_mhz > cppc_data->cpc.nominal_mhz )
+        {
+            printk_once(XENLOG_WARNING
+                        "Broken CPPC freq values: lowest(%u), nominal(%u)\n",
+                        cppc_data->cpc.lowest_mhz,
+                        cppc_data->cpc.nominal_mhz);
+            /* Re-set with zero values, instead of keeping invalid values */
+            pm_info->cppc_data.cpc.nominal_mhz = 0;
+            pm_info->cppc_data.cpc.lowest_mhz = 0;
+        }
+    }
+
+    if ( cppc_data->flags == (XEN_CPPC_PSD | XEN_CPPC_CPC) )
+    {
+        if ( cpufreq_verbose )
+        {
+            print_PSD(&pm_info->cppc_data.domain_info);
+            print_CPPC(&pm_info->cppc_data);
+        }
+
+        pm_info->init = XEN_CPPC_INIT;
+        ret = cpufreq_cpu_init(cpuid);
+        if ( ret )
+            printk_once(XENLOG_WARNING
+                        "CPU%u failed amd-cppc mode init; use \"cpufreq=xen\" instead",
+                        cpuid);
+    }
+
+ out:
+    return ret;
+}
+
 static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
 {
     if (usr_max_freq)
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index caa768626c..f80495fc96 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -5,7 +5,8 @@
 #include <public/sysctl.h>
 #include <xen/acpi.h>
 
-#define XEN_PX_INIT 0x80000000U
+#define XEN_CPPC_INIT 0x40000000U
+#define XEN_PX_INIT   0x80000000U
 
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
@@ -43,6 +44,7 @@ struct processor_pminfo {
     uint32_t acpi_id;
     uint32_t id;
     struct processor_performance    perf;
+    struct xen_processor_cppc cppc_data;
 
     uint32_t init;
 };
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 2725b8d104..9103315af6 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -363,6 +363,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PM_PX   1
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
+#define XEN_PM_CPPC 4
 
 /* Px sub info type */
 #define XEN_PX_PCT   1
@@ -370,6 +371,10 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PX_PPC   4
 #define XEN_PX_PSD   8
 
+/* CPPC sub info type */
+#define XEN_CPPC_PSD   1
+#define XEN_CPPC_CPC   2
+
 struct xen_power_register {
     uint32_t     space_id;
     uint32_t     bit_width;
@@ -457,6 +462,26 @@ struct xen_processor_performance {
 typedef struct xen_processor_performance xen_processor_performance_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
 
+struct xen_processor_cppc {
+    uint8_t flags; /* IN: XEN_CPPC_xxx */
+    uint8_t pad[3];
+    /*
+     * IN: Subset _CPC fields useful for CPPC-compatible cpufreq
+     * driver's initialization
+     */
+    struct {
+        uint32_t highest_perf;
+        uint32_t nominal_perf;
+        uint32_t lowest_nonlinear_perf;
+        uint32_t lowest_perf;
+        uint32_t lowest_mhz;
+        uint32_t nominal_mhz;
+    } cpc;
+    uint32_t shared_type; /* IN: XEN_CPUPERF_SHARED_TYPE_xxx */
+    struct xen_psd_package domain_info; /* IN: _PSD */
+};
+typedef struct xen_processor_cppc xen_processor_cppc_t;
+
 struct xenpf_set_processor_pminfo {
     /* IN variables */
     uint32_t id;    /* ACPI CPU ID */
@@ -465,6 +490,7 @@ struct xenpf_set_processor_pminfo {
         struct xen_processor_power          power;/* Cx: _CST/_CSD */
         struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
         XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
+        xen_processor_cppc_t                cppc_data; /* CPPC: _CPC and _PSD */
     } u;
 };
 typedef struct xenpf_set_processor_pminfo xenpf_set_processor_pminfo_t;
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 8350403e95..6096560d3c 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -7,12 +7,17 @@
 
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
+int set_cppc_pminfo(unsigned int acpi_id,
+                    const struct xen_processor_cppc *cppc_data);
 
 #ifdef CONFIG_COMPAT
 struct compat_processor_performance;
 int compat_set_px_pminfo(uint32_t acpi_id, struct compat_processor_performance *perf);
 struct compat_processor_power;
 long compat_set_cx_pminfo(uint32_t acpi_id, struct compat_processor_power *power);
+struct compat_processor_cppc;
+int compat_set_cppc_pminfo(unsigned int acpi_id,
+                           const struct compat_processor_cppc *cppc_data);
 #endif
 
 uint32_t pmstat_get_cx_nr(unsigned int cpu);
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 3c7b6c6830..ab2e207c77 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -162,6 +162,7 @@
 
 !	pct_register			platform.h
 !	power_register			platform.h
+!	processor_cppc			platform.h
 ?	processor_csd			platform.h
 !	processor_cx			platform.h
 !	processor_flags			platform.h
-- 
2.34.1


