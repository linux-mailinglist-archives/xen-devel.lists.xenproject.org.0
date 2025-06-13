Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C4AD90F2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014452.1392541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ68z-0000NF-SX; Fri, 13 Jun 2025 15:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014452.1392541; Fri, 13 Jun 2025 15:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ68z-0000Km-NJ; Fri, 13 Jun 2025 15:16:37 +0000
Received: by outflank-mailman (input) for mailman id 1014452;
 Fri, 13 Jun 2025 15:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ68y-0000Kb-8J
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:16:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2418::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63fa5fde-4869-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:16:34 +0200 (CEST)
Received: from DS7PR03CA0111.namprd03.prod.outlook.com (2603:10b6:5:3b7::26)
 by PH8PR12MB7207.namprd12.prod.outlook.com (2603:10b6:510:225::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Fri, 13 Jun
 2025 15:16:30 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::f9) by DS7PR03CA0111.outlook.office365.com
 (2603:10b6:5:3b7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 15:16:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:29 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:25 -0500
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
X-Inumbo-ID: 63fa5fde-4869-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZdnn4bhRWDNMX0veTAmEZ5l1LcxegyhULNPpM9iVtnuMJZ3Pua2T+0Q+yB3seGu/07GCF0jV0SJ40/774KIICcYjcicP0lIiYe3zaHWycps67dQFIpRJqiwpwH6tdTGS22+cd8Fh2tu2Q6+8/xUbkMewjmz3P0HFUXS6S2bzAR3Y8Dz50GwY6AXsI/zQRyIJ6Z/Psmig/Kynl8bCsbQgt0L8ZveCKda80aOwe5JGScbyOWbJocWtcwsdaWtokT1LTK2hqCN1+UukJekkL1wju1jgSBKlcxvj3ARXDDrOePn/FZTfqBrheMNodZBeAZorFey2W9/z1MfE5VutTThpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/8591m6gZeWmotQSP3G4jc9QpcD9wa9uKHTk1MKAeE=;
 b=KylRfBAFSklOYh7Pg4S9RVcWZT7NAtH+9qAvmi8M2CQwxJMeTnrt2YXACrndz2wnweF7zf2cAliMFcicj4ZznbnTz2dykm7jpZ04iEUQou2pPZE6yIsn2+v+BULMy4yXHVWPSaEcuNdiqF6Cdph+gPDKYeAOHx5HKHehSy0qw0p0OVUcJfmemyYjmxFTfj3fAov7kMEhbumOh0U3X+UPf/2HunGl0gFikdArYog1ALfQw6wqnLAAbMGdHvTSHws/VNxrRn/UPGltw9KqqphkWUHcSQeGHu2UoFT4qg5EnV0mLjH9nkqCJpK30si28EVu/l4jnCbYO4blVV+asZbqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/8591m6gZeWmotQSP3G4jc9QpcD9wa9uKHTk1MKAeE=;
 b=v+wlxwJcIhMHNDQTWI+bOiT9YkwDZAohIrxWK6YyBN6YtDZDfZxlClHlKt6uhduxf9uBaeWA5FvyzWapSSVKCh6ZOJrd8t47HsALtBB/j0TiWTjVbiGeqHE87E4ks3ChBCf73K0un/p8oEK96qbeSDiLUndbd3+GmiFHzuPU93Y=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, "Connor Davis"
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3 00/15] Allow x86 to unflatten DTs
Date: Fri, 13 Jun 2025 17:13:09 +0200
Message-ID: <20250613151612.754222-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|PH8PR12MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ccd0ce-eef2-4384-5bf0-08ddaa8d45e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TiSrziEbtFuH1/nN9jUroWzaGdbSiixjRJZBLFU5r/GybdYiCha1NNk8n/ou?=
 =?us-ascii?Q?ZKJK6GTWK1dvayQzgBXwzZl53upT/QBl0B68mhbkFtgXu3gx+fkPEs+lmUzs?=
 =?us-ascii?Q?jipUwkXOO3GQJYruKdH811J4a8T+RwghjCOTTS4/arC9wOuzgN8lGQpZVRqK?=
 =?us-ascii?Q?qJZ74+4T8+Zcs0sV/4eAghaWZtg64DtHcdh637MY9w2dcj/0/Efv5ggfFMmD?=
 =?us-ascii?Q?Euxi6k1mVGJ6cmAeq2JBFshC4THNTNX/A15LFmizq/2zh1ipW98mWI1y4GFS?=
 =?us-ascii?Q?Me2VzSzJoFGhE9hYP2B20zUIxJUpfm/cdLH/EFLfFXfCedU4Er7L/55htrR5?=
 =?us-ascii?Q?hj+GT6BCtXYAIZSBm8e9AhkD/pP9fVYmFryO4eFNrJqGw6rTvqJasnSsiQpI?=
 =?us-ascii?Q?bYZSaY0Vr3z5/9Y/js5Kaj8T6GunuRs4s5i1VK/fS/IyjYqKXA6RQpZppycw?=
 =?us-ascii?Q?Bx16yQejDguj8oKbgwLdoxRJ/P4Yzcy0RJB+K4v1FO2U0eT1j8gHehm/oDtE?=
 =?us-ascii?Q?pZU64joRY9HiOF7t5ImreGyUYHQlG0sf0IWpqnaN6mFnqzG1WfVRXwzkyZtb?=
 =?us-ascii?Q?cZ9nnGzoCGspbhlF5/iU5K1z7ZhEt6A88cLjreH4LGLNinLSj47XWvnwolYl?=
 =?us-ascii?Q?kFMuSqZ/puNnx37KbUurgoH8dvDOD4mcLMaPzELd5raZ6zrDrYk/xg5blTSu?=
 =?us-ascii?Q?1MA5ssS0cSsrF/fDc8mMu11MBiD5jbpMvOxO0Z4ZMmLJ5OQ2BLtm3PFGBpoA?=
 =?us-ascii?Q?plWkezDzQ48q67mMXCOhDZcLntdzcCi8lB/9ZtHy0FQodNcGY38YflmG8lkX?=
 =?us-ascii?Q?Br/HoIn/ZlSHIHQwZXxblas/aBQ9gf659PphZy8GJX/rGuRq77A8he2AwsfF?=
 =?us-ascii?Q?xyQG57lw4N0lz8eYG2lPywLZEIB900/sCqxwQzgVfJI8/HThwNOkzZmKpKW8?=
 =?us-ascii?Q?r6718wj3zcu8mZTjyS+U1wsCqar7kQ0e75Aaey6847LiQVfUdNhltG+OL42d?=
 =?us-ascii?Q?pRYhuuCJCybU9lgw7Fh/4P0+TO8+d/hNCuladMUjxwv+vcWmJsYUEaQiIsNf?=
 =?us-ascii?Q?h9u2ZM0U9u+7Uu9obcI3eTEfdZa0+FzVpiHBhDsSsrxhuGQ8LVe+9bzHtL2T?=
 =?us-ascii?Q?9cEU6XxOBsKc1Uyvv49OB70fzKrnOXQlE0ojZSGp2kU7uQivOMjef+RbfAEg?=
 =?us-ascii?Q?eob4T97ZFj3MqDZ4w08p7dqQSyEpa53UvPC3/+uIjn0ZbQeJpz1V2NrKFTwR?=
 =?us-ascii?Q?UNgGZqan+z7czIdDR86wLdkNjRIu89B/c8c6Rr2CG29KvxzuEg7hJDY4vqVq?=
 =?us-ascii?Q?gIa466CFuk+17pER/Va76w2psJkokYFG8YRLFbGv0/JeNgIDWFNJ4cPt0d8r?=
 =?us-ascii?Q?b5UZ2Ln+pepNV1PtcMlNq9SwJnYG0tnXGb87KBwVFsjZX3uJ8wufP0lNEMzu?=
 =?us-ascii?Q?gY3lflBvi/A9ewilRVcjxj0tTN4/ynZzwxGKuS8xBo4qwDk7VsWYhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:29.5718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ccd0ce-eef2-4384-5bf0-08ddaa8d45e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7207

Hi,

New summary when compared to v2:

  * Patches 1 and 2 are just cleanup
  * Patch 3 is a modification of the CODING_STYLE to reflect the unwritten rule
    of splitting type names in words.
  * Patch 4 is a rename of struct bootmodule{,s} to boot_module{,s}, in accordance
    to the modification of patch 3. 
  * Patch 5-7 replaces x86-specific boot_{domain,module} defs in favour of
    common ones.
  * The rest are code motion and enablement of x86 to unflatten DTs and use
    some dom0less helpers.

v3 pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1868636712

v2: https://lore.kernel.org/xen-devel/20250605194810.2782031-1-agarciav@amd.com/
v1: https://lore.kernel.org/xen-devel/20250530120242.39398-1-agarciav@amd.com/

Original cover letter:

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

Alejandro Vallejo (14):
  arm/gnttab: Remove xen/grant_table.h cyclic include
  x86: Preinitialise all modules to be of kind BOOTMOD_UNKNOWN
  CODING_STYLE: Custom type names must be snake-cased by word.
  xen: Rename bootmodule{,s} to boot_module{,s}
  x86: Replace arch-specific boot_module with common one
  xen: Refactor kernel_info to have a header like boot_domain
  x86: Replace arch-specific boot_domain common one bootdomain
  xen/dt: Move bootfdt functions to xen/bootfdt.h
  xen/dt: Move bootinfo functions to a new bootinfo.h
  xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
  xen/dt: Extract helper to map nodes to module kinds
  xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
  xen/dt: Allow CONFIG_DOM0LESS_BOOT to include device-tree/
  kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT

 CODING_STYLE                            |   3 +
 xen/arch/arm/dom0less-build.c           |   8 +-
 xen/arch/arm/domain_build.c             |  21 +-
 xen/arch/arm/efi/efi-boot.h             |   6 +-
 xen/arch/arm/include/asm/grant_table.h  |   1 -
 xen/arch/arm/kernel.c                   |  10 +-
 xen/arch/arm/llc-coloring.c             |   8 +-
 xen/arch/arm/mmu/setup.c                |  10 +-
 xen/arch/arm/setup.c                    |  11 +-
 xen/arch/riscv/mm.c                     |   2 +-
 xen/arch/riscv/setup.c                  |   2 +-
 xen/arch/x86/Kconfig                    |   1 +
 xen/arch/x86/cpu/microcode/core.c       |   7 +-
 xen/arch/x86/hvm/dom0_build.c           |   8 +-
 xen/arch/x86/include/asm/boot-domain.h  |  33 --
 xen/arch/x86/include/asm/bootfdt.h      |  56 ++
 xen/arch/x86/include/asm/bootinfo.h     |  57 +--
 xen/arch/x86/pv/dom0_build.c            |   6 +-
 xen/arch/x86/setup.c                    |  58 ++-
 xen/common/Kconfig                      |  13 +-
 xen/common/Makefile                     |   2 +-
 xen/common/device-tree/Makefile         |   9 +-
 xen/common/device-tree/bootfdt.c        | 654 ++----------------------
 xen/common/device-tree/bootinfo-fdt.c   | 583 +++++++++++++++++++++
 xen/common/device-tree/bootinfo.c       |  54 +-
 xen/common/device-tree/device-tree.c    |   2 +
 xen/common/device-tree/dom0less-build.c |  45 +-
 xen/common/device-tree/domain-build.c   |  22 +-
 xen/common/device-tree/kernel.c         |  30 +-
 xen/include/xen/bootfdt.h               | 277 +++-------
 xen/include/xen/bootinfo.h              | 213 ++++++++
 xen/include/xen/device_tree.h           |  44 +-
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |  12 +-
 xen/xsm/xsm_policy.c                    |   4 +-
 35 files changed, 1162 insertions(+), 1112 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c
 create mode 100644 xen/include/xen/bootinfo.h

-- 
2.43.0


