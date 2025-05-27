Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F7AC4AA4
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997956.1378827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq0B-0005aG-Q9; Tue, 27 May 2025 08:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997956.1378827; Tue, 27 May 2025 08:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq0B-0005WL-KK; Tue, 27 May 2025 08:49:39 +0000
Received: by outflank-mailman (input) for mailman id 997956;
 Tue, 27 May 2025 08:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0A-00031E-G9
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:38 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:200a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84d79d29-3ad7-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:49:37 +0200 (CEST)
Received: from BYAPR01CA0049.prod.exchangelabs.com (2603:10b6:a03:94::26) by
 DS0PR12MB9447.namprd12.prod.outlook.com (2603:10b6:8:1b4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Tue, 27 May 2025 08:49:30 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::9d) by BYAPR01CA0049.outlook.office365.com
 (2603:10b6:a03:94::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 27 May 2025 08:49:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:29 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:26 -0500
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
X-Inumbo-ID: 84d79d29-3ad7-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML3pp4+qWYfy++A+Xm0dOw62UoeZ7ZfJHn/PjWAJjUGK0zRMBy5tENHumA77BlRLZGhv97Uhn2Qgis02zgay9ub1T3SOAV7iWBzEzRrhPNcQ15FLbFBZXE5ZE92Qh73vcuuT0iec4KjCKTxR5yO02Dcp2C6tinwDTQXVIhcZz0hUzS7VuF9Hxz4VL17avKO6Ogt6rpuE48ixap0eAWSZF4GdfvKXYhOsBVteZq3sEITeythCvXACyrSH8+S8QG8qauLWBVFHv/KshshKmtYa/dc2YfmL+YPPxMOyyXlv8ycDHMeqUTfETuTGBxgTJqJXByaIgsmv+YTckxn5qs6juA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ok2GRvrOFV+vUIk3LP8uwsuOY7g8Xv1FP+QzlfgdZtc=;
 b=vkeSpLsCtf/e0UN4b/WyTzKWEzjOucFUe7gLsIxor9BOK7yN+mJTM9TSui9ZDLjPnhWWHEzdEmANo8r86sfbAKRVBH9L+0mDosnUdHNxXMDTBQ/v+3ltc9zkKLLa3s9pKZugS+E4K+T33zY7/h2Sa31pDukyCjLvLMGVwfkvy8Qu5cA+fmsju2TXGz7Gy99A4pge7YquHFlUCv6l7Qfthoc1W74rKyj+qkrnDc1UrejffiRDlWaVOlKZCvzhTcesM7zmUXe2adZozwGMJZRpYnl54NLsHViAo0S0u84rJV9pSu96NwEZREMajxmqLMliw/maXPTrWZu8vaujHamI0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok2GRvrOFV+vUIk3LP8uwsuOY7g8Xv1FP+QzlfgdZtc=;
 b=dYpZTQbMinkpSVBp9LWL4eZCuEHU7Bab5wrS1fGnYG4zU4rnIyjegmYkT01XG3fpDmn0iabpviK+cpBLM6mFtaLHrBwGktmj+6P6MYNzIe/tglpTfFwARHMFC7C+MkkWiw2nr68CU4XVEvt5ujuYfskJkpGzG+3juSckEnO5fFQ=
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
Subject: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver for cpufreq scaling
Date: Tue, 27 May 2025 16:48:25 +0800
Message-ID: <20250527084833.338427-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|DS0PR12MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3dfeaa-d45d-4af4-3e34-08dd9cfb6496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHdsZEs5QzlFUGN3TU9BWlJIb0MxYWhHQ2VIaUc5b0FSWGFud1ZxcWIvTDFC?=
 =?utf-8?B?bmxkdUhaNWFZa0JnWUk0Sm1aUEw3eld0TlpvWmtVdkJ5NHJVT090cFhpZEZ2?=
 =?utf-8?B?cXVVeWx6NmsyWno1dnRqYnFVbGVwbDZMdTVTVDFTYTVNU2wwV0FhVmsra0tx?=
 =?utf-8?B?T2s5eTR4QzBnbTlFemFYNFNBd3RwN3hQSW1KNUZTUUJKK1BwSzF5ZEFjckdx?=
 =?utf-8?B?bFFDeE1BN0dBNDlxeGdZclNDK0xXL1luVzFuVzQ0Q3M3bnFYdUIxcExrZWkv?=
 =?utf-8?B?QU9CYTdjZU5HUHB4NThVUSt1MisyZzRxa29YQ2txd3JqTnZsbWZMYTdEbGFn?=
 =?utf-8?B?S3J3aFpvRERVVHJ0cGRXeHZaR1NhRUY3UkdudjNEUUZCL3N5R0E4U1ZxRS9F?=
 =?utf-8?B?MU5UR1ZlTlE2UndZNk5xSEpwcDVycVh0RC9vazU3WUhYUEhRNUZHUEUwa0Y2?=
 =?utf-8?B?UTM1b20wdGovWUNnbTJpb2ozcVdkbkRYQy9GNTJ5UXlyWXU3Zk1kY3ZBSnRF?=
 =?utf-8?B?ZURPbVhSTGpuYlpzaUttc0ZENjZMeWdKaWRkM2hyREtUOURlcEl2T3dHR3Rq?=
 =?utf-8?B?ZWhlUHk4NnhRTGRCd1dNUkdmSE5rQ2kzcWQ2dEJsdVRReWY5Q2k3Sjh3MzNz?=
 =?utf-8?B?WHlKZVQvdlNNQ2RDdWRXb1pKbHVHd1hBWXM3ZlZDUVhsRjZ2ODVIMzFDZmpx?=
 =?utf-8?B?enAvcjFhaW5PbkZJd0JqYWN1akQvVDRRQ3FDMVBDU3dFem5RcTFTakZuV2c5?=
 =?utf-8?B?K2ppb2dRZk05RHU3eWIxbEJoYkIxMUs5UzdKMlNMNzZUSzhJQUk4MGVBZXBa?=
 =?utf-8?B?Y0ljUjBBcGYvM1l1aGJvVHRCdTFGM3R6NGpScXBRWGJOQ1lJUlZBSExFMGph?=
 =?utf-8?B?bDFFbjBKYVk4bHN5anh5b1B2cGIrdm9jUEN4TFhrb0Y4Q25SYWNXSkFBY0dS?=
 =?utf-8?B?RytuV01Xc0NycFVMWVhxVk5qTzg4NnR5TCs4a3l4c1pmS3JrZnJVUkNNaGlM?=
 =?utf-8?B?U3BMdUJVMVN5bWJ2YXVIUVhGOVluVWQxNjY1Qk15RmFQRFJReDFrTGlQUVIr?=
 =?utf-8?B?ZUEydkpnM25vRS9rMzhjdFpxU1EyNm5OWU1Bb09HRDc4NzVYR09FLzVMTGl1?=
 =?utf-8?B?ZERpR3JZU2NlaURFR3hqeFpWWGUxdndjUjQyS1R5cnpqaHg4QlowMTY2UDAy?=
 =?utf-8?B?ZG9IeVMvS21CaHFjbFMvYnZrZlRnVkp1b09xSFBDSDBCYXZuMjVlZFYxKzMy?=
 =?utf-8?B?N1BMak1Ub05kc0tRVjRadHhLR2NId1JMVS9rZU1uZDBYeTErKzE0RUNrVFVs?=
 =?utf-8?B?Q3BFWGlVTU8xbmx5MjdKb2hQUTN5SVhmMjdGVktpNVVaTHM2WU92eG9BQ2FM?=
 =?utf-8?B?aS9sZjkrbS9FcDZFWmtCZWFrR3gvZkxpWm5HNmdqZXZyTnFXWTEwZkhsVWZi?=
 =?utf-8?B?Sm0vYjZwZjYzZm1ZNXpFbnB5aTJOUGtOa0svZWxlZVk0UjRkSmxlWDd5THNR?=
 =?utf-8?B?MEJKZzNyNDd6UG54eGdSd1lWN1lKbHFhcmZyNzRJZ0dGb1hRVzJjMGF1SWxy?=
 =?utf-8?B?Vmc4T0ZiNkZLMXpKQ0EwK2s1YnVtZmp5Q1A5UWI4OTZEUHZlNkJCZk1udkxQ?=
 =?utf-8?B?eUlqZ1RXOXdURjZmVkZ0VmRmTE12dkpFczIzdDNGSGxBODBtK2Z0MEtSWjJq?=
 =?utf-8?B?NVc2TDNwYjdXeVZKYkRDc3dxNnBsTy9jSDJrNlcxUFIzQ1FHUmovVEt3d25j?=
 =?utf-8?B?TG5tWWdMYy9vTkx2cC9GSmNOY0tVNk9VZTlCdk5qVVh1QUZmemxFYlNhN1ZK?=
 =?utf-8?B?NFBhaDdGUEo0cGxXc3NwRVlLZzRzRHFQQ3BQV01Yc292d2ZTaEZLakdGQ1FC?=
 =?utf-8?B?RUpWdVhPTEExakNKR2JHbjRTcTl6ajNCend0YkVOZGNETlRNU0ZnaE02ZFVt?=
 =?utf-8?B?TVpsT053S3hISHUwejhFWFlkaWFSamVGb3ZYb2haMFpLdXRNbEMyQVAwNVpT?=
 =?utf-8?B?TmRZV2RKd0ZickdFd2xNd3FvU1pvSnBSaUh6YjE4eXhsZE5nd3RJcU9BQWRi?=
 =?utf-8?Q?FLhUov?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:29.3512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3dfeaa-d45d-4af4-3e34-08dd9cfb6496
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447

amd-cppc is the AMD CPU performance scaling driver that introduces a
new CPU frequency control mechanism. The new mechanism is based on
Collaborative Processor Performance Control (CPPC) which is a finer grain
frequency management than legacy ACPI hardware P-States.
Current AMD CPU platforms are using the ACPI P-states driver to
manage CPU frequency and clocks with switching only in 3 P-states, while the
new amd-cppc allows a more flexible, low-latency interface for Xen
to directly communicate the performance hints to hardware.

Default "amd-cppc" driver still leverages Xen governors such as
*ondemand*, *performance*, etc, to calculate the performance hints. In the
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
v4 -> v5:
- all freq-values shall be unsigned int type
- remove shortcuts as it is rarely taken
- checking cpc.nominal_mhz and cpc.lowest_mhz are non-zero values is enough
- drop the explicit type cast
- null pointer check is in no need for internal functions
- change amd_get_lowest_or_nominal_freq() to amd_get_cpc_freq()
- clarifying function-wide that the calculated frequency result is to be in kHz
- use array notation
- with cpu_has_cppc check, no need to do cpu family check
---
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 362 +++++++++++++++++++++++++++
 xen/arch/x86/cpu/amd.c               |   8 +-
 xen/arch/x86/include/asm/amd.h       |   2 +
 xen/arch/x86/include/asm/msr-index.h |   5 +
 4 files changed, 373 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 9e64bf957a..8f0a30c19d 100644
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
+static DEFINE_PER_CPU_READ_MOSTLY(unsigned int, pxfreq_mhz);
 
 static bool __init amd_cppc_handle_option(const char *s, const char *end)
 {
@@ -50,10 +99,323 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
     return 0;
 }
 
+/*
+ * If CPPC lowest_freq and nominal_freq registers are exposed then we can
+ * use them to convert perf to freq and vice versa. The conversion is
+ * extrapolated as an linear function passing by the 2 points:
+ *  - (Low perf, Low freq)
+ *  - (Nominal perf, Nominal freq)
+ * Parameter freq is always in kHz.
+ */
+static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
+                                unsigned int freq, uint8_t *perf)
+{
+    const struct xen_processor_cppc *cppc_data = data->cppc_data;
+    unsigned int mul, div;
+    int offset = 0, res;
+
+    if ( cppc_data->cpc.lowest_mhz && cppc_data->cpc.nominal_mhz )
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
+        div = this_cpu(pxfreq_mhz);
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
+    if ( res < 0 )
+    {
+        printk_once(XENLOG_WARNING
+                    "Perf value smaller than minimum value 0: %d\n", res);
+        *perf = 0;
+        return 0;
+    }
+    *perf = res;
+
+    return 0;
+}
+
+/*
+ * _CPC may define nominal frequecy and lowest frequency, if not, use
+ * Processor Max Speed as anchor point to calculate.
+ * Output freq stores cpc frequency in kHz
+ */
+static int amd_get_cpc_freq(const struct amd_cppc_drv_data *data,
+                            uint32_t cpc_mhz, uint8_t perf, unsigned int *freq)
+{
+    unsigned int mul, div, res;
+
+    if ( cpc_mhz )
+    {
+        /* Switch to kHz */
+        *freq = cpc_mhz * 1000;
+        return 0;
+    }
+
+    /* Read Processor Max Speed(MHz) as anchor point */
+    mul = this_cpu(pxfreq_mhz);
+    if ( !mul )
+    {
+        printk_once(XENLOG_ERR
+                    "Failed to read valid processor max frequency as anchor point: %u\n",
+                    mul);
+        return -EINVAL;
+    }
+    div = data->caps.highest_perf;
+    res = (mul * perf * 1000) / div;
+    if ( !res )
+        return -EINVAL;
+    *freq = res;
+
+    return 0;
+}
+
+/* Output max_freq stores calculated maximum frequency in kHz */
+static int amd_get_max_freq(const struct amd_cppc_drv_data *data,
+                            unsigned int *max_freq)
+{
+    unsigned int nom_freq = 0;
+    int res;
+
+    res = amd_get_cpc_freq(data, data->cppc_data->cpc.nominal_mhz,
+                           data->caps.nominal_perf, &nom_freq);
+    if ( res )
+        return res;
+
+    *max_freq = (data->caps.highest_perf * nom_freq) / data->caps.nominal_perf;
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
+         data->caps.lowest_perf > data->caps.nominal_perf ||
+         data->caps.lowest_nonlinear_perf > data->caps.nominal_perf ||
+         data->caps.nominal_perf > data->caps.highest_perf )
+    {
+        amd_cppc_err(policy->cpu,
+                     "Out of range values: highest(%u), lowest(%u), nominal(%u), lowest_nonlinear(%u)\n",
+                     data->caps.highest_perf, data->caps.lowest_perf,
+                     data->caps.nominal_perf, data->caps.lowest_nonlinear_perf);
+        goto err;
+    }
+
+    amd_process_freq(&cpu_data[policy->cpu],
+                     NULL, NULL, &this_cpu(pxfreq_mhz));
+
+    data->err = amd_get_cpc_freq(data, data->cppc_data->cpc.lowest_mhz,
+                                 data->caps.lowest_perf, &min_freq);
+    if ( data->err )
+        return;
+
+    data->err = amd_get_cpc_freq(data, data->cppc_data->cpc.nominal_mhz,
+                                 data->caps.nominal_perf, &nominal_freq);
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
+    /*
+     * The enable bit is sticky, as we need to enable it at the very first
+     * begining, before CPPC capability values sanity check.
+     * If error path takes effective, not only amd-cppc cpufreq core fails
+     * to initialize, but also we could not fall back to legacy P-states
+     * driver, irrespective of the command line specifying a fallback option.
+     */
+    if ( data->err )
+    {
+        amd_cppc_err(cpu, "Could not initialize cpufreq cores in CPPC mode\n");
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
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 8c985466fa..7ec154e9e7 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -611,10 +611,10 @@ static unsigned int attr_const amd_parse_freq(unsigned int family,
 	return freq;
 }
 
-static void amd_process_freq(const struct cpuinfo_x86 *c,
-			     unsigned int *low_mhz,
-			     unsigned int *nom_mhz,
-			     unsigned int *hi_mhz)
+void amd_process_freq(const struct cpuinfo_x86 *c,
+		      unsigned int *low_mhz,
+		      unsigned int *nom_mhz,
+		      unsigned int *hi_mhz)
 {
 	unsigned int idx = 0, h;
 	uint64_t hi, lo, val;
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 9c9599a622..72df42a6f6 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -173,5 +173,7 @@ extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
+void amd_process_freq(const struct cpuinfo_x86 *c, unsigned int *low_mhz,
+                      unsigned int *nom_mhz, unsigned int *hi_mhz);
 
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 22d9e76e55..e4401186c7 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -238,6 +238,11 @@
 
 #define MSR_AMD_CSTATE_CFG                  0xc0010296U
 
+#define MSR_AMD_CPPC_CAP1                   0xc00102b0U
+#define MSR_AMD_CPPC_ENABLE                 0xc00102b1U
+#define  AMD_CPPC_ENABLE                    (_AC(1, ULL) << 0)
+#define MSR_AMD_CPPC_REQ                    0xc00102b3U
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
-- 
2.34.1


