Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FA4CB7D49
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184932.1507280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuR5-0003Xw-Ne; Fri, 12 Dec 2025 04:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184932.1507280; Fri, 12 Dec 2025 04:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuR5-0003V2-CH; Fri, 12 Dec 2025 04:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1184932;
 Fri, 12 Dec 2025 04:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQm-0007Dl-9E
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:00 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0103ecba-d710-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:06:59 +0100 (CET)
Received: from MN2PR18CA0004.namprd18.prod.outlook.com (2603:10b6:208:23c::9)
 by CH1PPFDA34A4201.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::625) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 12 Dec
 2025 04:06:55 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::70) by MN2PR18CA0004.outlook.office365.com
 (2603:10b6:208:23c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.11 via Frontend Transport; Fri,
 12 Dec 2025 04:06:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:54 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:51 -0600
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
X-Inumbo-ID: 0103ecba-d710-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYbrfidpstbGB/dQZ5QhMngzbvTifHfAIeqsJXA5zTzi03v/0aNMUXlaAM+A1usA4gaCDFs7oGcWwaYrAP7RImQF6QDzo0zaHYC9Z1lHgwnv0gbZIGRwV2A8G5CmUNlmI/cSWGx1ZLkjTRPtz8qixT+zOu3jLRkHG+mVa1F5/sM0tyQvuefu694j/BRqHKUkzYWgwqLLAvrJQGVqfXWj8lqZ8HD68NOgpUnNrTwnJ4oe4uMsC69K/qwOcCchqk87lnYkRnnD8rjqA1z4GSWeA+VxCwJRBigj0UeN5Zy9ZnbBh2psETK2E4tKZBO92X8qA/811wUviotFW/JWG9WHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc4GOUXjj8Gz2F+R05siesUERkmjkVYJyAi/lfHSPH0=;
 b=ZrSWCzmsPRKbVX1Z3TthvNNRmUMsUrnbLE7Ujb2mHaQihQEGtgwCWNgkf7VgkBr9VCHHLGkTPNfeYeD91Z7CkJXDOqu3LQAu3zsAMzq1OxEA/GHeMc56b+EP9Sd0lLODz++10HpIyxTeXTvm1IWE+jVcjeK9m36yanvFXKnP/iLduly2Z8imtYi8xmwGaYZjPpYM/6XJ8Fn/KtRC6JR1e0UJXZXwoivW2uG5GwLaYbmfMIMcNQSdVfkCKXmdQHMU2OTaZ51ipQpcvegBUCN99A34oFpgFMXtvyp7QStoOleS9h4EjjXiKPK7fP9MNIjev4wQYL+6ExsVCoX6KC0MuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc4GOUXjj8Gz2F+R05siesUERkmjkVYJyAi/lfHSPH0=;
 b=21/Ci0CLAcN8zX0dmRBq0bhOSevsDRaK9kITT4HDT40WlhsOb0SgGVDixOBQpr+t54Mts2us9ZfD0wGEeDa4rs+AwhhofQ78ufDqjcOgysHBeGIvSf6Vzg75yOmJjSiSvrh7H1N4RrSZVTCg/yqnUUR1lpSo+29i3LD2n0lppWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Nathan Studer <nathan.studer@dornerworks.com>,
	"Stewart Hildebrand" <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
	"Juergen Gross" <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Meng
 Xu <mengxu@cis.upenn.edu>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 11/24] xen/domctl: wrap sched_adjust() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:56 +0800
Message-ID: <20251212040209.1970553-12-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|CH1PPFDA34A4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 12511625-b345-4a06-0d10-08de3933e324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b676qOjQKf2WL139nWI0Emx8+eUygDt5T7LEEL3S6w5nYRdzBNLHEDuA5EC3?=
 =?us-ascii?Q?3UIxHMDgT3EKPRVEK+0XrpDZotg7wtQ/esKj5AieoBCrhBuKsn5Pj0Gu8IDs?=
 =?us-ascii?Q?0QvnsER7G1JX+x/kF1fLTULezhbC6+R6rcGDsMFGAkL0me4rhWR0MlRd8kzk?=
 =?us-ascii?Q?IXOkf5Ll6oVnNeYSDBQnivWd95DjOs255Mel1STrTgF32DrIC1BebfnSa3CW?=
 =?us-ascii?Q?2j8AjEdXINB5ZvATEXrVewFn9IzPCLMMqX/ZXFtB3do8dGgNoNS1Dnbx6CSj?=
 =?us-ascii?Q?xZq44VgoOoOlTeGVRWlOGo33AkFafg52uW1Gan5EKQnTT1rAKFrbRtvy3t6s?=
 =?us-ascii?Q?jJVg7whRktNscbqqeyOx+Klut5aH0H8gOOfNBiTikR4w9i8proaXbLqmg+E8?=
 =?us-ascii?Q?7TtZMswI2jLMFMXI8BOKaeNhcla6G8TVoOVaiyCvtsxXL/QlvLFwaEYQyVTQ?=
 =?us-ascii?Q?Ww4Axz//hvhsbQ8x8Sq/MPa1KKSDpg9KaBbwJpkuk/jwCk+ufqkJeqh0WqJK?=
 =?us-ascii?Q?F6MW25ID4zHLbHmJiMAfKpUTlrGv29hzpv0L7eiMI//8M07H9mp66OS7aoN4?=
 =?us-ascii?Q?EbhXGHgMVOiD00y4ctrzVkR52SKZmur1xfKjvsUJfKRsn9pnFxpjmdXm6c2M?=
 =?us-ascii?Q?zaperFsfkOhRWvPEtdccdKCC2b6eR3RAz6ZXgl0yGZZW0jmARY7VUzCRtS8e?=
 =?us-ascii?Q?z3KWINXIiBUWjRaM5ZBkuJsNeyzmOJjv+xGDrxDhFnFk9GTOEO3xc+Qh6Wy1?=
 =?us-ascii?Q?KLsrWvVKkMO764AOiTeUIhYdssH0vCuSV3a4/fnhqtKfMliZgF15NwzStgLh?=
 =?us-ascii?Q?5/zOVEn0azUwldKF7q/DH1CLUwHudoCVmURR/jF/eSNht1nsvZvC6tByeo+H?=
 =?us-ascii?Q?+TjDC296OnDkOROo/b1JGUcNruZJ7CpCSTwbBnRiBGbvMnESfgQK/Ihb146F?=
 =?us-ascii?Q?ggxV8w2ZitnKKomTii7aoSxW667lgEtG/rkTSFOBcpZEbnwTmB4jR55qUBhh?=
 =?us-ascii?Q?0MOZyLnH5rySVcwahlY1wbiuMaVtZXPqr7fz6WSpwLtfYUSJZ3GIaItYV+ul?=
 =?us-ascii?Q?zrd7U9gCzLw8sdNNsPOuT2RwpTrGrMmhGy7nuNMC/qxzcob56r7MlSggCkql?=
 =?us-ascii?Q?LTSxM9qiZfFuEbdg524hNIGKF4dFerASfaTmSwJhogHEn0JggKVHBkBUvpAm?=
 =?us-ascii?Q?4RBgM7EJiGkIEj49sN3hiMTcvg15utgejCrCQXGRC4RT5eNSsHM4A6CF/y9p?=
 =?us-ascii?Q?RF7W+ez/5DEGr4NdG6NrCsKxERhe2u5ZwfYMe/PSbiGMexhTrykArSRQ6bvM?=
 =?us-ascii?Q?we4ZJv+Sp29weB594D1xwlE8mVC2tgKqFEANmTHU2sOII46gqGkA1y6WCJVt?=
 =?us-ascii?Q?iSOvtAWBeZo7TiRnijxuQ8Mn0cZHBHSklsoAO4DDqJYUnK19KDhTinkap8zV?=
 =?us-ascii?Q?cBVHLmFXBIvejacS5smejCmcGqr3GnFCGeQmlSCo0yNdRDMB6SVC+uOijDFG?=
 =?us-ascii?Q?3B0bAgXs35lTnAeBm02dItkANZOQtaz9o6R6r6Y85aTkUGTfX158ixLikvMq?=
 =?us-ascii?Q?6gZvrAqwtYaFrSO05A8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:54.9656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12511625-b345-4a06-0d10-08de3933e324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA34A4201

Function sched_adjust() is responsible for XEN_DOMCTL_scheduler_op domctl-op,
so it could be wrapped with CONFIG_MGMT_HYPERCALLS.
Tracing its calling chain, the following functions shall be wrapped with
CONFIG_MGMT_HYPERCALLS too:
- sched_adjust_dom()
- scheduler-specific .adjust() callback
- xsm_sysctl_scheduler_op()
Otherwise all these functions will become unreachable when MGMT_HYPERCALLS=n,
and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_scheduler_op-case transiently
---
v2 -> v3
- add missing wrapping in xsm/dummy.h
- move and get away with just a single #ifdef
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around XEN_DOMCTL_scheduler_op-case
---
 xen/common/sched/arinc653.c | 1 -
 xen/common/sched/core.c     | 2 --
 xen/common/sched/credit.c   | 4 +++-
 xen/common/sched/credit2.c  | 4 +++-
 xen/common/sched/private.h  | 8 ++++----
 xen/common/sched/rt.c       | 4 ++++
 xen/include/xsm/dummy.h     | 2 ++
 xen/include/xsm/xsm.h       | 4 ++--
 xen/xsm/dummy.c             | 2 +-
 xen/xsm/flask/hooks.c       | 4 ++--
 10 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 7d6c40d800..5a6f8c8642 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -735,7 +735,6 @@ static const struct scheduler sched_arinc653_def = {
 
     .switch_sched   = a653_switch_sched,
 
-    .adjust         = NULL,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .adjust_global  = a653sched_adjust_global,
 #endif
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 83e34e7c05..0943cb1e97 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2072,7 +2072,6 @@ int scheduler_id(void)
 {
     return operations.sched_id;
 }
-#endif
 
 /* Adjust scheduling parameter for a given domain. */
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
@@ -2109,7 +2108,6 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
     return ret;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 {
     struct cpupool *pool;
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index e8fef6fb51..54a4def362 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1183,6 +1183,7 @@ csched_unit_yield(const struct scheduler *ops, struct sched_unit *unit)
     set_bit(CSCHED_FLAG_UNIT_YIELD, &svc->flags);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check
 csched_dom_cntl(
     const struct scheduler *ops,
@@ -1227,6 +1228,7 @@ csched_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check
 csched_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
@@ -2288,9 +2290,9 @@ static const struct scheduler sched_credit_def = {
     .wake           = csched_unit_wake,
     .yield          = csched_unit_yield,
 
-    .adjust         = csched_dom_cntl,
     .adjust_affinity= csched_aff_cntl,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .adjust         = csched_dom_cntl,
     .adjust_global  = csched_sys_cntl,
 #endif
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 307e63ebd8..b73dd3c548 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2909,6 +2909,7 @@ static void cf_check csched2_unit_migrate(
         sched_set_res(unit, get_sched_res(new_cpu));
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check
 csched2_dom_cntl(
     const struct scheduler *ops,
@@ -3114,6 +3115,7 @@ csched2_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check
 csched2_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
@@ -4246,9 +4248,9 @@ static const struct scheduler sched_credit2_def = {
     .wake           = csched2_unit_wake,
     .yield          = csched2_unit_yield,
 
-    .adjust         = csched2_dom_cntl,
     .adjust_affinity= csched2_aff_cntl,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .adjust         = csched2_dom_cntl,
     .adjust_global  = csched2_sys_cntl,
 #endif
 
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index b7ff67200b..3b35002c5d 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -349,14 +349,14 @@ struct scheduler {
     void         (*migrate)        (const struct scheduler *ops,
                                     struct sched_unit *unit,
                                     unsigned int new_cpu);
-    int          (*adjust)         (const struct scheduler *ops,
-                                    struct domain *d,
-                                    struct xen_domctl_scheduler_op *op);
     void         (*adjust_affinity)(const struct scheduler *ops,
                                     struct sched_unit *unit,
                                     const struct cpumask *hard,
                                     const struct cpumask *soft);
 #ifdef CONFIG_MGMT_HYPERCALLS
+    int          (*adjust)         (const struct scheduler *ops,
+                                    struct domain *d,
+                                    struct xen_domctl_scheduler_op *op);
     int          (*adjust_global)  (const struct scheduler *ops,
                                     struct xen_sysctl_scheduler_op *sc);
 #endif
@@ -506,13 +506,13 @@ static inline void sched_adjust_affinity(const struct scheduler *s,
         s->adjust_affinity(s, unit, hard, soft);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int sched_adjust_dom(const struct scheduler *s, struct domain *d,
                                    struct xen_domctl_scheduler_op *op)
 {
     return s->adjust ? s->adjust(s, d, op) : 0;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int sched_adjust_cpupool(const struct scheduler *s,
                                        struct xen_sysctl_scheduler_op *op)
 {
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..a42040b259 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1362,6 +1362,7 @@ out:
     unit_schedule_unlock_irq(lock, unit);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * set/get each unit info of each domain
  */
@@ -1471,6 +1472,7 @@ rt_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * The replenishment timer handler picks units
@@ -1572,7 +1574,9 @@ static const struct scheduler sched_rtds_def = {
     .insert_unit    = rt_unit_insert,
     .remove_unit    = rt_unit_remove,
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     .adjust         = rt_dom_cntl,
+#endif
 
     .pick_resource  = rt_res_pick,
     .do_schedule    = rt_schedule,
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index df8d737c18..6e8a6a2858 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -141,12 +141,14 @@ static XSM_INLINE int cf_check xsm_getdomaininfo(
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_domctl_scheduler_op(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index d20d4ae657..b3bec66e7e 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -56,8 +56,8 @@ struct xsm_ops {
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
     int (*getdomaininfo)(struct domain *d);
-    int (*domctl_scheduler_op)(struct domain *d, int op);
 #ifdef CONFIG_MGMT_HYPERCALLS
+    int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
 #endif
     int (*set_target)(struct domain *d, struct domain *e);
@@ -242,13 +242,13 @@ static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
     return alternative_call(xsm_ops.get_domain_state, d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_domctl_scheduler_op(
     xsm_default_t def, struct domain *d, int cmd)
 {
     return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 {
     return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 2c70b979d6..2c878999a3 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -18,8 +18,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
-    .domctl_scheduler_op           = xsm_domctl_scheduler_op,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .domctl_scheduler_op           = xsm_domctl_scheduler_op,
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
 #endif
     .set_target                    = xsm_set_target,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 490823913e..669b04f8ea 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -609,6 +609,7 @@ static int cf_check flask_getdomaininfo(struct domain *d)
     return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETDOMAININFO);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
 {
     switch ( op )
@@ -626,7 +627,6 @@ static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
     }
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_sysctl_scheduler_op(int op)
 {
     switch ( op )
@@ -1883,8 +1883,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
-    .domctl_scheduler_op = flask_domctl_scheduler_op,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .domctl_scheduler_op = flask_domctl_scheduler_op,
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
 #endif
     .set_target = flask_set_target,
-- 
2.34.1


