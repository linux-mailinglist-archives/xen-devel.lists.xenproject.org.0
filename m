Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5946CAA0BE6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972449.1360815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHt-0005qY-BH; Tue, 29 Apr 2025 12:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972449.1360815; Tue, 29 Apr 2025 12:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHt-0005js-6r; Tue, 29 Apr 2025 12:42:13 +0000
Received: by outflank-mailman (input) for mailman id 972449;
 Tue, 29 Apr 2025 12:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kDO-0007L9-OV
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b82aef14-24f6-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:37:32 +0200 (CEST)
Received: from BN9PR03CA0720.namprd03.prod.outlook.com (2603:10b6:408:ef::35)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 12:37:29 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::b4) by BN9PR03CA0720.outlook.office365.com
 (2603:10b6:408:ef::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 12:37:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:29 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:16 -0500
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
X-Inumbo-ID: b82aef14-24f6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azYy27eo3ea0QS4BdXr0jKlFQ+WTKlyHJLSgCVbzBq/dO42plEpy6EAo4T150aSLByMNfwslYCfPvRtjDhCMBMplIr/npzfoDXAJtpGSjIKP56uGhLmJlxzTTqVCfbAmhSya2WksUKprdQ7QV3RUnNrD2ghAh/D2vSROGnZUc+23p2eG3Vkz35Dkkb+rAR5b2iVg3yb2+DDvJHUhIbif2vzHNvIs5QgsInfooax8hkZhBgXihI6gxcWuQCUJBGvKTgKDOfApU6lYHEJJXrV58uum/Rqrncx58lQMNyx3Ev5lo9qqlJESP9P8sf4+PJ7ghojmg/J/YzMON95FkL5ifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pwwrn+w0PJVnEiP+Trq+bIH21nPCkOjD9aybGcH0RE=;
 b=Tx1gWkVZobOaobM0AnZe/OjJvfbQd0HWoMu2sTs3ZhmgsZRfwCkDuTmTmYBH/gysO+Yy/oyZJ16IsJfd9LJjRLjCLySi15qv8bhiYYKU2NtRIVcYnWhf6oODaAHjIgIu6ZzCBqHERSP2mEVGNxcvipp02dGyKiQ7ZlangZZxklspe5I24yoRt8FP0b15C7maM+S+71WaRE8Dd/hVGVpiPPJsQMzFOPp1bAlnqzC4Eev0Wcg9m7y8CB7XOZTFoo5QEZAyBUqksjuDml7OC5AxqbbdG4OSFfTIFzMAyv2M7DzrEjfVYBsoIoO+sz7nU6CqkbUFxmbrTIs7XMGNTFxQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pwwrn+w0PJVnEiP+Trq+bIH21nPCkOjD9aybGcH0RE=;
 b=ISiMhyphyTmGwqHrBIfH6x3aPYuU0GwulrQOYtIJtamTrSUsFMrSbckmMbYkQQxcoK0u5El8pzLvzU/8ss8HRyUvKL+DHEoKrrFXnlqhiZrYyZ74mSY7V7G7AI+Zx3BnWVVgskOuW5Ggvr1MiaUfy+YUCsr85CFppKO/qTAk0wY=
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
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>, Denis Mukhin
	<dmukhin@ford.com>
Subject: [PATCH v6 06/12] x86/hyperlaunch: obtain cmdline from device tree
Date: Tue, 29 Apr 2025 13:36:17 +0100
Message-ID: <20250429123629.20839-7-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429123629.20839-1-agarciav@amd.com>
References: <20250429123629.20839-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|PH7PR12MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: f7375450-34f9-4b47-c3a9-08dd871a9b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K1RsAPPAzAuRe7FRVFSsnO5dbQ06TYATC5wSfo4ovhtEp3w6HwYO2Obi1SOE?=
 =?us-ascii?Q?RgxAcmRMAaEQPGz9AEIOQqVVEDeHjFrC911Zna5sy7AWKgRhTVoLXS2BtyYq?=
 =?us-ascii?Q?JGxbeP91V7mHJ5wAIfabh0bjGIAPydl+3yhEO0uXx70X40oLoT+WRMHg0tlh?=
 =?us-ascii?Q?jzmg8zBtjbV667nAQX+i8oChBiUw4yi1UMVd95bvP3v2eMwkaRa4UVJLdZjp?=
 =?us-ascii?Q?G30++ZVG8jw7kpMXsL7evJbjiKSFVIw9SzJcHm0BXAH/o3raJlfWidfEwoXO?=
 =?us-ascii?Q?p/JXLp68ERzvb3I25VD6o3G5RQgi+Bti9XHuiigdcemEz12QWDr2nGUhMmYQ?=
 =?us-ascii?Q?HDhsqhYST1UjdIL6NJZWNRoneuoS6yySApnjx508ZYtkBUszTT/lclkt8x+G?=
 =?us-ascii?Q?oot5cRtnICXomOzWjl9ifWtbGFHIrOpBe5HKDw2/0KBHHBVnvsOXjd0ptHUc?=
 =?us-ascii?Q?5R2AJYT5a+ZHEV2i6YAZh8+QbJ9fumqaffvehc84tsymYzYDx1BV/Wr6W8zK?=
 =?us-ascii?Q?symw7mV+sdYwZJqu7soD1JF/MnYDzktqC5Fi1oom5+0+mhFP8zeaOcxT3N5i?=
 =?us-ascii?Q?mkeGRUp6p5VveV5NGRZnFDW+iGcC8FDP5WgPXvZ82Er8jkqbikdM50eWkzZv?=
 =?us-ascii?Q?Rcgvp6O4exQ/tzqy3qJtHrFdH08BQBytigfeCo89+ZpM8ETey87vGG1TLdn9?=
 =?us-ascii?Q?UdXFfrVGURPgzJpzu0NzTwfx2esWT9m9bCi9rmtrjFxiRGLy1Nh8GpoxTBeR?=
 =?us-ascii?Q?2nqmH/Z2pR/gTxGkGxTBthEV5mDBRwkVS6qRvWd3SZlw245yw7AM9WQRNSiz?=
 =?us-ascii?Q?g4c0glFBfgJrloJcyX1AVg6U0GcfSsqHl812kcMUcVC7OqI+lFtJPE342jJw?=
 =?us-ascii?Q?5jxtq5LaRhD8180FOzWS9NXiVEo/LbNOTYPAKf1TboG/5PSUNlk0ziKT+3O1?=
 =?us-ascii?Q?LoLJKitxmORyBkkeRm1NTewp1clXxb22xTsKX9Jhlx2xI1UKrTteYRFHTgQX?=
 =?us-ascii?Q?NGxequix+8iWvfZvKG27Cvr1+wRUJWAzmPsG/lUUn8oexsXmorr2BYB5jD9n?=
 =?us-ascii?Q?PO8mkRbZhXfm/puV92p6nadRfZwKcxoVSha6cGynx9edZByfI5kaAre7w988?=
 =?us-ascii?Q?Os5M7SLIuECegqtUzHMCB87GHTtGR8sRJssXhLwDnKpTLkyIbUiqDm+rGyW1?=
 =?us-ascii?Q?A9eWmhSBDK/VbfZTe6uPZiHe8A0vG+fjNuQP09OWKsOUan5avqSgD/Z3EbTA?=
 =?us-ascii?Q?73+es4XLpEuF97Ux+Y/0F0W9705vqDqd2qzd/BkR9/FyGqy1MogpMDo6zhJL?=
 =?us-ascii?Q?VYelndI2/MuZP+RAYMysThb+wXpNZxSeffpuz1caj9TThKAYF/TgAxJCjr08?=
 =?us-ascii?Q?Np3crcU6/kdT/ckbo8G8kq/kl6sgc1GtsrGuODlVohzyBv0cXOPjrGlwhHjG?=
 =?us-ascii?Q?Z0h6rd3ncPhYX/34EsuQp9rsGnc6DKMeOWk5RnMMBivZ8q9jfbVtUDkAtxJe?=
 =?us-ascii?Q?sAPQa/lYHtpNPoAfaWEgnFv9U1FIUT4nuqkP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:29.5582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7375450-34f9-4b47-c3a9-08dd871a9b02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add support to read the command line from the hyperlaunch device tree.
The device tree command line is located in the "bootargs" property of the
"multiboot,kernel" node.

A boot loader command line, e.g. a grub module string field, takes
precendence over the device tree one since it is easier to modify.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  6 ++++--
 xen/arch/x86/setup.c                | 22 ++++++++++++++++++++--
 xen/common/domain-builder/core.c    | 26 ++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.c     |  6 ++++++
 xen/common/domain-builder/fdt.h     | 24 ++++++++++++++++++++++++
 xen/include/xen/domain-builder.h    |  8 +++++---
 xen/include/xen/libfdt/libfdt-xen.h | 23 +++++++++++++++++++++++
 7 files changed, 108 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 1e3d582e45..5b2c93b1ef 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -35,11 +35,13 @@ struct boot_module {
 
     /*
      * Module State Flags:
-     *   relocated: indicates module has been relocated in memory.
-     *   released:  indicates module's pages have been freed.
+     *   relocated:   indicates module has been relocated in memory.
+     *   released:    indicates module's pages have been freed.
+     *   fdt_cmdline: indicates module's cmdline is in the FDT.
      */
     bool relocated:1;
     bool released:1;
+    bool fdt_cmdline:1;
 
     /*
      * A boot module may need decompressing by Xen.  Headroom is an estimate of
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f8193f2c1c..765b690c41 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -985,7 +985,19 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
 {
     size_t s = bi->kextra ? strlen(bi->kextra) : 0;
 
-    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
+
+    /*
+     * Bootloader cmdline takes precedence and replaces the DT provided one.
+     *
+     * In that case, fdt_cmdline is not be populated at all.
+     */
+    if ( bd->kernel->fdt_cmdline )
+    {
+        BUG_ON(!IS_ENABLED(CONFIG_DOMAIN_BUILDER));
+        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
+    }
+    else if ( bd->kernel->cmdline_pa )
+        s += strlen(__va(bd->kernel->cmdline_pa));
 
     if ( s == 0 )
         return s;
@@ -1049,7 +1061,13 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
             panic("Error allocating cmdline buffer for %pd\n", d);
 
-        if ( bd->kernel->cmdline_pa )
+        if ( bd->kernel->fdt_cmdline )
+        {
+            BUG_ON(!IS_ENABLED(CONFIG_DOMAIN_BUILDER));
+            builder_get_cmdline(
+                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
+        }
+        else if ( bd->kernel->cmdline_pa )
             strlcpy(cmdline,
                     cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
                     cmdline_size);
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index c6917532be..b2f49bb17b 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -10,9 +10,35 @@
 #include <xen/lib.h>
 
 #include <asm/bootinfo.h>
+#include <asm/setup.h>
 
 #include "fdt.h"
 
+size_t __init builder_get_cmdline_size(const struct boot_info *bi, int offset)
+{
+    const void *fdt;
+    int size;
+
+    fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+    size = fdt_cmdline_prop_size(fdt, offset);
+    bootstrap_unmap();
+
+    return max(0, size);
+}
+
+int __init builder_get_cmdline(const struct boot_info *bi,
+                               int offset, char *cmdline, size_t size)
+{
+    const void *fdt;
+    int ret;
+
+    fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+    ret = fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
+    bootstrap_unmap();
+
+    return ret;
+}
+
 enum fdt_kind __init builder_init(struct boot_info *bi)
 {
     enum fdt_kind kind;
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index cbb0ed30a2..dabe201b04 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -219,6 +219,12 @@ static int __init fdt_process_domain_node(
             printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
             bi->mods[idx].type = BOOTMOD_KERNEL;
             bd->kernel = &bi->mods[idx];
+
+            /* If bootloader didn't set cmdline, see if FDT provides one. */
+            if ( bd->kernel->cmdline_pa &&
+                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
+                bd->kernel->fdt_cmdline = fdt_get_prop_offset(
+                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
         }
     }
 
diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
index 5570fb7a9c..68cbc42674 100644
--- a/xen/common/domain-builder/fdt.h
+++ b/xen/common/domain-builder/fdt.h
@@ -10,6 +10,30 @@ struct boot_info;
 /* hyperlaunch fdt is required to be module 0 */
 #define HYPERLAUNCH_MODULE_IDX 0
 
+static inline int __init fdt_cmdline_prop_size(const void *fdt, int offset)
+{
+    int ret;
+
+    fdt_get_property_by_offset(fdt, offset, &ret);
+
+    return ret;
+}
+
+static inline int __init fdt_cmdline_prop_copy(
+    const void *fdt, int offset, char *cmdline, size_t size)
+{
+    int ret;
+    const struct fdt_property *prop =
+        fdt_get_property_by_offset(fdt, offset, &ret);
+
+    if ( ret < 0 )
+        return ret;
+
+    ASSERT(size > ret);
+
+    return strlcpy(cmdline, prop->data, ret);
+}
+
 enum fdt_kind fdt_detect_kind(const struct boot_info *bi);
 int fdt_walk_hyperlaunch(struct boot_info *bi);
 
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index 3ac3a0ab84..350e2eb2af 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -2,6 +2,8 @@
 #ifndef __XEN_DOMAIN_BUILDER_H__
 #define __XEN_DOMAIN_BUILDER_H__
 
+#include <xen/types.h>
+
 struct boot_info;
 
 /* Return status of builder_init(). Shows which boot mechanism was detected */
@@ -28,8 +30,8 @@ static inline enum fdt_kind builder_init(struct boot_info *bi)
 }
 #endif /* !IS_ENABLED(CONFIG_DOMAIN_BUILDER) */
 
-int fdt_read_multiboot_module(const void *fdt, int node,
-                              int address_cells, int size_cells,
-                              struct boot_info *bi)
+size_t builder_get_cmdline_size(const struct boot_info *bi, int offset);
+int builder_get_cmdline(const struct boot_info *bi, int offset,
+                        char *cmdline, size_t size);
 
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index a5340bc9f4..9c20a26a35 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -13,6 +13,29 @@
 
 #include <xen/libfdt/libfdt.h>
 
+static inline bool __init fdt_get_prop_offset(
+    const void *fdt, int node, const char *pname, unsigned long *poffset)
+{
+    int ret, offset;
+    const char *name;
+
+    fdt_for_each_property_offset(offset, fdt, node)
+    {
+        fdt_getprop_by_offset(fdt, offset, &name, &ret);
+
+        if ( ret < 0 )
+            continue;
+
+        if ( !strcmp(name, pname) )
+        {
+            *poffset = offset;
+            return true;
+        }
+    }
+
+    return false;
+}
+
 static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
                                         paddr_t *address,
                                         paddr_t *size)
-- 
2.43.0


