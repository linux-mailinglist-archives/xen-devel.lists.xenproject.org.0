Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78BAEF5BA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029518.1403277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgC-0002kD-Ec; Tue, 01 Jul 2025 10:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029518.1403277; Tue, 01 Jul 2025 10:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgC-0002iC-9t; Tue, 01 Jul 2025 10:57:36 +0000
Received: by outflank-mailman (input) for mailman id 1029518;
 Tue, 01 Jul 2025 10:57:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lih=ZO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWYgA-0002hE-CG
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:57:34 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2009::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30362da4-566a-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 12:57:33 +0200 (CEST)
Received: from BN0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:408:ee::15)
 by PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 1 Jul
 2025 10:57:28 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::e) by BN0PR04CA0010.outlook.office365.com
 (2603:10b6:408:ee::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 10:57:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 10:57:28 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 05:57:26 -0500
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
X-Inumbo-ID: 30362da4-566a-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHTFlUe3avZBkREl80wLyu3Ta2UuZ+R+N3WjOV3yRcEdSzh1wQAJuz+xwPCH7PGBb0zo38mtwf5uD6QL8wqwzC0PHgjckTUUn7YoJ3lXtNvwDlPMEzx7SlGjJOd011dc0eC7wK+lBUoilQMjka5qeCAHje+qA/LgcHhF8Lulp/ZYxwZUJfHGT7KhGPFarYbMeW4h/viI3eLZT8zytnjF9nT8vvDvzKCrB82sgWUt8zl9wxOEm/HadR1fL2dPt2xWsTTcZDS1dvkosKI4pRlY0TB+9ZZofvfZ6GJQekJCktJELgxIss6fV5IPyClm/9kGIzABlI5wDkaYAYOvGeoAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhjfLrwIQPJ+iVWbDjZy0i0N31K4BCB4hKss8LyD06s=;
 b=KivAWMjbqFVgtGoS20x/uasPXb2zmVoBDZErtR9w+qL+KRtkLs2z93SaLolT26GkxvyU0bREAJCThpiAhspUUh3xeO0KvmL/t8mx1J63Tp24ugAua8UB2WKJNA3kozL8XGpWySbVqeOdGpQqubR4HXpRg1qODUxIgCjfedMjkI5XB7tWLgiWyM5Z1uT5FcA6kuDJPtO7tSTIoZQKVn8nNHeCjuOafy4LKRbdW6LZnmTZzGNovb9ZmXv0o+FgdpfmU4SGhAzMa9ajw9P4PiTwlrMJt4l83kGFDIHNqtWXl36bNFWtAvJ6Nf495Vk9ZJ3gYt9wPBiFhSgCPZEXjCn9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhjfLrwIQPJ+iVWbDjZy0i0N31K4BCB4hKss8LyD06s=;
 b=EqpPaMz0uTwKz1Pxd2aKmCKwCtdQ6P8JC1jitx6SEgbr9mPgDjReTJVRxNIb3fRC/9dLkCteq8TTGaHKHh6q+DjcrttWKggehLnyfTGbrjTLIjjgnI4YpnhxAkLNFejLUYzSZDReCQE7CwmFZO+BBTrLWzMF29t9r23ekhxO60c=
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
	<michal.orzel@amd.com>
Subject: [PATCH v5 03/10] x86: Replace arch-specific boot_domain with the common one
Date: Tue, 1 Jul 2025 12:56:57 +0200
Message-ID: <20250701105706.86133-4-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 29eba615-4dbc-4451-c829-08ddb88e123a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CIO+l1RkJyxzAb4SbybULhSAAZKM9NCc1qruB2CZz0nfh8wq/G9rkxM28ACB?=
 =?us-ascii?Q?iMwd9g7q6c3k0Ai3R9gt2eSOyCxStDfkPBFRE+DVrpWE1TbxNKBxbq61T6ES?=
 =?us-ascii?Q?ML4PUMNO2owUclhFxg2wdYrGN0G0g6oq9U59ZYIRTJBNqb89YaelVha5oV3a?=
 =?us-ascii?Q?YMZzKq/JXPboJZK4zD/qh2l4Hyp7rJup7bfIhjjqKhKg3R42EXXyQREfbjQ/?=
 =?us-ascii?Q?0wCVJP3Ymp35u+dV/iluxC1mCqUsV+Q9i0jkQQYi20cWJl3u4I6u8xqYPPdH?=
 =?us-ascii?Q?59QKZx7yAQggAQXycAI/qPtUx2wUl2oTvoDClza3suRDIBcZ+AtnHb/806K4?=
 =?us-ascii?Q?0bHPdyCtXFSzn6T8o1g6n0Ogib9jNEiBuJpQAp8/u3fVAPwefRzof5i0G45o?=
 =?us-ascii?Q?asJHk9sp3wm15MtzKOYPzIEvV8Pp8HFVP477AyHtvMUcn0mGWLGNfRZS1QI5?=
 =?us-ascii?Q?xQ48d8wCvNaJcmKgZrPzvi2lffx9hJ0AFgHYRTiLgxdgZ5un6ok3E9CZ6jJ/?=
 =?us-ascii?Q?gMb6Vpwq4VfkkTzdteSLuWy0uo96lNbP7zyVPo45kFXkJ9875bzSnCZRZKwc?=
 =?us-ascii?Q?JfVTe/mWyd7rD686axAZyuIK1P4dQE0XNGWgo7b0D8w/Gyv+Wj7kkDOkrrXu?=
 =?us-ascii?Q?vKAKhU5OSblxN8vb67jsD5MrTOStBzHAC4yDIgjMAaIloQ+tWW/08Bml2sJR?=
 =?us-ascii?Q?h3Wl0538CGyf9+sxZzlOkHZBVxhBv8dyf8P1ey3efLAZq7XS0lPASWLny8Vy?=
 =?us-ascii?Q?COtNNSuzwKKNkF09G3qHCuvhrQKZY27ARQNKsAi6Ue0kRAQpEIx5Kk5KrGWR?=
 =?us-ascii?Q?JLUynZGCO4k3w6lZ2SchUSrVYXL0vzfjAtrnClOwin90fPisPAasK3AzloAZ?=
 =?us-ascii?Q?3hY2j31/0gnEURJ1Bpz5gVRmms1M0bz+flMZq+1Niu1vy5VxGbn7NTPTjfe0?=
 =?us-ascii?Q?35BiD/otO1WgvXKUOm/rfOLdjzeJDwN6ojllHtYhE4d0wZ6ASfFy0ZUxBxdd?=
 =?us-ascii?Q?wE/uBPdvXlgtIhuR6wdif1Oi6b8R2MTnA+UuVbJ/HpdeSUBXRFOTzjTgpyXD?=
 =?us-ascii?Q?V0FRpH9rogQ8xi5vBaO/DGQXj4L76GiZFNLI7rNC0ay3SgfK7ocLGY/4tPZg?=
 =?us-ascii?Q?oubYLPSl0ylmuSCzH3/dzdiDTntRQvIU3oFSlQ1fMKWxfSvVmD8pjFxPhate?=
 =?us-ascii?Q?+/q3Hhi8BgPWyovYNr34sXpKauR4uiZGoAKHWCTIbjGLa3fy1yWXPSXNgk0V?=
 =?us-ascii?Q?5E1JQw3OYB3VxhgK3itWYbQ4ozskJzXyXh6+iGOKA23bDTtdkbP3jBe5c6SN?=
 =?us-ascii?Q?dXxvu6f79YdwIe1f2dtAGg6Lqd04yk1lZo3A6jpfZW4ycYHPuh0az63mukAv?=
 =?us-ascii?Q?CAHz3F5MTqKxro7wDg17LOKx9M2dwTQF9+2mwkV8JsMEWlELGvXv0ze6j5WA?=
 =?us-ascii?Q?wYiBr1HeoZ7/aCmJYOEqFGvqIxT3cNxq4jkwJVFLqFK12PqNKHWivksdTNU2?=
 =?us-ascii?Q?LsBh2kCsd4SGSBGQc2m7Jbm+VD2LyTuMbp2A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:57:28.6761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29eba615-4dbc-4451-c829-08ddb88e123a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

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
index be0abe30ef..8ea52290b7 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -108,6 +108,10 @@ struct boot_domain {
     struct boot_module *initrd;
 
     const char* cmdline;
+
+#if __has_include(<asm/bootfdt.h>)
+    struct arch_boot_domain arch;
+#endif
 };
 
 /*
-- 
2.43.0


