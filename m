Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B1A2A4CB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 10:40:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882685.1292791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfyM9-0000Z0-KC; Thu, 06 Feb 2025 09:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882685.1292791; Thu, 06 Feb 2025 09:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfyM9-0000W2-H4; Thu, 06 Feb 2025 09:39:33 +0000
Received: by outflank-mailman (input) for mailman id 882685;
 Thu, 06 Feb 2025 09:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=liKN=U5=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tfyM6-0000Vu-Ul
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 09:39:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2416::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 411ec9d7-e46e-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 10:39:27 +0100 (CET)
Received: from PH8PR21CA0004.namprd21.prod.outlook.com (2603:10b6:510:2ce::11)
 by CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 09:39:21 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:510:2ce:cafe::7d) by PH8PR21CA0004.outlook.office365.com
 (2603:10b6:510:2ce::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.6 via Frontend Transport; Thu, 6
 Feb 2025 09:39:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Thu, 6 Feb 2025 09:39:20 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 03:39:17 -0600
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
X-Inumbo-ID: 411ec9d7-e46e-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOPlomlcB2hEh1kqc5+OAAQGiRzmnE0j6Hslzo9LJVXyhgLz8K3I/+ABpzOShSKNs87LcUFL3OCNXpAWRQr7XVX+XB/oaXWztORsCpSQW1K626R6yfVZUijk1+p8A6lD2FQJzyXX+/1c9kC/q/s4YO9dnf6GKKWK+xqUCI3FPr4RN7IqTjntbtMmN7y/fIDoXTJUYdfLqnaOLKZr2648lZddKwJTehKEioTbP7uMcSB04JT8eI4CV9gUW3EKB2XCk5xZvr+mvQbIuYdZYopw2vmW8YDTv5L5g03cNuO1SEtjlmBRUiS1Yb0S+7iHqChXWBLiVnZx95RfIES5XJl9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYFbZCbfAzd6TvW+5QxzSY2l5SGiwjv2aSHKJZTtvSc=;
 b=Z55/3mcRNta5XZiRr9sQIuFBlyOQcyaulTlqJ9PLzHRK8XwVyGZvD5mrS2nIijx6VXHWkx1Om3Vg0hhJz3B8NDUyQUp2jdZ+W1rlRPJGfvfM0pnB66SL/wFEuA4lItORyR1MPIz2swYLod0D1Ei0dw9oyn7RWUAisFKRFfna9vkuuUKxWb6fbpmT2ZLIa70vSnOER4j6Sx1fUdmEKNU8M8i083YgJLPPG9hfD1gv230p6IxsINjg1vFS8JW1g35f+Ir1nes6QyiJNwhcYeBbous/6QF6zyWz0K3dVJ/YoI4sV3kRKZk9qFUBa/4YgCAx02uIh8sddXYfy9yAdaSBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYFbZCbfAzd6TvW+5QxzSY2l5SGiwjv2aSHKJZTtvSc=;
 b=uu/M7EanGbIi7niOXo42mNiSDzI423GAvPgDDNtGoq4aUQ+2ikOX78R22RbPhR7z4/6w33ue777Hw0IUX0uTCATBKofntylGkPNcW+0zkUQtNtrLvfW1q0lIFTYwWpTc3ArO+QX0zjmM2/55duM7K2Wd7hN8m/b8JcpUEtaJAhw=
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
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Huang Rui
	<ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [PATCH v7] vpci: Add resizable bar support
Date: Thu, 6 Feb 2025 17:39:00 +0800
Message-ID: <20250206093900.1410342-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fd61e2-bad0-432c-a3e8-08dd469221d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XMFfgZYXnylg8MVgALtxCNNVbWSs5nppg6ZFpd+6NlNicR3cikfuoZXrkWUk?=
 =?us-ascii?Q?3mrQOftXNARsjYXwCAoXZD/U8TOATSJdGW9372ir830qmFn0czgZGqAkhnjL?=
 =?us-ascii?Q?eN5VQloC/UgRpr/V/vtuZGka6yHM2fPV3kpu1MYwZPL5lvaDj1SC4SmS/qyN?=
 =?us-ascii?Q?Vi/MuuiBmh8xsHj7wplgm5+PxtCeb85JblP74JBaCgW6xOrOSuDgvYsZxI3S?=
 =?us-ascii?Q?IKoC38f7r+aeCO7M6joqT3d+eK2auxFzG0ImdI3GUDDHcS9L+madjfl9590E?=
 =?us-ascii?Q?xPmoehhCgzdP6Dblpk5E+nKrBzya2on8gVyuBfIjoquQYk49Au7zPHZ5CL//?=
 =?us-ascii?Q?mX5qDLwMMEISZCkIfh8pX5pSI6yYzdUhZjdSpz3gpguVPuPlWXmQI2XUn3Uv?=
 =?us-ascii?Q?HcnUuJseZ0fFnJk+UM9cOFokg+d5QU42DRXv0yzi8VX0jqwciLbtRl/kiF0t?=
 =?us-ascii?Q?OpGG5PAR1FngoTLmUIfyDRPZQxDeiYctjDg1/6Cb5Lr1tJUgdBpaOPCoCZY3?=
 =?us-ascii?Q?2gumxOefpRSWuxAy7MgfEDNvuG8/Lc4Dc1g6fVZ8mayRukXYN8FaSTElcLnq?=
 =?us-ascii?Q?9OZo91mFVxJ7yEFynNDKakofqjE9frIYXQ9N+BTGVwSOnUck6HcP4I3bc82I?=
 =?us-ascii?Q?HIKC/Q1ywpfDfJ8sVYRCia+lUnevd7UQ0v/vFN2zGxptsDXLtthYWzz54nfD?=
 =?us-ascii?Q?pkgzgRP9ywKA9Cek7wbpVoNbkPbwKltSUTI0QGQaKEqbdQdZdqc4A7K3QJwc?=
 =?us-ascii?Q?Jw/KPxX0Bc5HyHuWEzPd6pFN2iSjMJ5ZSSVJdW25KPUc9UetSMcNKOBtdi7E?=
 =?us-ascii?Q?docrXctA+uG5jkSavPS1dSIAUAYphNlFO0QP1mfYQUfdIz3jda59ie/aNNxm?=
 =?us-ascii?Q?waBEL+QuFe1EQ9NbzoitakzZXJ2W/6rFo+pNiNKU1TOwrEphUzqILjKfYw5n?=
 =?us-ascii?Q?Ak47CK47EOjE2q3NB+Ge/gPgAw8rP+C3mm/HKLaJ021DKH9/OPGp/eJT/ig2?=
 =?us-ascii?Q?MqSnBwHU9TXNl/HBUU0GPLOeFmn6DkgnknFsi01rZEquX3cfQtK1KwNu3Bf5?=
 =?us-ascii?Q?JK25rTyAAFPevBgK86HkEDA1mpLWk1jOrJ2bT/6ABLuo1FT6rxOt+QPAMORB?=
 =?us-ascii?Q?o+A/TQ8DTllazvhtsY1NlCIDgJJ2KpthKw3I1l9fi6Iy86xHBiOxgOHD+uhk?=
 =?us-ascii?Q?rR/mByFCMJb0Qfp6MaR+37455cjpvbQvWdgCAAhdZ7t7EbNsm1uAlQSWYvFj?=
 =?us-ascii?Q?NVcCnGwlLKsTFFJn6YP45cWRl+ZmJVVH1xy9YBLiBR2fvrOihfdqNFQtZJlt?=
 =?us-ascii?Q?o8LhIPZxb/4DYcvo9g/R0d8dV4ddnUCqW3YiBhuobFBDzNekMFISX5hWL1QP?=
 =?us-ascii?Q?aEqGbOLSvLz5oyMXNi1WC4SypuoUVtfRx5qrq9d7aNMMwCgUAxzZ945uEvK9?=
 =?us-ascii?Q?vpEytVS8aGjLRuqbmBU486bCWpLf9uywma+tBvl+Lmr5yiHs+L7PyY8/50YX?=
 =?us-ascii?Q?O0fH9pZwZqYvGEc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:39:20.1250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fd61e2-bad0-432c-a3e8-08dd469221d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730

Some devices, like discrete GPU of amd, support resizable bar
capability, but vpci of Xen doesn't support this feature, so
they fail to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers for them to support resizing the size of BARs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,
v6->v7 changes:
* Deleted codes that add register for PCI_REBAR_CAP, and added comments to explain why.
* Added comments to explain why use "continue" when fail to add register for PCI_REBAR_CTRL.

Best regards,
Jiqian Chen.

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
 xen/drivers/vpci/Makefile  |   2 +-
 xen/drivers/vpci/rebar.c   | 136 +++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c    |   6 ++
 xen/include/xen/pci_regs.h |  15 ++++
 xen/include/xen/vpci.h     |   3 +
 5 files changed, 161 insertions(+), 1 deletion(-)
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
index 000000000000..64b56a9567fa
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,136 @@
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
+        /*
+         * Here not to add register for PCI_REBAR_CAP since it is read-only
+         * register without other specific operations, and hardware domain
+         * has no limitation of read/write access to all PCI config space.
+         */
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
+                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
+                   pdev->domain, &pdev->sbdf, index, rc);
+            /*
+             * Ideally we would hide the ReBar capability here, but code
+             * for doing so still needs to be written. And using continue
+             * can keep any possible hooks working, instead, returning
+             * failure would cause all vPCI hooks down and hardware domain
+             * has entirely unmediated access to the device, which is worse.
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


