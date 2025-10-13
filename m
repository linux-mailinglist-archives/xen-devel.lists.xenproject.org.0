Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8479BD2924
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142080.1476357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flw-0001iW-GH; Mon, 13 Oct 2025 10:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142080.1476357; Mon, 13 Oct 2025 10:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flw-0001b2-4C; Mon, 13 Oct 2025 10:27:20 +0000
Received: by outflank-mailman (input) for mailman id 1142080;
 Mon, 13 Oct 2025 10:27:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcN-0004Hi-KF
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:27 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0806c96-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:17:25 +0200 (CEST)
Received: from BLAPR05CA0047.namprd05.prod.outlook.com (2603:10b6:208:335::28)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:22 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:335:cafe::c5) by BLAPR05CA0047.outlook.office365.com
 (2603:10b6:208:335::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 10:17:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:22 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:20 -0700
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
X-Inumbo-ID: d0806c96-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIE/XPUodBLpLPFOCaDDaY/iFHAKmJDiwHv+lBFH0IkYCFs7VHFjbUsgFZ9GX5PeC+nJ6wdrBrgg+GeyZeXB9wnaW4OsVosfoeKxE+fZbsUWWuaPhunS8FgEu1lLXH2Xlu67gu+b6cVxTylUsOHYeh7bOzqUs+fmt2or5CflD8YsQGQ75YkPTkei0mKuLbEKJs9bWw5Q73Xh1xspfXbKU2lie6pnBoi/Kh6BgPMgDBlZDkjDHfs+EV7l8+UTMG61icESFVeATqR/QckZNScud2itrzpc8tT47cJYPDeUXxDM3TuwRydwu5l+g8IFfpb7vg7Qj7YjHB2uoQjJYn7ZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9x7Xa5KkUvXjjgvJRgz/0aHtQ5ZefYKpd00CZcZ/TA=;
 b=uJAFQ5akoEY2xHTpQ+5SWsX6NIstGNgvHgMOmbT1fIaOZO/w+a3ZDQzZSmyZtBt4Ih9e5aIUk+F/XF2/m0+LBaLPgEB9qUbLpy0JrmxsRyB2xAwTSKzmZIu9vHdODeAAbZmNyEm0qfUFCIuGNSFW8nI3gDnC4uHma7QG3PQqm2keCcZtbBcW6gKSc9C5JmbbMB6W5kkvedB7d1CfgvTFhdJVQOrpLPjt7SFTokyl9mpcLMi+Au2O2x9RgLc0d6NvlYKrLKiEmJx4dM6yWBr5X/olK/nfi10zpnRrI40sF8rc7Cjf98ExNGTj309YVMetkq0k6qK611C2eaMs+Dy0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9x7Xa5KkUvXjjgvJRgz/0aHtQ5ZefYKpd00CZcZ/TA=;
 b=iv9ifZ3sG8pbJWVdFWgUhT+3xj8yXjkNqafvpsmDrMlAscAtydUQQAcpuV1D44xDh1iI/r7Gun+W4TmD3VxUF+rjIo2ggN8sYmShpIBuE6SEF3peOxAD1WuzUuSVhYuU82T3SlJ5DJ4AoQOjgw72hFxhxboEx2nkSvvn4Z22jh8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 19/28] xen/domctl: wrap xsm_irq_permission with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:31 +0800
Message-ID: <20251013101540.3502842-20-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 7477c648-d6a0-4956-b935-08de0a41b2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6agB+owhsd3NEdlqhxSCrwwx32UfAlIfs2VZCcphzVjiRAO6LWTenyzc/0sD?=
 =?us-ascii?Q?CPgzBGvXTpRNwIty0x9iO+hOlM9hM2Ue45CJv+DO5q4ZutiJ/qjugegBv6Vo?=
 =?us-ascii?Q?URrFblpnoQQFB+fpIMFoCJx+rEfS41rYGkfC9qu0uiRf2fxgg0v9kX7jLfYK?=
 =?us-ascii?Q?1uSir7tgWSujOf7yRUXFDsmvNCD0iOSBmtyi6EVHLJjVBm57MZ7kGT7Vg3rw?=
 =?us-ascii?Q?S/huwjRw+Dud3tJNneZgBet7JmdSnwwkRXc8RPCETLiL4hxS1tAYDSnmw24j?=
 =?us-ascii?Q?t8ofnHHrF13cBNXHyXtNTx1hG21DMhseuLGRNR01C7T9z8ocK+fjR2Y8MxlL?=
 =?us-ascii?Q?wCD8+xjqwNYwqesMvTfAs3IW6fBD4Jh/treTUx/rZtcq4vK+YHkaifvbM9Ub?=
 =?us-ascii?Q?ElloeOpgEn/neVdGslkzUVSfPOt32uAFzEgA6J9QJourIImCLjyc7cdMuLtZ?=
 =?us-ascii?Q?llNMHdB6qoZqBG+FNTmZ954g1e6LGyvF6LzxX0dDHXJhQ6UzcSPShgMKScNF?=
 =?us-ascii?Q?ZnZ4Yzi2DyMA4ONTjkt4Av0VUFC5ChrN9dgYy1BsUkVlO5+s7Xa+Wso4Slcu?=
 =?us-ascii?Q?wyB+HowPLv4Pq9PI0D7BzSjdWKRKZe4DOI+DIES9d/84WCKVqtgt6D5+z+aj?=
 =?us-ascii?Q?n64WKvLdVJfYnuYbaFsFV6KghyrJwrfqiCe4+A/pzOiRVhncXGDzxT4yM83p?=
 =?us-ascii?Q?R/+ZKOSSfVUFv7Vqruj5cg7SEz70Z1Qm3O9IZk7D7zrTQpbePYySssLK3EpS?=
 =?us-ascii?Q?/M8M4bDSeGZOoBIFQ6nlJ/gQPaPwsRDOHiQpBsyc64rvvelEJ6cSayfgJ0zg?=
 =?us-ascii?Q?YOkCAs7mvZZbsqD342k8VyBa1rYHjcHfhSkyjue5cBob7QIrpo/F9b3MffsN?=
 =?us-ascii?Q?VERCvFmuU722ju4S5DMaJNH0RkvclkFvcf7mIYGtoOhjdj94DPb4P+zON4Fk?=
 =?us-ascii?Q?cCaTpye+5iZy+M9MjqEqk3UzE1CldktfBCEQIvbc1mPZMqZpc42mQqqSwnId?=
 =?us-ascii?Q?Rv10iiJZkY1oMsWlgcIoeL1nJVzl0Hy+vWa+rjXWRNxH7ou+59IdTTFj0dc/?=
 =?us-ascii?Q?GBBLnFm/YeZM0rkpiVnHCgo9/JlAt9oZbeUWAkJu+XLKduXpAXWgMILcusja?=
 =?us-ascii?Q?FYa/MYYWMVnJe6mCXXhf2zaZ8A9Sb1qHV1Nyb3kKTK70hXQpEGhIyPrWgGR6?=
 =?us-ascii?Q?2JHehnUSQxv8G0W0eL08Yb1BTmB00SFz8fZ+1Aiv+9xHN9/PJxnKa49R7IoD?=
 =?us-ascii?Q?WHUEsUbgJ/k88B96OZuSSutdgflzg4fjJ+PMLAyjWcbJjzfiGVbdRRb9wsAo?=
 =?us-ascii?Q?2V04BDRhIlZzaqOwbV+1Yxh6WVHceRSXcP8mTZCLa5bJJ+nX8GadNhwFbpqx?=
 =?us-ascii?Q?SwLopGZC5XnXYmfEAwqAl8pTyyGdNNwvQNoGfONcB6tLHr/WHfMl5U/jX28k?=
 =?us-ascii?Q?ejlBf1KRmb1mHriOhCMxC51/NjF/a962p/22MG5m2buXPIhcmlfUUGB3P4BW?=
 =?us-ascii?Q?V/44ywtqO04p4KXfjDhDxoP7/z40i7VER3u0mXGVP4Y0cAQL4jdoq0KtOua6?=
 =?us-ascii?Q?pr4D85pbUfZTaPGOh10=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:22.4648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7477c648-d6a0-4956-b935-08de0a41b2fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479

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


