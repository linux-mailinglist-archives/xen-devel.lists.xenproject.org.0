Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3144AFD61B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037032.1409729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCje-00076c-LY; Tue, 08 Jul 2025 18:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037032.1409729; Tue, 08 Jul 2025 18:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCje-000730-Dr; Tue, 08 Jul 2025 18:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1037032;
 Tue, 08 Jul 2025 18:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjd-0006FB-2g
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:08:05 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2416::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bfcde34-5c26-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 20:08:03 +0200 (CEST)
Received: from PH7P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::19)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 18:07:57 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:33a::4) by PH7P222CA0025.outlook.office365.com
 (2603:10b6:510:33a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:07:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:07:56 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:07:53 -0500
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
X-Inumbo-ID: 7bfcde34-5c26-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8hYMMck3rnGgNokGh/d7BEwpDCpGh9BSwp/K1fPt3/R5V0LvPV3UQIPIAPpGvPMDppN/MRjLXrX25+R6JmyIZqPsCq0gj0QSxxx0UCmXwkXy2CIUNRts4ZhUSglGhZZEkNBRQL7uM1op410f/rfs/x7gVtrkVKe3AkwUoGQtdd4R+how2wgG0z8Hgzhx8xKLyeFempBfVyK83zN1pBsq0SFMxKhZf+uGcE8gRlIrPVxs+An9AX8nGXJ5EWqMnNL8UCSxWIQvE+tAOo7LsoEGbMO5W6pnoDAyqwFZtbx/MkYd8yiPPON5BngkOQzS88RSAkZctjLsQXvhnM4tzPrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+W+f63IbQpmhlxaRGLVgLNdQl9GDcAPN1xFyEdoTN5I=;
 b=QoB3R3wQiOMAads0Z6ai5tm0U2R2Ydiuq/5vPfTuKVjyYul+El2aG38mhG1pJGngdWVzSvXPhQhnniOIM/wEiBlH3j/Uw7PCQTDXP9gkHBPGuazloO9EDONptK0BCMbh0lrRxObHSqQqa+/bpB3YBWIPlpY3XOnMuvjRzclkZwB/fnVwQGMJH/tmcDhGTArcqA+w9+oKqvZvoSmx6F8KBulGzl82luoa+p4eDefFqlX3Jj5YszZSFHTiFRDRgtFsA7YWvOKHVZz77IYVvBzxs5jkSac4mrdPIynViDC41tFptnDXGqS46l1c4QzXPGsjsEiHcpST0wB7B5mhMW+kvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+W+f63IbQpmhlxaRGLVgLNdQl9GDcAPN1xFyEdoTN5I=;
 b=vo9vGfj/PYyqOsZgj8fL0CSNFZpXBrtf47pByWF2ABpXeXj64ZJaZIDIlRbQ2r089gkTVqw6FjTAlY3D+FNbKna7K2W5xfWIh12HmHXn5et4hLx20ky5d5z7rbdyM5EZ93/g2QqtpYP+hxBgBaYuKewuSSTNNTAtOv89kc4aCWg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v6 06/11] xen/dt: Move bootinfo functions to a new bootinfo.h
Date: Tue, 8 Jul 2025 20:07:15 +0200
Message-ID: <20250708180721.2338036-7-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b0884b-d86e-4084-3daf-08ddbe4a5dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JN2eq88fynQVAG6D1wBlxW90mEldHEywHDaE+SMKjVZwN7OsqmZAYu8I5Ilb?=
 =?us-ascii?Q?os0TgPor5mJ4xTwseXvF9tuqq8FxkV1+09sj+SXEhwHeilEJoEIADPsPOOA3?=
 =?us-ascii?Q?a1EUzAyCKb76cL+ELJUZiMu713kyV89u6naiHayPJaeauG01KGPmSQwyZocG?=
 =?us-ascii?Q?Zl2MLfhOB9hOGi8NX1DjNpk9MsVVfAxWBrAfzEqoPz8c/Jh84GTJCYGzW7jv?=
 =?us-ascii?Q?FJHNedFb3I8cRm5++1IsIor3Pc+YEYtJuitgr+fm+VCyGFY2Cxt192d35qdG?=
 =?us-ascii?Q?MFcrK8AjWUptmtRYtq1OUwnn52BczWTbXItHlndkDhq81c09tiaxWpMrY5xf?=
 =?us-ascii?Q?yHTCPnQCi4CSOjP4NbnE0Uwr9GYQ1/M5cyq95Y0f1vuwgLiNq3BfyvQG/ku3?=
 =?us-ascii?Q?Wc7jusZ6B86PHht9pFemSDR0bKEzLZK0XuDP0PXs1GBfZBT7PkcDdDdinmIl?=
 =?us-ascii?Q?idN66iIJW61aJRwILyv9SHRkLtktKB7s0y6fhfyfzNHrj5sLWvxrdN0sxUW5?=
 =?us-ascii?Q?Uao8apVj+4QKc7XS1CQfy1UNGBjDagDo/bA33uvH4uCryVEZSTdVWpQTlVGq?=
 =?us-ascii?Q?AdfaHuArCnvUHfAxEiiJsvCgfvEo5Ii1sZF3X0ZhPmO6IgsPQvxY4XLvaIbu?=
 =?us-ascii?Q?MgOfXoGl/x+RXVdpR95MyotojjGKyzAL9FN7EQE/7w5/rZuaoDvrQ3GYd7ja?=
 =?us-ascii?Q?eYXRBogOIMRM1SijCH/BWpa1Kx70w4YqUK4i6ZW2WNE0iYovV4r57MB5+IoN?=
 =?us-ascii?Q?LgmS58a4aOdgKEXl1SGvtVs5pmBqdqc1vAqwDYt4Xm4r//Tjc4N0CPYPALQ+?=
 =?us-ascii?Q?LCZy1D1Jkn0EVvyfoLnjQPP2YgIgk8q4oG1Lec4J4gQypdfeHqvva+SUkHgJ?=
 =?us-ascii?Q?5gXDgl/s7BwMvFpXerGzMtxr+d3XLafmlfl59qJw4ChKUAayWB61gO4488vS?=
 =?us-ascii?Q?TF/MJZJL/NYJd5KD4/7iI+JTyDJX5oI4mEB2gOd/UbZORkW1Glxviw1Z4T3o?=
 =?us-ascii?Q?iIOMvhA7gbm0jYQ0BrFpjsfWwu8Kll8Ws3RQ/sd9t/1Qr2Vb+DtMUu2/yN/i?=
 =?us-ascii?Q?rvALzQFdghs1pR3XcUzFm7yiW2/Wl6oDiyBT4uABglXmb+hscqKqseC4ztnX?=
 =?us-ascii?Q?81b3pYfTwWzJoHVEl89F9aitZ5opsBjdY1sXofXIWBa0p54khKTlfjKNOqaz?=
 =?us-ascii?Q?17/e7h8Ero7qKNInD4f27F6qnx2FimzCm70hBDjF+mIY1KNgUNZQrAdMEqq9?=
 =?us-ascii?Q?8dItsK3aHJgfcbnDGJ8X1WWfn/Aep819TEbXKIlx4f1HiJBmWTk4JO7aqq1j?=
 =?us-ascii?Q?adwhEtkNE9moBLPB0/w79rPdJzVJ5U8iR5zP4EZ7syQyi48k9P+m6AFI2NGq?=
 =?us-ascii?Q?YFBBQXDoKesh64id4gCswbhR8C5iLcyt/QyfP2KM5Kg/1vSY+NPO9o+78R12?=
 =?us-ascii?Q?MXi6jUPPVlAP4WvvPTU5KflgTNP82EIq9KSYahGyJoBud7iZ5tMkVlccoQoT?=
 =?us-ascii?Q?ywjYSH8SXLu1G2spemt2yvhCXjVCNoPoZuYP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:07:56.5864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b0884b-d86e-4084-3daf-08ddbe4a5dc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451

From: Alejandro Vallejo <agarciav@amd.com>

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
 xen/include/xen/bootfdt.h               | 207 -----------------------
 xen/include/xen/bootinfo.h              | 213 ++++++++++++++++++++++++
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   2 +-
 14 files changed, 225 insertions(+), 217 deletions(-)
 create mode 100644 xen/include/xen/bootinfo.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index edc9a82c15..b66a172eb8 100644
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
index 12b76a0a98..8abc1d641d 100644
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
index e950691d1e..93734e0ea8 100644
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
index cc14bea195..2efc1f57aa 100644
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
index 6de2334dbe..ef393182b6 100644
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
index 6cf6c1317c..b886f18027 100644
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
@@ -104,77 +96,6 @@ typedef enum {
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
 struct boot_domain {
     struct domain *d;
 
@@ -208,134 +129,6 @@ struct boot_module {
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
index 8363865282..33a60597bb 100644
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


