Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EBFACF88F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007570.1386870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGpr-0006Ac-P2; Thu, 05 Jun 2025 20:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007570.1386870; Thu, 05 Jun 2025 20:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGpr-00068K-Lx; Thu, 05 Jun 2025 20:05:11 +0000
Received: by outflank-mailman (input) for mailman id 1007570;
 Thu, 05 Jun 2025 20:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGpq-00068E-1x
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 20:05:10 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2408::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fb22deb-4248-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 22:05:07 +0200 (CEST)
Received: from MW4PR03CA0348.namprd03.prod.outlook.com (2603:10b6:303:dc::23)
 by CY8PR12MB7362.namprd12.prod.outlook.com (2603:10b6:930:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 20:05:02 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::5f) by MW4PR03CA0348.outlook.office365.com
 (2603:10b6:303:dc::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Thu,
 5 Jun 2025 20:05:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 20:05:01 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:57 -0500
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
X-Inumbo-ID: 5fb22deb-4248-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vf5AAkYsdY9rqGuzQviVB4rpgP7ycKTcJ8tkI71TXoVkbM2gLJK1xuwWhICnaaAZ1FgVjB/WHT4WGx55R70ZkpmGGNbpzMNbJ1nh2EJrjklo171qP5gUOGgsLXehDA7hDB9WSpe8N9+iD67sQqb4BLdXCuMap7QLFwgaTUN52AVIp/koSTd3KMUC3nlWUlzOfLw9nbkW9I+Wej715S6h3yizvuSE3EKilIKe8j9mqESuiOxi22deLEGOJCCx1E40Rb9S621Cd3lway56EX0s/rNAQmqFuCH0amZ3GpZ2YobWmKus69h5qjXP3h/feRWdOBb6HphMIADstqdolMX7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hou+jj44bbtPOsTjw0RXt40/BL0AezOYjWqTEtsXsjI=;
 b=yukSyFN16oOwDmJdRwfMkzed8uWMWkJ4h67rb+hXFKwTh6kFJVUZuKKbeM8Daz6kf08zYgPCiq9nRF1qHYyDtqtsFF0Sdy8D5sv/K0zsE5lNjVBHq0uY1adPhD+UDlcDZwViCb5oWRso5PSZw3fK59GbZdZXuex3OmO1TomRCpQiapUgnGAbfj8ob3fiZ6z/BOTC38iNAufagnZIFKMKRhbgJt5VUcVPg0G1CTRKlKl3lvB+r1WgqEFPRTReJN2YyNVuIQrNSI3arFl08YVQdNzCuHUfmAhN9d3v9hFgqx58yICxlWpoq51U2RUzP+4OLMqTKUQDheK/V/B+eh87og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hou+jj44bbtPOsTjw0RXt40/BL0AezOYjWqTEtsXsjI=;
 b=Ty1LG2/Y6YFnpgs04YbNd/yswvn9LgmmAseHTcfKhQ9UTq0tJ0zlLUMjt9TUJXTn3dwkY8bi+I6l9yEMI9ns3wML9W5szfwl30zzUWP+iT3z+lh790+PDbDF/pIpRa9436GP5ZEeZgmQhFRSDdYPlsgW24FXge61aPo024hY7Ks=
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
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 09/15] xen/dt: Move bootinfo functions to a new bootinfo.h
Date: Thu, 5 Jun 2025 21:48:01 +0200
Message-ID: <20250605194810.2782031-10-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|CY8PR12MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: e9937991-f520-49e2-dc97-08dda46c4117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/PheiT4Ra8FsN4mFx6kKXPjAdh0X2rIRL6pO1xwjpm50KloAe+CeqnUOTLPe?=
 =?us-ascii?Q?EIBVoWLmcRhBCpEZJp1fn1Wx11S4G+O3s4OtXLUCpZ7HpaFVmLrzWh0kWjdg?=
 =?us-ascii?Q?omNjHHGi4fEXeurfgNvJNiSc9thlUWcK45lS1aNZAyxl7PIHCqSatU68o+5X?=
 =?us-ascii?Q?1817Z85fUZGpxjqBYPeo6Ub0OmmgHew+cFS8JyQxaB36169frhjc0OpWoEcN?=
 =?us-ascii?Q?WlGlsll3AKVLW3sq1S6kB8/bVezJ1zgXd/2nEoeUC/tc2g075j6QaR59sYri?=
 =?us-ascii?Q?Xu+FaW7kDSjlGQk28Drw8SVXqFNGRXIdOhA4r63mbFTf9wbxCdDeVe+x3CG5?=
 =?us-ascii?Q?+iCxc4aPCtPV96FxGH3Yy5U5urOUQBE3adRxhLlAE7gokou9t1pVZcBMRraN?=
 =?us-ascii?Q?8dIhx9FABmWMyCbuRjRclxWRwOrm+FOfLEKL5d7PRtx7bYEm1cvDd68am7SS?=
 =?us-ascii?Q?xJtoYH/8W/XcDCeRMBPq2iPfuhfFi8O+oWihuajiPfm2mejcO7ZlbXGmA7lO?=
 =?us-ascii?Q?G4998W035mXH8vnjGRVwUgHH2dnlMG8/Qr3s9yUnq7Bc0e+ibVptmVNnHKDO?=
 =?us-ascii?Q?O7vr/B2QzZKn+I3ERKGtUtVSJ3Qiy7GuDK5aF01X3fVE2G1wo+CHu9bovpaC?=
 =?us-ascii?Q?3IENTrgaOohl7Xje4t95nHIbPwvB6zwALE02k7xhtsZdeLZJmelJPafHGNUZ?=
 =?us-ascii?Q?ASFnp2wBFMBCZeKQozidVzHwePq7M7Jy903WQejKVaAK5s4ky20Hb8xy47Z3?=
 =?us-ascii?Q?18Yp8UR0quf/Wel6jvcUelBRXXzrb+eOZNKCCDnINFilpUqgi/I++FTCoyt1?=
 =?us-ascii?Q?P4vu1uY8iw71LvacVXj3XdfyIIwVZqFmAgRh6hMIzv7VV//oab55mk6IUXGR?=
 =?us-ascii?Q?vgetG7jT3fGoak9ygBBJU1w44ujHP262cKGoQwW2XSgCriXIdyQ7thi6LRpP?=
 =?us-ascii?Q?cQF+JN+7qg5gooKEO6h4oI7UgF8MOHzcT8j+kVD9Ut2vngdeGhtSKtOoEck6?=
 =?us-ascii?Q?iUXC8XixWh9t2kVaJO/NPLMOqn2Gm6xzxIRRGvxX2Av05fQpK/0DmqDr4lcD?=
 =?us-ascii?Q?6xoQCYIzC/tG81ELMCibGSm9FMbABbGZImorK6MJqd432z96H6AcmMZpv/KO?=
 =?us-ascii?Q?qq2AvGM7NQPfWB59sXoPfodTTKqo/sjbct4QoUHiX2vSGD+xBfrh9f1gv76p?=
 =?us-ascii?Q?+5IuwmTbO88XvVp2JnGMypuV19cSL7OOaUlxvDKNEcrBXfoMNMYi3QM+p/BL?=
 =?us-ascii?Q?F0DkCG/zVKjHbYeo6My8EbfUPPXtxvWooN8FMvkxU0YAxlEntahdTG8V2/Hh?=
 =?us-ascii?Q?e0mEKEo3fA5CYKVoMUKV+MT/3rYSdlClaPuqSN1c7Ypg/BLKOYXlrAXPWQhy?=
 =?us-ascii?Q?6y/E4L6Y8MXjr2pwbZEQbvhkXs+7PoJ9+AJ236WPNW+mhYqSdDXos3CH7mt+?=
 =?us-ascii?Q?uI6OX4U+z50gejkNsu2a2T6lZN//6v9lfbaCJtdmiYAQsARtSNRgM/Sc/ffI?=
 =?us-ascii?Q?SUfWamJyYu6O7qIyjSv1ofs3T38fgLMU2z9j?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:05:01.0503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9937991-f520-49e2-dc97-08dda46c4117
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7362

Part of an unpicking process to extract bootfdt contents independent of
bootinfo to a separate file for x86 to take.

With this, bootfdt.h can be cleanly included from x86. A later patch
extracts the definitions so the functions may be called too.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/arm/domain_build.c             |   1 +
 xen/arch/arm/mmu/mm.c                   |   1 +
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
 xen/include/xen/device_tree.h           |   2 +-
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   2 +-
 15 files changed, 226 insertions(+), 218 deletions(-)
 create mode 100644 xen/include/xen/bootinfo.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 5317665555..497cfbe860 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/init.h>
+#include <xen/bootinfo.h>
 #include <xen/compile.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 9c50479c63..77f82757bb 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/macros.h>
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 734e23da44..439b1d9df2 100644
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
index 4047d67c0e..6ccd38091b 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/bug.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
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
index ab449db8d6..7ff62e1e3e 100644
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
index 717cfa0962..69491bdb0b 100644
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
index 809cb3c232..42165e78af 100644
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
index e602cb91c9..80235aa56a 100644
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
index 3960f951f7..0463bfd8df 100644
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
index 1b89986e10..a87b5212a6 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -4,9 +4,6 @@
 
 #include <xen/byteorder.h>
 #include <xen/types.h>
-#include <xen/kernel.h>
-#include <xen/macros.h>
-#include <xen/xmalloc.h>
 
 #if __has_include(<asm/bootfdt.h>)
 #include <asm/bootfdt.h>
@@ -14,15 +11,10 @@
 
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
@@ -75,78 +67,6 @@ typedef enum {
     BOOTMOD_UNKNOWN
 }  bootmodule_kind;
 
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
 struct bootdomain {
     struct domain *d;
 
@@ -179,134 +99,6 @@ struct bootmodule {
 #endif
 };
 
-/* DT_MAX_NAME is the node name max length according the DT spec */
-#define DT_MAX_NAME 41
-struct bootcmdline {
-    bootmodule_kind kind;
-    bool domU;
-    paddr_t start;
-    char dt_name[DT_MAX_NAME];
-    char cmdline[BOOTMOD_MAX_CMDLINE];
-};
-
-struct bootmodules {
-    int nr_mods;
-    struct bootmodule module[MAX_MODULES];
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
-    struct bootmodules modules;
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
-struct bootmodule *add_boot_module(bootmodule_kind kind,
-                                   paddr_t start, paddr_t size, bool domU);
-struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
-struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
-                                                             paddr_t start);
-void add_boot_cmdline(const char *name, const char *cmdline,
-                      bootmodule_kind kind, paddr_t start, bool domU);
-struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
-struct bootcmdline * boot_cmdline_find_by_name(const char *name);
-const char *boot_module_kind_as_string(bootmodule_kind kind);
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
index 0000000000..670fe771a4
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
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    char dt_name[DT_MAX_NAME];
+    char cmdline[BOOTMOD_MAX_CMDLINE];
+};
+
+struct bootmodules {
+    int nr_mods;
+    struct bootmodule module[MAX_MODULES];
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
+    struct bootmodules modules;
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
+struct bootmodule *add_boot_module(bootmodule_kind kind,
+                                   paddr_t start, paddr_t size, bool domU);
+struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
+struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
+                                                             paddr_t start);
+void add_boot_cmdline(const char *name, const char *cmdline,
+                      bootmodule_kind kind, paddr_t start, bool domU);
+struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
+struct bootcmdline * boot_cmdline_find_by_name(const char *name);
+const char *boot_module_kind_as_string(bootmodule_kind kind);
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
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 0a22b1ba1d..7d1c8bc305 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -10,7 +10,7 @@
 #ifndef __XEN_DEVICE_TREE_H__
 #define __XEN_DEVICE_TREE_H__
 
-#include <xen/bootfdt.h>
+#include <xen/bootinfo.h>
 #include <xen/byteorder.h>
 
 #include <asm/device.h>
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
index dd009f01d0..cb211d242f 100644
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


