Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0BAC4AA2
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997945.1378759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzz-0003Vk-Hn; Tue, 27 May 2025 08:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997945.1378759; Tue, 27 May 2025 08:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzz-0003Mc-CE; Tue, 27 May 2025 08:49:27 +0000
Received: by outflank-mailman (input) for mailman id 997945;
 Tue, 27 May 2025 08:49:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJpzy-0002ks-3d
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a2f0480-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:20 +0200 (CEST)
Received: from MW4PR04CA0172.namprd04.prod.outlook.com (2603:10b6:303:85::27)
 by MW6PR12MB8867.namprd12.prod.outlook.com (2603:10b6:303:249::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 08:49:18 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::7a) by MW4PR04CA0172.outlook.office365.com
 (2603:10b6:303:85::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 27 May 2025 08:49:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:18 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:14 -0500
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
X-Inumbo-ID: 7a2f0480-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BK/v4no0pxDIAg1xZeHEzqp6jGARdlUNRlbr1oKnRnBpuAxZAVa/qKpln88Zw8MDPfzlCc1h02yaDs8ZF01rDKLSdC6k10eA0393d1UnC0G5Vled3sgfEZQcbm7WTwHgNhYxio6yogHN7slQtfukWH62k1VgF+WQTc2wPfgESNHr0hiByxdIw5hSg29y2sBMgRp/bt7yuhEsP9K+q4FhDlX7ubW+Gandj03g8Gm7+NJGbkRH7mAifGFp1NVKzhOvlAquTu9giJ1GI3dGXCG+YD3ZPaMiqYBMVEh57eOfzrlkBXHv28u+87pgH+AveK4PvxIWqVuCD8OCfhVGqXzqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPo1OVjRKmEYvcsDmuocigHTLx4OfLHa+FzOOo/dHs4=;
 b=OdOjmHS68nJ+xtTqRd2vgj3M61kXKpO0bfFY5Qke7bKvDTR27YVbODonMm6wY4vowdi/zKfCmFUkTmTMrHTg4dVDJDwHMOgGfrhkn3fPDQS3MGzuTA26n6rpE3MI+aQPGL85I6t2PAagwbUjVd3kC/lpRpLzwXrm67c8cXJ7aCsI7JyeJFJQDarCyJARMl8D255i+9f3CRB6oSrrwlwXU27zvOzqb0/W543tWp7TxTKBREOU86kEN3k753egJLuz0fRcJRrgqe+HUImvKUASZDCFFkdwJPKPR1vbODL2kB68o6TCPb4KZXLraIspMo8Lpmy6CDRoQ/kt4HA0UoG1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPo1OVjRKmEYvcsDmuocigHTLx4OfLHa+FzOOo/dHs4=;
 b=F1YOfno3r7ZPa1eCmwWqH26SVthXqzp5TCWWcGmZZl2KO2KnqXibWr66aReEQ3kwJ8z654ns8M/aJ7k6EzDI+eNQOT392JnRQCNIc4mJPOKm99n9G1/w4aQCkLA4H4a2dMcxL42Wp8ZTBXMzc1lpGocjt9pDxXD2Bg2t12GfPLc=
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
Subject: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
Date: Tue, 27 May 2025 16:48:19 +0800
Message-ID: <20250527084833.338427-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f462b3d-7960-4e39-c4f0-08dd9cfb5de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hlp5v/MTcFRpei0U8ECjawVR3ADYLqsJ/Oo1RhBr7oji48nPXwnEc2rl59Gz?=
 =?us-ascii?Q?IKAfwpdqLTStWj3pbl7BBLr73Cb89iXeLnjcd+d5sgFJp7M/W9faN/8qgq2J?=
 =?us-ascii?Q?pPQdQeSw2FhpNoqdp97EvLbjl/iOw+OTb1v5XMZ3ImjLyHL+1gwFLNe3k2Xr?=
 =?us-ascii?Q?bQgQ9A6n8KHw4x93J8nu2atL4j3Ma6X/vTfQzbgIwxGLrRmpqRNkiIxVYa0V?=
 =?us-ascii?Q?Ei9GgU3kzxmw4tLgRxSkl0lvHbdsc+NTquNLJTsvWeU75dSd6Yv9T0UFxryh?=
 =?us-ascii?Q?tpz4/XfUnicWwsuz9/EBVcYdHr3Qmualuep9TL+PuyM736A62ZmQqKIZDEN0?=
 =?us-ascii?Q?QGK0gi8rYXr5sX9UkY7hBpptFW3eagmGq5YTtrSf97q3gNzocY54V6gfJofl?=
 =?us-ascii?Q?3ntGPpDnzgXQf2R841f2hirANxMomnmPsPPqjz36pLK8hflDpD53vTRDQenT?=
 =?us-ascii?Q?54wY+suRO5pgXRHzh04EQCKgrtE1Anaph++1szi2UBqk6ArLvbJWl+Rjwp+5?=
 =?us-ascii?Q?u1Jp7BXD7jcKq0GIP07zHNLD+EOmB/py3lcKT4ouGbIe6gUEkoMHfntTo1BR?=
 =?us-ascii?Q?5B9j9RKH7RRIvaDqpGNQoBbEpyIHsuE+m6WFla5cIfIse5JAR9oiwIHNm/W2?=
 =?us-ascii?Q?RK7HGBJsFTma00B7o0KIHxLOMDXV+2EAq73FxS9VgeRCQlbjWvPs17nYhPTp?=
 =?us-ascii?Q?0Eapgh+qLV4JMeinH661qv/cUMNG6ZumNZd2ygJ7RGQQA0VhsFn7Oem7ldy2?=
 =?us-ascii?Q?BbLS/N7ieXE7ZBhIWO+TBNYmXQoVqQdgipYPaR9AWfnXGRYXlxLhWIc5V7Iu?=
 =?us-ascii?Q?3cJpyN/JWxjt0z/FAMF37CNoQ4DgyZK81LHAaRY1SBbwAtAIQLHKe4ougTpb?=
 =?us-ascii?Q?mobk6+eysy74rbb1kByQ+mO60epa8FW8BbAwqEUzloF+0Os+Jp9vqxCfb/qd?=
 =?us-ascii?Q?sF0qQYDjuoydtoqRTWH1HtCiByAu+2YPJ+sEb9KTqC020/3PMUlZnP3n8j9A?=
 =?us-ascii?Q?y4dgnHOBmuBgBqt5DDoCCqIo1ETCrpVOuBf6m4NGSlTxoPOtk4h8X5yrtIZq?=
 =?us-ascii?Q?dKgYUYVn3EsyMvFW/kaNNL4D5r9AHrqRIvPr3/R396cdMYQ0tGrTf06wD5Xu?=
 =?us-ascii?Q?K71buSQNnTJd2b6OnsedFUv5AxpVNRzCMGgyhYyTQkp8PE/oIiz+TzoGwQlm?=
 =?us-ascii?Q?mcQDq3YWHjPDUHJlHPrAxnXlHBZP4BJvCjGeRBmNy3gL//K2uQVrthYdtXCf?=
 =?us-ascii?Q?CBljRecCkAU1aQnf7+R6PgkneZ6FjR877lV7H2/M+EXkGWtIVtLdppEtzKss?=
 =?us-ascii?Q?OaUcgEmW8VC29Krg02bFL80u7MV+CBhswNmfZTl8MtoKJfp9XbRPAl6EahTv?=
 =?us-ascii?Q?PDkitABnkUN/bzQ/JEsDKOemY/PKrgRy4+gkwLa99HCsoBGjLqZj1K/wI/1b?=
 =?us-ascii?Q?ULKoxio7zk5Im1fRIjAMsb9ES8WIdz69nr2ZNXLoSLO1OHvt1xnZ3DSTTKZY?=
 =?us-ascii?Q?JsY2lJLfhB89h+85xf2Cbx1Q4VOCllbdeFJs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:18.0951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f462b3d-7960-4e39-c4f0-08dd9cfb5de0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867

In order to provide backward compatibility with existing governors
that represent performance as frequency, like ondemand, the _CPC
table can optionally provide processor frequency range values, Lowest
frequency and Nominal frequency, to let OS use Lowest Frequency/
Performance and Nominal Frequency/Performance as anchor points to
create linear mapping of CPU frequency to CPPC performance.

As Xen is uncapable of parsing the ACPI dynamic table, we'd like to
introduce a new sub-hypercall "XEN_PM_CPPC" to propagate required CPPC
data from dom0 kernel to Xen.
In the according handler set_cppc_pminfo(), we do _CPC and _PSD
sanitization check, as both _PSD and _CPC info are necessary for correctly
initializing cpufreq cores in CPPC mode.
Users shall be warned that if we failed at this point,
no fallback scheme, like legacy P-state could be switched to.

A new flag "XEN_CPPC_INIT" is also introduced to differentiate cpufreq core
initialised in Px mode. Then all .init flag checking shall be updated to
consider "XEN_CPPC_INIT" too.

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
 xen/arch/x86/platform_hypercall.c         |   5 +
 xen/arch/x86/x86_64/cpufreq.c             |  19 ++++
 xen/arch/x86/x86_64/platform_hypercall.c  |   3 +
 xen/drivers/acpi/pmstat.c                 |   4 +-
 xen/drivers/cpufreq/cpufreq.c             | 128 +++++++++++++++++++++-
 xen/include/acpi/cpufreq/processor_perf.h |   4 +-
 xen/include/public/platform.h             |  30 +++++
 xen/include/xen/pmstat.h                  |   5 +
 xen/include/xlat.lst                      |   1 +
 9 files changed, 194 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 90abd3197f..49717e9ca9 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -572,6 +572,11 @@ ret_t do_platform_op(
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
 
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 6a1a900f78..f7351f219d 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -201,7 +201,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     pmpt = processor_pminfo[op->cpuid];
     policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
 
-    if ( !pmpt || !pmpt->perf.states ||
+    if ( !pmpt || ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
          !policy || !policy->governor )
         return -EINVAL;
 
@@ -466,7 +466,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     case CPUFREQ_PARA:
         if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
             return -ENODEV;
-        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
         break;
     }
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 9567221d97..d6b6c844d8 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -40,6 +40,7 @@
 #include <xen/domain.h>
 #include <xen/cpu.h>
 #include <xen/pmstat.h>
+#include <xen/xvmalloc.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
@@ -203,6 +204,11 @@ static int get_psd_info(unsigned int cpu, uint32_t *shared_type,
         *domain_info_ptr = &processor_pminfo[cpu]->perf.domain_info;
         break;
 
+    case XEN_CPPC_INIT:
+        *shared_type = processor_pminfo[cpu]->cppc_data.shared_type;
+        *domain_info_ptr = &processor_pminfo[cpu]->cppc_data.domain_info;
+        break;
+
     default:
         ret = -EINVAL;
         break;
@@ -229,7 +235,7 @@ int cpufreq_add_cpu(unsigned int cpu)
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!cpufreq_driver.init)
@@ -409,7 +415,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
@@ -635,6 +641,124 @@ out:
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
+    if ( cpuid < 0 || !cppc_data )
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
+    {
+        ret = check_psd_pminfo(cppc_data->shared_type);
+        if ( ret )
+            goto out;
+    }
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
+                cppc_data->cpc.nominal_perf ||
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
+#ifndef NDEBUG
+        if ( ret )
+            dprintk(XENLOG_WARNING,
+                    "CPU %u failed to be initialized with amd-cppc mode, and users could only reboot and re-define cmdline with \"cpufreq=xen\"",
+                    cpuid);
+#endif
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
index 5f2612b15a..f1f4f3138d 100644
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
@@ -35,6 +36,7 @@ struct processor_pminfo {
     uint32_t acpi_id;
     uint32_t id;
     struct processor_performance    perf;
+    struct xen_processor_cppc cppc_data;
 
     uint32_t init;
 };
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 2725b8d104..0bf7543fff 100644
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
@@ -457,6 +462,30 @@ struct xen_processor_performance {
 typedef struct xen_processor_performance xen_processor_performance_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
 
+struct xen_processor_cppc {
+    uint8_t flags; /* flag for CPPC sub info type */
+    uint8_t pad[3]; /* padding and must be zero */
+    /*
+     * Subset _CPC fields useful for CPPC-compatible cpufreq
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
+    /* Coordination type of this processor */
+#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
+#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
+#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
+    uint32_t shared_type;
+    struct xen_psd_package domain_info; /* _PSD */
+};
+typedef struct xen_processor_cppc xen_processor_cppc_t;
+
 struct xenpf_set_processor_pminfo {
     /* IN variables */
     uint32_t id;    /* ACPI CPU ID */
@@ -465,6 +494,7 @@ struct xenpf_set_processor_pminfo {
         struct xen_processor_power          power;/* Cx: _CST/_CSD */
         struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
         XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
+        xen_processor_cppc_t                cppc_data; /* _CPC and _PSD */
     } u;
 };
 typedef struct xenpf_set_processor_pminfo xenpf_set_processor_pminfo_t;
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 8350403e95..1f21f43a13 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -7,8 +7,13 @@
 
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
+int set_cppc_pminfo(unsigned int acpi_id,
+                    const struct xen_processor_cppc *cppc_data);
 
 #ifdef CONFIG_COMPAT
+struct compat_processor_cppc;
+int compat_set_cppc_pminfo(unsigned int acpi_id,
+                           const struct compat_processor_cppc *cppc_data);
 struct compat_processor_performance;
 int compat_set_px_pminfo(uint32_t acpi_id, struct compat_processor_performance *perf);
 struct compat_processor_power;
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 3c7b6c6830..a800671f2f 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -168,6 +168,7 @@
 !	processor_performance		platform.h
 !	processor_power			platform.h
 ?	processor_px			platform.h
+!	processor_cppc			platform.h
 !	psd_package			platform.h
 ?	xenpf_enter_acpi_sleep		platform.h
 ?	xenpf_pcpu_version		platform.h
-- 
2.34.1


