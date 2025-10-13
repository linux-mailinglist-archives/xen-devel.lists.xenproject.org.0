Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D25BD280F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141904.1476087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbd-0004Xj-9G; Mon, 13 Oct 2025 10:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141904.1476087; Mon, 13 Oct 2025 10:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbd-0004Va-3x; Mon, 13 Oct 2025 10:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1141904;
 Mon, 13 Oct 2025 10:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fbb-0004Hi-Ng
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:16:39 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23a25f4-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:16:35 +0200 (CEST)
Received: from BY3PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:39a::25)
 by SJ2PR12MB9239.namprd12.prod.outlook.com (2603:10b6:a03:55e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 10:16:30 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::33) by BY3PR03CA0020.outlook.office365.com
 (2603:10b6:a03:39a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:16:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:25 -0700
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
X-Inumbo-ID: b23a25f4-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMIZtyYhZpSlc8SA1Nl0WrBvhGE6bpDxAx/u6nhX9O/NT1tp53rjYY6dilZNQhCqv0yyeIVhk67nc2z+22YbcFsx+zr3DBfMG3jvqHnsxxTxppY4Guqhktk10V/wL+N/P6Rx5gfjHewdkiTD2j7/29o+Q7rg4c0/nDh2vbTPDzeOjHGzy1NMHDEvvEOSFwx9dmMZgH1cU363haQKtK6+G6L8RhtjB9SgpOgp08QIKtABKvWp+mgVvJ5CyEbDW7UoqjCcfYQos2WUEmrlxWfaFIXLOPhxI1h+it8OtO4K8+S/u1I3IXLNjRZlnR7xRBlt1kSrOdRadPU2t9suTpLbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORH8EP+CphvCO9xfmoZ1RhH5ktFOjdvuVwnEn+eXJWw=;
 b=dNQQftBMOA7jc4wMtBjjO8BEW48iXXMXh8br3Mg8VCv0JyFlq3lMzXnuE+p/e4sGJuyhk4DZ10eOLSJ6jSKj8T+OGxRbmIdrwcs8tZz9WRhe4+3VE/l3urT4MHethJ62G7vdEhgR+vDlsCAfE45w49a9JTvzqEU28O92IF9IKXeIAsLyG3wyK0sZCVsRg2sxqq2rXA8HrxG3K/PGmAlyrttjZzimMz8YPq5Qh09ns9EprpkvP0JxxMLz6NxaN8enmYAN5UyLbkeUvbQNtWLGJZOPIemhdeUjqjBWgsklsMCQrUkC+5BcIn9iFTOpHjHW+7Zj70Tg9Vz1yV0Mo7cqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORH8EP+CphvCO9xfmoZ1RhH5ktFOjdvuVwnEn+eXJWw=;
 b=TKj4FjCDahYzK5MoHLlq6485vuoHvz5Kk8n6lvIzL9N6nCmLvRj3QvxoAcsNS3+mT/g8djOc/+JoNpy824sosZV2h8/luLfuNzPaMvbif2kPFaUlitjjMmmS8Y32ZFotI7R1Y78QF2r0F0F5C2Ye46YwRv/yRI5mt+ZI5wCnoKc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 01/28] xen/xsm: remove redundant xsm_iomem_mapping()
Date: Mon, 13 Oct 2025 18:15:13 +0800
Message-ID: <20251013101540.3502842-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SJ2PR12MB9239:EE_
X-MS-Office365-Filtering-Correlation-Id: f9debf36-eba8-4a48-78ef-08de0a419406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iIzMBOKieQ+lL3w1WTvRi5kuS4sZlqUvKLw376n2k67JeXdawZ1UWzmxfhtC?=
 =?us-ascii?Q?TH+ROCrKA4jBmbR0hgK4J4QU9Y2Z7YeEUQAK/yq9nDPySIc9gQ5bdUa5K+ku?=
 =?us-ascii?Q?jUbAPEIw+o7bZWjon/WfXZe7G4Ju2QGXlZZe752i/CK4CXQn5ADCintW9JbO?=
 =?us-ascii?Q?ZDgVJd5l98A3i76Of/R5V6SA0woaVFm0KBKTLMyT+24i1j+KdXQr5LkiA2JB?=
 =?us-ascii?Q?uQ1KlEHARb2PaPuacbEGTIgzZnRm4vx62kUZtopzhTKN79iLpt39pCqvVmh2?=
 =?us-ascii?Q?47bSMtf3yqkmYSTiCEgdRAmZYWPa67RMJeC33oRFwIkGSdZjf2UA+B4vkOjj?=
 =?us-ascii?Q?MBWzAG4xUZnV2x/B0TbhPH/npTY5Ka2s5suvk7986MHv+msZmLwBvc6I01kA?=
 =?us-ascii?Q?NTv8cUo9QcVweUvp27/TKXtz2rByF7CfJJ+WZmXKsXvK3OojbW1zLxFe9c8k?=
 =?us-ascii?Q?eJyvCBhzz/bsiHyPPMyXFqLfPZPCgzrZvnwAQtqnVP6yDl1eraS0AJjo7Zht?=
 =?us-ascii?Q?4DtvWTKNd/IMt+vykhMbqEvRT2e0u4mBAO0UCSEymuQonVWWlIO1QeNOKE0l?=
 =?us-ascii?Q?L609D2HYi7i9Nu89dEkIP5UnuT1H1fSdUBYlTod4kJEr0C8bRalPde7GLRxE?=
 =?us-ascii?Q?b7nLCaN8NrYXfJ/ZWdpiV4JhsqcJQnLnFnlEVy/myj6eQvsuJ+w/K5ndlLkB?=
 =?us-ascii?Q?aNzAqhrOq7kTRScvZ09/PMjuKQBrxocjdmpRw7D9dpdonJBW/WVU7N94e29Q?=
 =?us-ascii?Q?JcI9/QclqD9hbBK2/VyiyvG8XIffhP5H8RXZDWpH/Ggd6dVhWrVJY4KK5buD?=
 =?us-ascii?Q?fq8uKbJQxVMTAwnsgbPH4HIHd3C+Xr2Oo9suT1wjt0nhNdnjh/DBttF6TTZy?=
 =?us-ascii?Q?uOOIOQ5HOFITo6om4zZTtAzyzfxNAnY4QT7/p/z5KBnqet1VMvWTFYMVaNZo?=
 =?us-ascii?Q?y4Dy5FcJ4uwKH4lFjJXThru6MXPNNpbQT2L9YgdTHXIYuEhKeJHpogCu9Nex?=
 =?us-ascii?Q?jLsKsSCbArWsEZr4RaMdwFqTcX4gzE2H3T3+4GVjrH6pbk68Y+AOMJ4q4B4/?=
 =?us-ascii?Q?CghGCkvoJqP+BcYkUpgdQGxXV2m2soU6JX/bKdQRcU4nSi6M9v2oyk6gIGu9?=
 =?us-ascii?Q?RMslI76nFHt+7bNsHCYEu2Y8AMutqhqcWQQ96VZ2tJ598fjkQ6/zd+eTH9Xd?=
 =?us-ascii?Q?Ydp10TkjxFTn2QRTZqqJdM42N8cdQbXG3CsOAIUi6QvsiuINqzvauttQOsIe?=
 =?us-ascii?Q?Qzf93w7y+oFE5Ah4usrRfl0CCRlEsBTyP/OI6d0LmqTY6cCVMsuSbimr5e+a?=
 =?us-ascii?Q?y11oMpJ0ef3VcVUV1ubgxxS/BBYEoj/dNOAly1Q9q5DlGDmMW4KOjemykgYq?=
 =?us-ascii?Q?PL8BpjPmYnexkzWjagDkLzPjDMAQFsLlLuNAgHgT1WEPO+ROwafRzTw3dBua?=
 =?us-ascii?Q?E5b1kVEX570RgPC0NxRr1bXqbZZ82+6feMg80/EeDywhK+DYhRAKCCVQA4ya?=
 =?us-ascii?Q?Lx6euCUU7J+wCLQDxRS2rcEWga6izvcvKg8Ty7wpsMcEjqo4fU0AsdVJCUqw?=
 =?us-ascii?Q?MiadqvRSzI5XaScQnAk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:30.4529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9debf36-eba8-4a48-78ef-08de0a419406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9239

Function xsm_iomem_mapping() seems redundant, and in flask policy, it just
directly calls xsm_iomem_permission().
Remove it and use xsm_iomem_permission() instead, with the benefit of a
cf_check disappearing too.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/common/domctl.c       | 2 +-
 xen/drivers/vpci/header.c | 2 +-
 xen/include/xsm/dummy.h   | 7 -------
 xen/include/xsm/xsm.h     | 8 --------
 xen/xsm/dummy.c           | 1 -
 xen/xsm/flask/hooks.c     | 6 ------
 6 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 954d790226..71ebeff494 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -701,7 +701,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
              !iomem_access_permitted(d, mfn, mfn_end) )
             break;
 
-        ret = xsm_iomem_mapping(XSM_HOOK, d, mfn, mfn_end, add);
+        ret = xsm_iomem_permission(XSM_HOOK, d, mfn, mfn_end, add);
         if ( ret )
             break;
 
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 469f497744..1ff6c63f4d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -67,7 +67,7 @@ static int cf_check map_range(
             return -EPERM;
         }
 
-        rc = xsm_iomem_mapping(XSM_HOOK, map->d, map_mfn, m_end, map->map);
+        rc = xsm_iomem_permission(XSM_HOOK, map->d, map_mfn, m_end, map->map);
         if ( rc )
         {
             printk(XENLOG_G_WARNING
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 12792c3a43..5e29165763 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -570,13 +570,6 @@ static XSM_INLINE int cf_check xsm_iomem_permission(
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_iomem_mapping(
-    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
 static XSM_INLINE int cf_check xsm_pci_config_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
     uint16_t end, uint8_t access)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 9a23d2827c..34caad2f7e 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -116,8 +116,6 @@ struct xsm_ops {
     int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
     int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
                             uint8_t allow);
-    int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
-                         uint8_t allow);
     int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
                                  uint16_t start, uint16_t end, uint8_t access);
 
@@ -517,12 +515,6 @@ static inline int xsm_iomem_permission(
     return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
 }
 
-static inline int xsm_iomem_mapping(
-    xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    return alternative_call(xsm_ops.iomem_mapping, d, s, e, allow);
-}
-
 static inline int xsm_pci_config_permission(
     xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start,
     uint16_t end, uint8_t access)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 8b7e01b506..86daca3e89 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -75,7 +75,6 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .unbind_pt_irq                 = xsm_unbind_pt_irq,
     .irq_permission                = xsm_irq_permission,
     .iomem_permission              = xsm_iomem_permission,
-    .iomem_mapping                 = xsm_iomem_mapping,
     .pci_config_permission         = xsm_pci_config_permission,
     .get_vnumainfo                 = xsm_get_vnumainfo,
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b0308e1b26..e98920dd52 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1167,11 +1167,6 @@ static int cf_check flask_iomem_permission(
     return security_iterate_iomem_sids(start, end, _iomem_has_perm, &data);
 }
 
-static int cf_check flask_iomem_mapping(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
-{
-    return flask_iomem_permission(d, start, end, access);
-}
-
 static int cf_check flask_pci_config_permission(
     struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
     uint8_t access)
@@ -1945,7 +1940,6 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .unbind_pt_irq = flask_unbind_pt_irq,
     .irq_permission = flask_irq_permission,
     .iomem_permission = flask_iomem_permission,
-    .iomem_mapping = flask_iomem_mapping,
     .pci_config_permission = flask_pci_config_permission,
 
     .resource_plug_core = flask_resource_plug_core,
-- 
2.34.1


