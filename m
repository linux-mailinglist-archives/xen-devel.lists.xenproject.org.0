Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB69E1582
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847295.1262424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAa-00008r-NG; Tue, 03 Dec 2024 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847295.1262424; Tue, 03 Dec 2024 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAa-0008Ti-GA; Tue, 03 Dec 2024 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 847295;
 Tue, 03 Dec 2024 08:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIO4o-0006fu-MQ
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:16:10 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20627.outbound.protection.outlook.com
 [2a01:111:f403:2407::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da0c5593-b14e-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:16:09 +0100 (CET)
Received: from SJ0PR03CA0286.namprd03.prod.outlook.com (2603:10b6:a03:39e::21)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:16:03 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::f8) by SJ0PR03CA0286.outlook.office365.com
 (2603:10b6:a03:39e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 08:16:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Tue, 3 Dec 2024 08:16:02 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:14:14 -0600
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
X-Inumbo-ID: da0c5593-b14e-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVM3oDCloDBqgDVKKele4GT3DsRnDok19kzN1mH7IY3YPBK00FQYqlzlJZEo4hP3f7/ge/woPk/Pu3La6sy/j0murCatKbI0/w+05PHdNjAxrQ68W26AreCMK/vVk238SnZFFzjsYEhkzSqYsRENnDG7svGBWC4gY3t7U5VE7RE22RO7l45HRFEcq1rG2Rk6OGX4hjkD2vlh0GG63ypF40EXvUoZwLUxogfMRyRwU1q+HDlQ+LcCpTHeKyCO/bGRwszs3uRAteX3hrZCI50A92RawTLuS/P3gO5kEsYsqe+CS/mRhdOXWkLNS2f1kXeYz+d3H7sbAsTHwwMet7lDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PILZWKdkihFFteMi5h8IOZU28qV1Ey6rbX7QWWPukOs=;
 b=xT7dqwlV3Y+XxgrPzCiiEziuUQxRoyuaaNkSZqOGx49+YodklClHrB9ITeO+4bn9lLHoR5vfZvGDJaaBzPfJdNzkpJi2a3Rt86exiROAE3jrEM3QS09VU1at4OzZkC2AsSuKoh6yy8dkI6NPkz+UgSy+NEFKAfVrHm0kCJEMMjXkcko3q/w6xh5T9YlQbZCNlcZQVJwsCNdXxQ+24l2TKbiW01tK1Z9noWb7E+2BCtzr24qC0/cZUXczp/hUDKaejgWl3ZDcsXV+TD53u5RQxv2LyuFqYDleEUmyC3ILhmnpgaax52rjgIklMcM4liiakJn43c/1S2LQ5EKHTTFK7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PILZWKdkihFFteMi5h8IOZU28qV1Ey6rbX7QWWPukOs=;
 b=j8YPzI9Ic2UvZvcbdK5qH+2+L0JQ2QNiz88ruYnCpzG2sly8Z5mxV5Xb7krbx3NX7TxoNE2usWnSOVh5r7srSVsHc+wdVkMw9u8tH8NflMbhPp6rGSXRf1bcmiQBpN6Q4dDcSq2sTbu8b182WJCPBTdA/YMOtYz/hdFMeECHXQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v1 03/11] xen/x86: introduce "cpufreq=amd-pstate" xen cmdline
Date: Tue, 3 Dec 2024 16:11:03 +0800
Message-ID: <20241203081111.463400-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: cafe7023-9793-4283-487c-08dd1372ba6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kXM6P0AW2VHLYsNaPYRCiV4ovXKoJp9gsiDh2nPdSsL/D6G8ZO89jjOCZ3nO?=
 =?us-ascii?Q?qqXm1RldBgWP2bIP0eQbiSDsWw+dMkrg5ZFO+D9TSovAyV0sY9TN8nSV4Me+?=
 =?us-ascii?Q?hQ7zjvExUjixzjCxHRExO/cQ8N9X/YyJPKjfUbB+Qod/A8KUhgnmFgn8YjSZ?=
 =?us-ascii?Q?AdmBEoKXj1DDX/B9Q6S5HpNvb3ATnnqXNjZ73nV1pR8yTdVDbvPTymBbU5mw?=
 =?us-ascii?Q?X1tH9ma9yuKbAACRgdfdGeJV+RJM4wJsuHohEATeIFoj9Z8n9ShOGyMaCrDr?=
 =?us-ascii?Q?s6WEeeHRdRX8qUgFleb9kILS78MkZu8i/pxKQ3yv6J30V072tBcydx3BtGXH?=
 =?us-ascii?Q?VaL44w9SiY9mFzsv3zzlTT+WkwFWNPYbAAIGpPfYCW4sJTr+AfvJ9yAQGF/i?=
 =?us-ascii?Q?IT2dYt4GLnOpOFbcmCQXQtEqp+KZuYU/CsH1HL6qO8KPnGVxHRKGIn0VzqD8?=
 =?us-ascii?Q?sDbKfgkOM0OtstSLdIMaTDQjuZGJeXD/GFOjJyQE3BOq2UUbgDU1TZWz4/RR?=
 =?us-ascii?Q?6FQKlC1eowxDwBNNvU4AVXpw0+gfC/cvjvHiff2zv1fvx5WQDvxtR0Th0YQJ?=
 =?us-ascii?Q?FKLbhXNFidRx/INEoMEYTRJblqIpCGLxp+cUEEmKklFAh3tAGsLTMYLiJyz5?=
 =?us-ascii?Q?tcai8DdQYuHednQIwxb1sMJr8AL9t32qrVmpLRkah1/lZcniwyDCvDj1SQDV?=
 =?us-ascii?Q?wa8gAM8nl3QaqknOv7ul1ynY0MrgselDueWNluVdPuJ9v9gZjXYtdQpDl+e3?=
 =?us-ascii?Q?e0+YQOjXco6Oe+spBqZef05RprbLcUaYt7UpxqNx55rrk48AETPt8r3io3T6?=
 =?us-ascii?Q?RZj6S8iygQq2ZoY8tEfZ09shSMt3SRhtIcasn8xvzkPjsteBhjKAsPXIUlOW?=
 =?us-ascii?Q?SRkMjko8ng0ESs1GiIsTN06emMwgd/ri5e67kVwlp//4SxIhetOM9Qf/KCCM?=
 =?us-ascii?Q?imOpwI+NxcIc0NiblDTBFJFgdEUmKwkX1/BESS1YJrGA/HQ3xrFgHRVr2pBk?=
 =?us-ascii?Q?9Vxv57fHQY6nyI+nr4hACleWA6TANYfpm0wkITyMyOThtSKx+yDv9iLzJREJ?=
 =?us-ascii?Q?5p4Hv+WwlHi6bbgzZGfgm3GHGJSBinpCt7or3DZiIBNR5LFRvCOdrEKuIS7y?=
 =?us-ascii?Q?kdQdjMljjn6MlPiVa/1x40NlIZ1xy970PYayO9QeJT2gu7aXdwnWs+dyxzxI?=
 =?us-ascii?Q?OcqKpIaX3rT4uuixGVclyCBw7p3iIXWgpHD+rqF1xI71288QpMB3gInV+zGO?=
 =?us-ascii?Q?3flp528fTeKKnL3y87tvhuAwJpvc8YyKbVoQf4ZxddyN5JKVVHDw0S5vPfCW?=
 =?us-ascii?Q?hx/1WjPwlcQPbJTN5CYp33yNXSIRuK1VHy7Q6r+X72XP3kD4oPDxgG3Tid4L?=
 =?us-ascii?Q?8T2yd++niAte2ZE+p0zsUdiu41orOszopY6pNvhU2Gspj7dogmh+RX/xQQnD?=
 =?us-ascii?Q?gmka8pzmBGyZXEl29quUFTKiYsarfUfg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:16:02.9708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cafe7023-9793-4283-487c-08dd1372ba6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011

Users need to set "cpufreq=amd-pstate" in xen cmdline to enable
amd-pstate driver, which selects ACPI Collaborative Performance
and Power Control (CPPC) on supported AMD hardware to provide a
finer grained frequency control mechanism.
`verbose` option can also be included to support verbose print.

When users setting "cpufreq=amd-pstate", a new amd-pstate driver
shall be registered and used. Actual implmentation will be introduced
in the following commits.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 docs/misc/xen-command-line.pandoc      |  8 +++-
 xen/arch/x86/acpi/cpufreq/Makefile     |  1 +
 xen/arch/x86/acpi/cpufreq/amd-pstate.c | 66 ++++++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c    | 28 +++++++++++
 xen/arch/x86/platform_hypercall.c      |  6 +++
 xen/drivers/cpufreq/cpufreq.c          | 13 ++++-
 xen/include/acpi/cpufreq/cpufreq.h     |  4 ++
 xen/include/public/platform.h          |  1 +
 xen/include/public/sysctl.h            |  1 +
 9 files changed, 124 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-pstate.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 293dbc1a95..30f855fa18 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -499,7 +499,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]]`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-pstate[:[verbose]]`
 
 > Default: `xen`
 
@@ -510,7 +510,7 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
   respectively.
 * `verbose` option can be included as a string or also as `verbose=<integer>`
-  for `xen`.  It is a boolean for `hwp`.
+  for `xen`.  It is a boolean for `hwp` and `amd-pstate`.
 * `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
   hardware.  HWP is a Skylake+ feature which provides better CPU power
   management.  The default is disabled.  If `hwp` is selected, but hardware
@@ -518,6 +518,10 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
   processor to autonomously force physical package components into idle state.
   The default is enabled, but the option only applies when `hwp` is enabled.
+* `amd-pstate` selects ACPI Collaborative Performance and Power Control (CPPC)
+  on supported AMD hardware to provide a finer grained frequency control mechanism.
+  The default is disabled. If `amd-pstate` is selected, but hardware support
+  is not available, Xen will fallback to cpufreq=xen.
 
 There is also support for `;`-separated fallback options:
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
diff --git a/xen/arch/x86/acpi/cpufreq/Makefile b/xen/arch/x86/acpi/cpufreq/Makefile
index e7dbe434a8..1710fc776c 100644
--- a/xen/arch/x86/acpi/cpufreq/Makefile
+++ b/xen/arch/x86/acpi/cpufreq/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_INTEL) += acpi.o
 obj-y += cpufreq.o
+obj-y += amd-pstate.o
 obj-$(CONFIG_INTEL) += hwp.o
 obj-$(CONFIG_AMD) += powernow.o
diff --git a/xen/arch/x86/acpi/cpufreq/amd-pstate.c b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
new file mode 100644
index 0000000000..bfad96ae3d
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * amd-pstate.c - AMD Processor P-state Frequency Driver
+ *
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Author: Penny Zheng <penny.zheng@amd.com>
+ *
+ * AMD P-State introduces a new CPU performance scaling design for AMD
+ * processors using the ACPI Collaborative Performance and Power Control (CPPC)
+ * feature which provides a finer grained frequency control range.
+ *
+ */
+
+#include <xen/init.h>
+#include <xen/param.h>
+#include <acpi/cpufreq/cpufreq.h>
+
+uint16_t __read_mostly dmi_max_speed_mhz;
+
+static bool __init amd_pstate_handle_option(const char *s, const char *end)
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
+int __init amd_pstate_cmdline_parse(const char *s, const char *e)
+{
+    do
+    {
+        const char *end = strpbrk(s, ",;");
+
+        if ( !amd_pstate_handle_option(s, end) )
+        {
+            printk(XENLOG_WARNING "cpufreq/amd-pstate: option '%.*s' not recognized\n",
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
+static const struct cpufreq_driver __initconstrel amd_pstate_cpufreq_driver =
+{
+    .name   = XEN_AMD_PSTATE_DRIVER_NAME,
+};
+
+int __init amd_pstate_register_driver(void)
+{
+    if ( !cpu_has_cppc )
+        return -ENODEV;
+
+    return cpufreq_register_driver(&amd_pstate_cpufreq_driver);
+}
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 61e98b67bd..a461cfc7b3 100644
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
@@ -156,6 +159,31 @@ static int __init cf_check cpufreq_driver_init(void)
             break;
 
         case X86_VENDOR_AMD:
+            ret = -ENOENT;
+
+            for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
+            {
+                switch ( cpufreq_xen_opts[i] )
+                {
+                case CPUFREQ_xen:
+                    ret = powernow_register_driver();
+                    break;
+                case CPUFREQ_amd_pstate:
+                    ret = amd_pstate_register_driver();
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
+            break;
+
         case X86_VENDOR_HYGON:
             ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
             break;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 917c395f58..4720c30e7e 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -574,6 +574,12 @@ ret_t do_platform_op(
 
         case XEN_PM_CPPC:
         {
+            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
+            {
+                ret = -ENOSYS;
+                break;
+            }
+
             ret = set_cppc_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.cppc_data);
         }
         break;
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 3e3392da1b..54d554aa4f 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -84,7 +84,7 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 
     if ( choice < 0 && !cmdline_strcmp(str, "dom0-kernel") )
     {
-        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+        xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_PX|XEN_PROCESSOR_PM_CPPC);
         cpufreq_controller = FREQCTL_dom0_kernel;
         opt_dom0_vcpus_pin = 1;
         return 0;
@@ -92,7 +92,7 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 
     if ( choice == 0 || !cmdline_strcmp(str, "none") )
     {
-        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+        xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_PX|XEN_PROCESSOR_PM_CPPC);
         cpufreq_controller = FREQCTL_none;
         return 0;
     }
@@ -130,6 +130,15 @@ static int __init cf_check setup_cpufreq_option(const char *str)
             if ( arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
+        else if ( choice < 0 && !cmdline_strcmp(str, "amd-pstate") )
+        {
+            xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
+            cpufreq_controller = FREQCTL_xen;
+            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_amd_pstate;
+            ret = 0;
+            if ( arg[0] && arg[1] )
+                ret = amd_pstate_cmdline_parse(arg + 1, end);
+        }
         else
             ret = -EINVAL;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 3f1b05a02e..71e8ca91f0 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -28,6 +28,7 @@ enum cpufreq_xen_opt {
     CPUFREQ_none,
     CPUFREQ_xen,
     CPUFREQ_hwp,
+    CPUFREQ_amd_pstate,
 };
 extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
 extern unsigned int cpufreq_xen_cnt;
@@ -267,4 +268,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
 int acpi_cpufreq_register(void);
 
+int amd_pstate_cmdline_parse(const char *s, const char *e);
+int amd_pstate_register_driver(void);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index be1cf9a12f..ad942f1775 100644
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
index b0fec271d3..df4f362681 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -424,6 +424,7 @@ struct xen_set_cppc_para {
 };
 
 #define XEN_HWP_DRIVER_NAME "hwp"
+#define XEN_AMD_PSTATE_DRIVER_NAME "amd-pstate"
 
 /*
  * cpufreq para name of this structure named
-- 
2.34.1


