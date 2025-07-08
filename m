Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC764AFD617
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037023.1409678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjM-0005XK-SF; Tue, 08 Jul 2025 18:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037023.1409678; Tue, 08 Jul 2025 18:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjM-0005V8-NU; Tue, 08 Jul 2025 18:07:48 +0000
Received: by outflank-mailman (input) for mailman id 1037023;
 Tue, 08 Jul 2025 18:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjL-0005Uq-GL
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:07:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71d368ba-5c26-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:07:45 +0200 (CEST)
Received: from BYAPR06CA0025.namprd06.prod.outlook.com (2603:10b6:a03:d4::38)
 by IA0PPF0C93AC97B.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bc7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 8 Jul
 2025 18:07:40 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::d0) by BYAPR06CA0025.outlook.office365.com
 (2603:10b6:a03:d4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:07:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:07:39 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:07:35 -0500
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
X-Inumbo-ID: 71d368ba-5c26-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIEOFhW5ksCQu2Z91HgVw4BgQkvLZEEE+i+TV0+uCWJ+e91VH9tpLzIF4GmWdLwfcCA1AzfwoaKZKy8LUI0ZbR24/kK5Ol56umL3jJYwVqRvhI3nqvlTtxwFZ04Chne5N9bFNJ0l87bL99roV8SaAVFAOsW1w0ET2sa2f7JwUvN1Wjl1vFREifnjJ3UOP6nkBouDEHN+N23b/vJN8fhwGbVLmTpqfjHALOHj8YddRxEXtivT1M/ntcRVgFWtZeg9iZKIMHMNsZjdZXKJQnQiL4eCl9nw6zq58KJFTgma4sCyQE4dkuq0tI+6c9XOX+R8tBOPx2vyzkUAZJUQUVTtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pamBLP3spklWXkZajtyF5xzWa/OvEkdk/6nw/NnX/Uc=;
 b=Xw70rD42vWfB5SfWrD/SYmw6UULD+3FhbigC24UW9vN1tMcqTRTKxix1ZnIe7QdJkHYa7K/mfTNM2GW4eeuE+Gc93WRb60Lh4JKq5XBaH/A8OTHYQNz4xsH/u0Rgk7WfX7EV+UXCeATti0LquL5hPU1Ade0n/ijmxk1ovep3HKYna+zywO/jtSVQ1DwKGBF77KYwGGDeGpZYdsTJ4vfiDlgpOmC74arogC9HJ8/uOvsZ80Egy8qneHkhhmHdvYbkCZTTnKqww+Nf/XCDpOUsxiq5g0/LIY2tXrQYsr0xr/gHHAVFWBiLQfzFuvgJRUFuWmQ+aMuP9LhrVE1g93bvlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pamBLP3spklWXkZajtyF5xzWa/OvEkdk/6nw/NnX/Uc=;
 b=e0TGnoGRluBi5iKa1HESOfbM9YKe5BObvZgSr5n6MbFxlrSE6gWkNm/juqtH6CAlxOvcC+Yygx3XKsjtvhjGcRjHUP1413ImyYoDpeXTQJ25b8wqa2ClCkAoK79M01+KUShZ0bBBtHhNJD86cOvbJxXb+8MM7gvjG1HCUWLM2YY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Shawn
 Anastasio" <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v6 00/11] Allow x86 to unflatten DTs
Date: Tue, 8 Jul 2025 20:07:09 +0200
Message-ID: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|IA0PPF0C93AC97B:EE_
X-MS-Office365-Filtering-Correlation-Id: 29738e02-91c8-4b04-cbaa-08ddbe4a53c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X2yhweQHrYcAFpH0NxCsoTqRBu/7DMnIM/zut8zASUSnzwpY7RX+QfqZoXFw?=
 =?us-ascii?Q?/rycn91EUiZSOCpiiJlwTPUjTYJYA8GEWWQxNez8PhsoyM61x7nf6tl9vWUH?=
 =?us-ascii?Q?3JI3x2Yg1luCMYBLkSRlh1CX7CjNcxPDvtfqitnInmzosKv+Fn+jwGhTLXfy?=
 =?us-ascii?Q?Rk6JkbPZWYPj4uEE3xSa3VlqHc4HqptizskcQuUkKadgC4Um54YKd/Ycu4DY?=
 =?us-ascii?Q?mPM1fur2L1VXEznlABm0WMlOdq1uvH4HWcKuZaz8QhKAleniBHpSW+IY5I/3?=
 =?us-ascii?Q?zShzOYHGmYeQP+gLWk6/Dj87ynot0WQN6dc1LHiK5CNLwsIBHziMnuyeB3zM?=
 =?us-ascii?Q?EIQyqeuqzh0J04ddXZORCKaBAIL0TuzINC20z1fIgGdw5TbNKbdy2sSIIYhx?=
 =?us-ascii?Q?/F97vrPCbHn6RvJM4squTss3w+FqywLnmFM7meTAnNviWaVopo9V0MPIc2sw?=
 =?us-ascii?Q?sb51ulLeGzuMlsomzSrxk+l+7QHpz1cz9jZbRBVl0fJjdoN387n6hrhykNnK?=
 =?us-ascii?Q?c/bM8DmfSlvifWtHJxJlR1HsCRBbSF2YiVoTDs82w/NDtfkNIJO3dqHzfGC+?=
 =?us-ascii?Q?qv+7IedXEWqCot90boxS0DzAV6V1nKcqge+SsMXaqyZ3WnZeZ1/2wlCQp7/e?=
 =?us-ascii?Q?m8uEaiLswZ2mY0XNaN91FBYvptWtr8uBA9avzTKBuvTyHfh4H8OKnQlETmCg?=
 =?us-ascii?Q?tikToMxzj+V0psHSQ/MXIV02e2Y/lvAHJEz1rQuDkM2eQ9/47q10p4THuQwt?=
 =?us-ascii?Q?NJw5MVDdT0qjWhRdogc5zFiUehyfa4V3bJ/BkBPboefZW6amVwf1jmkyC5tt?=
 =?us-ascii?Q?99F83Vr/r4CpHjx+7qEGbVq/IvSgfufHYSeMWUAifZ26odmV/plXwtYsh7Jx?=
 =?us-ascii?Q?VA7F8I2BYu5Gk5w3UFjpwV7IgyUXjl5q3hFfp+TcnoD8CVlzFgdDAnXY69oB?=
 =?us-ascii?Q?vHKuAjXVSAHQSSHkubNCCGnyZ2jN/XO00QXAF2+QIKo1aTLgZMDeLWtOTFtV?=
 =?us-ascii?Q?RyntMKchpElH1I9sDXxr5zlCX6y086+4uIl/RKnra4BwvMda/e9ZQwANTDVw?=
 =?us-ascii?Q?mk6HcK/QbKlAF57UDcaiAFeXMTT+ksR/g+zl+jnclu/RuHl3hODgg5C2te82?=
 =?us-ascii?Q?+KioOpprtbb6Vvc7FFsVZXLpehduI142H0hYMBc0HdW0Fa3LujkccPi1UbxP?=
 =?us-ascii?Q?7jfiQ/i1yFRqwvZozLeGJKFXy3+MnJPtpMdSiuSctTyPiF21CTAGmhCNwlZu?=
 =?us-ascii?Q?6xIGmJ8Y1DP9pSrzUKnJWIcmJH7HuOfNnKP1r/pXbyw4XEWQOLFuMkdwPRQt?=
 =?us-ascii?Q?IcvQqOeh02BChVtLkXxWPfd+jVXA7UkSDKlre9g6Lbgpq5kXKSzmGXMoAjhF?=
 =?us-ascii?Q?vcpV0Q0B2p8r5f9eFR3q1Y1S1KKxkbrikTyPZlPRc9BC9iE7cXe2/ZrnePqh?=
 =?us-ascii?Q?1OlQKEndgMObmETSgaGF9m1AycDkOLGlHMgjVXdCd8862IeUWvUioA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:07:39.7856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29738e02-91c8-4b04-cbaa-08ddbe4a53c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0C93AC97B

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1913744377

v5:  https://lore.kernel.org/xen-devel/20250701105706.86133-1-agarciav@amd.com/
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
  xen: Conditionally compile out the boot_module.domU
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
 xen/common/Kconfig                      |  15 +-
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
 xen/include/xen/bootfdt.h               | 314 +++++-------
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
 51 files changed, 1168 insertions(+), 1128 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c
 create mode 100644 xen/include/xen/bootinfo.h


base-commit: 578b34adb1cc149dfeeb2491f84eed43fcd1ee2f
-- 
2.43.0


