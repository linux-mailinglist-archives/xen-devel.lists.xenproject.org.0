Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3EA94D68
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961156.1352775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmb-0004q7-Jj; Mon, 21 Apr 2025 07:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961156.1352775; Mon, 21 Apr 2025 07:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmb-0004lS-Go; Mon, 21 Apr 2025 07:41:37 +0000
Received: by outflank-mailman (input) for mailman id 961156;
 Mon, 21 Apr 2025 07:41:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljd-0000OX-Dj
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2418::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ee24299-1e83-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 09:38:31 +0200 (CEST)
Received: from BN9PR03CA0143.namprd03.prod.outlook.com (2603:10b6:408:fe::28)
 by PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Mon, 21 Apr
 2025 07:38:26 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::2c) by BN9PR03CA0143.outlook.office365.com
 (2603:10b6:408:fe::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 07:38:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:21 -0500
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
X-Inumbo-ID: 9ee24299-1e83-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwQ9xzclX4vF9jvj5AFE9y1IBDQMGvqbzCpnZD1B9qjj+QeL2Syw2tXIn/b/3cAFQKo+Oap5NAdJgU6YcEFsuQNnkYieHHiQimD0I1Msi1vXawjN7C9ZZA5R0xh4KWyXsManwANlXTL6yiadUuPTwYmBc1PoNxfP3jLTTdH+WBKfe4PMHwBEHWX93Kb3u5J0NGnpyL2I8tgvoTQgK7v4M5TAdzrVo5GmKjDx3K/9NIYjwZEk0JDl85yDvRSXRXYF1pOm1kHL4l9Z5uiNqxrDyGIXVjPizXKdX7T69Yg59+GASb9gXg4m4CEujSRQWodfueTU2hpHNTXXiKJfYQXM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=811326h7nGKhsNQgjbJxWI8WN5I8IcZyj59CDFQhkag=;
 b=vSb0RaKl3CIGzr97Z7guqenMOBIK0/nlLSCagwJRzXi0qkm8Ek8ZwIhNmnRM66mD06sClvRkmsT8P/zFl+1b2LdLUNdhXpfQKd+gOkGDK3uq04erk/jdgkEDg8fqwMbPCcXys/9VHZh2rEFJhRNI8By5h/eG8Orsny5Mbb/NSR+G7VQ2/Mm7bvkwheqbOyk1bwSruOCGmWAsF+yWe2kMMcA5O7r3qsKn2L6SLVyIDQxYBH8LmKY5O0Z9Y18COPw83ENXckEuIRi02Sd4jFeUiNlPXnK4fTXvNUCcC2SLscUkn6hwfnop0m3Phn+YRKwDX8OZXmW889t+Y/ulQkrDCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=811326h7nGKhsNQgjbJxWI8WN5I8IcZyj59CDFQhkag=;
 b=FYNl2+Jc2gAP3z4qRy71AULOkcmUPgrEc1Ifa6xRtlQxshQpD7sRtQpmWRqFjTIbWY9qDnIXPH1zdcX8KleMJEAos/YxQAH5BSYYO6ifSZcxYMJZ4FkqZPNKftWj+gi4h2JJKti9rF2VI2bsh1WcIBiS5dm8XlqGaoHAU5dbaVo=
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
Subject: [PATCH v3 14/20] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
Date: Mon, 21 Apr 2025 15:37:17 +0800
Message-ID: <20250421073723.3863060-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|PH8PR12MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb1ceb0-c800-4312-52ad-08dd80a78038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?svymLQ7buClLqDCbDIm485GSbAljCxCQuAuKblV62k5OevxAiMzKK4IanFLf?=
 =?us-ascii?Q?01gMoGcmiR72SeU9J7bCMpW5/69bV1J4arumPu8TxbN6qKMbIUgdBIMoXe8q?=
 =?us-ascii?Q?iKBMQBKS9WiQgRscQfoGKcAqoEcL+WB7m4Snr5j5MlV0aCDGHsooGpb1xcnd?=
 =?us-ascii?Q?SdHNN8GGH5Kxs1prCAaBkzs5N5DOS7qAlY3Zhe8OXED4csYya3/CXLGhww1d?=
 =?us-ascii?Q?ECzNm0DYX46RGJ8WlQhfyEfXskBBckgSdvLVOVY9gQG0OiIpVXsW3VV0zqN4?=
 =?us-ascii?Q?+rufXbs8Tj+7+lk5YG7nRI2/0Ql9X1rpdU51hNv0ihvLEga1tPb8mHAMnHrf?=
 =?us-ascii?Q?fwzB7n5a5UxTxL13GmjoXafzms6ShNqKnQ8/Ljb9/qDTnpR0xAhmP5N0PUey?=
 =?us-ascii?Q?ITIWSSmD4bY3lwbWhjRR/Gs8oRXASzDO+bNpO1QJY24S4gRt8dWSTieArKQU?=
 =?us-ascii?Q?h2smv7jToY9HRgpuYX6BnZ8jXgjqqC2W7gvkoF/POfaGefksGIN8ZRPHrphw?=
 =?us-ascii?Q?28HjK7TzU3pKOxl5fYqnCkuLhzDEPew4n/uHqecCBYQw8ZoTw3na2/hYh9lf?=
 =?us-ascii?Q?TWesn5Jh+/T4tlHQRm12bWbQ59OCnsN4lqQw8hkfmVv1EUZf3lD4wsACi22n?=
 =?us-ascii?Q?xqUFrxmB1vu6IOAFj2NshGXFgeozuEm2j4vsYFT40s8njucMLEHo3dvp30Do?=
 =?us-ascii?Q?xr3aFBR5qcNDq0Z2uwvVOOAtSEKPFcbOyiSYSh7rF5VdMOv/UuVgbFW0KYI2?=
 =?us-ascii?Q?zdYCWx08ZmWv+/dQCPOiPegicIs7xARtfq+fD+8+VN3Kvr5zNIAPfq/7sh0n?=
 =?us-ascii?Q?9YXoqkfHgOEqLPshEKKf7+C1VWcT82ssJFWj0HWZ55aRvCf4hpzNfV1vqSJA?=
 =?us-ascii?Q?MxDeO2VmboNbef2AQV9JUabD9Z49MXlfcs6HnvR12xHjJyKLEG3gisRHF8RL?=
 =?us-ascii?Q?KbVaKDYqOwaryZ3Io4947sQENGlH+vl6xMbIaWbdTXvmD5rdRQp0NdzRjFBD?=
 =?us-ascii?Q?hiE3wGOBNEdkel17cOuKgJB9pJ7i+LZ5tJRI/8HDinaGTUoz4En5QhuP4qcl?=
 =?us-ascii?Q?P+zpP4diYkapJRzRpN0H5BCqWQlQM8HrJpF7YwckoJyy5nkx7oMc9CyGdj6E?=
 =?us-ascii?Q?Rnw1KIKJkybDfMzqscpyJea6NUaST7OIuHnmgJIMEjkM7D0yq9HyizIXKvtA?=
 =?us-ascii?Q?oDW4rjaNfNZP1bMOslYstqqifSW6JD1WwG02t4V49T/WzKCdUhC95PO4SUb2?=
 =?us-ascii?Q?sYWKtRZcLwL04lpbcC9JSov4h13P3vTS8N3s+zPY3lHiGtBI8ZK01Kexgvoi?=
 =?us-ascii?Q?0vALjaK1U8EWcdOpUqlbEfP5Xsu+RjkuMRCJZEQvVKcp3zlnTW+qfo9ySmFd?=
 =?us-ascii?Q?bsiyc+G/9uHoe0c5eHqmNeCQ8ypdQM795QMcTwpePI1vX+m6M9TalPhuqeMY?=
 =?us-ascii?Q?RWWnrnY2I/0Yezym5obwgjQLXhatGo+dzGKaCNNRjnOZ/fIEZHg3+6P8pfVh?=
 =?us-ascii?Q?webGJdc9f+gKJHEg6guHgpn/fpwSvos65aAJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:25.5123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb1ceb0-c800-4312-52ad-08dd80a78038
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841

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
v2 -> v3
- move #endif up ahead of the blank line
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
index 767e0b7389..200e0a0488 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -256,11 +256,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     case XEN_SYSCTL_cpupool_op:
         ret = cpupool_do_sysctl(&op->u.cpupool_op);
         break;
-#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_scheduler_op:
         ret = sched_adjust_global(&op->u.scheduler_op);
         break;
+#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_physinfo:
     {
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


