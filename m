Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7DAD90F3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014458.1392580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ69A-0001SF-15; Fri, 13 Jun 2025 15:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014458.1392580; Fri, 13 Jun 2025 15:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ699-0001PE-TP; Fri, 13 Jun 2025 15:16:47 +0000
Received: by outflank-mailman (input) for mailman id 1014458;
 Fri, 13 Jun 2025 15:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ698-0001Mm-89
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:16:46 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2416::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68e860fb-4869-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:16:43 +0200 (CEST)
Received: from DM6PR08CA0031.namprd08.prod.outlook.com (2603:10b6:5:80::44) by
 BY5PR12MB4162.namprd12.prod.outlook.com (2603:10b6:a03:201::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 15:16:39 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:80:cafe::b5) by DM6PR08CA0031.outlook.office365.com
 (2603:10b6:5:80::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Fri,
 13 Jun 2025 15:16:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:38 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:35 -0500
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
X-Inumbo-ID: 68e860fb-4869-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIaGggADv+g05F0/qIkRzvOLCE1t+yaKqRYWC0y6PUzT9mJgbTbKAxojPW8oU575iJ5Oi7jQJ8Y1n7x7++6q10r57/EzymV162Su3o8fM64adkKpCEmI75RGdl9hKFC/2ih8Gjd6f+tNpI9Qmu9NQBEKsUpuBC3cgO+Hp56vUVRsQdRBQVyEJHU6KBI5/5UiV3Q0RintV9DDOd6+FZ6HO3NWcPXsd2pj//12ALUY+xQGi3y2ftHKczRtxqpBhgOhJYS//O1EHU+BQQJv2hUdlAtsAZEWtWU84kPG7n0+jmaMuAEW92vzuf3pvmSUtH43vaMvaTLIfkQTdIViFJpBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJfJ8Dj29Mew3Bg03ew0zBBwme1Opwmqo96cBga08KU=;
 b=YHYE1Nnd8jsi2bLogTaWULt8SREjZpIevbV8Gy65mRpsLg5t7x2cKX3R+/PKiHH2xlWQ0bqmtl9nAsLblNu5d+nwSrpmTv5fTwxCUxQbDnNuyJxaCJjjbitG5vHtUkFOW3V/+zWQtiY5IYp/OaxpYwyesWBwH5q0DmBWy2Ye/CkEgmmHsXh5xrixgEvA5ZfEJ7DX1X4dY7dg2xXW7iBGFubj9k0rCEl1cLqZy80C+Ynd1irA0lPwupi2/4Kz4H+pKU87txatm3TcG1XA2ORr2bpkXAJO87LtMktf2ZgSj1esBAXOO/mUIQg651DMzAImlgz9Jg8aw+/rIaq13f9miQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJfJ8Dj29Mew3Bg03ew0zBBwme1Opwmqo96cBga08KU=;
 b=MfxxyIrjNtikKpMM3qlznh38+CejDRJ9si3Gd4HUboLu1ZLn1njCP6AvUW4Kivnu6BNIjsMjshhy0E79DqBA7VCHcQGhnd8gUlJ5Si7/iK/ePJclY7kmG6X4EabxwkmxYA1WYEPhteNqAaWsouoAE6Uj9bCTJ5RJ5LG+v0OXnRc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 04/14] xen: Rename bootmodule{,s} to boot_module{,s}
Date: Fri, 13 Jun 2025 17:13:13 +0200
Message-ID: <20250613151612.754222-5-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|BY5PR12MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: 367f0235-8ea3-4a17-4637-08ddaa8d4b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?76pQZLmgNHLTTBVnjUmVlm6JIY2joOCGdd2KgUz0E4EPi32mcYKRPqOVwsuS?=
 =?us-ascii?Q?xxfUI24XV9P/rw41ng73FBIo8pQE92iYa+J/gdj9+XJg2LH0sj8j/ZSPgNbk?=
 =?us-ascii?Q?jb9jeAna3NuACQKcG7prFtkTazvcKH4LDlyKtnNFLOetrKW/POkN943BVLwD?=
 =?us-ascii?Q?6R2ILy/rbKutiC/K91WBEDLV7L5BmW128Y2M7bL6KTmSoluhKxZt8K70bDhK?=
 =?us-ascii?Q?qnPkdg7IzAdiyxPZmpvlWAxqHabjstNscxCD8h8zusNefKTuBo/AdnJZa4+l?=
 =?us-ascii?Q?H+jLI275Oq/QB53zpxDrgq9tpmBJkTAlYZY1W/kqQIy0sw1Z5A4q5SyB+6Eq?=
 =?us-ascii?Q?R+yVWWh8CHxXMg28t5zxjdcG+MSHMH1tw71sJJZW/iQV6kd0i+hNb2A93/Dj?=
 =?us-ascii?Q?+3zGXaCPSaXCZChcLR1YkXXerOI9L/Xo4ZuLqBG0N6MR9GDutmoERR1+OeR8?=
 =?us-ascii?Q?o8JBinS8ivl2oi+JExOH26LTE1VxdtbvgOTCsEGm4dX15RH33Ve9WO9tWuzl?=
 =?us-ascii?Q?ARxmw1b6wIq16K3U+oJvIjq83HX+utT+iak+wUc2HrAqNUfjHvfOfbBFuojf?=
 =?us-ascii?Q?UQf/Rgxy1wIDlpPNe0y9UWZWwJkCTPCSU6S9hbFGjYOfy0s0v/tDLfuGh9VX?=
 =?us-ascii?Q?J1HyetoetC5QMNAjE+M79S0iaNb8fKvVj2sNGHOei8QYsZgdBtq8PYp+bUlC?=
 =?us-ascii?Q?MSejROZSpxlTlIE6uh3kGpkahtiB+ULAy5FjpcP5q5dbWUcu4Ck35RRIFTM8?=
 =?us-ascii?Q?Sk134H/xMX6XH5QKXg0hzwE56GGU8sVMz+nqv3WjO39OqN/CgLRbWa16tnpP?=
 =?us-ascii?Q?xm5vJTD9fZ0P4V1eKyqONAwcCFuopd0QGbcMJpFq9gmg50ZKBQGHBoX/6ofW?=
 =?us-ascii?Q?JCthiXaHJTE5/mI7oEPZlt4tf5oqvPAJhoL8KaVsoMkG1vco0Olgc5ociGc6?=
 =?us-ascii?Q?+ur/DzlIcFmjA8humZa4FoB2JIHKmPOSeoWNCf1zuYzU068UCFZugCohHWMD?=
 =?us-ascii?Q?09isn8w0u29TclmNjfOn8RLfP6El6G7XWtp0vuZmT1khhtdPU0Dn3W7pR8lF?=
 =?us-ascii?Q?T9SjE89oTERrSKkhD7wvwPmWUEJ6UXon182ao+zDlQ1tzFQs+okOWMmZ3eWb?=
 =?us-ascii?Q?Pp1SoJErGYq/r7BckYhSqCyh69V5DbhQvWBEuZLxNd0S9mlmz6sP7b3tovTM?=
 =?us-ascii?Q?UwTeMzsXrGTpS0zsf21cqoxVwRpXgnP5FlywSf1ofxUg6hPS5r8TF8Tngrdb?=
 =?us-ascii?Q?jZMZ+3LFxUcQ9+j5IGLX2j3MWBOxQDH6F9Cy3o9oD7sKC04u8mNDZTL7uO1M?=
 =?us-ascii?Q?5CqmMjLWiaVQe0GueoK2l4qT+yauQyhJC1ymQt9YHrKaJ4XNlRLsedP6TFmp?=
 =?us-ascii?Q?skhcY/EcU8x7cww4h85J9TAe9xBUXsk/6SXOf7ubQT4wJfIRDZoOUGhtDxnN?=
 =?us-ascii?Q?5/Ef+6EDqehDM6gLYgZ13Nhy4Q4+exELjGY7uL5cJ/gDBHtwHkjuNfp+PRNd?=
 =?us-ascii?Q?ejUY2sr0HTfBsdP7J80whgLrrWVbCIQboGDv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:38.8236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367f0235-8ea3-4a17-4637-08ddaa8d4b6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4162

... in alignment with the new coding style on word splitting for type
names.

This aligns its name with the largely duplicate boot_module struct
in x86. While there's no equivalent to "struct bootmodules" in x86,
changing one and not the other is just confusing. Same with various
comments and function names.

Rather than making a long subfield name even longer, remove the
_bootmodule suffix in the kernel, initrd and dtb subfields.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/arm/domain_build.c             |  4 +-
 xen/arch/arm/efi/efi-boot.h             |  6 +--
 xen/arch/arm/kernel.c                   |  4 +-
 xen/arch/arm/llc-coloring.c             |  8 ++--
 xen/arch/arm/mmu/setup.c                | 10 ++---
 xen/arch/arm/setup.c                    | 10 ++---
 xen/common/device-tree/bootfdt.c        |  4 +-
 xen/common/device-tree/bootinfo.c       | 52 ++++++++++++-------------
 xen/common/device-tree/dom0less-build.c | 25 ++++++------
 xen/common/device-tree/domain-build.c   |  2 +-
 xen/common/device-tree/kernel.c         | 22 +++++------
 xen/include/xen/bootfdt.h               | 26 ++++++-------
 xen/include/xen/fdt-kernel.h            |  7 ++--
 xen/xsm/xsm_policy.c                    |  2 +-
 14 files changed, 90 insertions(+), 92 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 590f38e520..7096e176ed 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -579,7 +579,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
 
     if ( dt_node_path_is_equal(node, "/chosen") )
     {
-        const struct bootmodule *initrd = kinfo->initrd_bootmodule;
+        const struct boot_module *initrd = kinfo->initrd;
 
         if ( bootargs )
         {
@@ -1447,7 +1447,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
 {
     int res;
     const char *bootargs = NULL;
-    const struct bootmodule *initrd = kinfo->initrd_bootmodule;
+    const struct boot_module *initrd = kinfo->initrd;
     void *fdt = kinfo->fdt;
 
     dt_dprintk("Create chosen node\n");
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index d2a09ad3a1..2af8e8ea05 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -20,7 +20,7 @@ typedef struct {
 } module_info;
 
 /*
- * Binaries will be translated into bootmodules, the maximum number for them is
+ * Binaries will be translated into boot_modules, the maximum number for them is
  * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
  */
 #define MAX_UEFI_MODULES (MAX_MODULES - 2)
@@ -602,9 +602,9 @@ static void __init efi_arch_handle_module(const struct file *file,
 
     /*
      * modules_available is decremented here because for each dom0 file added
-     * from the configuration file, there will be an additional bootmodule,
+     * from the configuration file, there will be an additional boot_module,
      * so the number of available slots will be decremented because there is a
-     * maximum amount of bootmodules that can be loaded.
+     * maximum amount of boot_modules that can be loaded.
      */
     modules_available--;
 }
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index cb1efb19e7..e734ec5c1e 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -46,7 +46,7 @@ static void __init place_modules(struct kernel_info *info,
                                  paddr_t kernbase, paddr_t kernend)
 {
     /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
-    const struct bootmodule *mod = info->initrd_bootmodule;
+    const struct boot_module *mod = info->initrd;
     const struct membanks *mem = kernel_info_get_mem(info);
     const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
     const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
@@ -175,7 +175,7 @@ static void __init kernel_zimage_load(struct kernel_info *info)
  * Check if the image is a uImage and setup kernel_info
  */
 int __init kernel_uimage_probe(struct kernel_info *info,
-                               struct bootmodule *mod)
+                               struct boot_module *mod)
 {
     struct {
         __be32 magic;   /* Image Header Magic Number */
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 99ac10b610..6f78817c57 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -123,12 +123,12 @@ static paddr_t __init xen_colored_map_size(void)
 
 void __init arch_llc_coloring_init(void)
 {
-    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
+    struct boot_module *xen_boot_module = boot_module_find_by_kind(BOOTMOD_XEN);
 
-    BUG_ON(!xen_bootmodule);
+    BUG_ON(!xen_boot_module);
 
-    xen_bootmodule->size = xen_colored_map_size();
-    xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
+    xen_boot_module->size = xen_colored_map_size();
+    xen_boot_module->start = get_xen_paddr(xen_boot_module->size);
 }
 
 /*
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 30afe97781..eb8ed19ca1 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -246,7 +246,7 @@ paddr_t __init consider_modules(paddr_t s, paddr_t e,
 #ifdef CONFIG_STATIC_SHM
     const struct membanks *shmem = bootinfo_get_shmem();
 #endif
-    const struct bootmodules *mi = &bootinfo.modules;
+    const struct boot_modules *mi = &bootinfo.modules;
     int i;
     int nr;
 
@@ -273,8 +273,8 @@ paddr_t __init consider_modules(paddr_t s, paddr_t e,
     }
 
     /*
-     * i is the current bootmodule we are evaluating, across all
-     * possible kinds of bootmodules.
+     * i is the current boot_module we are evaluating, across all
+     * possible kinds of boot_modules.
      *
      * When retrieving the corresponding reserved-memory addresses, we
      * need to index the reserved_mem bank starting from 0, and only counting
@@ -328,8 +328,8 @@ static void __init create_llc_coloring_mappings(void)
 {
     lpae_t pte;
     unsigned int i;
-    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
-    mfn_t start_mfn = maddr_to_mfn(xen_bootmodule->start), mfn;
+    struct boot_module *xen_boot_module = boot_module_find_by_kind(BOOTMOD_XEN);
+    mfn_t start_mfn = maddr_to_mfn(xen_boot_module->start), mfn;
 
     for_each_xen_colored_mfn ( start_mfn, mfn, i )
     {
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 734e23da44..8b2e65a1a5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -206,11 +206,11 @@ static void __init processor_id(void)
 
 void __init discard_initial_modules(void)
 {
-    struct bootmodules *mi = &bootinfo.modules;
+    struct boot_modules *mi = &bootinfo.modules;
     int i;
 
     /*
-     * When using static heap feature, don't give bootmodules memory back to
+     * When using static heap feature, don't give boot_modules memory back to
      * the heap allocator
      */
     if ( using_static_heap )
@@ -303,7 +303,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
 {
     size_t fdt_size;
     const char *cmdline;
-    struct bootmodule *xen_bootmodule;
+    struct boot_module *xen_boot_module;
     struct domain *d;
     int rc, i;
 
@@ -327,10 +327,10 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
               fdt_paddr);
 
     /* Register Xen's load address as a boot module. */
-    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
+    xen_boot_module = add_boot_module(BOOTMOD_XEN,
                              virt_to_maddr(_start),
                              (paddr_t)(uintptr_t)(_end - _start), false);
-    BUG_ON(!xen_bootmodule);
+    BUG_ON(!xen_boot_module);
 
     fdt_size = boot_fdt_info(device_tree_flattened, fdt_paddr);
 
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 9daea06e57..39334d6205 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -314,7 +314,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
     static int __initdata kind_guess = 0;
     const struct fdt_property *prop;
     const __be32 *cell;
-    bootmodule_kind kind;
+    boot_module_kind kind;
     paddr_t start, size;
     int len;
     /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
@@ -518,7 +518,7 @@ static void __init early_print_info(void)
 {
     const struct membanks *mi = bootinfo_get_mem();
     const struct membanks *mem_resv = bootinfo_get_reserved_mem();
-    struct bootmodules *mods = &bootinfo.modules;
+    struct boot_modules *mods = &bootinfo.modules;
     struct bootcmdlines *cmds = &bootinfo.cmdlines;
     unsigned int i;
 
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index 717cfa0962..2a27d1318b 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -21,7 +21,7 @@
 
 struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
 
-const char * __init boot_module_kind_as_string(bootmodule_kind kind)
+const char * __init boot_module_kind_as_string(boot_module_kind kind)
 {
     switch ( kind )
     {
@@ -49,7 +49,7 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     unsigned int i;
 
     /*
-     * i is the current bootmodule we are evaluating across all possible
+     * i is the current boot_module we are evaluating across all possible
      * kinds.
      */
     for ( i = first; i < reserved_mem->nr_banks; i++ )
@@ -143,18 +143,18 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
  * TODO: '*_end' could be 0 if the module/region is at the end of the physical
  * address space. This is for now not handled as it requires more rework.
  */
-static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
-                                             paddr_t region_start,
-                                             paddr_t region_size)
+static bool __init boot_modules_overlap_check(struct boot_modules *boot_modules,
+                                              paddr_t region_start,
+                                              paddr_t region_size)
 {
     paddr_t mod_start = INVALID_PADDR, mod_end = 0;
     paddr_t region_end = region_start + region_size;
-    unsigned int i, mod_num = bootmodules->nr_mods;
+    unsigned int i, mod_num = boot_modules->nr_mods;
 
     for ( i = 0; i < mod_num; i++ )
     {
-        mod_start = bootmodules->module[i].start;
-        mod_end = mod_start + bootmodules->module[i].size;
+        mod_start = boot_modules->module[i].start;
+        mod_end = mod_start + boot_modules->module[i].size;
 
         if ( region_end <= mod_start || region_start >= mod_end )
             continue;
@@ -210,20 +210,20 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
                                    allow_memreserve_overlap) )
             return true;
 
-    /* Check if input region is overlapping with bootmodules */
-    if ( bootmodules_overlap_check(&bootinfo.modules,
-                                   region_start, region_size) )
+    /* Check if input region is overlapping with boot_modules */
+    if ( boot_modules_overlap_check(&bootinfo.modules,
+                                    region_start, region_size) )
         return true;
 
     return false;
 }
 
-struct bootmodule __init *add_boot_module(bootmodule_kind kind,
-                                          paddr_t start, paddr_t size,
-                                          bool domU)
+struct boot_module __init *add_boot_module(boot_module_kind kind,
+                                           paddr_t start, paddr_t size,
+                                           bool domU)
 {
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
+    struct boot_modules *mods = &bootinfo.modules;
+    struct boot_module *mod;
     unsigned int i;
 
     if ( mods->nr_mods == MAX_MODULES )
@@ -266,10 +266,10 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
  * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
  * modules.
  */
-struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind kind)
+struct boot_module * __init boot_module_find_by_kind(boot_module_kind kind)
 {
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
+    struct boot_modules *mods = &bootinfo.modules;
+    struct boot_module *mod;
     int i;
     for (i = 0 ; i < mods->nr_mods ; i++ )
     {
@@ -281,7 +281,7 @@ struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind kind)
 }
 
 void __init add_boot_cmdline(const char *name, const char *cmdline,
-                             bootmodule_kind kind, paddr_t start, bool domU)
+                             boot_module_kind kind, paddr_t start, bool domU)
 {
     struct bootcmdlines *cmds = &bootinfo.cmdlines;
     struct bootcmdline *cmd;
@@ -310,7 +310,7 @@ void __init add_boot_cmdline(const char *name, const char *cmdline,
  * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
  * modules.
  */
-struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind)
+struct bootcmdline * __init boot_cmdline_find_by_kind(boot_module_kind kind)
 {
     struct bootcmdlines *cmds = &bootinfo.cmdlines;
     struct bootcmdline *cmd;
@@ -340,11 +340,11 @@ struct bootcmdline * __init boot_cmdline_find_by_name(const char *name)
     return NULL;
 }
 
-struct bootmodule * __init boot_module_find_by_addr_and_kind(bootmodule_kind kind,
-                                                             paddr_t start)
+struct boot_module * __init boot_module_find_by_addr_and_kind(
+    boot_module_kind kind, paddr_t start)
 {
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
+    struct boot_modules *mods = &bootinfo.modules;
+    struct boot_module *mod;
     unsigned int i;
 
     for (i = 0 ; i < mods->nr_mods ; i++ )
@@ -366,7 +366,7 @@ struct bootmodule * __init boot_module_find_by_addr_and_kind(bootmodule_kind kin
  */
 static paddr_t __init next_module(paddr_t s, paddr_t *end)
 {
-    struct bootmodules *mi = &bootinfo.modules;
+    struct boot_modules *mi = &bootinfo.modules;
     paddr_t lowest = ~(paddr_t)0;
     int i;
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 3d503c6973..221b875a2f 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -44,13 +44,13 @@ void __init set_xs_domain(struct domain *d)
 
 bool __init is_dom0less_mode(void)
 {
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
+    struct boot_modules *mods = &bootinfo.modules;
+    struct boot_module *mod;
     unsigned int i;
     bool dom0found = false;
     bool domUfound = false;
 
-    /* Look into the bootmodules */
+    /* Look into the boot_modules */
     for ( i = 0 ; i < mods->nr_mods ; i++ )
     {
         mod = &mods->module[i];
@@ -374,18 +374,17 @@ static int __init check_partial_fdt(void *pfdt, size_t size)
     return 0;
 }
 
-static int __init domain_handle_dtb_bootmodule(struct domain *d,
-                                               struct kernel_info *kinfo)
+static int __init domain_handle_dtb_boot_module(struct domain *d,
+                                                struct kernel_info *kinfo)
 {
     void *pfdt;
     int res, node_next;
 
-    pfdt = ioremap_cache(kinfo->dtb_bootmodule->start,
-                         kinfo->dtb_bootmodule->size);
+    pfdt = ioremap_cache(kinfo->dtb->start, kinfo->dtb->size);
     if ( pfdt == NULL )
         return -EFAULT;
 
-    res = check_partial_fdt(pfdt, kinfo->dtb_bootmodule->size);
+    res = check_partial_fdt(pfdt, kinfo->dtb->size);
     if ( res < 0 )
         goto out;
 
@@ -459,8 +458,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     sizecells = GUEST_ROOT_SIZE_CELLS;
 
     /* Account for domU passthrough DT size */
-    if ( kinfo->dtb_bootmodule )
-        fdt_size += kinfo->dtb_bootmodule->size;
+    if ( kinfo->dtb )
+        fdt_size += kinfo->dtb->size;
 
     /* Cap to max DT size if needed */
     fdt_size = min(fdt_size, SZ_2M);
@@ -507,13 +506,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
         goto err;
 
     /*
-     * domain_handle_dtb_bootmodule has to be called before the rest of
+     * domain_handle_dtb_boot_module has to be called before the rest of
      * the device tree is generated because it depends on the value of
      * the field phandle_intc.
      */
-    if ( kinfo->dtb_bootmodule )
+    if ( kinfo->dtb )
     {
-        ret = domain_handle_dtb_bootmodule(d, kinfo);
+        ret = domain_handle_dtb_boot_module(d, kinfo);
         if ( ret )
             goto err;
     }
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 6b8b8d7cac..fa4f700597 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -347,7 +347,7 @@ void __init dtb_load(struct kernel_info *kinfo,
 void __init initrd_load(struct kernel_info *kinfo,
                         copy_to_guest_phys_cb copy_to_guest)
 {
-    const struct bootmodule *mod = kinfo->initrd_bootmodule;
+    const struct boot_module *mod = kinfo->initrd;
     paddr_t load_addr = kinfo->initrd_paddr;
     paddr_t paddr, len;
     int node;
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
index cb04cd9d50..e1b22dc1c7 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -21,7 +21,7 @@ static uint32_t __init output_length(char *image, unsigned long image_len)
     return *(uint32_t *)&image[image_len - 4];
 }
 
-int __init kernel_decompress(struct bootmodule *mod, uint32_t offset)
+int __init kernel_decompress(struct boot_module *mod, uint32_t offset)
 {
     char *output, *input;
     char magic[2];
@@ -92,7 +92,7 @@ int __init kernel_decompress(struct bootmodule *mod, uint32_t offset)
         free_domheap_page(pages + i);
 
     /*
-     * When using static heap feature, don't give bootmodules memory back to
+     * When using static heap feature, don't give boot_modules memory back to
      * the heap allocator
      */
     if ( using_static_heap )
@@ -118,7 +118,7 @@ int __init kernel_decompress(struct bootmodule *mod, uint32_t offset)
 int __init kernel_probe(struct kernel_info *info,
                         const struct dt_device_node *domain)
 {
-    struct bootmodule *mod = NULL;
+    struct boot_module *mod = NULL;
     struct bootcmdline *cmd = NULL;
     struct dt_device_node *node;
     u64 kernel_addr, initrd_addr, dtb_addr, size;
@@ -140,8 +140,8 @@ int __init kernel_probe(struct kernel_info *info,
 
         mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
 
-        info->kernel_bootmodule = mod;
-        info->initrd_bootmodule = boot_module_find_by_kind(BOOTMOD_RAMDISK);
+        info->kernel = mod;
+        info->initrd = boot_module_find_by_kind(BOOTMOD_RAMDISK);
 
         cmd = boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
         if ( cmd )
@@ -162,7 +162,7 @@ int __init kernel_probe(struct kernel_info *info,
                 dt_get_range(&val, node, &kernel_addr, &size);
                 mod = boot_module_find_by_addr_and_kind(
                         BOOTMOD_KERNEL, kernel_addr);
-                info->kernel_bootmodule = mod;
+                info->kernel = mod;
             }
             else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
             {
@@ -171,7 +171,7 @@ int __init kernel_probe(struct kernel_info *info,
 
                 val = dt_get_property(node, "reg", &len);
                 dt_get_range(&val, node, &initrd_addr, &size);
-                info->initrd_bootmodule = boot_module_find_by_addr_and_kind(
+                info->initrd = boot_module_find_by_addr_and_kind(
                         BOOTMOD_RAMDISK, initrd_addr);
             }
             else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
@@ -183,7 +183,7 @@ int __init kernel_probe(struct kernel_info *info,
                 if ( val == NULL )
                     continue;
                 dt_get_range(&val, node, &dtb_addr, &size);
-                info->dtb_bootmodule = boot_module_find_by_addr_and_kind(
+                info->dtb = boot_module_find_by_addr_and_kind(
                         BOOTMOD_GUEST_DTB, dtb_addr);
             }
             else
@@ -201,10 +201,10 @@ int __init kernel_probe(struct kernel_info *info,
     }
 
     printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
-           info->d, info->kernel_bootmodule->start);
-    if ( info->initrd_bootmodule )
+           info->d, info->kernel->start);
+    if ( info->initrd )
         printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
-               info->initrd_bootmodule->start);
+               info->initrd->start);
 
     /*
      * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index ff40f3078e..236b456dd2 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -23,7 +23,7 @@ typedef enum {
     BOOTMOD_GUEST_DTB,
     BOOTMOD_MICROCODE,
     BOOTMOD_UNKNOWN
-}  bootmodule_kind;
+}  boot_module_kind;
 
 enum membank_type {
     /*
@@ -103,8 +103,8 @@ struct shared_meminfo {
  * initrd to be compatible with all versions of the multiboot spec.
  */
 #define BOOTMOD_MAX_CMDLINE 1024
-struct bootmodule {
-    bootmodule_kind kind;
+struct boot_module {
+    boot_module_kind kind;
     bool domU;
     paddr_t start;
     paddr_t size;
@@ -113,16 +113,16 @@ struct bootmodule {
 /* DT_MAX_NAME is the node name max length according the DT spec */
 #define DT_MAX_NAME 41
 struct bootcmdline {
-    bootmodule_kind kind;
+    boot_module_kind kind;
     bool domU;
     paddr_t start;
     char dt_name[DT_MAX_NAME];
     char cmdline[BOOTMOD_MAX_CMDLINE];
 };
 
-struct bootmodules {
+struct boot_modules {
     int nr_mods;
-    struct bootmodule module[MAX_MODULES];
+    struct boot_module module[MAX_MODULES];
 };
 
 struct bootcmdlines {
@@ -134,7 +134,7 @@ struct bootinfo {
     struct meminfo mem;
     /* The reserved regions are only used when booting using Device-Tree */
     struct meminfo reserved_mem;
-    struct bootmodules modules;
+    struct boot_modules modules;
     struct bootcmdlines cmdlines;
 #ifdef CONFIG_ACPI
     struct meminfo acpi;
@@ -176,16 +176,16 @@ bool check_reserved_regions_overlap(paddr_t region_start,
                                     paddr_t region_size,
                                     bool allow_memreserve_overlap);
 
-struct bootmodule *add_boot_module(bootmodule_kind kind,
+struct boot_module *add_boot_module(boot_module_kind kind,
                                    paddr_t start, paddr_t size, bool domU);
-struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
-struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
+struct boot_module *boot_module_find_by_kind(boot_module_kind kind);
+struct boot_module * boot_module_find_by_addr_and_kind(boot_module_kind kind,
                                                              paddr_t start);
 void add_boot_cmdline(const char *name, const char *cmdline,
-                      bootmodule_kind kind, paddr_t start, bool domU);
-struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
+                      boot_module_kind kind, paddr_t start, bool domU);
+struct bootcmdline *boot_cmdline_find_by_kind(boot_module_kind kind);
 struct bootcmdline * boot_cmdline_find_by_name(const char *name);
-const char *boot_module_kind_as_string(bootmodule_kind kind);
+const char *boot_module_kind_as_string(boot_module_kind kind);
 
 void populate_boot_allocator(void);
 
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 1939c3ebf7..12a0b42d17 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -34,7 +34,7 @@ struct kernel_info {
     paddr_t gnttab_size;
 
     /* boot blob load addresses */
-    const struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
+    const struct boot_module *kernel, *initrd, *dtb;
     const char* cmdline;
     paddr_t dtb_paddr;
     paddr_t initrd_paddr;
@@ -121,7 +121,7 @@ int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
  */
 void kernel_load(struct kernel_info *info);
 
-int kernel_decompress(struct bootmodule *mod, uint32_t offset);
+int kernel_decompress(struct boot_module *mod, uint32_t offset);
 
 int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
 
@@ -130,8 +130,7 @@ int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
  * call here just for compatability with Arm code.
  */
 #ifdef CONFIG_ARM
-struct bootmodule;
-int kernel_uimage_probe(struct kernel_info *info, struct bootmodule *mod);
+int kernel_uimage_probe(struct kernel_info *info, struct boot_module *mod);
 #endif
 
 #endif /* __XEN_FDT_KERNEL_H__ */
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 7f70d860bd..1f88b4fc5a 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -68,7 +68,7 @@ int __init xsm_multiboot_policy_init(
 #ifdef CONFIG_HAS_DEVICE_TREE
 int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
 {
-    struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
+    struct boot_module *mod = boot_module_find_by_kind(BOOTMOD_XSM);
     paddr_t paddr, len;
 
     if ( !mod || !mod->size )
-- 
2.43.0


