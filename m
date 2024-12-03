Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F539E157F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847302.1262448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAc-0000eO-19; Tue, 03 Dec 2024 08:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847302.1262448; Tue, 03 Dec 2024 08:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAb-0000Pq-Q6; Tue, 03 Dec 2024 08:22:09 +0000
Received: by outflank-mailman (input) for mailman id 847302;
 Tue, 03 Dec 2024 08:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIO7I-0006kj-BH
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:18:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2414::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c7275f-b14f-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 09:18:41 +0100 (CET)
Received: from SJ2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:a03:505::25)
 by PH8PR12MB7160.namprd12.prod.outlook.com (2603:10b6:510:228::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:18:34 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:505:cafe::cf) by SJ2PR07CA0002.outlook.office365.com
 (2603:10b6:a03:505::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:18:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Tue, 3 Dec 2024 08:18:33 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:16:41 -0600
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
X-Inumbo-ID: 33c7275f-b14f-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+DvnDoePekH0k4dGFGw/Dcmj6ZotSTZverB1PgvniOIGbCm/EDvEuHNSblznaBA/Qc7MWHCo9dKATri776Ux0yWQHHvWJq2Z7XaoEMU4JkQXyPH/YibUQ80h07AozKKH+N6KlsFVwb0RnnWg6j4iXaD/m1h5hBGsUx7Dr3mKLItLvhSkRNPyjQ7j0JA7vIBfoEPdtNIdzTXpZSN8tkuqy+DdPhMM5AqGgO7bheI0wGkQFAIEgqopc4lYUaoUbiSiAeSTZtirmL3YTkW1WXlEqdTS01VkIEQP6K68xeyIzoItTiT3CEWFz1e9/DN0CjjglblMf+jLX33geW0rxZ5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8DNK8kEDIj5P0gCv/ZATmRXxy9NMlA56yx+rvk9jsc=;
 b=RrMW2ACv++bdShZwLX0J/LMC8lR8l4xomNFclUIry/q7i6dlWXdqSKmwcBFHjULzoquISZvwaTx0GXFlgU/k0/nEW7oh0tpJOV82gsnoZqBa1kuxDNDLI+StP2XzPtZV+ygHhuuOq6XrXOEMlgGoNffyptuCTyKmxTdgBzvLYFfsDRTMtM1+HTTlGWIitZbkw+6c8QUII9Ok2DYb8AxyBo4De8tfNxhLSOxJ+lRGsy8pZbelY24upLSqdV7fEvP4xca+d3xvdEn0ZLerxE3BCN/eAR7jUqmMHG/H8BvE/4cJNPt24MpLNkV5dTEfLx7Ln+svfX34dRh9FRCHw70Bog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8DNK8kEDIj5P0gCv/ZATmRXxy9NMlA56yx+rvk9jsc=;
 b=fpiEBd918ycM8lf50qwf1jlYAxo8j+3ByoFRrB3Ga3NFMiBWAPv2KRZ45b+dxxIyQSqVoWhqzDleS9A3qZzuNJv44+Qj2afU5IIoRxFd+6MDen/d7m++0jFIMojB/QLnKUMEcBNFn1ruQHlYtttEXKVt8qYmQ5nFojnxwf7gv1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v1 05/11] xen/x86: introduce a new amd pstate driver for cpufreq scaling
Date: Tue, 3 Dec 2024 16:11:05 +0800
Message-ID: <20241203081111.463400-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|PH8PR12MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 668cb013-e510-4059-523d-08dd13731464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nS8O9KFJdoegiHeUyxTPKPkA1Ex7r6w/gBZ65cxdlV/uQjs9T89wRu6e9nkm?=
 =?us-ascii?Q?NX1xpZJsdN9RHP+pbyDTIzUa4KL06vzAIAn9YaCic10e0AfsjYT9KpWqMK4l?=
 =?us-ascii?Q?OKUuPOhxfP49hhPzq+jHXp8yf3B0CUA1K0ERaSsCwiuAE1/mz/ME2Rg9GDP3?=
 =?us-ascii?Q?VgcxrWx2xQ5dZ8icR/hRD0vYjtuO0RYIGdOcE0i9by5J+V4pOYkxiz4Bfozz?=
 =?us-ascii?Q?PwrJv9KH94xlJspeQfGHlR+cHObKMdc2V+oaTmOsL3VONuu/Qf7UZacm53ID?=
 =?us-ascii?Q?5BKXBoTF6/wSKwZ1pbK4ZJ7mi1QkaOsW85WgqCpTkxtRpTodla3X0udN+CNX?=
 =?us-ascii?Q?n/FKwLAVEl7ZlxmJ7j+ATvWkvk9hF7o79DwMHsQHYB5/xRpgXCCVH2yC9pPs?=
 =?us-ascii?Q?gAfKfKu/ICI2c+K4isIXmUfeBAcab9Kc8QRnNcLr4B84t9nOjP2xML2I0RJ9?=
 =?us-ascii?Q?VVvBQ5ekpPPcD0AIs1rK3W50cpJYclMEB5CxvrcD+G15TIicnxg18pTMFQMK?=
 =?us-ascii?Q?uAyrEucoTWh7Ei7dMOJ3lg5ab9dUEfyIKgtjySc1I7J+BixDCByQjjqnwMk+?=
 =?us-ascii?Q?CVvylfvYJYIJFy3Q3b2AJFiD7yBnmVIVl6jHcVNI1TzLfkW4HA/EpaxZKuG4?=
 =?us-ascii?Q?8lHJ5t0MfingR0Y6IH4JALcYHXdqw982HoxkJMptdpTY4LQK7XKGhZyK7kdT?=
 =?us-ascii?Q?bYJ6JXBcJAVMomgSCsJ3q/LdKxTOVQYmlM7PYJuFgkXcFm/dPihOgNMqtSxt?=
 =?us-ascii?Q?PmQIPtZk/8S0fCme5DscjhSFFJgJ42RqrW1kqG7pfcfS2qB+fPKVbz+Sa2HJ?=
 =?us-ascii?Q?LNCx6TpV6ehFAhT1OkzfIaUDvuKySrOIrpTGkCUi3JeyVi78ruKnz8ibiV+f?=
 =?us-ascii?Q?n+ADMJZ9Q8rhVaAP/h6kCkMEK7SH3djt6C+i3jtL6jQWp9JT1dyzuGVl7yvc?=
 =?us-ascii?Q?2K5ij9tzxnGSGAF30xvccXFg/tNaEwG3pylQN0jEXiYWSeA/2yCbCmfC0xBZ?=
 =?us-ascii?Q?xdDBuL+H4dK+iXtHUvgH+Bi9CcRB2FDaXADzG1J0dXXB9Gzm1A4eEfqLxnna?=
 =?us-ascii?Q?BvWplD/NhoYknJUhlpo1BXHZ5r6xz8M9sm9L72gfH4BVnfMeo+KqrABuyF6Q?=
 =?us-ascii?Q?xJYAxx2+pRBJSGbXTXLCHgWrigulgcer8l3U177xCsXqF3OQsHKxOxSkgVKI?=
 =?us-ascii?Q?n+c4dIvZY4YPJtNFvQeYeS2hpJ+mJwYzm4L7S1c6Mmzj996P+w/pwqHz3SHK?=
 =?us-ascii?Q?WK/V7TaTdZKHd0N92Pm7v3wYQbQ9/hHDdN20s06l2LyvDGcNJKjcholCNiZp?=
 =?us-ascii?Q?6gKz3HLiR9o2o2EZySuit/pOras2KCZFUwDa8Sd3XX03GT69NV5YylrGlZru?=
 =?us-ascii?Q?b4mrXCnPA64xxka0RFjzs8MRsSx5LK/nsT//+CPLK+3138FM767hy0zq123b?=
 =?us-ascii?Q?V/8EIkfBN3w2FXE4gBYThy/Zb6Aq1ikE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:18:33.9357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 668cb013-e510-4059-523d-08dd13731464
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7160

amd-pstate is the AMD CPU performance scaling driver that introduces a
new CPU frequency control mechanism on AMD Zen based CPU series.
The new mechanism is based on Collaborative Processor Performance
Control (CPPC) which is a finer grain frequency management
than legacy ACPI hardware P-States.
Current AMD CPU platforms are using the ACPI P-states driver to
manage CPU frequency and clocks with switching only in 3 P-states.
The new amd-pstate allows a more flexible, low-latency interface for Xen
to directly communicate the performance hints to hardware.

The first version "amd-pstate" could leverage common governors such as
*ondemand*, *performance*, etc, to manage the performance hints. In the
future, we will introduce an advanced active mode to enable autonomous
performence level selection.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/acpi/cpufreq/amd-pstate.c | 336 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr-index.h   |   5 +
 2 files changed, 341 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-pstate.c b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
index bfad96ae3d..5dfa35581a 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-pstate.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
@@ -15,6 +15,53 @@
 #include <xen/init.h>
 #include <xen/param.h>
 #include <acpi/cpufreq/cpufreq.h>
+#include <asm/msr.h>
+
+#define amd_pstate_err(cpu, fmt, args...) \
+    printk(XENLOG_ERR "AMD_PSTATE: CPU%u error: " fmt, cpu, ## args)
+#define amd_pstate_verbose(fmt, args...)                         \
+({                                                               \
+    if ( cpufreq_verbose )                                       \
+        printk(XENLOG_DEBUG "AMD_PSTATE: " fmt, ## args);        \
+})
+#define amd_pstate_warn(fmt, args...) \
+    printk(XENLOG_WARNING "AMD_PSTATE: CPU%u warning: " fmt, cpu, ## args)
+
+struct amd_pstate_drv_data
+{
+    struct xen_processor_cppc *cppc_data;
+    union
+    {
+        uint64_t amd_caps;
+        struct
+        {
+            unsigned int lowest_perf:8;
+            unsigned int lowest_nonlinear_perf:8;
+            unsigned int nominal_perf:8;
+            unsigned int highest_perf:8;
+            unsigned int :32;
+        } hw;
+    };
+    union
+    {
+        uint64_t amd_req;
+        struct
+        {
+            unsigned int max_perf:8;
+            unsigned int min_perf:8;
+            unsigned int des_perf:8;
+            unsigned int epp:8;
+            unsigned int :32;
+        } req;
+    };
+    int err;
+
+    uint32_t max_freq;
+    uint32_t min_freq;
+    uint32_t nominal_freq;
+};
+
+static DEFINE_PER_CPU_READ_MOSTLY(struct amd_pstate_drv_data *, amd_pstate_drv_data);
 
 uint16_t __read_mostly dmi_max_speed_mhz;
 
@@ -52,9 +99,298 @@ int __init amd_pstate_cmdline_parse(const char *s, const char *e)
     return 0;
 }
 
+/*
+ * If CPPC lowest_freq and nominal_freq registers are exposed then we can
+ * use them to convert perf to freq and vice versa. The conversion is
+ * extrapolated as an affine function passing by the 2 points:
+ *  - (Low perf, Low freq)
+ *  - (Nominal perf, Nominal freq)
+ */
+static unsigned int amd_pstate_khz_to_perf(struct amd_pstate_drv_data *data, unsigned int freq)
+{
+    struct xen_processor_cppc* cppc_data = data->cppc_data;
+    uint64_t mul, div, offset = 0;
+
+    if ( freq == (cppc_data->nominal_freq * 1000) )
+        return data->hw.nominal_perf;
+
+    if ( freq == (cppc_data->lowest_freq * 1000) )
+        return data->hw.lowest_perf;
+
+    if ( (cppc_data->lowest_freq) && (cppc_data->nominal_freq) )
+    {
+        mul = data->hw.nominal_perf - data->hw.lowest_perf;
+        div = cppc_data->nominal_freq - cppc_data->lowest_freq;
+        /*
+         * We don't need to convert to kHz for computing offset and can
+         * directly use nominal_freq and lowest_freq as the division
+         * will remove the frequency unit.
+         */
+        div = div ?: 1;
+        offset = data->hw.nominal_perf - (mul * cppc_data->nominal_freq) / div;
+    }
+    else
+    {
+        /* Read Processor Max Speed(mhz) from DMI table as anchor point */
+        mul = data->hw.highest_perf;
+        div = dmi_max_speed_mhz;
+    }
+
+    return (unsigned int)(offset + (mul * freq ) / (div * 1000));
+}
+
+static unsigned int amd_get_min_freq(struct amd_pstate_drv_data *data)
+{
+    struct xen_processor_cppc *cppc_data = data->cppc_data;
+    uint64_t mul, div;
+
+    if ( cppc_data->lowest_freq )
+        /* Switch to khz */
+        return cppc_data->lowest_freq * 1000;
+    else
+    {
+        /* Read Processor Max Speed(mhz) from DMI table as anchor point */
+        mul = dmi_max_speed_mhz;
+        div = data->hw.highest_perf;
+
+        return (unsigned int)(mul / div) * data->hw.lowest_perf * 1000;
+    }
+}
+
+static unsigned int amd_get_nominal_freq(struct amd_pstate_drv_data *data)
+{
+    struct xen_processor_cppc *cppc_data = data->cppc_data;
+    uint64_t mul, div;
+
+    if ( cppc_data->nominal_freq )
+        /* Switch to khz */
+        return cppc_data->nominal_freq * 1000;
+    else
+    {
+        /* Read Processor Max Speed(mhz) from DMI table as anchor point */
+        mul = dmi_max_speed_mhz;
+        div = data->hw.highest_perf;
+
+        return (unsigned int)(mul / div) * data->hw.nominal_perf * 1000;
+    }
+}
+
+static unsigned int amd_get_max_freq(struct amd_pstate_drv_data *data)
+{
+    uint64_t max_perf, max_freq, nominal_freq, nominal_perf;
+    uint64_t boost_ratio;
+
+    nominal_freq = amd_get_nominal_freq(data);
+    nominal_perf = data->hw.nominal_perf;
+    max_perf = data->hw.highest_perf;
+
+    boost_ratio = (uint64_t)(max_perf / nominal_perf);
+    max_freq = nominal_freq * boost_ratio;
+
+    return max_freq;
+}
+
+static int cf_check amd_pstate_cpufreq_verify(struct cpufreq_policy *policy)
+{
+    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, policy->cpu);
+
+    cpufreq_verify_within_limits(policy, data->min_freq, data->max_freq);
+
+    return 0;
+}
+
+static void amd_pstate_write_request_msrs(void *info)
+{
+    struct amd_pstate_drv_data *data =(struct amd_pstate_drv_data *)info;
+
+    if ( wrmsr_safe(MSR_AMD_CPPC_REQ, data->amd_req) )
+    {
+        amd_pstate_verbose("Failed to wrmsr_safe(MSR_AMD_CPPC_REQ, %lx)\n",
+                           data->amd_req);
+        data->err = -EINVAL;
+        return;
+    }
+    data->err = 0;
+}
+
+static int cf_check amd_pstate_write_request(int cpu, uint8_t min_perf,
+                                             uint8_t des_perf, uint8_t max_perf)
+{
+    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
+    uint64_t prev = data->amd_req;
+
+    data->req.min_perf = min_perf;
+    data->req.max_perf = max_perf;
+    data->req.des_perf = des_perf;
+
+    if ( prev == data->amd_req )
+        return 0;
+
+    on_selected_cpus(cpumask_of(cpu), amd_pstate_write_request_msrs, data, 1);
+
+    return data->err;
+}
+
+static int cf_check amd_pstate_cpufreq_target(struct cpufreq_policy *policy,
+                                              unsigned int target_freq,
+                                              unsigned int relation)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
+    uint64_t max_perf, min_perf, des_perf;
+
+    if ( unlikely(!target_freq) )
+    {
+        amd_pstate_warn("Not setting target frequency to zero\n");
+        return 0;
+    }
+    max_perf = data->hw.highest_perf;
+    min_perf = data->hw.lowest_nonlinear_perf;
+    des_perf = amd_pstate_khz_to_perf(data, target_freq);
+
+    return amd_pstate_write_request(policy->cpu, min_perf, des_perf, max_perf);
+}
+
+static void cf_check amd_pstate_init_msrs(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    struct amd_pstate_drv_data *data = this_cpu(amd_pstate_drv_data);
+    uint64_t val;
+    unsigned int min_freq, nominal_freq, max_freq;
+
+    /* Package level MSR */
+    if ( rdmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
+    {
+        amd_pstate_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_ENABLE)\n");
+        data->err = -EINVAL;
+        return;
+    }
+
+    if ( !(val & AMD_CPPC_ENABLE) )
+    {
+        val |= AMD_CPPC_ENABLE;
+        if ( wrmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
+        {
+            amd_pstate_err(policy->cpu, "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
+            data->err = -EINVAL;
+            return;
+        }
+    }
+
+    if ( rdmsr_safe(MSR_AMD_CPPC_CAP1, data->amd_caps) )
+    {
+        amd_pstate_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_CAP1)\n");
+        goto error;
+    }
+
+    if ( data->hw.highest_perf == 0 || data->hw.lowest_perf == 0 ||
+         data->hw.nominal_perf == 0 || data->hw.lowest_nonlinear_perf == 0 )
+    {
+        amd_pstate_err(policy->cpu, "Platform malfunction, read CPPC highest_perf: %u, lowest_perf: %u, nominal_perf: %u, lowest_nonlinear_perf: %u zero value\n",
+                       data->hw.highest_perf, data->hw.lowest_perf,
+                       data->hw.nominal_perf, data->hw.lowest_nonlinear_perf);
+        goto error;
+    }
+
+    min_freq = amd_get_min_freq(data);
+    nominal_freq = amd_get_nominal_freq(data);
+    max_freq = amd_get_max_freq(data);
+    if ( min_freq > max_freq )
+    {
+        amd_pstate_err(policy->cpu, "min_freq(%u) or max_freq(%u) value is incorrect\n",
+                       min_freq, max_freq);
+        goto error;
+    }
+
+    policy->min = min_freq;
+    policy->max = max_freq;
+
+    policy->cpuinfo.min_freq = min_freq;
+    policy->cpuinfo.max_freq = max_freq;
+    policy->cpuinfo.perf_freq = nominal_freq;
+    policy->cur = nominal_freq;
+
+    /* Initial processor data capability frequencies */
+    data->min_freq = min_freq;
+    data->nominal_freq = nominal_freq;
+    data->max_freq = max_freq;
+
+    data->err = 0;
+    return;
+
+ error:
+    data->err = -EINVAL;
+    val &= ~AMD_CPPC_ENABLE;
+    if ( wrmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
+        amd_pstate_err(policy->cpu, "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
+}
+
+/*
+ * The new AMD P-States driver is different than legacy ACPI hardware P-State,
+ * which has a finer grain frequency range between the highest and lowest
+ * frequency. And boost frequency is actually the frequency which is mapped on
+ * highest performance ratio. The legacy P0 frequency is actually mapped on
+ * nominal performance ratio.
+ */
+static void amd_pstate_boost_init(struct cpufreq_policy *policy, struct amd_pstate_drv_data *data)
+{
+    uint32_t highest_perf, nominal_perf;
+
+    highest_perf = data->hw.highest_perf;
+    nominal_perf = data->hw.nominal_perf;
+
+    if ( highest_perf <= nominal_perf )
+        return;
+
+    policy->turbo = CPUFREQ_TURBO_ENABLED;
+}
+
+static int cf_check amd_pstate_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_pstate_drv_data *data;
+
+    data = xzalloc(struct amd_pstate_drv_data);
+    if ( !data )
+        return -ENOMEM;
+
+    data->cppc_data = &processor_pminfo[cpu]->cppc_data;
+
+    policy->governor = cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERNOR;
+
+    per_cpu(amd_pstate_drv_data, cpu) = data;
+
+    on_selected_cpus(cpumask_of(cpu), amd_pstate_init_msrs, policy, 1);
+
+    if ( data->err )
+    {
+        amd_pstate_err(cpu, "Could not initialize AMD CPPC MSR properly\n");
+        per_cpu(amd_pstate_drv_data, cpu) = NULL;
+        xfree(data);
+        return -ENODEV;
+    }
+
+    amd_pstate_boost_init(policy, data);
+    return 0;
+}
+
+static int cf_check amd_pstate_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, policy->cpu);
+
+    per_cpu(amd_pstate_drv_data, policy->cpu) = NULL;
+    xfree(data);
+
+    return 0;
+}
+
 static const struct cpufreq_driver __initconstrel amd_pstate_cpufreq_driver =
 {
     .name   = XEN_AMD_PSTATE_DRIVER_NAME,
+    .verify = amd_pstate_cpufreq_verify,
+    .target = amd_pstate_cpufreq_target,
+    .init   = amd_pstate_cpufreq_cpu_init,
+    .exit   = amd_pstate_cpufreq_cpu_exit,
 };
 
 int __init amd_pstate_register_driver(void)
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 9cdb5b2625..14eaddcaad 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -455,6 +455,11 @@
 #define MSR_AMD_PPIN_CTL                0xc00102f0U
 #define MSR_AMD_PPIN                    0xc00102f1U
 
+#define MSR_AMD_CPPC_CAP1               0xc00102b0
+#define MSR_AMD_CPPC_ENABLE             0xc00102b1
+#define MSR_AMD_CPPC_REQ                0xc00102b3
+#define AMD_CPPC_ENABLE                 BIT(0, ULL)
+
 /* VIA Cyrix defined MSRs*/
 #define MSR_VIA_FCR			0x00001107
 #define MSR_VIA_RNG			0x0000110b
-- 
2.34.1


