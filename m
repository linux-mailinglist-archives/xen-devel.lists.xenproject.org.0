Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42BB0D8B9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052383.1421032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfV-0003T8-Np; Tue, 22 Jul 2025 12:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052383.1421032; Tue, 22 Jul 2025 12:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfV-0003Qk-Jt; Tue, 22 Jul 2025 12:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1052383;
 Tue, 22 Jul 2025 12:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfU-0003BS-7o
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2417::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 712e1591-66f3-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:00:22 +0200 (CEST)
Received: from SJ0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:a03:3a0::23)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Tue, 22 Jul
 2025 12:00:18 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::e) by SJ0PR03CA0258.outlook.office365.com
 (2603:10b6:a03:3a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Tue,
 22 Jul 2025 12:00:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:17 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:13 -0500
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
X-Inumbo-ID: 712e1591-66f3-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9gATe4N8/hBHQbPmM/y7fByYbnfQkJ36d5Irzao+EXuvX3oZiERjcZ1ClObQZgf6G9+D21s3ATfYVcZM96PACoiIBGiCae7047Py6DW1D9Z37U8nKni+gL17O6er+QGxF8wzW6yqohCDtj0Q1nWm33iEcQJcUVmOaa7MOs+fzoghA3AA+l9yPsO69fmMRwf8WKmujqheLndYgo9nR+QgNTuuFwzXvCQKXKXujfi4S9Ve+c3SDu0I7vE+KcYX3t2oGGtJw4bbBtNsIk+vAYPWjgPE+XZYwbhznI30irKustQvNk3EorfwFfuynpMGDHl01dYZ4pmUvQcs21K/DwB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1/5OFq1gbtJJ6A7xso/r25O8itAMz0Qml0RFbnHrkY=;
 b=PZBiVxdb3xhaHqrcd96qXTvBb8BatO42CEuCSQ8NQT5z1edkiq2FpF161SN3nX7pfY3VjCTgYveLv+kYqa4rjQ3T6iL5dhvC+vfo7jYVzSnjbkR8VVcKuJd9iBKJYXAmeLv773eO7c9V+BnjDe+OHwFfpvmMcG4M3RWbFqI/hIR0UfNhaz6988vH6t+KdLCSdj+vYzeJ+1+TesbSsP+a7Hyjmn/pvSI078Vvu/1K4GGkG4Ti/OzB0PFSs4bTzYVP3nRYa070qGmLiu0/Xvgf+6HIyLikgDgJaUpkiCYpLi0RST3rAZkM6i9UL+UcGMOqCJX/CUj9vYW/61sMHKGXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1/5OFq1gbtJJ6A7xso/r25O8itAMz0Qml0RFbnHrkY=;
 b=5JT6OnC7rumJ2JCO9RpK96QL3gf2+TyTY2NgvO+sQgEJKONcUu78hRR25CgbzfjeFhkc97Gk9lvrrdUV5pCjvb0pKPp1juLeouP823glGJ9KAqf8b1EG8yfi96pbshZFLksnH9SxwE8o2LkXrQbfhgit4l1IDcYEonMVLi2KoaA=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 03/10] dom0less: Move asm-generic/dom0less-build.h -> xen/dom0less-build.h
Date: Tue, 22 Jul 2025 13:59:43 +0200
Message-ID: <20250722115955.57167-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 135fbb3b-ac38-4d13-dee7-08ddc917538d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5JQiIiBnyrLF/ogA5jXDD/2stU4y3o2HMVrZLV7rxv3JsxjSdGQdkhLGg8QW?=
 =?us-ascii?Q?qXOwE0MgybJUpDLt5DUklP1s8Yhe2cUjY1PQoAfCydLOo3ynv0eZ9VDCaZHV?=
 =?us-ascii?Q?fNgittoL8KZMb3c/5QBLM9CxzbR6rRfpwC54KWa6SglwkwgER4duOTvRSiYw?=
 =?us-ascii?Q?wwSYEsOEkFbYNjg7+nkPNwwNxeruE98HAUcil9CTXjurtlPJdOFd+Z4JVw3i?=
 =?us-ascii?Q?vOXW4Z9mGe0hWYJtm0HBdFnfDmBtaHZX4ZuVaCWAihz0zQGS1dynux0Bh+Ve?=
 =?us-ascii?Q?hnRTQ0SMqvPE7vRn9/hSceEHt+FcSxRHEDuhQVyijO0wtwtDY3D4I3i0fazw?=
 =?us-ascii?Q?xAmnmtHUD0GBIP6Q5Yz4IYpagbXabJ2y3EZfZ3RheyCy8Y/A1xldQWXmIYSd?=
 =?us-ascii?Q?W86Inn+QpoSmYmlpjmRUMhul/YWB/4j8yom5FPbysWTGxdLOyjNm2C8alfrr?=
 =?us-ascii?Q?L0jsgSpYRUG7qTHXNmuhpDL9Up+W8KtFqL7J6Z0E1xQs36pakIadhIVp8lG6?=
 =?us-ascii?Q?4Ox7TmbGSWK0tebPUxCl99h12mmlwZqtGCdrJVOl4xrIssWcLKsYR3wP1fQv?=
 =?us-ascii?Q?E/RcP/IYlXqZbt20lsZS3srSZ4zJuwE7PnPt+kobfZWXAFO2S4yP6WGTqgrj?=
 =?us-ascii?Q?oXqaghkTEl3Km1in9Ke9vFHe0N/LUXDNej7m5XSDKlVXKhxwvp9egGl7nJ1S?=
 =?us-ascii?Q?PQH/1TbUQDqE6SQ7cHe6uWrbX51eXgXpjmnZezQnTe0svIbjDgl/Pk7tq9dG?=
 =?us-ascii?Q?o+zvT+6ZqGGcSIMDpJmsxq/tTMp5Hfr0Jw+sYfe5GeqOzIFHSOdC91+dF29m?=
 =?us-ascii?Q?AQgh0/7ft37ncbHyfq4XswCwf6gi+PBdSxjn5NkodaeRRbwy4HeCSy0jM0/K?=
 =?us-ascii?Q?aD5pGUFOC/JBo8Mw9F2A4g09asvKXpqZnfwmpnSFGH1LzrzmGgOcRaEN30zV?=
 =?us-ascii?Q?GlB/IQddo+sj0H/fGPzvjkvPCamy7q164ChHbHIJYICuFKLGdQgkRaFd/E+n?=
 =?us-ascii?Q?rXzBkPjpf868OPSk48exp6D8rvU023O8GPubIFp8mvuqLZF872bDH4pHTpDA?=
 =?us-ascii?Q?whq9rEBdpExV2UUE3/f93L73W4HkhSMPoVNdFDKBmnGoSLkEgrsLFfAO/t5I?=
 =?us-ascii?Q?4GdbC+WC9GFd/FPv3EUHUzaYT5NX/HA4wAjmjtfpn1d2Mlv7Q1PO5gDiWJoV?=
 =?us-ascii?Q?mkuI/Kb4kJTvy8UkooQ2omoNag4abvP74hV3OiZ5GZb9rcyWBpjLpsfPXGVx?=
 =?us-ascii?Q?cUbVM4T8F++f0lfZS9dsBdPXoRZCpzBG1swueH01deJcqBL9kZ20kFKmoF/L?=
 =?us-ascii?Q?yAWuMd/3+6NgRNqelsCSnT/qRYlZwsApYMEzMJCQnic6YFSUEJVksCpYZwxc?=
 =?us-ascii?Q?IxrwWfYC1S4Nm/vtVxN6ZPI8b5sSSsDctIoRTjMTsznsFTkkzb9jS7WsOB3D?=
 =?us-ascii?Q?sFefeHiPK8oocuHwyQ7SCPRKEkn9nrSYj2WZhHCNK1YTNC+FK80jE9aIqbpZ?=
 =?us-ascii?Q?3CSTeny5FsfseYfQz8VQamOx4kysL6J2AO/X?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:17.8609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135fbb3b-ac38-4d13-dee7-08ddc917538d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931

It's meant to be usable by anyone with CONFIG_DOM0LESS_BOOT.

While moving, replace an inclusion of public/domctl.h by a forward
declaration.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/arm/dom0less-build.c                     | 2 +-
 xen/arch/arm/domain_build.c                       | 2 +-
 xen/arch/arm/include/asm/Makefile                 | 1 -
 xen/arch/arm/setup.c                              | 2 +-
 xen/common/device-tree/dom0less-build.c           | 2 +-
 xen/include/{asm-generic => xen}/dom0less-build.h | 7 +++----
 6 files changed, 7 insertions(+), 9 deletions(-)
 rename xen/include/{asm-generic => xen}/dom0less-build.h (96%)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 69b9ea22ce..286557fafd 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -3,6 +3,7 @@
 #include <xen/domain_page.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
+#include <xen/dom0less-build.h>
 #include <xen/err.h>
 #include <xen/event.h>
 #include <xen/grant_table.h>
@@ -20,7 +21,6 @@
 #include <public/io/xs_wire.h>
 
 #include <asm/arm64/sve.h>
-#include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd..463ae4474d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <xen/bootinfo.h>
 #include <xen/compile.h>
+#include <xen/dom0less-build.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/lib.h>
@@ -32,7 +33,6 @@
 #include <asm/setup.h>
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
-#include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
 #include <xen/event.h>
 
diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 87c8821421..4565baca6a 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
 generic-y += device.h
-generic-y += dom0less-build.h
 generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += irq-dt.h
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 8abc1d641d..27bd3f5a6e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -11,6 +11,7 @@
 #include <xen/bootinfo.h>
 #include <xen/compile.h>
 #include <xen/device_tree.h>
+#include <xen/dom0less-build.h>
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
 #include <xen/llc-coloring.h>
@@ -39,7 +40,6 @@
 #include <xen/warning.h>
 #include <xen/hypercall.h>
 #include <asm/alternative.h>
-#include <asm/dom0less-build.h>
 #include <asm/page.h>
 #include <asm/current.h>
 #include <asm/setup.h>
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index efa846da2a..e49213e763 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -2,6 +2,7 @@
 
 #include <xen/bootinfo.h>
 #include <xen/device_tree.h>
+#include <xen/dom0less-build.h>
 #include <xen/domain.h>
 #include <xen/domain_page.h>
 #include <xen/err.h>
@@ -25,7 +26,6 @@
 #include <public/event_channel.h>
 #include <public/io/xs_wire.h>
 
-#include <asm/dom0less-build.h>
 #include <asm/setup.h>
 
 #include <xen/static-memory.h>
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/xen/dom0less-build.h
similarity index 96%
rename from xen/include/asm-generic/dom0less-build.h
rename to xen/include/xen/dom0less-build.h
index e0ad0429ec..34b9884cc7 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
-#define __ASM_GENERIC_DOM0LESS_BUILD_H__
+#ifndef XEN_DOM0LESS_BUILD_H
+#define XEN_DOM0LESS_BUILD_H
 
 #include <xen/stdbool.h>
 
@@ -9,8 +9,7 @@ struct domain;
 
 #ifdef CONFIG_DOM0LESS_BOOT
 
-#include <public/domctl.h>
-
+struct xen_domctl_createdomain;
 struct dt_device_node;
 struct kernel_info;
 
-- 
2.43.0


