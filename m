Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727BA94D49
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960997.1352612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lj0-0007vF-MW; Mon, 21 Apr 2025 07:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960997.1352612; Mon, 21 Apr 2025 07:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lj0-0007o6-He; Mon, 21 Apr 2025 07:37:54 +0000
Received: by outflank-mailman (input) for mailman id 960997;
 Mon, 21 Apr 2025 07:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6liy-0007m8-Su
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:37:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 872f3047-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:37:51 +0200 (CEST)
Received: from MN2PR04CA0002.namprd04.prod.outlook.com (2603:10b6:208:d4::15)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Mon, 21 Apr
 2025 07:37:47 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::ef) by MN2PR04CA0002.outlook.office365.com
 (2603:10b6:208:d4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 07:37:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:37:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:37:44 -0500
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
X-Inumbo-ID: 872f3047-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8npagCwejwizWteLGdO4HJVsE0Q9DmPiQqlBv52dMNs4AaHzUgrwVmK7VwOfPZnZVZO2C+qI7XRyy8ebdRSoo37YSt6/M4J3R9Og+hMKMeJA+tcs1Yr3UYj52uwZ4ssdJhO35HHEq1Pz0SMGJSnexdf7ATAEOcGfSmyRS8X5vkfJus73RyB+FMmYWpONUqIpJInSv7hRT3HoBlNYPlQ0Iy8cXvY5oueLRkqqkdEShrSQ35Dl39TYLjujK1Qe5eGX4I3asm5DfRzzejtDtXcRTvjVwf+rkAnHVnbedo7eKOeIQ78gkS8saedYpKxhKGsAxUIKQ5ChIetMorMJBIQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+U8oTWLb8OnhJdc/YwYQnpkAkE5yqnF71ljA3zNVvis=;
 b=FpAtzX8mxiG9ohzeIGM2Fj+tmgMMWMe+ebpYKoQzhgsHWxfuxGei8/BOD+LE+zcfXePG3rLzunPbnVM3WVsi/dAq3X9uXneyjvI3W+mNujd7KgUu5gSdXtQdbcEOyAb0UXi6EhzsAv8/kp862+NNHPwWfgsQVJWV6traiLWUus2yhBvs838vpB/tNIBzM5JsVf5/rgg35VWBfxospCx8VjEK66JpY6AeI/YYVqhi/k8vPvnL1FvnEVwfd/VG9v8qUeEEQBNEMjeDrVbil8d3AiumeGNAJ2aSFZwLhBWD0fpPsDbb8rBUUuSc4a2hQwM8MHVbPFswp0lbujL2eKVNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+U8oTWLb8OnhJdc/YwYQnpkAkE5yqnF71ljA3zNVvis=;
 b=q5cXhky6TR8QG4eaLdrHYInfkpJMhl6XyXhv8s50LccrnSY6oM9TblZ0KKQ/YFSJ39PDxS3e8SfWAw/cB/0WVK6YzkPJgJqVkHK08Sr2GeNSoYlOLcPggnlDyQZy8fllbm7vp/+4sby7RrunCbCNgZhWCnzRGDFHTAnQWNduwJQ=
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
Subject: [PATCH v3 01/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Date: Mon, 21 Apr 2025 15:37:04 +0800
Message-ID: <20250421073723.3863060-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d4c7ca-fefc-4c40-5054-08dd80a769bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pcjV8yO0aY6mZzKNjdKV+Wk4DX9kawLVFykjMsjxEzxXubBIWmHjB6nfTbQF?=
 =?us-ascii?Q?XqbGIKliPd1wBDiF4ai/04TkrJHSIS+0n3F/xMfk84QcPrX8oGeo7FFKy27P?=
 =?us-ascii?Q?k16Se/iWP3GA3p8E2qMgBh9fCImTkryl7T/RglZl0lCD+eK7cGV9Fzuc1r0A?=
 =?us-ascii?Q?qppVGTir9hXQktVkueeuz1MYuTRclhDydjcuAcMhN4jv08/f22iGI79Wi6w4?=
 =?us-ascii?Q?4Qsty9nagy9BP1IyZmlvTLBm7EkZwq6eC5zVCYIU06sTgFpif8F9Cv7Wci9l?=
 =?us-ascii?Q?Tt03gji1FyxIErZ6aMh74OvABBMjbJBIm8MjKUul4++g8kaAzbbR90KNKsxH?=
 =?us-ascii?Q?ZTGKBecFKJwyp+VAFmO/04mcArT8FrGQivYkY9izAJekARTUN7Jyhjb4oujB?=
 =?us-ascii?Q?u4XSbtEAomXQM3kKB7GYgd9k7W5Q0G8zxEyiUJrUyx3jWgTWYciPGEfZM5o1?=
 =?us-ascii?Q?dQgLONm4KlOiVzuDjvSsy8EazZfbkwBjatgY+GpuJamqPswLuYVWmVA6MUCT?=
 =?us-ascii?Q?7pZLJR80KElLp0E0oKCmD7Vpzs7Vr54AameyXfLEtWo2Vf7wieUlgrs34tqw?=
 =?us-ascii?Q?I0K3vfS+f4KuwuS9iKsw3jnBUdQyXwBVfeCJ6ErNjtsL7DNUXkFykhKx/crb?=
 =?us-ascii?Q?ix+zSMDQhY7A5Mb7n2ehHZoRPTzwFH+ZxtLkOkDvtjBKZ8p311FLmvBAAcHh?=
 =?us-ascii?Q?BoxeRjbjGbsEVKWt2rV3JI3fM30i3XlsygyaWE/ScgugJTjktcFCLelpGO1K?=
 =?us-ascii?Q?KmaV9tyE83fH61z4vvqX48azu9ifkUlz3akWdiNAwlW7rz2h2fGWvE6mSauo?=
 =?us-ascii?Q?bR/MrexaZ+iL5D36GzxA/CU9EymrNlsBBZnC63gclU1LsXgID+9m7isiBGq6?=
 =?us-ascii?Q?8Dq1mW4c/N+aaUHMkUKI8jzW41iJ126nNuNNOpYCRm/9ctqfVha9ugL/6D+H?=
 =?us-ascii?Q?ujC1PEheDQZD9zKTSAgXp5NnEwIWlZFObIyRiU96LomS7v19DeXAGI3GDeVa?=
 =?us-ascii?Q?DeYxmgpv6K9oFK0cE4UHNZFxZEgKfeIIJML7JysHyYbR+lj0nTUHIQZd9WLX?=
 =?us-ascii?Q?uxUBgRV5lBNMP5C8fPRm4vvHgmTe21AXSZQZl3b3fSdEuLf3NsymCV1ge5EZ?=
 =?us-ascii?Q?HikfeDNtF1COhlLWV8z96elAdkszoePaAvHCCEyvhyZPfZSzUCqWZXtoB/GG?=
 =?us-ascii?Q?VcwOekzwndoQVUREuuXsueH6blsRP4wSy8FWT1D9nk16S6f+NcomMCnIQET6?=
 =?us-ascii?Q?a1n2wNkDtth6+O5N6UmBoFmIrC2shlaeH9RTcwPI/3uRqR5sK/3/tlaBfULg?=
 =?us-ascii?Q?Rnmu0azexML7873Y0Sr6okHRHg5M1WdzS0aFmooQyBmNZHGnMA125Q0MV7qP?=
 =?us-ascii?Q?jEENc7wK5Umua+27qMzQaRKZCtCay73VK3BbBlj1C9SuqsiOzLQLYm7rOxdW?=
 =?us-ascii?Q?JN+xxXKH8UwYkCJHqdcK4h/Hbq9HNkAiQsLxebNyqsMjYMzOfqBawg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:37:47.7834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d4c7ca-fefc-4c40-5054-08dd80a769bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569

Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
equivalent "if !...") in Kconfig file, since negative dependancy will badly
affect allyesconfig.
This commit is based on "x86: provide an inverted Kconfig control for
shim-exclusive mode"[1]

[1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- remove comment for PV_SHIM_EXCLUSIVE
---
 xen/arch/x86/Kconfig      | 4 ----
 xen/arch/x86/hvm/Kconfig  | 1 -
 xen/drivers/video/Kconfig | 4 ++--
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index de2fa37f08..29a8b4b35c 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -138,7 +138,6 @@ config XEN_IBT
 
 config SHADOW_PAGING
 	bool "Shadow Paging"
-	default !PV_SHIM_EXCLUSIVE
 	depends on PV || HVM
 	help
 
@@ -170,7 +169,6 @@ config BIGMEM
 config TBOOT
 	bool "Xen tboot support (UNSUPPORTED)"
 	depends on INTEL && UNSUPPORTED
-	default !PV_SHIM_EXCLUSIVE
 	select CRYPTO
 	help
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
@@ -283,7 +281,6 @@ config PV_SHIM_EXCLUSIVE
 
 	  If unsure, say N.
 
-if !PV_SHIM_EXCLUSIVE
 
 config HYPERV_GUEST
 	bool "Hyper-V Guest"
@@ -293,7 +290,6 @@ config HYPERV_GUEST
 
 	  If unsure, say N.
 
-endif
 
 config REQUIRE_NX
 	bool "Require NX (No eXecute) support"
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


