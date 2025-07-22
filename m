Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F338B0CE8C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051772.1420190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W2-0005OO-TC; Tue, 22 Jul 2025 00:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051772.1420190; Tue, 22 Jul 2025 00:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0W2-0005Mv-QT; Tue, 22 Jul 2025 00:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1051772;
 Tue, 22 Jul 2025 00:05:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0W0-0005Mp-O3
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:05:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f3d0b12-668f-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 02:05:49 +0200 (CEST)
Received: from BN8PR15CA0066.namprd15.prod.outlook.com (2603:10b6:408:80::43)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:05:42 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:80:cafe::89) by BN8PR15CA0066.outlook.office365.com
 (2603:10b6:408:80::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:05:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:41 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:38 -0500
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
X-Inumbo-ID: 9f3d0b12-668f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjGabOKy28EK3t/ZAQJr6+AMGl3vQGML2wWMVHH+nNG8JKkPs+LVTC3jzFWTGcmDy5blMTmdUwekIbtNob87P5SAavTj9ZXVdx5tCDTTTLai6ESDBTmIFHCcg1NyolsSDZmfvTdqN/NS2tDaHvDw4gtKcGTLP69g34+JBsEMVcV8svvcmAFToI1jdRVIcwEzsBSrpt8a6DW2VBA1keDwiHxw5bPxGgRZqpYajGUvdypaOHpJvM01Qo+uk9Nv9+L2ELj1RD1p85i3ZkhHdHgtzzwC8kaZdywQAOAE2eFBQ2Y2J+r/XcU0/LbeSnty63e+dG8mYvlne82Ek0HTjNaptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXBZucrG4DDZTs/P81sP3BymUIm+cs5iCwEaDOjjr1A=;
 b=ndYzCfku+IJFgDeajJlyUMLjxQVz4ayu4SZAW0fN9Y6wxqBIaQc1tYfncy63+KlwgKSQ2DXAAlsVYyOJjXlXhgJrXkRu93NxL0z/B3K7MxWwNZBLGpsmwWR1YSz02ozwRRvVAL6V5GzbSKkGUfYpqqF/k+AaiRr/BjFOPMiSIv//bFZU9H7W1TQ7S7pQSaJ+grVNsUEE3VGE/9+psG99vCGr/D/knB2NcstUOd6Qf82y8M9VyCjlrziawseJbbL29ePo4vK6+GqAsbmH1BF2pK2sduxL67SuzwrlUu8Tjva+mgHyWXibVV9WgMD1GJmlo8zbgOOqfpUogEInCuKMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXBZucrG4DDZTs/P81sP3BymUIm+cs5iCwEaDOjjr1A=;
 b=Nawu1fDckVHwPomgFj8QI0reBOzkNHIfhLdcfb1x8YJ8DkpNvEtepxtKBH2u6BQ81CNTdIBu6/qRu2Dm0XaPeWikNX3O2JTiUursMcL/gu74DVmams59R+nVfyYMUXmfLaWR7eCSWlCGImFN8KQsv+DxN8ekzMRvg8FcQPTQIng=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v8 00/11] Allow x86 to unflatten DTs
Date: Tue, 22 Jul 2025 02:05:12 +0200
Message-ID: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|MW3PR12MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2fd979-1bed-4cd2-23e3-08ddc8b37f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yB64ULyN4uEaeAet3lHtcP68/XfnUyxg2YClw4GCA/IVmqT1PJYsoWZQ459a?=
 =?us-ascii?Q?gUO4rTetljbR558zone27MuJ0ctwdx5k8GnEk6BNI919ALQWqELlmdBQusf7?=
 =?us-ascii?Q?vGl70dCFNtsH1FmTh0HBrGTcr8WEMrNM4CoQG8tSKTtnxvvEFvCK9aB1o5He?=
 =?us-ascii?Q?SLqF2gTJbt95FLv8Ezby231fOUjh1/gvf+4aRvQUbhqnhSmoEI4cEHOyZ5eP?=
 =?us-ascii?Q?8a/qJu0dIWIBAGPKmKEo1RqY0ba2vGHfAdGK9vM+aio31PF3r9fo4MlA7yA1?=
 =?us-ascii?Q?U9qbR3vedA4FAxUM/uTWEpkyfb5Ecid+JHa7jpKD23XNYdmKsFuyaDMml9+j?=
 =?us-ascii?Q?DApJ1n783LkHg1DB7tD5AZjOoDrIeVGU3gMmo0KASpmBBooP3JqsgN4M2GNk?=
 =?us-ascii?Q?eAeu15I/S1KBF4VzFVRLN4qEiPC5OpiEFBu7MQ8Nn729tuRPwk/mcdVLkgp+?=
 =?us-ascii?Q?MGfXdckFq9IPVBNbebPDleaDGD3YAk5LkHN5a4bfOGX5NlJanfbURqM/9X+A?=
 =?us-ascii?Q?q52pa2Gxg+KFfFuv/E3RVckYJS7Y5gryStGm9Uw9bHOGCuhLmzDPHwDuC3m+?=
 =?us-ascii?Q?w3qSgo/v6UojkOfvdz3xf+t/mwXVaealCdJGiFcBoTx0fhN5HJv7Nd156vMb?=
 =?us-ascii?Q?eispYiE0udffqJCubP36dMVpfCoXowNuNJ1QLS11UUyQl/lJg3Vmn6dSuBom?=
 =?us-ascii?Q?oWdltEBwO4T0bOsYHTGa32cVyYfJyrL6FXoli5j56ti1K+VghzdsRf1lBNnL?=
 =?us-ascii?Q?1wzGDrddnn8EeTYlg+10sxxpK20ggvev/23ejK9DDPsKof0U/fWKBHojJBH5?=
 =?us-ascii?Q?7Y9aLdP+3JPeGNYkeeziAL0XMWpNL9KTu1Yb+DzCxp+a8sOdHCCVm7+f77kC?=
 =?us-ascii?Q?zkEwxw17RpJ+Dobbl0/kysfbLM2+YZGJSDlXd6oeXB6Voy5YGKhDrGvhhYt7?=
 =?us-ascii?Q?qgH/rT/9GDP/XuuVhnKE9bfEdw52yUmgIdizgbtOEKuX4hQ4umfpKIMQPh8E?=
 =?us-ascii?Q?HJc/jN8N4SbSLY0E2vZwgCazyYjCKhkqNFU8drcmLUlcKCXYwFcMsCM8jXzF?=
 =?us-ascii?Q?NxVJyXR6DbIE/AZUhfMXfRp44XtRsLZGfi2JZ8IA6KFI1UO4f37U6SIWMrEy?=
 =?us-ascii?Q?RvpzEmrFsO14Ab0tiTXkIoF5PGQoMratHyHdoRg/FyzYMfSCzgU8jF3gBrut?=
 =?us-ascii?Q?hWYgf7ZFgvQN49reQkAwUdS5YzktBjBuzwXFzSMaJCxEDgTWefJtrjctyF3d?=
 =?us-ascii?Q?tBzQNz5//Pt0cu2iRrWD2Y3hNsXo9o+lSA25AdFK2/r8QZAuVpLID9+WUmoL?=
 =?us-ascii?Q?hJRGrxd09h7yoD1F6IewyVzUWUlvtWBG3yc+F6yqaMasDhZD1xbLNvS1Kfqk?=
 =?us-ascii?Q?M9m4ShccOX9vbqb340V4dS1rBmaE+vZzc4ZIh6tQza8iDPJa6f355KqBdiWt?=
 =?us-ascii?Q?+hWFYAOTkCyuHVRzvfrKVTHuB7R5Uq3bgPwu98AkOvX5yAhOz9XZ9LAyUTSt?=
 =?us-ascii?Q?nkD0qmmpJJ1Q/vgoRdwaDHEhD4ybtyV+Fl3PVDgs9qxQ/iC9qb5EU6tPsQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:41.8672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2fd979-1bed-4cd2-23e3-08ddc8b37f6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457

Hi,

Really minor changes wrt v7

  1. s/BOOTMOD_XSM/BOOTMOD_XSM_POLICY/
  2. Remove stale obj-y statements in the last patch

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1940366600

v7: https://lore.kernel.org/xen-devel/20250715161108.141126-1-alejandro.garciavallejo@amd.com>
v6: https://lore.kernel.org/xen-devel/20250708180721.2338036-1-alejandro.garciavallejo@amd.com/
v5: https://lore.kernel.org/xen-devel/20250701105706.86133-1-agarciav@amd.com/
v4: https://lore.kernel.org/xen-devel/20250620182859.23378-1-agarciav@amd.com/
v3: https://lore.kernel.org/xen-devel/20250613151612.754222-1-agarciav@amd.com/
v3: https://lore.kernel.org/xen-devel/20250613151612.754222-1-agarciav@amd.com/
v2: https://lore.kernel.org/xen-devel/20250605194810.2782031-1-agarciav@amd.com/
v1: https://lore.kernel.org/xen-devel/20250530120242.39398-1-agarciav@amd.com/


Alejandro Vallejo (11):
  x86: Replace arch-specific boot_module with common one
  xen: Refactor kernel_info to have a header like boot_domain
  x86: Replace arch-specific boot_domain with the common one
  xen/dt: Move bootfdt functions to xen/bootfdt.h
  xen/dt: Move bootinfo functions to a new bootinfo.h
  xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
  xen/dt: Extract bootinfo-independent functions to bootfdt.c
  xen/dt: Extract helper to map nodes to module kinds
  xen: Split HAS_DEVICE_TREE in two
  xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
  xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to include device-tree/

 xen/Kconfig.debug                       |   2 +-
 xen/arch/arm/Kconfig                    |   2 +-
 xen/arch/arm/dom0less-build.c           |   8 +-
 xen/arch/arm/domain_build.c             |  21 +-
 xen/arch/arm/include/asm/setup.h        |   2 +-
 xen/arch/arm/kernel.c                   |   8 +-
 xen/arch/arm/setup.c                    |   1 +
 xen/arch/ppc/Kconfig                    |   2 +-
 xen/arch/riscv/Kconfig                  |   2 +-
 xen/arch/riscv/cpufeature.c             |   1 +
 xen/arch/riscv/mm.c                     |   2 +-
 xen/arch/riscv/setup.c                  |   2 +-
 xen/arch/riscv/smpboot.c                |   1 +
 xen/arch/x86/cpu/microcode/core.c       |   7 +-
 xen/arch/x86/hvm/dom0_build.c           |   8 +-
 xen/arch/x86/include/asm/boot-domain.h  |  33 --
 xen/arch/x86/include/asm/bootfdt.h      |  50 ++
 xen/arch/x86/include/asm/bootinfo.h     |  57 +--
 xen/arch/x86/pv/dom0_build.c            |   6 +-
 xen/arch/x86/setup.c                    |  45 +-
 xen/common/Kconfig                      |  15 +-
 xen/common/Makefile                     |   4 +-
 xen/common/device-tree/Makefile         |   5 +-
 xen/common/device-tree/bootfdt.c        | 617 +-----------------------
 xen/common/device-tree/bootinfo-fdt.c   | 584 ++++++++++++++++++++++
 xen/common/device-tree/bootinfo.c       |   4 +-
 xen/common/device-tree/device-tree.c    |   3 +
 xen/common/device-tree/dom0less-build.c |  20 +-
 xen/common/device-tree/domain-build.c   |  22 +-
 xen/common/device-tree/kernel.c         |  22 +-
 xen/common/device-tree/static-evtchn.c  |   1 +
 xen/common/device.c                     |   4 +-
 xen/common/efi/boot.c                   |   2 +-
 xen/common/sched/Kconfig                |   2 +-
 xen/common/sched/boot-cpupool.c         |   1 +
 xen/drivers/char/ns16550.c              |   6 +-
 xen/drivers/passthrough/Makefile        |   2 +-
 xen/drivers/passthrough/iommu.c         |   2 +-
 xen/include/asm-generic/device.h        |  10 +-
 xen/include/xen/bootfdt.h               | 318 +++++-------
 xen/include/xen/bootinfo.h              | 213 ++++++++
 xen/include/xen/device_tree.h           |  82 +---
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   7 +-
 xen/include/xen/iommu.h                 |   8 +-
 xen/include/xsm/dummy.h                 |   4 +-
 xen/include/xsm/xsm.h                   |  12 +-
 xen/xsm/dummy.c                         |   2 +-
 xen/xsm/flask/hooks.c                   |   6 +-
 xen/xsm/xsm_core.c                      |   4 +-
 xen/xsm/xsm_policy.c                    |   8 +-
 51 files changed, 1148 insertions(+), 1104 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c
 create mode 100644 xen/include/xen/bootinfo.h


base-commit: 31bf9f72a9d89221f173c94e379891380333b018
-- 
2.43.0


