Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916CAEF5BC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029517.1403268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYg9-0002Vg-5Z; Tue, 01 Jul 2025 10:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029517.1403268; Tue, 01 Jul 2025 10:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYg9-0002T8-2J; Tue, 01 Jul 2025 10:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1029517;
 Tue, 01 Jul 2025 10:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lih=ZO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWYg7-0002T2-8r
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:57:31 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d3c0924-566a-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 12:57:28 +0200 (CEST)
Received: from BN9PR03CA0300.namprd03.prod.outlook.com (2603:10b6:408:f5::35)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 1 Jul
 2025 10:57:22 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::2c) by BN9PR03CA0300.outlook.office365.com
 (2603:10b6:408:f5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Tue,
 1 Jul 2025 10:57:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 10:57:21 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 05:57:16 -0500
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
X-Inumbo-ID: 2d3c0924-566a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUkdD8XvYenpiv7T5hwBW9TX6wzhYTg0wmX4rqmJHOwRglaYRgszKRkLcANWWx3732DZk/JDGLADL6/AC+jWFDTnkFm7anI/0ohlS0evxE2Nv6Oinmov8E0NhZmkgptSDxiZhqXYRn8bXE00TRT589CKDtzR6ds2CR6ktRNHvhK1ZbK3dYJ+JdXd/j8HaWlnWjYwQCVnZm1iH5QxvNpOrdnsmhyzDKyih0ANMb9moWpwkGA67oBVLNvenYcvyGOAhM7JpTSxVD3kDRgYPGSVXD7A7IR+sMaMNuOiwN8HR49MUAxSMCTLyaxbJEGUoln8A7hQU6tf9xj/Nz3Fdd0ohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKIUkjTbMLCT3kXY31pNRIAUTLtFhGAiy/wjs5ccrhI=;
 b=yo5I8y4ZW5HkBa2CJDpzxk4DDnoXwBxr+VdZeV9pQuFsuVoCCcv2+VdoZstI1d+C4I4lTXcdmc18HkiULktfaTDlQSFV1qtPIFuVfjff+kghPS8Qf0XA5EaEeACfU3qo/UvofmRd+YtiQIFnda6XdIrjgDDt7AXtP2ovCjWACoeqFt/XxpN3fxEQXru5ClxFhJTZJwZZVzyHh3WBBjAdnb8KuXtFkuj/bPaPk1UmuJMm7xe8TnFVpWh4rxFZcINFoed5ri1eYXvN5+gCjHMQcUzuywO3rezOaMef/X34KE3WZWD3t8iqVYdaQj1j4EArExGi1oreV12WH329fLekZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKIUkjTbMLCT3kXY31pNRIAUTLtFhGAiy/wjs5ccrhI=;
 b=NNi0IUH3gUvGDEGa7vhcJJnvqueicJD4dzr/EUP0bWlSjltA29EjX8cDfeCHRSGnamxbg5+eDrHO3XUuZFFCnA2OaNGUG7HqZoCOYw43ILy2cxPKqSbuDnMXzkGOn0okHyWeb1XXTVkNLTehiYHyybFn+hIVF7k0jo4DJMw+5Qg=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, "Shawn Anastasio" <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v5 00/10] Allow x86 to unflatten DTs
Date: Tue, 1 Jul 2025 12:56:54 +0200
Message-ID: <20250701105706.86133-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f19d245-f6a6-47c0-79cf-08ddb88e0e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RGkCekvbTWtyvDcbRUh4j7i4VtvZ+zT+p/V5U4a9FtdTto3bpy8DLkgowxj4?=
 =?us-ascii?Q?LpqZv4KYntGBa41/1cdINyhGh2BZ2F1HdYKGqsR+OUi0QhcdOzI3fLCFoS3L?=
 =?us-ascii?Q?XymLjShOL+i+ZIEpRykY4roVU78Re+V4gks5HMhOObjrp3dRO+S99z6N1x0T?=
 =?us-ascii?Q?fFdjo4ON208kJQmAbN5UiOLi/CBwOHZk6fCj49WMeSzS0aTCxU9vlEshNszP?=
 =?us-ascii?Q?x+QAvoDIhHSyS620OYt4x3OBVKA9aMJnldx7cnfO8A+mH8rjovNnyrJJ13zl?=
 =?us-ascii?Q?objG0oa+fpaVNds6PMYDriB9eblZB9GpI5eSco6fX5OK+tCCcGheInCQZrQZ?=
 =?us-ascii?Q?JCOzxFwKBFuoMvF2WzOBKaKxCBES//7yASoe0AiLsPnO/3IxEtyYNDX/rQjh?=
 =?us-ascii?Q?YSZuwG9MwDA5Bfd4DsEBsYRhVjh9hTtFla/bSFbAf9iJp06eX22MxyWZT3/g?=
 =?us-ascii?Q?u5qyQ5JREa4X38GlWEtAQQAtUd0JfoL9DP3kzb/U3jz1vkhLdg5hS5kAs1S5?=
 =?us-ascii?Q?Qg8Zq+c078uB5mqz7JnNvMNMjPu8hxpTBGcY66fOmoTw67sB5nZ9J4l5JJcV?=
 =?us-ascii?Q?f9uqukXdCa9zaecbnDU/mHfBwjxoPa8djHTsB6S6rZd7QrmFGixle2NRetEz?=
 =?us-ascii?Q?jXUPtK1YHYfneW3KxvrLQkZmuT0sWD097Fm7Wb+E6+uTRyNdcoeOUDSLDzCL?=
 =?us-ascii?Q?MlKdDU/ApihHnre9Bq3DOlvhiQBQ2RCMh3Gl2q5Kt9Hcrhz3Vw+VM+NQOAdN?=
 =?us-ascii?Q?xjzLdhU00KQGKrfin/RN5CLQrWeoBLUjJB6pHY87HHR+8MpntxC108O6Qnno?=
 =?us-ascii?Q?6zyTTGl8TOC4nS5/BIAes2jTCuJZPrG2okdIK1AYAktRzij29+mss30QkW/o?=
 =?us-ascii?Q?spZPAmVRULpIBnJj6dOQpJePDS+vr2gFKoyAywdyhkl3WLnZGBO2mPXxeaeO?=
 =?us-ascii?Q?Vc93Fa+u2Hz1ZRg5ii3lV9nidcSYnpKQ8Y4hdCNuK63ykdbAbd3TIYCcq3mA?=
 =?us-ascii?Q?0QPOHFJX15PQBOxK7814O1HJR2MNMpNvziNR6MwGApSY5kABM171gm8lwzNJ?=
 =?us-ascii?Q?a1uhckO9yGP4gZgibUFGLqjeaI9EAnDgL+0ZhIAz9f2D3CV9ZMdltIozdQSB?=
 =?us-ascii?Q?hRImRmA6mLm+g/pcBqGLhyt089edjTySJXtOFBvKld/QuSJblk1/BFchXY1V?=
 =?us-ascii?Q?wCB57W5pzZvFFpDjPNkFg6czwiZZmg2mWSsfZ6Tr+px/prCSZnaRAL1waEly?=
 =?us-ascii?Q?CLOWnIrkG1b+2NQMJiaF8dcUA+/rTKBms7gH2i9tDfCnRRQ3XSeb9zmySv0U?=
 =?us-ascii?Q?E0Bjh3OAGiOwrj5SOPm7LRTtWQeUSd6zWn5PwHxLwnUFY4QtmofG+hYQPtwX?=
 =?us-ascii?Q?pPW/eNwes/SQM5dIAOqgwfMVrFbOGRRY3eXuQq5Uiv03xxVDlE7eeALRA60G?=
 =?us-ascii?Q?F+NVpxErN9ENNJSA9pJ1MX2/5pOGQNC1TKD64S9Yi8qE6cLcDD4VUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:57:21.7221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f19d245-f6a6-47c0-79cf-08ddb88e0e15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines

Hi,

New revision. It reconfigures Kconfig as discussed in v4. Otherwise it's same
old-same old.

Contrary to the series name, x86 never really gains such an ability, but it's
a trivial patch away.

Previous versions
=================

v4: https://lore.kernel.org/xen-devel/20250620182859.23378-1-agarciav@amd.com/
v3: https://lore.kernel.org/xen-devel/20250613151612.754222-1-agarciav@amd.com/
v3: https://lore.kernel.org/xen-devel/20250613151612.754222-1-agarciav@amd.com/
v2: https://lore.kernel.org/xen-devel/20250605194810.2782031-1-agarciav@amd.com/
v1: https://lore.kernel.org/xen-devel/20250530120242.39398-1-agarciav@amd.com/

Original cover letter
=====================

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

Alejandro Vallejo (10):
  x86: Replace arch-specific boot_module with common one
  xen: Refactor kernel_info to have a header like boot_domain
  x86: Replace arch-specific boot_domain with the common one
  xen/dt: Move bootfdt functions to xen/bootfdt.h
  xen/dt: Move bootinfo functions to a new bootinfo.h
  xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
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
 xen/arch/x86/include/asm/bootfdt.h      |  56 ++
 xen/arch/x86/include/asm/bootinfo.h     |  57 +--
 xen/arch/x86/pv/dom0_build.c            |   6 +-
 xen/arch/x86/setup.c                    |  55 +-
 xen/common/Kconfig                      |  13 +-
 xen/common/Makefile                     |   4 +-
 xen/common/device-tree/Makefile         |   5 +-
 xen/common/device-tree/bootfdt.c        | 654 ++----------------------
 xen/common/device-tree/bootinfo-fdt.c   | 583 +++++++++++++++++++++
 xen/common/device-tree/bootinfo.c       |   2 +-
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
 xen/include/xen/bootfdt.h               | 300 ++++-------
 xen/include/xen/bootinfo.h              | 213 ++++++++
 xen/include/xen/device_tree.h           |  82 +--
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   7 +-
 xen/include/xen/iommu.h                 |   8 +-
 xen/include/xsm/dummy.h                 |   4 +-
 xen/include/xsm/xsm.h                   |  12 +-
 xen/xsm/dummy.c                         |   2 +-
 xen/xsm/flask/hooks.c                   |   6 +-
 xen/xsm/xsm_core.c                      |   4 +-
 xen/xsm/xsm_policy.c                    |   6 +-
 51 files changed, 1159 insertions(+), 1121 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c
 create mode 100644 xen/include/xen/bootinfo.h


base-commit: 64be4fecd7d95058fbbb9057a6170fb4e0e9ad06
-- 
2.43.0


