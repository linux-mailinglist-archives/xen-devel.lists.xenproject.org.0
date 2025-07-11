Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160A0B01238
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040360.1411829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5RB-0004Uf-E8; Fri, 11 Jul 2025 04:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040360.1411829; Fri, 11 Jul 2025 04:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5RB-0004RB-Au; Fri, 11 Jul 2025 04:32:41 +0000
Received: by outflank-mailman (input) for mailman id 1040360;
 Fri, 11 Jul 2025 04:32:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua5R9-0003OX-UU
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 04:32:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2417::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12c5d654-5e10-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 06:32:38 +0200 (CEST)
Received: from BN9PR03CA0521.namprd03.prod.outlook.com (2603:10b6:408:131::16)
 by MN0PR12MB5811.namprd12.prod.outlook.com (2603:10b6:208:377::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 04:32:32 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:131:cafe::e5) by BN9PR03CA0521.outlook.office365.com
 (2603:10b6:408:131::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 04:32:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Fri, 11 Jul 2025 04:32:31 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 23:32:28 -0500
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
X-Inumbo-ID: 12c5d654-5e10-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRo05I/CEfaEToqvwjnGzJ968o/Rs9xu4jJdKxVLu889y9YufTpLd8TqKzDhxtnnxx3zu+7r6zsYlD/ZlniKSf6bJYD4UXi0I9sF4AdeAPsrqxt2tgzQRj8kR+cmoNlTYOcUeujA+UiuPr8FUx5aSMSwjRRg9NxG2zMLiU7vL31TRcthHHwpcl5wJH7UHmgllSEuuTZzKnUpEjdJwVdnIo6Sm/XAxr/35qTi0youkl+WSRvhXfUHFbejbVAjG7zEUPQyoDr89sMx4RR/B564gqRg7SdwO6YyHRF9pzxdd+MK4WkHCLzlUUVukM7ndgIdN4kTimYi55dCeWusyaJdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvykzEStZK73rMFsbUxdbGQm1JqJFz8VY0tKPFQ221s=;
 b=OhQmM475vJBxeqOCT/l0lpPV25QyXwQHYpNAlFfyat8A4vNgRc+OaVygypsd3pHP1PXgpebBIpjyXlD//Jr9pOxijE4R0B1WRxDO8HyfaVAqPjj5Ex4jX23WYsFVmuglVlnvSn1AwvciD0QKbfiZSIO7GlBUMlW7APrEXJjBb961u1O8PTjjqcuAAbFp9BsfDndoTFHL1M+1+3wUX0i782M2SvtCFgu/0zwfCtnoWOjqdU1B8JDUE2ScNHpbXM8Id25JlUWuxiK/10H0gySDf524VNGZeqPe9c/FwEI0ycjKuTIDtkINT4pJCHLHcF25QMfulXYQeORMlror0n/yFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvykzEStZK73rMFsbUxdbGQm1JqJFz8VY0tKPFQ221s=;
 b=xEcRBZSgLR6PP/FRqTYLP7EcAZk/WuB/1/o4I4yyMIt32v+/j9mQoU8c7CwKRPfXg/oxamOD3zojGKs3Saj77fK9kSvjbw21kKqhsidMvqESuMryIpaRLIy99UmjxzzGv8PZ1xI2DGquc51VrGgFc3Zq4BwuFIStY91KXymcNE0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Nathan Studer
	<nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 4/7] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
Date: Fri, 11 Jul 2025 12:31:55 +0800
Message-ID: <20250711043158.2566880-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711043158.2566880-1-Penny.Zheng@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|MN0PR12MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: ace85ff3-f72e-4ae1-5d70-08ddc033f38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u9w+UdG9Im0g4IO3YxLbMurZIIxZAr+/shZLDQYy1QlOP4q4cnjfhmLqAPW0?=
 =?us-ascii?Q?1lcYKEUA9Th1k4H7jJrFUrwsfp/WVozIy7sZ+zzbJNAebCGXu0s6bgnqOfi1?=
 =?us-ascii?Q?mqR42MCJwpkIr6VCGHqqE1To2VYOyqigCLXvgBTvb6M+TphTzenVRQgtE2wD?=
 =?us-ascii?Q?cPcRSpw+RLAhy8UZmlZI43t8Uhj8rVwQzmFzE/AzKfEE10sJUFxnzVWs++qm?=
 =?us-ascii?Q?UjF1UOyV5LTVTsmRzTipAWUiQUQu3bWAb+JabncGEgDskgBmFfRDJ2qZSHkp?=
 =?us-ascii?Q?r4KB+CmUAeotfgd2OIiQlYR8WQFjVoIRxXznE2fkugD8mwLEryx6rkyPfmA+?=
 =?us-ascii?Q?98WokJssKjMlaw36T4vUwbYv/sd4JiAwmhHrVb5sbRYZK9niTR+jIvEpjzzI?=
 =?us-ascii?Q?9VynmbInIIygYBPtX6nXSnOO/TTCITKZCmQ8Oihn6yW7rT4R4uyjsuyGdNEk?=
 =?us-ascii?Q?y+z5uVYKXKun9e0GjmMPHlfyXwrlJa7L61vg+YuwEv0jMYRCvP3pZ/Ze/1KC?=
 =?us-ascii?Q?zavAWdbbMovVsj1CQgIm+4/dKoRWGDI23/G2iBcoJ07jKT8MHL5JREidRQ1i?=
 =?us-ascii?Q?APS57b3xU/bXl0SC4UGTo623BufhYwBn9/r6W4dXTtDp35IadeqYgahTB1GV?=
 =?us-ascii?Q?xAxTFbK7u/fY8vD6AzcM9kdye1LMJIxst7Gom84GovLgLKNYpNSA5AVbaGKk?=
 =?us-ascii?Q?JCe+L4R1G1Q7PVj7JDhUIl44orNGB5uXmZZVNvZzoW2qvPVj2EcpfKrPOnMs?=
 =?us-ascii?Q?fzlVtmtupiZGGCS38YLqeXpykteD5M8tW4WN85OJenZKkowbsLNKBoNZ3N5p?=
 =?us-ascii?Q?8QPUS7qH1m6WyGZ1lWATLZ8pI8Mubb9PDqqafMnZGZBOfH6VIrRH6u/W8Nzy?=
 =?us-ascii?Q?lrGe9FvDDOLAlu/uTUgPjp7VXKxb3eu9L9/YCUy85vsg5oDWETUvLHRzxPHv?=
 =?us-ascii?Q?HgRAbRhBFwywFC+UkkDOiuhMCxX7l1tdBXW2oLuPsX6k5TqDu64dzyzzKKYs?=
 =?us-ascii?Q?pgfKBCaga655TmXQy5hZgkkai03plKT/GDLtrfDmxioBKDps8RCsACpps2Q4?=
 =?us-ascii?Q?Dl8eKsqyHp2lba3m6XiDt/z5u9d+wGza5bBzmt+g77ELX1Hn+o7Ocwq3AmOo?=
 =?us-ascii?Q?QVTbn3AZai+EgoMFEPOAWMYcd5V0HjWr4cEDeun02/luZAZ1mE2w6b7/uczf?=
 =?us-ascii?Q?rhYZ29kbEhnwui/eqt9vUJAyVB8kOAmRIIRJxs7yLjrCQC2wpiETE1/lm6EZ?=
 =?us-ascii?Q?h39z2TSh8dRMZe667q4/t/OGBEVE/mzaeQ96yiYvHbBPIQhuG4hkMyWRZ4J/?=
 =?us-ascii?Q?NXPNImKGQjJRvlNNkYODO4QoLBBLk4ZtmMaPACmhOz9tYBMMv9gAgMuvg7QS?=
 =?us-ascii?Q?3ccIg/MsPpZnw/0FZT3EM1JKdgwLGpGczzug9Ph4vGarSR4ECUS/P10Ggh5J?=
 =?us-ascii?Q?DAG55H2RVtasEzPcLdjkcjG7O6ElONRLynlqe0+lXheqDXyhP9jxLQeOJGrA?=
 =?us-ascii?Q?YeiZltbGwq5oanflTr4P+LJB7CEF6EMMGkG+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:32:31.7846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace85ff3-f72e-4ae1-5d70-08ddc033f38a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5811

Function sched_adjust_global is designed for XEN_SYSCTL_scheduler_op, so
itself and its calling flow, like .adjust_global, shall all be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Stewart Hildebrand <stewart@stew.dk> #a653
---
v1 -> v2:
- no need to wrap declarations
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3:
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/sched/arinc653.c | 6 ++++++
 xen/common/sched/core.c     | 2 ++
 xen/common/sched/credit.c   | 4 ++++
 xen/common/sched/credit2.c  | 4 ++++
 xen/common/sched/private.h  | 4 ++++
 xen/include/xsm/xsm.h       | 4 ++++
 xen/xsm/dummy.c             | 2 ++
 xen/xsm/flask/hooks.c       | 4 ++++
 8 files changed, 30 insertions(+)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 432ccfe662..3c014c9934 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -220,6 +220,7 @@ static void update_schedule_units(const struct scheduler *ops)
                       SCHED_PRIV(ops)->schedule[i].unit_id);
 }
 
+#ifdef CONFIG_SYSCTL
 /**
  * This function is called by the adjust_global scheduler hook to put
  * in place a new ARINC653 schedule.
@@ -334,6 +335,7 @@ arinc653_sched_get(
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /**************************************************************************
  * Scheduler callback functions                                           *
@@ -653,6 +655,7 @@ a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &sr->_lock;
 }
 
+#ifdef CONFIG_SYSCTL
 /**
  * Xen scheduler callback function to perform a global (not domain-specific)
  * adjustment. It is used by the ARINC 653 scheduler to put in place a new
@@ -692,6 +695,7 @@ a653sched_adjust_global(const struct scheduler *ops,
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 /**
  * This structure defines our scheduler for Xen.
@@ -726,7 +730,9 @@ static const struct scheduler sched_arinc653_def = {
     .switch_sched   = a653_switch_sched,
 
     .adjust         = NULL,
+#ifdef CONFIG_SYSCTL
     .adjust_global  = a653sched_adjust_global,
+#endif
 
     .dump_settings  = NULL,
     .dump_cpu_state = NULL,
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 13fdf57e57..ea95dea65a 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2112,6 +2112,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 {
     struct cpupool *pool;
@@ -2140,6 +2141,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void vcpu_periodic_timer_work_locked(struct vcpu *v)
 {
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index a6bb321e7d..6dcf6b2c8b 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1256,6 +1256,7 @@ __csched_set_tslice(struct csched_private *prv, unsigned int timeslice_ms)
     prv->credit = prv->credits_per_tslice * prv->ncpus;
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check
 csched_sys_cntl(const struct scheduler *ops,
                         struct xen_sysctl_scheduler_op *sc)
@@ -1298,6 +1299,7 @@ csched_sys_cntl(const struct scheduler *ops,
     out:
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void *cf_check
 csched_alloc_domdata(const struct scheduler *ops, struct domain *dom)
@@ -2288,7 +2290,9 @@ static const struct scheduler sched_credit_def = {
 
     .adjust         = csched_dom_cntl,
     .adjust_affinity= csched_aff_cntl,
+#ifdef CONFIG_SYSCTL
     .adjust_global  = csched_sys_cntl,
+#endif
 
     .pick_resource  = csched_res_pick,
     .do_schedule    = csched_schedule,
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 0a83f23725..0b3b61df57 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3131,6 +3131,7 @@ csched2_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
         __clear_bit(__CSFLAG_pinned, &svc->flags);
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check csched2_sys_cntl(
     const struct scheduler *ops, struct xen_sysctl_scheduler_op *sc)
 {
@@ -3162,6 +3163,7 @@ static int cf_check csched2_sys_cntl(
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void *cf_check
 csched2_alloc_domdata(const struct scheduler *ops, struct domain *dom)
@@ -4232,7 +4234,9 @@ static const struct scheduler sched_credit2_def = {
 
     .adjust         = csched2_dom_cntl,
     .adjust_affinity= csched2_aff_cntl,
+#ifdef CONFIG_SYSCTL
     .adjust_global  = csched2_sys_cntl,
+#endif
 
     .pick_resource  = csched2_res_pick,
     .migrate        = csched2_unit_migrate,
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index c0e7c96d24..d6884550cd 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -356,8 +356,10 @@ struct scheduler {
                                     struct sched_unit *unit,
                                     const struct cpumask *hard,
                                     const struct cpumask *soft);
+#ifdef CONFIG_SYSCTL
     int          (*adjust_global)  (const struct scheduler *ops,
                                     struct xen_sysctl_scheduler_op *sc);
+#endif
     void         (*dump_settings)  (const struct scheduler *ops);
     void         (*dump_cpu_state) (const struct scheduler *ops, int cpu);
     void         (*move_timers)    (const struct scheduler *ops,
@@ -510,11 +512,13 @@ static inline int sched_adjust_dom(const struct scheduler *s, struct domain *d,
     return s->adjust ? s->adjust(s, d, op) : 0;
 }
 
+#ifdef CONFIG_SYSCTL
 static inline int sched_adjust_cpupool(const struct scheduler *s,
                                        struct xen_sysctl_scheduler_op *op)
 {
     return s->adjust_global ? s->adjust_global(s, op) : 0;
 }
+#endif
 
 static inline void sched_move_timers(const struct scheduler *s,
                                      struct sched_resource *sr)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 5ac99904c4..6e1789c314 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -57,7 +57,9 @@ struct xsm_ops {
     int (*domain_create)(struct domain *d, uint32_t ssidref);
     int (*getdomaininfo)(struct domain *d);
     int (*domctl_scheduler_op)(struct domain *d, int op);
+#ifdef CONFIG_SYSCTL
     int (*sysctl_scheduler_op)(int op);
+#endif
     int (*set_target)(struct domain *d, struct domain *e);
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
     int (*sysctl)(int cmd);
@@ -244,10 +246,12 @@ static inline int xsm_domctl_scheduler_op(
     return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
 
+#ifdef CONFIG_SYSCTL
 static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 {
     return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
 }
+#endif
 
 static inline int xsm_set_target(
     xsm_default_t def, struct domain *d, struct domain *e)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index d46413ad8c..8d44f5bfb6 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -19,7 +19,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
+#ifdef CONFIG_SYSCTL
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
+#endif
     .set_target                    = xsm_set_target,
     .domctl                        = xsm_domctl,
 #ifdef CONFIG_SYSCTL
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 45c12aa662..a7cb33a718 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -626,6 +626,7 @@ static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl_scheduler_op(int op)
 {
     switch ( op )
@@ -640,6 +641,7 @@ static int cf_check flask_sysctl_scheduler_op(int op)
         return avc_unknown_permission("sysctl_scheduler_op", op);
     }
 }
+#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_set_target(struct domain *d, struct domain *t)
 {
@@ -1887,7 +1889,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
     .domctl_scheduler_op = flask_domctl_scheduler_op,
+#ifdef CONFIG_SYSCTL
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
+#endif
     .set_target = flask_set_target,
     .domctl = flask_domctl,
 #ifdef CONFIG_SYSCTL
-- 
2.34.1


