Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560B7A71053
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927159.1329988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJq4-0002yG-Mi; Wed, 26 Mar 2025 06:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927159.1329988; Wed, 26 Mar 2025 06:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJq4-0002w3-Jl; Wed, 26 Mar 2025 06:02:08 +0000
Received: by outflank-mailman (input) for mailman id 927159;
 Wed, 26 Mar 2025 06:02:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJiA-0008HQ-Sy
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2415::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44f1c25-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:53:57 +0100 (CET)
Received: from SJ0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:a03:3a0::22)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:53:51 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::e) by SJ0PR03CA0257.outlook.office365.com
 (2603:10b6:a03:3a0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:50 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:47 -0500
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
X-Inumbo-ID: b44f1c25-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzL5H51ugkfd0DqnEi3nASeBX1ZZrZLH+k6zikdApNawnRnjBSiR9tOBsMMMgUkF7SqeMIWrzNw2Phsf5zyLeAaIltRAHmxEgxO6RtRsn0GSatPQA66e4uAjCHLJpnl1zH2THJZxTmP3Z6lRtdWnM9OmJZcFpHwFl9vg4LuVgh+ENH4UafmGxq84ieDjAvzPw7EqphR6lpFXKi23eY8RnPn4o8FQOCFvskvUUkGpjCJPcmzniKaUU7Im919JOGTibtpIRq8kMa7CkhR6kSMilRyR93zUce03ibQMQL19X4RllzjhgNfxeZU0nBWXaXiJcFyE1WFSHi3qz+wonywCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fIp26wTlhi8yw0JGvhk17TYU3fQDeNzQFk5zlY2530=;
 b=duEb0Tvt1+NiyuF+V6NrCz4CtdjaNcDd3iKqvYA/YbRtPvr7fuLt7SSkbO2pbrt0Xs+XJBun24Leac7G4ySFGCYE7Ezv6y1WI60SFdpDaHuHx7yfU/Zl1WZDWyeq6MnZ6TjrMmb8EIc84gts0TXiPnEnlretolWZ9PpzJ6gsLUWnfTJTEwxb+o9ITb5DK6qcoNyrOwZ3jhq3Fin/SHq08hRDekud8HENU25L3S6n0At8A8uhUuGWX2X/NNvP8kDvQSVQva/CTl9SsmD4VtAp9JhxBiRagXJ71MchrUIUfPPU8HDgASKErOspwgDmxV/GmUDQ129OMYOFsv3elJ9AbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fIp26wTlhi8yw0JGvhk17TYU3fQDeNzQFk5zlY2530=;
 b=zPiiR4nXhg9J6GLUvYh2xFDRY3JL9IPJeY6fDquUgLvifWWqXNqrKg5U3IPIEjyJS8OztD6WL9hgPMD/mcE+lK0j/vaECaY6TNZQJzva8XOO3lZqqy3w7jUMlp0jesLBcWIBxF2/et97pH7XDmGGgNa2LG9EweY/gcf501w/KsU=
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
Subject: [PATCH v2 11/19] xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
Date: Wed, 26 Mar 2025 13:50:45 +0800
Message-ID: <20250326055053.3313146-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: 94edfb35-9d8d-4d28-cd02-08dd6c2a9566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tTVPO86Irpf4sTkPHo/upuwIpJul47lMKtvlIe1wrGaU5Qv5CYLKExtlALjF?=
 =?us-ascii?Q?8aOStPzCw1fK9FHHpP1HarjLInSsI5tL9s9ModsoBWj4/Ffn51aIN+kzKuIr?=
 =?us-ascii?Q?i6FjmSOGks5a6s9Cf5pePiF4chngYp2PA5I5ugico0JDW/gGAF3FYnBM6CcU?=
 =?us-ascii?Q?xTokfwKpe0JM1u+Y/X45Lv/3HITq6oUJqianaYNNt1m2LMyVuFzAmSFgL0u8?=
 =?us-ascii?Q?eqtq3PoAJaNLuEweTwyvgjA7weMkeCs7Wx1DTYWrZx3O+3zmzskGoIG0sb90?=
 =?us-ascii?Q?fotkTOXA+1YHAncYD+JWndEpPC1cJ+XAj917UhjyYwY8M39CH2HT6QLIoHzr?=
 =?us-ascii?Q?f9cdaq7Tw2ggG76gDVykhA8ZH7YaWJARzTKOLlEWdlrRGGk70QMXuNWeatXR?=
 =?us-ascii?Q?ai0y1tJb61NezHdd1GSRETx+El7snk0vvXEZRUWi6CI/pKaZb7klVaXgQ0Uf?=
 =?us-ascii?Q?DRN2NOyHh0tHpM+t9ii00EfARvCiWhlFi055LrSQFOtQR4aqpWfUsG7TUFOS?=
 =?us-ascii?Q?yyYBIOBcjx14uS/J+lHaGMAqSvjsUhwmBLT3AfUGmMpV4+onpRGNDd0XrE0L?=
 =?us-ascii?Q?cB4y7/YwzpyLWxAE2IRQG97p70I9vNvc9NKabDJMy0GnAA8aNPLXAUxQLCTZ?=
 =?us-ascii?Q?w9BekCBOBghdqqO+8g0EiHI6KksTF10cLNqr09L25NF/5foztscVkitcbBeg?=
 =?us-ascii?Q?CTQoUU13sm/egiXwLifv79yXJZ3gp55a0eZi89lC2ABgvtoMCxEQpGcO7ZOA?=
 =?us-ascii?Q?TWStEc1GbuVAchRonrqkT4DxwaLEmgxmLcPPD0hrFsan65uOM/LNkrmvAHAc?=
 =?us-ascii?Q?4r7Vb9GPayd+JRvL/wQczNSD9foPHt7eYHDzk+5Ybw2pHJLaJ7YA9MPXb/LV?=
 =?us-ascii?Q?EOT3PUUAvzLeAfW55bWExiYA73IkPHYV6S7XqB6XMR4PPci4OT7PphBo3Eoj?=
 =?us-ascii?Q?BihzX4DV0gJQn3rb4FYSFMz+RchtOWc5Wim9gUKU3hAkm1/0ySrxKuuvTdYw?=
 =?us-ascii?Q?BSyn9Fj1Cb8L3P3nfFoSr3SIZWNNoIQSiJRzvuiqw5mviTVSf9kVe51ylU32?=
 =?us-ascii?Q?2S7lX7DXchUC45bwu25opTosXyQsZfIeyv2CI8ODmnXAOSxLqzVLjwnQCRMg?=
 =?us-ascii?Q?/HT68ZaeI0ei8B1nRmDZ4uKJrHaWFYItA8D8SytDd09FMo44kPtcqRN+TwbA?=
 =?us-ascii?Q?HVaNDkEO0EJMxpA9kR/zu7vauxg3woCPS34Amb47NMUEL9HTJBk0ikk38H6A?=
 =?us-ascii?Q?KHgbp7Cr8szq7w1Qd+CURRXoN1yUVFjiNU5gMs4FQA0yj6U1IFYN07CTYf9N?=
 =?us-ascii?Q?Tv54t1BbHZcvuUid4DTHI7+lNHxcqaaEkY8yO6zR+w4XQ9orFYfCAUr9WyWS?=
 =?us-ascii?Q?SEtRS+PJ5s1nqn/NoblxZ3P7hLH4BrtSwtxX9lsjVW2eaWeLB3BWHKS6D9y0?=
 =?us-ascii?Q?6LMYDenkt53YK24cpAwUnPpBYGj2kXsH8W09O22XdlyLTKhQUqOZ7q6ALtLK?=
 =?us-ascii?Q?chsSobqwhqGG9kw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:50.6197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94edfb35-9d8d-4d28-cd02-08dd6c2a9566
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344

The following functions are only to deal with XEN_SYSCTL_page_offline_op,
then shall be wrapped:
- xsm_page_offline
- online_page
- query_page_offline

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- add transient #ifdef in sysctl.c for correct compilation
- no need to wrap declarations
- place the #ifdef inside the function body to have less redundancy
---
 xen/common/page_alloc.c | 2 ++
 xen/common/sysctl.c     | 2 ++
 xen/include/xsm/xsm.h   | 6 ++++++
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 6 ++++++
 5 files changed, 18 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bd4538c28d..cc2ad4423a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1758,6 +1758,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * Online the memory.
  *   The caller should make sure end_pfn <= max_page,
@@ -1842,6 +1843,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * This function should only be called with valid pages from the same NUMA
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index c17f1b3dec..3129fc602d 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -188,6 +188,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 #endif /* CONFIG_PM_STATS */
 
+#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_page_offline_op:
     {
         uint32_t *status, *ptr;
@@ -248,6 +249,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         copyback = 0;
     }
     break;
+#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_cpupool_op:
         ret = cpupool_do_sysctl(&op->u.cpupool_op);
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
index df7e10775b..39f8331207 100644
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
+#endif
 
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
+#endif
 
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


