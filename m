Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DE2AFD629
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037100.1409778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCmM-0003ks-SQ; Tue, 08 Jul 2025 18:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037100.1409778; Tue, 08 Jul 2025 18:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCmM-0003ju-Mg; Tue, 08 Jul 2025 18:10:54 +0000
Received: by outflank-mailman (input) for mailman id 1037100;
 Tue, 08 Jul 2025 18:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjp-0005Uq-Jt
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:08:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:2418::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 838ee911-5c26-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:08:14 +0200 (CEST)
Received: from PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::14)
 by IA1PR12MB7495.namprd12.prod.outlook.com (2603:10b6:208:419::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 18:08:10 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::66) by PH7P222CA0001.outlook.office365.com
 (2603:10b6:510:33a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:08:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:08:09 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:08:00 -0500
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
X-Inumbo-ID: 838ee911-5c26-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGcEMfwTV1GJnJ5djfCEAhWlWmPneGqiMsOInleuDhDy3wr3gC7o3fm4fiOrLt/72Yak+DgGF/YXbetNridRjBxkVF7jlzqcz9Hio2P7aHetNy2wKbNvMNAAr6hRcf0+7H3dPbyjCfmJcovxgD/CPL2j4JnygPIZoA+dks4RpAOC78/kRF42MV+q2uHcSQOFmybk8hsNZXItTG+81kjg696AMT+5Gm4xs3qfJWpUL8cSliQNKOIwonP20BIAYXjUzBX30ChF8nW0lNuVbDfmoo/foOJ2lrxK1ZUo/9TsVaLAPSsyQN0a4vPKIgYqqMnQmLCEEOS1ZZXFDK4otTAjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10E6VzKB3fwD/ENPIpAwDvtsuuhPS0KL8wr85SCVuek=;
 b=UBnpFmnLoFi/lQJIJB9JxneIy4ktDNZk3Aq+hngk4YFPqnW6/0ZocgjyU9XOxrTon1yFgoZf/Ihuf/C0XJyVF/pA/QxkPoPqA/SUAlGD1S4FABCRFT4grtn0VSg1uVYAgDhCvnSRT9HwmIydBzpA4XkyWdQGiZkPAXQL+qjLDxy2kBMaio6RkAHEK7z+dVtWmc7Pcta+xrm/aAQfIJcssSCfbbTSgVSL8mVA0b8fsLXLULkyw2T76/urXBXCrig8np4GEfXMpYZzaqARt816jrgEBwQMs3Gpq04mMw5UTXjs88ZjKJxFqrSzTE3NdGtidlO9IaZ94RCFlLPpfNroyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10E6VzKB3fwD/ENPIpAwDvtsuuhPS0KL8wr85SCVuek=;
 b=PQcz8UiZyPCWagzOp41GM07HwK7CByI/qKC+574clsrHQ64KbENDa1vgVE2a1/q+8mtJ2Ff+H3iXCWcHdV/+Jq5/e0YYsd6MQpN5vuyx7C9/eYQJi/P8oGzScSAMWSDm3D3bEcsnqosN3nyUm+lvLqy9MK7dR4Z+nrkOuFGriVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH v6 09/11] xen: Split HAS_DEVICE_TREE in two
Date: Tue, 8 Jul 2025 20:07:18 +0200
Message-ID: <20250708180721.2338036-10-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|IA1PR12MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 564fb9cb-bbe0-4886-4d92-08ddbe4a65a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sSxT+zmL50iV85pnQB3EwIJ9hcC74vrkO9kIrXR4CKjhvUNUMJXoEWGWaLaR?=
 =?us-ascii?Q?muRRPlY6Q9t/mTuWx/DovpNqa7qpYq7NikEW6n1DBL4nwiluT9ub0UEBcLKg?=
 =?us-ascii?Q?pNiErlbvMN/jzvRo6YJvrMPlAvhOPSJq+wgpmekBKVHYGXzw3cHPZa6X5NaX?=
 =?us-ascii?Q?5lqtHdxfn/fJqtXj/3QN8VyOaslJfS5G4bIHksG+fqz2F+s66XNJ9wF1R5wv?=
 =?us-ascii?Q?YLWhxTaufDbVRkRZSe/Lwf/ReyONH545QZxjIyvS0t/qr50nprsTKJfByy2j?=
 =?us-ascii?Q?zcn+yvrLcXis4BJKI5vO33ooHNUGUwgVSVyNZ2+LZFCA5j+cwywJGfdEyVM2?=
 =?us-ascii?Q?VN+ZPxjVsygGkC0+ufuGDiLUAAdqgv7cgHFgD2ZLjN4TBXM6XL9loPna5C7V?=
 =?us-ascii?Q?Ds+dubbmILDHEH0yHQ/fsYR0WnC3/G1WK079U8x0QjnAAZlXQltXII9a82k/?=
 =?us-ascii?Q?Tl7kPPuziv/d6fcM0OKjzD++IvqNmKd7OBytVLcTc6zYCOyGMUWeGv2AP0qP?=
 =?us-ascii?Q?q8uS4eiYmSkwUHh8MbGLBWZuZJo+46Ckdx9Hhhr0CH5vvAIt1deofNh2Foj8?=
 =?us-ascii?Q?B9ulp5n3eqnpeYqlAFOD9K0JcHvHQCwiuLISpaaesQxkiwS/nY3xjeh376Jr?=
 =?us-ascii?Q?3dIkHCi3uia6ZpRV+ui3nz4dXvcnneKYzWg3Lgc4NbbfxU1Lt5Cw/0Gys+55?=
 =?us-ascii?Q?WzN5FbZmgVrb2+x+6yIWuqQclaA4OmZituJxMijD4EsMGCG9C5SZTFndREUJ?=
 =?us-ascii?Q?7PQX3H7+1F8q7OODySIG+drOPIrIOjryd61dvLXJ3fOV+kPckYMCQTfvc9dx?=
 =?us-ascii?Q?F5wxAbXP69rUCjfPVgnyWWPG1E+wPN+axGMuWc+JPyYERwU1udCbwQcK3FKS?=
 =?us-ascii?Q?cOwlIXR4mw9YaykcaNwVb4O/oNyM3F6wQ4S5uQM7OmUmEN9h5c39LW8qDrHa?=
 =?us-ascii?Q?f7U1bYQi45MyT30Wmio64IGGp9I7Nt7eZApu9LzHwR3H2PmT8NEdKQls/Oxu?=
 =?us-ascii?Q?3dzC9RSt8h9SWmZbjNL1iaha0pmg5KQdPYnqnVcIaqc/zPNInjXs9TfLJbn0?=
 =?us-ascii?Q?duUBDFry5WHj879yrP6iUj+mhZ9nnP1pwb5wpJutHZR5lpNRLWNIXjMR7IJ6?=
 =?us-ascii?Q?FWUc0J0wPEfDePzEXJoUIv7zbh1qwpPr3WxZrZpEKot+dkHEa6kUl8uUNm5y?=
 =?us-ascii?Q?w4WrGU3nebuN3QmZAEQU0ttFTrGjNF89aqeRLrLCmzqYJgK6ac5MU6t0d7ne?=
 =?us-ascii?Q?l5a5pa5Q0ssjMNCwQm7xd0OokJUzfQPcj9ElOIPchmFFnq4J1Q+rEo2sOYmQ?=
 =?us-ascii?Q?DLSg6sV5Hwjrxj3LoiSKROuvnxtETugzqzEmCvCNMr/BfCOo9b2lXPPyyAMQ?=
 =?us-ascii?Q?ddG73kAk2DGWjoBhcMrJM3YcGPWWrrE3UhOps1o6g9QrXI0w7SG5nHYaeZgk?=
 =?us-ascii?Q?t5/B9mTuwq9eQjfCPbG5iyO+omR7JUYUJvD2jN1jymnhBgypADDodfIswnq/?=
 =?us-ascii?Q?ViSSCsBjSnPZGlIatBJ7ILVTWnn/mSkUbEMq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:08:09.7905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 564fb9cb-bbe0-4886-4d92-08ddbe4a65a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7495

From: Alejandro Vallejo <agarciav@amd.com>

Moving forward the idea is for there to be:

  1. Basic DT support: used by dom0less/hyperlaunch.
  2. Full DT support: used for device discovery and HW setup.

Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2) and
create a new DEVICE_TREE_PARSE to describe (1).

Have DEVICE_TREE_PARSE selected by both HAS_DEVICE_TREE_DISCOVERY and
DOM0LESS_BOOT.

Add a dependency on STATIC_MEMORY for discovery, as it relies on
the memory map itself being described on the DTB.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v6:
  * Moved CONFIG_DEVICE_TREE_PARSE to preserve sorting
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
index 3f25da3ca5..74b16f7167 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,7 +15,7 @@ config ARM
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
index 62c5b7ba34..8fd3c314ea 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -2,7 +2,7 @@ config RISCV
 	def_bool y
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
-	select HAS_DEVICE_TREE
+	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_PMAP
 	select HAS_UBSAN
 	select HAS_VMAP
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6d784da839..8806beeb27 100644
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
index ebfada1d88..d3dcd942fa 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -230,7 +230,7 @@ struct msi_msg;
 #define PT_IRQ_TIME_OUT MILLISECS(8)
 #endif /* HAS_PCI */
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #include <xen/device_tree.h>
 
 #ifdef CONFIG_HAS_PASSTHROUGH
@@ -307,7 +307,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
 
 #endif /* HAS_PASSTHROUGH */
 
-#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE_DISCOVERY */
 
 struct page_info;
 
@@ -374,7 +374,7 @@ struct iommu_ops {
     int (*get_reserved_device_memory)(iommu_grdm_t *func, void *ctxt);
     void (*dump_page_tables)(struct domain *d);
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     /*
      * All IOMMU drivers which support generic IOMMU DT bindings should use
      * this callback. This is a way for the framework to provide the driver
@@ -422,7 +422,7 @@ struct domain_iommu {
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


