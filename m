Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34715AE222F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021083.1397146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgV8-00071r-Hv; Fri, 20 Jun 2025 18:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021083.1397146; Fri, 20 Jun 2025 18:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgV8-000705-EF; Fri, 20 Jun 2025 18:30:10 +0000
Received: by outflank-mailman (input) for mailman id 1021083;
 Fri, 20 Jun 2025 18:30:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgV6-000575-Df
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:30:08 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95dd5fe3-4e04-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 20:30:06 +0200 (CEST)
Received: from BN9P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::30)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Fri, 20 Jun
 2025 18:30:01 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::d0) by BN9P220CA0025.outlook.office365.com
 (2603:10b6:408:13e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:30:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:30:01 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:29:53 -0500
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
X-Inumbo-ID: 95dd5fe3-4e04-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTRGKuLA8nGR+TJdFyb+LASmshns7tAbneqgXtmoFFDRWCPjKs+lwEWeTJrE4q+rwecsghkOsbEdZ93d0iB9H7fAb3UbmFxinmXokZXxi0NbkHenVIaW8lSs7Smc2RKUuEvC1a4R6pHBqaNkeWLp5C6V6wJkg7tHfmMOHCEeSEDkPLC/pDRi4VIc9L/FT1w6D+xojTE5T/vlhmGabqljjxKcVMflNgpGQ1sYVbBYFo/bkosZfxm9wvVlMfu15Ax2V8lSXVAc37agE1C/5+3RDeRST113LLH5LiHWKjhdcBhKUSO6sCtGX8RTplVnPVrdP+bjWgjZn2o6B82Uc8vcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJP/7zFzGccQJ1DD4IZ+lMNNJUGQ+1vPwz1sxHunn6s=;
 b=R+MS2htwA7ktuplGmMEsz5Czs1k3/ZiNOjsSa3hjMrmT/6ke1bz7GKzdCo2GPWDq4F6VPD6LUSOENLsD8vgRwf0PhEF3ySV9VqqFIj+OESpUcaD6TAOKvTMxcb+YVB5MI3v8WKC0o4yoHJWkywHBmVKZEtOC2Pdx15olEuw4v8gIjeA9dU7U6jRl1lX+u62zeyVRLpU4/K8YiSSFJv2U9Ce4IPtmaSB3jZpVezx5OfDQgZOIxO85KbYpOfz30NVQODvOrmMrMMBbWCULAPs2CLsLZ5+T7nes4HJKjWwWZwpRL8GU5mef2Qw+js5UnWDl8O/wyHPI2CdtcWP5Wwyqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJP/7zFzGccQJ1DD4IZ+lMNNJUGQ+1vPwz1sxHunn6s=;
 b=isOpt0ZU4dINwrGb19QntkP0bIJwxcOLKRP0bSDfSpilzMnx1zsxQ7BOsXXhq/Ac3CxpPIe66La9SL0tqnwRCb0mnplJImz/KGNOH/jshQV2An7y9nqPu8J6nIprHaeI3LPi9oVxOywnZWRR8EbRXHoii47mkvij8ovMMdUnpXc=
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
Subject: [PATCH v4 03/12] x86: Replace arch-specific boot_module with common one
Date: Fri, 20 Jun 2025 20:28:49 +0200
Message-ID: <20250620182859.23378-4-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620182859.23378-1-agarciav@amd.com>
References: <20250620182859.23378-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 93289895-068c-4a1c-f5ce-08ddb028782e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?88fty3px2g/A3fcoUS2CTQQtrm8hGnakXUYvd2/fHfEWu01vY0BrqqTMXzW2?=
 =?us-ascii?Q?EEVYJBVhxzz1nHyY2LJNYUaS/Q4YQsWTTlr7FbQ/dhjPNu2zCruN2/2g68QU?=
 =?us-ascii?Q?IkohVM0ZHVsWBlRIf5WZNdN8THj/IeMAv5PhOOejZDi/JTGcKdVzeOEmyd/u?=
 =?us-ascii?Q?eL5vGhqkN0oI3BwN6VIO9K8c3kDI+xrlJKedteYYstxkDQaDy+GQIoHBJukM?=
 =?us-ascii?Q?J17aguOv6MOCEDtNKurWhUlU+llH5LoVZmHd1MoMVO3i5UNEOhb49jlJ+/Gn?=
 =?us-ascii?Q?c2lOpQAefwCJYJg9Ab6IOwTSR2etHhagRFYMzV8F+oFucZrI1Yi6RixWE1+e?=
 =?us-ascii?Q?XeUuc6lqvkxmYVE8aCrFRPjFNYurgFQ3g3CFsvmc+SHBkbDtruJ3nvrca4He?=
 =?us-ascii?Q?qJzFSk+EYQFAReH8CBJ+XiQjv+hoq//jhHvqkxUO940N9R5oiqZPU2hxQ4gc?=
 =?us-ascii?Q?WjqU4jphH6EMxHLBIKO0fwAkWSKHRDC9RD1FL57kvg+PGlKN8Q09Va8UN/aY?=
 =?us-ascii?Q?q/jCsbBB1z54J5b7sMAJTd9Tv3wMWKQEznF68X/A8J9CMiXJYX3iIZ7kmJ98?=
 =?us-ascii?Q?zr97mPHARrbzXNRIkMdJEuBkZzt9bLEjg/ysvBKvuIYHlJ3O2zImLneLoJZv?=
 =?us-ascii?Q?POscwEeE41LhlZSCgS+yx8kmMoYnR1bU2m43afSZil8KC8YqkYUWvibpqa5T?=
 =?us-ascii?Q?RI+FIvvqkfJZZWF624/dXogAAsdd1KBGbhsv8Gnvmtqi1/Es/7zLfVyVXJIQ?=
 =?us-ascii?Q?Fp0HIUMsn3nIjnX6s6VTvPWTk0Mm2uggQwSA2pGVR55kMixjlbXCU6QObWWs?=
 =?us-ascii?Q?ZAOM1ybXBTOwRaHLg+/V5Ou1yaAsj2198sckglHSEqYPxY4L/JpquB3WEOpK?=
 =?us-ascii?Q?2iiSNp2WZe4GcXBC7nKV1SGMb2YBpv2AEVR7Fu6tHJhHd6i92b3lWrScltBw?=
 =?us-ascii?Q?4yYremGVhSNlOlH7TIZb8sIrYTYuvhQmQvMO+tKReqIueOIZs4qZL93k4TYU?=
 =?us-ascii?Q?oQPvnJ5Cb1tCnQOqL1qMDr0N83ujQbV9mHbCJW6YwaoQ8EkHHwAqkZ/puZrq?=
 =?us-ascii?Q?Z9r68z4D7OkX637D5YKa5K6IGI2Ay+pcipXKcneDWEDk9bD+F2uUhwWcK5ZL?=
 =?us-ascii?Q?YH9YGLq+0GvfL9Oo3xYwEtvUL4kRQ8OrLDBSu0iYcY9cF8D2SBOVes+ghD5T?=
 =?us-ascii?Q?xH8f+AtS07/jiz+qrJxvdzkf07bOOLnwXAUQkA0MUFgITpI5+zEXuao/vuJf?=
 =?us-ascii?Q?EkZ2zjK5sNWaL2fAPfu5Ix3ET8dUqDusgdy9EZ9W1cRhnvum+7MJqvANNRlc?=
 =?us-ascii?Q?QhJm52mggg0IqRBABJuuNxdNQ+mLglc+PfvmkItjnldTa18dOqIqQ5qY7VOk?=
 =?us-ascii?Q?LwGKWV7B4NlNt7UwHvdOq796StTLMDw5uxz4QSHka9g738di0rQ8cvkkJyn+?=
 =?us-ascii?Q?9FQxDXRZ0J7X4btqYTKnJzgTaAL5xdTH8VgYsRyZPuQXUz+D+txPchOs/kgP?=
 =?us-ascii?Q?++C6TTYUMWG8iZlXyXQsCzjloMJmBsuXzXWA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:30:01.7572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93289895-068c-4a1c-f5ce-08ddb028782e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955

These types resemble each other very closely in layout and intent,
and with "struct boot_module" already in common code it makes perfect
sense to merge them. In order to do so, add an arch-specific area for
x86-specific tidbits, and rename identical fields with conflicting
names.

No functional change intended.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
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
index f32efa7c60..4f34bbe688 100644
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
@@ -1062,9 +1062,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
@@ -1086,7 +1087,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             strlcat(cmdline, " acpi=", cmdline_size);
             strlcat(cmdline, acpi_param, cmdline_size);
         }
-        bd->kernel->cmdline_pa = 0;
+        bd->kernel->arch.cmdline_pa = 0;
         bd->cmdline = cmdline;
     }
 
@@ -1299,7 +1300,7 @@ void asmlinkage __init noreturn __start_xen(void)
     }
 
     /* Dom0 kernel is always first */
-    bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->mods[0].kind = BOOTMOD_KERNEL;
     bi->domains[0].kernel = &bi->mods[0];
 
     if ( pvh_boot )
@@ -1483,7 +1484,7 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->mods[0].headroom =
+    bi->mods[0].arch.headroom =
         bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
     bootstrap_unmap();
 
@@ -1565,9 +1566,9 @@ void asmlinkage __init noreturn __start_xen(void)
         for ( j = bi->nr_modules - 1; j >= 0; j-- )
         {
             struct boot_module *bm = &bi->mods[j];
-            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
+            unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
 
-            if ( bm->relocated )
+            if ( bm->arch.relocated )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1577,12 +1578,12 @@ void asmlinkage __init noreturn __start_xen(void)
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
 
@@ -1608,7 +1609,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
+    if ( bi->mods[0].arch.headroom && !bi->mods[0].arch.relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
@@ -2166,7 +2167,7 @@ void asmlinkage __init noreturn __start_xen(void)
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


