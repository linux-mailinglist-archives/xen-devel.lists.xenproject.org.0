Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BBAB19356
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068429.1432520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMp-0006XG-7i; Sun, 03 Aug 2025 09:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068429.1432520; Sun, 03 Aug 2025 09:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMo-0006QP-J4; Sun, 03 Aug 2025 09:50:58 +0000
Received: by outflank-mailman (input) for mailman id 1068429;
 Sun, 03 Aug 2025 09:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKn-0005hH-IL
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:53 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20624.outbound.protection.outlook.com
 [2a01:111:f403:2405::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f3168f4-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:48:51 +0200 (CEST)
Received: from MW4P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::15)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:44 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::27) by MW4P222CA0010.outlook.office365.com
 (2603:10b6:303:114::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 09:48:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:40 -0500
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
X-Inumbo-ID: 0f3168f4-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aO4CVW8W02G8de7PF5gTtosM5OzeNFSKLWhVlUFPlaWvFGRA2uYG1ucLDHzoLr1DvLGfHEhejcW/9oc2+ih5m/blisykzrKjZtIetqezPSms7dvtqKZG6aE1AGxzdFJSkWOnwPSbpanMJdvMV7+UI930Kh1UjAJv1G4CNXizqAB5ves+nJTE0f9H6vuBjr/uxAIGm771aUSnvAOtyPi4xDdvIUwjcuC+apq85Jj4Xm7VOV8pMHHtlfHEJDHD6A5qwlWitHiMGbXUMRTBto1fIGrAEmj/w9PH/YUS3PoXam1YsH68GY2Ij3PDDHnUtyAuvfNhRLz3EIJLZVijQA87gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uypTt3YeP76QKjB++IJy5IqqCgfj2YHw5GtsGTyS4Q=;
 b=gOx/MK/qLpjevu1H09l6Ek4ngupAUCv7uFnuDcyLxsuZaOUqu1JxWBChS1zPw7PygJR9pcThYD29Cu68IjZQq3BAlEj/ZNxhNJtBcNzgg7NpgR7pICLlbnhL7cCL4+YHYHmcGjRXWMESLtJAh8wFze167sTW0ux0F9zTJe5+iWOS9bjL6VAvZJVyNDbeAiCL7Did+BUGp6jdvt2qYyCp0Ow6X0MgnRNXbMqn6z1YOy4Cs9ImQ1vMBDmFyTKNrXoBBkmkk9GLVNw90oxdYwS/myyElly5il4fXQJsRsC04Ql0mZhxuWYSQGiHY/L3S9LNZOBqct1eDxaRKLqKTVqBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uypTt3YeP76QKjB++IJy5IqqCgfj2YHw5GtsGTyS4Q=;
 b=uzO9K1FFlH5jtX2RSOmPAxYFdkHXkJsV0Vox2+kgAmHKsywdxompRmwepYOjmaPW6BomdNaekR1M/e00UJleBZSP2eVdEVq68B8MR8zWwTVVKJGPX2tYEQ6WXrc/Tm2vEaVXFn5GszXhfTaGETS9Vamg1w1ZcGsTUVgQ2vy1ZoQ=
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
Subject: [PATCH v1 14/25] xen/domctl: wrap around XEN_DOMCTL_{irq_permission,iomem_permission}
Date: Sun, 3 Aug 2025 17:47:27 +0800
Message-ID: <20250803094738.3625269-15-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|PH7PR12MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: 0277a6d2-5527-4af7-c3be-08ddd272ef43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1iQTy6VvR/y7RXjnJfwO2WuEP+LdunD4EjYM5LWl9zb0RahEQxerjs3DPBZG?=
 =?us-ascii?Q?egXc0O5jsm5nQVrFrJfOvKdXIfSrkPU/kGmurtqQNTyA8MG9ElahEd+H+lli?=
 =?us-ascii?Q?aZ94Feadl4pDB9eskl1pvID9wkqlR//SWEt9fQa5sGWSvH5BE6viGAadR7T6?=
 =?us-ascii?Q?vxzIgSL5fU71py2u91ijesTjKU8k5+vQpwn7ti0R0YFoW/vSz049wO2Oqpe1?=
 =?us-ascii?Q?Q11bmbxUceoLjHg1C1mi2uyOpoGsvZqLIHYRYwWNew0WHt+ub9V8VKrcNGoE?=
 =?us-ascii?Q?HcyZdy3mt6tmiWU3EoEmHN16/gM5H6PYt6II8Y1ISYgRmd03M1/Yu6zqUqnd?=
 =?us-ascii?Q?QQZnaJoQD9PW3Iij7cfaT2tKEUv71UIiA3L3Klz50UTL9bCfEze1AiXv33Ph?=
 =?us-ascii?Q?bbGqwVEM0vY2NoIsWkAJrM18x163Pz2dv69o5+I1gLja/tV97LKLRg/rMq0C?=
 =?us-ascii?Q?6phC7/ETc/0UjpL1H9fS9Z+VDC+XuaLJRtO3eNznxuUaLGHm15vUnXv/RoOl?=
 =?us-ascii?Q?Iz/s2eVhJJ+opZct2XREx4nV+vAraeEBsHMZlbjCikFQGk4jyQSymQMP8ZX9?=
 =?us-ascii?Q?M9kynGiBzDkfnVH1ZwMX2ns4zz69+ChZGwwY6G2D7TOkCZYf0zQ36up9PmYF?=
 =?us-ascii?Q?71B969F+HJe6hX2N5eWuOmOp5QBh+q32jIQ0ZnEH2YZ7SJtezyUrQQ/xGB3S?=
 =?us-ascii?Q?Skwh3L0XlnfAymBP2ReCnxXKFbocTtz8NBmW16yHO9Tx3HO+VbxT7mm7kty2?=
 =?us-ascii?Q?65Q3C9q//mnAETdUs5V10lc2+2VMWsAQVgx8SUqmZBahB+6Y0O8FwmmaRkxs?=
 =?us-ascii?Q?dHRNw1HqWfZ5cMpCH+9edx+rKIigfyIsRjbCtTfYOEov9HZPlO9u9ajOVU2k?=
 =?us-ascii?Q?ssE8jpCTHJuPn+oGdlkxJouZ/ZcrYHFFF2TqBEXljdwyCI/87+GWSgyKKyF4?=
 =?us-ascii?Q?aG1+Rog0fKeJYD7xdCgf91inrBtaQsD1lYL3jgZO7EZehXDd86mTRGMC1YLx?=
 =?us-ascii?Q?QOCOMNXw8YUrmT8vbyrj1YakQL2gEm+b5xcI2C8+SAccSeexic0KXYE446SN?=
 =?us-ascii?Q?zM1t+FBMyfAu1MFyyq43o9G5/16/XsSV+m9inl9tbSFgfIhvhCsI8YcbxWna?=
 =?us-ascii?Q?DhetPcVdwkWRO1z9/Q2+JwA9lkojiV2PCK4s9lnkygKawY4broMo1nADe8E+?=
 =?us-ascii?Q?v/XWLBkZJEHSFwbuC8Ms7HWVVbzt2mpLuNUg0pHW3ZEIhcKEjxDOsdSXEX05?=
 =?us-ascii?Q?O/q+NJN1bu9DoRIhygT2HPMW2FCFiWFesUoooE1erkFgKR6ScMz1Rk0o/AWl?=
 =?us-ascii?Q?eXFci63hWUci0ryQNd+foFEslRv5PG7x2rHRjK8PPvrNX625SJ5QAK6m9ieL?=
 =?us-ascii?Q?FGiM4sTKN6sr4s5YIGKBVjvW0NkMLwxurni7fqK+teCE1oBIp12EIxcaEwSW?=
 =?us-ascii?Q?p6IphNQ1HgIvmIQ8BqmOzE29hOBYTQes43UWWqjpT2vk9+oadUkZrpud2Ez/?=
 =?us-ascii?Q?qDLIFVuJcT9xgEsntRlULZ8WDU7UrE5NzBWn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:43.7436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0277a6d2-5527-4af7-c3be-08ddd272ef43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593

The following functions are invoked only under
XEN_DOMCTL_{irq_permission,iomem_permission} domctl-op, and shall be wrapped:
- xsm_irq_permission
- xsm_iomem_permission

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/include/xsm/dummy.h | 2 ++
 xen/include/xsm/xsm.h   | 4 ++++
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 4 ++++
 4 files changed, 12 insertions(+)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 12792c3a43..55521c012b 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -556,6 +556,7 @@ static XSM_INLINE int cf_check xsm_unmap_domain_irq(
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_DOMCTL
 static XSM_INLINE int cf_check xsm_irq_permission(
     XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
@@ -569,6 +570,7 @@ static XSM_INLINE int cf_check xsm_iomem_permission(
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
+#endif /* CONFIG_DOMCTL */
 
 static XSM_INLINE int cf_check xsm_iomem_mapping(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 6444f0677b..1759d49aaa 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -115,9 +115,11 @@ struct xsm_ops {
     int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
     int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
     int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+#ifdef CONFIG_DOMCTL
     int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
     int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
                             uint8_t allow);
+#endif
     int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
                          uint8_t allow);
     int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
@@ -511,6 +513,7 @@ static inline int xsm_unbind_pt_irq(
     return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
 
+#ifdef CONFIG_DOMCTL
 static inline int xsm_irq_permission(
     xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
@@ -522,6 +525,7 @@ static inline int xsm_iomem_permission(
 {
     return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
 }
+#endif /* CONFIG_DOMCTL */
 
 static inline int xsm_iomem_mapping(
     xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index b8a9b581b7..2798425de2 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -75,8 +75,10 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .unmap_domain_irq              = xsm_unmap_domain_irq,
     .bind_pt_irq                   = xsm_bind_pt_irq,
     .unbind_pt_irq                 = xsm_unbind_pt_irq,
+#ifdef CONFIG_DOMCTL
     .irq_permission                = xsm_irq_permission,
     .iomem_permission              = xsm_iomem_permission,
+#endif
     .iomem_mapping                 = xsm_iomem_mapping,
     .pci_config_permission         = xsm_pci_config_permission,
     .get_vnumainfo                 = xsm_get_vnumainfo,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 55da0a5ff7..8361cf94f9 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1113,12 +1113,14 @@ static int cf_check flask_unbind_pt_irq(
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check flask_irq_permission(
     struct domain *d, int pirq, uint8_t access)
 {
     /* the PIRQ number is not useful; real IRQ is checked during mapping */
     return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
 }
+#endif /* CONFIG_DOMCTL */
 
 struct iomem_has_perm_data {
     uint32_t ssid;
@@ -1949,8 +1951,10 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .unmap_domain_irq = flask_unmap_domain_irq,
     .bind_pt_irq = flask_bind_pt_irq,
     .unbind_pt_irq = flask_unbind_pt_irq,
+#ifdef CONFIG_DOMCTL
     .irq_permission = flask_irq_permission,
     .iomem_permission = flask_iomem_permission,
+#endif
     .iomem_mapping = flask_iomem_mapping,
     .pci_config_permission = flask_pci_config_permission,
 
-- 
2.34.1


