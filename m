Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78781B0CE8F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051777.1420241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WA-0006cZ-ME; Tue, 22 Jul 2025 00:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051777.1420241; Tue, 22 Jul 2025 00:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WA-0006aM-HK; Tue, 22 Jul 2025 00:06:02 +0000
Received: by outflank-mailman (input) for mailman id 1051777;
 Tue, 22 Jul 2025 00:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0W8-0005aW-QF
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:06:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20626.outbound.protection.outlook.com
 [2a01:111:f403:2406::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a554aad3-668f-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 02:05:59 +0200 (CEST)
Received: from BLAPR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:36e::6)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:05:54 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::18) by BLAPR05CA0001.outlook.office365.com
 (2603:10b6:208:36e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 00:05:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:54 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:51 -0500
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
X-Inumbo-ID: a554aad3-668f-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2W2Fy2qJWb4Mc1tpAYfCTrUnVfAHRFs/qJxVnHDvtfug8Q4VwO2x2qHHSw/YNvWEuB6977+IjO/jMglVH1TX+5VSKtgiM2fV63Ajv5IHX4OtPZA4NM0H+V3h4l9W9SqGpfSeAU4irc5VFgCaJfOfadwJmd8TLI+9K6vacPp+Z/+AxJEwQ/GBljG3tGhcAp2h1pxJ/ZS7G+8dNHEMks7rwWN/6jtsurvwzOmVfVZ1oDqevXgRGyuw2Sy5vBDKjJmAMjkuY4KeU+7dy6AciaCnjaV+wM0ODQDjXkiTEvqCFtMuRF1cvMigQaAJCokB7pyXrOYg/wUpIX4mrf+xEQ34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VD/DcLeGzwzBKqK1Ds0rzAjcSgU2AXEa48oEx1p7Ao=;
 b=kijYSrqdwOPqOSQ7mQnB3M9Oj3uVV3JsijaEplr+m0+TcVL9ofc/ZzT9j8caOVr19ezOPNDGMUZqPHm6ABR8XYO6x4pMgHo10xVl3iErMw7KdJMj+e3Nj+g4ggQ0j9n/hOFS7GuSTzFzVVFwoMTEioRKfLWrEdmnFIqNguQBSa2dad4VvLThY4+CJgGdAJx8VxcGldDaKZOiYHyQmdTq+qW7TGbS2xJUKlPgG8WLXKdQk//1qZqu31lFLOc0VxxtFKirErafTFH+155j5qBnpgfvUZM7/YIIOC6jfCu3vT5mwFmQg82SCOGppO0a0sGqO9AkUIs/JZzA8Zp5UxJx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VD/DcLeGzwzBKqK1Ds0rzAjcSgU2AXEa48oEx1p7Ao=;
 b=AsHWy17B+lhCkyY/svoE5x9XlaubBxYzrg53i7UbBygTMkYUlecMNbL2DrdYLzcoFBdYLiY9eMxyBHHG8J2qWvbV40TjDo+ZClYbcoU5riQMNCqKe+lovJ7UZpyp/gbdgC3Jz8H3w0odzLzFzCWNJuXqnDc7jZ+uAiW1Q/Mt5jk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v8 05/11] xen/dt: Move bootinfo functions to a new bootinfo.h
Date: Tue, 22 Jul 2025 02:05:17 +0200
Message-ID: <20250722000525.7247-6-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b992ea-e5a8-4e4d-ce65-08ddc8b386d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yjuB0o06jjGgXZlg8lCP9892qt25yLcr2H15SgAaN0tYxp+p9zkJHhyJ475v?=
 =?us-ascii?Q?UPZP9LO1gjuCkLw3/bfTLs9TCj3m9jpa/YVXtvxU4AKwWMEgDEMPLN81l88o?=
 =?us-ascii?Q?v4IVm4Mi/YbxjSMXuv6N/7PyYA9AOiMT5pL2Bzq3JJWBRx66gITuAbuEIKB4?=
 =?us-ascii?Q?ntnHBD6EajYWVgpMQ3QX9p2ZSPyNn4zfSXZcsAng0Fzg6hB+bV0nrWCkjT6v?=
 =?us-ascii?Q?CVAWpmwADNdmopS6xj30VbwtXmQwVJDwRV2qlLuaSqurp1oUI5bnByCjzz1A?=
 =?us-ascii?Q?acI7ffhM4U/5G4/opHeSYrjd1pNiLiO3WK0PQiVB7bBw1hVrt36BT2B54lro?=
 =?us-ascii?Q?01p689os9yqrs1ifTiG17vZixH8UOD5p/oOJOGgGCRlJFGdJiGTWIj2SCibU?=
 =?us-ascii?Q?IYGzWRhMoo/iXZAX0fjZWMFhF40iQsC5uiU2Hd1LEqyhfCL9HZYyy1D2DT1R?=
 =?us-ascii?Q?WIVCWxHakwhkc1xYw1UYSCBFlaf3lW+GgDobEr3fcJfvatNVhtsJ1+aN0C/m?=
 =?us-ascii?Q?MNGwPQ8YqZc7iygMUv4usAR7EXA1xZ52a07cdVZQqLo2tEugyJiBNc2QWHqc?=
 =?us-ascii?Q?yzxUHraHxYT4TOXrEmQ8AlIeWjh2CVVNPbQYdGx13lD/RNKg+laiR9ra3iX6?=
 =?us-ascii?Q?SCwK6kftOhvJJcyR1fzk7ILGlqv/hDS4at3bbxlMaQN1jCcpcMz8Tb9u3htG?=
 =?us-ascii?Q?NCTfAYybm0R/tbXGwk1778YjXrgOGVb1jgC6u2CvJfyXHvZDKdxHR1hhZSjq?=
 =?us-ascii?Q?Uf8eJqoJmSxM8VUlW2Z+6faDrvX2kAftqZBVKdVco1WIW8leY01JZosDfZUA?=
 =?us-ascii?Q?f1zeiRlAiVilq9HGe5/ob8oB+HlyK8GFVLwrkFPyMky11d9plCROlQvHWrLd?=
 =?us-ascii?Q?KMQHyDoGhTEpG5RGl12SeJZGEr3ArLMS+o8iRD31Y+ifyDDGtqJa1H9tTw+Z?=
 =?us-ascii?Q?lOnt/S1joAXxe5YNLt5XLJDo0INhgnmB/6RtQ7zhQCB3sh9QTLUbuokqg/Q1?=
 =?us-ascii?Q?UtIoTyYssNDL99SzWyAr2twdLdxrOE9Aj6O2pcU5maxCiQEF2vDCnL+oTikW?=
 =?us-ascii?Q?moG5tUpvYBxIwF02HzxeAndbVoJG6/6Hzlor5DtIJJE5OAAGqIZOaACAq4PR?=
 =?us-ascii?Q?rxcIBhIJz3l7fJGSun7yGel3i64g1SLA2Bmobiuf22zayeFGPtLWEES+wOwn?=
 =?us-ascii?Q?DUoWZdJo/szLw8eN3OX23Ty4COD9eq/2inMpgJWyR6tWXF9H3Gk7EjSICViv?=
 =?us-ascii?Q?AF6VAP/0Hh3OQPe6DD/R+8uj2O6QSOrDoIjCjOEIPgK+3bjcz5+Vqaj2ygFj?=
 =?us-ascii?Q?mL6F27VisayTcjoecLP1BFIlXiuIY+gLs+iH2qB5VB47JkBrTypFW/TP+Tw8?=
 =?us-ascii?Q?RuX1+0xwYQ64t0xyZ04sexFU7I3+UUeL6bjZGA2WLa79YAOO3OE0/Q39NDAr?=
 =?us-ascii?Q?l988zcaETQJi6DPCWT/R0pckV2vFnsNHIIzwUp8hpqWH1CtRPfjgh0TEMq0m?=
 =?us-ascii?Q?M0sTW9hIGIS+Qu8tpg2TLC0b58SIH7FuJELe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:54.2580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b992ea-e5a8-4e4d-ce65-08ddc8b386d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094

Part of an unpicking process to extract bootfdt contents independent of
bootinfo to a separate file for x86 to take.

With this, bootfdt.h can be cleanly included from x86. A later patch
extracts the definitions so the functions may be called too.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com> # riscv
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
index 5f81d060dd..d91a71acfd 100644
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
index a17096bf02..483cdd7e17 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,7 +2,7 @@
 
 #include <xen/acpi.h>
 #include <xen/bug.h>
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/compile.h>
 #include <xen/console.h>
 #include <xen/device_tree.h>
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 48ecbfd600..8ed8e06872 100644
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
index eb1b2b729d..c637c45ad5 100644
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
index 15b3c4b241..efa846da2a 100644
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
index 2fdea6624a..95b383e00f 100644
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
index 93c5c357b1..5719bbfb93 100644
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
@@ -116,77 +108,6 @@ typedef enum {
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
 
@@ -220,134 +141,6 @@ struct boot_module {
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
index 3a20623cf5..886a853816 100644
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


