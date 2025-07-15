Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52150B06485
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044622.1414730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubijS-0000dd-Ga; Tue, 15 Jul 2025 16:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044622.1414730; Tue, 15 Jul 2025 16:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubijS-0000bP-D6; Tue, 15 Jul 2025 16:42:18 +0000
Received: by outflank-mailman (input) for mailman id 1044622;
 Tue, 15 Jul 2025 16:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiGL-0005t5-BX
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:12:13 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20625.outbound.protection.outlook.com
 [2a01:111:f403:2405::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72055733-6196-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 18:12:05 +0200 (CEST)
Received: from SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::18)
 by CYXPR12MB9320.namprd12.prod.outlook.com (2603:10b6:930:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 16:11:51 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::14) by SJ0P220CA0027.outlook.office365.com
 (2603:10b6:a03:41b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 16:11:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:50 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:46 -0500
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
X-Inumbo-ID: 72055733-6196-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcSy5+qoe9eJVrPDx5PVzPdqTLNISbzE76Prqc5eqr/GcFoDH5Vi+jDZDaqVHos2oIamAjthqi4GEMKOmT8vW5HEo75csz2i7JLhEma782ElC7KM/ped/k7Yb5zUiS2XP/HuYXQ/49i0HiQ7LnUR/M8H0N2puYDTXQut/N3xYR64dTd8F9DGirogZGfhnDERrRqUzTiXamON+yVTHx26nOjK5f6ZTy6oOjMLnl7vLCxpOvs0MUtlZgA758akMqbZYg0TrEqr79oZQfOcvhIiUtQa/u7ImL0mX19DT1nmWET+J10R72VGTSIWUk4tit7wvUeVup7VD/LG2phvwBZW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W09inC3TMIsxvKa6XhIrbrJCVtJ3wn72EVHr8n2Mdkg=;
 b=dtrftCZd2Nx7FyRrgg3ADn7m0FlNfvEbXjyzmGNjDQoFJIEdheaG3csVvJSDGapPOcw/6gkwIrkdYwNT0dxNtAChe2quihajVsZJftvMq+wem2gSdagiGVBJcshgFrHrm5iZ8ZfhfTXGSxw2omELbvDtFDPWgrVBhln+FIkG9rWzn//fFeKnSWjnT5pAYGXRYv3Uzd4yCF/y6Qc2VssyXCca+qtvIeZ3o2zuN76TrQXFsbevn99WvY8vx8YnBBKMiyHNQv1uma9Wws9+MqoQQaFU6TVThzHpscge2vd/3qL/m4xuScB9z3zwlXTyu63H/xJUbXx9kq9HzPKl6QcBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W09inC3TMIsxvKa6XhIrbrJCVtJ3wn72EVHr8n2Mdkg=;
 b=wBd/Xp8Yg3B3m85/OYOrwXSgZ9sW3266Ebv3lSvP3O6dKquU8ozupnJ91XOF9qUkdH0dRNNWMaXZIwDf197ljpWD6leHodhHhBB9r9kEfTxWyDp+GytV1j7Qw/WeQzKWGpYzQeKmo2pSf93BPkky8X7Hx7G6QAzGC4D2W0bqa+8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 09/11] xen: Split HAS_DEVICE_TREE in two
Date: Tue, 15 Jul 2025 18:11:04 +0200
Message-ID: <20250715161108.141126-10-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|CYXPR12MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: f039c830-2306-4243-7000-08ddc3ba4e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DWUAD9dLm2O8J2+r2BxFUwtlPrsRqmIgYesJSlEdcB9dWeKLHo+Cf+w3W/mV?=
 =?us-ascii?Q?zImCjdi7IuaIUDnphTf0zHrj3DLVhWmvVezwRzkrKYGYpChMhhG53mGLCovg?=
 =?us-ascii?Q?1ZcNTw7hXgj91JrB2P+cOt5J9PKKoPDThgopDKo05fBI8VzjfVQRj3xn9CUb?=
 =?us-ascii?Q?6pdED6BkzkRnZglwHhy0u2qF7nQR8fTb3QyGjA7KFsgEHM7nXH7eWVBfGVFy?=
 =?us-ascii?Q?RkMrwOz8FTcuVw8Yhx65qHB4CE3ySTb4ziNezsv0kTxAxfjnhVvdgAxb9du6?=
 =?us-ascii?Q?zYI9QBukw6yLz/G3rLbT8xmprzmglqMeg6roHBEXu8QL9/+amAu3FQWiJ3V9?=
 =?us-ascii?Q?CCI9UqRzCqfSHv3qVITsslLnwBn2Rw6ss33Aq5iM4OJjoakp+pa9Cxd0YuKm?=
 =?us-ascii?Q?XRdUOfV3Gdwji1t0rFQ14htpmYW/lESujkrv6bMTQs72m6IIVG6BYOALdK42?=
 =?us-ascii?Q?cd+wq1KH2IVzFgqccrhJHgVqSpU6nXdoBgW1sDmst/2Zj/oGEAHoy8RpI/0C?=
 =?us-ascii?Q?+l5fc9hAUQI0ftzECrL5tCuEftxF3VJ7x6J38z/Iuicfzs1QWZ1HifGyK9u5?=
 =?us-ascii?Q?heA7xOtviHLJvP2/derqGeBVwT/aS1W+dT08pfUVrxWmGGmVhGx4LVUfxvg3?=
 =?us-ascii?Q?Ua2fkTb13fsUiXbQ9InMkduoZ1IW3tPv43Sl7Je+o0tS8TLo4kbr+FOgGIqM?=
 =?us-ascii?Q?dDkoC4IaGIcZ6GiJDwRZBS9wCb23zcjhP2L6XD0YHNrjexU/sbhVN8RELsM0?=
 =?us-ascii?Q?AhKY+Csryk6Q/QHYFBzmSlcoWRO7pF3ClDTbM5i0+kQU7YHrEU5yBZRynR4d?=
 =?us-ascii?Q?tZC1VqVVf7S/k6vjaUS+E7CPtm8ADyqob+IW5niE8OqV0IlfYlFqXURjJS+5?=
 =?us-ascii?Q?29R3gR3ngvtO9wO8js5W9iaBo48Xwzy9JQGOFtyiES6ojn/kHrMCTmrUB/39?=
 =?us-ascii?Q?w2O0gclXhtdH1bcBKOEEEoJbBDENhGidCzPbg5LzGWFoZu/V3xYMRiUyachW?=
 =?us-ascii?Q?ub8fBVAaoM9EaOgjDO/AV3VJrkMmAq53wcwlVXfdOdERDR/klDuICTytWALv?=
 =?us-ascii?Q?sX5az0tow6L6YlC0UDVTCcR9GXOVI1Q1WfC2tYrWsV/u8H3AaMakj9G0CFkX?=
 =?us-ascii?Q?8ow8aA6b2WEVKqzaJWCFX3ikrniHhAb4WgW4sKRyugj+8qQ4KrYygm1uKX0s?=
 =?us-ascii?Q?g2briMxWLfTIbT97jaPB81T4ef8VVoQAs9dP/zvqxHVM6S3ktES4PZoS6gHM?=
 =?us-ascii?Q?805XI+S9v0up7/RtYc5YdpgBhtux6BColqy+EKqJo28lPP4xAP8np6EDiJPJ?=
 =?us-ascii?Q?a6VxUODdgUYw06m2/7TOD8WV1OCFYGLL/VLhyXnLS9H0JkqsStG31hjPOO3y?=
 =?us-ascii?Q?bqoydD+WMdwv7SRzoPSiVZbe/9CJklZQpwliD4ObyLUF8l7jwPh5WYuUYYD9?=
 =?us-ascii?Q?B0wF+dahk1IY1/OGSZPaF0+Kop5OFA3tuhsjY43UD1GZ9ZJzaqqVoyKaVnB1?=
 =?us-ascii?Q?d0FfPS2bC20ZnfJewR6eamwBU1MAKPRMjpNr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:50.2463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f039c830-2306-4243-7000-08ddc3ba4e71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9320

Moving forward the idea is for there to be:

  1. Basic DT support: used by dom0less/hyperlaunch.
  2. Full DT support: used for device discovery and HW setup.

Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2) and
create a new DEVICE_TREE_PARSE to describe (1).

Have DEVICE_TREE_PARSE selected by both HAS_DEVICE_TREE_DISCOVERY and
DOM0LESS_BOOT.

Add a dependency on STATIC_MEMORY for discovery, as it relies on
the memory map itself being described on the DTB.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com> #iommu
---
 xen/Kconfig.debug                |  2 +-
 xen/arch/arm/Kconfig             |  2 +-
 xen/arch/ppc/Kconfig             |  2 +-
 xen/arch/riscv/Kconfig           |  2 +-
 xen/common/Kconfig               | 15 ++++++++++-----
 xen/common/Makefile              |  4 ++--
 xen/common/device.c              |  4 ++--
 xen/common/efi/boot.c            |  2 +-
 xen/common/sched/Kconfig         |  2 +-
 xen/drivers/char/ns16550.c       |  6 +++---
 xen/drivers/passthrough/Makefile |  2 +-
 xen/drivers/passthrough/iommu.c  |  2 +-
 xen/include/asm-generic/device.h | 10 +++++-----
 xen/include/xen/iommu.h          |  8 ++++----
 xen/include/xsm/dummy.h          |  4 ++--
 xen/include/xsm/xsm.h            | 12 ++++++------
 xen/xsm/dummy.c                  |  2 +-
 xen/xsm/flask/hooks.c            |  6 +++---
 xen/xsm/xsm_core.c               |  4 ++--
 xen/xsm/xsm_policy.c             |  4 ++--
 20 files changed, 50 insertions(+), 45 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 38a134fa3b..d900d926c5 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -92,7 +92,7 @@ config VERBOSE_DEBUG
 
 config DEVICE_TREE_DEBUG
 	bool "Device tree debug messages"
-	depends on HAS_DEVICE_TREE
+	depends on DEVICE_TREE_PARSE
 	help
 	  Device tree parsing and DOM0 device tree building messages are
 	  logged in the Xen ring buffer.
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 95a2cd3d00..ce15bf22d0 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -17,7 +17,7 @@ config ARM
 	select FUNCTION_ALIGNMENT_4B
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
-	select HAS_DEVICE_TREE
+	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index 917f5d53a6..5bedf6055e 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -1,7 +1,7 @@
 config PPC
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
-	select HAS_DEVICE_TREE
+	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_UBSAN
 	select HAS_VMAP
 
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 96bef90751..89876b3217 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -3,7 +3,7 @@ config RISCV
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
-	select HAS_DEVICE_TREE
+	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_PMAP
 	select HAS_UBSAN
 	select HAS_VMAP
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 65f07289dd..fb3845c197 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,9 +12,14 @@ config CORE_PARKING
 	bool
 	depends on NR_CPUS > 1
 
+config DEVICE_TREE_PARSE
+	bool
+	select LIBFDT
+
 config DOM0LESS_BOOT
 	bool "Dom0less boot support" if EXPERT
-	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
+	depends on HAS_DOM0LESS && DOMAIN_BUILD_HELPERS
+	select DEVICE_TREE_PARSE
 	default y
 	help
 	  Dom0less boot support enables Xen to create and start domU guests during
@@ -85,9 +90,9 @@ config HAS_ALTERNATIVE
 config HAS_COMPAT
 	bool
 
-config HAS_DEVICE_TREE
+config HAS_DEVICE_TREE_DISCOVERY
 	bool
-	select LIBFDT
+	select DEVICE_TREE_PARSE
 
 config HAS_DOM0LESS
 	bool
@@ -154,7 +159,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
-	depends on DOM0LESS_BOOT
+	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
 	help
 	  Static Allocation refers to system or sub-system(domains) for
 	  which memory areas are pre-defined by configuration using physical
@@ -553,7 +558,7 @@ config DOM0_MEM
 
 config DTB_FILE
 	string "Absolute path to device tree blob"
-	depends on HAS_DEVICE_TREE
+	depends on HAS_DEVICE_TREE_DISCOVERY
 	help
 	  When using a bootloader that has no device tree support or when there
 	  is no bootloader at all, use this option to specify the absolute path
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..d541fbcf49 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,9 +6,9 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
diff --git a/xen/common/device.c b/xen/common/device.c
index 33e0d58f2f..0c0afad49f 100644
--- a/xen/common/device.c
+++ b/xen/common/device.c
@@ -11,7 +11,7 @@
 
 #include <asm/device.h>
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 
 extern const struct device_desc _sdevice[], _edevice[];
 
@@ -56,7 +56,7 @@ enum device_class device_get_class(const struct dt_device_node *dev)
     return DEVICE_UNKNOWN;
 }
 
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #ifdef CONFIG_ACPI
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9306dc8953..31b4039049 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -623,7 +623,7 @@ static int __init __maybe_unused set_color(uint32_t mask, int bpp,
    return max(*pos + *sz, bpp);
 }
 
-#ifndef CONFIG_HAS_DEVICE_TREE
+#ifndef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
 {
     return 0;
diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
index 18ca1ce7ab..1fb622e6cf 100644
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -67,7 +67,7 @@ endmenu
 
 config BOOT_TIME_CPUPOOLS
 	bool "Create cpupools at boot time"
-	depends on HAS_DEVICE_TREE
+	depends on HAS_DEVICE_TREE_DISCOVERY
 	help
 	  Creates cpupools during boot time and assigns cpus to them. Cpupools
 	  options can be specified in the device tree.
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 6b4fb4ad31..c1c08b235e 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -34,7 +34,7 @@
 #include <xen/8250-uart.h>
 #include <xen/vmap.h>
 #include <asm/io.h>
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #include <asm/device.h>
 #endif
 #ifdef CONFIG_X86
@@ -1766,7 +1766,7 @@ void __init ns16550_init(int index, struct ns16550_defaults *defaults)
 
 #endif /* CONFIG_X86 */
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
                                        const void *data)
 {
@@ -1845,7 +1845,7 @@ DT_DEVICE_START(ns16550, "NS16550 UART", DEVICE_SERIAL)
         .init = ns16550_uart_dt_init,
 DT_DEVICE_END
 
-#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE_DISCOVERY */
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_ARM)
 #include <xen/acpi.h>
diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
index a1621540b7..eb4aeafb42 100644
--- a/xen/drivers/passthrough/Makefile
+++ b/xen/drivers/passthrough/Makefile
@@ -5,6 +5,6 @@ obj-$(CONFIG_ARM) += arm/
 
 obj-y += iommu.o
 obj-$(CONFIG_HAS_PCI) += pci.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device_tree.o
 obj-$(CONFIG_HAS_PCI) += ats.o
 obj-$(CONFIG_HAS_PCI_MSI) += msi.o
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 16aad86973..c9425d6971 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -638,7 +638,7 @@ int iommu_do_domctl(
     ret = iommu_do_pci_domctl(domctl, d, u_domctl);
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     if ( ret == -ENODEV )
         ret = iommu_do_dt_domctl(domctl, d, u_domctl);
 #endif
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index 1acd1ba1d8..3bd97e33c5 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -6,7 +6,7 @@
 
 enum device_type
 {
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     DEV_DT,
 #endif
     DEV_PCI
@@ -26,7 +26,7 @@ enum device_class
 struct device
 {
     enum device_type type;
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     struct dt_device_node *of_node; /* Used by drivers imported from Linux */
 #endif
 #ifdef CONFIG_HAS_PASSTHROUGH
@@ -37,7 +37,7 @@ struct device
 
 typedef struct device device_t;
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 
 #include <xen/device_tree.h>
 
@@ -87,9 +87,9 @@ struct device_desc {
     int (*init)(struct dt_device_node *dev, const void *data);
 };
 
-#else /* !CONFIG_HAS_DEVICE_TREE */
+#else /* !CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 #define dev_is_dt(dev) ((void)(dev), false)
-#endif /* CONFIG_HAS_DEVICE_TREE */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #define dev_is_pci(dev) ((dev)->type == DEV_PCI)
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 57f338e2a0..37c4a1dc82 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -232,7 +232,7 @@ struct msi_msg;
 #define PT_IRQ_TIME_OUT MILLISECS(8)
 #endif /* HAS_PCI */
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #include <xen/device_tree.h>
 
 #ifdef CONFIG_HAS_PASSTHROUGH
@@ -309,7 +309,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
 
 #endif /* HAS_PASSTHROUGH */
 
-#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE_DISCOVERY */
 
 struct page_info;
 
@@ -376,7 +376,7 @@ struct iommu_ops {
     int (*get_reserved_device_memory)(iommu_grdm_t *func, void *ctxt);
     void (*dump_page_tables)(struct domain *d);
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     /*
      * All IOMMU drivers which support generic IOMMU DT bindings should use
      * this callback. This is a way for the framework to provide the driver
@@ -424,7 +424,7 @@ struct domain_iommu {
     /* iommu_ops */
     const struct iommu_ops *platform_ops;
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     /* List of DT devices assigned to this domain */
     struct list_head dt_devices;
 #endif
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 9227205fcd..12792c3a43 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -423,7 +423,7 @@ static XSM_INLINE int cf_check xsm_deassign_device(
 
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static XSM_INLINE int cf_check xsm_assign_dtdevice(
     XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
 {
@@ -438,7 +438,7 @@ static XSM_INLINE int cf_check xsm_deassign_dtdevice(
     return xsm_default_action(action, current->domain, d);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
 
 static XSM_INLINE int cf_check xsm_resource_plug_core(XSM_DEFAULT_VOID)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..abeb4b04ad 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -125,7 +125,7 @@ struct xsm_ops {
     int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     int (*assign_dtdevice)(struct domain *d, const char *dtpath);
     int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
 #endif
@@ -535,7 +535,7 @@ static inline int xsm_deassign_device(
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static inline int xsm_assign_dtdevice(
     xsm_default_t def, struct domain *d, const char *dtpath)
 {
@@ -548,7 +548,7 @@ static inline int xsm_deassign_dtdevice(
     return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
 
 static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
@@ -789,7 +789,7 @@ int xsm_multiboot_policy_init(
     struct boot_info *bi, void **policy_buffer, size_t *policy_size);
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 /*
  * Initialize XSM
  *
@@ -839,7 +839,7 @@ static inline int xsm_multiboot_init(struct boot_info *bi)
 }
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static inline int xsm_dt_init(void)
 {
     return 0;
@@ -849,7 +849,7 @@ static inline bool has_xsm_magic(paddr_t start)
 {
     return false;
 }
-#endif /* CONFIG_HAS_DEVICE_TREE */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #endif /* CONFIG_XSM */
 
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93fbfc43cc..7f67683839 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -81,7 +81,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .deassign_device               = xsm_deassign_device,
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     .assign_dtdevice               = xsm_assign_dtdevice,
     .deassign_dtdevice             = xsm_deassign_dtdevice,
 #endif
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 6a53487ea4..78bad6e56b 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1456,7 +1456,7 @@ static int cf_check flask_deassign_device(
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static int flask_test_assign_dtdevice(const char *dtpath)
 {
     uint32_t rsid;
@@ -1517,7 +1517,7 @@ static int cf_check flask_deassign_dtdevice(
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE,
                                 NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
 
 static int cf_check flask_platform_op(uint32_t op)
 {
@@ -1981,7 +1981,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .deassign_device = flask_deassign_device,
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     .assign_dtdevice = flask_assign_dtdevice,
     .deassign_dtdevice = flask_deassign_dtdevice,
 #endif
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index f255fb63bf..b7e864a874 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -25,7 +25,7 @@
 #include <asm/setup.h>
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #include <asm/setup.h>
 #endif
 
@@ -166,7 +166,7 @@ int __init xsm_multiboot_init(struct boot_info *bi)
 }
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 int __init xsm_dt_init(void)
 {
     int ret = 0;
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 1b4030edb4..3f04375347 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -24,7 +24,7 @@
 #include <asm/setup.h>
 #endif
 #include <xen/bitops.h>
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 # include <asm/setup.h>
 # include <xen/device_tree.h>
 #endif
@@ -65,7 +65,7 @@ int __init xsm_multiboot_policy_init(
 }
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
 {
     struct boot_module *mod = boot_module_find_by_kind(BOOTMOD_XSM);
-- 
2.43.0


