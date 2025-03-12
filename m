Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E5A5D506
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909823.1316753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQq-0000eR-33; Wed, 12 Mar 2025 04:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909823.1316753; Wed, 12 Mar 2025 04:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQp-0000Z6-R8; Wed, 12 Mar 2025 04:10:59 +0000
Received: by outflank-mailman (input) for mailman id 909823;
 Wed, 12 Mar 2025 04:10:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNf-0007Fd-Mc
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2413::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 895300db-fef7-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:07:39 +0100 (CET)
Received: from BN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:408:e4::21)
 by CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 04:07:34 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::26) by BN0PR02CA0016.outlook.office365.com
 (2603:10b6:408:e4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.26 via Frontend Transport; Wed,
 12 Mar 2025 04:07:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:33 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:29 -0500
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
X-Inumbo-ID: 895300db-fef7-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQYWArfpJTBg1X/27/wYBzBce5ohn/7ZuFohpOq7FUb8qcvGOuUxM6NzdYv8adWGyhEDm2+3dMqsWNSrwYK/BYCCD5NRwIHwjvJu8Dp/7aQ0RFl2BKY+NgxS/Ktuxdp+oytQbXKwSRuVpuJOuh3BcEpVf4TMjnVOVwlCKSh1qSHTQLVseB7r/Ji8tFnf37wAsYyOxaqqB5NemMVfjxLD7rFXvYUG8v+xQATgntWmb0oLbC04moFbYxFL6acEFSdNUdP013L/jklOqZTbSHNnkKYwgugqPItdK0/AYrTPGKg4zQa8/imWF3cUwTKbvy0QUmoHdSf7ioBqHXhCgJ4Kqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kpH7rONbEBds+fqwFkAgmEf3lzGijaWyU1/HQRi1kg=;
 b=adz5D4NLzsPZkdlb9z8h969ZaNu5GVeqNB39DQuhZg2l6CLCYQYWyJ9w3rLPaOWtRh7iAT/uKvVPNmTLNFaOz2zoaybgpcfqTReGg8TUq0Tk1WByK/aYkW99LoyLDdJwJ0THJTH+o8RQQkm3cxcbu2b+ftVpd0C0XBoecGE17ym3MDFERIDdeOBO7HQ9tXsFN8KEnCxoLMgBywpXeTyxDjH9lGxuO7gHiJE6xJBzXCf46k7mFOB2dcaY8P+e5O0Q7toS8JdfNFcqK87Kdla8TslEkifYDV5u5NvWPuyf/5uaUfAutAEnIpej0rjSMuUDHj1FY/P4BgPhzJp5Y7TZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kpH7rONbEBds+fqwFkAgmEf3lzGijaWyU1/HQRi1kg=;
 b=T7TZ37AxfUaauQYYZAOA6MWbU5QQsWHn7LUuZ9oBOmnoUTuaLH/aik/0LfZo8V5n3ZUvpReN/eYqR8a+cpWdyPZ0RL/9zP4RnAi8QLd7bmknMy5Z//UrWDS6m9j55STGpcQePlDQi4petzu0gNIP51+py7zspnpBJdh/O7gkJCc=
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
 Dunlap <gwd@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Anthony PERARD" <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 13/19] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
Date: Wed, 12 Mar 2025 12:06:26 +0800
Message-ID: <20250312040632.2853485-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 5399652e-75bb-4cc1-f469-08dd611b6a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3++G+noAwEwTxnJmKd3dQqQ+GzvqBDeO/RuKk7VxhDWeR6OqB23IVxLK868G?=
 =?us-ascii?Q?3ckEbNuRCwY3bnKsujqjN66zXvK7prWvITwlB0lDNHNumjjuo071bltYppMB?=
 =?us-ascii?Q?X9j2Y0oyMBrXFTs3bcwjeZ6iuwhg4cdiARxoFFgF+yK9CJAX3cP++nBzfotT?=
 =?us-ascii?Q?w0Th94F7ih+JJ0oMhBrHSKgWFrU2iAgDIFcPgfrM4XzuXLLvbiNFwPy17iNv?=
 =?us-ascii?Q?N08rCrx3MMHEDXFvBqvTWUNZOS3LY7lt7udrZLW4TAbHQiusaps+wSaU4jyw?=
 =?us-ascii?Q?eXgtWmfobAT1kGkjv+6kYkqBw3lYd1/Slt0p2Nxh7BE7wqqIW3kYMvAWuYSI?=
 =?us-ascii?Q?OOXp1jCJv+6TrzEYFAeTo7N7jilyGHYqE3+4Ve4nicigngEd2GpRBeHbelnL?=
 =?us-ascii?Q?HFewa6CrDhlipktV3REhvyM/+rHSJQt15UphUwAf5FUIQb3h3IsucSJEwi8m?=
 =?us-ascii?Q?NAqybJO/g7Fsf+kkxs8QnZSVdhS6SWlXQoGPqlRsfYupcoGd08QXpFOn8GoR?=
 =?us-ascii?Q?ZBixEsEudppsNJ7l1y3dQ3Br8b00WkVE1bpFxIm0QubtvD6Am1R4T4gWWAxM?=
 =?us-ascii?Q?+1CFiquyGfZQ/fxrpEOgn40/iyeKLkhuamPZWULW2WEXXh0aTQiPW0rQNTl+?=
 =?us-ascii?Q?PhTVgdmk/Z1a8G3os0OxiTKszHuHptLwfy715JxEYQdVZQWkGtVjf+Kf4PLz?=
 =?us-ascii?Q?zD7j1j5xFrnwk5ZFn74cHBZ0TTkUC2fVjgQv/IKh0H+AmohhNEdUKK8ppQKl?=
 =?us-ascii?Q?9UrDnP8sb+SWZR57mCfXsaMMoxunovN9koYHCXL92LzTXHvZb5WjJ0pORgnP?=
 =?us-ascii?Q?Sm+ydZ9DFyQ9/FM/EiiXAdyzzc9qZJ+mfYHAQXdpgnDiO0j2SYy9XHZ5gxz4?=
 =?us-ascii?Q?n9PYjBCqvi2OuPM0mTCz8d0wSKmPF3I14nHPtIW5BGH9xAAXUBU0CyqUxM4Z?=
 =?us-ascii?Q?KDs8ye07rYg0ye/SMsgKREL7tG7K7aGhRc5dgZa9uzE0ePdPkSHL+b6FCj6I?=
 =?us-ascii?Q?0f5y4YOauHMhN+s6N/7Y6RYpws0etCnlngKSN5h38lOfrEp+LdYBjFbuR9vj?=
 =?us-ascii?Q?O58TZdl1wyLv20xqss/fwc2UROK+GooRPNypPR1bIOx2ot+mx1fL3BMtqh9R?=
 =?us-ascii?Q?oXh4KWxss3vN2fTyA/gUqkr3eaY09IDncf4Ylhu2rWpEh+95yAGbmWMs5018?=
 =?us-ascii?Q?Iilnb9XzHi9egk+oq/a21S7I5efOH4DewOc2099Kobd5GM1hIoMyJqCafs72?=
 =?us-ascii?Q?YI5aEmty+67ayoE55SBtY5BbhXsHynQbG7fRm2y2QTBX8oof1DaAPxc4gfi4?=
 =?us-ascii?Q?36lJh2AqEppTryytYTo3nXq3iCUStPXYd+G/dxnfemhnIU3zU/PeClTeiYsk?=
 =?us-ascii?Q?7yQ/tqhUcH6YBKFKZr2X9GUPaqb4VzGmVBMQ+vWtbBm1+tC4pvkdouYZNSOp?=
 =?us-ascii?Q?H14dIuPZKKrtSqWdIQ9PxVolVenVRWRkrsvyQQpSN7N30mTecNZtsq9DnBYx?=
 =?us-ascii?Q?AVuC3VVj557mCZA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:33.6298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5399652e-75bb-4cc1-f469-08dd611b6a96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243

Function sched_adjust_global is designed for XEN_SYSCTL_scheduler_op, so
itself and its calling flow, like .adjust_global, shall all be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/sched/arinc653.c | 6 ++++++
 xen/common/sched/core.c     | 2 ++
 xen/common/sched/credit.c   | 4 ++++
 xen/common/sched/credit2.c  | 4 ++++
 xen/common/sched/private.h  | 4 ++++
 xen/include/xen/sched.h     | 6 +++++-
 xen/include/xsm/dummy.h     | 2 ++
 xen/include/xsm/xsm.h       | 4 ++++
 xen/xsm/dummy.c             | 2 ++
 xen/xsm/flask/hooks.c       | 4 ++++
 10 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index a82c0d7314..3a2c349d38 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -214,6 +214,7 @@ static void update_schedule_units(const struct scheduler *ops)
                       SCHED_PRIV(ops)->schedule[i].unit_id);
 }
 
+#ifdef CONFIG_SYSCTL
 /**
  * This function is called by the adjust_global scheduler hook to put
  * in place a new ARINC653 schedule.
@@ -328,6 +329,7 @@ arinc653_sched_get(
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /**************************************************************************
  * Scheduler callback functions                                           *
@@ -648,6 +650,7 @@ a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &sr->_lock;
 }
 
+#ifdef CONFIG_SYSCTL
 /**
  * Xen scheduler callback function to perform a global (not domain-specific)
  * adjustment. It is used by the ARINC 653 scheduler to put in place a new
@@ -687,6 +690,7 @@ a653sched_adjust_global(const struct scheduler *ops,
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 /**
  * This structure defines our scheduler for Xen.
@@ -721,7 +725,9 @@ static const struct scheduler sched_arinc653_def = {
     .switch_sched   = a653_switch_sched,
 
     .adjust         = NULL,
+#ifdef CONFIG_SYSCTL
     .adjust_global  = a653sched_adjust_global,
+#endif
 
     .dump_settings  = NULL,
     .dump_cpu_state = NULL,
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index ea452d8b3e..e528909e5d 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2095,6 +2095,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 {
     struct cpupool *pool;
@@ -2123,6 +2124,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 
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
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ea81832c50..5a065b3624 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -848,10 +848,14 @@ void sched_destroy_vcpu(struct vcpu *v);
 int  sched_init_domain(struct domain *d, unsigned int poolid);
 void sched_destroy_domain(struct domain *d);
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op);
-long sched_adjust_global(struct xen_sysctl_scheduler_op *op);
 #ifdef CONFIG_SYSCTL
+long sched_adjust_global(struct xen_sysctl_scheduler_op *op);
 int  scheduler_id(void);
 #else
+static inline long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
+{
+    return -EOPNOTSUPP;
+}
 static inline int scheduler_id(void)
 {
     return -EOPNOTSUPP;
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 5f89fc98fc..826db1fc69 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -148,11 +148,13 @@ static XSM_INLINE int cf_check xsm_domctl_scheduler_op(
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_SYSCTL
 static XSM_INLINE int cf_check xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
+#endif
 
 static XSM_INLINE int cf_check xsm_set_target(
     XSM_DEFAULT_ARG struct domain *d, struct domain *e)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index d6f27aa977..d413a12897 100644
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
 #ifdef CONFIG_SYSCTL
@@ -246,10 +248,12 @@ static inline int xsm_domctl_scheduler_op(
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
index aa89ee5331..6270bef308 100644
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
index 9819cd407d..aefb7681cb 100644
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
+#endif
 
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


