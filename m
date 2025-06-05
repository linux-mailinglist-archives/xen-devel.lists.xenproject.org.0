Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFECFACF84A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007461.1386800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaI-0004eA-OM; Thu, 05 Jun 2025 19:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007461.1386800; Thu, 05 Jun 2025 19:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaI-0004Yd-DL; Thu, 05 Jun 2025 19:49:06 +0000
Received: by outflank-mailman (input) for mailman id 1007461;
 Thu, 05 Jun 2025 19:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGaG-0002fZ-F9
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:49:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2416::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2091667a-4246-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 21:49:02 +0200 (CEST)
Received: from BN9PR03CA0349.namprd03.prod.outlook.com (2603:10b6:408:f6::24)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 19:48:56 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::ce) by BN9PR03CA0349.outlook.office365.com
 (2603:10b6:408:f6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Thu,
 5 Jun 2025 19:48:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:55 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:53 -0500
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
X-Inumbo-ID: 2091667a-4246-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm7lLfsnHQ6j4Z8m+IlsPwOkvG6nj+0Ifxg/ZBuDkVpxeflVYHB8YAVGpvGRIGb3WvXWiz4OdrT2js4x+yq0vZeKcqaMRk4C4aJc7dFdMlXdBoN+xlemewpNw5YJS3oGW7p/LwCZEgpLg/FYKhj+etVLH+Puvppgj6lVJGoopUmtNszNvl6dQofqLN/Gjs8R5ChimFl5OfixfdRagqBZvyYOkGsgxBwKXgJkoR9weOKwGnSEM6DDDsR84Vdi9LonvPoqbdMsoa31Ajj+691enTG5FJ7RYcxIDikdcL06YGf55rRVB0KwPeC1IBAj1JiTWMDU0NjJYSOunYcz+WOY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrlalRNV1guuVey9xud5aOv5ovVuWNN63mokafP5a1A=;
 b=ANMYrHgq6JtUQmR0CarAC30s1vMmecjogYazCMRRdCw9QpR9joTTUJ/DslgGK/QcWr51qKpenDr8btzVY/fm/ZevoGBPsMbqwIj07gu8fG0oIWmteciS2FV7HNLxSaRWCvJ23ugg+cb8lumoCXvcvachIoCLrOtyxAXi5Hdua4529EBgRDgDY/9ngGWfXWe3umbsBxDLwrtUQANK1evE76t4L7hG2Y8geVzjzhA6VdK7kJD42432Tx9FkslgYPvgbVnh6+EM9uDkr2jv3IFFAroXr/teVZTh0Qf6HWWju+HszZ6ebTxaJnLjJ87VstgORj5aByi9yRWCTVSiohYIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrlalRNV1guuVey9xud5aOv5ovVuWNN63mokafP5a1A=;
 b=CPMpjI6X7b5EWr68GJHmwAU8fRvu9op7JblkEchuABoqMo9Aao6EAioRh7JbjcJHqMXnBVZ8IWDvOTPmHmnE4rz9Y19+SOC7WQUC3RX7A+Doj0LHXHkB9amB/1te8y1uh+SqpvRoyPFtpF2LjXFo9LgXTrrN8FiryD4UnEPbZGg=
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
	<michal.orzel@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 07/15] x86: Replace boot_domain with bootdomain
Date: Thu, 5 Jun 2025 21:47:59 +0200
Message-ID: <20250605194810.2782031-8-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: 879dcbff-4227-4bff-1600-08dda46a01b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qOmpaUKcExd5+w6X4HWUp+9wPVPclz6zxy5XYzqkVGgKRZOOJc3gNCr4Xxzq?=
 =?us-ascii?Q?wdxJYkqGbBBeqqxZlYJsskFzYkaQdJAaJ5OEllyMBGqHLQFEDCvZdZ9iLMek?=
 =?us-ascii?Q?OLGGKhwCb82mzrK1ekuxDE5gq4LST+lQDGqZG5dhpyoGOwd4Xs8eYK25UZEF?=
 =?us-ascii?Q?Dy5D7nMIy/b4SPlT3ykphCUdGefu98GQN0f41Ru2jFkitZGz7qjPXZcHXl/o?=
 =?us-ascii?Q?gqCe5uVZ3uGFFPru03XfhI4IdAbvtrMBZxmk6LO0ufmTF6QdPEfjpl0d4OL8?=
 =?us-ascii?Q?6d8UUo6UbwSaORnd5Hh/6YFRyg01yCJO1zidbn3AyH98/z9ri4OJkCYig1cu?=
 =?us-ascii?Q?xTQC209xHUcUh2s7Ud0i9Rf0nPQtTF3EMqQQTp6PZEraKzy84EFRlA3FcVsQ?=
 =?us-ascii?Q?4PRoHMMo2zbMGEIqr3vLmPp6jNnmpW1N5EAqVIlfxvP0nd1R1OxcDBjCxy0c?=
 =?us-ascii?Q?j4YpBmDfsFoOoJScxLYgVKaHnJKsUt/lHmhvcZhc+OfBtqPjEUMnWcO0Ltmi?=
 =?us-ascii?Q?BXnbcvxSSAHMWn5ruGCR3cnVvsXzK9Kim2UlgM1xTYap7M54zh3H7Th9iO2y?=
 =?us-ascii?Q?aOvlk3t08+HOL6D9zfHVmBP6s8j+sFf5rV2zzjTQIcfJK7vjQ8J2uvZj6jyx?=
 =?us-ascii?Q?zvAA517EJazA2aU6AsGWDdeLhDpCwF6VjNgogMCvEzA7K36whk6AuR/ujHXJ?=
 =?us-ascii?Q?AJlRpYe2cesk+b9S+nWGA2/lq846vwxRP2brURtE5bKAOoiDSfnN/gR9G8hq?=
 =?us-ascii?Q?nEOb4NOc7Vk1QEf8YifFnzFPrEMJ4RUhtCGW3rhC2Uukx1zdWeBITEVLvi8G?=
 =?us-ascii?Q?HxR1EUhEjCdQXrVGK1AGliJG1Uk9eDIQbrx+Vz6l3vQR9/pzBozTdRt4Fx3U?=
 =?us-ascii?Q?3NJRJ1BPrAuYqUDA7j+QTraZHXUew6PqsHCQY2Zgi1v8ylcDxi44g6iiHLqw?=
 =?us-ascii?Q?xwnboUrL0mpRVxTilTQ+T697kJMzLq+r5hmIuMov9XGkilaNwDfNbAdWt8kc?=
 =?us-ascii?Q?kYp9sOeTe1vPiydGmRJEnLK0A7Qxvv05e+TI7Bak3wnOKS9oR8LAwqKrbGjU?=
 =?us-ascii?Q?ROyB+nUnNmaRbjwc8MNEZ+OJsQKYijHeIBIQbhwweXu8Y4xe5PUpX0ypXQcM?=
 =?us-ascii?Q?jiznMtxeCUeSC4myiSZ6z0UfOMcgo3pnsyI14xBFPGDAzK0iaHXGDa6HeTMa?=
 =?us-ascii?Q?Up0KGK33Ua+cWVNsM/yW5wqlJjCKtuIJuMBoJka3xUsMa6DXzGYlgJERrw57?=
 =?us-ascii?Q?obMZ3cX7xi0ixKEdlHKrwOk+vHBKpREq8/Mt+TsJaPQhPyn0up4KSySy3I6B?=
 =?us-ascii?Q?ofTvl/bRdjtMTfBJXmDJcZ1DiXf6G7LgTNKsvd/ZV0UcNK/qnCRFBJdVa/wr?=
 =?us-ascii?Q?yJ2Zk6wxx3+Gd4pZY/OOrDvBAarlHpg8fcQ13Bnf3llAj67c99nRglAM/unM?=
 =?us-ascii?Q?udxTeJlgBahc48DQ0OC2pNjcmV5eLcY7bz3NC8cEtpPFbLa8M7fuumbJhqEs?=
 =?us-ascii?Q?/kyn5jsZFk0qggiQF8Qfo2hTYpmY/ZXp1g2V?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:55.8461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 879dcbff-4227-4bff-1600-08dda46a01b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384

No functional change intended.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v2:
  * Replaces the previous patch in which kernel_info replaced boot_domain
---
 xen/arch/x86/dom0_build.c              |  2 +-
 xen/arch/x86/hvm/dom0_build.c          |  6 ++---
 xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
 xen/arch/x86/include/asm/bootfdt.h     |  7 ++++++
 xen/arch/x86/include/asm/bootinfo.h    |  3 +--
 xen/arch/x86/include/asm/dom0_build.h  |  6 ++---
 xen/arch/x86/include/asm/setup.h       |  4 ++--
 xen/arch/x86/pv/dom0_build.c           |  6 ++---
 xen/arch/x86/setup.c                   | 16 +++++++------
 xen/include/xen/bootfdt.h              |  4 ++++
 10 files changed, 33 insertions(+), 54 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..1c8c5140a3 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -615,7 +615,7 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(const struct boot_domain *bd)
+int __init construct_dom0(const struct bootdomain *bd)
 {
     int rc;
     const struct domain *d = bd->d;
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 96410344a8..85c000b259 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -644,11 +644,11 @@ static bool __init check_and_adjust_load_address(
 }
 
 static int __init pvh_load_kernel(
-    const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
+    const struct bootdomain *bd, paddr_t *entry, paddr_t *start_info_addr)
 {
     struct domain *d = bd->d;
     struct bootmodule *image = bd->kernel;
-    struct bootmodule *initrd = bd->module;
+    struct bootmodule *initrd = bd->initrd;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->arch.headroom;
     unsigned long image_len = image->size;
@@ -1329,7 +1329,7 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(const struct boot_domain *bd)
+int __init dom0_construct_pvh(const struct bootdomain *bd)
 {
     paddr_t entry, start_info;
     struct domain *d = bd->d;
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
diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
index 2fc705a1cd..b30132381e 100644
--- a/xen/arch/x86/include/asm/bootfdt.h
+++ b/xen/arch/x86/include/asm/bootfdt.h
@@ -4,6 +4,13 @@
 
 #include <xen/types.h>
 
+#include <public/xen.h>
+
+struct arch_bootdomain
+{
+    domid_t domid;
+};
+
 struct arch_bootmodule
 {
     /*
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index f3210b7d6a..b8280ba357 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -12,7 +12,6 @@
 #include <xen/init.h>
 #include <xen/multiboot.h>
 #include <xen/types.h>
-#include <asm/boot-domain.h>
 
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
@@ -34,7 +33,7 @@ struct boot_info {
 
     unsigned int nr_modules;
     struct bootmodule mods[MAX_NR_BOOTMODS + 1];
-    struct boot_domain domains[MAX_NR_BOOTDOMS];
+    struct bootdomain  domains[MAX_NR_BOOTDOMS];
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index ff021c24af..df03189870 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-struct boot_domain;
-int dom0_construct_pv(const struct boot_domain *bd);
-int dom0_construct_pvh(const struct boot_domain *bd);
+struct bootdomain;
+int dom0_construct_pv(const struct bootdomain *bd);
+int dom0_construct_pvh(const struct bootdomain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index c7deaba109..a8647f0fdf 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,8 +26,8 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-struct boot_domain;
-int construct_dom0(const struct boot_domain *bd);
+struct bootdomain;
+int construct_dom0(const struct bootdomain *bd);
 
 void setup_io_bitmap(struct domain *d);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e6c77413f5..a6f212fe0a 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -355,7 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(const struct boot_domain *bd)
+static int __init dom0_construct(const struct bootdomain *bd)
 {
     unsigned int i;
     int rc, order, machine;
@@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
     struct vcpu *v = d->vcpu[0];
 
     struct bootmodule *image = bd->kernel;
-    struct bootmodule *initrd = bd->module;
+    struct bootmodule *initrd = bd->initrd;
     void *image_base;
     unsigned long image_len;
     void *image_start;
@@ -1070,7 +1070,7 @@ out:
     return rc;
 }
 
-int __init dom0_construct_pv(const struct boot_domain *bd)
+int __init dom0_construct_pv(const struct bootdomain *bd)
 {
     unsigned long cr4 = read_cr4();
     int rc;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e9a70c2c2b..726adad0e5 100644
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
@@ -987,7 +989,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
 }
 
 static size_t __init domain_cmdline_size(const struct boot_info *bi,
-                                         const struct boot_domain *bd)
+                                         const struct bootdomain *bd)
 {
     size_t s = bi->kextra ? strlen(bi->kextra) : 0;
     const struct arch_bootmodule *abm = &bd->kernel->arch;
@@ -1022,7 +1024,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
-    struct boot_domain *bd = &bi->domains[0];
+    struct bootdomain *bd = &bi->domains[0];
     struct domain *d;
 
     if ( opt_dom0_pvh )
@@ -1039,11 +1041,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
 
@@ -2162,7 +2164,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
-        bi->domains[0].module = &bi->mods[initrdidx];
+        bi->domains[0].initrd = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index e6d52a599f..19d2ff0f0c 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -108,6 +108,10 @@ struct bootdomain {
     struct bootmodule *initrd;
 
     const char* cmdline;
+
+#if __has_include(<asm/bootfdt.h>)
+    struct arch_bootdomain arch;
+#endif
 };
 
 /*
-- 
2.43.0


