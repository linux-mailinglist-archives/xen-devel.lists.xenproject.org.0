Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3AAEF5BE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029520.1403298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgG-0003FT-8i; Tue, 01 Jul 2025 10:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029520.1403298; Tue, 01 Jul 2025 10:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgG-0003Do-2J; Tue, 01 Jul 2025 10:57:40 +0000
Received: by outflank-mailman (input) for mailman id 1029520;
 Tue, 01 Jul 2025 10:57:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lih=ZO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWYgE-0002hE-Q4
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:57:38 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:200a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dc17935-566a-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 12:57:29 +0200 (CEST)
Received: from BN0PR04CA0004.namprd04.prod.outlook.com (2603:10b6:408:ee::9)
 by BY5PR12MB4145.namprd12.prod.outlook.com (2603:10b6:a03:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 1 Jul
 2025 10:57:25 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::28) by BN0PR04CA0004.outlook.office365.com
 (2603:10b6:408:ee::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Tue,
 1 Jul 2025 10:57:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 10:57:24 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 05:57:20 -0500
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
X-Inumbo-ID: 2dc17935-566a-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nguq9h1Za+oFs4DRodl77nP0iKneLXfluCAcNOrg5R+hLy3p/q30PVF1LYd57GywStcb14Zb3nEwyv0OUUCzAeNajYliR/a+1LXjaEseqgE89D8i67ukB6JqTx3yC36PGCFFx16tICRUiGAd/cN+H0MIQPIAvxKACM8kcXjWOQrguwSBmjg0f8OkBtJ7s/XZ+KpCxxfWQn0qBXSfLmdY/wymIEwDgyei5EHuZyZ43HghbnLJ0vc4B7sucZtL7Vp9sRCskG7Qjsd0sFksz4tjx733pKqgJVYCkicPmLJdDoIkkhUlsiO0SUFERoQK+liZFpaFfyBHYABQd5hi4ITYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEw/BQc9OhWtZdx4wzaPbYZYqlYnRfTqRtQ1Jr6B9Zs=;
 b=J6xegk1HEwU5Q+hsjNsSxEaWWaElDPrZrvPRBzk5hJhe7LBRJVa5BmzmXapN9R42ZInvowSpOh0DtpPc85SshiAnQTF/Wem1buEYPIcbuT7GRgcUmUceu27jNBe6axq3XMC5+bUSHyPYDsjWSBWZJhnLO9AnJuC8C0ml5id6t44sGZq6QhA8hdC8MZ9bIsqcnj22h9Y260D0hL3GXQFDgdBywSb6T5rNnYqd8QS+eQRfiKB5Mh/kHL12o9ouUIVE2nIJYA8X/ej8aO+Hr2ueBJhnE8lypBRT66i0MDwl2nDQNAFo8OwuS1NYU5ZBp2Y/k92zOUG6lf3Wda1CwprCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEw/BQc9OhWtZdx4wzaPbYZYqlYnRfTqRtQ1Jr6B9Zs=;
 b=yBPKhMV1qGrDFkQU33wh9xbc4fj2ahqJaTOCydCkU3JqtI/cSgSFa3aXW30Aax2R+V8aKsg4Q+i50BiIb1kFMhpxSxVOJHLU4e8ZYmB9Ty+9SU2jb3VdLbB5Ewmjd7KLBVNmEh4YVmmrU15jo0X1H1AsW8lZNtDYXnobRTZBTwA=
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
Subject: [PATCH v5 01/10] x86: Replace arch-specific boot_module with common one
Date: Tue, 1 Jul 2025 12:56:55 +0200
Message-ID: <20250701105706.86133-2-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701105706.86133-1-agarciav@amd.com>
References: <20250701105706.86133-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|BY5PR12MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e50b65-85e7-4ce0-cf56-08ddb88e0fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Cewx6J3TsSuet0tF97xTE8/fIXxgA6slNveFtpIYo5ABhaYmmpycgx76fhh?=
 =?us-ascii?Q?acYQ5D3bM90sjG5QVWO80h72qZ4TrV+ayhtZ9NkEsDjZ/Gg9JBzyW0ENT9QZ?=
 =?us-ascii?Q?DNURKrlVWNbHChvL6XOZeKK2Wgxqooyd6FWjrCYFvxspSeQuiy8DR6yATkQQ?=
 =?us-ascii?Q?9mAf9s4AWhweOQL8dD2V/kroL7mj9+I9/g/ERFcSqNrqmky7T3O51CozdzR8?=
 =?us-ascii?Q?bN7X0rA5wWLZvz6CyaFs1bKj4RjeBNYzwnoxNM9OSkwNHP+/kZMR23/ofU9h?=
 =?us-ascii?Q?n6ZCCMzFkekvERPOQLTFI0Hp9J2mjeeQM3QarV5XUILw9TmSU5Tlx3Y3Ine6?=
 =?us-ascii?Q?2v9AIthP4Lt7kcCB54j+7PajQd+4zgU/PDduDVS+nK1xTjkxFtE/75QKX+Jy?=
 =?us-ascii?Q?r4crparMJbA3aOAgy0b5J4YNev4m8VgpajyZBITF6r/DBn63TbEq9EON0IeF?=
 =?us-ascii?Q?id+8Ac45YMYh/uQ+pTC634eQcJXdMoWPwyUUuxzHB2coet0xMNS3QKkVXaZS?=
 =?us-ascii?Q?aTLcEdWAH1t3hLefLGNpEtEX04vKM2HBN9y/1Ukx+wSXAL5SatDzGOI//0Xx?=
 =?us-ascii?Q?WJQiinGSIbM+ygkZWvIAmK7PgW8mAGLMu8uORfN6DgtqDqOdN/vGsg5yPZfb?=
 =?us-ascii?Q?dQSY2MjHku2aoF4fDeEqUXgxas9Wx1neyFaJULV5fd3Ut5fjDWHpeC178C57?=
 =?us-ascii?Q?ta1bj9VwWPcd0k0vXeRLbkMYeZNCL8FctBE0OrOV1o8RbmjC4cBu1mrfgKGn?=
 =?us-ascii?Q?R7wtrO75eu+ZIYyRxd2nkl/1wr5KVuV12CfXcEe9UhmPpDHE3/IVizEdu9mI?=
 =?us-ascii?Q?nKfjHiwb3taqPxMDUnv1bIJisFBb82tqU6v2egxQjP2cz0EpdfVDuJFRwVGZ?=
 =?us-ascii?Q?jRm6ku9KNL+ITbeOBP9lkwUAYKj3zBbZG8PZ5Fq+gwcmC+mHL0bVrV+7Z0Up?=
 =?us-ascii?Q?WqsfKuPXvhmbsmwvup+tklutc2uri9qj2CK87KsvP1EGKnWNPfWr7tnXcK0V?=
 =?us-ascii?Q?4NNdpK+eFzcy3jIKe/IAHotr3G2jzvwkWVCr1XH64MdUgAoeZ+U7MO4+CPC6?=
 =?us-ascii?Q?uBJhJrgbkAN6dq5aO/5oH6Grlq2FclAR3Ft6Y4lIavxypd50Ak63hJCSE/LO?=
 =?us-ascii?Q?c6KQzjnRaLVmRt2eVwL7jF4PWajzmZM/YSCP2XG3K/MNCHLHLPEl3kSFL1Op?=
 =?us-ascii?Q?od7rQjixnYQjKRVCjYFDDHAAjwHe4qcq2lo7wXrcUsYf51yDw2l+YskLQEP1?=
 =?us-ascii?Q?ZI0gFP8CgqX1bd6TZeOQ7hHj5SmM9WiyrQxFgULV18ahuAjsWu+oKaNXuY++?=
 =?us-ascii?Q?0GZUV8cr1edBcfXdIaqUkvVOXxrq/PRu1RBPHrJSkqvavn7VM6PRmlqmNQns?=
 =?us-ascii?Q?oBkUUmQlO5EogNkhzNbeea3xYLAvfUjax7LDRGIpttfvyN/AOZa7y6yx2Tnu?=
 =?us-ascii?Q?9ZVeKRx6fF1qgO4o9yWbj13e92iVkUy092XvnFBMjNMQRpSq50qSgi09zWGj?=
 =?us-ascii?Q?Nsmm/OzboLC79aOWjHSF5d/fEBve3FqHf0H2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:57:24.6067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e50b65-85e7-4ce0-cf56-08ddb88e0fcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4145

These types resemble each other very closely in layout and intent,
and with "struct boot_module" already in common code it makes perfect
sense to merge them. In order to do so, add an arch-specific area for
x86-specific tidbits, and rename identical fields with conflicting
names.

No functional change intended.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/cpu/microcode/core.c   |  7 ++--
 xen/arch/x86/hvm/dom0_build.c       |  6 ++--
 xen/arch/x86/include/asm/bootfdt.h  | 50 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h | 56 +++--------------------------
 xen/arch/x86/pv/dom0_build.c        |  4 +--
 xen/arch/x86/setup.c                | 43 +++++++++++-----------
 xen/include/xen/bootfdt.h           |  8 +++++
 xen/xsm/xsm_policy.c                |  2 +-
 8 files changed, 93 insertions(+), 83 deletions(-)
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
index a038e58c11..2bb8ef355c 100644
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
index 24e4f5ac7f..7e70b46332 100644
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
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 236b456dd2..854e7f1ed9 100644
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
@@ -108,6 +112,10 @@ struct boot_module {
     bool domU;
     paddr_t start;
     paddr_t size;
+
+#if __has_include(<asm/bootfdt.h>)
+    struct arch_boot_module arch;
+#endif
 };
 
 /* DT_MAX_NAME is the node name max length according the DT spec */
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 1f88b4fc5a..1b4030edb4 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -53,7 +53,7 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            bm->type = BOOTMOD_XSM_POLICY;
+            bm->kind = BOOTMOD_XSM;
             break;
 
         }
-- 
2.43.0


