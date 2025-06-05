Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994F2ACF851
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007451.1386720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGa7-0002ha-Lu; Thu, 05 Jun 2025 19:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007451.1386720; Thu, 05 Jun 2025 19:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGa7-0002fg-IU; Thu, 05 Jun 2025 19:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1007451;
 Thu, 05 Jun 2025 19:48:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGa5-0002fZ-PB
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:48:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:200a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18a66b3d-4246-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 21:48:49 +0200 (CEST)
Received: from LV3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::15)
 by SA1PR12MB8641.namprd12.prod.outlook.com (2603:10b6:806:388::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 19:48:42 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:234:cafe::37) by LV3P220CA0002.outlook.office365.com
 (2603:10b6:408:234::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Thu,
 5 Jun 2025 19:48:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:42 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:39 -0500
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
X-Inumbo-ID: 18a66b3d-4246-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBWjBNgY4M9GRUmR3rsrSvDNMQoP14COihvCzFmFmDF/q9XYoz/5dbPCeuaJS9Y53ziCafV1VbT1oeu5mkAitQdmQcinF/4SR/2dKExmIhuBUOahJgWIy6X9TC9WXONAsInBqCXlgsofJJ76HPMmu4dydRA/++V7YBPJ7qAo7V6wZ3sJDd50xbnsYYNy4n73jvUxmU+3fmq3c4zr7ee+SdlcmFAgsYqRQ6o/GyS+BPY6NoAHCPg2Q1fM/edMyYuFAjBiS/B/m1E0lZqBFsuFkosIBTIPbhrMBaCzoVKQhAd0/TXnLOPfIT9rdsXOq4UN5rx72BFibwRyqV0Qu4qW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaUjHWWOa3B7T9r66+7ntRsIWcKccRUyDVFbl5PIyiM=;
 b=oxVlIrjeHleMsAQ+vPbNL8rLySuCa+OxtxsIy6F1Pavsth8SzuGY+aCbw7YNB9wPYgW1TbAll4QOah18BQM9NXERW6S4M7E+sgAVwj3gShRgw9+rASqwPvaVSVMqYbN+PDtUoOU4Mu8WqtLJuU8SyPbncr2fFPU+FpToO5cEkYgwxAocN1njxSl0VA49bViVWN1C0HimhWJQM4FZ5wZA1WU+uzt9i7/ds6z1BCTbsH3shgauXnnVsEFwb+oucErE+4fnGbQsTW8LC3JYO/N12L8v53dbDLcJjU5lq0rLGllRb7mnLbvqKx5YT/VLOufs9l5CgnQGfbPlHvf9vG7wCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaUjHWWOa3B7T9r66+7ntRsIWcKccRUyDVFbl5PIyiM=;
 b=eTATmw3zdLU77N7ELl+3HxHTXvGO7+9fvldQVyUGMmIwkI4gSalYwOXZCRkzti2BR6pVQpvurN56nYYEvjPrJb8Y9EfjaAApr++1FlNFbuZuDKRS7DO5s9UaGhCdStaHYHYhuVyZEsuhjYSvr8Se9ut7bellBkJ0qZatKf1ve4Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 00/15] Allow x86 to unflatten DTs
Date: Thu, 5 Jun 2025 21:47:52 +0200
Message-ID: <20250605194810.2782031-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SA1PR12MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: a05de07d-d94f-4ef8-d4bd-08dda469f99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/7p1Wv+Xks2w0w6Oe5vOG5myXoGz65G6ZtYpKI1fgYTwvZRY+PHTPhAfd7Qc?=
 =?us-ascii?Q?wdRg7BsDPz5w+TSksao8/EabJOohYVsqEXN5oSjfy/7hX9hEHkONm82ZpFf+?=
 =?us-ascii?Q?eZi3QqkHXtITPDmQRqDewhsDL70Vrr+Gj8JhYGu7bOkr7LaZjYF9BEst4R5p?=
 =?us-ascii?Q?dAt2XZSoLJS+gi+2j6hBdG44ucDv3L0VjxzMNeIXrBusWyJnlsKoWHdut/FB?=
 =?us-ascii?Q?/paNMorVk84cQE9QGfhWuho8Zp1tdPq1muLc/KO7Ygg79ZqNbXkHVpercHqn?=
 =?us-ascii?Q?wiCI5eU7hKzDIY3d+W/uxWbqEFtmOK6c15QuyR7xVfXQfWh8NrFzE3otua/l?=
 =?us-ascii?Q?NjTbupWrjlTkvtoPrzBF92o85ksIw/KmSwLz6Ta/LByQXlfoLGlSJ3QQ/Axj?=
 =?us-ascii?Q?jVPg7J53dXOf1QLuVYrCriFbhJ0a1q5O1vB9IG1S7p9jKhm4Thf990RicR1A?=
 =?us-ascii?Q?yf66GT/22llktO9B7gKQ8gmM+JN5q9kCZvNm812VV70U1Cd39eioRBRwuYgN?=
 =?us-ascii?Q?wokNIM8rMxXcz5HAQ4Il/tUXMhVvmC5MnO0Pf1/3C7OhEajNcIGNa2PSP68R?=
 =?us-ascii?Q?x/WHgmaWOY+qHfZdILtwR26iKU0RAi9gHio+73vUQjavGTV4NbXsRU7LEos9?=
 =?us-ascii?Q?duBjVI/5/2FkCgyopo9Wzf4JYpso9GYeeI1xHGSFEGNWhfO4RRxZJ8BO65qr?=
 =?us-ascii?Q?WSE87scS7zE7dvDrXGmgD9DHU5l9cwgwhHblQoNLp03y7/90I1ItEDTq6Y37?=
 =?us-ascii?Q?sZPtsp1J62hI3xPW+Yz20QmRnn4FBc5sJGOJZ1e3L2T2uTaqi8CVnHxfvrfY?=
 =?us-ascii?Q?ZFJCPfPSETJz/m605nZukejypiI3wIm9TIBWl5flKIc+UMzcH0VrXdStYoEr?=
 =?us-ascii?Q?OjbsfZoggX29qel1gTFk6P8jyr4EFdkcAbjU4Qf4PAEv0mQfOCIpjatWOEes?=
 =?us-ascii?Q?wh8yprnzs/7ABW/rB6wHcwAM3Ok8FJRBfh3cJ69BvavCX8nvkVtzblIw8tnv?=
 =?us-ascii?Q?/MVc//rYY3UZsFt0gw/gUB2fawyk9GyJSA0vXY2fpkIUGY2bOD6JEv7+wqhz?=
 =?us-ascii?Q?J0SyQx+ciaoEwDxPmmTVqQBlwEK84TrIzups2IVvW6b1DBm9R0kmjcGIXsJ1?=
 =?us-ascii?Q?Jz9hPZwS3WRB2jIXLAP4JCBOT9ik2iq5ms5C8Kk1aSxxElvA9iz2wKGka+9x?=
 =?us-ascii?Q?hk5ZcZE3kBe/sXtpPh4FQu9GtA8hX48QLMtZ353dvxjax1VQ/XxH9VNoObzI?=
 =?us-ascii?Q?jo843yGpgFK7OnA4lrsQEd4wUOsLzseQTpeceXqf9VHd5jL1xRIW8kpB8Hcf?=
 =?us-ascii?Q?PSxeoVDZWycobptIgj6bXfURRM5owu//SkHAzGlivXP21OCNfmEz10Y9UUfu?=
 =?us-ascii?Q?yBSNGdSTjma9ZJ0RQk63rnXePzAdQdTgjSgSKYbNGHY7PWnwOFGKFAJjbH+U?=
 =?us-ascii?Q?DNdImNT23VfA7EtFX2Q54UpKKYQOMHnSO4+2t02HPDF3vB8SUD38ZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:42.2334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a05de07d-d94f-4ef8-d4bd-08dda469f99c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8641

v2 pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1855777776

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

Alejandro Vallejo (15):
  xen: Clean up asm-generic/device.h
  arm/gnttab: Break links between asm/grant_table.h and
    xen/grant_table.h
  xen/dt: Add BOOTMOD_MICROCODE
  x86: Preinitialise all modules to be of kind BOOTMOD_UNKNOWN
  x86: Replace boot_module with bootmodule
  xen: Refactor kernel_info to have a header like boot_domain
  x86: Replace boot_domain with bootdomain
  xen/dt: Move bootfdt functions to xen/bootfdt.h
  xen/dt: Move bootinfo functions to a new bootinfo.h
  xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
  xen/dt: Move bootinfo-independent helpers out of bootinfo-fdt.c
  xen/dt: Extract helper to map nodes to module kinds
  xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
  xen/dt: Allow CONFIG_DOM0LESS_BOOT to include device-tree/
  kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT

 xen/arch/arm/dom0less-build.c           |   8 +-
 xen/arch/arm/domain_build.c             |  21 +-
 xen/arch/arm/include/asm/grant_table.h  |   1 -
 xen/arch/arm/include/asm/setup.h        |   6 -
 xen/arch/arm/kernel.c                   |   8 +-
 xen/arch/arm/mmu/mm.c                   |   1 +
 xen/arch/arm/setup.c                    |   1 +
 xen/arch/riscv/aplic.c                  |   3 +-
 xen/arch/riscv/mm.c                     |   2 +-
 xen/arch/riscv/setup.c                  |   2 +-
 xen/arch/x86/Kconfig                    |   1 +
 xen/arch/x86/cpu/microcode/core.c       |   9 +-
 xen/arch/x86/dom0_build.c               |   2 +-
 xen/arch/x86/hvm/dom0_build.c           |  14 +-
 xen/arch/x86/include/asm/boot-domain.h  |  33 --
 xen/arch/x86/include/asm/bootfdt.h      |  57 ++
 xen/arch/x86/include/asm/bootinfo.h     |  61 +--
 xen/arch/x86/include/asm/dom0_build.h   |   6 +-
 xen/arch/x86/include/asm/setup.h        |  10 +-
 xen/arch/x86/pv/dom0_build.c            |  12 +-
 xen/arch/x86/setup.c                    |  72 +--
 xen/common/Kconfig                      |  13 +-
 xen/common/Makefile                     |   2 +-
 xen/common/device-tree/Makefile         |   9 +-
 xen/common/device-tree/bootfdt.c        | 666 ++----------------------
 xen/common/device-tree/bootinfo-fdt.c   | 583 +++++++++++++++++++++
 xen/common/device-tree/bootinfo.c       |   3 +-
 xen/common/device-tree/device-tree.c    |   2 +
 xen/common/device-tree/dom0less-build.c |  21 +-
 xen/common/device-tree/domain-build.c   |  22 +-
 xen/common/device-tree/kernel.c         |  22 +-
 xen/common/grant_table.c                |   2 +
 xen/include/asm-generic/device.h        |  26 +-
 xen/include/xen/bootfdt.h               | 273 +++-------
 xen/include/xen/bootinfo.h              | 213 ++++++++
 xen/include/xen/device_tree.h           |  38 +-
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   7 +-
 xen/include/xen/grant_table.h           |   4 -
 xen/xsm/xsm_policy.c                    |   4 +-
 40 files changed, 1146 insertions(+), 1096 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/bootfdt.h
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c
 create mode 100644 xen/include/xen/bootinfo.h

-- 
2.43.0


