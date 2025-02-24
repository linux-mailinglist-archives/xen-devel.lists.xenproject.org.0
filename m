Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2BCA413F8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 04:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894938.1303571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmP6U-0005XD-11; Mon, 24 Feb 2025 03:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894938.1303571; Mon, 24 Feb 2025 03:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmP6T-0005VS-SH; Mon, 24 Feb 2025 03:25:57 +0000
Received: by outflank-mailman (input) for mailman id 894938;
 Mon, 24 Feb 2025 03:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bXv=VP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tmP6R-0005VM-Ne
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 03:25:55 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2417::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b8ea335-f25f-11ef-9aad-95dc52dad729;
 Mon, 24 Feb 2025 04:25:51 +0100 (CET)
Received: from BN9PR03CA0083.namprd03.prod.outlook.com (2603:10b6:408:fc::28)
 by BN7PPF02710D35B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 03:25:42 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::b4) by BN9PR03CA0083.outlook.office365.com
 (2603:10b6:408:fc::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Mon,
 24 Feb 2025 03:25:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 24 Feb 2025 03:25:41 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 23 Feb
 2025 21:25:07 -0600
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
X-Inumbo-ID: 0b8ea335-f25f-11ef-9aad-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQGIcNFEwZN3uZKhjbIZbq+Xg5XbOM4AhzpLTZUwMAtz1Q0XXMVzydTrLHsvtw/6D/4sgOCF4T3QAofakEMkllk70kg/Pgu3ft3C4wfTmR6p+C+z0CiJf1ncwopxM4jxFdNI7YRfVMiYKbknNCRvAVI/bkWlVw94+59Ub3QUC/KsEuL3OQdxLBeTK7rPQVPL2utRTEL3P1xoztB4KHrs4XpLvLrHyVXuViYoqBFOXKO1xRKjkGj28imiQ12eXyDL9+ULZqBxiOI3vizLeAFaLBuo8WQ8qniJftCcamRKXvUFeJhNU0fzgSUv28xGHGuXyez3hRD0ZMX2QtxW0NzzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4E6DEBN6QUaECQBgfCHA2q9nN5ExWic7Y1WuyB0eQRM=;
 b=rEY+nANi5pnch7HAYPvKLldBf4KjARhBJPjPX/k9ZmuDBmNtVeYkPo6HsdHV52q71NeUE1c/JuYHPy/rPM4E0R3IBY3JBfEMSw/SX2eUPNhaQ3hvOMBMLBsCeuNgnX8VnOx1uIZJM/CYrGZVFUI0DTMHXo2GZCZhDK13uZqhJuvX+AeH/EcbjuEE849Gtg19yn2nXGfz/HUsXa6+OGWmQk4qNgfamVrXJ81+3MVEYcsqfAt/UcayDloi+RaxP3yNbbBPcHl0kqhrSnAfFYCTfUkwuxneczowBZteYBcJ77VWjzqd5+av9I0+4N9M5cXH0HUmDr+aG7bvzpN+1z9r5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4E6DEBN6QUaECQBgfCHA2q9nN5ExWic7Y1WuyB0eQRM=;
 b=si4fy5NuYH9s2R5iZwAkyKx4M7FLRa+ooohbOKwFdyLnJqiFU2IhKb/0E8iA2QKqn6DIppV2ymyrynevMtt5cGM/fsF4zHKe6ip7BwoZfytiAjmVKlGQ4bLqIPuSyEjKpcTP4/iFNOQQb6VAYdl90s+b0DRhrcOFlI/4iNQQKjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Huang Rui
	<ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [PATCH v9] vpci: Add resizable bar support
Date: Mon, 24 Feb 2025 11:24:33 +0800
Message-ID: <20250224032433.1879630-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|BN7PPF02710D35B:EE_
X-MS-Office365-Filtering-Correlation-Id: e99360ec-db16-4414-86a6-08dd5482ead2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GFEB0CRRW+8cbVWDkLZ1JtlqEKZ8NsWs2gbxNTuX3Gl49rnnM3UY5MV/PKZG?=
 =?us-ascii?Q?foKxS1U/FWwLG7MWUiaNfBXLo4Gi7+Q1DwIzgCfjT3cMCJRpbQ/nP+l6FZie?=
 =?us-ascii?Q?XIZDf0ZHDU2dcYgtQGtfVxYrjCbuw0hP0lCR6nTvRZ2bcJNL/u5p0pY8q4Lu?=
 =?us-ascii?Q?ZzlbmWf74L0YgSOxhnGG3OemUOhk5lVR832bzTNny9uUelA8WzAQKzO8hYeL?=
 =?us-ascii?Q?b3RV1iwxuoDsPkLSrW0kMHR9noySG+vcVk/oX7FTsrYmQvmnOeBKJ5dvrdif?=
 =?us-ascii?Q?WKMOS4oA0eyOLzpzzoi/XXLpSyF5tsYaFy+/LQ4JvCiM+fXy6dTLL6BDOZEL?=
 =?us-ascii?Q?IZSrsiUrNZxXYpMLlNbude5AzGKTpL9Msz+bDStaRozXr4dfKiu3wD+2dvko?=
 =?us-ascii?Q?Eg/lDqXzGndc260fIp0LqGgfs/cMSHeuqzjj9YkiydK0v8wNywvh+l1617WE?=
 =?us-ascii?Q?F65VEC1kFlBX2T0QBzFK94UdwQAKDtXBWDfq/69UEWCekThFE6BQAw9Xve+4?=
 =?us-ascii?Q?Qu7NMuCewOLi5mLMHVvJmWbgIZ0hQtAfiCIcmxQ3tI1N64GRgMpN6mTCQ6HH?=
 =?us-ascii?Q?ayKw4+Hez4JrmQF+Woo8sbEtubuekGU3n2028BLs99uWacRw9AhGy1PxJQEC?=
 =?us-ascii?Q?sMHGgeQH1fYl673nIDX/ROCXBVMUjun1xwO0xgLSyuy1iDoau02cHAdDuv4K?=
 =?us-ascii?Q?BuyHi3LCf3jiuwnVqLViQPDMfQ1ZBoeeuCExDTe6IHAXKxfFWjYRCnMnRz69?=
 =?us-ascii?Q?HvBVZVNmRo4Qrjas8bowEKh/+k7nNPaLd9rz7mWFGvvg2Xjec5D67x/qlUPA?=
 =?us-ascii?Q?uWz6PHwUQUBN8m3kXH41gaeivTBaAvtbKX6eeC54iL/GzEb21OpxbR4S9fds?=
 =?us-ascii?Q?6EVinT+iDbuY378ow3J/Nb25WFQPSrFjZOZLpOv1t5tMUbb6FPRIRGrcD5QE?=
 =?us-ascii?Q?acWpdGc7FDKGs2Fs7AlpsbZLjn9CwGZsLOL3Xo3xMk481qQN3agjuaiZG8DM?=
 =?us-ascii?Q?xjVosA5rcg8AzD5arbXKnUGG+eMbhb5kKqur2yDXM+HCT5XgPfVV6kSbQIlV?=
 =?us-ascii?Q?rMHnNificsqPWqUAFovdpKCL2GvOEo3ovsN3XRMwCr7b+AaW+baZv7k7IcT/?=
 =?us-ascii?Q?Ug1YxCHgIpTFebxnz1nGjBon9WayVAfCKgBCnomIamzlvqxaLCaCbNumw9HA?=
 =?us-ascii?Q?wQoXG8hSjz4UC9mI44hJ8pcfwtxJPKIe+mYPzRlLs0SgPCp1KIphg6xOPPL8?=
 =?us-ascii?Q?LbPsvLjqofDKXvB/IlseP4Id1cwY7Ld6mkv0gqrz88gH+p4M3xzAyKFDjuaL?=
 =?us-ascii?Q?ofx2g/zfKwpc4909IIJHkzhwtG9yDVJGF1SxZxI8+gVHMc7drs7SxalMxtry?=
 =?us-ascii?Q?NF3lXjKoR2+wSBhMwIWp7HD3zTuBXL8qKw/J+dlIzsbs0G7sfYuPi1zv4NXV?=
 =?us-ascii?Q?3o65ine8ZR4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 03:25:41.8156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e99360ec-db16-4414-86a6-08dd5482ead2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF02710D35B

Some devices, like AMDGPU, support resizable bar capability,
but vpci of Xen doesn't support this feature, so they fail
to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers to support resizing the size of BARs.

Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
is read-only register and the hardware domain already gets
access to it without needing any setup.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,
v8->v9 changes:
* Changed "size" to be const in function rebar_ctrl_write.
* Delete sentence that describes PVH dom0 doesn't support resizable BARs in
  SUPPORT.md since this patch is to support it
* Added an entry to CHANGELOG.md to note Rebar is supported for PVH dom0.

Best regards,
Jiqian Chen.

v7->v8 changes:
* Modified commit message and some comments.
* Deleted unused function vpci_hw_write32.

v6->v7 changes:
* Deleted codes that add register for PCI_REBAR_CAP, and added comments to explain why.
* Added comments to explain why use "continue" when fail to add register for PCI_REBAR_CTRL.

v5->v6 changes:
* Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
* In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
  from register.
* Added the index of BAR to error messages.
* Changed to "continue" instead of "return an error" when vpci_add_register failed.

v4->v5 changes:
* Called pci_size_mem_bar in rebar_ctrl_write to get addr and size of BAR instead of setting
  their values directly after writing new size to hardware.
* Changed from "return" to "continue" when index/type of BAR are not correct during initializing
  BAR.
* Corrected the value of PCI_REBAR_CTRL_BAR_SIZE from "0x00001F00" to "0x00003F00".
* Renamed PCI_REBAR_SIZE_BIAS to PCI_REBAR_CTRL_SIZE_BIAS.
* Re-defined "PCI_REBAR_CAP_SHIFT 4" to "PCI_REBAR_CAP_SIZES_MASK 0xFFFFFFF0U".

v3->v4 changes:
* Removed PCI_REBAR_CAP_SIZES since it was not needed, and added
  PCI_REBAR_CAP_SHIFT and PCI_REBAR_CTRL_SIZES.
* Added parameter resizable_sizes to struct vpci_bar to cache the support resizable sizes and
  added the logic in init_rebar().
* Changed PCI_REBAR_CAP to PCI_REBAR_CAP(n) (4+8*(n)), changed PCI_REBAR_CTRL to
  PCI_REBAR_CTRL(n) (8+8*(n)).
* Added domain info of pci_dev to printings of init_rebar().

v2->v3 changes:
* Used "bar->enabled" to replace "pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY",
  and added comments why it needs this check.
* Added "!is_hardware_domain(pdev->domain)" check in init_rebar() to return EOPNOTSUPP for domUs.
* Moved BAR type and index check into init_rebar(), then only need to check once.
* Added 'U' suffix for macro PCI_REBAR_CAP_SIZES.
* Added macro PCI_REBAR_SIZE_BIAS to represent 20.
TODO: need to hide ReBar capability from hardware domain when init_rebar() fails.

v1->v2 changes:
* In rebar_ctrl_write, to check if memory decoding is enabled, and added
  some checks for the type of Bar.
* Added vpci_hw_write32 to handle PCI_REBAR_CAP's write, since there is
  no write limitation of dom0.
* And has many other minor modifications as well.
---
 CHANGELOG.md               |   2 +
 SUPPORT.md                 |   2 +-
 xen/drivers/vpci/Makefile  |   2 +-
 xen/drivers/vpci/rebar.c   | 131 +++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  15 +++++
 xen/include/xen/vpci.h     |   1 +
 6 files changed, 151 insertions(+), 2 deletions(-)
 create mode 100644 xen/drivers/vpci/rebar.c

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1979166820a8..9659dc2df9a1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
 
 ### Added
+ - On x86:
+    - Resizable BARs is supported for PVH dom0.
 
 ### Removed
 
diff --git a/SUPPORT.md b/SUPPORT.md
index e1f4769bd8b5..91cb6f8ed264 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -170,7 +170,7 @@ unexpected behavior or issues on some hardware.
 
 At least the following features are missing on a PVH dom0:
 
-  * PCI SR-IOV and Resizable BARs.
+  * PCI SR-IOV.
 
   * Native NMI forwarding (nmi=dom0 command line option).
 
diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 1a1413b93e76..a7c8a30a8956 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1,2 +1,2 @@
-obj-y += vpci.o header.o
+obj-y += vpci.o header.o rebar.o
 obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
new file mode 100644
index 000000000000..793937449af7
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Author: Jiqian Chen <Jiqian.Chen@amd.com>
+ */
+
+#include <xen/sched.h>
+#include <xen/vpci.h>
+
+static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
+                                      unsigned int reg,
+                                      uint32_t val,
+                                      void *data)
+{
+    struct vpci_bar *bar = data;
+    const unsigned int index = bar - pdev->vpci->header.bars;
+    const uint64_t size = PCI_REBAR_CTRL_SIZE(val);
+
+    if ( bar->enabled )
+    {
+        /*
+         * Refuse to resize a BAR while memory decoding is enabled, as
+         * otherwise the size of the mapped region in the p2m would become
+         * stale with the newly set BAR size, and the position of the BAR
+         * would be reset to undefined.  Note the PCIe specification also
+         * forbids resizing a BAR with memory decoding enabled.
+         */
+        if ( size != bar->size )
+            gprintk(XENLOG_ERR,
+                    "%pp: refuse to resize BAR#%u with memory decoding enabled\n",
+                    &pdev->sbdf, index);
+        return;
+    }
+
+    if ( !((size >> PCI_REBAR_CTRL_SIZE_BIAS) & bar->resizable_sizes) )
+        gprintk(XENLOG_WARNING,
+                "%pp: new BAR#%u size %#lx is not supported by hardware\n",
+                &pdev->sbdf, index, size);
+
+    pci_conf_write32(pdev->sbdf, reg, val);
+
+    pci_size_mem_bar(pdev->sbdf,
+                     PCI_BASE_ADDRESS_0 + index * 4,
+                     &bar->addr,
+                     &bar->size,
+                     (index == PCI_HEADER_NORMAL_NR_BARS - 1) ?
+                      PCI_BAR_LAST : 0);
+    bar->guest_addr = bar->addr;
+}
+
+static int cf_check init_rebar(struct pci_dev *pdev)
+{
+    uint32_t ctrl;
+    unsigned int nbars;
+    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
+                                                        PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset )
+        return 0;
+
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
+               &pdev->sbdf, pdev->domain);
+        return -EOPNOTSUPP;
+    }
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+    for ( unsigned int i = 0; i < nbars; i++ )
+    {
+        int rc;
+        struct vpci_bar *bar;
+        unsigned int index;
+
+        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
+        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
+        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
+        {
+            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
+                   pdev->domain, &pdev->sbdf, index);
+            continue;
+        }
+
+        bar = &pdev->vpci->header.bars[index];
+        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
+        {
+            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
+                   pdev->domain, &pdev->sbdf, index);
+            continue;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
+                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
+                   pdev->domain, &pdev->sbdf, index, rc);
+            /*
+             * Ideally we would hide the ReBar capability on error, but code
+             * for doing so still needs to be written. Use continue instead
+             * to keep any already setup register hooks, as returning an
+             * error will cause the hardware domain to get unmediated access
+             * to all device registers.
+             */
+            continue;
+        }
+
+        bar->resizable_sizes =
+            MASK_EXTR(pci_conf_read32(pdev->sbdf,
+                                      rebar_offset + PCI_REBAR_CAP(i)),
+                      PCI_REBAR_CAP_SIZES_MASK);
+        bar->resizable_sizes |=
+            (((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES_MASK) << 32) /
+             ISOLATE_LSB(PCI_REBAR_CAP_SIZES_MASK));
+    }
+
+    return 0;
+}
+REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 250ba106dbd3..2f1d0d63e962 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -459,6 +459,7 @@
 #define PCI_EXT_CAP_ID_ARI	14
 #define PCI_EXT_CAP_ID_ATS	15
 #define PCI_EXT_CAP_ID_SRIOV	16
+#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
 
 /* Advanced Error Reporting */
 #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
@@ -541,6 +542,20 @@
 #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
 #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
 
+/* Resizable BARs */
+#define PCI_REBAR_CAP(n)	(4 + 8 * (n))	/* capability register */
+#define  PCI_REBAR_CAP_SIZES_MASK	0xFFFFFFF0U	/* supported BAR sizes in CAP */
+#define PCI_REBAR_CTRL(n)	(8 + 8 * (n))	/* control register */
+#define  PCI_REBAR_CTRL_BAR_IDX		0x00000007	/* BAR index */
+#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0	/* # of resizable BARs */
+#define  PCI_REBAR_CTRL_BAR_SIZE	0x00003F00	/* BAR size */
+#define  PCI_REBAR_CTRL_SIZES_MASK	0xFFFF0000U	/* supported BAR sizes in CTRL */
+
+#define PCI_REBAR_CTRL_SIZE_BIAS	20
+#define PCI_REBAR_CTRL_SIZE(v) \
+            (1ULL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
+                      + PCI_REBAR_CTRL_SIZE_BIAS))
+
 /*
  * Hypertransport sub capability types
  *
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 41e7c3bc2791..807401b2eaa2 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -100,6 +100,7 @@ struct vpci {
             /* Guest address. */
             uint64_t guest_addr;
             uint64_t size;
+            uint64_t resizable_sizes;
             struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
-- 
2.34.1


