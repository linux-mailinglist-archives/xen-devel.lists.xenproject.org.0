Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20DAA2A335
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882556.1292681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKG-0001C8-Lt; Thu, 06 Feb 2025 08:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882556.1292681; Thu, 06 Feb 2025 08:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKG-0001A7-IJ; Thu, 06 Feb 2025 08:33:32 +0000
Received: by outflank-mailman (input) for mailman id 882556;
 Thu, 06 Feb 2025 08:33:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKE-0000gq-Lb
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0989fe3a-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:29 +0100 (CET)
Received: from BN9PR03CA0989.namprd03.prod.outlook.com (2603:10b6:408:109::34)
 by DS0PR12MB8294.namprd12.prod.outlook.com (2603:10b6:8:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 08:33:24 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::c) by BN9PR03CA0989.outlook.office365.com
 (2603:10b6:408:109::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.23 via Frontend Transport; Thu,
 6 Feb 2025 08:33:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:23 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:20 -0600
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
X-Inumbo-ID: 0989fe3a-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LT9psR3+bkbNtqNdX0R1/IQAwjRx1SsqOMI26Gv6hCwBhGdYnDNsLKDrRxSgl6hXp8VEOzJGsI4DExTL1Scs3vxNAJuKln2jSVfZVwzjOYMcRSbyJRPcqnalYnBWeVFskkDcEE4OsYyTa9IIZgcSK3xdB6PqVdITkMZMZv8ClbBpusdvrRWWk41CBI+tUcB4TX5z+sNHwHFpkZ8bS5CySs4Ow8+sW8I9U3ToDqtwVVX5Pp4jiQtxIJ5tBfdDA+2XtERN5yrGrEhycaM6IpF6IJzmPyf53rv5ngDzKDkBCwRMXSeMVnWPSrkImp1gczu8b03nkcclM0y1SdQ8dhAb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSFfB8DLe+rI2uCiFMTVrwzcf8irApD+YKVZ6gAgZxQ=;
 b=XbKEGvzLtg/sZcUv1dxvacGk7Hg1LmTf5sdhzqyVIXGcib4sE20JKe3S7J4ugtJYsr+Moffzuevpa82PcXlchPeQSM25hjZAQH6w+UFRwwZfxDZIgFSsRr1kAMjd1p5pmUKNhHVg0xqqgDgBHaWUdurWEcpDS+YeOf3H5aHhRBRAq616PYpEJVM+yLsE1c1Z+PfFDalQbFyAQctiDx5gSdrm9Wqd51SJraFFU+dYfJ1Xa5T3bc0QWhuDob6a6eaiRkOBSGETgV7Qd/e2QyBq7c4AEUr52783lz9ACeRvP2M1DFfqp+HwcrGLQK/p0JVSfehPUNxyC/mVOz72IrWinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSFfB8DLe+rI2uCiFMTVrwzcf8irApD+YKVZ6gAgZxQ=;
 b=MfSmBNm9u8UfB3EX7PWLIvCYaMSWtF3oh0lZJW4hUA4czNVH9KqNX0yLkiKc/WalbLVURK49KqdHoY3w/7xJ9MueYYiMtxjr2C+Oyi2oWCYSMjYcoOhz9upGQNyPI6BQrPlyVILJwIJpU0NUHep9G3vsYlBgyAIzcW92kuM6uDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 02/11] xen/x86: introduce new sub-hypercall to propagate CPPC data
Date: Thu, 6 Feb 2025 16:32:46 +0800
Message-ID: <20250206083255.1296363-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|DS0PR12MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b7305a-0514-4307-5c83-08dd4688eb76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GxsuGYnll2dHo4/TJ4PGggtTtpZXE1YapS3vGe5SKcBR08Pn9HEg9AzuJWya?=
 =?us-ascii?Q?5etk99RnLZovDBUenpnsfn22HH02hOVFZsHW8ANNwWcD+c8zQXoaY/5/FFya?=
 =?us-ascii?Q?TrdRlsSQL/rbZoRdfEvbByYESqSFZbOIk/gbYnXUrWHUBsmCdre4bkHbGOn6?=
 =?us-ascii?Q?ynka60sFXRXaG9Sb0sB+yxjm2tolljaxvtm2wZFAf9YANjv7e3NUHXaT5n/G?=
 =?us-ascii?Q?ypBiVCg0nbGuRMqOq0VEnrb49b4Ov15hhc99OkXhUU09mqdLoUE0oSpzV38S?=
 =?us-ascii?Q?oWTG2a0SJHZk9IBbdPQoFxxxBbgF9HIKXAXKGJaLNnmuK0oLUSvaeciKJj8O?=
 =?us-ascii?Q?h7yj1/ZmVlrORaDLuJllnfbJLmtCxSJB1yHJmOyOJifC0lAGpDnWbzUArvwh?=
 =?us-ascii?Q?2RSpgffk1oO4hzXZS+TAq8f4AaeQ93jFk5cL/TfS/lVcKyvilyp362YgFIti?=
 =?us-ascii?Q?MJWE+MNyuYy+VUbLz38S/d5W8lRwakWPTsH/IxhMFTd8MudPzn76xOQbkiy6?=
 =?us-ascii?Q?cm2LC54rPQj5W0hTePjhbPQxDrNjzdMqc4DoZdOvfiHtBCBtJUHXO7ZwMIHy?=
 =?us-ascii?Q?mLK7lvSn9fcb2+SL/gZKzpDMqDRMjXwP+b+cAVJszsLNq4UzhmIDskC4gor2?=
 =?us-ascii?Q?m70SK5BaFCcte5XVVp8PlEr9f63qANjGQeSEkqGdgBdpxymIvKywec40G+S4?=
 =?us-ascii?Q?QrND0OlZwn3b/33SDFLqYQJU9h9xsiL9a7Fw7OT3AeahnTI1dA5lUedCLM/N?=
 =?us-ascii?Q?PMY1Y849PnpYBfdDGjLBCylLGQUG6/+vQZfBduKYYxv25Drulm6/C3AucTmp?=
 =?us-ascii?Q?GFbmHNQ0C+zGZE7S02eKSQe62fFaXQKy00Q1CqDfMNjfjkcmgB3vTn01WkwJ?=
 =?us-ascii?Q?rY6CUhuws31O7JVwOB2mLZGIaO1RYJNn9r120s9Sp8aB5Em14TFQthQHh6gl?=
 =?us-ascii?Q?hiRQ0Gn26LaV6kwwV4/QvZ4X1DkM0z9setb6PfE4YrY5t7U7GTymJcadyKTf?=
 =?us-ascii?Q?5bdy34Q4hxqkJ5aoy+lVhlqgZf6wNKLlYHbOOMhieR74lAX6bvCdP3DUmAPZ?=
 =?us-ascii?Q?WZf/3j4YWoJ2OqxVeW9G1XijUWOQxIsjlExtBk2MGHtOyWuleDLEAuMPK2T+?=
 =?us-ascii?Q?fe3A7jFZW48El1PotMipyl6es5r8mlnf2NDL9oNgoz3Or41AmeEN06azzsi1?=
 =?us-ascii?Q?+WO0sITNklmGH6duG+cNPowt3SrapyUCScGWDdiErtUl0glubMR0bozBc0Fq?=
 =?us-ascii?Q?eMJr1bRnwBvssRmaLZmY7Dn72YKh8SUz1FyGR/OrmuNr5a7Xwx5vIoa6DZEN?=
 =?us-ascii?Q?xsy0H24JaGhIMQuMiB9JRNi9gtgpJ+lfzkryutRdHP1OrMLFyhHmZXJ6uxzw?=
 =?us-ascii?Q?JhCM4j1p8FDYak+fAo06HLZbFCyFCGkZZJCl0mQqdPtMwmsW9CcZBeRfEFyL?=
 =?us-ascii?Q?uW+conbK+a6kFx88Ml3T4gGyCgUZRffjQSumNyqYVwt6Zbx4lZPhUpGxWlnB?=
 =?us-ascii?Q?3a28hK1JBFXA5lU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:23.5596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b7305a-0514-4307-5c83-08dd4688eb76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8294

In order to provide backward compatibility with existing governors
that represent performance as frequencies, like ondemand, the _CPC
table can optionally provide processor frequency range values, Lowest
frequency and Norminal frequency, to let OS use Lowest Frequency/
Performance and Nominal Frequency/Performance as anchor points to
create linear mapping of CPPC abstract performance to CPU frequency.

As Xen is uncapable of parsing the ACPI dynamic table, this commit
introduces a new sub-hypercall to propagate required CPPC data from
dom0 kernel.

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
 xen/arch/x86/platform_hypercall.c         |  4 ++
 xen/arch/x86/x86_64/cpufreq.c             |  2 +
 xen/drivers/cpufreq/cpufreq.c             | 48 +++++++++++++++++++++++
 xen/include/acpi/cpufreq/processor_perf.h |  1 +
 xen/include/public/platform.h             | 16 ++++++++
 xen/include/xen/pmstat.h                  |  1 +
 xen/include/xlat.lst                      |  1 +
 7 files changed, 73 insertions(+)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 67f851237d..735c71b0e7 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -572,6 +572,10 @@ ret_t do_platform_op(
             break;
         }
 
+        case XEN_PM_CPPC:
+            ret = set_cppc_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.cppc_data);
+            break;
+
         default:
             ret = -EINVAL;
             break;
diff --git a/xen/arch/x86/x86_64/cpufreq.c b/xen/arch/x86/x86_64/cpufreq.c
index e4f3d5b436..aa72037401 100644
--- a/xen/arch/x86/x86_64/cpufreq.c
+++ b/xen/arch/x86/x86_64/cpufreq.c
@@ -26,6 +26,8 @@
 #include <xen/pmstat.h>
 #include <compat/platform.h>
 
+CHECK_processor_cppc;
+
 CHECK_processor_px;
 
 DEFINE_XEN_GUEST_HANDLE(compat_processor_px_t);
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 4a103c6de9..f5e8bfa09e 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -40,6 +40,7 @@
 #include <xen/domain.h>
 #include <xen/cpu.h>
 #include <xen/pmstat.h>
+#include <xen/xvmalloc.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
@@ -458,6 +459,53 @@ static void print_PPC(unsigned int platform_limit)
     printk("\t_PPC: %d\n", platform_limit);
 }
 
+static void print_CPPC(const struct xen_processor_cppc *cppc_data)
+{
+    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
+           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
+           "nominal_freq=%uMhz, lowest_freq=%uMhz\n",
+           cppc_data->highest_perf, cppc_data->lowest_perf,
+           cppc_data->nominal_perf, cppc_data->lowest_nonlinear_perf,
+           cppc_data->nominal_freq, cppc_data->lowest_freq);
+}
+
+int set_cppc_pminfo(uint32_t acpi_id, const struct xen_processor_cppc *cppc_data)
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
+    if ( cpufreq_verbose )
+        printk("Set CPU acpi_id(%d) cpuid(%d) CPPC State info:\n",
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
+    if ( cpufreq_verbose )
+        print_CPPC(&pm_info->cppc_data);
+
+ out:
+    return ret;
+}
+
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 {
     int ret = 0, cpu;
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 301104e16f..cfa0fed647 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -37,6 +37,7 @@ struct processor_pminfo {
     uint32_t acpi_id;
     uint32_t id;
     struct processor_performance    perf;
+    struct xen_processor_cppc cppc_data;
 };
 
 extern struct processor_pminfo *processor_pminfo[NR_CPUS];
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 2725b8d104..b8daa8fc42 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -363,6 +363,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PM_PX   1
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
+#define XEN_PM_CPPC 4
 
 /* Px sub info type */
 #define XEN_PX_PCT   1
@@ -432,6 +433,20 @@ struct xen_processor_px {
 typedef struct xen_processor_px xen_processor_px_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_px_t);
 
+/*
+ * Subset _CPC fields useful for CPPC-compatible cpufreq
+ * driver's initialization
+ */
+struct xen_processor_cppc {
+    uint32_t highest_perf;
+    uint32_t nominal_perf;
+    uint32_t lowest_nonlinear_perf;
+    uint32_t lowest_perf;
+    uint32_t lowest_freq;
+    uint32_t nominal_freq;
+};
+typedef struct xen_processor_cppc xen_processor_cppc_t;
+
 struct xen_psd_package {
     uint64_t num_entries;
     uint64_t revision;
@@ -465,6 +480,7 @@ struct xenpf_set_processor_pminfo {
         struct xen_processor_power          power;/* Cx: _CST/_CSD */
         struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
         XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
+        xen_processor_cppc_t                cppc_data; /*_CPC */
     } u;
 };
 typedef struct xenpf_set_processor_pminfo xenpf_set_processor_pminfo_t;
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 8350403e95..d2fe74ef0b 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -5,6 +5,7 @@
 #include <public/platform.h> /* for struct xen_processor_power */
 #include <public/sysctl.h>   /* for struct pm_cx_stat */
 
+int set_cppc_pminfo(uint32_t cpu, const struct xen_processor_cppc *cppc_data);
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 3c7b6c6830..20201c1667 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -162,6 +162,7 @@
 
 !	pct_register			platform.h
 !	power_register			platform.h
+?	processor_cppc			platform.h
 ?	processor_csd			platform.h
 !	processor_cx			platform.h
 !	processor_flags			platform.h
-- 
2.34.1


