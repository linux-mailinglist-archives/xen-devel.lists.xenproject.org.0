Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD38B943DA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 06:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128126.1468625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uo8-0001hV-PV; Tue, 23 Sep 2025 04:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128126.1468625; Tue, 23 Sep 2025 04:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uo8-0001eT-Jk; Tue, 23 Sep 2025 04:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1128126;
 Tue, 23 Sep 2025 04:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0uo6-0000c8-PZ
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 04:39:14 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4004859e-9837-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 06:39:12 +0200 (CEST)
Received: from SJ0PR03CA0389.namprd03.prod.outlook.com (2603:10b6:a03:3a1::34)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 04:39:05 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::28) by SJ0PR03CA0389.outlook.office365.com
 (2603:10b6:a03:3a1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 04:39:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Tue, 23 Sep 2025 04:39:03 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:39:00 -0700
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
X-Inumbo-ID: 4004859e-9837-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKo8CVsnEy3gHR4qTB+ORmJ6JXsYkSmmQyuG+TZm8CItzYqsuwItbvamRtTbWp1I3ownp4Y8UuahdmSkd/pC2BiechHZGp21gzUEc4o1xM5wenvo2ziypI1Lt/ndPYOltIIqcf1WGThtuCWxBVABaAlUgqLrVHj5kdRdh0bxd2/lMVdKdm13aKRmTbg2pKaB+VP7ZMAyVLCmHrE0U2OIjYx4bdJsHFy34cIoe7IPD7blvaACNRTNdavkf4nOLN9XA+q9bF+vnH6Yx6wwI1cNdZg4v6+pbV9cpBlUGCpsJuGnbrXxfslMNFGSXKU6u75DfVVFlIjfShwy2bbdDkMm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZfiAaMkEHd2Z9flw600hOdC8SYeEwbly8Qvsy0m8Ng=;
 b=Bw9roqnx1v5af7HNHp1CHON9ld52ekuaCDmVlKSz/MiiKli1U0o/GgHnfJEkG8MoDsQAJjXvBPpaCHbCmyZm+qF04sGthSLdEx5B4s2ULXmPGBHVikfC2LWs5pBdou+HXS5mZ0AoUCyUWMij0QSg8atbV2+1Lv0EQXDXXu1aCzBpPgJGOsWY5fJJtGbRSuoQLRe8AGLKfLDIydoUOCq+MHnDtawi8ns/S+j0SQIHA9SbSPMkj1rhiQ0niRSfuibdyIopmagEN9DVxddbuHYHP12pBmp3vX3XWeClIRl/UrrCnR66qY9Cfkta3I6cwtDNZY/ZTAStzY38Ut26yVGZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZfiAaMkEHd2Z9flw600hOdC8SYeEwbly8Qvsy0m8Ng=;
 b=PZFGSiDJr0S4mbWVhpJsxk+sw7JqvmipMn97iyDZOOuk4PPF+6gLvMemWuOXzsWJ9DpTi8xmIC5XAQL/lPzNrzwhZLItvDkk3qDJkQNkx+wSvkXCmL0mvyFAtvUpx9wyb7Bfnlhmq7DPlddhn9H/1Y7f7U9nH8u0CeSFmhi4Tf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 3/8] xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
Date: Tue, 23 Sep 2025 12:38:21 +0800
Message-ID: <20250923043826.3831957-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923043826.3831957-1-Penny.Zheng@amd.com>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bff5e0-f9fa-4654-f0b2-08ddfa5b1fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RWDFmyP6gm2G9BarSqUnYIrOvrrIlsvyjcyY2XnHfTGVjSys1HCy8zt7/mC4?=
 =?us-ascii?Q?m205iF+HCKmoqUJJicSDPMev6MegCrIO6A2c1yvKcXvi2daSlxXqTzBNVn5H?=
 =?us-ascii?Q?SW1CPTZ09cKFsZm8SPkdAFWA3idEwHtXj6kNAk+lv+WuI+zoYA4cixieilF8?=
 =?us-ascii?Q?JUIml/ZKgkuAlHs8F38m6UZDetjd6/298k0eifFXSUMe2P9gc5wDFYzagS/W?=
 =?us-ascii?Q?ZXMFt5/Zfsgy5xXmaZ/bWQihVBAkNO12xBeFyuqf6NW9sSGaeFgUp/5Nf182?=
 =?us-ascii?Q?Dxu8FNL9iMDJ+OmbjVOeCBhfZKEcwyhcqNJc/gLtwyNvmu2AgZ+LS4qLRlTo?=
 =?us-ascii?Q?sGLW+AJN5uH4y8+eH3HEZisSK6yzbSlbUp9ZOMmaAgjBEF7u7OlOfFgXvICZ?=
 =?us-ascii?Q?/vkCHynNNoOU94YhAykepHOKh0TwV6AENoFeiZEuZt9v1fezbekdZjk0yCiI?=
 =?us-ascii?Q?3R7xAW5NX2I56XpoeaDzaUrjrtkz5OisZbgT1zQgJgaIangbvh9qxZ69OlRv?=
 =?us-ascii?Q?45MVSSxEXt/joxkP960q/ku0GG5I2PiGNPx9lmOqFMQ4WE3H5w8V8c7peda/?=
 =?us-ascii?Q?ntDnHSeGgsccYZo82uDqhXWb7lOdNXcrZnnzVInrx0mUOodVvTdtSZw14Dcl?=
 =?us-ascii?Q?JksolmyDo5+5xcgcvg62uelGxjOYn1KaqJxe2Mm+f65clWyCXZqc11xX+P8a?=
 =?us-ascii?Q?fhINgZSv+podbQDFyIujIN+Jf10pi30SiWnWtzyqt+jB92mrYf/iOTjH8xVF?=
 =?us-ascii?Q?TOmTMkgyplnD6fATAMgTZfYr2tnXlojHEWJiQJeDLNADWDkTldzvXyIZQ2Y5?=
 =?us-ascii?Q?Rw8ms8TOwfZonOy1T1tX+0ai3J/5w9JjI3aXvS/YESu8Em3mipy/TYHjjacb?=
 =?us-ascii?Q?FDcXMEpzymtg3/NrHKspeuSZybdhH0KxNS2ME3tKh6zezc6reYoxZsjsRdMX?=
 =?us-ascii?Q?LhRN0BZ1Xixg1wobmAwylBz3iVRLBR+kiXMEOq6x4B6izQ5E2/zHsu/VJmo3?=
 =?us-ascii?Q?vI3vCx5KqnSrkSW1/is/uLDSt0cozkwJRJc6j5y62p0MHiggl0KLZtunwd+i?=
 =?us-ascii?Q?Nk+UXPiL+lKV0JCoDVIzmXCQXHcx+ZQ4LWElYuYqhAeVO0FJBACM1p2ha9Nv?=
 =?us-ascii?Q?8TAH0D6LHP9dTAMccWGt8FyhoAH4qKhqE5O2bO2gRG11PwdlZhtd77xLvgZa?=
 =?us-ascii?Q?cvqdcE3YtXl0y7ugEo8K+PRMHstz7xJDQ08kOI4869vXJSqeUZ0sT3VW957C?=
 =?us-ascii?Q?odjvJX3amyi7Ygep0EQ/ewRG6z/nacPZ1e4nsoFBqLeEGdddMOvkuCo1nZ8b?=
 =?us-ascii?Q?4LvR54lbHVN+MkL6kuhyJWLf3Au7nd19x6vnYyY4nvqyByvypyb59bGlko+W?=
 =?us-ascii?Q?8BZ7X/rwXY/LJCmrhKk1v/uccNTodGzsCyaoXF4XKBaLJNtWSqNyH2wVb8Os?=
 =?us-ascii?Q?q7ET6kTMLmY3fsUFzc2LivAZcdjVUxGWJPfNOe+q6x64Rl2w6Te0ZK2DEb33?=
 =?us-ascii?Q?YTXJZ+JLmOz6Ean2hXvtOM1qIjSSSkOhTvI1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:39:03.8405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bff5e0-f9fa-4654-f0b2-08ddfa5b1fd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500

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
Acked-by: Jan Beulich <jbeulich@suse.com>
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
v7 -> v8:
- use "ASSERT(!opt_active_mode || !des_perf);" to remove #ifndef NDEBUG
- add a new helper amd_cppc_prepare_policy()
---
v8 -> v9:
- Adapt to changes of "Embed struct amd_cppc_drv_data{} into struct
cpufreq_policy{}"
---
v9 - v10
- rewind the changes in v9
---
 docs/misc/xen-command-line.pandoc    |   9 +-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 135 ++++++++++++++++++++++++++-
 xen/drivers/cpufreq/utility.c        |  15 +++
 xen/include/acpi/cpufreq/cpufreq.h   |  18 ++++
 xen/include/public/sysctl.h          |   1 +
 5 files changed, 173 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 518e42d965..28a98321c7 100644
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
index 5b99b86fb7..bb7f4e4a9e 100644
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
 
@@ -270,6 +288,7 @@ static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
 
     data->req.min_perf = min_perf;
     data->req.max_perf = max_perf;
+    ASSERT(!opt_active_mode || !des_perf);
     data->req.des_perf = des_perf;
     data->req.epp = epp;
 
@@ -417,7 +436,7 @@ static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
-static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int amd_cppc_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
     struct amd_cppc_drv_data *data;
@@ -450,12 +469,103 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
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
+static void amd_cppc_prepare_policy(struct cpufreq_policy *policy,
+                                    uint8_t *max_perf, uint8_t *min_perf,
+                                    uint8_t *epp)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
+                                                   policy->cpu);
+
+    /*
+     * On default, set min_perf with lowest_nonlinear_perf, and max_perf
+     * with the highest, to ensure performance scaling in P-states range.
+     */
+    *max_perf = data->caps.highest_perf;
+    *min_perf = data->caps.lowest_nonlinear_perf;
+
+    /*
+     * In policy CPUFREQ_POLICY_PERFORMANCE, increase min_perf to
+     * highest_perf to achieve ultmost performance.
+     * In policy CPUFREQ_POLICY_POWERSAVE, decrease max_perf to
+     * lowest_nonlinear_perf to achieve ultmost power saving.
+     * Set governor only to help print proper policy info to users.
+     */
+    switch ( policy->policy )
+    {
+    case CPUFREQ_POLICY_PERFORMANCE:
+        /* Force the epp value to be zero for performance policy */
+        *epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        *min_perf = *max_perf;
+        policy->governor = &cpufreq_gov_performance;
+        break;
+
+    case CPUFREQ_POLICY_POWERSAVE:
+        /* Force the epp value to be 0xff for powersave policy */
+        *epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        *max_perf = *min_perf;
+        policy->governor = &cpufreq_gov_powersave;
+        break;
+
+    case CPUFREQ_POLICY_ONDEMAND:
+        /*
+         * Set epp with medium value to show no preference over performance
+         * or powersave
+         */
+        *epp = CPPC_ENERGY_PERF_BALANCE;
+        policy->governor = &cpufreq_gov_dbs;
+        break;
+
+    default:
+        *epp = per_cpu(epp_init, policy->cpu);
+        break;
+    }
+}
+
+static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
+{
+    uint8_t max_perf, min_perf, epp;
+
+    amd_cppc_prepare_policy(policy, &max_perf, &min_perf, &epp);
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
@@ -466,10 +576,27 @@ amd_cppc_cpufreq_driver =
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


