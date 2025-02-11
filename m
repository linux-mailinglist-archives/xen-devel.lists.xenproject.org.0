Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD7A3016D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 03:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885075.1294852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thfwr-0004Sx-S8; Tue, 11 Feb 2025 02:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885075.1294852; Tue, 11 Feb 2025 02:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thfwr-0004Pp-OV; Tue, 11 Feb 2025 02:24:29 +0000
Received: by outflank-mailman (input) for mailman id 885075;
 Tue, 11 Feb 2025 02:24:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRmH=VC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1thfwp-0004Pj-Qr
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 02:24:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2418::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d6bdccc-e81f-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 03:24:21 +0100 (CET)
Received: from LV3P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::21)
 by BL1PR12MB5923.namprd12.prod.outlook.com (2603:10b6:208:39a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 02:24:16 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::a2) by LV3P220CA0028.outlook.office365.com
 (2603:10b6:408:234::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 02:24:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 02:24:15 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 20:23:31 -0600
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
X-Inumbo-ID: 4d6bdccc-e81f-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auDZsPH2Eglc5b+bbU4HfAGEUii1xTRfka1ThRkKFuqKCcqIuNn70udH0x/LrQ15CD99Hp/u0F13WGQk7h6Cvx9YoYh2KlU3CNZ8w5lLzt7IQDgY7Ncawu6WwzL8TH8bhQNrOqI0glj/xDpS215QyZbsYkskO89JV9DWMZkfap0b9j7sLvOOcWsndIafs5CInkbKhW230CMEBKLJnDD1fVI9vM3IILyBz7yktBS2vLAGj2BxvAs4pUbk7oZJR6b1lWL1aIl5Q5ji+FA3AQEIS6RR3ZvE41fv95sAiEl7FU0YEKUCUh3vUyyqFodpQsdQZAIsIS4kJY6tu9z46OEydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX/JHyVq3gDs4SD3lHE5ZYlSClGeTpMq9hPNgTDIqwc=;
 b=lOg6iTpcjpupHxUHiBGsuDQyt94z7PEUeN6ePjclFpih/QrcwG39YOT73KCwxT9KTevpDcqehbQlstf1H6+y9CwEu759clbZdhf+rFZZybbnwE1MRbCebjpSqeVUJS9P+kmhHSB3l/nOJbI4lWg53TtXX0e6yWpP7pOraQxPBGXbSYbGH8WgLQ2g+/qd9tI7hh6NOZ53qVQw6rfvrenQruzLVo2py44UVRMKXLGUd2qLDlJm/7IiznaNkEY6IiRNYcayvq2S/4JoOArwUl4gtFNRCZxz55ueFxn1qF9ulvrjFqgnEhqcwtxggXZgTRGdWieAu2oF19qeNLzVcA1PSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX/JHyVq3gDs4SD3lHE5ZYlSClGeTpMq9hPNgTDIqwc=;
 b=VEs0KsvHIiXU10dQti1aokLAlgTkBwd/2v75e/RXbKAXWfEwx7K5BP8VSrqkEGvu31gd68SnxFPDAniwtCdEM5yb2/SltPtT8U1L1llymf4gflIY9l2QtBqwRKfIdYSZPK5h+Mvwem2+9O5uvudIDwb5CZVoEGOw+gstQCFD6cw=
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
Subject: [PATCH v8] vpci: Add resizable bar support
Date: Tue, 11 Feb 2025 10:22:57 +0800
Message-ID: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|BL1PR12MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 60154e80-4d74-4873-a6d8-08dd4a432e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9GCpAFU3ytGS87DwP95M4LoP0e8LQlx0hMwwrGI6YWI13V9MiOto92MK2NDe?=
 =?us-ascii?Q?xosyZhwtMvmN2bxMMMXLG6bf730FLAPUVuOIk0bmqSPi0RG9ux9yiMBLEIXH?=
 =?us-ascii?Q?N3upnaOSa4b55va+gFEzhnnylVjBI/mJjnjlesF6OzkZz+qvvUojQxIFxy+9?=
 =?us-ascii?Q?r/zp2Use3Z7Hzc0SnWLXLgL1lDx9xlBH/SEwhRXZcACzsE1DJo/ITMqN47Mt?=
 =?us-ascii?Q?e26ttiAxRQEvUZNxXiBwQ8NWKgG9xCDmXqq5soPioJfLyBtub8r5gSiaxKaW?=
 =?us-ascii?Q?QhXKgyXYj1M7FWqHN7JMNMzhcbN4oEFRaiVWexby/LpX8MVKLcCkXN8dIA1T?=
 =?us-ascii?Q?N24lRDF1akoP1+wcyeQUhVgSZRcl5ZITuaroAvfrfAFXNzOH5GYUEk2tgna6?=
 =?us-ascii?Q?1n8R2fot81nOHiqt3rh0sC3ghTntFbKm8gtt3B+dRi7ybA7ft3DJP/Og3nbu?=
 =?us-ascii?Q?4qztkgeRs4ZF2vfTH2YIaf6g/vRfSyzHf+k8sDTNr+HF/w8btmUUltJJhN1r?=
 =?us-ascii?Q?0T00XLfuZWRHYk2gCUFEokzLjlPTrmnEFb9vq+c6nFY6LVCaPza/h7R0bmKg?=
 =?us-ascii?Q?Q3zNkJgPTM6jFH5WafWp/e4rO1g8YeYwIfuVA2ZHVYMGWobJ9V0gg11cqHn8?=
 =?us-ascii?Q?FXJrgbPt8Lyd+kEtZRONGDPj7Al5EM0sSgnGdk9Usv1aJUn0fuLPXEmYJjgX?=
 =?us-ascii?Q?O5N0N+8WRqdFjSywBZggBf2pKsL5ERvCgdZP5Xy15z0X5iUzZ29GkDEx02pQ?=
 =?us-ascii?Q?ZfYfoZn4ugMPImQFnpSn+WpAkqKtrS3QxXcOMFe+kzet+IMnKp6bDMFvgjU2?=
 =?us-ascii?Q?Y6SYFSmKzq+Krpk/n/3b9M0XE6KaLik/25LF9v3E40ilFtKg94AOw8fuyLyc?=
 =?us-ascii?Q?y4Ktsjnh3130O9+OI4nYQWvT1hh3Q+P6Cv8lbFgw0lRhyTDRSQlpycRYjxgt?=
 =?us-ascii?Q?XTiQ/SLn3XICNm3GzlCXho2XsIjaBzl8YKjG5505/R0kkKhef0adKtuGAsh3?=
 =?us-ascii?Q?Wj40ljY13W1mPAIQoRtP2wldyNqG7WUPcGL14YYRHAqm5nxY3QvA666/eZzk?=
 =?us-ascii?Q?diIoU+5gK2DUFx6YtcWpBmvOsPmfSnfCz0Dj2WYG2dYhxrDBrwROmla3Joj3?=
 =?us-ascii?Q?tLvdRKReAmBu29cGhWpateXGFPRQEpnLtWJ6iwUlmMWrvJsn03/sblNPGpe+?=
 =?us-ascii?Q?Ad77rxwcivRAp2eA2vNyMDxKweBABW85uQJApf/r0TZybwMBPya0B/AAxgtS?=
 =?us-ascii?Q?t6hX4Ram6+x/IceYfLbV7ezseBZ7vi0LXKTMH6cqQdTSFipPBpENxKpHAGzT?=
 =?us-ascii?Q?NS08iYJSi7gA5VW8dKZBb3lkQlt1Y4l860Q0VlriQWwysYvV4tNoDtjkyWo4?=
 =?us-ascii?Q?Qu8dp28+uzFUd5nRsG8iDsqNSm7iOnv8sbRbaRRHv6kGPP9qRWpEJh4TspOK?=
 =?us-ascii?Q?uJpZ0IlgP/NlOW9fEEVI1X1bUvCfxizNYtJ4r/nUTTr70hVvlFb70BBD7xUK?=
 =?us-ascii?Q?4AUdUrhtZD03s6k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 02:24:15.7400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60154e80-4d74-4873-a6d8-08dd4a432e63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5923

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
v7->v8 changes:
* Modified commit message and some comments.
* Deleted unused function vpci_hw_write32.

Best regards,
Jiqian Chen.

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
 xen/drivers/vpci/Makefile  |   2 +-
 xen/drivers/vpci/rebar.c   | 131 +++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  15 +++++
 xen/include/xen/vpci.h     |   1 +
 4 files changed, 148 insertions(+), 1 deletion(-)
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
index 000000000000..794f1168adf8
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


