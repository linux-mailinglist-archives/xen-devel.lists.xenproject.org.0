Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375FB50FE6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117752.1463868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXE-0000UI-UT; Wed, 10 Sep 2025 07:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117752.1463868; Wed, 10 Sep 2025 07:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXE-0000PA-Na; Wed, 10 Sep 2025 07:46:32 +0000
Received: by outflank-mailman (input) for mailman id 1117752;
 Wed, 10 Sep 2025 07:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFR9-0005yo-5r
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:40:15 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2418::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5db3a281-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:40:04 +0200 (CEST)
Received: from BYAPR11CA0084.namprd11.prod.outlook.com (2603:10b6:a03:f4::25)
 by CY3PR12MB9701.namprd12.prod.outlook.com (2603:10b6:930:103::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:40:00 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::2f) by BYAPR11CA0084.outlook.office365.com
 (2603:10b6:a03:f4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:40:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:59 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:56 -0700
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
X-Inumbo-ID: 5db3a281-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jgu+ly3WHhWEfO+7cVsxDUP9ug7MuTnD5JAOQwCLKpWRStQM9BTfG9IEzgFFsF95krzso2z2OF2/zRKnqxgLoMz1Fdxn3S/6flwObMwnsX2YLJckCpAyOPFd5NiNEQ7D7KhsVmZHwzd2ntLoA0TVlJF//2sR4o0nS+kYznoZLMLbEVawcEMuAT0WcBpm01iMZmvw4IkHKDR4G7C8oX1g8b0ZhYMoxHmf0uaiBpgZdX+OLv+uDGQSWbTlec0K+Mek0Ps6Q7jTkCj6Fvd0ncBHAciM1eBLiI7HrXozmK0WDr6rnfCBTPhsVQPCJjTskKfbzp9ryBrifES4eJwPoOrseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0emPBHP6D/uzkCR8knCpz7UD/iYNoUnbmeDyfDnSzM=;
 b=WkTZc73o5HiOSi/vtdpfiAEuzxgf+k2QKAVWHt1btHbYhrHm2zoyRlCprretj51umAI3jzSbOsSyryrbXaziK+03r7twyfW8V3YfRSH0TKfvfczmwyyoFm07Fl43nZ6QI0WQHs/Su9pvcQudfTLix7QdrhyHN7wjnMhBqC80sgqaYLfI9mnMRDn0+NvAJqyJPDGV8s8WJrPboHet7I5g3HDE3NzMH0bcIGRhgj8DPZWRbAt7cVN6HVGLOU9OSwHu5uDRu2oVvRviT5iCBc8RiL3gnsQoXLo3m3GJta6o8JepHzjKu1PaRu4aKy+e0qbwoxOO7+RwewZHIi2CQIEBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0emPBHP6D/uzkCR8knCpz7UD/iYNoUnbmeDyfDnSzM=;
 b=cwJPvFlkMxumyY+YgRNaUVD3kRI2D2jA1gWyIsRhI3SdWjiW6NsRY8frLwypXgABEeUNDmSvtBghUSsEonnT9pOQ6//Oe2tUtp7alJ078oaaAAITfgdUFYzu9KEbQiRiuAZCmXyMUrE4dCxYq75EWEevzqw4EJlN/rEHDIVJaC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 22/26] xen/domctl: wrap arch_{get,set}_paging_mempool_size() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:23 +0800
Message-ID: <20250910073827.3622177-23-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|CY3PR12MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 88974cb0-b7be-48c3-1a99-08ddf03d3f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AoJEheD0KJ92csIToANpgaQcgwi1piMbvsblZZoQSH74qS4ObPRrDEkUTqZM?=
 =?us-ascii?Q?JHmu1y8WS3XbAgyYS4ONhnAVghMzs6X3Va9jJUskyLuvKyLIleSsDjxagxcH?=
 =?us-ascii?Q?ldgQd75begAZ/oBoOWnQHEvhk7Gsb6gEcoglnFu3qj5d+/0DOP7vTmhL+fn4?=
 =?us-ascii?Q?wWKYZd0kpaSShqPyN3BHTM+aQYrUEwTvPxTGXKjzePfYsBoLY0Pq/SsXhTxC?=
 =?us-ascii?Q?ITJZL+lpK7rLK07pwMgOVHNfS7lJZY3nJL8jOsze7W1yImw182fZ2w841f/P?=
 =?us-ascii?Q?GZLiCeDJt9x77+HRqZ17Z4af57c3aC5pegWHHoTmagBPhulwd8v7c266cyGy?=
 =?us-ascii?Q?69K3vSDtPgYwPFGM+zaIq5/RvywEcy1Qa+ajadGSUuDRb2Ky9f9cgO7meFws?=
 =?us-ascii?Q?XqvfuHArqOoh+YJ11jnMivQ7g1oLCymcyKyajwZqFsgQneX1y7VPpNyWikEu?=
 =?us-ascii?Q?kxtRKGbZnUtsqeuLu2NFaFVIX0iDs1vin0gUvmj7IpDyBS8LHu6kO7bKS1xf?=
 =?us-ascii?Q?LSbZqIWkpSXwfQ+bju9JSCAZPSFEaTFcsqsB8zl0Au+pMgiU8p8Hq88f8S9H?=
 =?us-ascii?Q?0Q0Ux6rMjJnGFEk+SBhpWjQl1Xilks1v5LhG4ufmwrp1plcOqogedtt4vvvK?=
 =?us-ascii?Q?krzPxhqzf5+L6QiFUsKtVwuEbPeYPzJA/DCO9FlCWk1YaatcnmDpM4Wg8VyU?=
 =?us-ascii?Q?KxQhu2ODJc/bR5LoGGOswIOaWhKMlq/XEaJxvvIb0qgLW3SQ0Ni4rakEIgVI?=
 =?us-ascii?Q?jlXeXQiMbt8y9piltWpJGliLlOeMR75/LPSTfUAN6zU++axPfURUKhZGueXO?=
 =?us-ascii?Q?4RQuSdNzAPHQJvP+DXx3aW229oWIzmuj/E6Ms95nk3UsGGCO092oFt25Hut6?=
 =?us-ascii?Q?3XLoZbFOvPhaPky34YveQ3jLmxjf/CxXj2wW191Ru8pHmUUp6DHKQlHDnsKh?=
 =?us-ascii?Q?CcPQlIobny7pNoklWjjcwEnB9z1w08KzE7F1Q8/DID6kVuqRi1rDpYpArp9h?=
 =?us-ascii?Q?PoD5wjmjC8rJ+kpuZllBx9kz+fdaohgggH1HWPgp2/20qOLlCg6zaDDyLHnw?=
 =?us-ascii?Q?dZ3/+Ox7tKku8nApTVs2uLCsqGdJyCS0A0C6bm/IxoD1XHaiavFWSz+q7S0O?=
 =?us-ascii?Q?UlkjlYfKTTrCC0cqD1C2rGhi+F2iyInFZ/tEnmj43d/6vWK7H70rWvnHnPJ7?=
 =?us-ascii?Q?NtBC1xmFsy+PHhY8atebWbfNy0MLMpt4HUkcLGJNAwLRScTCMNyEUQDlzwpQ?=
 =?us-ascii?Q?Ss+NtebgDKBHpLIM0uJdPAoDHIrDRfb5KCLTX7abAOGUakl+XBJbE9cyTDYF?=
 =?us-ascii?Q?IG6ZqzEyJIzftFJ1mAH1Qna01wUlI/tTHEqfpZU8rEbhRNmvxu3irPGrNk0O?=
 =?us-ascii?Q?Asmosg6n0brihE3hz7fxRlY+4OJ4RHmr4QuytZi3SXoGHyYSbj/gl14Y1UZV?=
 =?us-ascii?Q?snLRPolH8bJccLCfVRJAD9Cxpx5ePXND1dZw81F1RL+gt3Bz+nkuNHWlW7oW?=
 =?us-ascii?Q?M46CnjzHAwp4WJw3rbpDQfVSHyMKffFETyQq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:59.9070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88974cb0-b7be-48c3-1a99-08ddf03d3f28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9701

Arch-specific arch_{get,set}_paging_mempool_size() is responsible for
XEN_DOMCTL_{get,set}_paging_mempool_size domctl-op, and shall be wrapped
with CONFIG_MGMT_HYPERCALLS
Wrap XEN_DOMCTL_{get,set}_paging_mempool_size-case transiently with
CONFIG_MGMT_HYPERCALLS, and it will be removed when introducing
CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_{get,set}_paging_mempool_size-case transiently
---
 xen/arch/arm/mmu/p2m.c   | 4 ++++
 xen/arch/x86/mm/paging.c | 2 ++
 xen/common/domctl.c      | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

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
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index d36885aeea..c87c28cea2 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -847,7 +847,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     case XEN_DOMCTL_get_device_group:
         ret = iommu_do_domctl(op, d, u_domctl);
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_get_paging_mempool_size:
         ret = arch_get_paging_mempool_size(d, &op->u.paging_mempool.size);
@@ -862,6 +861,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_set_llc_colors:
         if ( op->u.set_llc_colors.pad )
-- 
2.34.1


