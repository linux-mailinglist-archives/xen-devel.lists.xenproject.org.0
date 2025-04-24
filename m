Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9CDA9B387
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966537.1356760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAJ-0003Bq-4l; Thu, 24 Apr 2025 16:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966537.1356760; Thu, 24 Apr 2025 16:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAJ-00038Y-0w; Thu, 24 Apr 2025 16:11:07 +0000
Received: by outflank-mailman (input) for mailman id 966537;
 Thu, 24 Apr 2025 16:11:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAH-0001nH-Rd
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:05 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20619.outbound.protection.outlook.com
 [2a01:111:f403:2405::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c89994-2126-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:11:05 +0200 (CEST)
Received: from BY5PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:1e0::32)
 by LV3PR12MB9118.namprd12.prod.outlook.com (2603:10b6:408:1a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 16:11:00 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::8f) by BY5PR03CA0022.outlook.office365.com
 (2603:10b6:a03:1e0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Thu,
 24 Apr 2025 16:10:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:10:58 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:10:54 -0500
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
X-Inumbo-ID: b8c89994-2126-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfHpcRYNOswSjvp5rIbFKSzm0YFibrJN61wgnlzoFMIfg5X0KY1D47cmPY10xJ6af2lgVrN4wNrDhEgnhDMS9Zvh/GEGmKk1KeokPBkn3OxrpD7DxlGBppMzoLP/vNthxbNPLN8wuvfybwMs0siimsF1LALfwqpj4BCGTqXKL1+FW/AQaE6BJBvj27xPwk8d9VFsMseCQ8hLw6009Mkkz2qcy7h+JigJ5yBJOmsWtTXwuGgMUT11LPuJTkCPFvh5WogljEnm+hR1Diqr24MGuHrEgcGwBYuvSY+abaqLEqFTYIf2+TCS8n3ffTQMS9+n71I1zTwnsP37ln3AyrwDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQTbGW0kHXZziuUHgHskmnnUaC6QlbCAFsioAwpmZ8w=;
 b=L2AeSARIDi7pmHMu+3fsEZL1ldXRS/QNreje1ikOH43q7BCY/RF1UJ8IQIGwU9XATOdCF8+KVAjLvMOhESbXSwEDpgZVUcRQoemApe7fpAw0JZtSVamfh/8qngyx5+v3/6KphlcYRLwgxNRM6GGnpeNg22479jwt1L8hfahB53mtWM6FL4PwFrWzW/bPG5ST2c3z7Ejp+Qv5HEVMAlUrKVLRUScSRru9umEmz3A3hoFVUZQIZZeiyI99Tqv/RQd1HGy6c6KLdHfhtwAC7IF7bxsAJbySCAmCAtie3wHyEa7p2dZME8n7UWJS7PSZDeqi2evYj5cXchjhQJj0JcBuWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQTbGW0kHXZziuUHgHskmnnUaC6QlbCAFsioAwpmZ8w=;
 b=ppxoxDAcwK82kdHYij/M2ksL796VxXRlm1QlJSoddwmNs4Hnmxvuww23ly1rVxVLl5AXX/wp//u7KfXIsQQPzc8DVwm9iqdu1MZKWbktC/lKBK+sB07NeAjG3nVYzDlEfXOZ2vIYqmtB7wJYrGBpD7Ulqza+AWAuwh8mBrvbsNk=
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
Subject: [PATCH v5 05/12] x86/hyperlaunch: locate dom0 kernel with hyperlaunch
Date: Thu, 24 Apr 2025 17:10:15 +0100
Message-ID: <20250424161027.92942-6-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|LV3PR12MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a5cbca-937d-4d72-8b14-08dd834a9983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gE5657PnO3DtB2t3y89tGV43K68/Le/vIem1QLfr9a41dE21j1G51tF8QCTy?=
 =?us-ascii?Q?DhVYLyq2JFwDV6gTarwBdMdvgV7BjR5mAOB2pJXdYbIoH+hgjQOh50E1zI10?=
 =?us-ascii?Q?cPkdXhbYrgH8S7QBeXNHui9uV6CvmL/agtLCI5el4ZhJgDfblt8UfhpwJxUK?=
 =?us-ascii?Q?SOGHa6X5czLnwQHfkfazt7tHqf176s0TXrygR6SskNTfW4QnHzAWGYm64J9V?=
 =?us-ascii?Q?cmCacHUpnhA49naj3IvHRiT2PTRoYWzbOvTVjwT8rxkBE5Pks4xc2M7bmfCd?=
 =?us-ascii?Q?6jMsod9QRqcGdVEdOnKbSJLF4CSnz6B3og7S+5DjOHZf+sjv2u4fFgprpE/u?=
 =?us-ascii?Q?xRfslIFvcZXGovjmJWKEyvuikJCJyKT1qn/TC5f89OCBCXM8oR5PULXUe90w?=
 =?us-ascii?Q?mLZ72brEcbkxPm/fvRXVBBRCJ5b7kjCSnBamF93fFT3mVCpYYvfvKgeJjPLl?=
 =?us-ascii?Q?lpTGOz9NY3Qeiw3PAF9FR/vj9pFw43cXWG19zQg1wudqaE56z1DOIIDjpplZ?=
 =?us-ascii?Q?jCetzem4+O/p9CUJSfrSGcK6dgM1dVw9mdTQFY5M3Z59Fsoa5seMu5RNJ2+j?=
 =?us-ascii?Q?mX4Z73k6U9wY8ClVW8dezuDG9RMeC2sAcy0R0p4nHtjsUHSSicd2lJw/vFwJ?=
 =?us-ascii?Q?DUWj9I6tnFiYtE/1M7z9D7ToO+tSjmrMbjwmrkK54kccvcQo+XvNjS/m75EO?=
 =?us-ascii?Q?HweSv4eAf+HY+O6v9RXc78amt2jqxtccBWRJ+N9phWPiosQPekr833OfdUzM?=
 =?us-ascii?Q?gLIlDhZmkFNp737A6zd2AkY/Vu1xXlj+yLfFfz9QHuhToSc8XJyDW2wSHdT1?=
 =?us-ascii?Q?Gzu+4xlKcmSdcsjJFV+OzHZHgHjcbiUCyI2zq2UsOJAWfNdJ/yJU/TJer9wM?=
 =?us-ascii?Q?USAWPSuqd8oFzlNFRdaD2gevn03lpy1rrq01TwuOfBXtbd7V9KQwgIEwUZXc?=
 =?us-ascii?Q?8UA/7KCSAv2IvjDmQ6UVcjEmhvQ8h2lIK0L+5TwxLsX6uNG2sz3VNTgDIUTr?=
 =?us-ascii?Q?NNcq9kExcJIWVWnEE0Jfw2dLJuDvkPXV3hKKvCXYbOr3wnXXvhFXbyUiziV7?=
 =?us-ascii?Q?WhVpS0qTffdxN9qeMS+dGvS0hDkMjQiOKWBQaCol+mu91Iz0oeJQJTx/Kzup?=
 =?us-ascii?Q?6sqf4WphPOV2ry0pKKzeMTXL1/XdOQS51k4uiX5ZELWuYcSUROia7ehPV5xI?=
 =?us-ascii?Q?o5iOGNZVGQviet1F69MhPogW73YvYWjkdA+TnOQhAc8NivoOskDuV3kHkgLh?=
 =?us-ascii?Q?05sHnwfHZsx+YfzXYElD8N+GU5FmKpP93f0RxJQEBVwuPADs0PDZfTvWSyfW?=
 =?us-ascii?Q?03f0naD9DEVdmcFTgPhMSi7lHUCRMVijZRWTN3YJD0YfknGLVG4HMcOXhQ76?=
 =?us-ascii?Q?vyYlrUtaM4bnrviPkSIh6aaVKztRmfabdV49sNsLx5grHL1Tansb/bvmznAE?=
 =?us-ascii?Q?AqIH5ZXFips9MP4YNyTZd4yMd15Z8oJ6jr7WJfoYp7ASTt3irMvakyrjf4Vc?=
 =?us-ascii?Q?6Lc4vYIxF1Dhm8mG1PC4A0Lyx0kWjPkLaDkj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:10:58.1425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a5cbca-937d-4d72-8b14-08dd834a9983
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9118

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Look for a subnode of type `multiboot,kernel` within a domain node. If
found, locate it using the multiboot module helper to generically ensure
it lives in the module list. If the bootargs property is present and
there was not an MB1 string, then use the command line from the device
tree definition.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * Add domain name to the error path on no-kernel.
---
 xen/arch/x86/setup.c            |  1 +
 xen/common/domain-builder/fdt.c | 64 +++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index bd13d9d196..7e756302ae 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1290,6 +1290,7 @@ void asmlinkage __init noreturn __start_xen(void)
         i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
+        bi->nr_domains = 1;
         bi->hyperlaunch_enabled = false;
     }
 
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 11f0436e85..662c715483 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -99,9 +99,9 @@ static int __init fdt_prop_as_reg(const struct fdt_property *prop,
  * @return              -EINVAL on malformed nodes, otherwise
  *                      index inside `bi->mods`
  */
-int __init fdt_read_multiboot_module(const void *fdt, int node,
-                                     int address_cells, int size_cells,
-                                     struct boot_info *bi)
+static int __init fdt_read_multiboot_module(const void *fdt, int node,
+                                            int address_cells, int size_cells,
+                                            struct boot_info *bi)
 {
     const struct fdt_property *prop;
     uint64_t addr, size;
@@ -185,6 +185,52 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
     return idx;
 }
 
+static int __init process_domain_node(
+    struct boot_info *bi, const void *fdt, int dom_node)
+{
+    int node;
+    struct boot_domain *bd = &bi->domains[bi->nr_domains];
+    const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
+    int address_cells = fdt_address_cells(fdt, dom_node);
+    int size_cells = fdt_size_cells(fdt, dom_node);
+
+    fdt_for_each_subnode(node, fdt, dom_node)
+    {
+        if ( !fdt_node_check_compatible(fdt, node, "multiboot,kernel") )
+        {
+            int idx;
+
+            if ( bd->kernel )
+            {
+                printk(XENLOG_WARNING
+                       "  duplicate kernel for domain %s\n", name);
+                continue;
+            }
+
+            idx = fdt_read_multiboot_module(fdt, node, address_cells,
+                                            size_cells, bi);
+            if ( idx < 0 )
+            {
+                printk(XENLOG_ERR
+                       "  failed processing kernel for domain %s\n", name);
+                return idx;
+            }
+
+            printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
+            bi->mods[idx].type = BOOTMOD_KERNEL;
+            bd->kernel = &bi->mods[idx];
+        }
+    }
+
+    if ( !bd->kernel )
+    {
+        printk(XENLOG_ERR "error: no kernel assigned to domain %s\n", name);
+        return -ENODATA;
+    }
+
+    return 0;
+}
+
 static int __init find_hyperlaunch_node(const void *fdt)
 {
     int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
@@ -248,8 +294,20 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi)
 
     fdt_for_each_subnode(node, fdt, hv_node)
     {
+        if ( bi->nr_domains >= MAX_NR_BOOTDOMS )
+        {
+            printk(XENLOG_WARNING "warning: only creating first %u domains\n",
+                   MAX_NR_BOOTDOMS);
+            break;
+        }
+
         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+        {
+            if ( (ret = process_domain_node(bi, fdt, node)) < 0 )
+                break;
+
             bi->nr_domains++;
+        }
     }
 
     /* Until multi-domain construction is added, throw an error */
-- 
2.43.0


