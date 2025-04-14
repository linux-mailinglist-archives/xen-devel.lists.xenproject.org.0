Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D465A8796E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949226.1345855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ec5-00086Z-Al; Mon, 14 Apr 2025 07:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949226.1345855; Mon, 14 Apr 2025 07:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ec5-00084z-6b; Mon, 14 Apr 2025 07:52:17 +0000
Received: by outflank-mailman (input) for mailman id 949226;
 Mon, 14 Apr 2025 07:52:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ESA-0008Gw-4g
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:42:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edbc6620-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:52 +0200 (CEST)
Received: from CH2PR14CA0030.namprd14.prod.outlook.com (2603:10b6:610:60::40)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 07:41:44 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::dc) by CH2PR14CA0030.outlook.office365.com
 (2603:10b6:610:60::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 07:41:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:44 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:41 -0500
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
X-Inumbo-ID: edbc6620-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHncPC0xlGLtcf5N8Kl+upEIL3JetxpEEJ+Kgk3319rr6g4k1Xl0CAgSqaI7sKMTNKZjbR8HZVmmjeOqSVM9WJaOU8Oj2xtbSRKzYRRWSFLl+2UEHrKjlWTkoBxy68DFTk2P+prz8TaIAOs995jg+6J03S/rqpdyBBIDUDbKRm6/AFN0XzlMIcRU6UPCV9HzvBY2CH13+hUSj56AOI+ncqmPn34HXkrooe2EYezAYJLanYx/44ushDveR1YGatEuPj2IvPrYvYao01Ln0JZcKSpNjz8/YdvLaZuH23Re9VrdxKZCa+VoZeZ/bqzLtsLocIuqaGPWB73akzkQEjdyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fANokxGaerdWPBII5E1qURuV3YfJA1bhgLqXW05YT68=;
 b=xPbOqldZPzV/tHphhI2P80zh9bqIOyRZ2hZVD+alBjuXa9RRulF6WkFovadpVy2TBXP7aKdXiigk1edVCgn1KOEWdX2PFuKKrsAJyNFoEDuvuq+Uf+COdhm8JDbqjmZWjoWFt+7vwOk7v8x3kunrKiUSnwrA3CtWjRus9vUSA+0ZIA01CxORxN6k9RxWgYBcgphXPrNXv15eC0JVt7iMCbfOZCq6Elr13cD9aqOdGgoDgU1D6UC7+cYXNmXnDHV70CKGRX5GOiHjHAUoRHkVthKP14Ngddmv/6tPIxoPdur7OJM1xgjQHFGRDgAP1TEKZOmvD1w5YMo8rPSIC5ECYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fANokxGaerdWPBII5E1qURuV3YfJA1bhgLqXW05YT68=;
 b=xTH7y6R6QfpUhwBnK+Ksx3oliMEbUA4WETbfSC5bi2Dz4OfWon4dJa8XMBoR/daw4xCwtfZ1IkCaPIhn329MlS9QfImMzjB99Q7VxDN3gOB3GVQDE6dF2IurH8EU6sH9zAaSTefZRofG6/UEKwPE6C0qumrGRtLTLhlsc9ZJqpc=
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
Subject: [PATCH v4 11/15] xen/x86: implement EPP support for the amd-cppc driver in active mode
Date: Mon, 14 Apr 2025 15:40:52 +0800
Message-ID: <20250414074056.3696888-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf8dadf-b36a-4952-05a7-08dd7b27cdc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G/LQY0YG6Wpd5Hy2kebkMNjRenfg0i1M2bvUO29bxqLznhWrIBtF2Arx83zF?=
 =?us-ascii?Q?7jXt102xCXYSVXPyk15YwbR6x9xwurjJp/TyNX37owXddy+Jsj/ngauoYhiS?=
 =?us-ascii?Q?EFMLTV56wr/E46ivqD5suwqBD6qvtcBUiXbCnxCzE1OqXmsGCaBYQxBQ3rws?=
 =?us-ascii?Q?iaKU/nCwfbXAGa4hSxMWo1PhvJ+Wo0t0iFiFdg27mpiCveXxrqxu7+TdpoVD?=
 =?us-ascii?Q?Ey9LJqjbQwa1xOSkl453SUUSkIrNgz2jbTjy4rsAw91iUSrw0utZRWzjnlle?=
 =?us-ascii?Q?bamSsxu3r51BcRbE91AccVl86MFMzPEPP0Yccu298ZVbWhURDK3w/cCCLIi9?=
 =?us-ascii?Q?JLiZtJ/ZYGRJv0bMBdebN+PxgexhBpNqL5WXR0vBWSscnIaa7oON95V1JrZf?=
 =?us-ascii?Q?/wgUZrbZxmWP+Coa6reWoCTlrIFWt5TQbjMjisHTTJmJKjekTHl1sIck2QDe?=
 =?us-ascii?Q?oIkLuRK2Ph4Xki5XlGMGWEkWShnRluG9kMLER19yQlPMW8ybyRRZSajFvQpS?=
 =?us-ascii?Q?UgrJlZEO9h2ouDGSLRbTliQ1fcSdsHkcCQGdxFfEKUyLnDSTLMl4jIkkPAsO?=
 =?us-ascii?Q?XubByWNu9XMf0iy1zOr9F39B0rWER1rljdCx/7nQkBgACMzRypA7NK95lxCP?=
 =?us-ascii?Q?EBsUWq5VqtAt7R8CS1QTZ8t+BYjg9/NMUHrl51awyl7LV2AVpW6BxkbkhpsT?=
 =?us-ascii?Q?Ram1Pzd+vk7oLU2GhaBB7fsj5YW2QB2Cf8EKx9arZuVoSvRaOyf1Q9ouTVw4?=
 =?us-ascii?Q?yOrf0kLvfoWu5At7newoSVg4WcRjBZp3SGTWteY9rX0PXAumTDuhJlYr9LmS?=
 =?us-ascii?Q?2r5IzzDpsOL1D0rhg9dgJWDRZYZ3uNybrVe5qvo/vkF7XNKVFw9bB46Bbp+S?=
 =?us-ascii?Q?bdUdM53jhDYQBIVEYGPouz6CL7ZaGSJaK2FcUz8NNfAaY6SYHjX/W+96GrNs?=
 =?us-ascii?Q?V9OuCtQfTI4ytbZtvBxZ0H/zn4xIQBHJikbGhjF1OVnt/It41dDy+rZfb1Y9?=
 =?us-ascii?Q?hJ+ROYIH8F2LVDLTMLqyJeylHKZa2+UPy864+wDLjioENDceHn6IIMtCXLbD?=
 =?us-ascii?Q?K9yDFjz0ry5XXyOTs5mOhdBGj+TY7iKPEE2BbnubLbQmMtgy/XZ9pKZTRhmf?=
 =?us-ascii?Q?C7bBxlh3088BHk6wqQofIqtwPsyi+3gl1aq0wzN67yxIYkY+aiQCqgfBpji+?=
 =?us-ascii?Q?jxo+nO2RicOFls2itA4mcHwO2DihclyBg3dZB+/IrspjiEom0w++9pKV6I2j?=
 =?us-ascii?Q?BYVGOvbqPiw2RUH8U7UqVht/Z/nHDTRTyyuewyUEdYhQAplYUZQ66+YxMhVb?=
 =?us-ascii?Q?Sr9g2/zWexNaCeOZr1DJv8YmYGelqv9ONCWTTu0q4LJQgU0/vkpvfKWng7gQ?=
 =?us-ascii?Q?caAzHhNBA7JilzZmdShxpJenP5Yo15Y89dqNc/liQz367jlCVuxVcQ11kJ8M?=
 =?us-ascii?Q?U5h/5sd6yJI6uhkLFyTlHzaXn559xZviyxmH9g4e+YuNgcGpMV0nGf+iNicn?=
 =?us-ascii?Q?SPctfxQ8eznL2utkg6L+gJOxidJAztfYd80A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:44.1708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf8dadf-b36a-4952-05a7-08dd7b27cdc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968

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

We implement a new AMD CPU frequency driver `amd-cppc-epp` for active mode.
It requires `active` tag for users to explicitly select active mode.
In driver `active-cppc-epp`, ->setpolicy() is hooked, not the ->target(), as
it does not depend on xen governor to do performance tuning.

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
v3 -> v4:
- doc refinement
- use MASK_EXTR() to get epp value
- fix indentation
- replace if-else() with switch()
- combine successive comments and do refinement
- no need to introduce amd_cppc_epp_update_limit() as a wrapper
- rename cpufreq_parse_policy() with cpufreq_policy_from_governor()
- no need to use case-insensitive comparison
---
 docs/misc/xen-command-line.pandoc    |   8 +-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 121 ++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/msr-index.h |   1 +
 xen/drivers/cpufreq/utility.c        |  11 +++
 xen/include/acpi/cpufreq/cpufreq.h   |  12 +++
 xen/include/public/sysctl.h          |   1 +
 6 files changed, 149 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9ef847a336..09f5cb452f 100644
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
+  mode, users could write to energy performance preference register(epp) to
+  tell hardware if they want to bias toward performance or energy efficiency.
+  Then built-in CPPC power algorithm will calculate the runtime workload and
+  adjust cores frequency automatically according to the power supply, thermal,
+  core voltage and some other hardware conditions.
 
 There is also support for `;`-separated fallback options:
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 2fdfd17f59..3a576fd4be 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -30,6 +30,9 @@
         printk(XENLOG_DEBUG "AMD_CPPC: CPU%u " fmt, cpu, ## args);  \
 })
 
+static bool __ro_after_init opt_active_mode;
+static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
+
 struct amd_cppc_drv_data
 {
     const struct xen_processor_cppc *cppc_data;
@@ -76,6 +79,13 @@ static bool __init amd_cppc_handle_option(const char *s, const char *end)
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
 
@@ -244,11 +254,18 @@ static void cf_check amd_cppc_write_request_msrs(void *info)
 }
 
 static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
-                                   uint8_t des_perf, uint8_t max_perf)
+                                   uint8_t des_perf, uint8_t max_perf,
+                                   uint8_t epp)
 {
     struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
     uint64_t prev = data->req.raw;
 
+    if ( !opt_active_mode )
+        data->req.des_perf = des_perf;
+    else
+        data->req.des_perf = 0;
+    data->req.epp = epp;
+
     data->req.min_perf = min_perf;
     data->req.max_perf = max_perf;
     data->req.des_perf = des_perf;
@@ -259,6 +276,14 @@ static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
     on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);
 }
 
+static void read_epp_init(void)
+{
+    uint64_t val;
+
+    rdmsrl(MSR_AMD_CPPC_REQ, val);
+    this_cpu(epp_init) = MASK_EXTR(val, AMD_CPPC_EPP_MASK);
+}
+
 static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
                                             unsigned int target_freq,
                                             unsigned int relation)
@@ -280,7 +305,10 @@ static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
      * performance in P-state range.
      */
     amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
-                           des_perf, data->caps.highest_perf);
+                           des_perf, data->caps.highest_perf,
+                           /* Pre-defined BIOS value for passive mode */
+                           per_cpu(epp_init, policy->cpu));
+
     return 0;
 }
 
@@ -360,6 +388,8 @@ static void cf_check amd_cppc_init_msrs(void *info)
      */
     policy->cur = cpufreq_driver_getavg(policy->cpu, GOV_GETAVG);
 
+    read_epp_init();
+
     return;
 
  err:
@@ -393,7 +423,7 @@ static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
-static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int amd_cppc_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
     struct amd_cppc_drv_data *data;
@@ -434,12 +464,82 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
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
     amd_cppc_verbose(policy->cpu,
                      "CPU initialized with amd-cppc passive mode\n");
 
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
+    policy->policy = cpufreq_policy_from_governor(policy->governor);
+
+    amd_cppc_verbose(policy->cpu,
+                     "CPU initialized with amd-cppc active mode\n");
+
+    return 0;
+}
+
+static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
+                                                   policy->cpu);
+    uint8_t max_perf, min_perf, epp;
+
+    /*
+     * Initial min/max values for CPPC Performance Controls Register.
+     * Continuous CPPC performance scale in active mode is [lowest_perf,
+     * highest_perf]
+     */
+    max_perf = data->caps.highest_perf;
+    min_perf = data->caps.lowest_perf;
+
+    /*
+     * As min_perf sets the idle frequency and max_perf sets the maximum
+     * frequency, we make min_perf equal with max_perf in performance mode
+     * and lower max_perf to the nominal perf in powersave mode, to achieve
+     * ultmost performance and efficiency in each mode.
+     */
+    switch ( policy->policy )
+    {
+    case CPUFREQ_POLICY_PERFORMANCE:
+        /* Force the epp value to be zero for performance policy */
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        min_perf = max_perf;
+        break;
+    case CPUFREQ_POLICY_POWERSAVE:
+        /* Force the epp value to be 0xff for powersave policy */
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        max_perf = data->caps.nominal_perf;
+        break;
+    default:
+        epp = per_cpu(epp_init, policy->cpu);
+        break;
+    }
+
+    amd_cppc_write_request(policy->cpu, min_perf,
+                           0 /* no des_perf for epp mode */,
+                           max_perf, epp);
+    return 0;
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
@@ -450,6 +550,16 @@ amd_cppc_cpufreq_driver =
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
@@ -460,7 +570,10 @@ int __init amd_cppc_register_driver(void)
         return -ENODEV;
     }
 
-    ret = cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+    if ( opt_active_mode )
+        ret = cpufreq_register_driver(&amd_cppc_epp_driver);
+    else
+        ret = cpufreq_register_driver(&amd_cppc_cpufreq_driver);
     if ( ret )
         return ret;
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 3ffa613df0..d29d1d33aa 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -242,6 +242,7 @@
 #define MSR_AMD_CPPC_ENABLE                 0xc00102b1U
 #define  AMD_CPPC_ENABLE                    (_AC(1, ULL) <<  0)
 #define MSR_AMD_CPPC_REQ                    0xc00102b3U
+#define  AMD_CPPC_EPP_MASK                  (_AC(0xff, ULL) <<  24)
 
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index b35e2eb1b6..2617581125 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -487,3 +487,14 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
 
     return __cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 }
+
+unsigned int cpufreq_policy_from_governor(const struct cpufreq_governor *gov)
+{
+    if ( !strncmp(gov->name, "performance", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_PERFORMANCE;
+
+    if ( !strncmp(gov->name, "powersave", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_POWERSAVE;
+
+    return CPUFREQ_POLICY_UNKNOWN;
+}
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 83050c58b2..6f31009e82 100644
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
+unsigned int cpufreq_policy_from_governor(const struct cpufreq_governor *gov);
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


