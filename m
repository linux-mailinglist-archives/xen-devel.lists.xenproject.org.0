Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C60B19343
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068351.1432378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKU-0007Y7-Kx; Sun, 03 Aug 2025 09:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068351.1432378; Sun, 03 Aug 2025 09:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKU-0007V4-Fi; Sun, 03 Aug 2025 09:48:34 +0000
Received: by outflank-mailman (input) for mailman id 1068351;
 Sun, 03 Aug 2025 09:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKS-0005K3-Lp
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2418::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03eb465a-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:32 +0200 (CEST)
Received: from MW2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:907::28) by
 SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:27 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::a3) by MW2PR16CA0015.outlook.office365.com
 (2603:10b6:907::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.19 via Frontend Transport; Sun,
 3 Aug 2025 09:48:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:21 -0500
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
X-Inumbo-ID: 03eb465a-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azcmPV1WUxrPHk1m/KGU78+S5aIClRoq9MqGYaZtU10oBOzPMvMcpSvYzoafQ0E2F2o/2PL6MdI6sbBBb987jM7ZBG7wijefbZRHEkgxHSfZJWj6H7mlpO/MtmPoTr3T0IEtcJ0gZQT0tp0R/9QHCl1zTO2bWTmWDiPNrCh4cHu+ECIu3oNg2REwzZpaY7Xhgq8Kt5oRePcssWn/7tso5868325JoIkDshBGxq6et99v4hwrqs8GDwx0Xnb6mzpesrVOQhx2ib7n6EvcsOkDxTzOOo17NRygJOgrFAUIAV3C9GkX3lxKJDx0fPCvW5jPOrz3CIC/ScStfYNd9YeQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDWkHlpI39c3TP608GAZB0w6tfc2X4mcFFWinzeznro=;
 b=VTGhga+yddrkDRbQtkn3vXeWViNdrmclJopgtmFtmsoiLmF5QPaqLsIy8qMnuXbrESl7dAT01bQXrOEWd6+WO+UrGAANOIATbCkdcsbwwDKwh3OrZczWXiUXQr2I5Of94JlMnsZuzaCEQePrfLoO1Ff58yfcYo0najX2GIigKJ/1s/brs8v+BZ7gGtOSv7AhxoWmRMnCh+EICfL1rwx2N7EV4aUscnHuhlVPOiSzaj6FfeLAdtKxHsswa6RNoTOBhHWwZswydE0kEM0BIBqL0mGmtlCS8zJwpQlZqUILrkkSaHw9xPvzcVogVzh8ux0g0g1HJzK1ec38wjwGLuSTBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDWkHlpI39c3TP608GAZB0w6tfc2X4mcFFWinzeznro=;
 b=tDy2lh54b+amBaTmhnezMM2jmAP9AHzLOYotbUiGB2KnyooSXiMMVexzR+SV/2TtVm58hVw33IhI0Y9KxvP3dcdkwNutk1iXOgOTbyJiKx1Drri3TPGCQ1tHKf21h8A98rGJBnqbyMHSBQR13c1dwsjk9r52dUtM8ZdlY24Ehs8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1 08/25] xen/domctl: wrap around XEN_DOMCTL_soft_reset
Date: Sun, 3 Aug 2025 17:47:21 +0800
Message-ID: <20250803094738.3625269-9-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: c41198b9-fa94-47c1-1fc6-08ddd272e49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lc86eHYoW09r0dyZphhLENMnVqVA+CisEPrttuaXqLPeO7O2mqMstB/S3PDf?=
 =?us-ascii?Q?JKfsofuMToHB1c0DR4bEiSgIbGWSe+Pfrr+X2Ye/RnFHKa76zT8Dnw1a0tOb?=
 =?us-ascii?Q?SAspPuPwQBC1KbX3Zj9Y3gZ5tD8VbuQpBQaZGD4CN0odNlAFD4Je/kgripmZ?=
 =?us-ascii?Q?0KWHMgH28QXXJ/b0AnaKxr6XnUzMUbtpiVzfGgqMJdTkE7G1Y931ZN1h8ka0?=
 =?us-ascii?Q?6xZe3Nver8QBDtpWmBW/fBikSNDo3bA1gLdUKYBw2mnL+f6l/iKhIbGlMJDF?=
 =?us-ascii?Q?LDh6nBeiqHefeX52+YHq/kiWrE+ORtC1DLWKhK38Xz3PEv3N8xgsdK08k7JG?=
 =?us-ascii?Q?82g+KzMou5+FBzuROWbeNPoSVYIDC6ZLTXTCkFRzDHt0fOCR/eDin0u1VQDZ?=
 =?us-ascii?Q?agEzVvtSVqFwST1kR5D+62sutCru5T9T5RmaJpcGR2WPGQqnbJEFysqQhAGe?=
 =?us-ascii?Q?UkImvgyRh8l3Mi/2dzQ748UUjLR6MgkSJ2Qw2Z9MDK9k8zwOHV2ZTG2XSn5W?=
 =?us-ascii?Q?+qiu8Z5CPbLqefxpDxwRf/qiwrPOmNeIF3yRMZnll1niamqPKoLIDopBVmRu?=
 =?us-ascii?Q?MgDGBbWJQbezn92uqqdU1FEqyyarm798F25mE1HQ/oxNKnkftablYV4l5Khq?=
 =?us-ascii?Q?sM3I1dH7ITwrOLT5q0SzJ5difjtg1HowepwXy7aEfAvAuLnYpiR/Bgg+7KmK?=
 =?us-ascii?Q?dH4UPjfYr+3326dv3pPvVe21nEF4d2EJgPW47VWRnCtCfAwvwr5CxvSnXgW5?=
 =?us-ascii?Q?GFSJC1dpZyhMeRTwsZmg6hhKHKeuMwbSxY+T07Pc2Np8Pr83jCF8Av36AKmf?=
 =?us-ascii?Q?gCGF9s6vQRSfGKTLwvihQZc2BmCCr3DjKI2BPX0CGm5H18yh7sQggIMHuZLO?=
 =?us-ascii?Q?QWhdPVhtKFefZqcPpWQBdP4WYmNBf2Pe3Oj93PTBbLunZ3zueKpl3a2fid2/?=
 =?us-ascii?Q?/2wgRTwvvF89GCqntaoLWSKUcLqj4Jhc7PxNonOE5D1/DMxWcPuUQp2ZKXXJ?=
 =?us-ascii?Q?VIVV1Er0lIQtbotcigZCk/2at+HSNTG4I+RYnOabmZvBf63WTVf0YnfeWiv+?=
 =?us-ascii?Q?cdSmyjE/s4QO2btcYDXtK2rpqHQEWUizkD7LikGv4geuhTv707KtlrvkY8kA?=
 =?us-ascii?Q?ScFaW/LUPZdy16/OHABEuy0tBl9DMGI3xOtirP4Z1cGIvRmy/3e4WflVfWGL?=
 =?us-ascii?Q?1s9IemuxvR9Q+wvGcoJgrGKSAaotJ4yYD5TvkfX3LjRHu5ZA3aqnBebqi6dz?=
 =?us-ascii?Q?9Nt+UDZ7dZ4Mqjsb3tUu40R2uwsF40R82ZxxV667UbYF8e/0Nl6z+ijTlevU?=
 =?us-ascii?Q?cGdLB4WF4QlQvT+t4eWc08VsIVVI0/A2jUeayyBvxH147bvtZdVAdFrc/GqS?=
 =?us-ascii?Q?Sib1G/BpWjGndmf4dAvh3ThfuyfRhMsP8Mw9pKVikwhN0U9sZ65EufIK9+6/?=
 =?us-ascii?Q?o6hzjEso9AKWnJQdLUo6ymzS9In0DNuTU8PaudJBmbcnLWyMDHPlxIrnpDUE?=
 =?us-ascii?Q?kh/wZwjUQOnloZXtsW9An+/fPtiZ+1OYdFFy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:25.8604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c41198b9-fa94-47c1-1fc6-08ddd272e49b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024

Function domain_soft_reset() is responsible for domain soft reset, tracking
its calling chain, and the following functions could also be wrapped:
- grant_table_warn_active_grants()
- argo_soft_reset()
- arch_domain_soft_reset()
- domain_resume(), another usage is in XEN_DOMCTL_resumedomain domctl-op.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/domain.c    | 2 ++
 xen/arch/ppc/stubs.c     | 2 ++
 xen/arch/riscv/stubs.c   | 2 ++
 xen/arch/x86/domain.c    | 2 ++
 xen/common/argo.c        | 2 ++
 xen/common/domain.c      | 4 ++++
 xen/common/grant_table.c | 2 ++
 7 files changed, 16 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 310c578909..4124d201d1 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -870,10 +870,12 @@ void arch_domain_unpause(struct domain *d)
 {
 }
 
+#ifdef CONFIG_DOMCTL
 int arch_domain_soft_reset(struct domain *d)
 {
     return -ENOSYS;
 }
+#endif /* CONFIG_DOMCTL */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 4679cf9360..b2b97c6eb7 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -236,10 +236,12 @@ void arch_domain_unpause(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_DOMCTL
 int arch_domain_soft_reset(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_DOMCTL */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 8918cebf35..4f817bfe83 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -208,10 +208,12 @@ void arch_domain_unpause(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_DOMCTL
 int arch_domain_soft_reset(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_DOMCTL */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c3816187..13ccaf1c79 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1001,6 +1001,7 @@ void arch_domain_unpause(struct domain *d)
         viridian_time_domain_thaw(d);
 }
 
+#ifdef CONFIG_DOMCTL
 int arch_domain_soft_reset(struct domain *d)
 {
     struct page_info *page = virt_to_page(d->shared_info), *new_page;
@@ -1102,6 +1103,7 @@ int arch_domain_soft_reset(struct domain *d)
 
     return ret;
 }
+#endif /* CONFIG_DOMCTL */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/common/argo.c b/xen/common/argo.c
index cbe8911a43..932f9fde9b 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2351,6 +2351,7 @@ argo_destroy(struct domain *d)
     write_unlock(&L1_global_argo_rwlock);
 }
 
+#ifdef CONFIG_DOMCTL
 void
 argo_soft_reset(struct domain *d)
 {
@@ -2374,3 +2375,4 @@ argo_soft_reset(struct domain *d)
 
     write_unlock(&L1_global_argo_rwlock);
 }
+#endif /* CONFIG_DOMCTL */
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e20fe2d40d..604217d782 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1343,6 +1343,7 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 void domain_resume(struct domain *d)
 {
     struct vcpu *v;
@@ -1369,6 +1370,7 @@ void domain_resume(struct domain *d)
 
     domain_unpause(d);
 }
+#endif /* CONFIG_DOMCTL */
 
 int vcpu_start_shutdown_deferral(struct vcpu *v)
 {
@@ -1681,6 +1683,7 @@ void domain_unpause_except_self(struct domain *d)
         domain_unpause(d);
 }
 
+#ifdef CONFIG_DOMCTL
 int domain_soft_reset(struct domain *d, bool resuming)
 {
     struct vcpu *v;
@@ -1718,6 +1721,7 @@ int domain_soft_reset(struct domain *d, bool resuming)
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 int vcpu_reset(struct vcpu *v)
 {
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..bfb199be7f 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3962,6 +3962,7 @@ int gnttab_release_mappings(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 void grant_table_warn_active_grants(struct domain *d)
 {
     struct grant_table *gt = d->grant_table;
@@ -4006,6 +4007,7 @@ void grant_table_warn_active_grants(struct domain *d)
 
 #undef WARN_GRANT_MAX
 }
+#endif /* CONFIG_DOMCTL */
 
 void
 grant_table_destroy(
-- 
2.34.1


