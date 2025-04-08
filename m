Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68251A8119C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942853.1341955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXT-0001SL-ML; Tue, 08 Apr 2025 16:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942853.1341955; Tue, 08 Apr 2025 16:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXT-0001Pq-Ig; Tue, 08 Apr 2025 16:11:03 +0000
Received: by outflank-mailman (input) for mailman id 942853;
 Tue, 08 Apr 2025 16:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVb-0000a6-RH
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:07 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2413::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb399aa2-1493-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:09:06 +0200 (CEST)
Received: from BL1P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::18)
 by MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 16:09:00 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::2b) by BL1P222CA0013.outlook.office365.com
 (2603:10b6:208:2c7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Tue,
 8 Apr 2025 16:09:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:00 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:08:57 -0500
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
X-Inumbo-ID: cb399aa2-1493-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB1dLP+M9CyLN0EchSSgcFU1bt7bKHNX0+gReExpwYuDHQdQcmwAjUCaqa0TuFmYy9XAQ70IliNTQ5X8iE9dV4O82NTmjCGax3I+V/1/Bj15mZlVmwxPU8ZpPMD/SETYvpxPu2C/FJbcdrL0V7wxqAvAyEuvVsDElB8ZgywT/JR7CfwcOaFGJ9w/I3Vt09x5SN879SWpQ4179uuszZMJ7Hngh+zFAqoz6dX3BUDt6c37kHvZI6LblyKHY+3HvME6xVqAgDNtZcLqFKdywafVR5SrAMoCDp4Vl5ZSB8wdohRprRCKlm8WIX3Z8/aIFPcJOgZ/0irzyxgwYKF6qupE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxHxjqnfxZWF/z08CaV5pCzCkt38zC1qSAYIboC5Tdo=;
 b=G8qz/fJhEaaDDPbarP/Y9SkctfwkHSZMsocc0dy3FFKbb2rJLQpxeiUaUc1TEWtzV+//azW/6IplV6gj//sci9WudN3qbxDXv/xIrwmIQpEf0RPthuJOLzeQEWfhQoTDO9K2GN4S+lJLjiz9kgwB18EWWGMVtcJxTjpQ5PFHRGiRPThwHazcbiEoPm/+NDihASHg5GGDfQt0sAoYVX8O2Ujh+syY3V5X1C9MzOK171EhiPsCGrZf8RDKVtoL1eac7z3ao5dG8367iNJxQIPsI6thc8EAmeDQPkkbfPoeJXGDqooup52hBDgGuhZk8iApK5RX+E/qzWn0SEhsRNapgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxHxjqnfxZWF/z08CaV5pCzCkt38zC1qSAYIboC5Tdo=;
 b=T9nMagcUB5sKvZKTwKJALLHrxBY/uaK69pnAncPPAKuZb+GV5nYQNN90+GW1XaP0Yu+0G0QcIiXGijyo3IRgLJ5CK/dFF00w0Rk7BH4/XPGxKuCrBcYvuydbCsrydEEEeMdPzGglHGQFpD1fiGMeIr4IGvBd4i+FPHOZqX2xZJg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 01/16] x86/boot: introduce boot domain
Date: Tue, 8 Apr 2025 17:07:23 +0100
Message-ID: <20250408160802.49870-2-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|MN2PR12MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f7d27d-86f7-452c-5934-08dd76b7ac6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aHCZo9h1YIlltGgdRECrmi9LmUTe6tG2gdZpYzIdPlmHTH3CFkLTAQgpw5RZ?=
 =?us-ascii?Q?Q5NkMbpwBqLb05JjlD1vYuKTANMzezSJr8QmYxkw5uYY07eB565ABODnfu96?=
 =?us-ascii?Q?sk2xmxQNNuMSKPgRB77SI7+RjX6LFWP9GWeJ1NuM4aeU8fCoH9rlY1OvHyUq?=
 =?us-ascii?Q?3Iu0nauvjgz8bl69RbRdmVduvt3XviMDwn5Jm0BDgBrQS6UMfaeMR9sZllce?=
 =?us-ascii?Q?xs4La1slTnVx7Ew51rZ923Af25wShk1vaEi0qEON8C9qc2TCzr2PlCXxmuyg?=
 =?us-ascii?Q?n1852VEMWZQ1LOQACF5FDyIEUMAx1Sli4qgAPwZRqeMg3oqmA8QxFEU6nWjV?=
 =?us-ascii?Q?kctNGU54KF3tOezBHvgxxeYsXmpO0s3suimm0KpPJRbvky4t832AJaNOIkea?=
 =?us-ascii?Q?bjWWfuiIrSauDUQ+0/jFe1lgwx0YDPlWEKKb5tcg/Y2LgaMDLqfPKNfAU7MQ?=
 =?us-ascii?Q?eoOhTm0zUrURzbBIwPS1n2nipMcQod1npH9DsBBhTedGI2emNISlybUihOS1?=
 =?us-ascii?Q?EkGQreAXtX5FbbKOq1UwcE2NaqSMX7cLE55m+b2V6LPjvOC+8fACLq1jSEoQ?=
 =?us-ascii?Q?X9FtJeiDVNqBRnDQns+IYqzi/trZnuZFlfyg9DuW0kkeSoTEQjNOneSwAEXs?=
 =?us-ascii?Q?kGSvA3fsFveL6S/XNs3Hq+X+5la85dAIoY1kF3+u/NzkujTJLf+n1RF9CH9a?=
 =?us-ascii?Q?z8RYV/p91X66XN4YjK3InYXIjdnED/r5D9LA/tq5DsVrCRFmru0cxADovI/Y?=
 =?us-ascii?Q?IkSsCeym+/0C/XiX4ZrndVybzJ3Vxq2/8zrvPy0zzPucQysG3joBqtLiz2NR?=
 =?us-ascii?Q?0LSsx5vqz1bZar2ha4pgao8igYTF49DWs9Ctbh90E4sVKy0ILzz4wZDA3GZ0?=
 =?us-ascii?Q?6tQ/QYe9bK/agcuor0aJa7z7P20ox8JqZAAHUGPTpEUZP2EROtIdCPHDUEX9?=
 =?us-ascii?Q?0eGVRFn6dZw4IjcrTHS+MKx1Yg2vDUAEd8ZmeuwUx2Mh9ZFCyOyFUHx7f2n8?=
 =?us-ascii?Q?7M7kJQHWaKShkMJe1ov4CTOtOGef1K9fStOvN3r5o+i3gm9STmfktCG1mYbQ?=
 =?us-ascii?Q?tmO4IISt+Ad8KaGSuo8SRks8XpvUxKkSIbE76tN29fppLQUpZeCgeUjWdfCD?=
 =?us-ascii?Q?2D4f3+NcpWZTC9RpDUBlz+y8AgALheEO/wMWKm2Mbhx2TvAmMAMR6Gsvbuuc?=
 =?us-ascii?Q?JA+U6DaVw5RBt1wtSckcX44DGrKcVa4twOiLCZW2dh1qPW2yhiI6zAW+JzQ5?=
 =?us-ascii?Q?/kFa+61YKTXpbKfJM2lC7SNS9wjxxItmN2UhYXv3klzNU33TD2ID7lgLEuGg?=
 =?us-ascii?Q?7Dj1nc0+VYZH5NT/zwpIApa0a79Nu7M6t6mgYdlLMASVDHrgt50wpym0opjn?=
 =?us-ascii?Q?Uy3Bm4w4ru0gOy6GhqJzJG2udN6zIdVvxR9ij4LGUCwi1xyYeHZ3E6EN07c9?=
 =?us-ascii?Q?l7OkMfUGWrMp/p2LHhrX2VQsirSXrdWI6zZZHvmwFsuZ+AJteESBkfAgjhM1?=
 =?us-ascii?Q?ydxqCxNkbsgLi3+wqHZbihMoGcfdcXC5Ij/b?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:00.0171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f7d27d-86f7-452c-5934-08dd76b7ac6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

To begin moving toward allowing the hypervisor to construct more than one
domain at boot, a container is needed for a domain's build information.
Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
struct boot_domain that encapsulate the build information for a domain.

Add a kernel and ramdisk boot module reference along with a struct domain
reference to the new struct boot_domain. This allows a struct boot_domain
reference to be the only parameter necessary to pass down through the domain
construction call chain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
  * Rename bootdomain.h -> boot-domain.h
  * const-ify boot_domain parameter passed to construct_dom0()
  * Rename boot_domain.ramdisk to boot_domain.module
---
 xen/arch/x86/dom0_build.c              |  8 +++++---
 xen/arch/x86/hvm/dom0_build.c          | 23 ++++++++-------------
 xen/arch/x86/include/asm/boot-domain.h | 28 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h    |  5 +++++
 xen/arch/x86/include/asm/dom0_build.h  |  6 +++---
 xen/arch/x86/include/asm/setup.h       |  4 ++--
 xen/arch/x86/pv/dom0_build.c           | 24 ++++++++--------------
 xen/arch/x86/setup.c                   | 24 +++++++++-------------
 8 files changed, 69 insertions(+), 53 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/boot-domain.h

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8191d90a22..0b467fd4a4 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 
 #include <asm/amd.h>
+#include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
 #include <asm/hpet.h>
@@ -614,9 +615,10 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct boot_info *bi, struct domain *d)
+int __init construct_dom0(const struct boot_domain *bd)
 {
     int rc;
+    const struct domain *d = bd->d;
 
     /* Sanity! */
     BUG_ON(!pv_shim && d->domain_id != 0);
@@ -626,9 +628,9 @@ int __init construct_dom0(struct boot_info *bi, struct domain *d)
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(bi, d);
+        rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(bi, d);
+        rc = dom0_construct_pv(bd);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 9fd68df7b9..2a094b3145 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -644,9 +644,11 @@ static bool __init check_and_adjust_load_address(
 }
 
 static int __init pvh_load_kernel(
-    struct domain *d, struct boot_module *image, struct boot_module *initrd,
-    paddr_t *entry, paddr_t *start_info_addr)
+    const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
 {
+    struct domain *d = bd->d;
+    struct boot_module *image = bd->kernel;
+    struct boot_module *initrd = bd->module;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->headroom;
     unsigned long image_len = image->size;
@@ -1328,26 +1330,17 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
+int __init dom0_construct_pvh(const struct boot_domain *bd)
 {
     paddr_t entry, start_info;
-    struct boot_module *image;
-    struct boot_module *initrd = NULL;
-    unsigned int idx;
+    struct domain *d = bd->d;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
-    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
-    if ( idx >= bi->nr_modules )
+    if ( bd->kernel == NULL )
         panic("Missing kernel boot module for %pd construction\n", d);
 
-    image = &bi->mods[idx];
-
-    idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    if ( idx < bi->nr_modules )
-        initrd = &bi->mods[idx];
-
     if ( is_hardware_domain(d) )
     {
         /*
@@ -1385,7 +1378,7 @@ int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, initrd, &entry, &start_info);
+    rc = pvh_load_kernel(bd, &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
new file mode 100644
index 0000000000..5e1e1a0b61
--- /dev/null
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2024 Apertus Solutions, LLC
+ * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
+ * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
+ */
+
+#ifndef __XEN_X86_BOOTDOMAIN_H__
+#define __XEN_X86_BOOTDOMAIN_H__
+
+struct boot_domain {
+    struct boot_module *kernel;
+    struct boot_module *module;
+
+    struct domain *d;
+};
+
+#endif
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
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index f8b4229130..3afc214c17 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -11,10 +11,14 @@
 #include <xen/init.h>
 #include <xen/multiboot.h>
 #include <xen/types.h>
+#include <asm/boot-domain.h>
 
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
 
+/* Max number of boot domains that Xen can construct */
+#define MAX_NR_BOOTDOMS 1
+
 /* Boot module binary type / purpose */
 enum bootmod_type {
     BOOTMOD_UNKNOWN,
@@ -78,6 +82,7 @@ struct boot_info {
 
     unsigned int nr_modules;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
+    struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 2d67b17213..ff021c24af 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-struct boot_info;
-int dom0_construct_pv(struct boot_info *bi, struct domain *d);
-int dom0_construct_pvh(struct boot_info *bi, struct domain *d);
+struct boot_domain;
+int dom0_construct_pv(const struct boot_domain *bd);
+int dom0_construct_pvh(const struct boot_domain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 5c2391a868..ac34c69855 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,8 +26,8 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-struct boot_info;
-int construct_dom0(struct boot_info *bi, struct domain *d);
+struct boot_domain;
+int construct_dom0(const struct boot_domain *bd);
 
 void setup_io_bitmap(struct domain *d);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 96e28c7b6a..b485eea05f 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -355,7 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(struct boot_info *bi, struct domain *d)
+static int __init dom0_construct(const struct boot_domain *bd)
 {
     unsigned int i;
     int rc, order, machine;
@@ -371,14 +371,15 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
     struct page_info *page = NULL;
     unsigned int flush_flags = 0;
     start_info_t *si;
+    struct domain *d = bd->d;
     struct vcpu *v = d->vcpu[0];
 
-    struct boot_module *image;
-    struct boot_module *initrd = NULL;
+    struct boot_module *image = bd->kernel;
+    struct boot_module *initrd = bd->module;
     void *image_base;
     unsigned long image_len;
     void *image_start;
-    unsigned long initrd_len = 0;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
 
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
@@ -416,22 +417,13 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 
     printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
 
-    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
-    if ( i >= bi->nr_modules )
+    if ( !image )
         panic("Missing kernel boot module for %pd construction\n", d);
 
-    image = &bi->mods[i];
     image_base = bootstrap_map_bm(image);
     image_len = image->size;
     image_start = image_base + image->headroom;
 
-    i = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    if ( i < bi->nr_modules )
-    {
-        initrd = &bi->mods[i];
-        initrd_len = initrd->size;
-    }
-
     d->max_pages = ~0U;
 
     if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
@@ -1078,7 +1070,7 @@ out:
     return rc;
 }
 
-int __init dom0_construct_pv(struct boot_info *bi, struct domain *d)
+int __init dom0_construct_pv(const struct boot_domain *bd)
 {
     unsigned long cr4 = read_cr4();
     int rc;
@@ -1096,7 +1088,7 @@ int __init dom0_construct_pv(struct boot_info *bi, struct domain *d)
         write_cr4(cr4 & ~X86_CR4_SMAP);
     }
 
-    rc = dom0_construct(bi, d);
+    rc = dom0_construct(bd);
 
     if ( cr4 & X86_CR4_SMAP )
     {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d70abb7e0c..ddb10ea03d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -992,16 +992,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
+    struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
     domid_t domid;
-    struct boot_module *image;
-    unsigned int idx;
-
-    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
-    if ( idx >= bi->nr_modules )
-        panic("Missing kernel boot module for building domain\n");
-
-    image = &bi->mods[idx];
 
     if ( opt_dom0_pvh )
     {
@@ -1028,11 +1021,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->cmdline_pa || bi->kextra )
+    if ( bd->kernel->cmdline_pa || bi->kextra )
     {
-        if ( image->cmdline_pa )
-            safe_strcpy(
-                cmdline, cmdline_cook(__va(image->cmdline_pa), bi->loader));
+        if ( bd->kernel->cmdline_pa )
+            safe_strcpy(cmdline,
+                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
 
         if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
@@ -1054,10 +1047,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             safe_strcat(cmdline, acpi_param);
         }
 
-        image->cmdline_pa = __pa(cmdline);
+        bd->kernel->cmdline_pa = __pa(cmdline);
     }
 
-    if ( construct_dom0(bi, d) != 0 )
+    bd->d = d;
+    if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     return d;
@@ -1263,6 +1257,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->domains[0].kernel = &bi->mods[0];
 
     if ( pvh_boot )
     {
@@ -2129,6 +2124,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        bi->domains[0].module = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
-- 
2.43.0


