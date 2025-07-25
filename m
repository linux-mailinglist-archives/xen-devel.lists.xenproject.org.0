Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBEB11855
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057165.1425094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBit-0008EM-Bs; Fri, 25 Jul 2025 06:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057165.1425094; Fri, 25 Jul 2025 06:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBit-0008CV-7E; Fri, 25 Jul 2025 06:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1057165;
 Fri, 25 Jul 2025 06:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBis-0007jJ-BE
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2413::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d52ed5ec-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:16:00 +0200 (CEST)
Received: from MW4PR04CA0085.namprd04.prod.outlook.com (2603:10b6:303:6b::30)
 by SJ0PR12MB7066.namprd12.prod.outlook.com (2603:10b6:a03:4ae::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:15:56 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::f1) by MW4PR04CA0085.outlook.office365.com
 (2603:10b6:303:6b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 06:15:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:15:55 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:15:54 -0500
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
X-Inumbo-ID: d52ed5ec-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCvtGBiPMOMqh0yXdhsb6wsi9gr2a7wm67w7HerLaHAaev/iflCKUzJ1Xyun2wqbax3/x3hMdqyIc1izjccJiiqHFFKUfM2QBhRE598FGIuMEHpW9I65wITzdJQtCK3U65vBwFNpyBZuHIAODxa5cZFdl16KQHwKQFOiMQykX/+LW+sMXf1z9nTSZXhZBPGBcPrG1t67CjYs+uOfS75xevH3zv9F+U26YyzH+2ElY0eeuCm3gx7ahynKC+codvJDubdwi9YJdNzPCmIMuqhiuNyMwQa7LoMlFKeWtMqmENgMyPxWw18UVALHYfohjUfZZWA9AhF0oQV467qCoYFlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UtHWQF39zvxE0GFBiHiKFyLZ0dmoJQ/vSoS2CPhbI4=;
 b=V3bQiJAICKzRwntK1cqKb1JcJNc148ZEq1LDUzFiGeWaw/qwjBQiHXVXzpLA5FLFFij6MEvrooO45g+GibpAFl/WZRUH/+HlWKRsCiKpsIiLUpeLQySTuU9WDBobzGcM9rSDTLk7HZ8V1g5OPolWqcWkmBHYqawletGUTvEeX5pZM9aT8AcRwKTIFk7DyQGQqRPkCseNQZWM3y1bGYHzDyqNEAdt7oIjp4bAn2DfppRCo0xHKGiqFee97/XwTj4enMMj265sMjL29H5aEBs5cT3gieeo81oz8BbdHOPs9g9oP9VeVr/HvA2V5b0YFyllse3rHc3MkwWZI1jaX9SOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UtHWQF39zvxE0GFBiHiKFyLZ0dmoJQ/vSoS2CPhbI4=;
 b=EFwBNnC1nHoFGSU8kDD6wdaUCacXFUI8ezuntXbrwvK3RGRfl23DjBC60Ei89NGdJw8KmVv/yMAF0utR8wULwX/uK6l23EQysk1iw+aC6ylMwn8VGqb+XO6h4wxHmyGoHHhVZAaTWF5gD7+kIT8bFuIkGDNGDFlrl7daKpEf3Nw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 02/11] xen/xsm: Wrap around xsm_platform_op with CONFIG_PLATFORM_OP
Date: Fri, 25 Jul 2025 14:15:21 +0800
Message-ID: <20250725061530.309953-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SJ0PR12MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8981b0-6271-402b-ba4a-08ddcb42b734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EToaVpeh3rN8CWrG/YTcuN+uzTQA6Wmtir9V0x9EgZO1oUMj2dQBuGK6AYXo?=
 =?us-ascii?Q?yLV1cyCNjIfpuSYMQsAYx1agesT0olbfEcMEa6Igp903m4S1TkyfI01VfWuF?=
 =?us-ascii?Q?xQi2eXpsGUDgiHDZ1ER2M0v3imW23NoXfPdIMCTEDBVYfsUsbskn94+ZN4IU?=
 =?us-ascii?Q?Flu2IqeKjkXMBPePRUwcw3MlS1UGlN+dUP90aTmsBCDheZGqAy06U/baTZZp?=
 =?us-ascii?Q?sHDMudl/0iY2Nnw3UlRkscukOOYKutmfA2y5ywNxySA8yec7lz/XJk2epLCr?=
 =?us-ascii?Q?OVIFf7rl378W4XA/5A8HNYyHoM1+6RSy90nQrHkzmyFNjCozxRS2nsNPziFb?=
 =?us-ascii?Q?QmjDTh10S7pGo1uAn1W8hrROLYj9qGJZE65ZjMGegjHTh0iQL6kM3Kbb4MF+?=
 =?us-ascii?Q?pXaAjS3W83TOKsxNlOXMj5nK9XCH/gpqM3MsH8lRFtqocXK/1hxgakPWuL1b?=
 =?us-ascii?Q?0MO8IVQEq9tRGjGhBGG4cZK3TY22eiLTk5ar3rO97CWJ/jwb8u+o2rrhN3u0?=
 =?us-ascii?Q?HnETnptFJ3VNaT+9nA+60T0n6Smn7rkH/qza3Tav6MvuWGmZodJBjlww3Bg2?=
 =?us-ascii?Q?SsQiKon4F6To/L6GjTbBLLZZ6+jYVxSGqQJ44bCoVJxLeE66kzXb7eF5aNTt?=
 =?us-ascii?Q?UfO+tiZYphdKqKIB+SJ6m+JPoegPMrIhOQkS4GsuhjmhGddy3qkBdjEbXFb3?=
 =?us-ascii?Q?WgcvN9rgS5G9jVrZ3byeRfFqw1caTaCQjw27P/24AY7hwwSieJ+afBTqdjv1?=
 =?us-ascii?Q?1NAiQuezahP+map93FuWCPEiJCjzM5k1jT+McPjN1BxEbBk7zaGCQCSb2Q0D?=
 =?us-ascii?Q?/7ZHI0wLfbQa0WK/GEwymbVwKD+iT4Tg4yf+wkgUgHzYuRkkNieQZyTn0duM?=
 =?us-ascii?Q?JRYsCXeQ5h+v0VS/IgaEM9lKbrDsTmGSTI3ZT+eC6wS8iS98/6Rz2SETYUq3?=
 =?us-ascii?Q?JzsxEOneglUti+jDgA7S5QNpzsPGovNVFGW7suYQJWLMlYM4oCNcGM+EwkZw?=
 =?us-ascii?Q?ofRMuGxWwmGKbDJtzSi3soAUrP9I10djOkRwMEh01oQNEXB/et8H8bQ3fbss?=
 =?us-ascii?Q?Df6ysaebj8DKCitnLI77Zgw6oedoY9EFQuqPll903SBWiTpkADgHhb3ubkki?=
 =?us-ascii?Q?ZR8pnHYHCwcTdcshrIbvIszFJ4r10CG90MEUWMmSvk0Iv9N1VfRITSUSkMlL?=
 =?us-ascii?Q?lGC2pZPQ6ZV2Bv16/4I90AxFsKwcxyuDymQcqLCNFK6frsR0XxguTwW4sOyT?=
 =?us-ascii?Q?kIOPUaRFVgpWLCn3OdFbG0yfVz2Bna+WKcILNr00d7Yx2LKd5wsJsjlgQxgh?=
 =?us-ascii?Q?O5EFFb0YmjappbjdWJZBTvlIAP64MnlvczIHWUC59PgbvfkUuHYBjb4i4pac?=
 =?us-ascii?Q?Eo3JbqVAXQL1DMy5divBI6jXTAzrTgm3JROBKhd2ZotvTY0DVKjCocHSXNVZ?=
 =?us-ascii?Q?cj6+QmBhmkRdzgpRcd1iw2dba+384OQzFSAGVPUwpSqM9ywd9nYVtIy31LRj?=
 =?us-ascii?Q?fgT+Gr2lOy+LJ4NfonXvpPQYQ5K4pfoZm5H6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:15:55.7103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8981b0-6271-402b-ba4a-08ddcb42b734
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7066

As function xsm_platform_op() is solely invoked in platform_hypercall.c,
it needs to be wrapped around with CONFIG_PLATFORM_OP.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h | 4 ++++
 xen/xsm/dummy.c       | 3 +++
 xen/xsm/flask/hooks.c | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 9a23d2827cc0..bc0a0776c895 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -678,7 +678,11 @@ static inline int xsm_mem_sharing(xsm_default_t def, struct domain *d)
 
 static inline int xsm_platform_op(xsm_default_t def, uint32_t op)
 {
+#ifdef CONFIG_PLATFORM_OP
     return alternative_call(xsm_ops.platform_op, op);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 #ifdef CONFIG_X86
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 8b7e01b50690..d9f4d3ee12b1 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -129,7 +129,10 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .mem_sharing                   = xsm_mem_sharing,
 #endif
 
+#ifdef CONFIG_PLATFORM_OP
     .platform_op                   = xsm_platform_op,
+#endif
+
 #ifdef CONFIG_X86
     .do_mca                        = xsm_do_mca,
     .shadow_control                = xsm_shadow_control,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b0308e1b26e0..a56a6d07475c 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1527,6 +1527,7 @@ static int cf_check flask_deassign_dtdevice(
 }
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
 
+#ifdef CONFIG_PLATFORM_OP
 static int cf_check flask_platform_op(uint32_t op)
 {
     switch ( op )
@@ -1598,6 +1599,7 @@ static int cf_check flask_platform_op(uint32_t op)
         return avc_unknown_permission("platform_op", op);
     }
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 #ifdef CONFIG_X86
 static int cf_check flask_do_mca(void)
@@ -2000,7 +2002,10 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .deassign_dtdevice = flask_deassign_dtdevice,
 #endif
 
+#ifdef CONFIG_PLATFORM_OP
     .platform_op = flask_platform_op,
+#endif
+
 #ifdef CONFIG_X86
     .do_mca = flask_do_mca,
     .shadow_control = flask_shadow_control,
-- 
2.34.1


