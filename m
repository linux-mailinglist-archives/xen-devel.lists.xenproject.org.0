Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CC8A91CD1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957515.1350654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgH-0005zn-IQ; Thu, 17 Apr 2025 12:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957515.1350654; Thu, 17 Apr 2025 12:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgH-0005wm-ES; Thu, 17 Apr 2025 12:49:25 +0000
Received: by outflank-mailman (input) for mailman id 957515;
 Thu, 17 Apr 2025 12:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgF-00057t-JK
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2418::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 615e353b-1b8a-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 14:49:21 +0200 (CEST)
Received: from CH2PR05CA0059.namprd05.prod.outlook.com (2603:10b6:610:38::36)
 by BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 12:49:15 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::2) by CH2PR05CA0059.outlook.office365.com
 (2603:10b6:610:38::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Thu,
 17 Apr 2025 12:49:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:14 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:12 -0500
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
X-Inumbo-ID: 615e353b-1b8a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhuwYUafuAg8n8vKjCJYj3+zk4JItuql8wmU1HqjmshC7Tc6jcGKehTP8xaXc1FdRo8SzwKEXcDnyb6gg0Wcu3LBKLcFbLPmpKZKQnZlM3pMUPIbaY/oxRzFufXSo3Vuz2IV69OBHDUzFwDbSCAsnlyAm7rPDZJcOfJnZu16sVJVg9INKbVL4ICEzL4eZUPlEMdGLGqD+NF2e9oHCSsv/XM0gKJSEXgSOIfmhGweuX/D5/mHLDY6By5F1K7wCrymsXMBM9nZBY3BPWr2fszGW7kZOntIZVZPvGBjwGA6b6qS/7J3EciwYmfop0Fywt+e44dSnormBSXLMoJm78tldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OzobPr3TBqZbXRrQpQfQGC91ytT7XjCeEU/jQgkGLk=;
 b=q9wohMIuj3FPb2dU2auj7+qFUwIWVkBayF1Wt3jjKHvydGRPBjX8ha7lApHg26z2PsvCKDG9udF5ED8+YdwyzX3XWU5McdTzTs+6FgJkylA1UmvhaCqYVavX0Dn49ajgDNoqRzMEbofhQ1a/BLpNlPj6QgT2s6CH3PI/nzvccek10OK3i4VCYaWEASR8C1Pz1LVNpgqzuwWx3UR9TKWCvtZcPgL4IacjbkWMEyTU4p0FTQVVFy6vSy1VQSQDisteM/vcd1aPL/qPD8GiPsecIy9QZy/4NREZ3cfAC4YZq9ZA4ypu0IlsCq81aopJ24WG4Z5wOQfOCBUhBVBHBKrORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OzobPr3TBqZbXRrQpQfQGC91ytT7XjCeEU/jQgkGLk=;
 b=ZAfmZeDUO4TGTGP/mPET409+nWohJzl4oKJbYWu6rtMS/umvbIdvb61Anw/1k2t+sRocl/so7iyhzzkSd+tauNlrgJDlKIkdtm0oNZWyQSbY3rfbpYvIMx/ilNE9REgYSE65c5qY4bYC3rN3SXcZ5sUACzohahpn8gCu83g1Sek=
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
Subject: [PATCH v4 03/13] common/hyperlaunch: introduce the domain builder
Date: Thu, 17 Apr 2025 13:48:25 +0100
Message-ID: <20250417124844.11143-4-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417124844.11143-1-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cc74c0-527e-4a6a-c130-08dd7dae4251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CbppMfsukHKOrqLnfK6Vj23sH6IXtzWrUIrrBgPvoles3zpLXnIZYt4BZ2Ps?=
 =?us-ascii?Q?ecBdQMdB9EoawrV2mPku3e6MKIXj2gNK2Z9YzSZZ3mRyE/zK3yXtWlnKyuma?=
 =?us-ascii?Q?Bw8Jaa9124Fc2ag9n0q16RUP5MBRwXy8nOR5uLR94TPbmm7Nmf4X9UlP+L2Z?=
 =?us-ascii?Q?pPgO3eJM/4Yz0Ys9Fhv2qerRPRpOYvHNRL5GyqB+CJIWY8pVBV+pZ1jqmFlJ?=
 =?us-ascii?Q?R7/ZQQSaohy7HJ9ULfU7fUEnaCnoCmNGPm+sFokb0YTQhX6lIbWlX671ArIm?=
 =?us-ascii?Q?Rc+FcNseFQ+5/8f64br5rDUglIk+9kSBn5AWckilokd1tlJayr/AFbBUGGTD?=
 =?us-ascii?Q?8FRqr5cqqr+w4sv1cGznzVzORyDKjnELEmqFLURHv1kYsYqx/pGoExKiuMMV?=
 =?us-ascii?Q?HqRp7U0n1p3xqvlssWTddi3p4lZ918b1QJybxMGc4Zj/SEds+yTLB2gLzuTV?=
 =?us-ascii?Q?pR/yHpE9VB1wpnw1PJVVQ0xreEkpsMk8I6fFYhLcJJtZ61zvGC6T4iRRH+jk?=
 =?us-ascii?Q?yCAWCbcDd5HxZiMAzUA/udt4MRUAvuCDIwp81nffmdEc/kdNqfxA16r7qg1p?=
 =?us-ascii?Q?Aa3ze6LpzoHTZXqWyvQto0fC6z+W7nSZX6+Z0gDso/g6zPGF9UOngCSr2o+e?=
 =?us-ascii?Q?UqgITxHHWMwVZx5Q2wqtkeke7pp2XIK4pNoQXYUPss5Nrv1+VZTRm+QSe4A1?=
 =?us-ascii?Q?fJY1X7x9ZVfuUQsVTs8PfsmSCFdacmyW/Um9OuDS+8P4lviDq4MLI32cFBJi?=
 =?us-ascii?Q?yrwW4xJ382mHMp6mXXocguUxHVLrNcaRDFMegfsFWGY+P/0HSfEkXIzMYGQg?=
 =?us-ascii?Q?ChECIlE+KgV6E/DJQHykW8ickqaYW658HSCWYJAB1bWBvGcxtIHWaq1lWWp7?=
 =?us-ascii?Q?fDhWfyvurUavben76J8JG53Xi1q6bcmBDnJkVuAM7pfQB89+UZ7rlXme8dXv?=
 =?us-ascii?Q?XTlAT4ZFyvAYb9IOAx6uNBwhaX7MHx46uHEoIS/mpq61C89RPiDv8rH/nglT?=
 =?us-ascii?Q?YDVXPzCiKMM1ue/PW2IlaCeUGS3OZAGxqfNSK14eOTPshYIyb3WA/DGxFReC?=
 =?us-ascii?Q?5o+gcJWLSN4jPmjBUyBeYTAQim6CL/djF4SV907QRah7pZ0p1IW2jy/3zxCF?=
 =?us-ascii?Q?zw2xdxIiHAaThBiLJgxip+YXukdIKg/ZemRkAPbBfl3rXPhqqe8olNSsosId?=
 =?us-ascii?Q?Kd92xePtMkMMN4yWV4oM/QpRaBafD+2QXUnVW12NPPUW5MYo7gBQj90PruIX?=
 =?us-ascii?Q?8DbXF3pTJRto/VBT4Vb/mRomw6zY9UoMh0rmq6nNkE+D+yKdtIMZ4cx+hP08?=
 =?us-ascii?Q?fQCfwHccwj6zIOhfvlAsYuPJiCtWetIliaonN3wy6xiHn19eoj/gbYxzRrot?=
 =?us-ascii?Q?QFam66pSlDng4sAH0QTiMTZWK+5W3fufAROpy1FfRb4Oc+VRSQF6A1/p86mQ?=
 =?us-ascii?Q?NdkYDjS5XBDaTN7/Vgo9BwcxXe5kNQW9Cocgzrb2pGsbD40HKOLMJu/4Fldn?=
 =?us-ascii?Q?pDtr0fNFR6NE+5OR9JCChyxTygA/5/5bdRA2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:14.6289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cc74c0-527e-4a6a-c130-08dd7dae4251
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099

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
v4:
  * Moved from arch/x86/ to common/
  * gated all of domain-builder/ on CONFIG_BOOT_INFO
  * Hide the domain builder submenu for !X86
  * Factor out the "hyperlaunch_enabled = false" toggle core.c
  * Removed stub inline, as DCE makes it unnecessary
  * Adjusted printks.
---
 xen/arch/x86/include/asm/bootinfo.h |  3 ++
 xen/arch/x86/setup.c                | 17 +++++----
 xen/common/Makefile                 |  1 +
 xen/common/domain-builder/Makefile  |  2 ++
 xen/common/domain-builder/core.c    | 56 +++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.c     | 37 +++++++++++++++++++
 xen/common/domain-builder/fdt.h     | 12 +++++++
 xen/include/xen/domain-builder.h    |  9 +++++
 8 files changed, 131 insertions(+), 6 deletions(-)
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
index 4df012460d..ccc57cc70a 100644
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
@@ -1282,9 +1283,12 @@ void asmlinkage __init noreturn __start_xen(void)
                bi->nr_modules);
     }
 
-    /* Dom0 kernel is always first */
-    bi->mods[0].type = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[0];
+    builder_init(bi);
+
+    /* Find first unknown boot module to use as dom0 kernel */
+    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+    bi->mods[i].type = BOOTMOD_KERNEL;
+    bi->domains[0].kernel = &bi->mods[i];
 
     if ( pvh_boot )
     {
@@ -1467,8 +1471,9 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->mods[0].headroom =
-        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
+    bi->domains[0].kernel->headroom =
+        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
+                         bi->domains[0].kernel->size);
     bootstrap_unmap();
 
 #ifndef highmem_start
@@ -1592,7 +1597,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
+    if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..565837bc71 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-$(CONFIG_HAS_BOOT_INFO) += domain-builder/
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
diff --git a/xen/common/domain-builder/Makefile b/xen/common/domain-builder/Makefile
new file mode 100644
index 0000000000..b10cd56b28
--- /dev/null
+++ b/xen/common/domain-builder/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_DOMAIN_BUILDER) += fdt.init.o
+obj-y += core.init.o
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
new file mode 100644
index 0000000000..a5b21fc179
--- /dev/null
+++ b/xen/common/domain-builder/core.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, Apertus Solutions, LLC
+ */
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/kconfig.h>
+#include <xen/lib.h>
+
+#include <asm/bootinfo.h>
+
+#include "fdt.h"
+
+void __init builder_init(struct boot_info *bi)
+{
+    bi->hyperlaunch_enabled = false;
+
+    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
+    {
+        int ret;
+
+        switch ( ret = has_hyperlaunch_fdt(bi) )
+        {
+        case 0:
+            printk(XENLOG_DEBUG "DT found: hyperlaunch\n");
+            bi->hyperlaunch_enabled = true;
+            bi->mods[0].type = BOOTMOD_FDT;
+            break;
+
+        case -EINVAL:
+            /* No DT found */
+            break;
+
+        case -ENOENT:
+        case -ENODATA:
+            printk(XENLOG_DEBUG "DT found: non-hyperlaunch (%d)\n", ret);
+            bi->mods[0].type = BOOTMOD_FDT;
+            break;
+
+        default:
+            printk(XENLOG_ERR "unknown error (%d) checking hyperlaunch DT\n",
+                   ret);
+            break;
+        }
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
index 0000000000..aaf8c1cc16
--- /dev/null
+++ b/xen/common/domain-builder/fdt.c
@@ -0,0 +1,37 @@
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
+int __init has_hyperlaunch_fdt(const struct boot_info *bi)
+{
+    int ret = 0;
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    if ( !fdt || fdt_check_header(fdt) < 0 )
+        ret = -EINVAL;
+
+    bootstrap_unmap();
+
+    return ret;
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
index 0000000000..97a45a6ec4
--- /dev/null
+++ b/xen/common/domain-builder/fdt.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_DOMAIN_BUILDER_FDT_H__
+#define __XEN_DOMAIN_BUILDER_FDT_H__
+
+struct boot_info;
+
+/* hyperlaunch fdt is required to be module 0 */
+#define HYPERLAUNCH_MODULE_IDX 0
+
+int has_hyperlaunch_fdt(const struct boot_info *bi);
+
+#endif /* __XEN_DOMAIN_BUILDER_FDT_H__ */
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
new file mode 100644
index 0000000000..ac2b84775d
--- /dev/null
+++ b/xen/include/xen/domain-builder.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_DOMAIN_BUILDER_H__
+#define __XEN_DOMAIN_BUILDER_H__
+
+struct boot_info;
+
+void builder_init(struct boot_info *bi);
+
+#endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.43.0


