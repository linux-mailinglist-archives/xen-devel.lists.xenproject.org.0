Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460AAC6585
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999058.1379769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv1-0001EE-OK; Wed, 28 May 2025 09:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999058.1379769; Wed, 28 May 2025 09:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv1-0001CC-Jc; Wed, 28 May 2025 09:17:51 +0000
Received: by outflank-mailman (input) for mailman id 999058;
 Wed, 28 May 2025 09:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCv0-0000yL-9S
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:17:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2418::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f7c8793-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:17:49 +0200 (CEST)
Received: from SN4PR0501CA0113.namprd05.prod.outlook.com
 (2603:10b6:803:42::30) by CY1PR12MB9700.namprd12.prod.outlook.com
 (2603:10b6:930:108::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 09:17:46 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:803:42:cafe::92) by SN4PR0501CA0113.outlook.office365.com
 (2603:10b6:803:42::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Wed,
 28 May 2025 09:17:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:17:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:43 -0500
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
X-Inumbo-ID: 9f7c8793-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xa4WyhsDYigSBWc43dWjwF+tfVdvQhmxB7TP16qn6/NXh/edWcpBYP9Two97KfEEVzf9Vdd0S4HuSqrxbFzvOB3W+D4mRHzudWwaDX5CZCGE2Gv6uz0rldlPhln0VRPEJZ+Wmzb3+4KpGIZo8loDYehqOXsKZkx2KFzFctA8UIj0feI92t5KGTWsAM6X8H8BIYLLGtkZCfnH2V9jO10iKXQ/KmHcwwsX7uXIHWE7ckyuaSVg9SAmDNCb3ys5d+EnsA7I2hQFtrxhKYehkn1CWTZ/8fLiw4ElWYG5/tk5/idr4RBIbmDiouWF+9OYwkr+if9MCJda7oG2w1UieXzDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GfDRm9JhuMPhiHwATAYzNDZZibb4ZAY1VdgVn0JUz8=;
 b=kMyJEdVYQZyYlTmiEx1g1uqD5MGXhSDga7jVV9SfchVEXB+iZF8zRijNR5eAUjeQeKVUX76+JNLdKXxVP4/+ncVXLqRAt0O0Hkme86Ck4AcRcsFpvc57mrWNX+Eo4jmZy11Sp3KqTRb6aUh2ViN7SfhKCNM+p/YWPxgg0jGXJ86v5c/sbZqUOzD+38AW0ungPSK20OoHVHG6X80Vsyjkpkaaiuq1cQbkr061XCGX1uG8ibL0OANOQuuAZ3XdDvfXWUAQuMpUkFhwkcI6MK2lGsNID2BV24YYYH8Otd7CICYkbgyIpAnvp7ph6DXkykhlBL20qmGP26RFwD70wE/oZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GfDRm9JhuMPhiHwATAYzNDZZibb4ZAY1VdgVn0JUz8=;
 b=NXGgtCc9eS48V3rPYpVVKp3uhizozXIWQLNuE1VtUzGXQBpJeKdC8GHrVj9JCo18Tpq6bmBx5Kimg1yKZT8etHpHe1KbNSMDlUr4gVbcmfG+A6VmlW1wMAIMsJlyMkUWBmhiXiR6cs2KzpGJGgfmVSw6AI/9Fm9TOhgOu9YsoQ0=
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
Subject: [PATCH v4 02/20] xen: make avail_domheap_pages() inlined into get_outstanding_claims()
Date: Wed, 28 May 2025 17:16:50 +0800
Message-ID: <20250528091708.390767-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CY1PR12MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d71637-5c8f-4e40-1214-08dd9dc8824a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vonb12ej2Fs1zx9gJIj0+5j1J8VgLT/WcogGN8yvGteMatyScBJPT7ppeJD6?=
 =?us-ascii?Q?DL7HH8yYCGB5BFvZSTOee6IbGNjllSd2JLFy5LRKqvfUHQdJ1KK0kv3U3ogW?=
 =?us-ascii?Q?lMCwZek4U2u+X1Zg53bbQXoNmwu95UaPNivV6k78HdnbPLr/n7IftoJxyLqK?=
 =?us-ascii?Q?KfNeDq4+dNCBpmWiUaVK+BjBoPY9kG4TFm7DR8YmESbeaP1PB4TetF4jeyTE?=
 =?us-ascii?Q?4d2epXEwb/rTDfPsfnkRDawgm8AQLSe/r8tFyYTNbErfrBgg3gv9WKiHdelJ?=
 =?us-ascii?Q?VWK0+0HaJue2R5tk1mChBMPR0SOyd6tBM1QEQqjF5hJt8/jjexbtyhgSRFJP?=
 =?us-ascii?Q?2735X0h1qctK2OB+YTG74psC0yeZfC+qkkGGiPC0wfI/zKycBGjnUK/hra2R?=
 =?us-ascii?Q?1oX3xbIUrh+QqvboopPQ/iB0G7RfyxEQyco8vBXgdrxJxwnswC8iSRFqHnB0?=
 =?us-ascii?Q?TuyhLhjb40WqIM9oJsiQf+cJH6G0KmS/is0OpFw/i983z+BmwVn7HouzqJRS?=
 =?us-ascii?Q?1/6L/6D60fJuAtOd5wD4HEUe46gULTh5A26HUQLoUZAkLC0KbJ/rP12BDiQ4?=
 =?us-ascii?Q?ZuP0p0na+fg7pkYMPFgkZsHLSeihC4UTvRoDgn718eZ1vlsz9Y3fUFUpCQoy?=
 =?us-ascii?Q?pFA96ZKYSMRQVyJtCNGFAbNpQSoCDLz5nosiZvJ2yMaP909nD+YIIjuaa4mE?=
 =?us-ascii?Q?cf+vCMPFeKn+S7+GoDaG686Y0qfe/bQaebyF7kjo4V4HjUkWSiONZ9Sra2YP?=
 =?us-ascii?Q?sLlP9FZS1wbVk97CXrV4BlvmONIlvUH2+RoVLq7I/tVRvC+aMKT1exRt9t9k?=
 =?us-ascii?Q?MKtoRimpky/SEv+BgvRZ2jWq8yo/16G/oWOw+rCLIKqWW5pi0869bgh/PEs9?=
 =?us-ascii?Q?pLfsa+TooSwR4MNgZl/ZaiUEo57wQT7YCOaFnUbbFSSQbAt3Kfgd5ak/18hV?=
 =?us-ascii?Q?CnwX1x281xzKNTcUWQ3PqQ/O5RIcVN4Sxb0JYHq5ZHilU0AW9RnXM6sJjIxm?=
 =?us-ascii?Q?AkIO3Jk4CqvcdEsnxB/9qGT4RgpWs43gByKn/zWYIxpbaoFypvDpKfYeycHy?=
 =?us-ascii?Q?NiJmnanaFxLJc0i6tFVMtIW3euesFtuoEkePoGYYKrmRvPDQBlE/ajo/5Irv?=
 =?us-ascii?Q?cvTuWr7CDh9V6AV9aesJ7B8JJTJDO36FFsatRVTI3LhMzZavr/szG48ia1P7?=
 =?us-ascii?Q?01HRIt47zPXgCP+Db8Bsx2l3OZOwe1asxrLyjFZz4iyr1cp8/hnh2u+cK5fd?=
 =?us-ascii?Q?pOtJNb3iyLlhj+XYjDCMf0fbpVHLBjihkpExRp/f/ooUNtn1T/ep7yazKvUi?=
 =?us-ascii?Q?SU96wvpssKEAb/Oqce3UAf0apO9yc2YWK2l2J3K+/q9EyOayHND7SB2+h9sm?=
 =?us-ascii?Q?GFjgGrsCHg3DkyK9cWjIIMTdc3BzsCqHq1+wJbZeK1ZaT+uy0whlGOyl9INB?=
 =?us-ascii?Q?CX+ngVQUg8o0jyvKp2EhHa7lY9WcwF7ceXqynPkdZkAkkqoLSs4kWzgOqk7r?=
 =?us-ascii?Q?szkIaTeTBBcuuKpnF9PyPr4b9eaF+DofX+rP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:17:46.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d71637-5c8f-4e40-1214-08dd9dc8824a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9700

Function avail_domheap_pages() is only invoked by get_outstanding_claims(),
so it could be inlined into get_outstanding_claims().
Move up avail_heap_pages() to avoid declaration before
get_outstanding_claims().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- let avail_domheap_pages() being inlined into its sole caller
- move up avail_heap_pages()
---
v2 -> v3:
- change the title
---
v4 -> v5:
- move ahead and could go in right away
---
 xen/common/page_alloc.c | 51 ++++++++++++++++++-----------------------
 xen/include/xen/mm.h    |  1 -
 2 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e57a287133..b204f22f50 100644
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
 
@@ -1962,27 +1983,6 @@ static void init_heap_pages(
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
@@ -2796,13 +2796,6 @@ unsigned long avail_domheap_pages_region(
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
index e89942b87d..93c037d618 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -141,7 +141,6 @@ struct page_info *alloc_domheap_pages(
 void free_domheap_pages(struct page_info *pg, unsigned int order);
 unsigned long avail_domheap_pages_region(
     unsigned int node, unsigned int min_width, unsigned int max_width);
-unsigned long avail_domheap_pages(void);
 unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
-- 
2.34.1


