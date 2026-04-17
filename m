Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG9CL3z54Wn50AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 11:12:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D948419204
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 11:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284085.1566010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDfFK-0002My-FW; Fri, 17 Apr 2026 09:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284085.1566010; Fri, 17 Apr 2026 09:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDfFK-0002Kk-Ay; Fri, 17 Apr 2026 09:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1284085;
 Fri, 17 Apr 2026 09:12:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wDfFI-0002K8-U9
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 09:12:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDfFI-001vR5-Aj
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 11:12:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e1f963-2eae-0a2a0a5409dd-0a2a4509e898-46
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 11:12:15 +0200
Received: from [40.107.200.50]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e1f96d-2497-0a2a45090019-286bc832562c-4
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 11:12:15 +0200
Received: from PH8PR07CA0025.namprd07.prod.outlook.com (2603:10b6:510:2cf::13)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 17 Apr
 2026 09:12:10 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::c9) by PH8PR07CA0025.outlook.office365.com
 (2603:10b6:510:2cf::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 09:12:09 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 09:12:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Apr
 2026 04:12:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Apr
 2026 04:12:07 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 17 Apr 2026 04:12:06 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXDR21u60QeodK9WNj/nNdtfelVg9cFppiISN1qAguet13ArU/YWJmosop8RsMgmWIXumzz70Kd9nTBbomTitq6jwj2ZPiCpn26Dz8WrwUbGmuAFjdSKChKUu6azk35rbOKNkv0aSOGKjVGVLP4e6dv2+N0uwMSKhSlBcGMPWac8YXQYQ2hDNroLuD+5H9lk2mKP6/v3eRIRowKQTs4sTv2Y8v7BgrW/cSKTN6gwuE4EvHOGDpJfSb5DRHBFmHQ/168/ayOujqcyyqkcBNZATXqh0nNOtoNHTZ9LDg/VM84nwLwI0zgZROZaQOqdqCI8YE1I68cKUpxRp2drn8VLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKn5zKUavkcvPog4fXZ4j4u8fjK1wj6lwUSHN1kEG7o=;
 b=AK0azPIPXnmx3eTDejwZLqZF1k7cGq6WLQ5lsQZjCjYHz/gjaK+HD30cXn8rzquPJPnKCHO5iFwN//VqD+XQfytN/VsdZZTOe33RPQ7pcbCCepzmEqVAKpP71LyoEkFLEeAT2KZ74Re7xeyI8HkRvAvgEohN/C53Xm4pSlmaeZASD+6X+kV54q0pcll3trLu27XERU+czZFO+7PZpXTw89CkLekJxysYFBrUYXTIr39c7+Z7zR3AVrJIsaCUhK1mFjSJouTEnahsLOCJ3WNKjLv41wlABFQikpgSj7xzFjU0/nc71meXClQaREvLLZ6p6/lGui3BeCOpQlr8ypUTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKn5zKUavkcvPog4fXZ4j4u8fjK1wj6lwUSHN1kEG7o=;
 b=x7zoMbOiSy/s8sOyOEnBbxGkHhaNIckztd8+riCHY0od9b3u5vnnMxm/iY5bUGnLO2vvTYDgaPP6Vs9A+1IAEgJRLIXF7laPKBA12GkEJ8n1j8dG8eNSOfWiMSheQplamzEfXQeVG4kqAgNQj5phcZdRpqVq9+zXyE2CbVB7Uoo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: [PATCH] device-tree: Improve hwdom memory allocation for DMA
Date: Fri, 17 Apr 2026 11:11:55 +0200
Message-ID: <20260417091155.39653-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: afb89aad-3684-4fff-6c01-08de9c6166f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FDjdiMBzpJuv3LAF2f3WMi1e+LE42zrgYf8RDJP9oK7voHOrV8dNnV1aV3cn5qseI+YhpbA+0Xuq1IkD1eAUhy9pVlJxg/o3O4x0Ink+ArxrfVHver4wuwH6DME4MyWc1vkcs1/NDhll9frYvgsFdoQLdBbUGn3Dd0lD7obm2A4L5c51l4kGkUDkehPN1XHe587yVbpfRNU4e/kX/IAklOI+ZHV8CBXEly5fJVloPTId45df2nKQkMj+XVw5RA6QZBNiMu0+6MNmjcCiEi9RbIRFWRsP4tpRWx0wgbNFkg+NJ2y4qCl0OjNNVawBzQciWoC14eBw5zJsPGoO7q7fBLm/ZgZ1/3obn6Xp4a2hBd+SMfnf9CRWHqb2BHjrSk11Hz9ykbWJT+lYsF9MEyUyiJiVsZNIv9Kxgq8nJDesyN5RUZG7XVIBMK8+AooHWIEdvnhfG3LdFk0HEk4VGWc4bHbSz6H7AuA8M9PnS3tojSi1o3q1REeECANYEuzVbVrSUhzffSmoHlyyu6IH3KS/UKCPFhLOiUz0v3mocJVsS9ee21/mTlUc48vCE0HYEpuud4YLUc45XhWmW7uuQgnbUUnRBNSq8zpqN35IahhPTpKhpFKxFU4R+pY8H0FvlzrwR86kGAeM3yMVb76aQ4AwzsWUgoFVTTZFzKBY91kd/9Yb/fMSj2Zww7bsyFch5TUS+dJ/7Espw17fXVmOz3/pE0VEXEtUNbrqJzkiQZ/lkSlke7FDvzYs2Z80e7bIcvU9s+9n9+AJj2wnNDJSceEXRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JWi/9SJymGEG7Szla+KuBQldHp1MTH2Mwb1jo7hS9+PDLNFhPjPshKjMNWnbdjBKeNDDyWPmNtTmb6OoKvFXsLwAwZ8TPJKeNvXD/++l5dDaEn70kyFCLumCcCh8x43BXjBixGQcngsHvHUwZMGLhVDar6O2QlGYM7+N4OSAzglEXl1bLcvwBN6BbDFQb2Y2MFsuxxEa8fRdSOMbHG9ZPtzxDplcQywa90bHaQr9DMntDt1IJFpMxMdPNzblpkv8g5xQ7W1savhwtUrgYH12GxQmmS+O7gGzMf98348lGleF2pjHWkWqnYMyZgBZ2kPI4NTEnjXagUX0pLhp94nsrLGYykTL4HYdtNbUdRBq1Uczj1RAtin62eFxJKUjxxhC8hXDBxA1dQQ5Siyo8m1EGVR7MlJ/8u6s/sAU2k9ZcLApUT2WMLjwWhVANZ3cLz79
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 09:12:08.5413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb89aad-3684-4fff-6c01-08de9c6166f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
X-purgate-ID: tlsNG-bad1c0/1776417135-496B0A53-8E953B89/0/0
X-purgate-type: clean
X-purgate-size: 8074
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Luca.Fancellu@arm.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 1D948419204
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When LLC coloring is enabled, the hardware domain gets memory from
host free regions rather than the fixed guest RAM banks.  The previous
code sorted these regions by descending size, which usually causes
high-address memory to be allocated first.

All allocated memory could reside above 4 GB leaving DMA non-functional
for devices with limited addressing capabilities.

Improve the handling as follows:
- Sort free regions by ascending address instead of descending size,
  so low-memory banks are allocated first,
- Skip banks smaller than 128 MB (or the total remaining allocation,
  whichever is less) until the first bank is placed, ensuring
  place_modules() has enough contiguous space,
- Extract the hardware domain allocation path into its own function
  (allocate_hwdom_memory) for clarity.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/domain-build.c | 152 ++++++++++++++++----------
 1 file changed, 96 insertions(+), 56 deletions(-)

diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 540627b74e96..c51520ebadf9 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -133,9 +133,9 @@ static int __init add_hwdom_free_regions(unsigned long s_gfn,
     e += 1;
     size = (e - start) & ~(SZ_2M - 1);
 
-    /* Find the insert position (descending order). */
-    for ( i = 0; i < free_regions->nr_banks ; i++ )
-        if ( size > free_regions->bank[i].size )
+    /* Find the insert position (ascending address order). */
+    for ( i = 0; i < free_regions->nr_banks; i++ )
+        if ( start < free_regions->bank[i].start )
             break;
 
     /* Move the other banks to make space. */
@@ -234,82 +234,123 @@ out:
     return res;
 }
 
-void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+/*
+ * Allocate memory for the hardware domain using the host memory layout, when
+ * the domain is not direct mapped. The only case for this is when LLC coloring
+ * is enabled.
+ *
+ * Banks are sorted by ascending address from add_hwdom_free_regions(), so
+ * low memory banks are naturally allocated first (if any). This allows the
+ * hardware domain to have memory reachable by devices with limited DMA address
+ * capabilities (e.g. 32-bit DMA).
+ *
+ * The first bank allocated must be large enough for place_modules() to fit
+ * the kernel, DTB and initrd.
+ */
+static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
 {
+    const paddr_t min_bank_size =
+        min_t(paddr_t, kinfo->unassigned_mem, MB(128));
     struct membanks *mem = kernel_info_get_mem(kinfo);
-    unsigned int i, nr_banks = GUEST_RAM_BANKS;
-    struct membanks *hwdom_free_mem = NULL;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+    unsigned int i, nr_banks;
+    struct membanks *hwdom_free_mem;
+    struct membanks *gnttab =
+        IS_ENABLED(CONFIG_GRANT_TABLE)
+        ? membanks_xzalloc(1, MEMORY)
+        : NULL;
 
-    mem->nr_banks = 0;
     /*
-     * Use host memory layout for hwdom. Only case for this is when LLC coloring
-     * is enabled.
+     * Exclude the following regions:
+     * 1) Remove reserved memory
+     * 2) Grant table assigned to hwdom
      */
-    if ( is_hardware_domain(d) )
-    {
-        struct membanks *gnttab =
-            IS_ENABLED(CONFIG_GRANT_TABLE)
-            ? membanks_xzalloc(1, MEMORY)
-            : NULL;
-        /*
-         * Exclude the following regions:
-         * 1) Remove reserved memory
-         * 2) Grant table assigned to hwdom
-         */
-        const struct membanks *mem_banks[] = {
-            bootinfo_get_reserved_mem(),
-            gnttab,
-        };
+    const struct membanks *mem_banks[] = {
+        bootinfo_get_reserved_mem(),
+        gnttab,
+    };
 
 #ifdef CONFIG_GRANT_TABLE
-        if ( !gnttab )
-            goto fail;
+    if ( !gnttab )
+        return false;
 
-        gnttab->nr_banks = 1;
-        gnttab->bank[0].start = kinfo->gnttab_start;
-        gnttab->bank[0].size = kinfo->gnttab_size;
+    gnttab->nr_banks = 1;
+    gnttab->bank[0].start = kinfo->gnttab_start;
+    gnttab->bank[0].size = kinfo->gnttab_size;
 #endif
 
-        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
-        if ( !hwdom_free_mem )
-            goto fail;
-
-        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
-                                     hwdom_free_mem, add_hwdom_free_regions) )
-            goto fail;
+    hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
+    if ( !hwdom_free_mem )
+    {
+        xfree(gnttab);
+        return false;
+    }
 
-        nr_banks = hwdom_free_mem->nr_banks;
+    if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
+                                 hwdom_free_mem, add_hwdom_free_regions) )
+    {
         xfree(gnttab);
+        xfree(hwdom_free_mem);
+        return false;
     }
 
-    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
+    xfree(gnttab);
+    nr_banks = hwdom_free_mem->nr_banks;
+
+    for ( i = 0; (kinfo->unassigned_mem > 0) && (i < nr_banks); i++ )
     {
-        paddr_t bank_start, bank_size;
+        paddr_t bank_size;
+
+        /*
+         * The first bank must be large enough for place_modules() to
+         * fit the kernel, DTB and initrd.  Skip small regions to avoid
+         * ending up with a tiny first bank.
+         */
+        if ( !mem->nr_banks && (hwdom_free_mem->bank[i].size < min_bank_size) )
+            continue;
 
-        if ( is_hardware_domain(d) )
+        bank_size = MIN(hwdom_free_mem->bank[i].size, kinfo->unassigned_mem);
+        if ( !allocate_bank_memory(kinfo,
+                                   gaddr_to_gfn(hwdom_free_mem->bank[i].start),
+                                   bank_size) )
         {
-            bank_start = hwdom_free_mem->bank[i].start;
-            bank_size = hwdom_free_mem->bank[i].size;
+            xfree(hwdom_free_mem);
+            return false;
         }
-        else
+    }
+
+    xfree(hwdom_free_mem);
+    return true;
+}
+
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    unsigned int i;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+
+    mem->nr_banks = 0;
+
+    if ( is_hardware_domain(d) )
+    {
+        if ( !allocate_hwdom_memory(kinfo) )
+            goto fail;
+    }
+    else
+    {
+        for ( i = 0; kinfo->unassigned_mem > 0 && i < GUEST_RAM_BANKS; i++ )
         {
             const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
             const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+            paddr_t bank_size;
 
-            if ( i >= GUEST_RAM_BANKS )
+            bank_size = MIN(banksize[i], kinfo->unassigned_mem);
+            if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bankbase[i]),
+                                       bank_size) )
                 goto fail;
-
-            bank_start = bankbase[i];
-            bank_size = banksize[i];
         }
-
-        bank_size = MIN(bank_size, kinfo->unassigned_mem);
-        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
-            goto fail;
     }
 
     if ( kinfo->unassigned_mem )
@@ -326,7 +367,6 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
                (unsigned long)(mem->bank[i].size >> 20));
     }
 
-    xfree(hwdom_free_mem);
     return;
 
   fail:
-- 
2.43.0


