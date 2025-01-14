Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B341FA0FF2D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 04:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870886.1281942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXXax-0008Pm-9C; Tue, 14 Jan 2025 03:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870886.1281942; Tue, 14 Jan 2025 03:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXXax-0008NN-4j; Tue, 14 Jan 2025 03:27:59 +0000
Received: by outflank-mailman (input) for mailman id 870886;
 Tue, 14 Jan 2025 03:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JML1=UG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tXXau-0008NG-Pl
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 03:27:56 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2009::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89287d56-d227-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 04:27:53 +0100 (CET)
Received: from DS7PR07CA0017.namprd07.prod.outlook.com (2603:10b6:5:3af::14)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 03:27:47 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:5:3af:cafe::22) by DS7PR07CA0017.outlook.office365.com
 (2603:10b6:5:3af::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Tue,
 14 Jan 2025 03:27:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Tue, 14 Jan 2025 03:27:46 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 21:27:20 -0600
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
X-Inumbo-ID: 89287d56-d227-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEunC8hn4UwtJzMF9A+8vf/fw4t1OK2JFzhv+ZnFxqicdAzDlSnabZ1Btd+eV1uQLga7893Z7ZcQyMRtXiSuq48Wsc1ZDqZCtnrspvEQnNEy4FNcMrKN8tWTAojgnMV/gOv9rPFarXrSM8qCNg16NKYSaueYv7M8IbI3LIp+C5AbZPumNcUlFhK9fs1uPIGWivNUslcBo7c4nlETyB8o9nZWhuZBOIFTIzXUvISwg2ReljPzcYhrVzbL0ThxRfsPPBBplNABibTqPHwYmqD25z4dEXrib/ROvTQov9yU6WkuhdX7GVJLHoKIgBIxTopWsIHF6GcaC2dJqmb8XA/1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX7U8GBnJ8PWa3EmFKKGSuSYosnVk0lX9NFIkR5hmWM=;
 b=Gtw9YfILFAWZGtMXVhJ+sBzJTJHPTxPLtdNLYiojchzg5M9A9UXwQ5G/WJ+v5IyZD0BGxHxRBDmmkzERrfT9rKV3TTC58c2XsNFxbtt2JjzbEDrl/SKibSvlsDB+99/wpAq7Wsr6FWmxKqvPX4NCstDRaqQy4fMPHeeo1SuhhMKtDxVPYClZn5fKbKkZiMBQnEKLKZ+p4HOsGw+vN4pZnIfiDwS+pIIXx9JpG0jZAS9j3XRUjUK9YaOydZNEJsvPHqla5//3EXlJO6RjSwra3CDnPHq+CalgSJ9BcmLSGmzYWNAjLL6S+sa20sZ2cPtVad9ZQ/zPpu5hZCOBrNbxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wX7U8GBnJ8PWa3EmFKKGSuSYosnVk0lX9NFIkR5hmWM=;
 b=q5BjBU9kS/P6DNx8NpHIM1RZmN2iuxZ8PfmMIFQqKjLBOlSSMJNCZjKPBTgnuBizD7qi3s3CY1fN5Nvq1fwS5bHxj7y4oD9PMra6PIld2y+ZvtMipyvycTCxmHWPAb0+ewp/6G4tdlO5oEMMYiPw5RhFpGuQSiWlcA+JYSraB3s=
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
Subject: [PATCH v5] vpci: Add resizable bar support
Date: Tue, 14 Jan 2025 11:26:36 +0800
Message-ID: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: c371b143-a06c-49cb-c6d9-08dd344b6a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xSBtDakRvHSHXqYHqCh70jVR8DNSrU+q+DSh3QOQuZVOPeovtFFFNztFCmdF?=
 =?us-ascii?Q?tFK2jCNuq4DyDYJLdUP83gcQgvyEv2dTXCGFLBzkbjy+yWXu9hA8AQM10kD6?=
 =?us-ascii?Q?S996Q7C0w0rTeJY+eBB/TtrrOiWqohwNYerqQlk2o7UNe7bV5NUoEGmu+EBo?=
 =?us-ascii?Q?jvsR1cdLHMfrkvBTPN6uRq1zSFJvrBFpSPotgYC90M5sWiVbxhMC/qfZ47vb?=
 =?us-ascii?Q?CCWiiHICr9Wf74IBD/6hpw49mHe0WbcPhQYqrvdtHPcXV1aojQ5iQ4TJGUf3?=
 =?us-ascii?Q?qtSLfgrydMcw7oa9sBBHOXHRKZ6Qg1U/9XvLH1uqvlppgI91xDQtX6SiZJDi?=
 =?us-ascii?Q?t2zJMjGAgIKlTHTBcO4MAfo3U5aDmGV8whGS3mvL9XXNY6sq1E0T/djyijtZ?=
 =?us-ascii?Q?5XdLWFbQ8Va2htxJLBmaPU+GMrwTMDyjMn5Mb0k5zu+VG5SJuyf1spm9Ozvm?=
 =?us-ascii?Q?Eujb+GdMdpWRqdYbiTZ+1NKp0wZxQ1LCvnHoqId025XHDxc8z9TleFDutuuG?=
 =?us-ascii?Q?/P9Nhe3zw1GBBw923IW5UmUVq/GBIouJ7U8nkypFEypX+11IKYXPuAbavA3x?=
 =?us-ascii?Q?skQbAWjA8U5VLVjaDdkNxsVVH+byNdrqiDUaLW7HLVvyhmWDwkflU9stAnRh?=
 =?us-ascii?Q?tcBRpmHkZYLXTWhXnYkfPVZrkwfHtWy09qVbuhdLiz6AeVPWxtWd5iIknvqY?=
 =?us-ascii?Q?Vv4gZ3YmTLmxfwHXAKZ3gbugmPtuqfYg6xHTRcfUjQ5+73B7sy0FEYjF0C50?=
 =?us-ascii?Q?KdylcKNDNAni1TzzoRPdM+CPFGJFNc9eu5ge7oig5wFN4GXBzP5TYxTUv0g3?=
 =?us-ascii?Q?qWiONb9RQl37xD3/0hFSGqeh3ryLF229IjMNTvSYx2kG+aI/64FxC4RklGJq?=
 =?us-ascii?Q?0NRWRyXWQySAXoqkDeiGd8qCX0K2ffwxZxWDYAZTYvCf73+cEz3kliN4db3n?=
 =?us-ascii?Q?Z7xlGAlzpKiK+aspApisr48HlGITHL8oGa+VqXh1cjaxXpE6i+N7O8y1MMyL?=
 =?us-ascii?Q?dkx2UiY061MTkfZqZ0iJ4kp2ztKA0taVSvNjXpu42QGjtU2cJmVPr7nf4KAV?=
 =?us-ascii?Q?qsjJ09dEdSDM/mBpEUq2jeM1X64qcoJW6xtrRLX0+5xm9eLSiuFnqfPtCT/7?=
 =?us-ascii?Q?uhBNIgrQ16IlXHTV5f/bUM3l9Z/7rplbdrpu/CeX7ups/i7IQsU5h6Dk2+Tr?=
 =?us-ascii?Q?hoLiHGHhekN5xmuSZTyqSrHRxSO3dl0LFZHl82ATn74chqpSTtjjO4bGcfyT?=
 =?us-ascii?Q?hF8lblV3TveFf2OWP3BRJXGrwAP5bMjtip5prGwvOMPZ1f2PmikeQZLWRNe4?=
 =?us-ascii?Q?e4U8Ifxv/aCHtOnpzNmznwNX5kxKjVvf9lTh8w/x5FwU2e27U4D294Gykoux?=
 =?us-ascii?Q?AYhGit3FXFEOSGtt5vytVeQIrFQv+f4uwpRdZGNroPbDy+g1qR3vRL207j+E?=
 =?us-ascii?Q?olB6iagcZPFsDXZ6gv/teVfuCOxsoWQQuttXPRHIz5ypu8keIzEGP87IZDvT?=
 =?us-ascii?Q?IpDBuaiCFnCi3B8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 03:27:46.9733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c371b143-a06c-49cb-c6d9-08dd344b6a91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833

Some devices, like discrete GPU of amd, support resizable bar
capability, but vpci of Xen doesn't support this feature, so
they fail to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers for them to support resizing the size of BARs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,
v4->v5 changes:
* Called pci_size_mem_bar in rebar_ctrl_write to get addr and size of BAR instead of setting
  their values directly after writing new size to hardware.
* Changed from "return" to "continue" when index/type of BAR are not correct during initializing
  BAR.
* Corrected the value of PCI_REBAR_CTRL_BAR_SIZE from "0x00001F00" to "0x00003F00".
* Renamed PCI_REBAR_SIZE_BIAS to PCI_REBAR_CTRL_SIZE_BIAS.
* Re-defined "PCI_REBAR_CAP_SHIFT 4" to "PCI_REBAR_CAP_SIZES_MASK 0xFFFFFFF0U".

Best regards,
Jiqian Chen.

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
 xen/drivers/vpci/rebar.c   | 135 +++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c    |   6 ++
 xen/include/xen/pci_regs.h |  14 ++++
 xen/include/xen/vpci.h     |   3 +
 5 files changed, 159 insertions(+), 1 deletion(-)
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
index 000000000000..ed22a75e16fd
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
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
+    unsigned int index;
+    struct vpci_bar *bar = data;
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
+                    "%pp: refuse to resize BAR with memory decoding enabled\n",
+                    &pdev->sbdf);
+        return;
+    }
+
+    if ( !((size >> PCI_REBAR_CTRL_SIZE_BIAS) & bar->resizable_sizes) )
+        gprintk(XENLOG_WARNING,
+                "%pp: new size %#lx is not supported by hardware\n",
+                &pdev->sbdf, size);
+
+    pci_conf_write32(pdev->sbdf, reg, val);
+
+    index = pci_conf_read32(pdev->sbdf, reg) & PCI_REBAR_CTRL_BAR_IDX;
+    pci_size_mem_bar(pdev->sbdf, PCI_BASE_ADDRESS_0 + index * 4, &bar->addr,
+                     &bar->size, ((index == PCI_HEADER_NORMAL_NR_BARS - 1) ?
+                                  PCI_BAR_LAST : 0));
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
+            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CAP rc=%d\n",
+                   pdev->domain, &pdev->sbdf, rc);
+            return rc;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
+                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CTRL rc=%d\n",
+                   pdev->domain, &pdev->sbdf, rc);
+            return rc;
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
index 250ba106dbd3..65d77624fc73 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -459,6 +459,7 @@
 #define PCI_EXT_CAP_ID_ARI	14
 #define PCI_EXT_CAP_ID_ATS	15
 #define PCI_EXT_CAP_ID_SRIOV	16
+#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
 
 /* Advanced Error Reporting */
 #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
@@ -541,6 +542,19 @@
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
+#define  PCI_REBAR_CTRL_SIZE_BIAS	20
+#define  PCI_REBAR_CTRL_SIZE(v) \
+            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
+                     + PCI_REBAR_CTRL_SIZE_BIAS))
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


