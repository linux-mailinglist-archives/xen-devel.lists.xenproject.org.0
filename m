Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8BB011DF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:01:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040271.1411770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wm-0003L5-R1; Fri, 11 Jul 2025 04:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040271.1411770; Fri, 11 Jul 2025 04:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wm-0003Jb-Lb; Fri, 11 Jul 2025 04:01:16 +0000
Received: by outflank-mailman (input) for mailman id 1040271;
 Fri, 11 Jul 2025 04:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nt-0002Li-Jt
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:52:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6657bc1f-5e0a-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 05:52:02 +0200 (CEST)
Received: from SJ0PR05CA0066.namprd05.prod.outlook.com (2603:10b6:a03:332::11)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 03:51:54 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::66) by SJ0PR05CA0066.outlook.office365.com
 (2603:10b6:a03:332::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Fri,
 11 Jul 2025 03:51:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:54 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:50 -0500
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
X-Inumbo-ID: 6657bc1f-5e0a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0GAdjmJ8lDkxjXb86b1VZn6574bthSdIfwVzWHMV9sMIGAWaGw3kHyOFgH3JONzgR+AoOgihQb2bv29WnkwODUtiAbNc/UhbobLkq3Uq2zQyqrRUjnGBU0nUjzHHztfiZhtOX2AGWvR6QDdbUY3TbRaKIWCXdjKe1f6X+lsFqV8NU/yEW/1uq2WJR5thge9QK+UEvvNI51b5HDb/aR6FJxN8G4/nz4tGVD9DrGDlCRSMlf+SngCTFOCiGcCheD893hP8yg+CTobKEh25bOUqrGHkbwz1ut+3aGd6SM9xbtvOYRz+mXfQPaGqQFxoU4J/8TGKQMxFjNre3KljosGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+R0UAj/HzlcBNIGjCUFtgzJlzFYLewfRBFFr4ArcfM=;
 b=LTOcTEfN2T4ZEIJ/ysji0/h64EgUah186UHqt0wztzdrcsYY1LqH7qmjKN79q8HMEiWhJ1ekw0wH8EH0Yrn9OQvbeqj8COxzvV/ADCpoGTLeLHrsQGnHIDcK+AbJTYomeMcWeV35PrkfxqYZL8Q5schMbOmcuylNlUNbAXTOd31O2Ezx63CDYA43taDGKvBHmBGaHZnfFEivEkCdzIAXkkPDS5O8q8ONg2Dgdqo1yGrWAQxxHVw9EDuLGfBlnXw2Gyp1+fdVw/Lq66wfw704b01zIqS3BJjyczXq/uZFwSmEF+w2QjoOO141PGY1Yun/67Vm1HyAFtv4miMKsvGOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+R0UAj/HzlcBNIGjCUFtgzJlzFYLewfRBFFr4ArcfM=;
 b=O19P9MDCB3CWiHyrTcpp0+ggflh/ZGz4Op7xzdFpfqoYHS+xwqGNuMJbF0058XEqKJUf4wHs4F8PWAY8tw9MngPmWCnYE/t6Q2D2tkeKuSxRye0HGcz0LyZ+KmqaUDgnnu3IA6fV++pPQb59j0/MawP2pwGMtFxUBWbTFgA0POk=
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
Subject: [PATCH v6 13/19] xen/x86: implement amd-cppc-epp driver for CPPC in active mode
Date: Fri, 11 Jul 2025 11:51:00 +0800
Message-ID: <20250711035106.2540522-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a40a99-b8e5-45b6-15ca-08ddc02e46ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ucVN1+9soR0CC5pq6zDZzr9zBLft/aqAhD3q0vQM0sGdu0fdhPsd7M6p0cps?=
 =?us-ascii?Q?tQNPYxOK2eeBgno0RCskoKWijlpabxVRJHph7E+EKCkmlFOxwXi39SYkTDtC?=
 =?us-ascii?Q?lDtnBUo7Kd9o71ZmMMmfWNfQmIUrjnU+RtUWsQ4IIgMyOaHpE6QrWLoTegt7?=
 =?us-ascii?Q?aFvAQDELzoLqQPjBpLMyWIwKvvt0KPfn2IfaOq08WXv8r78ES6K02f5QTGty?=
 =?us-ascii?Q?DtryXJo9lRID8Wku3CQWIoy/YVNMhxI9phL8rDMtLqOS9Ptyz23yaC4j+K3q?=
 =?us-ascii?Q?Gm9ja2BQrRMplrJz9aBWcFdBFKBiBXF0J7FOulbPcN8aAGTQ0fNkepLWLmoV?=
 =?us-ascii?Q?0XB0S3VCxQSIE7IKNI3U2YHz4pOYSWC7vc6v8O3BOJZHIi1uWNdR7KOJM3H1?=
 =?us-ascii?Q?hWHg0Jql7T3WGJ5xArMC0MSRKM+v/pwKiQmWP2lg3aDwnNbyTMfhVqyqS3zu?=
 =?us-ascii?Q?//fioC40NURWEnUpeRDnmK88846v1kvMGkw7l/xlEhpSM7y6dcGgYucQ5d3q?=
 =?us-ascii?Q?XSQyhMG6zIT1qHO0iFPCJ/mNNArHvBchrtQ1tJmpVG/L9MACfetrXJJL9aKd?=
 =?us-ascii?Q?Gu2OxzeYRC47xPnr5IDSwrldxE2oWC6rsZr4nuFua0ycCF6Q3vkHkeZoVY2+?=
 =?us-ascii?Q?WEx+Dvm91KHWuCIU5ONSoGbkLsolzYhttVxKfLBR1fn8ylE895DqZTJmKAd0?=
 =?us-ascii?Q?yjD+bISv/Lbo3hkINIGECC2NlNZyaGrdUlJLw7aedFoGIkM0Kt9F/NAeUnNV?=
 =?us-ascii?Q?M+rL2JKXNgoT+VE7EHPvPW0SfoItNd2nWS/KDwZtcNrrb313KoxlI6hiRAAe?=
 =?us-ascii?Q?odQdg5hmaHDsIa5csAEGXri2FqAfgtMRKtscYv0wtpzgaZVKxK0cce3vBgOh?=
 =?us-ascii?Q?sYOrDWYoUYUKcNXY/W06zgZn7I6bHYMi+Ez0wUDGxm/gD6O+pXDPc7LyL4/9?=
 =?us-ascii?Q?k/R6eRki4SymCf03Z077Kj8fwSXvmAnsaxgtvzi6zposEbbnztMYxc47/8By?=
 =?us-ascii?Q?/Xwb7PUxkbn4cc62wZ/oZxkCf1cXEbZrqEcSPdGLkx1PORQQ0aJJeH6ryvlv?=
 =?us-ascii?Q?FcXi6CgKa7p3EyoaXRVMkssB8rFhh1EQh7eT4x1XFz50Fh593o9TYOcp7uKz?=
 =?us-ascii?Q?H2OhRi2REbTFCc7jEJ70WOCamKKLX5sJNjbjfDr5JZYoHcApOgZGWhUx67hj?=
 =?us-ascii?Q?oG4bL3PRLOXAJtKtYoFVLaS+et8b5P4+QnPuHp0FN+o6ysns0s7DV1EMUfYJ?=
 =?us-ascii?Q?rnW7jY6MTJPC6t/Zh9UR/CH+gW1wdW9yuwq56SVOm9r6X7PM8bWk9ALrZV8H?=
 =?us-ascii?Q?xRPS6orAgm7aiButSm51vtAliZh5zB7ddZdeCLaF2JZmOORhQRl280cppJj5?=
 =?us-ascii?Q?Zq5OLj72l3vAuKBHGXim1fXMmpVWoaFT9oCm2pYnBvwh+s3uMq/i+AODB74m?=
 =?us-ascii?Q?SUfjo0MV0K9HDi4e3aKEL5uoVU7EIC6GOzk3lfgNIS7mqXpsYgQ+FnLcjPiO?=
 =?us-ascii?Q?A/zi50Mx66TGwhea5LoVfXhKQ0GUKdk3Jo08?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:54.1968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a40a99-b8e5-45b6-15ca-08ddc02e46ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542

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
---
 docs/misc/xen-command-line.pandoc    |   9 +-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 143 ++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/msr-index.h |   1 +
 xen/drivers/cpufreq/utility.c        |  14 +++
 xen/include/acpi/cpufreq/cpufreq.h   |  18 ++++
 xen/include/public/sysctl.h          |   1 +
 6 files changed, 180 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 03761d9e3c..74404ed1e6 100644
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
index 57fd98d2d9..e4bd990982 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -67,7 +67,14 @@
  * max_perf.
  * Field des_perf conveys performance level Xen governor is requesting. And it
  * may be set to any performance value in the range [min_perf, max_perf],
- * inclusive.
+ * inclusive. In active mode, desf_perf must be zero.
+ * Field epp represents energy performance preference, which only has meaning
+ * when active mode is enabled. The EPP is used in the CCLK DPM controller [1]
+ * to drive the frequency that a core is going to operate during short periods
+ * of activity, called minimum active frequency, It could contatin a range of
+ * values from 0 to 0xff. An EPP of zero sets the min active frequency to
+ * maximum frequency, while an EPP of 0xff sets the min active frequency to
+ * approxiately Idle frequency.
  */
 struct amd_cppc_drv_data
 {
@@ -104,6 +111,9 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *,
  */
 static DEFINE_PER_CPU_READ_MOSTLY(unsigned int, pxfreq_mhz);
 
+static bool __ro_after_init opt_active_mode;
+static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
+
 static bool __init amd_cppc_handle_option(const char *s, const char *end)
 {
     int ret;
@@ -115,6 +125,13 @@ static bool __init amd_cppc_handle_option(const char *s, const char *end)
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
 
@@ -259,11 +276,18 @@ static void cf_check amd_cppc_write_request_msrs(void *info)
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
@@ -274,6 +298,14 @@ static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
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
@@ -297,7 +329,10 @@ static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
      * value, we prefer lowest nonlinear performance over lowest performance.
      */
     amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
-                           des_perf, data->caps.highest_perf);
+                           des_perf, data->caps.highest_perf,
+                           /* Pre-defined BIOS value for passive mode */
+                           per_cpu(epp_init, policy->cpu));
+
     return 0;
 }
 
@@ -373,6 +408,8 @@ static void cf_check amd_cppc_init_msrs(void *info)
      */
     policy->cur = cpufreq_driver_getavg(policy->cpu, GOV_GETAVG);
 
+    read_epp_init();
+
     return;
 
  err:
@@ -406,7 +443,7 @@ static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
-static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int amd_cppc_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
     struct amd_cppc_drv_data *data;
@@ -439,12 +476,91 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
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
+        min_perf = data->caps.highest_perf;
+        break;
+
+    case CPUFREQ_POLICY_POWERSAVE:
+        /* Force the epp value to be 0xff for powersave policy */
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        max_perf = data->caps.lowest_nonlinear_perf;
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
@@ -455,10 +571,27 @@ amd_cppc_cpufreq_driver =
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
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 815f1b9744..6f731685e5 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -245,6 +245,7 @@
 #define MSR_AMD_CPPC_ENABLE                 0xc00102b1U
 #define  AMD_CPPC_ENABLE                    (_AC(1, ULL) << 0)
 #define MSR_AMD_CPPC_REQ                    0xc00102b3U
+#define  AMD_CPPC_EPP_MASK                  (_AC(0xff, ULL) << 24)
 
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index 987c3b5929..64bcc464f6 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -281,3 +281,17 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
 
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
index 32cf905fb8..b0b22d1c9c 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -82,6 +82,7 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
+    unsigned int        policy; /* CPUFREQ_POLICY_* */
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
@@ -132,6 +133,23 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
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


