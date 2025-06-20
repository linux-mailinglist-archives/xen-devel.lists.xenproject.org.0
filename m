Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA8AE2233
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021075.1397116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgUn-0005AD-IG; Fri, 20 Jun 2025 18:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021075.1397116; Fri, 20 Jun 2025 18:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgUn-00057J-F4; Fri, 20 Jun 2025 18:29:49 +0000
Received: by outflank-mailman (input) for mailman id 1021075;
 Fri, 20 Jun 2025 18:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgUl-000575-EI
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:29:47 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 889ce7d7-4e04-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 20:29:44 +0200 (CEST)
Received: from BN9P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::10)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 18:29:38 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::e6) by BN9P220CA0005.outlook.office365.com
 (2603:10b6:408:13e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:29:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:29:37 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:29:23 -0500
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
X-Inumbo-ID: 889ce7d7-4e04-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0vbTfTdG1V4X2kTObTb3NviD60N1QMlGsAMybLkT0eS80GUvQ5jEuv/qREV9vUn1EIqyGQC09oZhsuuqxmxaCcaGMHThgGncbOEcaDWIsUnzp5iTtTq8Ds+rIZJ7VlIFxsUsECD/pwn14ELOBMZCVrIfeYe3cP/gGEFmAeMfio4tl4ybIQhwe9tmQiYL4JGJXzYrcqVp1ITg+IDyC+Lq/5xj79ruFE//pA0oOHVZvjrWkTnWeAAYOVfnAmbjYkziK5m4vQ+TfRZjUFXPubFKsf3H+NN0nAhdHn+q2qjtoJcMkBxDxAiBs9XeYpW1GVAqSJCA4mSRDs1mG8WGCmaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WCPtX5aykBfff8wM+NoZNcSXbB+qXgxtxCOTOC2Unc=;
 b=ExzzLoncj5k1/Vg1iUdfNFo0YE/XaZtdubDdtAwhYfo1B2Mp2gTGcV1QlSjlqe41tSlgtNiRB5RIMYHSADrOScjXk0TpKOeQPplooXgD9oTeFOWCQZL1sf/RUPd1BXjh7nskJl+UagTYf22ompnog2Y7r3y6JdiaFM+d/oLt6hKGX+Fp/0T1DastR3+6oZYa44Li7Dzkf/iFBi+UICurL98Zbd7T5uCaFMtXSggY0NyNf1DwLmulN5JLX3wP4TGMmZ3c+sA658zbWYIZUNJYIFwzZXEjXTKzpXsTQP5luIqPadP8fifBOUAng0BTwHBr7xsnmx/PKtBCBh3ZEcXe8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WCPtX5aykBfff8wM+NoZNcSXbB+qXgxtxCOTOC2Unc=;
 b=ZKbjkOkKewZcn0wFR2FQ6QDm6vn0JUoOEaMyH1FN82GHJY83s6uBMjpD19xLnltihehzXdZf6YwnuxLaaGcqbSDS0zrbFkzc0VfmI/LKyrBSi+QmuBGFAYZ9KGxKpxY4bbnARAUiJFSjy9UoX6q0qEnRMikQoudrofNUpuxSiQQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v4 00/12] Allow x86 to unflatten DTs
Date: Fri, 20 Jun 2025 20:28:46 +0200
Message-ID: <20250620182859.23378-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|PH0PR12MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 6092b0f7-811d-414f-9479-08ddb02869bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yFQiATZUSysdwC+udDoQCA0o7gOyuiTgMhoIcWCKZwADYE92Cygh/b45sCF3?=
 =?us-ascii?Q?4U4136u7Z6ly+b3RqNTufyKAkV0GSuZcpFw70iljUMklXGIlD9yDfYrRUZbi?=
 =?us-ascii?Q?9iunA6M/iU6mYSTce3wF5//TDuglV7IRkLrHU6qulyZcIsClY4AXnEKzt97J?=
 =?us-ascii?Q?bCamCp1Y4Z+RltktCpk0o+EvjBar9DefgiC/uWvJI9f4UKjcs60aDw20ougY?=
 =?us-ascii?Q?UD2tpnGWFbUbfyYDzAN1Ra4Rp54HcNeE/YdKYlgvf8z3s4t7DXLGEkB9FV02?=
 =?us-ascii?Q?5q2GeYjDSLhe/qlF2tFOMNWh84Sc/pBon8WRLAwbd1Y2Xw7e9O7OWYEziqCN?=
 =?us-ascii?Q?TCa/FYWp17dvbSDbeK1u+UPe7k44QzDShb8Mgsgo/T1tQl9ew7xffCi2a1gb?=
 =?us-ascii?Q?BCMQC2gZoeU/gMSMlqLWoKH4GivXDKphGZGlj3uTxcB3HzVTPpO2TOh7uIFi?=
 =?us-ascii?Q?YtODp7n8xGc2TVEihzTz6kx76nETAYN8zm0l1fAyu43kdQQSXEqpvXvliqj7?=
 =?us-ascii?Q?zAHW2dQW20EnNTapinvc3sP/ZN/FAySVxvxFuLqUrZEgHV3GBKLEaPE+mVgF?=
 =?us-ascii?Q?Iun6o9Yp8l8Qqgl596J/SUNzqxg6r6FuoGYRGXPVd3n4+hiZQBJALy17GkRv?=
 =?us-ascii?Q?smT2ptcdwIjwAzDTgKMYDBTEkIoipt2b/JdLukLVKVgiQqKRf9VQ8EXGjNca?=
 =?us-ascii?Q?j0tKd6BD7aD5Z6sGwOgiZxf2riYmWEmDPcEWmHISMSro3Qe6cONKGjJj+27w?=
 =?us-ascii?Q?g3YJYNEH6GWBf79DILBMj6W5sXLO/Llbreg9L6Gm8yeuzPnVd0QJJC1uIHvX?=
 =?us-ascii?Q?mxQ/C18Epk4j5HXff5PPYLmfltvsriFmhu+t0gnllyxUvXOSext7xWLaWomo?=
 =?us-ascii?Q?qU2+ELfhrxZpFr6HCAApExEy6qfLd7NmBCeU/w019vy2NXfNYLCD938A9HSn?=
 =?us-ascii?Q?KCSYc53ongKuSyM2zAqHerVAkl4VJ1R8OmJgEnXr9mObLgPaxjaYEBn1awDZ?=
 =?us-ascii?Q?rKzTYj+GylMgZIfS6Jy7TVPiTVDPbz+YhjP0QqfF37UepbVXmY1CE+RtC7sB?=
 =?us-ascii?Q?INKSH8VmTNF349h1tQyK3rtLGp1ingIUEjM3pxxIZPjLJuYFDARDDnu6T+9i?=
 =?us-ascii?Q?5g3kUBedcQpqoVwLjQ9+mGc+TwH6JXZN+JCWORc6kBoSXzOeCdbHd9EfhPta?=
 =?us-ascii?Q?QgzoR5aU6C8UsPpKcrG/LlWOWKrXFarT6EvIRDxEX01F4wROEpgz/Eii+zsQ?=
 =?us-ascii?Q?dFP7ui8xd7fvTIcwMRmspeDPidpweeO2MzJXVkLPsNKxCjVQZOCUFR765+qT?=
 =?us-ascii?Q?7rrKnK0JJiqgNA97mR5AX0A2KTvBSVTNIBc/M4yeukCsTFua0L5ih5IDwDPg?=
 =?us-ascii?Q?YT2ILM1bcHGmV8MU7L/4sl91pc3zV8XJRVTkFPXvDeVgcSMArAwsfb2dTcMM?=
 =?us-ascii?Q?v0Iv0cIuFL267UHVqGgDg/TBFb88gT4B2X/2KLslYGVl3ItAQQAr7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:29:37.5133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6092b0f7-811d-414f-9479-08ddb02869bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646

pipeline:  https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1880819044

Hi,

There are minor adjustments throughout based on feedback, and I've also dropped
the patch that allowed x86 to just pick DOM0LESS_BOOT right now until the rest
of the changes to boot a single-dom0 DTB go in. Biggest changes are regarding
some confusion with Kconfig.

The idea is to segregate DT processing in two. A basic one, and a full-fledged
one. The former would be currently used exclusively by x86, based on the fact
that it does not need to discover devices in the DT, while the later would
remain largely the same for every other Xen port, because they need all of it
anyway for their own boot procedures.

v3 used CONFIG_HAS_DEVICE_TREE as such a discriminator of a full-fledged DT
parsing logic. The idea behind v4 is:

  * HAS_DEVICE_TREE is renamed to HAS_DEVICE_TREE_DISCOVERY, to clearly show
    the new interpretation that this Kconfig option exists for platforms that
    discover devices via DTs.
  * DOM0LESS_BOOT stops requiring HAS_DEVICE_TREE, so x86 can pick it
  * DOM0LESS_BOOT starts allowing compiling a subset of common/device-tree/

Looked at in a different light:

  Full DT support: HAS_DEVICE_TREE_DISCOVERY
  Basic DT support: DOM0LESS_BOOT || HAS_DEVICE_TREE_DISCOVERY
  No DT support: !DOM0LESS_BOOT && !HAS_DEVICE_TREE_DISCOVERY

And in table form FTAOD:

          | HAS_DEVICE_TREE_DISCOVERY | DOM0LESS_BOOT |   Description    |
    ------+---------------------------+---------------+------------------+
          |                           |       y       | Basic DT support |
      x86 +            n              +---------------+------------------+
          |                           |       n       |    No DT support |
    ------+---------------------------+---------------+------------------+
      arm |                           |               |                  |
    ------+                           |               |                  |
    riscv |            y              |      y/n      | Full DT support  |
    ------+                           |               |                  |
      ppc |                           |               |                  |
    ------+---------------------------+---------------+------------------+

Note that HAS_DOM0LESS stays around to hide DOM0LESS_BOOT from ports that
don't support dom0less yet (all but arm, atm).

Previous versions
=================

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

Alejandro Vallejo (12):
  CODING_STYLE: Custom type names must be snake-cased by word.
  xen: Rename bootmodule{,s} to boot_module{,s}
  x86: Replace arch-specific boot_module with common one
  xen: Refactor kernel_info to have a header like boot_domain
  x86: Replace arch-specific boot_domain with the common one
  xen/dt: Move bootfdt functions to xen/bootfdt.h
  xen/dt: Move bootinfo functions to a new bootinfo.h
  xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
  xen/dt: Extract helper to map nodes to module kinds
  xen: Rename CONFIG_HAS_DEVICE_TREE to CONFIG_HAS_DEVICE_TREE_DISCOVERY
  xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
  xen/dt: Remove DOM0LESS_BOOT's requirement on
    HAS_DEVICE_TREE_DISCOVERY

 CODING_STYLE                            |   6 +
 xen/Kconfig.debug                       |   2 +-
 xen/arch/arm/Kconfig                    |   2 +-
 xen/arch/arm/dom0less-build.c           |   8 +-
 xen/arch/arm/domain_build.c             |  21 +-
 xen/arch/arm/efi/efi-boot.h             |   6 +-
 xen/arch/arm/include/asm/setup.h        |   2 +-
 xen/arch/arm/kernel.c                   |  10 +-
 xen/arch/arm/llc-coloring.c             |   8 +-
 xen/arch/arm/mmu/setup.c                |  10 +-
 xen/arch/arm/setup.c                    |  11 +-
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
 xen/common/Kconfig                      |   7 +-
 xen/common/Makefile                     |   5 +-
 xen/common/device-tree/Makefile         |   7 +-
 xen/common/device-tree/bootfdt.c        | 654 ++----------------------
 xen/common/device-tree/bootinfo-fdt.c   | 583 +++++++++++++++++++++
 xen/common/device-tree/bootinfo.c       |  54 +-
 xen/common/device-tree/device-tree.c    |   3 +
 xen/common/device-tree/dom0less-build.c |  45 +-
 xen/common/device-tree/domain-build.c   |  22 +-
 xen/common/device-tree/kernel.c         |  30 +-
 xen/common/device-tree/static-evtchn.c  |   1 +
 xen/common/device.c                     |   4 +-
 xen/common/efi/boot.c                   |   2 +-
 xen/common/sched/Kconfig                |   2 +-
 xen/common/sched/boot-cpupool.c         |   1 +
 xen/drivers/char/ns16550.c              |   6 +-
 xen/drivers/passthrough/Makefile        |   2 +-
 xen/drivers/passthrough/iommu.c         |   2 +-
 xen/include/asm-generic/device.h        |  10 +-
 xen/include/xen/bootfdt.h               | 306 ++++-------
 xen/include/xen/bootinfo.h              | 213 ++++++++
 xen/include/xen/device_tree.h           |  70 +--
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |  12 +-
 xen/include/xen/iommu.h                 |   8 +-
 xen/include/xsm/dummy.h                 |   4 +-
 xen/include/xsm/xsm.h                   |  12 +-
 xen/xsm/dummy.c                         |   2 +-
 xen/xsm/flask/hooks.c                   |   6 +-
 xen/xsm/xsm_core.c                      |   4 +-
 xen/xsm/xsm_policy.c                    |   8 +-
 55 files changed, 1228 insertions(+), 1177 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c
 create mode 100644 xen/include/xen/bootinfo.h


base-commit: 12d72d032e169082308efb9d44b9964ef9fa4340
-- 
2.43.0


