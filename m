Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD8AD910F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014522.1392679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6D3-00083E-Oj; Fri, 13 Jun 2025 15:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014522.1392679; Fri, 13 Jun 2025 15:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6D3-00081T-LO; Fri, 13 Jun 2025 15:20:49 +0000
Received: by outflank-mailman (input) for mailman id 1014522;
 Fri, 13 Jun 2025 15:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ69X-0001Mm-Fa
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:17:11 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2407::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 799ad5cc-4869-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:17:09 +0200 (CEST)
Received: from DM6PR21CA0004.namprd21.prod.outlook.com (2603:10b6:5:174::14)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 15:17:07 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:174:cafe::14) by DM6PR21CA0004.outlook.office365.com
 (2603:10b6:5:174::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.13 via Frontend Transport; Fri,
 13 Jun 2025 15:17:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:17:06 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:17:00 -0500
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
X-Inumbo-ID: 799ad5cc-4869-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obMpc9QlRNAW/bwpgCLlAlgeoU4/9kfBuh3Fv+2Wq+w9DaBbQFu2jNGg11RqIsMakNoAHUCV8cdXtLvftTc2JmeU06AZVp+41jneT7R2WX2yE8qeX9OMzEYspWJUfSgd015d/H9XYAu/khh/txW+hi7NokgxtCzUHbE2kRJlmVN21L44+nS4QVcPrZ87qRc+XMmenGjbUuNvRj+nZVB2L9eh+v/m1rkWCAIuXKgh/6sIofyNzCsn2TCBfpn53BsjO8a4Fev4PYrZznTVwlqSx4uRsuoQhz0j8Jl+eyf6bkDQJjvyFd0EMj6bScGiBpWzNo1eB030k7jnRIC2+0i7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sXC7bKMTvaM/Im+RuFHkslTamk4z5CqhBmXTzNI29c=;
 b=EINLOJDib4CciGNtHiRc6OP4NqBxdCxXiJTY6A53P2V/oB7rZFrRE/BOu2ADU4y5PMKtQbZdUqz4qtyPxkAoSod2iH6m6vmHnLlSxKmD3djkwJ8+cG4pxzA9wtEVZ36FTFbpi0swh6Cg4VOm8zt+a8x15ohXaQZSZmbcGtcH0xj+L6jidAv3vlQEaBok73BUEM7zSOAojdpn1z6C/T8UKzhWzW2iO4Us6nKr1CHusH/oOo3cJBdfXnAbn2vuvRo5gY7HGh9TyAZa8KB+LaiFlI252tu+3l6UXPqr6+eINoMANv3cWK4JiK0XUWOx0IpBEppqI9dS8BNVRb+VEOdR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sXC7bKMTvaM/Im+RuFHkslTamk4z5CqhBmXTzNI29c=;
 b=dpw9vzYFEQNGa00IpRBjJy+Y5t1ncG6fnTdVkCMcK/QE4Hy4li5ca4tn7EGH/RGxdF3+PEcA2MhynPfWMmtwmePJOAOgFkm0OGsdYdzwqfo1ZcpB3cwbWwjW2gv8do/xdsEU5CpCric+9bTk9kAHBBv2dAgqZCtg6pA1/1WdjNI=
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
Subject: [PATCH v3 14/14] kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT
Date: Fri, 13 Jun 2025 17:13:23 +0200
Message-ID: <20250613151612.754222-15-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 517b1110-60dc-45d4-5435-08ddaa8d5c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OjKq3mdOoZRdd8pgia2dAGKeg46B/vg4h53JP2CgmvF0AMWjadMAKtmVudOd?=
 =?us-ascii?Q?r7HSGpF2FsX9ugbe2L26hS+9c3nA6jBzsPIv9Q/kXFHDWe8biX70JmeqCMdR?=
 =?us-ascii?Q?bCA1xkZkPATH/Dfgwc73W6+8uI8Eu88Pvg7glfhwUfOm/8YiNCYGzRvDRGi0?=
 =?us-ascii?Q?Y30WW3uRBWtz4rke3HhRaINmxryGsqz3KAl0lUZUGt+gOi9j/+Q6edTcfvK9?=
 =?us-ascii?Q?oYfpDRXUEfzRwQ1+ydIIHzid1wrKOBtpGKulZuTDcrCH7Tmfjy7fmJTRsn4L?=
 =?us-ascii?Q?r852OEcaF05I46EsDkQ4h5iIMcSlpNkEBw2+OaUDbtD+0j2HY0Ykj536EPBv?=
 =?us-ascii?Q?tkrl17ddVOYhRRpquywfWNlfuvHWzh+YrSNCr25I53vLW9InH5JE5GLBMF5U?=
 =?us-ascii?Q?Y+23u4+OKJsceYZT/mnmvCpHERRoGfm+OdklCSFmVFnVk0UJwE9XvU45nZlj?=
 =?us-ascii?Q?nBftn/i4e+gp7xWYV7u37/wP7exJJCy476xY05t1FCLmOMSI2Y1eAMDdhgIQ?=
 =?us-ascii?Q?nt456oo9OsygZhq0iFJjyttEo502Nru8N+uAR9u9n6k/p50oIEbAH8ifLx9T?=
 =?us-ascii?Q?kwlJ40/nCPxkuPy/ggGibu7H5UpXoUx5dugKIDB9A2OB/b0xXjM7m6dE2g8V?=
 =?us-ascii?Q?ZMjd1X0JpW1wV9XBQASCabjX65aSHIjLnypJ7oatcWXbZLGN7Jj3IIvcGSDK?=
 =?us-ascii?Q?1e7NjwWs90xqNGLCYeFyKTJ/GmNYp96YyKdGLEeoMwIioOCJUlYv2zFVR6ye?=
 =?us-ascii?Q?u+0vlccmuGSxzga1QdVWB47wiADE989s+M9qBrR9mkD0Pg77/pigSmh8iK/e?=
 =?us-ascii?Q?8Zfpnk5JcVE21s/ynLnXKIOEklGzGf8WLO79esO/NI/I26UZmjONqZJtonNb?=
 =?us-ascii?Q?6Tm1ROdlkXUneG0a7evW3b/7UDOT1X5Fdmb46c3tmgGnlgqFpdIivYMyyBtR?=
 =?us-ascii?Q?fVbbXYWzHNs7zOKuFc6aIfy2yk0SOs9X4JI7ZV+WH8HAKk6qXyX0GnSnHl3i?=
 =?us-ascii?Q?COR1ZOuQQXlNpUg/+fza8BZZ8iiTmIxZyLeMtVVCYPEB/fzFwLzW0ByosFV2?=
 =?us-ascii?Q?Pro+I052pBYpNpxEfm5ZGDrVVnFfTWynKD26LZ3QVPUE2/kceZerJ8gOgJux?=
 =?us-ascii?Q?Vj2Oirr/A9PgPav0AF7zDcb62mz2XvEeJCa9KxesgWk7xxMfTjjzHkyaYPhq?=
 =?us-ascii?Q?EPrRsOn4gPt5Qh0bXUeajgyHZPyPyAZmK6SxH1PIRn+4RWFaBqo1T0nfOTYv?=
 =?us-ascii?Q?MLLaCVAUwJtCNrybIwSdSj2lYM1SpIQ6rD5TwTAP5/nLygtMrXZN1He2YfqI?=
 =?us-ascii?Q?yNU8z4Ek/TgrcK38QLXovOCBbEBNvcqRCcT5GPwJIroQNygZuuYfFdcppkPH?=
 =?us-ascii?Q?V0Y3kzOYveWsUpGVXGIS1FCw8a4nqS4OCfGh+7X/UKANA24tAfrpbxFjkk8u?=
 =?us-ascii?Q?535oZ5KfQ+IFv0O7ZD2vNYk6+8ZaF7D2cak3qmOuZSPFfGTigGSyA1jUR9HQ?=
 =?us-ascii?Q?pw76VQBy6nZP8JTbnTtWpVWS3uSXsq3U7VlA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:17:06.6834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 517b1110-60dc-45d4-5435-08ddaa8d5c08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642

Without picking CONFIG_HAS_DEVICE_TREE.

In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
of the common/device-tree/ directory. x86 doesn't want dom0less-build.c,
as that's tightly integrated still to the ARM way of building domains.

Requires "unsupported" for the time being until all required patches
make it through.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/x86/Kconfig            |  1 +
 xen/common/Kconfig              | 12 +++++++-----
 xen/common/device-tree/Makefile |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 752d5141bb..cb4f9a834b 100644
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
index 2baa4221fd..5118ea7453 100644
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
 
@@ -155,7 +157,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
-	depends on DOM0LESS_BOOT
+	depends on HAS_DEVICE_TREE && DOM0LESS_BOOT
 	help
 	  Static Allocation refers to system or sub-system(domains) for
 	  which memory areas are pre-defined by configuration using physical
@@ -174,7 +176,7 @@ config STATIC_SHM
 
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


