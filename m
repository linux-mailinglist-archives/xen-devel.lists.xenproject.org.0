Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C5AC8D47
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000720.1380969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySW-00010f-L1; Fri, 30 May 2025 12:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000720.1380969; Fri, 30 May 2025 12:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySW-0000xs-Cy; Fri, 30 May 2025 12:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1000720;
 Fri, 30 May 2025 12:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySU-0007de-BV
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:2417::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aa9b876-3d4e-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 14:03:32 +0200 (CEST)
Received: from CH2PR18CA0049.namprd18.prod.outlook.com (2603:10b6:610:55::29)
 by IA1PR12MB8405.namprd12.prod.outlook.com (2603:10b6:208:3d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 12:03:29 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::4b) by CH2PR18CA0049.outlook.office365.com
 (2603:10b6:610:55::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 30 May 2025 12:03:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:28 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:26 -0500
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
X-Inumbo-ID: 1aa9b876-3d4e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUMc0yrzeXwHBH61vHfMQ5Q+ysfQ94U6UMzf3sOLn36z9VP8Rl7pqqd/zJ5d3aRx0gM6o4zzvIz+jCOMc3R5ZJT6DPZmZ/CynugQ/FSbYSzH1EA3zi31VmM+HmXJgasMqb2OUogb3q9j7Iwa0ZxXG4zhsBm+cSHMq3vzseU/Z/iI1lmWBmGX15LSWwjXcRJQoGqQSQDrwFxfGYBN06BrwXEyLsrWn8GxatTbRsBuWBhvndCiVVUFsRf7U8HEEHb1YeVLH7RPUpfNm/s7ALgwAMuKNYSLig1PAoYZPzMJ00O8sc28QEr5IHQLRqjABcoEQ+DQmAUeAg6+CzSjKl8yHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHG82Ru0wjX5B6c2AZ+qjxP8hH7oJ3456oo5ASWGKik=;
 b=p464m4Ea6SthOxOi5RJ9Dy1WPFtwYtFHEpsRBO7/n4a65OmFSmRDhU+bj1q3RLBoij0bZkHVmc+8hK2//b7ZpWVwwrX20w3qWDPorinifU/HDovXlvdwBYKWJNTo6MefdN+N5x5gTRuejeBqLoHTN46l8HIFrMS0rNTDaor+jk9PhptBHGXQzWPoeQyKNvm17MqT7w9nwVMEdYqRZ3Q7cPfxH/eUyeIJzaETtCxTgsbSqv2AAh4cCJH8cfw6BzlCxYTOLpnUSgqxrTtfuDOpHRb6mSNV381W2G8szRwvycrboanWJzlsVF5FGHfH2r98iUdS8sj9ZNnR3ihNm6/zww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHG82Ru0wjX5B6c2AZ+qjxP8hH7oJ3456oo5ASWGKik=;
 b=x5XaskTSvbQH+5FjJDPK/Zm/AEOhwVOxX1x+jwmAMErex1K3IcRDgYug0zGMec6vlhAn5ENTrzXcEqrPSmoBEylwm84McEKFPEGtFdjwN7FMPkNdjpHhwCSLQyDxKAzp+qqD5OC12itliJD6q0MVg/Kgoar0BxkVlIa/z1ZIB5M=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 11/19] x86: Replace boot_domain with kernel_info
Date: Fri, 30 May 2025 14:02:19 +0200
Message-ID: <20250530120242.39398-12-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|IA1PR12MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f13120f-844e-42ac-2272-08dd9f71fd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m7957DLGvMpBROcHwnNt+Boc87FjbwJ+skBu+lJdv6FyfMmsxKRQYRLBrjlW?=
 =?us-ascii?Q?MwzL9bDpZDJun9ysMeHj6zYzxiE/PQsipH17rQEwUu1564pAG/TaN7ZLcMhD?=
 =?us-ascii?Q?Bd0x88OcX2kqI5AyR9cx8LWzmOye5t8/rZqdCOJOrHibOkyR/xWkztkInUYK?=
 =?us-ascii?Q?e/c++ZBAh4lHullkndrlPvUV2nAOuCijPHbE0PfHWp4CGCFLRXj3F66rkJjV?=
 =?us-ascii?Q?QABP7oucnLPWaclTObNDeLOgcBySgWnZHzXP2Q9608yaADWxaOiemld06QVx?=
 =?us-ascii?Q?6rGz7mCfJAn0kXVRIBFya/TqednhNeVQBtr6by7j1gM2/gE1eEl7Xc10coDu?=
 =?us-ascii?Q?nxY5F3tkxCrJeuumoPRhQRQ6CDGSXImYb2YnvrECLEgOCSql1rwNTuZDEhLd?=
 =?us-ascii?Q?Pic0+b0UCjOFe1F4GM0TOHo7x9Toa9NXJJKizaPWOuwu7VlFLdjxv819+YTv?=
 =?us-ascii?Q?3QrM6+Yv2xWgLYxzeN+9pAdYnGBd5wF5fWnf3ui4jH3GUlnIndfEzIlj/o14?=
 =?us-ascii?Q?fKejri0tuOGmf5dMN1aqRCahymnY0oygbC/nRBCznppy7YhwcerHsUe/xFlU?=
 =?us-ascii?Q?OSwhs6AkslJq983wcAEGC96B+KoU7L3u6NhspOQsdckYrpAaEZhgt3ipaRCZ?=
 =?us-ascii?Q?6BzyvjeuMIY2r1K3ebmSdPrzuDrt37JjXKcet5/HUwftElP7hFHz/CRjeYXa?=
 =?us-ascii?Q?R8NVAMnBZOWlREURcHDPug1Ro7uuSo8+FAPQkIcNv9FQJ2c6FX2oznl9/vkK?=
 =?us-ascii?Q?1MnSlZLRvWMPJLKjj/MFWnwPMCyDKz8HoF2nGke5Nwzt2lZRHuwrodSeVzjc?=
 =?us-ascii?Q?bB536Nsup8ek67y75f1kGMuI2Di6zOfxhtdp0yx9nzJCysfiS4Gjk1Gh5aGI?=
 =?us-ascii?Q?gxeWsE80gxIs7JF+QGmsDt9y23H2p9i4bxbrDBF4SKtUufAD1H5kWz+3oHcR?=
 =?us-ascii?Q?FQpYqcCJgtTtK808lyVrHq2ukQEmmOgSD7untMnqrkIzRPZjSa+kkmM48OoK?=
 =?us-ascii?Q?i4Qyi3xLvJSGoeApjqaVIqS8A+lJIOysoyJxSMmPwQA60YSaOGNgijzjt+Sd?=
 =?us-ascii?Q?8JcJSRGVkoESqWgzioavCQaOAJgWs3nAam2Wgxde7Wx+fJySiYP1ovFQAatY?=
 =?us-ascii?Q?elLoleBkuCsiUn7GTQHqXQo+1rl8bxb7MehkPRXvtO3cFU1WYag+Jgnlsrsg?=
 =?us-ascii?Q?wcFw9EEJ7y49L5aJnIzYrNWJIdqaANzcrOVnb9ts5FWfs3YRI8MF8+h2Tfx4?=
 =?us-ascii?Q?qQdgU5eDpbgLGA9PXRap5CYqIwtbSSGhxG2ztOWu2Sy5z2hW1H3mGDP0Du7s?=
 =?us-ascii?Q?m4/3n5yf37mjEIt7wJ8+4yn/Ofj4T6uur7AFPRRVmi/4cFC83YJfPBUzlKkl?=
 =?us-ascii?Q?pxue7vN2li27JvTigjWs3ea1n/jzVugSxVqo0dLv84YTdmaMn6G4WtsxEznf?=
 =?us-ascii?Q?LCBJOYdJo0d+pAIVr6uLFePZSBlseL0AndBIGUM5qdVBJMIILq8YAbMR8Q+P?=
 =?us-ascii?Q?M5zih2/1MQbk/SEDQJc8UZLmQegSLx4TMNMt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:28.6538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f13120f-844e-42ac-2272-08dd9f71fd59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8405

kernel_info and boot_domain serve basically the same role. Unify them so
they can be used in common code for domain building purposes across all
architectures.

kernel_info has a lot of fields x86 doesn't care about, but riscv and
arm do. Hence rather than moving them to the arch-specific files, x86
is ifdeffed out of those so arm and riscv can still keep sharing the
definitions.

Also, deconstify module pointers inside kernel_info, because x86 relies
on mutating through them.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
I'd be happier renaming struct kernel_info to struct bootdomain to clean
up the misnaming but I don't want to deal with the refactor in arm+riscv
right now. I've typedeffed it on x86 to bootdomain_t to reduce the diff
delta. (otherwise there's a lot of useless s/bd/ki/)

Some headers still use "struct kernel_info" in x86 to avoid extra includes.
Re-typedeffing only works from C11 onwards.

---
 xen/arch/x86/dom0_build.c              |  2 +-
 xen/arch/x86/hvm/dom0_build.c          | 10 ++++----
 xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
 xen/arch/x86/include/asm/bootinfo.h    |  7 ++++--
 xen/arch/x86/include/asm/dom0_build.h  |  6 ++---
 xen/arch/x86/include/asm/kernel.h      | 20 ++++++++++++++++
 xen/arch/x86/include/asm/setup.h       |  4 ++--
 xen/arch/x86/pv/dom0_build.c           |  8 +++----
 xen/arch/x86/setup.c                   | 26 ++++++++++----------
 xen/include/xen/fdt-kernel.h           |  2 +-
 10 files changed, 55 insertions(+), 63 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/kernel.h

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..5bd4d39d10 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -615,7 +615,7 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(const struct boot_domain *bd)
+int __init construct_dom0(const bootdomain_t *bd)
 {
     int rc;
     const struct domain *d = bd->d;
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 96410344a8..66d7046577 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -644,11 +644,11 @@ static bool __init check_and_adjust_load_address(
 }
 
 static int __init pvh_load_kernel(
-    const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
+    const bootdomain_t *bd, paddr_t *entry, paddr_t *start_info_addr)
 {
     struct domain *d = bd->d;
-    struct bootmodule *image = bd->kernel;
-    struct bootmodule *initrd = bd->module;
+    struct bootmodule *image = bd->kernel_bootmodule;
+    struct bootmodule *initrd = bd->initrd_bootmodule;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->arch.headroom;
     unsigned long image_len = image->size;
@@ -1329,7 +1329,7 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(const struct boot_domain *bd)
+int __init dom0_construct_pvh(const bootdomain_t *bd)
 {
     paddr_t entry, start_info;
     struct domain *d = bd->d;
@@ -1337,7 +1337,7 @@ int __init dom0_construct_pvh(const struct boot_domain *bd)
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
-    if ( bd->kernel == NULL )
+    if ( bd->kernel_bootmodule == NULL )
         panic("Missing kernel boot module for %pd construction\n", d);
 
     if ( is_hardware_domain(d) )
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
deleted file mode 100644
index 242e9c9c2b..0000000000
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (c) 2024 Apertus Solutions, LLC
- * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
- * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
- */
-
-#ifndef __XEN_X86_BOOTDOMAIN_H__
-#define __XEN_X86_BOOTDOMAIN_H__
-
-#include <public/xen.h>
-
-struct boot_domain {
-    domid_t domid;
-
-    struct bootmodule *kernel;
-    struct bootmodule *module;
-    const char *cmdline;
-
-    struct domain *d;
-};
-
-#endif
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index f3210b7d6a..6b151c7759 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -9,10 +9,10 @@
 #define X86_BOOTINFO_H
 
 #include <xen/bootfdt.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/multiboot.h>
 #include <xen/types.h>
-#include <asm/boot-domain.h>
 
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
@@ -20,6 +20,9 @@
 /* Max number of boot domains that Xen can construct */
 #define MAX_NR_BOOTDOMS 1
 
+/* kernel_info is a misnomer. It holds information for a to-be domain. */
+typedef struct kernel_info bootdomain_t;
+
 /*
  * Xen internal representation of information provided by the
  * bootloader/environment, or derived from the information.
@@ -34,7 +37,7 @@ struct boot_info {
 
     unsigned int nr_modules;
     struct bootmodule mods[MAX_NR_BOOTMODS + 1];
-    struct boot_domain domains[MAX_NR_BOOTDOMS];
+    bootdomain_t domains[MAX_NR_BOOTDOMS];
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index ff021c24af..68dc5e487c 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-struct boot_domain;
-int dom0_construct_pv(const struct boot_domain *bd);
-int dom0_construct_pvh(const struct boot_domain *bd);
+struct kernel_info;
+int dom0_construct_pv(const struct kernel_info *bd);
+int dom0_construct_pvh(const struct kernel_info *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/kernel.h b/xen/arch/x86/include/asm/kernel.h
new file mode 100644
index 0000000000..f945f0957b
--- /dev/null
+++ b/xen/arch/x86/include/asm/kernel.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARCH_X86_KERNEL_H__
+#define __ARCH_X86_KERNEL_H__
+
+#include <public/xen.h>
+
+typedef struct arch_kernel_info {
+    domid_t domid;
+} arch_bootdomain_t;
+
+#endif /* #__ARCH_X86_KERNEL_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index c7deaba109..2183036da3 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,8 +26,8 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-struct boot_domain;
-int construct_dom0(const struct boot_domain *bd);
+struct kernel_info; /* bootdomain_t */
+int construct_dom0(const struct kernel_info *bd);
 
 void setup_io_bitmap(struct domain *d);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e6c77413f5..2bb5d1bcdf 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -355,7 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(const struct boot_domain *bd)
+static int __init dom0_construct(const bootdomain_t *bd)
 {
     unsigned int i;
     int rc, order, machine;
@@ -374,8 +374,8 @@ static int __init dom0_construct(const struct boot_domain *bd)
     struct domain *d = bd->d;
     struct vcpu *v = d->vcpu[0];
 
-    struct bootmodule *image = bd->kernel;
-    struct bootmodule *initrd = bd->module;
+    struct bootmodule *image = bd->kernel_bootmodule;
+    struct bootmodule *initrd = bd->initrd_bootmodule;
     void *image_base;
     unsigned long image_len;
     void *image_start;
@@ -1070,7 +1070,7 @@ out:
     return rc;
 }
 
-int __init dom0_construct_pv(const struct boot_domain *bd)
+int __init dom0_construct_pv(const bootdomain_t *bd)
 {
     unsigned long cr4 = read_cr4();
     int rc;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a6b3dbfc8c..aa3d913191 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -297,7 +297,9 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
-    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
+    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = {
+        .arch = { .domid = DOMID_INVALID }
+    }},
     .mods = { [0 ... MAX_NR_BOOTMODS] = { .kind = BOOTMOD_UNKNOWN } },
 };
 
@@ -982,10 +984,10 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
 }
 
 static size_t __init domain_cmdline_size(const struct boot_info *bi,
-                                         const struct boot_domain *bd)
+                                         const bootdomain_t *bd)
 {
     size_t s = bi->kextra ? strlen(bi->kextra) : 0;
-    const struct arch_bootmodule *abm = &bd->kernel->arch;
+    const struct arch_bootmodule *abm = &bd->kernel_bootmodule->arch;
 
     s += abm->cmdline_pa ? strlen(__va(abm->cmdline_pa)) : 0;
 
@@ -1017,7 +1019,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
-    struct boot_domain *bd = &bi->domains[0];
+    bootdomain_t *bd = &bi->domains[0];
     struct domain *d;
 
     if ( opt_dom0_pvh )
@@ -1034,11 +1036,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg,
+    bd->arch.domid = get_initial_domain_id();
+    d = domain_create(bd->arch.domid, &dom0_cfg,
                       pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
+        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
 
     init_dom0_cpuid_policy(d);
 
@@ -1051,9 +1053,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
             panic("Error allocating cmdline buffer for %pd\n", d);
 
-        if ( bd->kernel->arch.cmdline_pa )
+        if ( bd->kernel_bootmodule->arch.cmdline_pa )
             strlcpy(cmdline,
-                    cmdline_cook(__va(bd->kernel->arch.cmdline_pa),
+                    cmdline_cook(__va(bd->kernel_bootmodule->arch.cmdline_pa),
                                  bi->loader),
                     cmdline_size);
 
@@ -1076,7 +1078,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             strlcat(cmdline, " acpi=", cmdline_size);
             strlcat(cmdline, acpi_param, cmdline_size);
         }
-        bd->kernel->arch.cmdline_pa = 0;
+        bd->kernel_bootmodule->arch.cmdline_pa = 0;
         bd->cmdline = cmdline;
     }
 
@@ -1290,7 +1292,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     /* Dom0 kernel is always first */
     bi->mods[0].kind = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[0];
+    bi->domains[0].kernel_bootmodule = &bi->mods[0];
 
     if ( pvh_boot )
     {
@@ -2157,7 +2159,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
-        bi->domains[0].module = &bi->mods[initrdidx];
+        bi->domains[0].initrd_bootmodule = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 1939c3ebf7..2f0ee42ebc 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -34,7 +34,7 @@ struct kernel_info {
     paddr_t gnttab_size;
 
     /* boot blob load addresses */
-    const struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
+    struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
     const char* cmdline;
     paddr_t dtb_paddr;
     paddr_t initrd_paddr;
-- 
2.43.0


