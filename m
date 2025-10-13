Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C4BD28EB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141997.1476228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlV-0004Ba-C2; Mon, 13 Oct 2025 10:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141997.1476228; Mon, 13 Oct 2025 10:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlV-00043N-1J; Mon, 13 Oct 2025 10:26:53 +0000
Received: by outflank-mailman (input) for mailman id 1141997;
 Mon, 13 Oct 2025 10:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fbz-0004Hi-TU
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:03 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c33dedf7-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:17:03 +0200 (CEST)
Received: from MN2PR13CA0009.namprd13.prod.outlook.com (2603:10b6:208:160::22)
 by IA1PR12MB7493.namprd12.prod.outlook.com (2603:10b6:208:41b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:16:58 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:160:cafe::dc) by MN2PR13CA0009.outlook.office365.com
 (2603:10b6:208:160::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 10:16:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:16:58 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:56 -0700
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
X-Inumbo-ID: c33dedf7-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1+G9L21BsDED71kHHOHJ6TMZNGIt8fcxO1hgq5QXauAKmiAt6Hxxjwget8dOVKVSWwu/oWZd0FzGEUbn8n/8mJwOJo6y+RyBlcZWAA37uHhE9pSnm0HnNsssMnwIZzyPJqFg+n5vLAQw5XxS2UPuUXveDJa0rv2teIRUgMElMewqgkhI4Vk0VjNe3z7VfELPbMI3b+izKnZRv/ZgCicdtb486o5wUxOpIuAp3FnuRa7vM7kzr+Lzm9CowWm1sTGAf0SEmuJ1Ph01aAscQ/9aWC/FfZBGPN/C5escrM+8OjgYp/vV18Rnrumxp6r+ulBiJlaTQwdHYI34EiiRbeXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdvPEZ2scCdoBxds5R/emB+qSdBN/E4FObfCg1uPq+4=;
 b=yu/2zUHVWzSWV3nR2htMKLJJbdkWKAXyiEVWVDNtcYyYWSstAQnVUTSlSsDEyLD1N54QdYQpcnVnwe+R/qhfiltoNY0BNhf0kyhMaaHqFWyN+q2vy8BsQc4bneTZBNtWzTRP7T9ZjRr70t2UrQzhZ/LNRLmDfhyeM9EIuYsdCKDnO1FvOXjcUAZtgg8PtYzzMJgMKYpBi53WHUiLBpoZlt8nyn9OEyRff0AsJA0ifs0xbJqXaQ91by3L9n+unHgK0giZnq7DiJLTC5iB22XEWfYBxVabiPqRUzx2OgGA5nuNNHuiZTLWeyDpO2xW8y4b8HFezDC1PDpqzH0hMzCVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdvPEZ2scCdoBxds5R/emB+qSdBN/E4FObfCg1uPq+4=;
 b=g9Xk23llhwBENUsjorLucAxJcKvxAXU9K0qahMI261w0MZhPilx8YNvDvGCECAAtgLIxwF/sUQpc7njnfOdYQSqqnWAtp1hUcU+BC5MshXNUChNJYyAntFREui/d921bNLWLDYMrTFTMo0oelPkfbTxh9guAJ8bKH6xI6OTEXmE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 11/28] xen/xsm: wrap xsm_vm_event_control() with CONFIG_VM_EVENT
Date: Mon, 13 Oct 2025 18:15:23 +0800
Message-ID: <20251013101540.3502842-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|IA1PR12MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa4eacc-63cb-4a6a-5707-08de0a41a495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tJJQJHMdvEn1jECnrs71ykXMIQq8L8zl+izYhNLg5U/XpNFkigwHRQ/81z26?=
 =?us-ascii?Q?kArGfD/N3UCWkmcUQ8es6WTyNfAEkDHkk0u6GE7q0FaLku5sekVP6KgUez/P?=
 =?us-ascii?Q?nYafjX/AvweP/V54XxBt7K+zqzsjsGgNWJS21iVsdyWSOYM/lYkUG/xTFZV4?=
 =?us-ascii?Q?vQxMigA8EnQ+/GLIGqxdb1SvnbXbSUUuKF266vWnp4yxe3nEHl3W89yXuMxc?=
 =?us-ascii?Q?J4j2FClN3+E0Os2f8SHx+97NxG8aTKTDmXPmNObReMMlzApQXu3+K126hX1I?=
 =?us-ascii?Q?gFGvUUX+YYFrOBUksxgmskDoApzj8ZQN/bqu7bv6m1NbsbtcQZNcJbtCN2H+?=
 =?us-ascii?Q?NIkTIr0pSGxflX4BegS9vKwXwAbD4vZMINRVaSvZvm4bQY2sRmXqLqhdb4Jz?=
 =?us-ascii?Q?+eOn7xtE6G9ty79iHDANI9OGH7+evn0vfkxiAt0ObE5n83gpBJ6S7x0Lp4Zt?=
 =?us-ascii?Q?mQuTH3LuoVDZUMONXzWi5Do8s6ZcH9jYZ6pq3XJ5ntfqALfDX+PXtUPmvSRW?=
 =?us-ascii?Q?6tY66CEjzioxnRYfv5jy8TPY1fk1/jP7zYaxtttfxDUE1nguaOE9Oc/PY302?=
 =?us-ascii?Q?+Yl17CxJxaWVlXWGHYUTXQChlNzpBjOHeNnfcpRU+wCy3lwaIi90NsX27mny?=
 =?us-ascii?Q?kHf2cU6JB766gYvmgebu3LMQS2F1TLqO95NENx6iZvwj5DGz7ro74EhdeANi?=
 =?us-ascii?Q?R2cBF4mTnNw7ZIp5wZIfOsFxeBM4bz/NqEAZYFOdgOoRu+YU0ZyJEDx0m6Pv?=
 =?us-ascii?Q?pZlZUBytjrnMUTNMsG93PEk1yikxp6uz9N4pGYQeOy8peKjBe8LYyjiMbHOw?=
 =?us-ascii?Q?R/F70Zgb9K/214VIDh+r8HwgtdbuhJy3jRLvg+Kfg7gpP4+ZEXzlA7C9QWYI?=
 =?us-ascii?Q?qZUfswWvrhFZ5Zm9RE8yrebUR+bmqlzgrtPm6LDI4qae+B/OGTLagYwZc7YD?=
 =?us-ascii?Q?SuPWoVJwgOr2RHkdV61xw/V68OQ6d+iZ4E2ydSdLJwK/p/GQwFOt5B8FJCzC?=
 =?us-ascii?Q?ZVsEq/kyzpaIKDqZBxmQ38yE9W6P3i5vMZeX1yuDzL9zNyxVO/iTaTPATg4H?=
 =?us-ascii?Q?bQ7AwDTmjGfkw0FJFML5D+J/M39I3stE+617Qx0y2WqRPWtH6YPa4sRLgxuG?=
 =?us-ascii?Q?/EI3VAfnR8gChbDol4vMdlXweJE3YFHhvflIHSVerJK+/yorP3iLchlIqygt?=
 =?us-ascii?Q?0ds/JDSM/JYqqS82AV7i96uPSf5RYHHIeZQxCvELAgbbO83iITGKayBmcK8W?=
 =?us-ascii?Q?qGzXBSiE4YGLkgaAZ6AbTAgl0TRA7Ve5TF4TdugMtuKNg7KPpvYWN7ROSFst?=
 =?us-ascii?Q?/7HAPJmUOyNyVG84pSf80tSfhWWwbzF7AjZb+X08FW2lOH1Q4kXqfRvuQB50?=
 =?us-ascii?Q?swntxXrsOvWHUQmOuswrdR2h45Qh/U0Th91QXFJqqK2hdt8wyPCSjxr2STDl?=
 =?us-ascii?Q?PPBkKMdpl8JAtFgq1PfNxxwXqq6zWh+xUhvm9JiAJBAwkR1tz0QdiulsxVj3?=
 =?us-ascii?Q?gWUS59bWnQrUY3GkM1jdJCmFMOrjnYsUqPF/uXF8I2t8EcoTgyBZqfdgp0sk?=
 =?us-ascii?Q?Z55x891/vRbSLyk0e9U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:58.3168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa4eacc-63cb-4a6a-5707-08de0a41a495
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7493

Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
it shall be wrapped with it, otherwiae it will become unreachable when
VM_EVENT=n and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- new commit
---
v2 -> v3:
- address "violating Misra rule 2.1" in commit message
- add missing wrapping in include/xsm/dummy.h
---
 xen/include/xsm/dummy.h | 2 +-
 xen/include/xsm/xsm.h   | 4 ++--
 xen/xsm/dummy.c         | 2 +-
 xen/xsm/flask/hooks.c   | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 5206836582..9b1d31b6ec 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -639,6 +639,7 @@ static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
     }
 }
 
+#ifdef CONFIG_VM_EVENT
 static XSM_INLINE int cf_check xsm_vm_event_control(
     XSM_DEFAULT_ARG struct domain *d, int mode, int op)
 {
@@ -646,7 +647,6 @@ static XSM_INLINE int cf_check xsm_vm_event_control(
     return xsm_default_action(action, current->domain, d);
 }
 
-#ifdef CONFIG_VM_EVENT
 static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 0231a208ff..4c6e0dc0f9 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -155,9 +155,9 @@ struct xsm_ops {
     int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
     int (*get_vnumainfo)(struct domain *d);
 
+#ifdef CONFIG_VM_EVENT
     int (*vm_event_control)(struct domain *d, int mode, int op);
 
-#ifdef CONFIG_VM_EVENT
     int (*mem_access)(struct domain *d);
 #endif
 
@@ -635,13 +635,13 @@ static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
     return alternative_call(xsm_ops.get_vnumainfo, d);
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline int xsm_vm_event_control(
     xsm_default_t def, struct domain *d, int mode, int op)
 {
     return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
-#ifdef CONFIG_VM_EVENT
 static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
     return alternative_call(xsm_ops.mem_access, d);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 7892d36cc2..dbe363f0de 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -114,9 +114,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .remove_from_physmap           = xsm_remove_from_physmap,
     .map_gmfn_foreign              = xsm_map_gmfn_foreign,
 
+#ifdef CONFIG_VM_EVENT
     .vm_event_control              = xsm_vm_event_control,
 
-#ifdef CONFIG_VM_EVENT
     .mem_access                    = xsm_mem_access,
 #endif
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 2eabf62e8c..d0fd057db5 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1360,12 +1360,12 @@ static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM_OP);
 }
 
+#ifdef CONFIG_VM_EVENT
 static int cf_check flask_vm_event_control(struct domain *d, int mode, int op)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
 }
 
-#ifdef CONFIG_VM_EVENT
 static int cf_check flask_mem_access(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_ACCESS);
@@ -1961,9 +1961,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .do_xsm_op = do_flask_op,
     .get_vnumainfo = flask_get_vnumainfo,
 
+#ifdef CONFIG_VM_EVENT
     .vm_event_control = flask_vm_event_control,
 
-#ifdef CONFIG_VM_EVENT
     .mem_access = flask_mem_access,
 #endif
 
-- 
2.34.1


