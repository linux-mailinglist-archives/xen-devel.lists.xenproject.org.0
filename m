Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF6CB50FAC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117599.1463738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQe-0000Xm-So; Wed, 10 Sep 2025 07:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117599.1463738; Wed, 10 Sep 2025 07:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQe-0000VL-Me; Wed, 10 Sep 2025 07:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1117599;
 Wed, 10 Sep 2025 07:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQd-0005yo-2D
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2414::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fd30496-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:41 +0200 (CEST)
Received: from BYAPR11CA0071.namprd11.prod.outlook.com (2603:10b6:a03:80::48)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:35 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::4c) by BYAPR11CA0071.outlook.office365.com
 (2603:10b6:a03:80::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:17 -0700
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
X-Inumbo-ID: 4fd30496-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vt3eqbsjLnuHl9Tqeq9eFiB5JDZNUAiIz+rTob2PNRsi3EJcBPGPKmm5Vyhx85n3bo00ISF9JFpOIFZl/YSPznamt5046nZSyQBwySL8YqI5kzB4Ajvw/ARjb9MFs6lxSzZWWuDMXYOOcOUdK3xKzLTRnfVh69x+dZWnUg3AkQlR4M94wFP6kWqvOqaiytw78479Yl7M8tdvSFID9j2tR9cFQUDwnKa2XWt+7JbZWoWantOeWBusQ1y/T8cnD0DycEfM3SOz5JgvAjMRljAFFwSKe6qkIeERRORAZ30F9MZflmusUFWWvkgkkmgYLeTJnR2BbGsVbAJvCNioUo3uRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCQXbHre+Tmm9vrjGVCZOjoEzc5zPINt6SGXpZK2zMM=;
 b=HdVzcwTf6Pa0MpDEAli2Rw1VQN8Y7u/2SDytgthjpZ0Tnq2Grwt4i9OvPMJ2sBnhUZSMNOn5wE4j4H/mGpFEC1zIOKKLd6/rxe7bEkFh1qhPlHBliJTrN78mhyH2ntXVBTrg8s9on73InhrRHwfLVO49ZJLrW/+eAV+hwzx4qnrbm6CyI7kDVx++tD/sJOh6bGq3GQVO9WjVvZalTTMo4QkjBPmGyxTGQEHGjMZuh7owKSp+4IZ68y5dISbHI5xKMX4MQLGd6X3MmoRd8pgmsSL/cQW5Ny186DGV8+vM2+4ipVeyJQHUkpvc23VLJL44JTycIiGe3HIshjJNBZPf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCQXbHre+Tmm9vrjGVCZOjoEzc5zPINt6SGXpZK2zMM=;
 b=flC3c07rnLJ4sXwUGQYY2ElrhnK8Js1c+YuxievSQw4wbf9hxIjKxEyxMYMMdTpK/M09qvSef4GLGvZmagAM7O/h9LkFDPDhcxgJ8Y0Jpqhd0qXDBAXxb/+z29v4aZtvroR9DpvKo8+1u1ijQVPDZS8F21QNSnIF8szsn3PiDBI=
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
	<roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 08/26] xen/domctl: wrap domain_soft_reset() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:09 +0800
Message-ID: <20250910073827.3622177-9-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4fadab-e0de-4936-b6f0-08ddf03d3061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FheVA+sA+CN/qpqz6PojzQPWmIjyFnVMy6OIKFPub6+4AA8cTaf3y6LZiQIX?=
 =?us-ascii?Q?Zj19aAfctGaYr5VrcXLkvjR1GsMGjPFTfjpZKpggO2ZwK+mAuSbpmXVD5FJA?=
 =?us-ascii?Q?pLbnOkDOAYlUPLdM07Uk2rkv0ZR+LWfB82vBAn/VsUF3ULHXIH/L3R6XJt/8?=
 =?us-ascii?Q?YQL2cwpZfkymQKP+/Vj0e26+dnqVxcoYhj24PCLzKdei6vZKv1Mi+KM9++JR?=
 =?us-ascii?Q?Iat4m5b4Yv+A83z3odkNz1JwQq6mvq35vL2NUamo3c8fPhmYUAb4Ic/BUkO/?=
 =?us-ascii?Q?OQvFmb6SQ4Di3BV89gMKjhEocHvzBWqNwzBVHh3s5roiz8lckT74Zvr/gJMU?=
 =?us-ascii?Q?D+pns4LFjC35mFy/FQQ1ZM664pwcSXqgnKJSquALOfDdFq7RapVc0oTrUOEQ?=
 =?us-ascii?Q?nP+VIJ5YB9BYkbsgskCyvi+7dAyb3VoY+hOS5ZQtVzYMx49Vi/xg++JHkL/2?=
 =?us-ascii?Q?9B4LdbsrxYzLufmqVjbTTS2eS7PKFY3Oykv/Pko+NRKr0pes+7l35rjuIqh5?=
 =?us-ascii?Q?nBA1q9d8H0IcZJkkyk1xP7FjUqrSbTf8KXvr4QxkA0adlGd4QXDjVULtK2Bs?=
 =?us-ascii?Q?q6zLy3+BpF1GHKJnb1SXvOYGavYh/U4KXEJESXXuPDBSkRgW1MwRu7pdxrig?=
 =?us-ascii?Q?HHOlCJuVpCEAhMcq9be8z1NfKMPM9m3FDXHBJW8z0Xtn8CfEzIk8a9OpUGOR?=
 =?us-ascii?Q?Ogf8UUfFDGKd1QfHgEMBBcIxmtNdKvfw0/udcnJUQM+neML0HO5NMbZXGSLB?=
 =?us-ascii?Q?6u8AQPypqAOoLpYmnYBuBmYub3BDoiF6Ucuqa8jRgPkdurOddm1zfmKl3na4?=
 =?us-ascii?Q?5S79AQtKrFCIh6VJybJi6nsnTo74vxekftlxoq86U9Vp6AndcPj7sTzNUH47?=
 =?us-ascii?Q?WRs2qxtUlmWa9y7yYl4ZqzHEbxcb4Cth26DlLOg86+OCsnvdQ3McaB/jyvQl?=
 =?us-ascii?Q?oGg3ZTxy9ZwSyMfF2cGxxLK4/dlB8qGnBg3nghhWshgazX6HrsGX19rGTu9g?=
 =?us-ascii?Q?Y51dPvDF2mp7pBwHe58C+Kuy93DrvX9eh5GYyjo8FemUREVVB4V4ZtY4vDEa?=
 =?us-ascii?Q?jqM2IPslQ1d2IOAXHuQS+PaDv4ZzuFTiWrbj0HSugSqahMMtHAjJD3sFt9rr?=
 =?us-ascii?Q?ppWVl2BUnM0bFTBE1ixWUwjYvqpuPfSdE/RLsxyi3LR0d12cs7xSjcEzQXPy?=
 =?us-ascii?Q?RbONNR9rAhqN94vmgHldyJ64oIgdJXJ7S7pznZ9FvCxGQrhOmQFE/ToXfU1X?=
 =?us-ascii?Q?cfnlsQdbG7SMEucytZ5dzMWM5boLtMHKaPlwXzcOXF3RH0artdc4BbMXGtSK?=
 =?us-ascii?Q?/cW1t0K7KwKcrhRXrql6hP9SqfOMCYlIUNIYPSBGTVGWsX/BntJl8D7HUeiU?=
 =?us-ascii?Q?yG0wQWP3W02sGMieak9DYnndzb5Tvxrc77M3ei/aadBfLr9vgGFICWpsLo/b?=
 =?us-ascii?Q?AmSleBh8ln0XobQNXw1kNu9h3er1P2k769CvHyyCKWzTCyMJsF1KOa0rDTzx?=
 =?us-ascii?Q?EwgrnFituMg7l810LYP1dD8+e072M649+Y9A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:35.1189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4fadab-e0de-4936-b6f0-08ddf03d3061
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021

Function domain_soft_reset() is responsible for domain soft reset domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS
Tracking its calling chain, and the following functions shall also be wrapped
with CONFIG_MGMT_HYPERCALLS:
- grant_table_warn_active_grants()
- argo_soft_reset()
- arch_domain_soft_reset()
Wrap XEN_DOMCTL_soft_reset-case transiently with CONFIG_MGMT_HYPERCALLS, and
it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove unnessary wrapping in stub.c
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_soft_reset-case transiently
---
 xen/arch/arm/domain.c    | 2 ++
 xen/arch/x86/domain.c    | 2 ++
 xen/common/argo.c        | 2 ++
 xen/common/domain.c      | 2 ++
 xen/common/domctl.c      | 2 ++
 xen/common/grant_table.c | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 1a8585d02b..30ff9dac46 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -875,10 +875,12 @@ void arch_domain_unpause(struct domain *d)
 {
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int arch_domain_soft_reset(struct domain *d)
 {
     return -ENOSYS;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 19fd86ce88..5b3c5e8caf 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1030,6 +1030,7 @@ void arch_domain_unpause(struct domain *d)
         viridian_time_domain_thaw(d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int arch_domain_soft_reset(struct domain *d)
 {
     struct page_info *page = virt_to_page(d->shared_info), *new_page;
@@ -1131,6 +1132,7 @@ int arch_domain_soft_reset(struct domain *d)
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/common/argo.c b/xen/common/argo.c
index cbe8911a43..a451546d57 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2351,6 +2351,7 @@ argo_destroy(struct domain *d)
     write_unlock(&L1_global_argo_rwlock);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void
 argo_soft_reset(struct domain *d)
 {
@@ -2374,3 +2375,4 @@ argo_soft_reset(struct domain *d)
 
     write_unlock(&L1_global_argo_rwlock);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 976172c7d3..678e81b400 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1689,6 +1689,7 @@ void domain_unpause_except_self(struct domain *d)
         domain_unpause(d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_soft_reset(struct domain *d, bool resuming)
 {
     struct vcpu *v;
@@ -1726,6 +1727,7 @@ int domain_soft_reset(struct domain *d, bool resuming)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int vcpu_reset(struct vcpu *v)
 {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 0061d7972a..1c0bfd456e 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -467,6 +467,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
     }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_soft_reset:
     case XEN_DOMCTL_soft_reset_cont:
         if ( d == current->domain ) /* no domain_pause() */
@@ -485,6 +486,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                 ret = -EFAULT;
         }
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_destroydomain:
         ret = domain_kill(d);
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..24ef1205c9 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3962,6 +3962,7 @@ int gnttab_release_mappings(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void grant_table_warn_active_grants(struct domain *d)
 {
     struct grant_table *gt = d->grant_table;
@@ -4006,6 +4007,7 @@ void grant_table_warn_active_grants(struct domain *d)
 
 #undef WARN_GRANT_MAX
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void
 grant_table_destroy(
-- 
2.34.1


