Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD85C789AE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168659.1494689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtP-0006PO-O1; Fri, 21 Nov 2025 11:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168659.1494689; Fri, 21 Nov 2025 11:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtP-0006Db-DJ; Fri, 21 Nov 2025 11:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1168659;
 Fri, 21 Nov 2025 11:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOr9-0008Dv-JO
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:11 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b352ecd-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:59:09 +0100 (CET)
Received: from CH2PR05CA0068.namprd05.prod.outlook.com (2603:10b6:610:38::45)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 10:59:05 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:38:cafe::ce) by CH2PR05CA0068.outlook.office365.com
 (2603:10b6:610:38::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.5 via Frontend Transport; Fri,
 21 Nov 2025 10:59:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:04 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:02 -0800
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
X-Inumbo-ID: 1b352ecd-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBoGBM9kmhycAJ/P/h0v0rhxfilNO83Myy1b1yJnrNMptvt443X6MlVY4lnZ/ka6DY2HR4FzfU5smJFyZqxkIJ3fz5Lr8rpBa60hu+ZHYKdfS/l4wI8JYu0UoiXwhgdd7P2wUHRd0SAUZliATLOaMlAhYa7SkQp8cd3YrGux8R2rdockRGZdrFUKvFBNTaKfuLcdEDbgACs0+YrxW+FxZulWNS88pyP1qVKvFFJ5CNJjVxWpBZD89pIoQO7x+W2qkArgCrDfnbkv8D6RP17TEzLYAGWXmMu47hPtxpMXHs59xKdwahvVbd/SpMvEEfSwY+Yn9Yux+Vi67TFhD2kZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwm19MfQLFYMEaHpF+50GvvhGNeqkRUXQdYfCrb3X5E=;
 b=k8JjviAMDf4gx5CWBRnFDV8dRck5gxZwVYYV0wPSAatZCeVYn7pfd+AXLvibMPyLn8Gs2yGGYnSbNz/qACQXO12o8K/Dc/6AaLWx4T7+y26STQHXBlk+bWp+Um8/a0O4qwdY5MH6wU7reaD3wDBInm4RPzqZK3jyEUt98f882ashUFsIslJJ7E6Y3jp+oijM0jEOoQzkNfU3EwxVp1G7Nae/O6T46u3umUZaR0vocxqucpgSmdIIjatarIKVXAyFnhDPcrYSDMqDoIetAqKDuIrglCWy17B5Sbjqke91SLx+QL8glw4Jp1f//fczhP44wK4w8ZseAdp75n0DeudZHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwm19MfQLFYMEaHpF+50GvvhGNeqkRUXQdYfCrb3X5E=;
 b=FLT8O90nGGVtn7XYlH9JCiz+LfUZU6A+LcSn0Mbqbz5XEhzTPL48uU65EGUe/CqOqIVMJDV3BOQvf0DLCWToDoMWRxYf/avv+7xaNisi6He17I2ZddL3IbwbZcMnvJNi/XEh4xhu+2NNN6KnME8qVMd68Ko8vQkXw/RvnG+IBIE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 13/24] xen/domctl: wrap xsm_set_target() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:50 +0800
Message-ID: <20251121105801.1251262-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|MN2PR12MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: 536e7e46-c303-4df3-258b-08de28ecfcae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?08YJzvRQ6DZaXTYa5PH97VDH9+1ic6fnf97OwLE84gAEXEY2ppY5T2wkyC0v?=
 =?us-ascii?Q?jF7QSqbdfXtNupBeAktzEbfH0yaFcKzz0Mm3hJdIp3SXUV17bM7lqhJO17t1?=
 =?us-ascii?Q?HhV0ehj9SOwcyQijaTsphwQijfbiIeBzfpjUuzOVc9mMUMPjCfTNz/oo3fRL?=
 =?us-ascii?Q?SpznNuyOnUo5MQlgh86lp5V58RQq9oAAJifhXPRsJ4IgPzXO0DZBj1OsCZBg?=
 =?us-ascii?Q?6RUxLJox7TpZFceiza7dHp3k/FOABRxxCvtm0SUc9/AiuJyQ0atM+jMUKqnI?=
 =?us-ascii?Q?yl8++vL7lp3pM+Y4wHpzQz5j+yB8BWc/wYEJKfC58Hjwhm8ui0KiGUYGmuc/?=
 =?us-ascii?Q?tbnzjFahXoNF6Te+Woj3l8UYwsAB1/q+XhcjMvVRUcQu/kex/Zn4TFecxbxF?=
 =?us-ascii?Q?OEMOx95QwZ8+8UBAa9yw1mlDZKdWtOFN8BA/3YwKLrV8UE2y9Tsr2PaS0ERo?=
 =?us-ascii?Q?A/SyRJeUdry4cx0JM6b3aL1Va3beVOQgcT3biw9uxJSgnAxu2KmYxZfEEt/y?=
 =?us-ascii?Q?eIpuEz2xKt9XfDk31NpDQ6TIiigJnKIvUDc018/uh4pFDhUoHHIxOl/rVSWI?=
 =?us-ascii?Q?QV9RBoZwJK/QlUQqYuf25aHhaBwOe3to50QqXmbobMeOMarFJzzsfRk+fSyj?=
 =?us-ascii?Q?oU74CVXuEytujp8ycxPF5gyqjjWI4mEBwJS+0jWOgLajfKYr0VVGPRZjTzSa?=
 =?us-ascii?Q?zEqIsfDiEy5dQF/CklKidY58pQZJ77LWs/I5+urZdHa1N7ujcHtzoWKBZK5m?=
 =?us-ascii?Q?mO4eYC6m73k2/9gnTzeJPjIwQNikAyK8oL5eJ++VvOVzpGMYMFDehAHxQs1N?=
 =?us-ascii?Q?ro1skVaMwzswDqaDOLNxdGLvcZZzl111imwQ7D956UoD6JlTvldXMfhy7ngc?=
 =?us-ascii?Q?+dgCaWUMHdHyXz1/VYiCZIMi/jHIjBFxtHTTXd9DVlfFByx5MLO/pZwNhjmb?=
 =?us-ascii?Q?FHr2tWJaQL1gYgDYRSx58HLfPF3lFezAydVFxsVqHg3dW+GvbtlCR5TWsgpJ?=
 =?us-ascii?Q?Dwc93LSo4FqLX7CzhDJSE8VPMDSuYQtrWR68q/+JqxsTRYMeY9HRh7n5/0ny?=
 =?us-ascii?Q?WBWVI7b/1HsQSF1f/hJi64FhUre/uc95BMf0DcL7mzN4Jl73s84IrnWtPh6e?=
 =?us-ascii?Q?IfFku2BMPrG52EEURPJdF8U/TySoYJyh8JEVewNXETu9EbQ00iUyqVyEE+Em?=
 =?us-ascii?Q?P3r4b39Ckqls11IWGFR8qkMdBCfBt6ElaR4NmK4k7YIc4i28HNGrWpCICWVD?=
 =?us-ascii?Q?dj7OfNb0h/tarW4W2GCbiY1iFGN928oL/iPdAmgphC1EwejgCnSHdf4R6uDb?=
 =?us-ascii?Q?f4fTsOwEWtDrX35PhFeTNSoxiFrh47z0bwRcJAgg3/5ckL5EfdDFjO9+8aLV?=
 =?us-ascii?Q?WK6QNjng877amkm7LpYKk8QGqoCw/u2d0zFbyxW32OfchmtZLeX8eubVP+uf?=
 =?us-ascii?Q?vjsHM1hSwSVTpRpq1oeEjTjUAX17tfwvJTu1JrINmofVr8PA4rBJf3Z6w1nB?=
 =?us-ascii?Q?ISBetj7eLQ5c4fgnTRNbok1PpyQshC25LdfnH9K7QhP4AZtr7QV70H62iA2E?=
 =?us-ascii?Q?WXr+d3veFvp5hy1dp8E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:04.9528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536e7e46-c303-4df3-258b-08de28ecfcae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301

Function xsm_set_target() is only invoked under XEN_DOMCTL_set_target
domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS. Otherwise
it will become unreachable codes when MGMT_HYPERCALLS=n, and hence violating
Misra 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
v2 -> v3
- wrap the whole inline function xsm_set_target()
- add missing wrapping in xsm/dummy.h
- address "violating Misra rule 2.1" in commit message
---
 xen/include/xsm/dummy.h | 2 ++
 xen/include/xsm/xsm.h   | 4 +++-
 xen/xsm/dummy.c         | 2 +-
 xen/xsm/flask/hooks.c   | 4 ++--
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index a5deb8a975..a598d74f1f 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -158,12 +158,14 @@ static XSM_INLINE int cf_check xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
 }
 #endif /* CONFIG_MGMT_HYPERCALLS */
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_set_target(
     XSM_DEFAULT_ARG struct domain *d, struct domain *e)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static XSM_INLINE int cf_check xsm_domctl(
     XSM_DEFAULT_ARG struct domain *d, unsigned int cmd, uint32_t ssidref)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ee43002fdb..154a4b8a92 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -59,8 +59,8 @@ struct xsm_ops {
 #ifdef CONFIG_MGMT_HYPERCALLS
     int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
-#endif
     int (*set_target)(struct domain *d, struct domain *e);
+#endif
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
 #ifdef CONFIG_MGMT_HYPERCALLS
     int (*sysctl)(int cmd);
@@ -255,11 +255,13 @@ static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 }
 #endif
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_set_target(
     xsm_default_t def, struct domain *d, struct domain *e)
 {
     return alternative_call(xsm_ops.set_target, d, e);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_domctl(xsm_default_t def, struct domain *d,
                              unsigned int cmd, uint32_t ssidref)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 7cf00ce37e..9774bb3bdb 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -21,8 +21,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
 #ifdef CONFIG_MGMT_HYPERCALLS
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
-#endif
     .set_target                    = xsm_set_target,
+#endif
     .domctl                        = xsm_domctl,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl                        = xsm_sysctl,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index ca07585450..9b63c516e6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -641,7 +641,6 @@ static int cf_check flask_sysctl_scheduler_op(int op)
         return avc_unknown_permission("sysctl_scheduler_op", op);
     }
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_set_target(struct domain *d, struct domain *t)
 {
@@ -666,6 +665,7 @@ static int cf_check flask_set_target(struct domain *d, struct domain *t)
                                  &dsec->target_sid);
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
                                  uint32_t ssidref)
@@ -1888,8 +1888,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
 #ifdef CONFIG_MGMT_HYPERCALLS
     .domctl_scheduler_op = flask_domctl_scheduler_op,
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
-#endif
     .set_target = flask_set_target,
+#endif
     .domctl = flask_domctl,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl = flask_sysctl,
-- 
2.34.1


