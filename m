Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB8ADA88B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016592.1393526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3gW-0007NJ-Bv; Mon, 16 Jun 2025 06:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016592.1393526; Mon, 16 Jun 2025 06:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3gW-0007Jr-4v; Mon, 16 Jun 2025 06:51:12 +0000
Received: by outflank-mailman (input) for mailman id 1016592;
 Mon, 16 Jun 2025 06:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Y7-0008AT-Gm
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2415::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 121decc6-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:29 +0200 (CEST)
Received: from DM6PR07CA0122.namprd07.prod.outlook.com (2603:10b6:5:330::18)
 by DS2PR12MB9639.namprd12.prod.outlook.com (2603:10b6:8:27a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:42:25 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::96) by DM6PR07CA0122.outlook.office365.com
 (2603:10b6:5:330::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 06:42:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:24 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:21 -0500
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
X-Inumbo-ID: 121decc6-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGrLl+n8Nw6uW+xMdOhSMnfCeJLvrFaCfI4ifxcbKe8QzJdl6csF/pVMN3oCZBQZndcbnnUPU0GFLQ45yPl+PBtcEthrd/DqVlefWcRx+Kvl32ldxAtrhzpoS+A31mF6AduQk+tdHkS/GtOLVYvqNZ5uArgwcUwmidyNV7mIbN8wZRzdzCBo8ojVrQdBKrtrgf+gyYST9hQgmdtcftViheoB2b5JwkvWD7U5PNx+0WzL2vsO7JMwsmuwSVO/VhfSHalxLjotd81ZVX+6STIcRA34eobmYr9eFE62SdkWRc1vOFJbDzF0eq3UjFqPGrAx6TaGw8+4tiQi4BOR8mXmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WurO22YY37NaFn6R/aK5cXS4C2DatHBPKOP8khrxpEY=;
 b=R6JBIlaB/wdYZbm1X5QOTtxvAxFXABVH8R2i0yZFKpaFOpcY1qrsL6RHVQJsz5jU8SXXyrXIs2OU281YzbRtHKzpNba7XfXVG7R7XxQEre8HP/4jK3GmhbiLUN9V+7AAPDuCQRTw5iLnrOBAMCWroXbNUf5gaozEWNqL7ZsDgHVV8r1QYjPGZbe3Xe/5LBwRjdB1y+WqhP7aLHjG0ZGdp1K5AZ2BCTJ9QmUrRXpn4TuD3L0SQrMyaBBXIYxwOj9F8tKLOoyIa/p/Al7FF4n3WJc7NIbCjgsDl9qf8TBsfVVOjFlePsXdFGm18t421/lUIz0rAnDEnscA4LEoaU8o4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WurO22YY37NaFn6R/aK5cXS4C2DatHBPKOP8khrxpEY=;
 b=nKgeLYRnT1EfWUqEolHqVU9iIL9ROQ2OusMfrYj8U9qSUyURru940W1dGTVI1oR3ptn7tJGxFqQim1s4Ohk2ID42wPL6HBHv0rk6jBRCEoIJkTac6mD45MulRjJFypIY2e/UrDEW/DSfhRe9pisYwJ2HSQro5dgbS77tQt0VcEg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 11/18] xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
Date: Mon, 16 Jun 2025 14:41:21 +0800
Message-ID: <20250616064128.581164-12-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|DS2PR12MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a2a4c7-f714-492c-146c-08ddaca0f439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iMSFsTMFMZt4/C7a3KdBnrqTtfGAMSunASzQSIfjnt24JURIZu75F8Pa46jT?=
 =?us-ascii?Q?/zqKamm5oZsewwZ3/wXJ8IfGq5eRmroSlmpq+qEUYZ1y7YN8NILVSnx49fm3?=
 =?us-ascii?Q?2ShMBZfvuZ5gAoOr6Dzc5xQcuhNTc8a0dP0lA2Xq7NoMbVpmfiUlLH+S0Jgv?=
 =?us-ascii?Q?ae1jLJCwAo7pSYx14UTHc20jM2vYRT9swDeu7kTVcKs7hbth+jCUDverLIKN?=
 =?us-ascii?Q?Uat9EqFdLTVyEO25E2ZJssNqAmWijBc0m6uaBeuBSSv4CwBosGYYUUT/2ulc?=
 =?us-ascii?Q?7+VZXmjx8xucEAXHjBDy6z2SYrtUDBeMSLZJlbJYQCbT8Uv6KKUqkcXvr082?=
 =?us-ascii?Q?NW+QEjTDy/OgMgHyP1LQXVFQ3SkWf5kbLqOxdB2IkGSqV50ZgPt+EnEXgNiL?=
 =?us-ascii?Q?JXJMFL9IUNX9iddauQkbrYSRWPXSvKQQ9HY4NSDwvt7kXHqIdg28oc7tOtFn?=
 =?us-ascii?Q?PurxAcAhJvBT6wvUPO0meEU2DCMLE6V7u0cDgCwcGpbMJ3e25WDVrv0e1zTc?=
 =?us-ascii?Q?byuXj3Rup7hgr34PK+iWwBXtN6ySMG2g5gICBf7tUa5PRwB3UhcCGx3Mwhdg?=
 =?us-ascii?Q?Xj7vEdzkNxHD2EKikp1I/iue91H4QvzPWABwTfBfFt+nvqTaXiNX89usU1nk?=
 =?us-ascii?Q?equO3zS7sMbb9Elkfm56u52uMIL1q7QJbNCkNj6IVHwwz3eh5zGX08Zx24hn?=
 =?us-ascii?Q?0jv5Q21TsDXaw5steX37oSy+pfj+Dpvonz4MndQNsBaGdxQTsP8LrSkEK0Fa?=
 =?us-ascii?Q?FesvvQmjZ12IDAq/ESeeHsJupol3zxQCWaE73pPpWbtu7kbx/YYBS0mbbtxP?=
 =?us-ascii?Q?unxA28Dyeh5ki8KRFd0q2xgOoKtt0yJl1msa4iO1nJcaXsz/e15T2JnxsjWZ?=
 =?us-ascii?Q?uUAmhHVuc1IIL4WMORNQtcgZ2gfiPapMPbtBrsgCxouV+3sF4VHDpsGCmtIQ?=
 =?us-ascii?Q?+MYMhhwMRZy8TEiJEznRFZmsKLcQ1Wp4uGdX/gUVc+6aUN0uK73aXJRf9ihe?=
 =?us-ascii?Q?+1PGwhtV+ePLdRBhjYkN15LRO9tAz+lqY4Mfqi9CigIPY9TszXwp3T3fYTZa?=
 =?us-ascii?Q?NbdjBdGLUuNNsO31B32hxwbJzDLB1NxCRF/+RPe+7N4ok67Da5UBUwuw0GRR?=
 =?us-ascii?Q?JEU84Gfn5w7TuN1zLUeAj7Vdej02xtQZAsE7YqGQfb2H6XA30h+6j0AJfaQA?=
 =?us-ascii?Q?jNZrVYqPP6HhW55QZjWXJTsmLYpZkRwL/TRRyxlwq9TsnLxUjYRNDAfnBLYg?=
 =?us-ascii?Q?rlY2y5+1TZ4adHWDwVA5YXwdTA4K8iF2xo1Ax0pb7OuwKZew60xNjjM4m4KR?=
 =?us-ascii?Q?YPY8YDZZpuVE30GiqZsSHUp6cDyg66cFGtVE7E9I7Mi9fpFODLq16cUMPNm/?=
 =?us-ascii?Q?bfj1BMyCuBbwyXc6L53Jk52PVnutpCNaKfe8+247/EGZw9VojmI31vVqfULM?=
 =?us-ascii?Q?imqSi85nNf59BOULowM7og7fN63CGw0wAmq38QjTi8tVaetzNc1HGQvbpnWn?=
 =?us-ascii?Q?wqXqSygHv5mXKKeIcFlvfQJFeNAiLHSkdYqf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:24.7566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a2a4c7-f714-492c-146c-08ddaca0f439
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9639

The following functions are only to deal with XEN_SYSCTL_page_offline_op,
then shall be wrapped:
- xsm_page_offline()
- online_page()
- query_page_offline()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- add transient #ifdef in sysctl.c for correct compilation
- no need to wrap declarations
- place the #ifdef inside the function body to have less redundancy
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/page_alloc.c | 2 ++
 xen/include/xsm/xsm.h   | 6 ++++++
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 6 ++++++
 4 files changed, 16 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b204f22f50..dec4cb2ab1 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1779,6 +1779,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * Online the memory.
  *   The caller should make sure end_pfn <= max_page,
@@ -1863,6 +1864,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * This function should only be called with valid pages from the same NUMA
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 042a99449f..5ac99904c4 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -138,7 +138,9 @@ struct xsm_ops {
     int (*resource_setup_gsi)(int gsi);
     int (*resource_setup_misc)(void);
 
+#ifdef CONFIG_SYSCTL
     int (*page_offline)(uint32_t cmd);
+#endif
     int (*hypfs_op)(void);
 
     long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
@@ -597,7 +599,11 @@ static inline int xsm_resource_setup_misc(xsm_default_t def)
 
 static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.page_offline, cmd);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_hypfs_op(xsm_default_t def)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index cd0e844fcf..d46413ad8c 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -96,7 +96,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .resource_setup_gsi            = xsm_resource_setup_gsi,
     .resource_setup_misc           = xsm_resource_setup_misc,
 
+#ifdef CONFIG_SYSCTL
     .page_offline                  = xsm_page_offline,
+#endif
     .hypfs_op                      = xsm_hypfs_op,
     .hvm_param                     = xsm_hvm_param,
     .hvm_param_altp2mhvm           = xsm_hvm_param_altp2mhvm,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index df7e10775b..45c12aa662 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1206,10 +1206,12 @@ static int cf_check flask_resource_unplug_core(void)
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__UNPLUG, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 static int flask_resource_use_core(void)
 {
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__USE, NULL);
 }
+#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
 {
@@ -1274,6 +1276,7 @@ static int cf_check flask_resource_setup_misc(void)
     return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 static inline int cf_check flask_page_offline(uint32_t cmd)
 {
     switch ( cmd )
@@ -1288,6 +1291,7 @@ static inline int cf_check flask_page_offline(uint32_t cmd)
         return avc_unknown_permission("page_offline", cmd);
     }
 }
+#endif /* CONFIG_SYSCTL */
 
 static inline int cf_check flask_hypfs_op(void)
 {
@@ -1948,7 +1952,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .resource_setup_gsi = flask_resource_setup_gsi,
     .resource_setup_misc = flask_resource_setup_misc,
 
+#ifdef CONFIG_SYSCTL
     .page_offline = flask_page_offline,
+#endif
     .hypfs_op = flask_hypfs_op,
     .hvm_param = flask_hvm_param,
     .hvm_param_altp2mhvm = flask_hvm_param_altp2mhvm,
-- 
2.34.1


