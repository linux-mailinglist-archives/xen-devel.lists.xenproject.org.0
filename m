Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C7FB19349
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068382.1432408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMZ-0002wv-QL; Sun, 03 Aug 2025 09:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068382.1432408; Sun, 03 Aug 2025 09:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMZ-0002vh-Ln; Sun, 03 Aug 2025 09:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1068382;
 Sun, 03 Aug 2025 09:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVL5-0005hH-Qs
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:49:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:200a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19969d3d-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:49:09 +0200 (CEST)
Received: from BY3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:254::32)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.19; Sun, 3 Aug
 2025 09:49:03 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::9) by BY3PR05CA0027.outlook.office365.com
 (2603:10b6:a03:254::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.13 via Frontend Transport; Sun,
 3 Aug 2025 09:49:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:49:01 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:58 -0500
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
X-Inumbo-ID: 19969d3d-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nz/oL5RGmQAbWCdcv7qBaDl92+5+6EYAMdSHAim5vXJ7WyqitIUHkY40gYZEvxNxPpWmINQlA8DHhcWRVJ4ofIlD9sLV3Qu/p5MBQe1laaVwd7KgLCMzMD+lLq8ZRc+JrdlZhmkHY/rgG1XTMocJLibk+WKfZpcRtp8/x6fB39IcQxHWGCT7OzzToTgC2c2a+1FovcKL/MUY4/Vmq1kP/hyGdFyBBBsg03vhh9B0YX1brYIwKK5SMY9iq2AWQz6E61KG1wY1sI8e2hoFvYObHOOhv2Upt3muGMZccQYBkkyMAu/mwr2Nt99wZ9uwthZRdhW7107mAnh7yk075jM/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8vNzoPBn1L4Q+rqW/xeDizhORsHZhqdEN60V84u228=;
 b=rSBMLvBQ986g4esNLoLE3v6mCDOCXwsTBP8ycEPwPzr6+HxqTM1wSKBveGNLz62s0E+2fZ7z1ngSo41R9YmCEKrtE0Ik8A2z4Nv/guWeTIKOpc24RGBzxCUVCQVYZ9J6/QSD4/DsHVQQVy5kybkPlPlZT32a5EJ52kwX12xbHFELnlbpBDjBXDEpiic8h/LNdCuBJYB7oPP0zz2qTGywOpyUqnLp27eQw5w7leclo5qo0MjSG5d+bV/g5YifOP6hmyMzub1ke7UTwW4uuMd4HTbz9IJDYlXvOCkIoTdHJQmM2XlzIH7UA/lgeEjuo3le2CbHUfx5u5aH1yvK2kh9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8vNzoPBn1L4Q+rqW/xeDizhORsHZhqdEN60V84u228=;
 b=NhjIZ6S5h0dJKmR1sTD2RNO49EJWRVE/moSN7yzfVArdpClDQWyv+vPwWrAWk+i3XpTHIVFBg21jSKYNgBpSLyUAPU5j1D4p63dXqdJNW74OmBVG0rxPqib/mq4cFqqaQP0ysIBKHjqUXUh3vPRySLEuHRry7ZoE5ikcRepViaU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 21/25] xen/domctl: wrap aound iommu-related domctl op
Date: Sun, 3 Aug 2025 17:47:34 +0800
Message-ID: <20250803094738.3625269-22-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: ac684bfe-09c0-41be-a548-08ddd272fa15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KHceauyZxcgm2bK8ulWb2JJl9+GXas0OdWpBYnlXamuFD7iirxGYCVrB9qlz?=
 =?us-ascii?Q?aeaLEjomBZBRlD5OiQisKTAMiDnDymZwmfXbtvke68sn9rzIEWSrUKU/Agkz?=
 =?us-ascii?Q?xUPyFOb7rwD0+YB71v9f6WhQ1kXCANJGGmyqtPfPGizXkoOYU4jXFf21+ifw?=
 =?us-ascii?Q?b+PHkoyAS8YhSVLChX//roN23Awoz8DP2Vm77qYCx8pdR7Bd2+toItsGVTLB?=
 =?us-ascii?Q?n4thALLsvOJMosGS1LbwqoqvVmP5ZZHccm3md7ePhfpOE/g0Y8jhWOT/rT8U?=
 =?us-ascii?Q?1MxDa/cbzs2VpORA8wV6zFOKahvRJ/HH8YHrYgrCbHWfaIQvKdHmaRd/sMMz?=
 =?us-ascii?Q?e0mH4bA9+7VEus2fls3hqOIIADwnyCW4N8KqFWPHZyWDpvFf4CIK7G+Ro24K?=
 =?us-ascii?Q?lHnsp/2zwAXXB3kg/6h57ggSEiN1wiMkWx5nEQxB448YBDaWgL5tQtzuEMdy?=
 =?us-ascii?Q?1H+c2kQbOkeUshh6ppRoNfSMPWnjzlFI/gj5Qmo74NhTL6mw6yR1NwkQzU7T?=
 =?us-ascii?Q?Ygmd55jK48oDOnvHF2RQ3rqiT/3V2CVk8C3pqLgeGQUZpdMYFhLjNp7Qx+IC?=
 =?us-ascii?Q?MYtzJS0TGck42uyr1uzmuP10jMjRukWDT03m3MtiopXacPz5d/yTBTEEysOm?=
 =?us-ascii?Q?rvUF2isIspAN29ADeiujoRGVY2qUlLgzka8oDtDUlt6XrKUBqU9HxZY/pvfJ?=
 =?us-ascii?Q?3SJ1PtfChbDszFlFC/T5OjuqJBVtTNSU+L1qzLLaemswEHm8WcdprnqBhY1x?=
 =?us-ascii?Q?wb8/kursSYN+Saadgn7HsBsjbxgAgTpvQ5/lnM5xb3BG0PWNJe0wVDqbLC0R?=
 =?us-ascii?Q?aw5AsDOW/maGzArG7LYFIF0raiUt4v5KiK9G7gq13ikGI6V+7eu574M+DBEl?=
 =?us-ascii?Q?t9yO+l0KTmJ/FVu0sd5nsu456b7jJCcY0mYOgw5P52hKpdQ6L+fAQ5JpSo+9?=
 =?us-ascii?Q?MeNPZH95pdrM0mWiKgOnEgTWOL7J8qrvgDj3sI49NT9XiSVpkdYkp4ji/wv1?=
 =?us-ascii?Q?aRh9oiPt3Xm7WYH4mUKxdVR27Z5qQkwdGluCL0/uRguK90iUQZcUR5GqPIQN?=
 =?us-ascii?Q?uafnqJudFefq3oP1jPo2pAPt9/+IC9beB3EGIa9wOW5o88bijjzIWcOp71ER?=
 =?us-ascii?Q?kht4HEPTkLyxeifqAJBW/+Ce00CFwfVfusPyLzfF9dSm19wm/vnHSxJ28j08?=
 =?us-ascii?Q?Ju7LbFYBDiToRugx5GLG/qSe/n6qPizdAB6/04jsyNW80tSG0by21AIPgjzC?=
 =?us-ascii?Q?vmKbyvkFBgo33Wjr7eY+95vMRg2jzuJAZUWCSBx19yNiK4tLoOluEDzIzW/0?=
 =?us-ascii?Q?p9Ll1uw0o9iCqcZUXOcW7w025DzEKeIxQ4iWk4Z2FJIkUpAuXmlIAqWSkgYS?=
 =?us-ascii?Q?Uo2jg9N8vqva1u0mB+w9mNegKhoo5oBVIajP9rRj5ixMfMO8rkSa6WBdBhHg?=
 =?us-ascii?Q?6hkU1jmGCjgf9nZyDyTSHPefur0bzQoEI3JwfuOAcVoJyGZp3hJgFFVF+JHH?=
 =?us-ascii?Q?kQjWm67A2OYU92nbfkHTuONlwIU3aGKL3j4Z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:49:01.8960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac684bfe-09c0-41be-a548-08ddd272fa15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955

Function iommu_do_domctl() is the main entry for all iommu-related domctl-op.
Tracking its calling chaining, the following functions shall all be wrapped:
- iommu_do_pci_domctl
  - xsm_get_device_group
  - iommu_get_device_group
    - amd_iommu_group_id/intel_iommu_group_id
  - xsm_assign_device
  - device_assigned
  - assign_device
    - intel_iommu_assign_device/amd_iommu_assign_devic
  - xsm_deassign_device
  - deassign_device
    - reassign_device_ownership/reassign_device
- iommu_do_dt_domctl
  - xsm_assign_dtdevice
  - xsm_deassign_dtdevice
  - iommu_deassign_dt_device
    - arm_smmu_reassign_dev/arm_smmu_reassign_dev
    - ipmmu_reassign_dev
      - ipmmu_deassign_dev
        - ipmmu_detach_dev
  - dt_find_node_by_gpath

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/device-tree/device-tree.c        |  2 ++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  8 ++++++++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c    |  6 ++++++
 xen/drivers/passthrough/arm/smmu-v3.c       |  4 ++++
 xen/drivers/passthrough/arm/smmu.c          |  4 ++++
 xen/drivers/passthrough/device_tree.c       |  4 ++++
 xen/drivers/passthrough/iommu.c             |  2 ++
 xen/drivers/passthrough/pci.c               |  6 +++++-
 xen/drivers/passthrough/vtd/iommu.c         |  6 ++++++
 xen/include/xsm/xsm.h                       | 12 ++++++------
 xen/xsm/dummy.c                             |  4 ++--
 xen/xsm/flask/hooks.c                       | 12 ++++++------
 12 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 0b5375f151..4ce6dce2ea 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -371,6 +371,7 @@ struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
     return np;
 }
 
+#ifdef CONFIG_DOMCTL
 int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
                           struct dt_device_node **node)
 {
@@ -386,6 +387,7 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
 
     return (*node == NULL) ? -ESRCH : 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 struct dt_device_node *dt_find_node_by_alias(const char *alias)
 {
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3a14770855..869d2bc3a2 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -461,6 +461,7 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
         spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check reassign_device(
     struct domain *source, struct domain *target, u8 devfn,
     struct pci_dev *pdev)
@@ -550,6 +551,7 @@ static int cf_check amd_iommu_assign_device(
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 static void cf_check amd_iommu_clear_root_pgtable(struct domain *d)
 {
@@ -698,12 +700,14 @@ static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
     unsigned int bdf = PCI_BDF(bus, devfn);
 
     return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) : bdf;
 }
+#endif /* CONFIG_DOMCTL */
 
 #include <asm/io_apic.h>
 
@@ -772,14 +776,18 @@ static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .quarantine_init = amd_iommu_quarantine_init,
     .add_device = amd_iommu_add_device,
     .remove_device = amd_iommu_remove_device,
+#ifdef CONFIG_DOMCTL
     .assign_device  = amd_iommu_assign_device,
+#endif
     .teardown = amd_iommu_domain_destroy,
     .clear_root_pgtable = amd_iommu_clear_root_pgtable,
     .map_page = amd_iommu_map_page,
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
+#ifdef CONFIG_DOMCTL
     .reassign_device = reassign_device,
     .get_device_group_id = amd_iommu_group_id,
+#endif
     .enable_x2apic = iov_enable_xt,
     .update_ire_from_apic = amd_iommu_ioapic_update_ire,
     .update_ire_from_msi = amd_iommu_msi_msg_update_ire,
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index dac0dd6d46..719f0a11cc 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -726,6 +726,7 @@ static int ipmmu_attach_device(struct ipmmu_vmsa_domain *domain,
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 static void ipmmu_detach_device(struct ipmmu_vmsa_domain *domain,
                                 struct device *dev)
 {
@@ -735,6 +736,7 @@ static void ipmmu_detach_device(struct ipmmu_vmsa_domain *domain,
     for ( i = 0; i < fwspec->num_ids; ++i )
         ipmmu_utlb_disable(domain, fwspec->ids[i]);
 }
+#endif /* CONFIG_DOMCTL */
 
 static int ipmmu_init_platform_device(struct device *dev,
                                       const struct dt_phandle_args *args)
@@ -1209,6 +1211,7 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_DOMCTL
 static int ipmmu_deassign_device(struct domain *d, struct device *dev)
 {
     struct ipmmu_vmsa_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -1264,6 +1267,7 @@ static int ipmmu_reassign_device(struct domain *s, struct domain *t,
 
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 static int ipmmu_dt_xlate(struct device *dev,
                           const struct dt_phandle_args *spec)
@@ -1367,7 +1371,9 @@ static const struct iommu_ops ipmmu_iommu_ops =
     .teardown        = ipmmu_iommu_domain_teardown,
     .iotlb_flush     = ipmmu_iotlb_flush,
     .assign_device   = ipmmu_assign_device,
+#ifdef CONFIG_DOMCTL
     .reassign_device = ipmmu_reassign_device,
+#endif
     .map_page        = arm_iommu_map_page,
     .unmap_page      = arm_iommu_unmap_page,
     .dt_xlate        = ipmmu_dt_xlate,
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 5e9e3e048e..d3028d859e 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2780,6 +2780,7 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device
 	return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 				u8 devfn,  struct device *dev)
 {
@@ -2807,6 +2808,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 
 	return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 static int arm_smmu_iommu_xen_domain_init(struct domain *d)
 {
@@ -2843,7 +2845,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
 	.teardown		= arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		= arm_smmu_iotlb_flush,
 	.assign_device		= arm_smmu_assign_dev,
+#ifdef CONFIG_DOMCTL
 	.reassign_device	= arm_smmu_reassign_dev,
+#endif
 	.map_page		= arm_iommu_map_page,
 	.unmap_page		= arm_iommu_unmap_page,
 	.dt_xlate		= arm_smmu_dt_xlate,
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 22d306d0cb..f1d85ae91f 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2891,6 +2891,7 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 	return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 				 u8 devfn,  struct device *dev)
 {
@@ -2918,6 +2919,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 
 	return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 static int arm_smmu_iommu_domain_init(struct domain *d)
 {
@@ -2956,7 +2958,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .assign_device = arm_smmu_assign_dev,
+#ifdef CONFIG_DOMCTL
     .reassign_device = arm_smmu_reassign_dev,
+#endif
     .map_page = arm_iommu_map_page,
     .unmap_page = arm_iommu_unmap_page,
     .dt_xlate = arm_smmu_dt_xlate_generic,
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 704910de3d..225aae2f29 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -59,6 +59,7 @@ fail:
     return rc;
 }
 
+#ifdef CONFIG_DOMCTL
 int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -86,6 +87,7 @@ fail:
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 static bool iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
@@ -320,6 +322,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
     return rc;
 }
 
+#ifdef CONFIG_DOMCTL
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -431,3 +434,4 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
     return ret;
 }
+#endif /* CONFIG_DOMCTL */
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c9425d6971..5035eb6e53 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -625,6 +625,7 @@ void iommu_resume(void)
         iommu_vcall(iommu_get_ops(), resume);
 }
 
+#ifdef CONFIG_DOMCTL
 int iommu_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -645,6 +646,7 @@ int iommu_do_domctl(
 
     return ret;
 }
+#endif /* CONFIG_DOMCTL */
 
 void iommu_crash_shutdown(void)
 {
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 41638b71d6..176c7502d6 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -877,6 +877,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
+#ifdef CONFIG_DOMCTL
 /* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
@@ -945,7 +946,6 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     return ret;
 }
 
-#ifdef CONFIG_DOMCTL
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -1483,6 +1483,7 @@ static int iommu_remove_device(struct pci_dev *pdev)
     return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
 }
 
+#ifdef CONFIG_DOMCTL
 static int device_assigned(u16 seg, u8 bus, u8 devfn)
 {
     struct pci_dev *pdev;
@@ -1646,6 +1647,7 @@ static int iommu_get_device_group(
 
     return i;
 }
+#endif /* CONFIG_DOMCTL */
 
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
 {
@@ -1671,6 +1673,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
     pcidevs_unlock();
 }
 
+#ifdef CONFIG_DOMCTL
 int iommu_do_pci_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -1804,6 +1807,7 @@ int iommu_do_pci_domctl(
 
     return ret;
 }
+#endif /* CONFIG_DOMCTL */
 
 struct segment_iter {
     int (*handler)(struct pci_dev *pdev, void *arg);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index c55f02c97e..e9c074a649 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2731,6 +2731,7 @@ static int __init cf_check vtd_setup(void)
     return ret;
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check reassign_device_ownership(
     struct domain *source,
     struct domain *target,
@@ -2926,6 +2927,7 @@ static int cf_check intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 
     return PCI_BDF(bus, devfn);
 }
+#endif /* CONFIG_DOMCTL */
 
 static int __must_check cf_check vtd_suspend(void)
 {
@@ -3234,14 +3236,18 @@ static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .add_device = intel_iommu_add_device,
     .enable_device = intel_iommu_enable_device,
     .remove_device = intel_iommu_remove_device,
+#ifdef CONFIG_DOMCTL
     .assign_device  = intel_iommu_assign_device,
+#endif
     .teardown = iommu_domain_teardown,
     .clear_root_pgtable = iommu_clear_root_pgtable,
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
+#ifdef CONFIG_DOMCTL
     .reassign_device = reassign_device_ownership,
     .get_device_group_id = intel_iommu_group_id,
+#endif
     .enable_x2apic = intel_iommu_enable_eim,
     .disable_x2apic = intel_iommu_disable_eim,
     .update_ire_from_apic = io_apic_write_remap_rte,
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index db98496869..6bbf3df702 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -127,13 +127,13 @@ struct xsm_ops {
     int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
                                  uint16_t start, uint16_t end, uint8_t access);
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI) && defined(CONFIG_DOMCTL)
     int (*get_device_group)(uint32_t machine_bdf);
     int (*assign_device)(struct domain *d, uint32_t machine_bdf);
     int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY) && defined(CONFIG_DOMCTL)
     int (*assign_dtdevice)(struct domain *d, const char *dtpath);
     int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
 #endif
@@ -548,7 +548,7 @@ static inline int xsm_pci_config_permission(
     return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
 }
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI) && defined(CONFIG_DOMCTL)
 static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.get_device_group, machine_bdf);
@@ -565,9 +565,9 @@ static inline int xsm_deassign_device(
 {
     return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI) */
+#endif /* HAS_PASSTHROUGH && HAS_PCI && DOMCTL */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY) && defined(CONFIG_DOMCTL)
 static inline int xsm_assign_dtdevice(
     xsm_default_t def, struct domain *d, const char *dtpath)
 {
@@ -580,7 +580,7 @@ static inline int xsm_deassign_dtdevice(
     return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY && DOMCTL */
 
 static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index b7eb061e9b..b5174e610b 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -85,13 +85,13 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .pci_config_permission         = xsm_pci_config_permission,
     .get_vnumainfo                 = xsm_get_vnumainfo,
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI) && defined(CONFIG_DOMCTL)
     .get_device_group              = xsm_get_device_group,
     .assign_device                 = xsm_assign_device,
     .deassign_device               = xsm_deassign_device,
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY) && defined(CONFIG_DOMCTL)
     .assign_dtdevice               = xsm_assign_dtdevice,
     .deassign_dtdevice             = xsm_deassign_dtdevice,
 #endif
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 9f829aa53b..254e1323e5 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1397,7 +1397,7 @@ static int cf_check flask_mem_sharing(struct domain *d)
 }
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI) && defined(CONFIG_DOMCTL)
 static int cf_check flask_get_device_group(uint32_t machine_bdf)
 {
     uint32_t rsid;
@@ -1468,9 +1468,9 @@ static int cf_check flask_deassign_device(
 
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE, NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
+#endif /* HAS_PASSTHROUGH && HAS_PCI && DOMCTL */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY) && defined(CONFIG_DOMCTL)
 static int flask_test_assign_dtdevice(const char *dtpath)
 {
     uint32_t rsid;
@@ -1531,7 +1531,7 @@ static int cf_check flask_deassign_dtdevice(
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE,
                                 NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
+#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY && DOMCTL */
 
 static int cf_check flask_platform_op(uint32_t op)
 {
@@ -2003,13 +2003,13 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .remove_from_physmap = flask_remove_from_physmap,
     .map_gmfn_foreign = flask_map_gmfn_foreign,
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI) && defined(CONFIG_DOMCTL)
     .get_device_group = flask_get_device_group,
     .assign_device = flask_assign_device,
     .deassign_device = flask_deassign_device,
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY) && defined(CONFIG_DOMCTL)
     .assign_dtdevice = flask_assign_dtdevice,
     .deassign_dtdevice = flask_deassign_dtdevice,
 #endif
-- 
2.34.1


