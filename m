Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57DA9B3C7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966645.1356834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zKX-0000wH-PK; Thu, 24 Apr 2025 16:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966645.1356834; Thu, 24 Apr 2025 16:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zKX-0000tG-Ld; Thu, 24 Apr 2025 16:21:41 +0000
Received: by outflank-mailman (input) for mailman id 966645;
 Thu, 24 Apr 2025 16:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAZ-0001nH-J1
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2009::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2b6dd1e-2126-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:11:21 +0200 (CEST)
Received: from BY5PR03CA0004.namprd03.prod.outlook.com (2603:10b6:a03:1e0::14)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 16:11:16 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::15) by BY5PR03CA0004.outlook.office365.com
 (2603:10b6:a03:1e0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Thu,
 24 Apr 2025 16:11:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:11:16 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:11:11 -0500
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
X-Inumbo-ID: c2b6dd1e-2126-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwPDiBsUkqST3SWB2rCaAk7OuHtznPwjB5J7B9CI85KaAK5AxrE135PQsPFehRxQ9hKx24BnZ/q5HdwpMu4188GErQFrhFOyFR415wMScK628cuSvAA7quRi2NPM71Gql0x5KaJe2d/IekxFeKk0LzCRARm1pWgyHid00THJulRdxkZAIv2atlarMxqIL7p8rnk0sfL6GEdbgv+arhl2wNEowT+Ttxo15GSZ0c+TwlSfC4fiFHBNIoRCiRocWprXMZsPE01zGUhxhu8LGJqe/lysma7cA3D5imTU5tWjJ4Wlynw+562OcyXIxpozs8eMXKWi6YTAg6cwHOZnGV7gVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbQD0BEkffu9ccPLxnUOgdugjybzhilvi8yJz3bAL4Y=;
 b=ottkdw0GSA+4KcOOeoesvzv6A7v8wOuS4fDu37BjIaskbVEAMNThC4oOnDAcoalls6c0UvCzKsqmaCfWMljGDeSSQmvN/saInlP1ho5EczoQlPu1svhpY2zsz/ZQet09gsQ/qxNe/RSJZnW/2e/NIC3j13hYg4AO/lBonwehsjLQLL6ogZfTpd4pFgWE8arLqkI4pNFtc79uGdrKKq/0HM4GF1AuUGb2WP42eeKrUBik+az5KdQIxmYHUTZX5R7Qlfpa0qEz7EXgsJ+IfanHmOf93T0rmd2vQa4cMdWMdAbeM25BWnwaCJRMypNT1bWgYgUVgeEoHiqtw/5d9kQzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbQD0BEkffu9ccPLxnUOgdugjybzhilvi8yJz3bAL4Y=;
 b=OM2FMI9aCyAln2ex7lm6O9BOWL4XYUOPmLbwWLOh2MqH9Acz2A1epZo62iECg+ieS47JUttaEoCUgwyySXiJ3BblvlE+FQy5bFF4FEp8O38qPMZ6m5544oSA9Y0B1nDM1f+nnnyYnEHQrgDjQrbqwdNaMqjTV6u9Rb+IaKtHd/Q=
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
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v5 10/12] x86/hyperlaunch: add memory parsing to domain config
Date: Thu, 24 Apr 2025 17:10:20 +0100
Message-ID: <20250424161027.92942-11-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: c4825830-4df4-45d3-238f-08dd834aa43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qp9IeC6giTUV9xgXou9oHSLbvafh8fYmjRZ+t7xcqr8t+Uq3KJRFgjRrIEaZ?=
 =?us-ascii?Q?K3YnWWsGSLhwjX9DfRFvnm310aZkHMu1rzRSoWjZrF3VtDiOgXhgqh733XMz?=
 =?us-ascii?Q?Z4wdL07VuxChEL5DA2FRgvJO0bCgjcYEJ8kDP6zrBpwWlgIHv8RqgVGmMKca?=
 =?us-ascii?Q?gmipww9hASebdU69njjOlx0M4ZBTJ8nfuS9upSNt3v6fi6yAZb0TKWW7Kj9D?=
 =?us-ascii?Q?ASiPOjGCgnWn/nJdqV2VKSslGT3WSGKFnoI/pO4pFhirB2fZFITtr9p7GDUb?=
 =?us-ascii?Q?EOZIEqJVy4+o5PqiXasBoBSFnxm9Zp+bg416PB8wJenpFT6YIg6QYXw2jfGI?=
 =?us-ascii?Q?RHaeqaxNEDl221j8KxR1PVd5r/Ds2ak31wdOoIKcWiRDYumf9H6hFo9EGcnB?=
 =?us-ascii?Q?9sdODJv8qHLmURInEm9ZwMTuicyRh4iRjUVs/Yvt86RCJVWJ8BgBJPBGqbAW?=
 =?us-ascii?Q?9ZA8YyPw8XNGva/CT6fwnMlig115HlXt7ssdZn7I/pDY4NtbVnzIfWAiDK/m?=
 =?us-ascii?Q?dRRIG31l+H5vGNbT3e/EkaWcR1BAJpkAmhwUvBJ3xekfws64A5LAH8RzIj7U?=
 =?us-ascii?Q?aY/Q/w5TQY6N5O49YyHDrjwedRa9/PSivQ5GKGDKomRlyPOyMGtBCVt8cdhY?=
 =?us-ascii?Q?qyvPupUmoRFS6UDxaUedfR8cbJ0fN7frvtFmpEr5PFEwrrFOAmSi0/Oz12MR?=
 =?us-ascii?Q?VDsYTf5Nt65HHXQMKioZBEFE/+om3ZyU6tbgc+kVoYzjrN3Qhn0ayUoYnHKi?=
 =?us-ascii?Q?OR2Dkw6aw3bbFhWzxIGUN9/Z4/px/28+zzl56+s4Om9xGPE3CizZZu1gyWj0?=
 =?us-ascii?Q?nMqA+/XHkkNFpUddeRQpw4+5pPEuQDg8GqzzH4F2W+2fJlbFTN1vub/AqWev?=
 =?us-ascii?Q?tfFyytELp1WeYGTThKviEfkJ4kxHysVHlZo1IxlFFl6Y608PzArRWrDfjO8l?=
 =?us-ascii?Q?saDOQn06wlEWMh4AEXl+DAdsj3OGc0DQHrRWGSbpASzOTWDMEU8bi1Z+4NvJ?=
 =?us-ascii?Q?euL0oVK2r4pdayolRw/jYFTzNPD2MvePEsx8I5to5Y55EXqbZIuPFGLTYmVq?=
 =?us-ascii?Q?i8sydMWgawOLHSqVASthtymaaSChFuiSGl6Bdrdzd26uBiuIclYD4yCzG8mq?=
 =?us-ascii?Q?/k9B8rMZBRGa601ooZqjXAx1K3nOEHqbNHGPjcsTNzLitAyDhpo1mC5us/BG?=
 =?us-ascii?Q?+DU7phKntP8+S4mrPGQi+JP3jNAlkNGI5jEB3E2vmMQo49vylVWb2zxExFJK?=
 =?us-ascii?Q?Hj1sccg2rtU3X4S9rVi8cJCS0j78mTXHo1Z8F33SeTDt1IHrH19fpgpswfPb?=
 =?us-ascii?Q?AaUrTV6sNyDI09FwNbC50NfHlM1W3K3jMD2tDJirljrJ6mx0g+1ey3BcXtV7?=
 =?us-ascii?Q?kdw8ObRDi9mxMAsq46Xg1GA8oGRQvtmfAreKZWm4vmb4lSMR0dS92Y0N6uyf?=
 =?us-ascii?Q?ujZk9N7NCNsvpVgTXua7LXUMeZ+ABZDClT9FZUB054qqGWXBy51/JSD7vAMc?=
 =?us-ascii?Q?2UIv8cnDJrczfG6ioxoOF+ODBVDldzUpuWI+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:11:16.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4825830-4df4-45d3-238f-08dd834aa43e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add three properties, memory, mem-min, and mem-max, to the domain node device
tree parsing to define the memory allocation for a domain. All three fields are
expressed in kb and written as a u64 in the device tree entries.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * strncmp() == 0 -> !strncmp()
  * Moved the _u64 helper in libfdt-xen.h to fdt.c
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
index d3a4f89a6a..d4f839146f 100644
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
index 75f68de448..ff41727ef1 100644
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
@@ -256,6 +267,41 @@ static int __init process_domain_node(
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


