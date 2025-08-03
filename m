Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D6B1934D
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068396.1432433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMc-0003ZB-2Q; Sun, 03 Aug 2025 09:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068396.1432433; Sun, 03 Aug 2025 09:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMb-0003Sj-T0; Sun, 03 Aug 2025 09:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1068396;
 Sun, 03 Aug 2025 09:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKn-0005K3-FH
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:200a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fa4fe3e-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:52 +0200 (CEST)
Received: from MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::22)
 by PH8PR12MB6913.namprd12.prod.outlook.com (2603:10b6:510:1ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:48 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::6a) by MW4P222CA0017.outlook.office365.com
 (2603:10b6:303:114::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 09:48:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:44 -0500
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
X-Inumbo-ID: 0fa4fe3e-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQaZneFadSuc8APs76FQqB1QYVLExvGGhGsMl7Cu4ydqW64wdXz3J9mKms3ZsoQUSiMBnbelCAFp6SpCwCjVsm81KZevs+yaVe81jvcHBeo3PCpBTUw6ogRUnfYowjeq4LpVgTb1VEWDP7BewF0EXoaFYHB/SZetM0rmvbv+XxSN+f3SVnh6tJx7u/0rkfC0wTOjU4ecRPjHM8qEBh4A0cfFNB8BU9pD5rVKnvP6IhXWKwml+9kqvYW07mcvkOsOIU6t4PUsAgRn6Mmok8EuR1wEmaYcUW4K4vGQQJ9U+yyZZrLohSiRukPUvr1zPF6UIirckVn72K1wGqj0Oxtong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNw4NHXqbWOs8j23iJFcjSmDR7bG+jYlgp3Mfiza5hE=;
 b=mX+bNSlhigNT+AnVnwDHDtABdAGT5y5w13JZI7gdfLwKylTFhSl5ab4fS+pjviJU5d1iUf2+xlL3dAH2/w1REsruUj1B1MKyAHIO7Ynz2L8scq9bQN3yxzcfOM98aGusmW/HYsFxGl0XXop3ty3WICEsEr4y+UB9dkaM38cMy5Nt8r4wMU0121veJIjYae5WVnbqZ1HJWY4H4rvEcM4DCdZg4ykE/0m2WMBIXJ6N1XWsso5B7mXpclw30PbZ/J/XZkcm8rDzVppZ2IgIkrHsG8SbAeHuZhXes0Ef9YabS+wSOTlmwpGiDoRPDjpJBK/BLP0AMQ7WJprCQ5rf/08euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNw4NHXqbWOs8j23iJFcjSmDR7bG+jYlgp3Mfiza5hE=;
 b=RiaqpB508P0WH8HEkTJIuhyHUePxZOQSHskhCafaIVD3+cq60DLzQEXotHMSAUTOeLqL8Hswz9rklzQagAUNoGqSUo4PWkwmL3T5OUq3WmxFQJZQsa1KRyDSN4XTIJ0YFOso1HgcLIHoeVniyibf8RCw2NfBaJuWtjwx3qjuyZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1 16/25] xen/domctl: wrap around XEN_DOMCTL_set_target
Date: Sun, 3 Aug 2025 17:47:29 +0800
Message-ID: <20250803094738.3625269-17-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|PH8PR12MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3ce413-97c8-4ce5-d3fd-08ddd272f1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eOhBBPQg059xJuxTN+DNL0n7YeKE1F+VhhGbuIU7mk3gnxcJvxGqooUXRa4s?=
 =?us-ascii?Q?enFmJBtHe1KQcerQlkVgOJ/91ztDd79Bom743/p5uhlKMIJUeNBpYfHoFUOC?=
 =?us-ascii?Q?ANnasmGTKQ0kBjxmEFllISZML+rKyaNOJTxwcJaw78w8yTonjvQGuWGkDRlg?=
 =?us-ascii?Q?r0uOo0mofUo0VbKRR/WoVSzZVw0lugjnZF7nngrSuMRHwH9pd2BSwnrkW40d?=
 =?us-ascii?Q?HVd311eUx7O5KCtCr910aYymU7/hIDQqxPdVQYieL9Dg4V+QwkJeePkakXpN?=
 =?us-ascii?Q?c2p4LR9Uqzt9HefWyeYVBKwz8Ou/BrAW6PgADaPb1ObonztibTGkMCCB2ysO?=
 =?us-ascii?Q?S5PFCtdQ6tnPmm+0DEqql7AvCzoIgf1+30qayOurK72j881fwXCgC8GvbNmL?=
 =?us-ascii?Q?6glTXYSfvyV+TNcCwE6y3kXZVpJFRrBfmJy/gc4BhajpcdStm6WLolqC6Q4N?=
 =?us-ascii?Q?pvkjiLMFQRujiKRMldTpkW0e8ZM8ClZsIOSWxEAO2v+S68j64ooBSynbjvqr?=
 =?us-ascii?Q?aSLYq/QNEu9+xFy/oTzf9YAQ4OOSN+e7u+zB2V5gcF/KcP0NcDaKFDOaPRqr?=
 =?us-ascii?Q?vRplaYCjCRctHFRf0LzdpbM71AXYVjmM8J1P0MR0bcEsVl+RC2SPT7nxBRay?=
 =?us-ascii?Q?fzztdx2olTTBZUUoq5Xgjn6G2lgdCaW4b48jOwYP+v7DXx4X0KxMmIBkWHNi?=
 =?us-ascii?Q?Ku/jcupdJDVwe+sx6HMuVcxvN9iUVclp5QZUnGoWb8N+Jpma1ojx56W5Akd6?=
 =?us-ascii?Q?27rzhGRXdd85+elizO9Zl816jHEOiFnux4xAjSka4iAMEFglrt/sJahOY0sB?=
 =?us-ascii?Q?7q55Y1OhI5HuRKKqoLm3++C8V8F1vcjABXVdnR3sSVYVGVQvbg9joUk2I0j5?=
 =?us-ascii?Q?t9R5hZzSfczQOg4+FeqsmtYAicBZL29FYKfpbu0PM9odZVABX2GGIVzByNmH?=
 =?us-ascii?Q?HGNWK77L9hQ6T+j3B5w6vgSv1KwhFWZ1I2A6pZJG/s+CC1y0xRfONFbMrkkY?=
 =?us-ascii?Q?JLsENdw4ahgV0nThLJlhNnF2lQDgDFme8wi7jt9rNfVi7PZQj1T9dsSlx/5j?=
 =?us-ascii?Q?crhs73ddW/rT7HZxZ1hO7WC5+YQ+gvgSCqLXxmVuWHSSfe/6IhPtKTRBZIxw?=
 =?us-ascii?Q?LAghgZlqM9k0nF1HDMk7SvtvR/RAn/AFR7JiyTz9MzAEVuB6BU5jIAUfDBtS?=
 =?us-ascii?Q?rnS67tAHWpPRZvpEDXdFwb/obP1SP0wOTnEL9/rhM+PHd+jNqHLUESjcvgi4?=
 =?us-ascii?Q?A0IHgnmL8hvsRqD1byQIrIY5IUPPLyS9tYmskRGqsughxehTBNKvF62dvU7K?=
 =?us-ascii?Q?KqWjBVZ379Qb42ltpIZJnemXeu5AZRpQetRbWOLVv8UVwQcS////AzXAQkiu?=
 =?us-ascii?Q?YvedyhFA14RqXZj9EBoNd5OjaLMgWPOLodxv1HqCtxY0eBr9eUxBgwVHeZoY?=
 =?us-ascii?Q?3ZShmlAUvD7FUeviet4a/zTq7SnTbO82EIf0Mwu5aWvbfjPy4Pxrryarkaos?=
 =?us-ascii?Q?Ay95k6A9Bk+5oLEEKTufWkPVmzeXNC0arX/c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:47.9964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3ce413-97c8-4ce5-d3fd-08ddd272f1cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6913

Function xsm_set_target() is only invoked under XEN_DOMCTL_set_target
domctl-op, and shall be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/include/xsm/xsm.h | 4 ++++
 xen/xsm/dummy.c       | 2 ++
 xen/xsm/flask/hooks.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 1759d49aaa..55f8d0903e 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -62,7 +62,9 @@ struct xsm_ops {
 #ifdef CONFIG_SYSCTL
     int (*sysctl_scheduler_op)(int op);
 #endif
+#ifdef CONFIG_DOMCTL
     int (*set_target)(struct domain *d, struct domain *e);
+#endif
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
     int (*sysctl)(int cmd);
     int (*readconsole)(uint32_t clear);
@@ -261,11 +263,13 @@ static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 }
 #endif
 
+#ifdef CONFIG_DOMCTL
 static inline int xsm_set_target(
     xsm_default_t def, struct domain *d, struct domain *e)
 {
     return alternative_call(xsm_ops.set_target, d, e);
 }
+#endif
 
 static inline int xsm_domctl(xsm_default_t def, struct domain *d,
                              unsigned int cmd, uint32_t ssidref)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 2798425de2..cd5358dd1e 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -24,7 +24,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
 #ifdef CONFIG_SYSCTL
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
 #endif
+#ifdef CONFIG_DOMCTL
     .set_target                    = xsm_set_target,
+#endif
     .domctl                        = xsm_domctl,
 #ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 8361cf94f9..2975d2906f 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -645,6 +645,7 @@ static int cf_check flask_sysctl_scheduler_op(int op)
 }
 #endif /* CONFIG_SYSCTL */
 
+#ifdef CONFIG_DOMCTL
 static int cf_check flask_set_target(struct domain *d, struct domain *t)
 {
     int rc;
@@ -668,6 +669,7 @@ static int cf_check flask_set_target(struct domain *d, struct domain *t)
                                  &dsec->target_sid);
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
                                  uint32_t ssidref)
@@ -1900,7 +1902,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
 #ifdef CONFIG_SYSCTL
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
 #endif
+#ifdef CONFIG_DOMCTL
     .set_target = flask_set_target,
+#endif
     .domctl = flask_domctl,
 #ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
-- 
2.34.1


