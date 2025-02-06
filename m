Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2489BA2A334
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882561.1292722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKO-0002Ku-Fu; Thu, 06 Feb 2025 08:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882561.1292722; Thu, 06 Feb 2025 08:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKO-0002Hw-A0; Thu, 06 Feb 2025 08:33:40 +0000
Received: by outflank-mailman (input) for mailman id 882561;
 Thu, 06 Feb 2025 08:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKM-0000gq-AV
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2417::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e255f59-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:36 +0100 (CET)
Received: from BN9P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::23)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 08:33:31 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::75) by BN9P221CA0024.outlook.office365.com
 (2603:10b6:408:10a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Thu,
 6 Feb 2025 08:33:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:31 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:28 -0600
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
X-Inumbo-ID: 0e255f59-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9pp8aWmZELUrBljwAPz+cy30xRg8fERO6u+JIynBLnPCKEsY/ZiiEeQ3I/EHZsZuxd7utvt5Q6OVwTbrgdYiY5X7cdDeDkXllnU5LInuXPclaXCAGv62qxWDoSzq4e/kBUhec0Fxd/mASg9sW+cPdk+i7Deivy0o+JiaNMOO/Mon5y7BCsqRJFafO/hucceYnAaoWkbCG+VadvtHn4YcR75TgSsm1iWDCkfwyzJ1EI6fBX1FSZHS8RnFFe7tky7aqDL0TQ9zI1wdXx7ZKSmyhPuRVdJEU7tiYETFoOH9JCK7X/HKnkfZn/T/Vp9/OIRW1sCObLPt8W+zIR1eGxbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LspwcHRkx6DzmuuFQTSAz3wY4j5ZsM3Q/YtG5VwVqDs=;
 b=NXvf0Tww9LxIzmQmqqaRaRmxCy5AakK9bdUFy2qcu12dsXEtaofjS+0MNluspVordtRs4cSut2rwAAcABszVk6Wvj3f4eN9Tecs2FCY4ITdr2KRivuO1aN0SD/K0yx9nSrxMrVOZqz6XHhLyNhM+L9/TZkBzW4zmLxeZ/JWydOYq1dfvXlfEcXMPUFZvlwUJbXc5HlrlFswvCoFhW2xH0Zpk9DxYmV/uhHiiY6Vy+D7WNrKZN/s1AbynW5CbLvvVKnoa7k+QwH+MhQn+1XFsy8RGH4L7DrVkmulBxaJKmy9MV0pVf+OgTkhu1ucfXWyHKjcPMwQYK+zBFtvg8wxhpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LspwcHRkx6DzmuuFQTSAz3wY4j5ZsM3Q/YtG5VwVqDs=;
 b=zSSdZENPJm0Y22Yg9bHVWUYDDZGKwIoFoCKjR8xJJb/uOljpmH/igrcoRRYwcFWG3Ufrmori7c3XGwW1YQAFfdc5/dgobx4guJxcSkzp35Q2rYwUz+gcaqvZ2ieWt3vNlXZdrjXgcGMcuelEV7eLHSmlNzQHYb/9kTNaCEAzNNg=
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
	<roger.pau@citrix.com>
Subject: [PATCH v2 05/11] xen/x86: introduce a new amd cppc driver for cpufreq scaling
Date: Thu, 6 Feb 2025 16:32:49 +0800
Message-ID: <20250206083255.1296363-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1c3972-8afa-4e38-1ebf-08dd4688efec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEJSMWpTUUtCWTNKNkpIZ2pvWmlVakhjcTdlemkxY092OFhJRllyWXZhaHR2?=
 =?utf-8?B?UlhSdFlqd2RQdDVYNW1XVXRvVHNiWDNSTVduMXhQS08xZGxmcEdmOW9iNllV?=
 =?utf-8?B?MU8rbTFQdU9hTi9lOFBZWTRMaDh0d3poSE83MTk1UmdJcW9sOGVudU1RNytQ?=
 =?utf-8?B?R1Vydm5IUGpjMlZmamo1c2NFd3pWZ2hwL2FpM09TNUt5eWRxVlU4M0ZyQXNC?=
 =?utf-8?B?VE04MDdaUGc0NDlWbnRENG4xYWFRUDI4cE8rZDBsMHBQS2s0eVkxRk5kaDBS?=
 =?utf-8?B?dThScVg2M0lwVW5ad0gvM2g1ZU1ZRzA1ZDNrVTF0aDJQOTE3SVZIK2Y1UjYy?=
 =?utf-8?B?WXlsS2FUaHNVN2VRMnVvN1kva0dFZDU3WXZTSm5RbjlMa1gwYzhJR0RkcWY4?=
 =?utf-8?B?S1ZlMCtFckdQVUlrSmtPWGt0elRjdFIyRFJUbDE1NERUb2FqYVU0RSt1Z1lv?=
 =?utf-8?B?elhaMGNtVUFoVHArbWQvTnNVT0krVjZXbDBQSnY4enhXWlZlUCs3Z0tLakhs?=
 =?utf-8?B?b3JLY1hUdThCZWpDYWtNSEhIZVFXWENiYWduS3hhR2dXdzRmR2xjazNjYnhl?=
 =?utf-8?B?VFNyRjlNYVZGM3BGZWZRbGJEUzM2cTBnYzY2VG1qRG5xTThYeXhSd29UNUpO?=
 =?utf-8?B?ZnZJRFR0SEk4V1pjZEdWTVEwTnRIWnpkeHlkZDdVTnBtSkFQaTBsRGM5VGhl?=
 =?utf-8?B?WlY2RllCcmxCeTlOMVgxMCtBUzRyNEhRWXBOWFYxMHh6UlRNVHZEbDJDZ1lK?=
 =?utf-8?B?WjczYVRjd3hTemFaM0FrcDdwaWNLQ3Q3eC9RWHpTL3ZPc1lZek11MzNnWWp2?=
 =?utf-8?B?MnplbEdMczB4eS9yak5UTkl6aUtOOGRkYlMyd1pKanRLSjV3Y2hvM2dqWVQx?=
 =?utf-8?B?bXVZS0V2dVoyR0Y0QU1xWFpuVjFvRzRaM0xqa09DS256QzdqbVlqekNPMitH?=
 =?utf-8?B?RG1CMmNBS05CM1NTekFHa0wwV1hEWG1adkJqSXZDakU4K1BaMXB2QTkwalpF?=
 =?utf-8?B?MklNelY2SEdHYTF3aXJGTXN6d2FSS0VENXRQRXpJV29IS1laQ2x3a3dOT29u?=
 =?utf-8?B?YlBXZGdTMFpWNnYvbjlKR1UvK1B6bXFucFcxc28wYjlVNTdvaEtkejZsM1VC?=
 =?utf-8?B?cDV6VUE0Y3doS2FwYjhvamJ0ZGd5RldnMDcvcXNBcVpERXZkTUxrUTdxNm0z?=
 =?utf-8?B?SG9tMGptMzM3aTNGWlZlUHE0QjRHYitjYm1ReVhwK3pKZVNDc24zeVRlNis0?=
 =?utf-8?B?UUh3c1RLSEo3NzFLdXVoSGpVb0pPYnhQa0VNQ0NmZDFXaE5lWVAwdU1YTHl3?=
 =?utf-8?B?Z1RTaENETy9FL1lQVTBOSkV2TTZYdU9nMmhWQkRGVnpGYWluMjM4OFdPZlNt?=
 =?utf-8?B?QmIwY05qUUY5OFpodTF1ZUsyb2FvYkdBdkxWaTZ2dzVER3FuWlI1QjdKS1R5?=
 =?utf-8?B?U0pOSTY5bVJ4empUbkc0QWIzNFpzemRjNjNOeUdFRkdHN1Y0cy9KRFpzVTFC?=
 =?utf-8?B?K2NrV241VVZjRWRMSHNQWC9VZTJWb0FKQzdqejdyUWFGcmNXRTdWM2VjSFFa?=
 =?utf-8?B?YTcxMmJaUnRPWWluZHl1NGdCQm4wTVRiVk12azJPRU9nc000K2JOandhRU9I?=
 =?utf-8?B?Sm9ZZHRLcW1JaXVKTjcwalE1K1NOQ0N3MG1XWGZmL1cwNXI2S1E5aDI3ZjdL?=
 =?utf-8?B?NXNoOC9rcmUvalNjQXdGa29qUHRJenJ2WUlPN0VuWVBqWWUva1ZzaURwK1lM?=
 =?utf-8?B?bDY2VFJ2NGhXUEJCS2l2WjQrUW5HTHcyUnJ1cWhjeUlDbnoxS1B6L1UvOTBS?=
 =?utf-8?B?UjBJUHluRGhUSUMvamRMaDIrWEpkTTZJN0NzRndONlJ0bzZ0ck02dWxreHFW?=
 =?utf-8?B?L1J5eWZYNjlTM0JkdWZFUkpRd3ZNK3JvajJ2TG40c0pWU3Y2M2srcTBQVlRR?=
 =?utf-8?B?L21RT1F0Uk14VlpLbjVVdStBZFRweU8zdXg3VXFJNlArZXZpQ01iSGU1MTZH?=
 =?utf-8?Q?0wk3hGtchezFxozf5S41AIdQZEhDzs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:31.0579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1c3972-8afa-4e38-1ebf-08dd4688efec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

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
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 388 +++++++++++++++++++++++++++
 1 file changed, 388 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 2dca4a00f3..f14e7a6638 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -13,7 +13,61 @@
 
 #include <xen/init.h>
 #include <xen/param.h>
+#include <xen/percpu.h>
+#include <xen/xvmalloc.h>
 #include <acpi/cpufreq/cpufreq.h>
+#include <asm/amd.h>
+
+#define MSR_AMD_CPPC_CAP1               0xc00102b0
+#define MSR_AMD_CPPC_ENABLE             0xc00102b1
+#define AMD_CPPC_ENABLE                 BIT(0, ULL)
+#define MSR_AMD_CPPC_REQ                0xc00102b3
+
+#define amd_cppc_err(cpu, fmt, args...)                     \
+    printk(XENLOG_ERR "AMD_CPPC: CPU%u error: " fmt, cpu, ## args)
+#define amd_cppc_verbose(fmt, args...)                      \
+({                                                          \
+    if ( cpufreq_verbose )                                  \
+        printk(XENLOG_DEBUG "AMD_CPPC: " fmt, ## args);     \
+})
+#define amd_cppc_warn(fmt, args...)                         \
+    printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)
+
+struct amd_cppc_drv_data
+{
+    struct xen_processor_cppc *cppc_data;
+    union
+    {
+        uint64_t raw;
+        struct
+        {
+            unsigned int lowest_perf:8;
+            unsigned int lowest_nonlinear_perf:8;
+            unsigned int nominal_perf:8;
+            unsigned int highest_perf:8;
+            unsigned int :32;
+        };
+    } caps;
+    union
+    {
+        uint64_t raw;
+        struct
+        {
+            unsigned int max_perf:8;
+            unsigned int min_perf:8;
+            unsigned int des_perf:8;
+            unsigned int epp:8;
+            unsigned int :32;
+        };
+    } req;
+    int err;
+
+    uint32_t max_freq;
+    uint32_t min_freq;
+    uint32_t nominal_freq;
+};
+
+static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *, amd_cppc_drv_data);
 
 static bool __init amd_cppc_handle_option(const char *s, const char *end)
 {
@@ -50,9 +104,343 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
     return 0;
 }
 
+/*
+ * If CPPC lowest_freq and nominal_freq registers are exposed then we can
+ * use them to convert perf to freq and vice versa. The conversion is
+ * extrapolated as an affine function passing by the 2 points:
+ *  - (Low perf, Low freq)
+ *  - (Nominal perf, Nominal freq)
+ */
+static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data, unsigned int freq, uint8_t *perf)
+{
+    const struct xen_processor_cppc *cppc_data = data->cppc_data;
+    uint64_t mul, div, offset = 0, res;
+
+    if ( freq == (cppc_data->nominal_freq * 1000) )
+    {
+        *perf = data->caps.nominal_perf;
+        return 0;
+    }
+
+    if ( freq == (cppc_data->lowest_freq * 1000) )
+    {
+        *perf = data->caps.lowest_perf;
+        return 0;
+    }
+
+    if ( (cppc_data->lowest_freq) && (cppc_data->nominal_freq) )
+    {
+        mul = data->caps.nominal_perf - data->caps.lowest_perf;
+        div = cppc_data->nominal_freq - cppc_data->lowest_freq;
+        /*
+         * We don't need to convert to kHz for computing offset and can
+         * directly use nominal_freq and lowest_freq as the division
+         * will remove the frequency unit.
+         */
+        div = div ?: 1;
+        offset = data->caps.nominal_perf - (mul * cppc_data->nominal_freq) / div;
+    }
+    else
+    {
+        /* Read Processor Max Speed(mhz) as anchor point */
+        mul = data->caps.highest_perf;
+        div = this_cpu(max_freq_mhz);
+        if ( !div )
+            return -EINVAL;
+    }
+
+    res = offset + (mul * freq) / (div * 1000);
+    if ( res > UINT8_MAX )
+    {
+        printk(XENLOG_ERR "Perf value exceeds maximum value 255: %lu\n", res);
+        return -EINVAL;
+    }
+    *perf = (uint8_t)res;
+
+    return 0;
+}
+
+static int amd_get_min_freq(const struct amd_cppc_drv_data *data, unsigned int *min_freq)
+{
+    const struct xen_processor_cppc *cppc_data = data->cppc_data;
+    uint64_t mul, div, res;
+
+    if ( cppc_data->lowest_freq )
+    {
+        /* Switch to khz */
+        *min_freq = cppc_data->lowest_freq * 1000;
+        return 0;
+    }
+
+    /* Read Processor Max Speed(mhz) as anchor point */
+    mul = this_cpu(max_freq_mhz);
+    div = data->caps.highest_perf;
+    res = (mul * data->caps.lowest_perf * 1000) / div;
+    if ( res > UINT_MAX )
+    {
+        printk(XENLOG_ERR "Min freq exceeds maximum value UINT_MAX: %lu\n", res);
+        return -EINVAL;
+    }
+
+    *min_freq = (unsigned int)res;
+    return 0;
+}
+
+static int amd_get_nominal_freq(const struct amd_cppc_drv_data *data, unsigned int *nom_freq)
+{
+    const struct xen_processor_cppc *cppc_data = data->cppc_data;
+    uint64_t mul, div, res;
+
+    if ( cppc_data->nominal_freq )
+    {
+        /* Switch to khz */
+        *nom_freq = cppc_data->nominal_freq * 1000;
+        return 0;
+    }
+
+    /* Read Processor Max Speed(mhz) as anchor point */
+    mul = this_cpu(max_freq_mhz);
+    div = data->caps.highest_perf;
+    res = (mul * data->caps.nominal_perf * 1000) / div;
+    if ( res > UINT_MAX )
+    {
+        printk(XENLOG_ERR "Nominal freq exceeds maximum value UINT_MAX: %lu\n", res);
+        return -EINVAL;
+    }
+
+    *nom_freq = (unsigned int)res;
+    return 0;
+}
+
+static int amd_get_max_freq(const struct amd_cppc_drv_data *data, unsigned int *max_freq)
+{
+    unsigned int nom_freq, boost_ratio;
+    int res;
+
+    res = amd_get_nominal_freq(data, &nom_freq);
+    if ( res )
+        return res;
+
+    boost_ratio = (unsigned int)(data->caps.highest_perf / data->caps.nominal_perf);
+    *max_freq = nom_freq * boost_ratio;
+
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_verify(struct cpufreq_policy *policy)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, policy->cpu);
+
+    cpufreq_verify_within_limits(policy, data->min_freq, data->max_freq);
+
+    return 0;
+}
+
+static void amd_cppc_write_request_msrs(void *info)
+{
+    struct amd_cppc_drv_data *data = info;
+
+    if ( wrmsr_safe(MSR_AMD_CPPC_REQ, data->req.raw) )
+    {
+        data->err = -EINVAL;
+        return;
+    }
+    data->err = 0;
+}
+
+static int cf_check amd_cppc_write_request(int cpu, uint8_t min_perf,
+                                           uint8_t des_perf, uint8_t max_perf)
+{
+    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint64_t prev = data->req.raw;
+
+    data->req.min_perf = min_perf;
+    data->req.max_perf = max_perf;
+    data->req.des_perf = des_perf;
+
+    if ( prev == data->req.raw )
+        return 0;
+
+    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);
+
+    return data->err;
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
+    return amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
+                                  des_perf, data->caps.highest_perf);
+}
+
+static void cf_check amd_cppc_init_msrs(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    struct amd_cppc_drv_data *data = this_cpu(amd_cppc_drv_data);
+    uint64_t val;
+    unsigned int min_freq, nominal_freq, max_freq;
+    const struct cpuinfo_x86 *c = cpu_data + policy->cpu;
+
+    /* Feature CPPC is firstly introduiced on Zen2 */
+    if ( c->x86 < 0x17 )
+    {
+        amd_cppc_err(policy->cpu, "Unsupported cpu family: %x\n", c->x86);
+        data->err = -EOPNOTSUPP;
+        return;
+    }
+
+    /* Package level MSR */
+    if ( rdmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
+    {
+        amd_cppc_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_ENABLE)\n");
+        goto err;
+    }
+
+    /*
+     * Only when Enable bit is on, the hardware will calculate the processor’s
+     * performance capabilities and initialize the performance level fields in
+     * the CPPC capability registers.
+     */
+    if ( !(val & AMD_CPPC_ENABLE) )
+    {
+        val |= AMD_CPPC_ENABLE;
+        if ( wrmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
+        {
+            amd_cppc_err(policy->cpu, "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
+            goto err;
+        }
+    }
+
+    if ( rdmsr_safe(MSR_AMD_CPPC_CAP1, data->caps.raw) )
+    {
+        amd_cppc_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_CAP1)\n");
+        goto err;
+    }
+
+    if ( data->caps.highest_perf == 0 || data->caps.lowest_perf == 0 ||
+         data->caps.nominal_perf == 0 || data->caps.lowest_nonlinear_perf == 0 )
+    {
+        amd_cppc_err(policy->cpu,
+                     "Platform malfunction, read CPPC highest_perf: %u, lowest_perf: %u, nominal_perf: %u, lowest_nonlinear_perf: %u zero value\n",
+                     data->caps.highest_perf, data->caps.lowest_perf,
+                     data->caps.nominal_perf, data->caps.lowest_nonlinear_perf);
+        goto err;
+    }
+
+    data->err = amd_get_min_freq(data, &min_freq);
+    if ( data->err )
+        return;
+
+    data->err = amd_get_nominal_freq(data, &nominal_freq);
+    if ( data->err )
+        return;
+
+    data->err = amd_get_max_freq(data, &max_freq);
+    if ( data->err )
+        return;
+
+    if ( min_freq > max_freq )
+    {
+        amd_cppc_err(policy->cpu, "min_freq(%u) or max_freq(%u) value is incorrect\n",
+                     min_freq, max_freq);
+        goto err;
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
+    return;
+
+ err:
+    data->err = -EINVAL;
+}
+
+/*
+ * The new AMD CPPC driver is different than legacy ACPI hardware P-State,
+ * which has a finer grain frequency range between the highest and lowest
+ * frequency. And boost frequency is actually the frequency which is mapped on
+ * highest performance ratio. The legacy P0 frequency is actually mapped on
+ * nominal performance ratio.
+ */
+static void amd_cppc_boost_init(struct cpufreq_policy *policy, const struct amd_cppc_drv_data *data)
+{
+    if ( data->caps.highest_perf <= data->caps.nominal_perf )
+        return;
+
+    policy->turbo = CPUFREQ_TURBO_ENABLED;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_cppc_drv_data *data;
+
+    data = xvzalloc(struct amd_cppc_drv_data);
+    if ( !data )
+        return -ENOMEM;
+
+    data->cppc_data = &processor_pminfo[cpu]->cppc_data;
+
+    per_cpu(amd_cppc_drv_data, cpu) = data;
+
+    on_selected_cpus(cpumask_of(cpu), amd_cppc_init_msrs, policy, 1);
+
+    if ( data->err )
+    {
+        amd_cppc_err(cpu, "Could not initialize AMD CPPC MSR properly\n");
+        per_cpu(amd_cppc_drv_data, cpu) = NULL;
+        XVFREE(data);
+        return -ENODEV;
+    }
+
+    policy->governor = cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERNOR;
+
+    amd_cppc_boost_init(policy, data);
+
+    amd_cppc_verbose("CPU %u initialized with amd-cppc passive mode\n", policy->cpu);
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, policy->cpu);
+
+    per_cpu(amd_cppc_drv_data, policy->cpu) = NULL;
+    XVFREE(data);
+
+    return 0;
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber amd_cppc_cpufreq_driver =
 {
     .name   = XEN_AMD_CPPC_DRIVER_NAME,
+    .verify = amd_cppc_cpufreq_verify,
+    .target = amd_cppc_cpufreq_target,
+    .init   = amd_cppc_cpufreq_cpu_init,
+    .exit   = amd_cppc_cpufreq_cpu_exit,
 };
 
 int __init amd_cppc_register_driver(void)
-- 
2.34.1


