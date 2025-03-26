Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA804A71047
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927049.1329879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJoh-00059g-AI; Wed, 26 Mar 2025 06:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927049.1329879; Wed, 26 Mar 2025 06:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJoh-00056t-7J; Wed, 26 Mar 2025 06:00:43 +0000
Received: by outflank-mailman (input) for mailman id 927049;
 Wed, 26 Mar 2025 06:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJiM-00083W-Ec
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:54:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:200a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9e217da-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:54:05 +0100 (CET)
Received: from SJ0PR05CA0203.namprd05.prod.outlook.com (2603:10b6:a03:330::28)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:54:01 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::b9) by SJ0PR05CA0203.outlook.office365.com
 (2603:10b6:a03:330::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:54:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:54:00 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:57 -0500
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
X-Inumbo-ID: b9e217da-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3RrVySYwPctmKsVNyJWOk+/2jNezwiciYmUQLDyGMo0xM6FvZdYmse4jkYjA2Ym5LQjEyEAWWcMNe1kNcHFymLiR12rxUAkNNYQdsYwvxPT4a2f6VZpP8iE2Xt+iMKqJt5r16W5wpArvwOgI2I17kMNksUexVe1OkE0YHG2M8cyUT9kWW7aMMDSH1B90QOISaj9U+dA9qFvTmQOa8uYtJ5ZuC1ukJsPRzQn18U8g6UXdtdgfaoy9L9zMm1RmltmA1zsLmddBk0O7GdmAnavRCYX6pUIMzlV3r6Z9UdImyqVvpsrxlu1/IAVXnZbEwomGLx9Up80FSwgpb87SWpuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6lVVCPqPmjDnRoRvg36ZKXjCShv1B9Z3cy1kL21MB8=;
 b=hPzHBYi/Ad1TlpX/NrHqCaCd58iS36PhWN+6ub5CseJGkMLsI2YSf3QsMRkzNU5jXIKacf7XZxw68pDd7qYB62LtybUIcXkiIYj5P5F+dB+WN1eO0SOu9NdbAsFK6qibvbThHIXkn45D5sj8MjchhfMmEkhjT0CJLFN6dz+7PFyzkMNovcnt848OttNQXmQrdixugqimf7HOo3aIbPYMv0yhnZwfu90OoAu5anWE+Y+32NCPkqkHMRn/6fjLlMvgv/dBwuuTC477fdM3qdiypXyzUYHJCBVWnBVrzAAVV8tJ06eRVCQMNDDZdS5IPOevEjp6mbWH97nIyfzXnNYy1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6lVVCPqPmjDnRoRvg36ZKXjCShv1B9Z3cy1kL21MB8=;
 b=FYKUchdWhUIlMqiSt0RReqHXGpp6YH3TpyI0DxpoEC50fz2gm4CcP4ov9QjdpzRZRHVZHEuBH3HyjYv21LXW1poLFP0Ba+u7a4bfvmnrBw6CkAAVu7IhP1H9qUQRwG9QeSe7fYASwbduxiOr9S14kWjTtCnmbg1nEOq4XDhva1o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 14/19] xen: make avail_domheap_pages() static
Date: Wed, 26 Mar 2025 13:50:48 +0800
Message-ID: <20250326055053.3313146-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: f6faac74-415a-4d75-b6e8-08dd6c2a9b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cx41IHDXTr8jB/n2/gvyQDNoOfrTTIclAtdk6Y/DKUEUhQXFbfkxn4+bYIYn?=
 =?us-ascii?Q?LOBCf+d2XmZp9TWXgN9iVF82KhCHSgHIXDaEha2QurbBrILMpLgcgBAWpHMd?=
 =?us-ascii?Q?/4bVWjlFnGhbgGPiU4KkO2JcCoTUZ21FsSll3RC9+SR+GNHbl0hob40jXNYL?=
 =?us-ascii?Q?B3YHpnIEnP0QdBLhyxTsvE4FSEbkk0RBHgUH/yGVI6/BTjmFJOp/AGdSvqzg?=
 =?us-ascii?Q?PKQ6IBc3Slow1MgERXmNETg3BuFERCiYw8dG/L/3ogSSA1k76Xkv+CrNwxND?=
 =?us-ascii?Q?9SvByHnELrzdvOrlHUZOfbWPEOrQe8ijNASM4hwmiWUQWEO8U7qqqUhdNRXH?=
 =?us-ascii?Q?hQORbalC7KrNanxitvZ1fJnhx6fpkAlEWgNjw9eiSc0P97cyDAODVQJ6N5qJ?=
 =?us-ascii?Q?39CDs3cYwbRvNWdmxmY2+1S7LRzbsVTRuuwt2N8CHoT5q7MrQCWa6HOr5dBe?=
 =?us-ascii?Q?0nTm1vQc2zfBW/PNjPm/Qqp0dQeCKYzEASCtOU48w3a8R1IKG5O7pk0m1IBt?=
 =?us-ascii?Q?z+SXeP+VYcGeGN7zFmYt2jLo6UAKlasseacZPsRemoxPToUZ7QL1HSOlv5B4?=
 =?us-ascii?Q?6I1JNo54TY+oSi0Ax+mChZWuOFkMQYAt4/c+wSENkmX7JvlGjPnKvXGNTv6q?=
 =?us-ascii?Q?oXHNVb65+JV9hU1l3A0lgA0LmBmYGYNosC45vtSuFFALLING0UAiMOEYWkRz?=
 =?us-ascii?Q?DrY7i9gq/dzhzmib7PGgXKNgxGHjGRey5pFhjWDfvCwkBX/sugDizS55noN7?=
 =?us-ascii?Q?7uLPsPHF1QXxwWPzSTORhKDT2xMnJV9O1im7a4f/+8EDrZ6Qi2/mleWuGzBe?=
 =?us-ascii?Q?f4lLcv7PqGnWImnhjp4DP4qkVIhdiLmcZ1QNGqEb4L9CtOuqULncFtKveMDv?=
 =?us-ascii?Q?nCQfxcFtj1p/VxjWJGU/eUIcb8uX79FQoyQMlZoIGDFfEB4KkI62dtt5xSeP?=
 =?us-ascii?Q?xOtOEKNKm0F2s19hoJR3EeBEr0WTKtwODWbyzwdPw3mSKEzUZoNeNJijIrmg?=
 =?us-ascii?Q?16GnDGICrS+W75gfnwptwjrRmNvmplRBHcGwNzYjLVYqwlm6+pVOCcpqd3zE?=
 =?us-ascii?Q?XNWTNNJEsWkSnG9tnAiFi+qqQfxl04tmOVdxs4hSjVkoy6WPWN4x5raddDWk?=
 =?us-ascii?Q?yDds0ES5VoXlnpMvEuQMx27Fywh5fsuXTLOX4WZ84HJVNljNSi/61fpGCmb8?=
 =?us-ascii?Q?DrZOZw2ZC4rXIxV3+G+sQBfcazQ18ZSIiELb1vIvnnnoao0zKnOoTg+fiwDX?=
 =?us-ascii?Q?xmaEZwK5qJs1jKZmUjrtFwjRcecwafYsePnLfMuzkUENV72pn5Ze6V7Lso2D?=
 =?us-ascii?Q?6bgGSSxjsxf+BPiE7bgOOLs5h93D6ofXsyf9MRcwzdO8xPvTdMG2uTjtvLnP?=
 =?us-ascii?Q?V9TwvqGV0YlRkm3fa8IzhxDLTo1lyJGe+vjNveD+92GcjxoPOQBe+zCmGeoM?=
 =?us-ascii?Q?p3XfhjBBdYytiEXQqMBmt04sZkObiyAChxfIKLsDvsnwhx4ejV5Cfh3rYc3G?=
 =?us-ascii?Q?GMoJIzBtLyu3W80=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:54:00.7182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6faac74-415a-4d75-b6e8-08dd6c2a9b6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366

Function avail_domheap_pages() is only invoked by get_outstanding_claims(),
so it could be inlined into its sole caller.
Move up avail_heap_pages() to avoid declaration before
get_outstanding_claims().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- let avail_domheap_pages() being inlined into its sole caller
- move up avail_heap_pages()
---
 xen/common/page_alloc.c | 51 ++++++++++++++++++-----------------------
 xen/include/xen/mm.h    |  1 -
 2 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index cc2ad4423a..5803a1ef4e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -488,6 +488,27 @@ static long total_avail_pages;
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
+static unsigned long avail_heap_pages(
+    unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
+{
+    unsigned int i, zone;
+    unsigned long free_pages = 0;
+
+    if ( zone_hi >= NR_ZONES )
+        zone_hi = NR_ZONES - 1;
+
+    for_each_online_node(i)
+    {
+        if ( !avail[i] )
+            continue;
+        for ( zone = zone_lo; zone <= zone_hi; zone++ )
+            if ( (node == -1) || (node == i) )
+                free_pages += avail[i][zone];
+    }
+
+    return free_pages;
+}
+
 unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
@@ -584,7 +605,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
     spin_lock(&heap_lock);
     *outstanding_pages = outstanding_claims;
-    *free_pages =  avail_domheap_pages();
+    *free_pages = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
     spin_unlock(&heap_lock);
 }
 
@@ -1964,27 +1985,6 @@ static void init_heap_pages(
     }
 }
 
-static unsigned long avail_heap_pages(
-    unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
-{
-    unsigned int i, zone;
-    unsigned long free_pages = 0;
-
-    if ( zone_hi >= NR_ZONES )
-        zone_hi = NR_ZONES - 1;
-
-    for_each_online_node(i)
-    {
-        if ( !avail[i] )
-            continue;
-        for ( zone = zone_lo; zone <= zone_hi; zone++ )
-            if ( (node == -1) || (node == i) )
-                free_pages += avail[i][zone];
-    }
-
-    return free_pages;
-}
-
 /*************************
  * COLORED SIDE-ALLOCATOR
  *
@@ -2795,13 +2795,6 @@ unsigned long avail_domheap_pages_region(
     return avail_heap_pages(zone_lo, zone_hi, node);
 }
 
-unsigned long avail_domheap_pages(void)
-{
-    return avail_heap_pages(MEMZONE_XEN + 1,
-                            NR_ZONES - 1,
-                            -1);
-}
-
 unsigned long avail_node_heap_pages(unsigned int nodeid)
 {
     return avail_heap_pages(MEMZONE_XEN, NR_ZONES -1, nodeid);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index ae1c48a615..eda57486cf 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -140,7 +140,6 @@ struct page_info *alloc_domheap_pages(
 void free_domheap_pages(struct page_info *pg, unsigned int order);
 unsigned long avail_domheap_pages_region(
     unsigned int node, unsigned int min_width, unsigned int max_width);
-unsigned long avail_domheap_pages(void);
 unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
-- 
2.34.1


