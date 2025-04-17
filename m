Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9897A91CD7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957523.1350704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgO-0007OW-U1; Thu, 17 Apr 2025 12:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957523.1350704; Thu, 17 Apr 2025 12:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgO-0007MB-LR; Thu, 17 Apr 2025 12:49:32 +0000
Received: by outflank-mailman (input) for mailman id 957523;
 Thu, 17 Apr 2025 12:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgM-00057t-TA
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2412::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65226245-1b8a-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 14:49:28 +0200 (CEST)
Received: from CH2PR16CA0008.namprd16.prod.outlook.com (2603:10b6:610:50::18)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 12:49:21 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::7a) by CH2PR16CA0008.outlook.office365.com
 (2603:10b6:610:50::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 12:49:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:20 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:18 -0500
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
X-Inumbo-ID: 65226245-1b8a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGANWIW/tDTkARGihhIjAsTj1DaBDHeHBHb1CGzeG0nIcmXbecAXJZbJgsi6J8kAqH8zYO6lcsGJSxAmJHnarasdM3RvLiK6SL0WFVRGg366n7F272svod0ja5BR7vLC/mvtreVCW74G+uqDzqVrb+AgOEly9xuaF6PnYwrk90JaO0hxryUX9RjEiTtYSBCQZXygTdsocGraWCynFmwr5on//IzoO/09Qgi8ozrrQJ2k8AicpBrlIVfgMQ4erLFkZS6B7QHBhd5vEhgwcCK3HHVCkNpXlnsmQ8MdHdWL6n7pzjFMQHY4FAQ0oxnqJPcAcXnzJv2mzRRgNRt2ej+Q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwdtaTKUcJ7iphGJ2Ou019xLpH/FNYvYZOqOgt0we5o=;
 b=oKxy0xNYDMQi7zo+qfjAfi22SeCIVwdfHMMuSZfhDN5fNCHIthvhB61l6mDe2RVAzbgo3QK3wmjp3UevazpwjSgU4e49N/GXfP4pLOokg2LMsVN9AqwX11jF/nOzrwqKMxGUfaRNMrAF2bh3LbCyjvcfKLSO8oheqTss79hRv5g9YH4SOuxQzsZJeI546YLj5PfHuyzxVvz+V0/cXFuUbEz4YhS00wToAvsb2bQo5WkOqAotRx6B1s5Q+m0FoI78bHqu/XLHrks0cd3nDS+XaS2KQK5kpJpfY1yDImjpu131wlmQkOfwQ6pxWF5ZkkKcnpThzWF7MzhegZQJNHMl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwdtaTKUcJ7iphGJ2Ou019xLpH/FNYvYZOqOgt0we5o=;
 b=AKEm7ZLMwLbetWQpW6VMMq8Mfdk7vmtPBCHz1+wd1IJuIenVhv8bC1pJ/CQY1z5BR5tx2c7bimPvUMGitn7i17PUSJ4i+0tf0yZ9In8Me4jYV3vbKou0zQ7/6ku7wk2M19ABti4mdrQ1PBY/egIGTBi3NjMtfQNhNjy2qnqzhFg=
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
	<jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v4 07/13] x86/hyperlaunch: obtain cmdline from device tree
Date: Thu, 17 Apr 2025 13:48:29 +0100
Message-ID: <20250417124844.11143-8-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417124844.11143-1-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SJ1PR12MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: ff657605-8552-4994-fd9e-08dd7dae45e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5r4FQlshaGn78myioCUcnEYixVnT9o1agHdODH5Quq4pDucUEuzZh6v7pI9I?=
 =?us-ascii?Q?7QRZ7LK59e+DZOTSnXOIqRsyYH5r4YFNQ9Fboi2EriSkjJ1nq6757u33iUEk?=
 =?us-ascii?Q?0S5b8l2rEbDKxSx55acnlapikKnFPF7uLmgPuzCZBzNLzfJk+mL9hnEWG8Po?=
 =?us-ascii?Q?LuKiSJXx4PCjAFq3UUtzkiCSFg19b1BXpxEm1HRh7ybpnrWvhRd2DUZ4axvX?=
 =?us-ascii?Q?BNTmsH9sFeV4K6A37XBLqPvYGJcY24n77V5ZMNkngrrfKC4cehM5d8U1zrLu?=
 =?us-ascii?Q?ZCC5J0xc8kR58CXArI3UPFwqmSrpkqX9tpJRloL0IgQkEL5g0N+uGG9a3cPX?=
 =?us-ascii?Q?dAE6ZtMgTQUSxH1bzN1PVF7aEFWA8fV5bMmaajpEPZsrSy2vQEO67RvAT4bj?=
 =?us-ascii?Q?n/45StbgrRVzEFIvgYrtf48PzQ+Eca87ZnT1ZS32HUJUTKjhb8McJHTgl03B?=
 =?us-ascii?Q?8SQRhr12E52hrfVkH9YEGLVIQeDUuL2zbkNLOlMT2Ht9g3Kt8+LjFD5Uj3zr?=
 =?us-ascii?Q?pcLp3RLpkn07Ug3Q9cYBOGZBRTI6nuJQDs85jWZ4tWY28V0ugwvHj/1gZtbw?=
 =?us-ascii?Q?5+buF0JjuIckgsEjws4ieKnTaSKg1AVAGaVvJ0g5LClIYHXf7M0uYMotuPBp?=
 =?us-ascii?Q?E4GM6DcO/0cpiO+76p0OsExdTVJnoTop/tX2wbivgDFHGdU/tQethC8EMhrX?=
 =?us-ascii?Q?yOwzSZctwT3cygcYnwURmVBBYSJInbTXJ5xTIoCXdNIuFZfwb89yB32Eghuv?=
 =?us-ascii?Q?OZ3L9ddPrtJZijfSLeh6CGSHrEzmanraF2x46hkmfSYVj59M5/3q3BF+rymd?=
 =?us-ascii?Q?IguLZGLqHwMjvoNB+63grG5aw3lURWxkzf36No3LOoBgW+rXPn3lVSaf2k2p?=
 =?us-ascii?Q?HaybE1PxLSJDKHU4f1WoRCJI0kayskHcLn8LB49UsTUygZoi1pfk5vd92wQl?=
 =?us-ascii?Q?zsvqg/6LxbmYh++qAQg8hDeer6i3obadjSO+GjAsGR257IosUR7GM0QU6yws?=
 =?us-ascii?Q?GDDHtsGyExnrhuSUuGAachngLlfKbbA7/PWumoYSPust0ej8TlVigLt1dgTM?=
 =?us-ascii?Q?523uRv8wBt+ICGAAVMvG1vR5YNyhrTHUzKuXnG1ZmxNMaC61GMkUcncCbpvF?=
 =?us-ascii?Q?E+9pUdsDasQGpGfedA5F+cIb1MhnPal3qRXP7lTg1morso9o/imo8JQ/t8IB?=
 =?us-ascii?Q?UwzOyS4Shpu/kXLTwIUWAIH7nUeVde+JQO/b84PUCo77/7nNSeO/vyowAVFy?=
 =?us-ascii?Q?H1DsBrvL1sGp7glTHnl632UimiczZjU5fVcUgBLP0AOkNXqqUjo8K00Jp7GS?=
 =?us-ascii?Q?ENmVVlTq0Y9kUwYBf1zjPCb+QoxSt7wCRzlxzuoifwRpwJGIricvWvS1Jilx?=
 =?us-ascii?Q?nxYA8oZN/JsLOLR7GcYUdyGv9VoZTjF9TZOt0EC7azRS4rjHs9DnOQkuEO/C?=
 =?us-ascii?Q?hozj0ZC3jnif4B1XOslbWQQVzAts2Sh5slT5w+VsjilczdAxhx8E1X5m8bK8?=
 =?us-ascii?Q?Zb8R0SHSLCbRkC2wf2zbHRUQGH5rB7JG7Ql+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:20.6192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff657605-8552-4994-fd9e-08dd7dae45e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add support to read the command line from the hyperlauunch device tree.
The device tree command line is located in the "bootargs" property of the
"multiboot,kernel" node.

A boot loader command line, e.g. a grub module string field, takes
precendence ove the device tree one since it is easier to modify.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Removed __init from header declarations.
  * Removed ifdef guards, as DCE ensures the missing definitions don't
    matter.
  * Removed ifdef guards from new helpers in domain-builder/fdt.c
    * Rely on DCE instead.
  * Restored checks for cmdline_pa being zero.
  * swapped offset and poffset varnames in libfdt-xen.h helper.
  * swapped name and pname varnames in libfdt-xen.h helper.
  * Turned foo == 0  into !foo in libfdt-xen.h helper.
---
 xen/arch/x86/include/asm/bootinfo.h |  6 ++++--
 xen/arch/x86/setup.c                | 10 +++++++--
 xen/common/domain-builder/core.c    | 32 +++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.c     |  6 ++++++
 xen/common/domain-builder/fdt.h     | 24 ++++++++++++++++++++++
 xen/include/xen/domain-builder.h    |  4 ++++
 xen/include/xen/libfdt/libfdt-xen.h | 23 +++++++++++++++++++++
 7 files changed, 101 insertions(+), 4 deletions(-)

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
index 4f669f3c60..4cae13163b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -984,7 +984,10 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
 {
     size_t s = bi->kextra ? strlen(bi->kextra) : 0;
 
-    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
+    if ( bd->kernel->fdt_cmdline )
+        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
+    else if ( bd->kernel->cmdline_pa )
+        s += strlen(__va(bd->kernel->cmdline_pa));
 
     if ( s == 0 )
         return s;
@@ -1047,7 +1050,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
             panic("Error allocating cmdline buffer for %pd\n", d);
 
-        if ( bd->kernel->cmdline_pa )
+        if ( bd->kernel->fdt_cmdline )
+            builder_get_cmdline(
+                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
+        else if ( bd->kernel->cmdline_pa )
             strlcpy(cmdline,
                     cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
                     cmdline_size);
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index 924cb495a3..4b4230f2ff 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -8,9 +8,41 @@
 #include <xen/lib.h>
 
 #include <asm/bootinfo.h>
+#include <asm/setup.h>
 
 #include "fdt.h"
 
+size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)
+{
+    const void *fdt;
+    int size;
+
+    if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
+        return 0;
+
+    fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+    size = fdt_cmdline_prop_size(fdt, offset);
+    bootstrap_unmap();
+
+    return max(0, size);
+}
+
+int __init builder_get_cmdline(
+    struct boot_info *bi, int offset, char *cmdline, size_t size)
+{
+    const void *fdt;
+    int ret;
+
+    if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
+        return 0;
+
+    fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+    ret = fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
+    bootstrap_unmap();
+
+    return ret;
+}
+
 void __init builder_init(struct boot_info *bi)
 {
     bi->hyperlaunch_enabled = false;
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 1fae6add3b..50fde2d007 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -209,6 +209,12 @@ static int __init process_domain_node(
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
index 8c98a256eb..d2ae7d5c36 100644
--- a/xen/common/domain-builder/fdt.h
+++ b/xen/common/domain-builder/fdt.h
@@ -9,6 +9,30 @@ struct boot_info;
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
 int has_hyperlaunch_fdt(const struct boot_info *bi);
 int walk_hyperlaunch_fdt(struct boot_info *bi);
 
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index ac2b84775d..ac0fd8f60b 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -4,6 +4,10 @@
 
 struct boot_info;
 
+size_t builder_get_cmdline_size(const struct boot_info *bi, int offset);
+int builder_get_cmdline(const struct boot_info *bi, int offset,
+                               char *cmdline, size_t size);
+
 void builder_init(struct boot_info *bi);
 
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index deafb25d98..afc76e7750 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -24,6 +24,29 @@ static inline int __init fdt_prop_as_u32(
     return 0;
 }
 
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


