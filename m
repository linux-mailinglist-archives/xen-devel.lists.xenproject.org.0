Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF63C789B7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168654.1494669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtO-0005wM-2o; Fri, 21 Nov 2025 11:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168654.1494669; Fri, 21 Nov 2025 11:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtN-0005px-Qb; Fri, 21 Nov 2025 11:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1168654;
 Fri, 21 Nov 2025 11:01:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrI-0007TB-IA
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:20 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f0224e5-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:59:16 +0100 (CET)
Received: from CH0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:610:b1::20)
 by SA3PR12MB9226.namprd12.prod.outlook.com (2603:10b6:806:396::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:59:10 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:b1:cafe::a3) by CH0PR13CA0015.outlook.office365.com
 (2603:10b6:610:b1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Fri,
 21 Nov 2025 10:59:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:10 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:07 -0800
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
X-Inumbo-ID: 1f0224e5-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o47vB8NEwJFlr65tBURN74Y+SXnmJUsnvvQBmePHwtuVgbiLEcw08gLgDhbGcAf7t8q0b1Gzob1LmDk6jlAwhkdnegrEmPsppfuVhe5UyFKX0bypGZoWUC4JAjsP9mCadBQhgDuWnPttMKgXkA0+T/Ft9rac663ydk7KhRwAtClWMfMlPb0oh77yS5nhybJMR9mAWptSbFbbL21U4guokbXOUKf4A9z8vio0TPYY7wOhnM+uR/NABJZwEh6omFhRuoOOfDOOxZfJ7xaqnj1PrrgSu9+dZe6k7o5jDX+6xr4uDEU/0ALPNu8tdNl+qBFRYOaFEfQT/E2RlugOaijUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPiKSRzmKmBy67WRs8uqmzP5qkra7BuAXLqSmIOjGg4=;
 b=rR/ZkihojgxO+33hjQ4Pr1b469mSQ0lzcuktr/P+SaqPQ75TZQK0logYoM3Ey600JnXRAuIUnk58yOaEzUOue4OhUkNQrYyU3MBbu6p5RBGumv/lYIBU19rBbTi1KTG6wP+p4tt3AKxFwsCJCL33zolw5KE+1IG2bt984IWnDMl12fS2DZGsQ8CDlfXDC9i+Pyc/8Zks+zg/gdGgCWRewK/6ENBeNLbqZMBXXDqnPQN9o3G4WvFAEefC7so/wntUUww0IG0wsjR2lhCPZrNuaKcSF5k4SM1r0XEWVY/eCjeodHA0YDn8dDY6rfO6W5AYMbbSNwpxNdSNSVkXoB5FXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPiKSRzmKmBy67WRs8uqmzP5qkra7BuAXLqSmIOjGg4=;
 b=xINDEfD0VKS+XeUjdNn9W3qzBydl5Iv//NIgUpwgxmX9JXsGb6iwPFuZ2t9stI3eiQTE5gl9fDZ8VzE3qyBAVz9pJJuXFaDU3VtY2XIFKV/8nO3LWG8A4rf2//Hgt9UxwzfDDg5mfL5KdQgK4dmLYpObTdv1xR90+NpcgdKg2fA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 15/24] xen/domctl: wrap device-tree-subset iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:52 +0800
Message-ID: <20251121105801.1251262-16-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SA3PR12MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: efed9477-9661-4776-854d-08de28ecffb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iNG9xUTsa0EZffnmrsjxfJhV5pR5iCFYJ5b7PeNx4Av92uZ9dW10Mjc8l9A8?=
 =?us-ascii?Q?Wektmk4Sa2quNsDG0J7WeZ/bk7JBb2B0vUM2tTpVXJD7R0cW3WgKgoktTdQH?=
 =?us-ascii?Q?0eB8/f1cPYg1FEvCVKgRcgVRTNPA4GflsFfN6UA2RVEdPUQzPgOWuMZ2FQqE?=
 =?us-ascii?Q?7EvEuoDEd+fIFtiDxYeLpt0sEP6Bu0xIZMYA2J+skmQj4baQTTjcjydOKRFC?=
 =?us-ascii?Q?rB9mR5cR40IiOBTiQNLfP4gXvQNbai2G/3pzIXwn5ljRJO6LI89oG89dceLk?=
 =?us-ascii?Q?vpjvtd6Cr+86sP7EA7ya8dWhzCzi+3FKgV9KWSDUqS/1kzxNq98GZNnPKFoS?=
 =?us-ascii?Q?sT3hicBwBwdzm3JZY5cXsXqx8OymAvJJnOjBKvQFwIHD09M9ex5NadW7uoaD?=
 =?us-ascii?Q?tAXjy35ZzMUHkzNFfKi1KvcnVxBp42L0BIzpT/rM3VOGJa4Xpj0+hVxAxgmI?=
 =?us-ascii?Q?jeRYWgSZAlTb6onoefXzlsIau4Wv+YTVOlRpvm/0pvwDpMI6oMNOAY/xSOiG?=
 =?us-ascii?Q?5X5dvCAKy1nH8DQGhzgAOWHDsHgt8B517UNdQ4y6Rw1nuWDoF2iThXOcpamj?=
 =?us-ascii?Q?PugTk6bVhc1Xf6tL5ya8Jw4oEFgDC5j9btbe+laNEewkrRzO82h60FkkPugO?=
 =?us-ascii?Q?i6Ekh3eh5JtUzcKzZ5reNOMa/tVWHZcR3+e7haL11rd5It7dfuWqOyh0RL3e?=
 =?us-ascii?Q?MyGv3azGq/MgkM3jurUZbimz9GM2ydEEZSxdbvB5BrV5Gx3YeobgvyTAlgKf?=
 =?us-ascii?Q?yKoiL78ptzriBGd9jJjfK7tXxxbMCzjs9Cz0nsqVI4qrWXbGlt1uoU3fCsG1?=
 =?us-ascii?Q?aplfuc3DKEbGbyDVwqqKpjvkSX2BlPgpyOmr4t/4AKwaqGcFeXk6wkhDTKxh?=
 =?us-ascii?Q?A0drjvteLvUnSPrXt31P6cNM+aC79yv1VXWZXFVenafI3C/HtbAmmRPxR40e?=
 =?us-ascii?Q?Ocxjjle5gpnG7praeS3aX11J9LZx0ZrExAEA+wmXI8LGw3wDpQ+qihTqzvvB?=
 =?us-ascii?Q?Hi/cRzBBbxzSMO921UpYsZWt2K15hYhChiyLFjbO4/GXDZQMg3hrSC4jrY/A?=
 =?us-ascii?Q?9UTcAoj3QkT6zDTBj7ufsrpTmbIbQVepYbZ27beqkyky5dBSCHfENd56GHn1?=
 =?us-ascii?Q?tFRDJI9z8sHfGdwZt1RbH5YZknmIDCtL7jc0ZXOukPRiHAiZpGdc64qA8P9/?=
 =?us-ascii?Q?9uJ4g7IDGVsD9AnQz/PUjUrBKvSAlEjLxC5X52NX8nNZbbAPWEUZ1CdfaSDF?=
 =?us-ascii?Q?36dEbtTcRrJmcQtfnCB08PUqNxM4cfvzKBhOsvKqjbpnHmCyQHkVPUYkDH50?=
 =?us-ascii?Q?Fbgp0ZtS5wKpz7DNtg7ZB6VRZnyZECC72hWxj3DjsjK6fbz3QODTr5OPC4Zl?=
 =?us-ascii?Q?V8FzChtcmu54i9utTwO3RfDIs0FuVyINRHcv+gabPC+Yd32CL258Ko2n4lt+?=
 =?us-ascii?Q?jovccAZh5p3+iXp6Y1tMu1tZW6dzfIFHh24gy9o5VBOmQviQgicMNGrf78d1?=
 =?us-ascii?Q?QZsW8q7epHFpbDSPHWnlzKdPXzvM0EEMMLQ57W4GCHFiWN4pG3lg9Iq4p0Cr?=
 =?us-ascii?Q?u+PEDAyTQ5YNDz9PB5g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:10.0312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efed9477-9661-4776-854d-08de28ecffb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9226

Function iommu_do_dt_domctl() is the main entry for all device-tree-subset
iommu-related domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
Tracking its calling chain, the following functions shall all be wrapped
with CONFIG_MGMT_HYPERCALLS:
- make PCI_PASSTHROUGH depend on MGMT_HYPERCALLS
- iommu_do_dt_domctl
  - xsm_assign_dtdevice
  - xsm_deassign_dtdevice
  - iommu_deassign_dt_device
    - arm_smmu_reassign_dev
      - arm_smmu_deassign_dev
        - arm_smmu_detach_dev
          - arm_smmu_domain_remove_master
    - ipmmu_reassign_device
      - ipmmu_deassign_device
        - ipmmu_detach_device
  - iommu_remove_dt_device
    - iommu_dt_device_is_assigned_locked
  - dt_find_node_by_gpath
Otherwise all the functions will become unreachable when MGMT_HYPERCALLS=n,
and hence violating Misra rule 2.1
Move codes closer to avoid scattering #ifdef

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4
- split into PCI related subset and DT subset
- Move codes closer to avoid scattering #ifdef
---
 xen/arch/arm/Kconfig                     |   2 +-
 xen/common/device-tree/device-tree.c     |   2 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  26 +++---
 xen/drivers/passthrough/arm/smmu-v3.c    |   4 +
 xen/drivers/passthrough/arm/smmu.c       |  55 ++++++------
 xen/drivers/passthrough/device_tree.c    | 108 ++++++++++++-----------
 xen/include/xsm/dummy.h                  |   6 +-
 xen/include/xsm/xsm.h                    |  12 +--
 xen/xsm/dummy.c                          |   6 +-
 xen/xsm/flask/hooks.c                    |  12 +--
 10 files changed, 126 insertions(+), 107 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index cf6af68299..5a5d7810c8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -270,7 +270,7 @@ source "arch/arm/firmware/Kconfig"
 
 config PCI_PASSTHROUGH
 	bool "PCI passthrough" if EXPERT
-	depends on ARM_64 && HAS_PASSTHROUGH
+	depends on ARM_64 && HAS_PASSTHROUGH && MGMT_HYPERCALLS
 	help
 	  This option enables PCI device passthrough
 
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 0b5375f151..70bd8e7da5 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -371,6 +371,7 @@ struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
     return np;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
                           struct dt_device_node **node)
 {
@@ -386,6 +387,7 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
 
     return (*node == NULL) ? -ESRCH : 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 struct dt_device_node *dt_find_node_by_alias(const char *alias)
 {
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index ea9fa9ddf3..b1fc14bc32 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -739,16 +739,6 @@ static int ipmmu_attach_device(struct ipmmu_vmsa_domain *domain,
     return 0;
 }
 
-static void ipmmu_detach_device(struct ipmmu_vmsa_domain *domain,
-                                struct device *dev)
-{
-    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-    unsigned int i;
-
-    for ( i = 0; i < fwspec->num_ids; ++i )
-        ipmmu_utlb_disable(domain, fwspec->ids[i]);
-}
-
 static int ipmmu_init_platform_device(struct device *dev,
                                       const struct dt_phandle_args *args)
 {
@@ -1138,7 +1128,9 @@ static void ipmmu_free_root_domain(struct ipmmu_vmsa_domain *domain)
     xfree(domain);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int ipmmu_deassign_device(struct domain *d, struct device *dev);
+#endif
 
 static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *dev,
                                uint32_t flag)
@@ -1254,6 +1246,17 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
+static void ipmmu_detach_device(struct ipmmu_vmsa_domain *domain,
+                                struct device *dev)
+{
+    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+    unsigned int i;
+
+    for ( i = 0; i < fwspec->num_ids; ++i )
+        ipmmu_utlb_disable(domain, fwspec->ids[i]);
+}
+
 static int ipmmu_deassign_device(struct domain *d, struct device *dev)
 {
     struct ipmmu_vmsa_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -1309,6 +1312,7 @@ static int ipmmu_reassign_device(struct domain *s, struct domain *t,
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int ipmmu_dt_xlate(struct device *dev,
                           const struct dt_phandle_args *spec)
@@ -1487,7 +1491,9 @@ static const struct iommu_ops ipmmu_iommu_ops =
     .teardown        = ipmmu_iommu_domain_teardown,
     .iotlb_flush     = ipmmu_iotlb_flush,
     .assign_device   = ipmmu_assign_device,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .reassign_device = ipmmu_reassign_device,
+#endif
     .map_page        = arm_iommu_map_page,
     .unmap_page      = arm_iommu_unmap_page,
     .dt_xlate        = ipmmu_dt_xlate,
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227db..22def57b03 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2759,6 +2759,7 @@ out:
 	return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
 {
 	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
@@ -2826,6 +2827,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 
 	return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int arm_smmu_iommu_xen_domain_init(struct domain *d)
 {
@@ -2862,7 +2864,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
 	.teardown		= arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		= arm_smmu_iotlb_flush,
 	.assign_device		= arm_smmu_assign_dev,
+#ifdef CONFIG_MGMT_HYPERCALLS
 	.reassign_device	= arm_smmu_reassign_dev,
+#endif
 	.map_page		= arm_iommu_map_page,
 	.unmap_page		= arm_iommu_unmap_page,
 	.dt_xlate		= arm_smmu_dt_xlate,
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 22d306d0cb..a75ec08633 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -894,8 +894,10 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 /* Forward declaration */
 static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
 			       struct device *dev, u32 flag);
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 				 struct device *dev);
+#endif
 
 /*
  * The driver which supports generic IOMMU DT bindings must have this
@@ -1699,21 +1701,6 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	return 0;
 }
 
-static void arm_smmu_domain_remove_master(
-				const struct arm_smmu_domain *smmu_domain,
-				struct arm_smmu_master_cfg *cfg)
-{
-	uint32_t i, idx;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
-	const struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
-
-	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
-		s2cr[idx] = s2cr_init_val;
-		arm_smmu_write_s2cr(smmu, idx);
-	}
-}
-
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
 	int ret;
@@ -1761,16 +1748,6 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	return arm_smmu_domain_add_master(smmu_domain, cfg);
 }
 
-static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
-{
-	struct arm_smmu_domain *smmu_domain = domain->priv;
-	struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
-
-	if (cfg)
-		arm_smmu_domain_remove_master(smmu_domain, cfg);
-
-}
-
 #if 0 /*
        * Xen: The page table is shared with the processor, therefore
        * helpers to implement separate is not necessary.
@@ -2849,6 +2826,31 @@ out:
 	return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
+static void arm_smmu_domain_remove_master(
+                                const struct arm_smmu_domain *smmu_domain,
+                                struct arm_smmu_master_cfg *cfg)
+{
+        uint32_t i, idx;
+        struct arm_smmu_device *smmu = smmu_domain->smmu;
+        struct arm_smmu_s2cr *s2cr = smmu->s2crs;
+        const struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
+
+        for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
+                s2cr[idx] = s2cr_init_val;
+                arm_smmu_write_s2cr(smmu, idx);
+        }
+}
+
+static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
+{
+        struct arm_smmu_domain *smmu_domain = domain->priv;
+        struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
+
+        if (cfg)
+                arm_smmu_domain_remove_master(smmu_domain, cfg);
+
+}
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 				 struct device *dev)
 {
@@ -2918,6 +2920,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 
 	return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int arm_smmu_iommu_domain_init(struct domain *d)
 {
@@ -2956,7 +2959,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .assign_device = arm_smmu_assign_dev,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .reassign_device = arm_smmu_reassign_dev,
+#endif
     .map_page = arm_iommu_map_page,
     .unmap_page = arm_iommu_unmap_page,
     .dt_xlate = arm_smmu_dt_xlate_generic,
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 015ffa15d4..72c38355eb 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -59,6 +59,14 @@ fail:
     return rc;
 }
 
+int iommu_dt_domain_init(struct domain *d)
+{
+    INIT_LIST_HEAD(&dom_iommu(d)->dt_devices);
+
+    return 0;
+}
+
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -101,14 +109,6 @@ static bool iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
     return assigned;
 }
 
-int iommu_dt_domain_init(struct domain *d)
-{
-    INIT_LIST_HEAD(&dom_iommu(d)->dt_devices);
-
-    return 0;
-}
-
-#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_release_dt_devices(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -212,51 +212,6 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
 }
 #endif /* CONFIG_HAS_PCI */
 
-int iommu_remove_dt_device(struct dt_device_node *np)
-{
-    const struct iommu_ops *ops = iommu_get_ops();
-    struct device *dev = dt_to_dev(np);
-    int rc;
-
-    ASSERT(rw_is_locked(&dt_host_lock));
-
-    if ( !iommu_enabled )
-        return 1;
-
-    if ( !ops )
-        return -EOPNOTSUPP;
-
-    spin_lock(&dtdevs_lock);
-
-    if ( iommu_dt_device_is_assigned_locked(np) )
-    {
-        rc = -EBUSY;
-        goto fail;
-    }
-
-    if ( !ops->remove_device )
-    {
-        rc = -EOPNOTSUPP;
-        goto fail;
-    }
-
-    /*
-     * De-register the device from the IOMMU driver.
-     * The driver is responsible for removing is_protected flag.
-     */
-    rc = ops->remove_device(0, dev);
-
-    if ( !rc )
-    {
-        ASSERT(!dt_device_is_protected(np));
-        iommu_fwspec_free(dev);
-    }
-
- fail:
-    spin_unlock(&dtdevs_lock);
-    return rc;
-}
-
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
@@ -320,6 +275,52 @@ int iommu_add_dt_device(struct dt_device_node *np)
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
+
+    ASSERT(rw_is_locked(&dt_host_lock));
+
+    if ( !iommu_enabled )
+        return 1;
+
+    if ( !ops )
+        return -EOPNOTSUPP;
+
+    spin_lock(&dtdevs_lock);
+
+    if ( iommu_dt_device_is_assigned_locked(np) )
+    {
+        rc = -EBUSY;
+        goto fail;
+    }
+
+    if ( !ops->remove_device )
+    {
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    /*
+     * De-register the device from the IOMMU driver.
+     * The driver is responsible for removing is_protected flag.
+     */
+    rc = ops->remove_device(0, dev);
+
+    if ( !rc )
+    {
+        ASSERT(!dt_device_is_protected(np));
+        iommu_fwspec_free(dev);
+    }
+
+ fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -431,3 +432,4 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 83972d36b7..fba0de9d4b 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -431,9 +431,8 @@ static XSM_INLINE int cf_check xsm_deassign_device(
 }
 
 #endif /* CONFIG_HAS_PCI */
-#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static XSM_INLINE int cf_check xsm_assign_dtdevice(
     XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
 {
@@ -448,7 +447,8 @@ static XSM_INLINE int cf_check xsm_deassign_dtdevice(
     return xsm_default_action(action, current->domain, d);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 static XSM_INLINE int cf_check xsm_resource_plug_core(XSM_DEFAULT_VOID)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index f2e92645ef..3bef1ec8ad 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -129,12 +129,12 @@ struct xsm_ops {
     int (*assign_device)(struct domain *d, uint32_t machine_bdf);
     int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
 #endif /* CONFIG_HAS_PCI */
-#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     int (*assign_dtdevice)(struct domain *d, const char *dtpath);
     int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
     int (*resource_plug_core)(void);
     int (*resource_unplug_core)(void);
@@ -545,9 +545,8 @@ static inline int xsm_deassign_device(
     return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
 #endif /* CONFIG_HAS_PCI */
-#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static inline int xsm_assign_dtdevice(
     xsm_default_t def, struct domain *d, const char *dtpath)
 {
@@ -560,7 +559,8 @@ static inline int xsm_deassign_dtdevice(
     return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 0026a0963b..f624e90992 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -86,12 +86,12 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .assign_device                 = xsm_assign_device,
     .deassign_device               = xsm_deassign_device,
 #endif /* CONFIG_HAS_PCI */
-#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     .assign_dtdevice               = xsm_assign_dtdevice,
     .deassign_dtdevice             = xsm_deassign_dtdevice,
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
     .resource_plug_core            = xsm_resource_plug_core,
     .resource_unplug_core          = xsm_resource_unplug_core,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 805a9a528e..4e67bc214a 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1461,9 +1461,8 @@ static int cf_check flask_deassign_device(
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE, NULL);
 }
 #endif /* CONFIG_HAS_PCI */
-#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static int flask_test_assign_dtdevice(const char *dtpath)
 {
     uint32_t rsid;
@@ -1524,7 +1523,8 @@ static int cf_check flask_deassign_dtdevice(
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE,
                                 NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 static int cf_check flask_platform_op(uint32_t op)
 {
@@ -1995,12 +1995,12 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .assign_device = flask_assign_device,
     .deassign_device = flask_deassign_device,
 #endif /* CONFIG_HAS_PCI */
-#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     .assign_dtdevice = flask_assign_dtdevice,
     .deassign_dtdevice = flask_deassign_dtdevice,
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
     .platform_op = flask_platform_op,
 #ifdef CONFIG_X86
-- 
2.34.1


