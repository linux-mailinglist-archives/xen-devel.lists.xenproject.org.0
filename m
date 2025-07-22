Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D61B0CE89
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051773.1420201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W4-0005cy-5M; Tue, 22 Jul 2025 00:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051773.1420201; Tue, 22 Jul 2025 00:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W4-0005aX-2G; Tue, 22 Jul 2025 00:05:56 +0000
Received: by outflank-mailman (input) for mailman id 1051773;
 Tue, 22 Jul 2025 00:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0W2-0005Mp-P7
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:05:54 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:2408::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a15350d1-668f-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 02:05:52 +0200 (CEST)
Received: from BN9PR03CA0714.namprd03.prod.outlook.com (2603:10b6:408:ef::29)
 by CH3PR12MB8969.namprd12.prod.outlook.com (2603:10b6:610:17c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:05:44 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::a9) by BN9PR03CA0714.outlook.office365.com
 (2603:10b6:408:ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Tue,
 22 Jul 2025 00:05:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:44 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:41 -0500
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
X-Inumbo-ID: a15350d1-668f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i29817FYUq+W86CO/++mHbue9ss/vts2ATJo0ZBWLlz7NnpWTnNsORco83VmE/slPpSROUEWAFHaD9j3/6NPOl17EC4jR4P8i/2avrRI+F+VlKEtDBWLvWPVUpikpsFXwQ+tQlLsD0IlMiAqpFKgNdfNhVGRygpedz3gpr3FOwXtoImXZuBEPvQfbUK3A+0fzFpZv1kSt5HBA9M3tGtjhpSQAXlI4IVllc2V5UZ4LsJ64uYmuz17TrHlAES+wPUJzco+dC7dW+FtdqZ/2WBm1rLI05DyWb7ZhigNDGkDOBilYY4iLHT9QFYs940YziUfjOVgXOIPC6qJFNAq4rIT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB8ng73IVgXOg3FXbInmoFgeYPdwwPuZj8D4d+Tey1s=;
 b=Z2cHqU7LA3VRBqwJaM+3HlFn0m4Fx1rhC1FyUJWJz4o1/N8LTucc8ffiii9oeS3oUvjNsD4XGPenuH7CnDN9lJ8xAa4WCbObbUQEbbeBubRFGmwsV6Y9dkOrZFK0LUCM+OUcoiv9S4LA7bQsYvgnACR1SWqAKn2YIr4qNkG/XijCtDqgVi4VIfVXohoiT/kXOvgzP0rLcJnxNJeII6uAwFHIYBt4AkMu9RUBVCkdjm7/4pyAOtAfCgyWuAwtLMMMWa+2wsD8xqRS5SY3dJA0fqJFXJqn5/walbbH3K6J6LegSUaH3m+BBOfwH02BnVtKRUaeEkiH4YqDzRnccc7jZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB8ng73IVgXOg3FXbInmoFgeYPdwwPuZj8D4d+Tey1s=;
 b=z8zd5PJajrAvzj2MI4H/T8dcfxWImGtf9rbmmJ7k9xsjQ+oEGWUV1HJsFpaL/r8lIg5XIVMJBCfMrSV7ZqfuQsY9uOK8J8aDEyTtDRLErT+JxjuuIbHH1GSmo70uV4bSsZ6y/OfTXQ75eKqW4wM/tcL2iSYH5LnJwEfdaqh/nHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>
Subject: [PATCH v8 01/11] x86: Replace arch-specific boot_module with common one
Date: Tue, 22 Jul 2025 02:05:13 +0200
Message-ID: <20250722000525.7247-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CH3PR12MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eaf80d8-15c7-4aee-4887-08ddc8b380d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JjU//SuF/zfGsGfoGBh0l7M+zALke+ldn/EG3u2HUZCx8fyv1TDp/0n52Roo?=
 =?us-ascii?Q?nbbReejzEbv6K7m8QN0f1skUfMNKO4dswmvi9HksT18vCVXLRF62A6qYo331?=
 =?us-ascii?Q?QvQUqym1wYCaQ+inW2Z2TW1rEHPNF84Cf+QSK+yLdOp2KyUqVjj35FPvsPnr?=
 =?us-ascii?Q?kc2rJ48Faz5+ZeGDsGIuHnA54RcfTWE3T1wel/anILuPFUpP5wfzj3KUwIYl?=
 =?us-ascii?Q?f9b3KO93TnfR6TWhG1Wr334z+PIDEJgSGLkdJRtSooq80yukEiZKOx7q5LYr?=
 =?us-ascii?Q?w2GxHPDkvFDfTfSSVOtApjzT8C+O+4/v4q414tAKaZXXpmTvTcuz4c1Tf+N1?=
 =?us-ascii?Q?JPFul6kkxbjubG/F5brtIUSLVDbOd8g1/mipP+/BTEVRGuheaLgx5+IG+fUF?=
 =?us-ascii?Q?hfF/4Dwj8KZWqamt2K24pz4cKg3HfieJ4aYk0AGXt3TtJoFGhMIhiUatK8Ho?=
 =?us-ascii?Q?gnFye7bgkRwSQz6oBG9RVkdoV3/uf1HZiTieihnzsWiermpWXKu+hA7CGB3i?=
 =?us-ascii?Q?7Q//uI+gfcWX/P8zIVbba73Rk0ChNAoJvks7YtWBow4bE0JP316sn+FHHyMb?=
 =?us-ascii?Q?8yFEyuVXSxL9lREJ1zyiStoLKrxTcybtIC4e3qMyirMizwhhUYyvHzvdMxEZ?=
 =?us-ascii?Q?3UwdDW5Ncah2Z/rRvSS+1UV4PlgJCS4DBIa9ZFLHPLPF8u7UzBd/vUD4Xabw?=
 =?us-ascii?Q?WnbmFDLvFE+v+7reB7XTy+G7tStmi2z3UAdQ5Zt886QfA0Utmd3p1K7kf2C/?=
 =?us-ascii?Q?ci1ni1OfbVM2Ky/qJdz6nynaU9PBOanSgGyFt5EdSR/KNQkx7dYBgxRzr34A?=
 =?us-ascii?Q?dQt5KONWdlF5NdtzDs6TyHNaVTp8qlJ7k/xVqVu/JYErBbJ+FgakhT0LO5R2?=
 =?us-ascii?Q?DZaYLWVze3ICBH4341JCPSAV4/kGDrLdRGKrg6sc4nmzh4IqCajmrK/qrX8m?=
 =?us-ascii?Q?l4iD1d/7MmTdAl0NVuna37ItxrvqKjSGpmVRm9yk2CkBvijWa6WJ5h+Zg3V6?=
 =?us-ascii?Q?zR62y++EdBOIIuxb0jNWoUz7lQoYoJWjzUZOnXB7mZ9mC5Anhqr2+dZAPZcZ?=
 =?us-ascii?Q?4f7tFBzDnfVOkr5w/Deb2w7/NsXRfXKab8NThrLEiugvtETuECNJlwPG6AHI?=
 =?us-ascii?Q?armxKloxB8rALoOEjZ3WbEXZ3QqfyKgTLmuD0teodPoQ0pyNzXQebOHgdora?=
 =?us-ascii?Q?0eiVXFbUQIWJ1aLIbNKJt+z/tMCGVDhIdvS4YmsVeFYWAgag8dC0THmKbFLJ?=
 =?us-ascii?Q?xwqdK79FrWV+nZSHTm+6vVdvFhpt3iJJuDpDadgz0JQo90wRADRIU3UI29AA?=
 =?us-ascii?Q?ka6uWHLCI2fxAhyTi6RMgzDNZV3iAku469xqyYelvY4RAddHVR075s3/6Kd3?=
 =?us-ascii?Q?fxUEp2pYkSQ49NRwpgxWOrO5bGXDq4Yj939QoL7obyTbcBhZ56ER7p+v+9n3?=
 =?us-ascii?Q?x6TKQM7GOv7Mf8TDLdr6FDp+d30/asu3v9QFrezLXWTCPX7Skt65Z1tU0gAK?=
 =?us-ascii?Q?g6R2exPcVIKQNfo58WlZlM3WFp9THWTu2jII?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:44.1871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eaf80d8-15c7-4aee-4887-08ddc8b380d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8969

These types resemble each other very closely in layout and intent,
and with "struct boot_module" already in common code it makes perfect
sense to merge them. In order to do so, rename identical fields with
conflicting names.

While doing this, s/BOOTMOD_XSM/BOOTMOD_XSM_POLICY/, as it was on x86.
XSM doesn't support external modules, so don't let the name imply it
through ambiguity.

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v8:
  * s/BOOTMOD_XSM/BOOTMOD_XSM_POLICY/
---
 xen/arch/x86/cpu/microcode/core.c   |  7 ++--
 xen/arch/x86/hvm/dom0_build.c       |  6 ++--
 xen/arch/x86/include/asm/bootfdt.h  | 50 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h | 56 +++--------------------------
 xen/arch/x86/pv/dom0_build.c        |  4 +--
 xen/arch/x86/setup.c                | 43 +++++++++++-----------
 xen/common/device-tree/bootfdt.c    |  4 +--
 xen/common/device-tree/bootinfo.c   |  2 +-
 xen/include/xen/bootfdt.h           | 10 +++++-
 xen/xsm/xsm_policy.c                |  4 +--
 10 files changed, 98 insertions(+), 88 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 34a94cd25b..816e9bfe40 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -764,8 +764,7 @@ static int __init early_microcode_load(struct boot_info *bi)
             struct cpio_data cd;
 
             /* Search anything unclaimed or likely to be a CPIO archive. */
-            if ( bm->type != BOOTMOD_UNKNOWN &&
-                 bm->type != BOOTMOD_RAMDISK )
+            if ( bm->kind != BOOTMOD_UNKNOWN && bm->kind != BOOTMOD_RAMDISK )
                 continue;
 
             size = bm->size;
@@ -815,12 +814,12 @@ static int __init early_microcode_load(struct boot_info *bi)
             return -ENODEV;
         }
 
-        if ( bi->mods[idx].type != BOOTMOD_UNKNOWN )
+        if ( bi->mods[idx].kind != BOOTMOD_UNKNOWN )
         {
             printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
             return -ENODEV;
         }
-        bi->mods[idx].type = BOOTMOD_MICROCODE;
+        bi->mods[idx].kind = BOOTMOD_MICROCODE;
 
         size = bi->mods[idx].size;
         data = bootstrap_map_bm(&bi->mods[idx]);
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 9964068387..6be26cc66f 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -650,7 +650,7 @@ static int __init pvh_load_kernel(
     struct boot_module *image = bd->kernel;
     struct boot_module *initrd = bd->module;
     void *image_base = bootstrap_map_bm(image);
-    void *image_start = image_base + image->headroom;
+    void *image_start = image_base + image->arch.headroom;
     unsigned long image_len = image->size;
     unsigned long initrd_len = initrd ? initrd->size : 0;
     size_t cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
@@ -721,9 +721,9 @@ static int __init pvh_load_kernel(
     {
         size_t initrd_space = elf_round_up(&elf, initrd_len);
 
-        if ( initrd->cmdline_pa )
+        if ( initrd->arch.cmdline_pa )
         {
-            initrd_cmdline = __va(initrd->cmdline_pa);
+            initrd_cmdline = __va(initrd->arch.cmdline_pa);
             if ( !*initrd_cmdline )
                 initrd_cmdline = NULL;
         }
diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
new file mode 100644
index 0000000000..a4c4bf30b9
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootfdt.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_BOOTFDT_H
+#define X86_BOOTFDT_H
+
+#include <xen/types.h>
+
+struct arch_boot_module
+{
+    /*
+     * Module State Flags:
+     *   relocated:   indicates module has been relocated in memory.
+     *   released:    indicates module's pages have been freed.
+     */
+    bool relocated:1;
+    bool released:1;
+
+    /*
+     * A boot module may need decompressing by Xen.  Headroom is an estimate of
+     * the additional space required to decompress the module.
+     *
+     * Headroom is accounted for at the start of the module.  Decompressing is
+     * done in-place with input=start, output=start-headroom, expecting the
+     * pointers to become equal (give or take some rounding) when decompression
+     * is complete.
+     *
+     * Memory layout at boot:
+     *
+     *               start ----+
+     *                         v
+     *   |<-----headroom------>|<------size------->|
+     *                         +-------------------+
+     *                         | Compressed Module |
+     *   +---------------------+-------------------+
+     *   |           Decompressed Module           |
+     *   +-----------------------------------------+
+     */
+    unsigned long headroom;
+    paddr_t cmdline_pa;
+};
+
+#endif /* X86_BOOTFDT_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 3afc214c17..d33b100e04 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,6 +8,7 @@
 #ifndef X86_BOOTINFO_H
 #define X86_BOOTINFO_H
 
+#include <xen/bootfdt.h>
 #include <xen/init.h>
 #include <xen/multiboot.h>
 #include <xen/types.h>
@@ -19,55 +20,6 @@
 /* Max number of boot domains that Xen can construct */
 #define MAX_NR_BOOTDOMS 1
 
-/* Boot module binary type / purpose */
-enum bootmod_type {
-    BOOTMOD_UNKNOWN,
-    BOOTMOD_XEN,
-    BOOTMOD_KERNEL,
-    BOOTMOD_RAMDISK,
-    BOOTMOD_MICROCODE,
-    BOOTMOD_XSM_POLICY,
-};
-
-struct boot_module {
-    enum bootmod_type type;
-
-    /*
-     * Module State Flags:
-     *   relocated: indicates module has been relocated in memory.
-     *   released:  indicates module's pages have been freed.
-     */
-    bool relocated:1;
-    bool released:1;
-
-    /*
-     * A boot module may need decompressing by Xen.  Headroom is an estimate of
-     * the additional space required to decompress the module.
-     *
-     * Headroom is accounted for at the start of the module.  Decompressing is
-     * done in-place with input=start, output=start-headroom, expecting the
-     * pointers to become equal (give or take some rounding) when decompression
-     * is complete.
-     *
-     * Memory layout at boot:
-     *
-     *               start ----+
-     *                         v
-     *   |<-----headroom------>|<------size------->|
-     *                         +-------------------+
-     *                         | Compressed Module |
-     *   +---------------------+-------------------+
-     *   |           Decompressed Module           |
-     *   +-----------------------------------------+
-     */
-    unsigned long headroom;
-
-    paddr_t cmdline_pa;
-
-    paddr_t start;
-    size_t size;
-};
-
 /*
  * Xen internal representation of information provided by the
  * bootloader/environment, or derived from the information.
@@ -94,16 +46,16 @@ struct boot_info {
  *      Failure - a value greater than MAX_NR_BOOTMODS
  */
 static inline unsigned int __init next_boot_module_index(
-    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
+    const struct boot_info *bi, boot_module_kind k, unsigned int start)
 {
     unsigned int i;
 
-    if ( t == BOOTMOD_XEN )
+    if ( k == BOOTMOD_XEN )
         return bi->nr_modules;
 
     for ( i = start; i < bi->nr_modules; i++ )
     {
-        if ( bi->mods[i].type == t )
+        if ( bi->mods[i].kind == k )
             return i;
     }
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e1b78d47c2..a4b5362357 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -422,7 +422,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
 
     image_base = bootstrap_map_bm(image);
     image_len = image->size;
-    image_start = image_base + image->headroom;
+    image_start = image_base + image->arch.headroom;
 
     d->max_pages = ~0U;
 
@@ -659,7 +659,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
              * pages. Tell the boot_module handling that we've freed it, so the
              * memory is left alone.
              */
-            initrd->released = true;
+            initrd->arch.released = true;
         }
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c6890669b9..58fd806072 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -303,7 +303,7 @@ struct boot_info __initdata xen_boot_info = {
      *
      * The extra entry exists to be able to add the Xen image as a module.
      */
-    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
+    .mods = { [0 ... MAX_NR_BOOTMODS] = { .kind = BOOTMOD_UNKNOWN } },
 };
 
 static struct boot_info *__init multiboot_fill_boot_info(
@@ -338,7 +338,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
      */
     for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
     {
-        bi->mods[i].cmdline_pa = mods[i].string;
+        bi->mods[i].arch.cmdline_pa = mods[i].string;
 
         if ( efi_enabled(EFI_LOADER) )
         {
@@ -361,7 +361,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
     }
 
     /* Variable 'i' should be one entry past the last module. */
-    bi->mods[i].type = BOOTMOD_XEN;
+    bi->mods[i].kind = BOOTMOD_XEN;
 
     return bi;
 }
@@ -388,11 +388,11 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
 void __init release_boot_module(struct boot_module *bm)
 {
-    ASSERT(!bm->released);
+    ASSERT(!bm->arch.released);
 
     init_domheap_pages(bm->start, bm->start + PAGE_ALIGN(bm->size));
 
-    bm->released = true;
+    bm->arch.released = true;
 }
 
 void __init free_boot_modules(void)
@@ -402,7 +402,7 @@ void __init free_boot_modules(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        if ( bi->mods[i].released )
+        if ( bi->mods[i].arch.released )
             continue;
 
         release_boot_module(&bi->mods[i]);
@@ -997,8 +997,8 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
 {
     size_t s = 0;
 
-    if ( bd->kernel->cmdline_pa )
-        s += strlen(__va(bd->kernel->cmdline_pa));
+    if ( bd->kernel->arch.cmdline_pa )
+        s += strlen(__va(bd->kernel->arch.cmdline_pa));
 
     if ( bi->kextra )
         s += strlen(bi->kextra);
@@ -1065,9 +1065,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
             panic("Error allocating cmdline buffer for %pd\n", d);
 
-        if ( bd->kernel->cmdline_pa )
+        if ( bd->kernel->arch.cmdline_pa )
             strlcpy(cmdline,
-                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
+                    cmdline_cook(__va(bd->kernel->arch.cmdline_pa),
+                                 bi->loader),
                     cmdline_size);
 
         if ( bi->kextra )
@@ -1089,7 +1090,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             strlcat(cmdline, " acpi=", cmdline_size);
             strlcat(cmdline, acpi_param, cmdline_size);
         }
-        bd->kernel->cmdline_pa = 0;
+        bd->kernel->arch.cmdline_pa = 0;
         bd->cmdline = cmdline;
     }
 
@@ -1302,7 +1303,7 @@ void asmlinkage __init noreturn __start_xen(void)
     }
 
     /* Dom0 kernel is always first */
-    bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->mods[0].kind = BOOTMOD_KERNEL;
     bi->domains[0].kernel = &bi->mods[0];
 
     if ( pvh_boot )
@@ -1486,7 +1487,7 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->mods[0].headroom =
+    bi->mods[0].arch.headroom =
         bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
     bootstrap_unmap();
 
@@ -1568,9 +1569,9 @@ void asmlinkage __init noreturn __start_xen(void)
         for ( j = bi->nr_modules - 1; j >= 0; j-- )
         {
             struct boot_module *bm = &bi->mods[j];
-            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
+            unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
 
-            if ( bm->relocated )
+            if ( bm->arch.relocated )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1580,12 +1581,12 @@ void asmlinkage __init noreturn __start_xen(void)
             if ( highmem_start && end > highmem_start )
                 continue;
 
-            if ( s < end && (bm->headroom || (end - size) > bm->start) )
+            if ( s < end && (bm->arch.headroom || (end - size) > bm->start) )
             {
-                move_memory(end - size + bm->headroom, bm->start, bm->size);
+                move_memory(end - size + bm->arch.headroom, bm->start, bm->size);
                 bm->start = (end - size);
-                bm->size += bm->headroom;
-                bm->relocated = true;
+                bm->size += bm->arch.headroom;
+                bm->arch.relocated = true;
             }
         }
 
@@ -1611,7 +1612,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
+    if ( bi->mods[0].arch.headroom && !bi->mods[0].arch.relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
@@ -2169,7 +2170,7 @@ void asmlinkage __init noreturn __start_xen(void)
     initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
-        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
         bi->domains[0].module = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 08d919aba6..01f475510e 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -349,7 +349,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
               fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
         kind = BOOTMOD_RAMDISK;
     else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
-        kind = BOOTMOD_XSM;
+        kind = BOOTMOD_XSM_POLICY;
     else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
         kind = BOOTMOD_GUEST_DTB;
     else if ( fdt_node_check_compatible(fdt, node, "multiboot,microcode") == 0 )
@@ -377,7 +377,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
         default: break;
         }
         if ( kind_guess > 1 && has_xsm_magic(start) )
-            kind = BOOTMOD_XSM;
+            kind = BOOTMOD_XSM_POLICY;
     }
 
     domU = fdt_node_check_compatible(fdt, parent_node, "xen,domain") == 0;
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index 2a27d1318b..eb1b2b729d 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -29,7 +29,7 @@ const char * __init boot_module_kind_as_string(boot_module_kind kind)
     case BOOTMOD_FDT:     return "Device Tree";
     case BOOTMOD_KERNEL:  return "Kernel";
     case BOOTMOD_RAMDISK: return "Ramdisk";
-    case BOOTMOD_XSM:     return "XSM";
+    case BOOTMOD_XSM_POLICY:    return "XSM Policy";
     case BOOTMOD_GUEST_DTB:     return "DTB";
     case BOOTMOD_MICROCODE:     return "Microcode";
     case BOOTMOD_UNKNOWN: return "Unknown";
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 7f49d0ccdd..1218b23bb4 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -7,6 +7,10 @@
 #include <xen/macros.h>
 #include <xen/xmalloc.h>
 
+#if __has_include(<asm/bootfdt.h>)
+#include <asm/bootfdt.h>
+#endif
+
 #define MIN_FDT_ALIGN 8
 
 #define NR_MEM_BANKS 256
@@ -19,7 +23,7 @@ typedef enum {
     BOOTMOD_FDT,
     BOOTMOD_KERNEL,
     BOOTMOD_RAMDISK,
-    BOOTMOD_XSM,
+    BOOTMOD_XSM_POLICY,
     BOOTMOD_GUEST_DTB,
     BOOTMOD_MICROCODE,
     BOOTMOD_UNKNOWN
@@ -110,6 +114,10 @@ struct boot_module {
 #endif
     paddr_t start;
     paddr_t size;
+
+#if __has_include(<asm/bootfdt.h>)
+    struct arch_boot_module arch;
+#endif
 };
 
 /* DT_MAX_NAME is the node name max length according the DT spec */
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 1f88b4fc5a..27bfc3b995 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -53,7 +53,7 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            bm->type = BOOTMOD_XSM_POLICY;
+            bm->kind = BOOTMOD_XSM_POLICY;
             break;
 
         }
@@ -68,7 +68,7 @@ int __init xsm_multiboot_policy_init(
 #ifdef CONFIG_HAS_DEVICE_TREE
 int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
 {
-    struct boot_module *mod = boot_module_find_by_kind(BOOTMOD_XSM);
+    struct boot_module *mod = boot_module_find_by_kind(BOOTMOD_XSM_POLICY);
     paddr_t paddr, len;
 
     if ( !mod || !mod->size )
-- 
2.43.0


