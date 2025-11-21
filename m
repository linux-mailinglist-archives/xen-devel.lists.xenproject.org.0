Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8D8C789EC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168745.1494798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtm-0002eD-ML; Fri, 21 Nov 2025 11:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168745.1494798; Fri, 21 Nov 2025 11:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtm-0002Xs-Dm; Fri, 21 Nov 2025 11:01:54 +0000
Received: by outflank-mailman (input) for mailman id 1168745;
 Fri, 21 Nov 2025 11:01:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrG-0008Dv-NV
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:18 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e989f91-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:59:16 +0100 (CET)
Received: from CH2PR05CA0064.namprd05.prod.outlook.com (2603:10b6:610:38::41)
 by IA1PR12MB7733.namprd12.prod.outlook.com (2603:10b6:208:423::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:59:08 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:38:cafe::a6) by CH2PR05CA0064.outlook.office365.com
 (2603:10b6:610:38::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.5 via Frontend Transport; Fri,
 21 Nov 2025 10:59:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:08 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:04 -0800
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
X-Inumbo-ID: 1e989f91-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3WhPly/4tgtOFxUGktLr4fUWRYTCk/Zrwii70ataigmmnmqIpqehT8infA+kUPFWahtJ2hn70lQo8aUAuvLyamjTS0yfLk/e2pDnFCb2PXmpjvClX7rooO3fJsO+q4d2tW4vC7XQyLQpAK7aQ7XxlV2DVTkR46a7QBJ4nd+bI56blWsBQdBqwtB2WP+TkiHorKo3ImElw67wbPOm+xHOZo7TYBkuXwm4S6B7nNWcZ6b7EW+fZSRRobOvmRQQIMlPW3fkD53vHLHzao2GW8E6D72JoctSnXma36doBsDUhIljMQevKljLIzr977J0TKniaa9liI8BFG0n9zG36En4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAc5h4CIkrhPqQT7QktYcMBymNFGJFkm0bXneImigWw=;
 b=iT/cNiDuFJ1ZmwR3x+XAm6OJOAzZBm6u7A17c0O4sYPyPC1jacLRmXvRL7XdMusDvjo6dYJEgPVNThHu09tsoIob8+tzsu9WgHglv+sF1jinpvai+5u+gGcZvDNAKL2ZuUq0u+c90J6tgktVLof5vWCG/Xv+FmWzV4ayS6nBUHk76e/8Ulrxb/rF5pxh65emOk7E0EjXnuTtkpyF0+V6V0oaOVGxP3jvmFsWZYUy7yY1lVt+9d6PFhnFYGrW0IwEaJBDmBAUx/OCLrV6Ay3UOlpJDkkMymNCa/3589bLFHw8D+uwZXQYCiAWxyNWjMSfuH4N20KjL9wA/xEehDiKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAc5h4CIkrhPqQT7QktYcMBymNFGJFkm0bXneImigWw=;
 b=OO6js5ezkLRT/5WLUScSG6HUf/vdpfZCOwlCxFjQxjsEXNCKnHOI8/C2Ej5mOQ5fj2SB2spIJU3dBHFmu/e1HruZNN89FzA4SMonqAWpO5TQ21d0ZFTbeLvibB8Wrsm/YKDeYX8O0tSsqxKAwXerG2vfospVDBa1WXxLsM/z+zM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:51 +0800
Message-ID: <20251121105801.1251262-15-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|IA1PR12MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 243b221e-ea13-4f42-f8f2-08de28ecfecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?94gn5mwcD3ZwtHmccBqLdAvHsKoMA+JvXr4AqrZXx9+2EQCbiscpTw6L8jeU?=
 =?us-ascii?Q?bC+FEXTNFLxbCPnniYFQRTu3FENu9jNIAlqVjjRiQ3r8fcNR2tVoXWo9Il/I?=
 =?us-ascii?Q?JgVxZvT7p9xqOtzEdZgpo5BGjEH3FQlVlsT/9PErriIm4p7VwUKlbazz1Otb?=
 =?us-ascii?Q?GoYm6AgRHxf8goSTkoODWqBg3yzOyH6ADVgiB8Qt0Y1IbH3rRHjrlaTycHk8?=
 =?us-ascii?Q?FHhZhkLjF2qmedyG8n+8ylRP9NTJZgL7RumNWrC6W1m5UsGRw3za3dYM4L4k?=
 =?us-ascii?Q?GA+vhgE8o8kn/MEr16lrPZSySlxZNTHhlX089PBdZmxUWK0KAOHkqEs/3l/l?=
 =?us-ascii?Q?bjSxfj0zFGzwz6Yy661nc1HMeQNkFERqVd3QxZsaK3sVcA3SyOIGjiWJlq6G?=
 =?us-ascii?Q?la2jhv6lZgoW0WMAjhMwucJuGYNsqWp+l2ZpZTu3dUw5d1vaCxuqcO617Lg0?=
 =?us-ascii?Q?koBwAoA6K1h/LyC2DpIVFxmj4nQGQctAeqpFInZ22kfC6vTybdROzOSIXqjY?=
 =?us-ascii?Q?P4B8h1hZt5ZbUB+yf0yniSiW+JZeuWGktAQ25YyX4y0sFpmahEFl18OxyyNI?=
 =?us-ascii?Q?g9E3JVCP8UsPkl9Ulq2pUHOEjckdYXfWwCMZcxi0RrdbkFm69qQIwAxB98wV?=
 =?us-ascii?Q?Xc4JO8FG4wi/n/LU4EQKG+1uQyKtd2U5yiWbbLIKoBXfTiZSDDxwXYXJFIu7?=
 =?us-ascii?Q?gtJJZJivvf/n5E197uRoEgq9tUcc5NE5cpimpVMc7pqKTCAklQbUUwEmAeMP?=
 =?us-ascii?Q?zJcOd3iCloWvm0U8PBITVOpLlG1qPM14WdL5NrbaFdWFofw7UJxQqE10kIMU?=
 =?us-ascii?Q?29C+nFyrv76LubDY0domcrEfHOdpIuSilcg4R2IdHoKaVCcPvea4uGzQNZ4y?=
 =?us-ascii?Q?Voje91wJ+FQ6TXPKUAWTSsF1UGFA5Gpu3WKKtyMypoa5wX23jSZ6IrNEliv+?=
 =?us-ascii?Q?GWy2ylHt1hyJ+2gxpOX5JbzX1KcsoPxsurWTlsv3J4yEJ8Icp/tPX16OQ5FI?=
 =?us-ascii?Q?mBbGerx8XDu+vb6rVE9IM6R/RpjJ3i64nmgmJM4vrGiS1zB0ihmNTuraYuan?=
 =?us-ascii?Q?W+5M4j0i4vWuss5p+BSDF/N9nVqqhUCKDNf85LzZKovzSyCiE8SrDovaAtdX?=
 =?us-ascii?Q?Crs8Nh+iIxbr3zz/pVK9BENixR/EFscCUqSxzNuDU5NQ/SWm0z9kJvVDtBha?=
 =?us-ascii?Q?KeYDSOX57n5zfVatXH9LUrZGHoq55VEL0yR0XuCdGshHHUigU8D1cELk08yq?=
 =?us-ascii?Q?7vPL5azLo8tQnmbTDCTmqiX4F7mx5d0ZZpzGK/f6wOd6lONPJjiEy88pUYCa?=
 =?us-ascii?Q?a4emY4yJHZNOn3IjrtBLMGHYk5eiYr1szvM36JhhNUqB7rsmZxDuhvkG0W3l?=
 =?us-ascii?Q?FPWWrqaIfDQp2Raty2QrZBkRPlv/mEk6mqFQRHKwtNvleLcCmXixcOjdGUaf?=
 =?us-ascii?Q?t9LdLee+uwzrvYDoO8ObWJqTlxW5IGbb4wWrIBiMRyHPLTGFr074C31BGZw6?=
 =?us-ascii?Q?SqCUyQ7f9EqTrjmP9hsroNClBGYjNBysTH2gDCs0XIMoJ9XxhjReBAW6Gben?=
 =?us-ascii?Q?4gB4MfR42xjtzOavpo8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:08.5076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 243b221e-ea13-4f42-f8f2-08de28ecfecf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733

Function iommu_do_pci_domctl() is the main entry for pci-subset
iommu-related domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
Tracking its calling chain, the following functions shall all be wrapped
with CONFIG_MGMT_HYPERCALLS:
- iommu_do_pci_domctl
  - iommu_get_device_group
    - xsm_get_device_group
    - iommu_ops.get_device_group_id
      - amd_iommu_group_id/intel_iommu_group_id
  - device_assigned
  - xsm_assign_device
  - assign_device
    - iommu_ops.assign_device
      - intel_iommu_assign_device/amd_iommu_assign_device
  - xsm_deassign_device
  - deassign_device
    - iommu_ops.reassign_device
      - reassign_device_ownership/reassign_device
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
v3 -> v4:
- move codes to wrap with a single #ifdef
- split into PCI related subset and DT subset
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++----
 xen/drivers/passthrough/pci.c               | 52 +++++++++++----------
 xen/drivers/passthrough/vtd/iommu.c         |  6 ++-
 xen/include/xsm/dummy.h                     |  6 ++-
 xen/include/xsm/xsm.h                       | 12 +++--
 xen/xsm/dummy.c                             |  6 ++-
 xen/xsm/flask/hooks.c                       | 12 +++--
 7 files changed, 68 insertions(+), 46 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3a14770855..576b36af92 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -461,6 +461,7 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
         spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check reassign_device(
     struct domain *source, struct domain *target, u8 devfn,
     struct pci_dev *pdev)
@@ -551,6 +552,14 @@ static int cf_check amd_iommu_assign_device(
     return rc;
 }
 
+static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
+{
+    unsigned int bdf = PCI_BDF(bus, devfn);
+
+    return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) : bdf;
+}
+#endif /* CONFIG_MGMT_HYPERCALLS */
+
 static void cf_check amd_iommu_clear_root_pgtable(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
@@ -698,13 +707,6 @@ static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
-{
-    unsigned int bdf = PCI_BDF(bus, devfn);
-
-    return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) : bdf;
-}
-
 #include <asm/io_apic.h>
 
 static void amd_dump_page_table_level(struct page_info *pg, int level,
@@ -772,14 +774,16 @@ static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .quarantine_init = amd_iommu_quarantine_init,
     .add_device = amd_iommu_add_device,
     .remove_device = amd_iommu_remove_device,
-    .assign_device  = amd_iommu_assign_device,
     .teardown = amd_iommu_domain_destroy,
     .clear_root_pgtable = amd_iommu_clear_root_pgtable,
     .map_page = amd_iommu_map_page,
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
+#ifdef CONFIG_MGMT_HYPERCALLS
+    .assign_device  = amd_iommu_assign_device,
     .reassign_device = reassign_device,
     .get_device_group_id = amd_iommu_group_id,
+#endif
     .enable_x2apic = iov_enable_xt,
     .update_ire_from_apic = amd_iommu_ioapic_update_ire,
     .update_ire_from_msi = amd_iommu_msi_msg_update_ire,
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 422e45f5a6..8ab229bfe7 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -878,6 +878,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
@@ -946,7 +947,6 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     return ret;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -1484,6 +1484,7 @@ static int iommu_remove_device(struct pci_dev *pdev)
     return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int device_assigned(u16 seg, u8 bus, u8 devfn)
 {
     struct pci_dev *pdev;
@@ -1648,30 +1649,6 @@ static int iommu_get_device_group(
     return i;
 }
 
-void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
-{
-    pcidevs_lock();
-
-    disable_ats_device(pdev);
-
-    ASSERT(pdev->domain);
-    if ( d != pdev->domain )
-    {
-        pcidevs_unlock();
-        return;
-    }
-
-    pdev->broken = true;
-
-    if ( !d->is_shutting_down && printk_ratelimit() )
-        printk(XENLOG_ERR "dom%d: ATS device %pp flush failed\n",
-               d->domain_id, &pdev->sbdf);
-    if ( !is_hardware_domain(d) )
-        domain_crash(d);
-
-    pcidevs_unlock();
-}
-
 int iommu_do_pci_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -1805,6 +1782,31 @@ int iommu_do_pci_domctl(
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
+
+void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
+{
+    pcidevs_lock();
+
+    disable_ats_device(pdev);
+
+    ASSERT(pdev->domain);
+    if ( d != pdev->domain )
+    {
+        pcidevs_unlock();
+        return;
+    }
+
+    pdev->broken = true;
+
+    if ( !d->is_shutting_down && printk_ratelimit() )
+        printk(XENLOG_ERR "dom%d: ATS device %pp flush failed\n",
+               d->domain_id, &pdev->sbdf);
+    if ( !is_hardware_domain(d) )
+        domain_crash(d);
+
+    pcidevs_unlock();
+}
 
 struct segment_iter {
     int (*handler)(struct pci_dev *pdev, void *arg);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 90f36ac22b..ad2e657bca 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2742,6 +2742,7 @@ static int __init cf_check vtd_setup(void)
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check reassign_device_ownership(
     struct domain *source,
     struct domain *target,
@@ -2937,6 +2938,7 @@ static int cf_check intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 
     return PCI_BDF(bus, devfn);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int __must_check cf_check vtd_suspend(void)
 {
@@ -3245,14 +3247,16 @@ static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .add_device = intel_iommu_add_device,
     .enable_device = intel_iommu_enable_device,
     .remove_device = intel_iommu_remove_device,
-    .assign_device  = intel_iommu_assign_device,
     .teardown = iommu_domain_teardown,
     .clear_root_pgtable = iommu_clear_root_pgtable,
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
+#ifdef CONFIG_MGMT_HYPERCALLS
+    .assign_device  = intel_iommu_assign_device,
     .reassign_device = reassign_device_ownership,
     .get_device_group_id = intel_iommu_group_id,
+#endif
     .enable_x2apic = intel_iommu_enable_eim,
     .disable_x2apic = intel_iommu_disable_eim,
     .update_ire_from_apic = io_apic_write_remap_rte,
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index a598d74f1f..83972d36b7 100644
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
@@ -429,7 +430,8 @@ static XSM_INLINE int cf_check xsm_deassign_device(
     return xsm_default_action(action, current->domain, d);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
+#endif /* CONFIG_HAS_PCI */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static XSM_INLINE int cf_check xsm_assign_dtdevice(
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 154a4b8a92..f2e92645ef 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -123,11 +123,13 @@ struct xsm_ops {
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
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     int (*assign_dtdevice)(struct domain *d, const char *dtpath);
@@ -524,7 +526,8 @@ static inline int xsm_pci_config_permission(
     return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
 }
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
+#ifdef CONFIG_HAS_PCI
 static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.get_device_group, machine_bdf);
@@ -541,7 +544,8 @@ static inline int xsm_deassign_device(
 {
     return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI) */
+#endif /* CONFIG_HAS_PCI */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static inline int xsm_assign_dtdevice(
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 9774bb3bdb..0026a0963b 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -80,11 +80,13 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
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
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     .assign_dtdevice               = xsm_assign_dtdevice,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 9b63c516e6..805a9a528e 100644
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
@@ -1459,7 +1460,8 @@ static int cf_check flask_deassign_device(
 
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE, NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
+#endif /* CONFIG_HAS_PCI */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static int flask_test_assign_dtdevice(const char *dtpath)
@@ -1987,11 +1989,13 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
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
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     .assign_dtdevice = flask_assign_dtdevice,
-- 
2.34.1


