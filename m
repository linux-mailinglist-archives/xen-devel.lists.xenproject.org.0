Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8582AFD619
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037028.1409715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjW-0006Qy-9I; Tue, 08 Jul 2025 18:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037028.1409715; Tue, 08 Jul 2025 18:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjW-0006Mm-3K; Tue, 08 Jul 2025 18:07:58 +0000
Received: by outflank-mailman (input) for mailman id 1037028;
 Tue, 08 Jul 2025 18:07:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjV-0005Uq-1x
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:07:57 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2412::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77881dcd-5c26-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:07:54 +0200 (CEST)
Received: from DM6PR07CA0084.namprd07.prod.outlook.com (2603:10b6:5:337::17)
 by BL4PR12MB9482.namprd12.prod.outlook.com (2603:10b6:208:58d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 18:07:50 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::44) by DM6PR07CA0084.outlook.office365.com
 (2603:10b6:5:337::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 18:07:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:07:49 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:07:47 -0500
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
X-Inumbo-ID: 77881dcd-5c26-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2tBYc9rLdAKfz9+hbtVRBbFMTepAKsnXr1w9qxfHTZjPbYchM8coviNmlS1TnOfFEm8bNHeWkkCIePjMEMcL3XwetNR8fySio5j+apZHMx3HEIRe1hxWWkJcKATGOCUUvFdCaFmZ755Js6GMXSxz9+2KthO2GTDwIyo3112hnYq465vyX01499e9yv0/f1Msor1heW0rklc1PPuAiuGY6mhJuTZ3zEYrNVgjNc+34OMoQeKXptd97pCQ0CTcv6zeMLuFMOoBDPTEQN4hiKgwwZTOFBiTF7u52k+cDVzlDEtE0RQzt0rOXExVJQMQrkVv8szMjahALZSFBgg1TLxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vso2EYruuleOBrbwx7nFpqmFdGG3+p6tqYAmzJo08dY=;
 b=PiJIGTKXgOEsFAYJ1M0TQl7e4GcF5SigORMGgXlsCj/xcQereDa0jn3aaCM4gWO4ZDdxCoctMkehKU1CtMZ8jH59zah4B8t+fF/vxEZoUtWs1kGbvh9vgLG3FPBDQO9nOW+3RoT2TNeHdNx3LLuD18mWyubNhdsH+ZU+fGScICjE1rucX5iIYacomBpICsq9C53u3FIJuxZPTGLR3ZEiXRML9bfxr8nHyXuQBdNJRH6j4Ug7XNDg90KyaYWvy53MTIZapUsogfwUy7fdbX4AuNVQnTmx8UX9XJJJ1RhmFRgW2zIScZTofZ3WW3028nHcDjPfU9fS5oxwevY4mJ/4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vso2EYruuleOBrbwx7nFpqmFdGG3+p6tqYAmzJo08dY=;
 b=4RWo+r9fll7j57YY8hHC3gX6uZ0lNJuWuvGYgbW9bses2hBUdT6Mtn9DD6FDEjgvOV/MsAA7z2UiquKDzOZlU2WqpRq2Dlqt2DKf/pXPVK/8R+AnFU6qYXMHdFoCPXEiFTEvz5Yc69DS0hTN5CacvOq0qHfNbmwLbt8xFxPFbr0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 04/11] x86: Replace arch-specific boot_domain with the common one
Date: Tue, 8 Jul 2025 20:07:13 +0200
Message-ID: <20250708180721.2338036-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|BL4PR12MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b735f83-c687-4a2e-4f7b-08ddbe4a59da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tJX/cO6RTznN794ihfxPfMycWSt6iNNa+6GZBnaRkXXeuj05Ffl9HeHjP4s8?=
 =?us-ascii?Q?4tfFx9AOFWeCOqivVydJKvZKN5FykL7i8s7KdpAMrTOgjrFlA0EenpqeXlh5?=
 =?us-ascii?Q?jAt+LQC/+YSVAtP0V9mLlWO06btVoGYOsdqOQRlVTV8899OcXa6MGJ2DlyfE?=
 =?us-ascii?Q?KQazd5Hex7jMNm8EO1bCKHoh+F+a5103rArm7FWsLjGZz6XkRv1h5HXo36iC?=
 =?us-ascii?Q?47SD2jX29yBcVLfHDllRdXLX25IcvJeKfRo9+4ieUFJ5FwjHmMMkun1nKjmf?=
 =?us-ascii?Q?cOKNnngeLc5XDY44lUkpeD6qPVAVlhxgqpHyjomb6Wrj89VVFYMpoEvnEG44?=
 =?us-ascii?Q?zKiM10zW0OP1Q/YZs8Ln7y6sIgAMjfDJSD6+/bl/K5Tp4o7jH2oZhD1/anep?=
 =?us-ascii?Q?s/pZD0zrS9ulxyIaLzY+nDl6VeFFSwj0/vCsiESx4z0To2P81BU0kT+KTIuR?=
 =?us-ascii?Q?mhyeHM0ya6VCF/05FshfLk8moTiN6SpBiegNlBwge7o/k9FbRAjGHqnRf20y?=
 =?us-ascii?Q?pOqjmNNVUjMWvV/jIzWCZt9qIw6iPe3Ujpmv421546DC6B3HFHPWRHsWs4Cy?=
 =?us-ascii?Q?JYlMvHSkJpJUe4Mjw6qo3Cn0zJeQigDxhFfl0aP8ckITGGgIMU/YJWE09w84?=
 =?us-ascii?Q?+WIelcakqQ9rkXj6h7SxX94CxK9lNduhmuYzFPXWmAxcP131fhB97uziB3IG?=
 =?us-ascii?Q?6F9Gzo3CQTQ20UPZm/fKP6RXvEFg9Vk1u+L55e2RL5BMBLIAV+LAVulpuiJJ?=
 =?us-ascii?Q?zHGOtygO6rOFmQdSVcZLX+yZWf6JN3fGdOv3O3RNLxR8GtkVzDGY5OO/bWTI?=
 =?us-ascii?Q?M7FVzoGx1Ca2pQfpBsk9M3TNy6FwbSDlK7KxLrv/aW8Qh6Ohhb0Q7fqaOqj0?=
 =?us-ascii?Q?ouHEZ/Qiyo+8loUukNSOfj/Z23AWXILDZCp0RoeC4ySAVZ+FgnUrTbV2YA0a?=
 =?us-ascii?Q?58Wfcuqt5/vKnKhtrcCfR+MVtGfQuQ/wpwRNBXxeIQsZS+9rXp92yV65krEJ?=
 =?us-ascii?Q?1+rq9Cre2ru1KD3Xg09e8uRcGUQRQdR60oL5ONtVizGxfi1/Onu7P3QpHAb+?=
 =?us-ascii?Q?i5D0ZKlhWMnuV+4CF6alycodnRgCLDeIbEejp1KOZ2CajIzefQAcutZeRmub?=
 =?us-ascii?Q?UhorMU0EWPlCmq4vH6XlDuCC47zjOqEw9TwFr/JqohXKyACHiMXpuOYjBwKl?=
 =?us-ascii?Q?SraN4u6HJ5AzSmlYAuFe10Cl5gdSycOMNs6PHukwA7Y0ujqjuQsZuvWC2ate?=
 =?us-ascii?Q?qXjwcDxR+/wKjIQoIe0Ksebr0vdz+7wshWi8YxdP1sNcS4c+PjICljlVxnHU?=
 =?us-ascii?Q?/rhm3Gj91utXJJw88xP+NqmUte2GsVHaASr69KCjV/gMjCML/70DqBf007eK?=
 =?us-ascii?Q?0FWjXXpX54cS8OLUEWgXbbJvPDFRSOYPwe+p9eykUlOIRI2cW9zMGUKcScUO?=
 =?us-ascii?Q?aA3NeFYyPWP9bqhHwoH890tnFbydEheNkNrfLlKkCDZfOCjoWdLE2FUEfo5n?=
 =?us-ascii?Q?yHY5bGMi52TnGOWukyk7yEc4BSxVNTieLD6L?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:07:49.9918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b735f83-c687-4a2e-4f7b-08ddbe4a59da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9482

From: Alejandro Vallejo <agarciav@amd.com>

Add the single arch-specific field in an "arch" subfield defined in
asm/bootfdt.h.

No functional change intended.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/dom0_build.c          |  2 +-
 xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
 xen/arch/x86/include/asm/bootfdt.h     |  6 +++++
 xen/arch/x86/include/asm/bootinfo.h    |  1 -
 xen/arch/x86/pv/dom0_build.c           |  2 +-
 xen/arch/x86/setup.c                   | 12 ++++++----
 xen/include/xen/bootfdt.h              |  4 ++++
 7 files changed, 19 insertions(+), 41 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 2bb8ef355c..8d2734f2b5 100644
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
diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
index a4c4bf30b9..c21dbe961b 100644
--- a/xen/arch/x86/include/asm/bootfdt.h
+++ b/xen/arch/x86/include/asm/bootfdt.h
@@ -3,6 +3,12 @@
 #define X86_BOOTFDT_H
 
 #include <xen/types.h>
+#include <public/xen.h>
+
+struct arch_boot_domain
+{
+    domid_t domid;
+};
 
 struct arch_boot_module
 {
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
index 7e70b46332..5adb7af930 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -297,7 +297,9 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
-    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
+    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = {
+        .arch.domid = DOMID_INVALID
+    }},
     /*
      * There's a MAX_NR_BOOTMODS-th entry in the array. It's not off by one.
      *
@@ -1048,11 +1050,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
 
@@ -2171,7 +2173,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
-        bi->domains[0].module = &bi->mods[initrdidx];
+        bi->domains[0].initrd = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 28f7d18262..65ba818e1a 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -107,6 +107,10 @@ struct boot_domain {
     struct boot_module *initrd;
 
     const char *cmdline;
+
+#if __has_include(<asm/bootfdt.h>)
+    struct arch_boot_domain arch;
+#endif
 };
 
 #define BOOTMOD_MAX_CMDLINE 1024
-- 
2.43.0


