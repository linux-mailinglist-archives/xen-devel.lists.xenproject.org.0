Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D31AE2232
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021082.1397136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgV1-0005uQ-52; Fri, 20 Jun 2025 18:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021082.1397136; Fri, 20 Jun 2025 18:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgV1-0005sD-1T; Fri, 20 Jun 2025 18:30:03 +0000
Received: by outflank-mailman (input) for mailman id 1021082;
 Fri, 20 Jun 2025 18:30:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgUz-00057I-TH
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:30:02 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2406::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90d3be23-4e04-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 20:29:57 +0200 (CEST)
Received: from BL6PEPF00016417.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:5) by SN7PR12MB7227.namprd12.prod.outlook.com
 (2603:10b6:806:2aa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 18:29:53 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2a01:111:f403:c803::2) by BL6PEPF00016417.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:29:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:29:52 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:29:44 -0500
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
X-Inumbo-ID: 90d3be23-4e04-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnkJWWZvK0S8x1phXZ/FVznDQQudmQY3DY6f0NZ96dzVibGehnw5s8STzZmiaPGlX8HAArHFxoUEllCk1BzNt6ZchEBJwf+cb0h3bymBMMlLKhE2G4YPqxGS6vCQ9saRNA+hARaMzcd0Gq8XzWK6LMdKy+BNpuWzHZNyfUSCFpY9pODjOeLmqzr8hJJBxg3WW6uzsCTSw4BlyzuNtTV4I15rtoZH8duvz/jGMG82ndQQA6xyZLbJkyr0JoSpBLAGNAyL4Do4jLm+T61YpkA6cyA64TXohVI0isWBiP0pfreZsKCCuONeoZ95FE4f1VQPA7beucjfaeEue3ltE56/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p44M7RzHGXTyxxIkCh7v0gyMVi75uj2BQ3nBpbpii4U=;
 b=K+aZpKz4kX4kXlNNGD2FtB6/ppGOZcfzN/RHN+Masej8iZHde7HUqY2FfX87K94GIrtZ7f5Mo5DrCFzmn4geOruNC+azpXKJjmoekncjqzAJtimIWVBBOpdnYU5GMsiXR0Pm4RorGFftwS17uqofx53m3wOR/CELSYn659mIzHs1VHCvJyUEw6L3f48fVfxAqF13IvOa6z+crizHMgWKjaGBXuLFmfnxQ6n09p1r8oP1TB6BOiRs+cFRKOhobzUlCaCgl/+bpt5LF18UKvnMm3qB+uFABAGPZvFgVQBOpmvzKVQBrtlCMwCiw6SZmnOgQUP1sE/ZY8CM5Xgfv5pHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p44M7RzHGXTyxxIkCh7v0gyMVi75uj2BQ3nBpbpii4U=;
 b=IvknDJyBIEZqnTHaG8QVIKijYh8J5GbNRKuj6Qj/B/EuTb7E7xyl+mNohELVaLvHX+Tt4tEaLKq6teQU4cbwt2AsQ5IWx2+v/AvYCt+TgN08wgoYgWEOf9Qgijph8rSkDn+kEgpOZR3MO2gtyLhhMDhodvLzgbIogGf1JmDXwkU=
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
Subject: [PATCH v4 02/12] xen: Rename bootmodule{,s} to boot_module{,s}
Date: Fri, 20 Jun 2025 20:28:48 +0200
Message-ID: <20250620182859.23378-3-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|SN7PR12MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fbfb97-3f0f-4e56-2078-08ddb02872cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FJrMlR6NWbsUdP4XnMREuiiza4C58+PIFGAD8r4sMQ6nouQetgM3Xu2No7iK?=
 =?us-ascii?Q?vJ5+uRiGwq/PUpgx9N4lh0GHbGcNBRQ0TGFQZpY5/5Vn4XfYn9UifN3g67H0?=
 =?us-ascii?Q?YsjyYgUZ1P5zzXOTm6J3EthWrCsk9vP9quafTttYD/X7EFMj6a63x7OCbRrS?=
 =?us-ascii?Q?Mfl0JjNTiM3nON/gfy0R/YmbPx+znKV0vgkFz23LL+fNR1+MLvE8YMF7JBJh?=
 =?us-ascii?Q?SI4ekZT7kiBzDb0+K2yd7r1n37/MFlYkx2o2mN8lIivdDAALiwop1Zmz2Wd8?=
 =?us-ascii?Q?21w5AVNhUhu/8jp4E1D2VmzbyH1PgIb+y8dR1vyIgH4Z1mDQjjEOsUZf+/UE?=
 =?us-ascii?Q?WHPXWC2p5OWEOulhN1yhW/XxNbkXJJJ2PyCjvRROqgmvPBR3mD2BesKVMn7D?=
 =?us-ascii?Q?u30XAewiERmpuATImKtARY2G75cmR1FCdCEag94ORkOIauddJt2+hhpC6csh?=
 =?us-ascii?Q?mCaEI+cE5dILnvRhs0ijs0kDPojr2xLhFnTFPOy8A3FOjwBR5Kn4V17c250n?=
 =?us-ascii?Q?3tmIG3lxoRzGtqKWIL6dbSCj3SIQFmqcotgCr/nqvf8FREVziA+hR8ssGKUl?=
 =?us-ascii?Q?r5B/ZACRvA8mIUUiY7I8Jcq/3BnvdnseggJECcAE36beLG0RAtUQEb8Zreqz?=
 =?us-ascii?Q?BK7A9Zbh2+cSdIrpT4sqN+janMmzrztrQ3HBzHCHmacNAAJ91Fn57rkSkCrr?=
 =?us-ascii?Q?muXuW8GDT5nRUl4Y7GJB/UlpvzyMRlB28OtOtnTE+GRDcj2ZF5johrRzh1sA?=
 =?us-ascii?Q?cLWr+7nuIajeCeZNki+FbgUZyuc5FmzyAhkgijqvtJvod0wxNJ7XPC9yU7bi?=
 =?us-ascii?Q?0qTTkmRy4zRxI/X9B4GuTgwVxZk0j/h1rwE6Y19u+od4kH2nebnQwW4Z/C+H?=
 =?us-ascii?Q?W4j+ed8tO5hfsDIUhlG5G7cJlRyE1yPSD0dnA/M7xI7AlOCh6BSJNrOJQ1A6?=
 =?us-ascii?Q?pE4KhBHylgvbyUsnVk8mu2Lr3EcP6Kwa/dyBabMVWnc94cURtnXAlF0PzpKU?=
 =?us-ascii?Q?C4EKANDUDH71q28Ooqa0/rIY3tnTE3lIAiZ5f4oUzhRA5QX0XpgTZKkx2Z/e?=
 =?us-ascii?Q?XyH6KYYGETwk2jDhUEyz6CK18jl2xGVIEbI7+SUeBInNPomP4wCswLEe5B/K?=
 =?us-ascii?Q?hmPFU3EF4mlPNAsafioAcdpAZvLy13awvn9vUp7PwIB9+TK7NcpUWZTQuxRu?=
 =?us-ascii?Q?p9PKGu0cLp+cS1DBMcSvuJbXWvYWNpH9HML750MOdLoHl4tXL3mFnfnHQbaR?=
 =?us-ascii?Q?FlEb89OddeBSbaqB4fGWDB74gtKD6qMbeQVvMVsXk7X0YI6Abt/X8ijrw5MM?=
 =?us-ascii?Q?J3SfFv3zljPS+5SB2J1c2D6maqFwzYg8VhMfRyk/Yu8lhg9Xa206XZut3vVB?=
 =?us-ascii?Q?K48KabOPJlydwjV0RnQq7lA4sUQri+9B7ae5+NkEDBKznyFHQDnbK/3sh8EW?=
 =?us-ascii?Q?Ks92cg87W+awLyHQA7X19qdz4D+IrJy5VN1S1wf6TgvA2HDA/+TaJsQ+2JoB?=
 =?us-ascii?Q?AgPDA57sPys+hDVwvkdDG/sM+cT+yZpHGu9d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:29:52.7415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fbfb97-3f0f-4e56-2078-08ddb02872cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7227

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-By: Daniel P. Smith <dpsmith@apertussolutions.com>
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
index 4ff161887e..3f5c7c2e5a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -579,7 +579,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
 
     if ( dt_node_path_is_equal(node, "/chosen") )
     {
-        const struct bootmodule *initrd = kinfo->initrd_bootmodule;
+        const struct boot_module *initrd = kinfo->initrd;
 
         if ( bootargs )
         {
@@ -1517,7 +1517,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
 {
     int res;
     const char *bootargs = NULL;
-    const struct bootmodule *initrd = kinfo->initrd_bootmodule;
+    const struct boot_module *initrd = kinfo->initrd;
     void *fdt = kinfo->fdt;
 
     dt_dprintk("Create chosen node\n");
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index ee80560e13..faabe5a6a8 100644
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
index ed72317af3..58acc2d0d4 100644
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
index 99ea81198a..cd01a8b4bc 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -352,7 +352,7 @@ void __init dtb_load(struct kernel_info *kinfo,
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


