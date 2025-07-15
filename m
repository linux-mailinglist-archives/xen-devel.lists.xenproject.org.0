Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E770FB063F9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044525.1414620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFq-00069H-80; Tue, 15 Jul 2025 16:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044525.1414620; Tue, 15 Jul 2025 16:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFq-000674-3a; Tue, 15 Jul 2025 16:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1044525;
 Tue, 15 Jul 2025 16:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiFo-0005t5-4u
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:11:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2416::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c59299-6196-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 18:11:38 +0200 (CEST)
Received: from BYAPR11CA0045.namprd11.prod.outlook.com (2603:10b6:a03:80::22)
 by LV8PR12MB9333.namprd12.prod.outlook.com (2603:10b6:408:1fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Tue, 15 Jul
 2025 16:11:31 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::8) by BYAPR11CA0045.outlook.office365.com
 (2603:10b6:a03:80::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 16:11:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:30 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:27 -0500
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
X-Inumbo-ID: 61c59299-6196-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gT0nK7DcRHg4UCqGFEydIqI9m7nIz8voe37fOjiAaUxkXYI6q7yhUTjCdoCckUsyjH76mBYu/oQRXzTJ8vGIsGqOOdfFM6KZKNEwUGz4E/g0QhTIei/aA55i2ge1t0O13r74U7MbHhLcPHkThQqPlDaBU6CilMRy657O9gY01m6AEGhU+cnHVxhh4Lo7KWI582iAyZeuhafPRfgu0Wf7PvmmaI+vkHgUzlKipzLFCcoVbp0M8B4dYRFnzXbNlh3hh9Ku/aivchCIQzme68fXYnwRQNhLI0Sr4yq3YOde6kRv4raMbXi062q9gFuacsu9qdlPPF1r0OCkETmlyIrAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OVu2Q/4zBHZith7/V98Zu4s7dT1O8e92AX6nR2hq1Y=;
 b=ZFLhvqTuZgUejw1RpY4pEVAp4GqSux2FUbN9gCJdMj31e6PTmqga+jIhGSvy7cJl7B1MKHlSBOwctJ5MI8bL6ysptcMohaoCt9yTe5fSoxfgI6d+JjADEX6RkVaXeWy5JenVawda7k6smlgEGFvf1kyxlkkVo1KwjfgHYqBidINf//lGQAUDGnEs4tX/ASFIpp3bCrcDp+FUiF8TxFmb7ieWLpGCMU4IprgTLwIiAi+d05tTPqOk+1BeQRF82Jg6ORzCXi/ODV9RUuSpY/rDX6Qq1paHdwX196vtcDtXDEh1zmAPhc2HPUb4g7r4oCcBzEg/nndgHHom8llOvZ9V8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OVu2Q/4zBHZith7/V98Zu4s7dT1O8e92AX6nR2hq1Y=;
 b=0FDbRTxYjl2Xj3mThJx9T86ng4+vsb6pWya58gaH76WMHNh5bbwP8KOJhakpBYNvZ3jvU/hXjOvv+dSRwPTT9Nb+RxbvnL+fNpF04XkcWoO6aikJU6o8uF9WydsyLggUz7x5kLvD3FRhFDiM0S9eSgXrw/C0WAkb1Qa0xYCT89I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Alistair Francis
	<alistair.francis@wdc.com>, "Bob Eshleman" <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>, Shawn Anastasio
	<sanastasio@raptorengineering.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v7 00/11] Allow x86 to unflatten DTs
Date: Tue, 15 Jul 2025 18:10:55 +0200
Message-ID: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|LV8PR12MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: ee102db4-e7a3-4bc3-8d97-08ddc3ba42b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ImsB9gEVV5SqrYQ2DkeYwkEPoB3dN3fkZPcK1WohOg5l8kYYlhekwsx5XbXd?=
 =?us-ascii?Q?eRWJXDDNxH14tO+IZj04HqZq1jCCFNbIBFUWiZ4LWM+cw5CbeCTYAs5zlykW?=
 =?us-ascii?Q?jJYHkIQcKCHwTPvI8tBZau6jbky/9d1RG8jwzb2GENbKCiQTffAE870iXO9E?=
 =?us-ascii?Q?WDpjMbsVaLVybTL5/QwpazLHmRwMsmXJAYRur4tSBRoS/5clNl2CHMgfOb/2?=
 =?us-ascii?Q?/m+atc1S/x3OhajaKzmW2JGQ4S2LM/jzLI16U29O5iX9f6IB3xJaW8XbQ0yo?=
 =?us-ascii?Q?SRTb9wyGD4kFQEcSmXtsb0+QuPzxt2qhst1Q09h7XAv2o9+WmY4dHrqbm47q?=
 =?us-ascii?Q?cjaSluwmIEcpyJpY7M9XkoXnzqKzjfyHrdcV8hrtu7S9RXgHK0rdb4qgepUE?=
 =?us-ascii?Q?4/uCYQX0L7MpkpcTBrhI7g/Dr1BLIfsrBRxTRcWQZQpr41p+QT8pRlyJeJ+v?=
 =?us-ascii?Q?Fhzz/eI0zyO5mSKvourf8wb5O7Zmgpw5Rd4rQXY4vf3fEz5IfVjjtoBSyYnf?=
 =?us-ascii?Q?Cq6jKeRAPA+Dh/ZoSJBVgWJaPpzUHldL8B2FENudu7rDDgJj/990tp8qfCtN?=
 =?us-ascii?Q?dhl5+jv8TvPiYdOt9I9Yr7atFmw513JJ6jAOCCkSP4brAQ3vss/KpGbZKFFW?=
 =?us-ascii?Q?j9qvknVQJZimavss6Qe5bpZYAaMKZfzdlj1LUnw0k/faJUSXIfmIyiDm+fnm?=
 =?us-ascii?Q?L9j3tkPqYgDM9FhQZ8FmcgSPebsAFj+HziggzSu6/4tUj05LWwzWkVwTgQ7H?=
 =?us-ascii?Q?I5T41W2dFPeWyHXeMh2HrscCKx2iiHDazGckgWLqS8jPJcWoI1YymNZs8520?=
 =?us-ascii?Q?WxyX6AyfVLRgursS63gDWst7fvZx+NVdxqli7YgXlliYoMOCE8z6/8TjUVbc?=
 =?us-ascii?Q?99rQ9HcipcE8DWKK1UvM8rz0AxfXR7BN3foDBTz3jsf/5DSEms6UYSraoKyU?=
 =?us-ascii?Q?mlYnvFjG73wi9CM1+dE0C2MKUcFzCsgG2IHrtnJOsNVseJ6Z2XI0coR8i2YH?=
 =?us-ascii?Q?38OJvu2JajzyzefYgmMWiHiqKzKdehIvJxDm9vPJHkkTgtCFcG5aH3w95Qgv?=
 =?us-ascii?Q?hmQuPEjyJbIzJDnZCivZhqHwz7W+znvwu/nmgxf7L6nAnI9VqPN7+MzlSfhD?=
 =?us-ascii?Q?zDGU6pHm5nPidK41FPsSuCMuUQK6NPJ7QIggOHZCgmLEmX6bSbyR7cfmTCtN?=
 =?us-ascii?Q?rYreiOZTypTEsi2Vxkmh15iYG+in/DMc5/zzjfkx4R8xDH0W7V4doTWIEYFu?=
 =?us-ascii?Q?TkFWX+Ol/WgD7Xyba479/lPBHAgzID31qeEan2hL5G/fbjXtGRVsbswNTPPm?=
 =?us-ascii?Q?vF+whkNgCFfwsQKKZi3LB7j5kkCHvXT4738T7FH2+fw+S2YSCaVwx0xjG3It?=
 =?us-ascii?Q?WcaHShYUsU0qP0Me2AoIo75WZ4MSFDqBFLAheL7PpZgPKeZiY8DYyk0dOmIf?=
 =?us-ascii?Q?H3e410Xd/aHNGCP6WrkduHfWnJfHwyI7xfe7oo8/7g0qux+fZZOy0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:30.5467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee102db4-e7a3-4bc3-8d97-08ddc3ba42b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9333

Hi,

I've fixed a couple of issues with the 2 refactors.

  1. The proposed fixup by Daniel went ahead and was lost on rebase. v7 includes
     it back.
  2. The pre-requisite rename of bootfdt.c to bootinfo-fdt.c was mis-squashed on
     rebase too. This, too, has been restored to keep a tidier history.

Otherwise, same old.

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/commit/0b28c9551df54aaf662d03e2f2a07e446a9e4c4d

v6: https://lore.kernel.org/xen-devel/20250708180721.2338036-1-alejandro.garciavallejo@amd.com/
v5: https://lore.kernel.org/xen-devel/20250701105706.86133-1-agarciav@amd.com/
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
 xen/include/xen/bootfdt.h               | 316 +++++-------
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
 xen/xsm/xsm_policy.c                    |   6 +-
 51 files changed, 1146 insertions(+), 1100 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c
 create mode 100644 xen/include/xen/bootinfo.h


base-commit: 63919fc4d1cab1771d7b397a2ede8f8769403fe7
-- 
2.43.0


