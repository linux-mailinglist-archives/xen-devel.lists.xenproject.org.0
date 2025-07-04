Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30073AF8EA2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033107.1406608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckt-0002OW-Go; Fri, 04 Jul 2025 09:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033107.1406608; Fri, 04 Jul 2025 09:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckt-0002Lk-AW; Fri, 04 Jul 2025 09:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1033107;
 Fri, 04 Jul 2025 09:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckr-0007ek-Fo
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9098c61d-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:47 +0200 (CEST)
Received: from SJ0PR03CA0371.namprd03.prod.outlook.com (2603:10b6:a03:3a1::16)
 by IA0PPF52B16157D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bce) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 4 Jul
 2025 09:30:41 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::31) by SJ0PR03CA0371.outlook.office365.com
 (2603:10b6:a03:3a1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 09:30:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 09:30:40 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:35 -0500
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
X-Inumbo-ID: 9098c61d-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqUzTNwDVy0b1J6imkRX8pbDzCWPPZlkhUWcReumtK95XRuL+F6xW9mGthSMKwiRUaOLO2k2qpD8s3n7T2bzI38KwhAcWMuO/+T4Z9jNPvQz0Y4Hpk6Tey/18aRMBZ75jXQR1cpOjeLP/KI/cUpZxJn8qlwvDUWRw/ujbLFdHE8JOeZdftHxHGFNUau6RV8SxUcyLYQT5v3zo/xvMrOEakzo7Iyi7JLpV6ADTr0uDyMyXhBgenPg4emiDNpK2vLHAnHg2SXpo3JUjmRUSbIMuL9gzLgnwuj6frTn+o7c7Ja5AfO9sumZS/dYng2NcqYOhEpCvQLFLZI3cokg/fcavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WurO22YY37NaFn6R/aK5cXS4C2DatHBPKOP8khrxpEY=;
 b=lTmqyuxtnENYcuNgTXVkcTI+OltQhtmh9avimbeGWlXYp8awM6sYRq0BWlW1rU47aHqvzl0ROzbvSBxC6QOYq+1pQ0D2C2jTaZazyPr7tfKAmar8IT/YlzCENY4URCPIH/n0QzrbYAozJa+s3yJufRZZVJkODri1bIhcPLJmiMZH6MgeWXFj6B2OjbdL9rfKSsCwtB2ejypjIL+NWm5InudnYUbfUwayHNXd6ypWIOhpGRiO1DoL0rxSRsZhhPxHNGR/q2BQmiLMmLcix7KT6ZOP8xK29hVVLDcxP7uQYrvbQd+6/oe74mTW+kELmZruFklH4oBwrC+AtCyvjdSPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WurO22YY37NaFn6R/aK5cXS4C2DatHBPKOP8khrxpEY=;
 b=ADXKVOXkCXiLomUbkX/KuXx7IvD9R5WXH+uWCvjJSlipAxjzul97Rwpat/MMI+68zo1Jgx2jyxo/S6A1733hXL52toYOost2HT37YVcl9S2ROjfsmmxP1s+M5ZnhDH6XXXQ02oPSytTheQA5gctV6Bz2X7q9QaAmwWdXLE6nsdg=
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
Subject: [PATCH v6 10/18] xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
Date: Fri, 4 Jul 2025 17:29:44 +0800
Message-ID: <20250704092952.822578-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: 089c99af-e3be-4178-90fc-08ddbadd711e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RP/1+kq+do44HvKC3w0sYbZguXB6v5DFu/EDgC+C487ZZjTe/Mo0SvGLlk7u?=
 =?us-ascii?Q?OQHgK1q8SFsa4jET9lj0f5fF46aeZRAoJkC7H0OjmJgaJGTt04DOpBKTp7V/?=
 =?us-ascii?Q?nYT1y3NNTMkpUjJUt1bgXjIXmKZ4sChvSIJf14vDPJBDKT6TZnupR0L5g6JR?=
 =?us-ascii?Q?94s9hGrftk3yN7ZOsFiPNQhmaTXL/QjQKn15DeAbR4cEMKuZkM+ZkoorBpZw?=
 =?us-ascii?Q?oilkJ5gTRASHiH20uARie+uHF4IougWpdmUxjB7IQycWBW6dAw22TTfiSNG1?=
 =?us-ascii?Q?XECyCDZSG68V3R3+mXi9dVY77LluhXYlCyGUrbDIZB5ZThxSxT/c8+q8Lv9z?=
 =?us-ascii?Q?Lf4aovEJCm7bffTIHTORM+bv09f/vDHNMiR5G0CtHCIS9bbRknFOJ/1alGQK?=
 =?us-ascii?Q?8xpQi9X8Iw9d5Bu1+bxqrmULlWkpHc2LNLCnZpDumHC25kpyzMZEqXZ59NNf?=
 =?us-ascii?Q?Uwz4rP1Bbn5oQe19krT+fmKU+fbVlXXfxj4dwc/k6hXDcg50dGiT1tEWdmt2?=
 =?us-ascii?Q?bR9QFj52K1egvvj1AHLaPlXlVJQNMqy1UQQLqbUIYtHnt6Jn/GZO15G80b5c?=
 =?us-ascii?Q?DfKNZ28CNZcw0qkj10XBhueupratZhF/h6bf2+VC2DgsFo1zJ7IfhBQD1jc7?=
 =?us-ascii?Q?CvEXpjTqpAUKc1dxNjdyDxN7dKNWQDRxsQ5wtLEK1UrO72WQSFNBVKckgjGp?=
 =?us-ascii?Q?H+utGuPLHeHsuGezGci6WpFVdcAzKwlL7GvMnWfxfKhVwXGqpMAlN+B3dazh?=
 =?us-ascii?Q?0La9HWpc5s1fYGizIaXSo5OXx4X08Ir0vapkhcTpN77CoysAqxDcIfK997x0?=
 =?us-ascii?Q?qyXPR3IXCzSgkTfY81yvmVAiJ9Sj87V/HmsiP2f8S6OHj7uCcfdN+NdlYkru?=
 =?us-ascii?Q?ZgHcwpWxLNZdFiLqpI1ZyTggEvoFPpA5PSJsmUSEVijc6cMy725ezmIDOgGD?=
 =?us-ascii?Q?bKUMPuA8wovl4kHr5BusXpkPcHI/xO99X1P30MEIQZ92JdkGUnqiA4ITxzM9?=
 =?us-ascii?Q?vDpiq+CdN7+WVCxyDeJnbBw4i3fLcS8u71uDG0U85/CaNbWZx2DA+pAVMNOO?=
 =?us-ascii?Q?E1X16SYRerNKaxIcnFEQxWjbVu9uwDby5RoZMF8npgcq/y/+BVm7UEm8mykO?=
 =?us-ascii?Q?T9IA3P79bg13qxPeupQ3krstFyzUt3e6izBw0iBtsN1TbV5cqlufMNtNQlEY?=
 =?us-ascii?Q?Y8GCRNkEIbpDUciM30KSHC7np2FSgu3GcRHhkhGuHKEo7gmHysc0M/ZB0xJi?=
 =?us-ascii?Q?OxzprTJFC2RGc9Y5BMJV+IgktYe5J4gVWHjOotdNVN9GjOOp+xxWVzGbQOHi?=
 =?us-ascii?Q?MrL2F1+VI1OrOzY+dfXNXSY1PUmy7GXlbul68fPBNW3mmvfNk4C3FXF9X1vh?=
 =?us-ascii?Q?sPLv6do2rQJemVaPDvuji0sZaze1DBq/tUEgEhRTwZWH7Tr99z05UsnU/iRB?=
 =?us-ascii?Q?mpKhGas2VbG3+D/H/3k+tojzYV9Ojb5EzpDQlvo/BF2Ifs5F/MYMFGaJRo9v?=
 =?us-ascii?Q?45JRdMWlDnZcLZK8tmJLE/wTNFvU1K7j2rjo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:40.3504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 089c99af-e3be-4178-90fc-08ddbadd711e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D

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


