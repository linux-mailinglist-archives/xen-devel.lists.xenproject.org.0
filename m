Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAB4A2A336
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882558.1292697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKK-0001cH-IM; Thu, 06 Feb 2025 08:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882558.1292697; Thu, 06 Feb 2025 08:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKK-0001Vp-BN; Thu, 06 Feb 2025 08:33:36 +0000
Received: by outflank-mailman (input) for mailman id 882558;
 Thu, 06 Feb 2025 08:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKI-0001Q7-NN
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:34 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2414::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c508c05-e465-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 09:33:32 +0100 (CET)
Received: from BN0PR04CA0206.namprd04.prod.outlook.com (2603:10b6:408:e9::31)
 by IA1PR12MB6260.namprd12.prod.outlook.com (2603:10b6:208:3e4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 08:33:27 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::23) by BN0PR04CA0206.outlook.office365.com
 (2603:10b6:408:e9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 08:33:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:23 -0600
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
X-Inumbo-ID: 0c508c05-e465-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NG0JGzGWn3jesq5RPGFcxAqvKwZthaU+E330dlXiwZgfeq5MWfj1s6JXZvwlfTYtzdCR6hkLSRP5/7FuvnbacwJFhai0exOnJvFlV6UhGexvAA4sbT4u7A+eTDMYzy+JlvAD/nFBjCRbUygkBE1iQZfDS3gfHoCfmf1yRPETukKko1g00S/vZAsDUsSWQsfTGK4HENTJTLifG4rQsrPe19rizEpr7nHcHTxNrwSKgNOEWKsBa+rcyJIqQPP74iO+VmsP9hQi6vYPmb8B5p8+U/OrmJYuoohJNe/uzyh6K4vrv5YiwZdd5ktAOhHh13lN8ezdo/us4QXUQx4dlTPMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIYAHS617XWb70f28NLKG8AMMu6VOMiSFmi1uNOolgQ=;
 b=N1Nw91Zp71M3piaVngfZ1bsL6EIoB46mvvoo0nzN52JLspNNmNBerXy6unznQQ56J1CYaG1ONwmjl+ipzXYjnWXp8n3NOzHdFsJ7FJ/gw7en1SUZcAD1d6YziVuMTQjeqdRqh0FoWH0zbLxdk233qggIqD4NPUCkGFkv7RY0LuuTM+CMEsuG+002UnkwX+R3PdHl9saPwikMpsAWHjC8aSpQBzTLS6W9UjcVqu5VzQ/d2TWxO4/0Tk2Hgl+Iew//PiJacF9LClXcpSlN1NIOS4aFlo0cB1LabI7BweR4zjZSLTqpiRAbljfr7s5wtDVeYJnTpQQVzCH/ITNOzG6sHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIYAHS617XWb70f28NLKG8AMMu6VOMiSFmi1uNOolgQ=;
 b=2fwg0Wt3AoMVaEltT5LhoSEjbYVnHuNHXUuasiFdJzTZnxgErTJ/BMjh5ZBwRPMBVZU0AzBgL+9zuBW7kWrs654aRDQ2oKp2HlxFHNcA3vWZVGMd/9XO5cXSUJvU4nKPAb3xQDYsCfYVrjzst8VCtXKJ3EETiJOkYlGG/0+V8wM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
Date: Thu, 6 Feb 2025 16:32:47 +0800
Message-ID: <20250206083255.1296363-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|IA1PR12MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 6217dd0e-791c-46ca-8ded-08dd4688ed4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rp1Rg+Wn/nIvNdiD5c3uv1fAQi5OJguZMTtMenpTB1gSy4rpJKkbb14UHrDz?=
 =?us-ascii?Q?m6Fr/EOeOFD+xv1gO7S00XZtqMHghRhMzeSaPuBI4woH+GvRH988gQ4jcIsz?=
 =?us-ascii?Q?VyCAVh0ozw1KdlClvGCzcsvguOXW2+5sHUPp9elIbGDdqjYmh8JmKQqUOxMt?=
 =?us-ascii?Q?GyAxQpcvTPzs4fpU7ThmuTUXByOw2HapBpXYGYOAfZZD2yV13MIyWmJ3HyBQ?=
 =?us-ascii?Q?RGLOGBCnFs2FkRxdymLajWLpZ4jlHuDOgjwO9dLas8nrq0m9sxbIYAE4OEf3?=
 =?us-ascii?Q?Q/VbnLlmN0/dmyaOpXscDSONOqrmwOei4bRtVc3nd6H3XLHMfILIowBFv2nU?=
 =?us-ascii?Q?Ua6NiguOIE87VwgVJiuMC/JHsZlQMRwHKsFhbvrxJ1G0sKI8IFyfiHzrhRwZ?=
 =?us-ascii?Q?0TYqSh7gZYI7vrOQycTB1HtN4G+vap95O2WqJVvCkehtsL3N/PzRpJIeGZmD?=
 =?us-ascii?Q?z4OYRwqzJQDyPD/YpGbRBEOdxWvPXwC846/9xOVV2G8IPRV96nv/Eaz+NGDo?=
 =?us-ascii?Q?4VFmZ2owuFAn7Ckdcq2Et0w8McyyBfKmf8ZIT+y132Egm6hidAFLJs4gtJ2e?=
 =?us-ascii?Q?deCSaSJlPNARDCRI3wY7xnx3ctUkfqQkgwLAm7IGIL7MK/pEpN0w+zOk63iC?=
 =?us-ascii?Q?0dlQs/NFRGrq1YvnTjfDCdoK63d92Jq2rJSIqV3QDYwY1Y6lkM+ETeLvXZx5?=
 =?us-ascii?Q?z6VWiwrx+yjEdJqqM8OxdfEz6z1h2Ez13ANttW6CxT9tdz9RZbIX6xT4Ud0F?=
 =?us-ascii?Q?gBV/yB8AVZ1LKwJNkqXXearBbI7f07d9wPz2xpfrbcj4wqM3mj76tcjkFdNK?=
 =?us-ascii?Q?XnAUV35VYvhMXj4Nfr7Kinc3aZpr7HlIDYcpe/WuEcFKKjhHwn6zkopjiL7p?=
 =?us-ascii?Q?7IQflEHPtYOXO9HzCEztl/CMCcJjh42MhUQm0jJ9tDYyVEWL4YfHtmLGTI48?=
 =?us-ascii?Q?F3NWqr58Cxi+OPon9xUdL6oB8gQsI9JL4GdPMwjTSxW0SFxUVcHiyaecby/c?=
 =?us-ascii?Q?s7Vnq3yWYrAcUc+l5HVb8Zk5282/OBMhwwGZt8ekNn+VM6D2BPxnmGQFjYgX?=
 =?us-ascii?Q?mKdlPYtRp8/YuTi/LC95YiJ+itRVMXJThvCZHih8o0L+1phxn+rqm7ApjWXm?=
 =?us-ascii?Q?RYdW+33EB0+GXnql+SEL428G7hr/KYu5Owex4eze7NrHePuIMa2hxAny+JSq?=
 =?us-ascii?Q?WD3D+L23JFouiHsC2Up3JDrO2UfeyB6jL9tfDGlBXuT3tW5qhIxsobUnFhll?=
 =?us-ascii?Q?JyzMRJ4NaJ5q/92CxBqJZ0jfljA8zI0yd69ateNdxpd2dTnVQPL1LV6UTKIv?=
 =?us-ascii?Q?eXcPf/VA+KRP2JD6SrPuHokzJmUV+aKDGgo3gNL5LpmUwZSwPq59y+WYhDVn?=
 =?us-ascii?Q?3XIUUnYG667jJSt83KmnSR2w/817WAZ6vCcGL899JdHJiSRLg6OknouPxs2Q?=
 =?us-ascii?Q?oSU8Pzouy3XVXuCIBFo3/IycxYnEHWJfj1mm8OK6Y18SYWlo/fhZnc+CXQ4N?=
 =?us-ascii?Q?U3PHdtfRSrJ3wnE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:26.6632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6217dd0e-791c-46ca-8ded-08dd4688ed4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6260

Users need to set "cpufreq=amd-cppc" in xen cmdline to enable
amd-cppc driver, which selects ACPI Collaborative Performance
and Power Control (CPPC) on supported AMD hardware to provide a
finer grained frequency control mechanism.
`verbose` option can also be included to support verbose print.

When users setting "cpufreq=amd-cppc", a new amd-cppc driver
shall be registered and used. Actual implmentation will be introduced
in the following commits.

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
 docs/misc/xen-command-line.pandoc    |  8 +++-
 xen/arch/x86/acpi/cpufreq/Makefile   |  1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 64 ++++++++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c  | 32 +++++++++++++-
 xen/arch/x86/platform_hypercall.c    |  6 +++
 xen/drivers/cpufreq/cpufreq.c        | 13 +++++-
 xen/include/acpi/cpufreq/cpufreq.h   |  4 ++
 xen/include/public/platform.h        |  1 +
 xen/include/public/sysctl.h          |  1 +
 9 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9bbd00baef..78cfb8a02e 100644
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
@@ -534,6 +534,10 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
   processor to autonomously force physical package components into idle state.
   The default is enabled, but the option only applies when `hwp` is enabled.
+* `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
+  on supported AMD hardware to provide finer grained frequency control mechanism.
+  The default is disabled. If `amd-cppc` is selected, but hardware support
+  is not available, Xen will fallback to cpufreq=xen.
 
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
index 0000000000..2dca4a00f3
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -0,0 +1,64 @@
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
+        s = end ? ++end : end;
+    } while ( s && s < e );
+
+    return 0;
+}
+
+static const struct cpufreq_driver __initconst_cf_clobber amd_cppc_cpufreq_driver =
+{
+    .name   = XEN_AMD_CPPC_DRIVER_NAME,
+};
+
+int __init amd_cppc_register_driver(void)
+{
+    if ( !cpu_has_cppc )
+        return -ENODEV;
+
+    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+}
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 61e98b67bd..4bcaca1a01 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -148,6 +148,9 @@ static int __init cf_check cpufreq_driver_init(void)
                 case CPUFREQ_none:
                     ret = 0;
                     break;
+                default:
+                    printk(XENLOG_WARNING "Unsupported cpufreq driver for vendor Intel\n");
+                    break;
                 }
 
                 if ( ret != -ENODEV )
@@ -157,7 +160,34 @@ static int __init cf_check cpufreq_driver_init(void)
 
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
+                    printk(XENLOG_WARNING "Unsupported cpufreq driver for vendor AMD\n");
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
index 735c71b0e7..3d10827930 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -573,6 +573,12 @@ ret_t do_platform_op(
         }
 
         case XEN_PM_CPPC:
+            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
+            {
+                ret = -EOPNOTSUPP;
+                break;
+            }
+
             ret = set_cppc_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.cppc_data);
             break;
 
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index f5e8bfa09e..c0c6dc4c42 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -85,7 +85,7 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 
     if ( choice < 0 && !cmdline_strcmp(str, "dom0-kernel") )
     {
-        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+        xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC);
         cpufreq_controller = FREQCTL_dom0_kernel;
         opt_dom0_vcpus_pin = 1;
         return 0;
@@ -93,7 +93,7 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 
     if ( choice == 0 || !cmdline_strcmp(str, "none") )
     {
-        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+        xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC);
         cpufreq_controller = FREQCTL_none;
         return 0;
     }
@@ -131,6 +131,15 @@ static int __init cf_check setup_cpufreq_option(const char *str)
             if ( arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
+        else if ( choice < 0 && !cmdline_strcmp(str, "amd-cppc") )
+        {
+            xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
+            cpufreq_controller = FREQCTL_xen;
+            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_amd_cppc;
+            ret = 0;
+            if ( arg[0] && arg[1] )
+                ret = amd_cppc_cmdline_parse(arg + 1, end);
+        }
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
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index b8daa8fc42..11d30c894e 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -357,6 +357,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PROCESSOR_PM_CX	1
 #define XEN_PROCESSOR_PM_PX	2
 #define XEN_PROCESSOR_PM_TX	4
+#define XEN_PROCESSOR_PM_CPPC	8
 
 /* cmd type */
 #define XEN_PM_CX   0
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


