Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B178B19358
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068440.1432545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMv-0007xW-9e; Sun, 03 Aug 2025 09:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068440.1432545; Sun, 03 Aug 2025 09:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMu-0007kw-J0; Sun, 03 Aug 2025 09:51:04 +0000
Received: by outflank-mailman (input) for mailman id 1068440;
 Sun, 03 Aug 2025 09:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVLC-0005hH-V3
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:49:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e6e233a-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:49:17 +0200 (CEST)
Received: from SJ0PR05CA0103.namprd05.prod.outlook.com (2603:10b6:a03:334::18)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Sun, 3 Aug
 2025 09:49:13 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::a1) by SJ0PR05CA0103.outlook.office365.com
 (2603:10b6:a03:334::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.9 via Frontend Transport; Sun, 3
 Aug 2025 09:49:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:49:12 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:49:01 -0500
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
X-Inumbo-ID: 1e6e233a-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNx/HqLu0Ch5wp486BoM5q7aFnCcAYma+ZcB+BXUgq8WSBIaegovLuVHdUDiw4T8Bfuu7eyLXaU1+CIOzxqSzIBXjS+eAtuBhtGBi271nDdjf3HpRDz0WigSofReUIpRcdI4yI3fcDAhiS0abuNUPiQXVXzWHX69pf7VCOd3/TUgUZUoalD+vYrL1QjAPi8oQgcMRprI2ywTgSShxoFAGoLLFKIObP7NXYWmI8I4Scguv0V+1UDO1EGshRNaFgjiqqW9dj6KfPdF/buuEAPZ9AF3crdvgv2/Pnc4bZ88JuyWuwwAkeCxFaYGPM5DzfMt2o0OOfm8S6rIOSOCj/0lZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8bVld26wdPkUEIzQ96R8Mizbjv7EQdlxJtjjv8jsMk=;
 b=pU2aszVw698ftKiXe1KqLCLvx1fja263HTnzn95Ee+lIThwxLV5LPYVTcgDP+yPdihshFwsTQ0wOi2LDnE9693wgqZP0ZAf44A39oqpOEN4Mg2FyVzF1qvBvXDOL4eDC6qd7h0jgvg5PYoKh7OwA/Bvr0Oe/vOsnyrcy3YMI6hZwuquy3TqzTk0q0cD3YSffHVp75EkQPczAZeV/J1lYuzS0OVR2znNutYWPP+wwHzUlsmRLBwVJAn285VvSz3XhhlhUESaVji/YOzPdI2FF78+zJOtw+3lret3FgsnXWkctfdfMkDnR4qrJecQg7lUmmAkc8DZidfqSlwEx2KeTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8bVld26wdPkUEIzQ96R8Mizbjv7EQdlxJtjjv8jsMk=;
 b=CzxL+Hyj1tuNC2w7ws3LTk0MU58q1iMnGGtjVmF7FbPmt8KrR6Rey2Gf9LX3rxidbhlA8IsFLETxhzSFv0IQY/fQ36uZNevI5n+VuyAhc6pW6z82+BE9yBElBI7sEmF4JCTYE0Em+bfoSDTHZ2LGvHxVXYS7EIt8pIvFUUOH6Ic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 22/25] xen/domctl: wrap around XEN_DOMCTL_{get,set}_paging_mempool_size
Date: Sun, 3 Aug 2025 17:47:35 +0800
Message-ID: <20250803094738.3625269-23-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|IA0PR12MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 798d91a7-c7bf-4e64-8798-08ddd273002a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+R+XYjgkL0AwIIt+o9yvN+Q41HMu/S/IfcAfiu6WguNEqB9+z3fSRMuvhfF7?=
 =?us-ascii?Q?RITE4r9KgfcZl8XOVXVb0+B0vXJtNiJfEGmQgVqcKUOQCI8yfScDX4DLs6m+?=
 =?us-ascii?Q?sKXLezNX99mk8yFjYuAzmh+5kJ0Tqxa6PYXXVlFBkKXk5P+Deo807xchlg4m?=
 =?us-ascii?Q?6GRjQ08YH27mShrubCn8StMq3EXxj3MS4AbQRZOWBvrA98jbgYO3J/u1pr4I?=
 =?us-ascii?Q?tw0oKu4g3nlEV/30+fvV1sN1KSqTv4tKPV67Pn8LI+FLHaQQaquPXhjGufMR?=
 =?us-ascii?Q?n2XLuh1SKhSnUY4mZleqAQ6NV5uBG9fqwx5cwySw+wlSxsxvC/28zyze/DNt?=
 =?us-ascii?Q?J4rGmQZCMHZIHjDOjvH5Ln0rek3jyec9WIhj4nh5J+do8E4AhsrOng3/6JNb?=
 =?us-ascii?Q?2D3aaK0Wz/tax5elwZRm/BOWfIiA5n8VWT+8N/qdw+OA7QtdTTjPop1TawyI?=
 =?us-ascii?Q?h7S1Eisp1njA3wkYhQABJQ1qyqWvxUtGnh4vVxo5p9waNtda2BEYWLOhVZ5A?=
 =?us-ascii?Q?94K61zuoXAKk5u6k69o4nIlZsg/7fizghJ/sYRkGQAg+8Djx2XCJa8wPoTMm?=
 =?us-ascii?Q?83eRICzB9zR6Eca+/wqMaGgp57JagF/eDy2M0awkQWXx48QwU2joGzHcMWO3?=
 =?us-ascii?Q?nFVDHJyCDZdliaZ8Ff6yaJlzvxJq6VxsF9x79NXuezLh8lAfwBSG8G0QDHdl?=
 =?us-ascii?Q?DnmTwdkXGufEbPiTVrlEOMFEoIFS+aMZqUwuOOkmicdUB3GbdqQ0ir3reapk?=
 =?us-ascii?Q?YAroL2Sr1qzRneIMElDTL5krxd/4usOUCif7aIF6FlGPMGafT1X4AdzrkDbT?=
 =?us-ascii?Q?J4IqRD4Np2AXcRNNnykZP2dtTVr8wEJl42rkSqdawwH5jgG/jWIA39ThSvJ2?=
 =?us-ascii?Q?bg836PhdPpbj/23KSl0Ioungzlwlsu83meB5ogLdox4xppbCR07Fou+N7kqT?=
 =?us-ascii?Q?9tV6rn6/XSAick/rY8UL5zbiOaz5a9pJTp9vNJRoAkRpMeS+pVhzT8w6/lFP?=
 =?us-ascii?Q?mybyP/ru1zqGXdXy0DD+BgHL0oY5ydfsRBY7lrh7lEmnyFakkadTsAdn01JI?=
 =?us-ascii?Q?dkH5n1S7jH1hBhmVVse5iWcxjwIQCWHBWtx5cAhkwWgcp0AvX5giocTK3fmh?=
 =?us-ascii?Q?VVicFcf28juKBFk4IfxtUwhGuGVomazkFS37QtjWjAI16O9yehPzO9qn2ERq?=
 =?us-ascii?Q?ZW3H+E1tc/znnxxjBXCsRf3eSpY5pBl48VuXQC5Fb0S++0SlRwnDMKg3aFHr?=
 =?us-ascii?Q?m65NFEgvorcW3YtgF3ajIXBSufCydA34eO1f2JhTjUZ62uAgwwnssTYqkBHi?=
 =?us-ascii?Q?r7QO38hfHFVHWvBSmdRtHzJ0gUlka4GuA3qx/JZ1Ni0SbOmhGoP915xDBtaf?=
 =?us-ascii?Q?BCR9nDeL5EQSNaPaSFv5sMo9ZYLcCMHhKFL5OQb9SM3gRp3KDKlrat2/WKBy?=
 =?us-ascii?Q?Wq61jnO7liOiO+2IbLg4+aMX0svPt7cFOUpCW08hCUK/V5lY9K2mbldx0f3U?=
 =?us-ascii?Q?HsS3NXjY/IHkutAL4K776lMRhArJFJkl17qH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:49:12.0966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798d91a7-c7bf-4e64-8798-08ddd273002a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749

Arch-specific arch_{get,set}_paging_mempool_size() is responsible for
XEN_DOMCTL_{get,set}_paging_mempool_size domctl-op, and shall be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/mmu/p2m.c   | 4 ++++
 xen/arch/x86/mm/paging.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 4b13867fa2..878ce205e2 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -58,12 +58,14 @@ static void p2m_free_page(struct domain *d, struct page_info *pg)
     }
 }
 
+#ifdef CONFIG_DOMCTL
 /* Return the size of the pool, in bytes. */
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
 {
     *size = (uint64_t)ACCESS_ONCE(d->arch.paging.p2m_total_pages) << PAGE_SHIFT;
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Set the pool of pages to the required number of pages.
@@ -122,6 +124,7 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 {
     unsigned long pages = size >> PAGE_SHIFT;
@@ -140,6 +143,7 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 int p2m_teardown_allocation(struct domain *d)
 {
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 3da99ad371..e6eff60df1 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -955,6 +955,7 @@ int __init paging_set_allocation(struct domain *d, unsigned int pages,
 }
 #endif
 
+#ifdef CONFIG_DOMCTL
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
 {
     unsigned long pages;
@@ -997,6 +998,7 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 
     return preempted ? -ERESTART : rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
-- 
2.34.1


