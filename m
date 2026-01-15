Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21057D2387C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204488.1519172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfa-0000Tb-Pn; Thu, 15 Jan 2026 09:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204488.1519172; Thu, 15 Jan 2026 09:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfa-0000Rr-LT; Thu, 15 Jan 2026 09:29:34 +0000
Received: by outflank-mailman (input) for mailman id 1204488;
 Thu, 15 Jan 2026 09:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7XDq=7U=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgJfZ-0007JZ-9H
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:29:33 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af1afdc4-f1f4-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:29:26 +0100 (CET)
Received: from CH0PR03CA0356.namprd03.prod.outlook.com (2603:10b6:610:11a::34)
 by CH1PPF84B7B0C96.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::618) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 09:29:20 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::c6) by CH0PR03CA0356.outlook.office365.com
 (2603:10b6:610:11a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 09:29:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 09:29:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 15 Jan 2026 03:29:10 -0600
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
X-Inumbo-ID: af1afdc4-f1f4-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUwyQG/MzpCq57QuIse3ioF5fEqCNYy6NziViD1vEKLEj55X/36Ejz9igbZMhWY9DMKt+f+7va9DdCMC2baotU/3/a1/H8AQ7gPkmzVRRYIpGdXW90fKYsgxv/EHqnaYGCLpJqyH4hZ838hZH5SDo/bnS9uQRNBlpsKwz2Z8QVhg7XT3tH3CoN6bVNlwTgw2WlTPba63xMBVjY3UFl80BqJXL8DVcnBmVnR4zO/xJAkdWNVEU1+TVuCcVazUFACQO4nZjjYce2ex6k9lkSgcwvWyYg47lgZBiAVJHORwVc1vbERgQ7CVw7nW+4P7exrkG0DjEnrZJwdzPjp8q0vD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABCXVSHV2eH9kGiJIwIF6xx3zPKKoyzY2uDyJj9ALZk=;
 b=k9Nx07YjyUDc3fJHsoaOn71T1173iRzLQ0vZ/BttaVdf38pbxAkvdJEu0iGZiAwxagDZDrLMvzqJCpa79oO7n6DeOZU+3gWRvavlIaUQlz3f8FgxwBjvGtgyP/JDI7h+fQcqM1onjAIbgcPxcIUptp33VV+vQTitvboEL90VNgJMWbIHIHsx74Znz11qs/4uV64E9rgodI5EhIqtqPLxsln3FwcLE6w0pJA51psgOFGSbSwhYO5VktfedFRC+7Jj54ekyD7TnDGo6MD/+m/thQVoJcEYlh0/vCK6oNo5gtgXdyJZfyJyyd2sQyyWQJqW8DEG8waTXyDd3fG6I+q4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABCXVSHV2eH9kGiJIwIF6xx3zPKKoyzY2uDyJj9ALZk=;
 b=TmQkQ33u+dWTd9tRWmD/MeIS3jOf/r3CxL9lauYgQieAO3TAiks6rJbZWuWhlnAyP0SoUoz7gFE365NE2yOsiOTRQVFayMsMhkjBLCJ/3c/M19F+k38MwL+6wQxKcLtLUjgvr1fTxWNcIBWG6pLyUqimiD022QE1gk3Loe9Dpvs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <jason.andryuk@amd.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 4/6] xen/p2m: move xenmem_access_to_p2m_access() to common p2m.c
Date: Thu, 15 Jan 2026 17:28:39 +0800
Message-ID: <20260115092841.2651224-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092841.2651224-1-Penny.Zheng@amd.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CH1PPF84B7B0C96:EE_
X-MS-Office365-Filtering-Correlation-Id: 38dd6108-a5fe-4e78-d322-08de54188fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A/7NW45hdC/CbRpFxgQ14gZtUnzX27oQLgJJ9tlCEI7rnc0VnM15Z2TTgXhX?=
 =?us-ascii?Q?lyRcE36oLy6AV53ZXPAp7G84q9wtBKCHQU+Ex7xsmcxWYJCMep9SRMVk48mX?=
 =?us-ascii?Q?7YL2CEcs5vAwlq0FrrKfCh2hb02cH+HuHQezthiCY2B+DTKn+vl5n8ZytC8x?=
 =?us-ascii?Q?XdZFSfVMVrF2QZu0ULGk7K7a+wcsR+wz2iKkzt38CBeYwDVjyJlIieMVLQXp?=
 =?us-ascii?Q?Hq6HOM8/sRVef3nEVdl/qCCI+C3kR4iIYnSZL0WGwQGmKEHJjbflL2OmI/1w?=
 =?us-ascii?Q?VpLkjZJJusdPDzGMpNE8eym9s3ZJbRX6pevw60jhinsxb7ZxtYBUsjOzbFfB?=
 =?us-ascii?Q?M/eDGz33qXvbtsAvSYQynuHiAyGCdy1XaeZFPKY+0Z0tWWNo311IPBbAQwBt?=
 =?us-ascii?Q?S/7grTOtJAvs/BBEgO4sjApYTu7Kb5HrFyS1tPa5vRQa5gLNscZl4VmRkZyp?=
 =?us-ascii?Q?UaOoVojM62SdZSlwhnWoFq8D/W4mU3idF9CPkFKXBmXtjlNyrcuSpwjKRfQ4?=
 =?us-ascii?Q?NTsHZ1HjP7uH2CkdBUhz5h+a7O+E8eETLDjfZViYb//9qKOGMxt1DcJG5Inu?=
 =?us-ascii?Q?W9Lv0boGQ7wn7/79SEEx+UBehUcq5yLit7WgEOrszcRc057HwXZBoiq35RMS?=
 =?us-ascii?Q?W8StyyySY+45PAA1SSDfOb+9QpOPfogH7AfrhAsEIz6tfczjjA3PsJEo+tN3?=
 =?us-ascii?Q?u27LNHlTqC0zoIFkDYKZKayKUd8hQGtA9YmvYzd30Byrc9VeGeHNHMROYlqq?=
 =?us-ascii?Q?nPFDJptAfa9zMhtTIBhMXA2Oih1m2UqRWXfiCMWqcvNfMe0/bu75BNrjNwoU?=
 =?us-ascii?Q?iZ+vggRj96Y0yBWIZp8Sq3UdTXWGlfplLbk5pxskYQh0ZyKzKldQXVW1J4B9?=
 =?us-ascii?Q?/vYZTo3uEZmA2wNM4GtVGe0aZfGCoOlikny1PLSzzVpdVx02ro4rPKrqGC7l?=
 =?us-ascii?Q?5iOhIU1F65YifYSh5VWa3eIaK8ZalDzCyrNgACeUkNTsbaLjb39P1znx63Z/?=
 =?us-ascii?Q?EoAvlW12F4rMuX4ljcBdFOtrYFa+8MqWSlLaNkoRRb1gpMVU3g1qJIZ07vrQ?=
 =?us-ascii?Q?oKyoDvF/mA/b/BXMPm8odn9kBb+AZQE86K8AGJFH70uVn8dUzCcZf/n9e4VJ?=
 =?us-ascii?Q?aOgCZ59G7pu0R6NYA0WnsiwB92nW4aHKSaPMBBqZtA9WyjqAjlO3Oqr84HAp?=
 =?us-ascii?Q?/kl8DaARTD0o6A1uSUQ9z258VQBtPTfPIyDixt0+zTTzGnhIqiox3xnOsG/K?=
 =?us-ascii?Q?ZochSCts0zeDhzzaByt12zF2x+DyG5XLFJlanZwJ6EqAIgz962TTTXhyXN1a?=
 =?us-ascii?Q?tGLShNZGQeTHPOKdb6chqviEv+9OPgUSKfgFo1pEWz0oPfTxBBUwx5rj26H2?=
 =?us-ascii?Q?LeM9hbnOtUneTez728ytsnwcTyHeLcur/cmHDmqLEukMhc2PQt5JaDmouhHt?=
 =?us-ascii?Q?Zt6AOWuzAf2iiTEu7+t+KZEylfWpz/pzjBIr4VqR1B7YW2uXybdvN96fhoAf?=
 =?us-ascii?Q?VNvB3osEKMpATx+Ev6fgQ4aqQdbRHZynPXPb2vV8GzkPWjmq0UYrcEvMYFl+?=
 =?us-ascii?Q?eu57ABAQQKyYvHrhEsWHo4c2EqZYdtv/CGnqiac4olHdTffhvZFGyGhhxNER?=
 =?us-ascii?Q?KLfJPbknEl5Z9R5Stnm9vLadDiJCNxMM6kPxYhluSzVJJgyFHhdoO3RGissr?=
 =?us-ascii?Q?itwR1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:29:20.4242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38dd6108-a5fe-4e78-d322-08de54188fff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF84B7B0C96

Memory access and ALTP2M are two seperate features, while both depending on
helper xenmem_access_to_p2m_access(). So it betters lives in common p2m.c,
other than mem_access.c which will be compiled out when VM_EVENT=n && ALTP2M=y.
Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M, otherwise it
will become unreachable when both VM_EVENT=n and ALTP2M=n, and hence
violating Misra rule 2.1
We also need to move declaration from mem_access.h to p2m-common.h
An extra blank line is inserted after each case-block to correct coding
style at the same time.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v3:
- Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M
- Move declaration from mem_access.h to p2m-common.h
- refine commit message
---
 xen/arch/x86/mm/mem_access.c | 36 --------------------------------
 xen/arch/x86/mm/p2m.c        | 40 ++++++++++++++++++++++++++++++++++++
 xen/include/xen/mem_access.h |  5 -----
 xen/include/xen/p2m-common.h |  3 +++
 4 files changed, 43 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index e6b609064c..e55e53f44c 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -298,42 +298,6 @@ static int set_mem_access(struct domain *d, struct p2m_domain *p2m,
     return rc;
 }
 
-bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
-                                 xenmem_access_t xaccess,
-                                 p2m_access_t *paccess)
-{
-    static const p2m_access_t memaccess[] = {
-#define ACCESS(ac) [XENMEM_access_##ac] = p2m_access_##ac
-        ACCESS(n),
-        ACCESS(r),
-        ACCESS(w),
-        ACCESS(rw),
-        ACCESS(x),
-        ACCESS(rx),
-        ACCESS(wx),
-        ACCESS(rwx),
-        ACCESS(rx2rw),
-        ACCESS(n2rwx),
-        ACCESS(r_pw),
-#undef ACCESS
-    };
-
-    switch ( xaccess )
-    {
-    case 0 ... ARRAY_SIZE(memaccess) - 1:
-        xaccess = array_index_nospec(xaccess, ARRAY_SIZE(memaccess));
-        *paccess = memaccess[xaccess];
-        break;
-    case XENMEM_access_default:
-        *paccess = p2m->default_access;
-        break;
-    default:
-        return false;
-    }
-
-    return true;
-}
-
 /*
  * Set access type for a region of gfns.
  * If gfn == INVALID_GFN, sets the default access type.
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 759f3273d3..8d34357bcb 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2203,6 +2203,46 @@ void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
     guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
+#if defined(CONFIG_VM_EVENT) || defined(CONFIG_ALTP2M)
+bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
+                                 xenmem_access_t xaccess,
+                                 p2m_access_t *paccess)
+{
+    static const p2m_access_t memaccess[] = {
+#define ACCESS(ac) [XENMEM_access_##ac] = p2m_access_##ac
+        ACCESS(n),
+        ACCESS(r),
+        ACCESS(w),
+        ACCESS(rw),
+        ACCESS(x),
+        ACCESS(rx),
+        ACCESS(wx),
+        ACCESS(rwx),
+        ACCESS(rx2rw),
+        ACCESS(n2rwx),
+        ACCESS(r_pw),
+#undef ACCESS
+    };
+
+    switch ( xaccess )
+    {
+    case 0 ... ARRAY_SIZE(memaccess) - 1:
+        xaccess = array_index_nospec(xaccess, ARRAY_SIZE(memaccess));
+        *paccess = memaccess[xaccess];
+        break;
+
+    case XENMEM_access_default:
+        *paccess = p2m->default_access;
+        break;
+
+    default:
+        return false;
+    }
+
+    return true;
+}
+#endif /* VM_EVENT || ALTP2M */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4de651038d..8e7d9ea2e3 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -73,11 +73,6 @@ typedef enum {
     /* NOTE: Assumed to be only 4 bits right now on x86. */
 } p2m_access_t;
 
-struct p2m_domain;
-bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
-                                 xenmem_access_t xaccess,
-                                 p2m_access_t *paccess);
-
 /*
  * Set access type for a region of gfns.
  * If gfn == INVALID_GFN, sets the default access type.
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index f0bd9a6b98..bd4169caee 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -43,5 +43,8 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                          bool readonly, p2m_type_t *p2mt_p,
                                          struct page_info **page_p);
 
+bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
+                                 xenmem_access_t xaccess,
+                                 p2m_access_t *paccess);
 
 #endif /* _XEN_P2M_COMMON_H */
-- 
2.34.1


