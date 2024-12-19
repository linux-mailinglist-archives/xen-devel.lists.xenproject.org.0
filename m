Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22139F73E5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 06:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860781.1272765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tO8zu-0005fO-OI; Thu, 19 Dec 2024 05:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860781.1272765; Thu, 19 Dec 2024 05:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tO8zu-0005dy-LW; Thu, 19 Dec 2024 05:22:54 +0000
Received: by outflank-mailman (input) for mailman id 860781;
 Thu, 19 Dec 2024 05:22:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y92W=TM=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tO8zt-0005ds-72
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 05:22:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2416::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49135207-bdc9-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 06:22:50 +0100 (CET)
Received: from CH2PR03CA0022.namprd03.prod.outlook.com (2603:10b6:610:59::32)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.26; Thu, 19 Dec
 2024 05:22:44 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::fe) by CH2PR03CA0022.outlook.office365.com
 (2603:10b6:610:59::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:22:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:22:42 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 23:22:13 -0600
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
X-Inumbo-ID: 49135207-bdc9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wt59ojBgEtAnNcdqOCjNksoHI0g6e+t85GvJVD6g5QONqVNnQVvPz++n4tCe0sw4WjA0aMG87lfbD+H4E3JOPcyeYzNlThjh4rkOh203kFKFGVF9EJHXZ6HuAvi8o5YuIl25eRvG7AIiIzlgh1cf9EOqRc6nlecgH3cidtBPq734CTdNyQZiMPfcJxfcTPAe7K9+LJVOY+iY5Vs3R9WOE6ksAJer7zyjrmr0qInOHEoGtGn+ba5vVoK/4rbt8XLTcKPQ9ZuRQ39psEl5bYOkZArAvQW3mgoN9N0iBjD00BeeoTX2mY3sBkqh6diAM6uBDMWLSUqcFLYNsRRv0tcAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhA8zEc1GzBWF4Mmn5/XFOVinFTnQH1rm9pmzCQVyrs=;
 b=HMGWMG54kMp8B35zXKiDiQeDxLBm3698Uk2Fl7Z5PkN2MMJVgBUIkJVkHlLLhWIGBDragscyu/gOgqokviKC2YohwrYybFYM/5po1RSWSZPOdtTjZ1drM0mXf2YCmFe/0Rfs96zUJf16VmrXgA5a+Rflis+qgd99ue9IguEvQjDE9l7ucm94N/Fc+4+ejIhpQhCgSjD1pr4cLkDKpAMhEomBRjsYnLCWRLEgjOhKOCO+kDaWgAwXaSBmsSGV3iuRwFPVhun13ZURJpC6tBWB2+ZA7GK9z5BG2qXpRFGOANnWXwB/SKMU5kI8OulZH3Oz/zfM5r/aUtyksC7JSBSO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhA8zEc1GzBWF4Mmn5/XFOVinFTnQH1rm9pmzCQVyrs=;
 b=p6D2mH/e6zJu2gcry1eI/2/SR64hu3puoaPc3v1SPdfoxMo4jWpxOZLKkUr+jimBF+bmSFwc/wKc2akRjiKE8a3EPStkhY0VlRRzFWHEsCnjDTgVxFeNlD+zlFu6gLPP724ysSishlFymL1VQbO2bk3GdCdnI8csuy6YFzh6Hhg=
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
Subject: [PATCH v4] vpci: Add resizable bar support
Date: Thu, 19 Dec 2024 13:21:43 +0800
Message-ID: <20241219052143.3161332-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: cc04a108-88f1-470c-852b-08dd1fed29c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vnS90XZ3T7XpWtiL4rJ965lkGtCMWHqh1kbmXXgv/qbhCeDhULA8lmygto31?=
 =?us-ascii?Q?g+y6WGAuo41H7ObCdW3glg4kM4Ydw6FNKdzirf5+8F43LWkYQDn92LFcdXqq?=
 =?us-ascii?Q?CoMv2b8usuHZh8awq9RSzTnZmoavZQO4eAu1lZORnedWJ95z9padhfAHECwv?=
 =?us-ascii?Q?pWgUgQLhJRO7d0S7L3Zp3NZfviidI4uRz1L6euOD84IPBD1RQuIOZ4F5aDQq?=
 =?us-ascii?Q?w5/J/r1k375JDZcF0MXg4GTvB6WyKFQK6LoaDqg8rIhntk8bdPVtnqISIJeD?=
 =?us-ascii?Q?AHrsJLHUuBBUaAWs3tBZgZ0ztFkyVyuBADv0JUFJdnumaui3sX95GEIX6Srx?=
 =?us-ascii?Q?esvuyef7HSb2a+MbAR+q3D4qhJwGHNa+uct7Iv9uekhYiNfhNQ3pMNGHFkrs?=
 =?us-ascii?Q?sYwz/osPSo2Sj5CNxZUEijycVRHnojjxN56+DNGziuxeW8prVdLJ/n67EIZ2?=
 =?us-ascii?Q?MmR36wBRBIGgpWu9jodW1fhwgnODCkPPD3nQ7Mt8E1iPF/c5eDA+/xO23T+C?=
 =?us-ascii?Q?33bxPUofGRtCrXJk4inMb5hxaWlaTnVdAXoQThU0N7SZ95Sc4k+qhKFyWhSz?=
 =?us-ascii?Q?W5yU7DWvuRjv26uA0yli4WJ92ZA7SR+D7woeMlEsG5UPH79MLoGQTz/J+pkM?=
 =?us-ascii?Q?dzNAYQ8/oJSG83iWNGA6Fo4MwFXK1FseHOZ1JnchbvMlMQsoIwuYp+zoo+6u?=
 =?us-ascii?Q?EuZI0M3J31a4MbX8mhCUv8s082jSzF5/NAz2UYI9mZVWFKb6ccAMZn7trBlq?=
 =?us-ascii?Q?D5c5EDBXU9gXtyWW+FLbE6izP56wfji4Jc25iYOiMbqbPRQeuZS1sfDnOppu?=
 =?us-ascii?Q?h3VI0QwvGcuwA4f1oXHAFU2ryDTOQ5Mac1bpBPGv59SqiwczayngR9ba/3WL?=
 =?us-ascii?Q?Oc0eZBx3XNVGI1S6wTCGhJHzBXnM3D40M2FtO2KgUGa27nOTC8ZKpNYuEOGq?=
 =?us-ascii?Q?zVNmtAzAh3+Ky3fdnDWryH7uE18eA2UN+mFiiZQ0QJjgQiZcpIsgzChDO9MO?=
 =?us-ascii?Q?sqMJePx70N1UGWLaEcZuZj6KYPpHB357s02ZbSvet0GTQaXSDzx4nHnJMUa/?=
 =?us-ascii?Q?NWjQI8crwyMPQM5s+4IoRfCtOBq0fhE/q4N5sVaQyQDlCpDr3wZx4K9Nd388?=
 =?us-ascii?Q?LzyLc8Ywg1HFy5YgDIfrr0uvd3lQX/Vv84QbMJbJTHkL+tlfPTN30u290GzM?=
 =?us-ascii?Q?ISyua4ELXqPVTQP/0Y1iyUwqpjB3dV9LKyFr/B269o19hmgP8xrO+oQ+AMHG?=
 =?us-ascii?Q?eE4xmIJD6A3BxJfwiq7DINP9cS4UzEXqvUBxEOI2FXNMIEskNNAMROzMD5Qj?=
 =?us-ascii?Q?aJbRbYU1EuavSH5DVmhwc3on+SnjYXbDxoEWSdhuovbowIMCi51Yffz8l1wy?=
 =?us-ascii?Q?IRcy047SxJj1sb92qJ6tQZcsVjstQPxor6fpD5lH+oSq8jNsK3GY9rxlrvl2?=
 =?us-ascii?Q?ugccgyBKTYZIP4mnFE7kpQ4yKt6aTvs4N7wxd+shfXBcoslEWmtCFW1uTxGr?=
 =?us-ascii?Q?wYJ8wC3r4KaV+8U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:22:42.4167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc04a108-88f1-470c-852b-08dd1fed29c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231

Some devices, like discrete GPU of amd, support resizable bar
capability, but vpci of Xen doesn't support this feature, so
they fail to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers for them to support resizing the size of BARs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,
v3->v4 changes:
* Removed PCI_REBAR_CAP_SIZES since it was not needed, and added
  PCI_REBAR_CAP_SHIFT and PCI_REBAR_CTRL_SIZES.
* Added parameter resizable_sizes to struct vpci_bar to cache the support resizable sizes and
  added the logic in init_rebar().
* Changed PCI_REBAR_CAP to PCI_REBAR_CAP(n) (4+8*(n)), changed PCI_REBAR_CTRL to
  PCI_REBAR_CTRL(n) (8+8*(n)).
* Added domain info of pci_dev to printings of init_rebar().

Best regards,
Jiqian Chen.

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
 xen/drivers/vpci/vpci.c    |   6 ++
 xen/include/xen/pci_regs.h |  14 ++++
 xen/include/xen/vpci.h     |   3 +
 5 files changed, 155 insertions(+), 1 deletion(-)
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
index 000000000000..bfc0e6eb0668
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,131 @@
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
+    if ( !((size >> PCI_REBAR_SIZE_BIAS) & bar->resizable_sizes) )
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
+
+    for ( unsigned int i = 0; i < nbars; i++ )
+    {
+        int rc;
+        struct vpci_bar *bar;
+        unsigned int index;
+
+        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
+        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;;
+        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
+        {
+            /*
+             * TODO: for failed pathes, need to hide ReBar capability
+             * from hardware domain instead of returning an error.
+             */
+            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
+                   pdev->domain, &pdev->sbdf, index);
+            return -EINVAL;
+        }
+
+        bar = &pdev->vpci->header.bars[index];
+        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
+        {
+            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
+                   pdev->domain, &pdev->sbdf, index);
+            return -EINVAL;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
+                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
+        if ( rc )
+        {
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
+        bar->resizable_sizes |=
+            (pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CAP(i)) >>
+             PCI_REBAR_CAP_SHIFT);
+        bar->resizable_sizes |=
+            ((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES) <<
+             (32 - PCI_REBAR_CAP_SHIFT));
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
index 250ba106dbd3..51fdab69fa74 100644
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
+#define PCI_REBAR_SIZE_BIAS	20
+#define PCI_REBAR_CAP(n)    	(4 + 8 * (n))	/* capability register */
+#define  PCI_REBAR_CAP_SHIFT		4		/* shift for supported BAR sizes */
+#define PCI_REBAR_CTRL(n)   	(8 + 8 * (n))	/* control register */
+#define  PCI_REBAR_CTRL_BAR_IDX	0x00000007	/* BAR index */
+#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0	/* # of resizable BARs */
+#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00	/* BAR size */
+#define  PCI_REBAR_CTRL_SIZE(v) \
+            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
+                     + PCI_REBAR_SIZE_BIAS))
+#define  PCI_REBAR_CTRL_SIZES		0xFFFF0000U	/* supported BAR sizes */
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


