Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC01FBD28DF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141976.1476187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlF-0002gs-AR; Mon, 13 Oct 2025 10:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141976.1476187; Mon, 13 Oct 2025 10:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlF-0002eL-7L; Mon, 13 Oct 2025 10:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1141976;
 Mon, 13 Oct 2025 10:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcZ-0004Hi-QD
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:39 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d81ceb48-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:17:39 +0200 (CEST)
Received: from MN2PR02CA0007.namprd02.prod.outlook.com (2603:10b6:208:fc::20)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:34 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:fc:cafe::9a) by MN2PR02CA0007.outlook.office365.com
 (2603:10b6:208:fc::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 10:17:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:34 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:31 -0700
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
X-Inumbo-ID: d81ceb48-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qra4PECF7J1kRffALwPY6Q9aWiBOX80Y71UIIKG4ENz44hApS4L1u8xngIGvKSBLx3TlDP7/CFtStdDhZuQHMbY2Jfz0SdtRY1EeRS0hfVvLfrSGK0ZlGrl86IRUAZcAOzbxNbpGC5CperrxJhvA//OPtXseOr05oYY0+emTcBoX17MamcU7egqJ1NTpGPZcCy/U70ope7j1CwUfo5E/sOM6kZK2WfkBP/Elkm6ks4Z6eVIes9OnlWx91wUJKUKgPAEmnGJMwQEI/hsmJEsz7gC4HpadZiXXQQ2xxd8kUkC6WG1IJoifEGfHMVjUk6eazrN7/fxKxjqtFofAYY8Qcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWivIiaybYPw5jJB/DQbmVNl+SgpVQga3F7RYOvVWbg=;
 b=DunSHR+38ht+SXgBXQju8Pr4t2AiE2Zf7SRKWsEbuS/eZQFtNrZfWi8olCFppD4vs0I4FqeicbiOmfUGdUY/Kj1KMEGi9Rf5or4t96U0HY2/BbDvMtFbJP57Vh5kL6vuF30SjfcOIDonDA41GdCJgDqFu/nG6a5yP6A+KStoRqmHQOuZifmydPlj8HLNGC1orKUQJJCS6rvxWoJY7gmgkduSlWa5xbcLIfzQRviWGtLk7D0M/YpW4XjJNcrQVZjMn2xSAOUqGq0WXpOgpejFyl7xtZmhBI2jeFB1MOZEj3hNlLctKIYJKYIAhcI6SD6Jwg7++GrE6UW5D2PwrrGcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWivIiaybYPw5jJB/DQbmVNl+SgpVQga3F7RYOvVWbg=;
 b=E8ZF0u3v/P7OzEfQC7omgLN3QhFg9MQ8hH7xQvzGLhH4R1r4hEWcTU9oeeQCg8AM0HtmZkpDtpW5rLTqpIwSvq3nS15PrV3x8VAm/FUGXeatSdzN2sC2+lZ/RYP3h0NzWrxA3bYE+iCPV0LGEV4+r48Jr4rq301HRb+HOn0whz4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 23/28] xen/domctl: wrap arch_{get,set}_paging_mempool_size() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:35 +0800
Message-ID: <20251013101540.3502842-24-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|CH3PR12MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 15caf971-32d5-4834-2b5a-08de0a41ba28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zh79Puv5Y7mqZUKanV+yxNIIqLQ076u3YgTP1VFZP0/NMsjkzf8HkQFs3J95?=
 =?us-ascii?Q?idZRT2Rx5ooJ6sMxWDfdyz9NMsg5dHzlMH1lui3+Y7RqKJ+wnQuhVTgntbd+?=
 =?us-ascii?Q?WGEUmKwKMEHjPpjoIg2vvGKt2ar1F9Ug8r6ap2u+sWSqMCrr09VbH98Z0XF+?=
 =?us-ascii?Q?MPkhgd6/mmaOttyGesHJ+60QD2jTGbSOun8ztKwZupP64vPNyI1aVeaE7Peu?=
 =?us-ascii?Q?KFc3kGJV3bnYa/LEA1bS/WoeEgRvhHI0GLpAII8swaV87ygj5qVyZ/hlwwx0?=
 =?us-ascii?Q?Wm1h9WrPIU3LL6qS5l9czrzjfB0UDQatrMkc9A/g7ogE1AOHxsewBKG/sw72?=
 =?us-ascii?Q?kL72xRDoxLutgrQQlYZA8D1SmjTc87Q2bPpd2vZzQrb++DrDP+JVY86OGHsM?=
 =?us-ascii?Q?vBN3zruM0AAtDvzrlEcjeM7oAfbI+VX2Fqvw6CEC5rrwDPq7FndXyG+Dw867?=
 =?us-ascii?Q?6O6udQWeX7OQHom3EFrzJe5Ikr3gM+oyxjk0fmWFg6rldfBmc8mAgjP/7fF1?=
 =?us-ascii?Q?+F37BMMVGDX6wX0mmmdCVGcxBhoT9sY95dKeIbLwRT8j0HxNjGomFaXG+5Xc?=
 =?us-ascii?Q?3kcWgiIDAqdKpBsrHERGQCBP3t0SaccCjxXFrzOq6YAHJ0CDpgGrU/5J8Cse?=
 =?us-ascii?Q?QAVyCHIV/TDWgHlf2PA6lrRpKioofw6DnZ7zRHz0xzt0L1extPw258olIKSG?=
 =?us-ascii?Q?E636+5WaWi7ypZseNVPXRdJPAubovBjuoi3tpqUfbr+rsYBXZiP+O/ewNpTx?=
 =?us-ascii?Q?pwaEjhxGPJvJFny3ID4VXMYxzPSHij71KQfooR45KxlCMfOla1Vpi5dA4bhy?=
 =?us-ascii?Q?8qWWMwaNr3PQXgupTyUpZc8xjU7ScU1jkeKjNgJhVgEc9oUf2V35YeaBw4iU?=
 =?us-ascii?Q?8DLZuKHaja3sZCUG6SAinf0JF2baUtWeBVjI69/6RbO4AKKY2nFmUwd3avt7?=
 =?us-ascii?Q?hFkw3B9bYp+7qX2ag3Xhnn7bajegbBwUsQ8bo+9emZfXFxOWg2V2UCJlHC1p?=
 =?us-ascii?Q?FA0lm3QQIRzZw8uEcREVXI8L8dSymSwDgR1Bh69yCwNmE9g8jAsy0xJH+7JJ?=
 =?us-ascii?Q?M5EJXW1IGc6q7BJ6mt7nbqV6YGpUhTPJQ1S6XICqER09pyGP0qe20mre3/jo?=
 =?us-ascii?Q?CW39hdxcGP1/agYB/sZRKJWQKiL9pxDbAgHx+HrGLE5Hwk3tfHuUTItBI8Cy?=
 =?us-ascii?Q?hLc1E+MdZrkvxNWx/z7mhCeWgNSDv8lqB8W7RIznNVdqJGfhaVWQV+CNz/3T?=
 =?us-ascii?Q?Gk/fmXXjk54Xs4z0EFv9dAVnZYtuWUe8DuKblR45KsS5lITKT6h8Aib0Wz4R?=
 =?us-ascii?Q?MKszPbVAQ08Cz0+gBVNSZuYdpI3/gf90LgW5qZ35188pUOMa2II2GJXel/vK?=
 =?us-ascii?Q?RNijsjMd9AduSy3dg7w39RjkyTKr/y2kEFKh4psAoCB+8qJvFEAEpFpOzhNb?=
 =?us-ascii?Q?yYfaR5kWHzJ3PCnp97GzCDhkEF740RCyq8RZKYj5Bgc256UDX0t8V9/vBtxy?=
 =?us-ascii?Q?4mD2IPM2ma31TnvNIeNqkeYosUTlhtCVa884wB95U+F/ADrBBudEpOfzQCpP?=
 =?us-ascii?Q?cZ2enixAfElP7AmuWL4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:34.4762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15caf971-32d5-4834-2b5a-08de0a41ba28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121

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


