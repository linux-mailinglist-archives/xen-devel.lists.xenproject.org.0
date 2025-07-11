Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD7B011DB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040258.1411739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4we-0002EY-PE; Fri, 11 Jul 2025 04:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040258.1411739; Fri, 11 Jul 2025 04:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4we-0002CE-LI; Fri, 11 Jul 2025 04:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1040258;
 Fri, 11 Jul 2025 04:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nq-0002LK-Cc
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:52:02 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2409::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60fd5b87-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:51:51 +0200 (CEST)
Received: from MW4PR04CA0166.namprd04.prod.outlook.com (2603:10b6:303:85::21)
 by DS0PR12MB9323.namprd12.prod.outlook.com (2603:10b6:8:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 03:51:49 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::75) by MW4PR04CA0166.outlook.office365.com
 (2603:10b6:303:85::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 03:51:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:48 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:45 -0500
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
X-Inumbo-ID: 60fd5b87-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPwO6JI4hjiKFmngcOaTQUs2OWKLDlPyXHbK9Vl+85bTUSrM0yFO35jJvjSbwpV9B38x0IkI7//2Q1MwBvmEgnT72xLBUOxEqrBCuG+CLvBJbUsHdwztm9wGyMJTbh9hliSiSPeHUme1uqrD1HPiWNz6DGX133FcO1zCaMRxavcEi0nYdX+K8tEV9kaebShBZNRYIWQ0u3CObRd/luV58jCZhLYsFMNTl5xQGDLQ9hizjWsRksooR+27nKszCgFXLzHxBZ5NqDbgNjU6qumIvJAUjFJNGrUIfS+oHR0ox3W9hHoAMyo1Si8tPkCpCF0IpM+BXsA5B6emYPrNU61Ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsQzZ/0P/4iwwbciN7UcuCbk6RkWB08t69yDGE20uUg=;
 b=p4WNzRaW6kaIrC0DCYRqtWlit9Rvf4eT9tr8pk7/l9J8w8ot29MgIFz3dx+0WXg8UkUSjT0CxPC9GPv4WkYfsV2VIuw/22Pz/U5Z0RcJrvh+aLjnxozHZthInKcCxt2sG8H/a8s9c2jzqwEhcfSakG70gSH6Qc0kbp3Puk3HL9eHreX7O9gutaAolfaDxWAxVlg3kqKzjY115yd6w9raCneIp6S0UlXq37RqSEuQ1dLMBNfVYYcPgusMmZPQ9fnbkTUiiNCxYk6zUr+Bml8kEy/+P9cj4h0dAFw5os4ayOrRpwppfdK0454TULjYdMcgJM9T6foXsXfSJctquebL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsQzZ/0P/4iwwbciN7UcuCbk6RkWB08t69yDGE20uUg=;
 b=sePV2amensbUdQoIdwRDXqn/yDMQLOACD+usJ4Q6B4BxaLoxKNgdnXO4TZaCPxIbon2TuE9Bvw6y92Yphdmk3tMRXwu5Z5Ks68CFlfDVBUQs6s8pkFSee9KvrGx87AwXkTmqnu0MxXzdQnfaxsC2Kx3jvs2EoMglFm6qbYfOG74=
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
Subject: [PATCH v6 11/19] xen/x86: introduce "cpufreq=amd-cppc" xen cmdline and amd-cppc driver
Date: Fri, 11 Jul 2025 11:50:58 +0800
Message-ID: <20250711035106.2540522-12-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|DS0PR12MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: a59e115f-cb52-486e-f049-08ddc02e435e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tZzmnV3Lx8ZCcKVufn05a000PJKSzBjnYPQfqZqpcBykrZjEPuHEWjtzjF2w?=
 =?us-ascii?Q?OJ9kH+ixurUQQhAp7/gfJzsB7Iai9ZW0uuG10xkEuY7c21R4fT85pUlfHZKz?=
 =?us-ascii?Q?lkEny3BpkmiFdrJYfl1bq9lswaQgd35e02WhuTYQvXfdy5xUWqkzUwFTDUfP?=
 =?us-ascii?Q?Jvr7MskRTkYylrjhbHXvZUY89ndgRVhyzfBEpWw1J8GI7WV1Wi2Ogxs+72cd?=
 =?us-ascii?Q?AZqYn3pUwnL/HK2D2ONQLc+2Ho915FzkmozKXPKxt49yTkrWW7wPXtuf71Fc?=
 =?us-ascii?Q?EFmTss5ExvLdChFL+ux5qAhlRbci8uk3a05g25ypg8zkIHuhf1kYWVsiEnXm?=
 =?us-ascii?Q?u1gUx93u8rIzPMF5qNsLmpKbDf5uQAW1JtHYnFdwWmEn0bKrApH+/oyeUbZx?=
 =?us-ascii?Q?XDvEbIQXT6Sn9hss+j6ZFeQgMSlir1kr/xxTMu1fe1J4sYpSH52bpEJelVML?=
 =?us-ascii?Q?ZSHvSnAz4xMSnY9irbdf4XZvA5pSAKV3kRjp3qpRWO71Oehogk1SS+so1Dry?=
 =?us-ascii?Q?lLM09/LvmkLpPhbtPR+csrLYNO1kr7gq77mIGunmLu3NHvPDCr4a5MtlScFP?=
 =?us-ascii?Q?ygYXRfbs2LK3rQuPLxsJqlsSAyc0W+JmjGN3U4ppOXhUhm/rUbTU2prIHgsw?=
 =?us-ascii?Q?pP6PSnMysoICDQeFfMcT8hSXo9I9fuYLrhi7lZiubko5FBvf8GFDMhsqk8hh?=
 =?us-ascii?Q?7WMqJaMrSzC6ZxTG1DK15DFXNv4NmY/g8/TH5KGP9shktqfjD1udw6bGRJrB?=
 =?us-ascii?Q?DzHe2bvE6BTViyQFtfNVOK/ohniRHwZ57+Z73oFcAfxO9Hh1aPzAQ421vfZV?=
 =?us-ascii?Q?c0LL63wjb1XgW30oQ7LJ+WNGS7opu18tTsY3iwGoVTNTohl64xZTzowCinq0?=
 =?us-ascii?Q?g1WgfTSav9cU/Mes5YjJL0xi5ARsBHSY6cA4ZL78DRgCaCEAQP9C86YYAAW4?=
 =?us-ascii?Q?bBl6/EQjfnxI9JzuzHdfXryoUrJV3z7TsaioqZF3VC2TOLiRnB3LBdAaPJuD?=
 =?us-ascii?Q?hhiowpNsqMZ82D0aocItdtENX7fdQQUh8jI16mv70o6Y/hIeNnh3W9+QJnCS?=
 =?us-ascii?Q?yfSQfIx1yaWmzNh+7r51kZ7bAPPyiCuvzIA0dZwwidbEFqwbvG31XIxd3kna?=
 =?us-ascii?Q?B1MqthPmyjfDdjpS0v3a+mAgWiRt8ssbShQrP46zC0SaqtP7pjtlaPYrqbjs?=
 =?us-ascii?Q?Xi+Xyb5+LMNhfEWS0SRsVEzMQFQVQO5/mXj7BkS24xDL1FETCJzDo5tzxXV1?=
 =?us-ascii?Q?1Bly+r8iAE6PUlaj3Jcodvl09EA7gNRQDBwEpJBqHmOCc+e4J5jAR2I+3ETm?=
 =?us-ascii?Q?FKU6bEhYqxF10WIWuMACordzIR2oU2wo7QVcBhjDidsIBVKdGD3G+nbUtXYn?=
 =?us-ascii?Q?62tj2Xgvj0014jIILVs40EUsjRsX7w8LUEkJ8lUz+XXg3J484BjhcxZb9pTG?=
 =?us-ascii?Q?k2ASqLllpiPbrFprvbNjmfyz5ewIC+6uoVNMBlZa+DpRnmtIRbleTwkS6G2h?=
 =?us-ascii?Q?+lWdIIS06uBuJHQsxuFssnFeOCea8yLptXm8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:48.6456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a59e115f-cb52-486e-f049-08ddc02e435e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9323

Users need to set "cpufreq=amd-cppc" in xen cmdline to enable amd-cppc driver,
which selects ACPI Collaborative Performance and Power Control (CPPC) on
supported AMD hardware to provide a finer grained frequency control mechanism.
`verbose` option can also be included to support verbose print.

When users setting "cpufreq=amd-cppc", a new amd-cppc driver
shall be registered and used. All hooks for amd-cppc driver are transiently
missing, and we temporarily make registration fail with -EOPNOTSUPP here. It
will be fixed along with the implementation.

New xen-pm internal flag XEN_PROCESSOR_PM_CPPC is introduced, to stand for
cpufreq driver in CPPC mode. We define XEN_PROCESSOR_PM_CPPC 0x100, as it is
the next value to use after 8-bits wide public xen-pm options. We also add
sanity check on compile time. All XEN_PROCESSOR_PM_xxx checking shall be
updated to consider "XEN_PROCESSOR_PM_CPPC" too.

XEN_PROCESSOR_PM_CPPC and XEN_PROCESSOR_PM_PX are firstly set when Xen parsed
relative driver signature from xen cmdline, and will become exclusive after
cpufreq driver registration. It is because that platform could not support
both or mixed mode (CPPC & legacy Px) operations, and only one cpufreq driver
could be registerd in Xen at one time, such as on AMD, it is either amd-cppc
or legacy P-states driver.
Xen rely on XEN_PROCESSOR_PM_CPPC flag to tell current cpufreq driver is in
CPPC mode, and accepts relative hypercall. It will neglect Px request and
yields success.

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
v5 -> v6:
- do not register the driver when all hooks are NULL
- refactor the subject and commit message
- move pruning of xen_processor_pmbits into generic space
- add comment and build-time check for XEN_PROCESSOR_PM_CPPC
---
 docs/misc/xen-command-line.pandoc         |  7 ++-
 xen/arch/x86/acpi/cpufreq/Makefile        |  1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 59 +++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 72 ++++++++++++++++++++++-
 xen/arch/x86/platform_hypercall.c         | 14 +++++
 xen/drivers/acpi/pm-op.c                  |  3 +-
 xen/drivers/acpi/pmstat.c                 |  3 +
 xen/drivers/cpufreq/cpufreq.c             | 11 ++++
 xen/include/acpi/cpufreq/cpufreq.h        |  6 +-
 xen/include/acpi/cpufreq/processor_perf.h | 10 ++++
 10 files changed, 180 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6865a61220..03761d9e3c 100644
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
index 0000000000..3377783f7e
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -0,0 +1,59 @@
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
+int __init amd_cppc_register_driver(void)
+{
+    if ( !cpu_has_cppc )
+        return -ENODEV;
+
+    return -EOPNOTSUPP;
+}
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 45f301f354..b33699ef13 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -128,12 +128,14 @@ static int __init cf_check cpufreq_driver_init(void)
 
     if ( cpufreq_controller == FREQCTL_xen )
     {
+        unsigned int i = 0;
+
         switch ( boot_cpu_data.x86_vendor )
         {
         case X86_VENDOR_INTEL:
             ret = -ENOENT;
 
-            for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
+            for ( i = 0; i < cpufreq_xen_cnt; i++ )
             {
                 switch ( cpufreq_xen_opts[i] )
                 {
@@ -148,6 +150,11 @@ static int __init cf_check cpufreq_driver_init(void)
                 case CPUFREQ_none:
                     ret = 0;
                     break;
+
+                default:
+                    printk(XENLOG_WARNING
+                           "Unsupported cpufreq driver for vendor Intel\n");
+                    break;
                 }
 
                 if ( !ret || ret == -EBUSY )
@@ -157,9 +164,70 @@ static int __init cf_check cpufreq_driver_init(void)
 
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
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
+                if ( !ret || ret == -EBUSY )
+                    break;
+            }
+
             break;
         }
+
+        /*
+         * After successful cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
+         * and XEN_PROCESSOR_PM_PX shall become exclusive flags.
+         */
+        if ( !ret )
+        {
+            ASSERT(i < cpufreq_xen_cnt);
+            switch ( cpufreq_xen_opts[i] )
+            {
+            case CPUFREQ_amd_cppc:
+                xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+                break;
+
+            case CPUFREQ_hwp:
+            case CPUFREQ_xen:
+                xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
+                break;
+
+            default:
+                break;
+            }
+        } else if ( ret != -EBUSY )
+            /*
+             * No cpufreq driver gets registered, clear both
+             * XEN_PROCESSOR_PM_CPPC and XEN_PROCESSOR_PM_PX
+             */
+             xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_CPPC |
+                                       XEN_PROCESSOR_PM_PX);
     }
 
     return ret;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 42b3b8b95a..cf64b8a622 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -546,6 +546,8 @@ ret_t do_platform_op(
                 ret = 0;
                 break;
             }
+            /* Xen doesn't support mixed mode */
+            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC));
 
             ret = set_px_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.perf);
             break;
@@ -578,6 +580,18 @@ ret_t do_platform_op(
         }
 
         case XEN_PM_CPPC:
+            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
+            {
+                /*
+                 * Neglect CPPC-info when registered cpufreq driver
+                 * isn't in CPPC mode
+                 */
+                ret = 0;
+                break;
+            }
+            /* Xen doesn't support mixed mode */
+            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_PX));
+
             ret = set_cppc_pminfo(op->u.set_pminfo.id,
                                   &op->u.set_pminfo.u.cppc_data);
             break;
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 49b4067dec..d10f6db0e4 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -350,7 +350,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     switch ( op->cmd & PM_PARA_CATEGORY_MASK )
     {
     case CPUFREQ_PARA:
-        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+        if ( !(xen_processor_pmbits & (XEN_PROCESSOR_PM_PX |
+                                       XEN_PROCESSOR_PM_CPPC)) )
             return -ENODEV;
         if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index da7a1f81e1..e4e62966de 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -107,6 +107,9 @@ int cpufreq_statistic_init(unsigned int cpu)
     if ( !pmpt )
         return -EINVAL;
 
+    if ( !(pmpt->init & XEN_PX_INIT) )
+        return 0;
+
     spin_lock(cpufreq_statistic_lock);
 
     pxpt = per_cpu(cpufreq_statistic_data, cpu);
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 065fdf4106..cf1fcf1d22 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -98,6 +98,10 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
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
@@ -166,6 +170,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
             if ( !ret && arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
+        else if ( IS_ENABLED(CONFIG_AMD) && choice < 0 &&
+                  !cmdline_strcmp(str, "amd-cppc") )
+        {
+            ret = handle_cpufreq_cmdline(CPUFREQ_amd_cppc);
+            if ( !ret && arg[0] && arg[1] )
+                ret = amd_cppc_cmdline_parse(arg + 1, end);
+        }
         else
             ret = -EINVAL;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 7f26b5653a..32cf905fb8 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -26,8 +26,9 @@ enum cpufreq_xen_opt {
     CPUFREQ_none,
     CPUFREQ_xen,
     CPUFREQ_hwp,
+    CPUFREQ_amd_cppc,
 };
-#define NR_CPUFREQ_OPTS 2
+#define NR_CPUFREQ_OPTS 3
 extern enum cpufreq_xen_opt cpufreq_xen_opts[NR_CPUFREQ_OPTS];
 extern unsigned int cpufreq_xen_cnt;
 struct cpufreq_governor;
@@ -273,4 +274,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
 int acpi_cpufreq_register(void);
 
+int amd_cppc_cmdline_parse(const char *s, const char *e);
+int amd_cppc_register_driver(void);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index f80495fc96..6d8d29d440 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -5,6 +5,16 @@
 #include <public/sysctl.h>
 #include <xen/acpi.h>
 
+/*
+ * Internal xen-pm options
+ * They are extension to public xen-pm options (XEN_PROCESSOR_PM_xxx) defined
+ * in public/platform.h, guarded by SIF_PM_MASK
+ */
+#define XEN_PROCESSOR_PM_CPPC   0x100
+#if XEN_PROCESSOR_PM_CPPC & MASK_EXTR(~0, SIF_PM_MASK)
+# error "XEN_PROCESSOR_PM_CPPC shall not occupy bits reserved for public xen-pm options"
+#endif
+
 #define XEN_CPPC_INIT 0x40000000U
 #define XEN_PX_INIT   0x80000000U
 
-- 
2.34.1


