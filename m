Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED9C535C5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160306.1488519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcQ-0001IM-AK; Wed, 12 Nov 2025 16:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160306.1488519; Wed, 12 Nov 2025 16:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcQ-0001Cp-4p; Wed, 12 Nov 2025 16:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1160306;
 Wed, 12 Nov 2025 16:22:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJDcO-0000RX-Qt
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:22:48 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d29f6041-bfe3-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 17:22:47 +0100 (CET)
Received: from BN9PR03CA0199.namprd03.prod.outlook.com (2603:10b6:408:f9::24)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 16:22:37 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::7c) by BN9PR03CA0199.outlook.office365.com
 (2603:10b6:408:f9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 16:22:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Wed, 12 Nov 2025 16:22:37 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 08:22:35 -0800
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
X-Inumbo-ID: d29f6041-bfe3-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmWRS0VEPOiBM7Sad1179CXDJoO/5iCuoJgUYVUJJNXF6Q9THJOCqmuBj2LutWVMexB7K5AXSkDvtWT7Lnuht4x+YqLcvqgY7/G02zlv5dmTrY5ULKSuNH1nISC70nE1v30FSBRilSgyomRXrGe1OKRlrQQ2GYz4M9uF7pqyZc9q8bKuFbAuNUOxSZ/o5FJaMsGFkS4Cm9ylTlVX/SPwwV9zrfbobMaaabg8Wt82/D9UZw8djlr0fpw+JjL8aJ6C8SBdKuARbu64DGlcrlhMVwLDZw4n0VZpPpoWrslIqKHGK4ywEHUEPuQp9x3GCHJmzs1nUeMCB3Chr9gGCl0hpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXBRlT+vmpj7q780lMTRkbD8kmp9sJpq7zet8o+dSy0=;
 b=JOhhLXC1WsStcH3+7YOk2mcTzjf21RxF4Oi7I+o/GxPzeB5xJYpneEjK4ddXEnYp3Fs5Azm4LfDfxXHjWGmz+goA3fOGgGPwdDI561uKYW1rlnJQnWkbFJZ2ZlBiUMNHPElOVRi78CJtnRheAyccNU9uOrWQ8RLmOo9VNvQCeSiGapK+fV+Q0n54sQEHbW/D+R0cZB4cVLv437Af0j7bCCZnBmJmVrHleI12Tyrx7Rwk+bEMZGjxiQPjbtLsSDfPkJvAsU18PnsnM5F1NBeqq9nVoqOJ38GmU4IOOwbStzBGqR+BSspRDCnkCHifS0ZCYAc0V2M+bVfP/DU6md0lzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXBRlT+vmpj7q780lMTRkbD8kmp9sJpq7zet8o+dSy0=;
 b=avAMx6LNDVt0+g3zsTmp3V+Kd8oKOGkaEFjl3sTF2t6w40/a4OrM+6VKJ3XjnUuaORzMKMR919vTuKbt6WpoRayUrynS235ybbPJv8mR0dBTJYKDed3KTg3SJ6g5A2DBg3urzMFwoPXnCGwJ7cEaYPxSbdmwu4xmmDPNUbqB+7k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86: Split out early_microcode_load() and microcode_load_one()
Date: Wed, 12 Nov 2025 17:22:16 +0100
Message-ID: <20251112162219.226075-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
References: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SJ5PPFE4FC9FAB3:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f27baef-e039-4b20-1cbb-08de2207b1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hQKbQR2MaDAKGtXTeonY3HgciYsVBb1kjp1E211JQoMN3D3QDV2anCbsjQ2k?=
 =?us-ascii?Q?HOhSgmmklcoezIBz85LKUd6j+8hBI+21qSd97d6coznzC8lYecPm45/upnFJ?=
 =?us-ascii?Q?BOBYUTdiIKHnyNjBPEgMw0URtleuaZqM1Iur5VHcVw2GwDg618nzOw6Ch3IG?=
 =?us-ascii?Q?GttBrLxfqiuyYgm7aJKat3uWbG8BgQ4G9z8UdfReMSQaAWmm2/VSHQHPuoXd?=
 =?us-ascii?Q?fw9GoFK/9odNAEwGlge0FnrH+OAriKsEfTY5odLwR+4XKw/Rjpf+g/J/W+Wg?=
 =?us-ascii?Q?E9wPIw+vyRZPJpDO5vhZcVp5byQq18MbLoLnPM+C9c+teA+5j0yafbKrGHtQ?=
 =?us-ascii?Q?kuhn4xGsoG/Hljh/kNeIm/sSlCJrPjK8HH9rwIe2rXhB97/bBTJ6OAsL/iMI?=
 =?us-ascii?Q?0u8Sy8FTCX2fNvUQ4jUCH1jVsxCsxRt9paDLWZoj7FJoqDMPsLTUXf8WmL4c?=
 =?us-ascii?Q?YnuN4/U/n1zMHF9DfxHxT7VoqzOCK8uOwu9WsaTUbZTZAL/uSeDAnsnOrJAH?=
 =?us-ascii?Q?0gi0ZflQWhNaSB1sSK7ltCL3FlPjdBeoF4bQ5CUuNJfgfU+bp3ZzjN3ELEwZ?=
 =?us-ascii?Q?VtdrZyVydwTcSxIQ5ZQVi+/EF6MptGMnMRANEXdmS8X2xm+GotFagwb6VgpK?=
 =?us-ascii?Q?NL++svOW8GUj3AKJnOQsz3TngDtnq34b2K+Pxh5BkYjc+UAIRnaDxIOpS2Ov?=
 =?us-ascii?Q?/rb6Hg1WkdQol/MCX4BCmluBDdZA6y6a9PLH5UrQsFIPlbR20AZxFyT+S/4p?=
 =?us-ascii?Q?oIFKvNlauBALzwBHjGUEPTxIxOlI72uU88RIKmt0XaeR5yGKqt1tBXY2WnHE?=
 =?us-ascii?Q?M6BmeJTzYGZrNOxhFUvEGht5zVA0rsy1EsMkFDty2NaA2Mtut+nJ1cIn6tV9?=
 =?us-ascii?Q?maKnhdT4C21r3l4bDbHfhCYBy0eRCNoN6FodG5HxWuR5zHyQPJfGFqFNx7Uu?=
 =?us-ascii?Q?gnpS/uB5q8VoUKIPcCblDYaMauVXHS6PDF2ylf79c6IzRJ6DVbm7oecy7W/0?=
 =?us-ascii?Q?08eanYEsEaUSFHBsOyuiyMKvYT5zv+snj8FMcm1mbYzT5d8F1vXSpR7YKTd7?=
 =?us-ascii?Q?zEdC0nSxFxZEXtoeZrQXRw1s22Dl4VkQcqhvNdR1Ojwf1sC6jg6mWFBa4Uao?=
 =?us-ascii?Q?4rpy5B79PovOIXuBeltwuCFtOLFhUw2i67RAXPo0FJBdsV7htkH/+ait5AFa?=
 =?us-ascii?Q?ivGXli3ZzQEbH+BEUndWPN4HAA7Lr0hs7DV/Pw1o5M4a80qEACwqwz1XCF6A?=
 =?us-ascii?Q?8LhaYTlWRplmoa46HxvXTkjzM1KfWLxlNDFBHaUpgsVcL9utAxQ02udDD0tp?=
 =?us-ascii?Q?TNzYu+0wxhDG9bLkPvk1HevA3sfoU/cYm3q1kAbRaWWEg5cHEDpnvk3taPin?=
 =?us-ascii?Q?UoOt1i/C93KAsUbCMKkkBwQIUsLUqR6dXP9ZgAmrCUFc0NS/44jWTQqgOgaG?=
 =?us-ascii?Q?PgIvph49wICKoN6Uwo4ifpuFaWsuMjNvLgYBC+I6uGiJGq/tcVxAKU5513Fi?=
 =?us-ascii?Q?vwK7QVrdBTJnnmTZXEAY/Xu2/2HIT/2SjjD2qW8SaIB4+teQdT+3C+QL2Ys1?=
 =?us-ascii?Q?0Wqj/TD7p0wV001Dvx8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:22:37.7006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f27baef-e039-4b20-1cbb-08de2207b1de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3

A later patch compiles out most of the microcode loading code by removing
core.c from the Makefile based on Kconfig. These functions are important
to set up the ucode_op to read the microcode revision and report it on
every CPU.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/microcode/Makefile  |  1 +
 xen/arch/x86/cpu/microcode/base.c    | 72 ++++++++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/core.c    | 57 +---------------------
 xen/arch/x86/cpu/microcode/private.h | 14 ++++++
 4 files changed, 89 insertions(+), 55 deletions(-)
 create mode 100644 xen/arch/x86/cpu/microcode/base.c

diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
index 74289981e3..765195ada3 100644
--- a/xen/arch/x86/cpu/microcode/Makefile
+++ b/xen/arch/x86/cpu/microcode/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_AMD) += amd.o
 obj-$(CONFIG_AMD) += amd-base.o
+obj-y += base.o
 obj-y += core.o
 obj-$(CONFIG_INTEL) += intel.o
 obj-$(CONFIG_INTEL) += intel-base.o
diff --git a/xen/arch/x86/cpu/microcode/base.c b/xen/arch/x86/cpu/microcode/base.c
new file mode 100644
index 0000000000..895ee78d2e
--- /dev/null
+++ b/xen/arch/x86/cpu/microcode/base.c
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/alternative-call.h>
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+
+#include <asm/asm_defns.h>
+#include <asm/cpufeature.h>
+#include <asm/x86-vendors.h>
+#include <asm/microcode.h>
+
+#include "private.h"
+
+struct microcode_ops __ro_after_init ucode_ops;
+
+int microcode_update_one(void)
+{
+    /*
+     * This path is used for APs and S3 resume.  Read the microcode revision
+     * if possible, even if we can't load microcode.
+     */
+    if ( ucode_ops.collect_cpu_info )
+        alternative_vcall(ucode_ops.collect_cpu_info);
+
+    return _microcode_update_one();
+}
+
+int __init early_microcode_init(struct boot_info *bi)
+{
+    const struct cpuinfo_x86 *c = &boot_cpu_data;
+
+    switch ( c->vendor )
+    {
+    case X86_VENDOR_AMD:
+        ucode_probe_amd(&ucode_ops);
+        break;
+
+    case X86_VENDOR_INTEL:
+        ucode_probe_intel(&ucode_ops);
+        break;
+    }
+
+    if ( !ucode_ops.collect_cpu_info )
+    {
+        printk(XENLOG_INFO "Microcode loading not available\n");
+        return -ENODEV;
+    }
+
+    ucode_ops.collect_cpu_info();
+
+    printk(XENLOG_INFO "BSP microcode revision: 0x%08x\n", this_cpu(cpu_sig).rev);
+
+    /*
+     * Some hypervisors deliberately report a microcode revision of -1 to
+     * mean that they will not accept microcode updates.
+     *
+     * It's also possible the hardware might have built-in support to disable
+     * updates and someone (e.g: a baremetal cloud provider) disabled them.
+     *
+     * Take the hint in either case and ignore the microcode interface.
+     */
+    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )
+    {
+        printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
+               ucode_ops.apply_microcode ? "rev = ~0" : "HW toggle");
+        ucode_ops.apply_microcode = NULL;
+        return -ENODEV;
+    }
+
+    return early_microcode_load(bi);
+}
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1d1a5aa4b0..553a0ced15 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -162,8 +162,6 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-static struct microcode_ops __ro_after_init ucode_ops;
-
 static DEFINE_SPINLOCK(microcode_mutex);
 
 DEFINE_PER_CPU(struct cpu_signature, cpu_sig);
@@ -648,7 +646,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
 }
 
 /* Load a cached update to current cpu */
-int microcode_update_one(void)
+int _microcode_update_one(void)
 {
     int rc;
 
@@ -736,13 +734,7 @@ static int __init cf_check microcode_init_cache(void)
 }
 presmp_initcall(microcode_init_cache);
 
-/*
- * There are several tasks:
- * - Locate the ucode blob in the boot modules.
- * - Parse and attempt in-place load.
- * - Inform microcode_init_cache() of how to find the blob again.
- */
-static int __init early_microcode_load(struct boot_info *bi)
+int __init early_microcode_load(struct boot_info *bi)
 {
     void *data = NULL;
     size_t size;
@@ -873,48 +865,3 @@ static int __init early_microcode_load(struct boot_info *bi)
 
     return rc;
 }
-
-int __init early_microcode_init(struct boot_info *bi)
-{
-    const struct cpuinfo_x86 *c = &boot_cpu_data;
-
-    switch ( c->vendor )
-    {
-    case X86_VENDOR_AMD:
-        ucode_probe_amd(&ucode_ops);
-        break;
-
-    case X86_VENDOR_INTEL:
-        ucode_probe_intel(&ucode_ops);
-        break;
-    }
-
-    if ( !ucode_ops.collect_cpu_info )
-    {
-        printk(XENLOG_INFO "Microcode loading not available\n");
-        return -ENODEV;
-    }
-
-    ucode_ops.collect_cpu_info();
-
-    printk(XENLOG_INFO "BSP microcode revision: 0x%08x\n", this_cpu(cpu_sig).rev);
-
-    /*
-     * Some hypervisors deliberately report a microcode revision of -1 to
-     * mean that they will not accept microcode updates.
-     *
-     * It's also possible the hardware might have built-in support to disable
-     * updates and someone (e.g: a baremetal cloud provider) disabled them.
-     *
-     * Take the hint in either case and ignore the microcode interface.
-     */
-    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )
-    {
-        printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
-               ucode_ops.apply_microcode ? "rev = ~0" : "HW toggle");
-        ucode_ops.apply_microcode = NULL;
-        return -ENODEV;
-    }
-
-    return early_microcode_load(bi);
-}
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index e6c965dc99..881ea7d8d9 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -5,6 +5,8 @@
 
 #include <asm/microcode.h>
 
+struct boot_info;
+
 /* Opaque.  Internals are vendor-specific. */
 struct microcode_patch;
 
@@ -68,6 +70,7 @@ struct microcode_ops {
 };
 
 extern bool opt_digest_check;
+extern struct microcode_ops ucode_ops;
 
 /*
  * Microcode loading falls into one of 3 states.
@@ -93,4 +96,15 @@ void ucode_probe_intel(struct microcode_ops *ops);
 static inline void ucode_probe_intel(struct microcode_ops *ops) {}
 #endif
 
+/*
+ * There are several tasks:
+ * - Locate the ucode blob in the boot modules.
+ * - Parse and attempt in-place load.
+ * - Inform microcode_init_cache() of how to find the blob again.
+ */
+int early_microcode_load(struct boot_info *bi);
+
+/* Attempt performaing a microcode load */
+int _microcode_update_one(void);
+
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
-- 
2.43.0


