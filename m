Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04BC78956
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168573.1494550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqa-0007jO-Kl; Fri, 21 Nov 2025 10:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168573.1494550; Fri, 21 Nov 2025 10:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqa-0007hB-HP; Fri, 21 Nov 2025 10:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1168573;
 Fri, 21 Nov 2025 10:58:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqY-0007TB-UX
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:34 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e0d14a-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:58:34 +0100 (CET)
Received: from SN6PR08CA0003.namprd08.prod.outlook.com (2603:10b6:805:66::16)
 by BL4PR12MB9477.namprd12.prod.outlook.com (2603:10b6:208:58d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:58:29 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:66:cafe::d6) by SN6PR08CA0003.outlook.office365.com
 (2603:10b6:805:66::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:58:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:24 -0800
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
X-Inumbo-ID: 05e0d14a-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8eAMa3A/DM8/2a/mFH2Tun8BemMcv5S8g7SnlUwdBpQ1VCnNyXDovA5cDo0VPgUTZWnyLxcKRccADLiToU6Tyghz4+Zp7HyhV42eGV4c9o3nEo26KVdKVRJHIJpezFGLqRO26MxAiHRRByPrHsw3KrG1QC4LizHKXh5n9uAoUSlm9blt3tZuI1TiGOsNaerMCIvedQ07YK7qWw+OeBC73P2wHCI/7PcdO1zRkgjxqHd5Pg1xlkLPf15iH/jOg140G3tDrAq3OsAKA+MsRfbuxO+dGzCYySLFFNgpaYBHDVKHPGCH+08RIHHZZENT+1/XCf37cU1+cC+KAkcDNQfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBzLiVF0LcwUzOwUxdhWXxnzaOdeFBAaIqk1xLrzlSc=;
 b=A45K6U/L3CBdDgO8l4TqJdU8AumVZMPromSzcbkEOd1NmErMRli2NUeIYF4UJjwdoXy84PN37/3lSgXTYD/66sbDlpAtsYdhTdvjqVeVj3PAvPEN6Y+Pbrjox05UmyES/q3KYOfR+bA9obv/GN8AA5qXrS3IA0VjD3Z4EL8svcF1Fur3wf2GPLdFSEngVXgnCzulf0Uad2rhpBYQMUCwu7zZQ3DN5iQoGxFH4/FmR410HN1PuYgJItF57VJufRujWc6hD9yXskOivH/4rylRBkdaHVgxcYKuIZoOwVPKal1whI5pr0z12Oq3W16H6vERm270SVM+alzbwd6rmPmvjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBzLiVF0LcwUzOwUxdhWXxnzaOdeFBAaIqk1xLrzlSc=;
 b=FhREJAoAUkE+1BPW0RaiUGD233oivWc28nmbY1wMKGJwiRrDsdyBWNa7vfQ5TwK+kIgOneAPhDeUs4I0tDPPTLJA7dy7ZW4MTpBQ1wj1obl6jCP58kM+X2wnzQSYLPacCrk3n5pmCEjA5PfVeadGtjprlbI+HAo3aX9upI1VuOI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v4 01/24] xen/xsm: remove redundant xsm_iomem_mapping()
Date: Fri, 21 Nov 2025 18:57:38 +0800
Message-ID: <20251121105801.1251262-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|BL4PR12MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d183ea-3829-4c9e-8e37-08de28ece6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hBFfxkA7eNxxTgWk3KaCuyQS/CH088vmSOMW4QB4iPAPTyQNM9mbOFSa4nr8?=
 =?us-ascii?Q?4brLl7Md/PZ50YnUHHoh1oRYDc8DXcGSM4376vbrmMeC4+UtpVcAr+EgleSe?=
 =?us-ascii?Q?DHmj1GZJ7aO1Bw/tOtksowA9e7+4pvLxVQugQxPLH9dtUJ4+TmW1pvDBonJR?=
 =?us-ascii?Q?SRN7iGMmb6kWEyYn8cszpPl05TLZW4wnZNVIQJa89NuFcl5nqAs9bKX4qQVB?=
 =?us-ascii?Q?Z71NdLt1kSxzxeYSYFCs+K3uVZzfjOVbcIVjoDNRlZgHOtor28eZQdHaI0R1?=
 =?us-ascii?Q?8BgHo0askabD2lh+cfrsAGwbzaggLlfis4SqyVLr2Du5flJ86OGdELFnr4k7?=
 =?us-ascii?Q?VIIb92aZrxtGTWgUj9ajbhG7C98eux/A7YzPKO+/84YRCeokv0QcOjJJx/0x?=
 =?us-ascii?Q?TWUcu9G0ng7XAynfy3VuNxJzJ6Zu4tCjN6EkdXQhlDOiAFXLgIhN2271GXbd?=
 =?us-ascii?Q?z+Chof8OJg2m1lSsmdsrjfs/wzNbneN2/qmF/Q8YGBA5d80nMGgk0NBtJ+Dt?=
 =?us-ascii?Q?ruGOCIwJTMr7Ix9mLx8RQJxQJki8+igOhp3jWfDXg+a6SoNAWWTpqmQZ7WNi?=
 =?us-ascii?Q?DPa3xQQiKV/ti8jMZvwuhsjvOxXJjPJLDUEfjYNZrwO/5S38nnVB/VRt1REf?=
 =?us-ascii?Q?DTDUQFuE4c6jfBSUreEzl5wTfpgcFFiLj/l3sIIyE3ji+Z/gfvYS7VSChyJi?=
 =?us-ascii?Q?QJeVQJyDs0KqtvYmQh/gDpUs0CNHGFXXYde5AIItFQ0UyguHf1rCy6RNuolc?=
 =?us-ascii?Q?a0z8+hFjmBU+kKpZ6rPrWhBR9TUMh/EVJBX1CJnni/t2EvGQgPHm1ltwSbUT?=
 =?us-ascii?Q?5Db4ZjAuwr0IvVFjzmVz+yImUSdkvKe7Etxon61Z2pCU2b0EjBCg/DIX0R79?=
 =?us-ascii?Q?SEbjwAbgLH0bc24b0IwuWIbiQihVqVmUg80qD7bnTo3rZoWWs7SRLNNTpkbl?=
 =?us-ascii?Q?DaC7DJkchRJ8DAY61SLQLUOKDcTlavQcXQQiMNRoYuuwBLb065eeeRRb7+hY?=
 =?us-ascii?Q?4WxCntqMx4NcPp2HjTUs5IWP84/R2nL7Dcp81OGUSry01csjy/BaRaBvFtSu?=
 =?us-ascii?Q?ctZPBOw++tRaBc8+ZTLHTP/CnCq/UtbFdryLwJJ20theb92R9mI3PUukhnMe?=
 =?us-ascii?Q?2iQLuunMIaLG6wmOZ78iM0VRQHmITBw8pyJW/QMg1qruXTwf9fv1K9pFbcqA?=
 =?us-ascii?Q?0ZOwbLhx3IU9gbqdt2AcKV1gLqYEm448xdauy2sfPLydDhsTs+psySzkdrPy?=
 =?us-ascii?Q?mnNScgEpN/72KI6ETU1ajOTKjRihjfUt8a0Ujc+eqBj5J7nVXnJviEwCFesg?=
 =?us-ascii?Q?Em4pvfBIAB6HxDthk4x2aQDj3j1vlXS4BbFwaflz49qM+M/24xjTGJnAQsJP?=
 =?us-ascii?Q?t4MGDwIFaVA5cuXSLWsdjju+dtFNvVPqsoNrnG7DWjTCQZ8LwzvDhPPrViYl?=
 =?us-ascii?Q?0DiMGmBiIS+tl0KDReJrxJGdJHdNmsLmCHaT+hy7MeK8lsysjQqwupGkd/vR?=
 =?us-ascii?Q?mav/babQupIr8KNgrjxCNieBAFfyr07RvrjHk3XUQ4l9bBDpSf4yPszcWcNN?=
 =?us-ascii?Q?xXHHrWaUunZcbwTPzM0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:28.2339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d183ea-3829-4c9e-8e37-08de28ece6d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9477

Function xsm_iomem_mapping() seems redundant, and in flask policy, it just
directly calls xsm_iomem_permission().
Remove it and use xsm_iomem_permission() instead, with the benefit of a
cf_check disappearing too.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
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
index 29a7726d32..86da0086de 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -707,7 +707,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
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
index e801dbcdba..e4e1c680c8 100644
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
index d9e5c831f3..1d72431d32 100644
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
index 96dc82ac2e..b7b65a7122 100644
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
index 9f3915617c..89e790b774 100644
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


