Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AE9B50FE0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117678.1463798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWu-0005Z9-4e; Wed, 10 Sep 2025 07:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117678.1463798; Wed, 10 Sep 2025 07:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWt-0005W1-UW; Wed, 10 Sep 2025 07:46:11 +0000
Received: by outflank-mailman (input) for mailman id 1117678;
 Wed, 10 Sep 2025 07:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQm-0005yt-6J
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2413::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52992622-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:47 +0200 (CEST)
Received: from BYAPR02CA0057.namprd02.prod.outlook.com (2603:10b6:a03:54::34)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:43 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::6f) by BYAPR02CA0057.outlook.office365.com
 (2603:10b6:a03:54::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:40 -0700
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
X-Inumbo-ID: 52992622-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ly7DLNkdRMxRw6S9/Y8rj/ZyB99eietlVtejRl0k6r8zacNApW8UekguDSPVI0uWl477AaFMQoJ7JVCdZkVNyesZL43ltXsngRGjE9d42f+2eP0J4T+4AwbSvMmFyRW2HQLxO1s4/zoDwRoCzG/7f7lwie/sqIJZgNlXCR2CL11BxWOUkr1/x6e+ro20RFtjhaHFiKDJrziMKCJJjpiDiDCpAzC4/QFwTN6Pypxx8eX53JQImB0ZH1qcR5R9KP8JWoStAzOpW6zmk1gEMxGUywnRArqZ6l0PxxdSFYlNq+6+1AuQXMFXLqCzj29f91SepG5iyhfRIkGXZdKWtfXAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPLCxnD1ZJb6r1rXSz/MjuR5iKDACsR2gEr90FFhFxk=;
 b=papn7aqDBMcvjvGcGClg1nriNzzStuchjIVmkjgpYsusP41MEnZRXZbnXSIkoQx2ZyHefd613XvC8gXiQg8j9t2GwZ6kdKKtmV8/e+8uDzGClX4etbniSlo6xHeHE4SxavGVaIUgCYvy0Ut5/amfH71JsLwKy0jF8y3lUCAwkbHTCm02s9eebi4IFM7UJhFXZT7ys8oF6Ut0SbSwoPEHg4hSbeT6RtNn8aNt7SQfmNR20ZRntXKQTVQ3lENmUmEOasTv9AZZ8jQPbsY3x2dzboah4SBNwdDoGP1hEUZ0cEyuzYVCl5zvIa1f9QNx9JovY4lS00nRLDp2APOBtHYU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPLCxnD1ZJb6r1rXSz/MjuR5iKDACsR2gEr90FFhFxk=;
 b=meC+3NRmLur1NAjJxMIHSKVTr3XTskVM8Ua5wy310jeLWZmeo0aj0FRl62b0iAycXYPEUob9JVfInzkQJzQ+Veej659828d2V1+B5s9YkVXZgCw7lo8ILasJ0lgvz2p+JVSWGJ1dYdFRDU+m8iOEzThMlvQstiVd9uh6Ci5UcYM=
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
Subject: [PATCH v2 15/26] xen/domctl: wrap xsm_{irq_permission,iomem_permission} with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:16 +0800
Message-ID: <20250910073827.3622177-16-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 274d4229-6ff2-4e03-6e8f-08ddf03d34e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rm9v+Dp0w+e9+A7hbzulm57Gx5UmucCEiuyv8WBsVqHPa59ELVJMRnoQetyc?=
 =?us-ascii?Q?5G104Lua3BwoymLZ++QLWLIxhS+yLSvjbVfncJ5FxwSRi5s0kVut3dZwGokY?=
 =?us-ascii?Q?KcjiwknvKKnQ8lx9nGnjhQ78wNnm0oTUyTwzg9a+MaDjtMsq2Q2hGbiIvfch?=
 =?us-ascii?Q?uDPNvcOV7XieoO+kzeMv9guAZ0skzK9wg2fiYDiArZ2P4S9hxGngpadX+oKi?=
 =?us-ascii?Q?9oB/AgjJ2quqxR7qQ9aCfpA8XY72BRHljW+ue+mokVhPRgcmvj79qntFlr+X?=
 =?us-ascii?Q?iVAgLSZGTsTymPtxSn/1KXwjxwKiCCJ7XrvH3EnFZpSZguSUHbq+Z1PY8bXz?=
 =?us-ascii?Q?qJojJ6spwlO5PCusOQ2kTvZxSpMKGn2lGuEZCgkPi/sdQEtDkCreMUN4deG1?=
 =?us-ascii?Q?N4oabXDHYVD6SF9keaFRLan/x4QIOVQ9x3JFwN5h8dkrF7qPkgvxtUNmRPIc?=
 =?us-ascii?Q?32WeB38T9xE0ZiLnyD4aToKWJB0D6XYtg6+RTAaJyc++G/M7R4WZTvygOgFD?=
 =?us-ascii?Q?9rHb7pt06ZhcD7iLDLLBZQCsKjrcdeWTZbcOs/JSP5xm8/SgAq9N9M3ZZ6KQ?=
 =?us-ascii?Q?VNJ2n9wCCFODF3y6DSRnN+K9KgLNHwHRD3jbOUpMt1odPCDHAzCeT5vRuNgX?=
 =?us-ascii?Q?Wk6MwxnLCSoTcXJwONuQdJBBG7qWlmbXAz7GyOh9qox0HSL1i4f81REnA4QW?=
 =?us-ascii?Q?WCsKDpKa35tvxxyIspOnG91boTYuK4g6WTR7lf/1mWtXejjTt5wzM/9O8KQR?=
 =?us-ascii?Q?x2fo4nIVXetMLGXH/9Xe9xGRbew3tfIHo+CJ0K4yrG8sAUIXXZO8y3UHRrWL?=
 =?us-ascii?Q?uu7f2IcHArm+pDGsx7ClsyGCJm46/4XRawoRtqJ0vOT9BbZg18G/1zbf4dJg?=
 =?us-ascii?Q?w25SUvLhPOcFKwnMoGkJjFZrR6Y2nm+z3ZWc97rTssiWSGLxvndkv/b5VR4F?=
 =?us-ascii?Q?WtttbRyfTxYLS6iZd/vBhcn1R4rKFh/QPDiue4Fa9s0Sh3K+ouWOInR2CcJb?=
 =?us-ascii?Q?T3kvWeCrF/JECHX08xK9i/8C2bDjuZXO4UN/Yg6avSwe+PkC2epK8GdymGdE?=
 =?us-ascii?Q?ftgVvHN0O3BI1NxiPivV8Lu6jGV7pctfej0qwMDtYDgvXUpIT7CpSmcVFWTO?=
 =?us-ascii?Q?JDNoPsbtcrMpuNWTcdKAcZON7sXZjzhrhTX3fxuQ7ucKZtfQhhgaT7BTI0rI?=
 =?us-ascii?Q?KhD6CEzjUP9UjWeJatzCLoM6KScCRWmem97dVO1yobDjP9CGnzucHXHysKpB?=
 =?us-ascii?Q?mVZc+V6AdJ9Q7IVDzjvL6N4VVh14IFCrNz07w2S80yjPpT1LvGQl1b5BSdWG?=
 =?us-ascii?Q?WWemsnhqiVH62mtW5dBy1uqpeLrOxRLUp/Mi83ndq3tbw8Xd+8DmTTx52301?=
 =?us-ascii?Q?WEBWUr5Bs7mCJKI1dFEmkZuj4G9X8RD5YN81BtikhFD0pI4RVCKIsUYgk5k9?=
 =?us-ascii?Q?a+AUFJQWB+9JD+9HpTDEeiGu8w1uXBDqGwfT2FPaaX28pF0mVuSBojZDpa22?=
 =?us-ascii?Q?2n/4qYbYAqcsl3c6zSkrhiIc7zHgWEf1ud4u?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:42.6747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 274d4229-6ff2-4e03-6e8f-08ddf03d34e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778

The following functions are invoked only under
XEN_DOMCTL_{irq_permission,iomem_permission} domctl-op, and shall be wrapped
with CONFIG_MGMT_HYPERCALLS:
- xsm_irq_permission
- xsm_iomem_permission

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/include/xsm/xsm.h | 10 ++++++++++
 xen/xsm/dummy.c       |  2 ++
 xen/xsm/flask/hooks.c |  4 ++++
 3 files changed, 16 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 4d332ceca2..1fcd945336 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -113,9 +113,11 @@ struct xsm_ops {
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
@@ -508,13 +510,21 @@ static inline int xsm_unbind_pt_irq(
 static inline int xsm_irq_permission(
     xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
+#ifdef CONFIG_MGMT_HYPERCALLS
     return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_iomem_permission(
     xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
+#ifdef CONFIG_MGMT_HYPERCALLS
     return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_iomem_mapping(
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
index e8a4deb2ea..198053be77 100644
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
@@ -1943,8 +1945,10 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .unmap_domain_irq = flask_unmap_domain_irq,
     .bind_pt_irq = flask_bind_pt_irq,
     .unbind_pt_irq = flask_unbind_pt_irq,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .irq_permission = flask_irq_permission,
     .iomem_permission = flask_iomem_permission,
+#endif
     .iomem_mapping = flask_iomem_mapping,
     .pci_config_permission = flask_pci_config_permission,
 
-- 
2.34.1


