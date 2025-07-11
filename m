Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F799B0123B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040365.1411851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5RK-0005SJ-9i; Fri, 11 Jul 2025 04:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040365.1411851; Fri, 11 Jul 2025 04:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5RK-0005N8-4X; Fri, 11 Jul 2025 04:32:50 +0000
Received: by outflank-mailman (input) for mailman id 1040365;
 Fri, 11 Jul 2025 04:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua5RI-0003OR-Bd
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 04:32:48 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2416::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1753fed2-5e10-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 06:32:46 +0200 (CEST)
Received: from BN8PR16CA0028.namprd16.prod.outlook.com (2603:10b6:408:4c::41)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 11 Jul
 2025 04:32:38 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:4c:cafe::17) by BN8PR16CA0028.outlook.office365.com
 (2603:10b6:408:4c::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 04:32:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Fri, 11 Jul 2025 04:32:38 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 23:32:35 -0500
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
X-Inumbo-ID: 1753fed2-5e10-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLtx+s3xOM+re0QZkNgI4Wxyvwzua0fs3vUf1eDWzqbBdC1Wqlqw6HaxXgnSP1rtZkEv7+WJkx3uNAwimymbYNnY1Vo0Fml1yGs3nQ1FiwgeqqKQhDXR0yPNksVAMYaon0dyAJQQrtU1WEB4aFof3qQWROcZhYNtsWzVLN/VXLZzsguz65hcEB8N/rT0JFyqnpbC/46rifcGlm2v8rPQsYsizuKC1Af8O5KKo6BQ7MvP8/p4/7DQR6MWnAODbGxCOKfG6yJb4LnLETfPevF9bq3UAqI812enbXlse+yqiXPIIKAB71WeWPigQYGskPmMu0XCPjD7gH+mINlo+Lc+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxLjdkHa3RaEXWbirz1dDiVlE8yRGnu25xYevR+WJ70=;
 b=cjkUkd25DUf+1F01v4DKwH4W1W8Ospvj0gfXvvm5HsbynGKxb+g5cQ7Vn2uqOaZ4VAmozAoUI8tJwhe9ZE40Q/fdkjUeg7Qm9OyjiPm5V9zB5RzJIzzgk6MigNPnCQvUkjUMDj8MogSXtntDnIt6L3YbuIxeh/jAtscxedLJfNMDfHpsrw8J9t5xP8A4g0ES8/VJwly9mX0HckMv/fOSW4fCHld9ZTqE9Wn7MnCyPw9cIUBK5HmjRL1Jm0uXb+8GjhQ793gmD/RBgTS9jU/yjCzlAEGufQTgSrAq5xKSWLoM7CJwBF1WsE7Xq8luku2cRqzemD3x8a62XgXsNk/rhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxLjdkHa3RaEXWbirz1dDiVlE8yRGnu25xYevR+WJ70=;
 b=kO+ZnjAURTiAOVGpB2SWQy4R0q4gJVVaUV/l1ZLIMRfAYUQ+e/AW4FfrY+x9hkXsGutfgNA0utAJrrFxO4KKIKiYvATyJIZtK6STbYCnJUSAQV6z9IE8qU4esqDdZ6zOHarC7utsQ+oHNfURgorxl+s7ayKIC/SvUHWamStWDHg=
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
Subject: [PATCH v8 6/7] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Date: Fri, 11 Jul 2025 12:31:57 +0800
Message-ID: <20250711043158.2566880-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711043158.2566880-1-Penny.Zheng@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a09c855-698d-4f80-6400-08ddc033f776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GwLWzAIU3fd/Wklx6eKKjwabeRN0lKMoh8NcVwAeETJKZLAcI82fP0Pnjqsl?=
 =?us-ascii?Q?dzJXkbEzpObAZVR4ykQSKU+yXzRz/sSc4AH1iipOW3hBdv3XIJ85/8ufMqQo?=
 =?us-ascii?Q?tzAk3E/hCf/m8rSfCoPPCI/+mymm4cAdg+4hHC/0uJTi7H8FuMsW31TfPE1p?=
 =?us-ascii?Q?2Wdw3vnYW5zJzYQn1Bh8z5LLrPA5n2Av/AK27PIdh/Nt22P1h6ZtepOUe3Ol?=
 =?us-ascii?Q?zgwJn/g++BFttMx8iBUC/+QiS0GWvGiP0Q4/WXkt9Us95J4/RHGLTzapLOgJ?=
 =?us-ascii?Q?YE2lGfA5nb8Du/0QV/xO1HmMlNIdQ00kNKXMSf70uuq7sqcNEC2ZJQk3iDMs?=
 =?us-ascii?Q?B6/F8LBalQYNmUxIhG7s1NYE8dLfFez7ncPDCt0rDLtPjY+Ey6IU7cNjwyUH?=
 =?us-ascii?Q?pb1ArsIQWuL+rDcJNerTT7SizU/gbi56tWsGuGQAim0QO6Hz/xMITVcfGk8r?=
 =?us-ascii?Q?TK0wZq5xv5l82MwjGIZcQwF17RhFSkl9wdfuXhV4FO2T/eI/BpGxUix7xacU?=
 =?us-ascii?Q?rJPld1x6SqpX57HFpJ13V9COeTJblc9VG4AREz3LRe8H20nZ81xIX7Jdf9hf?=
 =?us-ascii?Q?5Hy8x0yrGHx1Z816Cn9UdSIss6q5q4imgJnIL1wicOrpfkMWMMBunp+FnRTt?=
 =?us-ascii?Q?+nb0t5UATGMCJEjEgrD/URKmEPJVLp4RXGUvd6WZosDvnLh1ESQp7ahByKEt?=
 =?us-ascii?Q?YBKRCbggrPQS7I1m7FI3icKtFNyGi9zMTVJSFnnBr+mpfX6pSCdZm2PykAw9?=
 =?us-ascii?Q?CMHn+0rZTfBlJNgogwCeag3tg1GytZWP4pazzd4ig4m/f8nD8UuIoZfRnMDo?=
 =?us-ascii?Q?0/KmOMT9HOy0APLI39eD+5/7BOJLH5XO69pS6J05LZAS8vXDBP6cUHq43+sb?=
 =?us-ascii?Q?1X3YVv1dR9wmYZFnOYwh6S4HE8VbSAJEVyG93D8/oCN9wsf6JnrOTat4B2vK?=
 =?us-ascii?Q?+6s94sFsWJSkEbgV1ZBLzDvR0oPBErvxxUdw8wDmMK3g+5ShvWO7mOi1FZA/?=
 =?us-ascii?Q?5mWLsOhY2AlLRurnP0LyP2muQQZACChlp1LV/hXeGNmq12FBJuTx/HtwTKPN?=
 =?us-ascii?Q?x3c2QEYpqCE18vReS9zTDgUnFEub5OLcd3+FmlOtQtnRoJnMrxP9BtkLfW5d?=
 =?us-ascii?Q?ILD7Lraqo//4FmPwn1LKkk+c47LZer45/KIhXkg5tGboFxFkJ2S0olFR+Lb1?=
 =?us-ascii?Q?ckUUzwR3N8E0yvdAeRuiQ53ZTcpDaDARQrKkzETohhhMeyxM0qmt6Fs+pMFg?=
 =?us-ascii?Q?+RZ+EK0qMfHnNWXVTor6ZSb5hq72tqu7XD0mmRH5aUsR723ceRtDazjZXjL8?=
 =?us-ascii?Q?7pYmiLvRxDjCVomnV7yr5wu/1odomqarFBeG6uT+zmD7j9FRo7dCN+YEFkXX?=
 =?us-ascii?Q?0pxJQuCJlfUx7bybUIYG31qb5kHeWEJq87awqEoAItJ+cuJ5tds+ic0jO3Nu?=
 =?us-ascii?Q?dLkrJ+btbWr9pK+Fw16aUAnvdmviE9wzSHpOagmxV3TcM1VKKRu08hnnL/+L?=
 =?us-ascii?Q?dbhnmZAyVFJD6pNnzxVWX2soOPyCPu31i1XM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:32:38.3641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a09c855-698d-4f80-6400-08ddc033f776
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888

Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
equivalent "if !...") in Kconfig file, since negative dependancy will badly
affect allyesconfig. Although "if !PV_SHIM_EXCLUSIVE" for CONFIG_VGA is not
truly a dependency, setting PV_SHIM_EXCLUSIVE y still makes it unconfigurable.
So we remove it here too

Add "#CONFIG_xxx is not set" for above options in presets for x86 PV shim, as
the explicit declaration is to ephasize setting for the shim is different
from the general default.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This commit shall be commited together with the next one, which is also the
last commit.
---
v2 -> v3:
- remove comment for PV_SHIM_EXCLUSIVE
---
v3 -> v4:
- explicitly state "CONFIG_xxx is not set" in "pvshim_defconfig"
- Add "default y" for SHADOW_PAGING and TBOOT
- refactor commit message
---
v4 -> v5:
- For not breaking allyesconfig, changes to defaults are actually not needed.
So remove them all
- Leave one blank lines
---
v5 -> v6
- add description for change: removing "if !PV_SHIM_EXCLUSIVE" for CONFIG_VGA
---
 xen/arch/x86/Kconfig      | 4 ----
 xen/arch/x86/hvm/Kconfig  | 1 -
 xen/drivers/video/Kconfig | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9ec0fb0bed..a45ce106e2 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -303,8 +303,6 @@ config PV_SHIM_EXCLUSIVE
 
 	  If unsure, say N.
 
-if !PV_SHIM_EXCLUSIVE
-
 config HYPERV_GUEST
 	bool "Hyper-V Guest"
 	select GUEST
@@ -313,8 +311,6 @@ config HYPERV_GUEST
 
 	  If unsure, say N.
 
-endif
-
 config REQUIRE_NX
 	bool "Require NX (No eXecute) support"
 	help
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
index 245030beea..0a51e87eb2 100644
--- a/xen/drivers/video/Kconfig
+++ b/xen/drivers/video/Kconfig
@@ -3,7 +3,7 @@ config VIDEO
 	bool
 
 config VGA
-	bool "VGA support" if !PV_SHIM_EXCLUSIVE
+	bool "VGA support"
 	select VIDEO
 	depends on X86
 	default y if !PV_SHIM_EXCLUSIVE
-- 
2.34.1


