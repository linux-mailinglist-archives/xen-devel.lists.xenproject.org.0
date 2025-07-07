Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F172AFAA16
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035078.1407322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJL-0000Gf-LS; Mon, 07 Jul 2025 03:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035078.1407322; Mon, 07 Jul 2025 03:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJL-0000D4-HC; Mon, 07 Jul 2025 03:14:31 +0000
Received: by outflank-mailman (input) for mailman id 1035078;
 Mon, 07 Jul 2025 03:14:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJK-0007mT-1t
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:30 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2414::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d9be8ea-5ae0-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 05:14:28 +0200 (CEST)
Received: from CH2PR19CA0018.namprd19.prod.outlook.com (2603:10b6:610:4d::28)
 by SA3PR12MB7974.namprd12.prod.outlook.com (2603:10b6:806:307::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 03:14:24 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::5) by CH2PR19CA0018.outlook.office365.com
 (2603:10b6:610:4d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:24 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:21 -0500
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
X-Inumbo-ID: 7d9be8ea-5ae0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDHaP+kjDFXVs7HOmHTqlKpXs9K1mp9vu08xidNWHf6O4bDNBgRVvRHOBCcRHfrpNU2Z5Xu2TbfYssU0TPst2NMcAXPZYiN7iNQWJOgHIRyoe/7ATvOpYHeEfifMK2lQovXqOpFYGvLqr4j1tdfoA4kqvlNNO3vhy6+EvZVbWveHUbFaVeZSYGBUVfGd1w0KEs7xsWovspJERNhtK6QP6MPfAOb7SmlJMsVRbirWQ7g4PSRBazKetWixBaWV69J0ES6EU9d987Oe0w4gYv8/tlhZ1/Mgz58JBW0LbzacWb+Hh4jcc5P4Omeudh9b6oO6VmfeCmJht1kPFjFaRzK3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyQBDL0uFgow+1a2Y3dSLlMZH4IZJahaUJN2J/+JEcc=;
 b=W0Bv4Wzq7nt7aURF/Lkza9oMaq2Dt7qEBpkKgIm9dM3iSOtt/FEafZu5VJ8QwGgW6VlSx/r4V3Lq8hOb6SMAebJemffOcjCN++QcpQqsCcAZ6vaG4bA0ReMaF1txkwCzY416oKvcuSX7hztduFVJxg6AkR4COn+iXDkVF3tXWTbb+ICpKg2ER2Ppxnuq4hoTa35sAvz+Va9FBB+ReySllt14YIR+x8IbzKc66t3GcLGJKDg0WrWyIwh3s8YXzF0xbNAO86ZrAcrMmdsOFu4eLzOVbEnIXyumkp55eSObOSUasMnsAD4Yqb2kl6wQhy5fkbD0yCVnbvvc8IxvAMSUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyQBDL0uFgow+1a2Y3dSLlMZH4IZJahaUJN2J/+JEcc=;
 b=ZfsWXBwpwA2L4FVUAgYpOSsX33xPgwaWyIuv+YhyutQ8USJMLOSJqFOgIDvM3aN77cxSUv3nZH5CVWq1e770QmxYQqNiCFcO1YTXuujMnAEr9WYfxB1zz809E68Grj30hx8Q9P8yTwRlxxeDP2ZiQuUqe32HGUWzcQim4eLuvAU=
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
Subject: [PATCH 06/11] xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
Date: Mon, 7 Jul 2025 11:13:41 +0800
Message-ID: <20250707031346.901567-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SA3PR12MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 1171b663-dadb-4878-094c-08ddbd045fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Og5nANhvB9LlUAvDWjvxtUjq44U5Xea/cUyvdCuJICk4kMXi8ockZ6jEv+5e?=
 =?us-ascii?Q?9bCW7PZut8BAhHYyfs9gba+yNV0+xIw4P+PlcBnzx4CTtsKv30FqtzAjif2V?=
 =?us-ascii?Q?nw53rK8u5eggyHU83HGYRfTCNg9in7jdX2Y++QXBiiv52/AOrPvQaQqMcPf6?=
 =?us-ascii?Q?j0T+5MwQAQUuHHe//JLcY5tBe3XDTxYnxJP1Zo/ykdkmQshDcIb8GrI4BBOr?=
 =?us-ascii?Q?Jx2vAr9iPAH0F9gTofWX0aFVGJa4DDLjgorMhLdZlZX1U4CNs9DQq0Z0r2ZJ?=
 =?us-ascii?Q?xEqtREJ3Js3N1ygClWVUaNfF6CaBvL59Yr/x9vOApk93akvETnn4Y2PURd08?=
 =?us-ascii?Q?Ka3qOt5NA0ENtvnMUWNEPFcq5lPJ5JgtXIpxrjmJVtTGQQ4fTYkGzHkkA8Ug?=
 =?us-ascii?Q?7Xjmdn9DCzpcph/W+S7a7Wfe0ZU4g6IpvOWHYzYRYL319Zp1GGL0hGz6yV9p?=
 =?us-ascii?Q?OwDqb3V1qpj3mbK0LvTBie1A7xVlP0W2/RxEzU4qPCFuDiC5qGOsMJqVdhtC?=
 =?us-ascii?Q?yuh1rwJTiJ8IN6CBXlxKMjluGUBs2lNxtELnVrk5tpw5zd+9w/n+ivNxZHag?=
 =?us-ascii?Q?RUgZOmOWbzOFk0H1fu7Sb2ge/1XuKJNN/EbUWPRkSUv3Y7N7yAtuDeQjqFt5?=
 =?us-ascii?Q?xYSRylcuQaQPsvgGU/XU2F55vGgvH52LJWlxIYfdwQ+LhicAm1ZD9nZVnIj1?=
 =?us-ascii?Q?kRyak3PDTTgHi26Hqckkr52B5xYsDPeRNhW0QuS6Fr5iVWxbZft8rSUBocrQ?=
 =?us-ascii?Q?WnpyK31DHi5Ncen58W0sjDBSCCFPCgt4qIWVic2oW7TOQkHEIo40AJjrl0DV?=
 =?us-ascii?Q?t7JhK2QhxkJtBx/qqfxlZszoBMLuQg65/nQyBKE1yKsRJhelq50X4RthlIe9?=
 =?us-ascii?Q?DSyNl6QNeg2CsTzNEjP9wyyOszJNRibqao6629nXVMYIHDV2kb650mo5Geky?=
 =?us-ascii?Q?fKLqcbycBQ7bfDWi+pAPDUOQDFzVsZ0Mvr5tAfabXGmgJckQLuaOsAE0geAz?=
 =?us-ascii?Q?IWzRsQGc4ET5fb/CoNEVQqI5i/InKf6cqchZDX6lkV3rCsl2WUO816YG9ISR?=
 =?us-ascii?Q?r8SAyzNqq7NhvC4jFTUKXazlEiCiHzjDx+o7s0QU49HUjuZf9WELMmibPV+A?=
 =?us-ascii?Q?Cqpvyj3SjSLYbv7k9FUG0FSbuJnLrI9uV0BaeZbhFyf8M5T1jEnPTewb4C3m?=
 =?us-ascii?Q?lGoqsNhtnNUwJCTQ65jabTNiCS7zlv0rS6ws9Fa8apndrOgAPrlEx0rsWphE?=
 =?us-ascii?Q?54r7Tm62vPoJU+fSKFGRUWNfXQvLJ0/ZgvhLy3px0Fxb+KUqK3bGkvmBUSsU?=
 =?us-ascii?Q?zNXDotl+jYwJBwduK5qLMRg8pSYXMp4oJ8oQZcB8JNMBfZEek7rAYLj9fUYE?=
 =?us-ascii?Q?ZtNOHuPUcGR1aoUsKqu36SPKm8SuQrxQmWeV2U5yHthtPHS/cBdKDMq5VvoF?=
 =?us-ascii?Q?e/aNeN4LtPBEv6IRk14Ie4spcRRzeOv4ZCew+XS8eqeCom88l5R7EcwK+xBa?=
 =?us-ascii?Q?Tcl4MxARMPQ9m7yi3uLQZ01SqkufckS1Lamf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:24.1057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1171b663-dadb-4878-094c-08ddbd045fd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7974

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
index 8f93a4c354..8177d12f50 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1781,6 +1781,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * Online the memory.
  *   The caller should make sure end_pfn <= max_page,
@@ -1865,6 +1866,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
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


