Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E7AC8D5A
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000787.1381018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyZb-00065G-In; Fri, 30 May 2025 12:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000787.1381018; Fri, 30 May 2025 12:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyZb-00063H-Ff; Fri, 30 May 2025 12:10:55 +0000
Received: by outflank-mailman (input) for mailman id 1000787;
 Fri, 30 May 2025 12:10:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySZ-00076q-1i
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1df1280c-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:36 +0200 (CEST)
Received: from CH2PR18CA0050.namprd18.prod.outlook.com (2603:10b6:610:55::30)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 12:03:33 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::cb) by CH2PR18CA0050.outlook.office365.com
 (2603:10b6:610:55::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Fri,
 30 May 2025 12:03:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:33 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:30 -0500
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
X-Inumbo-ID: 1df1280c-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=er4yNbrgfoIxWYUQu2GXltxuOcZFeF0f2pItFaP8Y4wG9kZwd+p16/QznjJp41jdOBGqVNfePj8o6QhbGyW38Xxl+P3KPHOupyj9mheWKxxrrHbZI+FjF3S5dkl9KiELnghHXHAqkUCeRCCvDPYuJ2hc5WZ16w/qki3daK78vTi/CssESsrQY09fnJiiGeI3fGW7BjPPEbig/Kc3QEYdOzjBG1eWgYp63FVEr8MyFvitU4CbH34POMt61j6yfUIW2odS9MlLVCcRSD9Klx3pnawS49NnKWpzcW6lgmsxj+C9rnMsiwcy8V2Fqnh52D8VGBf2olhvtcZpx5awlkpntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFTCTDGKnZMY9M9/WqL/G3QIpXNSv/jD/qzSC5480UI=;
 b=FUQR+dPAPFrL3o4L1G8r97NZJ1cxoOGrq2lp1O0RcqLnDIjGtSc/SV16gFXLejcRYhqX2De0nbx6cZGzCdp15pZonJfbdRRGB7cFJRHGFl6MhBrhQI9vzxdN9UbQqsIgYiSrS8YpKNKGzOrG6hnfuRD2oJ5YUfoZ09M6UG7Lx0jcwI0VIYr/jVTxanq/1z0AJUZjewgIeSto+vubiF6LuUdkCWEdVl+IJOU1nA7e5rAwMMCsrICY1m/Pyd0Q91nGcIYs0hELO2Y/Cflb75lSvY5dBmz16K6D/Fa6S9r57ESZ8QY0Ucub0zWRcseofoGhtX0A+8DNkVETwXsyj4/WeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFTCTDGKnZMY9M9/WqL/G3QIpXNSv/jD/qzSC5480UI=;
 b=0mGnLmoi7Unsl4pNtYxCYTHes9+Fi7v5Xm9Qzxj/drKyiRqX5L8/37ofuNMjsSXwqVAdTa0O9OyzXB8bb0FWDet7STLiU/XpztUJ46prxeTlJ0MZ+uqc0CGgmueYPJPMqk+mvPIfENzO7srOCCs7HpDfD5g2xiFVXVdl93c4gYA=
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
Subject: [PATCH 13/19] xen/dt: Move bootinfo functions to a new bootinfo.h
Date: Fri, 30 May 2025 14:02:21 +0200
Message-ID: <20250530120242.39398-14-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: d93c18bb-7a32-4d36-a75c-08dd9f72001e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jlK67OKg45TK2mQvrJH8pJFhxXTZyeEw9AfWajM0FmXZl8V8DN1ghJxFQQOv?=
 =?us-ascii?Q?Q90tR4ZZkdIoty5RyoxKXKdGGuNbYDqcqeIrhGdYnR2rIeQiAc1TSAYKheh2?=
 =?us-ascii?Q?8ehQky3kSvWzt6cTCX4b7CelS32r+UAarBGqg7K/oIm6Fbs2EAIT3Ei+P95j?=
 =?us-ascii?Q?XkXpr8pp3CRssD+FRFJwoMwa306Jk+KWFXIsi7P2rdg1G9nxIf4ashjpEfPr?=
 =?us-ascii?Q?9282YkwAc3cFqRIxrYBTpsbQfeUlcQydAoF/6GCnuCebl2sE5kFwPSlS+Iqq?=
 =?us-ascii?Q?tyt6kfDoqdiLZWPblSA5Pnr+7c8ajJLAaWzSl/Ix8rVE+z6fz14er6QtHc/9?=
 =?us-ascii?Q?UIolpsT6J726hqeMH8qTqJzwEvvLw9WUQgwyrI/2oVd95eK7o+p6I02oA4G2?=
 =?us-ascii?Q?YcvAKpJWqbifm75LJiba9fHfbW/zWm5WEnurxrHXpIDbGpAZm/pfxrlqNz2u?=
 =?us-ascii?Q?cLGab6d2TER91pcdyZILmKgJb8V2kpFJTVfVrf2UuwiiGQlJ2dp9q0rhO5nj?=
 =?us-ascii?Q?QVp091/IhkqcWTKd13n23T4ccZFr7sig8qdObnxYwRK+BO2Swp9sEy3f9i9m?=
 =?us-ascii?Q?9JzQ+7Pq2HmqT1eikr68m1AFdB9zL3UAJQ/VeQskWepfn9lSnmX2e3wMfwzY?=
 =?us-ascii?Q?JuRaZUNwAZWFOCQitNzaENJnU1YZ+Sr/am+oqXz3eoCcjkQDV2juNi6x1boH?=
 =?us-ascii?Q?WJXuCWGEdqGFKWyA5KtzgkFxcDdbRIKa3QWZhK2TT/WuLEW24IhEiqDkqv30?=
 =?us-ascii?Q?cHZvjpIXvh5LYBYM14yx7Ei6A2lhLbOSAoP7OMpsfJrx24MvXpof0VXMf8zC?=
 =?us-ascii?Q?NZK7Nz8amNNurtlwKjPyyHQF1nJ1FhXlriqFlR0rubEBtHorXjdwQ8vXZJOQ?=
 =?us-ascii?Q?WopYs1il3dbxZVjS3d2NtRCICGYLAn4NHh31SU6yG/WYDyicALVkbpxne4A0?=
 =?us-ascii?Q?yQUdJH35tQgjsV0CdJ9FjmpD0I4lPWaahdbH1VreTcWc1rtsMmlBrpcakQnB?=
 =?us-ascii?Q?B84/600R+0tX6jbK5BoTTzqGshNf/aAHcofSSFu94tH6CiU86i+ISusdp+V+?=
 =?us-ascii?Q?kM2+Rup94/0snwUSPLrdlLnzQgE5QalEeXVF10jjnIO8G9sbLArTjojKUlGh?=
 =?us-ascii?Q?desQN7CjVzweYes5Bg33UjNmfVaotTDR5QK9U8h4Sg+eMV8l33cHTz8KSgSF?=
 =?us-ascii?Q?sPVdM37021uccNW54qlxP3Vu3YoBzg1Zm4gsj/lz6S5VapWa7lcU664Q7Vsp?=
 =?us-ascii?Q?EfgBRfdtOXTk1Gt6qgTwFwtYnPTVm8+mdu3REb8QkZykPE6r4D21wASvYIaY?=
 =?us-ascii?Q?BIJm6tIKcbMXDDVcncJaA2VvEHNI+gMg3DVT7Grd5yJmJlcLbcW/tsAR0QlY?=
 =?us-ascii?Q?SnYzjmB+riawhvcdFxp8hVjA48DcJirSno3NsOKt87GJr5A8+1wqEpi7hkdh?=
 =?us-ascii?Q?JTDkIt728YCaPtWW2ktOa2OixRUc5rKITY3pBUiLcVXf3UqzL3CiLmjT2rPe?=
 =?us-ascii?Q?40jeyRF33msasmMoUhBtVvL2tCCst2ZRP0hb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:33.2956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d93c18bb-7a32-4d36-a75c-08dd9f72001e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

Part of an unpicking process to extract bootfdt contents independent of
bootinfo to a separate file for x86 to take.

With this, bootfdt.h can be cleanly included from x86. A later patch
extracts the definitions so the functions may be called too.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/arm/domain_build.c             |   1 +
 xen/arch/arm/mmu/mm.c                   |   1 +
 xen/arch/riscv/mm.c                     |   2 +-
 xen/arch/riscv/setup.c                  |   2 +-
 xen/common/device-tree/bootfdt.c        |   1 +
 xen/common/device-tree/bootinfo.c       |   2 +-
 xen/common/device-tree/dom0less-build.c |   2 +-
 xen/common/device-tree/domain-build.c   |   2 +-
 xen/common/device-tree/kernel.c         |   2 +-
 xen/include/xen/bootfdt.h               | 206 -----------------------
 xen/include/xen/bootinfo.h              | 212 ++++++++++++++++++++++++
 xen/include/xen/device_tree.h           |   2 +-
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   2 +-
 14 files changed, 224 insertions(+), 215 deletions(-)
 create mode 100644 xen/include/xen/bootinfo.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 11cc03e5db..c53da76682 100644
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
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index d3ece9f132..040db73d00 100644
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
index 4e416f6e44..0a2d0dc1eb 100644
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
index 529c91e603..fb4ac06390 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -6,6 +6,7 @@
  */
 
 #include <xen/bootfdt.h>
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
index 39cb2cd5c7..c798807560 100644
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
index 6b8b8d7cac..e5d34dd89d 100644
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
index cb04cd9d50..d02440cc2d 100644
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
index 079259c719..766956e102 100644
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
@@ -75,77 +67,6 @@ typedef enum {
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
 /*
  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
  * The purpose of the domU flag is to avoid getting confused in
@@ -165,133 +86,6 @@ struct bootmodule {
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
index 0000000000..bf7516ec1f
--- /dev/null
+++ b/xen/include/xen/bootinfo.h
@@ -0,0 +1,212 @@
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
index 2f0ee42ebc..cb7ddc9807 100644
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


