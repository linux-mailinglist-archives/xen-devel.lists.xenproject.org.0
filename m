Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20DA7104F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927142.1329965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpf-000119-3e; Wed, 26 Mar 2025 06:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927142.1329965; Wed, 26 Mar 2025 06:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpe-0000w7-TD; Wed, 26 Mar 2025 06:01:42 +0000
Received: by outflank-mailman (input) for mailman id 927142;
 Wed, 26 Mar 2025 06:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJi6-0008HQ-4T
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:54 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2417::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0da1238-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:53:51 +0100 (CET)
Received: from MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::35)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 05:53:45 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::83) by MW4P222CA0030.outlook.office365.com
 (2603:10b6:303:114::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Wed,
 26 Mar 2025 05:53:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:44 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:42 -0500
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
X-Inumbo-ID: b0da1238-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVq4jH22eiD5k2LMGULZ3Jt+3Nw+ZdTpwBcslzFQVBuUXDHE7swUxPhL6ZnAA3+Asy3HDpjQXP2ESUTtbFJAQRAi0Ieg4DxCZ4fADx4P01sfBKsv7bQgDCwDwR1NFL6XBF7u/tjw977p9jkINNA4AAE8SKPglOekkdHwVvMxJnDm97OcKdiwxe5QmbMBfGvI2YmbdzWOeUpbcNnO+jL2mV8g/m4UQL6eFKI3ogIBrvCoYYLItp21+nWc+MGeycZLRL2DKRtQgO8o6vNkakkQovCvTb9R6rcsyTbCWTpFGKrv3iAqTnEwixTfug+/wBAvFQEUnsPODxIpvOgXp8pv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFWP1l3XOmMPNxmorR2CSSHi8RU0P6GHCYUEzhk77Kg=;
 b=wccALuKa+LniAZdDfwO+J5oBrxOlcRARcVEdvZrzMWALOtYIwobbehvB1lDTH7PUp24cI2WKJVJIwPIMw4jzv4y6/5eFhMNwjxv2JnWkK6qK/2B6yudord4Ma/vgdWRWr1A6wIKn4AUwZN8OE3EFOg86BTTflo83GpUMlNN3OiGz7ac8ti8235gKA6uMAyxE/+zL72hrt/BkJiecouStqyfumj5QA1FZOFOx2x9bgPL90rJFyKYdn+U6l6ValHCe9RCmRprf+iQh2BkrghJmRdG7ri2omNrG90lYd4DOyyGidy2trAZeOZK7YA2untF20wklf+vur7kDag5zu5kxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFWP1l3XOmMPNxmorR2CSSHi8RU0P6GHCYUEzhk77Kg=;
 b=KZZvaDkvHyP1KQhaLvKjeMJ3nHnR0N8vFWMMMWGaKbkv8VCDZ3HvwkJqVBu9jItxGoZ/ro3m8fRukcgkZonPPj+8K89t+i1PHXvixnueTOYL1slG913be6hsnnszNjXkFLbdk89BN1cwseAcIH43m5LknLpd9U0W25NajyOto/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v2 09/19] xen/pmstat: clean up pmstat.c
Date: Wed, 26 Mar 2025 13:50:43 +0800
Message-ID: <20250326055053.3313146-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: d837f98e-6c56-4104-3b13-08dd6c2a91c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y0XuZYcermZsCggF2pptwVCARI1NIXs340FP/Wx6wUC2LLW+QqZUN9qL9CpO?=
 =?us-ascii?Q?Fer5Yve3H5jSPcEOtr+PeJF3pORgNhqZkLgsfUbqv/cAYCWodQ9qGZIF6493?=
 =?us-ascii?Q?mqCmOYBHEETUHR9w+OZUSeTq9Q+/BIqVfj13e6SWcfH0UKpCWHXLY2gAfEX6?=
 =?us-ascii?Q?Ks7yhszuO6r3efME+bFX3jIyvy8fyezcuMNi2VipLr4UozhHFKHfVMot7rYa?=
 =?us-ascii?Q?wdTyf1je9VAcsTx7TkVOXRit9vnnED/3q1dWwHTRq8U1Qe++4oo37WbwbJze?=
 =?us-ascii?Q?ape/odq2CzndcmUbeT6iJSQ4lSP1g4VZftb6jktoAbgxjeCrrarheT0RHTlr?=
 =?us-ascii?Q?YZ2TbRXDFiIQ0phteptl60YU6FdBGYOY/qbQxkpdENB5wucLJHU93pEPpI0x?=
 =?us-ascii?Q?bYPbWitA5nuk23uDN2AvcrwdHZhwmDQWTSnY9S4kW0XIJgt6cxfXjqldyh23?=
 =?us-ascii?Q?mT2M1/tJy36gkqxqiVqZgmhjWEHlAHcdzUrfXk0hw0oOwWOlHkfytxoUve3B?=
 =?us-ascii?Q?MLS3Pn21Oa3GtAUMuLpmKcQjilpXVu5pQcU/gfLykMy2fB3ulPmixQ1pj2fG?=
 =?us-ascii?Q?+dMX/gEoqWedD72hgeLrIHeC+/xaDl0/bklBwSP1rSFg33ZwwT+mzERSWK+I?=
 =?us-ascii?Q?fiAw10Auvi+wrt0mWJfVsQHeb7T4dTYO1jHoMtyCoZLoFQafx4MWZJw4kb9k?=
 =?us-ascii?Q?qiOIUhQVlc5eq/i03/6vY8vMqjhxi4h6N7pMKRI74LlhFKITFHD21vt/yQhz?=
 =?us-ascii?Q?TbEMvHW3y5v3kULe7GVywkpsVaCtkcxprt7gvmFG5bEU3Boqh+hgUrv/03Jy?=
 =?us-ascii?Q?pjf5veI2CnkB1D3oLLqf2gb3yQsb/2rMKyr+Fc+X/JQHB5ysw/0ku47Af5Sf?=
 =?us-ascii?Q?RDszzAxviWAXXdWWwuJGbCjiqFJC6bFIWpR9W0XRyFppnFXVhLeJ7R1mF0cw?=
 =?us-ascii?Q?WbbmX7SGhKorp3DgterslIyuTWcvyDmwXiM38i+O0dD1qQYOjWH7Ej2U5XMd?=
 =?us-ascii?Q?cuIJKn+Gfxd/bkzb4rQ5KQ/XQ/fNST36p73vkC7OvvME3z8KKnHOtSK+KVhA?=
 =?us-ascii?Q?eTsBVdWyWhIhkBFaGhkhcYmcHBqcfSYIE4Y87NOucTw8xlaG2O0fKLo+GoSM?=
 =?us-ascii?Q?ejE6UJOCEySxunBUZaz7MGD8GRmoJPJWZUWiX9fvs/E2JXUwqcnOT7swSJKs?=
 =?us-ascii?Q?+36XMHSKCz7RWqBh9IkKYUfjhUXPDQhafhBxDOG8SwLUpBIHFhSIWiDGQ+bE?=
 =?us-ascii?Q?P5je++/pnxIl9RaQtHtRQtZzV3/4yRjs0Dya0TaOPe1KKdJWcQLU2kKS+LzI?=
 =?us-ascii?Q?Ejphr44pl3/JGNFpK0WMh80k0OF3vokO08Y6AL/+Dppressk934aziMjh1CH?=
 =?us-ascii?Q?8JzZRRxYQmu8mtqeOWWusGk6kPkk0u14hUEgsdDrn4sIkwdo8bYPbPngStIL?=
 =?us-ascii?Q?k7WJcJD6DasC2fyXBvO5CICGvj+pV0vtzprd5bvQI5CC/6qSgqNSM//t+/IS?=
 =?us-ascii?Q?KxFRh6CItcyjpCMhpFY4wbusyjuVsnYVd9VH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:44.5145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d837f98e-6c56-4104-3b13-08dd6c2a91c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620

We intend to move the following functions into drivers/acpi/pmstat.c, as they
are all designed for performance statistic:
- cpufreq_residency_update
- cpufreq_statistic_reset
- cpufreq_statistic_update
- cpufreq_statistic_init
- cpufreq_statistic_exit
and moving out acpi_set_pdc_bits(), as it is the handler for sub-hypercall
XEN_PM_PDC, and shall stay with the other handlers together in
drivers/cpufreq/cpufreq.c.
This commit also applies various style corrections while moving these
functions

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
 xen/drivers/acpi/pmstat.c                 | 199 ++++++++++++++++++----
 xen/drivers/cpufreq/cpufreq.c             |  31 ++++
 xen/drivers/cpufreq/utility.c             | 162 ------------------
 xen/include/acpi/cpufreq/processor_perf.h |   2 -
 4 files changed, 199 insertions(+), 195 deletions(-)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index df309e27b4..4e3b76dbf3 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -43,6 +43,174 @@
 
 DEFINE_PER_CPU_READ_MOSTLY(struct pm_px *, cpufreq_statistic_data);
 
+DEFINE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
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
+    if ( !pxpt || !pmpt ) {
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
+    (*(pxpt->u.trans_pt + from * pmpt->perf.state_count + to))++;
+
+    spin_unlock(cpufreq_statistic_lock);
+}
+
+int cpufreq_statistic_init(unsigned int cpu)
+{
+    uint32_t i, count;
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
+    uint32_t i, j, count;
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
+            *(pxpt->u.trans_pt + i * count + j) = 0;
+    }
+
+    pxpt->prev_state_wall = NOW();
+    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
+
+    spin_unlock(cpufreq_statistic_lock);
+}
+
 /*
  * Get PM statistic info
  */
@@ -522,34 +690,3 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
 
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
index 4a103c6de9..29fcfbe609 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -582,6 +582,37 @@ out:
     return ret;
 }
 
+int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
+{
+    u32 bits[3];
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
+        u32 mask = 0;
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
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 301104e16f..941e177b6d 100644
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
 
-- 
2.34.1


