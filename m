Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F7AAF8EE9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033196.1406657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcvM-0000IK-JV; Fri, 04 Jul 2025 09:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033196.1406657; Fri, 04 Jul 2025 09:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcvM-0000Fo-Fj; Fri, 04 Jul 2025 09:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1033196;
 Fri, 04 Jul 2025 09:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXcku-0007ek-GL
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2413::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9145de10-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:49 +0200 (CEST)
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by IA1PR12MB6233.namprd12.prod.outlook.com (2603:10b6:208:3e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Fri, 4 Jul
 2025 09:30:43 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::5b) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 09:30:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 09:30:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:40 -0500
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
X-Inumbo-ID: 9145de10-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AF3hxc6QHr+LpOyQqPJkm1R+DhDKB0hsRzlpCCW5snmkkdKg4yE8oDPDYVk9X618pSDcrvSO5ZOvQdyOfL+1gIQTosMK+5iXHEsY2ZfysqcDM/ugvuPeYqL84lj2QR+gPqt10JGS1HQmz1jXIhKtboD/V5wAr9w7O5OQzppXFYn66uy2cP9RlWa1FG6cpgR8B8jKdEF3w6W5RvKV7A019zajVniU75h4RValuvH4+Yv29CVZ2qeMofUfBJz8XBRe30UEr8mXkhIl+hWm6C+6jHl9bVG/yN2LePzsc6RXJ4kA4nTjTaMDG6UahKearNOqb6/spJtzak+up84fBv71OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvykzEStZK73rMFsbUxdbGQm1JqJFz8VY0tKPFQ221s=;
 b=Y65Ai0ZcZc1TA2fQRT4EYc8dSGUkc8QX26Q963ZZi3RoaY+KVjFX5Pejsj/4W0IwDEr36YWTBgwT34updcLR5FpJ885tnFI5AcyizNWaK45ijqU6LCDADwvDC+F1aLqnXE+uEp/NguNyN70UTgOT585UhokGVdo7bwUeTgP80QgRF6r24cDgkznhNowbyC/BFTw6SWJIiiZtPhI4IgvQ5nEkIxF0+iX/ae/npwaWhQuXtPX9tZvwCFtZhflBcmXAvfom9uqfkrto5+D4x/i+tJARq6/c4Rc1hY2iFC4fvibYQWe1oe4ieAfg96us2j/WgMsZ5Y7lGOMD5DamOPk1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvykzEStZK73rMFsbUxdbGQm1JqJFz8VY0tKPFQ221s=;
 b=HwyZNlbsYZeHKXAimwYS23nWRhCMHaFxlQ3MDq2SK4aSwI90nuX3EU9MSm57/oLhl6JanKTA0WPM9gOs7UFheaXbS1jhvGS5JzIJRw4IdZva8OG51kVyAH7xSktQ0q948Zl1SvM/vBxozTJ09zt8LDbtuRiW18N8V1rWV7LLIEA=
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
Subject: [PATCH v6 12/18] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
Date: Fri, 4 Jul 2025 17:29:46 +0800
Message-ID: <20250704092952.822578-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|IA1PR12MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 10446184-5f46-424d-a4a1-08ddbadd72f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BhJ6PBbVFXHuRXzGSSdZ1xxxSIjYe/JjFoWM7P29SMEkowGWEDTLk/UoJlWQ?=
 =?us-ascii?Q?A3/al/X5AMpc52bZAp9R8nYxfufwHayskrCqwYNEAg3x8GIDqOvd2NbODaMM?=
 =?us-ascii?Q?o83VGkD+o9NB9vtF7o77+OobeASEWPYicugNN5bAdjDcOgekdprmZQsGZ2I+?=
 =?us-ascii?Q?BQS4x0eOMAY0sHfdY/nNoBndLzhOUoVEyiFxLa0tthe6Z5gPlpXRgClTqarB?=
 =?us-ascii?Q?Xeolz2ywZ66uR/K8UKKbtQGzn3qxGndQA4UNRUFHf9yveDuDCsnzbP+izqrE?=
 =?us-ascii?Q?awVmEIR9qpOMi/SpYz1NMg0wsBKeVyTBxeY4XbAcdmPFSHtkwVHf6ZnaBlZl?=
 =?us-ascii?Q?ZU4HDJr1rxMs1M6sZdlGG4o+SboWD8PDqsr/B5uLMpcHKIn7rfIOe9ICDUWT?=
 =?us-ascii?Q?RI7Dpi6jIEHrguYMvXODcA23wNp2sPe9jA/E71cRLfHQt/GTG3Toe9E2ApZR?=
 =?us-ascii?Q?OmDz4HbPrMVJZvOKG9XEYhE2h0e/r3jrevyLrehbNcgtnS0df/QlmDY0EPfG?=
 =?us-ascii?Q?j03rY1/cG6hpJLgYaKhILE3aOK4Rr8KgJhEvTnMeYztCp9pMfaeo90exuQkU?=
 =?us-ascii?Q?iDXoS1+LuX+QAH4w0cv2pvuDZRFv8C4PiRW9laaCtxppG+Jz0mAxjr0q9O+r?=
 =?us-ascii?Q?ioMyD/uQuZBYpvZcntM5eTYYJVfUisa5s1qHcJ0E9ID0peBd5UXUHGSkX/6I?=
 =?us-ascii?Q?6Z+XwPwORpQKyTEirTR20sRORzQB5FR16jE+uz+RZkJO26HXxLdCTjo7Eu+Q?=
 =?us-ascii?Q?kaIrWwd/qMTMIHyKGhT4hPmzP8xrHxsBrAoGQ+mQJG69kmmH7aHAFcskHCKp?=
 =?us-ascii?Q?X4DJUYqW5vPzgo9t+17G2Bhxm1zdu6fcmWXWHSXigXuX25/gnOFb2bk5fhtz?=
 =?us-ascii?Q?BpkxxZzetpkRshVqGSydRlh3iKwPShPP278QudzH4fCIBtZxk3gb6azXXfVV?=
 =?us-ascii?Q?/zT5vo5ZIgqwVBja/bBZ3V4uRzb0BdkeVDLxolEhtT4Z/qImc9ousv7xNP18?=
 =?us-ascii?Q?8R3KhStRzhQa/2ud8xwM/IbvtlroYiXO6svhOvknMyNsRn3OhmHCJe9mqxOj?=
 =?us-ascii?Q?y03K2bcO+s/abxttABbBGjRt1f0xOn9OOo2buRW6vHRh72IvsJ6/ahWznIVv?=
 =?us-ascii?Q?5s0+e4PiirEzW+n5bQpQJu3iD7QHlmh1QMJ0J6J/zl+OTcktYcdRsKJkvph5?=
 =?us-ascii?Q?XavqfaaP8cy45yZQ4qbf90EudaDOn6R+EX3d/eKs6omGwoMHQtdSmIVZcUW2?=
 =?us-ascii?Q?DuLnr+OwftvE1cR81wgs6ttf9kJVrCq9Tvhm63dKkNaQlqG1p8/MKb3PhD5X?=
 =?us-ascii?Q?O3aYh/6FCimNwJiZGiwTCxdEy6rmHcNysXkvIeHMzmwq+yVX2RxSxJ6zGU6Q?=
 =?us-ascii?Q?JS63PPTKNHFgG+t+/uyTdxJtAK3npmQYtmqm0RSkHPit9rQIMTOnhgEDMMFG?=
 =?us-ascii?Q?y83ljqDfXPyEkkSltqRnG1EgS6+gl5Q1s04YlWAwjnaIYqxbCy1QgKQoUquX?=
 =?us-ascii?Q?5jG6uAVbZgCwIIK0+LcEhJipRlaUFq9zZXwA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:43.4441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10446184-5f46-424d-a4a1-08ddbadd72f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6233

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


