Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B41A94D60
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961079.1352716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lm1-0007P7-Vp; Mon, 21 Apr 2025 07:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961079.1352716; Mon, 21 Apr 2025 07:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lm1-0007MZ-R4; Mon, 21 Apr 2025 07:41:01 +0000
Received: by outflank-mailman (input) for mailman id 961079;
 Mon, 21 Apr 2025 07:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljM-0007m8-E4
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:16 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2406::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95daf4f8-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:15 +0200 (CEST)
Received: from BN9PR03CA0146.namprd03.prod.outlook.com (2603:10b6:408:fe::31)
 by CY3PR12MB9632.namprd12.prod.outlook.com (2603:10b6:930:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 07:38:10 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::1e) by BN9PR03CA0146.outlook.office365.com
 (2603:10b6:408:fe::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 07:38:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:07 -0500
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
X-Inumbo-ID: 95daf4f8-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rL/tl4vMXt8mdTOIFj8PYSfpuOU3WaSrPjO6IprncEYqiBCzgMs5SsZpCX9xVRpxeN68t0I0xFgfJAveMQSn3Jc+o41TiEfWuvxFtxsWmY2hrbTWUbmiuMmgwZyf/S2Tzq8aCo+QkvQXsBa9RLwMK/EHJIQpPn29tvsaAjb/tJtYINrLl7sPAsSqkbll6+dukv1AkTSXGJ95zCHdgchD1gB0lKrW+2ygJMwBNoPpeKQ7VrW2pSW+2IDIckKNTB3S+aEni0dPlVuzi39pnkumz7uap+tFvFoir31IH5dizTyv9zNJmJyr4CqLZD4+/i/ikC/HEva98WKWC1fTSmX1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFdEVvM9KEbTQvEO5iqh931D2sWFuvZKZpuM2Z14a5o=;
 b=lJVERPWZZoTr0Zcx6F/lJQrzfQ2D5tQFqRQZMk3jyl7WL383CpCG8K3mre3xSBAqAscTCpeLTt1NEc77s8YRhz7dako+aqS5jaIzIviRjgr4YTyxyJTj8DeP/RT+3ShQIot+ZBww27Qu2qShNjhUiXVU89ONtJsI7/OWHcjmcXlmjTchKZx/F7jiJNmpvrp2uw3NZHRBUpyAqgs43QKCXiOnQTm3aqJzqYNChUHbZ1ZyfIGOL2czm82csTfMfgPSLw2hXX7tTRSk+3MjWgEzexiJADUhYKcivbyMLHf51ahECMFB9mUP2zMjv/a4qN/nqea+0PvEm4zcttd4OM4CgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFdEVvM9KEbTQvEO5iqh931D2sWFuvZKZpuM2Z14a5o=;
 b=Mkrm8kZwMZqwAPy4Xs6fSlXmr7Iz8QdEDQPe9nIXzgnMTb7uGRgfUyJsQeBJvuiy/v9oouVF+xt7E4+dLG/KpQaP3AfwNfC5YiYmVtSv4gPerztQkdE9lwwGb7018RAOR71hL0d+0AmyQ5+LMK3haDFwQUl7LoN1fDmJ8Ej+nKw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 09/20] xen/pmstat: consolidate code into pmstat.c
Date: Mon, 21 Apr 2025 15:37:12 +0800
Message-ID: <20250421073723.3863060-10-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|CY3PR12MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 0894b769-d5fb-4dc7-e806-08dd80a77684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RNrRbsxkRWNs5G3Y/uf809jDFFBp+f74k1X/9GOLYCFnHSZN+knOJWWxJFWh?=
 =?us-ascii?Q?gtH7RmTV8K9W1yHkbUTiCrNazRJstPuHO7xoWqwh1Yp03gA7g3H51gjksOQA?=
 =?us-ascii?Q?QuZpou2ABuxoygud+HP66b79KeqHNXuLE+bC/OaSMCh0XvW0yrn1OTa6lAJl?=
 =?us-ascii?Q?e/v1+S/XjFG7nlmvotfhpUHlGFc9T5WrZO8GZHYdRFjL0F4M4AQCcnzLFQdM?=
 =?us-ascii?Q?GUZ2OHkQYSDicC98wTZOYVFgUp5Qb41brgqNLgEac6kWdgNrB6ZgmeZb4Tao?=
 =?us-ascii?Q?vGD6HATvyLLjvzVubwXLipVwboCsiiSSMnql3kYDK7OyUYOqqSbqQyAok/eS?=
 =?us-ascii?Q?z0A1MzrH5FCEDkRdWWosCs9YFVf/youvvLXEd7gczWmfi+YbjzA3j7UhFGZn?=
 =?us-ascii?Q?1mfzx7jeDSvL7W3shHG1iJRbCtWTNtVESCwX1eKCak95sjaJeQhxNvgZGIHe?=
 =?us-ascii?Q?mktCrCSnr5Isd7riUsk8DzQMvBK0cYo5bEJV4rxyEpRtF9FFqYeocSLYvVBh?=
 =?us-ascii?Q?VCfTRrZP14TsKTvnNjFjxkrzVbvNauy3ijPQPhEexx0Ww90eF8qfBsFri+Jh?=
 =?us-ascii?Q?h5h2Ull/cbWlljfB7celXq3LDAymdzjVgI2b9mzALezor2aecW9oxzAe781a?=
 =?us-ascii?Q?Z+Iyi7QdHQUMjN6xtW2iAa7ZjwOUQgka6T1vNbDmt4bFWjUwIVJHAyS45cZy?=
 =?us-ascii?Q?WpHc4H2xHUPd3Gfxa4L8vufwmoCV4Hv574HOYVCKJRXCTpsxrLoPRrrP8FLn?=
 =?us-ascii?Q?R+dg2k+j3/PtImVuwjZJZmz82alM4hDqhavmeHox8Q6okmRL/Uc4Z1BtsxJo?=
 =?us-ascii?Q?WxY/oW21SXzEzhwpPpWOBantLunzOz2N2rTWE8gYf2O8lIfU5yYXuxFSIb1Y?=
 =?us-ascii?Q?kDBXZd8cIMhg7vNsibBa+LCOhWJELk3qITIvz6oo/t32k31K07imipNQX8NK?=
 =?us-ascii?Q?zSyoyKpuu/nO1tTYoEZNmmMv1uhQK0jBt1gNVY6KNBckBY8gMumd6dXMkuZb?=
 =?us-ascii?Q?YTgnrZiBIuNRcq2DuPO2NIscxI9nz4nELtzaqKKhcdA2toL/agTRIe9AXPGF?=
 =?us-ascii?Q?ol48OfnZ6nPeyJeLMUCbxlBbPCWqsis1gBNQTaJ6bckZEMNA/KpT/YJf320Z?=
 =?us-ascii?Q?v6beS+4z89AJCnt91UmUavVO+kWF5U5L9M1Be+WDUmj+zO/jeaWsMdA+vLrY?=
 =?us-ascii?Q?apwZ3OeQ1tTkn/ezrlCrrxQw48J/FXYbDMmoLm7Zetr6+Mb4e9WOSxcqq1dx?=
 =?us-ascii?Q?SnxTnl3orkm6A4FPUCs0swRMEakjqB4LiY3+OK9/CxA2EMRV+3y1XEJljRrI?=
 =?us-ascii?Q?ZIc/c9iXdmaNlBH8PU0rjY9K8HbgQyFCrgErCo+pevcgXx6ndhiQn7gxPzz3?=
 =?us-ascii?Q?7KBLKdFELfEsrg7xJSIIsDT4DoWZC5QMkRImjKZIZNo+J7k/6YL4O0aMG74C?=
 =?us-ascii?Q?vKPv39DvrZc9ZO3ndqs7PYjm1l+CNXTgODsOG4npf2qdeRfjW1ScaiiEPBVe?=
 =?us-ascii?Q?z8hG/1R1C/OvBhdZi+O1Fr1L+bYvsbmOZPKc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:09.2362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0894b769-d5fb-4dc7-e806-08dd80a77684
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9632

We move the following functions into drivers/acpi/pmstat.c, as they
are all designed for performance statistic:
- cpufreq_residency_update
- cpufreq_statistic_reset
- cpufreq_statistic_update
- cpufreq_statistic_init
- cpufreq_statistic_exit
Consequently, variable "cpufreq_statistic_data" and "cpufreq_statistic_lock"
shall become static.
We also move out acpi_set_pdc_bits(), as it is the handler for sub-hypercall
XEN_PM_PDC, and shall stay with the other handlers together in
drivers/cpufreq/cpufreq.c.

Various style corrections shall be applied at the same time while moving these
functions, including:
- brace for if() and for() shall live at a seperate line
- add extra space before and after bracket of if() and for()
- use array notation
- convert uint32_t into unsigned int
- convert u32 into uint32_t

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- brace for if() and for() shall live at a seperate line
- use array notation
- convert uint32_t into unsigned int
---
 xen/drivers/acpi/pmstat.c                 | 202 ++++++++++++++++++----
 xen/drivers/cpufreq/cpufreq.c             |  31 ++++
 xen/drivers/cpufreq/utility.c             | 162 -----------------
 xen/include/acpi/cpufreq/cpufreq.h        |   2 -
 xen/include/acpi/cpufreq/processor_perf.h |   4 -
 5 files changed, 201 insertions(+), 200 deletions(-)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index c51b9ca358..abfdc45cc2 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -41,7 +41,176 @@
 #include <acpi/cpufreq/cpufreq.h>
 #include <xen/pmstat.h>
 
-DEFINE_PER_CPU_READ_MOSTLY(struct pm_px *, cpufreq_statistic_data);
+static DEFINE_PER_CPU_READ_MOSTLY(struct pm_px *, cpufreq_statistic_data);
+
+static DEFINE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
+
+/*********************************************************************
+ *                    Px STATISTIC INFO                              *
+ *********************************************************************/
+
+static void cpufreq_residency_update(unsigned int cpu, uint8_t state)
+{
+    uint64_t now, total_idle_ns;
+    int64_t delta;
+    struct pm_px *pxpt = per_cpu(cpufreq_statistic_data, cpu);
+
+    total_idle_ns = get_cpu_idle_time(cpu);
+    now = NOW();
+
+    delta = (now - pxpt->prev_state_wall) -
+            (total_idle_ns - pxpt->prev_idle_wall);
+
+    if ( likely(delta >= 0) )
+        pxpt->u.pt[state].residency += delta;
+
+    pxpt->prev_state_wall = now;
+    pxpt->prev_idle_wall = total_idle_ns;
+}
+
+void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
+{
+    struct pm_px *pxpt;
+    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
+    spinlock_t *cpufreq_statistic_lock =
+               &per_cpu(cpufreq_statistic_lock, cpu);
+
+    spin_lock(cpufreq_statistic_lock);
+
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
+    if ( !pxpt || !pmpt )
+    {
+        spin_unlock(cpufreq_statistic_lock);
+        return;
+    }
+
+    pxpt->u.last = from;
+    pxpt->u.cur = to;
+    pxpt->u.pt[to].count++;
+
+    cpufreq_residency_update(cpu, from);
+
+    pxpt->u.trans_pt[from * pmpt->perf.state_count + to]++;
+
+    spin_unlock(cpufreq_statistic_lock);
+}
+
+int cpufreq_statistic_init(unsigned int cpu)
+{
+    unsigned int i, count;
+    struct pm_px *pxpt;
+    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
+
+    spin_lock_init(cpufreq_statistic_lock);
+
+    if ( !pmpt )
+        return -EINVAL;
+
+    spin_lock(cpufreq_statistic_lock);
+
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
+    if ( pxpt )
+    {
+        spin_unlock(cpufreq_statistic_lock);
+        return 0;
+    }
+
+    count = pmpt->perf.state_count;
+
+    pxpt = xzalloc(struct pm_px);
+    if ( !pxpt )
+    {
+        spin_unlock(cpufreq_statistic_lock);
+        return -ENOMEM;
+    }
+    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
+
+    pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
+    if ( !pxpt->u.trans_pt )
+    {
+        xfree(pxpt);
+        spin_unlock(cpufreq_statistic_lock);
+        return -ENOMEM;
+    }
+
+    pxpt->u.pt = xzalloc_array(struct pm_px_val, count);
+    if ( !pxpt->u.pt )
+    {
+        xfree(pxpt->u.trans_pt);
+        xfree(pxpt);
+        spin_unlock(cpufreq_statistic_lock);
+        return -ENOMEM;
+    }
+
+    pxpt->u.total = pmpt->perf.state_count;
+    pxpt->u.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
+
+    for ( i = 0; i < pmpt->perf.state_count; i++ )
+        pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
+
+    pxpt->prev_state_wall = NOW();
+    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
+
+    spin_unlock(cpufreq_statistic_lock);
+
+    return 0;
+}
+
+void cpufreq_statistic_exit(unsigned int cpu)
+{
+    struct pm_px *pxpt;
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
+
+    spin_lock(cpufreq_statistic_lock);
+
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
+    if ( !pxpt )
+    {
+        spin_unlock(cpufreq_statistic_lock);
+        return;
+    }
+
+    xfree(pxpt->u.trans_pt);
+    xfree(pxpt->u.pt);
+    xfree(pxpt);
+    per_cpu(cpufreq_statistic_data, cpu) = NULL;
+
+    spin_unlock(cpufreq_statistic_lock);
+}
+
+static void cpufreq_statistic_reset(unsigned int cpu)
+{
+    unsigned int i, j, count;
+    struct pm_px *pxpt;
+    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
+    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
+
+    spin_lock(cpufreq_statistic_lock);
+
+    pxpt = per_cpu(cpufreq_statistic_data, cpu);
+    if ( !pmpt || !pxpt || !pxpt->u.pt || !pxpt->u.trans_pt )
+    {
+        spin_unlock(cpufreq_statistic_lock);
+        return;
+    }
+
+    count = pmpt->perf.state_count;
+
+    for ( i = 0; i < count; i++ )
+    {
+        pxpt->u.pt[i].residency = 0;
+        pxpt->u.pt[i].count = 0;
+
+        for ( j = 0; j < count; j++ )
+            pxpt->u.trans_pt[i * count + j] = 0;
+    }
+
+    pxpt->prev_state_wall = NOW();
+    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
+
+    spin_unlock(cpufreq_statistic_lock);
+}
 
 /*
  * Get PM statistic info
@@ -518,34 +687,3 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
 
     return ret;
 }
-
-int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
-{
-    u32 bits[3];
-    int ret;
-
-    if ( copy_from_guest(bits, pdc, 2) )
-        ret = -EFAULT;
-    else if ( bits[0] != ACPI_PDC_REVISION_ID || !bits[1] )
-        ret = -EINVAL;
-    else if ( copy_from_guest_offset(bits + 2, pdc, 2, 1) )
-        ret = -EFAULT;
-    else
-    {
-        u32 mask = 0;
-
-        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
-            mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
-        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
-            mask |= ACPI_PDC_P_MASK | ACPI_PDC_SMP_C1PT;
-        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_TX )
-            mask |= ACPI_PDC_T_MASK | ACPI_PDC_SMP_C1PT;
-        bits[2] &= (ACPI_PDC_C_MASK | ACPI_PDC_P_MASK | ACPI_PDC_T_MASK |
-                    ACPI_PDC_SMP_C1PT) & ~mask;
-        ret = arch_acpi_set_pdc_bits(acpi_id, bits, mask);
-    }
-    if ( !ret && __copy_to_guest_offset(pdc, 2, bits + 2, 1) )
-        ret = -EFAULT;
-
-    return ret;
-}
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 19e2992335..c2d777e0ec 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -588,6 +588,37 @@ out:
     return ret;
 }
 
+int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
+{
+    uint32_t bits[3];
+    int ret;
+
+    if ( copy_from_guest(bits, pdc, 2) )
+        ret = -EFAULT;
+    else if ( bits[0] != ACPI_PDC_REVISION_ID || !bits[1] )
+        ret = -EINVAL;
+    else if ( copy_from_guest_offset(bits + 2, pdc, 2, 1) )
+        ret = -EFAULT;
+    else
+    {
+        uint32_t mask = 0;
+
+        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
+            mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
+        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
+            mask |= ACPI_PDC_P_MASK | ACPI_PDC_SMP_C1PT;
+        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_TX )
+            mask |= ACPI_PDC_T_MASK | ACPI_PDC_SMP_C1PT;
+        bits[2] &= (ACPI_PDC_C_MASK | ACPI_PDC_P_MASK | ACPI_PDC_T_MASK |
+                    ACPI_PDC_SMP_C1PT) & ~mask;
+        ret = arch_acpi_set_pdc_bits(acpi_id, bits, mask);
+    }
+    if ( !ret && __copy_to_guest_offset(pdc, 2, bits + 2, 1) )
+        ret = -EFAULT;
+
+    return ret;
+}
+
 static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
 {
     if (usr_max_freq)
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index e690a484f1..723045b240 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -35,168 +35,6 @@ struct cpufreq_driver __read_mostly cpufreq_driver;
 struct processor_pminfo *__read_mostly processor_pminfo[NR_CPUS];
 DEFINE_PER_CPU_READ_MOSTLY(struct cpufreq_policy *, cpufreq_cpu_policy);
 
-DEFINE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
-
-/*********************************************************************
- *                    Px STATISTIC INFO                              *
- *********************************************************************/
-
-void cpufreq_residency_update(unsigned int cpu, uint8_t state)
-{
-    uint64_t now, total_idle_ns;
-    int64_t delta;
-    struct pm_px *pxpt = per_cpu(cpufreq_statistic_data, cpu);
-
-    total_idle_ns = get_cpu_idle_time(cpu);
-    now = NOW();
-
-    delta = (now - pxpt->prev_state_wall) - 
-            (total_idle_ns - pxpt->prev_idle_wall);
-
-    if ( likely(delta >= 0) )
-        pxpt->u.pt[state].residency += delta;
-
-    pxpt->prev_state_wall = now;
-    pxpt->prev_idle_wall = total_idle_ns;
-}
-
-void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
-{
-    struct pm_px *pxpt;
-    struct processor_pminfo *pmpt = processor_pminfo[cpu];
-    spinlock_t *cpufreq_statistic_lock = 
-               &per_cpu(cpufreq_statistic_lock, cpu);
-
-    spin_lock(cpufreq_statistic_lock);
-
-    pxpt = per_cpu(cpufreq_statistic_data, cpu);
-    if ( !pxpt || !pmpt ) {
-        spin_unlock(cpufreq_statistic_lock);
-        return;
-    }
-
-    pxpt->u.last = from;
-    pxpt->u.cur = to;
-    pxpt->u.pt[to].count++;
-
-    cpufreq_residency_update(cpu, from);
-
-    (*(pxpt->u.trans_pt + from * pmpt->perf.state_count + to))++;
-
-    spin_unlock(cpufreq_statistic_lock);
-}
-
-int cpufreq_statistic_init(unsigned int cpu)
-{
-    uint32_t i, count;
-    struct pm_px *pxpt;
-    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
-    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
-
-    spin_lock_init(cpufreq_statistic_lock);
-
-    if ( !pmpt )
-        return -EINVAL;
-
-    spin_lock(cpufreq_statistic_lock);
-
-    pxpt = per_cpu(cpufreq_statistic_data, cpu);
-    if ( pxpt ) {
-        spin_unlock(cpufreq_statistic_lock);
-        return 0;
-    }
-
-    count = pmpt->perf.state_count;
-
-    pxpt = xzalloc(struct pm_px);
-    if ( !pxpt ) {
-        spin_unlock(cpufreq_statistic_lock);
-        return -ENOMEM;
-    }
-    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
-
-    pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
-    if (!pxpt->u.trans_pt) {
-        xfree(pxpt);
-        spin_unlock(cpufreq_statistic_lock);
-        return -ENOMEM;
-    }
-
-    pxpt->u.pt = xzalloc_array(struct pm_px_val, count);
-    if (!pxpt->u.pt) {
-        xfree(pxpt->u.trans_pt);
-        xfree(pxpt);
-        spin_unlock(cpufreq_statistic_lock);
-        return -ENOMEM;
-    }
-
-    pxpt->u.total = pmpt->perf.state_count;
-    pxpt->u.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
-
-    for (i=0; i < pmpt->perf.state_count; i++)
-        pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
-
-    pxpt->prev_state_wall = NOW();
-    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
-
-    spin_unlock(cpufreq_statistic_lock);
-
-    return 0;
-}
-
-void cpufreq_statistic_exit(unsigned int cpu)
-{
-    struct pm_px *pxpt;
-    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
-
-    spin_lock(cpufreq_statistic_lock);
-
-    pxpt = per_cpu(cpufreq_statistic_data, cpu);
-    if (!pxpt) {
-        spin_unlock(cpufreq_statistic_lock);
-        return;
-    }
-
-    xfree(pxpt->u.trans_pt);
-    xfree(pxpt->u.pt);
-    xfree(pxpt);
-    per_cpu(cpufreq_statistic_data, cpu) = NULL;
-
-    spin_unlock(cpufreq_statistic_lock);
-}
-
-void cpufreq_statistic_reset(unsigned int cpu)
-{
-    uint32_t i, j, count;
-    struct pm_px *pxpt;
-    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
-    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
-
-    spin_lock(cpufreq_statistic_lock);
-
-    pxpt = per_cpu(cpufreq_statistic_data, cpu);
-    if ( !pmpt || !pxpt || !pxpt->u.pt || !pxpt->u.trans_pt ) {
-        spin_unlock(cpufreq_statistic_lock);
-        return;
-    }
-
-    count = pmpt->perf.state_count;
-
-    for (i=0; i < count; i++) {
-        pxpt->u.pt[i].residency = 0;
-        pxpt->u.pt[i].count = 0;
-
-        for (j=0; j < count; j++)
-            *(pxpt->u.trans_pt + i*count + j) = 0;
-    }
-
-    pxpt->prev_state_wall = NOW();
-    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
-
-    spin_unlock(cpufreq_statistic_lock);
-}
-
-
 /*********************************************************************
  *                   FREQUENCY TABLE HELPERS                         *
  *********************************************************************/
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index a3c84143af..241117a9af 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -20,8 +20,6 @@
 
 #include "processor_perf.h"
 
-DECLARE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
-
 extern bool cpufreq_verbose;
 
 enum cpufreq_xen_opt {
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 301104e16f..6de43f8602 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -9,11 +9,9 @@
 
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
-void cpufreq_residency_update(unsigned int cpu, uint8_t state);
 void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
 int  cpufreq_statistic_init(unsigned int cpu);
 void cpufreq_statistic_exit(unsigned int cpu);
-void cpufreq_statistic_reset(unsigned int cpu);
 
 int  cpufreq_limit_change(unsigned int cpu);
 
@@ -56,7 +54,5 @@ struct pm_px {
     uint64_t prev_idle_wall;
 };
 
-DECLARE_PER_CPU(struct pm_px *, cpufreq_statistic_data);
-
 int cpufreq_cpu_init(unsigned int cpu);
 #endif /* __XEN_PROCESSOR_PM_H__ */
-- 
2.34.1


