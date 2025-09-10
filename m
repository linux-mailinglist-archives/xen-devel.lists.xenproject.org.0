Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A02B50FD8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117671.1463768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWp-0004kw-5f; Wed, 10 Sep 2025 07:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117671.1463768; Wed, 10 Sep 2025 07:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWp-0004iY-1t; Wed, 10 Sep 2025 07:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1117671;
 Wed, 10 Sep 2025 07:46:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFR1-0005yo-5D
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:40:07 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20630.outbound.protection.outlook.com
 [2a01:111:f403:2409::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ac635c2-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:40:00 +0200 (CEST)
Received: from SA1P222CA0042.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::16)
 by CH1PR12MB9720.namprd12.prod.outlook.com (2603:10b6:610:2b2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:55 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::a4) by SA1P222CA0042.outlook.office365.com
 (2603:10b6:806:2d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 07:39:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:55 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:51 -0700
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
X-Inumbo-ID: 5ac635c2-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OU0H91HF6Ua+E/82kCav35yGWM/O9FArr2e01xAMpp6nrks1Zoui1rG84cdvj7Spb/Y6eCacSDjt6XHPhUyUhT4aZnhbRpqSyJr5ygrRjIKMOpoDaSNqlxwefXz9cg0LSs9qzroeAo52JHSULrrJGvLvk/EdVYo5Pws3SMd8yRCX+jnlNIdOPmaW6vwvq5DUx19hJs1iA3NUy/sLfRUtIvkvuFdVg+Y2gOMTVSYTYqW8vOOQ03trX9DphskyM+5fVip/Q2cUy+qsMQXjn2FkgoVUsKbbAqShA8MjGNbj/0s7uZp+CCWLOwZyp9daPeiaIOT3widijjGoBOBQ1qRX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW923e2M3GzF3ljplSHb2j/zzkbSspIlyd89Yjzbzwo=;
 b=rujnfxTKthQG75Ura5YjFW9LFY6mEZSleZhS3OFzLZImq6T0usY/xEF3mEzo73JMoXbbQXo6bFYZHe+qA58ZOWNAK9pyVCbO9VKLWDDQzcnDpqUAllI7yQzDqUlsL/6cLPAnYEkqle3Jwou0gmAv9y+CUqiwg0DwBAAAitu1bA+40/JsGdXOBS75jfgK1QC9a9cj8dKQ+JCw+5ZZnODwsqicJD9+vxufwQ8d99GS0AfxgnEphfCdcCqm6nVNKYUg7JNdGmV+UhNRNN/r0QCWIOBhfUfb7oK1MVM0B/NWcR17tXqosRHokoMd9zO/EpKa4B0IZddpjAhcaezxWVq6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW923e2M3GzF3ljplSHb2j/zzkbSspIlyd89Yjzbzwo=;
 b=QdwvlenUwEWgaQjxur6h5UoJLhQgI8TQ5yaI8hqhuLyIOpqdmcxPyOViWcaGJk4UlrGq24CCIFOFNBspDrJiukDpJcutuwngmsMU7JoHyLdrDRK3YGxf77q/rNHsYHbVpZ/5gnlz0/HDqp3Uwf0xo+d8OHI24ZXuHdN7K2Hp5PE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v2 20/26] xen/domctl: wrap iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:21 +0800
Message-ID: <20250910073827.3622177-21-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|CH1PR12MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: d7651a22-fe8b-4a97-f6a6-08ddf03d3c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?otpdfLhyKYa7lrIOKNubZg58mEhy15hYbv4gwS0yGffMjFVNZlivS1B/0qvu?=
 =?us-ascii?Q?hw6A3zMreK5aSUQzg/TwowuCmGHxHan9B/qzcx6NpSYRRN4ZB4GJZi9niLop?=
 =?us-ascii?Q?MYPubV3Tjuct+zwDqlSWmtJacfNprcwjXgLNv9bgngdtycYxnPwd1cMI4uPw?=
 =?us-ascii?Q?nKdTggiGPpx3zyRQ8QXi2rGznFS/QwI1pPOV6kyzyCGKeEhkP8yIG1Y6/y1F?=
 =?us-ascii?Q?0JgitxrymVuEykCXTGaIErw62BQPQpv3dTSyMazRh3msGhExk2BnT6VO9rfT?=
 =?us-ascii?Q?2iQfZPVcexH91lTqHU2yCTc0lLcPWLy7d8Hui6Nd+8ICyLZS5eE9hr9+bCBM?=
 =?us-ascii?Q?eAJJphYPo/kD1ZGuLVNo91Dg2l0143Jd3StPiQSBWeVbGJK1Qjj82hLIh6wS?=
 =?us-ascii?Q?23EPjhdbKcU1RnsfTnr875KKh3EaXHrVOK4OEZt0oqxd3A+dgc7JLkpFxK9y?=
 =?us-ascii?Q?LaNmo5VHcMYh6wFwP+MKRsgbufxlid28A4Yo1dcC3+3MjSnijHRhlFY9bQZ8?=
 =?us-ascii?Q?RgztQAln6I163FmDyDe35Q0lTGqfVUB7IuC3y7QIHyXoP7/FTO+Gl2F0kVvH?=
 =?us-ascii?Q?+euwAhrJqNjzzciNvRM14ncLQE1WC1V9AmWc3U5QcPJpE5U3o4u6cOt9thMv?=
 =?us-ascii?Q?TpwVqelc5ToBo4eJFuK+3/nXSKoPFLXJQTdWqCCPkuQ/u26/pzDk/FsswL4+?=
 =?us-ascii?Q?KlKRjYw1KJWAvcTk3ZtbqQbdCVzx1duvOqaVjrB8jowmBlk0fcBNFmlltSRX?=
 =?us-ascii?Q?gNUmTjJaOwOM+iIgI+6T0mq+KMcXLe5/QMxn3nf8XRqyibQ3KphqjKK5hTGf?=
 =?us-ascii?Q?qVOsStNrGzbwAk8oHemERIenE80HlN4S+YQDdgfUxn5BIe+i7HCLMLk/g0Dw?=
 =?us-ascii?Q?TcUPmUVHlYHTupTHjcOB4vh93CKyF/LviC+cuVPdLz08fo9q5kL8mPj+bS+I?=
 =?us-ascii?Q?m5nxxY1aO8vb6GGN4zDZx+N5c03aw9LnGVqN/A/hVkf3q1d5V1kglvwGZwOU?=
 =?us-ascii?Q?foi93AhGKd21f+uWODEN+oSbFMIIDRwNqC9NBIBAYqJZENQctXyYejKNIfUV?=
 =?us-ascii?Q?wti9FDChoV4WuClElBdbdmM7TGeHjf4YXS9o+0gMQqLxnWQASf+oG5qOfZoP?=
 =?us-ascii?Q?CA04mWQixIuxiwud7zKVssiNfYwP1qK7IY2lNp6ZV69Dkem7Wr2vWiDcGkVB?=
 =?us-ascii?Q?aTtQil0hmByi7VqyuA52DMKUI6xMYAki6pLuhvT2K6dFtGvC5kgfjxqZhR/2?=
 =?us-ascii?Q?W852tHcfXGHVGFlWZdnbWALDqGtQ0VX4NIdG0bT1YVLVkQgYu3WBHM9MuGl9?=
 =?us-ascii?Q?Ln91FrhobHVoJ59gO8BsGqXNIXYuhOMPJnVar8VtaWsAe42zMGdcmROlG3dv?=
 =?us-ascii?Q?3XZoEho2ICBFbE7bF0QZPrhB/x/qoLmbjsZU2qoDQt2MIokHyMtWyglwixhC?=
 =?us-ascii?Q?55e4ZRux9aZXvWO89NMUc3KQQpoE0wtVnMqD1qGlNgU02V0lOdRMKl0pRPkz?=
 =?us-ascii?Q?qDsSJQLLrNQgA/F0+oaeLGpcK0yWod1RiEtF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:55.0176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7651a22-fe8b-4a97-f6a6-08ddf03d3c3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9720

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
- iommu_do_dt_domctl
  - iommu_deassign_dt_device
    - arm_smmu_reassign_dev/arm_smmu_reassign_dev
    - ipmmu_reassign_dev
      - ipmmu_deassign_dev
        - ipmmu_detach_dev
  - dt_find_node_by_gpath
Wrap XEN_DOMCTL_assign_device{test_assign_device,deassign_device,
get_device_group}-case transiently with CONFIG_MGMT_HYPERCALLS,
and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the whole
domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_assign_device{test_assign_device,deassign_device,
 get_device_group}-case transiently
---
 xen/common/device-tree/device-tree.c        | 2 ++
 xen/common/domctl.c                         | 2 ++
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 8 ++++++++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c    | 6 ++++++
 xen/drivers/passthrough/arm/smmu-v3.c       | 4 ++++
 xen/drivers/passthrough/arm/smmu.c          | 4 ++++
 xen/drivers/passthrough/device_tree.c       | 4 ++++
 xen/drivers/passthrough/iommu.c             | 2 ++
 xen/drivers/passthrough/pci.c               | 6 +++++-
 xen/drivers/passthrough/vtd/iommu.c         | 6 ++++++
 10 files changed, 43 insertions(+), 1 deletion(-)

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
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 736ad52265..d36885aeea 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -840,12 +840,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = 1;
         break;
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_assign_device:
     case XEN_DOMCTL_test_assign_device:
     case XEN_DOMCTL_deassign_device:
     case XEN_DOMCTL_get_device_group:
         ret = iommu_do_domctl(op, d, u_domctl);
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_get_paging_mempool_size:
         ret = arch_get_paging_mempool_size(d, &op->u.paging_mempool.size);
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
index ea9fa9ddf3..ec85b2fbdd 100644
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
@@ -1254,6 +1256,7 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
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
index bf153227db..49cd37ff57 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2799,6 +2799,7 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device
 	return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 				u8 devfn,  struct device *dev)
 {
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
index 22d306d0cb..b7f01fbf89 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2891,6 +2891,7 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 	return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 				 u8 devfn,  struct device *dev)
 {
@@ -2918,6 +2919,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 
 	return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int arm_smmu_iommu_domain_init(struct domain *d)
 {
@@ -2956,7 +2958,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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
index 015ffa15d4..5c2122ba9f 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -59,6 +59,7 @@ fail:
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -86,6 +87,7 @@ fail:
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static bool iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
@@ -320,6 +322,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -431,3 +434,4 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
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
-- 
2.34.1


