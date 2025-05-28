Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4ADAC65A8
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999193.1379949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyl-0003bA-L6; Wed, 28 May 2025 09:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999193.1379949; Wed, 28 May 2025 09:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyl-0003Yt-HP; Wed, 28 May 2025 09:21:43 +0000
Received: by outflank-mailman (input) for mailman id 999193;
 Wed, 28 May 2025 09:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvg-0000yL-CE
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:32 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b62d924a-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:18:28 +0200 (CEST)
Received: from SN6PR04CA0076.namprd04.prod.outlook.com (2603:10b6:805:f2::17)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 09:18:21 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::fe) by SN6PR04CA0076.outlook.office365.com
 (2603:10b6:805:f2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Wed,
 28 May 2025 09:18:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:17 -0500
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
X-Inumbo-ID: b62d924a-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5et037tC/7RRkvqF5EO4oFP4+xDatJeafXkC0kxlTH2/kNvh+QJJjvPg7jbvsrCUlOKEa0PcdqcerT+Ty69KoVBrhSdu3GTQ8rsFZ4292tWCjZA8+lsoEi7UlqoPYL0ZhLZbJ2AYEMxmiHmIGJXphmLt/IGs5V31ojMjWQZICQISmFGenLlv21YyRTdbVL7aW0kyPz43gAtQFuhy4eZiygaJkYqvUCqWfwtYignOWdX9eIKEG7MD5Sb9zkxisUenNx2XnR6Frv3gH5VUBDQx6wGvRXLLNk2TDJrhJZsyUSfy0aFHt+aJw61C3gzENHovpIAoaesoGPcWzDnZuTpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvykzEStZK73rMFsbUxdbGQm1JqJFz8VY0tKPFQ221s=;
 b=tNWVTjPgU8otA5+X2P4AmAKvWWie5d6r+oQC2JP+DiESyEJHt1UXsAfoRSqz1NxrQHb+QTHx1x51olnMBmf4tKdEas0XHOxcHQcamZNZhiA1gxCB15W9Vngt5oSCq08eIniR+NcBxDfZX/jPce797RgITh2B1q03DcYvWIPKiF1QjOqxWihDHA5KKGrVEeikqVVdZ+uL43LjjvyG46Th1Tw6LpBVeI9W4AKomMUHU7EZSVrLGCMTePRYXKWrBP+B2k0AkqWSmKSik3uZgMn/ZWRHeDdtQLhJAUlb/8ByBGzY0T+xVah1v1lzw/g7vAEkydScNhg0O4DYZ3SKI07CTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvykzEStZK73rMFsbUxdbGQm1JqJFz8VY0tKPFQ221s=;
 b=o1W3UDU1+1YlwdjEt9N/iSKcMwD3Sm2duEYFDUTynXsKpAPiNwqilbdomXoOWwBRHe5vjXAAz8GYLCzue5Uu1JnHRIH1TIyIJG6h0NWDxvp/5hPw7Q/LtDzxixtEOQavY6wu5WXvDGZRIgzOm6xiQV4V5euQXXvgeQInBuq3iFs=
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
Subject: [PATCH v4 15/20] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
Date: Wed, 28 May 2025 17:17:03 +0800
Message-ID: <20250528091708.390767-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|MW6PR12MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: ef92bdba-e0bc-4ef3-72b6-08dd9dc896e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KCkgcrT1/Vgo8B+EV7PAS1Gi1fElV+NibqnKK6/C/w9D51fidC+DWiKBL8Ri?=
 =?us-ascii?Q?ZaYrIE3qqyyBgOIrL0xSYJWx515/qcB+0nq4h5K75HcgwbAkdqc1fjcIJN5p?=
 =?us-ascii?Q?e/Az8xJFHhzEokHoZ/s6w8xM70zQ9YIdcb4dkRXC62YZXHkqLKqbBo5f6KLZ?=
 =?us-ascii?Q?tOzmA4MKnXYGjbzEzP9gb/eo9r2JHruXj/aFAe5tYlw0FEpwvbjItf0ukWud?=
 =?us-ascii?Q?YbxL6GfNQQB1BtGMDAKGXltY0lt3k0WVKOMbypGVRtyw57eg25nm6+Kh0o5j?=
 =?us-ascii?Q?FZgjsb2855L0YfNPinPhL3pvC19mZgRavsKGC8jug90vUYC1Dxc5a9k9lZpC?=
 =?us-ascii?Q?92t77YT1+Mg73bR3CCrOg6nYGtz5WlxWSQYorY7Gl7a1cSYtLnxjyvvSkv8K?=
 =?us-ascii?Q?axaw3XdJh0hUgHkh0nqQpThbb3wMdBvFgLTh56bWyFRD14zjuRgGWVfjr/e0?=
 =?us-ascii?Q?0J2sSKpr0NQUrOpnAHEB0z128TsWfM41W60QxoHogcPv5bdVWlJG/xFelheO?=
 =?us-ascii?Q?9f7fbc8B6hPh1eDPArsuOt3Oi62sQ6xNnndLbQTyX0khdoIDh9i0wZtNe0PL?=
 =?us-ascii?Q?G9IvZ3RGjwKSz28r2hgkOqNNZE1ejzekTUXIZQVLcKiimEdaUW12vJ3JseA3?=
 =?us-ascii?Q?f2r7k3VoVYzPaDEmz0BUlUGC6JSgz92DW7CnQqfUm26jigczFiepeHJ6q+LV?=
 =?us-ascii?Q?Y0OMVqwH12WiDaY196gGA1YBT82m/uF5roaSJpak9sOZkzOXA70IAMg9cwtj?=
 =?us-ascii?Q?/rIGEyBuUJEh+tcV5ANyr0MECOKU0SufAJ6BzjBMBwYcccx0GNEk2ljN/nuD?=
 =?us-ascii?Q?cR3xsaLxS+csoivUhjXXHdka+TfVinBNeFwkoTYMhZ21zslSs9Jh1d6rbY02?=
 =?us-ascii?Q?mMEoDxbhS0gTfT9cauXn2XxoifX+TM1OCQf4vIUgXvBegQtu/qylgobg26pC?=
 =?us-ascii?Q?YwhkKpNdz1/Otshau3CMmT0poSA0uYoIm/UaR+pkOu+vYV3l7kkZWPyU6O5t?=
 =?us-ascii?Q?sJ8toPDNs2p0WkvIfCvJrBROjyEj3Ln1nSfsYM29QRnZmKmvMVQXCNfH2yke?=
 =?us-ascii?Q?h3TPfoz3q02KUU/x7n0h0qO9znLfdFdG6TkW+GI76cNPO74Sltj7jzS9rr+F?=
 =?us-ascii?Q?H4u+Xbm1p5yeR2TEAPORPRMUfl52cwK0lYrHOui6nvMgoQ7p1+iqPA+NbyeY?=
 =?us-ascii?Q?P+8clT7YiGdhRYdT5g0nOOkdy7eJ4LJgNxjhEa7w1K/YS2kgvgfN5Rinrpd8?=
 =?us-ascii?Q?jQd4jJonNvyZgL8FszX/wesvUOnfg0DYxOm0UYgbEwXdZjBdCbPVLGhbPyEI?=
 =?us-ascii?Q?NV0+4YMrdNfVwMmF6kflsdB0giOjlIgU3irn2caby4BEtChkyOJOxnJh34s0?=
 =?us-ascii?Q?1RX3cBJ//MuPYApbFD0/JdSLJuS8SVEh3H7bWXkOP2zBqOUz7T++rqo7JG2y?=
 =?us-ascii?Q?RMDyp5DSMaGqD1iv4TLsJBASnCmAI8SOEChnbpJhRRBK4PBrqqWS0CxhPvjd?=
 =?us-ascii?Q?B2Ziz8PikSeNx8X5driIOyrKQ/wsq6T5xwmg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:20.6324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef92bdba-e0bc-4ef3-72b6-08dd9dc896e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959

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


