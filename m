Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D49AC8D4C
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000708.1380889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySD-00078T-4B; Fri, 30 May 2025 12:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000708.1380889; Fri, 30 May 2025 12:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySD-00076y-1D; Fri, 30 May 2025 12:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1000708;
 Fri, 30 May 2025 12:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySB-00076q-LY
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2009::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ffb330b-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:13 +0200 (CEST)
Received: from MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::34)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 12:03:08 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::83) by MW4P222CA0029.outlook.office365.com
 (2603:10b6:303:114::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Fri,
 30 May 2025 12:03:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:07 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:04 -0500
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
X-Inumbo-ID: 0ffb330b-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKSUDbankdwbxbUtxMYy/N1d7WFaAWeNc8UD8nPeQ5ET7cyVX4QmTraNQgc02KeAK5J9rJHXjBNKER5jtDpqAGKb2kI4pyE2jwTxxrktzOycKuFV2gMLceXgh5HWkG9ddRTKgiXLRzrtaJZ3EY4fkRYr74aaLasyna6BaLyvF8y2wbAP/sgbGrJ0kyoq+p4B8eM97Vgh6rMqtE8KAVwzqXLQ9twGR29yknxhgRATwuD1Qx5G9ctCBdxXLMhlyyQRIfH/oQinUUtcps5W8uUMiIw9mP4ArciLEDMmFqQm+fIVis9de/wgDsoQJdAx0q53VqILDyLRK4nivNCwUUL5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDnxDduMjMbUnEln534OSW3kiycNznllTRrJRof/5zY=;
 b=ZuJhhB1W4oDpbmA0KDn7EXfnfB20RwbLBk+MjAYyc0VXhgJqLgNVEBnlAsV85AJsyaloBW5rCwdkqNaOyHUBAzSPA0PLHOD/cHY8hiFfL5qv3n9lVDLhwef6NrDiZuqoJtofx6lLjuy65YfheGlKDC9ByMdCllRwTqZN7MRYZn+/7Vlc6Og2KF/E2QOHYRlwP6xvfT3IJgHnEZ8H6potnei1c6hbKbOpUR8a97rYLaX1ZNM1Zm4+9/y8Z/V9caGS/bkkiEqjq5Z1zbpx8c3eyxEtkibzQJNgYGcgXXyHjt1g/bFz8ACCQqheteu4iL6fDODLkCNZEuw8VdZeB6K3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDnxDduMjMbUnEln534OSW3kiycNznllTRrJRof/5zY=;
 b=Q5c4T7/my5xPCBBtvWafUux42Q7oP4cIasoyZjnCVV5BKD2tU5trpOOrhxabkroH+8RKSqSaSYks4yqrTlSDl10s68Fwkm2vGH18kLOXUM6KlAgAya8HGFeQY+edlP99+2RwCzcLqNbYHHalGuLMc5GsR5iDIr1DI92A6KECJyY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 00/19] Allow x86 to unflatten DTs
Date: Fri, 30 May 2025 14:02:08 +0200
Message-ID: <20250530120242.39398-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: e0891c8d-3c7f-4222-7a5d-08dd9f71f08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7223QPG+jhcAxCLrpWSPO0PStKjEApex6jYj/pP6U30Wi6UA52oVN8hSlKyS?=
 =?us-ascii?Q?2qHiAif6QgNX64P+xbPSJDvOWmfY4X2wLs1xG/conux+citrTWudZT3jsccu?=
 =?us-ascii?Q?G7QB2QulfaBUYgmYei/D86SEtstwo7Dw2AcX1JfIBihlpm65Ph1vOb1T76AS?=
 =?us-ascii?Q?IV2dSe3R9ZvGc/qNq2xiOZTnloK136Dz0cZXD4vieCt+jW+i2EIaZrKw+lcc?=
 =?us-ascii?Q?xSaJz26XMwJ5eeE1gN7s6cQFEqjhg2+WGNKvmFxHjL8lZzF1nc4OP/pYqIqL?=
 =?us-ascii?Q?qBsiJyCrFstfWAlIwnl5EhBTvdjf6vrGmyUbM3OdTUw/h52BwKFj38L9okWT?=
 =?us-ascii?Q?u3PkaQ/EI8V6eycAHnnF0AA7sX08c3iR+18iXInKCR0ZpwM3BhS+aBosVb6v?=
 =?us-ascii?Q?DCzu42U12n67zowuIg6RObNBvIvtIaq6+Mjvb5Vod50/5Ji9hnWz6ExO+Siy?=
 =?us-ascii?Q?PPXbhO+z3fJit24I7ztknnrjG5TpvHPQJoGADd4Mfp9Rqtz0w6a7FvX0LgsZ?=
 =?us-ascii?Q?SgAnXDmEQAaO3YIBux8Oi1DPNe+HawnLRZonb7gnuedaIpddJ3UQcIWO2HDX?=
 =?us-ascii?Q?oNefCpuKBu0lps0hhsHF0TPhYCrp/eGaZHkH6NVVdP72ZDV7+Zv1ny6ra31H?=
 =?us-ascii?Q?e+9gyaVP4LBhPBjiTOzzIT5gFGPLz/NZ4hntOinz8n+ZT70t0tlnf8TMXELK?=
 =?us-ascii?Q?2se/Vavu+8YtVz8FTaAy1p8CyvGuC+b6FvEwl1f+w+TLteufFeAzVrfNVsB7?=
 =?us-ascii?Q?+zAPOT0WpJ5kAR5ocsrLYhwaqD5zDsHaPoFZfF9C2qgJwmnVIdOpyYc6XHmt?=
 =?us-ascii?Q?zavINH1unD5ykSKSuy41skczysK/ddFBVPtG7fNbc7aJmeP1uSr5O1mxvNK0?=
 =?us-ascii?Q?JgbnDJqyOfrMWAbAaFB2YT2ao5y5FnosbWkFJYld7A1Z8+QEnCNp55f8jjrJ?=
 =?us-ascii?Q?+QvDJxTLHDruJ/9jm0rn/T4mVLRKeLka5KacgWhf4kOxan9H/XXhhulyrYrK?=
 =?us-ascii?Q?BzFiFEJuCT3v7wCwJ9fJkkBRLnkYTgO7wW+ZyGSK4UaFHDD6CJTBROFGuWXa?=
 =?us-ascii?Q?PrOUIT+LP4dTqWl8hD6ib2ZLaDkCa+PkMxILU2XyR3G7xU6tbpQdpp7MPFYx?=
 =?us-ascii?Q?nB5aXPeLLNsQ46y4F/xPwVzyykYOMNaICrcLgqGBp/c50HSLtB0z4V+DsdUU?=
 =?us-ascii?Q?nSFfiVLMeYyE16rHvrj8DOYgFP/3ukG+DZdwXFC4UTmbjK+C1/B2tkzJWzB5?=
 =?us-ascii?Q?r/DMd7qm8rE49aB8cQeNaCN1z3ZRw2gwUsnPpDqs7L6EbA54SqR4oT+LwQ+M?=
 =?us-ascii?Q?jpCRNJF1DwYLUHp9xpbv6S7IJv9V++xJ/Dz2pb6ElgH/IGXqOv9iDu67/HF2?=
 =?us-ascii?Q?GtJol8561DXYsbMk1MlDh3MmHNPgtgyhtPUL7BFFqjyKW3NOZDLIlZV3P2R7?=
 =?us-ascii?Q?efkceVizGOVdJluFyrBApgD1JbGuUiTHYl+QGoyBCddqJCYMtu+tvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:07.1977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0891c8d-3c7f-4222-7a5d-08dd9f71f08f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

This is the aftermath of this discussion:

  https://lore.kernel.org/xen-devel/DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com/https://lore.kernel.org/xen-devel/DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com/

It's a first round of cleanup and preparation to have a much easier time
later when integrating dom0less boot into hyperlaunch.

The refactor on device-tree/ is _fine_ by I'm open to other suggestions
to achieve the same thing. In particular, after this series x86 can
unflatten the DT host device tree when it has CONFIG_DOM0LESS_BOOT set,
which enables the builder to use factored-out functions from
dom0less-build.c (not done here).

The diffstat is deceptive because I renamed a large file and then
created a new file with the same name. There aren't that many LoC
changes.

I wrote it as a series to keep things focused, but there's a number of
independent chunks.

  * Patches 1 to 7 are strict (hopefully) uncontroversial cleanups.

  * Patches 8 and 9 add minor missing bits to bootmodule needed by x86.

  * Patches 10 and 11 are BIG, but trivial. They are strict renames of
    boot_module to bootmodule, and equally trivial adjustments to the 
    fields (e.g: s/kernel/kernel_bootmodule or s/relocated/arch.relocated/)

  * Patches 12 to 16 try to put some order inside device-tree/. Despite
    their diffstat it's all code motion without functional changes.

  * Patch 17 is the cornerstone of allowing x86 to unflatten DTs,
    otherwise there's the world's entire supply of compile time errors
    due to x86 assuming device_t to be pci_dev.

  * Patches 18 and 19 are inconsequential here, but enables future
    patches in this direction to be gated by a selectable option in
    Kconfig. i.e: it would replace the current CONFIG_DOMAIN_BUILDER in
    the hyperlaunch series. In time, we'll want to rename it to
    CONFIG_MULTIDOMAIN_BUILDER, or CONFIG_PREDOMAINS, or something along
    those lines. For the time being CONFIG_BOOT_DOM0LESS can mean
    CONFIG_BOOT_HYPERLAUNCH on x86 without much of value being lost.

I'd like to re-touch the dom0less help message, as it's written very
confusingly, but I'll leave that for later series.

Alejandro Vallejo (19):
  licence: Add missing SPDX line to bootfdt.h
  x86: Add missing pci_dev forward declaration in asm/pci.h
  riscv: Add missing forward declaration to intc.h
  xen: Add missing forward declaration to  btcpupools_get_domain_pool_id
  arm: Remove dependencies with membank(s) definitions from setup.h
  xen: Clean up asm-generic/device.h
  arm/gnttab: Break cycle between asm/grant_table.h and
    xen/grant_table.h
  xen/dt: Add BOOTMOD_MICROCODE
  x86: Preinitialise all modules to be of kind BOOTMOD_UNKNOWN
  x86: Replace boot_module with bootmodule
  x86: Replace boot_domain with kernel_info
  xen/dt: Move bootfdt functions to xen/bootfdt.h
  xen/dt: Move bootinfo functions to a new bootinfo.h
  xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
  xen/dt: Move bootinfo-independent helpers out of bootinfo-fdt.c
  xen/dt: Extract helper to map nodes to module kinds
  xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
  xen/dt: Allow CONFIG_DOM0LESS_BOOT to include device-tree/
  kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT

 xen/arch/arm/domain_build.c             |   2 +-
 xen/arch/arm/include/asm/grant_table.h  |   1 -
 xen/arch/arm/include/asm/setup.h        |  16 +-
 xen/arch/arm/mmu/mm.c                   |   1 +
 xen/arch/riscv/aplic.c                  |   3 +-
 xen/arch/riscv/include/asm/intc.h       |   2 +
 xen/arch/riscv/mm.c                     |   2 +-
 xen/arch/riscv/setup.c                  |   2 +-
 xen/arch/x86/Kconfig                    |   1 +
 xen/arch/x86/cpu/microcode/core.c       |   9 +-
 xen/arch/x86/dom0_build.c               |   2 +-
 xen/arch/x86/hvm/dom0_build.c           |  16 +-
 xen/arch/x86/include/asm/boot-domain.h  |  33 --
 xen/arch/x86/include/asm/bootfdt.h      |  52 ++
 xen/arch/x86/include/asm/bootinfo.h     |  63 +--
 xen/arch/x86/include/asm/dom0_build.h   |   6 +-
 xen/arch/x86/include/asm/kernel.h       |  20 +
 xen/arch/x86/include/asm/pci.h          |   2 +
 xen/arch/x86/include/asm/setup.h        |  10 +-
 xen/arch/x86/pv/dom0_build.c            |  12 +-
 xen/arch/x86/setup.c                    |  69 +--
 xen/common/Kconfig                      |   9 +-
 xen/common/Makefile                     |   2 +-
 xen/common/device-tree/Makefile         |   9 +-
 xen/common/device-tree/bootfdt.c        | 624 ++----------------------
 xen/common/device-tree/bootinfo-fdt.c   | 554 +++++++++++++++++++++
 xen/common/device-tree/bootinfo.c       |   3 +-
 xen/common/device-tree/device-tree.c    |   2 +
 xen/common/device-tree/dom0less-build.c |   2 +-
 xen/common/device-tree/domain-build.c   |   2 +-
 xen/common/device-tree/kernel.c         |   2 +-
 xen/include/asm-generic/device.h        |  18 +-
 xen/include/xen/bootfdt.h               | 272 +++--------
 xen/include/xen/bootinfo.h              | 212 ++++++++
 xen/include/xen/device_tree.h           |  38 +-
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   4 +-
 xen/include/xen/grant_table.h           |   2 +-
 xen/include/xen/sched.h                 |   8 +-
 xen/xsm/xsm_policy.c                    |   4 +-
 40 files changed, 1071 insertions(+), 1022 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h
 create mode 100644 xen/arch/x86/include/asm/kernel.h
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c
 create mode 100644 xen/include/xen/bootinfo.h

-- 
2.43.0


