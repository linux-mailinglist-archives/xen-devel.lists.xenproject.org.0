Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBBA8792C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949119.1345793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERr-0001Qq-8k; Mon, 14 Apr 2025 07:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949119.1345793; Mon, 14 Apr 2025 07:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERr-0001OL-2U; Mon, 14 Apr 2025 07:41:43 +0000
Received: by outflank-mailman (input) for mailman id 949119;
 Mon, 14 Apr 2025 07:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERo-0000Ks-Fx
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:2417::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5943c98-1903-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 09:41:39 +0200 (CEST)
Received: from CH2PR11CA0007.namprd11.prod.outlook.com (2603:10b6:610:54::17)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 07:41:33 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::fe) by CH2PR11CA0007.outlook.office365.com
 (2603:10b6:610:54::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 07:41:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:29 -0500
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
X-Inumbo-ID: e5943c98-1903-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3oqFOa30hdP4N+4gViCbgU7EB0NT+XIXJ3lFuy+euEGYtpV26uf4hpoDKWSzj23G4vGsPRFKcSJNzbElmTSFse0csXuGQasS5WE1Cdd6o1Wqo5i2Lo+rw5inxVi/Y3AsB0CV5smANlSiW/M22yzxjnQBv2AOJ9Gp6+6ko+egQ5/gwLPu2Wak5UyvS+6aC1KfKcM0EzYVug+W95VGeUoatEmC/pBZlD4q/1sECL0jbeaCz0a0ialtRTvzf5r6M+Xj8Xzd4vqpVYY9CUB/RUUEeZNLQunD0Jh+QiaKQKDUC6RzOpJQ0Z+ZILcs2FXOOkWteCtFZNHpz2KNRET+yp5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID70glDsQJeZ20P/y6l6LiMzzswJ1fKt3wlzbX8dxCA=;
 b=J5FXIKwmUfnhEdFdpO3iIWolAh5E2+t+Q3Cui/Aj7rXLhKvveg5tZ7ng24X5j5zwch97fxLIe2vuV0GAH7kbdOEOiz89gkkXM3Y4rd4sJBQI1FJLSRaWIaOwkhVXr9Hg/5et4P76HG5R7dGAmM+inMDtETNcfM2ICLHWrkEWz79eaVqG4+yheGsfuD0zrCVWfK3mTLNpejARuc1+fdrC7bGLZhTIfvZZ9xDPCGD8/35BoYep9wUyuIzA+V0K7RsayLe2bUDPksX/BFATDCTkqNSaji7vPK/vV4tsF+UUZeMvyMS+MKCcjYrO8pmVHmlVsjl8JNrwZuscwQAmqb1Eqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID70glDsQJeZ20P/y6l6LiMzzswJ1fKt3wlzbX8dxCA=;
 b=QUHRmmR4dcBst7cfbPJTrjY83PA6Z+b3Lk/RRmmkvT5Fa+3DEBEDymNYNqPWwY8FJAG/NIeIKRn9hf8J/EExPmeNgqClBPfrHFDG3l5QjOGWBPpmrvqnYjD4o6rBKDkThKVrqtgECgFbKSPAiOqOUpx0Mrm1Jn7bZdKuTIJpKkk=
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
Subject: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
Date: Mon, 14 Apr 2025 15:40:46 +0800
Message-ID: <20250414074056.3696888-6-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: f820d576-0e31-42e1-41d6-08dd7b27c6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ey86HqJz3UHQjV+t3ncm7Kpzn1E3QJWofl/92SezZxUs0GOPld3QXGiqEwFr?=
 =?us-ascii?Q?4mOyV1vfkh4s7t3NRX+iR/n3gZ4s8olahYX8qq5LPjAXpVLWf+uTylH17cOU?=
 =?us-ascii?Q?N/UzqSdvi65Wez9zwFlKjXEC+T0ZykXqsu4Q+5S5tTPNc5Wpt3dYFPMZwh8M?=
 =?us-ascii?Q?9L74FuV7h9V5i76g2xKhs02U0Z7RHK6u8dhyHjU0p799BFvXh9bIaH3CyIsH?=
 =?us-ascii?Q?yyN082WmV95k0Es9f5LqRbdoJaLVoCcXS7BzMrypT8ONXT1Z7Bjq6TUhKDka?=
 =?us-ascii?Q?6RQO6XZv+Yq/42XuFPjeiqGr9GCDN0nD+NDUGmwZxjOuh1YCIPeA8j/5WEah?=
 =?us-ascii?Q?6t/L30p0KHbiGXIt4AiR9mWCC9k1KbamRXqZGGdh9or+nsGNlB3O+sE5sDX5?=
 =?us-ascii?Q?2VqQlSN1ufql2Uhmtx96UF/8msb6LOu80dGSM8TImtU1X92T2zINez0gRPVA?=
 =?us-ascii?Q?73uhIMScurooQJlMaKO6d9oeMa2zlV19wIspaxmpU9j/3qafSTGrPblBoGPp?=
 =?us-ascii?Q?bJtV5QUv7bzyyEf2Nv6A+vlo6tdQGVW4heODF7t9RKajrkm6/E1AtfUkUpjb?=
 =?us-ascii?Q?QXzAtwAv2EmL7RMRqCPITDRIreMBkZPOYomNVDHKIgANgShgHsYaJi3jeZrp?=
 =?us-ascii?Q?5lS3TtGujYQ1r4z5/H/4p9fjl/TsFPJFU7fNEb1VCJ/hnx+YbfgLimeANhVn?=
 =?us-ascii?Q?8w/JbEtf52dQGpeOfZpMS04YzgA9Ygfkl5r1njP5STntvvSYapJ7DptjOZtI?=
 =?us-ascii?Q?TOkEFvy63+y5ow+52AbdY2QavyEozVpOJliq8YY9BnM3V8doVYXzlL8U9/eb?=
 =?us-ascii?Q?cxJDWRarKZBU4wtr1pN/gtvotIkRawUS43tnN6Xf17h8E3dfRztO9VVihA/0?=
 =?us-ascii?Q?WTH45HO/vH+lCBv+OccaHjZ+T7noHVPQee5oQ87EdkIGDl3+tEP5F/TcS/f/?=
 =?us-ascii?Q?wYQ0G/6mc3rFoxMrbZ23TTzwV0/o/mSvkbKmkCsF0EtvHjyNW6s/DMBO1TN7?=
 =?us-ascii?Q?mdFUFW3ssDpahl0FsdvHNdF2tiIoHrbOpw6dhThpVSFBemj0/HJ1ZNToyRLz?=
 =?us-ascii?Q?6+GFkJXf9VV6CPZz0hjL7LyqN9i6+2js9VJH8mwaqONFexnxOKzDiAvpxqhI?=
 =?us-ascii?Q?+3VWll7P+ZFRqObclvurJf8aPY1bWAQqbPRhA/4gK0pbU+3Y2RVlfFUS9VZA?=
 =?us-ascii?Q?doumMao8fgeq95US3kl8JBBiFPcBa+YhG0L/iTirc/dBbcz2MQgLyO62sojP?=
 =?us-ascii?Q?eTOpCxeQJ4/HOS29Hfr4+6LKQJc2E3d7WfghExdns99xVfthg5Abqa/E776d?=
 =?us-ascii?Q?C/Adcm7Ut+D/80XnAZpzntHN5dpFf3aIsayxhV/eTnN9sEmx3dVXNqV8+tK1?=
 =?us-ascii?Q?Gwyj4HOgKvp7ORgXZOzlugNInSwKj27t90kQk4YxR7vj9HHIExdaQZwj4kjU?=
 =?us-ascii?Q?+Z1C2wJ4HH3zYY9q+PhZAOyMOgrn3JQ37Afl/WGbxAz5pJzCcV2GmC7gRMKV?=
 =?us-ascii?Q?mE1qj9XVQHnRQ4mllzs6n78KSzdj0Y6CiboX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:32.2619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f820d576-0e31-42e1-41d6-08dd7b27c6a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028

Users need to set "cpufreq=amd-cppc" in xen cmdline to enable
amd-cppc driver, which selects ACPI Collaborative Performance
and Power Control (CPPC) on supported AMD hardware to provide a
finer grained frequency control mechanism.
`verbose` option can also be included to support verbose print.

When users setting "cpufreq=amd-cppc", a new amd-cppc driver
shall be registered and used. All hooks for amd-cppc driver are missing
until commit "xen/x86: introduce a new amd cppc driver for cpufreq scaling"

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
 docs/misc/xen-command-line.pandoc         |  7 +-
 xen/arch/x86/acpi/cpufreq/Makefile        |  1 +
 xen/arch/x86/acpi/cpufreq/acpi.c          | 14 +++-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 81 +++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 34 +++++++++-
 xen/arch/x86/platform_hypercall.c         | 11 +++
 xen/drivers/cpufreq/cpufreq.c             | 15 ++++-
 xen/include/acpi/cpufreq/cpufreq.h        |  6 +-
 xen/include/acpi/cpufreq/processor_perf.h |  3 +
 xen/include/public/sysctl.h               |  1 +
 10 files changed, 166 insertions(+), 7 deletions(-)
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
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index 0c25376406..e0cea9425f 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -13,6 +13,7 @@
 
 #include <xen/errno.h>
 #include <xen/delay.h>
+#include <xen/domain.h>
 #include <xen/param.h>
 #include <xen/types.h>
 
@@ -514,5 +515,16 @@ acpi_cpufreq_driver = {
 
 int __init acpi_cpufreq_register(void)
 {
-    return cpufreq_register_driver(&acpi_cpufreq_driver);
+    int ret;
+
+    ret = cpufreq_register_driver(&acpi_cpufreq_driver);
+    if ( ret )
+        return ret;
+    /*
+     * After cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
+     * and XEN_PROCESSOR_PM_PX shall become exclusive flags
+     */
+    xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
+
+    return ret;
 }
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
new file mode 100644
index 0000000000..8a081e5523
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -0,0 +1,81 @@
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
+    /*
+     * After cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
+     * and XEN_PROCESSOR_PM_PX shall become exclusive flags
+     */
+    xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+
+    return ret;
+}
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 61e98b67bd..eac1c125a3 100644
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
+                           "Unsupported cpufreq driver for vendor AMD or Hygon\n");
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
index 49717e9ca9..82663011ad 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -542,6 +542,9 @@ ret_t do_platform_op(
                 ret = -ENOSYS;
                 break;
             }
+            /* Xen doesn't support mixed mode */
+            ASSERT((xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) == 0);
+
             ret = set_px_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.perf);
             break;
  
@@ -573,6 +576,14 @@ ret_t do_platform_op(
         }
 
         case XEN_PM_CPPC:
+            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
+            {
+                ret = -EOPNOTSUPP;
+                break;
+            }
+            /* Xen doesn't support mixed mode */
+            ASSERT((xen_processor_pmbits & XEN_PROCESSOR_PM_PX) == 0);
+
             ret = set_cppc_pminfo(op->u.set_pminfo.id,
                                   &op->u.set_pminfo.u.cppc_data);
             break;
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 79c6444116..818668c99c 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -65,7 +65,7 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 /* set xen as default cpufreq */
 enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
 
-enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
+enum cpufreq_xen_opt __initdata cpufreq_xen_opts[3] = { CPUFREQ_xen,
                                                         CPUFREQ_none };
 unsigned int __initdata cpufreq_xen_cnt = 1;
 
@@ -90,7 +90,8 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
 
     if ( cpufreq_opts_contain(option) )
     {
-        const char *cpufreq_opts_str[] = { "CPUFREQ_xen", "CPUFREQ_hwp" };
+        const char *cpufreq_opts_str[] = { "CPUFREQ_xen", "CPUFREQ_hwp",
+                                           "CPUFREQ_amd_cppc" };
 
         printk(XENLOG_WARNING
                "Duplicate cpufreq driver option: %s",
@@ -102,6 +103,9 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
     cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
     switch ( option )
     {
+    case CPUFREQ_amd_cppc:
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
+        break;
     case CPUFREQ_hwp:
     case CPUFREQ_xen:
         xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
@@ -168,6 +172,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
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
index f1f4f3138d..1a6591d612 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -5,6 +5,9 @@
 #include <public/sysctl.h>
 #include <xen/acpi.h>
 
+/* ability bits */
+#define XEN_PROCESSOR_PM_CPPC   8
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


