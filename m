Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A2B19351
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068395.1432428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMb-0003Se-M7; Sun, 03 Aug 2025 09:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068395.1432428; Sun, 03 Aug 2025 09:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMb-0003Pw-EG; Sun, 03 Aug 2025 09:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1068395;
 Sun, 03 Aug 2025 09:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKg-0005hH-Av
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2405::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a83cb12-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:48:43 +0200 (CEST)
Received: from MW4P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::6)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Sun, 3 Aug
 2025 09:48:38 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::f7) by MW4P222CA0001.outlook.office365.com
 (2603:10b6:303:114::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 09:48:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:34 -0500
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
X-Inumbo-ID: 0a83cb12-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrQRDFKcde1c9ujv2x+6ZrUY9+Rsks3odch0tpgSJdTsIRXXeU7WeV/50lSEdcxVLDfeYm9AnlvyF7TcAxcHpvBSyvqeBIRkn8YfOzC7iJ2vs5nOhv+CME1BhjeOJ8vngk7KURd+KqPnkRXPnuT+RNbCbCNu4E07xuA+WqWqYtWPzKoFCKPZlLs2T3AtTm1Ym63SaRRuRJ416EnflMdGr2qBYS34g/VUJ8CQTjlwBvmfTekbo0mEp/x7KlHYJl/F7rlhauGBleAS2GxW2EzOmRSwIEBlBunqqqsDIvv4XZVnFyiN3A420/HM6EnEVjI2TrNVDN/UTDSwWNQQQEZjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWgH4YhPyg3TcKtMkDuA1WrWEWJGpPsNfDVTM1mUQJg=;
 b=fVQsbSWn2QJczHQDYf6AWIKis1gsPjEldXSerPppxtTkPml/Aky8Zr9vnV4+i57lBYKH/SQT8VFhSh4u44ht2+Ac92pd7wp5rFq/cHgb5684z6lBnC1r92cGtW7mmV9Znkuv4qrW5wJsNn7s+vCM3gE0CW2XroLLLlYJi/ft3jAz5svKhNE5aClBpzoot25O3VYH7pcN1EN0dNGaOsy8r0NtkW+tAo+zlT0qogcCyWM9AXVvwwGNUzDhR2w0/ztXNl0pZXrWkTahg/xDZX7abvIUnjckpL8nKVvNquFu3icfKAtEjmlguzXSkINlxIggsr27KRcDMepxJfD/T/29iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWgH4YhPyg3TcKtMkDuA1WrWEWJGpPsNfDVTM1mUQJg=;
 b=DfFRhWiN4VqkzU95obmzuM7kXokHQor3GPldDTiWRftmtDeyjd/oCtMN77fPNhn0RhcayNPoJMh0o2HJr2MVTkIKhWd+smyUaumUfDjqCMV1HC1QX/L/dNLI8X9nvgDOBgr1ea1g9lnNSdGu5I2rVDB4ZDuMeG25JMf2IhvYDHY=
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
 Dunlap <gwd@xenproject.org>, Meng Xu <mengxu@cis.upenn.edu>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 12/25] xen/domctl: wrap around XEN_DOMCTL_scheduler_op
Date: Sun, 3 Aug 2025 17:47:25 +0800
Message-ID: <20250803094738.3625269-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c423e1-6467-4f20-2fba-08ddd272eb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?okL0322ES/R+GtBSB+Tv2hZ8GRKKZHw+jB7uuXiE+ErlyR8OM5R3iWFGxUK+?=
 =?us-ascii?Q?9GBud6est6j8iqPgW0tgoz/HeU53pRk6TEB0naQ4TwziqtzyHQ4MWgc6FJ4w?=
 =?us-ascii?Q?QED23QOOH4hWYW8QPmBEipaAuxSJNx4QzK8xU2omJ/FXibWa9lYHKioCzl9D?=
 =?us-ascii?Q?ujHsFL0vVIGIfq7N7z/nHa89iCteerKei+Wijxi1RMtrppH17VxoELHNjDFo?=
 =?us-ascii?Q?XnCAt5C77UoeBjmMXd+jOe62GH9l4sAyLL1bTerPAwO/3uwCLfqM2YFUTiy/?=
 =?us-ascii?Q?4r9uxTOJWqHh8LEso0qoQ/MsrLHBkc53XX7pj2u/xlKt6azu1pjPb3s+UAEy?=
 =?us-ascii?Q?HT5+EMMG1jsy10ewQ1gp2pRnRIrFHw62sMX5kKJpJLtnL17s+FfcEUbX56dt?=
 =?us-ascii?Q?puQCx0YEfFOaf4smhXvtAIWl9w3sJ+HGDQQU/Qz19/GdlHoYEMBa+nRwcU5R?=
 =?us-ascii?Q?FdU/rYJzNZfi/jEX54iab1i70WKfo7rkkxFVpMIAoGepoKCWXDBMbZVaKLiS?=
 =?us-ascii?Q?X5X1S/M/usQQsNmhq6tMA8jSpVZLDg8HRCqGIjNBrs8+AvuS9VD837obrYVm?=
 =?us-ascii?Q?oKkvTKFEJfqjLl2a42zD3kS1DgqhH9TpA7UjLn87HaWmZPoivcCsznROdLi/?=
 =?us-ascii?Q?4o7T0G/WXylvjhKLb5yZNI2qa97m/C4M5e2GhAQO1Hc0hetGQOmjHalvZMWT?=
 =?us-ascii?Q?LAK14gKHqTeSPSURfx3Q/RWJJGNVrwXQHUdwtu48ud9s2FXWVP7ZWoaUXVrm?=
 =?us-ascii?Q?pExefCvqm2I/3Ha4piblt+s1Iwfoxlda7mPkmFM4tNPBKdFhBX+D8P2sSCxQ?=
 =?us-ascii?Q?vDkNxgOzPo+/u1k0NDKnpFJ/75Mvj2lLKtVMdLNREQx01WZ7vwij0UsIZhT9?=
 =?us-ascii?Q?EvjDjstjMlf4jI8xLHYjzC10CzdLJBl4B7ILN2th3/jFpMGyoYNOT4MYa08/?=
 =?us-ascii?Q?S3FnjSA6HcuZwrIMnpZIvR57N6oN1t7V7vWJaebUUDwcdtnivcy7xTQNDHPh?=
 =?us-ascii?Q?PfDU2D5HI7iRn61CSaFDz/bbAr/p1sIZsIHk56wFOw7tSAq1SDp8ckVk5j1B?=
 =?us-ascii?Q?9Z6p3W/+pg+l/5OUqFOyv1bOAq0Nyb1LSIfiRam81dJbK+/zsdwHak/aik40?=
 =?us-ascii?Q?awOF1IHJIIHn9o6ptgKLQvyPKcTmZgmqnLDBZIQwmXDGW+qjBBFyJhFf2lAe?=
 =?us-ascii?Q?P6V9yGpN8Z6vhO/EFmyCy+hXPRlba8JoqOvimvX5V79KW2gjVBqBjlve6Nmw?=
 =?us-ascii?Q?J9iEwF2KlTFzv+gxjC61eLmILGkPMyxlE9RIjx00TJL9VUbBKp/47eAnUILy?=
 =?us-ascii?Q?64EgnDdagO6T+8agR3lABMGCXGsuRZWGWwnDnwb2fOfK5V3lr5A4VjRtRMOS?=
 =?us-ascii?Q?mXgnnCNtEmWRF6+46TfLpe/Vst6UyeiuEMwkucJqV7FOgjmygKOTahPLfCN2?=
 =?us-ascii?Q?ZxQuNd0mqUlYhltgMvNOihq0vEygtPYqDl9VPHUXzEzuzRKGTTxAiHfeBZH9?=
 =?us-ascii?Q?xaRDCxz63d5L5fa5adiBMdnj0MmDycWgDbAt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:37.4941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c423e1-6467-4f20-2fba-08ddd272eb8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350

Function sched_adjust() is responsible for XEN_DOMCTL_scheduler_op domctl-op.
Tracing its calling chain, the following functions shall be wrapped too:
- xsm_domctl_scheduler_op()
- sched_adjust_dom()
- scheduler-specific .adjust() callback

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/sched/arinc653.c | 2 ++
 xen/common/sched/core.c     | 2 ++
 xen/common/sched/credit.c   | 4 ++++
 xen/common/sched/credit2.c  | 4 ++++
 xen/common/sched/private.h  | 4 ++++
 xen/common/sched/rt.c       | 4 ++++
 xen/include/xsm/xsm.h       | 4 ++++
 xen/xsm/dummy.c             | 2 ++
 xen/xsm/flask/hooks.c       | 4 ++++
 9 files changed, 30 insertions(+)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 8a4f4259d8..e73b0256a6 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -735,7 +735,9 @@ static const struct scheduler sched_arinc653_def = {
 
     .switch_sched   = a653_switch_sched,
 
+#ifdef CONFIG_DOMCTL
     .adjust         = NULL,
+#endif
 #ifdef CONFIG_SYSCTL
     .adjust_global  = a653sched_adjust_global,
 #endif
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 14f27fe70f..896178b32f 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2080,6 +2080,7 @@ int scheduler_id(void)
 }
 #endif
 
+#ifdef CONFIG_DOMCTL
 /* Adjust scheduling parameter for a given domain. */
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
 {
@@ -2114,6 +2115,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
 
     return ret;
 }
+#endif /* CONFIG_DOMCTL */
 
 #ifdef CONFIG_SYSCTL
 long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 6dcf6b2c8b..fff1af063e 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1183,6 +1183,7 @@ csched_unit_yield(const struct scheduler *ops, struct sched_unit *unit)
     set_bit(CSCHED_FLAG_UNIT_YIELD, &svc->flags);
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check
 csched_dom_cntl(
     const struct scheduler *ops,
@@ -1227,6 +1228,7 @@ csched_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 static void cf_check
 csched_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
@@ -2288,7 +2290,9 @@ static const struct scheduler sched_credit_def = {
     .wake           = csched_unit_wake,
     .yield          = csched_unit_yield,
 
+#ifdef CONFIG_DOMCTL
     .adjust         = csched_dom_cntl,
+#endif
     .adjust_affinity= csched_aff_cntl,
 #ifdef CONFIG_SYSCTL
     .adjust_global  = csched_sys_cntl,
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 75316d42b7..51784d9aab 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2909,6 +2909,7 @@ static void cf_check csched2_unit_migrate(
         sched_set_res(unit, get_sched_res(new_cpu));
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check
 csched2_dom_cntl(
     const struct scheduler *ops,
@@ -3114,6 +3115,7 @@ csched2_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 static void cf_check
 csched2_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
@@ -4246,7 +4248,9 @@ static const struct scheduler sched_credit2_def = {
     .wake           = csched2_unit_wake,
     .yield          = csched2_unit_yield,
 
+#ifdef CONFIG_DOMCTL
     .adjust         = csched2_dom_cntl,
+#endif
     .adjust_affinity= csched2_aff_cntl,
 #ifdef CONFIG_SYSCTL
     .adjust_global  = csched2_sys_cntl,
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index d6884550cd..b8841c9308 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -349,9 +349,11 @@ struct scheduler {
     void         (*migrate)        (const struct scheduler *ops,
                                     struct sched_unit *unit,
                                     unsigned int new_cpu);
+#ifdef CONFIG_DOMCTL
     int          (*adjust)         (const struct scheduler *ops,
                                     struct domain *d,
                                     struct xen_domctl_scheduler_op *op);
+#endif
     void         (*adjust_affinity)(const struct scheduler *ops,
                                     struct sched_unit *unit,
                                     const struct cpumask *hard,
@@ -506,11 +508,13 @@ static inline void sched_adjust_affinity(const struct scheduler *s,
         s->adjust_affinity(s, unit, hard, soft);
 }
 
+#ifdef CONFIG_DOMCTL
 static inline int sched_adjust_dom(const struct scheduler *s, struct domain *d,
                                    struct xen_domctl_scheduler_op *op)
 {
     return s->adjust ? s->adjust(s, d, op) : 0;
 }
+#endif
 
 #ifdef CONFIG_SYSCTL
 static inline int sched_adjust_cpupool(const struct scheduler *s,
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..fd677b4f09 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1362,6 +1362,7 @@ out:
     unit_schedule_unlock_irq(lock, unit);
 }
 
+#ifdef CONFIG_DOMCTL
 /*
  * set/get each unit info of each domain
  */
@@ -1471,6 +1472,7 @@ rt_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * The replenishment timer handler picks units
@@ -1572,7 +1574,9 @@ static const struct scheduler sched_rtds_def = {
     .insert_unit    = rt_unit_insert,
     .remove_unit    = rt_unit_remove,
 
+#ifdef CONFIG_DOMCTL
     .adjust         = rt_dom_cntl,
+#endif
 
     .pick_resource  = rt_res_pick,
     .do_schedule    = rt_schedule,
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 7c61f27366..6444f0677b 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -56,7 +56,9 @@ struct xsm_ops {
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
     int (*getdomaininfo)(struct domain *d);
+#ifdef CONFIG_DOMCTL
     int (*domctl_scheduler_op)(struct domain *d, int op);
+#endif
 #ifdef CONFIG_SYSCTL
     int (*sysctl_scheduler_op)(int op);
 #endif
@@ -242,11 +244,13 @@ static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
     return alternative_call(xsm_ops.get_domain_state, d);
 }
 
+#ifdef CONFIG_DOMCTL
 static inline int xsm_domctl_scheduler_op(
     xsm_default_t def, struct domain *d, int cmd)
 {
     return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
+#endif
 
 #ifdef CONFIG_SYSCTL
 static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 6f8b06b45f..b8a9b581b7 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -18,7 +18,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
+#ifdef CONFIG_DOMCTL
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
+#endif
 #ifdef CONFIG_SYSCTL
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
 #endif
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index fd7aea460f..55da0a5ff7 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -609,6 +609,7 @@ static int cf_check flask_getdomaininfo(struct domain *d)
     return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETDOMAININFO);
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
 {
     switch ( op )
@@ -625,6 +626,7 @@ static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
         return avc_unknown_permission("domctl_scheduler_op", op);
     }
 }
+#endif /* CONFIG_DOMCTL */
 
 #ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl_scheduler_op(int op)
@@ -1890,7 +1892,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
+#ifdef CONFIG_DOMCTL
     .domctl_scheduler_op = flask_domctl_scheduler_op,
+#endif
 #ifdef CONFIG_SYSCTL
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
 #endif
-- 
2.34.1


