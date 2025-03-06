Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA7A54523
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903122.1311118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6me-0005YQ-5t; Thu, 06 Mar 2025 08:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903122.1311118; Thu, 06 Mar 2025 08:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6me-0005VH-1o; Thu, 06 Mar 2025 08:40:48 +0000
Received: by outflank-mailman (input) for mailman id 903122;
 Thu, 06 Mar 2025 08:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mc-00031D-Bl
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:46 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:2417::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1571df5-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:44 +0100 (CET)
Received: from CH0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:b0::20)
 by MN2PR12MB4455.namprd12.prod.outlook.com (2603:10b6:208:265::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:40:40 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::85) by CH0PR03CA0015.outlook.office365.com
 (2603:10b6:610:b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 08:40:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:36 -0600
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
X-Inumbo-ID: b1571df5-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owDY7pqwJZXmAYcW7qqiav9Bpl6QYVTVp1Soh5XqlieIYIVTp7qK3st22qL7h7UT+G3zeQXncy7ckkdYQ/jR68BwbfOKL4ZP78GAjs1o4YDpyS8Otyyeo/I85bTybYOl9JjZguEvOypUgSPrqykGDWyPzUwM4yTMFXL8jEUQUTKoYxe+6Jl4tsnT8HP9UeUEGFbSZpm19bqzA2TLzzWQMytmcZUWoOjBUVxUZXQrw/6W5y9syYkdh9s3tQBd9LaCiis+o28q3w2JNh+pUNNEs0rXp0VBssS3e7VvawpCgHHNUBJN3So1EIqtwuygBW3UBXYXqRId3HaFb+cNejMmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6gsk4a0T3360WJCjGvVygJbSDUPR8/N4o0HzTun7v4=;
 b=s0gzceFsbL099QmN99QUKw6OO8+tYj1mfDRVVb1umGlJvmIpUdkyNKVXXwuvjkPfqgRu6GXOWYu4asMSwPOmx7FzUnuKsMob1UoLQZdY+MxQH62mLLEzYsu10yccxgDj83A1c1K7o9sMLPH5ZG4Qk4onS2cxVjqtdlBfKVQKa4/kFkx6g2a+ScBj2c8MxhSpyJZkiQGVgOEFzhwbaK/VCMxKSPHebUZLvuWnq7wnSpPuJFjva9JIT2UWegTQnVXcVFY9Fqw1HyO9JO/FY6yla+47b6KPmQ7C7opHCjo2RVnoaY/mfzYsIee9P+t47XuDwe9U6zz0bYJ+7j9e4licKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6gsk4a0T3360WJCjGvVygJbSDUPR8/N4o0HzTun7v4=;
 b=knq7u00LdrRQD04knsuiKx5LqCH6gUficZbrmAyWXj4OYpHVsuwUehT52WssrA3oG4asn3/KFBe5gNWvXJFnI+CxTmiuvcU5XEXbANCwSCk5DKxEq5elV2IOImSZLPZX0bp7VmLThVFxN9pQpb0MADf7gGhzk151ZwsvPiSpQWI=
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
Subject: [PATCH v3 09/15] xen/x86: introduce a new amd cppc driver for cpufreq scaling
Date: Thu, 6 Mar 2025 16:39:43 +0800
Message-ID: <20250306083949.1503385-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|MN2PR12MB4455:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b08228-3e87-409e-b9db-08dd5c8a92e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzllKzRCMkJUcUZMZjVnbU96TlkreVVKT3gvUzM0eEg4cGRrS2J4dHJLZFJN?=
 =?utf-8?B?ZFk1c0RQaEJzZHZkdHd5cTI5ZmlQWkVaenhnRlVmOElHYlRtYXlvK1lnV21q?=
 =?utf-8?B?NitrQlBBbE1xbkVXMXJ1RHlab0VsVDR3ejgwYTNMYmV3d05EUW52djA2TWpv?=
 =?utf-8?B?QkVRZzQ5VzU5cm5GOFBBZXB0eVNKSzQwenlLMC80SXUxZWdGYy9nQWxCbHBq?=
 =?utf-8?B?aWlkQVQ3OFFwdlk2ZnhnTGhlN3R2S0dQYzdZYWJUYWlUOXYxRm5uWEtFTU5C?=
 =?utf-8?B?N0JJdXArd29velIrNTdrMWpQdlZsOVoyRjhqRWE0VnRBeXBqUzUzRkQ4N1Yx?=
 =?utf-8?B?MXpBWTU4Q3N6MWhicEVDeFdpaW0yVTFMTVBEZ0FibjhLNUZHTlN4blVDaDNX?=
 =?utf-8?B?YUlvK0U1RU5RSW1KVVpEUzRWS3ZSY1p1YjdiSlpzamhzeGZXZ0t4eGw3dzNv?=
 =?utf-8?B?N09WWUZQUDBzZ2dhY3AzRk5heGgxTFVaN0JsUmVmNk14amZJOFpDUU9qNG5t?=
 =?utf-8?B?dEZEL1dTenFZS3ZzTXErYjA1SEwvdUd4R0dla2FocHl4elZUc3BpL2d0aVNr?=
 =?utf-8?B?ZHcrK2dQMC9zUStRK2o5aTNvMXczUUphOERxby90c0xsNUk0OHBVSzJ5Tzl5?=
 =?utf-8?B?bEY0N1oyR3JRcTcvWEx6WnkwK3Y5WXh2WS9PTjNzQUF3SG5JQjF1ZjFlOWxv?=
 =?utf-8?B?b1BwTXRSbHJrelNPejQzd0tvVEVEZGNtSmM0K1dRNGEyOUhCdGdIYm5BM3Zn?=
 =?utf-8?B?aTlwUXdsQjhQbWRJclJ1MHJaUjdvMFZiT1ozOTgxa3RtNGJ4TXlXU01qZmd0?=
 =?utf-8?B?ZzdTRm0zUnI5cm9rNFY4SXliRlVacGhrdFppMHZpeUlEQmhyaWZLc0hrSFpo?=
 =?utf-8?B?Mm15NllNVUp3OThtalVzSFBsOG82aS9GSUdiU09WaDVTUzhCcjZPVEZ5ODBh?=
 =?utf-8?B?UG1LcEJ6Z1h2M3lsQXhyNW9wT1BXRUM4SnUwdHgvSEdKcjY5SlQzTWNLd0xX?=
 =?utf-8?B?NGtYcUNqMWhpZmZaZXI5TFQvSFBGYXU2ZmRvWXZrWmIxRWxIeXNPU2R2emJP?=
 =?utf-8?B?SGhmUDNBRnZGbHVsWmZ2Nk9ZS21qOXU2NUhpTmVJckhXdlJTMStoZGNwaTNp?=
 =?utf-8?B?dERFU0F5cE1EdzZKeXRNRmhza21pUCs2TzFPUHJ3OC9ubU4yY3htclVhcFlv?=
 =?utf-8?B?cVJuVzZaN2g2QzJBckNQeFJ3NG1PZGttK0NQYlhQaW82Um5Hb1pXdnE5dHA1?=
 =?utf-8?B?SlVZYTNYcCtXOTdOMzVuSUpSZUxZbGRmVDNKVXNMa0JZSWFlMWdhY0JlaTB5?=
 =?utf-8?B?L1c4cXc3UnB6RFpDVE1LNndJUjZaQnpFU1E2b05WWkdkZlM0K2U3bjFZeThi?=
 =?utf-8?B?dkg0T0tHbDhrQkh2OC9YcWZPbzFPT00vcThuRFoyUGdhZXErTktPSWtzZ2Ry?=
 =?utf-8?B?dllhaFdtcG5SOU9ab2hveFRkSmxXcWdFNmEyN0xsR0pMNXptZ3p0eDZJWmRI?=
 =?utf-8?B?OC8rWXM5M2RIUWxJQWJzSEFBV0d6am9Pbkk5czRQb0ZyLy9lU0liYWVhVko4?=
 =?utf-8?B?bzZFZDRyTHNYb3c1MkMxc2NmYmEvTVFHQ2sreFBybmhIM3N5Qm5rZTQ5TVdE?=
 =?utf-8?B?djNibjIrQldkRHdlUkxQOVdlNldOZnJpM3V3M0lUTXdzR3BFT0xKaGpiSzVQ?=
 =?utf-8?B?VTM5ZkFHVlJOWEF1MmtvODVrYlQ0Ny9QY1prK0pqdnZXbFhFcmxCOTVBOWN3?=
 =?utf-8?B?Q0lHMzRQKzRrald3NUJ1UWJYTXdVOTN6KzB0Qk9iblQwRkNHWWxZQzY5RFFM?=
 =?utf-8?B?d2t2dVZtaS9UaEVMTC9OR2VTYnJxNmtCa25KUnY2UVk3dTFRc3dPZVJLSGNS?=
 =?utf-8?B?S3B1V3d2QU9HT0VGQStIOHpYVmFKQmlxa3NMN2kwRVJyQytsQkxySVNQNk1z?=
 =?utf-8?B?OXcwbU8xMW9SZkh4V3hVaVRNbUZWVStLQVFLeUNvUHpra0VDc3hvQXJtYnBh?=
 =?utf-8?Q?NHc4xRDmazNsDETK7RrT6XxU/380qk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:39.5337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b08228-3e87-409e-b9db-08dd5c8a92e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4455

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
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 370 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr-index.h |   5 +
 2 files changed, 375 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 7d482140a2..bf30990c74 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -14,7 +14,50 @@
 #include <xen/domain.h>
 #include <xen/init.h>
 #include <xen/param.h>
+#include <xen/percpu.h>
+#include <xen/xvmalloc.h>
 #include <acpi/cpufreq/cpufreq.h>
+#include <asm/amd.h>
+#include <asm/msr-index.h>
+
+#define amd_cppc_err(cpu, fmt, args...)                     \
+    printk(XENLOG_ERR "AMD_CPPC: CPU%u error: " fmt, cpu, ## args)
+#define amd_cppc_warn(fmt, args...)                         \
+    printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)
+#define amd_cppc_verbose(fmt, args...)                      \
+({                                                          \
+    if ( cpufreq_verbose )                                  \
+        printk(XENLOG_DEBUG "AMD_CPPC: " fmt, ## args);     \
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
+static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *, amd_cppc_drv_data);
 
 static bool __init amd_cppc_handle_option(const char *s, const char *end)
 {
@@ -51,10 +94,337 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
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
+    if ( freq == (cppc_data->nominal_mhz * 1000) )
+    {
+        *perf = data->caps.nominal_perf;
+        return 0;
+    }
+
+    if ( freq == (cppc_data->lowest_mhz * 1000) )
+    {
+        *perf = data->caps.lowest_perf;
+        return 0;
+    }
+
+    if ( cppc_data->lowest_mhz && cppc_data->nominal_mhz )
+    {
+        mul = data->caps.nominal_perf - data->caps.lowest_perf;
+        div = cppc_data->nominal_mhz - cppc_data->lowest_mhz;
+        /*
+         * We don't need to convert to KHz for computing offset and can
+         * directly use nominal_mhz and lowest_mhz as the division
+         * will remove the frequency unit.
+         */
+        div = div ?: 1;
+        offset = data->caps.nominal_perf -
+                 (mul * cppc_data->nominal_mhz) / div;
+    }
+    else
+    {
+        /* Read Processor Max Speed(mhz) as anchor point */
+        mul = data->caps.highest_perf;
+        div = this_cpu(amd_max_freq_mhz);
+        if ( !div )
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
+    }
+    *perf = (uint8_t)res;
+
+    return 0;
+}
+
+#define amd_get_freq(name)                                                  \
+    static int amd_get_##name##_freq(const struct amd_cppc_drv_data *data,  \
+                                     unsigned int *freq)                    \
+    {                                                                       \
+        const struct xen_processor_cppc *cppc_data = data->cppc_data;       \
+        uint64_t mul, div, res;                                             \
+                                                                            \
+        if ( cppc_data->name##_mhz )                                        \
+        {                                                                   \
+            /* Switch to khz */                                             \
+            *freq = cppc_data->name##_mhz * 1000;                           \
+            return 0;                                                       \
+        }                                                                   \
+                                                                            \
+        /* Read Processor Max Speed(mhz) as anchor point */                 \
+        mul = this_cpu(amd_max_freq_mhz);                                   \
+        if ( !mul )                                                         \
+            return -EINVAL;                                                 \
+        div = data->caps.highest_perf;                                      \
+        res = (mul * data->caps.name##_perf * 1000) / div;                  \
+        if ( res > UINT_MAX )                                               \
+        {                                                                   \
+            printk(XENLOG_ERR                                               \
+                   "Frequeny exceeds maximum value UINT_MAX: %lu\n", res);  \
+            return -EINVAL;                                                 \
+        }                                                                   \
+        *freq = (unsigned int)res;                                          \
+                                                                            \
+        return 0;                                                           \
+    }                                                                       \
+
+amd_get_freq(lowest);
+amd_get_freq(nominal);
+
+static int amd_get_max_freq(const struct amd_cppc_drv_data *data,
+                            unsigned int *max_freq)
+{
+    unsigned int nom_freq, boost_ratio;
+    int res;
+
+    res = amd_get_nominal_freq(data, &nom_freq);
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
+static void amd_cppc_write_request_msrs(void *info)
+{
+    struct amd_cppc_drv_data *data = info;
+
+    if ( wrmsr_safe(MSR_AMD_CPPC_REQ, data->req.raw) )
+    {
+        data->err = -EINVAL;
+        return;
+    }
+}
+
+static int cf_check amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
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
+    data->err = 0;
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
+            amd_cppc_err(policy->cpu,
+                         "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
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
+    data->err = amd_get_lowest_freq(data, &min_freq);
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
+    if ( min_freq > max_freq || nominal_freq > max_freq ||
+         nominal_freq < min_freq )
+    {
+        amd_cppc_err(policy->cpu,
+                     "min_freq(%u), or max_freq(%u), or nominal_freq(%u) value is incorrect\n",
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
+     * If error path takes effective, not only amd-cppc cpufreq driver fails
+     * to initialize, but also we could not fall back to legacy P-states
+     * driver nevertheless we specifies fall back option in cmdline.
+     */
+    if ( data->err )
+    {
+        amd_cppc_err(cpu, "Could not initialize AMD CPPC MSR properly\n");
+        amd_cppc_cpufreq_cpu_exit(policy);
+        return -ENODEV;
+    }
+
+    policy->governor = cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERNOR;
+
+    amd_cppc_boost_init(policy, data);
+
+    amd_cppc_verbose("CPU %u initialized with amd-cppc passive mode\n",
+                     policy->cpu);
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
index 22d9e76e55..985f33eca1 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -238,6 +238,11 @@
 
 #define MSR_AMD_CSTATE_CFG                  0xc0010296U
 
+#define MSR_AMD_CPPC_CAP1                   0xc00102b0
+#define MSR_AMD_CPPC_ENABLE                 0xc00102b1
+#define  AMD_CPPC_ENABLE                    (_AC(1, ULL) <<  0)
+#define MSR_AMD_CPPC_REQ                    0xc00102b3
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
-- 
2.34.1


