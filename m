Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28DCB7D92
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185030.1507365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTubU-0001vP-MW; Fri, 12 Dec 2025 04:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185030.1507365; Fri, 12 Dec 2025 04:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTubU-0001sn-Ix; Fri, 12 Dec 2025 04:18:04 +0000
Received: by outflank-mailman (input) for mailman id 1185030;
 Fri, 12 Dec 2025 04:18:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuR5-0007SS-2S
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:19 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bc92d6a-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:07:17 +0100 (CET)
Received: from MN2PR13CA0019.namprd13.prod.outlook.com (2603:10b6:208:160::32)
 by IA1PR12MB6433.namprd12.prod.outlook.com (2603:10b6:208:3af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 04:07:13 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:160:cafe::3d) by MN2PR13CA0019.outlook.office365.com
 (2603:10b6:208:160::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Fri,
 12 Dec 2025 04:07:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:10 -0600
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
X-Inumbo-ID: 0bc92d6a-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7LOjONY4qCNiahorfmtjP0XCQF6vZrEmf+CX1qJjQ2vkUdbSJrFFnvemCYLXyKUKCAXXsgr3ew401BZesTL+bmQcTSoimFmfjtp+XfAQwbN2hENL6N9T+2Y5H4YwWBmEZrQKRLaPeJivIwbaZcGDubX6EG+kB0+WT2MbzTdO6/65Ct+r9QJUoSY+rwD8TcWlRExbPudThQx+rHTg2ivqePYOeAeMPTUbH8rrg+VQ9ODBp32oGxO9CKDsR2AKjj53KSqiJJ2ph6v2Gs9u+Wb0wZCXccZ2QR6UlPWMOnZu3nmXrYnjy+s30Wop29qYpMl/NPYaxUYSldYoLVBngwQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWivIiaybYPw5jJB/DQbmVNl+SgpVQga3F7RYOvVWbg=;
 b=wBbOaIVxSbPMJOkpVNWYqRTzlv1KNP4fyl33Te5mezJzJBgwdUQGOuz6ojSB61pMwKUTD3F5TKtpgim9MGcJLJUTpuORXW+Wf7xfrhQPt9E5ufL5PWGm7e5hlbAqmy9uoRh8VTCLKxdsEVD5cLm/duYI2ck2GsIluifJarE2/zLG9uA6QNN7PTSDV+Jr6xrzWKzquSa0wKdWn4JISuy9KMEqHKcOJ67RRysIHaFt3KHqlgypTYpMyOzKqpcKo32ASqLmX78/BsB14xo2W3btjprkXPZJMA9Xe/qOrbKlp8Zbp9c925KD3TJ4K/He+F8anG0koHkpVemRba/WxJMKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWivIiaybYPw5jJB/DQbmVNl+SgpVQga3F7RYOvVWbg=;
 b=axOPZe+729JHE4Ru9hz5LCC49PSmleOo/4SNcGB2YWA18YsrVeYHUOob5LzVvUHUj3RV8rBZNFEzeOjVv7H/JPX/IxweT5+gZvNSHJrZvsQmxl+vnYD2dvsxBYR2TP8VVW6yBd11FvrqKA05DtT2RxOEQwYtAs6aFV2QMfiCaFg=
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
Subject: [PATCH v5 18/24] xen/domctl: wrap arch_{get,set}_paging_mempool_size() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:03 +0800
Message-ID: <20251212040209.1970553-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|IA1PR12MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e96c102-530e-48e3-6435-08de3933edea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DcrRkvywtYBRp4zrTmFAaqy4gazQVJwM9qHe8YDM7bDHYqEJhAWlqZ5ZyYXl?=
 =?us-ascii?Q?cH/fCdc8r8Wq/dUyU8ykVNY+2zyRLjIGM4uTMHJFbgvGxKptTRn0kik/DK72?=
 =?us-ascii?Q?uzm0PKdhLWrz8GlNuBHK1z9lIRM5JkyV7Y7PLErc14g99O7O3G9K0yAapmKs?=
 =?us-ascii?Q?EXi/gwVTbhiEzutkk8u+7mCOWGZQ9RIsTU4MfubPReRa+Eu2eW+hXuwQ4eP2?=
 =?us-ascii?Q?Njx2P8IUkMVHXQ3tjFVruiZR/yHnipIPgiJyfJXUXkKCDgmcoPAR2tXYxcaB?=
 =?us-ascii?Q?YqptIRGOSMXTEF0A08uj4i7pKjsSPKtcwqqMxwva/Z6ZWg78kb9mm8J01uyr?=
 =?us-ascii?Q?ytfyNH89jCAVL2sbWQ01TPErW26l70XREk2weDcJo/QfYflnKTksb64bqQzQ?=
 =?us-ascii?Q?ZYHiBckcmRG4zCTXJXfYMQJWjdwcTKkQMENupfoW509uXBno5xTeNGpjDkG+?=
 =?us-ascii?Q?fc8Mo4LmcjZWgNPu7Lqv2ari+72kHOOJNlC6z6dkQkwN+a5RI6lKTUlcYJHO?=
 =?us-ascii?Q?0yDsbQSjj+t+X0p7IiEEnpq71kvN/aCHKiDeEac7w+51jy+Hx377nRSHKFMc?=
 =?us-ascii?Q?C2XFc6+3JZ0NPDiPN3DxPi4CJYv4G6w3he7vbidpSGMFWetpyoU58kljI0Jf?=
 =?us-ascii?Q?rgJ2aZzEGDCzMQdJYFW9/8GqDBtMJYh7ZiGcQtXCkVGB9g5KTMyxSONz+ACA?=
 =?us-ascii?Q?1wvA+ybFmI+EOjUOFr9n3n/uIkd5aTdkJjw1QSKWYTsZq31DPusuavg9HT6J?=
 =?us-ascii?Q?NaPZhquCEnncEkpalecmSZ8eYY4moR4AaOcPQ96e8qBq1AFiRc+gDJbISPXJ?=
 =?us-ascii?Q?oJGO21TlUam54F6btKGycd22Q254ZDYbH77h8sM4tOXoZIt1urNQQ5NKv9V9?=
 =?us-ascii?Q?UDHAUM8HjXd7pBBNU29bGw6QXQzgy8W9YcnDq6Ty7naw6OLgmKscaf/+73jM?=
 =?us-ascii?Q?kIOXk/qmG3/GdknJ+klorn6lMCTe6O3cKxxJiAUDe+lzVQZGzF6Xx7BL4l4p?=
 =?us-ascii?Q?oUovR30S9IgK242R+1fiwThG+ZvlYjXrWBfrJmz2zbs2dQl+0vcQRTyLBWir?=
 =?us-ascii?Q?9Fr4lJw69aXIgPoDWN0EVH8fheKqmLXC+87GPn25BNu2GJ85Q/goHwWlVgEV?=
 =?us-ascii?Q?lwF97DKEp4+WzOFM7IICtf45qFdDCTgAOVnCQ41nWFyz2XgNNBfnAUdTIdFG?=
 =?us-ascii?Q?4ElFnh6SFSR5T3DuAMn6zqPfDuXrLEOjv23jniAStqsjWCQrpGHwWVwrWgig?=
 =?us-ascii?Q?YBF7Ngphd9FfjWG2iH3Y7FjQjC7fEWrCwBNTT/77Gaa0iJ+OZtYfiTXzwwZ4?=
 =?us-ascii?Q?N5IiXfsdJp31I6u8jmSshk4tyglUJhCg18rzD1TIA7tvsr+eykIodaBlYSMz?=
 =?us-ascii?Q?j2ZaRxJam8G6vdMBGOoq5OFbs231SZVQ1EFN2xWyT/S3Nfekdm7uVz55D+q4?=
 =?us-ascii?Q?yWYTCBG8pv782UqZ2aV0Kmabt1FpFUV6i+iZXYeiEj+AS5c9VScw2f4L1wLc?=
 =?us-ascii?Q?H5g8Y78NoHRw3KinzwI9OxiQFWRkpTMegz8ePCHKeADzzquRF4iHZjB8jeks?=
 =?us-ascii?Q?FIrEz40B9vGsmWhsDTE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:13.0491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e96c102-530e-48e3-6435-08de3933edea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6433

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


