Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583D7BD28FE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142024.1476304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flg-0006pr-Uv; Mon, 13 Oct 2025 10:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142024.1476304; Mon, 13 Oct 2025 10:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flg-0006ax-Cv; Mon, 13 Oct 2025 10:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1142024;
 Mon, 13 Oct 2025 10:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcX-0004Rd-KB
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:37 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5a7a543-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:35 +0200 (CEST)
Received: from MN2PR13CA0016.namprd13.prod.outlook.com (2603:10b6:208:160::29)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:31 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:160:cafe::b0) by MN2PR13CA0016.outlook.office365.com
 (2603:10b6:208:160::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 10:17:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:31 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:27 -0700
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
X-Inumbo-ID: d5a7a543-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhCvGs5BrQTDL1Oefu6HET20WKJfb41JtMxaM0LQ4a11T1WTff5tGEYMPVj1M/cHMohLdlZvay5JVgSz6TKgCub+Ne/EWw/3GQiCc5Bjqa62bRD+UASM40VPvspRTZoOGBIReye8MeThpAKRM2zS+5KooVwn+AiIUwNMBDcW8raKD/LIE3Mzzsae+FGEg0YYpyUSzn3rTVGAWP3gLNi+C1mDsMKtdILwN+yTO+dFEv8fBGOV51g6Xda3nLn8xLpLGmcECTHqy6XBxz0Q1YkNtRFUWL5UZbQ3eH0b0N73w8gYnWSs6O0yCKKs01t86/RGLh3+/HhLTJeJwSoUarE9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFRNb3guwLb3dfTeVzp7r1RPYeQgPGGR5Qg6o7MJBAs=;
 b=NAtySeX8nDRlqVocRsM7OuFJmLJQTOUiJx+siyoi0BkS0100QvG6lhjBYNNzPWn+ZNUHC9Ypfrk3z72NLfIkw1YzpMS5+I5VhQfi/Sn6wTqWtjVNe6h1vCfC80jJ5IlqXMncoYipIFMEBacF6hiK/GMbz4Hytj9Nh+QNJcveucE6FK9NFdYXCJxP1dgp1bM15AiUgXrkJ+Mw1vANDMiZyVy3ZHmiSWTXviQII8k+u1X139llpeOSNWj2+ykZcLZ/kDFCb75oG6IYWmoq1wyU5KKogJKwxxX2PdP3nng8e5mZlTbLm94ulUmqNb7JFp0KOJzAuhSehx4LhEVyXHhVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFRNb3guwLb3dfTeVzp7r1RPYeQgPGGR5Qg6o7MJBAs=;
 b=CY6AaXqIh1Lt67LpqAz/MvRB6iz1iyhSVmrl/Deqy5yH63psgeejyLtS9q1NzQrtr59oysxCPB9BG8cNKWH11xK8oW4QxIss+ZxpI2nlFP7prWV93W+92JxoSUIS3veBz658GotVenJyHWiVTUOkkaHyturpy/zVOZS4Dgf64TY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 22/28] xen/domctl: wrap iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:34 +0800
Message-ID: <20251013101540.3502842-23-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|DS0PR12MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b16ba5-70c8-4fd1-cd6d-08de0a41b851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xR4kgoh2yIgndoMEbeBRmuRHmTCjTdVuj2sLDTYNX0hHYHxutyZdDxyagvuA?=
 =?us-ascii?Q?iKrTmqcY3hB/UY0kelxdGVs41dzCadqQuVcSNLpcFEnRCMX9kCDmXGDE6Ood?=
 =?us-ascii?Q?lMXiMQCbH3prEQfGAYcWEKTW7gV8HnEHqSe8a9b87imt8wlWdCRMG5LUUErb?=
 =?us-ascii?Q?gWVbAV5eSO6mB5J9X5eQEpU3nvbP9B6rLGDFlWuNl7KsjpOL8cSPOn3i5x/I?=
 =?us-ascii?Q?QawasQPp+T4sOqlwN3K1ZMPKVssXKA7nThG9GpDgBU7Z9ovRfLl8PjFirvg5?=
 =?us-ascii?Q?FKUFXX5HCgqQFqCiNHnlzdqf+iaoTigFX7DKlDv30Utm508yD/cpQkXw/jw3?=
 =?us-ascii?Q?SLBmYnQ2SAWgxamXMhP6/2HcU/lldTpD8p6WVl0iYbSxEYTiOP4ZewLmtE8+?=
 =?us-ascii?Q?jmcr/v31wcjXl3IA4tiIUcyCzpJ/7hVT4ADQVHk3kRkJqmx/8eYSLS7mMSHi?=
 =?us-ascii?Q?INwrIN4ugusF0vj0DyZiD6+Rq3M28LA2wIS0fAdOX+OpQ136d7wK6LHketMR?=
 =?us-ascii?Q?wbZnfMiFcy/Rg2kfLIoBbcXQnt2Q76pGM8SWAxEub4/5XdshmFC7li72UsDl?=
 =?us-ascii?Q?YCxknfXLyeIl6ZdxhTkcgQrlDsLF8w6NEvzA9SxwG5MD9YAKFS8dP8G8UUw0?=
 =?us-ascii?Q?0n3lzyHodSpy+Ji+rWd4J6n/olrNR7l4Oh6Cu8WnYEhygU+MfpBbAgmbplzc?=
 =?us-ascii?Q?1akaimz8p+pmw3rdJZ9iz6SgIm0wsX5t338DkxsFRb3dVeenLyr0yN4SCQi+?=
 =?us-ascii?Q?ufBrxEeI3yDscQrsnQGl68+/tMQuaR7zpqVov8rDgyddOFHy0R2yVUnVvfyC?=
 =?us-ascii?Q?ceLG88PuVLL+ucxca/9i0ENfgUX/8dzO6QluBzrv+WtUjPrL8oe2gRJhqd2w?=
 =?us-ascii?Q?bJ95Gf9DO6o3hzxAs7JHDNXrvfzHbaSxGFqBSLYOmybCWouaxjvnH5m5AUeG?=
 =?us-ascii?Q?6eNuKh4wrSRolEQBvvhYq7+N5ZGJKqdNPhYGfpI4Wg53lW8xgJoOz8DyEKuf?=
 =?us-ascii?Q?3tHJXbkHQhSn/Jm6UmAIOo1iBicGnPc3suSIp4z4f5pugLVi2ssQ+vPp4EGo?=
 =?us-ascii?Q?/GyyBc0mAaSWEmkuY3wb6Xptc5k9jzXLrSrXw4Q3Oh9SeQ7hrjhQh0sQItij?=
 =?us-ascii?Q?B2AQ1byLy636NzglaQow/5DzCiseHSbkX/1ByVvp3QYzv2mMQpQPu7qy6xrV?=
 =?us-ascii?Q?FzM+dODYZBnF5PW5iXnMPlFqwfsnghbYmDJO5kpvGCKENw/OlEtaAsEbr7s1?=
 =?us-ascii?Q?fH0L+XsZ32ynSwHiWSEl24w4EXyxZj2ptpBKCP27MTOliC5kxInRG0ul+aVa?=
 =?us-ascii?Q?LJT9IAV/5gCgxsysBXSQawte1owQwXkjPskDwxLiakyZx9jJoR3Sx33JRz1v?=
 =?us-ascii?Q?Jw6N6K2mLdjXp7+6qYkgAoriZTIy6iKcuC+AOVPlpmpHu6Ju6XLXiDUHsZpZ?=
 =?us-ascii?Q?t4GasDKDlkpQt56UKRt8zKivNiKDz42lSKTHTyeTuD7xIzQ4wWZeT6vli24t?=
 =?us-ascii?Q?oIC84XBwOBGQeRAl/4P+9eC5ehognlmAZ0T6yi97nyrxPn+ZbV0a6j0rtP33?=
 =?us-ascii?Q?Qa+QUQS10s5udUQcnk8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:31.4277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b16ba5-70c8-4fd1-cd6d-08de0a41b851
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607

Function iommu_do_domctl() is the main entry for all iommu-related domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
Tracking its calling chain, the following functions shall all be wrapped
with CONFIG_MGMT_HYPERCALLS:
- iommu_do_pci_domctl
  - iommu_get_device_group
    - amd_iommu_group_id/intel_iommu_group_id
  - device_assigned
  - assign_device
    - intel_iommu_assign_device/amd_iommu_assign_device
  - deassign_device
    - reassign_device_ownership/reassign_device
- make PCI_PASSTHROUGH depend on MGMT_HYPERCALLS
- iommu_do_dt_domctl
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
- xsm_get_device_group
- xsm_assign_device
- xsm_deassign_device
- xsm_assign_dtdevice
- xsm_deassign_dtdevice
Otherwise all the functions will become unreachable when MGMT_HYPERCALLS=n,
and hence violating Misra rule 2.1

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_assign_device{test_assign_device,deassign_device,
 get_device_group}-case transiently
---
v2 -> v3:
- make PCI_PASSTHROUGH(, then HAS_VPCI_GUEST_SUPPORT) depend on MGMT_HYPERCALLS
- add wrapping for iommu_remove_dt_device/iommu_dt_device_is_assigned_locked/
arm_smmu_detach_dev/arm_smmu_domain_remove_master
- fold commit
"xen/xsm: wrap xsm-iommu-related functions with CONFIG_MGMT_HYPERCALLS" in
- fix overly long #ifdef
- add missing wrapping in xsm/dummy.h
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping of
XEN_DOMCTL_assign_device{test_assign_device,deassign_device,get_device_group}-case
---
 xen/arch/arm/Kconfig                        |  2 +-
 xen/common/device-tree/device-tree.c        |  2 ++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  8 ++++++++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c    |  8 ++++++++
 xen/drivers/passthrough/arm/smmu-v3.c       |  4 ++++
 xen/drivers/passthrough/arm/smmu.c          | 10 ++++++++++
 xen/drivers/passthrough/device_tree.c       |  6 ++++++
 xen/drivers/passthrough/iommu.c             |  2 ++
 xen/drivers/passthrough/pci.c               |  6 +++++-
 xen/drivers/passthrough/vtd/iommu.c         |  6 ++++++
 xen/include/xsm/dummy.h                     | 12 ++++++------
 xen/include/xsm/xsm.h                       | 21 ++++++++++++---------
 xen/xsm/dummy.c                             | 10 ++++++----
 xen/xsm/flask/hooks.c                       | 20 ++++++++++++--------
 14 files changed, 88 insertions(+), 29 deletions(-)

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
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3a14770855..5786bf0c59 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -461,6 +461,7 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
         spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check reassign_device(
     struct domain *source, struct domain *target, u8 devfn,
     struct pci_dev *pdev)
@@ -550,6 +551,7 @@ static int cf_check amd_iommu_assign_device(
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check amd_iommu_clear_root_pgtable(struct domain *d)
 {
@@ -698,12 +700,14 @@ static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
     unsigned int bdf = PCI_BDF(bus, devfn);
 
     return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) : bdf;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #include <asm/io_apic.h>
 
@@ -772,14 +776,18 @@ static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .quarantine_init = amd_iommu_quarantine_init,
     .add_device = amd_iommu_add_device,
     .remove_device = amd_iommu_remove_device,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .assign_device  = amd_iommu_assign_device,
+#endif
     .teardown = amd_iommu_domain_destroy,
     .clear_root_pgtable = amd_iommu_clear_root_pgtable,
     .map_page = amd_iommu_map_page,
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .reassign_device = reassign_device,
     .get_device_group_id = amd_iommu_group_id,
+#endif
     .enable_x2apic = iov_enable_xt,
     .update_ire_from_apic = amd_iommu_ioapic_update_ire,
     .update_ire_from_msi = amd_iommu_msi_msg_update_ire,
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index ea9fa9ddf3..023febc424 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -739,6 +739,7 @@ static int ipmmu_attach_device(struct ipmmu_vmsa_domain *domain,
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static void ipmmu_detach_device(struct ipmmu_vmsa_domain *domain,
                                 struct device *dev)
 {
@@ -748,6 +749,7 @@ static void ipmmu_detach_device(struct ipmmu_vmsa_domain *domain,
     for ( i = 0; i < fwspec->num_ids; ++i )
         ipmmu_utlb_disable(domain, fwspec->ids[i]);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int ipmmu_init_platform_device(struct device *dev,
                                       const struct dt_phandle_args *args)
@@ -1138,7 +1140,9 @@ static void ipmmu_free_root_domain(struct ipmmu_vmsa_domain *domain)
     xfree(domain);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int ipmmu_deassign_device(struct domain *d, struct device *dev);
+#endif
 
 static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *dev,
                                uint32_t flag)
@@ -1254,6 +1258,7 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int ipmmu_deassign_device(struct domain *d, struct device *dev)
 {
     struct ipmmu_vmsa_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -1309,6 +1314,7 @@ static int ipmmu_reassign_device(struct domain *s, struct domain *t,
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int ipmmu_dt_xlate(struct device *dev,
                           const struct dt_phandle_args *spec)
@@ -1487,7 +1493,9 @@ static const struct iommu_ops ipmmu_iommu_ops =
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
index 22d306d0cb..51c1bf4f08 100644
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
@@ -1699,6 +1701,7 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static void arm_smmu_domain_remove_master(
 				const struct arm_smmu_domain *smmu_domain,
 				struct arm_smmu_master_cfg *cfg)
@@ -1713,6 +1716,7 @@ static void arm_smmu_domain_remove_master(
 		arm_smmu_write_s2cr(smmu, idx);
 	}
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
@@ -1761,6 +1765,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	return arm_smmu_domain_add_master(smmu_domain, cfg);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
 	struct arm_smmu_domain *smmu_domain = domain->priv;
@@ -1770,6 +1775,7 @@ static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 		arm_smmu_domain_remove_master(smmu_domain, cfg);
 
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #if 0 /*
        * Xen: The page table is shared with the processor, therefore
@@ -2849,6 +2855,7 @@ out:
 	return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 				 struct device *dev)
 {
@@ -2918,6 +2925,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 
 	return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int arm_smmu_iommu_domain_init(struct domain *d)
 {
@@ -2956,7 +2964,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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
index 015ffa15d4..09ac740fb2 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -59,6 +59,7 @@ fail:
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -100,6 +101,7 @@ static bool iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 
     return assigned;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int iommu_dt_domain_init(struct domain *d)
 {
@@ -212,6 +214,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
 }
 #endif /* CONFIG_HAS_PCI */
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
@@ -256,6 +259,7 @@ int iommu_remove_dt_device(struct dt_device_node *np)
     spin_unlock(&dtdevs_lock);
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int iommu_add_dt_device(struct dt_device_node *np)
 {
@@ -320,6 +324,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -431,3 +436,4 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c9425d6971..8812e38174 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -625,6 +625,7 @@ void iommu_resume(void)
         iommu_vcall(iommu_get_ops(), resume);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -645,6 +646,7 @@ int iommu_do_domctl(
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void iommu_crash_shutdown(void)
 {
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index cd855108c2..aa07a7e748 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -877,6 +877,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
@@ -945,7 +946,6 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     return ret;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -1483,6 +1483,7 @@ static int iommu_remove_device(struct pci_dev *pdev)
     return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int device_assigned(u16 seg, u8 bus, u8 devfn)
 {
     struct pci_dev *pdev;
@@ -1646,6 +1647,7 @@ static int iommu_get_device_group(
 
     return i;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
 {
@@ -1671,6 +1673,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
     pcidevs_unlock();
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_do_pci_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -1804,6 +1807,7 @@ int iommu_do_pci_domctl(
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 struct segment_iter {
     int (*handler)(struct pci_dev *pdev, void *arg);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index b4105163cc..8913dd4d5f 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2731,6 +2731,7 @@ static int __init cf_check vtd_setup(void)
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check reassign_device_ownership(
     struct domain *source,
     struct domain *target,
@@ -2926,6 +2927,7 @@ static int cf_check intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 
     return PCI_BDF(bus, devfn);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int __must_check cf_check vtd_suspend(void)
 {
@@ -3234,14 +3236,18 @@ static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .add_device = intel_iommu_add_device,
     .enable_device = intel_iommu_enable_device,
     .remove_device = intel_iommu_remove_device,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .assign_device  = intel_iommu_assign_device,
+#endif
     .teardown = iommu_domain_teardown,
     .clear_root_pgtable = iommu_clear_root_pgtable,
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .reassign_device = reassign_device_ownership,
     .get_device_group_id = intel_iommu_group_id,
+#endif
     .enable_x2apic = intel_iommu_enable_eim,
     .disable_x2apic = intel_iommu_disable_eim,
     .update_ire_from_apic = io_apic_write_remap_rte,
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index a598d74f1f..f53492bedc 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -407,7 +407,8 @@ static XSM_INLINE int cf_check xsm_get_vnumainfo(
     return xsm_default_action(action, current->domain, d);
 }
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
+#ifdef CONFIG_HAS_PCI
 static XSM_INLINE int cf_check xsm_get_device_group(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
@@ -428,10 +429,9 @@ static XSM_INLINE int cf_check xsm_deassign_device(
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
+#endif /* CONFIG_HAS_PCI */
 
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static XSM_INLINE int cf_check xsm_assign_dtdevice(
     XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
 {
@@ -445,8 +445,8 @@ static XSM_INLINE int cf_check xsm_deassign_dtdevice(
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
-
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_MGMT_HYPERCALLS */
 
 static XSM_INLINE int cf_check xsm_resource_plug_core(XSM_DEFAULT_VOID)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 154a4b8a92..c9a2b895b1 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -123,16 +123,18 @@ struct xsm_ops {
     int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
                                  uint16_t start, uint16_t end, uint8_t access);
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
+#ifdef CONFIG_HAS_PCI
     int (*get_device_group)(uint32_t machine_bdf);
     int (*assign_device)(struct domain *d, uint32_t machine_bdf);
     int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
-#endif
+#endif /* CONFIG_HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     int (*assign_dtdevice)(struct domain *d, const char *dtpath);
     int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_MGMT_HYPERCALLS */
 
     int (*resource_plug_core)(void);
     int (*resource_unplug_core)(void);
@@ -524,7 +526,8 @@ static inline int xsm_pci_config_permission(
     return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
 }
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
+#ifdef CONFIG_HAS_PCI
 static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.get_device_group, machine_bdf);
@@ -541,9 +544,9 @@ static inline int xsm_deassign_device(
 {
     return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI) */
+#endif /* CONFIG_HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static inline int xsm_assign_dtdevice(
     xsm_default_t def, struct domain *d, const char *dtpath)
 {
@@ -555,8 +558,8 @@ static inline int xsm_deassign_dtdevice(
 {
     return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
-
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 9774bb3bdb..f2a22fed92 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -80,16 +80,18 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .pci_config_permission         = xsm_pci_config_permission,
     .get_vnumainfo                 = xsm_get_vnumainfo,
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
+#ifdef CONFIG_HAS_PCI
     .get_device_group              = xsm_get_device_group,
     .assign_device                 = xsm_assign_device,
     .deassign_device               = xsm_deassign_device,
-#endif
+#endif /* CONFIG_HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     .assign_dtdevice               = xsm_assign_dtdevice,
     .deassign_dtdevice             = xsm_deassign_dtdevice,
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_MGMT_HYPERCALLS */
 
     .resource_plug_core            = xsm_resource_plug_core,
     .resource_unplug_core          = xsm_resource_unplug_core,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 9b63c516e6..f761f8b384 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1388,7 +1388,8 @@ static int cf_check flask_mem_sharing(struct domain *d)
 }
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
+#ifdef CONFIG_HAS_PCI
 static int cf_check flask_get_device_group(uint32_t machine_bdf)
 {
     uint32_t rsid;
@@ -1459,9 +1460,9 @@ static int cf_check flask_deassign_device(
 
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE, NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
+#endif /* CONFIG_HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static int flask_test_assign_dtdevice(const char *dtpath)
 {
     uint32_t rsid;
@@ -1522,7 +1523,8 @@ static int cf_check flask_deassign_dtdevice(
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE,
                                 NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_PASSTHROUGH  && CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_platform_op(uint32_t op)
 {
@@ -1987,16 +1989,18 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .remove_from_physmap = flask_remove_from_physmap,
     .map_gmfn_foreign = flask_map_gmfn_foreign,
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
+#ifdef CONFIG_HAS_PCI
     .get_device_group = flask_get_device_group,
     .assign_device = flask_assign_device,
     .deassign_device = flask_deassign_device,
-#endif
+#endif /* CONFIG_HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     .assign_dtdevice = flask_assign_dtdevice,
     .deassign_dtdevice = flask_deassign_dtdevice,
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
+#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_MGMT_HYPERCALLS */
 
     .platform_op = flask_platform_op,
 #ifdef CONFIG_X86
-- 
2.34.1


