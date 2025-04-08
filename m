Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1A4A811A7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942942.1342005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BYO-0005jU-Aj; Tue, 08 Apr 2025 16:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942942.1342005; Tue, 08 Apr 2025 16:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BYO-0005gq-5V; Tue, 08 Apr 2025 16:12:00 +0000
Received: by outflank-mailman (input) for mailman id 942942;
 Tue, 08 Apr 2025 16:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVs-0000a6-Oa
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:24 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5d57d58-1493-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:09:24 +0200 (CEST)
Received: from MN2PR01CA0040.prod.exchangelabs.com (2603:10b6:208:23f::9) by
 CH2PR12MB4232.namprd12.prod.outlook.com (2603:10b6:610:a4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.33; Tue, 8 Apr 2025 16:09:18 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::7) by MN2PR01CA0040.outlook.office365.com
 (2603:10b6:208:23f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Tue,
 8 Apr 2025 16:09:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:18 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:16 -0500
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
X-Inumbo-ID: d5d57d58-1493-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITcIlD5CBdN5LFC5ku2hqX5axGvK0f6Dy0Cxfpc9pydjdeA8JSyK1fVHR69dEMa66cu3h++bL8Lc/AikrLjOx14igsXuhYzLack4EVOo1oVhrvcXz1OPuiVZ/JzAPBzEhydTsdiOaVkRfOuQywB2KdIRbTIbM+rq9UWGNmoBPzVBakUR8ESVuaQcettm3/Ya7Qkm6TmlnWpcwEYqik34OxPaFtJpBYHOQ9EqjKQqXczxeuPvV2ILnn/H9u1b8zfOryb1pfrKLfhFwcmnxFI3OvHf+80fczU2LK9O0TXEY5MiBwjvtHzcw5S5Zljj+o5rpknt2gTK5MYhuRgyGBPQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9NqCvhzPSD0hg2V+P7263fYM6c1xFTV40UkgAV5Gpg=;
 b=on6XfXXK3xXIFo8BQ5QdX3ej0EA7fQNuW68gyHFlTX5jaM1FegepuwPWzk8tOg9Un7h6sKEEpbKUNiYIl96IhL52TMxjl2M+55c/6tGoXrKHkIWhATIZCpv7HbrDRgKJEYdMAyvUfcdKFku5oYQYcDLIJH+5giFn03CnmbKwFzhxnXkLlVYTL9t3kKRjf/D1940PxeiQ1IzvzigO4sJM0FrzwL6m4WanDmAQIAnKou9tIuYOYbgUfsZis0azLb7ekMOtzEMhXSFk8nCKUxSHhpSe9nA7GHm6k4wMF53U0E//Lrs6xaq7OxPnr23Zjnyol/9d6QBPjxU3lcO/iOpxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9NqCvhzPSD0hg2V+P7263fYM6c1xFTV40UkgAV5Gpg=;
 b=mDsCbLNR5hS98/Ljo0KT+91xSsHi08fRKsiR31hstL/fN9S/XhdTLr0NS1YJBqBr6M+5KTbVXy0tH8k+BpFqEa8gA0oMeMN2onlOV8zXq3zb143sZ64KczMo61kMQZJaHqXyHpFixs0iJRO6kR0ILRt8/Lr/K0tUkFDT16yLa2Y=
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
Subject: [PATCH v3 14/16] x86/hyperlaunch: add memory parsing to domain config
Date: Tue, 8 Apr 2025 17:07:36 +0100
Message-ID: <20250408160802.49870-15-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|CH2PR12MB4232:EE_
X-MS-Office365-Filtering-Correlation-Id: 376e6127-eb51-4e3e-79a6-08dd76b7b75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bla8YJp2JkIBzboNjM2FCCWfyHpRLA6GbDW29tiT20MsFRp5FEiHTy8u8Fjl?=
 =?us-ascii?Q?pSPcbg3lAabHvlMsdrXRsm03stZk1Rg8bLUwVgiLH/yYJQ0o2eY7Ocyt0HHz?=
 =?us-ascii?Q?AqynNL74115GkxrSxmKkwYqyfHnIIKhlgXA0lGJJ7qSLPktZL0AgE8dUS1hz?=
 =?us-ascii?Q?xIhfIiEAL/PGFa+ain+foWAo/j4vV1If2wmwSjzVkuycI2oynrDANbS3wvwo?=
 =?us-ascii?Q?3tWdcLQVMWzBcess0OCyrwH2A6yJWohlIIeyqMyfRDp+rSpk9PgZUz8V9Fl6?=
 =?us-ascii?Q?PCRz0o3xJE7fbCfiZtIpNbH8TulPFEO7S9euO+Q/16hTVIvdEcIhZgyvIZ6+?=
 =?us-ascii?Q?NdNgtpbiFFID75Nmq2a+CLi5mq7TdIGjB3/fpXvFS/6DN8mfMoijcz/krH0L?=
 =?us-ascii?Q?QQtVg/oUgqChz/ZsM3ilI7E0kyjnw4a6Enl+vARkV5mz0vynamFK/srObrKG?=
 =?us-ascii?Q?y2k2AqB6ggLdLvkx5s//JZKFlKAquMg4knycz6VDBsospRZIQHRpTXFNl4u1?=
 =?us-ascii?Q?WCs/1OjhRZogo27Zs54oqOZGlHI51vMjhnZid1B3vq0ys0oOT+DAE1LdrocC?=
 =?us-ascii?Q?BAhtzu7hayyt+wa3wQLzIsckA2irl5PDM1xeZIs3xI21UsreYbdC+xJU5+rt?=
 =?us-ascii?Q?7Y67pvxGD1df7mdPxMonxdQZEfedk9rywAic5qJvk3vR0e4vnraxKMuJpydb?=
 =?us-ascii?Q?40SdJZTG2IBXhejciUepWy5seTpvjO38DKsboWQw7r/cqmSXtjGz02ysr5ti?=
 =?us-ascii?Q?9k9Lo488rQDUTNBKQyKc3+Si1WWdNHyDHfRVpvVulHw2GHkuBpHbZwu5ftRU?=
 =?us-ascii?Q?gzPI3LJsIHKIMl1XV2qOK30IZ9CX4FdBXKPji82db0a/74MD5dUVSWb1Mbtg?=
 =?us-ascii?Q?pKnRPyVPsNTCCk/Y8lL1M8CFFFmaHoXakh1alibmfqUqonncO9CSB5ueTA9K?=
 =?us-ascii?Q?JbvwQcW27ycPyCpYhP5ErKjyJMxc2OZaij58N7nM65Vzn8dBCIuufWEO2k6u?=
 =?us-ascii?Q?9/v/ti/YEq+ygjHLdueavPeeprxsVxbVGr/3sIRSYl7eN6U2vwH7uqU8YHQe?=
 =?us-ascii?Q?gFlPEyUsvrfis9cfH6o5Ms7C9RG72hOkT43FIzX7LcRux64W6nSER/CrXBpx?=
 =?us-ascii?Q?vq1HzyLpCH2s1gQWryodzK9sm660AGDVSNzehlU3zluE6SZqTHCvpIr4T4CS?=
 =?us-ascii?Q?TT8RD8FyX+Mbk/P/ErVgXPS+5523+3HJaijqex72uFDIqYRhGx5cMvHhV1UK?=
 =?us-ascii?Q?1d7lFiUlrMZ+1wPxHyKG/3/0gCdVoja0rZBsBJwG5l+0BE3VYgsFXVrcgTky?=
 =?us-ascii?Q?6RDy05UvMxwNS2rZ63A9TKIbKD4z4xOTKb+mKWG29uRe5CPUjSjqN5Fu4jvQ?=
 =?us-ascii?Q?MOOH6QXIrdkafPIWtAcwC7oM0Z92DbATIFNDx/fuKlB8YQixqAwIMGahWsh/?=
 =?us-ascii?Q?tXP+eyEB6Bu38EEQRjvBPoD/p2cQKtR4g8x1pxWfYZEScac9qai5TLFY8taJ?=
 =?us-ascii?Q?DgLmURwPFcZmARw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:18.3524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 376e6127-eb51-4e3e-79a6-08dd76b7b75e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4232

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add three properties, memory, mem-min, and mem-max, to the domain node device
tree parsing to define the memory allocation for a domain. All three fields are
expressed in kb and written as a u64 in the device tree entries.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/dom0_build.c              |  8 ++++++
 xen/arch/x86/domain-builder/fdt.c      | 34 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  4 +++
 xen/include/xen/libfdt/libfdt-xen.h    | 10 ++++++++
 4 files changed, 56 insertions(+)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..36fb090643 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -627,6 +627,14 @@ int __init construct_dom0(const struct boot_domain *bd)
 
     process_pending_softirqs();
 
+    /* If param dom0_size was not set and HL config provided memory size */
+    if ( !get_memsize(&dom0_size, LONG_MAX) && bd->mem_pages )
+        dom0_size.nr_pages = bd->mem_pages;
+    if ( !get_memsize(&dom0_min_size, LONG_MAX) && bd->min_pages )
+        dom0_size.nr_pages = bd->min_pages;
+    if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
+        dom0_size.nr_pages = bd->max_pages;
+
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index da65f6a5a0..338b4838c2 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -6,6 +6,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/sizes.h>
 
 #include <asm/bootinfo.h>
 #include <asm/guest.h>
@@ -212,6 +213,39 @@ static int __init process_domain_node(
             else
                 printk("PV\n");
         }
+        else if ( strncmp(prop_name, "memory", name_len) == 0 )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  memory: %ld kb\n", kb);
+        }
+        else if ( strncmp(prop_name, "mem-min", name_len) == 0 )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->min_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  min memory: %ld kb\n", kb);
+        }
+        else if ( strncmp(prop_name, "mem-max", name_len) == 0 )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->max_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  max memory: %ld kb\n", kb);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
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
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index 3031bec90e..da43e12e38 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -34,6 +34,16 @@ static inline int __init fdt_prop_as_u32(
     return 0;
 }
 
+static inline int __init fdt_prop_as_u64(
+    const struct fdt_property *prop, uint64_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u64) )
+        return -EINVAL;
+
+    *val = fdt_cell_as_u64((fdt32_t *)prop->data);
+    return 0;
+}
+
 static inline bool __init fdt_get_prop_offset(
     const void *fdt, int node, const char *name, unsigned long *offset)
 {
-- 
2.43.0


