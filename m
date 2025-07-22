Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04639B0CE8B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051775.1420217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W6-0005xe-Sj; Tue, 22 Jul 2025 00:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051775.1420217; Tue, 22 Jul 2025 00:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W6-0005r7-OA; Tue, 22 Jul 2025 00:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1051775;
 Tue, 22 Jul 2025 00:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0W4-0005aW-PO
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:05:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2416::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2b9103a-668f-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 02:05:56 +0200 (CEST)
Received: from BLAPR05CA0015.namprd05.prod.outlook.com (2603:10b6:208:36e::15)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Tue, 22 Jul
 2025 00:05:49 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::fe) by BLAPR05CA0015.outlook.office365.com
 (2603:10b6:208:36e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 00:05:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:48 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:46 -0500
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
X-Inumbo-ID: a2b9103a-668f-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUMZxdKIrwcUd3n3WtpQF70VThl2HXDveG7K2iCkpMfYNYr0XEiftRvA8llvT8GbehLICuWvdWOtvMwF7MmISFGj/gMRUPv3K/SyfbhrTw9uykU5KlAHE6INxKEK5VpsTDH2lp1U+PrH0fHW5y/yR1iQs9wp/4MHc2Qwaxw6ueglCnOTsY5Sq/Y4xllwRtYbVDsYlgOBXcDj1osuQczvH2FJnKqXFBdFrevyTwj9DKliz0IfJZ/AGEc8oyxlgvxelwT883L9JselDOUG0/lLukIGRV16E/GBCHjDKpE0dS7Oib/8v2rNdFLvtHCtoLtBTWVb9zOijgHO+ThjTZX5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELaIPxq7xgDg3avsEyiAPuTrcMr/bWjgnIummXBRjC4=;
 b=Hxh2O8O3zpCZ2heYC2r4fXvOpevBPi9KceDTsGF9tS3VXPScBZDwIQofjtXJI1epM4CFf3Go3JsE35FlXOXuLOX1pz3gKQ+B1Y7/AUzt7WjlEniICV3zYJaFzX4VMhTG0q5v5x+CGtY29Q5GY5IfagtkFVeFLQpR+QYJDwQYNzPWNrF6ZXBP5VWmtJPyXBLj2OvXcX1dUZalgr38Vf6BN8lC0YFzxSBo+Km8Yck6PxBwHoanLQiC5hI0haVeSzs+ZuGryYnPGo9/eAi1N3yemuVbjL3Py5+z8oECXJg05EVqnYzcMyE1T5Si3raWc+sjJVJd2TuIi0nouHb97LGsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELaIPxq7xgDg3avsEyiAPuTrcMr/bWjgnIummXBRjC4=;
 b=JYb1Iu6QZPRxSwxTlxL0nMmVnZynrsJ31h3vIiaMLXLMco8N3W7IlfjQTHlezCjop+0bIdg8t+eZreZrOLNLGfa6FXPBtGVDefqDM50yA3IH8Vked+NMYvKPWOxmdmVW757Ia2qy0RO9FOVfAEns/Tu+k/I3phqi3Gkgul8LNoU=
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
Subject: [PATCH v8 03/11] x86: Replace arch-specific boot_domain with the common one
Date: Tue, 22 Jul 2025 02:05:15 +0200
Message-ID: <20250722000525.7247-4-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 603355c1-6c14-44e8-9210-08ddc8b3837c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?unCTL6mTemCDxmIRc/w/vYK0MUY1hDpn8ib5hcux9pN1ELzinX4Co0asTF56?=
 =?us-ascii?Q?qGtC67xYUG0SPlbV8UVXoslGDoUfs7Q7B0T5ytoPBKAauK9uJXaTIzE3dc01?=
 =?us-ascii?Q?+3UbuZizOncjtQH8XpydzejUL5HIVHAA5pwIDpeByUJfep36HS4L1uCaKvs1?=
 =?us-ascii?Q?ojyW8lJafSquC3o6LvRKZAvdOdgQ8dxt1HI9+RQXqTAXGILFUzYFM6oF/db9?=
 =?us-ascii?Q?EvJ7RDitcOoLyNV6dDEDwCQxeSFKSbkqwXkQNUDI/Y8BgZGR1jqU0enPK3o9?=
 =?us-ascii?Q?w655//DwRQEtX0DC4d2pB86GA3eoCf5JRYMa2aipM1MTJ3i+tkVC5KsY48nC?=
 =?us-ascii?Q?Nf9RkbssGJ3Nd8eUpxRzLVfKg7xFaQND+rSIC6d3ooDs0XY5zvkz4UNE1P4h?=
 =?us-ascii?Q?8Eu5U4euZwxF0y1OrzN8IJy+omt3TyT6qxXxozTDt2ycEdi3v5MBwR54o6Y9?=
 =?us-ascii?Q?nA90TSIc1DYn+BMHLAa03WvSLTAjUInfRIQ8n6IG/+Jqk9vJoJ+CMf25AaL8?=
 =?us-ascii?Q?GQtdWdU8x1BlVFCXF1FnrSPsKFC5EcpZNXQk/58JUxbyplBhc9mpXS81V2zB?=
 =?us-ascii?Q?Sw05qxfTHVGacelN2mROBRlT/Vg1+KPd0bK5akA2vy+fgbY1VFvaSQh1gBQ5?=
 =?us-ascii?Q?GpVXjfaSVQemtZd+OvCbGBjXfv5cbm/x0idWyuwTHFrTn3oRj5f3yR6wgLns?=
 =?us-ascii?Q?bHLV94QguPenhC28oBETWuN+e9jx/M1zF32gGQ+uFAZAGpLWQMs/WFwdh+nD?=
 =?us-ascii?Q?b+HGA4TlwAf/IvasMNpbGBIVjAp+W4zsg9e3FMUNFACp5UXb2uLEqBri0sug?=
 =?us-ascii?Q?kg9FTHC7ObHPLIlCVAHnGgQU7MmVBT+DF7k8yP46fseB9st4FAgB6lapHTJb?=
 =?us-ascii?Q?IVumTcMcEVjS0Mu0r4vFHESdyth0cjhgWL38fw35W0oWiV8kRip+r2c75nJk?=
 =?us-ascii?Q?e087Ofld56a7d3U0F6i8XVGoMrIg1KlCLzYLQ96ZjTc68Xg195PptjlXM/9u?=
 =?us-ascii?Q?yfYalCZ9g9eisgqpvGHy5M2oDXMQ+LIj60hsuMvLAo9LKdYC0ySnvafxSk9/?=
 =?us-ascii?Q?kd96/TVTHiDPrvbG2DKnOWfZwkynnhn0ttpBw0DZgvJBSR45tLYbjvunq2FD?=
 =?us-ascii?Q?Ct0eXthC7S7wgWZqHQxcRbZy4TY6W3welPU4cZw2xLK0+bV/Cg0Lpong7VMI?=
 =?us-ascii?Q?FerVhQFEUXxehRL0MurqYDsRasgUQuNKc+cKBtK+Vs/6WVmpR9Qz152PNMbo?=
 =?us-ascii?Q?A8cERBOTNvTvybqsYJqH3z78BxtjpAovuXOJQKEvoTCy7Wtl7Hh+PIlnB8op?=
 =?us-ascii?Q?Fg42v/JgkVg5scFrKFtd5V5mGyk4Hu6VjryRnvNxrN8RG6lTxlDClHf1c/ot?=
 =?us-ascii?Q?5BXxjL0rLXbrMGigT5YRJOzsw0GfsWdLezPnK91wJ2B6ALt3Yb/lm1GaWiLA?=
 =?us-ascii?Q?u+wfVnmq8LB5JJdNkuDI2rWplq5wX4Xnx+V8k+Ga/nNOFchnSARpPQvY/N+/?=
 =?us-ascii?Q?Prnlj61QXujrtipxRvu0vUUrjKaUO3f3/TeH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:48.6733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 603355c1-6c14-44e8-9210-08ddc8b3837c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/dom0_build.c          |  2 +-
 xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
 xen/arch/x86/include/asm/bootinfo.h    |  1 -
 xen/arch/x86/pv/dom0_build.c           |  2 +-
 xen/arch/x86/setup.c                   |  2 +-
 xen/include/xen/bootfdt.h              |  4 ++++
 6 files changed, 7 insertions(+), 37 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 6be26cc66f..5551f90448 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -648,7 +648,7 @@ static int __init pvh_load_kernel(
 {
     struct domain *d = bd->d;
     struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->module;
+    struct boot_module *initrd = bd->initrd;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->arch.headroom;
     unsigned long image_len = image->size;
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
deleted file mode 100644
index d7c6042e25..0000000000
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
-    struct boot_module *kernel;
-    struct boot_module *module;
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
index d33b100e04..4f2cc5906e 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -12,7 +12,6 @@
 #include <xen/init.h>
 #include <xen/multiboot.h>
 #include <xen/types.h>
-#include <asm/boot-domain.h>
 
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index a4b5362357..c37bea9454 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
     struct vcpu *v = d->vcpu[0];
 
     struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->module;
+    struct boot_module *initrd = bd->initrd;
     void *image_base;
     unsigned long image_len;
     void *image_start;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 58fd806072..1543dd251c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2171,7 +2171,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
-        bi->domains[0].module = &bi->mods[initrdidx];
+        bi->domains[0].initrd = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index fceffaf2ec..9c2b954121 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -103,6 +103,10 @@ struct shared_meminfo {
 struct boot_domain {
     struct domain *d;
 
+#ifdef CONFIG_X86
+    domid_t domid;
+#endif
+
     struct boot_module *kernel;
     struct boot_module *initrd;
 
-- 
2.43.0


