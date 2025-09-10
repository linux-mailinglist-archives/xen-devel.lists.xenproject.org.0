Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41BCB50FEC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117782.1463893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXL-0001av-8T; Wed, 10 Sep 2025 07:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117782.1463893; Wed, 10 Sep 2025 07:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXK-0001WY-Qs; Wed, 10 Sep 2025 07:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1117782;
 Wed, 10 Sep 2025 07:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQj-0005yo-3f
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:49 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2417::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53252909-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:47 +0200 (CEST)
Received: from BYAPR02CA0040.namprd02.prod.outlook.com (2603:10b6:a03:54::17)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:41 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::31) by BYAPR02CA0040.outlook.office365.com
 (2603:10b6:a03:54::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:40 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:33 -0700
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
X-Inumbo-ID: 53252909-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLQtwpKNOKsS/CzxcatW18qakE6cQqe0QaPyQ2ljIg/zoh9hDGUuMvT6YZVPXh5sYV47HAS2MDGSq9ShHQT45SYiOWM1rZp4t4Uj6dl7E46H7teoE4D4EN7+593Z0Bb7BRbq0UrF0H0cjYU5vPU6cb4zZvMUK7ZrU7/FXSxo2qNvwOnT6PGDvzEsxsNrDZ6BVT1+cN+qZS2efqq/H2leRwcIU2e1+YN5JfP6AxAq0Ivk+iTxv+ebhExq9HBYVli/7M1BnI8AT3NLdWhMHCrf0W4PhcsU67zok+CbxUFDPjuWyalx6ZwBUqkpyT9oaX6KxdzE+SsVS2rHJrtx7VzJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBscWAwzK16wFtb9z6LG5pktl/B8WuF9ILjHfhMxcXc=;
 b=TBJmYbpONSrYGberD9I7IYWcM3s9nsei2jzfkNgI1ZMjeD3f9rdUuMuaEgnt4CPnbxSzStZZhY4rSUluWlQS5h/r4IUl/vs83WXaZE91RNoFaKGeNK754pj7Oyahol87F29mcfmwUodmD8wIHRNlnzcxb7UtiLl/l2yOemobFF7VmvkPBf+Gt/tQSzV6MCpJhQoNBe7PYyhgT7UFsN7SjExPIj+4XbXgkrXpJe/YTM6bMPc0uRvsZ37/Do2rGCUig2no58++KhNdTLQBXqgx6Yo2tH3nG7l786ex0t78NxO1azNbtC+cTiK2DCK1kH5YJ7jjWHizvLBmfsSSH06maw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBscWAwzK16wFtb9z6LG5pktl/B8WuF9ILjHfhMxcXc=;
 b=qAt17ySYEfUooD+ufmDQpeJ+ycAzKJeMVPc0NEDMgzs8XZPImH+clFqKTzpCRm2+8Jo+2mhsyA1KrHlnhIYxHT01V84Jy/fDUilFd1Oud1Osj15Epm7eRb+OB7Q3VilcpbDmMO0zKAZcIoJTMxLHwCxctcV3j9vltW1Ik8vPoaY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Nathan
 Studer" <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>, Meng Xu
	<mengxu@cis.upenn.edu>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 13/26] xen/domctl: wrap sched_adjust() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:14 +0800
Message-ID: <20250910073827.3622177-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DS0PR12MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee1863f-a267-448b-a3e3-08ddf03d338d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jVXTctrDvl3wlkNfBuVVpD9gZFY2gxBQLv+0jini/bDm7TcwtIDfri6bk5fM?=
 =?us-ascii?Q?fAkkolFgbvCvRov7JexpIBVOaw2CYmTpFF1YeV5AQ7UR8PNRUlhUXxFDW5aG?=
 =?us-ascii?Q?/eJiZJRdTe5NYQX//N7xUNcaOGhn2F8iMEVF5npKx8usbCkO7UUM1SDaSarJ?=
 =?us-ascii?Q?v+8PqXp8hqCausEGh+I15k/Jkzaa56oiNh1q2cyFISY+FTF8dML0SQNqZmdr?=
 =?us-ascii?Q?0fKARLBoSkF1H7+DFdlGxTbDS4kIs1LicrD1UfrvwMBek+08avr8LsUoXX4Z?=
 =?us-ascii?Q?W97n4C+PpWmbyw0DNgdoEZF1ozh5BJqu19VWMjT45t38k9ja+3xNGPYeefVo?=
 =?us-ascii?Q?lhX0ePOOUKW2VV2uPaLyd6KCLlAlc53BrPGf5frBf+6LMzGWtrtN3M7JVgCZ?=
 =?us-ascii?Q?FqrKzeADv+16au7DNGlseDe61RVPohLmqyC9UMZdcuWNsi3xMJRZjnRG8Tt9?=
 =?us-ascii?Q?HpUO3Ws3Zx8mctqY7wly+ffXkU4kWQkcfqm3lDPZS2aEVnx1qXCR9IwxFCIg?=
 =?us-ascii?Q?qRUHcInoia1CRhd5r0h8l3clhoMzmG5e+oVjFWwskP1j3C9jb/xIyJ2r5wZC?=
 =?us-ascii?Q?XKhBbFLrfMy02wdzEqmRLnbssGfQ5LnhXcnCSY1k9fLq87kXnrpPKt7HLF4F?=
 =?us-ascii?Q?OcPNZFkRSrfSLH/GuAim5B2LmGCQaJI/Uu6gSIj/2xn7tde4R48fWPe1+DfV?=
 =?us-ascii?Q?BMFTUTLV+P23iGilznN/JuLoqsi9Ge1h++yAAPXOad/L7GnfbSgeZ8Q0mMPk?=
 =?us-ascii?Q?eQF7s2mH9cKlMy3yT/m/s9ksTKDqnC5Gs+zwn7agQB3YUVD8vhn5vTvrAhq4?=
 =?us-ascii?Q?NiWhCUPbgW5rHIfIz1cXpO1WWi1nB62oDf2WM7NFUPci72zyleO1ocV7/6nx?=
 =?us-ascii?Q?DrWGQQXCZC3u+T4Pk0HvmC7yiiF+F8Ty6GQhKIm7m5xjNGiSE1SXWs0ucLHD?=
 =?us-ascii?Q?M7VTdtWBerJcTxvi+mc9/YHV8AQ7UxzdDMx6og/Zp8UOVTPCAipkgZHmOCu9?=
 =?us-ascii?Q?NKM4JsHJO4UqwY2EsIgEi7IK3v4opoJQQI1CyAOA0Yxsti6ZTzs9qiYeR3aO?=
 =?us-ascii?Q?NpNH5RBWRF72FDPaSOUlgymZ7zPuYRVeARJW1U8wMCx8DQiaUVXmZVQfsDXt?=
 =?us-ascii?Q?EZ0PPOkaVLT0LBkdDqKeBiwu9dUlr7FKfcAOAEKLQEdtz++BOBsl6meS2Z3L?=
 =?us-ascii?Q?H9NwvH6ARIvAW6WbcIlLjaewl+l3iFoRYoclKQzQyqnI0T7nv2WaBoqrGvmB?=
 =?us-ascii?Q?2pwnsIE/N8Jb9vXyq+tSbB4eKr8fbrm5zwA8hcNb9z5RV1Jd8ASTd+2PAf4h?=
 =?us-ascii?Q?gsXv/N5joaWDpOq1uHH3TVUJ4+WuexUGCKQ6Jetls6S2NhMTm++qV/9DFrLP?=
 =?us-ascii?Q?Devjf6INfGrnW+x8OX+awDLo6/Xuq2oUvf7WhEiEgwdYM0jaTk/dw3sryS9j?=
 =?us-ascii?Q?0OaWq/Ctr2DMfGQ0B2tW9uSOxCJ4v/z5fkypmIzfFuLrXyIk1KuY19JL9aFM?=
 =?us-ascii?Q?kr74nWQb7qjzBcgaV/B6d2KLNTFspp5kjqvf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:40.4334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee1863f-a267-448b-a3e3-08ddf03d338d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785

Function sched_adjust() is responsible for XEN_DOMCTL_scheduler_op domctl-op,
so it could be wrapped with CONFIG_MGMT_HYPERCALLS.
Tracing its calling chain, the following functions shall be wrapped with
CONFIG_MGMT_HYPERCALLS too:
- sched_adjust_dom()
- scheduler-specific .adjust() callback
- xsm_sysctl_scheduler_op()
Wrap XEN_DOMCTL_scheduler_op-case transiently with CONFIG_MGMT_HYPERCALLS,
and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_scheduler_op-case transiently
---
 xen/common/domctl.c         | 2 +-
 xen/common/sched/arinc653.c | 2 +-
 xen/common/sched/core.c     | 2 --
 xen/common/sched/credit.c   | 4 ++++
 xen/common/sched/credit2.c  | 4 ++++
 xen/common/sched/private.h  | 4 +++-
 xen/common/sched/rt.c       | 4 ++++
 xen/include/xsm/xsm.h       | 4 ++--
 xen/xsm/dummy.c             | 2 +-
 xen/xsm/flask/hooks.c       | 4 ++--
 10 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 4a35c17060..6660f13e9e 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -520,12 +520,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     case XEN_DOMCTL_getvcpuaffinity:
         ret = vcpu_affinity_domctl(d, op->cmd, &op->u.vcpuaffinity);
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_scheduler_op:
         ret = sched_adjust(d, &op->u.scheduler_op);
         copyback = 1;
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_getdomaininfo:
         ret = xsm_getdomaininfo(XSM_XS_PRIV, d);
diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 7d6c40d800..484591a977 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -735,8 +735,8 @@ static const struct scheduler sched_arinc653_def = {
 
     .switch_sched   = a653_switch_sched,
 
-    .adjust         = NULL,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .adjust         = NULL,
     .adjust_global  = a653sched_adjust_global,
 #endif
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 69972147db..8a3251ce5f 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2078,7 +2078,6 @@ int scheduler_id(void)
 {
     return operations.sched_id;
 }
-#endif
 
 /* Adjust scheduling parameter for a given domain. */
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
@@ -2115,7 +2114,6 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
     return ret;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 {
     struct cpupool *pool;
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 0cbec2a9c0..da57350cae 100644
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
@@ -2288,7 +2290,9 @@ static const struct scheduler sched_credit_def = {
     .wake           = csched_unit_wake,
     .yield          = csched_unit_yield,
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     .adjust         = csched_dom_cntl,
+#endif
     .adjust_affinity= csched_aff_cntl,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .adjust_global  = csched_sys_cntl,
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 307e63ebd8..73df429b42 100644
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
@@ -4246,7 +4248,9 @@ static const struct scheduler sched_credit2_def = {
     .wake           = csched2_unit_wake,
     .yield          = csched2_unit_yield,
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     .adjust         = csched2_dom_cntl,
+#endif
     .adjust_affinity= csched2_aff_cntl,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .adjust_global  = csched2_sys_cntl,
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index b7ff67200b..15e69f5c2d 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -349,9 +349,11 @@ struct scheduler {
     void         (*migrate)        (const struct scheduler *ops,
                                     struct sched_unit *unit,
                                     unsigned int new_cpu);
+#ifdef CONFIG_MGMT_HYPERCALLS
     int          (*adjust)         (const struct scheduler *ops,
                                     struct domain *d,
                                     struct xen_domctl_scheduler_op *op);
+#endif
     void         (*adjust_affinity)(const struct scheduler *ops,
                                     struct sched_unit *unit,
                                     const struct cpumask *hard,
@@ -506,13 +508,13 @@ static inline void sched_adjust_affinity(const struct scheduler *s,
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
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 1e4647f7db..4d332ceca2 100644
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
index ec3880f631..e8a4deb2ea 100644
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
@@ -1888,8 +1888,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
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


