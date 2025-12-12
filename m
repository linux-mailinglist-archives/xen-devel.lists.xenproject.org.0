Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2136ECB7D52
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184936.1507303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuR7-00049p-Ka; Fri, 12 Dec 2025 04:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184936.1507303; Fri, 12 Dec 2025 04:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuR7-00040M-7m; Fri, 12 Dec 2025 04:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1184936;
 Fri, 12 Dec 2025 04:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuR3-0007Dl-Hn
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:17 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a16e5a8-d710-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:07:15 +0100 (CET)
Received: from MN2PR18CA0028.namprd18.prod.outlook.com (2603:10b6:208:23c::33)
 by LV2PR12MB5967.namprd12.prod.outlook.com (2603:10b6:408:170::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:07:08 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::cd) by MN2PR18CA0028.outlook.office365.com
 (2603:10b6:208:23c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Fri,
 12 Dec 2025 04:06:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:08 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:04 -0600
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
X-Inumbo-ID: 0a16e5a8-d710-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsNyCEzohz8CMJNuL4TOZkuIiofjscEIcwtI5iziUnUXi8D4x95qvGyd5M8J3VMoBiQXmia/cQ4S4MeRD7r8HluNQ5opTUgX1LK3jB9xvfIICBcHAljLefZp2j5gEKHxBhgkJ/u55Gs+fRM6YYh13LTsGE4XvuzL2UL183c8/ec4MMzafJcaZV0YgBqxrlGvg1pZkcbsBahlS5Xk1eir2LCNDrOeabkLjrE2uetiC1H35/qkX+j65kXn1TnFPDOoaU3e6P8M715+4w1TgFRS3dzELWSk+4q3XjByWNp0bfnytmqPVZ2cdT7SrK8Qri/HwpAFA4heqqaXLC8RztakYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNBo7HSAOiqoWr9Mm1NZh1/tC7tfzjVGKDQZ3VmVKG8=;
 b=bMrTH1W+vNCL0oR3vOw7g0f80gqUhDIE0KS7oGzOOnbSrLDjrr6IV6jxro8GmepPID3+1ByHaWpLOT3FKQDV2sy08vRYe7VVQf0MBrxfrrhiqh3N0PS+hToa2pPhbMqhX4ASxDXvD1+o/ErgXyR0dhuGTdyyh0yP21Z3dGHtkTxnnkTQgUiwvMxIHy+tItLK59nhm2lnPdBJtHIYOJ/0MkesBfkq3O66/0JOPqrHfEeR2sJVafc7NeUXNj0c8MkNrQqHLFYRjODNJN22hGMPz5StKcoc8p+/s6/OPrPt9VYA32C/x7Z6AYqU/Y/6wbYU9Feu69gswe3L7SRj6VLrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNBo7HSAOiqoWr9Mm1NZh1/tC7tfzjVGKDQZ3VmVKG8=;
 b=aARwx1DW+p38jQJvCTMnMb+TKB6+7okiUek6yMJFp1TqQs6GJ7rdCXl3sbObPS8Rsph/ufMQDf5l8L2JYZ4FKdoR3hixliBAVkDz5lqA4CHVMURhH0XS4wu+zyQZIfLJFviRM7EEDQ24VBW+1JGxxqnSnLpnF1uX5UyPP4nmFZQ=
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
	<Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 16/24] xen/domctl: wrap device-tree-subset iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:01 +0800
Message-ID: <20251212040209.1970553-17-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|LV2PR12MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1d4b4d-448c-459b-8195-08de3933eaf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5lGE+8orBaQ8sgNMHsWNFAbX0o0vp8qN6cWsynigwHhj9v7oAvw90N4sC51C?=
 =?us-ascii?Q?f6Yh/MOHkZmCCuppwAyciunQa+AU2ui5BoU8zqYhLsbAhrRFjLdW7JWt04yA?=
 =?us-ascii?Q?YnDf6L+ULYde3kJR8aM5FXhGyei3xFr8fbqaC7zIRa3BAu0Ts3BvYCNg8XSy?=
 =?us-ascii?Q?XoqSKBnwZ9Y/rH9k+1yWpmo15+JFicxrOsa7ll0J5zVRxb/otNwV3WIgptQr?=
 =?us-ascii?Q?lgMWdc15APjre0KLmY7kJchLwwBkwln/UQ5Wn1Czk7PsHe6DHiWQP+oPDaYv?=
 =?us-ascii?Q?PC108mVHWSo6tJFjCnLkpxdOXmz64Wt04VKt3rBJQ+636nZYZKb4w+q9y6bH?=
 =?us-ascii?Q?h3lRwrMTQD3KSDiuGFGKhOJuUZHzxYo8S93nzsqc09W/wyi2Mz151AcR3zeK?=
 =?us-ascii?Q?mIy7Aar7cmkBbwvyQsPnvX/UNrvB08rrFdFGVdb5RTZWl4rKIo0z+CiLeG8E?=
 =?us-ascii?Q?gq2jEfdAXcqP4HO1/ajIH2T5tzDeaZpd5l0kPD+wdgl8ZKm8wY2PikY+czfT?=
 =?us-ascii?Q?7NLY/lh4sRFDUMIyE8+/H0axdEGBTh+4YE5aXtgxrspTd2pHhRjMqoKxPQuf?=
 =?us-ascii?Q?Y2O2XGkRqdvsXfEqoyMGkWgjSSkOaFNL8dQlVCKX+mlzU16h8GYl2V4GurEf?=
 =?us-ascii?Q?3CcXfKGIGbkcPzl46p5vyyDBKt1MGlcZ8hoHZyv/66JZtosYBcFyosjATRlm?=
 =?us-ascii?Q?dHbuqWJNZQHtqxAfPOcXN3c63XmU67erZtVf3PURn+DpyTLakiTn0V7uI92x?=
 =?us-ascii?Q?jbNpGs6Pa3Ath8Km7qDV9UWQ9DiPcp1U5VLFHiUk/Ms/YRXu5DEMBG0Vrs09?=
 =?us-ascii?Q?0pS8ueLY7P6AaWrAjIn2JjMvx76Lpcl4k3ZPdP3Q52wKVfclnsM9ZSMFjNJw?=
 =?us-ascii?Q?07z7FDJdW/0m+SrQMEklrciXyiujIPuBWMI3138Uf7cZ9yqb2uGe2keHo/JH?=
 =?us-ascii?Q?oj8J2CpvUMiT76DB65DU+thDqGefBHjGmioFBxMymnoeJbAZtVrkyVJmtoNb?=
 =?us-ascii?Q?G5y7wmOs3DvIvbOrNiLGFjBq7G13k0kl3G8TZ6FuXAsVbjtS3ZolKzMN6h39?=
 =?us-ascii?Q?MjF5jwG0QDbErKywc3WDx/f0nPPSXndWhRx5DJCOaVrph9hsM138YINjdzlL?=
 =?us-ascii?Q?pEd1m0hj1fvktZq4UwoMW0kUYC4RyYkEMcQSLkFkb9DLnXYRRCxWmiUrUNV5?=
 =?us-ascii?Q?n+ueCM8AbRklt0+0mWVxmutcM0LX/VWhEgjwE90NuqLbOTf03L5W5E6vxLo9?=
 =?us-ascii?Q?hTZqAjAfHFl7CrE+iQhg/0ZccDynduPsam1NsVyTHyVK16KdYhek0xUb/WwA?=
 =?us-ascii?Q?2o9PUxU7wDIm4Imjzwk9LJXU/UAAN3mmPE5ptsdc/Ox+YgJDnfmADGBJdUe+?=
 =?us-ascii?Q?RNn0X6KSqGRCd06OJoEPdYpAHsja2OiulBykR8sPRyL70RrsjOlDBGewQSvZ?=
 =?us-ascii?Q?nbMN3xMijA7tMLOxxEZxRIB7iyjMrYL5fiT39uTkRIKlnQYwa1rK590CuXaa?=
 =?us-ascii?Q?yOWCN0+S7MxYtqAAGIk+Awio79HhRjEQWGxuxOZjn0M0c+tbML86b9VWGG08?=
 =?us-ascii?Q?FR6fk6glZNC228aMzGs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:08.0565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1d4b4d-448c-459b-8195-08de3933eaf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5967

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
v4 -> v5:
- wrap arm_smmu_deassign_dev() declaration with MGMT_HYPERCALLS
- zap the hooks in xen/iommu.h right away
---
 xen/arch/arm/Kconfig                     |   2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  26 +++---
 xen/drivers/passthrough/arm/smmu-v3.c    |   6 ++
 xen/drivers/passthrough/arm/smmu.c       |  55 ++++++------
 xen/drivers/passthrough/device_tree.c    | 108 ++++++++++++-----------
 xen/include/xen/iommu.h                  |   2 +-
 xen/include/xsm/dummy.h                  |   6 +-
 xen/include/xsm/xsm.h                    |  12 +--
 xen/xsm/dummy.c                          |   6 +-
 xen/xsm/flask/hooks.c                    |  12 +--
 10 files changed, 127 insertions(+), 108 deletions(-)

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
index bf153227db..1d85341e72 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1490,8 +1490,10 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev);
 static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *dev,
 			       u32 flag);
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 				 struct device *dev);
+#endif
 
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
@@ -2759,6 +2761,7 @@ out:
 	return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
 {
 	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
@@ -2826,6 +2829,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 
 	return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int arm_smmu_iommu_xen_domain_init(struct domain *d)
 {
@@ -2862,7 +2866,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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
index bdbae0f8bf..bcc4f44a71 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -60,6 +60,14 @@ fail:
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
@@ -102,14 +110,6 @@ static bool iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
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
@@ -213,51 +213,6 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
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
@@ -321,6 +276,52 @@ int iommu_add_dt_device(struct dt_device_node *np)
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
 /*
  * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
  * path from the guest
@@ -459,3 +460,4 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 6ca4190eb9..e5e9f98201 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -331,9 +331,9 @@ struct iommu_ops {
     int (*remove_device)(uint8_t devfn, device_t *dev);
     int (*assign_device)(struct domain *d, uint8_t devfn, device_t *dev,
                          uint32_t flag);
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*reassign_device)(struct domain *s, struct domain *t,
                            uint8_t devfn, device_t *dev);
-#ifdef CONFIG_MGMT_HYPERCALLS
 #ifdef CONFIG_HAS_PCI
     int (*get_device_group_id)(uint16_t seg, uint8_t bus, uint8_t devfn);
 #endif /* HAS_PCI */
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 07d69e3725..90fe741fb4 100644
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
index b331e81f9d..90349d02c2 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -131,12 +131,12 @@ struct xsm_ops {
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
@@ -553,9 +553,8 @@ static inline int xsm_deassign_device(
     return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
 #endif /* CONFIG_HAS_PCI */
-#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static inline int xsm_assign_dtdevice(
     xsm_default_t def, struct domain *d, const char *dtpath)
 {
@@ -568,7 +567,8 @@ static inline int xsm_deassign_dtdevice(
     return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index c693e77a7d..1ac4f719ad 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -87,12 +87,12 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
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
index c772f79e16..9c800b574e 100644
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
@@ -1996,12 +1996,12 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
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


