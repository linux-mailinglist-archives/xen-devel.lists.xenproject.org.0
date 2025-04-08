Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A09FA81186
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942761.1341874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVi-0003Sf-T6; Tue, 08 Apr 2025 16:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942761.1341874; Tue, 08 Apr 2025 16:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVi-0003R6-Pn; Tue, 08 Apr 2025 16:09:14 +0000
Received: by outflank-mailman (input) for mailman id 942761;
 Tue, 08 Apr 2025 16:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVh-0002e3-UH
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:14 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f403:2407::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceba2474-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:12 +0200 (CEST)
Received: from BN8PR03CA0020.namprd03.prod.outlook.com (2603:10b6:408:94::33)
 by BL4PR12MB9507.namprd12.prod.outlook.com (2603:10b6:208:58d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 16:09:07 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:408:94:cafe::e1) by BN8PR03CA0020.outlook.office365.com
 (2603:10b6:408:94::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 16:09:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:06 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:04 -0500
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
X-Inumbo-ID: ceba2474-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2EnC5HEsJVdsX3IcTEtl3bxSwm0uFg/8pTfgTPHFG9Is3+o/nOUIymDU7baeCnwKs4v/OkLIrNEO3JHFGb3sNRtPlHe5y+3BcsoqEQVOjOQizGBWfcjocJCf1j59abuC5R0MPkJkCsr6bjyuNm/9R7Bl7CDpOlmyt6Vftif1hzDVshyJwbM0kYzRRCd9RK1LhLDlFMNto1DsoPs8ZEQgOQ5uyONqvjOKPo4+EebPo734IpjelzYyzvvBRJLb6HW7XM9X+5ibMVgfXRCL/NysYLxxcxH3CYtOy4LMg+8p/trzEe4OmUPuvN37CD2WrN+Q4RvWrnmx2+0BkkUvUUCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHwz8UwybMYOVzVonk4njjqdjxliscrCFkwYeqNUQrU=;
 b=wVIfwK1fJsAkZ6/6UEAvdUw15CsMQ7FzlJqmcF6T7MfBv3PErptXfk7umncnHst+vSHe9sP1DoeKT+aeG/CFSHytvVFJIlSOH2oYcTfRONbDI2ceNe+q4YVrE0sZQ67TH/WKEM2uI7FG7sBl2hjiIItBhQCbUfmznTqG151dvOZfoy/53/QORnthN79cxnMygX4qtU4j7n78LwdK4cxF8/BK+JB7zDH3Ucwu/yofDEFkrAvGZIiGxLxe5yfEpVy7bEfLEPCAxZhHlrVOfQaRO6LJFbrexdgjY8DKvs7gtYITMwXtWhb/NQ06wpm/6bR3NgkSCzYm6GTYOUxhEHS9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHwz8UwybMYOVzVonk4njjqdjxliscrCFkwYeqNUQrU=;
 b=wbPF9eyDV3510sWrB8+OuTfgInoUEEmjhu2hTSTJqtREgSGhzvPSh5dYU5AbiasHmlY/Xw46ETWUV2Ya8xJ26rF+5nzaavEfUWYDkenXwTPmhyULsymvbr+HMmVimCXTp+lCcOv9RxI7bh5a1GCTipMMu6XhfZBNymGord7O5Yw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 06/16] x86/hyperlaunch: introduce the domain builder
Date: Tue, 8 Apr 2025 17:07:28 +0100
Message-ID: <20250408160802.49870-7-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|BL4PR12MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba40aab-c975-4942-bceb-08dd76b7b05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pRIQx3L6Zr5vtukdo/I3MD1QPHS2VVLzdwaHysj76rw0bnZMA0ZsLhT5nvED?=
 =?us-ascii?Q?DX0G02QG3Hs1va215dOLU1VUaWHIEXHkC5/TwgT4gnvPchbYJ3Nzw33w7f3w?=
 =?us-ascii?Q?7+aZXBcbBlKXfcoDDBCi9c+mHIXo/41KhMe80nuXZ8LgP7H9RhXXJHX0Gpjv?=
 =?us-ascii?Q?gvRgGApzR/nC+AZ0NYk7EG1gknAVtLbEG9wQH1Ks0ASC8fZydFyS9KD+smQG?=
 =?us-ascii?Q?k+SDkn2DRJceKQZs6ik9sRVfacSiYKOl20phoD9ZzcGFsh26zBYq1AJ80uCd?=
 =?us-ascii?Q?HybhmnAv13FgExpsyn5qP2fYpZMcX0dPQ1+i2bgiRc3E4YE5kltAP48XrHOK?=
 =?us-ascii?Q?Kja9eSc1bFTcGmiIneFP7zTtNDb1bGpxAncvM9ERkFkaAlJfaSDsNlqdwZxX?=
 =?us-ascii?Q?vJP9PsPtj+egDYoCZb/penLslDxFC4pFedYuOb0YGs842H4T1IO2dFCQ9Y2j?=
 =?us-ascii?Q?JZKsUudDaC+wOKdSO90+2ihX2sPbQVgqgzN8mKejWCksAVbEI2JxELp9pGPX?=
 =?us-ascii?Q?yVzmrR/fsYKcGdrIgvfIgmB4HTmjN7Yrlo87idGcG7OZkaTPW0A3EIWUOsCF?=
 =?us-ascii?Q?WDjV6sf6+CYbq5sP3dSMXLLTfWLNwcqYn2l5niAzt9jfPu5rEZKeHpw0IzSR?=
 =?us-ascii?Q?t04kdZRMTSgZMOXNkknZTwbB1lvu52CwTn5mUBNDN9SR6hcqAqtWvw+flTPD?=
 =?us-ascii?Q?BXUGXjZ0uldnv/RpL6Khhrtv/vWu9M8yJZb23kEVEfhGUyJxdFu4jIA2RI1t?=
 =?us-ascii?Q?NcSUr3GJesyFYZph24GoUg0AVNCTI5DXuiqo7YG9O+dRQaJD1uAU45lqR+hn?=
 =?us-ascii?Q?wMiXuyIHMCD+n8ZJFb15nKyZCPOvAvuL7NehUW/Fltuf2I/2/gvPJ9CTzydr?=
 =?us-ascii?Q?Yi+dNGt45SJVXpbhFlEBe88sOAYuNZNxTjcDtHQ026/Dsnm5/XuHMOI/xn16?=
 =?us-ascii?Q?NxEVZL/NX9/0ccyiQhfW+NjL9LyUbdaczqoDTqd81zy76UVpu/WC0zeaeH/e?=
 =?us-ascii?Q?oj2Z0q1bO8YsJ7T5EvzqFeDS3qaMZ3xrEXnBMbc/T9SPKE8EFPp66deC7qfk?=
 =?us-ascii?Q?/EwduHsEU61U2vdqD8HTwfM9Rm0SMZD4SqM9Dat7KAUFeW06PAi72SPnG/yI?=
 =?us-ascii?Q?tQRiCExxgRERJMv/LCqZ1E4KxxTG1wok3Y8d5JDPvG8cXc8VYFZzNfHwuLkE?=
 =?us-ascii?Q?8ZbudQ2Trg/8uCr56lpRkpReCEOlQTife2I2E9rjMQwEqZMOwr9lCN7aul2N?=
 =?us-ascii?Q?C/93Q0ta7HewhlGNEEF/ZmkCfDF0fweri2lemnRY4PqnSZzzpAOMlbcr3Vdd?=
 =?us-ascii?Q?mr9I/4cIwbJFkZ5l/eOUnNtAHaxloBGuOe2Bt1enqggAcJnY2tm6tUw6M150?=
 =?us-ascii?Q?PyoC/MNtAQAN5fcRj0KDv00Icnatm946RN/OQwKeKeIf8wvb1oYbTNHTQsTv?=
 =?us-ascii?Q?80uZ2NOl+0Sn8BnIWViIkCDCMDYrzd0K8ssPJ0W+PIHjxCHuUMTQIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:06.6166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba40aab-c975-4942-bceb-08dd76b7b05f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9507

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the domain builder which is capable of consuming a device tree as the
first boot module. If it finds a device tree as the first boot module, it will
set its type to BOOTMOD_FDT. This change only detects the boot module and
continues to boot with slight change to the boot convention that the dom0
kernel is no longer first boot module but is the second.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
    * Move obj-y += domain-builder/
    * Remove blank line in Makefile
    * const in has_hyperlaunch_fdt()
    * CONFIG_LIBFDT rename
    * Use boot_info forward declaration
    * Rename domainbuilder.h to domain-builder.h
    * Add fdt NULL check
---
 xen/arch/x86/Makefile                     |  1 +
 xen/arch/x86/domain-builder/Kconfig       |  2 +-
 xen/arch/x86/domain-builder/Makefile      |  2 +
 xen/arch/x86/domain-builder/core.c        | 57 +++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.c         | 37 +++++++++++++++
 xen/arch/x86/domain-builder/fdt.h         | 21 +++++++++
 xen/arch/x86/include/asm/bootinfo.h       |  3 ++
 xen/arch/x86/include/asm/domain-builder.h |  8 ++++
 xen/arch/x86/setup.c                      | 17 ++++---
 9 files changed, 141 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/x86/domain-builder/Makefile
 create mode 100644 xen/arch/x86/domain-builder/core.c
 create mode 100644 xen/arch/x86/domain-builder/fdt.c
 create mode 100644 xen/arch/x86/domain-builder/fdt.h
 create mode 100644 xen/arch/x86/include/asm/domain-builder.h

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f59c9665fd..deae31d627 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -1,6 +1,7 @@
 obj-y += acpi/
 obj-y += boot/
 obj-y += cpu/
+obj-y += domain-builder/
 obj-y += efi/
 obj-y += genapic/
 obj-$(CONFIG_GUEST) += guest/
diff --git a/xen/arch/x86/domain-builder/Kconfig b/xen/arch/x86/domain-builder/Kconfig
index 8ed493c3b5..51d549c20d 100644
--- a/xen/arch/x86/domain-builder/Kconfig
+++ b/xen/arch/x86/domain-builder/Kconfig
@@ -3,7 +3,7 @@ menu "Domain Builder Features"
 
 config DOMAIN_BUILDER
 	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
-	select LIB_DEVICE_TREE
+	select LIBFDT
 	help
 	  Enables the domain builder capability to configure boot domain
 	  construction using a flattened device tree.
diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-builder/Makefile
new file mode 100644
index 0000000000..b10cd56b28
--- /dev/null
+++ b/xen/arch/x86/domain-builder/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_DOMAIN_BUILDER) += fdt.init.o
+obj-y += core.init.o
diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
new file mode 100644
index 0000000000..d6ae94f45c
--- /dev/null
+++ b/xen/arch/x86/domain-builder/core.c
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, Apertus Solutions, LLC
+ */
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/kconfig.h>
+#include <xen/lib.h>
+
+#include <asm/bootinfo.h>
+
+#include "fdt.h"
+
+void __init builder_init(struct boot_info *bi)
+{
+    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
+    {
+        int ret;
+
+        switch ( ret = has_hyperlaunch_fdt(bi) )
+        {
+        case 0:
+            printk("Hyperlaunch device tree detected\n");
+            bi->hyperlaunch_enabled = true;
+            bi->mods[0].type = BOOTMOD_FDT;
+            break;
+
+        case -EINVAL:
+            printk("Hyperlaunch device tree was not detected\n");
+            bi->hyperlaunch_enabled = false;
+            break;
+
+        case -ENOENT:
+        case -ENODATA:
+            printk("Device tree found, but not hyperlaunch (%d)\n", ret);
+            bi->hyperlaunch_enabled = false;
+            bi->mods[0].type = BOOTMOD_FDT;
+            break;
+
+        default:
+            printk("Unknown error (%d) occured checking for hyperlaunch device tree\n",
+                   ret);
+            bi->hyperlaunch_enabled = false;
+            break;
+        }
+    }
+}
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
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
new file mode 100644
index 0000000000..aaf8c1cc16
--- /dev/null
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, Apertus Solutions, LLC
+ */
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+
+#include <asm/bootinfo.h>
+#include <asm/page.h>
+#include <asm/setup.h>
+
+#include "fdt.h"
+
+int __init has_hyperlaunch_fdt(const struct boot_info *bi)
+{
+    int ret = 0;
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    if ( !fdt || fdt_check_header(fdt) < 0 )
+        ret = -EINVAL;
+
+    bootstrap_unmap();
+
+    return ret;
+}
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
diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
new file mode 100644
index 0000000000..8e62cd843e
--- /dev/null
+++ b/xen/arch/x86/domain-builder/fdt.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef __XEN_X86_FDT_H__
+#define __XEN_X86_FDT_H__
+
+#include <xen/init.h>
+
+struct boot_info;
+
+/* hyperlaunch fdt is required to be module 0 */
+#define HYPERLAUNCH_MODULE_IDX 0
+
+#ifdef CONFIG_DOMAIN_BUILDER
+int has_hyperlaunch_fdt(const struct boot_info *bi);
+#else
+static inline int __init has_hyperlaunch_fdt(const struct boot_info *bi)
+{
+    return -EINVAL;
+}
+#endif
+
+#endif /* __XEN_X86_FDT_H__ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 3afc214c17..82c2650fcf 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -27,6 +27,7 @@ enum bootmod_type {
     BOOTMOD_RAMDISK,
     BOOTMOD_MICROCODE,
     BOOTMOD_XSM_POLICY,
+    BOOTMOD_FDT,
 };
 
 struct boot_module {
@@ -80,6 +81,8 @@ struct boot_info {
     paddr_t memmap_addr;
     size_t memmap_length;
 
+    bool hyperlaunch_enabled;
+
     unsigned int nr_modules;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
     struct boot_domain domains[MAX_NR_BOOTDOMS];
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
new file mode 100644
index 0000000000..b6d9ba94de
--- /dev/null
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -0,0 +1,8 @@
+#ifndef __XEN_X86_DOMBUILDER_H__
+#define __XEN_X86_DOMBUILDER_H__
+
+struct boot_info;
+
+void builder_init(struct boot_info *bi);
+
+#endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 83cb66e309..e5d78bcb48 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -36,6 +36,7 @@
 #include <asm/bzimage.h>
 #include <asm/cpu-policy.h>
 #include <asm/desc.h>
+#include <asm/domain-builder.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
 #include <asm/genapic.h>
@@ -1281,9 +1282,12 @@ void asmlinkage __init noreturn __start_xen(void)
                bi->nr_modules);
     }
 
-    /* Dom0 kernel is always first */
-    bi->mods[0].type = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[0];
+    builder_init(bi);
+
+    /* Find first unknown boot module to use as Dom0 kernel */
+    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+    bi->mods[i].type = BOOTMOD_KERNEL;
+    bi->domains[0].kernel = &bi->mods[i];
 
     if ( pvh_boot )
     {
@@ -1466,8 +1470,9 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->mods[0].headroom =
-        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
+    bi->domains[0].kernel->headroom =
+        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
+                         bi->domains[0].kernel->size);
     bootstrap_unmap();
 
 #ifndef highmem_start
@@ -1591,7 +1596,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
+    if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-- 
2.43.0


