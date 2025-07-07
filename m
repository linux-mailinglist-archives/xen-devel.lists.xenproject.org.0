Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5732AFAA13
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035082.1407348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJU-0001L1-Te; Mon, 07 Jul 2025 03:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035082.1407348; Mon, 07 Jul 2025 03:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJU-0001FX-OQ; Mon, 07 Jul 2025 03:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1035082;
 Mon, 07 Jul 2025 03:14:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJT-0007KZ-0q
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:39 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20621.outbound.protection.outlook.com
 [2a01:111:f403:2405::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8352951b-5ae0-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 05:14:38 +0200 (CEST)
Received: from BYAPR06CA0040.namprd06.prod.outlook.com (2603:10b6:a03:14b::17)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.32; Mon, 7 Jul
 2025 03:14:30 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::78) by BYAPR06CA0040.outlook.office365.com
 (2603:10b6:a03:14b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Mon, 7 Jul 2025 03:14:29 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:26 -0500
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
X-Inumbo-ID: 8352951b-5ae0-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWO0E0tU4LgHOUnfAPciAueaR9TyZAELQkAJ/kGhkbevhsCVugWTDSL4eOaY2MneDF1JdMuBlAfQJugdCsKj1Rrg8oP8s/dfWnzYAWmoJhuW0LfD3JYIf66E50GM2KeJydNQCWutysr8uhlTrlNx6FfkifhTL7qrvSawC3aOksbzn7CjPwlMNPRZXUsXXMOyuEXa+XL/QpN+Jt3tiF5KXG/qWeS86zat+BrK4KLn9tiznObOqkUaqE0g5YubynroExDOpfK3C6f+m+3RF3qx21hjE9YcaTyNfVemF6bPVXFU/o/9q7EF+qRwOEZhzqwO81/5O29rTcZPdRXvtzhyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvykzEStZK73rMFsbUxdbGQm1JqJFz8VY0tKPFQ221s=;
 b=qX6IVQKmj4hZgAFIRy8PpAr7XWx8SLQba7LrLliCw/wEXqIvKk/N2kLD315Kpqa0DaED3KSllZ+O29Is6rf4XWlmCUXh4fnO69FfZDrN5kZa7oqMOkX7XP6UYojrKIy+33r56guMiVryL5SpRmH3k6a19/OCyBMcs63HrVDv9urvWBYhd7ABOP6BXCS6FmDAvyAFN1mgjax6QLVqRTl487A2D5bV9S3v5L1Tn1/UWv39UnmuMXPJNZh/qL/gfk/PqvqJfrjs/6Q/7iC9+YwwMrd1a5D3pGgGwP0o9eQpDBEuXklzriY71VQz1bIj7NniITlqMcW1YM1qBW6av9cAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvykzEStZK73rMFsbUxdbGQm1JqJFz8VY0tKPFQ221s=;
 b=PZscWKuk7IqxyHh4IDBgjQpFti+N2vpwzcz1amunhAeGgbdwY+Cm5op7FJCYtmce5FOFRUgGSsDQI7wXsjYk2dQBfBFpDLkyjyMR7t3VoUk6ttveksow6g+SLSsgFvp9Deuw8rfS/0vwV4/pZac5AxoZ8kLDfXlo0DMAcwoYTzI=
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
Subject: [PATCH 08/11] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
Date: Mon, 7 Jul 2025 11:13:43 +0800
Message-ID: <20250707031346.901567-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5a1d2b-3f74-4ecb-5fd2-08ddbd04633c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nbl+Ju2eNlIAbm2wrgeMcxCuhptr4sFo/7+ukgSaixBnu6Oox3TJ+nai8Sds?=
 =?us-ascii?Q?Kk+MSy86cj/CP5OiRIS2gYUQrVHV4sW7GepUczHfhnQqGovXNXhAQXCG58HP?=
 =?us-ascii?Q?sO2UY682zp4PkbksIjKvCRoqm8J5e5oU1ygnbJ71YPE2p4Ffjrk2JG33IZHp?=
 =?us-ascii?Q?ifXjXPLd9Ko/1NMGKY0XkY4U9UZ7p7U7PHThk6EzjZrFbogplHgHQ7PUoTuD?=
 =?us-ascii?Q?Ar0npAcHbw851u/U3hvE3TFIcKX7EkXsBEjcwiW2lKHeX3n3HytpJWqnaT5w?=
 =?us-ascii?Q?HdRYqSr2sm7u75f2ouASAbac4JUIxQT08sKgMP8u9IVvEF/8akHWRv+CPteT?=
 =?us-ascii?Q?D8JkIl+VCR4mEVPZP+aEWA5eYpNBi8vUlvfRHKUGHLntXLHNyNrWpWE5lq0S?=
 =?us-ascii?Q?L1N1/nPs682kGuijUyxdtMfxW2mRZjzf/AmgHMmDnVKBHsAeswjEJhpWYYoi?=
 =?us-ascii?Q?+d5hmu9aoLiw7UY7G5cGULFwoYqpmwxSy5FIgN/f07fIOzcNBNQrfHIwtKm6?=
 =?us-ascii?Q?EY7u7On0P9dOnvAukf9B0kg/2sPWxjAcnfzN+5QzHMEEUW9fs7YXnDa5zdpz?=
 =?us-ascii?Q?2luoXe0jKYa3/AKEJqLOFnrlTXGaLLUNeDYAOTiV8ETaMUwDgj2y9kbYbDaX?=
 =?us-ascii?Q?+mVOTofxnGdk6xTeA1rI6KLuCmVugKgngm1IK40qaBwegZUa6oKZXfan+0uv?=
 =?us-ascii?Q?cQqOn7kfJQGiviBEy1EXDrB5kdOOGkM8mIFHG9o35QAKdFzgmD/3dnIy/l1a?=
 =?us-ascii?Q?qNcuQBAoTJ+5a4Sp+CKUfzA8zMzfKQllM6igC3FryiQqCWol07Wn/NOOVU6Z?=
 =?us-ascii?Q?w1F6Lq6bkYIpg9//szbwRqpsFTla4XJZo200zalBu95BoKLOWglhvQZew7dJ?=
 =?us-ascii?Q?wvd9dkdpCIDIjbCA3l4xEMTPrmJqpoqcFAeeIyupf/H2e/LtqPLDn1/qdM2N?=
 =?us-ascii?Q?HqZF5nVeGLm1bU5Ew2jNbHLUZMp0Znzua5WhEIQpSqh5hh0PlLQYWHcVbFbU?=
 =?us-ascii?Q?CyJ+13Lnd+kaQNgNmgY2rQz5QFex6OtPwUnPo7dpHcC9ynyV4W+B0R7YwZE5?=
 =?us-ascii?Q?+sMoXzyBOB2z2t4Vn7rYOtzVCkgxmB41laVONY0TDwcSzZz7p7n80VBO/4HM?=
 =?us-ascii?Q?zvKqhlMCILXQGqi4oxxJH2sKSfw1fLgzGggb24l2saEdr86EC5DRZbVEitva?=
 =?us-ascii?Q?fUf9gpiOJdStUalK5jty8oQnXgDx9l1Yjp0M+yQT9rMwdkDgFdK3T0LfmZJ4?=
 =?us-ascii?Q?V0IlHUHuPxqs1P4cr1C60k3Fx+tUsoom+GazC+rkzrahXrcMSqp/YGl28+x2?=
 =?us-ascii?Q?/WavOzEt0ZNgtT1YVJpzFZcj/+5x+vKX3XnIvz9BIOU8dnz8WHJ9mqLXoz/x?=
 =?us-ascii?Q?H0Z32VpjuSB61ouLjOXvg8xAQX8zaHACAsCYcgIbDcnb2Qy9X3zrzz/32o20?=
 =?us-ascii?Q?z6tdKQ9drYnrG4ylwleS+tuPxd81L7nYEpkOpJ89tapjT/ScErLJgQp/VEGJ?=
 =?us-ascii?Q?VRW/skaQrFMWhG5X5N2VLNq82IaQqYxfeW74?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:29.7559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5a1d2b-3f74-4ecb-5fd2-08ddbd04633c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678

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


