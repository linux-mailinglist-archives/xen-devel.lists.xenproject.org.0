Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94777BD2907
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142071.1476347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fls-0000zN-Sj; Mon, 13 Oct 2025 10:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142071.1476347; Mon, 13 Oct 2025 10:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fls-0000wi-LC; Mon, 13 Oct 2025 10:27:16 +0000
Received: by outflank-mailman (input) for mailman id 1142071;
 Mon, 13 Oct 2025 10:27:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcO-0004Hi-Qt
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:28 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1240ee0-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:17:28 +0200 (CEST)
Received: from BN9PR03CA0389.namprd03.prod.outlook.com (2603:10b6:408:f7::34)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:177::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:21 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::7b) by BN9PR03CA0389.outlook.office365.com
 (2603:10b6:408:f7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.11 via Frontend Transport; Mon,
 13 Oct 2025 10:17:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:17 -0700
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
X-Inumbo-ID: d1240ee0-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xblBaMczgZcJtDZgFOywxde070fbHGWITAlAd8z9gXMcnFojK3gS4Rbt035XknmJLN/EDABYcfe9fxEBdd9tL5AtoGz3M6XszHKwcr76XbUywKKg35UQ2O58ZwustEA5MG6IFXHtAjK0/ls4TdUfcUY2Eg3rhlq1oLpqK2T+erVz+fWRlEBOJoaNlmpBXTt3wt6wC2FGh82XZuOTZ+PMy3/VmpfA0TunIJzsiv0c/bhl/XD3ZJRPAXEgRxaj09ikXflWdfZbt8Za8EOoT8en1Z9j8w7LEHxR3uf7agTBXFVmsOhVihTFH8SKnJpwro/EC9YjYpVRQ04p+y2REOBTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rKuA1uRZK/mAlwlVj+iKHKtosFKmqzuauXWERzdlUY=;
 b=K9VT8SdK3NsXyrfbWnaWuk0TDhKY+doN3MM+IXzI7xVa3tHF2+u4k3wZYKkz8YeOBgP6MARn7oqX58ryoYb2LKAzDdQcMQ0nQKYhnGgwVfww4B0R9GEdsg3LEC8/8Pcbg/CSZISBbA/E/yz3MdIiNXREhC3XD2QhreJrfwfJIj5gA/flPekz/6/dLgBuZTcTg9ZABj2EsrpmVgxsZZBkccF3TPR/zTxTjgeW22kqAJ3KsRW0dHdJlNB1zDzL5jK8EfVol6OEPz6jHTA5WrlfLj9KgBgJMWqMtaEtCrf+7njjcjrR1CcYLUhek70vZh1gcG3pDXpkpI7zlpqugEqinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rKuA1uRZK/mAlwlVj+iKHKtosFKmqzuauXWERzdlUY=;
 b=ic5sc6Z17kQZNkJDA5W79uVCh1GGTKrMo1CmkO+tQEhf7ELXGaYOND8Y5bw5AUggZALHtDmPMDbMPO2knyMojg5crKu01JmU38KR/3H1Zps90zfyo4MAC4qIWCiWrGcJ703g2GQ2bAvMhILWeF/hSFowbYAr1MjthdvEuMlQEt0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Nathan Studer <nathan.studer@dornerworks.com>,
	"Stewart Hildebrand" <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
	"Juergen Gross" <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Meng
 Xu <mengxu@cis.upenn.edu>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 18/28] xen/domctl: wrap sched_adjust() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:30 +0800
Message-ID: <20251013101540.3502842-19-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|LV2PR12MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff4ea44-7996-4ac9-10c5-08de0a41b1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nyUI0wOVjuMbGnXoXzX3SzewobLo0QqGnzEDeaxgkLg9FEiCyjy0koJb1R4l?=
 =?us-ascii?Q?LZxH+5nxIdtdKj/QcDzTVOpdNKenjhZp16JaTlRfTzAf+bY+WC748djDzAck?=
 =?us-ascii?Q?YF3hRs2BVx+wJgN8FN7cDyIoF2DxjY7a99MZdeL0w16KxCcItG9wtv293V3J?=
 =?us-ascii?Q?L8CZq5r35GFzpc+mEN9Q4dQumI7QdLfRrBDWpY082w+BUZ4Nw7pRyZ7Fsmdw?=
 =?us-ascii?Q?TZEsCWb2uN08Oe6nS9sQV0yzMfT1LYuV2YicA2QG/j0L83wy2lTDF0aS+8pk?=
 =?us-ascii?Q?hfF1Gs0gp6+ZssTd+jC5wEuv/oUWdgpyLzih5gHFup8LlOF67ds7x6es3AxA?=
 =?us-ascii?Q?ZBXlpNDKIUxcoyPU3qu8Gpz2dBpSQ3dKuVl+6zvWcjNnKyBwSKlTKGK7b1ul?=
 =?us-ascii?Q?ikF1RZbxlMOyn3rmKEeCSuit/XXDrTzuqbWS1KHAdhj7AJCImZa3Tzjzv98J?=
 =?us-ascii?Q?LpkRlOKaeiwnbBhtA+UdxuFsY9PNu7t0YNdjSk9Jd+MYEY65NE5t7p+Fjd5S?=
 =?us-ascii?Q?PqPtz67xQjvimvYEMBYiTkIOhCJxbJnZ4HeX+l62YRny+ddVlvE7yl4J6+Sm?=
 =?us-ascii?Q?4Mib6cWYJ74CHUsM4VJmh3yFKWscli+/uN8+YFfkBGq3psoZYCq67tFKs49a?=
 =?us-ascii?Q?U22iXzt64rH3V+bgT1+f5sNt1yVt/R3GEKt8xji/8Q9dqKaKpZVlzO9Ld9md?=
 =?us-ascii?Q?ewyhF8MUVx1KUxZxkOulkSp/82cgeKoSUwZzd9vuNaCzrsW2VY3AhF/DXivb?=
 =?us-ascii?Q?sK9rjxbKcbEfZJKcahbfwqu9oXN26SAa9A1PBCRgu4KsOzvBmImuZFw+oMSN?=
 =?us-ascii?Q?+xrRmv40wr0qyXJStkF2EXZQSpLnECRXhCnhIavpei5IbEySUi9qWeIkMbUC?=
 =?us-ascii?Q?3L2ExC1jiOr4jaOc0Nq1qyhF1gXp3b4vVzTyt8EnHMsBsRoheVw43LGohL19?=
 =?us-ascii?Q?i0bzW7Eb29WQ4uaEbvCNFIO2u+dSS5kwYaPYIXz+muHNI3L5hJi+6YUD6bcx?=
 =?us-ascii?Q?bug3mf4Ot1v2bXnwEpO7oiWywPJJMbf0sbv/7Frb9ZUzEWE8RDSVjRoUhnrf?=
 =?us-ascii?Q?n9qbxqJx6QcxcNfiFo1AI+i8J9Ml27tJGBAPXupPqODpoVBM7MiSH63t8Pqq?=
 =?us-ascii?Q?8ZuaJC0gVWTDOz90T8G39Pamebz9am4AwNfY9UK+ywL4yu3wtRwZ8/5YjzDi?=
 =?us-ascii?Q?gu25vibF22A4bH6bNTmLx8KY6AscDJKVnrFQiZ7NiMyAclFdQfo1btWHBt1+?=
 =?us-ascii?Q?4fHG0dMrZImMEpFulBjLy8iT2stbSRJuobuhWgJ/bz5Fal6PlBpdM7Aj3Vtw?=
 =?us-ascii?Q?J5AmhattqSdwOeBqACMRPCGe0zIQbiKE8usf1C06osgUW7HaEsBLuFf2l+Rb?=
 =?us-ascii?Q?Ih7UfZcMqXB8N3gaEnoiOSVnB0jAbp4aadHjjT48cfA9Yhos1xV3oIiIjxma?=
 =?us-ascii?Q?mOEKLVtGHJsssc1BlWAmisjFFEG91u0eEPhC1dzGu0PUpEVoCimioRyIhzB9?=
 =?us-ascii?Q?+kUW+H1JxN9E0T/HgfQu2WEfPzoGGNC07C9HZHTEh+vrkvcVBJPc1qjr9WIc?=
 =?us-ascii?Q?/elmYm6xt/TPU3iEug0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:20.6362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff4ea44-7996-4ac9-10c5-08de0a41b1e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752

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
index 180de784fa..6cee0858ec 100644
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
index 0cbec2a9c0..ed3241bec8 100644
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
index 9b1d31b6ec..5810a18087 100644
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
index 4c6e0dc0f9..9dd485646a 100644
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
@@ -240,13 +240,13 @@ static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
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
index dbe363f0de..724b2a2653 100644
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
index d0fd057db5..839a4cf9e6 100644
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


