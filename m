Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D946EB50FDB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117664.1463758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWl-0004U3-UT; Wed, 10 Sep 2025 07:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117664.1463758; Wed, 10 Sep 2025 07:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWl-0004RE-R2; Wed, 10 Sep 2025 07:46:03 +0000
Received: by outflank-mailman (input) for mailman id 1117664;
 Wed, 10 Sep 2025 07:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFRG-0005yo-Qx
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:40:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:2417::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ce359c-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:40:20 +0200 (CEST)
Received: from BYAPR11CA0082.namprd11.prod.outlook.com (2603:10b6:a03:f4::23)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:40:15 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::91) by BYAPR11CA0082.outlook.office365.com
 (2603:10b6:a03:f4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Wed,
 10 Sep 2025 07:40:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:40:14 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:40:04 -0700
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
X-Inumbo-ID: 66ce359c-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ps8wEh1u+KGi+t09RPAtHWmZRRNbgiW4Z+dWSJbExQRZL8APK6owBNqnFi3XfBYPxeSeMyUcpLzeIuOog7js9yuR8ClvmBaFumu5vp8zLeMEju7vQIk4Wbh6ph6RLaeke8DbIFPz3tTND79cvgKOrUWF7BkM19FgnmbP+m9KXEvzGALNJAxDYcnF+TJuLRgiS/Tdf1QRcxY0n3OgB1LoEB6q9aGWLvrg8reY7eCx89F51gbctUcCmE1BOFxKp0F/GZXvPJ8XZ6vXUSHaDndRY5nx/OMrwaeflYUued1ogBsn5VTQfSAE0ZHrdalJ2swZb/Svuopvt+mbcj+W9OA8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWuX102tq8N0iGW1Xc/rVxB+j69uluf4R+r4Cnb/XwU=;
 b=iKv5W3CgikRHbc9XWII0F+gSF9sZDdLpHgqYlepAsVROQQRaMHhGfjxpYj/tZvIxNs9YDEAusjY9v4AvgF/jZ3OVA6reZaGv6wSDF4YBk+CIOvFVbRoWB6N/uOC8FqT15U8JIKOiJdhkz0NDG7QhgoYPwAiWjpLz1VxPXmLm0ImcFUAXD8eBesDhDCBoZdt/rQCyJOOKpU+KrJpkYV1zZtr5LWioTnGUCT7y1716EzmW6DWwFkx8lq3Gkq1qz1ydRtYbOsz04GLJQvCZRkLPoK3DuronUBANdcEsP/Wn1Kz2Ed59KvRoew4nQcrBiSmoni8R/nn3QGmN2W5MJBQzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWuX102tq8N0iGW1Xc/rVxB+j69uluf4R+r4Cnb/XwU=;
 b=fvGfr/0tX9Uz3aOqC9LAhPG8N5q8lc1dak5VQgBM8u81m+OlmV7Ltqh0eXbYWYt4zf80zj668sSN+B47eUWmEur4teh8FmhdxyV6LZnRtAFe0D7dn/37adQolkEUfXMFfTdZNQa5ZlSeBZC5SJGmtDb2tGwD1wRS2tIxBrJUDpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 25/26] xen/xsm: wrap xsm functions with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:26 +0800
Message-ID: <20250910073827.3622177-26-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|IA0PR12MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: e8af2545-45c3-4072-4ecb-08ddf03d47d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uYgqoPTuaLZ9fVwkGZSjOlr9byLe1Bzai8rMquUZPLD5J4ILNARx2aAMfCsI?=
 =?us-ascii?Q?7vIhOjaPGFdZUNgh8dj0TH8t9+9wCiqMP43ZjeOB7ztVfJOiYOcRZIUPbrCA?=
 =?us-ascii?Q?mY/+CRhzxw6CwQ3WWKd7e4dTglB4jq6qJl0yVNCTjKtwVOVWwnnVEvCfIDFy?=
 =?us-ascii?Q?NrLPipS+QpZHyEaykhfLV0DIlAO57KiFmJxjRRlATQhR/syWoDOaEBTkvkEm?=
 =?us-ascii?Q?yu2dyyWL3mH7SyZKc0tLO+Cc2NaqqWjONqkWsw+TAybXSSYOQchy6ZV3fFnB?=
 =?us-ascii?Q?NCwDk7syRnpx+HUJWgk9cvCOK2E0yt7WFIO4toaBdHZKQF9SMTGXBgPy+s8c?=
 =?us-ascii?Q?I+TZWQQ7//nGOcAeJZQUjL5V9ENqlp+rOugpPB00vzZnPFvVZM8a7S2AcOzu?=
 =?us-ascii?Q?KHMXw4E1xBS0TOFpKidyr9sQ/FhpeMNy3m9s2ttEcYJJOBagYp2JHTIAiLbm?=
 =?us-ascii?Q?oaJBDSqq6R53Ko9wLRImQA5O8FoInWTY+qVYf8PwnNJ7ZNEzyUOKY8BpR50j?=
 =?us-ascii?Q?mXxndP4IrpurepQ1DW082mhOSKHUBKUL7FBvYIjv/Ux7hJqPMm2Er8N+IYpj?=
 =?us-ascii?Q?xphy8GxwO2YoFElrN98+6/5KaEDCM119ON/EtT5f1GOTBFo+73NzEAMr/sG2?=
 =?us-ascii?Q?AIHzOVEm/YV2eaX1mz+3ReQGr/PiEjyPdWOb4Kd+IZYwZ0VLd9j3JJw5lmBe?=
 =?us-ascii?Q?N/vUMp5fO2BrOEReFymZyTRWg426xXnDEmBKkbWn5KRZu/rKx4qD/qRnGLp4?=
 =?us-ascii?Q?QMUVgjy+jERryBQIfvlDNb9CoKcZxU527WGoCpjWdi/VbxMNxPZ2znM3Dyub?=
 =?us-ascii?Q?nDdm/bhnYMN9s5TqDAHRM1vhubBKfpxyWgD6q+ivorxX2guU8Uzfxq+GTnJ7?=
 =?us-ascii?Q?zfr1QEl9Br5KvXn7IvWSV/e99sHBPOmEQw6Dn5XGanuuDJlDqiWEQWT7MZJd?=
 =?us-ascii?Q?qiLJU+P/tBBVxGUyDqRGqWMANhSe8ISSS6cDFIhqFPPj+McxMLsoKCH5Hm8P?=
 =?us-ascii?Q?zCu/jge+NjK5QCNWVGn+DThzwtQ5/SdGp9duuOqlm1A1sfvFevVBGQ7UTn58?=
 =?us-ascii?Q?XSTUrBZG+QpQpJoeRcOxYu6wrwlkcpnnlvErr8nBhqvnWbYh2KK/nE6HByvH?=
 =?us-ascii?Q?NpBrYmjSqqeWzyt3DyeATZmFEUw3eIW7InNxU/Mlo5mnFxQBQRTs8M5fuBXR?=
 =?us-ascii?Q?Isy79lE/kWwDt3c1OlaQR6VwF1dOaErBdunK46I1+df8NERKndf9xsSSoxzP?=
 =?us-ascii?Q?/16ZgSroMy8HHWrvso3xRqMqt/0sQCIE7URYY+XjDXAanh8Eprv240qKVe9Q?=
 =?us-ascii?Q?zABGHlusZggs1QeMEwU18iiAj6nxsSWj92Y2IJ7Eki/7O39Yed0lODc4h2fY?=
 =?us-ascii?Q?SjMgOZhsZncuGWUrurKl8xaySIeWyNo6Azm2M22Mq2Jt252C5RYSoe2BshC0?=
 =?us-ascii?Q?GBMOl5hjPyoQ8cUCRFrDlVS0Psaug6YHNlpemonARu8zgYrCOTZkZVCfhKry?=
 =?us-ascii?Q?brB9eocZf8nbXMgwz2x0fL8WGLISz4jSg+Db?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:40:14.4513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8af2545-45c3-4072-4ecb-08ddf03d47d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645

The following functions are xsm-related and only invoked under arch-specific
domctl-op, so they shall all be wrapped with CONFIG_MGMT_HYPERCALLS:
- xsm_domctl
- xsm_{bind,unbind}_pt_irq
- xsm_ioport_permission
- xsm_ioport_mapping

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
 xen/include/xsm/xsm.h | 14 ++++++++++++--
 xen/xsm/dummy.c       |  6 +++---
 xen/xsm/flask/hooks.c | 12 ++++++------
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 542488bd44..0539e3bf10 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -60,8 +60,8 @@ struct xsm_ops {
     int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
     int (*set_target)(struct domain *d, struct domain *e);
-#endif
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
+#endif
     int (*sysctl)(int cmd);
     int (*readconsole)(uint32_t clear);
 
@@ -111,9 +111,9 @@ struct xsm_ops {
     int (*map_domain_irq)(struct domain *d, int irq, const void *data);
     int (*unmap_domain_pirq)(struct domain *d);
     int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
     int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-#ifdef CONFIG_MGMT_HYPERCALLS
     int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
     int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
                             uint8_t allow);
@@ -190,10 +190,12 @@ struct xsm_ops {
     int (*update_va_mapping)(struct domain *d, struct domain *f,
                              l1_pgentry_t pte);
     int (*priv_mapping)(struct domain *d, struct domain *t);
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*ioport_permission)(struct domain *d, uint32_t s, uint32_t e,
                              uint8_t allow);
     int (*ioport_mapping)(struct domain *d, uint32_t s, uint32_t e,
                           uint8_t allow);
+#endif
     int (*pmu_op)(struct domain *d, unsigned int op);
 #endif
     int (*dm_op)(struct domain *d);
@@ -272,7 +274,11 @@ static inline int xsm_set_target(
 static inline int xsm_domctl(xsm_default_t def, struct domain *d,
                              unsigned int cmd, uint32_t ssidref)
 {
+#ifdef CONFIG_MGMT_HYPERCALLS
     return alternative_call(xsm_ops.domctl, d, cmd, ssidref);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
@@ -503,6 +509,7 @@ static inline int xsm_unmap_domain_irq(
     return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_bind_pt_irq(
     xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
@@ -514,6 +521,7 @@ static inline int xsm_unbind_pt_irq(
 {
     return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_irq_permission(
     xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
@@ -757,6 +765,7 @@ static inline int xsm_priv_mapping(
     return alternative_call(xsm_ops.priv_mapping, d, t);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_ioport_permission(
     xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
@@ -768,6 +777,7 @@ static inline int xsm_ioport_mapping(
 {
     return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_pmu_op(
     xsm_default_t def, struct domain *d, unsigned int op)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 2c8e0725b6..48ed724f86 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -22,9 +22,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
     .set_target                    = xsm_set_target,
-#endif
     .domctl                        = xsm_domctl,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl                        = xsm_sysctl,
     .readconsole                   = xsm_readconsole,
 #endif
@@ -71,9 +69,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .map_domain_irq                = xsm_map_domain_irq,
     .unmap_domain_pirq             = xsm_unmap_domain_pirq,
     .unmap_domain_irq              = xsm_unmap_domain_irq,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .bind_pt_irq                   = xsm_bind_pt_irq,
     .unbind_pt_irq                 = xsm_unbind_pt_irq,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .irq_permission                = xsm_irq_permission,
     .iomem_permission              = xsm_iomem_permission,
 #endif
@@ -143,8 +141,10 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .mmuext_op                     = xsm_mmuext_op,
     .update_va_mapping             = xsm_update_va_mapping,
     .priv_mapping                  = xsm_priv_mapping,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .ioport_permission             = xsm_ioport_permission,
     .ioport_mapping                = xsm_ioport_mapping,
+#endif
     .pmu_op                        = xsm_pmu_op,
 #endif
     .dm_op                         = xsm_dm_op,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 66d8bfda3a..76bf1b5240 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -665,7 +665,6 @@ static int cf_check flask_set_target(struct domain *d, struct domain *t)
                                  &dsec->target_sid);
     return rc;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
                                  uint32_t ssidref)
@@ -858,7 +857,6 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     }
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
@@ -1078,6 +1076,7 @@ static int cf_check flask_unmap_domain_irq(
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_bind_pt_irq(
     struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
@@ -1111,7 +1110,6 @@ static int cf_check flask_unbind_pt_irq(
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_irq_permission(
     struct domain *d, int pirq, uint8_t access)
 {
@@ -1634,6 +1632,7 @@ static int cf_check flask_shadow_control(struct domain *d, uint32_t op)
     return current_has_perm(d, SECCLASS_SHADOW, perm);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 struct ioport_has_perm_data {
     uint32_t ssid;
     uint32_t dsid;
@@ -1689,6 +1688,7 @@ static int cf_check flask_ioport_mapping(
 {
     return flask_ioport_permission(d, start, end, access);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_mem_sharing_op(
     struct domain *d, struct domain *cd, int op)
@@ -1894,9 +1894,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .domctl_scheduler_op = flask_domctl_scheduler_op,
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
     .set_target = flask_set_target,
-#endif
     .domctl = flask_domctl,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl = flask_sysctl,
     .readconsole = flask_readconsole,
 #endif
@@ -1943,9 +1941,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .map_domain_irq = flask_map_domain_irq,
     .unmap_domain_pirq = flask_unmap_domain_pirq,
     .unmap_domain_irq = flask_unmap_domain_irq,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .bind_pt_irq = flask_bind_pt_irq,
     .unbind_pt_irq = flask_unbind_pt_irq,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .irq_permission = flask_irq_permission,
     .iomem_permission = flask_iomem_permission,
 #endif
@@ -2016,8 +2014,10 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .mmuext_op = flask_mmuext_op,
     .update_va_mapping = flask_update_va_mapping,
     .priv_mapping = flask_priv_mapping,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .ioport_permission = flask_ioport_permission,
     .ioport_mapping = flask_ioport_mapping,
+#endif
     .pmu_op = flask_pmu_op,
 #endif
     .dm_op = flask_dm_op,
-- 
2.34.1


