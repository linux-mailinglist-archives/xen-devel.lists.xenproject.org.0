Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE495C535D0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160305.1488512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcP-0001CP-UM; Wed, 12 Nov 2025 16:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160305.1488512; Wed, 12 Nov 2025 16:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcP-0001AJ-PK; Wed, 12 Nov 2025 16:22:49 +0000
Received: by outflank-mailman (input) for mailman id 1160305;
 Wed, 12 Nov 2025 16:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJDcO-0000RL-Om
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:22:48 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1822444-bfe3-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 17:22:47 +0100 (CET)
Received: from BN9PR03CA0206.namprd03.prod.outlook.com (2603:10b6:408:f9::31)
 by DS0PR12MB8220.namprd12.prod.outlook.com (2603:10b6:8:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 16:22:38 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::87) by BN9PR03CA0206.outlook.office365.com
 (2603:10b6:408:f9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 16:22:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Wed, 12 Nov 2025 16:22:38 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 08:22:36 -0800
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
X-Inumbo-ID: d1822444-bfe3-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxbhyjluirJVoWJZblUTH8OstIYyf3XwNnUCv0I3+FyeNBkBeCgvDHj20AJIW4/Pc2v55LPPET4CyNwxS5yU3Vyk0Qyn3prniB29ZBNaj3bvwjYLSYWn9J36jrCVxdN9D9I+CrIDyz5O6EWzxhm1Qp86UiAzjXYEyhXFggS+rlXVlRBs4nd3+koZBx9gILvoIWa2iRHHVYR+zechQXx+UcVQRkISkTJsoUbXh6uRtL4oBG42+e7nCdaJFr3QATb35OkPMdCZBvebX64MWv5ruNa1fUbpG5hkQR0PCKQ1CTjrEpuz4Jfl7ypDAo8n1rijNtHu4tckonYPlgkLZUs+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlUqvqE/VFp5EaRFjnobC2TG4Ik3upgV5GDSchMkSS8=;
 b=SRnlvMNMcYmttRYyh3p3x94E0fGPOATi3ZTfLM7wce4gh0pMdzjU9NsTRvzhlMNxCVTsF20Bql3kg9wTD++KicLOYME+N6zJLz78BWecoWz6/WwP5KWEBvg7zNjTtQNmZtFY8drPcWLrZBFxHJalt4J+LcrxgqoVdc1GwYM04Tlx+0ffCWjEBXP560aCzWtQG+bRzaXd+7fDzRtYc/vTSOt/Esgpj1xqITuiLhRCHMkwi9QS3/GXTuYp2figRNs15eWiHbEHv49jawdvpDAQsW2OhgUeUyu2KSkLXexX+ZaOxkyNOabIvAMEZpqOpXreqqJKuHA6kwArfbZZ0MAwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlUqvqE/VFp5EaRFjnobC2TG4Ik3upgV5GDSchMkSS8=;
 b=1rXKMENccQ2AYTQ9WUmOJdsxWd5jeSlkl8eiaoYUgajNK53vG1qat79aWk94L3XfmtLJQ2kj9zUoKHuuvB4d7IXZYbWvjboBIczxVMqfJdMlhFfqTbZFWEFdrrI6GsrFsTJ+zkE9/NMpGpFn9q/R2icn68TV3G+4P/GaVA7zZ6w=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH 4/4] x86: Add Kconfig option to disable microcode loading
Date: Wed, 12 Nov 2025 17:22:17 +0100
Message-ID: <20251112162219.226075-5-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DS0PR12MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4ab6e9-3356-4077-6ec3-08de2207b247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RZ2G5MwND2ydle6GMkTvpZmrx2APiMnKoJ8L8IorzyHsF5UnQsckqV2Vkjg3?=
 =?us-ascii?Q?47tVp/JiXOCoWnTQsIjEHT8PZ+PaNiKhzvwU7XsY7qNJ36LbUY2+jryBeIPq?=
 =?us-ascii?Q?jqRSzCcRnpRwNfiyYp5z4DJhhlzMpxLRO6KwSSawcQAPi9cy9plMORt1jmyg?=
 =?us-ascii?Q?vYldmTc/40vl3now+e/zTR7a/CEF2cr/c03e9jcM5GBDOeR3sSCv5bYA53Bj?=
 =?us-ascii?Q?2zNoDWYQ9pT1TRV6BjHayT8siA3jnvlTwL2cJXh4sgN9unSxw/rTIS5+PefX?=
 =?us-ascii?Q?GYyTw+bQI1DCwNqtS+1vbMdWaZ6YMhywQOjSTpvc4eT5Y2Ms3MOas+vxMUq9?=
 =?us-ascii?Q?/ZN1mixTVkHbGpHuQvd+TkIgijH5AXuMm5oqIML5caqO4beha+pcDG2lUAu/?=
 =?us-ascii?Q?NFgwA+Qu8tISvIjgWzAV8jna6M8Wt4Dnu76gleGyZrzsgzdw+Hl2FNmYrrGX?=
 =?us-ascii?Q?Eh4Qdg5jMUFw/G2bmv/d3viG1kLvjf5mDsc39w+zKGxhCEAl6VNI8a2t9sZv?=
 =?us-ascii?Q?A4qcydJ5CwsjXegxW3faEMlyD6EYedlGBDXFIFs8RfmDIvE4Hr80DrEz5qS8?=
 =?us-ascii?Q?tYx89aKFO3hYlXxRJmP0cZslvEyDB0SH9L78523/PHha2sJ0XRODsnmb0gPJ?=
 =?us-ascii?Q?mZNILpjXUIQksIdwmrhakygDBtje7F5Dq2mSi1ZGXngZ5k+f12VS6mlOoI8l?=
 =?us-ascii?Q?HfKNF8C+6OrVlDjwv8tkFjkejUWWP30+h1oQwtWYyPvdN2HK0J/TMf1pM9xZ?=
 =?us-ascii?Q?BDaDCBYtQpDviboBuZdN3byowza1imvZ9ESVDrfK6sLA/62inJrTMEgJMZAt?=
 =?us-ascii?Q?rR5GM3t/kdv15Xv6T6QjOO9lWiKaNIZNWIPnUzw+KQtPY/fNHmk0THsJk/sN?=
 =?us-ascii?Q?rvgr/HeIxTpVIJ9VTKWmY7dR4ZqdaEZLH5CetjDUdx6GcgHWNiOy7NUUackS?=
 =?us-ascii?Q?Y595k8AXnetVSfNeyKo3OxicYtHatL8TqvvkDpqlG3fAoyE1LOIocDOJj0io?=
 =?us-ascii?Q?zpi67PKy+pJGCEvaYn6KWfEbzFNFoq/u3TQymV4SBs583hieoel1KkoAdjIQ?=
 =?us-ascii?Q?1EsJKAFuL24RifHSQLAg10c8feBKOqfODqOs91c50aGvCYKLo2V+PCzJMaAV?=
 =?us-ascii?Q?Tg2CJzxvNcCnO2skDCj8uVe+0SFqykxPRnGzEOmYYatq+KyVmVKBoyHYk5C3?=
 =?us-ascii?Q?BGs0jRtFgMAS64cBZssE/Q7XLx2Re3OqupBbGYHimV8caH2b14RpVzcZq5es?=
 =?us-ascii?Q?G+NmQU+PytFPmZ2f66JO1pqXNdEv9joS4gDGs5qWB5lRU8zpGCssq2dL8G49?=
 =?us-ascii?Q?4UqmTVMHmbaI7EJ4ZkPtZ+30B/wuAS77PL6CPqOGNn7lZsgdnzDSN4adxFKZ?=
 =?us-ascii?Q?Cli2Y1HTUO9a23bMvsLcbb7okEZCHIT8o2ypz1sl8XLBBONO4+PlhqJ8vvnZ?=
 =?us-ascii?Q?My939rkilTORS91os5HGnkrZRrliVsQJ+swsivSJVDWRMyCm1YySogXQOJ6J?=
 =?us-ascii?Q?oDlZ30u6c21d1Gve56yGOWAgF0rkYEBRwrN0EVWjSgTUwuOiFf+ZTkx7scOF?=
 =?us-ascii?Q?tvZamAIx8Xlgf8+v4Uk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:22:38.3902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4ab6e9-3356-4077-6ec3-08de2207b247
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8220

Keeps around the microcode revision reading logic, as that's security
sensitive to detect out-of-date patforms and report them.

Move cpu_sig to base.c, because that's externally visible symbol outside
the microcode subsystem and we need it always accesible.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/Kconfig                    | 12 ++++++++++++
 xen/arch/x86/cpu/microcode/Makefile     |  6 +++---
 xen/arch/x86/cpu/microcode/amd-base.c   |  9 +++++++--
 xen/arch/x86/cpu/microcode/base.c       | 21 +++++++++++----------
 xen/arch/x86/cpu/microcode/core.c       |  1 -
 xen/arch/x86/cpu/microcode/intel-base.c |  6 ++++--
 xen/arch/x86/efi/efi-boot.h             |  2 +-
 xen/arch/x86/platform_hypercall.c       |  2 ++
 8 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 3f0f3a0f3a..948dd00dbc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -330,8 +330,20 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
 
+config UCODE
+	bool "Microcode loading"
+	default y
+	help
+	  Support updating the microcode revision of available CPUs with a newer
+	  vendor-provided microcode blob. Microcode updates address some classes of
+	  silicon defects. It's a very common delivery mechanism for fixes or
+	  workarounds for speculative execution vulnerabilities.
+
+	  If unsure, say Y
+
 config UCODE_SCAN_DEFAULT
 	bool "Scan for microcode by default"
+	depends on UCODE
 	help
 	  During boot, Xen can scan the multiboot images for a CPIO archive
 	  containing CPU microcode to be loaded, which is Linux's mechanism for
diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
index 765195ada3..4ec38b56a2 100644
--- a/xen/arch/x86/cpu/microcode/Makefile
+++ b/xen/arch/x86/cpu/microcode/Makefile
@@ -1,6 +1,6 @@
-obj-$(CONFIG_AMD) += amd.o
+obj-$(filter $(CONFIG_AMD),$(CONFIG_UCODE)) += amd.o
 obj-$(CONFIG_AMD) += amd-base.o
 obj-y += base.o
-obj-y += core.o
-obj-$(CONFIG_INTEL) += intel.o
+obj-$(CONFIG_UCODE) += core.o
+obj-$(filter $(CONFIG_INTEL),$(CONFIG_UCODE)) += intel.o
 obj-$(CONFIG_INTEL) += intel-base.o
diff --git a/xen/arch/x86/cpu/microcode/amd-base.c b/xen/arch/x86/cpu/microcode/amd-base.c
index f8f5fac1e1..4e705fe602 100644
--- a/xen/arch/x86/cpu/microcode/amd-base.c
+++ b/xen/arch/x86/cpu/microcode/amd-base.c
@@ -22,19 +22,23 @@ static void cf_check collect_cpu_info(void)
 }
 
 static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
-    .cpu_request_microcode            = amd_cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
+#ifdef CONFIG_UCODE
+    .cpu_request_microcode            = amd_cpu_request_microcode,
     .apply_microcode                  = amd_apply_microcode,
     .compare                          = amd_compare,
     .cpio_path                        = amd_cpio_path,
+#endif /* CONFIG_UCODE */
 };
 
 void __init ucode_probe_amd(struct microcode_ops *ops)
 {
     /*
      * The Entrysign vulnerability (SB-7033, CVE-2024-36347) affects Zen1-5
-     * CPUs.  Taint Xen if digest checking is turned off.
+     * CPUs. Taint Xen if digest checking is turned off and microcode loading is
+     * compiled in.
      */
+#ifdef CONFIG_UCODE
     if ( boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
          !opt_digest_check )
     {
@@ -42,6 +46,7 @@ void __init ucode_probe_amd(struct microcode_ops *ops)
                "Microcode patch additional digest checks disabled\n");
         add_taint(TAINT_CPU_OUT_OF_SPEC);
     }
+#endif /* CONFIG_UCODE */
 
     if ( boot_cpu_data.family < 0x10 )
         return;
diff --git a/xen/arch/x86/cpu/microcode/base.c b/xen/arch/x86/cpu/microcode/base.c
index 895ee78d2e..3e0b5a7447 100644
--- a/xen/arch/x86/cpu/microcode/base.c
+++ b/xen/arch/x86/cpu/microcode/base.c
@@ -13,6 +13,7 @@
 #include "private.h"
 
 struct microcode_ops __ro_after_init ucode_ops;
+DEFINE_PER_CPU(struct cpu_signature, cpu_sig);
 
 int microcode_update_one(void)
 {
@@ -23,6 +24,9 @@ int microcode_update_one(void)
     if ( ucode_ops.collect_cpu_info )
         alternative_vcall(ucode_ops.collect_cpu_info);
 
+    if ( !IS_ENABLED(CONFIG_UCODE) )
+        return 0;
+
     return _microcode_update_one();
 }
 
@@ -30,16 +34,10 @@ int __init early_microcode_init(struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
 
-    switch ( c->vendor )
-    {
-    case X86_VENDOR_AMD:
+    if ( IS_ENABLED(CONFIG_AMD) && c->vendor == X86_VENDOR_AMD )
         ucode_probe_amd(&ucode_ops);
-        break;
-
-    case X86_VENDOR_INTEL:
+    else if ( IS_ENABLED(CONFIG_INTEL) && c->vendor == X86_VENDOR_INTEL )
         ucode_probe_intel(&ucode_ops);
-        break;
-    }
 
     if ( !ucode_ops.collect_cpu_info )
     {
@@ -60,10 +58,13 @@ int __init early_microcode_init(struct boot_info *bi)
      *
      * Take the hint in either case and ignore the microcode interface.
      */
-    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )
+    if ( !IS_ENABLED(CONFIG_UCODE) || !ucode_ops.apply_microcode ||
+         this_cpu(cpu_sig).rev == ~0 )
     {
         printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
-               ucode_ops.apply_microcode ? "rev = ~0" : "HW toggle");
+               !IS_ENABLED(CONFIG_UCODE) ? "not compiled-in" :
+               ucode_ops.apply_microcode ? "rev = ~0"        :
+                                           "HW toggle");
         ucode_ops.apply_microcode = NULL;
         return -ENODEV;
     }
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 553a0ced15..d6ba250dca 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -164,7 +164,6 @@ custom_param("ucode", parse_ucode);
 
 static DEFINE_SPINLOCK(microcode_mutex);
 
-DEFINE_PER_CPU(struct cpu_signature, cpu_sig);
 /* Store error code of the work done in NMI handler */
 static DEFINE_PER_CPU(int, loading_err);
 
diff --git a/xen/arch/x86/cpu/microcode/intel-base.c b/xen/arch/x86/cpu/microcode/intel-base.c
index 4fcacaa192..18fdb4e7fc 100644
--- a/xen/arch/x86/cpu/microcode/intel-base.c
+++ b/xen/arch/x86/cpu/microcode/intel-base.c
@@ -32,17 +32,19 @@ static void cf_check collect_cpu_info(void)
 }
 
 static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
+    .collect_cpu_info      = collect_cpu_info,
+#ifdef CONFIG_UCODE
     .cpu_request_microcode = intel_cpu_request_microcode,
     .apply_microcode       = intel_apply_microcode,
-    .collect_cpu_info      = collect_cpu_info,
     .compare               = intel_compare,
     .cpio_path             = intel_cpio_path,
+#endif /* CONFIG_UCODE */
 };
 
 void __init ucode_probe_intel(struct microcode_ops *ops)
 {
     *ops = intel_ucode_ops;
 
-    if ( !intel_can_load_microcode() )
+    if ( IS_ENABLED(CONFIG_UCODE) && !intel_can_load_microcode() )
         ops->apply_microcode = NULL;
 }
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0194720003..9ec9291681 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -295,7 +295,7 @@ static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
 {
     union string name;
 
-    if ( read_section(image, L"ucode", &ucode, NULL) )
+    if ( !IS_ENABLED(CONFIG_UCODE) || read_section(image, L"ucode", &ucode, NULL) )
         return;
 
     name.s = get_value(&cfg, section, "ucode");
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 79bb99e0b6..b2527bca93 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -307,6 +307,7 @@ ret_t do_platform_op(
         break;
     }
 
+#ifdef CONFIG_UCODE
     case XENPF_microcode_update:
     {
         XEN_GUEST_HANDLE(const_void) data;
@@ -327,6 +328,7 @@ ret_t do_platform_op(
                                  op->u.microcode2.flags);
         break;
     }
+#endif /* CONFIG_UCODE */
 
     case XENPF_platform_quirk:
     {
-- 
2.43.0


