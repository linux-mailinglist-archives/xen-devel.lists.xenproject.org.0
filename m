Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C5A9B384
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966533.1356737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAC-0002YD-Bw; Thu, 24 Apr 2025 16:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966533.1356737; Thu, 24 Apr 2025 16:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAC-0002VQ-8l; Thu, 24 Apr 2025 16:11:00 +0000
Received: by outflank-mailman (input) for mailman id 966533;
 Thu, 24 Apr 2025 16:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAA-0001nN-Cp
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:10:58 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2414::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b395bc8c-2126-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 18:10:56 +0200 (CEST)
Received: from BYAPR21CA0029.namprd21.prod.outlook.com (2603:10b6:a03:114::39)
 by CH3PR12MB8355.namprd12.prod.outlook.com (2603:10b6:610:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 16:10:48 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::b) by BYAPR21CA0029.outlook.office365.com
 (2603:10b6:a03:114::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.6 via Frontend Transport; Thu,
 24 Apr 2025 16:10:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:10:47 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:10:44 -0500
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
X-Inumbo-ID: b395bc8c-2126-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpAkOr/tCXZIEbzKsKJOE8TEtQV59Sj7VyF2S/8byEhjg6DHBIfhRuSFeR7w6Jym2TQLfRuXawwdNnvQ9gOHMqIDoqugs/XLc2r6gCcgbb881Qw7hep71pnPIy5DN6QTMkQgXtccoYfgFl9vbZBQ37LPBTawqY15rbfl4LGybd3RBvIzbndiS9YWxGNGyNAiyLkX/18xcEsg8GVsAsS5aCc3gF/j1W1c1PEAX+K/4Nz6QPiURQj1OGID2Vw/K1xn1zqfmaLA4nUzwGowc+FGkNz1UJaYPl/l9nSDJA3tyJUFO4N2MbdMuj7ZRvKlEF/uXJB0SbsUA6AevgXazvG7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de7GYhFNLaKxmeIKJByEJNI5+c/cE+47MXdYWvs3Q/Y=;
 b=wa3oYDsDRoidpHZ8hDBlt7W/NGDWVvmqD7WyqMCMKOIdL/fzzQpDige+nox1VrDE2xvqSDWEFSkUHmVdE3Q3N172nMDDc/sroNhvSaq6W++gVWxfC+Hit8CyEvSrVL+JGH5Q4q8pNnTOgWGkbaZ2Ux7TznDItcXpm78Ui39q4gR6bGIXgbSKOec4E4O0zyfx5YJEUTfT3v3P+gl26m3KB06hMtU2n22wt7JR7IrCWjMLprw/y3CY3HOD92TSRCDFJF1i3wpQ7xpjhQqlSvxsbNKX95P1EPaEcPC0Y9JHNTzbwu41trXGNkAIoaPhx7hSSRGnwMDaR3iQomkAp+vbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de7GYhFNLaKxmeIKJByEJNI5+c/cE+47MXdYWvs3Q/Y=;
 b=FWk1oBD6ROYjUdtA2jdHh0Er5kp9Rei74kXbHCCswOd7vAII/k55DklD/aD6dnm2I7rO7KXHvL7JF9Vptad0g3L0lvl8BrIusktm+zSO8F6npHECvPouiCkurEJzc8WBmKBQY13NbIlkpPIweqfWTVGrTfT8DlAA0tXYssXI5gw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v5 02/12] common/hyperlaunch: introduce the domain builder
Date: Thu, 24 Apr 2025 17:10:12 +0100
Message-ID: <20250424161027.92942-3-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424161027.92942-1-agarciav@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: afc21d88-8450-405d-1d71-08dd834a9369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sLLnrIsfZVZGc/ZNRAEor1KoP3FQJQC5NvaVYJiE0Nmo2VhGMMhx9T4Dohjb?=
 =?us-ascii?Q?4NBIhyP/B5xYIOIb9Fo0vCb7hdXnLS5h4KZLubmXuwAU9aAVnNajsoPsOLYu?=
 =?us-ascii?Q?7Jvmen7g+9LFyJ/6FJCJEOIY6HQtpWcBM3x+JDYGJX8yNyQ1FgFJpOFRmyu2?=
 =?us-ascii?Q?mhkJTNnnWvJ9G7N+/HwpBkZyfzggL+GYy1W5SGlkC7/z69BsvImGfIL2K4ns?=
 =?us-ascii?Q?5Cub/ZM1yJM5gn9mGz/LtyuFJMYsj4zp3HGJi6aM2Ybh8Ah0j+Zg4nhdU9ab?=
 =?us-ascii?Q?6HofHj6xHHe0gi3yYH6irHyNQMvlgAJAH/7n5JCPQzlqQLUGidNzh0ajt1mT?=
 =?us-ascii?Q?07KanlkPDw6fdRHvXYKn+LxUysYhlT+NgktTEW6y/U2RsD3dGX4yl5zuwlvl?=
 =?us-ascii?Q?3QxC1mDctNxZhuST8ph4OfRmRriwi729V6cJVCe0fO9NV95WQ8R9kKMtrClx?=
 =?us-ascii?Q?5aLW/wDPM1qmwXAsuj5nSGFr1Hd3s66YSsKmVjC4M0RQZ49H3Kv31TIF/KpN?=
 =?us-ascii?Q?/Z2KnziHlUMfITByamrYze1cwDUo6N6n7yugTuZOR5QO1eE1x0QhIFiTdA45?=
 =?us-ascii?Q?upiS2eFwHcO3neACWz+gAeyLCezG4VxgxHehjwz8LVJfkAlEdtQ6giF+IvR5?=
 =?us-ascii?Q?Mp87eYX8U0ZySrMAeMMMCw7ll+uIWP7n3foi8osffkcgQEcCEc2aAEQGbBcA?=
 =?us-ascii?Q?nuo0VtkTAQwqBKblwLSLBE++H/PV2iu0cC6m2DoCbBGSMgARx6EBSDG6tpJp?=
 =?us-ascii?Q?4xyS/taZYqWTjwIDf2BP/xudD+QPo3r3cZIfEUMsvXy56btvrrJr3WAuqa7h?=
 =?us-ascii?Q?c3XEyDA7c9GmeWnPVSzoHQ93Dc98nOV2BnEpfIA9EZZiEdhkS2Yj8d9rN/1I?=
 =?us-ascii?Q?sQPvOVIbjnLMjNJQn6hfJW9Fq0KkuVZoCkrLUdXWLtK6aA4SGm22tR9nOZHN?=
 =?us-ascii?Q?cGwqjgc3TIi+GveigvFz3K0kHfzVIabDNaj/UQ8Bgx+rv+w6G0ckevnhvBeu?=
 =?us-ascii?Q?JkwP22nbYfLu8G9kp28sJcs0aQJyJCU1DduLOLlV98v8OjwnYMyR9Lwlmh7M?=
 =?us-ascii?Q?j53ahL8zN+5210yQfXAhEDV7gcDg0uloA/x2purWuY4EDUWrtGHcRkfBr3i2?=
 =?us-ascii?Q?iS0Z1yxq0pEWEzQJ3Sk4UNV4mYyK6d4KuTBWr2Rrlf9ZXZF6+Kqj8iBGVJ2d?=
 =?us-ascii?Q?QJuVL3ZFAFkS+EQjE01TlfS1+mRwBDwxLaI4TYjR0TVhlfcARlG0ioiR7fwu?=
 =?us-ascii?Q?CabDVTZ419LGzJnzLCmnA6PnPmGSYNTqjb7gAE8IgXFc/ueUeh7Nt4iBqwi8?=
 =?us-ascii?Q?ZhLJl+atXna3HzNmQyQIxLcwK8sKtBWVCfBklFjtsrsqDBN2WyjFO4PMqhQJ?=
 =?us-ascii?Q?hsloc2havhSqBPZeShNoEULN97/e+g3IpQIC3RnuJgJfJqeBmbbQf4vckYSa?=
 =?us-ascii?Q?3Igoi/f6d1qRycvy32ic8xwxtTuttA6IsThHxIjsvLsoZD9hb/CO9CqI0H5P?=
 =?us-ascii?Q?k/B6iX9JMD1MW7ls0V94MTP4anxjbLOm6azS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:10:47.9030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc21d88-8450-405d-1d71-08dd834a9369
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the domain builder which is capable of consuming a device tree as the
first boot module. If it finds a device tree as the first boot module, it will
set its type to BOOTMOD_FDT. This change only detects the boot module and
continues to boot with slight change to the boot convention that the dom0
kernel is no longer first boot module but is the second.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * Decoupled core.c from !CONFIG_DOMAIN_BUILDER
  * builder_init() now returns an enumerated type of the kind of FDT it
    found. If no FDT is found, then initialisation happens inline in
    setup.c
  * Refactored the switch in core.c to operate on an enumerated type instead
     * This has knock-on effects on the helper
  * Moved hyperlaunch detection path to the following patch
---
 xen/arch/x86/include/asm/bootinfo.h |  3 ++
 xen/arch/x86/setup.c                | 19 ++++++++----
 xen/common/Makefile                 |  1 +
 xen/common/domain-builder/Makefile  |  2 ++
 xen/common/domain-builder/core.c    | 45 +++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.c     | 39 +++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h     | 14 +++++++++
 xen/include/xen/domain-builder.h    | 29 +++++++++++++++++++
 8 files changed, 146 insertions(+), 6 deletions(-)
 create mode 100644 xen/common/domain-builder/Makefile
 create mode 100644 xen/common/domain-builder/core.c
 create mode 100644 xen/common/domain-builder/fdt.c
 create mode 100644 xen/common/domain-builder/fdt.h
 create mode 100644 xen/include/xen/domain-builder.h

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 3afc214c17..82c2650fcf 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -27,6 +27,7 @@ enum bootmod_type {
     BOOTMOD_RAMDISK,
     BOOTMOD_MICROCODE,
     BOOTMOD_XSM_POLICY,
+    BOOTMOD_FDT,
 };
 
 struct boot_module {
@@ -80,6 +81,8 @@ struct boot_info {
     paddr_t memmap_addr;
     size_t memmap_length;
 
+    bool hyperlaunch_enabled;
+
     unsigned int nr_modules;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
     struct boot_domain domains[MAX_NR_BOOTDOMS];
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index cf1ea040dd..bd13d9d196 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -5,6 +5,7 @@
 #include <xen/cpuidle.h>
 #include <xen/dmi.h>
 #include <xen/domain.h>
+#include <xen/domain-builder.h>
 #include <xen/domain_page.h>
 #include <xen/efi.h>
 #include <xen/err.h>
@@ -1283,9 +1284,14 @@ void asmlinkage __init noreturn __start_xen(void)
                bi->nr_modules);
     }
 
-    /* Dom0 kernel is always first */
-    bi->mods[0].type = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[0];
+    if ( builder_init(bi) == FDT_KIND_NONE )
+    {
+        /* Find first unknown boot module to use as dom0 kernel */
+        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+        bi->mods[i].type = BOOTMOD_KERNEL;
+        bi->domains[0].kernel = &bi->mods[i];
+        bi->hyperlaunch_enabled = false;
+    }
 
     if ( pvh_boot )
     {
@@ -1468,8 +1474,9 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->mods[0].headroom =
-        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
+    bi->domains[0].kernel->headroom =
+        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
+                         bi->domains[0].kernel->size);
     bootstrap_unmap();
 
 #ifndef highmem_start
@@ -1593,7 +1600,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
+    if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..e42af71e3f 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-$(CONFIG_DOMAIN_BUILDER) += domain-builder/
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
diff --git a/xen/common/domain-builder/Makefile b/xen/common/domain-builder/Makefile
new file mode 100644
index 0000000000..bfd2f6267e
--- /dev/null
+++ b/xen/common/domain-builder/Makefile
@@ -0,0 +1,2 @@
+obj-y += fdt.init.o
+obj-y += core.init.o
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
new file mode 100644
index 0000000000..fdc13aee40
--- /dev/null
+++ b/xen/common/domain-builder/core.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, Apertus Solutions, LLC
+ */
+#include <xen/bug.h>
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/kconfig.h>
+#include <xen/domain-builder.h>
+#include <xen/lib.h>
+
+#include <asm/bootinfo.h>
+
+#include "fdt.h"
+
+enum fdt_kind __init builder_init(struct boot_info *bi)
+{
+    enum fdt_kind kind;
+
+    bi->hyperlaunch_enabled = false;
+    switch ( (kind = detect_fdt_kind(bi)) )
+    {
+    case FDT_KIND_NONE:
+        /* No DT found */
+        return kind;
+
+    case FDT_KIND_UNKNOWN:
+        printk(XENLOG_DEBUG "DT found: non-hyperlaunch\n");
+        bi->mods[0].type = BOOTMOD_FDT;
+        return kind;
+
+    default:
+        BUG();
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
new file mode 100644
index 0000000000..708dcfcbe8
--- /dev/null
+++ b/xen/common/domain-builder/fdt.c
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, Apertus Solutions, LLC
+ */
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+
+#include <asm/bootinfo.h>
+#include <asm/page.h>
+#include <asm/setup.h>
+
+#include "fdt.h"
+
+enum fdt_kind __init detect_fdt_kind(const struct boot_info *bi)
+{
+    enum fdt_kind kind;
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    if ( !fdt || fdt_check_header(fdt) < 0 )
+        kind = FDT_KIND_NONE;
+    else
+        kind = FDT_KIND_UNKNOWN;
+
+    bootstrap_unmap();
+
+    return kind;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
new file mode 100644
index 0000000000..ed9c62631c
--- /dev/null
+++ b/xen/common/domain-builder/fdt.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_DOMAIN_BUILDER_FDT_H__
+#define __XEN_DOMAIN_BUILDER_FDT_H__
+
+#include <xen/domain-builder.h>
+
+struct boot_info;
+
+/* hyperlaunch fdt is required to be module 0 */
+#define HYPERLAUNCH_MODULE_IDX 0
+
+enum fdt_kind detect_fdt_kind(const struct boot_info *bi);
+
+#endif /* __XEN_DOMAIN_BUILDER_FDT_H__ */
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
new file mode 100644
index 0000000000..b9702db735
--- /dev/null
+++ b/xen/include/xen/domain-builder.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_DOMAIN_BUILDER_H__
+#define __XEN_DOMAIN_BUILDER_H__
+
+struct boot_info;
+
+/* Return status of builder_init(). Shows which boot mechanism was detected */
+enum fdt_kind
+{
+    /* FDT not found. Skipped builder. */
+    FDT_KIND_NONE,
+    /* Found an FDT that wasn't hyperlaunch. */
+    FDT_KIND_UNKNOWN,
+};
+
+/*
+ * Initialises `bi` if it detects a compatible FDT. Otherwise returns
+ * FDT_KIND_NONE and leaves initialisation up to the caller.
+ */
+#if IS_ENABLED(CONFIG_DOMAIN_BUILDER)
+enum fdt_kind builder_init(struct boot_info *bi);
+#else
+static inline enum fdt_kind builder_init(struct boot_info *bi)
+{
+    return FDT_KIND_NONE;
+}
+#endif /* !IS_ENABLED(CONFIG_DOMAIN_BUILDER) */
+
+#endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.43.0


