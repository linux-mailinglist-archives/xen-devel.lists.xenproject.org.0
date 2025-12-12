Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BACCB7D4C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184934.1507286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuR6-0003cz-2m; Fri, 12 Dec 2025 04:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184934.1507286; Fri, 12 Dec 2025 04:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuR5-0003Xv-LQ; Fri, 12 Dec 2025 04:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1184934;
 Fri, 12 Dec 2025 04:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQt-0007SS-RG
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:07 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0453d223-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:07:05 +0100 (CET)
Received: from MN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:208:52d::28)
 by BL3PR12MB6548.namprd12.prod.outlook.com (2603:10b6:208:38f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 04:06:56 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::92) by MN0PR04CA0023.outlook.office365.com
 (2603:10b6:208:52d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 04:06:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:56 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:54 -0600
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
X-Inumbo-ID: 0453d223-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJiM+dMh7WnjmBQhDbAkFciZGYsNZYcOCSKvbNBt1FO8eGD8ucFq6iQG6+PIw+4o2rQU6IgzOmpUBlTxvr/ZfqURCkvG0W6xFqf5WjOQQDGDsqBiuKjjapCn5KwAgWLIQ/P3sHY/HBAeA5h3uQUAQ/P12G2wbuk4ogsG/3lZEROVm8jY/ZxB3/cr/ZH4GlfmBXruMb31NvD62Kv4FiYOI1/QY9TRMlwQt3EZyFxFioJNI9Fo4nEzdQGmC2rN04LTh0sJm4MDhsxiB271MIRC5SBTzzZU+z22u0546yGho1pPxePuDFN/Jzq6qEVPSuKPT6gGHAr9XtV8Ok+Vup8mEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0u0YW906Vw5GXiM5PY9h0Wf3UJFla0tEJDdVcSp3lE=;
 b=Dw60RjpX5S9GwIUn8C5ZfhsmKrL6Blc3EwEGN79ItRu1xeSnmGqamBDzGd6ju8AysriYYYsX6pAv/7sc707s9ddAtgpcvrTHIN3aRggEZeXbL3tvJa+/0QgQBgBRVXbGjQHW5jQQEXsbNwePFoy37UXVQCL79+FIPR0ZlyC3IDlL+Lh02D3egHnxrf6Jvo7Zn3JvUnKY/xn5liz9jZsEhedZTjomlAL9GE8TxGy7drTzK4ZHd6ZOxMAR8dr/PFgzjW4USspaMpprLqd9hXf5AGNfwDlx0ot3wY7Kips97D8pmqiP63okzvRIltVUzWNV73xdVuQd+DrCzTHrX4bgjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0u0YW906Vw5GXiM5PY9h0Wf3UJFla0tEJDdVcSp3lE=;
 b=helEOfrOaM1HjCeoHRliPxw8puJONZy6KxqNopC4v5p2QWenxUJh97s6wADlEfIlCWc0cHeGEIT8b4mfhjcZBZwXeFUqumt6+VLfwg13WYcGCdiFkNRKCQHrRxIjdIcU9RJ9jtQL+MWUxFP1U6Hlk4vVkUIcLM3iU04C60bGqz8=
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
Subject: [PATCH v5 12/24] xen/xsm: wrap xsm_irq{,iomem}_permission with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:57 +0800
Message-ID: <20251212040209.1970553-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|BL3PR12MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 01171621-f024-448d-8d41-08de3933e41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fyenozwvsp+ObbL4ki3Q+89vSRgYXgcRquCi9tmOJm4Rp00eLJrN6pVM9r32?=
 =?us-ascii?Q?gzbMH0P361YfLWKAiUNDulwdmASEwW2YDtXFhWWfooCZLmNDdcWJ60kp1bVv?=
 =?us-ascii?Q?Kb1CREipdXXBfJHeRHZvTvNmUuFjFJ3fjS1L/YOvID64e+W2UXhtS5XGNYN+?=
 =?us-ascii?Q?t1IoHPRBhuk9X79skMvSUa5mX2ZXBQ60lrj3RQZiKJ6ifiCOe+i4J/Z1aFbt?=
 =?us-ascii?Q?lbvnAqwE2tXKjRpeoDNg3A32TqsQkQB/HglrLg+pV1aB3YF5nugbjzz842Vx?=
 =?us-ascii?Q?JzR+Ll3WHma5bWgq603L4uZ5o64c3IQ+L/S0rm+ql1TZ/4w5Xyme8+MlozPu?=
 =?us-ascii?Q?zwapI+CS0yL7epFebNVEz4mlVUMmfq2dNaFkk1vsJIDoZk+YYr98XqdN7Anh?=
 =?us-ascii?Q?eS0h1Lfxw0HXvSrQQhqjuYWcWYasFfXfczR6po6vyaHDtcxjE9ydg90k/ICu?=
 =?us-ascii?Q?UezU9Q8RLzUbfGjslnDrIG+PCk0PaKsbuVWyx7+RIg81k5+L5ycNGuMxSLuQ?=
 =?us-ascii?Q?7Yj2kCl57szU14c2db9m4Cj/DjC/FCQShJPEoY6Iwk/xon7Ye3g3ihv0+MCC?=
 =?us-ascii?Q?oAfh7k8v6qO/qZWuJsSWwAh1N+xLnSVCIH89veT4IqMCo7n/XwFyH0B5rSjn?=
 =?us-ascii?Q?V8ehT0o3GUlWM3MvDZazkJnb5W82DG/3Mv72zvdjNGFMyoCA59BuID6bvofE?=
 =?us-ascii?Q?Kbp3+dUCj0WQNSypH4VAfczika2QUlPXZfCguQE4gnnAozeGwSqo1IeEEEgk?=
 =?us-ascii?Q?/Pnc9Gxk7Qwui1MH6LHTBt14D5Ur1kmX33IhhbX5SziFlLBTU+nc7o8WIixh?=
 =?us-ascii?Q?q44mG7BN68nzbBLjz0Tjki//fXVftP4fBvD35hHgZlHg5P1bNBsmEu7j5BsY?=
 =?us-ascii?Q?QVN3v3XQOai0rDGn2aEN3zA3ZHNB+9J6JNFPWcu4nFeTjj0GpydLl0I0Sx+f?=
 =?us-ascii?Q?UVA66tF6Is4csnb9+0P1aPmQiSj10MLSHn/27OoLEmHJsrxf8ymdAWDfXkGr?=
 =?us-ascii?Q?jTm7rXHLnoPiq7JmvXWwbEI3rUpvYw0viQIA6pG8+DF6tqJnCYh8FCRKoT1B?=
 =?us-ascii?Q?kPVuquMAn5i/LiTlb7/tJ8X4rLs2Vb8dBfIfvJGKKdWNNCusaAZvjRSGUf5U?=
 =?us-ascii?Q?nts0w7Fwq8klKFu0Y5yraqMDkSuZ6hPfYsa6+CnzVIBQ3u5T07GU4rGLgt13?=
 =?us-ascii?Q?eEoO7+PtNa5E8Vk/s93V0QZmgGwNC5QMGQ1+j9I8rbkiuH2aPJKW2zsyUCeJ?=
 =?us-ascii?Q?cpoqtO8Lz7V4Hx8lZeGN+/STc+DQcJ5ho3B8bDIeZoPUhQLGWkl/EeRSKCMQ?=
 =?us-ascii?Q?2jpvWr+4Fzf/aNsX1FGac2FEsjRr3PnDWiAxLJEale7+iySPwWjs+anrbudO?=
 =?us-ascii?Q?oC7SsidXems15FeIwgIv0yWp2xYiZqDxlyXUPc1b9WUy551gd5JfbC/KDLMK?=
 =?us-ascii?Q?YVzBRW1BIBwiw/aMXT343xtSiEQXK9V+Q7Z0GEKwbzE5Tm8LJv+rvfl/cElI?=
 =?us-ascii?Q?i0CrXHoKb4wEE9E5KA6pbWyRMn8HoClqM/7CJZjT0KvXPP4PKR37rc5KzpS5?=
 =?us-ascii?Q?7IuTOhPuYc+A8GV3hGA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:56.5962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01171621-f024-448d-8d41-08de3933e41b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6548

Function xsm_irq{,iomem}_permission() is invoked only under
XEN_DOMCTL_irq{,iomem}_permission domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS. Otherwise it will become unreanchable when
MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
In flask policy, flask_iomem_permission() is also invoked for
xsm_iomem_mapping(), which is needed in vpci support. So we shall
exclude wrapping for flask_iomem_permission()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
v2 -> v3
- add missing wrapping in xsm/dummy.h
- adapt to the commit of "remove redundant xsm_iomem_mapping()"
- address "violating Misra rule 2.1" in commit message
---
v4 -> v5:
- include changes for xsm_iomem_permission()
---
 xen/include/xsm/dummy.h | 2 ++
 xen/include/xsm/xsm.h   | 4 ++++
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 4 ++++
 4 files changed, 12 insertions(+)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 6e8a6a2858..535de82f62 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -564,6 +564,7 @@ static XSM_INLINE int cf_check xsm_unmap_domain_irq(
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_irq_permission(
     XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
@@ -577,6 +578,7 @@ static XSM_INLINE int cf_check xsm_iomem_permission(
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static XSM_INLINE int cf_check xsm_iomem_mapping(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index b3bec66e7e..786cfd7ac4 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -115,9 +115,11 @@ struct xsm_ops {
     int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
     int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
     int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
     int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
                             uint8_t allow);
+#endif
     int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
                          uint8_t allow);
     int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
@@ -501,6 +503,7 @@ static inline int xsm_unbind_pt_irq(
     return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_irq_permission(
     xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
@@ -512,6 +515,7 @@ static inline int xsm_iomem_permission(
 {
     return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_iomem_mapping(
     xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 2c878999a3..b216894579 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -73,8 +73,10 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .unmap_domain_irq              = xsm_unmap_domain_irq,
     .bind_pt_irq                   = xsm_bind_pt_irq,
     .unbind_pt_irq                 = xsm_unbind_pt_irq,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .irq_permission                = xsm_irq_permission,
     .iomem_permission              = xsm_iomem_permission,
+#endif
     .iomem_mapping                 = xsm_iomem_mapping,
     .pci_config_permission         = xsm_pci_config_permission,
     .get_vnumainfo                 = xsm_get_vnumainfo,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 669b04f8ea..d480009142 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1111,12 +1111,14 @@ static int cf_check flask_unbind_pt_irq(
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_irq_permission(
     struct domain *d, int pirq, uint8_t access)
 {
     /* the PIRQ number is not useful; real IRQ is checked during mapping */
     return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 struct iomem_has_perm_data {
     uint32_t ssid;
@@ -1938,8 +1940,10 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .unmap_domain_irq = flask_unmap_domain_irq,
     .bind_pt_irq = flask_bind_pt_irq,
     .unbind_pt_irq = flask_unbind_pt_irq,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .irq_permission = flask_irq_permission,
     .iomem_permission = flask_iomem_permission,
+#endif
     .iomem_mapping = flask_iomem_permission,
     .pci_config_permission = flask_pci_config_permission,
 
-- 
2.34.1


