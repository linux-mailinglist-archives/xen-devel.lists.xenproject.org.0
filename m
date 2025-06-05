Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9207ACF852
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007455.1386752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaB-0003KE-U1; Thu, 05 Jun 2025 19:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007455.1386752; Thu, 05 Jun 2025 19:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaB-0003Fw-M2; Thu, 05 Jun 2025 19:48:59 +0000
Received: by outflank-mailman (input) for mailman id 1007455;
 Thu, 05 Jun 2025 19:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGaA-0002tD-G1
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:48:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:2418::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d204b87-4246-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 21:48:56 +0200 (CEST)
Received: from BN9P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::21)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 19:48:52 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::72) by BN9P223CA0016.outlook.office365.com
 (2603:10b6:408:10b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 5 Jun 2025 19:48:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:52 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:49 -0500
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
X-Inumbo-ID: 1d204b87-4246-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMvqIfYvdfkEPCeyfpGjvm9q6EB+YLZUKiRe5vwswLaX/Jr9rx2pf43APaxJggrQhkJ2JledLgCBKt20EvyqaKt0GQdawabSNCInYfMob13X/dAlvPIImtnpN02inWSuvnKOyrUiFAlqBJXSMAPFx94UrWHGzQcmyv4YQs+TGW/flLlGtu5wDrK1ZS0W3tPJkFyd986dj4eP/sFl1WFQCmpBFu0vScayNa/JBiZpwVRGCxggEuUW9koklO7+p6997s2B1sdzf+jrHUFR+srdqyh0cOJzrtxfUEXw1MXJOk/KtQkPOAzHVWiHs2OmF+1k/fW4yM6rjwH0ZltfnuIGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArwUcGoNTf1o6R567cJORGEFIrUC5cYy26HnoRll94w=;
 b=B8pTMYbyHNnEBw3Mcpqe8h01ohKKRG5gMhpeciQbVQAlAdpOhmwHwZkTJJ6pbUYStjffdyiDoMpt3XdJy5S765i+n+X8rFWWLFRulQoeM3NNHX3mGxOL2a9MUZHCyZqC7EZt8ApP8+JNgxDIQtXBYT5JRp8ghtyOJzrmGfm1AX5Uf8BxKfUw4B2Ou8GF2o88iqqqVntA6bej2q6Ob6mjR0xGvBaKtMHy8NkMxLcY/mopJRBBC45+Y7Tyb/1bqh6e5CR4n4buxIYvLEuPCT5uS2WpWR/G0bxgF19NnJUmHztWw9U4FaY0Cg3Fm8ESzKKxfgijTol9BZ1qMqhHhXb1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArwUcGoNTf1o6R567cJORGEFIrUC5cYy26HnoRll94w=;
 b=VEY2A4i20wScLxvAYIQFhShcCW+qoH++w4VSVvkuGWZAMazPhDaSTJnL+Zgi+yxjLZNASm19OoVDsszhDc7ik9/316P+oYiZ9xYfYpuKNublkf1b6nd/+Jvs8TAwQnstMTRTP1Bi6PIpb0Y84DbQrbsQcVxHRx36rWAym9ldxzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 05/15] x86: Replace boot_module with bootmodule
Date: Thu, 5 Jun 2025 21:47:57 +0200
Message-ID: <20250605194810.2782031-6-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b018c87-2db1-4b35-f640-08dda469ff8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GwS9RDJrmdBBt7WiqqAsZH2RCFpXilLJ5nvJcTxXS4rpUbXp44IMr/mZnZTJ?=
 =?us-ascii?Q?+dk5+iT0+YHPcDhKOAy6iyLvI6GOJl/wu6OOz91heptl2soDR/Ajo9pjttWD?=
 =?us-ascii?Q?K4khtSb+o5z7uNN6lQ2EvBYZ2nscLd0C0SRqvN0O60mzPB2giTZo8cB0PBYd?=
 =?us-ascii?Q?lGfyL+3AeQxodZzaCk2FjGDv4J/dEyW9lAsNXttCQvR78CsloGGpa2EiC4oq?=
 =?us-ascii?Q?ye1SYn42zzDfy/kaYm829n6DX0X2hppjjJ1PME6J7iPPc1G5PqBKCh4h/105?=
 =?us-ascii?Q?i6jx67Vx+3mUIoYgcMbIPPhhEDBb8iNjxfdb0jDcjFUjIyr0ZrEP08TGGLIQ?=
 =?us-ascii?Q?X8ZTmcr+N8lYZ7DqMRbFNrLD6sPb1KRoBbdx+5Qw7865MBP8Qtzih4pcXCgU?=
 =?us-ascii?Q?6SvVrOAEaeSsAif/2zi22ZXZQ3Xijm+Ipf3dMQEQhxmrwEH4TGs9bZ1YHX9R?=
 =?us-ascii?Q?EIf4stElQN22+IciP9ZqQ5XlTcRVH3EwU9p7sHu6ITp494awT5SvCw2Z43IE?=
 =?us-ascii?Q?VpJp9Ce7tPc/bOWEAmfXFzU21mJbyCEMPdHTPjWMPbaDWAba8oLarKFbkKAM?=
 =?us-ascii?Q?nuTcuroaDGqP7+Dm66f8K3YU3h0SHWg9sdUby08bU+2VC7+47PkD3kKX/u2C?=
 =?us-ascii?Q?wKRyqfNt8Vkh1dlfljzmV8TcJtbU0jhR2W8vEWFwycm89cC8ixrbD8BraM/m?=
 =?us-ascii?Q?00W1BDV2e9FVbAyylm7h3FWQouGb5UrX3zUQdS0M+RX0MiJrE1jwsuYIfKaQ?=
 =?us-ascii?Q?sViOkNWEC7GZSde1pdmpsmRiT0G8VU/z0X8LUhHqRXN/FN5HxUFiwCnE4Bja?=
 =?us-ascii?Q?15GNdZ9Ab3ZiG4vbbBtKvsDezDQXOqsXQxGESPbPoRl9YyAogzLoNZKQOQ1f?=
 =?us-ascii?Q?Lat+QhC8H8IFn5HDw7Ata4rrBhZsuyw69h6899/m1i0rjQxrCpF7rmAoXE3S?=
 =?us-ascii?Q?1YrS9vurauNikeHu/4c1hXYb2wfuVOvxecfxBx+4nhyjDWiqP00N+LpFKJOO?=
 =?us-ascii?Q?qqpBvsfXk82bQbta3nIdMGO7FPCjdcQZ/znNC87G6vOuBvnvoZx8NyKKyPeA?=
 =?us-ascii?Q?3uSXLpJOiO/6iCzes/p/B0474TP+42JvTrZbysFadHtgYOrYoRFh09ZM7LH8?=
 =?us-ascii?Q?03mu0kax9DLut2Lnc+M5LyqWvH43L2YBmMwZQjn8hDmaQpvSUuV5q3VKtM/1?=
 =?us-ascii?Q?r0nzWB46KJT1Jhyr9Xor+W4Qr4oL78huUD1SGkNlldwC39IpGx8FxV/01BCA?=
 =?us-ascii?Q?daLHd7BKdNdKBlk/dc+FJlgimIhleZivejcxpMNc/bHFgPyNdFE1mxOvjT7L?=
 =?us-ascii?Q?CTp2oOslqN3IPKTYit3APOCAoqkNJfL6pRY32mY/yQKRwrXle6ubyXQCO2LA?=
 =?us-ascii?Q?oL0SHXj+OUvgqM9VEuqu62QcoqYpBiK65KrnrR2GQFGcigtlbjE8QS28a/Ra?=
 =?us-ascii?Q?6HRmCDBhZ4Z/JuU7HAP7zSEVxZ9cnDWwgtnyntRI1Xx3sGxaBvqjbs3WD7b1?=
 =?us-ascii?Q?Eic8k+wiHIUhcIQTWvEXjKOUaMDoQHkaDsV3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:52.2074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b018c87-2db1-4b35-f640-08dda469ff8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962

These types resemble each other very closely in layout and intent, and
with "struct bootmodule" already in common code it makes perfect sense
to merge them. In order to do so, add an arch-specific area for
x86-specific tidbits.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
--
v2:
  * Remove spurious fdt_cmdline from the new arch_bootmodule
---
 xen/arch/x86/cpu/microcode/core.c      |  9 ++--
 xen/arch/x86/hvm/dom0_build.c          | 10 ++---
 xen/arch/x86/include/asm/boot-domain.h |  4 +-
 xen/arch/x86/include/asm/bootfdt.h     | 50 ++++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h    | 58 +++-----------------------
 xen/arch/x86/include/asm/setup.h       |  6 +--
 xen/arch/x86/pv/dom0_build.c           |  8 ++--
 xen/arch/x86/setup.c                   | 52 ++++++++++++-----------
 xen/include/xen/bootfdt.h              |  9 ++++
 xen/xsm/xsm_policy.c                   |  4 +-
 10 files changed, 111 insertions(+), 99 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 34a94cd25b..0111ef9156 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -760,12 +760,11 @@ static int __init early_microcode_load(struct boot_info *bi)
     {
         for ( idx = 0; idx < bi->nr_modules; ++idx )
         {
-            const struct boot_module *bm = &bi->mods[idx];
+            const struct bootmodule *bm = &bi->mods[idx];
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
index a038e58c11..96410344a8 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -647,10 +647,10 @@ static int __init pvh_load_kernel(
     const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
 {
     struct domain *d = bd->d;
-    struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->module;
+    struct bootmodule *image = bd->kernel;
+    struct bootmodule *initrd = bd->module;
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
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index d7c6042e25..242e9c9c2b 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -13,8 +13,8 @@
 struct boot_domain {
     domid_t domid;
 
-    struct boot_module *kernel;
-    struct boot_module *module;
+    struct bootmodule *kernel;
+    struct bootmodule *module;
     const char *cmdline;
 
     struct domain *d;
diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
new file mode 100644
index 0000000000..2fc705a1cd
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootfdt.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_BOOTFDT_H
+#define X86_BOOTFDT_H
+
+#include <xen/types.h>
+
+struct arch_bootmodule
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
index 3afc214c17..f3210b7d6a 100644
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
@@ -81,7 +33,7 @@ struct boot_info {
     size_t memmap_length;
 
     unsigned int nr_modules;
-    struct boot_module mods[MAX_NR_BOOTMODS + 1];
+    struct bootmodule mods[MAX_NR_BOOTMODS + 1];
     struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
 
@@ -94,16 +46,16 @@ struct boot_info {
  *      Failure - a value greater than MAX_NR_BOOTMODS
  */
 static inline unsigned int __init next_boot_module_index(
-    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
+    const struct boot_info *bi, bootmodule_kind k, unsigned int start)
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
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index ac34c69855..c7deaba109 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -36,11 +36,11 @@ extern struct boot_info xen_boot_info;
 unsigned long initial_images_nrpages(nodeid_t node);
 void free_boot_modules(void);
 
-struct boot_module;
-void *bootstrap_map_bm(const struct boot_module *bm);
+struct bootmodule;
+void *bootstrap_map_bm(const struct bootmodule *bm);
 void bootstrap_unmap(void);
 
-void release_boot_module(struct boot_module *bm);
+void release_boot_module(struct bootmodule *bm);
 
 struct rangeset;
 int remove_xen_ranges(struct rangeset *r);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e1b78d47c2..e6c77413f5 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -374,8 +374,8 @@ static int __init dom0_construct(const struct boot_domain *bd)
     struct domain *d = bd->d;
     struct vcpu *v = d->vcpu[0];
 
-    struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->module;
+    struct bootmodule *image = bd->kernel;
+    struct bootmodule *initrd = bd->module;
     void *image_base;
     unsigned long image_len;
     void *image_start;
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
index 7d3b30e1db..e9a70c2c2b 100644
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
@@ -386,13 +386,13 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
     return nr;
 }
 
-void __init release_boot_module(struct boot_module *bm)
+void __init release_boot_module(struct bootmodule *bm)
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
@@ -524,7 +524,7 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
     return ret;
 }
 
-void *__init bootstrap_map_bm(const struct boot_module *bm)
+void *__init bootstrap_map_bm(const struct bootmodule *bm)
 {
     return bootstrap_map_addr(bm->start, bm->start + bm->size);
 }
@@ -694,7 +694,7 @@ static void __init noinline move_xen(void)
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
-    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
+    uint64_t s, uint64_t e, uint32_t size, const struct bootmodule mods[],
     unsigned int nr_mods, unsigned int this_mod)
 {
     unsigned int i;
@@ -990,8 +990,9 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
                                          const struct boot_domain *bd)
 {
     size_t s = bi->kextra ? strlen(bi->kextra) : 0;
+    const struct arch_bootmodule *abm = &bd->kernel->arch;
 
-    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
+    s += abm->cmdline_pa ? strlen(__va(abm->cmdline_pa)) : 0;
 
     if ( s == 0 )
         return s;
@@ -1055,9 +1056,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
@@ -1079,7 +1081,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             strlcat(cmdline, " acpi=", cmdline_size);
             strlcat(cmdline, acpi_param, cmdline_size);
         }
-        bd->kernel->cmdline_pa = 0;
+        bd->kernel->arch.cmdline_pa = 0;
         bd->cmdline = cmdline;
     }
 
@@ -1292,7 +1294,7 @@ void asmlinkage __init noreturn __start_xen(void)
     }
 
     /* Dom0 kernel is always first */
-    bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->mods[0].kind = BOOTMOD_KERNEL;
     bi->domains[0].kernel = &bi->mods[0];
 
     if ( pvh_boot )
@@ -1463,7 +1465,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     if ( xen_phys_start )
     {
-        struct boot_module *xen = &bi->mods[bi->nr_modules];
+        struct bootmodule *xen = &bi->mods[bi->nr_modules];
 
         relocated = true;
 
@@ -1476,7 +1478,7 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->mods[0].headroom =
+    bi->mods[0].arch.headroom =
         bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
     bootstrap_unmap();
 
@@ -1557,10 +1559,10 @@ void asmlinkage __init noreturn __start_xen(void)
         /* Is the region suitable for relocating the multiboot modules? */
         for ( j = bi->nr_modules - 1; j >= 0; j-- )
         {
-            struct boot_module *bm = &bi->mods[j];
-            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
+            struct bootmodule *bm = &bi->mods[j];
+            unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
 
-            if ( bm->relocated )
+            if ( bm->arch.relocated )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1570,12 +1572,12 @@ void asmlinkage __init noreturn __start_xen(void)
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
 
@@ -1601,7 +1603,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
+    if ( bi->mods[0].arch.headroom && !bi->mods[0].arch.relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
@@ -2159,7 +2161,7 @@ void asmlinkage __init noreturn __start_xen(void)
     initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
-        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
         bi->domains[0].module = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index ff40f3078e..4cab5d5202 100644
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
@@ -106,8 +110,13 @@ struct shared_meminfo {
 struct bootmodule {
     bootmodule_kind kind;
     bool domU;
+
     paddr_t start;
     paddr_t size;
+
+#if __has_include(<asm/bootfdt.h>)
+    struct arch_bootmodule arch;
+#endif
 };
 
 /* DT_MAX_NAME is the node name max length according the DT spec */
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 7f70d860bd..0c2cdea8ed 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -40,7 +40,7 @@ int __init xsm_multiboot_policy_init(
 
     for_each_boot_module_by_type ( i, bi, BOOTMOD_UNKNOWN )
     {
-        struct boot_module *bm = &bi->mods[i];
+        struct bootmodule *bm = &bi->mods[i];
 
         _policy_start = bootstrap_map_bm(bm);
         _policy_len   = bm->size;
@@ -53,7 +53,7 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            bm->type = BOOTMOD_XSM_POLICY;
+            bm->kind = BOOTMOD_XSM;
             break;
 
         }
-- 
2.43.0


