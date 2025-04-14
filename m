Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230DA87968
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949185.1345844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4EaR-0006nK-Tk; Mon, 14 Apr 2025 07:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949185.1345844; Mon, 14 Apr 2025 07:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4EaR-0006kV-PK; Mon, 14 Apr 2025 07:50:35 +0000
Received: by outflank-mailman (input) for mailman id 949185;
 Mon, 14 Apr 2025 07:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERz-0000Ks-Gl
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:51 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:200a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea552f81-1903-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 09:41:47 +0200 (CEST)
Received: from CH2PR14CA0003.namprd14.prod.outlook.com (2603:10b6:610:60::13)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 07:41:40 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::fb) by CH2PR14CA0003.outlook.office365.com
 (2603:10b6:610:60::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 07:41:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:37 -0500
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
X-Inumbo-ID: ea552f81-1903-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvUWsWBL4AHCmXFb3y6ZNyjxkD/55Qf5MGEljqwAMxWVwRnJ003YWF51Cyfi5yB6Y6mP2HPqUr8NN1sr5knfSOW0TpXKtXPlRkTfBKd9i6b6zkQ6ZmkoC2hr4CYMMmPeJgNT/twOtHyKU6eSO2gy153CGIfzZ+pFtRtmOUgekqLlc9eIe0ypXvtswUA3y9IVGrW2TcrEre79Jwi4WhbRdn401s5Sw2gRQJ3gNmtf1iYQIw/s93VwcarSkJH3G7WAPN1tiAdJRd/Hf1DuI/AM7F26NcqttyiXw2EgW8jQ2IFikWMyPxlFibhmlruLOYzZsg/HyNddbFpUE1ayBabABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rk631RlTo98VfmfT4ziRgfHzrRt52/TQ2E4HOv/hOcw=;
 b=jMII2UT+nrQ4yWJLrsUp37ZpXvwJR1mK7VFBqs5RX0YVggs8meiHA5Lxz6K/EUhtDJI1+kUeZrqjgnloHTUU1XCIEv5uawcfbABF8tVAK9oczIMTlY1GeQEEOdFecDTmoW6+iBF6UJKYirCNj9WqoA9EN94wDEPfwh9D4OvzfvqrGbYX93oKcUK0XpH+f0tb1I4N7XaqAh4QcxKG67Bt22vqS50eWLI+GQKmZAoofUqWMXEe49dfA8o8pu+h1OUABb0utjGqeJdETW4OfA32I4jQNAkUVNy4E/j1B2mHSBn9OmFS2jgmQwpo8rpvZMDvNwDIThi0Yq5X79O9lRFKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk631RlTo98VfmfT4ziRgfHzrRt52/TQ2E4HOv/hOcw=;
 b=FfSSWc0B6VsvC/64KLt62Y82QhMNf4qZP1pd1Xg11XUbVGYFw8xWHXOKDMv8FqLVAJZMXDeGwODy4y/w+qImBWy3zIOfWEEC5QlTHWSeN/9ESFVKWzMsE6uHRqwA8nTyAiiETDaxau0Mbi6xd3AqWR666k4KHSP8BKYzxwvhe58=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 09/15] xen/x86: introduce a new amd cppc driver for cpufreq scaling
Date: Mon, 14 Apr 2025 15:40:50 +0800
Message-ID: <20250414074056.3696888-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 735ac579-4b0a-45dd-74dd-08dd7b27cb24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTZMRk9TNmtyREh0VzJxYnd3MWZiVVlDVVpvSjRrNEVvYnA2elFhS1BtWkFz?=
 =?utf-8?B?M1ZQQ1NpRE5mZ0l6TXhMNmw1ekZCUExaR0UyT3U3T0daekl3M3AwQVJZRlEz?=
 =?utf-8?B?K09mMEsxRDVNZTNxRjExVEtyQmxTK2ZqNEx1TkdoTjRTVGVZcnp3YWV1UnYv?=
 =?utf-8?B?YmRQT0cvNCtmaVM0TFc1c0ZRV0hPMXZYNlZtUkxSUVF0TVIxRXlyNXRGYzVr?=
 =?utf-8?B?K3R0MmJhcGxYaGdXb3ZKRGxSdHBlTkxaeFc0U1hRNXh3WE8xUUdFVEpWNTBv?=
 =?utf-8?B?NjVwY1ZiMkUrenE5REpyTnlzRkNNb3JaZVBZRjE0VGVPZ1VNczVhWEVTR3No?=
 =?utf-8?B?MjJwNHhGMlpBL3J6MzRCUVRuWEc4cithTDNWR2lYS0V2VmFMaGhNMnVYMS9O?=
 =?utf-8?B?VXhLaStYR3BsQjViei9oc2dzVkpIdHhoRmQ0RUpCMmJUUXd2OWhtSHFvTVJp?=
 =?utf-8?B?bVlVKzUvU25LVW95czFSaEFzZDVuWWt4b2pPSFF3VkpQa0x4RTc2aS9JM1ZR?=
 =?utf-8?B?LzZ1TW9tL3FyS2I5UHRmNWhxaXVGWkpoclBGYmtQcjd0bjdTdzR0YWtMdEQy?=
 =?utf-8?B?WlpwQ0VDalJMais1dG05bmo4a1JOejQ5cXpwL0dRMzdCV0tIKzZXYmRNUDR2?=
 =?utf-8?B?R0lFQnpVTDhJN0dsT2RoM2Z3WVU2eGI3Zzh2RGJGd0lRNlV0VmtMUS9VeklZ?=
 =?utf-8?B?aUtQOE1XeUx3K1NGMTVwaWpsT2tja3RtWUJkSmxOU3ZPVy9TcFdNbnd5bUc4?=
 =?utf-8?B?enlXSUUrNyt6emF6a3FOaEkwc3FHOFp0Y3lPRy9tQjNyN2JOeldMczI5bGkr?=
 =?utf-8?B?UCtCdVc2TVJUZjZLSC8zTXROZUlFcmJjRFRaSTFPOWNZL1dINUpjZXlna3VL?=
 =?utf-8?B?K1kvSEk2ajRlaitIOXNnbURpT0Rkc0g1RTg4cjA1aWhhMmlpaU1tUFVkY3VH?=
 =?utf-8?B?akQ2WGlBNHl6YmVuK0JCZ0M0SERFRGJlaERXRHBPd3JOaXY4TzVTTG8zeHAx?=
 =?utf-8?B?RVU0Nkx4UTRuN2xIWjI3Z3dvTG9hdVpYOUlreVh6Y3hNMUV1V0EzVGFFTEpz?=
 =?utf-8?B?YmJteURNVVcwUmZoc2Y4aXRtYkMvU2xuTjdWenIxRTZpaDYwSGlUYnhyRGZC?=
 =?utf-8?B?OTdCaU10R016cVQ4bVZ6dHhMUU9mVGVnRmJPS1RsMmFrL0lZelVKbU1BYTA4?=
 =?utf-8?B?bFVCWThCMG9XTjM4RkFPZFlqUnFKbkxSYnE2a1BPeGo4YmJPa3dlQW8yK2Fj?=
 =?utf-8?B?WFFQUjk3Umc2RnNrclphOUJCVVhpOVM5S2I1M0FUYlg4Z2k5R2d0RG9GeEh3?=
 =?utf-8?B?ZzVPMXVPRWNFNk9Za1NZeUhiOGd5b3ExY3VublRIWG1yajNtcjlza3c2bkFJ?=
 =?utf-8?B?cmtFRDF2c29mRWMzYk1sU2RvdUEyZEZHOUJSaVcvQXpWbHF6Q1ZqclJqWjd0?=
 =?utf-8?B?TzY2U3YxNDNQT2VBR1I0NjJoY2drQU9aM2U1ZkNGclFGUTc4dFZsSUZ6ZmxM?=
 =?utf-8?B?bWYwSnZSSTBna2V6bFV4YmlZZG41RGthWm53c21LLzlYMk1Za1dCaUtYOGl4?=
 =?utf-8?B?Q3hOMkVQRjFIMDExUlNqazhwU3JtRU0rbjdSV0tINnE4RFRVcWtUTjczbWJ6?=
 =?utf-8?B?eXo4UUFuQWsweis1VGpOL3E0NS9DSk9tU3BlRjJYS2U5UGN2a3A3QUcvV3E4?=
 =?utf-8?B?MUFpejNEMlNTclkzZXpXd2RRTHFVUXoyU1J4RWJza3N3NHZjVFBhYmg0T0FE?=
 =?utf-8?B?ckVYb1NqUzVQajlXeFhZZmQ4N1FoOTM2dTEvdm0zQkNLMHZZUGNQelRFbDE0?=
 =?utf-8?B?UERjeWJYRXA1bkg1dnE4cHRUbHBZb2dSTVFSU2toc2JHRmdCQmxXcXRxUVZo?=
 =?utf-8?B?SmZIR09SNDRHenJ3ZzJuN0VpWDdFUkpxQlVyT0FaV1RKVlB3YjlXMFA4UlVG?=
 =?utf-8?B?bk9rY05XUDFqM0JBdFJ2ZmJ4U0wxTWxYTUdCMzBNOUdDb3NCdmM2eHdZSnN2?=
 =?utf-8?B?cDR2SjkzQ2lLazM4Nk11aDdNeWlmczQ2QW1NWkp0MllWZjRQVGJvMmkrclJY?=
 =?utf-8?Q?E3hapT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:39.7958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 735ac579-4b0a-45dd-74dd-08dd7b27cb24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442

amd-cppc is the AMD CPU performance scaling driver that introduces a
new CPU frequency control mechanism firstly on AMD Zen based CPU series.
The new mechanism is based on Collaborative Processor Performance
Control (CPPC) which is a finer grain frequency management
than legacy ACPI hardware P-States.
Current AMD CPU platforms are using the ACPI P-states driver to
manage CPU frequency and clocks with switching only in 3 P-states.
The new amd-cppc allows a more flexible, low-latency interface for Xen
to directly communicate the performance hints to hardware.

The first version "amd-cppc" could leverage common governors such as
*ondemand*, *performance*, etc, to manage the performance hints. In the
future, we will introduce an advanced active mode to enable autonomous
performence level selection.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- re-construct union caps and req to have anonymous struct instead
- avoid "else" when the earlier if() ends in an unconditional control flow statement
- Add check to avoid chopping off set bits from cast
- make pointers pointer-to-const wherever possible
- remove noisy log
- exclude families before 0x17 before CPPC-feature MSR op
- remove useless variable helpers
- use xvzalloc and XVFREE
- refactor error handling as ENABLE bit can only be cleared by reset
---
v2 -> v3:
- Move all MSR-definations to msr-index.h and follow the required style
- Refactor opening figure braces for struct/union
- Sort overlong lines throughout the series
- Make offset/res int covering underflow scenario
- Error out when amd_max_freq_mhz isn't set
- Introduce amd_get_freq(name) macro to decrease redundancy
- Supported CPU family checked ahead of smp-function
- Nominal freq shall be checked between the [min, max]
- Use APERF/MPREF to calculate current frequency
- Use amd_cppc_cpufreq_cpu_exit() to tidy error path
---
v3 -> v4:
- verbose print shall come with a CPU number
- deal with res <= 0 in amd_cppc_khz_to_perf()
- introduce a single helper amd_get_lowest_or_nominal_freq() to cover both
lowest and nominal scenario
- reduce abuse of wrmsr_safe()/rdmsr_safe() with wrmsrl()/rdmsrl()
- move cf_check from amd_cppc_write_request() to amd_cppc_write_request_msrs()
- add comment to explain why setting non_linear_lowest in passive mode
- add check to ensure perf values in
lowest <= non_linear_lowest <= nominal <= highset
- refactor comment for "data->err != 0" scenario
- use "data->err" instead of -ENODEV
- add U suffixes for all msr macro
---
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 393 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr-index.h |   5 +
 2 files changed, 398 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 8a081e5523..2fdfd17f59 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -14,7 +14,56 @@
 #include <xen/domain.h>
 #include <xen/init.h>
 #include <xen/param.h>
+#include <xen/percpu.h>
+#include <xen/xvmalloc.h>
 #include <acpi/cpufreq/cpufreq.h>
+#include <asm/amd.h>
+#include <asm/msr-index.h>
+
+#define amd_cppc_err(cpu, fmt, args...)                             \
+    printk(XENLOG_ERR "AMD_CPPC: CPU%u error: " fmt, cpu, ## args)
+#define amd_cppc_warn(cpu, fmt, args...)                            \
+    printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)
+#define amd_cppc_verbose(cpu, fmt, args...)                         \
+({                                                                  \
+    if ( cpufreq_verbose )                                          \
+        printk(XENLOG_DEBUG "AMD_CPPC: CPU%u " fmt, cpu, ## args);  \
+})
+
+struct amd_cppc_drv_data
+{
+    const struct xen_processor_cppc *cppc_data;
+    union {
+        uint64_t raw;
+        struct {
+            unsigned int lowest_perf:8;
+            unsigned int lowest_nonlinear_perf:8;
+            unsigned int nominal_perf:8;
+            unsigned int highest_perf:8;
+            unsigned int :32;
+        };
+    } caps;
+    union {
+        uint64_t raw;
+        struct {
+            unsigned int max_perf:8;
+            unsigned int min_perf:8;
+            unsigned int des_perf:8;
+            unsigned int epp:8;
+            unsigned int :32;
+        };
+    } req;
+
+    int err;
+};
+
+static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *,
+                                  amd_cppc_drv_data);
+/*
+ * Core max frequency read from PstateDef as anchor point
+ * for freq-to-perf transition
+ */
+static DEFINE_PER_CPU_READ_MOSTLY(uint64_t, amd_max_pxfreq_mhz);
 
 static bool __init amd_cppc_handle_option(const char *s, const char *end)
 {
@@ -51,10 +100,354 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
     return 0;
 }
 
+/*
+ * If CPPC lowest_freq and nominal_freq registers are exposed then we can
+ * use them to convert perf to freq and vice versa. The conversion is
+ * extrapolated as an linear function passing by the 2 points:
+ *  - (Low perf, Low freq)
+ *  - (Nominal perf, Nominal freq)
+ */
+static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
+                                unsigned int freq, uint8_t *perf)
+{
+    const struct xen_processor_cppc *cppc_data = data->cppc_data;
+    uint64_t mul, div;
+    int offset = 0, res;
+
+    if ( freq == (cppc_data->cpc.nominal_mhz * 1000) )
+    {
+        *perf = data->caps.nominal_perf;
+        return 0;
+    }
+
+    if ( freq == (cppc_data->cpc.lowest_mhz * 1000) )
+    {
+        *perf = data->caps.lowest_perf;
+        return 0;
+    }
+
+    if ( cppc_data->cpc.lowest_mhz && cppc_data->cpc.nominal_mhz &&
+         cppc_data->cpc.lowest_mhz < cppc_data->cpc.nominal_mhz )
+    {
+        mul = data->caps.nominal_perf - data->caps.lowest_perf;
+        div = cppc_data->cpc.nominal_mhz - cppc_data->cpc.lowest_mhz;
+
+        /*
+         * We don't need to convert to kHz for computing offset and can
+         * directly use nominal_mhz and lowest_mhz as the division
+         * will remove the frequency unit.
+         */
+        offset = data->caps.nominal_perf -
+                 (mul * cppc_data->cpc.nominal_mhz) / div;
+    }
+    else
+    {
+        /* Read Processor Max Speed(MHz) as anchor point */
+        mul = data->caps.highest_perf;
+        div = this_cpu(amd_max_pxfreq_mhz);
+        if ( !div || div == INVAL_FREQ_MHZ )
+            return -EINVAL;
+    }
+
+    res = offset + (mul * freq) / (div * 1000);
+    if ( res > UINT8_MAX )
+    {
+        printk_once(XENLOG_WARNING
+                    "Perf value exceeds maximum value 255: %d\n", res);
+        *perf = 0xff;
+        return 0;
+    } else if ( res < 0 )
+    {
+        printk_once(XENLOG_WARNING
+                    "Perf value smaller than minimum value 0: %d\n", res);
+        *perf = 0;
+        return 0;
+    }
+    *perf = (uint8_t)res;
+
+    return 0;
+}
+
+static int amd_get_lowest_or_nominal_freq(const struct amd_cppc_drv_data *data,
+                                          uint32_t cpc_mhz, uint8_t perf,
+                                          unsigned int *freq)
+{
+    uint64_t mul, div, res;
+
+    if ( !freq )
+        return -EINVAL;
+
+    if ( cpc_mhz )
+    {
+        /* Switch to khz */
+        *freq = cpc_mhz * 1000;
+        return 0;
+    }
+
+    /* Read Processor Max Speed(MHz) as anchor point */
+    mul = this_cpu(amd_max_pxfreq_mhz);
+    if ( mul == INVAL_FREQ_MHZ || !mul )
+    {
+        printk(XENLOG_ERR
+               "Failed to read valid processor max frequency as anchor point: %lu\n",
+               mul);
+        return -EINVAL;
+    }
+    div = data->caps.highest_perf;
+    res = (mul * perf * 1000) / div;
+
+    if ( res > UINT_MAX || !res )
+    {
+        printk(XENLOG_ERR
+               "Frequeny exceeds maximum value UINT_MAX or being zero value: %lu\n",
+               res);
+        return -EINVAL;
+    }
+    *freq = (unsigned int)res;
+
+    return 0;
+}
+
+static int amd_get_max_freq(const struct amd_cppc_drv_data *data,
+                            unsigned int *max_freq)
+{
+    unsigned int nom_freq = 0, boost_ratio;
+    int res;
+
+    res = amd_get_lowest_or_nominal_freq(data,
+                                         data->cppc_data->cpc.nominal_mhz,
+                                         data->caps.nominal_perf,
+                                         &nom_freq);
+    if ( res )
+        return res;
+
+    boost_ratio = (unsigned int)(data->caps.highest_perf /
+                                 data->caps.nominal_perf);
+    *max_freq = nom_freq * boost_ratio;
+
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_verify(struct cpufreq_policy *policy)
+{
+    cpufreq_verify_within_limits(policy, policy->cpuinfo.min_freq,
+                                 policy->cpuinfo.max_freq);
+
+    return 0;
+}
+
+static void cf_check amd_cppc_write_request_msrs(void *info)
+{
+    const struct amd_cppc_drv_data *data = info;
+
+    wrmsrl(MSR_AMD_CPPC_REQ, data->req.raw);
+}
+
+static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
+                                   uint8_t des_perf, uint8_t max_perf)
+{
+    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint64_t prev = data->req.raw;
+
+    data->req.min_perf = min_perf;
+    data->req.max_perf = max_perf;
+    data->req.des_perf = des_perf;
+
+    if ( prev == data->req.raw )
+        return;
+
+    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);
+}
+
+static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
+                                            unsigned int target_freq,
+                                            unsigned int relation)
+{
+    unsigned int cpu = policy->cpu;
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint8_t des_perf;
+    int res;
+
+    if ( unlikely(!target_freq) )
+        return 0;
+
+    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
+    if ( res )
+        return res;
+
+    /*
+     * Setting with "lowest_nonlinear_perf" to ensure governoring
+     * performance in P-state range.
+     */
+    amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
+                           des_perf, data->caps.highest_perf);
+    return 0;
+}
+
+static void cf_check amd_cppc_init_msrs(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    struct amd_cppc_drv_data *data = this_cpu(amd_cppc_drv_data);
+    uint64_t val;
+    unsigned int min_freq = 0, nominal_freq = 0, max_freq;
+
+    /* Package level MSR */
+    rdmsrl(MSR_AMD_CPPC_ENABLE, val);
+    /*
+     * Only when Enable bit is on, the hardware will calculate the processor’s
+     * performance capabilities and initialize the performance level fields in
+     * the CPPC capability registers.
+     */
+    if ( !(val & AMD_CPPC_ENABLE) )
+    {
+        val |= AMD_CPPC_ENABLE;
+        wrmsrl(MSR_AMD_CPPC_ENABLE, val);
+    }
+
+    rdmsrl(MSR_AMD_CPPC_CAP1, data->caps.raw);
+
+    if ( data->caps.highest_perf == 0 || data->caps.lowest_perf == 0 ||
+         data->caps.nominal_perf == 0 || data->caps.lowest_nonlinear_perf == 0 ||
+         data->caps.lowest_perf > data->caps.lowest_nonlinear_perf ||
+         data->caps.lowest_nonlinear_perf > data->caps.nominal_perf ||
+         data->caps.nominal_perf > data->caps.highest_perf )
+    {
+        amd_cppc_err(policy->cpu,
+                     "Platform malfunction, read CPPC capability highest(%u), lowest(%u), nominal(%u), lowest_nonlinear(%u) zero value\n",
+                     data->caps.highest_perf, data->caps.lowest_perf,
+                     data->caps.nominal_perf, data->caps.lowest_nonlinear_perf);
+        goto err;
+    }
+
+    amd_process_freq(cpu_data + policy->cpu,
+                     NULL, NULL, &this_cpu(amd_max_pxfreq_mhz));
+
+    data->err = amd_get_lowest_or_nominal_freq(data,
+                                               data->cppc_data->cpc.lowest_mhz,
+                                               data->caps.lowest_perf,
+                                               &min_freq);
+    if ( data->err )
+        return;
+
+    data->err = amd_get_lowest_or_nominal_freq(data,
+                                               data->cppc_data->cpc.nominal_mhz,
+                                               data->caps.nominal_perf,
+                                               &nominal_freq);
+    if ( data->err )
+        return;
+
+    data->err = amd_get_max_freq(data, &max_freq);
+    if ( data->err )
+        return;
+
+    if ( min_freq > nominal_freq || nominal_freq > max_freq )
+    {
+        amd_cppc_err(policy->cpu,
+                     "min(%u), or max(%u), or nominal(%u) freq value is incorrect\n",
+                     min_freq, max_freq, nominal_freq);
+        goto err;
+    }
+
+    policy->min = min_freq;
+    policy->max = max_freq;
+
+    policy->cpuinfo.min_freq = min_freq;
+    policy->cpuinfo.max_freq = max_freq;
+    policy->cpuinfo.perf_freq = nominal_freq;
+    /*
+     * Set after policy->cpuinfo.perf_freq, as we are taking
+     * APERF/MPERF average frequency as current frequency.
+     */
+    policy->cur = cpufreq_driver_getavg(policy->cpu, GOV_GETAVG);
+
+    return;
+
+ err:
+    /*
+     * No fallback shceme is available here, see more explanation at call
+     * site in amd_cppc_cpufreq_cpu_init().
+     */
+    data->err = -EINVAL;
+}
+
+/*
+ * AMD CPPC driver is different than legacy ACPI hardware P-State,
+ * which has a finer grain frequency range between the highest and lowest
+ * frequency. And boost frequency is actually the frequency which is mapped on
+ * highest performance ratio. The legacy P0 frequency is actually mapped on
+ * nominal performance ratio.
+ */
+static void amd_cppc_boost_init(struct cpufreq_policy *policy,
+                                const struct amd_cppc_drv_data *data)
+{
+    if ( data->caps.highest_perf <= data->caps.nominal_perf )
+        return;
+
+    policy->turbo = CPUFREQ_TURBO_ENABLED;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+    XVFREE(per_cpu(amd_cppc_drv_data, policy->cpu));
+
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_cppc_drv_data *data;
+    const struct cpuinfo_x86 *c = cpu_data + cpu;
+
+    data = xvzalloc(struct amd_cppc_drv_data);
+    if ( !data )
+        return -ENOMEM;
+
+    data->cppc_data = &processor_pminfo[cpu]->cppc_data;
+
+    per_cpu(amd_cppc_drv_data, cpu) = data;
+
+    /* Feature CPPC is firstly introduced on Zen2 */
+    if ( c->x86 < 0x17 )
+    {
+        printk_once("Unsupported cpu family: %x\n", c->x86);
+        return -EOPNOTSUPP;
+    }
+
+    on_selected_cpus(cpumask_of(cpu), amd_cppc_init_msrs, policy, 1);
+
+    /*
+     * The enable bit is sticky, as we need to enable it at the very first
+     * begining, before CPPC capability sanity check.
+     * If error path takes effective, not only amd-cppc cpufreq driver fails
+     * to initialize, but also we could not fall back to legacy P-states
+     * driver, irrespective of the command line specifying a fallback option.
+     */
+    if ( data->err )
+    {
+        amd_cppc_err(cpu, "Could not initialize AMD CPPC MSR properly\n");
+        amd_cppc_cpufreq_cpu_exit(policy);
+        return data->err;
+    }
+
+    policy->governor = cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERNOR;
+
+    amd_cppc_boost_init(policy, data);
+
+    amd_cppc_verbose(policy->cpu,
+                     "CPU initialized with amd-cppc passive mode\n");
+
+    return 0;
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
     .name   = XEN_AMD_CPPC_DRIVER_NAME,
+    .verify = amd_cppc_cpufreq_verify,
+    .target = amd_cppc_cpufreq_target,
+    .init   = amd_cppc_cpufreq_cpu_init,
+    .exit   = amd_cppc_cpufreq_cpu_exit,
 };
 
 int __init amd_cppc_register_driver(void)
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 22d9e76e55..3ffa613df0 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -238,6 +238,11 @@
 
 #define MSR_AMD_CSTATE_CFG                  0xc0010296U
 
+#define MSR_AMD_CPPC_CAP1                   0xc00102b0U
+#define MSR_AMD_CPPC_ENABLE                 0xc00102b1U
+#define  AMD_CPPC_ENABLE                    (_AC(1, ULL) <<  0)
+#define MSR_AMD_CPPC_REQ                    0xc00102b3U
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
-- 
2.34.1


