Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE7AE225F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021141.1397197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgfV-00039I-1I; Fri, 20 Jun 2025 18:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021141.1397197; Fri, 20 Jun 2025 18:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgfU-000360-Tw; Fri, 20 Jun 2025 18:40:52 +0000
Received: by outflank-mailman (input) for mailman id 1021141;
 Fri, 20 Jun 2025 18:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgW2-000575-A1
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:31:06 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2414::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b880e9b9-4e04-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 20:31:04 +0200 (CEST)
Received: from BN9P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::7)
 by SJ2PR12MB8831.namprd12.prod.outlook.com (2603:10b6:a03:4d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Fri, 20 Jun
 2025 18:31:00 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::ac) by BN9P220CA0002.outlook.office365.com
 (2603:10b6:408:13e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:30:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:30:59 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:30:47 -0500
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
X-Inumbo-ID: b880e9b9-4e04-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mozxrJBD4h806OxtW9OKjLve39slNB6SyZyg/dPERlNW7V5jhRlvDtkbjrdunxqXCedE1tVYENyACVagFJeLBCcM/NTMhMNOiS5sSAlmFhyhxWB6tVh4W9fRuRrgHyOYUtKDV6s/fyFclXl4UhykOdnJYV73bgXKHHK8EvehrQQ3/4yQ3SFvhhA5BIrirntn+BKBCmfbEjrQjvov5ZvHYV+RqHQj5/0TRSQPc/VdBGdoPg2lrkeSo44eRCpbmN5gevcnhgilnng5/hKUOx8SS9wBG9QahgPtFdpj2GIVEbfcNBNvfDctTSyEPEyTE3ncxwnXVSDHbiLgF6WuwoLBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A32bMUto8OiFkZ1KkrsMiha7h5Dnym+pId15RGk2+9o=;
 b=wk35lImRWRVdtFVGzQehcpbiWy/FUyt2bSbYCJGxX4W3beybRuLaZXrTTlE1uQXKMDDPCdGYJw1G9xjawkyXe6qoUPXZ1XGOYLsnYMBgi8Ng+pMwMsUORWzbFMMjA9zPVEDynzeoRldU8psSyTsojwRdn083TCu+Vuz/ukTuV8l68PM3sYbXyPpA++scytgCv6tsK4uBUkfGmptUa97eOqUqt4h4uY+yhL/xxSTiq6AxMaLQWB4NbSYOJDephSVKX1sygzfYX0gnuMW7I/s8Cxz1e+E1TmIpY55dkb1+k3ygxlDq0QpUkQz2LiEXpfIOpHseXxaSKS+D+h5OvOUYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A32bMUto8OiFkZ1KkrsMiha7h5Dnym+pId15RGk2+9o=;
 b=WslG99NBfGR/mi9A3QHWERZfwNjFzgJm8LTT+nS/doAlaS0s60cbLyCOTyQeaPvNxA66LOqXhXbXn+nkL6bMtgKJhiraf0W6WrRLLZmf/Tx2pg2IWo1LtRnWT6QgCdGeD5298RVSZymaXHG575gSV4dYKgB9+ynJxUbrv9GyHnY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
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
Subject: [PATCH v4 10/12] xen: Rename CONFIG_HAS_DEVICE_TREE to CONFIG_HAS_DEVICE_TREE_DISCOVERY
Date: Fri, 20 Jun 2025 20:28:56 +0200
Message-ID: <20250620182859.23378-11-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620182859.23378-1-agarciav@amd.com>
References: <20250620182859.23378-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|SJ2PR12MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e779e40-3b20-45e6-e1b9-08ddb0289a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dhSB5tap1s11sJOUrHMp0sckU/ioFXl3DoOZmxWrZ5icsDlmFxb8my/QNpxl?=
 =?us-ascii?Q?rWIWaN3YyBCMSzFI48mqKZMN0mMPHpO5AiIsXsIe9pW6Tafi8lQAadjEnK2X?=
 =?us-ascii?Q?jo9MKQHvP7pThB/oP14hWmnPEZTAsvNXEBHifaJNzVc/YUqfPPuaIyglWMLo?=
 =?us-ascii?Q?UGxzIkkdsOKsWXpO7HfzvwlPx7bBM0vHWYtxjHEXI42Ifep0FmIj/doIIyiN?=
 =?us-ascii?Q?/lUjlszqSJTjskfTEexV8zH8yino4GdDEmqQeG0d9IqXZKHzyll+KvN/YnSU?=
 =?us-ascii?Q?+4nYwX8p/wYsH+yJg6Xaamuu/PkoO270+q1ISe+nxudIvzsr4p/7YOV5qaKN?=
 =?us-ascii?Q?t8uxBhAU0MV98iwXHp+XqGG/GbIgVsV8rG0ju2PIwIQqesuEjjdpLYhhf3XX?=
 =?us-ascii?Q?ebDXFIHimcKlOGaeAXPF2vN7W4TDzg+AlpyAfvDvv7+sIh/5O0NxmmPvjhfa?=
 =?us-ascii?Q?V9SkIHpNf/geVQoxBxYQdoQoFGNgf813rlM/EPscedndzhl2+2zqxPn3BY2C?=
 =?us-ascii?Q?xULPoPE+UK4aldjikNLkum0ubfd9iEHSUS0hnNa2+4j9oRcTS4mKPQIefY08?=
 =?us-ascii?Q?FSTHs5DHydeRWsb/DZko1AYeuhT3IRBK37J0VKfB9uyPqea5TmuaNqKf0IaN?=
 =?us-ascii?Q?AkBTGVJk/aMcpc4g4hxXmfsXkCwXuxhhnq1L9NwTyWABPF8JkrsVeY1SvKeh?=
 =?us-ascii?Q?cxXrAKU6vYdMqTfr7chBAZOUWgriyAw0/VeIOfDB9KD26uoEr6zzL7Jvc+Dq?=
 =?us-ascii?Q?5y9DjD2lEpv3XwTCNS807M15Tbfl8qofXowbtgqvMIDD1n/zsN/e7RPQGbd1?=
 =?us-ascii?Q?1TSEhgILVpd2bo0CSXXdaXKH2UXfnySiFX8zXYblQ5SClPcQrFzp/IRv3H9e?=
 =?us-ascii?Q?j5wqNID3zxO0K9NxHCaPzvrLagmkz2BPCbhZsH3G5TzJLSFZnqtW7bc8UITy?=
 =?us-ascii?Q?tQohckZAQNM4pdDEgF+tryV5Lh9kGanPDCnSk3+/QxtJR0SgPgP5CKZ/oi/I?=
 =?us-ascii?Q?T7e9pfU6/g8k/9h01152nwHnLEbFm8/L2otZSGKARebl5mSTts+2v4MxQEiU?=
 =?us-ascii?Q?Rp4vqk30ELvKwZJp5PlltK/hOVebphhjEeFZ9ftZ7FS9p5EEHaKnAkPWy6v5?=
 =?us-ascii?Q?HbOR5xXCpvxbOOE+YtLy77RFSVgdTJgZ8hXMLUilL9n8MEKwsMrZKMhqH/1b?=
 =?us-ascii?Q?6mkrq/UB1sAJUNu31/MSpSMv0oO1vDsSceJmJfrU3Vn2j7NnrMfg+E3k7etl?=
 =?us-ascii?Q?7r54vrSIl4GEE2CucQLzdn+tyAmXP7lW7g106Re2qKoUZs+mxmPI6TJSD+fG?=
 =?us-ascii?Q?6H2e9iUNbvQtArSyioi0A4PZTHDY3V6GcFkcwVSLwnChkVeLfVqN7dEziWzm?=
 =?us-ascii?Q?n9CVBH3Mn7isIyuJW93tdkYXuaFH9+JPqZculZMQwbNBOec7/7AhrUJ79IAU?=
 =?us-ascii?Q?ZBI+4jb+lGqWY8ey6zwS1O2Vw13Ig5B6x0TrfHJcPgW4NBTXMhOkb29wWR8N?=
 =?us-ascii?Q?9uEmTYE+BVLSfL+DUPPR2s6EH95f6zh9UYaF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:30:59.5119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e779e40-3b20-45e6-e1b9-08ddb0289a9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8831

Moving forward the idea is for there to be:
  1. Basic DT support: used by dom0less/hyperlaunch.
  2. Full DT support: used for device discovery and HW setup.

Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2), while
DOM0LESS_BOOT is left to describe (1).

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/Kconfig.debug                |  2 +-
 xen/arch/arm/Kconfig             |  2 +-
 xen/arch/ppc/Kconfig             |  2 +-
 xen/arch/riscv/Kconfig           |  2 +-
 xen/common/Kconfig               |  6 +++---
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
 20 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d14093017e..9192d593a7 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -92,7 +92,7 @@ config VERBOSE_DEBUG
 
 config DEVICE_TREE_DEBUG
 	bool "Device tree debug messages"
-	depends on HAS_DEVICE_TREE
+	depends on HAS_DEVICE_TREE_DISCOVERY
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
index 867710134a..6294cd7939 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -14,7 +14,7 @@ config CORE_PARKING
 
 config DOM0LESS_BOOT
 	bool "Dom0less boot support" if EXPERT
-	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
+	depends on HAS_DOM0LESS && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_HELPERS
 	default y
 	help
 	  Dom0less boot support enables Xen to create and start domU guests during
@@ -85,7 +85,7 @@ config HAS_ALTERNATIVE
 config HAS_COMPAT
 	bool
 
-config HAS_DEVICE_TREE
+config HAS_DEVICE_TREE_DISCOVERY
 	bool
 	select LIBFDT
 
@@ -553,7 +553,7 @@ config DOM0_MEM
 
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
index e39fbc3529..0ead1381c8 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -601,7 +601,7 @@ static int __init __maybe_unused set_color(uint32_t mask, int bpp,
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
index eaeb0e09d0..b060e502f3 100644
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
@@ -1754,7 +1754,7 @@ void __init ns16550_init(int index, struct ns16550_defaults *defaults)
 
 #endif /* CONFIG_X86 */
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
                                        const void *data)
 {
@@ -1833,7 +1833,7 @@ DT_DEVICE_START(ns16550, "NS16550 UART", DEVICE_SERIAL)
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
index 832775754b..5483840645 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -230,7 +230,7 @@ struct msi_msg;
 #define PT_IRQ_TIME_OUT MILLISECS(8)
 #endif /* HAS_PCI */
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #include <xen/device_tree.h>
 
 #ifdef CONFIG_HAS_PASSTHROUGH
@@ -288,7 +288,7 @@ static inline int iommu_release_dt_devices(struct domain *d)
 
 #endif /* HAS_PASSTHROUGH */
 
-#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE_DISCOVERY */
 
 struct page_info;
 
@@ -355,7 +355,7 @@ struct iommu_ops {
     int (*get_reserved_device_memory)(iommu_grdm_t *func, void *ctxt);
     void (*dump_page_tables)(struct domain *d);
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     /*
      * All IOMMU drivers which support generic IOMMU DT bindings should use
      * this callback. This is a way for the framework to provide the driver
@@ -403,7 +403,7 @@ struct domain_iommu {
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


