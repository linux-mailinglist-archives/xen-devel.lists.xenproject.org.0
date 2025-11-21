Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA0C789D4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168684.1494730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtY-0008DY-Bx; Fri, 21 Nov 2025 11:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168684.1494730; Fri, 21 Nov 2025 11:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtY-00088u-2w; Fri, 21 Nov 2025 11:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1168684;
 Fri, 21 Nov 2025 11:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrR-0007TB-Jh
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:29 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22727fbd-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:59:22 +0100 (CET)
Received: from CH0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:610:119::35)
 by DS0PR12MB6487.namprd12.prod.outlook.com (2603:10b6:8:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:59:15 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:119:cafe::a9) by CH0PR03CA0382.outlook.office365.com
 (2603:10b6:610:119::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:58:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:12 -0800
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
X-Inumbo-ID: 22727fbd-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiR7UdL87DpLLqjDIlj0eYeyBk4wbzXPqGAnRxMeWehqEzWcilEX5rQKEJyyYCa9qGh/HGhrJ+E203f1+tXRAAkBVuuvaiHO89179Qd2VrWSJFeHAuhlrZmzgnU3ygtFyR7MydDTX6vExyew4g5ukdaahZ3VqTCSQf2h93aTaokTOmcS6a6cNq7S6GfRXZrADwtZp9q6J1AzG5aqu2AfxiRjRvkpRZaQEckqdT8qOelvHp2caSyiRHJyjwZ6Sw6tLH/WMrhrKLtHSM0l358AMd9W4OeyS/7prAOUL8QJVYv3FJHm9SEr3ydSUm7VezEyO/uOLjWQMh2Tj83cv6WdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWivIiaybYPw5jJB/DQbmVNl+SgpVQga3F7RYOvVWbg=;
 b=sb9G+O9V90no3sYy/cmOTHbRJjmD75kcT3A5UEFPCCE7CeUe6x0Xarb8jeMLleo4ONmtwA5pPYZ6vg9MnTns/kz0zVZfbjTbA4zxxzCGJHvHaIcHHJjPckkgWP9ZSb1kxL5Rh8abGTTWbb90zPX4JYXb2CviLIxh+DfSCN73LmogJmelwv4ZsWh+Rs63oVuRzymi/jJWFSPey/9DtBt27tWqx+aDvx7vwkBoJozEU9pZ0zWSAmoAgMGwwvD4j7G0fJts+zxsbgImc7h6rbUAZL2es44fWHlZP6KgPDVAk3yTr0h2BetTR5xo1EuuJ4LeuK/R3jmbrVIE3aNorrsWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWivIiaybYPw5jJB/DQbmVNl+SgpVQga3F7RYOvVWbg=;
 b=M80YngrVB4ImGTAok0mmHXaBgyIAdIwZcZ8HBDOdGXUxz8xgby5z7Zb6+QkjVZvc2wSmC/jbE3fgDhd0ic45wP34dSdz/5zeDopWk6K3sXkxEyIyjzTo5q0PnZGhDb7sqShSqCwTXIEcdL/qTaoBNP7ccqMoODNlo27G9S481Kc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4 17/24] xen/domctl: wrap arch_{get,set}_paging_mempool_size() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:54 +0800
Message-ID: <20251121105801.1251262-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|DS0PR12MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: bd779b61-3f18-4f62-5b27-08de28ed02ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zao6KP4KfrJiFlJupVkHjspoYYLYKsvzMspS9MiqBrY+pKgd3nmNSzQptvif?=
 =?us-ascii?Q?D4YiEgSS2qefu8vdvTiA/dXf0TuIvAgD2iJdVkQ/1dAlSXoLgVqx/6IB5UpW?=
 =?us-ascii?Q?M9DDTbssbFK6xEh8UPdunsr0B9Ol4NwgP1sOs/XNNhYnV8Mp7g7cpyIkhbQy?=
 =?us-ascii?Q?Sz9s9u+xo/mKlbcpEfzgCf3tzIgCpRY9VJ+F3siVLPggep2sSApcpP/UR/bP?=
 =?us-ascii?Q?K9fJnA4dj3uVhrjfi2+x8mtugcfbpOGxQqWaGBT17CaiBLacse4IGWIC8Efa?=
 =?us-ascii?Q?qHgJvQJi60kVOkEVAer+ZZ/ukD5GDyOM3w2XvvehNtmX0LI8mjeBuGqSDDBu?=
 =?us-ascii?Q?vfAke2ea++3mL6A0LsTKkm9N0TeBMf4X+zw0AmwhDU04p5rFgHUTPOX4cywC?=
 =?us-ascii?Q?Ycx+Uyh3SNCuLrulTX0hHmQoZZkJrR3vpuNdb7JQ8gf2EpZRXUs1KJnrnq6l?=
 =?us-ascii?Q?sni8h2WuehcduljNzZDe5FOhR2xcMjKv0IXKPbL2WTeLdCGZUViFooRT/9m6?=
 =?us-ascii?Q?kW7C+hIaipHo8+8Gc/u+DRmPHOtQO9dUxyc52JtzqwiyCje88wQI7zV2bjFG?=
 =?us-ascii?Q?OuJKQw2HffDjhiFjYba5IRTyU+tvlN+Ror1Tux/RfNIAc+qSpdJqRUyFurCA?=
 =?us-ascii?Q?4+CLs5HhAI4MLlUrQaECxS/UQtcDI8XUAGgNuEBMtAC6Xz+RSlbBkqDjWwuI?=
 =?us-ascii?Q?8ptTb94Ne8J2CLR3rm3Oydfeub46Pb2m1nhP+ou52YJUEo/iu9qGZefWEbhA?=
 =?us-ascii?Q?dG8rfhQBbfu9UFsolfSFymyoMaWBw8fr51RP6pYjyIADf7X51O/yEnTNJwHT?=
 =?us-ascii?Q?84bx4AkDi9sEW69JM6M2IYLxSA2wS1h3jeM00Jgcy5S61LSvu+RMIowJ/MCE?=
 =?us-ascii?Q?zTuqotUp3PSeKqn08c5Kw2ots3S8yfxHYBGcwpUD8aZWuo7Zpg/Zf4K1kwcU?=
 =?us-ascii?Q?PYapL5Rsg5P1tNOKNmUIydVhMOUd/qmCJbUXGy4eaRgiemsdiv+pTKeKDcCz?=
 =?us-ascii?Q?fW94my4PJgaIkiu9H0zSlJ+PFGZYBZadxI4tD3EAI7I99pLi0GUQXIugM8iV?=
 =?us-ascii?Q?KsPclzpgh7N6I5DZq5JHABvDpm6Wqed8AJU0+CMoK2Shj/8xPiKO8VT/+/vd?=
 =?us-ascii?Q?oQROQEzMJ/Xv9aVoLSFQl8M7aaEzhKsZOly2gx84/u1d8uhqtFgd2jp9dJm2?=
 =?us-ascii?Q?W1z6Y6g7FE6X015bMK00ccNJcYYW73M+kiCwn/UQteOnHLeuk4zMlBBb6ZiK?=
 =?us-ascii?Q?JxrXpOzVeG79V499NqKlg94+MgXMZx4bjGr3Ap+PmamfL8uwmzsJ5vCXskQq?=
 =?us-ascii?Q?zuvB+fAnlTkezVvadmLK0vi/ysVSgeWcIt+KoWSazjBKEDy113yDxRXWRMNW?=
 =?us-ascii?Q?05tBD7A0dpRNlEem6rbqfO++yQXAYz1TyOA47FvQXzxiXW9sGpzn6V5jDGBz?=
 =?us-ascii?Q?WfRmP+nnSv2CeFLj9aNmsHC0LRc6ejB87kPVG78dFnEnws4WSOMr+u7qiMXv?=
 =?us-ascii?Q?HdwkMijfGNsGi+hs9lexCtxApCbHQQEL2dVS+Wa1bYwC1n+W+70jv+ebVyWb?=
 =?us-ascii?Q?cWM8rx+o9uvpBZPnbwc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:15.0156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd779b61-3f18-4f62-5b27-08de28ed02ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6487

Arch-specific arch_{get,set}_paging_mempool_size() is responsible for
XEN_DOMCTL_{get,set}_paging_mempool_size domctl-op, and shall be wrapped
with CONFIG_MGMT_HYPERCALLS. Otherwise it will become unreachable codes when
MGMT_HYPERCALLS=n, and hence violating Misra 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com> # x86
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_{get,set}_paging_mempool_size-case transiently
---
v2 -> v3
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around XEN_DOMCTL_{get,set}_paging_mempool_size-case
---
 xen/arch/arm/mmu/p2m.c   | 4 ++++
 xen/arch/x86/mm/paging.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 30d6071e91..4caa5844e4 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -58,12 +58,14 @@ static void p2m_free_page(struct domain *d, struct page_info *pg)
     }
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* Return the size of the pool, in bytes. */
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
 {
     *size = (uint64_t)ACCESS_ONCE(d->arch.paging.p2m_total_pages) << PAGE_SHIFT;
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Set the pool of pages to the required number of pages.
@@ -122,6 +124,7 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 {
     unsigned long pages = size >> PAGE_SHIFT;
@@ -140,6 +143,7 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int p2m_teardown_allocation(struct domain *d)
 {
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 116389d4e9..c6e3996093 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -949,6 +949,7 @@ int __init paging_set_allocation(struct domain *d, unsigned int pages,
 }
 #endif
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
 {
     unsigned long pages;
@@ -991,6 +992,7 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 
     return preempted ? -ERESTART : rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Local variables:
-- 
2.34.1


