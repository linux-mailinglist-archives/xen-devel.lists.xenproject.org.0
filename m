Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E4AAA0BE5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972446.1360803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHs-0005fz-NC; Tue, 29 Apr 2025 12:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972446.1360803; Tue, 29 Apr 2025 12:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHs-0005eE-J6; Tue, 29 Apr 2025 12:42:12 +0000
Received: by outflank-mailman (input) for mailman id 972446;
 Tue, 29 Apr 2025 12:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kDC-0007KK-KZ
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2009::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1b183d3-24f6-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:37:21 +0200 (CEST)
Received: from BL1PR13CA0349.namprd13.prod.outlook.com (2603:10b6:208:2c6::24)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 12:37:17 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::9) by BL1PR13CA0349.outlook.office365.com
 (2603:10b6:208:2c6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Tue,
 29 Apr 2025 12:37:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:16 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:12 -0500
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
X-Inumbo-ID: b1b183d3-24f6-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBGEbhvg/2H+IYmF5bWjNdNFl+MMNng4bogNLFCCuTa38DdbKDlw9gpHrAd87vtgZdsZBF8PhB4ivmyGSPYZpRxzOhE0AH66KnLCOmFaLg70j4yrs1c7cP1I+eKKoadm97J9fRk+f0ALZdi+HodH7VtaFWvjNOziLVnciFCqyNlChk7t9+LzoCGDJvJh5oz9Sa9FAW/8RhmECLrA23gC4Zf82T1xJ6r9y+Gz32/XkDHHLJ4l7Srpq+NSQC/Ttgv8Ca9Oa8xgqmrxSysNB6o3LE1Ta0VvAiHG46gVX3kGCCNNcZ85AL0EAGuDBy/Mlu8X1gUpzqotXjMJC2JspgHJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE4YsDHXTzpV3ycmzVUl1WwygqCvp1QDjKtcwqrOQCs=;
 b=V21je4UlVU/DRWLZmcRi5g/ydf9v6k+uGvysQBi0XE24ugnfeGUyBuPGxzmTFj3tf0jMbLWN0LyRUkqInun4R7TRpdmkkEvn7P4YojvjhlIFohKsCETA9X1jA60SXJCAgWCnuQ7+O04fV3fAsSXy/DuWr6d3eRrxsPq0N/jA0pFHLCnQPE430NKWfkWxUIfr4OTWBXGFU59MHevQ6KwHek3BGdMP8sLA39UeMEIUpXlqCaO4EoNWQ6oLg13gIHRGbP9t9kXrI7wfBxnFM70ossKg9vWn/Fzo/LpAHNVzyC+YkXHY/kOHe64gMbZnZE0ZB6OMjAiEjZkc2RNTTn+4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE4YsDHXTzpV3ycmzVUl1WwygqCvp1QDjKtcwqrOQCs=;
 b=J62f2rptCbxkzGRlEN/UAEVIUbzoLC8qn30m7FTHzOK04gaQ+XhH2FP9GweLupQPBmozXQSzi2YvVtQ2+y0Wx8fDhV/HExVL1SWRbqjJlt0EvXIgFPdTJkojSpIHqQG2CIoAtlGg4eCRpUeRxL4UzDw5Sbz8pKgIA66OOQl7f2c=
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
Subject: [PATCH v6 05/12] x86/hyperlaunch: locate dom0 kernel with hyperlaunch
Date: Tue, 29 Apr 2025 13:36:16 +0100
Message-ID: <20250429123629.20839-6-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 204d6e0c-e199-41ad-9312-08dd871a9377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZiHQ2J0lqCvTECYYb5Td88Kz3nMSog65+dgdzATxy9Vjnu+e6gueaYCiBDqb?=
 =?us-ascii?Q?d++2kuSN/STI6hNUC9f0lMSH3+9iTAVelMEKwb1BC9X6u72XkquuV78RhP6G?=
 =?us-ascii?Q?qP++ne7UmjpKr/81FYAJJGXJvKL1RcT5gVVWIYmVQExWeqD702eSKAD+Q2jO?=
 =?us-ascii?Q?sKOVr/2jFVRDN+KU1QvUtyPHtuEE2SDcFXmAsdWDxVD1p3BE7NsXb5IjqSWs?=
 =?us-ascii?Q?V9BegJz5hpsRrgt247GZm74SqRv4fRUWXqg6snHd0Bwbxs0knRU9cvrheci1?=
 =?us-ascii?Q?5pu83aCWfU1OvyPBX2HGsE23dyMYa9l7g8zXJB6vESgaX2v42JhmGJto/BL0?=
 =?us-ascii?Q?FqlMre34M4mlguBc6JjAyi81fCghpohiPn8PRl1GnxQ7ElRcyDrcE6UJNClI?=
 =?us-ascii?Q?39Rt9qBLB91HOopEaOFw9/hM1Ht1BsrwX1QgAgxFL7PRjhOw9jqW5YG5PayJ?=
 =?us-ascii?Q?ARwK3aTJX+sju1U+/RGH3pKratWJD4zZs8RdJKPfyeimn/mxL2XIP1jx88zv?=
 =?us-ascii?Q?RHLik/M+ORPE39GkuRp4V7jiTiQEy2ETjHkE0zmn/WdIRC5FuCOG4Y9i+BsL?=
 =?us-ascii?Q?5ULDlEv+XJDKGQV34bHJ1RigK9ecwfPC5aJ5rSDJGoQsMQs5CyccXHFWIMbx?=
 =?us-ascii?Q?Tt7X6WyrICXWlgwL8jm/0uNJ7677jHjSq2uamass4OFf61MBfw1ASyfpMWyA?=
 =?us-ascii?Q?DquLNSk2MZuseGu6mAQ3zGLAsML+gz1HQj8xLRg7xxgI1VtQQm6Q2MTH1UMD?=
 =?us-ascii?Q?Il2LiZ56tTDI7b1hUsIOGPXeN3lPVv8luGEHmsxe4elQIXSM8jmF7rC9EHY0?=
 =?us-ascii?Q?fZZNnNkXQg2rdky54yZpz4LqhO1Zw3L8rTOyTLfLu3kCWxMjnQ16EQ4KNAvJ?=
 =?us-ascii?Q?T4GanJiU2P0cL9N4maFmS4WNNImkORUzNLkQErk6dkS62SdTlV3TK2XdiGgp?=
 =?us-ascii?Q?vZBk0ZluPBPatXzBH5IW8T8VhQH8FfUL1PrsJzyC+Uk3TSzsaq9msGNbEYad?=
 =?us-ascii?Q?uhqir3TGKS07b7KRSuliZKRNz/he/kd4UFo/NMxbc1UwrG6/NLqEQtCh1HjX?=
 =?us-ascii?Q?44IQzGnoYD7effxwXer/eedegr+xI7/NuuFS2uz503uUJDpdmNbF/0eLZA8R?=
 =?us-ascii?Q?CCC1s67LnWetBKCrxG1P7u2WBj45X+7z1lBWdCOiVZer8y3AHpzmfm0yOd4A?=
 =?us-ascii?Q?uPfr4hf6mZAEcNL9pYIHPUeAoJnhBIlqJUGYRQLQ08iQGWpiVIm/mV+CDUYh?=
 =?us-ascii?Q?K8kG2ETezxLyuSV9CZG74Cf4XSXId0Nm1pghIl+N5wtP6iEG4t0Ln1+HMUYT?=
 =?us-ascii?Q?aPUoa3XQx5jwhIgFEePMtokoNQKMA4pUoJuKmY0RLqC+cUXFagisZsprfaaZ?=
 =?us-ascii?Q?qoBIiuviukVNdc2WPGl1aqvO+tfTmuBdkWMnmYXL26kG9rp0XZ54/mS6D/0m?=
 =?us-ascii?Q?PJ0ShGqRMUNef7iBZIbs2zqLizecby9+pxbP1mTX3nT4K1Rgo87eszY5NHXU?=
 =?us-ascii?Q?4y8uCu+Aw0bx1wkXQmuJTI062MC1UgVTSNyd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:16.9029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 204d6e0c-e199-41ad-9312-08dd871a9377
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Look for a subnode of type `multiboot,kernel` within a domain node. If
found, locate it using the multiboot module helper to generically ensure
it lives in the module list. If the bootargs property is present and
there was not an MB1 string, then use the command line from the device
tree definition.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/setup.c            |  1 +
 xen/common/domain-builder/fdt.c | 64 +++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f3b5c83a3c..f8193f2c1c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1291,6 +1291,7 @@ void asmlinkage __init noreturn __start_xen(void)
         i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
+        bi->nr_domains = 1;
         bi->hyperlaunch_enabled = false;
     }
 
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 05ac3647cf..cbb0ed30a2 100644
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
 
+static int __init fdt_process_domain_node(
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
@@ -248,8 +294,20 @@ int __init fdt_walk_hyperlaunch(struct boot_info *bi)
 
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
+            if ( (ret = fdt_process_domain_node(bi, fdt, node)) < 0 )
+                break;
+
             bi->nr_domains++;
+        }
     }
 
     /* Until multi-domain construction is added, throw an error */
-- 
2.43.0


