Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB3A81187
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942756.1341846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVc-0002hV-4A; Tue, 08 Apr 2025 16:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942756.1341846; Tue, 08 Apr 2025 16:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVc-0002eJ-1S; Tue, 08 Apr 2025 16:09:08 +0000
Received: by outflank-mailman (input) for mailman id 942756;
 Tue, 08 Apr 2025 16:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVb-0002e3-3u
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:07 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2406::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8b9de03-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:02 +0200 (CEST)
Received: from BL1P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::13)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 16:08:58 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::aa) by BL1P222CA0008.outlook.office365.com
 (2603:10b6:208:2c7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Tue,
 8 Apr 2025 16:08:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:08:57 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:08:55 -0500
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
X-Inumbo-ID: c8b9de03-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9XZcq/Q79Ubr7O0b5oZZx7UpWMJZsSyNV6l0QlnO8/2xfWcO/VOZ1aDEeLDXTMHltxunXyxVguXbR3O4tLjGMiEPG4JB1L501v4byIhtZaC7S5oigHu7n1j1cMGkQe0ih/ONomlCqVUKM44cEJFhVEgWaMU1VkP+N3i8asJO+x92JhWUNouziF0YiskcPUDv1xPUtsKLFrtAqndIAyukY9DQOivWTowZPc6DIf4kHXBFuwMcPhvoueeB/BDcDHBCTM3enxBS0rAvVZ8ZhTZVWErMxUrTBA00u98KyFaqK6CQjlWdwTzW0cZAttAaqzbz0THWFiFPkSzpzfmvLeeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+WxjyPErQNqLpzjNrTAdlgV9RYX8wNYR7R3wZaMkSM=;
 b=sBprAgtLJLIkDhsyev57BuLKYb6uKtDSk7gSeUuc7P+bTKV6nPZ47DpTIeEuBg+KZ2cPb0lFBzs9jUGILCcbqv6k5zG6mx0JUrja4thSRnSAYbIgO8bE/N/J1Zsyzov+VDXYtnkE6q81jqS8tqI53d9L1f1+oQMIX2dYmGc3GHBo67aWvjMd2a8IDifCRsfyRIk5Rr8Vz6KnOhwUQZESj+LRKPF3n4myyM5oOX+0PfJhhjRHC2ID06GOsoSnLCTQlClZfw4mx+iBvoYG+3PjASFec+GW2T+yGufINbXFBxJiqUo6NjcsE/QUrCwL7UWpHVUYr2WuSfWlungzntTpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+WxjyPErQNqLpzjNrTAdlgV9RYX8wNYR7R3wZaMkSM=;
 b=tEqfXrotlwNDLq3a/VVHfVstp42cn4dQn8skN0MM5YgVYq1ZAvA7vcEqEs33vLiqeKP0yRkyyIKIeybrxNzo8SKV2NaQXKn1PTwY8YxMduJUwxw403TkhM9zzFlpf5vH4c3VORvAewEHiyiTMo8S9gnOGjq2BqeuxItruwxGTyk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Julien
 Grall <julien@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v3 00/16] Hyperlaunch device tree for dom0
Date: Tue, 8 Apr 2025 17:07:22 +0100
Message-ID: <20250408160802.49870-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: efab43ed-b28b-46bf-2e73-08dd76b7ab1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e0944mDO4mHg6aV6YTncnwTZGGTCD439F3tlTHY/VSsij8U1ftqj/Rzd2yk/?=
 =?us-ascii?Q?8J4Fgf/E5uLArpl/RVukIKWLJGBlNETm7bFu2OUpP10xqFC1ze61V5cAmv/K?=
 =?us-ascii?Q?kCNn6JRk4W84wYmxQmsrgR7r9jvugoPcrFtmXv2ubGPkVmw/PZdaT6Fy+atM?=
 =?us-ascii?Q?gLhNZcwmGjb5Q0hgNgSh5g+YVJDoa+2Z9CFdkyb++UZPRqrF1sVvwjs9Dt18?=
 =?us-ascii?Q?domIbb0QmQXAfy5uFSsr6QXBqvhF5qRyeDOMgsJnKTxg62i7ei/ixWjfbD0D?=
 =?us-ascii?Q?jV6x2a5Wl03qzH/a8xEa3SGLTMCZXDg0LGj1yjPB2X9rMB+gbQLr/fOKz8nm?=
 =?us-ascii?Q?QwhOozuz/K82HLzWiqfOedyChKWZFaJ3Jad/BbWGm2TootmL4NQjvKWwqnAo?=
 =?us-ascii?Q?uG5cQ7+CHwiL6SA4DPBlRsv2bQtSVFt8KT9zOqB9o1hVbO2WSd/g1VVgabtC?=
 =?us-ascii?Q?d6qBFV6xdQukU8WNvF4r48+A4Xdz57RNvhN44JgRQK+PllutTb8uKAIxguet?=
 =?us-ascii?Q?zrvW0xefGXyl6SH7OOEQmZCcEzvSEIGNfiXMLH5X2lsjnCm3BqvNK8Ch5Att?=
 =?us-ascii?Q?WTgj7McwylA41l20gP+ryUz0wr6fEvg/hDvdBUuYDjO0ZfM1/xFi9OzuqTt3?=
 =?us-ascii?Q?M1ib4R9xIlWEeTiff0t6mlSGm4KJflt/E45EJ4f7ySqEbcZOs+qt0P3VOf3K?=
 =?us-ascii?Q?Ziz3Ffc9DRup055pW5WnjV2dDr0x89uEMFy8TQoju7KOU374QbPUR1gMgmyM?=
 =?us-ascii?Q?/gelNvCakrvUdgGvQPw8Cm0+ZicXswGGKyOeonLYZoO3AIpDsXc96ZhTxpp0?=
 =?us-ascii?Q?hB0wTSGAjA94m2YkKTxRhtzRX+s02hVp2aYpMlC6lAeO99b895EeOyeq2pdm?=
 =?us-ascii?Q?zPEB1V1MYXQ3E4dtoFNo01Dvh6GlLnMk/HQRansdlUGV5CgvPbSxDg03hSEy?=
 =?us-ascii?Q?NvGUhXY9KUREROYnEvwWhEcGtkK3D71+8P5vbglX5nUKfWJunnMojlQGQyyv?=
 =?us-ascii?Q?X8TjSUr+zgXfCD6DONe7YRZPXsapA7aDT8EoNflWe28MmfnY9k55afvS7JoE?=
 =?us-ascii?Q?oR9NFXKxkjDQNEIrSANGpdbJsz0ORR4rbBR9ONeQZXik7moHP6zTFxZk++HN?=
 =?us-ascii?Q?zTE4JmiYFyfy4KxFq7CRzFwFU0oY0kPWKH9GD0IxOFqUHnH+bKfk3l/Owg+/?=
 =?us-ascii?Q?qEOkyCm8kt2pMKRaKLcjKqFxQA6ajHFtsy432OMpq1XwNBiGnbsCDVfXERlf?=
 =?us-ascii?Q?OwPDRoEqeuiBrqDwNpYZ2KvDvtWinF+oYCyzIobHp41eSPrXPpk/pLrTRIsc?=
 =?us-ascii?Q?GArq64ULVaF5XEh+qY6l3OhCbXFDTRkOT661QMoBRYoHCRstbB3kqGOUKfoU?=
 =?us-ascii?Q?S4599fQ8jYMJ/ggwWgo8WYBNygOFcJ9u9OO0ZAjgX6vgKBfEGrHPiGb/vlCN?=
 =?us-ascii?Q?PAJwvLMQkowy2d5yrMFflEmckJ/Jjf+v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:08:57.8140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efab43ed-b28b-46bf-2e73-08dd76b7ab1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824

Hi,

This is an updated version of the hyperlaunch DTB series, with pending
feedback addressed. Some parts (notably the way modules are located) has
changed a little and is more generic with less duplication.

I've purposefully not added my S-by on anything I haven't touched
(besides rebasing) as most of the feedback had already been addressed by
Jason by the time I looked at it and it would be utterly nonsensical to
give myself authorship over it.

I'll be looking after the series moving forward.

v3 pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1758167851

v2: https://lore.kernel.org/xen-devel/20241226165740.29812-1-dpsmith@apertussolutions.com/
v1: https://lore.kernel.org/xen-devel/20241123182044.30687-1-dpsmith@apertussolutions.com/

Cheers,
Alejandro

========= Original cover letter:

The Hyperlaunch device tree for dom0 series is the second split out for the
introduction of the Hyperlaunch domain builder logic. These changes focus on
introducing the ability to express a domain configuration that is then used to
populate the struct boot_domain structure for dom0. This ability to express a
domain configuration provides the next step towards a general domain builder.

The splitting of Hyperlaunch into a set of series are twofold, to reduce the
effort in reviewing a much larger series, and to reduce the effort in handling
the knock-on effects to the construction logic from requested review changes.

=========

Alejandro Vallejo (1):
  x86/hyperlaunch: Add helpers to locate multiboot modules

Daniel P. Smith (15):
  x86/boot: introduce boot domain
  x86/boot: introduce domid field to struct boot_domain
  x86/boot: add cmdline to struct boot_domain
  kconfig: introduce option to independently enable libfdt
  kconfig: introduce domain builder config option
  x86/hyperlaunch: introduce the domain builder
  x86/hyperlaunch: initial support for hyperlaunch device tree
  x86/hyperlaunch: locate dom0 kernel with hyperlaunch
  x86/hyperlaunch: obtain cmdline from device tree
  x86/hyperlaunch: locate dom0 initrd with hyperlaunch
  x86/hyperlaunch: add domain id parsing to domain config
  x86/hyperlaunch: specify dom0 mode with device tree
  x86/hyperlaunch: add memory parsing to domain config
  x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
  x86/hyperlaunch: add capabilities to boot domain

 xen/arch/x86/Kconfig                      |   2 +
 xen/arch/x86/Makefile                     |   1 +
 xen/arch/x86/dom0_build.c                 |  19 +-
 xen/arch/x86/domain-builder/Kconfig       |  15 +
 xen/arch/x86/domain-builder/Makefile      |   2 +
 xen/arch/x86/domain-builder/core.c        | 112 ++++++
 xen/arch/x86/domain-builder/fdt.c         | 448 ++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.h         |  53 +++
 xen/arch/x86/hvm/dom0_build.c             |  35 +-
 xen/arch/x86/include/asm/boot-domain.h    |  48 +++
 xen/arch/x86/include/asm/bootinfo.h       |  15 +-
 xen/arch/x86/include/asm/dom0_build.h     |   6 +-
 xen/arch/x86/include/asm/domain-builder.h |  12 +
 xen/arch/x86/include/asm/setup.h          |   4 +-
 xen/arch/x86/pv/dom0_build.c              |  28 +-
 xen/arch/x86/setup.c                      | 106 +++--
 xen/common/Kconfig                        |   4 +
 xen/common/Makefile                       |   2 +-
 xen/include/xen/libfdt/libfdt-xen.h       | 101 +++++
 19 files changed, 927 insertions(+), 86 deletions(-)
 create mode 100644 xen/arch/x86/domain-builder/Kconfig
 create mode 100644 xen/arch/x86/domain-builder/Makefile
 create mode 100644 xen/arch/x86/domain-builder/core.c
 create mode 100644 xen/arch/x86/domain-builder/fdt.c
 create mode 100644 xen/arch/x86/domain-builder/fdt.h
 create mode 100644 xen/arch/x86/include/asm/boot-domain.h
 create mode 100644 xen/arch/x86/include/asm/domain-builder.h

-- 
2.43.0


