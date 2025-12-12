Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3CCB7D58
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184955.1507324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuRC-0005ER-I7; Fri, 12 Dec 2025 04:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184955.1507324; Fri, 12 Dec 2025 04:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuRC-00059Q-BF; Fri, 12 Dec 2025 04:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1184955;
 Fri, 12 Dec 2025 04:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuR1-0007SS-S2
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:15 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09083059-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:07:12 +0100 (CET)
Received: from BL6PEPF00013DF6.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:a) by SN7PR12MB8817.namprd12.prod.outlook.com
 (2603:10b6:806:347::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 04:07:05 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2a01:111:f403:f901::7) by BL6PEPF00013DF6.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 04:07:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:05 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:02 -0600
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
X-Inumbo-ID: 09083059-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSwyoK6vazECKfMyXZQGuDC8+bn0B4xzcPRjoXZfQw9L3nOZToKxM7KXmpuLC9bCHE6QqWDk1+NKScTXoAKPiWqgQdm8P1pnsaPoiFjcQIoK7c1f5do0AXKa3VQfqrPHGMeS2AxSOXTbEwKBFrHrzWI5Il4khX+VAXE5dGgfZJ8xyB3BgCmpoVOhzD98mmBTnE/DvzgDZKejs35i7hQHDFeKVzB/EnfU1vDg6iQBcbfpRBeClSjNWy1KIddBvx340ycqWnqGltj3Byuiql0DMgjIIjSE+yM4LxPINcHIk127wm2m5unOksbX2IfhSaomYEuGgvW+cSxfo0Bh7EsHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmIanaYhA7lDAz9D81o3iTrsQ8uyDXNxse6wMqaVzko=;
 b=o+bWDfhxjXEqIHWbMahNQ7M9b6CLibDZZ5zI0gO3k80JsKmHzQ+kVxyJM1Bua7VVjn74apTBzUUsC+KDC9G11FsGMqTAMWeDNrwvypd/PZyszJk56POBu4mW24D6SXhPZwDL4VRFUvk01VixBfndse6SsQl78Ijzh5MYWFXmXv78uFHTnMNCyb2/aVvwR6UIykg+fqSbPbrAkQZTooMOMuzpM9q/baym8pTpxDiA5Pza464RW6pl7GwxD9+TubuvlaXUhWQD9KP/WXk6Q9EJNB8hlmHn51xUWIK9kNi/C2AtAwpq8uoPzbBP+e5xo5UJqouUpIOCFd6RX9rErvOlrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmIanaYhA7lDAz9D81o3iTrsQ8uyDXNxse6wMqaVzko=;
 b=Dvv5OaP55+WM7ZMnpMz6QgFeXM5xnVnh9Vg6BgM5CUps8KNdj5NTwqUSC2cQgwbV6Pb8ZcmFvN+08B6iq3K400B5DnkHXBci6r+oJqqxmFSf9kdcb8133faWdiEDJqMvVysGRBdyyf7cmLryF3ykzxWXUwkghZbjB6KWqa4EIW0=
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
Subject: [PATCH v5 15/24] xen/domctl: wrap pci-subset iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:00 +0800
Message-ID: <20251212040209.1970553-16-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|SN7PR12MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: e734c53d-e29d-4e7a-cd37-08de3933e947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/uQVslx0txzvGNuWuq0JWftz3WmeCtox+1jBeK384hLA+smeI4SABYyAc9PE?=
 =?us-ascii?Q?YHLnv1MkDYfxGz+WF81ADQD1qTEO5Zmj4dhT9K04H91PalkM2KXX/u9DHCMC?=
 =?us-ascii?Q?LgIBZ8q9OWEIDjuGUqghoElbYJv20MmfBP+ZADaWCbd9zcdvkKfYnJgaZixM?=
 =?us-ascii?Q?J6N2QaY4KlO+xnorkRzQ4uutUIHPn0fA0pYTSrRR1ORjViqFqH/r7Uunv4H2?=
 =?us-ascii?Q?eY9nsywhmxFOa4aOcXKP/d1QlQNCzIAlN/h5yO8qMJm8iKo/ngTOeotfiZX0?=
 =?us-ascii?Q?TVnaKKwsQ5p8IHUGlPlVueL92iBgOE1oF3eu38METRuTKOZ/6AJAN5VbNBBf?=
 =?us-ascii?Q?TXWMzoCZBflcye0WWsKf+Gdkrp5iopCXyF4u5Bde79fkBQ92hJZHh0oSZVIe?=
 =?us-ascii?Q?3ogQbC5zxmqUWGQbvF5oGUTzQWUg5NAZXQ9xVW+OfCt38zRjBkBWwYNhEgU8?=
 =?us-ascii?Q?tLMbRWVW9ILHvk91UlhBR4JV+kgfF9SEaOciPMKe5zGV/ZQhKvykYXl6GPSh?=
 =?us-ascii?Q?6PxgG0FfXUGMOiL/Qfu0Jwh+vJpTKQ5NWLE01klO1kOmM6XQNrs7p1R+ZTqf?=
 =?us-ascii?Q?hU2Ja+BMcEgaYe3tALxXF/i9ze8+TnqmqOraMhR0vJKJToGNCzVIMIj4j1hf?=
 =?us-ascii?Q?AfmkDdI0eGzsYZIKkwdjzQnpliI7kom56qETgZP6D6ctdakWgiuarsHEy1wf?=
 =?us-ascii?Q?EcYz4ts2wu2t0tvcvCeTLIGKLvXEF/zrAEDfud5HzkOwoSlYJEn4xoHGgXjO?=
 =?us-ascii?Q?EGrmJ0XEAffAlGH2c18SWtHLkLsAJczUvj0bxwShV1udqpSBv3wL42loMau7?=
 =?us-ascii?Q?y9+W71o5Exa5yhY4AHGyhCeFB5+ahQVmbUcRUy71n3myte2VqR4eQ8KIlgnj?=
 =?us-ascii?Q?iztcbQAK1fMLwoZSx/q0PP1iPZyCkCwfqGLk0WW8BZO0wOo9hPpPkW/k0fE/?=
 =?us-ascii?Q?khh/NcJ7n0SiWZnsi5K/M5REVX9FmCCcNIbCkv51043PKfnpvVlg4WYgescY?=
 =?us-ascii?Q?P4pBj8m2P2shNxqANdZ4SbT0g4EGp/1OGVZsggf+/yQ5amX/FEkRI7TM7Vx0?=
 =?us-ascii?Q?953VWwwBvWsSXLORLL8CYXlUmErfO9TnS/gXqCPfS7WeJvKUXeCsNaIXTAwm?=
 =?us-ascii?Q?8BUpQWof0Y7h/na3sxzbeJxEaJIXtWW7WwRkJA0cKA1cgO/n4z6rDxaUFtir?=
 =?us-ascii?Q?lrF3Nkm3WW20gIWGTcxontNQxHw77IAHntTsKKj7HWRVMLXEPa+IaSNyHF6+?=
 =?us-ascii?Q?tCYRWtdtNliwdMOleNmz4qA74TAF8TfUgPkWf3wv4mHLxYl64z66wlMzamhp?=
 =?us-ascii?Q?oiOT0lB87WrwtRFd0AY0+UQc1wR7oRm93atAw7i4IIrCD0F71POt9IM+8LTu?=
 =?us-ascii?Q?zZWv9P5Qj8g/ygBXQASwkcHk4G8AvN7R/nmat/mIijRrw0hZB2E4Tvz/xudg?=
 =?us-ascii?Q?WM1DXKOQq/K4+v2V9N6qUvldf/SVmGeyuJpnfZbazmcLTn10cjBGB2B8S6TT?=
 =?us-ascii?Q?2Qn4/IvwuAWCi3bBn/bKt8iwquJfyh66xM4/LXBwYsBGEVwSfeyP5zfqrlit?=
 =?us-ascii?Q?yK2WpBaVvS5cEzrfVrM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:05.2674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e734c53d-e29d-4e7a-cd37-08de3933e947
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8817

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

The PCI-part in ARM, (regarding codes under HAS_PCI), will be taken care of
later when guarding PCI_PASSTHROUGH with MGMT_HYPERCALLS, as the Kconfig
select chain in ARM is as follows:
HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH -> HAS_VPCI -> HAS_PCI
So making PCI_PASSTHROUGH depend on MGMT_HYPERCALLS will recursively leading
HAS_PCI depend on MGMT_HYPERCALLS too in ARM.

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
v4 -> v5:
- Hook .get_device_group_id should be properly dealt with in xen/iommu.h
right away
- Add description for how PCI-part will be dealt in ARM
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++----
 xen/drivers/passthrough/pci.c               | 52 +++++++++++----------
 xen/drivers/passthrough/vtd/iommu.c         |  6 ++-
 xen/include/xen/iommu.h                     |  2 +
 xen/include/xsm/dummy.h                     |  6 ++-
 xen/include/xsm/xsm.h                       | 12 +++--
 xen/xsm/dummy.c                             |  6 ++-
 xen/xsm/flask/hooks.c                       | 12 +++--
 8 files changed, 70 insertions(+), 46 deletions(-)

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
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 37c4a1dc82..6ca4190eb9 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -333,9 +333,11 @@ struct iommu_ops {
                          uint32_t flag);
     int (*reassign_device)(struct domain *s, struct domain *t,
                            uint8_t devfn, device_t *dev);
+#ifdef CONFIG_MGMT_HYPERCALLS
 #ifdef CONFIG_HAS_PCI
     int (*get_device_group_id)(uint16_t seg, uint8_t bus, uint8_t devfn);
 #endif /* HAS_PCI */
+#endif /* MGMT_HYPERCALLS */
 
     void (*teardown)(struct domain *d);
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 92291ac9e5..07d69e3725 100644
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
index b76eb22429..b331e81f9d 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -125,11 +125,13 @@ struct xsm_ops {
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
@@ -532,7 +534,8 @@ static inline int xsm_pci_config_permission(
     return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
 }
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
+#ifdef CONFIG_HAS_PCI
 static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.get_device_group, machine_bdf);
@@ -549,7 +552,8 @@ static inline int xsm_deassign_device(
 {
     return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI) */
+#endif /* CONFIG_HAS_PCI */
+#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static inline int xsm_assign_dtdevice(
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index f6986dd2bb..c693e77a7d 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -81,11 +81,13 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
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
index 9c1298697c..c772f79e16 100644
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
@@ -1988,11 +1990,13 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
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


