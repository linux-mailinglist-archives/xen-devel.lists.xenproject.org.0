Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9AA19D6C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 04:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876076.1286443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taoGU-0008MA-Q8; Thu, 23 Jan 2025 03:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876076.1286443; Thu, 23 Jan 2025 03:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taoGU-0008J5-Ko; Thu, 23 Jan 2025 03:52:22 +0000
Received: by outflank-mailman (input) for mailman id 876076;
 Thu, 23 Jan 2025 03:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MUd8=UP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1taoGT-0008Ij-Hx
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 03:52:21 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2413::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70bda8f3-d93d-11ef-a0e5-8be0dac302b0;
 Thu, 23 Jan 2025 04:52:19 +0100 (CET)
Received: from CH5P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::18)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 03:52:14 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::18) by CH5P221CA0024.outlook.office365.com
 (2603:10b6:610:1f2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Thu,
 23 Jan 2025 03:52:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 03:52:13 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 21:50:38 -0600
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
X-Inumbo-ID: 70bda8f3-d93d-11ef-a0e5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weUNKG+Xx3qY42Wu5aHdUKrv0RnXOep5BTAppy8WHq7mgRCG4OWfnsWm+UuKn9KD288yUggsNRG/Wudc9Cc6kNIcE64l48o+afb/4oz9cKyP2tlQ9F4IfuVjzKFG54X3wcLxTjkCeFStM2g6FJ48Lo/gIjn+nlTCOd5NNOEGsS3De/5UMbMG/buBqiewlXeA+5SSfYswUebd36u/kB0dAuaEL9+45cZDFCkzIMZw4VImg9O6HMdoQUo9qrrFmOA9NwPs/lfGLGjjoOv1//vxyVAcVJ8Inpjj7AKERDXeRRYGrUGtAx4fiKmReU+1mOIcRNCl6LVnhgXoefnM/wprMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL53AitgXp0lFybZ1hpKhN095kelGWUaiTE/qW8VedM=;
 b=Wd0dlfh0rNbYfvLkdyNeP5y8bt70v0X67wYhFP7VL0VmF6pTaox4CNL/9KeDkERbt6UbKB8ZHay6Zxrqlhr5u/pUZKcPklRXmCg5WtblexIerAPNC45CFvXAMTpUPUyJ4kZ62HCt1/Vi7C5W4q97srZfRmDt0RuXAiF6KQdiazHzCj2D/UxfMYeYdG2JyFhAmrv1n2IOHysaEvOPamJh9CV9P+VEgekYKMeObcLcWCFPbRg+NTX0Gsc0CXAqjmMP2QD+UNZxwD2JsI/hm+FVfWgsEXnjI82JcXEJ15cgkKgaVVvjJjXM0AISK3esq2l/klDfyVOHdMxM0nSkYR+P9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL53AitgXp0lFybZ1hpKhN095kelGWUaiTE/qW8VedM=;
 b=IjvBfwdm/uSZyqRJXLctmD5Wr9nLutqusBkFa8eh9acfn3sqTNiCKO5clDGfpzFAs7CJ/K7G7Gsx0dvCstB9KOo8LsgIJ7JRZK31AdOelFOo5OOu62fMalVgyJ00VDsZzTtDfI/Yfg7n+K4wwUmGYrONPOkNd0OtmD/nuidFuYA=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Huang Rui
	<ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [PATCH v6] vpci: Add resizable bar support
Date: Thu, 23 Jan 2025 11:50:03 +0800
Message-ID: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|DS0PR12MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aebafcc-7c94-428b-a8a2-08dd3b61523c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e15w1tMQ6W8IuhjJD1lQUSmlt9lxtVREdyy1vn2PaDoRbDjgyhFyN4P2FJ+h?=
 =?us-ascii?Q?doN85qxvGBXr+Xl6WnEVBBGfg1wDW8JUbROTu1wVT2z7IkriE0Z99LeZce+b?=
 =?us-ascii?Q?9MoXqTG5roxbfrSx2xkXBY2djbMk6oXkoC+o71NmWR7bwLpQFkW+d/I2ASno?=
 =?us-ascii?Q?gf2k0OuXQwDgSxrov34ZR5m+XzLYixV6oAkjQO747Kz1eECXgMcFiGyIKEfZ?=
 =?us-ascii?Q?lVmQ6yH8mdYpyFYbhYpQWfjZl/g/kIomvWwtk0R/MegM2SAyRKufB5B53Bae?=
 =?us-ascii?Q?Q1Ir90KMuowGxSmYvXgzSIhY8UxNF8jP7GEy2lJtBFH7vtMgdgTDbayFcD/o?=
 =?us-ascii?Q?r7cJc+f7SsFFuuMQFrj3g5pbK1Qc9B8n308T8BMX8pGyLinBTR1JlU0N5EjY?=
 =?us-ascii?Q?diqLQcG8DveftvVmqXW6hYtgxHSfzFTig+BU0Y9c4lAy9JInylkwvb1zzaND?=
 =?us-ascii?Q?pxMOWaQPhhoTIpQn4HkWx2xolejDNfYmzh8wZi8a0aX1W6CElJd8AtVG7U2U?=
 =?us-ascii?Q?YvuNQi5Qt4rc+nTkgRfx08pGFTB6pNLQ+GiIfM8DheMjHd4ROSx2/HX6/QUt?=
 =?us-ascii?Q?S5L9znoLZ/KndwFpl+pOPGIAVtAd0d9ZYxJUHcc9yvkxprQwXO6bkk77WdFF?=
 =?us-ascii?Q?hSL3zmLXUao2mmWqHggPi4Sa6ds1pnzYqmbU1x0AmsO2U3aSXd/fAGgXW4kC?=
 =?us-ascii?Q?Hb6m/M6A22I5w61eZA13PgsNxItCBoG3iw4SXbJWdZ3NEoIO8di+eBe2wFfp?=
 =?us-ascii?Q?uV5FrzUKdBp6gA113oZbWQSHeJXVxX7EaZWyktFuKQcNI03a9iJXsEONiVQH?=
 =?us-ascii?Q?90bHdXjZep4OUwyXgMfJSUj7+n4D7M+3BbXTTdgN0mYpBsihTXqox095yghu?=
 =?us-ascii?Q?xrIKa4VDFVgXKBNwKoEbuETlxNnYxe1V/yhPW4h85ktZDHtPHRuukLVBLNAf?=
 =?us-ascii?Q?1TuvmGoKxmmB83hyGOPRycqSVfH19snCmLyzyly2bn9lO94aDMXKO5sJ7O04?=
 =?us-ascii?Q?mncQjgtPCZ3qiDJLto97Vsy2MR5N2z9MZFIOEO8JLq1/4jBoLzmu4ThKiw2H?=
 =?us-ascii?Q?FV9ew0ya7uQTHl/1pC76jMriyjWUrOy2PuEANtK0P0UFHlDLM3+P+J3Lz6CM?=
 =?us-ascii?Q?NUvWDN2LOBhH4s1lkXsjv4SfEIsBOTq7c+J6rfUVK9lUoJWYBo0NOT7oe6ws?=
 =?us-ascii?Q?Jb2UMZ7eqwUgiYZ2AO+ZM8PpjT0ZC1bMq+V7BZ38RZkKpQIOyT46AYNbyTN7?=
 =?us-ascii?Q?p/PXcyrfJW1QNoALM4Y2U4JzjjPxEmkHSajK+JxoPdPOpBkYPBHOIDxuRwLb?=
 =?us-ascii?Q?P7MX/dVMMsCG5XnW88ekC5UkykwjwsQCuicfTrB8nA7q22bPn0s/N+F9BIKg?=
 =?us-ascii?Q?M8riBJpL4byuHyyksr5R4mNBOG26W+4U66/pNzWWffhOjWVAHETiMLc/6Abl?=
 =?us-ascii?Q?4BrmVMnE3GpsX9PPVI2HWtw4fB0EZhk27nfsmeUIy71tY1wjGFLEnEn97AxX?=
 =?us-ascii?Q?a/uhLAiSz+crqOw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 03:52:13.2958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aebafcc-7c94-428b-a8a2-08dd3b61523c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037

Some devices, like discrete GPU of amd, support resizable bar
capability, but vpci of Xen doesn't support this feature, so
they fail to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers for them to support resizing the size of BARs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,
v5->v6 changes:
* Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
* In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
  from register.
* Added the index of BAR to error messages.
* Changed to "continue" instead of "return an error" when vpci_add_register failed.

Best regards,
Jiqian Chen.

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
 xen/drivers/vpci/Makefile  |   2 +-
 xen/drivers/vpci/rebar.c   | 137 +++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c    |   6 ++
 xen/include/xen/pci_regs.h |  15 ++++
 xen/include/xen/vpci.h     |   3 +
 5 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 xen/drivers/vpci/rebar.c

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
index 000000000000..8c611cf0cd91
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,137 @@
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
+    uint64_t size = PCI_REBAR_CTRL_SIZE(val);
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
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
+                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
+        if ( rc )
+        {
+            /*
+             * TODO: for failed pathes, need to hide ReBar capability
+             * from hardware domain instead of returning an error.
+             */
+            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CAP rc=%d\n",
+                   pdev->domain, &pdev->sbdf, index, rc);
+            continue;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
+                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
+                   pdev->domain, &pdev->sbdf, index, rc);
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
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..3349b98389b8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
     pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
 int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
                            vpci_write_t *write_handler, unsigned int offset,
                            unsigned int size, void *data, uint32_t ro_mask,
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
index 41e7c3bc2791..9d47b8c1a50e 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -78,6 +78,8 @@ uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
@@ -100,6 +102,7 @@ struct vpci {
             /* Guest address. */
             uint64_t guest_addr;
             uint64_t size;
+            uint64_t resizable_sizes;
             struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
-- 
2.34.1


