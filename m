Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F1EC789B3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168650.1494644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtM-0005M0-5o; Fri, 21 Nov 2025 11:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168650.1494644; Fri, 21 Nov 2025 11:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtM-0005Ik-09; Fri, 21 Nov 2025 11:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1168650;
 Fri, 21 Nov 2025 11:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOr8-0008Dv-Ue
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:10 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a18df56-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:59:08 +0100 (CET)
Received: from CH2PR05CA0060.namprd05.prod.outlook.com (2603:10b6:610:38::37)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:59:00 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:38:cafe::95) by CH2PR05CA0060.outlook.office365.com
 (2603:10b6:610:38::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Fri,
 21 Nov 2025 10:59:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:58:59 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:57 -0800
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
X-Inumbo-ID: 1a18df56-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6Ya6gqkbROa3OowkVc9Uc8fAqW3wRooUNxeWtLbOj9JJwAlT2gbJ3pr+U4guVJyNK3qLIgRfUdk/+oWXaY/yficpRBI/VGv5qLxM/BpfwR5L1qU8sdcl2FJWqbr2Zr9sQ7l6zG+gD2HPJmD1/+jJfogZ/lRq+61oN09FCKBw/4Xkv94fRmF88Mh60gZUJl+bXFRZUlCvRKK/tVgeErQwMg8ZnhSHmQCsYt6ha4NgGRVOz8cTbsfIl79zSWDJHEEOmikaqZvKUcHIXM/Xc3/TrfJagE+GEygAnQiTdOxy0fgnYrDVNEnaZ70J2ArIC5cqhlPuv6WeGm6wGTaYaPmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9x7Xa5KkUvXjjgvJRgz/0aHtQ5ZefYKpd00CZcZ/TA=;
 b=emEPVFs4W8TvfJeMQ9ww54/vz6nOs8p/xSZ5b1cx5ggA0V0i4tJwc+F8zDy+XLKZXrdttUBqd/VhLZUZOm1oIJbj9TMldnCu/aVqKTEJsnlfu6Qb47QrgBzfxkcVU2XDQrUMTAEHTt4iPV+rphN0z1+m+C7zUqY3QbydobV/iNsOeU4YdT+VGELMUTTRTKjSQWnuIt5XkZtupJRxsL0PLL8aqkDPom2K+CwylYBfHRTAwktcHYdmr/395VRdNp0A50yCeB/L1laVbMgqPPo47kN/NWuqcoSBKjqYFhyZ7I9VV6X81QEBNrabXhtp7h3XaGYxAkRa53R9JOscuCzUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9x7Xa5KkUvXjjgvJRgz/0aHtQ5ZefYKpd00CZcZ/TA=;
 b=Pa6QS+yiDRFBx/RIkAXXL1oMXAVaJqvThezPf7xt3nZSVszhhy7cJ4G4sDYdJDL1Gen0nAYP2SzuQhBzHCDPk3/MG7c1l/nFA8LFJi4oawHOVtj2YAiofh61qQ//827elzlx83809hWezD0I340D0HaVkvVadRvXdPZN10rePiQ=
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
Subject: [PATCH v4 11/24] xen/domctl: wrap xsm_irq_permission with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:48 +0800
Message-ID: <20251121105801.1251262-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|BY5PR12MB4068:EE_
X-MS-Office365-Filtering-Correlation-Id: 5540983f-01b0-4517-43d2-08de28ecf9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fCIE6AuomiK/6XF/ME93ynVGvwinL5LurQwuR/JKZJFgr5LUp6ZhKIDWBXBC?=
 =?us-ascii?Q?j11jN8FdZWMc3DTmTSffaUSoA5GuGAh5ayJX6Wpl6lpvDaBwc+dMw+7zgRA3?=
 =?us-ascii?Q?6kEIFyI0510r3A93rF4bnfSLAD0gjq7To8W11GB31X5DORfGNBJEib9k/Wgj?=
 =?us-ascii?Q?nQz4YtsHeGFvbwywnKZ2KTnGoEWghmkWwUtxPO9ztrVA21++WzzffMdPhatl?=
 =?us-ascii?Q?TGSA9nf7OEIHihO9YPZGvx05h82LZMRhDJvI1p9G3PMs93Mmj6/imUBmY7Eb?=
 =?us-ascii?Q?aqNCI4wKycXKcUVmEaBfMFtEL38ZpKqVSTLui4bb6aRx9uQgVFONhiVjFDqu?=
 =?us-ascii?Q?u4uqbJBmoZ/8Wnk5wErWhUQGjqX7m9lOQ74+/fS7r0i1H6nfiJIzHWT8Bteo?=
 =?us-ascii?Q?uQk3gPpLKU2REjzjfP+Mw0D79HxRo9FndaTB+nNjhTlYIe/6nxH9uZqxCkka?=
 =?us-ascii?Q?yV3ryHxkMFjYLg+agZqmKRU02UnW94u59xu08qKVvLt1g3fL0cGlyOA2TgqR?=
 =?us-ascii?Q?pcEf2x3fitTWjqF46k8gI5h7vkKFERtD5B/desvaJG7CwW/zAI7N2HoLW9wH?=
 =?us-ascii?Q?0PrU+5tyTzbRmwyd2cIoOci13ABUB8nU5bw4CpXLg4pcjFrPjkWcpIXbeqsL?=
 =?us-ascii?Q?r6KY+wzFNdcQyfWCGpcWaFD/2f2y8paypmQI37IJdQ0nf6T8KrYMkp68Rp5m?=
 =?us-ascii?Q?7SspG31hNcQCwT8LOYdyzVwkcbuQXdBqm/HIGtCs6ICMuPMgjzJPVPzUooO9?=
 =?us-ascii?Q?ZdCiReyP+wVb+MruXzJ9wK2074iJ2v54zXfUNzDQxpEoHuxg7zLPZjs3g8dk?=
 =?us-ascii?Q?9Tk8w/ov8QrwDB8pN/HpzLhTvvPOFCA2kC+FFdiw58hnDT6F9sCRzB7DhEWD?=
 =?us-ascii?Q?dcdm5axL5Tt+qUEQqA4ofdhGkvBdv5q7c8yMg2vKt1TF+aC/HAqA/rebZU5d?=
 =?us-ascii?Q?nw3toFafDczPe6SQM/CE1JLoDPZYxylIL6y5Fo2CHgvmykhs2TSNWD+y4KG8?=
 =?us-ascii?Q?mmY/7egpbEu01UeFJ3bO06thrZGzh/Ul1EQO67ehUDWlchHSCDrk83m5m/lg?=
 =?us-ascii?Q?Meoc4e5OIbEP6NdWzKmRNBRswTb384tpwbgiDfPJ6LwkxOcZ9OAv8YFUtU7j?=
 =?us-ascii?Q?Gl4+RmZ7YiIQ4ZTONX2Shm705nhVsnr8VUc+f8LDWGSiCDlNxe1/DNgokBA2?=
 =?us-ascii?Q?+52wtsvlEyJE5B9qBvd+4v+LRth9ENJltfJfVbiPeQ0qSHecEyo0E7rQXE8p?=
 =?us-ascii?Q?0NBspduwAgtGrDVueeNwbh3j5E7uuMipMcdJADHJntmxjwSkAHv4lbsI3b8G?=
 =?us-ascii?Q?3DvangdNJwQsdyQHt+YvjPXyFXp+8DIxoksnuJ5OxAp/gjbovLdyIMl0DVtg?=
 =?us-ascii?Q?JOVMFORV7zOaEdQ0vAAf7tkZmKN/OembqkfY5gfUqvxfNZ6hcBAyleu5a1Wv?=
 =?us-ascii?Q?Lfm659m0Nt0v6eRmUKB97Ou65ZP8Lz0xtjF5UARXHoUco7cOZdHtON/iWWqx?=
 =?us-ascii?Q?LwKo3KZhuZm8SFTQzb2HM0D8zxAYAv4j4nt7WjR9iQjhJ7KNLm64I3wsyYGH?=
 =?us-ascii?Q?gss+c1seWvUZ6t9QCOQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:59.9981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5540983f-01b0-4517-43d2-08de28ecf9ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068

Function xsm_irq_permission() is invoked only under
XEN_DOMCTL_irq_permission domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS. Otherwise it will become unreanchable when
MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.

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
 xen/include/xsm/dummy.h | 2 ++
 xen/include/xsm/xsm.h   | 4 ++++
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 4 ++++
 4 files changed, 12 insertions(+)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 5810a18087..a5deb8a975 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -564,12 +564,14 @@ static XSM_INLINE int cf_check xsm_unmap_domain_irq(
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_irq_permission(
     XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
+#endif
 
 static XSM_INLINE int cf_check xsm_iomem_permission(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 9dd485646a..ee43002fdb 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -115,7 +115,9 @@ struct xsm_ops {
     int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
     int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
     int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
+#endif
     int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
                             uint8_t allow);
     int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
@@ -499,11 +501,13 @@ static inline int xsm_unbind_pt_irq(
     return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_irq_permission(
     xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
     return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_iomem_permission(
     xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 724b2a2653..7cf00ce37e 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -73,7 +73,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .unmap_domain_irq              = xsm_unmap_domain_irq,
     .bind_pt_irq                   = xsm_bind_pt_irq,
     .unbind_pt_irq                 = xsm_unbind_pt_irq,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .irq_permission                = xsm_irq_permission,
+#endif
     .iomem_permission              = xsm_iomem_permission,
     .pci_config_permission         = xsm_pci_config_permission,
     .get_vnumainfo                 = xsm_get_vnumainfo,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 839a4cf9e6..ca07585450 100644
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
@@ -1938,7 +1940,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .unmap_domain_irq = flask_unmap_domain_irq,
     .bind_pt_irq = flask_bind_pt_irq,
     .unbind_pt_irq = flask_unbind_pt_irq,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .irq_permission = flask_irq_permission,
+#endif
     .iomem_permission = flask_iomem_permission,
     .pci_config_permission = flask_pci_config_permission,
 
-- 
2.34.1


