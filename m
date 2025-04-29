Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CBEAA0BCA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972351.1360733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kCw-0008GY-AK; Tue, 29 Apr 2025 12:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972351.1360733; Tue, 29 Apr 2025 12:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kCw-0008DR-71; Tue, 29 Apr 2025 12:37:06 +0000
Received: by outflank-mailman (input) for mailman id 972351;
 Tue, 29 Apr 2025 12:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kCu-0007L9-J3
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2418::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a523b03c-24f6-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:37:01 +0200 (CEST)
Received: from BL1PR13CA0318.namprd13.prod.outlook.com (2603:10b6:208:2c1::23)
 by PH7PR12MB9150.namprd12.prod.outlook.com (2603:10b6:510:2eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 12:36:57 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::22) by BL1PR13CA0318.outlook.office365.com
 (2603:10b6:208:2c1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Tue,
 29 Apr 2025 12:36:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:36:57 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:36:51 -0500
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
X-Inumbo-ID: a523b03c-24f6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gclvPge5z79WCmTbvkkXjEvOiONJvxGOZxW9WnK8WK8Q4OWgfEB1RjQ5X9PA5en5onxt9BtcdTtEQST59VyWjNA7u+CeRnrwzuTXg/W4deIQ2oNOM6BQYpYi+wa90j5cWGwKz803wkodu0CvI6NPeYEmuOvNedlaKBfupayDzomW5eGo/H3TELjV5FYlLarBEWKCDcOhA1KLpoDjLGgZkpaLRh1wyCkOf2i47tM9SLW2YKoCV3nrBLbxb0U+OGUtn8fmwDMHCOMmakqWW43zN7QSRZlRwjhFC7I28CZtn3gikZ5UlupeINRhGO5D/2vn1HTnTEzlIOwuOFS1yKf5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5SS7pgcQrdIr//vyH9w44IWF1ZtlLdCSEKlz/+agP0=;
 b=HmqMG9WAT1eo8/uuuGqJIIWnCZzSs16YINWr3Bj0LuNH+8MpXM/ygmGWUGGIyxBw55jhlNOYv43d2y1hNVVjc5ROG2/fHohZD6/I/DDmrhRlzC3RP4/ej6+ZjEMpCw5fXQzn3M+cg//EDislVDe20y3vQY4rHKqTAi+4ED0WSZa+muasvF9dEK/AOvIpvsPWR0IhQqP8/QRv/pPjpnrMqfFVcRxP82VCsceTubGzlC3sK7tCGIJ6mAdlDIhzilubsNDTHBOIwjSlH+we/nn/uHXSw78OdAPETuoaSU4GOHdWlnoTCIDkVsdQYKgm7oFpv6qJk+XloloOiTjJijenGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5SS7pgcQrdIr//vyH9w44IWF1ZtlLdCSEKlz/+agP0=;
 b=t1KNDnAvQFxXUUm1Y26D2xVWyps4vltqgjyglFIM74obuKCT+QzLfciznDgxarDzZDuF7b/fZFpNlE3oibImTQQZyg94rshGvA8ruZO90M/1PuTF+2ryOXLT3nsLm35aWJfJ6YsyJyN1StwRc7/mXZ1qWsAVVUnCIIPJn0St/no=
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
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>,
	"Denis Mukhin" <dmukhin@ford.com>
Subject: [PATCH v6 02/12] common/hyperlaunch: introduce the domain builder
Date: Tue, 29 Apr 2025 13:36:13 +0100
Message-ID: <20250429123629.20839-3-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429123629.20839-1-agarciav@amd.com>
References: <20250429123629.20839-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH7PR12MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: e1411532-8015-4d3c-c413-08dd871a87db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rrLs3QveamfIW0dE/u0KRMp6gVYG+zVhUGmc+Pd+MdhAutfj71XvmCVuvOwB?=
 =?us-ascii?Q?klNGkZJxnZkoh0iea/qFnfQdZmPIu9MGEXawejYNhbzi18FLwsSF/bngdQjx?=
 =?us-ascii?Q?BzSc549VwBJsFmN/ecKvD+nUjYc4bK5oyQkk43/oXQJXWE21t2026JCnhHsq?=
 =?us-ascii?Q?J9AIR/WDwpXdIahDe6C/q4pp/rW2CCUjTPYLd9WB4p8TLi6saBvFTIHZEIe5?=
 =?us-ascii?Q?BoUL3tbV9LGeO2iW8jWy17Useo+JX/LcAMxRz9nM1j1c3Jj7lNhkqh8AB9Gu?=
 =?us-ascii?Q?W3ypPs+TOGzsRWYb8Y4yGobC0rRRRV8ACO4zw6iDREpYqOsG/D0ekUgckSuK?=
 =?us-ascii?Q?Jjb3QEs85mSBLtBnmNgJytFC25L4g8B/fj/TA9+cR5BKtKCew3qgmhbldYmk?=
 =?us-ascii?Q?PjmyvLRf5K/J4RMG/liFtolyCbgRWAmD4dsMWhFSP0nSe8Co7su6I3zySqfD?=
 =?us-ascii?Q?B3AgyxkCIkJVaMnkCyIb7P6WWHJWgYqbewYNgS+/QgzBKnSVGn5iPQ3b02zV?=
 =?us-ascii?Q?L5PNP574GeTGpSQUWyS7oR2Jp66zOVDSdT8n9ZDIpmjFvF2PEadmp1mJS5pI?=
 =?us-ascii?Q?fdtFuoZhGIfieYOHfJqHWn32BbpQLnt31wJMwsazNvtNeQLymJMqVDZEciaI?=
 =?us-ascii?Q?k5EpRUjjx3dvyciQJgYK55YnWTWqTRoUPES8rscgRj7974wc8hvFOC6T+Zty?=
 =?us-ascii?Q?uUdg+7mMi0Vk5seQzA2fOa/ZzsT9pVSHK47EQdI8rcZ1DPRpqCUxc4o7jva2?=
 =?us-ascii?Q?0t3iL/mFBsWvS2OgxuEvueeme0a79QdEnzGX6ujfBT6glpFe2lXmbhKJD3zr?=
 =?us-ascii?Q?dZjpC/GHNT+1aFN4FoZuJJ/eMjluahKjS7nxDVzRLui1N7VPUMRtXcpTsErz?=
 =?us-ascii?Q?NqoHiX6UOjeFTahS7VAvRMcZ8gRsfMjxqUnVLkn9O0br+FTGk028RTvrpP9E?=
 =?us-ascii?Q?iDcKBPS90//UsM3oTPTA1j/sJtgDD6D7BV6mZq2hAQtyNe2PITwXWKR4o+dp?=
 =?us-ascii?Q?Lr8T32QF8CD8IUvA5T3ScsQiRwZ6ArCPxYUXgnU2w2KD6qq0YZ0p41z4x8p1?=
 =?us-ascii?Q?u8GEj6PTGny2LXkza1cqBRYJ8Zn+7qy2obPevkWnBVUSBDotKOHe79YQYb/K?=
 =?us-ascii?Q?sroq1D/wv9NHdWMFu4+XvXJricwiDQWm2VxCUgM0drxO9CTQBFMtb2BVOu8k?=
 =?us-ascii?Q?YY/JOs/4woG02hboMPr1aZ+aRRnmOfdNk9805AB8pICdtQqyYPq0GguNF4M3?=
 =?us-ascii?Q?f412tahuYhS6TI08tLFL0xEt6KPrWh6rjsfONkKHYOexf1i4hUCUcl8OcokC?=
 =?us-ascii?Q?mUsSbEbDADL0t4fPWW+qDa/DYFzFXPU7YMwIPrdG/ucehm429zYk4mm6IiK0?=
 =?us-ascii?Q?IWP7t4pu1jUpzEFqEr2XXmOjjNnpX468sUxhNo9gfjcwDBEtzPjEjeD6IOJe?=
 =?us-ascii?Q?3ADzrjNINjZ+oxeywZx0SdmXSV3EdfLZ51WqnxqAcab3Ll2MsLnapkIsNEiy?=
 =?us-ascii?Q?8c42f77TnGc2QEdpCzMXhGnNJ0jRDzntFJIK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:36:57.4253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1411532-8015-4d3c-c413-08dd871a87db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9150

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
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
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
index 2518954124..f3b5c83a3c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -6,6 +6,7 @@
 #include <xen/cpuidle.h>
 #include <xen/dmi.h>
 #include <xen/domain.h>
+#include <xen/domain-builder.h>
 #include <xen/domain_page.h>
 #include <xen/efi.h>
 #include <xen/err.h>
@@ -1284,9 +1285,14 @@ void asmlinkage __init noreturn __start_xen(void)
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
@@ -1469,8 +1475,9 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->mods[0].headroom =
-        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
+    bi->domains[0].kernel->headroom =
+        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
+                         bi->domains[0].kernel->size);
     bootstrap_unmap();
 
 #ifndef highmem_start
@@ -1594,7 +1601,7 @@ void asmlinkage __init noreturn __start_xen(void)
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
index 0000000000..97c92db571
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
+    switch ( (kind = fdt_detect_kind(bi)) )
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
index 0000000000..4b07bd22c8
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
+enum fdt_kind __init fdt_detect_kind(const struct boot_info *bi)
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
index 0000000000..ef897fc412
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
+enum fdt_kind fdt_detect_kind(const struct boot_info *bi);
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


