Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F16C535C8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160304.1488503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcM-0000wQ-K9; Wed, 12 Nov 2025 16:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160304.1488503; Wed, 12 Nov 2025 16:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcM-0000t9-Gw; Wed, 12 Nov 2025 16:22:46 +0000
Received: by outflank-mailman (input) for mailman id 1160304;
 Wed, 12 Nov 2025 16:22:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJDcK-0000RX-3i
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:22:44 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce90ee0a-bfe3-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 17:22:41 +0100 (CET)
Received: from BN9PR03CA0208.namprd03.prod.outlook.com (2603:10b6:408:f9::33)
 by DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Wed, 12 Nov 2025 16:22:36 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::32) by BN9PR03CA0208.outlook.office365.com
 (2603:10b6:408:f9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 16:22:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Wed, 12 Nov 2025 16:22:36 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 08:22:32 -0800
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
X-Inumbo-ID: ce90ee0a-bfe3-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmPN4YBt7yNXE+jjPnx8iDtyXkGr47xIjDbH0mFNUXyOM8aBfhb8FY9ifrmIRvCwYaEKkL/q1dVVRQ79orkeVRwYWwcwc/CBLM+1Udv2pIFQNhTMSvbpcRh/cOWj4j9Zw3aKbMamRpKIelm4dqaq06Cq65wHuG58nIkunIMSOFzUhLLhob0mcKbeJ+a09Q7uFx7nUL1ZbovQe+wqN/CEky2+VeIRPjRGeVLbdxGrXDLS37zTJ/4jnOpnC1FqkbgZXSLfR6EGofxz8Izd9L4NJ4o/geK27JOyarq99F5Pk3LJ4ValE3KHmke5LrcjUWrc4wTjifArG1dTpmWQLSmVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/b7AVkE9aycwDP7HcBPMZRjIqnxoGF/E1DlqBnoWYQ4=;
 b=SF9pFSQEXQh46VN68Q6gxoFsQ7uATQmd0lt4fN4Kiuv+FihLl5IR51GpRQC3RR06jvCRR272JHofDhA8B48IDG0G5QiaG3diYNWiWOUk+QuvDAu3i0pa28gOU0iCc+rorjJIthbFgnHWjBkd2sQ1IL7+k2452mI8MRQ+BMHy2NyrzfAsqXaIPkzBMQZ0Htf09ecByxsk11gLJxq9AfLoRPqrvu7UfCWeuY0zmBu29lnTSjezdu/24+Bs2WuuXW5bOO23HsLdz5gMrZuEDDYHpMnNPbYRW8NUHYv1qzyPzob9/g2Fbk4SZ5K1uYAibhgMsDt3drtidFNTVO7o7Hszvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/b7AVkE9aycwDP7HcBPMZRjIqnxoGF/E1DlqBnoWYQ4=;
 b=q4ZRAaevOJrZa/RV+Lkyb/2NAimh2SLOodzYPM+RuKMwnHL98CL1iH/TWNshz+rST9Ybq/2lnu68q1y+GGBvtvL9EZbYGyvw4YY1P9Psj0EKNwPkKltxw8u3QNhneJNdDVj7lVD/r6Z26tNjLyuzu2E3dX065do0A6m9bQyKioI=
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
Subject: [PATCH 1/4] x86: Split out AMD-specific code to be executed without ucode loading
Date: Wed, 12 Nov 2025 17:22:14 +0100
Message-ID: <20251112162219.226075-2-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DM4PR12MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea56d63-f4ad-4e6c-b1c0-08de2207b124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MVqrmT2tOvya6kaqebB49aOvRMegOL8MRwy7AWSN7gQqEVQ8VrdKGjjLJ9ok?=
 =?us-ascii?Q?+iGfGaptzt2cW+Xb+UuCoyllSRI1ZcFuohTa9+pNuWQyt+I3yFuJE5XkAzb9?=
 =?us-ascii?Q?4ZHIkAbFyDkC3ILl9ysehQC7WNs/VUl6DhbG16PdTwUlyxldTiZ7k+kP+XHX?=
 =?us-ascii?Q?4VnjKbEq/CIEPdi7FfG1cDMU43tbxQKNQg9kHbZ6h5Rxs1UCPnNaVQ2VaF7D?=
 =?us-ascii?Q?QxO/1+lltfe48KrD/yqKnI1hgel1Hk57YYQbDeYu6MTC5e7LbnQAZId0HCu9?=
 =?us-ascii?Q?ZsqpbQml4fDH2Wuspze3TfvD4clyeRCtQIYSh3dUsUIMXPIAJXk8GmixmcB8?=
 =?us-ascii?Q?mX2ZkFW10WXNn3rTIAJSHhmzPSzIjk8rXpaeZtSRbB4HM0To66oEvJcYqL+k?=
 =?us-ascii?Q?DyN78HLMlZyV6VgpFG4tpIU2EKDno4sgoP6u+cuWkXB1UUl0KF43w8OR7PfQ?=
 =?us-ascii?Q?CM4gYdj45oUhpVl1lWiR4pJj3p0tiv8ePUrK4RIq/CAc3m5FKElBapSSlIYs?=
 =?us-ascii?Q?DBPmdapaGE/frgwETaFGSYDjw8/R3AoWAoHczlEfB30PdV+Ahm1osVoaQIuY?=
 =?us-ascii?Q?59BtAqfp2LopTT80Loe6Dcj2NKl0X8Zak21QlSpGF4sZn+445cvvMd3sBK31?=
 =?us-ascii?Q?mONMuqT2f4QOiuWbKBfS9gHCyiElY2UJZ1/PktLjyLin76eP0OK67dZ4VlF+?=
 =?us-ascii?Q?x8iF4vkdvxp3EANMP/iqIOU3FM1jAJs7rCt2h2dwsTA6Ooc2vRjQx5ttAkYR?=
 =?us-ascii?Q?UscBpLa1eqwF32sWmIzLuuVQMncjqpJcEMVm5nChsKz+gsgTiUleQJStwXHv?=
 =?us-ascii?Q?Bc3XBt6ss12tqrzPYik4GG9PgftE7UPLynTuMIQJ3GXvxo6iO7OvYkvqwRjc?=
 =?us-ascii?Q?Zj+dwhKnMi6ibR8zKpaZV97CxFwlrhD6tM5o/xXD44KdfYE+5s/jeMKIpwfr?=
 =?us-ascii?Q?inuZAQ5vYVfWnEAplXZ8WdvkAV/LzPGUaw2aeJnfvQbXa44iSosPW1zZWyFk?=
 =?us-ascii?Q?F77AWKUlqImr5OZFe9n5gqkkm+r8J7QrIY42jWJwJuUh32P7W6Rre6jLCL+9?=
 =?us-ascii?Q?n5yUzHkqIG5Uars18rtjxM3jrDE4bLDOFdjMiftWoriQpdr1KXDwsVotflw2?=
 =?us-ascii?Q?mLrZwBK+U7fTrTZkr3isK10o6xQG5ADwXm6LXZGf+V0Mz8M3aHsbp7XbcaAb?=
 =?us-ascii?Q?Hbb4kGVRnKZZu9Id/CY9YswmicQij2PA9Vn2U0jzROgMHninOPhBGIwx7Gfc?=
 =?us-ascii?Q?SWNySyCjUDCocc3Gn3l/dygSf7Pc++4sDrGuCzZUatYmfLT/rLWJsGXfA5NI?=
 =?us-ascii?Q?hnenVx2I2SpgVX52dEx6Pf6cy+Ex9LgdD/0dJSDukE67jjIB1OxMNAI5JfgK?=
 =?us-ascii?Q?dRbIjrQXlGFfQA7kaBsr+b/wD2B12PAwRW1qpsjGoE6c0l+3pPug9K+ed82z?=
 =?us-ascii?Q?ofaLaWuwf2XPrW4kbNPnsqXVyxAxxq15XBunSicKcfOJSgTHteAAKw9WpV8M?=
 =?us-ascii?Q?IGHeIJ/nMyIknli5dfx95rcbAJm9USZAvSOnfTepmaL2103q/IiYt9KDBGDn?=
 =?us-ascii?Q?BRNAjZ1MSde+gWhciAs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:22:36.4844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea56d63-f4ad-4e6c-b1c0-08de2207b124
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5962

Some code must be executed even with microcode loading disabled to find
out the current microcode revision. This is important to determine active
erratas and such.

With the intent of stripping microcode loading via Kconfig, move such
essential AMD-specific code to an amd-base.c file.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/microcode/Makefile   |  1 +
 xen/arch/x86/cpu/microcode/amd-base.c | 50 ++++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/amd.c      | 55 +++------------------------
 xen/arch/x86/cpu/microcode/amd.h      | 15 ++++++++
 4 files changed, 72 insertions(+), 49 deletions(-)
 create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
 create mode 100644 xen/arch/x86/cpu/microcode/amd.h

diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
index 30d600544f..00aa0f24e4 100644
--- a/xen/arch/x86/cpu/microcode/Makefile
+++ b/xen/arch/x86/cpu/microcode/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_AMD) += amd.o
+obj-$(CONFIG_AMD) += amd-base.o
 obj-y += core.o
 obj-$(CONFIG_INTEL) += intel.o
diff --git a/xen/arch/x86/cpu/microcode/amd-base.c b/xen/arch/x86/cpu/microcode/amd-base.c
new file mode 100644
index 0000000000..f8f5fac1e1
--- /dev/null
+++ b/xen/arch/x86/cpu/microcode/amd-base.c
@@ -0,0 +1,50 @@
+#include <xen/init.h>
+
+#include <asm/msr.h>
+#include <asm/processor.h>
+#include <asm/x86-vendors.h>
+
+#include "amd.h"
+
+#define pr_debug(x...) ((void)0)
+
+static void cf_check collect_cpu_info(void)
+{
+    struct cpu_signature *csig = &this_cpu(cpu_sig);
+
+    memset(csig, 0, sizeof(*csig));
+
+    csig->sig = cpuid_eax(1);
+    rdmsrl(MSR_AMD_PATCHLEVEL, csig->rev);
+
+    pr_debug("microcode: CPU%d collect_cpu_info: patch_id=%#x\n",
+             smp_processor_id(), csig->rev);
+}
+
+static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
+    .cpu_request_microcode            = amd_cpu_request_microcode,
+    .collect_cpu_info                 = collect_cpu_info,
+    .apply_microcode                  = amd_apply_microcode,
+    .compare                          = amd_compare,
+    .cpio_path                        = amd_cpio_path,
+};
+
+void __init ucode_probe_amd(struct microcode_ops *ops)
+{
+    /*
+     * The Entrysign vulnerability (SB-7033, CVE-2024-36347) affects Zen1-5
+     * CPUs.  Taint Xen if digest checking is turned off.
+     */
+    if ( boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
+         !opt_digest_check )
+    {
+        printk(XENLOG_WARNING
+               "Microcode patch additional digest checks disabled\n");
+        add_taint(TAINT_CPU_OUT_OF_SPEC);
+    }
+
+    if ( boot_cpu_data.family < 0x10 )
+        return;
+
+    *ops = amd_ucode_ops;
+}
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 550b8c1e57..c6d61fd38c 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -22,9 +22,7 @@
 
 #include <asm/msr.h>
 
-#include "private.h"
-
-#define pr_debug(x...) ((void)0)
+#include "amd.h"
 
 struct equiv_cpu_entry {
     uint32_t installed_cpu;
@@ -153,19 +151,6 @@ static bool check_digest(const struct container_microcode *mc)
     return true;
 }
 
-static void cf_check collect_cpu_info(void)
-{
-    struct cpu_signature *csig = &this_cpu(cpu_sig);
-
-    memset(csig, 0, sizeof(*csig));
-
-    csig->sig = cpuid_eax(1);
-    rdmsrl(MSR_AMD_PATCHLEVEL, csig->rev);
-
-    pr_debug("microcode: CPU%d collect_cpu_info: patch_id=%#x\n",
-             smp_processor_id(), csig->rev);
-}
-
 static bool verify_patch_size(uint32_t patch_size)
 {
     uint32_t max_size;
@@ -264,7 +249,7 @@ static bool microcode_fits_cpu(const struct microcode_patch *patch)
     return equiv.id == patch->processor_rev_id;
 }
 
-static int cf_check amd_compare(
+int cf_check amd_compare(
     const struct microcode_patch *old, const struct microcode_patch *new)
 {
     /* Both patches to compare are supposed to be applicable to local CPU. */
@@ -310,8 +295,8 @@ static bool check_min_rev(const struct microcode_patch *patch)
     return this_cpu(cpu_sig).rev >= patch->min_rev;
 }
 
-static int cf_check apply_microcode(const struct microcode_patch *patch,
-                                    unsigned int flags)
+int cf_check amd_apply_microcode(const struct microcode_patch *patch,
+                                 unsigned int flags)
 {
     int hw_err, result;
     unsigned int cpu = smp_processor_id();
@@ -424,7 +409,7 @@ static int scan_equiv_cpu_table(const struct container_equiv_table *et)
     return -ESRCH;
 }
 
-static struct microcode_patch *cf_check cpu_request_microcode(
+struct microcode_patch *cf_check amd_cpu_request_microcode(
     const void *buf, size_t size, bool make_copy)
 {
     const struct microcode_patch *saved = NULL;
@@ -559,37 +544,9 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-static const char __initconst amd_cpio_path[] =
+const char __initconst amd_cpio_path[] =
     "kernel/x86/microcode/AuthenticAMD.bin";
 
-static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
-    .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
-    .compare                          = amd_compare,
-    .cpio_path                        = amd_cpio_path,
-};
-
-void __init ucode_probe_amd(struct microcode_ops *ops)
-{
-    /*
-     * The Entrysign vulnerability (SB-7033, CVE-2024-36347) affects Zen1-5
-     * CPUs.  Taint Xen if digest checking is turned off.
-     */
-    if ( boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
-         !opt_digest_check )
-    {
-        printk(XENLOG_WARNING
-               "Microcode patch additional digest checks disabled\n");
-        add_taint(TAINT_CPU_OUT_OF_SPEC);
-    }
-
-    if ( boot_cpu_data.family < 0x10 )
-        return;
-
-    *ops = amd_ucode_ops;
-}
-
 #if 0 /* Manual CONFIG_SELF_TESTS */
 static void __init __constructor test_digests_sorted(void)
 {
diff --git a/xen/arch/x86/cpu/microcode/amd.h b/xen/arch/x86/cpu/microcode/amd.h
new file mode 100644
index 0000000000..1df1b61adb
--- /dev/null
+++ b/xen/arch/x86/cpu/microcode/amd.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ASM_X86_MICROCODE_AMD_H
+#define ASM_X86_MICROCODE_AMD_H
+
+#include "private.h"
+
+int cf_check amd_compare(const struct microcode_patch *old,
+                         const struct microcode_patch *new);
+int cf_check amd_apply_microcode(const struct microcode_patch *patch,
+                                 unsigned int flags);
+struct microcode_patch *cf_check amd_cpu_request_microcode(
+    const void *buf, size_t size, bool make_copy);
+extern const char amd_cpio_path[];
+
+#endif /* ASM_X86_MICROCODE_AMD_H */
-- 
2.43.0


