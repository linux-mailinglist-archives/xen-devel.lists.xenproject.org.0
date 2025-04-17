Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3F8A91CDB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957530.1350724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgU-0008QP-MT; Thu, 17 Apr 2025 12:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957530.1350724; Thu, 17 Apr 2025 12:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgU-0008Le-Db; Thu, 17 Apr 2025 12:49:38 +0000
Received: by outflank-mailman (input) for mailman id 957530;
 Thu, 17 Apr 2025 12:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgR-00057t-V4
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67218885-1b8a-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 14:49:30 +0200 (CEST)
Received: from CH2PR05CA0039.namprd05.prod.outlook.com (2603:10b6:610:38::16)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 17 Apr
 2025 12:49:27 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::f6) by CH2PR05CA0039.outlook.office365.com
 (2603:10b6:610:38::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 12:49:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:26 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:25 -0500
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
X-Inumbo-ID: 67218885-1b8a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3lRq9AlwhuD0G7cUpmSLNIMS6TjH7dnhX6WipWOKUSkTHe0JVLX3DTjyHS4JNY1hZF8FlvCVQb0IAKkTF+Cth+zJom6ipPHZ0idNPjlO6ydWovyIwBmGpt4BWqO2oqDsG4+Dwmi1IqeDxxEktcQNRBkg85zlIq6JW4xxTprDuLKKzA7E0H8E3Xs6FjsDMGsE/NY8lNaTdB2P/PcEudAh/m7zxTrArUOJSYFIFW83nNTKG0emBXh7Bb8gHjEewMpPyXkEayXIwakGKL9U9g2+JcbIK3IWt66KDjSqi8kOAQbjLvUd6WTrQNj7pS7JWGXwCHFM0GC77faQxoL991ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/yFUwQX/dEkZnnw5BiTJ2SKezO+3EyIX2dnxAD2sCs=;
 b=b/5FZCdyhFCRBYEhl1IdqFcEJaEd2o5Mp3ktvLsNSv8XeM9lfGCNncxiaFqPn0ZX2DthtWuOOKn2blGDUm9XZkgiaQErG1mzPNX/AehgpL459ZVjbNJuQerHM4lUNtBl/EhDiJSMRAgb3/JAes9fnBosqHGDOjhzhiIvhfJTaWgkJtIvQy+YqyfuuUMhM3SGVHBrKuQXlAAzMQ3lWbKlsdXAwkb1O4QHjIhmlIpuRvAD5K/26N5ppvCPYOAvoDJDDZuSGKBbk7qn8Jpl6zSI+TVmo8dH7XshM4HuUS29uGvWrsASenrx4bbR1z9j2GanyFXkFhRtKb0CmOl9V/+3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/yFUwQX/dEkZnnw5BiTJ2SKezO+3EyIX2dnxAD2sCs=;
 b=LR/+PfC6C9/asaSLRLk/Nuel99tgcgAApEuIzwr8M0BDcPT3/vTgoqw5T1CvAQbOdpBQ11gDJ3UVIlUWh9zpWph9vGdOT6RgK+ffpiIWS9RBPAP9ojU86PxfRmVWVnOSFwLuhy0lb+JdC2CJbo0mH/RXbAPLvpdDxH4uZhJXaBE=
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
Subject: [PATCH v4 11/13] x86/hyperlaunch: add memory parsing to domain config
Date: Thu, 17 Apr 2025 13:48:33 +0100
Message-ID: <20250417124844.11143-12-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a5991f-ad2c-430f-6677-08dd7dae499e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mtTtxuezNaRm2FCl097rlX+1plkzs36OOBVVaS0ZRfFVJswuYrxvzBo6A37B?=
 =?us-ascii?Q?kOcieoxJaIYSfCQVZAngqohquB8ARA2D6utXNBkIAR8lO7dL6XOz2knvQrC0?=
 =?us-ascii?Q?+9bY8H91QeYJkzf/Yqs963UjIRmw+eTpjaGcyOC90hEk4+JE/ma5mfFzDG46?=
 =?us-ascii?Q?VXx7oBNmqOAexwbshYo4NtLX2vO+sizyrU6Vd/GJIQxmyTJgpZI6tpNRkUXD?=
 =?us-ascii?Q?pYygqeHYzjQxUrqZvf8EqtAOzavvRj21NbzTVefJ7mJuJA2AHaOWPL1YrJmt?=
 =?us-ascii?Q?L8k9tFE8oDwbLYxWlDax0nmTSWuVK1F6BGL4++zv5W3RQ0lrrD+Q8FKv/aN6?=
 =?us-ascii?Q?Rq7YTjg32N2jrWFidSUDabpkd7SqCgup4AAXlnqYRYJ0Vs9myPvvaMpIq6q5?=
 =?us-ascii?Q?UJVZELiipUIsEbHksOHzAoj0I8ktBEMDuU2rp8/JGR/D0stzF8bzf5gDsZOR?=
 =?us-ascii?Q?cNaBVCtWtvztRQk26Yz1h0uXcfOF7Lgg8AqISn2rHcFDUDvuKzKF2nextZv9?=
 =?us-ascii?Q?rYQusstpCoQojHIYvsVHdjjnwxVFdi/JuTQ4593UOAex7GDxSMg15ZvjrYri?=
 =?us-ascii?Q?PbWlSjPriak5zDKuFppuAqps6E/C7xblBltsNn3Htlh8zDt1Y/vvKXUgOBLA?=
 =?us-ascii?Q?gYL3asZpM2eGYosXc0tXLGwID8bip+410OjgfzZDqTrwIjNYJC9BvVEoZEOZ?=
 =?us-ascii?Q?48dOzEmUf08RmY1isUfDwKEOFqQ2CcZrPeq74PH2TCXgOaSkAjgMdeJoHDur?=
 =?us-ascii?Q?wPAoUfKgtloNlcw8OuI2aJEXB9efuKe7AkgHaq0Q+sSW4oFJ2wVBcx/0+2bJ?=
 =?us-ascii?Q?yBz/2mXnypHU7CGmiaWngLA272mqsCbO5Dm7Ii54bnz1cXubyJqyaYAuAjcM?=
 =?us-ascii?Q?Ofj62ivKKk26yboS4SRoSPHXXnPmUVGGY269Jk/+LB7j1ZZ2JjZVMKlkAep0?=
 =?us-ascii?Q?Ti3phhigPlv9jWvYRWM6SipxeywQt305IBEdXTz08x4Eny8QLYo46OvFi2fg?=
 =?us-ascii?Q?4+p4sh5aUCTcLhyNDnRsxetvr5Je2dBiMu+Zc84HnsEILmDfn0PJVz44SECd?=
 =?us-ascii?Q?3kT+UTrAaqTb0C80vPTwvnX/AXQ7xtGSX1iZdQ2B8PAnwUqQfNPM/LLxXJYo?=
 =?us-ascii?Q?N5TcjkcIdX524gSLq/kilq1UxtexAglOKzwQKIcuIwYatsTOUMo0SnbdUdW5?=
 =?us-ascii?Q?rBgOR3v9RC7tog94CrBQjQN9yBK9ackHkb/2/X+/XxXf6Xwdc8lztOIU+jJM?=
 =?us-ascii?Q?BYnJOO3LBtdk0j+lJKWdhQenLvcqQtTLq9HpDUvrln4n2PY68fFiMlCK7t2z?=
 =?us-ascii?Q?ZAuWJW5MwVd4c1pH1tEx+0vx0EbufuEXXXvgmWs5hJzPnmJZpDcYR6FMcH/2?=
 =?us-ascii?Q?pj6jS0igdPAK51uFSmZGg1ngQBM0ACtyxSKNyrqXL3KvsxsaPqaEDxXTD0eu?=
 =?us-ascii?Q?ssEXh4FBR20nmin4NR2DExICxQ/J/GdT74uyCmZ+3G9EToXSg12D0m/RoxW9?=
 =?us-ascii?Q?RG/zUFudCghd7v7Gmj+3AWdTyLWIOrRZLM45?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:26.8718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a5991f-ad2c-430f-6677-08dd7dae499e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add three properties, memory, mem-min, and mem-max, to the domain node device
tree parsing to define the memory allocation for a domain. All three fields are
expressed in kb and written as a u64 in the device tree entries.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
Can't use KB() rather tha SZ_1K, as that's strictly for literals.

v4:
  * Don't override fdt_prop_as_u64() rc on error.
  * Add separate printk statements for each memory prop error.
  * Fix bug setting up dom0_size, dom0_min_size and dom0_max_size
    * Was overriding dom0_size on all 3 paths.
  * Pre-initialise max_pages of all boot_domains to be LONG_MAX, just as
    dom0_max_size.
    * Eventually dom0_max_size drops out in the bigger series, so we
      need that logic to be correct.
---
 xen/arch/x86/dom0_build.c              |  8 ++++++
 xen/arch/x86/include/asm/boot-domain.h |  4 +++
 xen/arch/x86/setup.c                   |  5 +++-
 xen/common/domain-builder/fdt.c        | 36 ++++++++++++++++++++++++++
 xen/include/xen/libfdt/libfdt-xen.h    | 10 +++++++
 5 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..8db24dbc0a 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -627,6 +627,14 @@ int __init construct_dom0(const struct boot_domain *bd)
 
     process_pending_softirqs();
 
+    /* If param dom0_size was not set and HL config provided memory size */
+    if ( !get_memsize(&dom0_size, ULONG_MAX) && bd->mem_pages )
+        dom0_size.nr_pages = bd->mem_pages;
+    if ( !get_memsize(&dom0_min_size, ULONG_MAX) && bd->min_pages )
+        dom0_min_size.nr_pages = bd->min_pages;
+    if ( !get_memsize(&dom0_max_size, ULONG_MAX) && bd->max_pages )
+        dom0_max_size.nr_pages = bd->max_pages;
+
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index e316d4bcde..fa8ea1cc66 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -18,6 +18,10 @@ struct boot_domain {
 #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
     uint32_t mode;
 
+    unsigned long mem_pages;
+    unsigned long min_pages;
+    unsigned long max_pages;
+
     struct boot_module *kernel;
     struct boot_module *module;
     const char *cmdline;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 05e3d2cf2a..455dad454c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -296,7 +296,10 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
-    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
+    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = {
+        .domid = DOMID_INVALID,
+        .max_pages = ULONG_MAX,
+    }},
 };
 
 static struct boot_info *__init multiboot_fill_boot_info(
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 6809c7f917..90218d120a 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/sizes.h>
 
 #include <asm/bootinfo.h>
 #include <asm/page.h>
@@ -246,6 +247,41 @@ static int __init process_domain_node(
                    (bd->mode & BUILD_MODE_ENABLE_DM) ? "hvm" :
                                                        "pvh");
         }
+        else if ( strncmp(prop_name, "memory", name_len) == 0 )
+        {
+            uint64_t kb;
+            if ( (rc = fdt_prop_as_u64(prop, &kb)) )
+            {
+                printk(XENLOG_ERR "  bad \"memory\" prop on domain %s\n", name);
+                return rc;
+            }
+            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
+            printk(XENLOG_ERR "  memory: %lu KiB\n", kb);
+        }
+        else if ( !strncmp(prop_name, "mem-min", name_len) )
+        {
+            uint64_t kb;
+            if ( (rc = fdt_prop_as_u64(prop, &kb)) )
+            {
+                printk(XENLOG_ERR
+                       "  bad \"mem-min\" prop on domain %s\n", name);
+                return rc;
+            }
+            bd->min_pages = PFN_DOWN(kb * SZ_1K);
+            printk(XENLOG_INFO "  min memory: %lu kb\n", kb);
+        }
+        else if ( !strncmp(prop_name, "mem-max", name_len) )
+        {
+            uint64_t kb;
+            if ( (rc = fdt_prop_as_u64(prop, &kb)) )
+            {
+                printk(XENLOG_ERR
+                       "  bad \"mem-max\" prop on domain %s\n", name);
+                return rc;
+            }
+            bd->max_pages = PFN_DOWN(kb * SZ_1K);
+            printk(XENLOG_INFO "  max memory: %lu KiB\n", kb);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index afc76e7750..3054b48a83 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -24,6 +24,16 @@ static inline int __init fdt_prop_as_u32(
     return 0;
 }
 
+static inline int __init fdt_prop_as_u64(
+    const struct fdt_property *prop, uint64_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(uint64_t) )
+        return -EINVAL;
+
+    *val = fdt64_to_cpu(*(const fdt64_t *)prop->data);
+    return 0;
+}
+
 static inline bool __init fdt_get_prop_offset(
     const void *fdt, int node, const char *pname, unsigned long *poffset)
 {
-- 
2.43.0


