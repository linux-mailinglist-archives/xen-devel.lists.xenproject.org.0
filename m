Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19EAE2234
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021098.1397167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgVP-00082X-8f; Fri, 20 Jun 2025 18:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021098.1397167; Fri, 20 Jun 2025 18:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgVP-0007y2-4x; Fri, 20 Jun 2025 18:30:27 +0000
Received: by outflank-mailman (input) for mailman id 1021098;
 Fri, 20 Jun 2025 18:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgVN-000575-Mp
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:30:25 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a049c974-4e04-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 20:30:24 +0200 (CEST)
Received: from BL6PEPF0001641E.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:e) by SJ0PR12MB6965.namprd12.prod.outlook.com
 (2603:10b6:a03:448::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 18:30:18 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2a01:111:f403:c803::2) by BL6PEPF0001641E.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:30:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:30:18 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:30:10 -0500
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
X-Inumbo-ID: a049c974-4e04-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZcgzibemFh2EUQ3ui18kppj2ztf349xn7nNTryhtQxnBl0EnhU2Cv4+4iYhjPVK9OyG6lIZLCk8f4VFb6d3QKXcOIPKh+TP/W4GsIYYBfm3isgzfv28nbugdYT/R1EVFRuD0x7Pi3GzhFK5oV2Hv2iiZcF5AVLd6DQbZYsaqWcSPqeDmvg1gC9yhF2fXImrJXhuJpd+lRUzV1Ds8dgwAiTFnOya+r1beTqbSp7sDauxDRMOBRIpLfO5X/UN2cHhpLJ+Avfg2NU7QY3epWQlYJCVcmbshH1JOZe3TjKUTriKYIHwb8TG8jfHZIYYLrN83hq52X4XJX3Ijq6nlghWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9ZiP25AT0NUU0OB8svKEcTwDIsiPq7Hv28Amb3Kek8=;
 b=d4Hdp5WSEMXRJ8nKngItZ6USAn1TneqoDMB0EA1DFPMKVc+RAX/e8OMCy5BDC9CSGwEdz9RPiZOaO0BBEkf+3YLBLpbc/jln3yKQZCyCCojIf3yd3pHfWsYplTB1fZl4r3Ir/KEsaIyDeiFGlECGU149KElVrYRFEAFOZG/wAzsJHz9y/vu4B7xuyvcHErItD/AAqFCArKq/OmwIs1xq9+gnlzJYs2JLBqWJS7bAzIP6ilGpTAcgvi4Adi9XbMC36mLkL6xcgYC3Tg0pKfSQsjZZcY/MDvVk8J3tAMjWGh3uSVFMK5Dr2VF6zvm8fjW3feh0EjSsKE7ppnmrSsKmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9ZiP25AT0NUU0OB8svKEcTwDIsiPq7Hv28Amb3Kek8=;
 b=lA0Hpj77mOMmqte2e2olZQWORDHxS90q1YN9HOIu6J3Kjld19QY/WeOtcaDe0EmR8jAgpLfs+OtMGThU1aJLIxTS6bQ+2Gq+11/K4x17jemez3Lk7DKxvfyLkcBB9bN6OpEdR/YaGnxJtkPCLY7m3MD06OCWqvJmm1y+ES3CE+0=
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
Subject: [PATCH v4 05/12] x86: Replace arch-specific boot_domain with the common one
Date: Fri, 20 Jun 2025 20:28:51 +0200
Message-ID: <20250620182859.23378-6-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|SJ0PR12MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d58d30b-e508-4837-f066-08ddb02881ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FZIIrzxyJfAEmfyHoJLMD53c0t0uG8/svPD/Ji/rlDdFBcWDTXc2SiGiUGOX?=
 =?us-ascii?Q?qPxzHePxVi42Ccl1hFoUpTIxlOW7dKasHLnU/HFqvGHlvWanWQ6I4Qn2fhbL?=
 =?us-ascii?Q?bOuEdUvA8qKI8BOcKVCYkIGIv622mPbrm/6QxB0w+XMmuw9kFNX11uMmdILt?=
 =?us-ascii?Q?2EndQ1hdwO9idmlkze4PKrWOeNGPOJ22yBzdOPEIayUYvS4T0UCCHPRoAUO2?=
 =?us-ascii?Q?8cVYvPQwPr2xJi9E+y+O0IDi8i3UxDthmSQ3Ef1WwqgJ93LLbIrxsMxRpdoJ?=
 =?us-ascii?Q?tDDuaWRHNQnCWMhFPXM6A5cx5vLD+iVLXVQe88GYkxEzBX/30WMHbiMX1Vbi?=
 =?us-ascii?Q?q8TfWJkvf8+7GzZccatUrYUWmnXxuZoBhhkg3UYCi94ULJ/x3xzwOQzt8SBx?=
 =?us-ascii?Q?rLr/P+AIOcPfZPlFw6WUVAgpUc0+2wjF3Y4PfOZac4qJUZQoHhcfwG0YVOqy?=
 =?us-ascii?Q?pMxRGLjdxT0JHaZrUmXiOhPaof3TepWOTC69unJF/4o7OzIb2GUCsljWpX9M?=
 =?us-ascii?Q?8YVXCWxMz1zcXu6a/DklNAQlwROL+X3aScv3i9Wel81JgIUMU6NBJrs44p+X?=
 =?us-ascii?Q?2ofd7GMfHT2zQqIigb0YzpDiwh2avA+RDHVm92vNNu5Ju5Qy6cWaN56LKQ35?=
 =?us-ascii?Q?PXDxlSNQvC9GkmA7TQSYFL1U41gUnRXQWf06hijt3PcD5mvfUlMmIM7+35AO?=
 =?us-ascii?Q?0KHotc43ei+dFwc/62qq5Oaeqw+kAKSkOmzyy/enYj60i5eW/M8xGjtZ5n0/?=
 =?us-ascii?Q?cdbyA3D1LfWVfmN4JmyjcrGDmmz99PtwZT7hKjWhv1cD87ADUlfGup4WK3gb?=
 =?us-ascii?Q?4qwFS7hd8qlrI9l/vnORkkwVtvstSfs3YoVtK8fXzjXczi9qvm8Fp2EuHWfp?=
 =?us-ascii?Q?1NF8UFOdHO3BeNNcGyekiG+G6zGWUu3NSHrPVzuoWCiZP0Shi18c8BKL30ki?=
 =?us-ascii?Q?Aan04xTPd3Pwhiww65Ii4Xe7zDBlDzbdOJOWOcl0ERWIzYNLipbaUL5gzDs7?=
 =?us-ascii?Q?nM0p7FV9soE4jzG951yNkj7yu0WXEbb9pOXVudJeB+Dp1xCgSRZeoLLyHEv+?=
 =?us-ascii?Q?YoWMAChwXuxgi6SU/qnqGL/41fpUX3eourYJfFN/1e/QzgvtukfsZT6zEmPY?=
 =?us-ascii?Q?VLMNbuvJ5Xnw8Lma40ZDEjPo0XV6PLEv47TwWpAJegtzJUxhbJ1tsEN10lbY?=
 =?us-ascii?Q?wQZLUhce03Y+BHZRzwCPrBfF/B23bphKEWOGX2qWb0cO9lAiLRHJyfs3KXNU?=
 =?us-ascii?Q?jf5sK8oW9UJrm3mhS5kHbtmd38TxiyfNMqyij08CLxQ4xz8XY/rvwWMNfeaP?=
 =?us-ascii?Q?C7tHP4LSYN6dDHUu2wVYqyQTaNzFJAFnYj6qzne6lJPPFJ1bwJBVDuX6TOJ2?=
 =?us-ascii?Q?XQcQ+Js+hP3fnffCJlz4Y6hli+qCTEhO/BP8fhmclknPSg5qTt2xNuiW+c3t?=
 =?us-ascii?Q?Ly3wUGp3sTyMovyR/GpXgonw0n2HywKG4qUZ/tc/hgPqwfyLzOwX/IJ19aG0?=
 =?us-ascii?Q?aIyl4FmZm/O8au1Q02ev+ZbQubJbBrxAz1vu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:30:18.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d58d30b-e508-4837-f066-08ddb02881ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965

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
index 4f34bbe688..a9560ac619 100644
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
@@ -1045,11 +1047,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
 
@@ -2168,7 +2170,7 @@ void asmlinkage __init noreturn __start_xen(void)
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


