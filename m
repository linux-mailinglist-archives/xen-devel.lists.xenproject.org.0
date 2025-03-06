Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D4BA5459B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903227.1311167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq73H-0004ro-Rf; Thu, 06 Mar 2025 08:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903227.1311167; Thu, 06 Mar 2025 08:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq73H-0004qJ-Oh; Thu, 06 Mar 2025 08:57:59 +0000
Received: by outflank-mailman (input) for mailman id 903227;
 Thu, 06 Mar 2025 08:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mm-00031D-45
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2415::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6885cac-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:54 +0100 (CET)
Received: from CH5P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::26)
 by SJ0PR12MB7460.namprd12.prod.outlook.com (2603:10b6:a03:48d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:40:46 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::d0) by CH5P223CA0012.outlook.office365.com
 (2603:10b6:610:1f3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 08:40:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:43 -0600
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
X-Inumbo-ID: b6885cac-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BS2+qixq8kfA/AVWRPnXunn3NI3xONZTgxTJW5IT1byo6wnhrKYYDVpbdaeEBqPdEd+p9ZqErWW4xCg7siBT/wBlDfImXDKi11/KhewZCRr6HP61ljSm+1xexeg1ivfq9x9U+QT7MMxXvg5oSwkqZQT5D/AB9IgnW6jwPtshqnII6QqsShma4sf/zhSD+R+zqK1am4inJ5ajLS6I7UHlAHZblnsLHFY/hOl9TipVvHAhisuqGGBHl9jiTS4RYilNIJCEbMvFJdIXN9zmgCCUpVFHFna+dNemRJ078bAXn1P8dF5OllLGA2EQKkcUEVKKGoGxhXV2+tN/f3bD5dsRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pH0fQEcWAFj6ONCosK7Qrb9mkFJ26je7WuTNOYZmtGk=;
 b=JUrTjD67Exl0I5P+F7XT1vhvx/0fMe6/q/rVsdjhb3Uk17sd3e7okGsbIOIUvdtsA7O7AmPfxraUQzeaFW6qAY/+f0WMnK1u/ByXwee6gxwR0txm371LqLYrxtJypiixyCbHEMfWnVtiHGSltnIgoAHdkBlCq4G5NXiPlVKaj+eH2XrxR3tlR6lrpqKaS0j8QMPctUWC0eA7G7QMXCyVQUrtvHsHvcJxIbYYFzOyhECZquuKYo1s70A+vCAla4sK1adgb1p25xi9aCOODjXvKvRTNT6scF7igFqr63l2CA7ItrQqBQuNCXfz60db0WVLivnlvg9KuJTwSRaK6lnWLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH0fQEcWAFj6ONCosK7Qrb9mkFJ26je7WuTNOYZmtGk=;
 b=QMc8Nj3nd99l8ikplGEKD7HQKvYR+kb6MezWx7vCoFk9KkEw31zNxy0PJ2PKWt5J53uDYzOOVUK0KZgBpt5c85fViPKoXcnJJ0mNzgSG+aUSw4wxds9D73ZlViXcq67bk25RscE3m6x94v2NUWYan/dFzvsmsWeO7huSPuvFYlk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 12/15] xen/x86: implement EPP support for the amd-cppc driver in active mode
Date: Thu, 6 Mar 2025 16:39:46 +0800
Message-ID: <20250306083949.1503385-13-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SJ0PR12MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa7eb38-4dc1-436a-5102-08dd5c8a96db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BJoS0eflau/pGzGaNlTmHQ7FFkpMQ0suv2B+W9wo4133xYMEjFWIcrRByzeT?=
 =?us-ascii?Q?INrW6PSblxw1GV44yAn4GbAMD6f67NufkEnwXZWN9tJ+Eb2iRqPDcjU8h/5y?=
 =?us-ascii?Q?q/B9gN6iuAVKtGECDaV9lAfx9Fvgr43F8PtU4ohXJ72DUvjoLGQmBKofLcSH?=
 =?us-ascii?Q?IL49RRG8BsKMONC7VwSkxDt/RKm2lRN8O/C8wYspzf5FhopQ58hdR0JaDpi5?=
 =?us-ascii?Q?v3NypP39pADkwupBeHhD7qhl1YCHOaNRAiIfm0PccisRfi8299OKp7njLSAC?=
 =?us-ascii?Q?4JEpsSlXBIed9U+6s9DV7vs838yL1rMDkagIa9dTIJwYlFDv0BUBXS/9AQ9P?=
 =?us-ascii?Q?5OjjRjnjq7Kk+jIvIAzyoz6DVeShEn0mkAUJKMNg63fKR9k3QldryBsq1PWu?=
 =?us-ascii?Q?x8X1UNi5W1U4qpl3A0jdQq8MIUI08tqvaDL48FU6txZS1FImlbi0LiF23xmc?=
 =?us-ascii?Q?lGp3o2MsWPWiQs3HRlujQSTMzQ4KQVRnkDDDJjn7kn1/ZCA/4QUyI6p+X7RO?=
 =?us-ascii?Q?1SLFwjLUkYyiQyqbVYzWRtcNm4JAQin+vBFGpKbzIfFiubdFBx27dJ68A3re?=
 =?us-ascii?Q?mYIOdUAxjuVeI9yJb2aZr1h0AQacOgv1RfkAt0V0ewCZJPwh0RAdx3bsWzi8?=
 =?us-ascii?Q?872pDzwJE4dzxfp49V7ujF4TGJgpoC0ihz0JiNLEsUorkUkvcXDsqALsAbW/?=
 =?us-ascii?Q?H3JNirNeFkER1ZeDsqWJk7vJt+xfCJnkjHVW458lNLXZaFpbO8duVZF1IDq+?=
 =?us-ascii?Q?c5gwGDb/RypYL9v/c0vnxpB7QRhRFkPZyyMk4grvZOgVrGXbTJsaoRQGYpJL?=
 =?us-ascii?Q?yL/rRQhbZbkDGX1Q5zUJLOgXXUpPYwvDD4CRQKTV3T/4bteS9aZt0qrONABM?=
 =?us-ascii?Q?TWv96REsfXeri6zXp7GNz2LhF1oz9gFxxNQUVvA+2T8e5FxSeL2V2ouYuFQx?=
 =?us-ascii?Q?I4OPZ76/YCxxF7tunLaHKKFWpqY0uXu+Y5Ehdg6ugFBYuaWT+Vll+Xa/wCjP?=
 =?us-ascii?Q?L2zA8gVHPY433m9oB73EV/FkL8NGUmBlFlFdi54zN/dJ30BFXRvhMA1VuQf9?=
 =?us-ascii?Q?IJhs0I1OoxccZAZ+OYKN9UYVkQJUrZuyqgdydw21KOvyPfFfRGWJg7Kkq91n?=
 =?us-ascii?Q?+ZlaYBegzJCuy2Hb6MyaXcmzCnjfg7HynsUUn0C3+rFcKb3xVYPQRJi29a61?=
 =?us-ascii?Q?Y6E360/7XrOluc4e/9+ZhKly4tcwDC5RKKWKGKFirKhrGGkgFFwcTt0HAxR/?=
 =?us-ascii?Q?1le39fC4J5FXRwcNFQcRUgccOLcgPlh8Iu9mw+R6JzEYFRhTv+Qzf+8iRufb?=
 =?us-ascii?Q?BY+sN64TlNCrXstne5pjSTmU/dAMlfC1S7fRm59865BuB7MNzZOb8TxXAfCN?=
 =?us-ascii?Q?c39O/qWTpqCJB7lG8hVEa2PGlErryusX2DAjEXwGiWVpW3pYsZ1MwMyhOKs+?=
 =?us-ascii?Q?IvM61jR/412oPwjTCyPtetA63Lw5ScuvJNCM2YqqrqSK4PFeNij34jpMfZJ6?=
 =?us-ascii?Q?DSQCnNcyNBP6R98=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:46.1738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa7eb38-4dc1-436a-5102-08dd5c8a96db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7460

amd-cppc has 2 operation modes: autonomous (active) mode,
non-autonomous (passive) mode.
In active mode, platform ignores the requestd done in the Desired
Performance Target register and takes into account only the values
set to the minimum, maximum and energy performance preference(EPP)
registers.
The EPP is used in the CCLK DPM controller to drive the frequency
that a core is going to operate during short periods of activity.
The SOC EPP targets are configured on a scale from 0 to 255 where 0
represents maximum performance and 255 represents maximum efficiency.

This commit implements one new AMD CPU frequency driver `amd-cppc-epp`
for active mode. It also introduce `active` tag for users to explicitly
select active mode and a new variable `opt_active_mode` to keep track of
which mode is currently enabled.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Remove redundant epp_mode
- Remove pointless initializer
- Define sole caller read_epp_init_once and epp_init value to read
pre-defined BIOS epp value only once
- Combine the commit "xen/cpufreq: introduce policy type when
cpufreq_driver->setpolicy exists"
---
v2 -> v3:
- Combined with commit "x86/cpufreq: add "cpufreq=amd-cppc,active" para"
- Refactor doc about "active mode"
- Change opt_cpufreq_active to opt_active_mode
- Let caller pass epp_init when unspecified to allow the function parameter
to be of uint8_t
- Make epp_init per-cpu value
---
 docs/misc/xen-command-line.pandoc    |   8 +-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 119 +++++++++++++++++++++++++--
 xen/drivers/cpufreq/utility.c        |  11 +++
 xen/include/acpi/cpufreq/cpufreq.h   |  12 +++
 xen/include/public/sysctl.h          |   1 +
 5 files changed, 145 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b3c3ca2377..19094070b3 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -515,7 +515,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[verbose]]`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[active][,verbose]]`
 
 > Default: `xen`
 
@@ -537,6 +537,12 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
   on supported AMD hardware to provide finer grained frequency control
   mechanism. The default is disabled.
+* `active` is to enable amd-cppc driver in active(autonomous) mode. In this
+  mode, users could write to energy performance preference register to tell
+  hardware if they want to bias toward performance or energy efficiency. Then
+  built-in CPPC power algorithm will calculate the runtime workload and adjust
+  the realtime cores frequency automatically according to the power supply and
+  thermal, core voltage and some other hardware conditions.
 
 User could use `;`-separated options to support universal options which they
 would like to try on any agnostic platform, *but* under priority order, like
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index bf30990c74..606bb648b3 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -30,6 +30,9 @@
         printk(XENLOG_DEBUG "AMD_CPPC: " fmt, ## args);     \
 })
 
+static bool __ro_after_init opt_active_mode;
+static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
+
 struct amd_cppc_drv_data
 {
     const struct xen_processor_cppc *cppc_data;
@@ -70,6 +73,13 @@ static bool __init amd_cppc_handle_option(const char *s, const char *end)
         return true;
     }
 
+    ret = parse_boolean("active", s, end);
+    if ( ret >= 0 )
+    {
+        opt_active_mode = ret;
+        return true;
+    }
+
     return false;
 }
 
@@ -226,14 +236,19 @@ static void amd_cppc_write_request_msrs(void *info)
 }
 
 static int cf_check amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
-                                           uint8_t des_perf, uint8_t max_perf)
+                                           uint8_t des_perf, uint8_t max_perf,
+                                           uint8_t epp)
 {
     struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
     uint64_t prev = data->req.raw;
 
     data->req.min_perf = min_perf;
     data->req.max_perf = max_perf;
-    data->req.des_perf = des_perf;
+    if ( !opt_active_mode )
+        data->req.des_perf = des_perf;
+    else
+        data->req.des_perf = 0;
+    data->req.epp = epp;
 
     if ( prev == data->req.raw )
         return 0;
@@ -261,7 +276,20 @@ static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
         return res;
 
     return amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
-                                  des_perf, data->caps.highest_perf);
+                                  des_perf, data->caps.highest_perf,
+                                  /* Pre-defined BIOS value for passive mode */
+                                  per_cpu(epp_init, policy->cpu));
+}
+
+static int read_epp_init(void)
+{
+    uint64_t val;
+
+    if ( rdmsr_safe(MSR_AMD_CPPC_REQ, val) )
+        return -EINVAL;
+    this_cpu(epp_init) = (val >> 24) & 0xFF;
+
+    return 0;
 }
 
 static void cf_check amd_cppc_init_msrs(void *info)
@@ -343,6 +371,8 @@ static void cf_check amd_cppc_init_msrs(void *info)
      */
     policy->cur = cpufreq_driver_getavg(policy->cpu, GOV_GETAVG);
 
+    data->err = read_epp_init();
+
     return;
 
  err:
@@ -372,7 +402,7 @@ static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
-static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int amd_cppc_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
     struct amd_cppc_drv_data *data;
@@ -411,12 +441,78 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     amd_cppc_boost_init(policy, data);
 
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    int ret;
+
+    ret = amd_cppc_cpufreq_init_perf(policy);
+    if ( ret )
+        return ret;
+
     amd_cppc_verbose("CPU %u initialized with amd-cppc passive mode\n",
                      policy->cpu);
 
     return 0;
 }
 
+static int cf_check amd_cppc_epp_cpu_init(struct cpufreq_policy *policy)
+{
+    int ret;
+
+    ret = amd_cppc_cpufreq_init_perf(policy);
+    if ( ret )
+        return ret;
+
+    policy->policy = cpufreq_parse_policy(policy->governor);
+
+    amd_cppc_verbose("CPU %u initialized with amd-cppc active mode\n", policy->cpu);
+
+    return 0;
+}
+
+static int amd_cppc_epp_update_limit(const struct cpufreq_policy *policy)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
+                                                    policy->cpu);
+    uint8_t max_perf, min_perf, epp;
+
+    /* Initial min/max values for CPPC Performance Controls Register */
+    /*
+     * Continuous CPPC performance scale in active mode is [lowest_perf,
+     * highest_perf]
+     */
+    max_perf = data->caps.highest_perf;
+    min_perf = data->caps.lowest_perf;
+
+    epp = per_cpu(epp_init, policy->cpu);
+    if ( policy->policy == CPUFREQ_POLICY_PERFORMANCE )
+    {
+        /* Force the epp value to be zero for performance policy */
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        min_perf = max_perf;
+    }
+    else if ( policy->policy == CPUFREQ_POLICY_POWERSAVE )
+        /* Force the epp value to be 0xff for powersave policy */
+        /*
+         * If set max_perf = min_perf = lowest_perf, we are putting
+         * cpu cores in idle.
+         */
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+
+    return amd_cppc_write_request(policy->cpu, min_perf,
+                                  /* des_perf = 0 for epp mode */
+                                  0,
+                                  max_perf, epp);
+}
+
+static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
+{
+    return amd_cppc_epp_update_limit(policy);
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
@@ -427,6 +523,16 @@ amd_cppc_cpufreq_driver =
     .exit   = amd_cppc_cpufreq_cpu_exit,
 };
 
+static const struct cpufreq_driver __initconst_cf_clobber
+amd_cppc_epp_driver =
+{
+    .name       = XEN_AMD_CPPC_EPP_DRIVER_NAME,
+    .verify     = amd_cppc_cpufreq_verify,
+    .setpolicy  = amd_cppc_epp_set_policy,
+    .init       = amd_cppc_epp_cpu_init,
+    .exit       = amd_cppc_cpufreq_cpu_exit,
+};
+
 int __init amd_cppc_register_driver(void)
 {
     int ret;
@@ -437,7 +543,10 @@ int __init amd_cppc_register_driver(void)
         return -ENODEV;
     }
 
-    ret = cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+    if ( opt_active_mode )
+        ret = cpufreq_register_driver(&amd_cppc_epp_driver);
+    else
+        ret = cpufreq_register_driver(&amd_cppc_cpufreq_driver);
     if ( ret )
         return ret;
 
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index f1fd2fdbce..abde499d40 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -491,3 +491,14 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
 
     return __cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 }
+
+unsigned int cpufreq_parse_policy(const struct cpufreq_governor *gov)
+{
+    if ( !strncasecmp(gov->name, "performance", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_PERFORMANCE;
+
+    if ( !strncasecmp(gov->name, "powersave", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_POWERSAVE;
+
+    return CPUFREQ_POLICY_UNKNOWN;
+}
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 3c2b951830..7c36634d40 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -83,6 +83,7 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
+    unsigned int        policy; /* CPUFREQ_POLICY_* */
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
@@ -133,6 +134,17 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
 extern struct cpufreq_governor *__find_governor(const char *governor);
 #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
 
+#define CPUFREQ_POLICY_UNKNOWN      0
+/*
+ * If cpufreq_driver->target() exists, the ->governor decides what frequency
+ * within the limits is used. If cpufreq_driver->setpolicy() exists, these
+ * two generic policies are available:
+ */
+#define CPUFREQ_POLICY_POWERSAVE    1
+#define CPUFREQ_POLICY_PERFORMANCE  2
+
+unsigned int cpufreq_parse_policy(const struct cpufreq_governor *gov);
+
 /* pass a target to the cpufreq driver */
 extern int __cpufreq_driver_target(struct cpufreq_policy *policy,
                                    unsigned int target_freq,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 42997252ef..fa431fd983 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -424,6 +424,7 @@ struct xen_set_cppc_para {
 };
 
 #define XEN_AMD_CPPC_DRIVER_NAME "amd-cppc"
+#define XEN_AMD_CPPC_EPP_DRIVER_NAME "amd-cppc-epp"
 #define XEN_HWP_DRIVER_NAME "hwp"
 
 /*
-- 
2.34.1


