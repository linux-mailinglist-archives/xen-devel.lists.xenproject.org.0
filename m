Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B646DA5451E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903103.1311037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mO-00033s-W1; Thu, 06 Mar 2025 08:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903103.1311037; Thu, 06 Mar 2025 08:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mO-00032D-TF; Thu, 06 Mar 2025 08:40:32 +0000
Received: by outflank-mailman (input) for mailman id 903103;
 Thu, 06 Mar 2025 08:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mN-00031D-AJ
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2416::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7701d54-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:29 +0100 (CET)
Received: from CH0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:610:b2::19)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:40:22 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::c1) by CH0PR13CA0044.outlook.office365.com
 (2603:10b6:610:b2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.9 via Frontend Transport; Thu, 6
 Mar 2025 08:40:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:22 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:19 -0600
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
X-Inumbo-ID: a7701d54-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmApqI6/3ww+kcMRI/LIsjk0z19ifemJeeB0ssriU0NKLLEgsRSQn59U5BWf4RVWiWAuhEnlRo1I2SQ2rc/GEC6nKowftSqCnRS9q7u+b7SlxRmntbpia6V86zgBxOYuUog/rzE4KTWhZSrN04/ZkyrGtACnSmjVx4CRyIchiVr6EgQld3UjXpNz5Llv0ydb9IIb0iFoqTBtQ4eCh8gVgoT7UBp5CntqgMvgHD5Z3mfB/mnk3kcVmdzL1J5zNFFyBjcSCjPilfPOLLqDP5OHJIStnTDX5MZoVh7CMSWPklYcN5bXIPWZEd4UigLmAkZhT0hFfy0l9e8gvd9h0f+zDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPxZx060JAcSO870+vo68zNrp5uH7k83qg/iI6TUuMA=;
 b=F5/hgKPoQJiRlvXJebHiWYxIm9kEmnrW3p+fHtOoYMwcFBggGCVwsp1etRNh8Ht9CwnFqo41BqbG51MCR7/0j0Q1ty7p/e+BYaXvU351BEOB8B+OVgz9c2YnPVd8rGpYLC5D2byWNSzIApi7yX3BdsG0/S2KRw0tEGrkWdLLoC0Q2glbJ6AZXp7XWAawqGwaQxvTt9hOACDpnj8VKTcfkNui1jKyFE0hwkuNAOxgdTRlYsOd7ozT2Rg+ZdkaV5MHaPuba/jK6uitAf8NsCI+ixUErDcejWp+Y+orPAJ3/y5HiiSHFA8C9X2DeoWTle3iPt8GuqKWvQfKQul7yNCMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPxZx060JAcSO870+vo68zNrp5uH7k83qg/iI6TUuMA=;
 b=Y5uCtDC9iluXGFdqNsUREtKMhlQzMVYNrJI7l5S7ucqdw4DGNX9uhnvRod+0qQmZOcmNbCqEXlXmo918kMXvFHG7+FVh3fkTy7q99H86EzfHz1EnM6vFZSCTkbbjMQAjYS/3HMjf6Q4dWz4bTeViHKzy8MU5CT67xlTFoCfnBRk=
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
Subject: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to propagate CPPC data
Date: Thu, 6 Mar 2025 16:39:36 +0800
Message-ID: <20250306083949.1503385-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e206cb7-9a40-40b0-31fd-08dd5c8a88b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wZY4EUdJc3vmgXQsJGyiPX/gOYBjMJrtqSiBqFDFnthtn/91GefZIwWyO+vp?=
 =?us-ascii?Q?02Xu9x45sWsmKVcsea+QUnw9QSmC6O7vFgg7pxlCvR/Eafm71PYjvnEo04BL?=
 =?us-ascii?Q?0TK23+lqtq8YSubkE5Rh3OO5WQZuyynTQqo0SKzUTZ7Fk5QDQHQ9a4yj/Dms?=
 =?us-ascii?Q?znvtI69vmE/VfHN9etDjAPmLKDTVYWNGbJpoN6cmpAe+LbuWzNDC/E4hK8XN?=
 =?us-ascii?Q?sfpxpkMXwG7PNybNpuewkeEQAX1yNTNL5HRxl+Iazd43q9co4G23sC3w8GTB?=
 =?us-ascii?Q?fTFibCMVXziIMUs3/IgCXmDnz4oxDdiEvyX+uF0lUcHMG0iF21JL3LaYt7x3?=
 =?us-ascii?Q?DPtAgkc9G/kUArym0Id+bjIOEEafsZ0W5nYNei771Hp57ytIy4y2Zfnk20nT?=
 =?us-ascii?Q?UIdTHQLx0/qJattjq7m/GXvHEV5Ph0odDV19INzoqTzg4tzsrE7DwLaSTdhU?=
 =?us-ascii?Q?pIqetBhw4lj1EtonBuTj5iskqtA08ahAm8wed2/EQ3U+aRCspctJHdRUWw3X?=
 =?us-ascii?Q?5LPsz0clOkA8MRTGv8mU9fAuCaNTuqHiSOsJDnB4KmgQhxlbiFcPunkBZcXk?=
 =?us-ascii?Q?q/41xPJaKs+9se/MGcmVaM54srtVafpTUlXlB7C+z3GErBsiqHAUr4YBzkYK?=
 =?us-ascii?Q?Wrn9SrfdqU2OYr1m6QAZPcuJPBF9YVIkiBhkX7YxrF6sZox3RRiuz2sN0m5A?=
 =?us-ascii?Q?kBG8THgVRsMIIXNaeTddzSrbYo+jggZaApjZiXsnSxaOz9DZng+5H634QWbH?=
 =?us-ascii?Q?I1JFQ0ljIQM+H06kmb2IJyVfgjz4iKflr0PWAadWpBnkhpojVWakV6P77nOq?=
 =?us-ascii?Q?fOJ+9sVUId3CtT4IsP6V0l4UcA0F6Iixe3E5ABb7/Z7AgJiCDeID0PXFhoS/?=
 =?us-ascii?Q?FWfIobU0ooKwLFrvOscrJNrEnNyiU1hX1K1lLZquwh0iMfklwj7so70haaIe?=
 =?us-ascii?Q?/6hMqnhEHymitGJkER0FS5Iw+Ua+asKjCyjTVtVkJ0b3DpwJyVd6DEUtQYWS?=
 =?us-ascii?Q?gddmyVjIKirHhZmTkmSvJ2vnGBsv9mF+tEA4BTHRiKmPyCQTNUS6acDUnvVd?=
 =?us-ascii?Q?RogZv+WeEBg4sUgI4uCaZOG46P41IjHJl3i8HVqw2lJ3CWn8EQ/fpfve3ru7?=
 =?us-ascii?Q?wYuz5k1f1eu4uLk7RiUrZba2u+VvHf8knniHiD+dR4vzZJfgFd97t+MkoNLt?=
 =?us-ascii?Q?fEOKmiHre8EjyuA1739ceAgAoYbzeG9F2MS9gTj8PpD8YMEonL1OgcGKzf2x?=
 =?us-ascii?Q?5Qd19TA9wt7F6MqOubnSzqBboR7MUb4V4Yo/eFaWXoqBcRsoeas5P8liRaFU?=
 =?us-ascii?Q?oSp1KrVoTo+/rqRREskEIESn67jGetqg2rjSEU0oEIQHlX5m7IRXCUtYVjKf?=
 =?us-ascii?Q?M+Jxi1ACZGSIl7zY+kW7Ac/Uz5/NmGY7jzhCr6mpG0mgfKC+UYvEEO71wPAV?=
 =?us-ascii?Q?R/9fp4GrasKgYX8XdcfuR38Fj0/RqzVICpeF3o/0Q8A5jmg+d9zI/I8hRrjo?=
 =?us-ascii?Q?fSJLvd06hYWnw9g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:22.4384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e206cb7-9a40-40b0-31fd-08dd5c8a88b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295

In order to provide backward compatibility with existing governors
that represent performance as frequencies, like ondemand, the _CPC
table can optionally provide processor frequency range values, Lowest
frequency and Norminal frequency, to let OS use Lowest Frequency/
Performance and Nominal Frequency/Performance as anchor points to
create linear mapping of CPPC abstract performance to CPU frequency.

As Xen is uncapable of parsing the ACPI dynamic table, this commit
introduces a new sub-hypercall to propagate required CPPC data from
dom0 kernel.

If the platform supports CPPC, the _CPC object must exist under all
processor objects. That is, Xen is not expected to support mixed mode
(CPPC & legacy PSS, _PCT, _PPC) operation, either advanced CPPC, or legacy
P-states.

This commit also introduces a new flag XEN_PM_CPPC to reflect processor
initialised in CPPC mode.

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
 xen/arch/x86/platform_hypercall.c         |  5 +++
 xen/arch/x86/x86_64/cpufreq.c             |  2 +
 xen/drivers/acpi/pmstat.c                 |  4 +-
 xen/drivers/cpufreq/cpufreq.c             | 53 +++++++++++++++++++++--
 xen/include/acpi/cpufreq/processor_perf.h |  8 ++--
 xen/include/public/platform.h             | 16 +++++++
 xen/include/xen/pmstat.h                  |  2 +
 xen/include/xlat.lst                      |  1 +
 8 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index b0d98b5840..77390a0dbd 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -583,6 +583,11 @@ ret_t do_platform_op(
                                  &op->u.set_pminfo.u.domain_info);
             break;
 
+        case XEN_PM_CPPC:
+            ret = set_cppc_pminfo(op->u.set_pminfo.id,
+                                  &op->u.set_pminfo.u.cppc_data);
+            break;
+
         default:
             ret = -EINVAL;
             break;
diff --git a/xen/arch/x86/x86_64/cpufreq.c b/xen/arch/x86/x86_64/cpufreq.c
index d1b93b8eef..565e4f8652 100644
--- a/xen/arch/x86/x86_64/cpufreq.c
+++ b/xen/arch/x86/x86_64/cpufreq.c
@@ -26,6 +26,8 @@
 #include <xen/pmstat.h>
 #include <compat/platform.h>
 
+CHECK_processor_cppc;
+
 CHECK_processor_px;
 
 CHECK_psd_package;
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index df309e27b4..c8e00766a6 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -68,7 +68,7 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
             return -ENODEV;
         if ( hwp_active() )
             return -EOPNOTSUPP;
-        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
             return -EINVAL;
         break;
     default:
@@ -467,7 +467,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     case CPUFREQ_PARA:
         if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
             return -ENODEV;
-        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
         break;
     }
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 638476ca15..894bafebaa 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -210,7 +210,7 @@ int cpufreq_add_cpu(unsigned int cpu)
 
     pmpt = processor_pminfo[cpu];
 
-    if ( !(pmpt->perf.init & XEN_PX_INIT) )
+    if ( !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!cpufreq_driver.init)
@@ -368,7 +368,7 @@ int cpufreq_del_cpu(unsigned int cpu)
 
     pmpt = processor_pminfo[cpu];
 
-    if ( !(pmpt->perf.init & XEN_PX_INIT) )
+    if ( !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
@@ -459,6 +459,16 @@ static void print_PPC(unsigned int platform_limit)
     printk("\t_PPC: %d\n", platform_limit);
 }
 
+static void print_CPPC(const struct xen_processor_cppc *cppc_data)
+{
+    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
+           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
+           "nominal_mhz=%uMHz, lowest_mhz=%uMHz\n",
+           cppc_data->highest_perf, cppc_data->lowest_perf,
+           cppc_data->nominal_perf, cppc_data->lowest_nonlinear_perf,
+           cppc_data->nominal_mhz, cppc_data->lowest_mhz);
+}
+
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 {
     int ret = 0, cpu;
@@ -539,7 +549,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
         if ( cpufreq_verbose )
             print_PPC(pxpt->platform_limit);
 
-        if ( pxpt->init == XEN_PX_INIT )
+        if ( pmpt->init == XEN_PX_INIT )
         {
             ret = cpufreq_limit_change(cpu);
             goto out;
@@ -548,7 +558,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 
     if ( perf->flags == ( XEN_PX_PCT | XEN_PX_PSS | XEN_PX_PPC ) )
     {
-        pxpt->init = XEN_PX_INIT;
+        pmpt->init = XEN_PX_INIT;
 
         ret = cpufreq_cpu_init(cpu);
         goto out;
@@ -606,6 +616,41 @@ int set_psd_pminfo(uint32_t acpi_id, uint32_t shared_type,
     return ret;
 }
 
+int set_cppc_pminfo(uint32_t acpi_id,
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
+        printk("Set CPU acpi_id(%d) cpuid(%d) CPPC State info:\n",
+               acpi_id, cpuid);
+
+    pm_info = processor_pminfo[cpuid];
+    /* Must already allocated in set_psd_pminfo */
+    if ( !pm_info )
+    {
+        ret = -EINVAL;
+        goto out;
+    }
+    pm_info->cppc_data = *cppc_data;
+
+    if ( cpufreq_verbose )
+        print_CPPC(&pm_info->cppc_data);
+
+    pm_info->init = XEN_CPPC_INIT;
+    ret = cpufreq_cpu_init(cpuid);
+
+ out:
+    return ret;
+}
+
 static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
 {
     if (usr_max_freq)
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 19f5de6b08..12b6e6b826 100644
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
@@ -27,8 +28,6 @@ struct processor_performance {
     struct xen_pct_register status_register;
     uint32_t state_count;
     struct xen_processor_px *states;
-
-    uint32_t init;
 };
 
 struct processor_pminfo {
@@ -37,6 +36,9 @@ struct processor_pminfo {
     struct xen_psd_package domain_info;
     uint32_t shared_type;
     struct processor_performance    perf;
+    struct xen_processor_cppc cppc_data;
+
+    uint32_t init;
 };
 
 extern struct processor_pminfo *processor_pminfo[NR_CPUS];
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index f5c50380cb..07f4b72014 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -364,6 +364,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
 #define XEN_PM_PSD  4
+#define XEN_PM_CPPC 5
 
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
+    uint32_t lowest_mhz;
+    uint32_t nominal_mhz;
+};
+typedef struct xen_processor_cppc xen_processor_cppc_t;
+
 struct xen_psd_package {
     uint64_t num_entries;
     uint64_t revision;
@@ -461,6 +476,7 @@ struct xenpf_set_processor_pminfo {
         xen_psd_package_t                   domain_info; /* _PSD */
         struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/ */
         XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
+        xen_processor_cppc_t                cppc_data; /*_CPC */
     } u;
     /* Coordination type of this processor */
 #define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index fd02316ce9..c223f417fd 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -8,6 +8,8 @@
 int set_psd_pminfo(uint32_t acpi_id, uint32_t shared_type,
                    const struct xen_psd_package *psd_data);
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
+int set_cppc_pminfo(uint32_t acpi_id,
+                    const struct xen_processor_cppc *cppc_data);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 
 #ifdef CONFIG_COMPAT
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 0d964fe0ce..3f47552a22 100644
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


