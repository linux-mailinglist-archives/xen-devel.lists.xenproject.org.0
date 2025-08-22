Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11B8B31602
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 13:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089939.1447417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPWA-0006KZ-29; Fri, 22 Aug 2025 11:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089939.1447417; Fri, 22 Aug 2025 11:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPW9-0006Ij-Uf; Fri, 22 Aug 2025 11:01:09 +0000
Received: by outflank-mailman (input) for mailman id 1089939;
 Fri, 22 Aug 2025 11:01:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPOK-0008I9-PW
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:53:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2413::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c5714ed-7f46-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 12:53:02 +0200 (CEST)
Received: from BN0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:408:141::33)
 by IA0PR12MB8375.namprd12.prod.outlook.com (2603:10b6:208:3dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 10:52:57 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::8b) by BN0PR07CA0024.outlook.office365.com
 (2603:10b6:408:141::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Fri,
 22 Aug 2025 10:52:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:56 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:54 -0500
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
X-Inumbo-ID: 2c5714ed-7f46-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8TNQG/p2q4SEXuvTUypFuy9oBm23jueC8yuPKSQx2Ul81JHvIQ3bD3nQFjc2M0fD1soZrtal78qUxjDPtoRb+74l5/R/K6qttuFQjDJDz+3kSLWJO7HeeUDqUBnqmspBqQvLnDs4F3Om+YyCvK2AXcvHzca/kkMpdia9kkjpNoQsuwaER2FQi/gUx/vdIsbxPe8sHGyRR3OJ58sY97BrQ+TsbgIWnyDMdFpXWAo6p37IYDoD0htjDBTL2w4yYkQwqfLlED7hf7OWFCZbAug6gjH3Ko/lGWffy3DI6a9in7dXejj5ZFixbGRkcRzl5l4+MpxPywL5DnuObZ2G9M6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7P2WcIeJ7VosYCvbsoFTVDQ9vBdDyzazPvXhfoBule4=;
 b=csZG/6epOTCcOlIAsJWMO2vUoABz4CUiyOezwYs50s6VA3I8Nw5nzcHMrU8BWcTHg3AcCD8zF4jvA2R5Ne92d0kLSsMXCmpP0/Dmk8wqG0qlMs4SltU2rJgxT6nnaguMlJh65AlSdAjF33NYxc+Yum6TGyM+Qw5iwNqWvw8PYuacMyYhv6pP6L2msPstsULCOWF1Gy4S8Kaa1n56SqDLM9thPXS8V1r4TIC1NUDbtkjiUKWwbt/ycskVWl41NotS274qJ2C6EKUT9mlu5QCUk82Y5nnLUcgSdtdi9AIe1WP3o1tx8CK71NzQG9SW4oJCSi15z/1yHly6tUPewf6o9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P2WcIeJ7VosYCvbsoFTVDQ9vBdDyzazPvXhfoBule4=;
 b=zyKbiUlPdKKFyoZXHcstUAsNkiH0G1X1eg5TJ3SLzQi+sl4X6HDyD/iLmcgTuAFpoFgx1id9LNMY+TWiiSN946VUkvX/dNn71p2kIj5dn7FsGPdf3h0wvKYpSQVdiX1XoaPEzdKPI+FhGWjZ+ynYf4POBPIzuQT9F6fTd5IbwxE=
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
Subject: [PATCH v7 09/13] xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
Date: Fri, 22 Aug 2025 18:52:14 +0800
Message-ID: <20250822105218.3601273-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822105218.3601273-1-Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|IA0PR12MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: be3e5e78-84f4-4db3-4869-08dde16a0dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cJICcprckuOlRRjUBGJ8QrVLzMx/0yq/ROWbdGm33JqxzFZYyXAcyrO8azXF?=
 =?us-ascii?Q?HRFrNpTmak+35H4QKCnbSSo9Tmw9EMNH6uF0gldwBFvt1tMaauemg7wT7LwS?=
 =?us-ascii?Q?pWs7xd2NEa8ZVtrlp6PKB1qqymLLlKCzfPtN92hrflckTO/l7UzHyU1WvanQ?=
 =?us-ascii?Q?uY1RJAgV1nxVkPtGquKp83nX4/2yusCe+q7HGZjn+5GANiOlIOPdUiJrZGby?=
 =?us-ascii?Q?ls3paDcTqoJFqVO0raoZDWRS4Z0PyJalz3HfjA5RdTF1f12ineagMXFrHrfD?=
 =?us-ascii?Q?VO+RhDS4NJzWgDngOO50UBAt9bKOMS+oEd5py9ij5ok4HwmAPl2Qe5sBel7U?=
 =?us-ascii?Q?JoAxThLLH+MMaz3UCF3Cqp79FJIXZbtEjQYB199psxYMjV4eeVe7emxeqXLZ?=
 =?us-ascii?Q?GIYco/fNn+eXPIdNodoM1fJfkPLLYQ5FqdOLFAatmQPFRvGhcJU5HKrbNN2F?=
 =?us-ascii?Q?NPA0/LIoRG579MhEgs6bCMi4NEYRVABgha9uL6G3VzX9rc5zs/VDM1yEDxp5?=
 =?us-ascii?Q?SOxZSojXGvWRPtOoh4uUSDvZ43D7OquNXtE3Nju/lL+oc0y52otOJrJClIze?=
 =?us-ascii?Q?qeShAtS+d5dCA2r+sztXTwMJH9+MreW8Pwo+PsHbK+3+V+pL+NNhE+sPJDDt?=
 =?us-ascii?Q?2sT8g0Z9IXHVxtdPNfNVVkhKzz7D+Pr9Qrao5VdUUbkluo1sOGdJYzkFs+5o?=
 =?us-ascii?Q?2k9jhQZVGLcYMYdeL1n89m4BwfPZmR77694NMqwhLK57m1K3VuWlc+I6tpeV?=
 =?us-ascii?Q?BHaNOOca6WQW9hegLZ8NEf36CpAWFKk/z467Ff6cta2jR/Cdn3oPumUP3ikN?=
 =?us-ascii?Q?y9MbK/u3oRGAu0TtN9kEwyi1iauTwBzO3qA0FdMS90mV0txmLt5poKeAKiA6?=
 =?us-ascii?Q?Z43XAujRH1S6zT/e6QjS8JaRNuXgpsAnZdEXHhWkfSWQsU1uxO2Rd+0jIMrV?=
 =?us-ascii?Q?AkLrAz9VdQBY5HIw51Hc+OCY6tBMJQT8eX/VjLD5N8o19aerS+8CN9GTBun5?=
 =?us-ascii?Q?nojJI2rjSFW/L8LBg3MS7PFI4x/fG9AMAPWAX260wmd7+RVxyT6o/sIuRDaT?=
 =?us-ascii?Q?WBA6+qA776zTKIDsBz2YEJl1dKk6bziqYphyGN/osBrd/ydvVrg0qm9Xn05R?=
 =?us-ascii?Q?eCbgsUxlr40rVUWWa1gb/4hP3Yfs0kjIUj/ncxHH6K4QoHqa9Z0m7TAIVg5u?=
 =?us-ascii?Q?MsN8MCQn46X7hRIVgKTGsY3Nw6FEoY/5PWcls8Ao5PkIqlED1jb7B2Cwsuyc?=
 =?us-ascii?Q?iGcV/sbeUVwRkAOFVMAEZf9U7/IwnMY2FYw2j77JSc9uehgvrUiw7kKB+Ica?=
 =?us-ascii?Q?Ox8Jj84iM9CEw2YrKzQvtcBGb6dGLzt7QQfmaoq5C0i+uhl5a6EO5o5IUh6U?=
 =?us-ascii?Q?vm/vT/20pGkAllx3I5K998fbL5wOm5iz8KwQOXdFl9o1pSj0WFhTKTYNdApf?=
 =?us-ascii?Q?BeH3ESaly9Y67GDgFNviZ+SXZ+ZHYYXsYCzNr3uH56OqU34DVyQJkCSpAQNo?=
 =?us-ascii?Q?2IFWF10hzB9h+Whg6/YwRxwoNcP20jKlZx/d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:56.9352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be3e5e78-84f4-4db3-4869-08dde16a0dbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8375

amd-cppc has 2 operation modes: autonomous (active) mode and
non-autonomous (passive) mode.
In active mode, we don't need Xen governor to calculate and tune the cpu
frequency, while hardware built-in CPPC power algorithm will calculate the
runtime workload and adjust cores frequency automatically according to the
power supply, thermal, core voltage and some other hardware conditions.
In active mode, CPPC ignores requests done in the desired performance field,
and takes into account only the values set to the minimum performance, maximum
performance, and energy performance preference registers.

A new field EPP (energy performance preference), in CPPC request register, is
introduced. It will be used in the CCLK DPM controller to drive the frequency
that a core is going to operate during short periods of activity, called
minimum active frequency, It could contatin a range of values from 0 to 0xff.
An EPP of zero sets the min active frequency to maximum frequency, while
an EPP of 0xff sets the min active frequency to approxiately Idle frequency.

We implement a new AMD CPU frequency driver `amd-cppc-epp` for active mode.
It requires `active` tag in Xen cmdline for users to explicitly select active
mode.
In driver `active-cppc-epp`, ->setpolicy() is hooked, not the ->target(), as
it does not depend on xen governor to do performance tuning.

We also introduce a new field "policy" (CPUFREQ_POLICY_xxx) to represent
performance policy. Right now, it supports three values:
CPUFREQ_POLICY_PERFORMANCE as maximum performance, CPUFREQ_POLICY_POWERSAVE
as the least power consumption, and CPUFREQ_POLICY_ONDEMAND as no preference,
just corresponding to "performance", "powersave" and "ondemand" Xen governor,
which benefit users from re-using "governor" in Xen cmdline to deliver
which performance policy they want to apply.

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
v4 -> v5:
- refine doc to state what the default is for "active" sub-option and it's of
boolean nature
- excess blank after << for AMD_CPPC_EPP_MASK
- set max_perf with lowest_perf to get utmost powersave
- refine commit message to include description about relation between "policy"
and "governor"
---
v5 -> v6:
- expand comment for "epp" field
- let min_perf set with lowest_nonliner_perf, not lowest_perf, to constrain
  performance tuning in P-states range
- refactor doc and comments
- blank lines between non-fall-through case blocks
- introduce and add entry for "CPUFREQ_POLICY_ONDEMAND"
---
v6 -> v7
- make opt_active_mode __initdata when NDEBUG=y
- add assertion check for must-zero des_perf in active mode
- use the local variable max_perf and min_perf
- read_epp_init() doesn't worth a separate function
---
 docs/misc/xen-command-line.pandoc    |   9 +-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 126 ++++++++++++++++++++++++++-
 xen/drivers/cpufreq/utility.c        |  15 ++++
 xen/include/acpi/cpufreq/cpufreq.h   |  18 ++++
 xen/include/public/sysctl.h          |   1 +
 5 files changed, 164 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 3916cc81f6..c029a6e053 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -515,7 +515,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[verbose]]`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[active][,verbose]]`
 
 > Default: `xen`
 
@@ -537,6 +537,13 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
   on supported AMD hardware to provide finer grained frequency control
   mechanism. The default is disabled.
+* `active` is a boolean to enable amd-cppc driver in active(autonomous) mode.
+  In this mode, users don't rely on Xen governor to do performance monitoring
+  and tuning. Hardware built-in CPPC power algorithm will calculate the runtime
+  workload and adjust cores frequency automatically according to the power
+  supply, thermal, core voltage and some other hardware conditions.
+  The default is disabled, and the option only applies when `amd-cppc` is
+  enabled.
 
 There is also support for `;`-separated fallback options:
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index df9ed52237..1b4753a062 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -67,9 +67,14 @@
  * max_perf.
  * Field des_perf conveys performance level Xen governor is requesting. And it
  * may be set to any performance value in the range [min_perf, max_perf],
- * inclusive.
+ * inclusive. In active mode, des_perf must be zero.
  * Field epp represents energy performance preference, which only has meaning
- * when active mode is enabled.
+ * when active mode is enabled. The EPP is used in the CCLK DPM controller
+ * to drive the frequency that a core is going to operate during short periods
+ * of activity, called minimum active frequency, It could contatin a range of
+ * values from 0 to 0xff. An EPP of zero sets the min active frequency to
+ * maximum frequency, while an EPP of 0xff sets the min active frequency to
+ * approxiately Idle frequency.
  */
 struct amd_cppc_drv_data
 {
@@ -106,6 +111,12 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *,
  */
 static DEFINE_PER_CPU_READ_MOSTLY(unsigned int, pxfreq_mhz);
 static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
+#ifndef NDEBUG
+static bool __ro_after_init opt_active_mode;
+#else
+static bool __initdata opt_active_mode;
+#endif
+
 
 static bool __init amd_cppc_handle_option(const char *s, const char *end)
 {
@@ -118,6 +129,13 @@ static bool __init amd_cppc_handle_option(const char *s, const char *end)
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
 
@@ -270,6 +288,10 @@ static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
 
     data->req.min_perf = min_perf;
     data->req.max_perf = max_perf;
+#ifndef NDEBUG
+    if ( opt_active_mode )
+        ASSERT(!des_perf);
+#endif
     data->req.des_perf = des_perf;
     data->req.epp = epp;
 
@@ -417,7 +439,7 @@ static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
-static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int amd_cppc_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
     struct amd_cppc_drv_data *data;
@@ -450,12 +472,91 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
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
+     * On default, set min_perf with lowest_nonlinear_perf, and max_perf
+     * with the highest, to ensure performance scaling in P-states range.
+     */
+    max_perf = data->caps.highest_perf;
+    min_perf = data->caps.lowest_nonlinear_perf;
+
+    /*
+     * In policy CPUFREQ_POLICY_PERFORMANCE, increase min_perf to
+     * highest_perf to achieve ultmost performance.
+     * In policy CPUFREQ_POLICY_POWERSAVE, decrease max_perf to
+     * lowest_nonlinear_perf to achieve ultmost power saving.
+     */
+    switch ( policy->policy )
+    {
+    case CPUFREQ_POLICY_PERFORMANCE:
+        /* Force the epp value to be zero for performance policy */
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        min_perf = max_perf;
+        break;
+
+    case CPUFREQ_POLICY_POWERSAVE:
+        /* Force the epp value to be 0xff for powersave policy */
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        max_perf = min_perf;
+        break;
+
+    case CPUFREQ_POLICY_ONDEMAND:
+        /*
+         * Set epp with medium value to show no preference over performance
+         * or powersave
+         */
+        epp = CPPC_ENERGY_PERF_BALANCE;
+        break;
+
+    default:
+        epp = per_cpu(epp_init, policy->cpu);
+        break;
+    }
+
+    amd_cppc_write_request(policy->cpu, min_perf,
+                           0 /* no des_perf in active mode */,
+                           max_perf, epp);
+    return 0;
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
@@ -466,10 +567,27 @@ amd_cppc_cpufreq_driver =
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
+    int ret;
+
     if ( !cpu_has_cppc )
         return -ENODEV;
 
-    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+    if ( opt_active_mode )
+        ret = cpufreq_register_driver(&amd_cppc_epp_driver);
+    else
+        ret = cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+
+    return ret;
 }
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index 987c3b5929..e2cc9ff2af 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -250,6 +250,7 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
     data->min = policy->min;
     data->max = policy->max;
     data->limits = policy->limits;
+    data->policy = policy->policy;
     if (cpufreq_driver.setpolicy)
         return alternative_call(cpufreq_driver.setpolicy, data);
 
@@ -281,3 +282,17 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
 
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
+    if ( !strncmp(gov->name, "ondemand", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_ONDEMAND;
+
+    return CPUFREQ_POLICY_UNKNOWN;
+}
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 5d4881eea8..9ef7c4683a 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -81,6 +81,7 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
+    unsigned int        policy; /* CPUFREQ_POLICY_* */
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
@@ -131,6 +132,23 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
 extern struct cpufreq_governor *__find_governor(const char *governor);
 #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
 
+/*
+ * Performance Policy
+ * If cpufreq_driver->target() exists, the ->governor decides what frequency
+ * within the limits is used. If cpufreq_driver->setpolicy() exists, these
+ * following policies are available:
+ * CPUFREQ_POLICY_PERFORMANCE represents maximum performance
+ * CPUFREQ_POLICY_POWERSAVE represents least power consumption
+ * CPUFREQ_POLICY_ONDEMAND represents no preference over performance or
+ * powersave
+ */
+#define CPUFREQ_POLICY_UNKNOWN      0
+#define CPUFREQ_POLICY_POWERSAVE    1
+#define CPUFREQ_POLICY_PERFORMANCE  2
+#define CPUFREQ_POLICY_ONDEMAND     3
+
+unsigned int cpufreq_policy_from_governor(const struct cpufreq_governor *gov);
+
 /* pass a target to the cpufreq driver */
 extern int __cpufreq_driver_target(struct cpufreq_policy *policy,
                                    unsigned int target_freq,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index aa29a5401c..eb3a23b038 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -454,6 +454,7 @@ struct xen_set_cppc_para {
 };
 
 #define XEN_AMD_CPPC_DRIVER_NAME "amd-cppc"
+#define XEN_AMD_CPPC_EPP_DRIVER_NAME "amd-cppc-epp"
 #define XEN_HWP_DRIVER_NAME "hwp"
 
 /*
-- 
2.34.1


