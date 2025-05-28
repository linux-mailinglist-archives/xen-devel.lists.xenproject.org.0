Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB490AC6588
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999061.1379789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv9-0001nx-Bc; Wed, 28 May 2025 09:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999061.1379789; Wed, 28 May 2025 09:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv9-0001lY-6A; Wed, 28 May 2025 09:17:59 +0000
Received: by outflank-mailman (input) for mailman id 999061;
 Wed, 28 May 2025 09:17:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCv7-0001jE-HX
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:17:57 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2412::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b298c8-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:17:55 +0200 (CEST)
Received: from SN4PR0501CA0121.namprd05.prod.outlook.com
 (2603:10b6:803:42::38) by SJ2PR12MB8692.namprd12.prod.outlook.com
 (2603:10b6:a03:543::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:17:49 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:803:42:cafe::56) by SN4PR0501CA0121.outlook.office365.com
 (2603:10b6:803:42::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.13 via Frontend Transport; Wed,
 28 May 2025 09:17:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:17:48 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:45 -0500
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
X-Inumbo-ID: a2b298c8-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtELuvqUjmE9If4ZLTj9dHDlGd8BKwsf8YatmKSpKFs/jauaoeTs5j4FYzcG+2yaXz+MZWwFYqO2O2bek4KEkMq0gHtBDFUtejcyYI/7JN8IcAU/g6jpreIRWWnLdVJBX1zRB2FrC85M6t3UnvvScv1331y9vEidtL8GG+/kLm9Snh4hBs8gNlN3l8FE2usr4a2pDK4LhcXTrq+Mh9woNkCx3+k89uAaeVbT7VdKAgY2eWuQSs8Ka3lEzvyVQe/+UsTV7cAdEW4+h/t6nVyxwmJKD3ZK9qjPEESY1xTp/a3IntsuVPwF50/JN/793D+sdMGNBSrvVzHAmNP4kigkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEQJjo/wnWVr8f3Aer+P6n+okT/uMW1cOMLdB+X33/0=;
 b=e+IayQh7+7SRG97fa7AEBpXj6O4aMkQ/BqQ+N0q/kkMW5Zl+ixi3iRwwZWCoNdZt+pycVQ4zZahj/0/7i4Nkck++gT1LMpHAEr1vB5AxAyJw431LBbNkoc+vEFVqDcen5uS0nh33Or50lS0UjE13xYHpu2IxnsCSAwamC4S251p7aSIVf1mV8H6OuLaALBWF/D9Trfp/qaDgwAISjbbZQhVaHjm2skyMGfp7T6xdCUPGhDE6sQTd++/DuY6OoyQevIt3FSTsR+W2vV6FSeVdqlizXko+tc+vltcTGWdz+9indY0IWfanECdlDSnkIdoHLoims5WLmvwfMbcEbrQJtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEQJjo/wnWVr8f3Aer+P6n+okT/uMW1cOMLdB+X33/0=;
 b=aH/fSU08nHzBl9BGD3LLYbd2pN99DyJvhHz0VOvtbIXKka8fqfde9h7juLg9dbG22TjTn6P9/cSgq4UZ/wZ1jPCtsI46x9HXk0VjVXXWuhR6OAraE1qoE4KY9S4grX2JDfRkwbDRzjBXiAQQIcgRP6K/2e9qPp4j1Y8g0ydYbTY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 03/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Date: Wed, 28 May 2025 17:16:51 +0800
Message-ID: <20250528091708.390767-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|SJ2PR12MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: ed927bc3-95d0-4425-c329-08dd9dc88401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?66uNqdhPZh/3PfWpHzmKH1eZNta+L392t+5cXqaM0zP+jx8Ex+6/GutSCw12?=
 =?us-ascii?Q?oNUV/24Tp9xNq8MNaNgSamMaVSbC2KzHV+xsb7jVBSn95eMGsIUnUc0nc2di?=
 =?us-ascii?Q?f39XOR/Fbx4cU/gR+AxiUB2gi2uEztxxvW/ooaNxF4D82wrezM/qEZDdkwH9?=
 =?us-ascii?Q?3bMRvU4JCOZ7g0Ieh0D49Lw/81ukQduUqp/xekjXzHmkvpjOeh6934AStalN?=
 =?us-ascii?Q?b+8NoEQhsBBR10tin7tUmIhSAbyixz9EHGeZoAMyVSn0ZgH35an8UYnxy4FQ?=
 =?us-ascii?Q?U42I3/U3/ZfWJgymbYytfXBq0a5ZcwTPbf2ZQDFZGa9/kdouRNYBZV1rCzzM?=
 =?us-ascii?Q?5amv4f+U4wBJvql/rNOqDX/lzBAvBthLRaqcsYmOhSqy7dXgqKkdct+JGAhF?=
 =?us-ascii?Q?Fe7dDynSxzO9rgF3hGWskaON7mj2tp9bfHH5740D1bDh7ewhOJhHyDm+rLfq?=
 =?us-ascii?Q?Gogj9HmNp9Q/SacOOomzqiZOxXDSId9JeKrjfnYSELsCvqeyZkBjJwvCtlQv?=
 =?us-ascii?Q?il9PQCQavaTjLBK62QZnpUzfl9KB+35WIeDk46xvwMel2ZHMXAcK+vNFXFqG?=
 =?us-ascii?Q?fhR391TNX6WwJRNUH06wRSxYnQbmZVkehAteCZbKTwTWegsHe0vBNyk3Jnv6?=
 =?us-ascii?Q?WJ1qHaUxCrF+9HXJ0rGOTj+KTJKwf5vh5cfv6+4ONkdk+eae0GKslNMCsKnV?=
 =?us-ascii?Q?tN1b7lrqjUfm+f0TGVdHTQAVq3juPXDPzHCyQVb52ArxSHuBCLtjKtTZcQqb?=
 =?us-ascii?Q?H8BUuofxOynNU7Jig59lEykIR64GoUU7moT/aRU/MZfn3gzyJWy0m+K1faMe?=
 =?us-ascii?Q?oEqFZVokLyMg4nPG53Zl5hKdX4r9AsjV1qNeqbpxtKEy2/nlpEb0CfSnSf4L?=
 =?us-ascii?Q?Eo/OFCIkg+etH5fbvlYwXXA2m1Bfs6Px2Df3bUK4ge6aoY/JRgcW+1vvLZO9?=
 =?us-ascii?Q?imMDSGFLtpsCuks5RLIjTmIRho+RYHQ9HPKZndH8fV54mK12nTw3mob2AcZu?=
 =?us-ascii?Q?HCZ2FTH1BmgnV7rBz/jtGEJfEzDhHY40GOyMhB/eR1PMdDFRpuXCcKW1CvD1?=
 =?us-ascii?Q?jGODzMEdkFiHgOlL+iU6lRsyTUVKrh42PWyYGr5g4v+67TsW8n4ZUzzSLrng?=
 =?us-ascii?Q?g39ch+wa4g11bQuPxmIrW6DdZwH5JSgcXkN3NAKYtpWh+PC4uizFfQ++c57c?=
 =?us-ascii?Q?8c/IO+CUt8WktZsgk9P/vTJYljEEx9wiThct70CEWgZmpTq6ac3dh++XW9c3?=
 =?us-ascii?Q?5c7ZslvgimJGiOXz3tjQwr/FsbGMr+EcUv5omFL7YJDVnETq+ny5l4h6Sjrx?=
 =?us-ascii?Q?AjTFeG1OkhiqOdpbtzBgqUilQlVIzIl5UPXGESc71+ynyGj/fmoGrfAqbLpu?=
 =?us-ascii?Q?ggGUv4EVbpiqS+N+TxBEjNWNyszT0Dstyqh+Iy6X1A0HvDHCjqdouuUqdGyK?=
 =?us-ascii?Q?GQWUowOoihMAD2AOSC2IbTbQttIAAYX/wyAi02oMKltHLoTroAH4WDwRcdZq?=
 =?us-ascii?Q?SNNvfWRPM+NLRk4rP8Hg4ffYfRZBrd8+mJsi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:17:48.9564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed927bc3-95d0-4425-c329-08dd9dc88401
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8692

Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
equivalent "if !...") in Kconfig file, since negative dependancy will badly
affect allyesconfig. To make sure unchanging produced config file based
on "pvshim_defconfig", we shall explicitly state according Kconfig is not set

Add "default y" for SHADOW_PAGING and TBOOT, otherwise we will have unset
values when running make defconfig based on "x86_64_defconfig".

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- remove comment for PV_SHIM_EXCLUSIVE
---
v3 -> v4:
- explicitly state "CONFIG_xxx is not set" in "pvshim_defconfig"
- Add "default y" for SHADOW_PAGING and TBOOT
- refactor commit message
---
 xen/arch/x86/Kconfig                  | 6 ++----
 xen/arch/x86/configs/pvshim_defconfig | 5 +++++
 xen/arch/x86/hvm/Kconfig              | 1 -
 xen/drivers/video/Kconfig             | 4 ++--
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7afe879710..8c8e661d53 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -143,7 +143,7 @@ config XEN_IBT
 
 config SHADOW_PAGING
 	bool "Shadow Paging"
-	default !PV_SHIM_EXCLUSIVE
+	default y
 	depends on PV || HVM
 	help
 
@@ -175,7 +175,7 @@ config BIGMEM
 config TBOOT
 	bool "Xen tboot support (UNSUPPORTED)"
 	depends on INTEL && UNSUPPORTED
-	default !PV_SHIM_EXCLUSIVE
+	default y
 	select CRYPTO
 	help
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
@@ -288,7 +288,6 @@ config PV_SHIM_EXCLUSIVE
 
 	  If unsure, say N.
 
-if !PV_SHIM_EXCLUSIVE
 
 config HYPERV_GUEST
 	bool "Hyper-V Guest"
@@ -298,7 +297,6 @@ config HYPERV_GUEST
 
 	  If unsure, say N.
 
-endif
 
 config REQUIRE_NX
 	bool "Require NX (No eXecute) support"
diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 2ad27f898e..6f652e145e 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -26,3 +26,8 @@ CONFIG_EXPERT=y
 # CONFIG_INTEL_IOMMU is not set
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set
+# CONFIG_SHADOW_PAGING is not set
+# CONFIG_TBOOT is not set
+# HYPERV_HYPERV_GUEST is not set
+# CONFIG_HVM is not set
+# CONFIG_VGA is not set
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 2def0f98e2..b903764bda 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -1,6 +1,5 @@
 menuconfig HVM
 	bool "HVM support"
-	depends on !PV_SHIM_EXCLUSIVE
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
diff --git a/xen/drivers/video/Kconfig b/xen/drivers/video/Kconfig
index 245030beea..66ee1e7c9c 100644
--- a/xen/drivers/video/Kconfig
+++ b/xen/drivers/video/Kconfig
@@ -3,10 +3,10 @@ config VIDEO
 	bool
 
 config VGA
-	bool "VGA support" if !PV_SHIM_EXCLUSIVE
+	bool "VGA support"
 	select VIDEO
 	depends on X86
-	default y if !PV_SHIM_EXCLUSIVE
+	default y
 	help
 	  Enable VGA output for the Xen hypervisor.
 
-- 
2.34.1


