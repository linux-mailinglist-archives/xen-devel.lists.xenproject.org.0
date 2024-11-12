Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07039C62EF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 21:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834913.1250729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAxtW-00079d-Em; Tue, 12 Nov 2024 20:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834913.1250729; Tue, 12 Nov 2024 20:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAxtW-00076F-Ah; Tue, 12 Nov 2024 20:53:50 +0000
Received: by outflank-mailman (input) for mailman id 834913;
 Tue, 12 Nov 2024 20:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6R0y=SH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tAxtU-0006YG-AQ
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 20:53:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2415::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 347bcc0d-a138-11ef-a0c7-8be0dac302b0;
 Tue, 12 Nov 2024 21:53:45 +0100 (CET)
Received: from BL1PR13CA0019.namprd13.prod.outlook.com (2603:10b6:208:256::24)
 by DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 20:53:40 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:208:256:cafe::7f) by BL1PR13CA0019.outlook.office365.com
 (2603:10b6:208:256::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Tue, 12 Nov 2024 20:53:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 20:53:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 14:53:37 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 14:53:36 -0600
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
X-Inumbo-ID: 347bcc0d-a138-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjE5IiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjM0N2JjYzBkLWExMzgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDQ0ODI1LjU0MTI2OCwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaQ/MgtYQNjpSwmecoOVcUT+Irr3S3GThy5V10vqXsdDKDqPlIDd8zG9sKWVeyNRnz8D4Pdko+iIfImvt5uYz++0a04+QW+Q/tE2+litX6fd2lO+/pFyOMjh1qjNyhVbYPwaH2elhsoEHayYCPAER8ySAIzafZA3wCOR9RlpYdAh0bE3T6IZ2RxfYqBsRL8QEDAMZfB4aCrEFxkNp/i/JqnDvoeY4ifVBlcMUN3RnzeyvU56+Rt1+qKS3xniMdy9qB1mVyWRDaueHARpRvaE9p9VEgbQwqV22RmCdll4p7o6R87q2cKBxr1F3/BhjzKVuZXUWb6Y9L5EpgZOEzfCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvfdk7zwQONqaq/3Edn44Ev2SS3iqmtHkUeBX4CZLoU=;
 b=jA95A5ClNtbAYlYXDGGiD2eB8JgDoRPl1/Akzgrw/WisPXXtfon2tQjJZZ2Z3hbhcARfwlnVgBrCRqXrTjTKUczQj2stcQ0atWoYyBOwdWehMmBIPr7V7rFGbB5Q4LH+n2K1DcI0za6MTQGMTZ0YVTMEjehkQD696Y4rTeVlTxIo2nj4l71tuNIwP4j5sM4LBlxg08L03nZDMYOT0/dLq9ELL1tijY+7HMlLsiM+XtyhjGA0L35+AXCyJeG5Di5xE3bZTJ4/3A8a3Zg+IYtt77+BPSt/Te6U3po/wisQEILdHN5ZVbnGBKhHi9q5/VBaHyfGBOxkZY8xMzJJklkpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvfdk7zwQONqaq/3Edn44Ev2SS3iqmtHkUeBX4CZLoU=;
 b=0H72bbDtiEOuyWNx7PkGVuf46lNjhAeOXnKYoVFtRz27R0VIIHrLr/B4p0hzfCIiVRZ7t/cnMg422gKVLCE+Bv9TztTWIPag9FNQN9JHEW88Nr1Mzq7drEWJyTnVnrF4db7jJu+gr+tehBaCxRvS/XwdxplJnQJwlyVUqPiSAsY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v7 2/2] x86/msi: fix locking for SR-IOV devices
Date: Tue, 12 Nov 2024 15:53:20 -0500
Message-ID: <20241112205321.186622-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112205321.186622-1-stewart.hildebrand@amd.com>
References: <20241112205321.186622-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ed892f-1733-41b5-0301-08dd035c15d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oe9XZV7Yp7pHVumzi7PUVFspyoHwi23OLO7xe10KXzKUvGLgj4sj1Toegeaq?=
 =?us-ascii?Q?jyo+22GkMqK+ZmaQRpejrlbX1enAu/RlSxQhW1ScUqk1YZ1uMIr8Ra1Wu6MI?=
 =?us-ascii?Q?SUZ+jkYXCHK2d01O2mOHvLY3ZNrFEfwDL9fEAy0zDiWnIYqSyOE6JRiLo556?=
 =?us-ascii?Q?D0E9R7yc0ex7/BKHmXbUgqLRTkqNI66lNkBPyD3B8dugHb6w1kN2Bc9HXU8Q?=
 =?us-ascii?Q?B/0DsIPzb0sOXJb421BlujFXpkkLDSYM0rR8CxRjKxSbs8Kh85KAQmeczadC?=
 =?us-ascii?Q?FMoFVWXDD1ArP7rxCc9FmuurOAGe8nfPa5+MgcqPgKaiziPnKbOuxJuV2JXo?=
 =?us-ascii?Q?vGZWXhexqSW6+Kgl9DoqIRLU0ckWzjNJRcXwc9qGdv0/cZOsZPrNncQW3XML?=
 =?us-ascii?Q?wy7XA9/b2+N78Wf555HwLzebcCXqKeD5G5OWqh7BEAGFAj/desd3p5tdIDNf?=
 =?us-ascii?Q?dW0WnGI7deW9TAkhAnwZ81fVfnY9IejLP0qYMbhRURTzJgKzuO1u4ejd/JVi?=
 =?us-ascii?Q?H5yHYgJiccsqiIw+Ykgi4uK6q4iK9x9Wx0X92C0P5+StlBBwAPf4ynLc7V9v?=
 =?us-ascii?Q?/UW2FH5bXwjvT72ms5Te/AD74G1YyxPCHVEyvDkUDEdXSCoEJK4goJrSFQ5h?=
 =?us-ascii?Q?bRPo1wtBJNbfKGPEJl9L2OY8yMmhLjB93B9EOH62EL7itDJKmQQ1JkRMZNBK?=
 =?us-ascii?Q?aFj2QoUOd6oWv2IwAB/GTPOXUyK2kBMNOX36BxE043MYPFKt72IEEkXE70Gj?=
 =?us-ascii?Q?jUoZclLs+9LZJHkVswvBmCaUiPtAWqUMBm6/XcXQ3VP9rJmQn1LhcXbET0aJ?=
 =?us-ascii?Q?7wxTtX7LvAXLYEB8sqxaA6quZPYmWOlmWcuk7PpLF/4eFn+1UJHCIJtjpufF?=
 =?us-ascii?Q?ab3vC4EDvLvb3XiFjWkEz56NIIhuEFqUbXxSXytdMYVQpZTzO31b4h0dph95?=
 =?us-ascii?Q?f9Z+qvGtRJ0W9Wjjt1pjXGsq6mQteuOWp7VK8e5ojA6thkWHAl2hwpelQMN9?=
 =?us-ascii?Q?zo0C4MgDkW8lwdFUo8HdhYvg/oI/UQ+mIIL/lXjJJtQW3wOBM/qb1t4EHd76?=
 =?us-ascii?Q?9jFTtMlGlyGDXxQSN1lmQEkyZboqqchC3IZcNbIgD6okSEUqRmg6nNOWq4ZU?=
 =?us-ascii?Q?DPZKdQZKafY8+JSs8EQmkCqm9APsvMePl2PFIhoRCBqJ7Qj3zyg+YWgkBj39?=
 =?us-ascii?Q?F6VC92PwibzK8yNnv5bTc1QE5Au11fHs/ztJMvMIA+RwVHL2GkJhAttb+6Oa?=
 =?us-ascii?Q?CrW/BugXGCXCmK6eLWh8XTjCMhsxGdSUQEitYkff5axopnKh6FFCE7Itsm3q?=
 =?us-ascii?Q?18J6W2u4YKOuh+hXZ84p/fkvjl3GKt4svGnnmIRtMdHJnvuj477H2FlXJudZ?=
 =?us-ascii?Q?DUVPpsv4ts/cUH+LHCb6muqZraYoadqYHc1xbcPrUbCDW9Rd1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:53:39.4206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ed892f-1733-41b5-0301-08dd035c15d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191

In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
structure") a lock was moved from allocate_and_map_msi_pirq() to the
caller and changed from pcidevs_lock() to read_lock(&d->pci_lock).
However, one call path wasn't updated to reflect the change, leading to
a failed assertion observed under the following conditions:

* PV dom0
* Debug build (CONFIG_DEBUG=y) of Xen
* There is an SR-IOV device in the system with one or more VFs enabled
* Dom0 has loaded the driver for the VF and enabled MSI-X

(XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:535
(XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040284da8>] R pci_get_pdev+0x4c/0xab
(XEN)    [<ffff82d040344f5c>] F arch/x86/msi.c#read_pci_mem_bar+0x58/0x272
(XEN)    [<ffff82d04034530e>] F arch/x86/msi.c#msix_capability_init+0x198/0x755
(XEN)    [<ffff82d040345dad>] F arch/x86/msi.c#__pci_enable_msix+0x82/0xe8
(XEN)    [<ffff82d0403463e5>] F pci_enable_msi+0x3f/0x78
(XEN)    [<ffff82d04034be2b>] F map_domain_pirq+0x2a4/0x6dc
(XEN)    [<ffff82d04034d4d5>] F allocate_and_map_msi_pirq+0x103/0x262
(XEN)    [<ffff82d04035da5d>] F physdev_map_pirq+0x210/0x259
(XEN)    [<ffff82d04035e798>] F do_physdev_op+0x9c3/0x1454
(XEN)    [<ffff82d040329475>] F pv_hypercall+0x5ac/0x6af
(XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150

In read_pci_mem_bar(), the VF obtains the struct pci_dev pointer for its
associated PF to access the vf_rlen array. This array is initialized in
pci_add_device() and is only populated in the associated PF's struct
pci_dev.

Access the vf_rlen array via the link to the PF, and remove the
troublesome call to pci_get_pdev().

Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Candidate for backport to 4.19
Patch #1 ("xen/pci: introduce PF<->VF links") is pre-requisite

v6->v7:
* turn NULL-check into ASSERT
* adjust commentary in struct pf_info

v5->v6:
* add Jan's R-b

v4->v5:
* split the PF<->VF links to a pre-requisite patch
* pass pci_sbdf_t to read_pci_mem_bar()
* use stdint.h types on changed lines
* re-add NULL check for pf_info in read_pci_mem_bar(), as pf_info could
  be NULL

v3->v4:
* handle case when PF is removed with VFs enabled, then re-added with
  VFs disabled

v2->v3:
* link from VF to PF's struct pci_dev *

v1->v2:
* remove call to pci_get_pdev()
---
 xen/arch/x86/msi.c            | 36 ++++++++++++++++++++---------------
 xen/drivers/passthrough/pci.c |  8 +++++---
 xen/include/xen/pci.h         | 11 ++++++++---
 3 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index fa724911928e..e2360579deda 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -663,34 +663,34 @@ static int msi_capability_init(struct pci_dev *dev,
     return 0;
 }
 
-static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
+static uint64_t read_pci_mem_bar(pci_sbdf_t sbdf, uint8_t bir, int vf,
+                                 const struct pf_info *pf_info)
 {
+    uint16_t seg = sbdf.seg;
+    uint8_t bus = sbdf.bus, slot = sbdf.dev, func = sbdf.fn;
     u8 limit;
     u32 addr, base = PCI_BASE_ADDRESS_0;
     u64 disp = 0;
 
     if ( vf >= 0 )
     {
-        struct pci_dev *pdev = pci_get_pdev(NULL,
-                                            PCI_SBDF(seg, bus, slot, func));
         unsigned int pos;
         uint16_t ctrl, num_vf, offset, stride;
 
-        if ( !pdev )
-            return 0;
+        ASSERT(pf_info);
 
-        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
-        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
-        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
-        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
-        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
+        pos = pci_find_ext_capability(sbdf, PCI_EXT_CAP_ID_SRIOV);
+        ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
+        num_vf = pci_conf_read16(sbdf, pos + PCI_SRIOV_NUM_VF);
+        offset = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_OFFSET);
+        stride = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_STRIDE);
 
         if ( !pos ||
              !(ctrl & PCI_SRIOV_CTRL_VFE) ||
              !(ctrl & PCI_SRIOV_CTRL_MSE) ||
              !num_vf || !offset || (num_vf > 1 && !stride) ||
              bir >= PCI_SRIOV_NUM_BARS ||
-             !pdev->vf_rlen[bir] )
+             !pf_info->vf_rlen[bir] )
             return 0;
         base = pos + PCI_SRIOV_BAR;
         vf -= PCI_BDF(bus, slot, func) + offset;
@@ -704,8 +704,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
         }
         if ( vf >= num_vf )
             return 0;
-        BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
-        disp = vf * pdev->vf_rlen[bir];
+        BUILD_BUG_ON(ARRAY_SIZE(pf_info->vf_rlen) != PCI_SRIOV_NUM_BARS);
+        disp = vf * pf_info->vf_rlen[bir];
         limit = PCI_SRIOV_NUM_BARS;
     }
     else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
@@ -814,6 +814,7 @@ static int msix_capability_init(struct pci_dev *dev,
         int vf;
         paddr_t pba_paddr;
         unsigned int pba_offset;
+        const struct pf_info *pf_info;
 
         if ( !dev->info.is_virtfn )
         {
@@ -821,6 +822,7 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = slot;
             pfunc = func;
             vf = -1;
+            pf_info = NULL;
         }
         else
         {
@@ -828,9 +830,12 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = PCI_SLOT(dev->info.physfn.devfn);
             pfunc = PCI_FUNC(dev->info.physfn.devfn);
             vf = dev->sbdf.bdf;
+            ASSERT(dev->pf_pdev);
+            pf_info = &dev->pf_pdev->physfn;
         }
 
-        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        table_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir,
+                                       vf, pf_info);
         WARN_ON(msi && msi->table_base != table_paddr);
         if ( !table_paddr )
         {
@@ -853,7 +858,8 @@ static int msix_capability_init(struct pci_dev *dev,
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        pba_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir, vf,
+                                     pf_info);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index d4167cea09c0..2cd595f75ebf 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -730,7 +730,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         }
     }
 
-    if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
+    if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
     {
         unsigned int pos = pci_find_ext_capability(pdev->sbdf,
                                                    PCI_EXT_CAP_ID_SRIOV);
@@ -742,7 +742,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         {
             unsigned int i;
 
-            BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
+            BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) !=
+                                    PCI_SRIOV_NUM_BARS);
+
             for ( i = 0; i < PCI_SRIOV_NUM_BARS; )
             {
                 unsigned int idx = pos + PCI_SRIOV_BAR + i * 4;
@@ -757,7 +759,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                     continue;
                 }
                 ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
-                                       &pdev->vf_rlen[i],
+                                       &pdev->physfn.vf_rlen[i],
                                        PCI_BAR_VF |
                                        ((i == PCI_SRIOV_NUM_BARS - 1) ?
                                         PCI_BAR_LAST : 0));
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 977c0d08f78a..f784e9116059 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -159,9 +159,14 @@ struct pci_dev {
      * List entry if VF.
      */
     struct list_head vf_list;
-    u64 vf_rlen[6];
-    /* Link from VF to PF. Only populated for VFs. */
-    const struct pci_dev *pf_pdev;
+    union {
+        struct pf_info {
+            /* Only populated for PFs. */
+            uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
+        } physfn;
+        /* Link from VF to PF. Only populated for VFs. */
+        const struct pci_dev *pf_pdev;
+    };
 
     /* Data for vPCI. */
     struct vpci *vpci;
-- 
2.47.0


