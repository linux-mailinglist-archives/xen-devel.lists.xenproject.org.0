Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7569AEF5C0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029524.1403318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgK-0003r1-2A; Tue, 01 Jul 2025 10:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029524.1403318; Tue, 01 Jul 2025 10:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgJ-0003mn-UP; Tue, 01 Jul 2025 10:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1029524;
 Tue, 01 Jul 2025 10:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lih=ZO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWYgI-0002hE-DV
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:57:42 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2413::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34eb0576-566a-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 12:57:41 +0200 (CEST)
Received: from BN9PR03CA0375.namprd03.prod.outlook.com (2603:10b6:408:f7::20)
 by CH1PPF0B4A257F6.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::605) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 1 Jul
 2025 10:57:35 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::4) by BN9PR03CA0375.outlook.office365.com
 (2603:10b6:408:f7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 10:57:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 10:57:35 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 05:57:32 -0500
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
X-Inumbo-ID: 34eb0576-566a-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8S2u3V4c08uQGf4QFfEfV5pwiko9Otbjy1toHEPfrIPp0E/hQtuPZF+xm0PWSI9cTcJEXY6rQ4xSbmRI1gXztSfgU8Z2o+snnLNZUg21v/SlFSUqG1QsB8JD8E+Gu4a8PoEyc8vI91oCbDqVQpLUcqVmaLZ495kLFrlqVe2aXE5eh+EX3IhRPo9tbvcm4FPimWVsmdnnvRccyheOp8L/5qnMbP3XnLndHPsSLOYfxM85GRsDb20SEIPv+zx3p1M0R8tcR97SJ0QyFwO18U71E4+JFU7tp9PYqEMZR7FMY2F3CS4DdekDqj9eVXCvUzI2S/ft/e5yqGf0s3BMFP0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbVNr8wahsI5DaFX/g57h2I+6mdJW2lNt8ZCBnBHPBE=;
 b=TO3CuIiSw0dALyUq0u5ofsWoXPUtXX35hXVJAGcZY6yIC1aMoIfDUMoxm/fQ2EOVwPvC7kyFjhLUhNZdxi0WRRusQ0ikjcj3mrSkXPkg20VsitZF4Lc9ejQ/NRlfT4iwSQ0npns/yqG9+y7ja5kORtbE8IomRJ4x+5WlwJ7UJFUW3unQapFQ1ixrgwD234cphtex4dl24/XNwWSLHD72nLrBD/r2Hx+Qwoub+lsKOZ53aDVxUJuMbDsgZwvD34xwVxZfIAS//h7CDlROpre2y2x7FCHJJ7Wes9tHq5fNN6MRn1HVZoMnmoosCZkCBz4jZ5zNQvX52zyI4FnkcOTvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbVNr8wahsI5DaFX/g57h2I+6mdJW2lNt8ZCBnBHPBE=;
 b=RO0pXIeY84UYzS4JfbKjp078BA7+8gsvkkuga82Sm1D6+x/C5N+x2QPJgb+TQ8/noCSg+ebbhWFqc5fsRJQ/m/OhL4CuuFOaR64jICfR0jG9+oMp/ZlS7i6fSsY/8ZcbQ/uj1tZndhS/sn8rfHUUbsZdmnlPaMqTZi8kH5Z7HTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v5 05/10] xen/dt: Move bootinfo functions to a new bootinfo.h
Date: Tue, 1 Jul 2025 12:56:59 +0200
Message-ID: <20250701105706.86133-6-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701105706.86133-1-agarciav@amd.com>
References: <20250701105706.86133-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|CH1PPF0B4A257F6:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a245bc-5cca-4b0c-9ba8-08ddb88e1628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UuebJ3tn2ryMTeQeYYEsRmDL9GCT7nzJ4UAn88j5zvdprixapnl3/34WcZFG?=
 =?us-ascii?Q?cVDGV86FRwMidyewIdffPpHTjE/GeLwTIunNQZRy3jPizRhhyuDOBumiMaCE?=
 =?us-ascii?Q?N0v2K9PgrN9XMethzwS3IbleOzrm6Tf61dSd+44h5wucAFKtVilKt5gO8Vve?=
 =?us-ascii?Q?i0lFrI0S73UNbeYTFebNjRRlBJupb28rCox7Oo6sawJ9KjylO3b/F/Pg2dLq?=
 =?us-ascii?Q?K79ZpVxnG3/Q3mpFT/qFcaDjZbtJ2WGNWmrmc/n3rjjAT9X9nguYEHH5HxCW?=
 =?us-ascii?Q?t+0uV+Xyc+zsIKBQG5fqz+ao4WfB0Ab+99Gm/y5Xgy6T5ff3C1OOXloEUlZt?=
 =?us-ascii?Q?vwd88Zz0RTDR8dCHFkNn7XAi+QyzAZ2Mw0WmyoRfg9A28BUC89oIF94N9X/g?=
 =?us-ascii?Q?EzE4caYOs64tb2jHO+1yN/+G3zlFtROroof9fzpTv/UdedoOMvHwvQ5Pxfq8?=
 =?us-ascii?Q?1HEfxkdPVWV2Rw95jIjSENuFn8Vd/7zJM1qYOwoxVQpq1gtKKjovvY+M9y5N?=
 =?us-ascii?Q?uZR7XXgaTKs4y1/QRMXYOVDtLIlsXPAMa9KA+4MWlsQqWD/W6He1Z8HGFBTA?=
 =?us-ascii?Q?4ZusuITgA+F3z+gHBsOXRuohaqSCmBWqchkP7HDElMsbRK41KZQDgQeZIsJV?=
 =?us-ascii?Q?JObwQF8FTcrsalaIE17MxS8x2yhRaq5saYyKcAxROqQrFMue0h/65XGbtXUa?=
 =?us-ascii?Q?Bm1x997X5uWinFb67rIFg12kgC6ETM7YUZb54qi5j4qTxNP2PBVLHF16uSpq?=
 =?us-ascii?Q?UjfRFNzUbUlU8J3TNYaYIIkbla5LsTaAHEhP4MB7FGQRL1nQ0TCG3vwVBWV9?=
 =?us-ascii?Q?LAQDebe/99a8ZyW/u7tUYLi864G95IP/U1rXR/dedK+59O9Acrer6wqPZ+Ha?=
 =?us-ascii?Q?1Tipo0u2+hsdZck1WPHV/OlilzFl5OZ+O4wj+EtVWKiC4+XFpGP8yDmhkOhH?=
 =?us-ascii?Q?3q1Cv8bu8ozI4fYUIAiCVZxJ+WK5AnfiEi/jRV7ShnvUQDhxmy/4Ds2MKm5k?=
 =?us-ascii?Q?JtSGWuJjZJSl94OxVZ8xhAk5pQzI8NeU7/CsaeIzMetTazso2alB15Lcu6nw?=
 =?us-ascii?Q?SKIeEAqfWqLH1J4b3waTiQnbwzbBgFMFoE5D0z5frvGkTFDce6TnvCmNztGc?=
 =?us-ascii?Q?rhiLDA+Wco3oo/GLRDcdXzXKhUsxjC03aQECdHMq+aPdi0fZrc5U0XNJgtcb?=
 =?us-ascii?Q?IVjFAXufE1dCRbdYrxVtHVmTQWLoP8mZjbSgrbd89K9JDe9qjzE8XX5NQi1B?=
 =?us-ascii?Q?FZnLaX1gUbvUm20AyLPgpSlLM9ruIxRu1eXiSDLCT1FeRKPCzuZa+mZzWGGl?=
 =?us-ascii?Q?mHrvzraZMhip9ji91oKjZ1u/Ql6zuOHwCkwhR1uw+0tp78c/vaznwj5PcaWg?=
 =?us-ascii?Q?C5PQkZPEDMwri4T5+Lo6msIby/iQSyyaQM5XAQ6ltuZgoe90DHtDvoaHdwnu?=
 =?us-ascii?Q?Cjsn10wmLMmbWpFSblPWJUahGuhYU3xXKRrgj46+tumEkRV1T4BINDCFGFK3?=
 =?us-ascii?Q?iFpOu39swVAHvD6Xj3BoWKgCf89boCGB8snH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:57:35.2683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a245bc-5cca-4b0c-9ba8-08ddb88e1628
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0B4A257F6

Part of an unpicking process to extract bootfdt contents independent of
bootinfo to a separate file for x86 to take.

With this, bootfdt.h can be cleanly included from x86. A later patch
extracts the definitions so the functions may be called too.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/domain_build.c             |   1 +
 xen/arch/arm/include/asm/setup.h        |   2 +-
 xen/arch/arm/setup.c                    |   1 +
 xen/arch/riscv/mm.c                     |   2 +-
 xen/arch/riscv/setup.c                  |   2 +-
 xen/common/device-tree/bootfdt.c        |   2 +-
 xen/common/device-tree/bootinfo.c       |   2 +-
 xen/common/device-tree/dom0less-build.c |   2 +-
 xen/common/device-tree/domain-build.c   |   2 +-
 xen/common/device-tree/kernel.c         |   2 +-
 xen/include/xen/bootfdt.h               | 208 -----------------------
 xen/include/xen/bootinfo.h              | 213 ++++++++++++++++++++++++
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   2 +-
 14 files changed, 225 insertions(+), 218 deletions(-)
 create mode 100644 xen/include/xen/bootinfo.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fb577f816f..822f7430bd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/init.h>
+#include <xen/bootinfo.h>
 #include <xen/compile.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index b199d92a42..1eaf13bd66 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -3,7 +3,7 @@
 
 #include <public/version.h>
 #include <asm/p2m.h>
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 
 #if defined(CONFIG_MMU)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 58acc2d0d4..28fe1de3e2 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2011 Citrix Systems.
  */
 
+#include <xen/bootinfo.h>
 #include <xen/compile.h>
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 774ea42f2d..1ef015f179 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/bug.h>
 #include <xen/compiler.h>
 #include <xen/domain_page.h>
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 8bcd19218d..3e99e2e194 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,7 +2,7 @@
 
 #include <xen/acpi.h>
 #include <xen/bug.h>
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/compile.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 39334d6205..1848478e82 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2012-2014 Citrix Systems, Inc.
  */
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 #include <xen/efi.h>
 #include <xen/init.h>
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index 2a27d1318b..00a43fb358 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -10,7 +10,7 @@
  */
 
 #include <xen/acpi.h>
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/bug.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index e321747175..4413b17aac 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 #include <xen/domain.h>
 #include <xen/domain_page.h>
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 51182d10ef..b97206c917 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/init.h>
 #include <xen/lib.h>
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
index 7a00768e6b..7f73520388 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
 #include <xen/errno.h>
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 0846317f30..ad6b11cb6d 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -5,10 +5,7 @@
 #include <xen/byteorder.h>
 #include <xen/bug.h>
 #include <xen/types.h>
-#include <xen/kernel.h>
 #include <xen/lib.h>
-#include <xen/macros.h>
-#include <xen/xmalloc.h>
 
 #if __has_include(<asm/bootfdt.h>)
 #include <asm/bootfdt.h>
@@ -16,15 +13,10 @@
 
 #define MIN_FDT_ALIGN 8
 
-#define NR_MEM_BANKS 256
-#define NR_SHMEM_BANKS 32
-
 /* Default #address and #size cells */
 #define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
 #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
 
-#define MAX_MODULES 32 /* Current maximum useful modules */
-
 #define DEVICE_TREE_MAX_DEPTH 16
 
 /* Helper to read a big number; size is in cells (not bytes) */
@@ -104,78 +96,6 @@ typedef enum {
     BOOTMOD_UNKNOWN
 }  boot_module_kind;
 
-enum membank_type {
-    /*
-     * The MEMBANK_DEFAULT type refers to either reserved memory for the
-     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
-     * the bank is in 'mem').
-     */
-    MEMBANK_DEFAULT,
-    /*
-     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
-     * bank is bound to a static Xen domain. It is only valid when the bank
-     * is in reserved_mem.
-     */
-    MEMBANK_STATIC_DOMAIN,
-    /*
-     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
-     * bank is reserved as static heap. It is only valid when the bank is
-     * in reserved_mem.
-     */
-    MEMBANK_STATIC_HEAP,
-    /*
-     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
-     * bank is from the FDT reserve map.
-     */
-    MEMBANK_FDT_RESVMEM,
-};
-
-enum region_type {
-    MEMORY,
-    RESERVED_MEMORY,
-    STATIC_SHARED_MEMORY
-};
-
-/* Indicates the maximum number of characters(\0 included) for shm_id */
-#define MAX_SHM_ID_LENGTH 16
-
-struct shmem_membank_extra {
-    char shm_id[MAX_SHM_ID_LENGTH];
-    unsigned int nr_shm_borrowers;
-};
-
-struct membank {
-    paddr_t start;
-    paddr_t size;
-    union {
-        enum membank_type type;
-#ifdef CONFIG_STATIC_SHM
-        struct shmem_membank_extra *shmem_extra;
-#endif
-    };
-};
-
-struct membanks {
-    __struct_group(membanks_hdr, common, ,
-        unsigned int nr_banks;
-        unsigned int max_banks;
-        enum region_type type;
-    );
-    struct membank bank[];
-};
-
-struct meminfo {
-    struct membanks_hdr common;
-    struct membank bank[NR_MEM_BANKS];
-};
-
-struct shared_meminfo {
-    struct membanks_hdr common;
-    struct membank bank[NR_SHMEM_BANKS];
-    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
-};
-
-
 struct boot_domain {
     struct domain *d;
 
@@ -207,134 +127,6 @@ struct boot_module {
 #endif
 };
 
-/* DT_MAX_NAME is the node name max length according the DT spec */
-#define DT_MAX_NAME 41
-struct bootcmdline {
-    boot_module_kind kind;
-    bool domU;
-    paddr_t start;
-    char dt_name[DT_MAX_NAME];
-    char cmdline[BOOTMOD_MAX_CMDLINE];
-};
-
-struct boot_modules {
-    int nr_mods;
-    struct boot_module module[MAX_MODULES];
-};
-
-struct bootcmdlines {
-    unsigned int nr_mods;
-    struct bootcmdline cmdline[MAX_MODULES];
-};
-
-struct bootinfo {
-    struct meminfo mem;
-    /* The reserved regions are only used when booting using Device-Tree */
-    struct meminfo reserved_mem;
-    struct boot_modules modules;
-    struct bootcmdlines cmdlines;
-#ifdef CONFIG_ACPI
-    struct meminfo acpi;
-#endif
-#ifdef CONFIG_STATIC_SHM
-    struct shared_meminfo shmem;
-#endif
-};
-
-#ifdef CONFIG_ACPI
-#define BOOTINFO_ACPI_INIT                          \
-    .acpi.common.max_banks = NR_MEM_BANKS,          \
-    .acpi.common.type = MEMORY,
-#else
-#define BOOTINFO_ACPI_INIT
-#endif
-
-#ifdef CONFIG_STATIC_SHM
-#define BOOTINFO_SHMEM_INIT                         \
-    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
-    .shmem.common.type = STATIC_SHARED_MEMORY,
-#else
-#define BOOTINFO_SHMEM_INIT
-#endif
-
-#define BOOTINFO_INIT                               \
-{                                                   \
-    .mem.common.max_banks = NR_MEM_BANKS,           \
-    .mem.common.type = MEMORY,                      \
-    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
-    .reserved_mem.common.type = RESERVED_MEMORY,    \
-    BOOTINFO_ACPI_INIT                              \
-    BOOTINFO_SHMEM_INIT                             \
-}
-
-extern struct bootinfo bootinfo;
-
-bool check_reserved_regions_overlap(paddr_t region_start,
-                                    paddr_t region_size,
-                                    bool allow_memreserve_overlap);
-
-struct boot_module *add_boot_module(boot_module_kind kind,
-                                   paddr_t start, paddr_t size, bool domU);
-struct boot_module *boot_module_find_by_kind(boot_module_kind kind);
-struct boot_module * boot_module_find_by_addr_and_kind(boot_module_kind kind,
-                                                             paddr_t start);
-void add_boot_cmdline(const char *name, const char *cmdline,
-                      boot_module_kind kind, paddr_t start, bool domU);
-struct bootcmdline *boot_cmdline_find_by_kind(boot_module_kind kind);
-struct bootcmdline * boot_cmdline_find_by_name(const char *name);
-const char *boot_module_kind_as_string(boot_module_kind kind);
-
-void populate_boot_allocator(void);
-
-size_t boot_fdt_info(const void *fdt, paddr_t paddr);
-
-const char *boot_fdt_cmdline(const void *fdt);
-int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
-
-static inline struct membanks *bootinfo_get_reserved_mem(void)
-{
-    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
-}
-
-static inline struct membanks *bootinfo_get_mem(void)
-{
-    return container_of(&bootinfo.mem.common, struct membanks, common);
-}
-
-#ifdef CONFIG_ACPI
-static inline struct membanks *bootinfo_get_acpi(void)
-{
-    return container_of(&bootinfo.acpi.common, struct membanks, common);
-}
-#endif
-
-#ifdef CONFIG_STATIC_SHM
-static inline struct membanks *bootinfo_get_shmem(void)
-{
-    return container_of(&bootinfo.shmem.common, struct membanks, common);
-}
-
-static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
-{
-    return bootinfo.shmem.extra;
-}
-#endif
-
-static inline struct membanks *membanks_xzalloc(unsigned int nr,
-                                                enum region_type type)
-{
-    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
-
-    if ( !banks )
-        goto out;
-
-    banks->max_banks = nr;
-    banks->type = type;
-
- out:
-    return banks;
-}
-
 /*
  * Interpret the property `prop_name` of `node` as a u32.
  *
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
new file mode 100644
index 0000000000..f834f19571
--- /dev/null
+++ b/xen/include/xen/bootinfo.h
@@ -0,0 +1,213 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_BOOTINFO_H
+#define XEN_BOOTINFO_H
+
+#include <xen/bootfdt.h>
+#include <xen/kernel.h>
+#include <xen/macros.h>
+#include <xen/xmalloc.h>
+
+#define NR_MEM_BANKS 256
+#define NR_SHMEM_BANKS 32
+
+#define MAX_MODULES 32 /* Current maximum useful modules */
+
+enum membank_type {
+    /*
+     * The MEMBANK_DEFAULT type refers to either reserved memory for the
+     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
+     * the bank is in 'mem').
+     */
+    MEMBANK_DEFAULT,
+    /*
+     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
+     * bank is bound to a static Xen domain. It is only valid when the bank
+     * is in reserved_mem.
+     */
+    MEMBANK_STATIC_DOMAIN,
+    /*
+     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
+     * bank is reserved as static heap. It is only valid when the bank is
+     * in reserved_mem.
+     */
+    MEMBANK_STATIC_HEAP,
+    /*
+     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
+     * bank is from the FDT reserve map.
+     */
+    MEMBANK_FDT_RESVMEM,
+};
+
+enum region_type {
+    MEMORY,
+    RESERVED_MEMORY,
+    STATIC_SHARED_MEMORY
+};
+
+/* Indicates the maximum number of characters(\0 included) for shm_id */
+#define MAX_SHM_ID_LENGTH 16
+
+struct shmem_membank_extra {
+    char shm_id[MAX_SHM_ID_LENGTH];
+    unsigned int nr_shm_borrowers;
+};
+
+struct membank {
+    paddr_t start;
+    paddr_t size;
+    union {
+        enum membank_type type;
+#ifdef CONFIG_STATIC_SHM
+        struct shmem_membank_extra *shmem_extra;
+#endif
+    };
+};
+
+struct membanks {
+    __struct_group(membanks_hdr, common, ,
+        unsigned int nr_banks;
+        unsigned int max_banks;
+        enum region_type type;
+    );
+    struct membank bank[];
+};
+
+struct meminfo {
+    struct membanks_hdr common;
+    struct membank bank[NR_MEM_BANKS];
+};
+
+struct shared_meminfo {
+    struct membanks_hdr common;
+    struct membank bank[NR_SHMEM_BANKS];
+    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
+};
+
+/* DT_MAX_NAME is the node name max length according the DT spec */
+#define DT_MAX_NAME 41
+struct bootcmdline {
+    boot_module_kind kind;
+    bool domU;
+    paddr_t start;
+    char dt_name[DT_MAX_NAME];
+    char cmdline[BOOTMOD_MAX_CMDLINE];
+};
+
+struct boot_modules {
+    int nr_mods;
+    struct boot_module module[MAX_MODULES];
+};
+
+struct bootcmdlines {
+    unsigned int nr_mods;
+    struct bootcmdline cmdline[MAX_MODULES];
+};
+
+struct bootinfo {
+    struct meminfo mem;
+    /* The reserved regions are only used when booting using Device-Tree */
+    struct meminfo reserved_mem;
+    struct boot_modules modules;
+    struct bootcmdlines cmdlines;
+#ifdef CONFIG_ACPI
+    struct meminfo acpi;
+#endif
+#ifdef CONFIG_STATIC_SHM
+    struct shared_meminfo shmem;
+#endif
+};
+
+#ifdef CONFIG_ACPI
+#define BOOTINFO_ACPI_INIT                          \
+    .acpi.common.max_banks = NR_MEM_BANKS,          \
+    .acpi.common.type = MEMORY,
+#else
+#define BOOTINFO_ACPI_INIT
+#endif
+
+#ifdef CONFIG_STATIC_SHM
+#define BOOTINFO_SHMEM_INIT                         \
+    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
+    .shmem.common.type = STATIC_SHARED_MEMORY,
+#else
+#define BOOTINFO_SHMEM_INIT
+#endif
+
+#define BOOTINFO_INIT                               \
+{                                                   \
+    .mem.common.max_banks = NR_MEM_BANKS,           \
+    .mem.common.type = MEMORY,                      \
+    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
+    .reserved_mem.common.type = RESERVED_MEMORY,    \
+    BOOTINFO_ACPI_INIT                              \
+    BOOTINFO_SHMEM_INIT                             \
+}
+
+extern struct bootinfo bootinfo;
+
+bool check_reserved_regions_overlap(paddr_t region_start,
+                                    paddr_t region_size,
+                                    bool allow_memreserve_overlap);
+
+struct boot_module *add_boot_module(boot_module_kind kind,
+                                    paddr_t start, paddr_t size, bool domU);
+struct boot_module *boot_module_find_by_kind(boot_module_kind kind);
+struct boot_module * boot_module_find_by_addr_and_kind(boot_module_kind kind,
+                                                             paddr_t start);
+void add_boot_cmdline(const char *name, const char *cmdline,
+                      boot_module_kind kind, paddr_t start, bool domU);
+struct bootcmdline *boot_cmdline_find_by_kind(boot_module_kind kind);
+struct bootcmdline * boot_cmdline_find_by_name(const char *name);
+const char *boot_module_kind_as_string(boot_module_kind kind);
+
+void populate_boot_allocator(void);
+
+size_t boot_fdt_info(const void *fdt, paddr_t paddr);
+const char *boot_fdt_cmdline(const void *fdt);
+int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
+
+static inline struct membanks *bootinfo_get_reserved_mem(void)
+{
+    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
+}
+
+static inline struct membanks *bootinfo_get_mem(void)
+{
+    return container_of(&bootinfo.mem.common, struct membanks, common);
+}
+
+#ifdef CONFIG_ACPI
+static inline struct membanks *bootinfo_get_acpi(void)
+{
+    return container_of(&bootinfo.acpi.common, struct membanks, common);
+}
+#endif
+
+#ifdef CONFIG_STATIC_SHM
+static inline struct membanks *bootinfo_get_shmem(void)
+{
+    return container_of(&bootinfo.shmem.common, struct membanks, common);
+}
+
+static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
+{
+    return bootinfo.shmem.extra;
+}
+#endif
+
+static inline struct membanks *membanks_xzalloc(unsigned int nr,
+                                                enum region_type type)
+{
+    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
+
+    if ( !banks )
+        goto out;
+
+    banks->max_banks = nr;
+    banks->type = type;
+
+ out:
+    return banks;
+}
+
+#endif /* XEN_BOOTINFO_H */
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 45981dbec0..60565fdbf9 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -3,7 +3,7 @@
 #ifndef __XEN_FDT_DOMAIN_BUILD_H__
 #define __XEN_FDT_DOMAIN_BUILD_H__
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
 #include <xen/mm.h>
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index fee8eac1db..ee29aad9fe 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -7,7 +7,7 @@
 #ifndef __XEN_FDT_KERNEL_H__
 #define __XEN_FDT_KERNEL_H__
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 #include <xen/types.h>
 
-- 
2.43.0


