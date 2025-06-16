Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB7ADA86C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016513.1393425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xr-0000Wx-Je; Mon, 16 Jun 2025 06:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016513.1393425; Mon, 16 Jun 2025 06:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xr-0000UX-Fi; Mon, 16 Jun 2025 06:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1016513;
 Mon, 16 Jun 2025 06:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xq-0008AT-8O
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:14 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:2408::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0960059a-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:13 +0200 (CEST)
Received: from CYXPR03CA0033.namprd03.prod.outlook.com (2603:10b6:930:d2::10)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 06:42:09 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:d2:cafe::67) by CYXPR03CA0033.outlook.office365.com
 (2603:10b6:930:d2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Mon,
 16 Jun 2025 06:42:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:01 -0500
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
X-Inumbo-ID: 0960059a-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZQKE99/25UYKWcOvuufFZ1Uuy0+RpgxsBXhTc5fj4IN9rNDEIpglJOr3Ul+tCDl+uolhoJBqVfm7bZbBm6t/IzihnLBN+jKvZ0k9n9gT0WqDeMrV6MMqhY+sHDH8SPUGPCkccOJRujLRR868dNZ1Arx74ba5QZlyBFqzEah7hIVTdzaUtONn1j9usvGxpPtTGwuXmQ9p9+YCaee7b1mOeonH4X0ezfRtKfWbgms/SvZC3SkOpAhAp9v++VV3MtgL193zahjTmP802dVdMyENIKFOt+5TzWzlfwshKm3O8lyYXp/kL4r4NQdVAKu0U4cOHbIVPSQ1pysK6ogLEGcDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=tReB95Q+XdncCgvwcwngKDLuIkYKWjitScK3aRfwFXNFgP+R5KmgCXESkZIFPKy1xvFa9yrZsJvtRbiIsMaNsRBL4/KUGKv+SB9v9zy/oAIv9scetiiCgdYR1Q7XCx6nJyI/c6Q2Xlf5bwpGJsN8OyiNL5VGpSkOSSWMHG9HLPKCTwJV7s1F9kwjFBCOQQgQHR0GYmJUg9vJTGPkn3jgW5usfZQHmuIkSTuQrCPHIF6c4A+7aoVuvBRU0pRom1mwlKM/Lb5arj1u7R6LSaQUqqMtdw4qb1jF6/xnrivDi2f2vo6Q/aKMg8DcHMdrQ6ttjgQ5+E9LuhjfvbFV2E9nFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=5h0P4pjkcg9umfrsEO71bRjjl1zDVa2eeWAcuVz+OV6tizxbBXo6LY1hP8NWb/9d+ByZtb4KdaBPipAtHG/uF8eZ+kWaKGfLU3FxYbexw2t/NLQ0MX8utgDBhnKoExcaxrtXOvfQ8ugqK98UcICsdrHTopVudmKwtVFJyYvkeZk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 03/18] xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
Date: Mon, 16 Jun 2025 14:41:13 +0800
Message-ID: <20250616064128.581164-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|BL3PR12MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3feb7145-1395-4aa8-04e8-08ddaca0eada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?puiweZT6bQFA7hMhsGJ+j96r8M0JOp81WJa1lzZpsFxKTohWAuw4kLQtr1L7?=
 =?us-ascii?Q?Btf8mRaWMLGZqNYH7Wm4nrTHvu937VUx4X+0O/cwNcyGVY1BTxpIEoX+flBU?=
 =?us-ascii?Q?DjAbb8eHO8QX2UOTL4xiT0WYXStav3l5y7yG0b9pRUYcbuoCV6HL5E2l6ZJ+?=
 =?us-ascii?Q?kcBz78hea34aOJLkvam4cu1Ex6GaDFuIZcgVG2qwG3mc2jEICA8oQUqdtsbY?=
 =?us-ascii?Q?nwq58Kz/+NymBM7N6FbiScp3PC8ESsM6so7rcNSmNUFTLTdV5Oa9Kms7rPaw?=
 =?us-ascii?Q?hDZgj1hdx+VHyeXEbfRQva/BG9dRjIpDN1W2wnVNEgE4Kfhntz8UH/4uj2/w?=
 =?us-ascii?Q?F0nB9yzKS1CBxuMgEtC4PSJTKdZAuFj9BURmK5bNP7OZCYfIr8PEXFHK6q+I?=
 =?us-ascii?Q?G7HyEqgasIcs9e+W7Mq2O9Pi9cTz8XTezmJi1EMk6+vWvR6qbQRj3C/g6gkG?=
 =?us-ascii?Q?7Gk9IPVvEDKgj5++is1xjwz1odpP/Z44HzcGuq0pj5cQCGyHTDmy9vEusarT?=
 =?us-ascii?Q?GVBwVSnVvdWHS3wblaj1zZ3R+SuTmFKnOdv6lD0m6f7STKoY1zXA11517Ygu?=
 =?us-ascii?Q?qGWGAj5imBF+vFGLcv1KA5CGgOcnA2q04cBECdeQ+lhGcyt+6gqR2sBTsLuj?=
 =?us-ascii?Q?rTbYbwgYugDErgURVwWnWCp7KrO8HevLrWwocPNCoedJ5dEo0LGusnCPRnGv?=
 =?us-ascii?Q?xhW8kX65IT/fWosrsVXtPa5jt9QpDW37BMUCs9pUbVdndg9oqw+8pIiHd9A/?=
 =?us-ascii?Q?lxWUXNQytLzYpU8N5Zd7/Nv1yMC2S5R3IHKGG2RVMYXnnZY1lKbayYwOaKEh?=
 =?us-ascii?Q?RSEr+IJvJ4UHAYIxy18LnuliwiaKF8yDMXVRdKKixSWkilNL5pj8mUi6utuh?=
 =?us-ascii?Q?1Ab0LKq5C+Nu6+dEP8u0wxqovyiyHZriGiqqMeDTYm9/PsIvOpNdV7qTKdni?=
 =?us-ascii?Q?wjx99GjT3gr+OcbWnIHHuAZMhpMsxFr6g8HFNZV7edV7GZrkawDiipysJGYs?=
 =?us-ascii?Q?N5egogI9fxO6WSo7nrxHrN3Xjk3bQOic63khoRFzGTywIgprRMUhNgsAGleT?=
 =?us-ascii?Q?IV+wZrUvZ2oebrmw5VxxTpaXHyCmPq2TOmxbpxgGZyzm5W/IrJVUvTc/bmAK?=
 =?us-ascii?Q?QaG10NRt8yCUhKBoBaZh4vFQ/SZ5C8UlW71gLoEnHrPH4FRwyN7y+m38j/Y0?=
 =?us-ascii?Q?gruVxVFIYsSBKni1mfKwl1AtQe7wYwa9TmU/Myl0sW1eVGmSpK/Oyr3fPQQG?=
 =?us-ascii?Q?GQjNAww+8dwLhP4vkofFbVHSzMTdo5CwIxfEU2iWSxRQyP567fNvr0gnGjW4?=
 =?us-ascii?Q?HkVa5SexL3bObgsBi1lvmhSg8JklBBYPRYyDP21jFrlrD546yTXSokhMENt5?=
 =?us-ascii?Q?l9xlq46ZoikoVWwgH9yPv05Ympe0VXvZL/RIe+errPdhaNKcHBoTFLojppCi?=
 =?us-ascii?Q?rCmSTjjtNVQnl+dvndV5+cQlcBvnuRbABS5Hxi0jLzU9ZPAGXoPz0ev8cQ49?=
 =?us-ascii?Q?EENTGESj5VHuN/1mI3pFDBlI2GlXzBVv5txK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:09.0378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3feb7145-1395-4aa8-04e8-08ddaca0eada
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449

As function xsm_sysctl() is solely invoked in sysctl.c, we need to
wrap around it with CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xsm/xsm.h | 4 ++++
 xen/xsm/dummy.c       | 2 ++
 xen/xsm/flask/hooks.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..22e2429f52 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -261,7 +261,11 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.sysctl, cmd);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93fbfc43cc..93a0665ecc 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -22,7 +22,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
     .set_target                    = xsm_set_target,
     .domctl                        = xsm_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
+#endif
     .readconsole                   = xsm_readconsole,
 
     .evtchn_unbound                = xsm_evtchn_unbound,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 6a53487ea4..3a43e5a1d6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -856,6 +856,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
@@ -933,6 +934,7 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
+#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -1884,7 +1886,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
     .set_target = flask_set_target,
     .domctl = flask_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
+#endif
     .readconsole = flask_readconsole,
 
     .evtchn_unbound = flask_evtchn_unbound,
-- 
2.34.1


