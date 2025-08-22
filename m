Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1EB315D7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089860.1447378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPOH-0001QD-3M; Fri, 22 Aug 2025 10:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089860.1447378; Fri, 22 Aug 2025 10:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPOG-0001NU-TT; Fri, 22 Aug 2025 10:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1089860;
 Fri, 22 Aug 2025 10:52:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPOF-0008I9-Jo
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:52:59 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2406::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a04f125-7f46-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 12:52:58 +0200 (CEST)
Received: from BN0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:408:141::33)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 10:52:53 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::57) by BN0PR07CA0024.outlook.office365.com
 (2603:10b6:408:141::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Fri,
 22 Aug 2025 10:52:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:51 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:48 -0500
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
X-Inumbo-ID: 2a04f125-7f46-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tik8i0nUC+sMUnIYEo6chHcI7PMrVqF5T2nf/2amxvWFhHg+VwTROa3xp3HUmQK6dtTLiUXL7Qi7V+GyZJOSENq7engynaqTnjXAWY/WdXQuY4N+jqonexSyHYrOc4tHz7l285UufN1CxWfXE7l8QUgQGLd4kxwQkKFYa/glPRhaQDKSoOV46JbiDXyBd6PW6x/MYNzwLnscZTAWi8HykO9bIPLnUsYmObPXxG8Ozz0AhO/M6ANHNbbXJFvVDwWKJQt6YcBMv+U3hsC+aL0TT52b7mhdgYr3p2ql7rg5PenFVkDPle6Llp3OA0lbkdoXtT2J6Xx5FYVbmaPgGdQRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=190o5OmGcQYaLrmukojhXZJDrFTxn37XH043ILxzkr0=;
 b=t0HaPH+WJgCazlhghoBmIWluguKzMH9Tbg34cKwjNsJz0Svs4vJELAih4p0jcJ+zHvRhgd4kSQ9+1sikLi2G5YO+z/IB2CR+iplpTD3H58fpAsNSfAoggKSAwqCjM0DfX7F4hea1TJI6KaOwWvJQa0LeQay0viqEsCWU0NLgPUy4wdAISiZYEK1PXlS05wZPm6Pvv5zECUfXgD43w0oyFpQ0sZoi3BabmTImHkCchvxZ+t+/vbULeWevexb6YTQ5A6cOuhoiwdAJbO2MAsVa8ReZQsuwMV5/xED49DyZ2JUpumTiZXC3E3kpQKwq2/9dF90P8CVrcoG3tGS+/J9NWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=190o5OmGcQYaLrmukojhXZJDrFTxn37XH043ILxzkr0=;
 b=IiSaNVl1+fawzK/91+3M4O9Lt05T03QkCfl5REfZoOc0XXUDzZRR9+i1c/wd2Im+6iHoIlKuLC0K98s/11BCOQxdi8EUjzRIZa1tjPALRYS5HK7DRDGo0bPZleTg/2UYxQzfqE6ySeukRh1c4Gx4i0BCj8Gws9KDwOuz4F6vxuc=
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
Subject: [PATCH v7 07/13] xen/cpufreq: introduce "cpufreq=amd-cppc" xen cmdline and amd-cppc driver
Date: Fri, 22 Aug 2025 18:52:12 +0800
Message-ID: <20250822105218.3601273-8-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: ff19e44d-2bcf-4f33-e1e6-08dde16a0a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0dDWzfAcciWUWNZn/8T0p/3OMftXL1Qg7k4xfQoO99A7g+F7Mz0wdknEDBjv?=
 =?us-ascii?Q?lKJ1OMNHk/TM1I+4WSAK/uEgGqHQK7YjW8qq0De3xra62JehWcO1pFe7LcFQ?=
 =?us-ascii?Q?IH7N5s8wiJuSy1cTSnvEthkyBLFsKeO9AzKccjxYjeeOVLBL3NMwD74FJuQ7?=
 =?us-ascii?Q?gA6DygOXYSeIxfN5T8pd1jh85qBdOXPeZyVWdiyZnVBKLo/OIU6qfYd6EiN0?=
 =?us-ascii?Q?sxjugRqFjJlNXx95xWBQGlJfLQauVgpQfud6krkA16lEJXFcEObGx0oUpJ76?=
 =?us-ascii?Q?9HZYCCmbVVgpaqXa4JmX32sobmEI5ypk6LiSpf3j2jHXW22zJp9F6jzh36f5?=
 =?us-ascii?Q?qjGxHNyitNbPGiqTVOitOZnr9xn7qP5WWFVCo/TO243kGOwGb4q2dHs20DKm?=
 =?us-ascii?Q?Jd+gyePDZcMzFC2VF22aMwEDKNSKNPCGlLhH1dWrjL+2jexUw5S27tkL+uPV?=
 =?us-ascii?Q?/3IippnKrFO8xTEEZdw7/8Nx/sl5BdlEcfyEhxSvuzANRuN9tWsloX+iNe/X?=
 =?us-ascii?Q?zhNqenIB0ZjIdI24Ws6Zp4YJP/RRD6O8qEhpwVI8u8VL8D1HIGCcQ0A9ji9Q?=
 =?us-ascii?Q?RD70wd/ApWaudd+DXN0IC8zXyk9rTdz6m4SkhmEcy0SOFBtppeIqXplm0f+1?=
 =?us-ascii?Q?wwajUIcNXPSRF36YXvfm/5FuOLPiP1smE7c9EBxL32bumoNWeRRloNCSjFUC?=
 =?us-ascii?Q?hjh2mgcHL+Dg0mM2PTVJrXegqfSYnEte8KS1SwfkpN05hAu1cI7kIj/J+b04?=
 =?us-ascii?Q?zpVetcrb9IFXjkXPszLD57bGFVrLiPd1dXAV70strjEakn/OUo+nTIs+pl6n?=
 =?us-ascii?Q?2kaNw64nA22slDV88n8GSBMNvVda0AIA8Fffc/J6dHmhGIpve3OGjtxC7NdC?=
 =?us-ascii?Q?wtp5NYHUrGiasazjkJy7HTYjs0+Ti02Nkv9pxcdCEZpVsI7Huhro0hYcRMk/?=
 =?us-ascii?Q?lmMk2L3oXts4cEs78b4w5mAo/jZ/ge3ZNl28xGNcuuw2BwN6hkP7fis2WRGC?=
 =?us-ascii?Q?78QRGMlEAiGs2+a3Wvi4gjvswKjtpZ2v3A39jFdQsNZLMvZhseeyxxPh6H2Y?=
 =?us-ascii?Q?0vcXt5oMpt4rohMm5CJwhs3RsjWiSIfZSz4BOnVcEwSCuxy6VSxM6sO9ZH1P?=
 =?us-ascii?Q?kZjLR3VRNttInEknwikZ2C2xDLETS8L/CJjnbOxpnYPVAyVR9TnSOdThDLuA?=
 =?us-ascii?Q?j3SRZZ9qaS2PzzKdccuZad7LlJzVRzOlBCoOsjsaGDcBG3iyLTejHoDkS3ln?=
 =?us-ascii?Q?iWrDpDvmpFBPYxG+EpbEnMRRNVjq3F/6avr2N5boCjxf4KSqQD7OMo+1EBVA?=
 =?us-ascii?Q?4/K5LUVDuHIlvVmWb5W3WCS+c043TbI9rAMr34dH946QSfMUIn60mJkn1tST?=
 =?us-ascii?Q?mLhNof0rCyCOLizuzeUFcuUcKoHMFqfNbRTn+e5Kn9HvfFZtS/SYYMkwtR4e?=
 =?us-ascii?Q?pj0Tqp1IdqESwXl5Yz/BxOi7piZb1Wbtzb84M6IGJ2IL6I8+iHYw7oQdzZC8?=
 =?us-ascii?Q?0CM98jAhHflwp/BW1kH1WddNMAc+JXXDP+ZA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:51.5975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff19e44d-2bcf-4f33-e1e6-08dde16a0a8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700

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
v6 -> v7:
- reomove pointless initializer for "unsigned int i"
- move closing brace into its own line
- insertion always at the bottom
- change to use #ifdef CONFIG_AMD code wrapping
---
 docs/misc/xen-command-line.pandoc         |  7 ++-
 xen/arch/x86/acpi/cpufreq/Makefile        |  1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 59 ++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 68 ++++++++++++++++++++++-
 xen/arch/x86/platform_hypercall.c         | 14 +++++
 xen/drivers/acpi/pm-op.c                  |  3 +-
 xen/drivers/cpufreq/cpufreq.c             | 13 ++++-
 xen/include/acpi/cpufreq/cpufreq.h        |  6 +-
 xen/include/acpi/cpufreq/processor_perf.h | 10 ++++
 9 files changed, 174 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a75b6c9301..3916cc81f6 100644
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
index e227376bab..6a0d9b1092 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -131,12 +131,13 @@ static int __init cf_check cpufreq_driver_init(void)
 
     if ( cpufreq_controller == FREQCTL_xen )
     {
+        unsigned int i;
         ret = -ENOENT;
 
         switch ( boot_cpu_data.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
+            for ( i = 0; i < cpufreq_xen_cnt; i++ )
             {
                 switch ( cpufreq_xen_opts[i] )
                 {
@@ -151,6 +152,11 @@ static int __init cf_check cpufreq_driver_init(void)
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
@@ -160,13 +166,71 @@ static int __init cf_check cpufreq_driver_init(void)
 
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
+#ifdef CONFIG_AMD
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
+#else
+            ret = -ENODEV;
+#endif /* CONFIG_AMD */
             break;
 
         default:
             printk(XENLOG_ERR "Cpufreq: unsupported x86 vendor\n");
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
+        }
+        else if ( ret != -EBUSY )
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
index eab64bb46e..427656c48c 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -351,7 +351,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
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
index 046a366d7f..41e0da3b77 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -65,7 +65,7 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 /* set xen as default cpufreq */
 enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
 
-enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen };
+enum cpufreq_xen_opt __initdata cpufreq_xen_opts[3] = { CPUFREQ_xen };
 unsigned int __initdata cpufreq_xen_cnt = 1;
 
 static int __init cpufreq_cmdline_parse(const char *s, const char *e);
@@ -99,6 +99,10 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
         xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
         break;
 
+    case CPUFREQ_amd_cppc:
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
+        break;
+
     default:
         ASSERT_UNREACHABLE();
         ret = -EINVAL;
@@ -162,6 +166,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
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
index fd530632b4..5d4881eea8 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -26,8 +26,9 @@ enum cpufreq_xen_opt {
     CPUFREQ_none,
     CPUFREQ_xen,
     CPUFREQ_hwp,
+    CPUFREQ_amd_cppc,
 };
-extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
+extern enum cpufreq_xen_opt cpufreq_xen_opts[3];
 extern unsigned int cpufreq_xen_cnt;
 struct cpufreq_governor;
 
@@ -272,4 +273,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
 int acpi_cpufreq_register(void);
 
+int amd_cppc_cmdline_parse(const char *s, const char *e);
+int amd_cppc_register_driver(void);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index e6576314f0..0a87bc0384 100644
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


