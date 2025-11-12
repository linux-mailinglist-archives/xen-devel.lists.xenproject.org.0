Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D460C535C9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160302.1488483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcK-0000Tw-1p; Wed, 12 Nov 2025 16:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160302.1488483; Wed, 12 Nov 2025 16:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcJ-0000RW-Uo; Wed, 12 Nov 2025 16:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1160302;
 Wed, 12 Nov 2025 16:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJDcI-0000RL-SO
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:22:42 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf0375b7-bfe3-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 17:22:41 +0100 (CET)
Received: from BN9PR03CA0199.namprd03.prod.outlook.com (2603:10b6:408:f9::24)
 by BY5PR12MB4162.namprd12.prod.outlook.com (2603:10b6:a03:201::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 16:22:37 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::3) by BN9PR03CA0199.outlook.office365.com
 (2603:10b6:408:f9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 16:22:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Wed, 12 Nov 2025 16:22:36 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 08:22:34 -0800
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
X-Inumbo-ID: cf0375b7-bfe3-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4FyQ4PDxvp7+M1JKdbnFTNc7S2F/LfTCG+F9d0xa+TtdMUrHmTJQpSDaUIGjutqnbn6yKGs7Q9xEfku6KgOBGEk+p/93NIf4/MwN5uS22Mdp/vePCDvRgXt/2to1+2yBzNpclVBpopu3TWaWJkE5Tr+7LnaUYy5VvE4nHkj9EllgfbtzGQ5fmb4rxSa4Y0PigbClkH1TzkhwTr8EqBYX4xfhfQJvhQ5VTqnpFMnIivRBJXS0DFnl5cYgeX3Znrd9kesDahZ7/iR3A1Em8/IqF8+wpQyt27cnnUf9psEhwwoKma4y5r0glLEaZ0Uq7VW+3ExrmF0ll8WKWpApssgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AD+PhPKcjdOH7op5TswjHIaXy9fjfsf0PKlh/uahcQ=;
 b=BG5Vjdca5jsHhyX6l4Tj+SqQV/BA9cSpgf7n3/4q1Ju7o9jWgn9oB63EnIots0aqhmXdo5g/MPcYOtqkxuNbd1R2MnVk6B4LjpH6YNeTAWmivtTzClARiDM/lc5du+elto12CoXtC6QIwnUi5eNHgExxs+NthgvRWgCKYRQTIh4DO3jZeBzTn9PEvmlKvKweetGXseXzJq3zauaUPCGPG7GRzWR2xic/sPsrBuFKytgUkOFjEcTUvNSgG3/RZB7l00fJScQMlFUyh1FloIbKfDmv41nSY5kb/RtWRVwHP3BsPCjppno2MtQXStCeeq8f0UnZzUeXfps1iblT6w8uXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AD+PhPKcjdOH7op5TswjHIaXy9fjfsf0PKlh/uahcQ=;
 b=XpnKf11RuKZw31zP7mbz6QBuuPs+kpA9/ykli+/ziXlpMCcGHCJ4fPgRIPkwSaeSbO7o6GVQ7T7rUgcw56QDYULsoI1zfyBppuDsCgzwNMZ4E9RQJQighkE753FxYLGzgnFBjxTV24O/qIwuFcmcbNtxBDE4V94du21vZlUSMKE=
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
Subject: [PATCH 2/4] x86: Split out Intel-specific code to be executed without ucode loading
Date: Wed, 12 Nov 2025 17:22:15 +0100
Message-ID: <20251112162219.226075-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|BY5PR12MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: 31423ed2-b646-4625-2b61-08de2207b172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o9GDH+QqjCfz11Z9JDl2ci0equP4etU0vBP3xfb2vYjb7DRwIiobx1TuWS71?=
 =?us-ascii?Q?qGyOC0xrSu+CXkEXrp7j9uKbeLKTkjunjk7l7DMx0ahpAGtvwXYisdmCDBPf?=
 =?us-ascii?Q?Pkq/CNdbx6lR5DKv3bxDuTeL22raIi+R4gu1gsh3NnEx3f7qcKTERjMKRYWn?=
 =?us-ascii?Q?xh4guEStyOCGq+aGeZLeK/cS7D5dpWAUzyK2/awhU6sJkjCizXRXph0z9ud1?=
 =?us-ascii?Q?UMypaelPppCiUkjyKlNQb2gvO8Pye1Rt1wNvUUEay0WwS5c2hJm1Glq7vekX?=
 =?us-ascii?Q?Cws9Tys7IdLIyxwwYpWrKhzfjQDWFPCdlk4zNcnXh/oB8lNKALLzMu6GltRD?=
 =?us-ascii?Q?F6UAMg6U3ujy0fWtA3TbpLFsyU83shlrd9A6IrEEnYx/n7A+AV+kE722V+x4?=
 =?us-ascii?Q?YW4iMwFV3B0hV2W8PcgNXV/8UyiFJB7KOSTji4q/m8ObLL7Fl1oFb10x+ynx?=
 =?us-ascii?Q?m8wvM6y9xrx1E6LOs64cIdYvwXb0I2g+CNp2qnEPI/GW/yVszGyVSRFVdxIC?=
 =?us-ascii?Q?5TTh/wBs+W2oAWFmjm3uvQKmsfsT2zgfgcy27z6o3OyXXAun/mk3d3rlQo4w?=
 =?us-ascii?Q?4aHD3XAxjwFab45E7Jotzc1mHLjNgDAQYk6n/PK5ppayO6FVM85YV/D4bIuC?=
 =?us-ascii?Q?HeR72riVwshHJ5YbC7n/WnBNYSup/DaukkO8+3BWa1ScL29gDIDAE3DjCWYU?=
 =?us-ascii?Q?YtRMrBjCtC6/V9QLOtTF7ISIshT9XpsRn2XNFkt5LLFpN8or8WutKKjFMkdX?=
 =?us-ascii?Q?qEY4FiTVAkUi6gkOHfpPY2QuLdbWbl68ZyL7UuQ347TwbZ/ROoxvvg04HF5b?=
 =?us-ascii?Q?J+jzW1azIM3inKN0/veVLZRCZXWzSdk6stp6fTNQXlwYXjxKfj81MH+P35OO?=
 =?us-ascii?Q?IbdGKYzmDQOa/7kVuLUXfhg7IWxXeMhHYd8gBEiX6sZCX4drTlk0HIYmUu2R?=
 =?us-ascii?Q?N71bR8Y5gijVafgsZ8XDCJ292RmL2qlWGviLVX9zsoCcIEkQAH1N5/OGghk4?=
 =?us-ascii?Q?oFvsXGMU4OPCi0IeyfERfHSEXKiVe5gctSIqp5VUcGIGqyYbk/FbkajrlVx4?=
 =?us-ascii?Q?LjtaWEAVER8qpWhS8tPU8WTxfUfjwbFSdVUgn5ktzdhyyJ/IXRIfAh2PLDHR?=
 =?us-ascii?Q?uVrVNkEbHRAobmA70eMxKEfJxrLw+FrK3gKv+9F5UMT8QqUOHl6lPMTEx5PU?=
 =?us-ascii?Q?rE5OQ9rxXyZy1DA52ktMNcgZSNRxaKHaj0l0VNfmvHVtNlnyHbNJt/2d9ZLw?=
 =?us-ascii?Q?yyfdcnVuLq7cU/hDCdVZCiibHr8IMIZPb/HAYmN2aGNTmMyOfwOLqNBcTg/q?=
 =?us-ascii?Q?dBKHp/gLHGq4Ft5eNP0kYHTAUdYVidnFpN5H9463yIKcsRSGWrPIMOO8u97S?=
 =?us-ascii?Q?CoIKT9lr89igNhdLPamb4RtmQr1hiE8GlehgU7gxMUv7QDx6S+LVLT6/aPUY?=
 =?us-ascii?Q?N4bTLiB81TOrtwaY/xLZwkyfzXx8c8PyHjAjaDT1ycUHsSEXaVXz1+q6Dt75?=
 =?us-ascii?Q?sbHHdBOA+jgWuXnwx0tFAW+WtznscJVHbO3l0FbKKtf9hCQNEPJkOiuoRkVI?=
 =?us-ascii?Q?2pI5HCU1OG7f757fbow=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:22:36.9923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31423ed2-b646-4625-2b61-08de2207b172
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4162

Some code must be executed even with microcode loading disabled to find
out the current microcode revision. This is important to determine active
erratas and such.

With the intent of stripping microcode loading via Kconfig, move such
essential Intel-specific code to an intel-base.c file.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/microcode/Makefile     |  1 +
 xen/arch/x86/cpu/microcode/intel-base.c | 48 +++++++++++++++++++++
 xen/arch/x86/cpu/microcode/intel.c      | 56 ++++---------------------
 xen/arch/x86/cpu/microcode/intel.h      | 16 +++++++
 4 files changed, 72 insertions(+), 49 deletions(-)
 create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
 create mode 100644 xen/arch/x86/cpu/microcode/intel.h

diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
index 00aa0f24e4..74289981e3 100644
--- a/xen/arch/x86/cpu/microcode/Makefile
+++ b/xen/arch/x86/cpu/microcode/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_AMD) += amd.o
 obj-$(CONFIG_AMD) += amd-base.o
 obj-y += core.o
 obj-$(CONFIG_INTEL) += intel.o
+obj-$(CONFIG_INTEL) += intel-base.o
diff --git a/xen/arch/x86/cpu/microcode/intel-base.c b/xen/arch/x86/cpu/microcode/intel-base.c
new file mode 100644
index 0000000000..4fcacaa192
--- /dev/null
+++ b/xen/arch/x86/cpu/microcode/intel-base.c
@@ -0,0 +1,48 @@
+#include <xen/init.h>
+
+#include <asm/msr.h>
+#include <asm/processor.h>
+
+#include "intel.h"
+
+#define pr_debug(x...) ((void)0)
+
+static void cf_check collect_cpu_info(void)
+{
+    struct cpu_signature *csig = &this_cpu(cpu_sig);
+    uint64_t msr_content;
+
+    memset(csig, 0, sizeof(*csig));
+
+    rdmsrl(MSR_IA32_PLATFORM_ID, msr_content);
+    csig->pf = 1 << ((msr_content >> 50) & 7);
+
+    /*
+     * Obtaining the microcode version involves writing 0 to the "read only"
+     * UCODE_REV MSR, executing any CPUID instruction, after which a nonzero
+     * revision should appear.
+     */
+    wrmsrl(MSR_IA32_UCODE_REV, 0);
+    csig->sig = cpuid_eax(1);
+    rdmsrl(MSR_IA32_UCODE_REV, msr_content);
+    csig->rev = msr_content >> 32;
+
+    pr_debug("microcode: collect_cpu_info : sig=%#x, pf=%#x, rev=%#x\n",
+             csig->sig, csig->pf, csig->rev);
+}
+
+static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
+    .cpu_request_microcode = intel_cpu_request_microcode,
+    .apply_microcode       = intel_apply_microcode,
+    .collect_cpu_info      = collect_cpu_info,
+    .compare               = intel_compare,
+    .cpio_path             = intel_cpio_path,
+};
+
+void __init ucode_probe_intel(struct microcode_ops *ops)
+{
+    *ops = intel_ucode_ops;
+
+    if ( !intel_can_load_microcode() )
+        ops->apply_microcode = NULL;
+}
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 281993e725..c5e0012a03 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -31,9 +31,7 @@
 #include <asm/processor.h>
 #include <asm/system.h>
 
-#include "private.h"
-
-#define pr_debug(x...) ((void)0)
+#include "intel.h"
 
 struct microcode_patch {
     uint32_t hdrver;
@@ -120,30 +118,6 @@ static bool signature_matches(const struct cpu_signature *cpu_sig,
     return cpu_sig->pf & ucode_pf;
 }
 
-static void cf_check collect_cpu_info(void)
-{
-    struct cpu_signature *csig = &this_cpu(cpu_sig);
-    uint64_t msr_content;
-
-    memset(csig, 0, sizeof(*csig));
-
-    rdmsrl(MSR_IA32_PLATFORM_ID, msr_content);
-    csig->pf = 1 << ((msr_content >> 50) & 7);
-
-    /*
-     * Obtaining the microcode version involves writing 0 to the "read only"
-     * UCODE_REV MSR, executing any CPUID instruction, after which a nonzero
-     * revision should appear.
-     */
-    wrmsrl(MSR_IA32_UCODE_REV, 0);
-    csig->sig = cpuid_eax(1);
-    rdmsrl(MSR_IA32_UCODE_REV, msr_content);
-    csig->rev = msr_content >> 32;
-
-    pr_debug("microcode: collect_cpu_info : sig=%#x, pf=%#x, rev=%#x\n",
-             csig->sig, csig->pf, csig->rev);
-}
-
 /*
  * Sanity check a blob which is expected to be a microcode patch.  The 48 byte
  * header is of a known format, and together with totalsize are within the
@@ -273,7 +247,7 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
     return false;
 }
 
-static int cf_check intel_compare(
+int cf_check intel_compare(
     const struct microcode_patch *old, const struct microcode_patch *new)
 {
     /*
@@ -286,8 +260,8 @@ static int cf_check intel_compare(
     return compare_revisions(old->rev, new->rev);
 }
 
-static int cf_check apply_microcode(const struct microcode_patch *patch,
-                                    unsigned int flags)
+int cf_check intel_apply_microcode(const struct microcode_patch *patch,
+                                   unsigned int flags)
 {
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
@@ -333,7 +307,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
     return 0;
 }
 
-static struct microcode_patch *cf_check cpu_request_microcode(
+struct microcode_patch *cf_check intel_cpu_request_microcode(
     const void *buf, size_t size, bool make_copy)
 {
     int error = 0;
@@ -391,7 +365,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-static bool __init can_load_microcode(void)
+bool __init intel_can_load_microcode(void)
 {
     uint64_t mcu_ctrl;
 
@@ -404,21 +378,5 @@ static bool __init can_load_microcode(void)
     return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
 }
 
-static const char __initconst intel_cpio_path[] =
+const char __initconst intel_cpio_path[] =
     "kernel/x86/microcode/GenuineIntel.bin";
-
-static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
-    .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
-    .compare                          = intel_compare,
-    .cpio_path                        = intel_cpio_path,
-};
-
-void __init ucode_probe_intel(struct microcode_ops *ops)
-{
-    *ops = intel_ucode_ops;
-
-    if ( !can_load_microcode() )
-        ops->apply_microcode = NULL;
-}
diff --git a/xen/arch/x86/cpu/microcode/intel.h b/xen/arch/x86/cpu/microcode/intel.h
new file mode 100644
index 0000000000..3c1419dc77
--- /dev/null
+++ b/xen/arch/x86/cpu/microcode/intel.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ASM_X86_MICROCODE_INTEL_H
+#define ASM_X86_MICROCODE_INTEL_H
+
+#include "private.h"
+
+bool intel_can_load_microcode(void);
+int cf_check intel_compare(const struct microcode_patch *old,
+                           const struct microcode_patch *new);
+int cf_check intel_apply_microcode(const struct microcode_patch *patch,
+                                   unsigned int flags);
+struct microcode_patch *cf_check intel_cpu_request_microcode(
+    const void *buf, size_t size, bool make_copy);
+extern const char intel_cpio_path[];
+
+#endif /* ASM_X86_MICROCODE_INTEL_H */
-- 
2.43.0


