Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70ECA54524
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903116.1311109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mb-00058A-Mj; Thu, 06 Mar 2025 08:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903116.1311109; Thu, 06 Mar 2025 08:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mb-000535-GF; Thu, 06 Mar 2025 08:40:45 +0000
Received: by outflank-mailman (input) for mailman id 903116;
 Thu, 06 Mar 2025 08:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mY-00031D-RM
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2414::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7fa42e-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:38 +0100 (CET)
Received: from CH5P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::28)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 08:40:31 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::d7) by CH5P223CA0023.outlook.office365.com
 (2603:10b6:610:1f3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 08:40:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:27 -0600
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
X-Inumbo-ID: ad7fa42e-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGLpXoeLfb5Opiao3AgN3Qs7BsENo3HQ0OOB20z3CprmUsrNvBGgbICtSZuAMdb4jBOVJA/BvbFBJroXSI3NZpWhEq2jZQsw4fMuAH/8O71DoHISb1zaZSC5TSFohvVFBaSbcucLe4GLgmpTMFFR8XjS1uQpMApp44Vfbh4jyCwuuqPeb4wE8DrvuAk5Dac0jnCjr8MgI+DU+Sj3tWpbSAAdFqVBM6JTfu9vDQx4ND42vQ4e2gLrKP9ayQaCQ6r3e+5nbc9uWmblPQUkgYfrK6Fl/xol/mbWyN5iwt07JGja9n4y4hpbR0Ys43BOG6DnnFtLVjQOPobIAL873UNm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piO4+883ZfVtGHcOIOHWtqXT2pybhGRl+F06YWzchwE=;
 b=OlVX/hu5OqLD56rE2NMh/iY8mGJ6KmZN7wsfhm99o5cgit7rb1ACVNFJwP6J3Ns08xxW874ZXaMwB/Kmw6bikjvE2jUH9dKlXdDSLPkMARBnnq33b1t0VYMcMbLndpzDfZIVm/hb7DD6hrA5ZhSX0b6ixA0V6raViY4DbLwkcQghuh5myJaLNa0CylTunp9uNdsb1JPeczD23DnSTiI5N+DyGfuN91TJfvsh9Mbe/T2cfbd28yLENJp+PMcrnjtslg4nLmbdF0A/dgcHLFl74j8knT9CtZ/JQuEs2y3xeR8tPkaDwUK7+diaASX6UZGHwDjWtEoM5ONPTEY06TJdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piO4+883ZfVtGHcOIOHWtqXT2pybhGRl+F06YWzchwE=;
 b=KJU0ibhEXNSUm9rGFOPRfdsQwxFSoJ1nXXYlcSY/xqavyk7oDaaI7Ln+8bX2PnBgiAljzrkZ5+K5cw9ubK9LQgPraP0Dp/YA7XZyTimuetD7nxJkGg5q2x7HJWyYTolKe+Qw50kj6QvBguDMuUoNValRXEBvt8PcqbqF1lKOtCo=
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
Subject: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
Date: Thu, 6 Mar 2025 16:39:39 +0800
Message-ID: <20250306083949.1503385-6-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b709cee-11e9-4740-aa51-08dd5c8a8db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uN2uaU9k5A8Cao0oGN9kz/aW+PTD8q+TN5mTUg2chxzP3mQksqq/gN2WJlYz?=
 =?us-ascii?Q?RrhjhBnQfJOxkufK6oNV4xDdZ7M+XZ25GFil3ugr/Y0E/kXwFbQotCn4V/rd?=
 =?us-ascii?Q?ZAWXsZu4B7smCaZBsAdmqZp+yASLbmUJlllS9wfQVffn229/t4IGr94jfpFZ?=
 =?us-ascii?Q?6Ua+lEjNShq64s+NcskD9u0Id0phMMcKVrz+WlDmZ/HYE2Rn59q7gRQNXDks?=
 =?us-ascii?Q?m995x+P9VkAT4bf01gxHycr273KF0pYgnYiZttO+rXt3bhmOavqTQZxCZMI5?=
 =?us-ascii?Q?Mty3VlUuMA+JddUWsNXCpaNxIJ+d7JtGf/aRaLFXm1uP8Wxn4NNjjC5aYtqA?=
 =?us-ascii?Q?xfvViMi7IW/LQKv+wr3ASIrS5rK6EDMlGzDwL6Rtc597ya+YvoQkfLqGNqum?=
 =?us-ascii?Q?Gq+uO1CthWG8+p9/XOxOoTJ82yPjZG4OpB/8X+yWZcdZggTHjQDSFbAGyDbo?=
 =?us-ascii?Q?+oViMZ/xiTVY/y6sSpEf4CqHqqWa7xYquFaMGoCEYsAxJD4jNnWiQQvHYah+?=
 =?us-ascii?Q?YAEv/b7tWTdHEe6nbSixdTqF+HKUieJGkrcH49maBt6+ITy1zjnYwZYBkgWU?=
 =?us-ascii?Q?y/4S0VNTJq9UTW2iUVC0NfqEkmmUfNZEfTI571U6INoBcpHVbwu34tLqcam3?=
 =?us-ascii?Q?u9vcqIrw4X0oainFhhWLz9n4Y1egdR7bzg2SPy3AVqJs7MO6EnS50vMgjAbK?=
 =?us-ascii?Q?vdcUTHEC05IHDGN5dx23TxDNvxcUWM9rjQXrCTEsTCwL2Et3rpbavApzxKL1?=
 =?us-ascii?Q?zXeeTw8zXZAnJlfuJK78kzi2MKS/TR+tPbM3LBTV9/YwjIIAGjp8AW2ACNRW?=
 =?us-ascii?Q?rViVQRX7ZASxDtjtWaF7Y0KoGD/KHynTa51utUM/jgL5H0dirLUzLKZyDi3B?=
 =?us-ascii?Q?eE6H+qcBxavbtbcRViSe6DdXranDuZ0vmFon7d5K4GCk6g9ELc6TS5efPAYb?=
 =?us-ascii?Q?exHH/dZLsbmkn8yuUbO+FC5vO2YXwv98Q8O/8lkBekiPVfSGXN9p24zNerAM?=
 =?us-ascii?Q?PQghKcQfzcJEcPtJeZsa6ursh23/wvo+A27CRhrdUvrA6LZkyxyHrb2RdPqI?=
 =?us-ascii?Q?ZAqCvFOWhksoa00vHlPNqjpGWXQ2R8CVSOvweE4yKSfFaVCg1YGlOEhxE4cG?=
 =?us-ascii?Q?BRGk3DOJXKrRQ7rstcjfPczNoc8XC6ZJj/2H/DVvHvOZ1wkqMOPmZ622ZbF0?=
 =?us-ascii?Q?XAbJUgh0syg8n2S503igmUWp6DaowKVO+9SM8dnG2pqH8vjqIdLMBrudxq/m?=
 =?us-ascii?Q?rh+zLYhJHXFhQFJTrSVeVBtSbY6/Z/cpDzcWNRpBJ8VTlsfPHnS8uuGYw9LK?=
 =?us-ascii?Q?AcJnEpTCbhR19IK25xq2cyioJ7eg70lkpsemFYeGgB8dXc+eERtNYOj0HAzL?=
 =?us-ascii?Q?CAZ0S+8gfc9SeWxfgeUDqVC4AIxc8o21mR2x8kL8a5DdMtGgWoax5Zd3Y+oy?=
 =?us-ascii?Q?erv/KjWG0u2ng5EE5lVLKkJm/Z1WYMyNIVPKb8JtderW8cZc5UXZ27ueiE9/?=
 =?us-ascii?Q?UnsfKA882UxdHFA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:30.8301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b709cee-11e9-4740-aa51-08dd5c8a8db3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141

Users need to set "cpufreq=amd-cppc" in xen cmdline to enable
amd-cppc driver, which selects ACPI Collaborative Performance
and Power Control (CPPC) on supported AMD hardware to provide a
finer grained frequency control mechanism.
`verbose` option can also be included to support verbose print.

When users setting "cpufreq=amd-cppc", a new amd-cppc driver
shall be registered and used. Actual implmentation will be introduced
in the following commits.

Xen is not expected to support both or mixed mode (CPPC & legacy PSS, _PCT,
_PPC) operations, only one cpufreq driver gets registerd, either amd-cppc or
legacy P-states driver, which is reflected and asserted by the incompatible
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
 docs/misc/xen-command-line.pandoc         | 16 +++--
 xen/arch/x86/acpi/cpufreq/Makefile        |  1 +
 xen/arch/x86/acpi/cpufreq/acpi.c          | 12 +++-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 78 +++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 34 +++++++++-
 xen/arch/x86/platform_hypercall.c         | 11 +++-
 xen/drivers/cpufreq/cpufreq.c             | 17 +++++
 xen/include/acpi/cpufreq/cpufreq.h        |  4 ++
 xen/include/acpi/cpufreq/processor_perf.h |  7 +-
 xen/include/public/sysctl.h               |  1 +
 10 files changed, 169 insertions(+), 12 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a440042471..b3c3ca2377 100644
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
@@ -534,13 +534,17 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
   processor to autonomously force physical package components into idle state.
   The default is enabled, but the option only applies when `hwp` is enabled.
+* `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
+  on supported AMD hardware to provide finer grained frequency control
+  mechanism. The default is disabled.
 
 User could use `;`-separated options to support universal options which they
 would like to try on any agnostic platform, *but* under priority order, like
-`cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
-unavailable.  Note: The `verbose` suboption is handled globally.  Setting it
-for either the primary or fallback option applies to both irrespective of where
-it is specified.
+`cpufreq=hwp;amd-cppc;xen,verbose`. This first tries `hwp` on Intel, or
+`amd-cppc` on AMD, and it will fall back to `xen` if unavailable. Note:
+The `verbose` suboption is handled globally.  Setting it for either the
+primary or fallback option applies to both irrespective of where it is
+specified.
 
 Note: grub2 requires to escape or quote ';', so `"cpufreq=hwp;xen"` should be
 specified within double quotes inside grub.cfg.  Refer to the grub2
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
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index 0cf94ab2d6..49c1795b25 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -13,6 +13,7 @@
 
 #include <xen/errno.h>
 #include <xen/delay.h>
+#include <xen/domain.h>
 #include <xen/param.h>
 #include <xen/types.h>
 
@@ -514,5 +515,14 @@ acpi_cpufreq_driver = {
 
 int __init acpi_cpufreq_register(void)
 {
-    return cpufreq_register_driver(&acpi_cpufreq_driver);
+    int ret;
+
+    ret = cpufreq_register_driver(&acpi_cpufreq_driver);
+    if ( ret )
+        return ret;
+
+    if ( IS_ENABLED(CONFIG_AMD) )
+        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
+
+    return ret;
 }
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
new file mode 100644
index 0000000000..7d482140a2
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -0,0 +1,78 @@
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
+    do
+    {
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
+    int ret;
+
+    if ( !cpu_has_cppc )
+    {
+        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
+        return -ENODEV;
+    }
+
+    ret = cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+    if ( ret )
+        return ret;
+
+    /* Remove possible fallback option */
+    xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+
+    return ret;
+}
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 61e98b67bd..690a285f11 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -148,6 +148,10 @@ static int __init cf_check cpufreq_driver_init(void)
                 case CPUFREQ_none:
                     ret = 0;
                     break;
+                default:
+                    printk(XENLOG_WARNING
+                           "Unsupported cpufreq driver for vendor Intel\n");
+                    break;
                 }
 
                 if ( ret != -ENODEV )
@@ -157,7 +161,35 @@ static int __init cf_check cpufreq_driver_init(void)
 
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
+            for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
+            {
+                switch ( cpufreq_xen_opts[i] )
+                {
+                case CPUFREQ_xen:
+                    ret = powernow_register_driver();
+                    break;
+                case CPUFREQ_amd_cppc:
+                    ret = amd_cppc_register_driver();
+                    break;
+                case CPUFREQ_none:
+                    ret = 0;
+                    break;
+                default:
+                    printk(XENLOG_WARNING
+                           "Unsupported cpufreq driver for vendor AMD\n");
+                    break;
+                }
+
+                if ( ret != -ENODEV )
+                    break;
+            }
             break;
         }
     }
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 77390a0dbd..5dd1ba2949 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -542,6 +542,7 @@ ret_t do_platform_op(
                 ret = -ENOSYS;
                 break;
             }
+            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC));
             ret = set_px_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.perf);
             break;
  
@@ -572,7 +573,8 @@ ret_t do_platform_op(
             break;
         }
         case XEN_PM_PSD:
-            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+            if ( !(xen_processor_pmbits & (XEN_PROCESSOR_PM_PX |
+                                           XEN_PROCESSOR_PM_CPPC)) )
             {
                 ret = -EOPNOTSUPP;
                 break;
@@ -584,6 +586,13 @@ ret_t do_platform_op(
             break;
 
         case XEN_PM_CPPC:
+            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
+            {
+                ret = -EOPNOTSUPP;
+                break;
+            }
+            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_PX));
+
             ret = set_cppc_pminfo(op->u.set_pminfo.id,
                                   &op->u.set_pminfo.u.cppc_data);
             break;
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index cfae16c15f..792e4dc02c 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -111,6 +111,19 @@ static int __init cpufreq_cmdline_parse_hwp(const char *arg, const char *end)
     return ret;
 }
 
+static int __init cpufreq_cmdline_parse_cppc(const char *arg, const char *end)
+{
+    int ret = 0;
+
+    xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
+    cpufreq_controller = FREQCTL_xen;
+    cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_amd_cppc;
+    if ( arg[0] && arg[1] )
+        ret = amd_cppc_cmdline_parse(arg + 1, end);
+
+    return ret;
+}
+
 static int __init cf_check setup_cpufreq_option(const char *str)
 {
     const char *arg = strpbrk(str, ",:;");
@@ -159,6 +172,10 @@ static int __init cf_check setup_cpufreq_option(const char *str)
                   !cmdline_strcmp(str, "hwp") &&
                   !cpufreq_opts_contain(CPUFREQ_hwp) )
             ret = cpufreq_cmdline_parse_hwp(arg, end);
+        else if ( IS_ENABLED(CONFIG_AMD) && choice < 0 &&
+                  !cmdline_strcmp(str, "amd-cppc") &&
+                  !cpufreq_opts_contain(CPUFREQ_amd_cppc) )
+            ret = cpufreq_cmdline_parse_cppc(arg, end);
         else
             ret = -EINVAL;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 3f1b05a02e..a6fb10ea27 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -28,6 +28,7 @@ enum cpufreq_xen_opt {
     CPUFREQ_none,
     CPUFREQ_xen,
     CPUFREQ_hwp,
+    CPUFREQ_amd_cppc,
 };
 extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
 extern unsigned int cpufreq_xen_cnt;
@@ -267,4 +268,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
 int acpi_cpufreq_register(void);
 
+int amd_cppc_cmdline_parse(const char *s, const char *e);
+int amd_cppc_register_driver(void);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 33edf112a0..ee12e0192b 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -6,9 +6,10 @@
 #include <xen/acpi.h>
 
 /* ability bits */
-#define XEN_PROCESSOR_PM_CX 1
-#define XEN_PROCESSOR_PM_PX 2
-#define XEN_PROCESSOR_PM_TX 4
+#define XEN_PROCESSOR_PM_CX     1
+#define XEN_PROCESSOR_PM_PX     2
+#define XEN_PROCESSOR_PM_TX     4
+#define XEN_PROCESSOR_PM_CPPC   8
 
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


