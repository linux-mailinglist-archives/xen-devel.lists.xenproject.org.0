Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1353A81189
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942764.1341885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVq-0003wx-67; Tue, 08 Apr 2025 16:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942764.1341885; Tue, 08 Apr 2025 16:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVq-0003ta-18; Tue, 08 Apr 2025 16:09:22 +0000
Received: by outflank-mailman (input) for mailman id 942764;
 Tue, 08 Apr 2025 16:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVp-0002e3-2K
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2414::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d27b591a-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:18 +0200 (CEST)
Received: from BN9PR03CA0485.namprd03.prod.outlook.com (2603:10b6:408:130::10)
 by MW4PR12MB7029.namprd12.prod.outlook.com (2603:10b6:303:1eb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 16:09:13 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::a7) by BN9PR03CA0485.outlook.office365.com
 (2603:10b6:408:130::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.28 via Frontend Transport; Tue,
 8 Apr 2025 16:09:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:12 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:10 -0500
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
X-Inumbo-ID: d27b591a-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u97Z9tswxDynWTJ0P2xJi4olEUT79AMaBaeIAt8fO0AVaVnX9MScET3eAY6NQ29h07pcwk8Z349m+jRAs2zfVvc8I4po19UsZVWdOyy9IvRT3NTmYuaUDJldgV/WosRU5UnVVFhJzB0Yvd8pjsjWRfJTMkfx5yOhj9Yl+3TDf5c1Um4QjCwG2oWy4QLR6dgqlSwPOueJeUFARPcpHFzKnO5q3xWiAUjKY6YE4GmrO0oSv8XHxQwmIEhW+S0eYjVE9J6jZRbokhG52j3FEzu4nQwithT8IVvTJ8YtmEigz0TYA7O4c281s82aUwCxwZGrg11TvXmr9gLNUHOT1c7rHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IZT8fNpajJpPrD7JBt6IyOdueLZGX88E8xJcZfVlwc=;
 b=GFkEAeB3TN9g9Pb/JPrI11vFKvWFPHIuTrvIakqXcd8wW6YZScxsu8IrH4ctvB7OWAkTVX22KcL1r9RJ6zbAssKBe7bZp4IS0uczRpRhDfEiHbRNHNmnteHOhRfUsnKL0eT808r90R1kMf+ZiQ26852e6LRuSXyU7Dj3NbLGKese7MfHQ2IPDLaebe3x75by1mPeo0IjOoTCwAwleqy0FR+osmtYQOdkF0K4xKsv28XNr+hvRSynZYYU+Yi6kQq0UB9Sw0qn+SOmLr+S/Y15ErP5UjvEI/PjEt+f50+ST5eaZZIgU9w1HOmR1Vivn787sUpwlFQ4dESBItVSq+ZDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IZT8fNpajJpPrD7JBt6IyOdueLZGX88E8xJcZfVlwc=;
 b=m+mJlxQsMuipny/vZ8/aMYk4QoesBp9bHpJI5r6ToSsIMQpzgxxxEUy/uqwhUXG1lzS0ILXY/34CGeKHn36hXg/wvZFy65xz10NlH5vUHD3e9ROJ1xAUK9VKP0NCaQxnLr0/ApW6xNsVEK6xXGxHSiAsAaRPuIbvrp2iNlEswz4=
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
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v3 10/16] x86/hyperlaunch: obtain cmdline from device tree
Date: Tue, 8 Apr 2025 17:07:32 +0100
Message-ID: <20250408160802.49870-11-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|MW4PR12MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb02b01-e390-40e9-8096-08dd76b7b3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99+rsnMGmGWMdeTo798rlZdfyoQ4p9YvaeFf6W0jy7OV96r32yKeRwIUm90o?=
 =?us-ascii?Q?9fqDs72/3F7hGOukME7ghpJFBJFOAY1bW6YaAhvjEfLC2FjlshJdW0F+oyMs?=
 =?us-ascii?Q?YFpYMLNp87hR5wcKRgoNTUEn+Oh8qASK88r47m21y2B+8O0drks+SYU+jcq0?=
 =?us-ascii?Q?dymY5wOJOydZO9I31n6WtFNNT07JSoxr2g0k7BOsuKoVtKb6X7lC+Ga4t21q?=
 =?us-ascii?Q?mN0DF+VgVLj8pq71Y89adc63wzKNImaxvFOGaBcOP+62H9XwMBAzh5KE/74f?=
 =?us-ascii?Q?GruuDMKdIGrozyZcYX9iu+nQc6lUBBu+LvqeR4lOzgF2bfoEmi/IyA/np+Bf?=
 =?us-ascii?Q?SkgS0FT0MDSs/2pfqrAzrISVl8kLB7oZX17WPCpEyZp3/z9OIeaxA1eW2WWp?=
 =?us-ascii?Q?Bxn5GS5xFKr+LPIcxkF+Z7LzjbnCB/kNf9maQHjiRs86rGNIu5SOY87vz1Wh?=
 =?us-ascii?Q?fHnUXXksHZi2dRmtFSWPwE6w9xl+I6b99f3vFSdKpHgz82ZuaBRMyzTkufwh?=
 =?us-ascii?Q?3lc9rwwzdyxes6FptoPdUUJwzI2EA6w42KX3+rtr/XcIuSkbx2LwYgUERWJN?=
 =?us-ascii?Q?D8u9Dq12c7/aRFW6vXxfpNVkw6lyVKasfPlHmzsPyaf4zZa7zxWNgu5Fc/OW?=
 =?us-ascii?Q?jmht+amYVaZ2nESSBI/0uXjG+0CN9FV0ipBDC3cw2LD9+aTMUb/2Nru7X72P?=
 =?us-ascii?Q?/OK2B5BIX4TtfYpx2biC8NhCTBBomj5JC/TLWTELHKZA3bApPydBlmAgDk5E?=
 =?us-ascii?Q?oo7S438nROrO8cO1fnMQP7iSDA7PVEc8hsY5BNqjSMKHYQYvvrp419J5ArMg?=
 =?us-ascii?Q?c/Bf1dcsH3V97tCi5IhapTGjGl9s3799CE+BRypbSCLLxvWMQm0ouXGonq1Z?=
 =?us-ascii?Q?m/b/vwDZHNtDVGpypyIiBPYyTTvZLA3mYUutxe1v5uVNEXQmXRNmGPDHouhE?=
 =?us-ascii?Q?uVwIMMY1yQVQSG0rgx+uWqj5LGdCQb/8vbYLjEOC0qdpYbAEUyKdmnM+G4Py?=
 =?us-ascii?Q?1z1t4D7a2U19P8u4luGSkVdSX6thbNGJBXVBxarRBYflIaBOF8pnC31tzHQS?=
 =?us-ascii?Q?DMAyzvqLp6DtVqCdegr+oXnMm9lHoqzC9RCrDO/uuKGPtRhlNqoyRGRoQ3hz?=
 =?us-ascii?Q?ocpqX/cLtAZLoYYla87GwZQgdMLnbfrLbWMdoeA0YUjUUm88s3lLCKAYJ2DA?=
 =?us-ascii?Q?OaO7zoqOTb6gqSFz5MdgtthdGgN+qrJGfiqDSCbQddNRvTSS4C7WnSS72ptr?=
 =?us-ascii?Q?g007Xe1xDHJ8/J8hcdT54fSwEfERTjTo3e9jplFGn88RNIlmAKhFQEZvpuEC?=
 =?us-ascii?Q?qFUeNgzq+fHXvfa/JyXjbHATxYyXXOLJwmOCWq2MoZuJAxbBFcridmy9gZO6?=
 =?us-ascii?Q?nnMhNAezzsP/FdXrnVCNRIjPNdlFwj+mVxnpHQ388HOSwzkrLTTvNJmBARdg?=
 =?us-ascii?Q?CIEiZYDb2UiE0jzwDZY6Yk/WzV4KtSAksMXE30jYiBWfrk+nMosvbMiP4+KP?=
 =?us-ascii?Q?1Lu15lxMEFPmQ50=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:12.5002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb02b01-e390-40e9-8096-08dd76b7b3e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7029

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add support to read the command line from the hyperlauunch device tree.
The device tree command line is located in the "bootargs" property of the
"multiboot,kernel" node.

A boot loader command line, e.g. a grub module string field, takes
precendence ove the device tree one since it is easier to modify.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
    * Rename to fdt_get_prop_offset()
    * Remove size_t cast from builder_get_cmdline_size()
    * fdt_get_prop_offset() use strcmp()
    * fdt_get_prop_offset() return bool
---
 xen/arch/x86/domain-builder/core.c        | 28 +++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.c         |  6 +++++
 xen/arch/x86/domain-builder/fdt.h         | 25 ++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h       |  6 +++--
 xen/arch/x86/include/asm/domain-builder.h |  4 ++++
 xen/arch/x86/setup.c                      | 12 +++++++---
 xen/include/xen/libfdt/libfdt-xen.h       | 23 +++++++++++++++++++
 7 files changed, 99 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index eda7fa7a8f..510a74a675 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -8,9 +8,37 @@
 #include <xen/lib.h>
 
 #include <asm/bootinfo.h>
+#include <asm/setup.h>
 
 #include "fdt.h"
 
+size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)
+{
+#ifdef CONFIG_DOMAIN_BUILDER
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+    int size = fdt_cmdline_prop_size(fdt, offset);
+
+    bootstrap_unmap();
+    return size < 0 ? 0 : size;
+#else
+    return 0;
+#endif
+}
+
+int __init builder_get_cmdline(
+    struct boot_info *bi, int offset, char *cmdline, size_t size)
+{
+#ifdef CONFIG_DOMAIN_BUILDER
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+    int ret = fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
+
+    bootstrap_unmap();
+    return ret;
+#else
+    return 0;
+#endif
+}
+
 void __init builder_init(struct boot_info *bi)
 {
     if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index a037c8b6cb..bc9903a9de 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -189,6 +189,12 @@ static int __init process_domain_node(
             printk("  kernel: boot module %d\n", idx);
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
 
diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
index e8769dc51c..91f665c8fd 100644
--- a/xen/arch/x86/domain-builder/fdt.h
+++ b/xen/arch/x86/domain-builder/fdt.h
@@ -12,6 +12,31 @@ struct boot_info;
 #define HYPERLAUNCH_MODULE_IDX 0
 
 #ifdef CONFIG_DOMAIN_BUILDER
+
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
 int has_hyperlaunch_fdt(const struct boot_info *bi);
 int walk_hyperlaunch_fdt(struct boot_info *bi);
 #else
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
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index b6d9ba94de..7518b6ddf3 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -3,6 +3,10 @@
 
 struct boot_info;
 
+size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset);
+int __init builder_get_cmdline(
+    struct boot_info *bi, int offset, char *cmdline, size_t size);
+
 void builder_init(struct boot_info *bi);
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 00e8c8a2a3..ca4415d020 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -984,7 +984,10 @@ static size_t __init domain_cmdline_size(
 {
     size_t s = bi->kextra ? strlen(bi->kextra) : 0;
 
-    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
+    if ( bd->kernel->fdt_cmdline )
+        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
+    else
+        s += strlen(__va(bd->kernel->cmdline_pa));
 
     if ( s == 0 )
         return s;
@@ -1047,9 +1050,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
             panic("Error allocating cmdline buffer for %pd\n", d);
 
-        if ( bd->kernel->cmdline_pa )
+        if ( bd->kernel->fdt_cmdline )
+            builder_get_cmdline(
+                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
+        else
             strlcpy(cmdline,
-                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
+                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
                     cmdline_size);
 
         if ( bi->kextra )
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index 2259c09a6a..e473fbaf0c 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -23,6 +23,29 @@ static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)
     return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
 }
 
+static inline bool __init fdt_get_prop_offset(
+    const void *fdt, int node, const char *name, unsigned long *offset)
+{
+    int ret, poffset;
+    const char *pname;
+
+    fdt_for_each_property_offset(poffset, fdt, node)
+    {
+        fdt_getprop_by_offset(fdt, poffset, &pname, &ret);
+
+        if ( ret < 0 )
+            continue;
+
+        if ( strcmp(pname, name) == 0 )
+        {
+            *offset = poffset;
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /*
  * Property: reg
  *
-- 
2.43.0


