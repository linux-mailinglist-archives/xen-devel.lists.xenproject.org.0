Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC293AC6587
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999059.1379779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv3-0001SW-2t; Wed, 28 May 2025 09:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999059.1379779; Wed, 28 May 2025 09:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv2-0001Qt-Uy; Wed, 28 May 2025 09:17:52 +0000
Received: by outflank-mailman (input) for mailman id 999059;
 Wed, 28 May 2025 09:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCv2-0000yL-7I
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:17:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:200a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f8c4909-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:17:51 +0200 (CEST)
Received: from SN4PR0501CA0097.namprd05.prod.outlook.com
 (2603:10b6:803:42::14) by IA1PR12MB8309.namprd12.prod.outlook.com
 (2603:10b6:208:3fe::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 28 May
 2025 09:17:43 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:803:42:cafe::90) by SN4PR0501CA0097.outlook.office365.com
 (2603:10b6:803:42::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.12 via Frontend Transport; Wed,
 28 May 2025 09:17:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:17:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:41 -0500
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
X-Inumbo-ID: 9f8c4909-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMXTis3pwxQNSWBoFylsWj7q/JAk1fn2IIny1B4tX6fffRa/RXMDIFrhQecJ+igRUYRcTJsNuUJBtmuFMOS7+a1UnZn9KFPWQo1BzspM+hMhLtyMATkf1YAkgGA79Tql9qB/WSQNkpQjjb0TEXicPXtzuRovHsTCzI6kIMIU8n6ZpVwdwfe3Ak9fy5v9vj92obzrOgjujpCmW5n0n3guhyCWhmZDoOQpgXZtjjdH48K9tsBJUcmVq2lq+mtonZrHN3+GuxQEJXoXNUCD7UzKBLQGZ/nqs3aPscnHFRlZtAlwayf77GhvycYmXYPsQzVe/L+fet0ds6HJ1FtB23Yadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXU7lCQ0nW2QkCoxel+HoxiYxmOkuqM2DkeV3pZanMc=;
 b=nX6fRCMpaEE5lZCKx+ClKHSnHK1MTtXJZthP+ojZnJUykPUAHbOao8wj3j3QI3UJGBtxugWrXsQmMVABQOZK82LHqf1cU4fgM1JaWADMMN/oAPp5NriQlnqiXfVfohpQmdb4ZlIVj9OpVqWbXeIe+QhEfPgy/yWpjf7Lx5cEkCm9j1JATzdKliWAqeiCmo7JpnE/HsNvtwsvkS/39/sGZBUZ1GF0DUDVPfSKR1uEgWgQtQCeY06C+849upgJmXdE3sR3w54led7q+wFmjM8Uq4LPZqzKYyWskEMadnMo6uIW9zLEMylxKimXwxf2ksncBdtKaXgxPE5+bcVEFzJ3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXU7lCQ0nW2QkCoxel+HoxiYxmOkuqM2DkeV3pZanMc=;
 b=3FPnwI/4Ib0Wvk/v1ZFsP1qvdP/2ozc8TmZ9ibUE8sFHUZNaGiSGQR/Qd22A583q55yokRcLdcWZ9ovz5twdKjDs+712Bo7OyY12M0QXZDN0F6noEQupFPpldh96nqz+nTHnIxvZv4aIjLDYBbrg89u0Ac7rDQgLDyPAtKVayxo=
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
Subject: [PATCH v4 01/20] xen/pmstat: consolidate code into pmstat.c
Date: Wed, 28 May 2025 17:16:49 +0800
Message-ID: <20250528091708.390767-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8ff61a-ae5e-4278-ac27-08dd9dc880b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rXlmgzl/JuTuBbb34mj2DJ9uthG2VwG1t+4DjQFr11JcMAMwbdGcgd9pvWIQ?=
 =?us-ascii?Q?VjO+CsV4kfP1u0IMHJuDQnrXVirBrRwW9YDYKCTiu2c7sbIvbiR/O2wEJZ5Z?=
 =?us-ascii?Q?mBfeZFcipuNRZ2bKDyM31SawX/ouxax8qTiz7P/LtXcl6eQOsyM8jfqxgG7F?=
 =?us-ascii?Q?YLKQDmd/5StVWaDIanWqpEUxU9wF/SoroAF+VBofGmCixAxchfdhG5EbnJtp?=
 =?us-ascii?Q?4CmClFLK8mn983gILY+mgjDGX0OooRYrFsutzrn8SmxYWiq+/w5nAsfFSDBl?=
 =?us-ascii?Q?xqqjQU+fxLhahZ3Kfz11zveCS2WzsZHBoTXK/Ofccf1EZtEE4jVy/geDLwz8?=
 =?us-ascii?Q?pdKVa1DVW9zrcprBa/nq9ZzZ7G/d+vhSHA5cF+BzGHwqtwGT0iasNhgz2JMh?=
 =?us-ascii?Q?LpEq0pmKjO/+bTa7RqF+3+yQKs7oF1ep8Y3u76MwUzpHDwWb9VsevP7JGvh6?=
 =?us-ascii?Q?2T2hFnelLHi1CgleSPlqB8JvCWJ9MzSu9vSVeNbv9gQ4AOA5SsU3RsbDThNJ?=
 =?us-ascii?Q?YoNUbTGfnaG67/bNoD5NukFt4oHB+itRxrt2MPEAHQtIxw78nRbKYYnWChi2?=
 =?us-ascii?Q?+BbNeeg8cwDHpDGEayFPCibXtlDJ7ccezGsOcNkjEm7t8N6d5OAzD1wWfxmr?=
 =?us-ascii?Q?ddk9shRaHIMMze3c62LpG1TtnBAr0QEW23kq+ImPJ+2C7dQ5A3OEgkuAHxdb?=
 =?us-ascii?Q?dpKNBXU9Tm8X4p2SIX0uUDauq5iMgOrOkWkoKR5mXbBDRHO5OQN7G06I4IWm?=
 =?us-ascii?Q?fiSxnewpbqNaCeTckQGWkTc3MHO2NdUkuFQ4hlZ9/1uCyPKDQYAzOznyYNIA?=
 =?us-ascii?Q?pUzabqRtSzFVEC1b+idyNfB1lVb9wSYJlGY8T+fwgpC3VTxUa4a/+xOhXlB+?=
 =?us-ascii?Q?L7O9j6MdUMnLATlUcX/jzP1drr4BMCzmZ/xVwpwqHNvcX/82zZpKbuzSjqzM?=
 =?us-ascii?Q?MGEo2aoWv1xMAqVcuAYZ9uPLS0/IyE1/OnbYmFenSZGmzib4LsZZwYclNjr0?=
 =?us-ascii?Q?MIi6y5V9FW+1gJDegmbBhUorWWojonbn2X/UI5DRzy9lrmLxvgHjwfEPnJu5?=
 =?us-ascii?Q?DDHpc4btj32a33bm+csHQZn0U6mzBGtyyOL8U9a1XPUbx1LZmEqBRBt5DfXo?=
 =?us-ascii?Q?lPUhmfutUDrg0Se/CIlKe9rWuZdgxNEuYEhk1q27/jucgajrbdzk2WJeqGco?=
 =?us-ascii?Q?4KagbO+iNEmPpKjy7zcW7MaH3q1T3Jm29FsdX889fKhvUjTWPcsDFfu48dmq?=
 =?us-ascii?Q?5BWH9hmSOA7p2cNHMNi8AOLDPdAwKnKaVeenbDEa4kouhGEYOOy0mSxYd3E0?=
 =?us-ascii?Q?98gjwevFAxpiRE1Sk3AkUu3O74we41IN2R4sAu6EUgE2pIldPPkN4Uykv7zZ?=
 =?us-ascii?Q?68Wb6p3kRDvyDalTsbAA0SXnsOT2htiFrkwVmFOAT9WiXZHznsIxOV0NcIi8?=
 =?us-ascii?Q?Joc6mGR6vlTWyld5Mo+AbHerNVwmAjIMwh4h0FhuKKzHKp5LhUAIcToRWI1g?=
 =?us-ascii?Q?Cs67oplEWRbUE2P3ppZjMQGcejLWLwq302Iq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:17:43.4104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8ff61a-ae5e-4278-ac27-08dd9dc880b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309

We move the following functions into drivers/acpi/pmstat.c, as they
are all designed for performance statistic:
- cpufreq_residency_update()
- cpufreq_statistic_reset()
- cpufreq_statistic_update()
- cpufreq_statistic_init()
- cpufreq_statistic_exit()
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2 -> v3:
- brace for if() and for() shall live at a seperate line
- use array notation
- convert uint32_t into unsigned int
---
v3 -> v4:
- move ahead and could go in right away
---
 xen/drivers/acpi/pmstat.c                 | 202 ++++++++++++++++++----
 xen/drivers/cpufreq/cpufreq.c             |  31 ++++
 xen/drivers/cpufreq/utility.c             | 163 -----------------
 xen/include/acpi/cpufreq/cpufreq.h        |   2 -
 xen/include/acpi/cpufreq/processor_perf.h |   4 -
 5 files changed, 201 insertions(+), 201 deletions(-)

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
index 309c0682cf..723045b240 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -35,169 +35,6 @@ struct cpufreq_driver __read_mostly cpufreq_driver;
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
-    pxpt->u.total = count;
-    pxpt->u.usable = count - pmpt->perf.platform_limit;
-
-    for ( i = 0; i < count; i++ )
-        pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
-
-    pxpt->prev_state_wall = NOW();
-    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
-
-    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
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


