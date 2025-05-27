Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146CAC4AA5
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997947.1378787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq03-0004EC-51; Tue, 27 May 2025 08:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997947.1378787; Tue, 27 May 2025 08:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq03-0004CX-1i; Tue, 27 May 2025 08:49:31 +0000
Received: by outflank-mailman (input) for mailman id 997947;
 Tue, 27 May 2025 08:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq02-00031E-C6
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:200a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f506cf6-3ad7-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:49:29 +0200 (CEST)
Received: from MW4PR04CA0160.namprd04.prod.outlook.com (2603:10b6:303:85::15)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 08:49:22 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::b9) by MW4PR04CA0160.outlook.office365.com
 (2603:10b6:303:85::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.23 via Frontend Transport; Tue,
 27 May 2025 08:49:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:21 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:18 -0500
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
X-Inumbo-ID: 7f506cf6-3ad7-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3rh5QKtwSeme2xscV4SNSIuuAmwinGmBtE2B0k4FMB0zhw6ivkt3HPRRDeSDcZadikvP4Wqi/f5AbsBukuryZlUCHTkfTZsgpI20h3ZSjbm1mMIOGC10KTCjTBvJmhyCxZQ2REZlvlykF2SisJw8rWRclSknJrWo2e2yw2z8/yiWF1r9AGQXHHn0iP/J1z+zBNqXYA7RSDXmvoMlzYssV7xdqCaD7V4QPkq+ph1kdyLQoPSeZCw+pOgaZerxHa22ywrIwEMehtB/sefYmvgrbZzPafZGKn5TeiM9K8O9c2MXmKuKy3QBu0BhDPUx1pHmQSx+/nGLUDNbqHFATY89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9erWVpE/ZTcLZIIbo/RSG1FVEIUzVM1kHU7GnlvLeo=;
 b=mPwkGpujwNQtWKC0LV4RCtNG8vcO6NOGM74dHrcwLJ002ELAEaGOlRHtFWh4RchfbqwaLb4FWbjYR5GAZojClGCC9pEg2a20v/qJDEUVtcO5zcznjZDRB7gM6usTFYtmLLjMe8kvsABMVGOB6vP1BbJa1Tw5E5iSdUFfXFcigQsTJO2m/SMYnCO5eTNTc7dXd+NG3CeaNjUifn+W+yQFcLcUA3xPtqwbm9KbnoiJlSnf+AKZ1DMVBRxSSF/Lg+HdzgqGazgLvH6KmH6a7YHfG3wykVYFb9JiL6wMD/hWi/1gkJymvkmgi+K44ZH8RNjWbBQAzrNwBRXX7aJqQNYA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9erWVpE/ZTcLZIIbo/RSG1FVEIUzVM1kHU7GnlvLeo=;
 b=EtAbKtMcKs8+SKkK+gaHmKUumMiN+wzp0WOU9fFRYBC0K/rSBpdSZS2StDSj9alc0xqpRZT18y4PhUaMluVAOSJ/Gm6UotT3UObmD+r+iWJC38UW8+m/5/e6H8no4PHsUagjz4AWnbji8O9WovJsUWRXAsNDTP0ezMRcQ5QIILc=
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
Subject: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
Date: Tue, 27 May 2025 16:48:21 +0800
Message-ID: <20250527084833.338427-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|MN2PR12MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ce0d71-04b9-47c8-1ea7-08dd9cfb600a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UJXu5iH9JqbJlHz3O7eEbqJVQ8WynXcwnG3NZPTn+gRCKT5s7H6xP5+j2rcc?=
 =?us-ascii?Q?5OOQIr+WP8vWlTsUWbUiAn6GG33xspDhPQ+FV7B/jzSQVVxj/q6ZGw2CoomK?=
 =?us-ascii?Q?HcHEFtPELLCJOjhO+q9hVBKQLJeQORjUhbv9GqAj3KMxlsBPl9f9SXW9tnxg?=
 =?us-ascii?Q?IQgG/7mfwnN5sdyIONo/2uPCP+NtNJclmKv91WAyxaOHgCwzooFpyGGXX+KW?=
 =?us-ascii?Q?IPBDcU29Fvd0/8vCVgoTC2lfro0JroZTLezfdxid4LWcpIkMunHrJ8lkv2JS?=
 =?us-ascii?Q?AKgHys0WNAI9EcUzbn93O4wAGYAJ+rp6OKQ6r4kuZDnh0wq3+ZToVsP0FZNp?=
 =?us-ascii?Q?8btAMBmE2GlCyZcyHwg14OQmwT1Xhut3xYMdq++qBF98q8DFjhYlIS+hHCda?=
 =?us-ascii?Q?Xad+umHgrTvCfy0qqew9x2jrcoseQUzTrxLPwgb6pKt4kZsUCpR+MQLmoDK0?=
 =?us-ascii?Q?bIS8VN93lrgtj1LWDl7lbIy1BhrKlmUB7/D2pZus1k5ut+qNquBTidKkH/qy?=
 =?us-ascii?Q?IEHM0iI+PHnliUO2UxpO1EboOyLbQPHywMkjAmaKlpgE5rg21sE7/eiGYMo+?=
 =?us-ascii?Q?aE9Ovxfe/ME7TU8RRGAcArRqmEZRgdwFQnEhgfvRAnXABZ2inrDi7OsItqiX?=
 =?us-ascii?Q?2o8Ep6bRcfdtxgHQDFiz35oMIAHk0C8MduZTekIJYz6jMOLrFt4o4j52Etd+?=
 =?us-ascii?Q?8PEVd9l6zIlbMydoBBVSegkDvrN+oQc49Gwxkn7l1LUY4AduAkFZUt1Lx1vT?=
 =?us-ascii?Q?X5vda2y3douDxc7c5wjhlpdgy9n4BDVILg7MPnuzYrrQ5+fjRKsJiU/nFF2m?=
 =?us-ascii?Q?GhYE8iV+4kAVaEOK9gknryLsFsOwWjZaJyATSbvTDNupSOvPoXeIr8FfX++J?=
 =?us-ascii?Q?3lRemqbecFUmDV+x4dKW1xS5DWVeQjfUP9IweFl8/OpSowJ+cMjTq2xo6Iaf?=
 =?us-ascii?Q?hdee8Wac50OoZqBMRkyiMMPNwUY46gehbB+h8X/Y3VEjixrrNez669ftywzx?=
 =?us-ascii?Q?yEv1y4ta3f6CMtsIZ4I6TF/y7mQIYTWumehtduvhI6DG1RyF3G2sNRG7x4Ha?=
 =?us-ascii?Q?dKWQGYrhNspfzjOTN4icIe8iG2wKh64FoncXr5cUUbKftzL51mO2a268lfCN?=
 =?us-ascii?Q?hCLMDVFTmCuX55dQpd/saEKMT4gQI8YI41qJ1xWhi+vQ1HjrxH2RP9T5lNK7?=
 =?us-ascii?Q?EmoKGNulWsUYD0vEnfN/VaBomJf21da2UTxhnlj6IItgNvcvcbG1afw2Dd0s?=
 =?us-ascii?Q?wRkJqRSwiD25x3QXsa1ZrcXVdF2nsKNjYs9v9Zy7taoCjlF/upmVeHFa1PM9?=
 =?us-ascii?Q?CV63+BzAhCjNuF1SDBSgthH/5PTo4DK/DfRmmKhoYKgbHy1WFg+vRgRGggKS?=
 =?us-ascii?Q?GyoO4bU2Sj3S8slWmxtx0/u/sEaCVZjb/fFgkS2GE0E230B4MDIUN08sR4g3?=
 =?us-ascii?Q?I/WOi4J195mLcPgPbyt/DsrU0E0Q7zui73iFKq8zmoV4RapI39uEfJTgaqmm?=
 =?us-ascii?Q?cScBpJ4WimPB85LNS2KpWx1wPEJXkYU/KK2K?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:21.7202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ce0d71-04b9-47c8-1ea7-08dd9cfb600a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128

Users need to set "cpufreq=amd-cppc" in xen cmdline to enable
amd-cppc driver, which selects ACPI Collaborative Performance
and Power Control (CPPC) on supported AMD hardware to provide a
finer grained frequency control mechanism.
`verbose` option can also be included to support verbose print.

When users setting "cpufreq=amd-cppc", a new amd-cppc driver
shall be registered and used. All hooks for amd-cppc driver are transiently
missing and will be implemented in the ongoing commits.

New xen-pm internal flag XEN_PROCESSOR_PM_CPPC is introduced, to be
differentiated with legacy XEN_PROCESSOR_PM_PX. We define
XEN_PROCESSOR_PM_CPPC 0x100, as it is the next value to use after 8-bits wide
public xen-pm options. All xen-pm flag checking involving XEN_PROCESSOR_PM_PX
shall also be updated to consider XEN_PROCESSOR_PM_CPPC now.

Xen is not expected to support both or mixed mode (CPPC & legacy PSS, _PCT,
_PPC) operations, so only one cpufreq driver gets registerd, either amd-cppc
or legacy P-states driver, which is reflected and asserted by the incompatible
flags XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Obey to alphabetic sorting and also strict it with CONFIG_AMD
- Remove unnecessary empty comment line
- Use __initconst_cf_clobber for pre-filled structure cpufreq_driver
- Make new switch-case code apply to Hygon CPUs too
- Change ENOSYS with EOPNOTSUPP
- Blanks around binary operator
- Change all amd_/-pstate defined values to amd_/-cppc
---
v2 -> v3
- refactor too long lines
- Make sure XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC incompatible flags
after cpufreq register registrantion
---
v3 -> v4:
- introduce XEN_PROCESSOR_PM_CPPC in xen internal header
- complement "Hygon" in log message
- remove unnecessary if()
- grow cpufreq_xen_opts[] array
---
v4 -> v5:
- remove XEN_PROCESSOR_PM_xxx flag sanitization from individual driver
- prefer ! over "== 0" in purely boolean contexts
- Blank line between non-fall-through case blocks
- add build-time checking between internal and public XEN_PROCESSOR_PM_*
values
- define XEN_PROCESSOR_PM_CPPC with 0x100, as it is the next value to use
after public interface, and public mask SIF_PM_MASK is 8 bits wide.
- as Dom0 will send the CPPC/Px data whenever it could, the return value shall
be 0 instead of -ENOSYS/EOPNOTSUP when platform doesn't require these data.
---
 docs/misc/xen-command-line.pandoc         |  7 ++-
 xen/arch/x86/acpi/cpufreq/Makefile        |  1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 68 +++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 63 ++++++++++++++++++++-
 xen/arch/x86/platform_hypercall.c         | 13 ++++-
 xen/drivers/acpi/pmstat.c                 |  3 +-
 xen/drivers/cpufreq/cpufreq.c             | 18 +++++-
 xen/include/acpi/cpufreq/cpufreq.h        |  6 +-
 xen/include/acpi/cpufreq/processor_perf.h |  3 +
 xen/include/public/sysctl.h               |  1 +
 10 files changed, 175 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 89db6e83be..9ef847a336 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -515,7 +515,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]]`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[verbose]]`
 
 > Default: `xen`
 
@@ -526,7 +526,7 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
   respectively.
 * `verbose` option can be included as a string or also as `verbose=<integer>`
-  for `xen`.  It is a boolean for `hwp`.
+  for `xen`.  It is a boolean for `hwp` and `amd-cppc`.
 * `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
   hardware.  HWP is a Skylake+ feature which provides better CPU power
   management.  The default is disabled.  If `hwp` is selected, but hardware
@@ -534,6 +534,9 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
   processor to autonomously force physical package components into idle state.
   The default is enabled, but the option only applies when `hwp` is enabled.
+* `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
+  on supported AMD hardware to provide finer grained frequency control
+  mechanism. The default is disabled.
 
 There is also support for `;`-separated fallback options:
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
diff --git a/xen/arch/x86/acpi/cpufreq/Makefile b/xen/arch/x86/acpi/cpufreq/Makefile
index e7dbe434a8..a2ba34bda0 100644
--- a/xen/arch/x86/acpi/cpufreq/Makefile
+++ b/xen/arch/x86/acpi/cpufreq/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_INTEL) += acpi.o
+obj-$(CONFIG_AMD) += amd-cppc.o
 obj-y += cpufreq.o
 obj-$(CONFIG_INTEL) += hwp.o
 obj-$(CONFIG_AMD) += powernow.o
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
new file mode 100644
index 0000000000..9e64bf957a
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * amd-cppc.c - AMD Processor CPPC Frequency Driver
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Author: Penny Zheng <penny.zheng@amd.com>
+ *
+ * AMD CPPC cpufreq driver introduces a new CPU performance scaling design
+ * for AMD processors using the ACPI Collaborative Performance and Power
+ * Control (CPPC) feature which provides finer grained frequency control range.
+ */
+
+#include <xen/domain.h>
+#include <xen/init.h>
+#include <xen/param.h>
+#include <acpi/cpufreq/cpufreq.h>
+
+static bool __init amd_cppc_handle_option(const char *s, const char *end)
+{
+    int ret;
+
+    ret = parse_boolean("verbose", s, end);
+    if ( ret >= 0 )
+    {
+        cpufreq_verbose = ret;
+        return true;
+    }
+
+    return false;
+}
+
+int __init amd_cppc_cmdline_parse(const char *s, const char *e)
+{
+    do {
+        const char *end = strpbrk(s, ",;");
+
+        if ( !amd_cppc_handle_option(s, end) )
+        {
+            printk(XENLOG_WARNING
+                   "cpufreq/amd-cppc: option '%.*s' not recognized\n",
+                   (int)((end ?: e) - s), s);
+
+            return -EINVAL;
+        }
+
+        s = end ? end + 1 : NULL;
+    } while ( s && s < e );
+
+    return 0;
+}
+
+static const struct cpufreq_driver __initconst_cf_clobber
+amd_cppc_cpufreq_driver =
+{
+    .name   = XEN_AMD_CPPC_DRIVER_NAME,
+};
+
+int __init amd_cppc_register_driver(void)
+{
+    if ( !cpu_has_cppc )
+    {
+        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
+        return -ENODEV;
+    }
+
+    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+}
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 61e98b67bd..c40b610c86 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -148,6 +148,11 @@ static int __init cf_check cpufreq_driver_init(void)
                 case CPUFREQ_none:
                     ret = 0;
                     break;
+
+                default:
+                    printk(XENLOG_WARNING
+                           "Unsupported cpufreq driver for vendor Intel\n");
+                    break;
                 }
 
                 if ( ret != -ENODEV )
@@ -157,7 +162,63 @@ static int __init cf_check cpufreq_driver_init(void)
 
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
+            unsigned int i;
+
+            if ( !IS_ENABLED(CONFIG_AMD) )
+            {
+                ret = -ENODEV;
+                break;
+            }
+            ret = -ENOENT;
+
+            for ( i = 0; i < cpufreq_xen_cnt; i++ )
+            {
+                switch ( cpufreq_xen_opts[i] )
+                {
+                case CPUFREQ_xen:
+                    ret = powernow_register_driver();
+                    break;
+
+                case CPUFREQ_amd_cppc:
+                    ret = amd_cppc_register_driver();
+                    break;
+
+                case CPUFREQ_none:
+                    ret = 0;
+                    break;
+
+                default:
+                    printk(XENLOG_WARNING
+                           "Unsupported cpufreq driver for vendor AMD or Hygon\n");
+                    break;
+                }
+
+                if ( ret != -ENODEV )
+                    break;
+            }
+
+            /*
+             * After cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
+             * and XEN_PROCESSOR_PM_PX shall become exclusive flags.
+             */
+            if ( !ret && i < cpufreq_xen_cnt )
+            {
+                switch ( cpufreq_xen_opts[i] )
+                {
+                case CPUFREQ_amd_cppc:
+                    xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+                    break;
+
+                case CPUFREQ_xen:
+                    xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
+                    break;
+
+                case CPUFREQ_none:
+                default:
+                    break;
+                }
+            }
+
             break;
         }
     }
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 49717e9ca9..231912ed27 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -539,9 +539,12 @@ ret_t do_platform_op(
         case XEN_PM_PX:
             if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
             {
-                ret = -ENOSYS;
+                ret = 0;
                 break;
             }
+            /* Xen doesn't support mixed mode */
+            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC));
+
             ret = set_px_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.perf);
             break;
  
@@ -573,6 +576,14 @@ ret_t do_platform_op(
         }
 
         case XEN_PM_CPPC:
+            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
+            {
+                ret = 0;
+                break;
+            }
+            /* Xen doesn't support mixed mode */
+            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_PX));
+
             ret = set_cppc_pminfo(op->u.set_pminfo.id,
                                   &op->u.set_pminfo.u.cppc_data);
             break;
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index f7351f219d..330bc3a1c2 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -464,7 +464,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     switch ( op->cmd & PM_PARA_CATEGORY_MASK )
     {
     case CPUFREQ_PARA:
-        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+        if ( !(xen_processor_pmbits & (XEN_PROCESSOR_PM_PX |
+                                       XEN_PROCESSOR_PM_CPPC)) )
             return -ENODEV;
         if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index d1b51c8dd0..fe55720afd 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -65,14 +65,15 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 /* set xen as default cpufreq */
 enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
 
-enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
+enum cpufreq_xen_opt __initdata cpufreq_xen_opts[3] = { CPUFREQ_xen,
                                                         CPUFREQ_none };
 unsigned int __initdata cpufreq_xen_cnt = 1;
 
-static const char __initconst cpufreq_opts_str[][5] = {
+static const char __initconst cpufreq_opts_str[][9] = {
     [CPUFREQ_none] = "none",
     [CPUFREQ_xen] = "xen",
     [CPUFREQ_hwp] = "hwp",
+    [CPUFREQ_amd_cppc] = "amd-cppc",
 };
 
 static int __init cpufreq_cmdline_parse(const char *s, const char *e);
@@ -94,6 +95,8 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
 {
     int ret = 0;
 
+    /* Do not occupy bits reserved for public xen-pm */
+    BUILD_BUG_ON(MASK_INSR(XEN_PROCESSOR_PM_CPPC, SIF_PM_MASK));
     if ( cpufreq_opts_contain(option) )
     {
         printk(XENLOG_WARNING "Duplicate cpufreq driver option: %s\n",
@@ -105,6 +108,10 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
     cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
     switch ( option )
     {
+    case CPUFREQ_amd_cppc:
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
+        break;
+
     case CPUFREQ_hwp:
     case CPUFREQ_xen:
         xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
@@ -172,6 +179,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
             if ( arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
+        else if ( IS_ENABLED(CONFIG_AMD) && choice < 0 &&
+                  !cmdline_strcmp(str, "amd-cppc") )
+        {
+            ret = handle_cpufreq_cmdline(CPUFREQ_amd_cppc);
+            if ( arg[0] && arg[1] )
+                ret = amd_cppc_cmdline_parse(arg + 1, end);
+        }
         else
             ret = -EINVAL;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index a3c84143af..83050c58b2 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -28,8 +28,9 @@ enum cpufreq_xen_opt {
     CPUFREQ_none,
     CPUFREQ_xen,
     CPUFREQ_hwp,
+    CPUFREQ_amd_cppc,
 };
-extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
+extern enum cpufreq_xen_opt cpufreq_xen_opts[3];
 extern unsigned int cpufreq_xen_cnt;
 struct cpufreq_governor;
 
@@ -277,4 +278,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
 int acpi_cpufreq_register(void);
 
+int amd_cppc_cmdline_parse(const char *s, const char *e);
+int amd_cppc_register_driver(void);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index f1f4f3138d..9b6466e705 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -5,6 +5,9 @@
 #include <public/sysctl.h>
 #include <xen/acpi.h>
 
+/* Internal ability bits */
+#define XEN_PROCESSOR_PM_CPPC   0x100
+
 #define XEN_CPPC_INIT 0x40000000U
 #define XEN_PX_INIT   0x80000000U
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b0fec271d3..42997252ef 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -423,6 +423,7 @@ struct xen_set_cppc_para {
     uint32_t activity_window;
 };
 
+#define XEN_AMD_CPPC_DRIVER_NAME "amd-cppc"
 #define XEN_HWP_DRIVER_NAME "hwp"
 
 /*
-- 
2.34.1


