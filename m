Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FFDA9B385
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966540.1356771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAL-0003V0-CI; Thu, 24 Apr 2025 16:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966540.1356771; Thu, 24 Apr 2025 16:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAL-0003Rb-7s; Thu, 24 Apr 2025 16:11:09 +0000
Received: by outflank-mailman (input) for mailman id 966540;
 Thu, 24 Apr 2025 16:11:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAK-0001nH-01
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:08 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2009::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba023e1c-2126-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:11:07 +0200 (CEST)
Received: from BY5PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:1e0::11)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 16:11:02 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::5c) by BY5PR03CA0001.outlook.office365.com
 (2603:10b6:a03:1e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 16:11:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:11:01 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:10:57 -0500
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
X-Inumbo-ID: ba023e1c-2126-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzArhp9RUJ9R4gE/qNVXcvKU8PeAC0k7BOhhbj6s35+fVUhK2ZgyBXUErVjm142mfNZPey1jZ1ba/3oCgJw/leAPDra4nGpT5MbNrIUT8KkrJ23N7ZMO6kpwrG/FKhaOC2KgdOloQKv4HtBtaVa9I4tum9wpT4mSmQy7+GN9tAgjzJ7QlXnxE6yULwI+V4JTykKbxuXGmMEqMjXpcogTUtmeAnnZ4D+mEBAIW693gCCNUaTFsWtoR8i81oKcd7c8XyHTrKoDFncHvW2DxQcJy4A9dVWFDeKdodI5xmZ8vYqUMtFt0vXAlg8t8DBHSJhpaXXwjN/z1nHpJ2+OPqdVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=040m2HL/wx5IafRg2WQM67zz/QZTdAza17xjTQBfo70=;
 b=N3X63EQ5erP970b5AYaW2YFJ7AdzcbDSZrcwcMjo0WOvBjXp07/dri8+jdkhx6qDqh/TDhtOERuRr3JCT1eM+Z1inLIvKcS+bfE8RQ7E4X+f7poDXas6mVQKiKbulGtTX2BX625UXMwTducjqQZCbIurXxL2SdnJHo0muBctH4DhMEWKfFoetoG5f/MWZeqJLwyd1hor6UT43X/KLqvznsf0qxYqI4n5JfblwREw26gR4B9sNPS3DXdzGCgrZcMRMJqYHFyP8zQwoaPdTc5+vIg5XrPOyQKnb+lxRTOPpMqd39/126MkAgO8WhWrW+gsx/NJG1uGhzR4q4Qrf4SNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=040m2HL/wx5IafRg2WQM67zz/QZTdAza17xjTQBfo70=;
 b=DA5OGFDQAGe5ZtIi4jzePm0a8WSweF2kixA8dI7Iym9P6elFgZoOlunCKmVAhnWO55kxRJx1H6B2ysOZPp5iSHyx01ST23X22mRhcQjS+9C38729dDXSC7nzQbfCXgAa5+WiEB/6NrCQFOcWm15R6OQPH/DuaqpqXQiDnDAadxU=
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
Subject: [PATCH v5 06/12] x86/hyperlaunch: obtain cmdline from device tree
Date: Thu, 24 Apr 2025 17:10:16 +0100
Message-ID: <20250424161027.92942-7-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424161027.92942-1-agarciav@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|DM6PR12MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: 4460af43-66f0-40fd-4ab3-08dd834a9baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7ZjNlq/5olDiGJMGDD0bev2k0hFYzs/Y3SD3GM31BMJSc5AUHvSNIqZJUE3K?=
 =?us-ascii?Q?VddLOxTcvIE1zulzLeJfdNQSWjHSH7HVUq4lcUnzJ1wIGaFoEtDccgjxg0sR?=
 =?us-ascii?Q?BuEwvQTXjfkUvaA0wUFwX75KXw1erdzxPdtwa+TVzVwZUmvJmWjj2YltN7qx?=
 =?us-ascii?Q?QX5i9PHYK8pG96kJHaJnd03RYAxmaE2Lp1OxC/qVhKHqMDzxtej49O4XzwyC?=
 =?us-ascii?Q?V3OsgqibP8rGH74A9j47y9F1pubTJ/YunhiH6OSqPQKMG7gsg4ME8s5vQWE+?=
 =?us-ascii?Q?dbWlqiihykzmDNePj4K698GSkebgEGOvuZiel+FfqtGt330dPEaNpAWJB1Vr?=
 =?us-ascii?Q?CqLdGjw9HzeEd4ifb/B+jAS/6ioRagXru9Eh9p20uxZ1WzGyXfvvAamkV0Jv?=
 =?us-ascii?Q?DvQVzmYxD77/btAQZuvsObw9lpcU397UknT+T03uPH9LflZloyO8Oq3+5Gut?=
 =?us-ascii?Q?xGJKbVl0hkCmGqHCRZeqd3fXjiZeGaQKbNiAcQrS0sIS7RPPWC7Afc1fnnxR?=
 =?us-ascii?Q?BxbU4wcf7FU+Dc0FofFB3iyt+MFLxdecP1iargZNCMnpy3XOfX4gaKc2d3nA?=
 =?us-ascii?Q?Bm2+faua+kvpNXIg5MChOX0NYzY7KQBr243j3/J24qggMWsL8V0zqFHqpJSG?=
 =?us-ascii?Q?WDydFI5x+RZzg/GO0yhOAUUfv/RoTouQU43k53+GN/l+rn6AMtfaabTaVMNV?=
 =?us-ascii?Q?LLdSZsj5rlM41pCn5fZ+7T74GAr/bVHXT5AB05HFNnA2aEjGti8N/wai6oNK?=
 =?us-ascii?Q?3cJE2pB1DuGuLa/i7H43TzfXrv0uXz5y0o6NH/sAj0GKr0mDo4b/g+MUJ/fG?=
 =?us-ascii?Q?7SpxixC0xBuyN4QZJYFygF2PrHDt/iEF1tEZoQ+/qtJxyBs/rs7UetQqIjkR?=
 =?us-ascii?Q?J2M9KQ4G4ubNv/3eJg7Qe9hXo3Af0FuCeqei/GFFMOBaQ6eVQ6o+YUmWt9R7?=
 =?us-ascii?Q?rogS51LKh+q2TK55bZu3rWECprUlA09ODGRVi7gK1tHWpw1NVEUZU0EoC47w?=
 =?us-ascii?Q?bHNoNJGH8AnKW2Gznn3G4j1c8UhmyKzuqeboTC7Y7q+IlkFlSFG8nvEes9R/?=
 =?us-ascii?Q?yiapMbmwc+Taea/k1e85CkS/JaFTohZWp2o9H41jGvPWXS5pY5p+IqxVFY9g?=
 =?us-ascii?Q?iEdvcLLA9NvFWj1uls8YtSGgcYtzHw6S95ETOvx3Ohy+ELMmySNY88C7ERyD?=
 =?us-ascii?Q?SotN3dbejw/+6p5kqUZC0R9Gd4DUhN5zqzTiQbvdWyLzMtxnUuOidNGFIDRh?=
 =?us-ascii?Q?AlpTPp0pcqObi7Ib9DPb54S5N3qafZ8dAhrZPjVatRBGclXO3mQ9MAPUNHus?=
 =?us-ascii?Q?U0FthFfI4Cwkectfqqb9sKag4eZRAREuvIEqNu0MmSGSajjx/DQ/VZ9iMpUn?=
 =?us-ascii?Q?v7niZnlx/J5NF6QTp//28NFmZSU22ZaINhU0tqH0NVDYPGsD0v1gthPAszLA?=
 =?us-ascii?Q?waxBUYt9tjNp9mGqSVv+1HQ+KT4/+2NfmsgFjt5IQfAxCZkIUKP9Tb+rLe83?=
 =?us-ascii?Q?KkREMVgptTwQ15mKV1m2hQpkXoJKSMMhjNVY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:11:01.7519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4460af43-66f0-40fd-4ab3-08dd834a9baa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add support to read the command line from the hyperlaunch device tree.
The device tree command line is located in the "bootargs" property of the
"multiboot,kernel" node.

A boot loader command line, e.g. a grub module string field, takes
precendence over the device tree one since it is easier to modify.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * Fixed typo on commit message
  * Added BUG_ON() statements on fdt cmdline parsers in setup.c so they
    are skipped on !CONFIG_DOMAIN_BUILDER
  * Add cmdline handling comment to the domain_cmdline_size()
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
index 7e756302ae..325ba8cc8a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -984,7 +984,19 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
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
@@ -1048,7 +1060,13 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
index 0955558977..0b7a21a4b8 100644
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
index 662c715483..fa92dc55b2 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -219,6 +219,12 @@ static int __init process_domain_node(
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
index f48456acd2..e1243cbf26 100644
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
 enum fdt_kind detect_fdt_kind(const struct boot_info *bi);
 int walk_hyperlaunch_fdt(struct boot_info *bi);
 
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


