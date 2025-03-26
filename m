Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CAA7104B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927116.1329929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpM-00083D-PP; Wed, 26 Mar 2025 06:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927116.1329929; Wed, 26 Mar 2025 06:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpM-00081S-Kd; Wed, 26 Mar 2025 06:01:24 +0000
Received: by outflank-mailman (input) for mailman id 927116;
 Wed, 26 Mar 2025 06:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJiH-00083W-E2
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:54:05 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20604.outbound.protection.outlook.com
 [2a01:111:f403:2409::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b752411f-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:54:02 +0100 (CET)
Received: from SJ0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:a03:3a0::15)
 by SJ2PR12MB8807.namprd12.prod.outlook.com (2603:10b6:a03:4d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:53:57 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::60) by SJ0PR03CA0250.outlook.office365.com
 (2603:10b6:a03:3a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:57 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:53 -0500
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
X-Inumbo-ID: b752411f-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9reRpswixc0cYrpuennlhWqK6B+mn3lsQ0u0HpbxKY5dAkBGz1Bbj1LY5RYTABVfmQIqcO3fqwOWov60lGcciL/Xsov0uOt4fZ78fetzhwxbsK14VEDSliylxNKbXwndVZBQzNI5gVEOBEwPZXFEExUJKhhP6CvQHwA11YtEs1YhejbytmwNCGDx7V1mFRqbdGmvlwAW2BkMLyNAQaRRpl5evtj4AriecmVcxJv1IvAaVgiYfPR3AxnXK/k8tNrwPsYAwVO1ZifOx4es/ZtQzRSIXoizCTYHFvVw/oZPY9VCK2s11ieTzEfnphO+RmBuRo72Oe0SK/ezpsCstzRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzC/yz+Ds98yo0OWn9IJxBc4W+0P684qKIJK4XoV/AA=;
 b=SM1MVrb75cvza9UyPq/8+p6IWludXgKsQ+Vtb9Vh8yxP0upDwbd+IIBG5rZFhy5AGM22qL98GH2+i0NU2r/SfTkqJAL7OOfYaPGCqZImE+bEa7yxXzCspBbfvsxQt7/KhUcs0Z5ywqCB0ZWx2WWgIOtJ5xcD2ah0+5EdnCxTL1GQ+784hTvWdls31dhD4015zfS9atRxizBIz0W//IqrCP3MeKnRquZSbzOFXHA5d+8kgTrQqm1qcWzTK6knv71f+hp+A8NRRETa3RB2VPtNSYGU2w3ChmiRKWRCfURVvmfhoZvmhM4yO1/qU/IiH5e//REl77zpRCAN5Wvqp+yMRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzC/yz+Ds98yo0OWn9IJxBc4W+0P684qKIJK4XoV/AA=;
 b=AvPjR8i4hy29UyaXFGXeud24arFig53LkB/kRvHuATlgvrjhNgUKg2hmkIhWRwIxaAbbL32L8cwysYNza/DdN2GVIw+OXF4nQPJRD4NFAUS0OubQU5PhiIH9rJ8ilWVyilmyK8EOSbBnrEiuoNWozltbPrbv1Js35V7daqL6d98=
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
Subject: [PATCH v2 13/19] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
Date: Wed, 26 Mar 2025 13:50:47 +0800
Message-ID: <20250326055053.3313146-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SJ2PR12MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cef2f9-f7a1-402c-9d9d-08dd6c2a9984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+rDfqH2yXU0EDUQ7oaUne+sZ91tWuzbAkwculGy9CPoTipPZ1JXQMlkE7pU8?=
 =?us-ascii?Q?SW9UIcflmTG6VwMUEg+M4y+wj3m9EyJMu+17Wm1ECbzG/OCkCV8l+Osg4wYA?=
 =?us-ascii?Q?55JzCgfZ9PoPrMDlvN1cwwkA0Y9vNTGLjDqPc9RKaE//zhXmKf1H3I1Kl1IW?=
 =?us-ascii?Q?VXwi1QclSBa8Rq2rlZUHwaFP6pNluyrvS6+jof2mOEmwqgTmRcE11qhFAhnU?=
 =?us-ascii?Q?ScXjOcKINobjmu0GI8tBGCr/8RkeqdqBj+mQOMZdBxAv9LL3g8J4Q8mWJAAR?=
 =?us-ascii?Q?eX5fr3+bphxSAtz4EKhXpUov3eQWaCV+nYYwHQyfHa+raqnIC/JLt35zRYVk?=
 =?us-ascii?Q?c6iNC4CgQDjWssNYbTuOLqOjfwldQRNGNSAdPhAxnk4wNZQMC6mql6dpK2jn?=
 =?us-ascii?Q?4paW26H9joee6wWumFW+W1J+I3QCtp4r6Ya0z/8RXqS6cvJ9A/lWL9YnLclb?=
 =?us-ascii?Q?BwJhYFB4rtV7TuPh5eOXtdL8DfAnC/7fnfgTcNz0KtaBz71yzAN/1OMXtoSH?=
 =?us-ascii?Q?qmeMrRub/Z8uAmieH1fS0YucWRoObQXAEynq52Lk3QtLhkMZCrQ8n4fnjGWO?=
 =?us-ascii?Q?G3a8xLxYZ7vuz5KF3j5W2bpY4aUq/M/HniduyjSgjfICC14xP09hx0aLltzi?=
 =?us-ascii?Q?5Cw+DjhUSuKJKxFN3AT4H8L+JPdPv4CQYOixm6gPX/Y+BcLiOYmveMKH6wKG?=
 =?us-ascii?Q?9vRdsBsLq0Mu7foMUPQwq1HeRPram20RY2xp9fmIUKp6tKMXKjSYW027vCEU?=
 =?us-ascii?Q?oGEt6DK9th7W41cx+5UbgOONd1eCkIwcbaP91y+sH/+sZ3J3RPiZX+/cbiY1?=
 =?us-ascii?Q?kVCBTREQU4AHbhl2m/iGqNHk1VerPbvDq7Uw18EgHHIdls+20BUii3ZNVKe2?=
 =?us-ascii?Q?/O5Cb4tXSkiLzQGmnAJKa7xxj0q/tQ2aZRkmDHpjcpUDR7sywYzgQv/eaAbJ?=
 =?us-ascii?Q?bzdnPGruVjUDSx1ArSwMvjlhq/n49ay0o4YG8pllFGbnDixLcqznPFymZek0?=
 =?us-ascii?Q?ivQ/CQgG8geJWbTI6VP6E8As0bpM4KZELHEcsK9IM/KQk4c+O4TAB0MWYbvV?=
 =?us-ascii?Q?OdGzI6ZQvi6/zPOuA6wLPHiYWSzTUsm3J7Jc/zQeD8ARjvnmksuAUJbfDYHu?=
 =?us-ascii?Q?EU+lRgOzlKCmz40ywYe+vwa8pIz1YRrfcxYwoDMEeittw0pRMpfX8JvZjx/u?=
 =?us-ascii?Q?OESmbxIYmMAyQepBZ0wFNyWqkuh7vuHmvOysdw1WW9wZnXtZkLHeUGaotZLn?=
 =?us-ascii?Q?tA30499EGKV1+WQoy6cVS/UrLPudW8W85xO6w32kvBM3SX0MAKW3tlGK9SZ7?=
 =?us-ascii?Q?CwI6UWxJv81cwTYjFxN+01eVfFjXkRzw/pHZCGotJl2fkaRvMW/uwufzqhK2?=
 =?us-ascii?Q?5ZD/2xMTHftDZjVMW/IuICg2urmPNUZHY+DZ11WDpr7h2LLbFrJfY74uamvd?=
 =?us-ascii?Q?qaIxxV1fQFbrTHaPUo7v478UnfQtve5oBOfEYYVN7VGWfLOd4m05eMfYqpiD?=
 =?us-ascii?Q?ilxsDeMo5iD5Qtk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:57.5103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cef2f9-f7a1-402c-9d9d-08dd6c2a9984
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8807

Function sched_adjust_global is designed for XEN_SYSCTL_scheduler_op, so
itself and its calling flow, like .adjust_global, shall all be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- no need to wrap declarations
- add transient #ifdef in sysctl.c for correct compilation
---
 xen/common/sched/arinc653.c | 6 ++++++
 xen/common/sched/core.c     | 2 ++
 xen/common/sched/credit.c   | 4 ++++
 xen/common/sched/credit2.c  | 4 ++++
 xen/common/sched/private.h  | 4 ++++
 xen/common/sysctl.c         | 2 +-
 xen/include/xsm/xsm.h       | 4 ++++
 xen/xsm/dummy.c             | 2 ++
 xen/xsm/flask/hooks.c       | 4 ++++
 9 files changed, 31 insertions(+), 1 deletion(-)

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
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 0292233c7e..ccce7fe963 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -254,11 +254,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = cpupool_do_sysctl(&op->u.cpupool_op);
         break;
 
-#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_scheduler_op:
         ret = sched_adjust_global(&op->u.scheduler_op);
         break;
 
+#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_physinfo:
     {
         struct xen_sysctl_physinfo *pi = &op->u.physinfo;
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
index 39f8331207..64c9531346 100644
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


