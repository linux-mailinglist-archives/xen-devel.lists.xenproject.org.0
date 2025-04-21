Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B70A94D62
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961083.1352726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lm3-0007fO-CY; Mon, 21 Apr 2025 07:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961083.1352726; Mon, 21 Apr 2025 07:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lm3-0007dw-8D; Mon, 21 Apr 2025 07:41:03 +0000
Received: by outflank-mailman (input) for mailman id 961083;
 Mon, 21 Apr 2025 07:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljj-0007m8-9w
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:39 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:2409::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a07c03a9-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:33 +0200 (CEST)
Received: from BN9PR03CA0141.namprd03.prod.outlook.com (2603:10b6:408:fe::26)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 07:38:28 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::15) by BN9PR03CA0141.outlook.office365.com
 (2603:10b6:408:fe::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 07:38:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:25 -0500
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
X-Inumbo-ID: a07c03a9-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUbo6u+FIwHzf1fmZKEeuk9TC0qH5f3Ra8KodSo0CB5aO4uNuQqjIwc0U+K6pqjDPeyXNLwKWjlavSaiKSQTyAEmaS+kc9FTi2kwzONigdhOVoHG2F7c8dx3m5TTlgBT16pAznUIYKx3I2fZBBsx2OJdycxfeZbp1ok4IPkYXspsZOXmBc6Fw+z/roDUeeWer8O6h9FfDUPgfJs/hsR2/rqVaza0yEmbHgoNEVMT4F0cb4OFjlTf4vCMtdNo1ZW5PrCBGcx9pOC4qx8Sqw3RjuQlIcgutDLNYMS4doE5yNAb+iLY0KqD7jVsODHpESH0GixIB1EfU5NCs3f4eQqqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi7bdSdzath5gvgfDScXOao5+42ReAsl+Gpt0fVjHoY=;
 b=h4+hGMVpyZk8xDBAR3urPb9nG147STPtR5J+nXsBrXG6seqpwIeKqqDlFOk7YOvLOaY458SheAoEBhiVPm9MeQIS9LhbZrBoNSTKRDfge7jVMieSQSyPsa+h4ORd8SOG9J9vezHlmzXw0sdMaFZTOodAv35ysBdfSXr8cbf9b0gWyKjVFBgAow9ANgN/YM2nndHbXo/PLxFmUvJGL+RqZJWE8NNXds3niioBzjFjHw+SlzuTc6BPA+uUk8dRm9ZGmwAqaUbYZIoKiV7JPBCwwet/eSydLVIvc3V4EOmIZtJ+mjqp+/kNGPit5ttByumwjEC0MYBA+OVs+ZUD9EIelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi7bdSdzath5gvgfDScXOao5+42ReAsl+Gpt0fVjHoY=;
 b=K0sRYlfoKqyS+eJx8veycCDifXGKWX+v7JhqoBX5/0vgyenK1OvZhi+eFUx6Rl178AMjRopaKaIdMdENB/8NwVc1skpvI/YHYjB6k+d95O4oqFRNZ1+oR4vjENrXWcOseimI2CdWUPH9E2XPsEONgXB6I3J4DU2rY/2hijhQskU=
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
Subject: [PATCH v3 15/20] xen: make avail_domheap_pages() inlined into get_outstanding_claims()
Date: Mon, 21 Apr 2025 15:37:18 +0800
Message-ID: <20250421073723.3863060-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: f26f0a91-aa86-4e08-328b-08dd80a781e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aB0toL5ruTQZj+HAnbvNsF6ngbvBobZemtdMUtvNbPD12Kwp267xfOA6SXt9?=
 =?us-ascii?Q?nA/x0DmljTBusUoWTtTIWjH9CR7Y+eLiahg6R7KPkRso73OocOBUQ5cjMWnJ?=
 =?us-ascii?Q?wf1QhFgcjjACC2xnrr5fU1VqXxkGp5xr1G85U+DnVM7pQ4VKeVNImBPgfC6+?=
 =?us-ascii?Q?YPkR0klXwJhdzcwSba6Iti339QvQbh2mUW/f7JeWMFghZqip02pMGLDjIvh8?=
 =?us-ascii?Q?BHNVWooZQXNcnZV76PEt0eyKa7BSgC2nygzw8WpCzcfURhKoTFwdZ2yvD7KX?=
 =?us-ascii?Q?CFdpJ3dWf0ZSm/sCyJUNNuVGavdbQ0CXm9yW8W/cI7Ri4YFVf0/ydMUNI/nz?=
 =?us-ascii?Q?2I3uKOj6wDIrICE6H9ESEB1dYFKDtVECI/GvXKVBS0pZDh5uBEKLsBCctzth?=
 =?us-ascii?Q?cREAqwGYjI3OPgwfkH3+8rDrBH5he3v3kxWMnbLh62rbR6g3WV4ydYGHCDvZ?=
 =?us-ascii?Q?frEyNvhcvXaUSEMt4Bs7V1Qo2Ngi67RL/RnZ/CG2h/Go0WFsW0G6fH2xKKQm?=
 =?us-ascii?Q?K3ANYhxCqIX3hHFRzE1f1qhEPDZeCVZTyWg2ENNzpwVlRvty+TUIjU8UraOS?=
 =?us-ascii?Q?t7tDvqpKBhryghr9vAxGwKKCvEMqnQUPY4vNGrjcglxEg0ltz0PkTCKfTIq7?=
 =?us-ascii?Q?StsoXodaThjUjMWiuKyqh4aUeHs27JWc43J6LKwpUiGWZc5sQ5mdJPEPVz+Q?=
 =?us-ascii?Q?GaAoGZjv6DQXN/iq647aFwXtt5KD7qlDdWpW0h89IAeSr2EQYHPZtRfgBG5L?=
 =?us-ascii?Q?rtevq5k2qUkeuY8Wh6/lFoCx/TBsljtQB6EiWWPHiQfKG1//Eid6DNmUiFZ+?=
 =?us-ascii?Q?AyQZRdwJe6PuauYyLYcNydidNCYHw1hbF1ry5h2r9FtvGggb2hPIcn5pGbUd?=
 =?us-ascii?Q?XMaFQkeW4GymEiVNOUgFOEWD3eUc/z/qj8bAOT+56NRH+hnDwLRu+0Zpb1F/?=
 =?us-ascii?Q?QTHWtSfV84B8JkkR8tj1qSRjECFwTAUM6BeAjEyyAacX4KHPCSDhEnw/izkC?=
 =?us-ascii?Q?UY4EsYfWeUJnzdGKFJ6riWUkaiiwmFbR7vQBIRlQ/7AwWpp6C+U0+3NiBw2W?=
 =?us-ascii?Q?fQ3mXZaFDXWMraE61z2mxOx8OJFT1TqEQzH4qU8sWZjxUy26ypf1xo2kxMJX?=
 =?us-ascii?Q?KQyFJ9szrikn2mLpq63nAvrdBV/RNRP7DjcIrbv016Zi5y7yf+29Y2+hVDk3?=
 =?us-ascii?Q?baOHbIgpP9+vbOflq1b6mIjJCMvPtQEQCYTqevhnYBfIJ/o2rITdD2eIpINr?=
 =?us-ascii?Q?ry11GMsA11NVdUskQIZN9+38wnGo3KbFX4Jk9h6/VC22vsY2up8+yTn2MWmE?=
 =?us-ascii?Q?ctQCy2JVV2i0D2eUjqD7pGjTpiBoWWbmEc70WQA67YdcZis2AWBsLBwhuHL6?=
 =?us-ascii?Q?0X1ZapluP1BzZYgeBlnlZoIeRA1LtH6vcMb0vnlR4Bs0Apf3Y3DMtbXOR2mC?=
 =?us-ascii?Q?NErLu7VtrDwUwDPqQK+RaEdx3izHCzLz7TYQe6jvMfvLZ3GTLvo8HnaTul9L?=
 =?us-ascii?Q?WXk50wHgq8Jtu0/SDa5HXTV2UdRuUC8/Dgdc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:28.3369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f26f0a91-aa86-4e08-328b-08dd80a781e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083

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


