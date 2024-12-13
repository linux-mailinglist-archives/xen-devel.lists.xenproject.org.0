Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E79F0445
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 06:44:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856457.1269068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLySI-0008VO-Mv; Fri, 13 Dec 2024 05:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856457.1269068; Fri, 13 Dec 2024 05:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLySI-0008Sk-K5; Fri, 13 Dec 2024 05:43:14 +0000
Received: by outflank-mailman (input) for mailman id 856457;
 Fri, 13 Dec 2024 05:43:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDRe=TG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLySH-0008Se-8f
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 05:43:13 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2407::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 239f3959-b915-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 06:43:11 +0100 (CET)
Received: from PH8PR05CA0016.namprd05.prod.outlook.com (2603:10b6:510:2cc::17)
 by CYYPR12MB8990.namprd12.prod.outlook.com (2603:10b6:930:ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 05:43:04 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::80) by PH8PR05CA0016.outlook.office365.com
 (2603:10b6:510:2cc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.13 via Frontend Transport; Fri,
 13 Dec 2024 05:43:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 05:43:03 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 23:43:00 -0600
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
X-Inumbo-ID: 239f3959-b915-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT0zBlpkv/Ja4EEh1fgD73Sem8iaUE6C+2HhxEASr6oJsyk9D4qKgwcbvmONigy9wHDBs4NEbA4PDit2lAec4AQ+nEULYSw3/kJZWR6yikcT8vCIHBbm0cFQRpHaHyrM8/b+68t7IphxenxQKXIcAV8d0j26e95db02ykYem3zT4lF387H5SgVphXAxt8X7EiJ1knAAPVa73EpSvd8Ye1Wxkzogw0ZXZRriqWI9smtTi5ctidxuIlH9DimxjqId6/U6l7wNYhgl2NN5uXEt+cwkitR1t5A17FrHzO24Wq+B3Jddw7VSZQt+/UK/y33c332cj9z+Kpl99Z64rX82B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojxF/E4gKWp1SAYZJFlXQKW+DKzK4dAdOy+EuuUsY/k=;
 b=RlKCX89zQZXjoazPuTCpNRMjqGYpCvKleyMHiqLXI1WRkelevcvqekjoCyZy1iUsOgUD2LNx38UlCa0GTZBKhRmGvUjkixjZh/ucew9+LnGd64qKT299PDvYFFhuueM1wVBWX09mmNydAv+dO5ZZgiCZS71npiAEKcy1CLpKVWjvQnxNjxyDg2tRj29GYLOlq/uTOJqMkdowWnQVP97SfDrXiZ9n9jQlm9QHL30DZ62xIw8BmL6ZPkL4uDpwxQX04bILRiDVBR1RtdIgydGJ4YYl9k3odkSvmn2lF4fwSy+wslcuoasYxCXOU1gzYWePOe2dYreXrDPQzD3GiTx85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojxF/E4gKWp1SAYZJFlXQKW+DKzK4dAdOy+EuuUsY/k=;
 b=J/ehN3fX9YcEphIbUc2VSVJ/NdUyGxfq2nXGuU5EsePqqwgGC3iejZ5G2Me5nRtZjrZRG+CsphEGXBB4W5CnAqzFgY9OB6mfrtBC11YYPmm58TYhKCC4pjvjSJSUnU47y7wXesPQ0FxPCCTAKTHvtoSbwiPXp664MoHUviLiksg=
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
Subject: [PATCH v3] vpci: Add resizable bar support
Date: Fri, 13 Dec 2024 13:42:32 +0800
Message-ID: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CYYPR12MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 012e6529-875a-4713-165a-08dd1b390323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b5sXt7a0CMJM1305g94E/4pO6/utwWeHoxLTjkjxfVCUtdOsBxfjhJl208P5?=
 =?us-ascii?Q?v644KjC2eFHteEcZQBcWgxKocyF/rEMo6mw4m55IkW1pXyY2wmzVI1aOGQR/?=
 =?us-ascii?Q?X+5nSwfs8hYMU+NYgHpBXwCYLz3K8U0oBt0dCafWjhLzu+fLIo380/jgwFrV?=
 =?us-ascii?Q?YULPfvMax58uTV70Y+UdEXxqeaHPX5HtHS41PTx7ADTszTNoe0qOhnU7Va4D?=
 =?us-ascii?Q?ILfil2UtsP/eMrLq7ivZSUlzzb0LwudEx/SfGGpF3OsVlu/vr2L5b5cMSFgC?=
 =?us-ascii?Q?W74Fml4AM4/cV8cjWMo3pMzNzohYjhlDMVrnq8GxVeWICf+LPHSVnIvhxbfc?=
 =?us-ascii?Q?E//oge3VzyQWdqrU3a305nWuYcQO+wshbK7X6tw2G3fuW+zsNgbtHIBLdRIf?=
 =?us-ascii?Q?9uOfl5oR8UvmbBMYoPNnGHLb9Kf8FyCaR3lWJ/pHsJxXbjvXDNRvASCnx7zJ?=
 =?us-ascii?Q?qIjT0lUtinDsTVtH4lKFU9qES/ZR4T27msvPdgWQISsqzVKVeci+bq3FkCLA?=
 =?us-ascii?Q?7bwluDSo3s+H6CruGsIWBZDi4gQvcbtWTaNjWMcGbXEOa7IDLtGU6YBZmZAx?=
 =?us-ascii?Q?VQojM8du03sVO/Dhn4+VC+nfel1/Knk4T9v+AIP4KgvNlH/kAgu4gw+KUrTe?=
 =?us-ascii?Q?i7BnU25oobfy3RHXvLJOjWyKkUj07arIe4vA172/XnQy/V9kjkxkC02UMGzG?=
 =?us-ascii?Q?eJpWqrt/aTwHu5fQhb3uMOriZsMWNbq+40uZryTOqDhdMYB/2UGOrKQfOSQC?=
 =?us-ascii?Q?BPDCslP7FeVWtLqZC+JyP/qD2RfaZ4J+ri4VmtiAk0v3VUt+gTz2guwr+qRA?=
 =?us-ascii?Q?ZnaLGsG0gUfOVw004lPJJ2LAyUi1bwt6KOlN6T7+krfXB/83hLx2aFGQNl02?=
 =?us-ascii?Q?MUo0DQo3eVsT0XWRId6NtRzQZmyu9j71EYdwsyLk1XFI98btP/gb5UGnJLHV?=
 =?us-ascii?Q?Lq1VQOv3rePfI7f6BGncIG/jnsuNh/VqS3N0UZH5T0oqlp0zAD0Th4k320wT?=
 =?us-ascii?Q?yHVSOMwApIZ06zUr2DWsoIPvZAoUVA868sQtqLTUD7dBcIWJ8e7mDOEcO5Ny?=
 =?us-ascii?Q?wm16pAAFIE0PtO6zY9aNRjXZhNbn7jAh9MzqFn4kt0RGKqJlAc55dl81NN+o?=
 =?us-ascii?Q?+xA7YcpiSZgitldwEsofbZggHJzkTgpnHibc9qZJ0Ys0hQweIZ1CPvTqlJsW?=
 =?us-ascii?Q?jXr70WG+WRR2fj6LAZ4eGKt6/PVyCG4/5iQnjxoLTPa2jFIC3xOB/KvZQI/Y?=
 =?us-ascii?Q?TvdQCkxLzGgLcW8oZnMzdL2HBtuKEAWvLmRJveuH9iWMg96LMfOviHEmKEb3?=
 =?us-ascii?Q?SfCIBXLMYtTR4rc7yOxVNmIAogWUvk7hs6FZLi6Q+U4ZRvFr4cGleZ8bGggq?=
 =?us-ascii?Q?KZOTZ/q0l0EsInebxa0qiXMi63auh2kpFVBF1HIMak8tI9MrlJdGtm+KgYFY?=
 =?us-ascii?Q?GkHmISMe9Rh4A2+9uLYckwYmaedCmFv9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 05:43:03.4476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 012e6529-875a-4713-165a-08dd1b390323
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8990

Some devices, like discrete GPU of amd, support resizable bar
capability, but vpci of Xen doesn't support this feature, so
they fail to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers for them to support resizing the size of BARs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,
v2->v3 changes:
* Used "bar->enabled" to replace "pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY",
  and added comments why it needs this check.
* Added "!is_hardware_domain(pdev->domain)" check in init_rebar() to return EOPNOTSUPP for domUs.
* Moved BAR type and index check into init_rebar(), then only need to check once.
* Added 'U' suffix for macro PCI_REBAR_CAP_SIZES.
* Added macro PCI_REBAR_SIZE_BIAS to represent 20.

TODO: need to hide ReBar capability from hardware domain when init_rebar() fails.

Best regards,
Jiqian Chen.

v1->v2 changes:
* In rebar_ctrl_write, to check if memory decoding is enabled, and added
  some checks for the type of Bar.
* Added vpci_hw_write32 to handle PCI_REBAR_CAP's write, since there is
  no write limitation of dom0.
* And has many other minor modifications as well.
---
 xen/drivers/vpci/Makefile  |   2 +-
 xen/drivers/vpci/rebar.c   | 130 +++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c    |   6 ++
 xen/include/xen/pci_regs.h |  13 ++++
 xen/include/xen/vpci.h     |   2 +
 5 files changed, 152 insertions(+), 1 deletion(-)
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
index 000000000000..39432c3271a4
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Author: Jiqian Chen <Jiqian.Chen@amd.com>
+ */
+
+#include <xen/hypercall.h>
+#include <xen/vpci.h>
+
+static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
+                                      unsigned int reg,
+                                      uint32_t val,
+                                      void *data)
+{
+    uint64_t size;
+    struct vpci_bar *bar = data;
+
+    size = PCI_REBAR_CTRL_SIZE(val);
+    if ( bar->enabled )
+    {
+        if ( size == bar->size )
+            return;
+
+        /*
+        * Refuse to resize a BAR while memory decoding is enabled, as
+        * otherwise the size of the mapped region in the p2m would become
+        * stale with the newly set BAR size, and the position of the BAR
+        * would be reset to undefined.  Note the PCIe specification also
+        * forbids resizing a BAR with memory decoding enabled.
+        */
+        gprintk(XENLOG_ERR,
+                "%pp: refuse to resize BAR with memory decoding enabled\n",
+                &pdev->sbdf);
+        return;
+    }
+
+    if ( !((size >> PCI_REBAR_SIZE_BIAS) &
+           MASK_EXTR(pci_conf_read32(pdev->sbdf,
+                                     reg - PCI_REBAR_CTRL + PCI_REBAR_CAP),
+                                     PCI_REBAR_CAP_SIZES)) )
+        gprintk(XENLOG_WARNING,
+                "%pp: new size %#lx is not supported by hardware\n",
+                &pdev->sbdf, size);
+
+    bar->size = size;
+    bar->addr = 0;
+    bar->guest_addr = 0;
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
+static int cf_check init_rebar(struct pci_dev *pdev)
+{
+    uint32_t ctrl;
+    unsigned int rebar_offset, nbars;
+
+    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset )
+        return 0;
+
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        printk("ReBar is not supported for domUs\n");
+        return -EOPNOTSUPP;
+    }
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    for ( unsigned int i = 0; i < nbars; i++, rebar_offset += PCI_REBAR_CTRL )
+    {
+        int rc;
+        unsigned int index;
+        struct vpci_bar *bars = pdev->vpci->header.bars;
+
+        index = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL) &
+                PCI_REBAR_CTRL_BAR_IDX;
+
+        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
+        {
+            /*
+             * TODO: for failed pathes, need to hide ReBar capability
+             * from hardware domain instead of returning an error.
+             */
+            printk("%pp: BAR number %u in REBAR_CTRL register is too big\n",
+                   &pdev->sbdf, index);
+            return -EINVAL;
+        }
+
+        if ( bars[index].type != VPCI_BAR_MEM64_LO &&
+             bars[index].type != VPCI_BAR_MEM32 )
+        {
+            printk("%pp: BAR%u is not in memory space\n", &pdev->sbdf, index);
+            return -EINVAL;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
+                               rebar_offset + PCI_REBAR_CAP, 4, NULL);
+        if ( rc )
+        {
+            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
+                   &pdev->sbdf, rc);
+            return rc;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
+                               rebar_offset + PCI_REBAR_CTRL, 4,
+                               &bars[index]);
+        if ( rc )
+        {
+            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
+                   &pdev->sbdf, rc);
+            return rc;
+        }
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
index 250ba106dbd3..c6bd3545d7a5 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -459,6 +459,7 @@
 #define PCI_EXT_CAP_ID_ARI	14
 #define PCI_EXT_CAP_ID_ATS	15
 #define PCI_EXT_CAP_ID_SRIOV	16
+#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
 
 /* Advanced Error Reporting */
 #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
@@ -541,6 +542,18 @@
 #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
 #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
 
+/* Resizable BARs */
+#define PCI_REBAR_SIZE_BIAS	20
+#define PCI_REBAR_CAP		4	/* capability register */
+#define  PCI_REBAR_CAP_SIZES		0xFFFFFFF0U  /* supported BAR sizes */
+#define PCI_REBAR_CTRL		8	/* control register */
+#define  PCI_REBAR_CTRL_BAR_IDX	0x00000007  /* BAR index */
+#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0  /* # of resizable BARs */
+#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00  /* BAR size */
+#define  PCI_REBAR_CTRL_SIZE(v) \
+            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
+                     + PCI_REBAR_SIZE_BIAS))
+
 /*
  * Hypertransport sub capability types
  *
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 41e7c3bc2791..72992e93cece 100644
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
-- 
2.34.1


