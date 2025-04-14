Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F211A87929
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949117.1345774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERn-0000qh-Fz; Mon, 14 Apr 2025 07:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949117.1345774; Mon, 14 Apr 2025 07:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERn-0000mr-Ab; Mon, 14 Apr 2025 07:41:39 +0000
Received: by outflank-mailman (input) for mailman id 949117;
 Mon, 14 Apr 2025 07:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERl-0000Ks-LO
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2416::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4580ce1-1903-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 09:41:35 +0200 (CEST)
Received: from CH2PR10CA0013.namprd10.prod.outlook.com (2603:10b6:610:4c::23)
 by CYYPR12MB8704.namprd12.prod.outlook.com (2603:10b6:930:c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 07:41:28 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::d) by CH2PR10CA0013.outlook.office365.com
 (2603:10b6:610:4c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 07:41:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:27 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:24 -0500
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
X-Inumbo-ID: e4580ce1-1903-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFlZlhZprM1FY2qlJX2DYIkz+ARYVuqIhRA3gvJHUqCHlR63AuWAVcZZA2BJZR4z74B9bRNbgjmIa0Lzu1S23OyQTJmuM3cUz0Il4bfyu01UahT1KkBIex4RVX20gQKWwauRzFRAlScHdZmo9XUjWyishuSar7vCtllkrdBR/x7gjwmryJlLnsVuukw1CtVEjKPP1RgfXUsptxpVtHMpLmq0wonI6M5h2DkRF5U85PjUVPcOkabt6zfgs9kyA+ggg7Z3+dhRbuvv1G+Z6Nd91rScKDN02qVgK0ixHdF3HDBM1LBqQ9b9VNAFDv1TvJwoWpe1unJyT2rGdupowMkQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfLY8s12oXwYZ9l7lkukc3hjJrdYxuzMXvdGTEfnmj4=;
 b=mbdk+/FJPeE5Crd3cN8UpE8pckSK+scI0wYKCBrud5yEOtdJhRLkLyXvjnG2i0DKesYc6cb2FXYo6WZwYrixG/IRoVoGKeCrtQq/39fgyvT7HJtzC3AUj89TilLff6J9LFBbFghHXZyOVnBSMyxYnhoSRdtdaI7t/J/VKZTm0DU58CGcZr5VEeb87esS3RQOjnsPj3qfOk245ld857xkrsM376S4pIqB3bQrIp6JL0TZ0isaLdYgBrqjyFrfhLxc4n5dnteblKsGi2WaNnEOsgAseMoCQZRLFY5lCEi28PAiKhj9aGiQMbMTeTJxA9A/piUHHgtxIbutZCLU35VPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfLY8s12oXwYZ9l7lkukc3hjJrdYxuzMXvdGTEfnmj4=;
 b=S4W0zSGF3pi+OqOiV7sl8hUt9ppiwOqR6OaY+SecoUZzDEvZqIbx+3lHkuIx16Q6baFbImPgIFOfNGWyY7zEV/0G/5a7pzjXhZihcHY1Yn2Pi5yVeRxs//zDFga4Yn8qINf5H4lSARDyKUeU/uBWgr9l300Q99yAnvM7U5sDF5A=
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
Subject: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to propagate CPPC data
Date: Mon, 14 Apr 2025 15:40:44 +0800
Message-ID: <20250414074056.3696888-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|CYYPR12MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d7ceb0-480e-4721-f5cc-08dd7b27c403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k2W6+VcQ6YnDiZ2msdjIGkV0Wn1BTpp0ooA47FoC7//3nBRdjScEsL0YO4O9?=
 =?us-ascii?Q?oGSJiZsSAzSRSpZf84hXeuBODkGzqRJC4tkX9arzkzstY1MJm0uAbfDNRx+j?=
 =?us-ascii?Q?FJ4y/GLDVIfruRhlXJ5rHWLG6k1EQu5R/9+vaFbEkKiJLKl/9KAj5R4Sc9H2?=
 =?us-ascii?Q?HF3CxJY4Fj8HoKGtf+rM1xdgBvEDvXbmh4pz7W79+j7DbHPrQe+B597XZnio?=
 =?us-ascii?Q?XueuJnsCayl/BqWeFjQJF0H3h2nahamFPfl0F8aiyeCAx5LNtftRByb/Msh2?=
 =?us-ascii?Q?DWwzl6bgoS04KpZD0G+sRURkjui7O6WlSAtc5VEv92kymZJQ/ytbXHnd+8qL?=
 =?us-ascii?Q?gFjuvvs1Nbj0mjo/UUvi0M7YuL1uFkHJ2jPLn0E1wIs5cDNZycpa4ZgwQjH+?=
 =?us-ascii?Q?QuB8D0CyFCGbnjaEAASOyubCOplifxKYjbVnWc/yFkB/PcUWS/RcoFcH2224?=
 =?us-ascii?Q?XVdB4AYTKroTfnGyB2U7Y7tj9XSNqRlF3KmeYa26kNM0Q9I7n9Kl8cvrxS85?=
 =?us-ascii?Q?QzCKmlCzgkHBhlbWfiszt4ob/jChBHKvJ4wD8PFy7PfClAA8RKd2H76x0tlk?=
 =?us-ascii?Q?L9Ra4k3LEN30/dvQG4lAOaQq1jdeo//GKjWf2rk5A9vc8AM3+oljuK1LHeSt?=
 =?us-ascii?Q?499Q93vQw4ssumDKZWrACFT8NF+1D+j5Cau2U7jjhpioMYVInnUuxX4jLDX1?=
 =?us-ascii?Q?IkK79xQHr0I8raXroIuXyw306Nn/UoKGKMlNJI+pO4wle6jSALUrR1Glb8ha?=
 =?us-ascii?Q?OLHHC2kMw/QJx/dG7S5FHD2LWhRYOrrcBTztQvGj421hUwaQGcmdSxvN4YWv?=
 =?us-ascii?Q?hdSVuqx3GG4o1CaNfda8xSOSjJjUWw5N1rvRh/Jgq8PmThZLF7a3a4ZkS10A?=
 =?us-ascii?Q?5/NtcMYk+nbe00+qATZwwPLKR/wwz6oEPqlh4nTRgOA71J9qevspHweUV+7v?=
 =?us-ascii?Q?kiktZV2Sf25+8gcMHmf4a5ATmB2OgZy5wjTCgibYgosQZlEb+Lz2By1XDhyj?=
 =?us-ascii?Q?Omie8ILoHuvCI0gFj12dAb8Cgm6KsFJqPGKJmEBP5ivqraS8YzsDGAG0E4Jc?=
 =?us-ascii?Q?724ZiRR3+AC8NLZCHxb9w1wfKMf9z2t0qHz7ls2PTCieZ2b0VOhSdLCxLJXD?=
 =?us-ascii?Q?yDBH/LaNEYE5P5PAVuTuuor/LvoqiYeJ5paeC+PKikMZKa09zQXOi8Zi8A+N?=
 =?us-ascii?Q?TRvdL2hjojbETvyYv7HrlWcmplV2OC7eHtV1+eH8TdZWQtIKYDQYGCoO8K8n?=
 =?us-ascii?Q?m96jhm7aXVlzfdWMdgl5ypiBYWtYlluSgAgkCbVjUqi42KIZffb3l0i7NO4L?=
 =?us-ascii?Q?t3YqWMnzFwekkrgyWuRxp11UAGImmgLMLqMEngFhGJAWXQBQJIELdyqcKNF6?=
 =?us-ascii?Q?QjteCgDxEGXtiZLrd8WpoaIwBOmJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:27.8388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d7ceb0-480e-4721-f5cc-08dd7b27c403
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8704

In order to provide backward compatibility with existing governors
that represent performance as frequency, like ondemand, the _CPC
table can optionally provide processor frequency range values, Lowest
frequency and Norminal frequency, to let OS use Lowest Frequency/
Performance and Nominal Frequency/Performance as anchor points to
create linear mapping of CPPC abstract performance to CPU frequency.

As Xen is uncapable of parsing the ACPI dynamic table, we'd like to
introduce a new sub-hypercall "XEN_PM_CPPC" to propagate required CPPC
data from dom0 kernel to Xen.
In the according handler set_cppc_pminfo(), we do _CPC and _PSD
sanitization check, as both _PSD and _CPC info are necessary for correctly
initializing cpufreq cores in CPPC mode.
Users shall be warned that if we failed at this point,
no fallback scheme, like legacy P-state could be switched to.
A new flag "XEN_CPPC_INIT" is also introduced to differentiate cpufreq core
initialised in Px mode.

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
 xen/arch/x86/platform_hypercall.c         |   5 +
 xen/drivers/cpufreq/cpufreq.c             | 131 ++++++++++++++++++++--
 xen/include/acpi/cpufreq/processor_perf.h |   4 +-
 xen/include/public/platform.h             |  26 +++++
 xen/include/xen/pmstat.h                  |   2 +
 xen/include/xlat.lst                      |   1 +
 6 files changed, 161 insertions(+), 8 deletions(-)

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
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index b020ccbcf7..e01acc0c2d 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -40,6 +40,7 @@
 #include <xen/domain.h>
 #include <xen/cpu.h>
 #include <xen/pmstat.h>
+#include <xen/xvmalloc.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
@@ -205,6 +206,12 @@ static int get_psd_info(uint32_t init, unsigned int cpu,
         if ( domain_info )
             *domain_info = processor_pminfo[cpu]->perf.domain_info;
         break;
+    case XEN_CPPC_INIT:
+        if ( shared_type )
+            *shared_type = processor_pminfo[cpu]->cppc_data.shared_type;
+        if ( domain_info )
+            *domain_info = processor_pminfo[cpu]->cppc_data.domain_info;
+        break;
     default:
         ret = -EINVAL;
         break;
@@ -230,7 +237,7 @@ int cpufreq_add_cpu(unsigned int cpu)
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!cpufreq_driver.init)
@@ -401,7 +408,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
@@ -497,12 +504,19 @@ static void print_PPC(unsigned int platform_limit)
     printk("\t_PPC: %d\n", platform_limit);
 }
 
-static int check_psd_pminfo(const struct xen_processor_performance *perf)
+static int check_psd_pminfo(const struct xen_processor_performance *perf,
+                            const struct xen_processor_cppc *cppc_data)
 {
+    uint32_t shared_type;
+
+    if ( !perf && !cppc_data )
+        return -EINVAL;
+
+    shared_type = perf ? perf->shared_type : cppc_data->shared_type;
     /* check domain coordination */
-    if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
-         perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
-         perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
+    if ( shared_type != CPUFREQ_SHARED_TYPE_ALL &&
+         shared_type != CPUFREQ_SHARED_TYPE_ANY &&
+         shared_type != CPUFREQ_SHARED_TYPE_HW )
         return -EINVAL;
 
     return 0;
@@ -589,7 +603,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 
     if ( perf->flags & XEN_PX_PSD )
     {
-        ret = check_psd_pminfo(perf);
+        ret = check_psd_pminfo(perf, NULL);
         if ( ret )
             goto out;
 
@@ -627,6 +641,109 @@ out:
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
+
+    if ( cppc_data->flags & XEN_CPPC_PSD )
+    {
+        ret = check_psd_pminfo(NULL, cppc_data);
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
+                cppc_data->cpc.lowest_nonlinear_perf ||
+             cppc_data->cpc.lowest_nonlinear_perf >
+                cppc_data->cpc.nominal_perf ||
+             cppc_data->cpc.nominal_perf > cppc_data->cpc.highest_perf )
+            /*
+             * Right now, Xen doesn't actually use perf values
+             * in ACPI _CPC table, warning is enough.
+             */
+            printk(XENLOG_WARNING
+                   "Broken CPPC perf values: lowest(%u), nonlinear_lowest(%u), nominal(%u), highest(%u)\n",
+                   cppc_data->cpc.lowest_perf,
+                   cppc_data->cpc.lowest_nonlinear_perf,
+                   cppc_data->cpc.nominal_perf,
+                   cppc_data->cpc.highest_perf);
+
+        /* lowest_mhz and nominal_mhz are optional value */
+        if ( (cppc_data->cpc.lowest_mhz && cppc_data->cpc.nominal_mhz) &&
+             cppc_data->cpc.lowest_mhz > cppc_data->cpc.nominal_mhz )
+            printk(XENLOG_WARNING
+                   "Broken CPPC freq values: lowest(%u), nominal(%u)\n",
+                   cppc_data->cpc.lowest_mhz,
+                   cppc_data->cpc.nominal_mhz);
+    }
+
+    if ( cppc_data->flags == (XEN_CPPC_PSD | XEN_CPPC_CPC) )
+    {
+        pm_info->cppc_data = *cppc_data;
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
+            printk(XENLOG_WARNING "No fallback scheme could be replaced now");
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
index 67cf5eeabd..0e18a86ab4 100644
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
@@ -459,6 +464,26 @@ struct xen_processor_performance {
 typedef struct xen_processor_performance xen_processor_performance_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
 
+struct xen_processor_cppc {
+    uint8_t flags; /* flag for CPPC sub info type */
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
+    struct xen_psd_package domain_info; /* _PSD */
+    /* Coordination type of this processor */
+    uint32_t shared_type;
+};
+typedef struct xen_processor_cppc xen_processor_cppc_t;
+
 struct xenpf_set_processor_pminfo {
     /* IN variables */
     uint32_t id;    /* ACPI CPU ID */
@@ -467,6 +492,7 @@ struct xenpf_set_processor_pminfo {
         struct xen_processor_power          power;/* Cx: _CST/_CSD */
         struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
         XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
+        xen_processor_cppc_t                cppc_data; /* _CPC and _PSD */
     } u;
 };
 typedef struct xenpf_set_processor_pminfo xenpf_set_processor_pminfo_t;
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 8350403e95..f30286d48e 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -7,6 +7,8 @@
 
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
+int set_cppc_pminfo(unsigned int acpi_id,
+                    const struct xen_processor_cppc *cppc_data);
 
 #ifdef CONFIG_COMPAT
 struct compat_processor_performance;
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 3c7b6c6830..d3f87c7cc2 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -168,6 +168,7 @@
 !	processor_performance		platform.h
 !	processor_power			platform.h
 ?	processor_px			platform.h
+?	processor_cppc			platform.h
 !	psd_package			platform.h
 ?	xenpf_enter_acpi_sleep		platform.h
 ?	xenpf_pcpu_version		platform.h
-- 
2.34.1


