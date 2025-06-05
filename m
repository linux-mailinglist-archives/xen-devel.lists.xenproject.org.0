Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76609ACF860
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007518.1386839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGcL-0001ob-SH; Thu, 05 Jun 2025 19:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007518.1386839; Thu, 05 Jun 2025 19:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGcL-0001m9-PU; Thu, 05 Jun 2025 19:51:13 +0000
Received: by outflank-mailman (input) for mailman id 1007518;
 Thu, 05 Jun 2025 19:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGau-0002fZ-VD
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:49:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2414::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39b5f8fa-4246-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 21:49:43 +0200 (CEST)
Received: from BN9PR03CA0353.namprd03.prod.outlook.com (2603:10b6:408:f6::28)
 by IA1PR12MB7615.namprd12.prod.outlook.com (2603:10b6:208:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 19:49:39 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::5a) by BN9PR03CA0353.outlook.office365.com
 (2603:10b6:408:f6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.31 via Frontend Transport; Thu,
 5 Jun 2025 19:49:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:49:39 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:49:08 -0500
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
X-Inumbo-ID: 39b5f8fa-4246-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqrn+eRwFYb8IeyOs+q7asxyq4jvhOPsbC+AtByC6rA87zw7Vka68XAD09HuruPhVMK4xJ2+8PMHGgV6lagNVEdKYtVX03INFZWYsOpxe5GrVW1g5Hz9hxRW65Rfq2i79Fe+O0i16YsCTuaQfnHpfpCYqp8TsR6SgPQWE/YSggttQzL9Xw9c5tErDmRG9q4lIhdMRggTCrBeZ2+8NcnU/zof2kRiJ8LkK9KX+QOnfRiId8kLjF/kSTu4yahLzY9GqDSyEj+o0ojQxwxEFULx+MJHQ1YQXNWSBr4Y6DZYzJpX/RhyP468l8xnY7U39oIUeQqPv0gOsk/MsGH9BcQHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBMHO1HIupXAcwfOdVU4/7q8edByJCbA+TOtQ6T2SUo=;
 b=TBUjHDIEzn2eHHxTNTmaEfOf8nvrbxqCkuuqpHk0vi6hRM2exHDL5aGDRqryg3oyZ7zBLMB/cOaTfKD1sEmoqIkCurMXAJQEOwhoTbGQ3BZePdmyE50rxNiH/f4j35BTSmn+u1TapGdJ4JoEtnxa3ACTgLTycpGmF2FVYxP71BrgZ9vA3YkMJmnP3LJqzQCQeXwl6dV8MKpFb8IwUZaggwvX0VN2AUsXLJexAsk7n79EuTTtdQnwmhpzPnA8joqVYVLvRV/9dPYDEhgo9KNOkseJN9NZiXO6yjuJywaaSEtbeuhE2+s4BpZKQNVcqZJZryB7VIr7Hdccp7QuJ2bv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBMHO1HIupXAcwfOdVU4/7q8edByJCbA+TOtQ6T2SUo=;
 b=rdbGbY6FkvOOlr0ymnp3nYs3plHUd09dmFhPf1S5oYMEp/m0mE0Cb+iGigrb3pYlvc5QgA0SiYmhZaw44JP60iO5VunDWHOgAUgyfqPrHA5Eu+LBd49JcRKobhfFhrYVtwWKhn9C9f9ZQvDLh3N8ENFtB7HLcFJi66U7Xaxk+2Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 15/15] kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT
Date: Thu, 5 Jun 2025 21:48:07 +0200
Message-ID: <20250605194810.2782031-16-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|IA1PR12MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: e9760123-a68b-4eea-5822-08dda46a1b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e1QfQJBTKobVhuf7KNjYIs6V/h4wodUoT4EfCGxWqV8k4/CKmVjKYHrn3rI2?=
 =?us-ascii?Q?H2PSLNUP15CySrvDWM3ANwUfozyCrjvZJAvumwkwBJmD3FogAiqrtctLSA7P?=
 =?us-ascii?Q?d4p+xSLUa0DeY/F/J8ARKW5X6JGaqg3GOy7TdPHorSxr/svPLGYtkUMaghEx?=
 =?us-ascii?Q?gnt/Fpi9Ku3Phe5CyWCX/WQlqrc9pvZbrIa26DNzJU5buIFjZ7eA1eI+hhKS?=
 =?us-ascii?Q?0K03Vvet2QteQu4lMXNYhmsDCn1cTARGkvD+HHKEYl5S4F+YrT4We6QpmKYf?=
 =?us-ascii?Q?Hi7Nhd9ih/gTA/MoqhldvYvbKe8xGdUnYRHC9PO4Z6YI0OTiASZdCCIM7TPX?=
 =?us-ascii?Q?stEvktKpb4mwolPUEGfYfX9n0QqPA/XTc30Yrb6jpFcOH5u1xIUwE51hsw/9?=
 =?us-ascii?Q?0o3L8tdEx6pUipzbnfRq0aal8Qlin9YX+O6dPWCorzaJnOCMvDjQ907nyKjI?=
 =?us-ascii?Q?/XHWlvhxan0LAvnGyIksA/BXNGaxSB2uBAXxi+UiRknuyuEdr9utonKuYzpX?=
 =?us-ascii?Q?Q25k52Kq1MMEuvakeVJNab96+EwXJCvgv79QZhVDIjdrVIUe3ts4wQWts6Fs?=
 =?us-ascii?Q?YyjbB42CkIye7UPlyqDPu/Zh9aV9kjluVxgZsX8NvLcWurF3yCMO+EcrcqsA?=
 =?us-ascii?Q?voMnkbXIWWkOLUBqwkb10U9QzwMZZrIXH6tAO1jVEd0+hXXWs4M9QICZHkO4?=
 =?us-ascii?Q?95dssUSrsfSvJZ7CRfyaH7zNGQ2qPg8z05Q/5u/KbDMlAerLXttEnzTZ8fWE?=
 =?us-ascii?Q?Alu9ZgG24xUMCvLzihBY0yHQjVJH8U2ZxZiENU7yqIqFrpx12TcnHwaZRzOs?=
 =?us-ascii?Q?oV/HaIg8JuFqSp6L1NcOFNVJVRklJROXI1paHICxV6KO52qA4dPUGmsGjF9Q?=
 =?us-ascii?Q?DSBMGX9cGlI/1vaDrI/bicCtjvZgTeIakDZSiep6sJb/4W2k5h5GypeipwnA?=
 =?us-ascii?Q?xBXN5Y40n0TIOlW8xWvWLHfHS6yBTrOu7fO8xpcTxml/YO3rba0QsJMSNVAK?=
 =?us-ascii?Q?B2aqioAsY/vWPgUp68uDqoPHo8j5UTUsrtg77Bv7i8dh90yKi09SCJRnXV8U?=
 =?us-ascii?Q?ZmlQaxhimCxuvpF+72YNUSU6RTA7/IkoSqDC2fJzl/fuyTASM5APNuM581fO?=
 =?us-ascii?Q?3605QWcvlaEGt6EKQpipCfthFqjtbc3qpqfDzFWXgjzYpEMT3Vxx1I/LPVE+?=
 =?us-ascii?Q?ZkcXXXn/TA0xmbSP1DxA9ugeVx5xlQqhqjtHgWNVJ3voNv4biAKW0KchLBrl?=
 =?us-ascii?Q?FkZ2qDxkuvVUjhaAkowt1DSNgaCS0nOKrogIIpbQBqEA19s23DFQ7Ez1i2xe?=
 =?us-ascii?Q?+Gr8XLkt9UOpObR6b1l8/VvRWZNfIhBh8QEL3BMps8rVrWVlzEo0nrgYVlEA?=
 =?us-ascii?Q?8ztF4Mpxkylfx+dH/KHCXF65cgqWQAU9cFJIIERE8w/ogT4yt1fEGxtxn+yN?=
 =?us-ascii?Q?6KLanifox63fIqQy91kK8gwm44fJzR5i1I3fAdgeKmdkY05lh8H1MPN4um6j?=
 =?us-ascii?Q?n4259CcMewz3QLSuStdFqqVSYoggpeRVS702?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:49:39.2372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9760123-a68b-4eea-5822-08dda46a1b96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7615

Without picking CONFIG_HAS_DEVICE_TREE.

In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
of the common/device-tree/ directory. x86 doesn't want dom0less-build.c,
as that's tightly integrated still to the ARM way of building domains.

Requires "unsupported" for the time being until all required patches
make it through.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v2:
  * (required on rebase) Add an explicit dependency on HAS_DEVICE_TREE
    for STATIC_MEMORY and STATIC_EVTCHN so they're not pulled-in. Could
    use !X86 as well.
---
 xen/arch/x86/Kconfig            |  1 +
 xen/common/Kconfig              | 12 +++++++-----
 xen/common/device-tree/Makefile |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7afe879710..4344b4289c 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -18,6 +18,7 @@ config X86
 	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_DIT
+	select HAS_DOM0LESS
 	select HAS_EHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5353874e87..bcf87b4d9d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -13,15 +13,17 @@ config CORE_PARKING
 	depends on NR_CPUS > 1
 
 config DOM0LESS_BOOT
-	bool "Dom0less boot support" if EXPERT
+	bool "Dom0less boot support" if EXPERT && (!X86 || UNSUPPORTED)
 	select LIBFDT
-	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
-	default y
+	depends on HAS_DOM0LESS && (X86 || (HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS))
+	default y if !X86
 	help
 	  Dom0less boot support enables Xen to create and start domU guests during
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
 
+	  If unsure on x86, say N.
+
 config DOMAIN_BUILD_HELPERS
 	bool
 
@@ -152,7 +154,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
-	depends on DOM0LESS_BOOT
+	depends on HAS_DEVICE_TREE && DOM0LESS_BOOT
 	help
 	  Static Allocation refers to system or sub-system(domains) for
 	  which memory areas are pre-defined by configuration using physical
@@ -171,7 +173,7 @@ config STATIC_SHM
 
 config STATIC_EVTCHN
 	bool "Static event channel support on a dom0less system"
-	depends on DOM0LESS_BOOT
+	depends on HAS_DEVICE_TREE && DOM0LESS_BOOT
 	default y
 	help
 	  This option enables establishing static event channel communication
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index cc56f42df9..f5410e685b 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_HAS_DEVICE_TREE) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += bootinfo.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
-obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
+obj-$(filter-out $(CONFIG_X86),$(CONFIG_DOM0LESS_BOOT)) += dom0less-build.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
-- 
2.43.0


