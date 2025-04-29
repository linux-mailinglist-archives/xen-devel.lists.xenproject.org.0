Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC0FAA0BD8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972392.1360763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kGY-0003AT-Iy; Tue, 29 Apr 2025 12:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972392.1360763; Tue, 29 Apr 2025 12:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kGY-00038X-GK; Tue, 29 Apr 2025 12:40:50 +0000
Received: by outflank-mailman (input) for mailman id 972392;
 Tue, 29 Apr 2025 12:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kDj-0007KK-9v
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5076f2d-24f6-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:37:54 +0200 (CEST)
Received: from BN0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:e7::32)
 by SJ2PR12MB8158.namprd12.prod.outlook.com (2603:10b6:a03:4f7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 12:37:51 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::23) by BN0PR03CA0057.outlook.office365.com
 (2603:10b6:408:e7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 12:37:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:51 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:44 -0500
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
X-Inumbo-ID: c5076f2d-24f6-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsbgbhUkv5vsQD2xtrpUjKMtb9yDj6Im4oTD/xEZSRflUI2Xpnl+BQYeqviTNKSnlkGe4ux2715QgvI8iZYwxqrPbCJ5xb+bPEWwoKxRtSdvfNsFb+sWfLOXhtAccQP5dMTneYjch/9DrXMNs98Fg80TaU/ThxczwYHmkY//nKlTkrR0xp9up2/OZOwsRQ8lf5akFBff6skL+jZ3pGyi1otUQUhFCsDjVNJAaM9Og6ouhhRlh6EXOXkNgqyBMJ7so9XOuaDaJyUa2Zo/L7hVphv7jWxA/H9tUZZ9tj+dNLchoLM8GGFcwkoNnrCU8rKS++AMZz1PwFBFHHFUf14r4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk+0cuFaL4PjlqZuXO8kAMll1JDmXXUosf54xaUN2m0=;
 b=VOGqBqzl7TmKDHSYlY4JrWb1pCdxGxOspayJHZhLFaKP3r6+7VHf9Thv8GKl7YPv1+TRGzF0FNNj6Q4i59tArFwiixRPutvVVEc4eC4GJH8EkOPFrDhl/pIPcZnZFrfTk5l/xMp6M5M3zsF7xie+skK8qwOlZQNN9vd8erMyu/zftFsdTGHpaDDGaV7aWoXq371MqJQ7tQEDPlnGctJkDkkrGdWe6iSLaoWZ8uG+StGXqU0xzHfYuA9uI5TlFLj9N0uu8uGEUnFnmyL3BpdN4lSfnT+jWQO8BaJfP1KWntcIFRrDCiw7MbgrRuQvNWz92Ia4gEWNAtlWCTqGpI3amw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk+0cuFaL4PjlqZuXO8kAMll1JDmXXUosf54xaUN2m0=;
 b=MwrzTOV1SHVFiiC7YZWudKG2pwjEleoOe9ptqNyHEp8DKxn/TLoqS6vLgqGr5jQOfFYcS5SX20hG+Sei1/MpHgClcsIbXFFfEYmmME0rSsf6+0YRozzlZ2RI8e3PRIBe8L1JOs7qH9Z6p9rraeyWz5Bogb8ABC37ANW3LUNt8UI=
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
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>,
	"Denis Mukhin" <dmukhin@ford.com>
Subject: [PATCH v6 10/12] x86/hyperlaunch: add memory parsing to domain config
Date: Tue, 29 Apr 2025 13:36:21 +0100
Message-ID: <20250429123629.20839-11-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SJ2PR12MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: b9882f07-ffc9-454f-5147-08dd871aa7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mNGGpBFI/t7n3Hydf9kVCo3j26iQqfl5Q5uT/FctcnUnj7IQV95e3xDhNJM5?=
 =?us-ascii?Q?RgTRLgRExM6m9khvNBTc70iH7TGAdJ7AWPP5Vypr531iO/Fig2v1z9PW1Hus?=
 =?us-ascii?Q?RtjNy34i2kZ0iJ3FRC5NwF//MajMtke5OpR50oaIbknm3w42DxgKIqLinvAE?=
 =?us-ascii?Q?+rhk7LYWrTjIUaf/pEAJnGBj9RWaHgH95fH8G7YhcpJbdYqf7ASDiXgDEYQx?=
 =?us-ascii?Q?G4uWK0OxEd/KOyANCYwTrgGqViPQRt8/oa91DZ4bseakHjaH3Lmymc+DrA00?=
 =?us-ascii?Q?wODj7+yCmlNZ/hMZL/Lwx1tTxu2tlWqapXSVT2L3QTsPBSNszSj5r1InRMzJ?=
 =?us-ascii?Q?HDQLKW3Gp+SwLD4mGVEhnYh+OufOVG6t9DWfBYHvgWZzLygRVMO4YeyXsCbO?=
 =?us-ascii?Q?5r5NpajGw4di2EVyi+JUs7vT6X+HE0zXGLC5zbfy/laV4sfEBw/ddjasGOeL?=
 =?us-ascii?Q?1b8Ilzi7DeWD8KNKHeGFh78Fp87BCGoAXoGqOZmgeyd25wOPIZujpjKp0lss?=
 =?us-ascii?Q?DoEBF8R+5FiKmHQ1zP43WpF9mpV32JhkEU0giJd8eP1n4T5KlmQwd6IH+4RH?=
 =?us-ascii?Q?sAzq+BA/6gRcaK3SW728zitJ18WzP4HhPSmeWSMKuxa+5SCTRRui8B8U4k3z?=
 =?us-ascii?Q?hFUqOxhpjDPuqB/bkGCRw7DrJ0sGQKW/OaA30sAYOkYSL993cpoWnyp+yD1F?=
 =?us-ascii?Q?zjNV5LUQVy6GzPpxNr3cTZSo7b3uL5gCqqoBuaac73WbB44Y9oRfPWT+haJi?=
 =?us-ascii?Q?S/VySYQfaMbLlu4QuNhyfzz130Nsc3lJ0akSr3nmY1+HfpMmIDsIowG0nf0L?=
 =?us-ascii?Q?efZ8uWLDv/G/ZlTLbLMQ+0DHrGuCwtnrvGhaPkbVR00WXo4FvZcT2I0updJm?=
 =?us-ascii?Q?LJnYieGn1pF2wETXaPcGHYgJeWcKvPa9WupYN8s/UBm39dwzNFt6/6QWES3g?=
 =?us-ascii?Q?sszygl1kD2yrd3wvMDkpuI4Koprc1/QXhRmi/3Bu1aSY33YBr/ly47ovf8yc?=
 =?us-ascii?Q?2IgU378lEk2vUGpsulnwTvuIqIjNgZE8mhgqpF7D83JPDDFDUyJKY+VUSoX/?=
 =?us-ascii?Q?oOL3P+TH4GFkp/uA1dWwnsJtluLqvxU0arANbJxsFxSEwkkXmbosv11X6lTT?=
 =?us-ascii?Q?7Y6uBuG2FFwAaiD2ZWE/UwZk2jOBTWqB9uIAKTrYH6X0kakL+6GcefB5rmcX?=
 =?us-ascii?Q?XjuiVjEeatoHJTJ2wEva+bKwVJnEYPw7wJMPE/TIKflhs7ekQCw+aUozAyWS?=
 =?us-ascii?Q?m6Q2uCet01sia3qaCDH0fYMessBm94zd1LvSZ0q4dHe0Qt8tJhrSpgHr19Ne?=
 =?us-ascii?Q?ZOjL8b+fv+ti52vPphIazRh7LCrHobH1G/K6IPFp5xF4VhMuhyXBrbyoql3F?=
 =?us-ascii?Q?MGAh+8xwzp938if8ZleE0TVmN5ZodGDvNLnsET0KOuTBlO5ja37qozngigdJ?=
 =?us-ascii?Q?zDjffE0W/aet1P1WmN/0D4IVjW/xdDef0F0MLyLSNYh7fd+7DrwD04r2Turm?=
 =?us-ascii?Q?OJ/guqS0NoFWAC+1dm2BUeHp7x0g1y0QnQjG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:51.1290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9882f07-ffc9-454f-5147-08dd871aa7de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8158

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add three properties, memory, mem-min, and mem-max, to the domain node device
tree parsing to define the memory allocation for a domain. All three fields are
expressed in kb and written as a u64 in the device tree entries.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/dom0_build.c              |  8 +++++
 xen/arch/x86/include/asm/boot-domain.h |  4 +++
 xen/arch/x86/setup.c                   |  5 ++-
 xen/common/domain-builder/fdt.c        | 46 ++++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 1 deletion(-)

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
index 343f87ee9d..4a3c41ad71 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -297,7 +297,10 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
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
index aadca11dfa..d9babe9d56 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/sizes.h>
 
 #include <asm/bootinfo.h>
 #include <asm/page.h>
@@ -24,6 +25,16 @@ static int __init fdt_prop_as_u32(const struct fdt_property *prop,
     return 0;
 }
 
+static int __init fdt_prop_as_u64(const struct fdt_property *prop,
+                                  uint64_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(uint64_t) )
+        return -EINVAL;
+
+    *val = fdt64_to_cpu(*(const fdt64_t *)prop->data);
+    return 0;
+}
+
 /*
  * Unpacks a "reg" property into its address and size constituents.
  *
@@ -256,6 +267,41 @@ static int __init fdt_process_domain_node(
                    (bd->mode & BUILD_MODE_ENABLE_DM) ? "hvm" :
                                                        "pvh");
         }
+        else if ( !strncmp(prop_name, "memory", name_len) )
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
-- 
2.43.0


