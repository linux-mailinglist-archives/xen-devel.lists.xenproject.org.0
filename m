Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBFDAC8D50
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000741.1380989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyV4-0003rG-Hi; Fri, 30 May 2025 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000741.1380989; Fri, 30 May 2025 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyV4-0003p3-E0; Fri, 30 May 2025 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1000741;
 Fri, 30 May 2025 12:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKyV2-0003ov-OA
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:06:12 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2412::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78d311b6-3d4e-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 14:06:10 +0200 (CEST)
Received: from SJ0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:a03:2ef::10)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 30 May
 2025 12:06:07 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::d8) by SJ0PR03CA0185.outlook.office365.com
 (2603:10b6:a03:2ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 12:06:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:06:05 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:06:02 -0500
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
X-Inumbo-ID: 78d311b6-3d4e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rn8c/C33E3HQyMYIFe6Ed2YxxvIW4lmgwcx+tw/jN1u1CGtv7V8GumDAV2WAng6HMheL2exr4kSLFsj71vcVT43JQpgMgXTHOm0prLnnYnD8ofv8eHBZyC1MWMAfjUlbi5XY4bAbYnttHVZqp2WGBczH5DbFKRsqt6Hpzr+CgODCx2/hQhT7apTcyBUJ7Zbjt1KxNxZueTG0DI5dEW0/TxDy33ximUqQE7idlnu/L42N7M3WdX0ujA3+rJ6FSc80PGVlU6qcbt0d/sdz9IcE3HVOHB7NageYEv6qkeQpLRXGlypnd/Yczltggvp/NAEQj6mkz2x6h1f+9Zvl0o1vbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ocg88oX1BblcuPZqowSJkdIZmVKEQ9DR4WNp1Wf0MfQ=;
 b=UZLyjksUsCr7CLVKBk36Yt5G4zDnB6+9qmYNZ5GvUAPTIVAcLZhQOc8lDOGbBkNEsg8CW9/0vYEigXISYBjzLSlEqmtxi0cGFXRdASqgQRdRGnM8knR60tTai4F7Mt6eojzeOz5UoXHStXo16NBjo4D5QRrSyf3HNlNAdnXCVBkRwUOBllobwTiuVDn/nLDkwP9rcA+K+k6CRmhNtGaSJMLPlHSnaiFGyw731SupRjKpYUij5nimVXfxgYQQ8559gktyr3+KbOlE2QLlnC9STLM3DynffgRTAnflIZIZ+gaRvOY3SphEQjVDX0DlzW6U935KT0Gy0THV7K4/b6En+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ocg88oX1BblcuPZqowSJkdIZmVKEQ9DR4WNp1Wf0MfQ=;
 b=Vozr5vmN4ZeueeJIXeBKTCCECjmNMSwYA6PPWgN80MrbgNM2tEuE8a6rJ6GufTh0RGeq6ZuNmbsNF82SvTJ6xtX6osz6VkLN3VYljm304KTyaULYlb0OdjwnpR4Dk8tZRG+ka6BJi4qdth3z3lROUU7C9p0q0XzmNf3ktNHRFLc=
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
Subject: [PATCH 19/19] kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT
Date: Fri, 30 May 2025 14:05:25 +0200
Message-ID: <20250530120548.39550-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c03a2cc-6085-464c-2c76-08dd9f725acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?piimtZczPktlCGfXmQW52dwvGy0ZtGx4sj1qHbgkKMAPep0qq6DEjm2v2Tbm?=
 =?us-ascii?Q?YzLogKsuhHEhdaK0N4fvQfGPifsMjFkwmpKSr0wvCmICHAA+Ygy51ZIBGBIf?=
 =?us-ascii?Q?n6Q0E9kRCEp3KIvMRq4IuriA2+F48NrafgWUJzgZwyJl0Ly/eX4llkTMKBYr?=
 =?us-ascii?Q?AV7DRXmQHIAUKbrykC891opQnBvdGdMVeoLU3tvc9pknTvQJNSov0E1Q6Xzw?=
 =?us-ascii?Q?BmdhpcZBiJGOVDgh3/MQuphummMLXwjoFoHQXMyHlovAlwpSxRjjO7tM83l+?=
 =?us-ascii?Q?kZoNKvoRGWDPWUZ5vMnsI+MAadRWCM8X7HkB3u4urFF4TgDHkoocePPozIr/?=
 =?us-ascii?Q?weUMmy3dYsVdWziMMQIG0w5wS2inTGpmPTXsfusPVh2gQ1wUN/cUQVeOyKNG?=
 =?us-ascii?Q?NqKhuwbZtFtKBDzLe/Fg5HXs1y6oS7FAYHfZQYT7MAgNCpZWNa90VapJf+Kp?=
 =?us-ascii?Q?KYapQRhbFwz0KESudjaVH6WB4eGVIFqadNStyiHqxHjMdbUPksbgtzEV3aas?=
 =?us-ascii?Q?XvEH1GwYQ/kotezL9juFpu8O/GKiVPCk4o4B1i6I2muxenbi02AfF+3uj5Tk?=
 =?us-ascii?Q?xjr0eBox7Sjy1lamXHe9YL6oj1XTQdmyh7eEbIym5IApZQcdeYjnyOLg3nFk?=
 =?us-ascii?Q?tw0VnXpcfH2Z+U5Had+w05jIL/gjPUrceMr+eqAy9jeXoYKCnXJxKmRjgARd?=
 =?us-ascii?Q?/KdN2VxEm7ZffjGVeeAN7Ec1sUow8KW92DirAEdP5nhjAjeDBAwnGnKUarbp?=
 =?us-ascii?Q?AztaJukiVs0QLp0/Gi96EPl/dWsnXLlIrsOTMKJta8c3/FlAiQiLNYxPmj3n?=
 =?us-ascii?Q?1QkXw2DQRtZRkw45sxjGYDS3pcrSeKxSa6JXopSzjkRXju0n853GT4Jt/0//?=
 =?us-ascii?Q?k96R3o/1r3jn+MtsU+EkyLEQcP2UkSMzwsV/OiJGb5DQ6FIaXnYf78v7facK?=
 =?us-ascii?Q?u6lxtnZ3UvlvOl0npVrb2rIXYb8ZOYPVWeae1hkH5mf4A1cAuBWcY21U6GOl?=
 =?us-ascii?Q?1MJxNQeqQZ4IINd1joLWq3eP7iX/Kl0PlKjZILpVxhRcQ1Qaoinx9d9klBKo?=
 =?us-ascii?Q?85ac43Zi1GWeN6UtwGx1qMc/CCtmnRFyJlVLtpMcQ8b64oUdDWIaRi/a2qEl?=
 =?us-ascii?Q?iPUU33fozMM5FzT+hxb7JGaynGHy3iC5hY17/2DP0XKMoNphOv2RtTewnJ3x?=
 =?us-ascii?Q?RZlQlEvw8wBtz63TJE7C1/gTKBz021cfCOzmS1KcjTE4cAjYaLLaisiVStBF?=
 =?us-ascii?Q?V4D97wr2VoK6J7sfGhJQqIZcFfEVZ0jSiIEvyb6ZHmUzNqChctlhAvEYagqH?=
 =?us-ascii?Q?nozfNZv310xx3JBQgpcBQNILXhMyUoERvvX5vOIu2KirnvXR6cTqif4HOvnS?=
 =?us-ascii?Q?tBgTTxzFqDh/bN3Em4b32/BACo+TRVjyYrC4dt0fNCBleTZn3YSOCKqzj1y6?=
 =?us-ascii?Q?1SMkkVAUfX7+hSenRn5lOOlmoNzB9koWhiW4tsDyg2WifKSxfnWblIAIZhVQ?=
 =?us-ascii?Q?NJkT3EUAiV5FTefd97ktFd1Bgqi56TTaVIyd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:06:05.3438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c03a2cc-6085-464c-2c76-08dd9f725acc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773

Without picking CONFIG_HAS_DEVICE_TREE.

In order to do that. Allow CONFIG_DOM0LESS_BOOT to take include a subset
of the common/device-tree/ directory. x86 doesn't want dom0less-build.c,
as that's tightly integrated still to the ARM way of building domains.

Requires "unsupported" for the time being until all required patches
make it through.

Only intended as a functional change for x86.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
I'm compiling out dom0less-build.c because it relies heavily on
bootinfo. Initially x86 will keep its private builder even for
multidomain boots. And will do so until boot_info and bootinfo are
properly unified.

---
 xen/arch/x86/Kconfig            | 1 +
 xen/common/Kconfig              | 8 +++++---
 xen/common/device-tree/Makefile | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

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
index 353ccbd06f..6e66657550 100644
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
 
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 4c09e3fb2d..49d061733e 100644
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


