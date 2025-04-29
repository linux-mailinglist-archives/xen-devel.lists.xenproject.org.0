Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12731AA0BC7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972347.1360714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kCm-0007dH-Qk; Tue, 29 Apr 2025 12:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972347.1360714; Tue, 29 Apr 2025 12:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kCm-0007aJ-N9; Tue, 29 Apr 2025 12:36:56 +0000
Received: by outflank-mailman (input) for mailman id 972347;
 Tue, 29 Apr 2025 12:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kCk-0007KK-Nw
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:36:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2413::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0866cb7-24f6-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:36:53 +0200 (CEST)
Received: from MN2PR14CA0029.namprd14.prod.outlook.com (2603:10b6:208:23e::34)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 12:36:48 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::d3) by MN2PR14CA0029.outlook.office365.com
 (2603:10b6:208:23e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 12:36:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:36:47 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:36:43 -0500
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
X-Inumbo-ID: a0866cb7-24f6-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uf5sFunsl2bpCTwOmsbV33pGp3SYgSY+mcvr8ZCdnhdsw+WKslTFlyjWkvfvFQEj6iIXlj6fzSkIxZRYBoe+R+E4FhPnVYp+zknHOV48M4z3YTBOETLF0Zi+c6c8f6L33i6Vf33a4N78ooUIpVbevuRNXpHhDlMmxJULVQ9pG598DfzEoE8V/4JjfODcbA3YJNC1c2A102acCDRsX46K0mUc87vwB+/4E2uiy30qUFKnDhNmD+vNIOeEk4eH46yrIfSVBvWjmlbf8MEUl4E14yoLjGJaMTsJcSngk49Dlp3kEwGgRGEepJilXNhbSv6hfnBv5SuNKiyD6Z8H/XlBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2ERm30HNqsLuUEeF2BN4t8qTw3Ir0KzuIydX11Ts2I=;
 b=KCafysQebyn0kOjl0zNCnLyYx6AYMgAkTmULXtEXpBWVek0CKn35lTT2tOihXSUfR5/L62TZlDok8pOWlYeqswfNA2qrMEUKNdiyxlMnhp5fY2WgGzNaG+2gMBX4jREX/+7lxcSrjUoGmyo+XwHwIbYELF19KAHLx4BP+AqNR53nbYtmk6eTvzF5updOHHKB2jKdaSLopOHsl1VOYkzgfs8kyTohHclSZcTM7l+zZHF5C6qPh68c88hgFM8ffUFoKhtadZzUL7ZIuUq25EZC53KkCHNeJkznNLkk3ufyICshBDJ0uyNayRYv1jVzM9N3qZ6U1lLVCqo41z9mmLftnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2ERm30HNqsLuUEeF2BN4t8qTw3Ir0KzuIydX11Ts2I=;
 b=DsaQIVcHQeZXnNwi8LKcRxsv2utiC33J1fflEIryrXTzctOEo054qsWlSQApvj74hl6/+t45nKQTlX8/iU42hvMULvDHCbHph408lgO1JlItQsxY9bCGG+x9efsf5x9v+oCkiCC8vkailiAibhEppocKZBGFP8Ye31bi95zRkIA=
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
	"Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH v6 00/12] Hyperlaunch device tree for dom0
Date: Tue, 29 Apr 2025 13:36:11 +0100
Message-ID: <20250429123629.20839-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ce9c05-2b8a-451f-e12d-08dd871a820e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1hlODJgSqWHhQ9D+C40MrnMq0Wgdi1tC6xV/lAYx62XmsMtNFjjHbZyUsNsM?=
 =?us-ascii?Q?2hVp0EJ0/d5CRZjakxqxOCpf60+08wQoLqxJlZnqsktSkmgEGuCBiUIZT3mC?=
 =?us-ascii?Q?q9M+ewKnbXYMjqKMUJFq2tfWA8zfroRkp7euvpUWfguKwr3Q24iEC2HSuuPu?=
 =?us-ascii?Q?kMu4ZBuXhWXnHNJyy7QxRgarDDvuZb8IuYlhQs6QDwkcl7e74iKhg2ZL1f+T?=
 =?us-ascii?Q?BtrM++T7CaP7MzSrJNO1byVrK9dsMTJnQhkxUGWykJcP8U/GTBZURKB6BF3K?=
 =?us-ascii?Q?vzJUGhOdjfUI3EX+ZxgNSSYOZXslrKbvbSzKouHqaLh/SqgISKzgzqO0SWyj?=
 =?us-ascii?Q?o1hZLisrfYo0rI/CgomZSYQHUTg0uqLWz4f/cuQyKpeeF6uUiP+yQJqHAt7G?=
 =?us-ascii?Q?E/JDqQi8fESSrjSSsKKSIqTwSw9nnNwMvN2c3kET3UCXrCuMbs4HjBAfruL+?=
 =?us-ascii?Q?N4Yh/9pf4f1Q5PIiMgzNJPKJ04cXsTo6AjS8CUxR0KBzVqcQU2FjYy7ujcos?=
 =?us-ascii?Q?G1UMtV0d57SBbfrj4D79rYAtIomzAItOTPClEfNwX/gY4MK7KoFj+fdM5hFw?=
 =?us-ascii?Q?oJzK9HPv6G+MbSm3m3DUTw6kBa4xqZgPZhUvB5Zg1KQfrbn+d+c4X1ewoxiO?=
 =?us-ascii?Q?ea5iPfnJaqit/Z1nV86ErHtZVIrkxFwth6lAP/ioLwGxyiOQJKv1yLkx8chB?=
 =?us-ascii?Q?/mPkNorRPAcyMdcGv5Yb5FK1wlwMuWt/u7yGVOOJ4tATiW1zzYHbsUra/zCm?=
 =?us-ascii?Q?CuzjGqGTtTH6JlDj3MKg5yCSBry21wnCY4J57cr2JMUDgid+RFVhZEgJeWEp?=
 =?us-ascii?Q?QC2/mRJ1eSa829kavDHPeuZwNHz7Zl1tXeN474+SfcTyu9psNLbCvEz1sP9m?=
 =?us-ascii?Q?+8dtOdy1vZ2lefIFM+5EsjGt05+MqFJL4ccOPAVLTkuJrS73TwFwViWregbI?=
 =?us-ascii?Q?qOpuf5Xdv4+iukNzcPEQd6sZWN3tBKQ8TWy64/pABEVTR6IdGFzj4T3qwUxp?=
 =?us-ascii?Q?BGCxz4srzBVHFFz2dKi9jDJLx3uOenVNgxNG2W78GiALgP1Ab3mk7GSpAIgW?=
 =?us-ascii?Q?Oyq6kW9gL423Xz8hTgUN/ijKjXBBV1ef/k7tdP2FgZiFcSNxpUQu+Wz02xHu?=
 =?us-ascii?Q?aVlHYm7ITZUDSkC1pGEocYXPJ01yzKEemQkOEMpJzzXjNoDDveQqIyNf0908?=
 =?us-ascii?Q?yGxF8vqzqjLdP57S2G1k20MKiveC8T4YhNpHuqlAnLk3bZcVsbuh/jY20t5e?=
 =?us-ascii?Q?bW9TdITq5fna22JGaiGrtG8+NEae97BRTZyzOMUHJGBcteszQh4nuEfWfxf/?=
 =?us-ascii?Q?i/4OX+E5DL0XfBjgSGDTVCvpS7e2pdkuF5lQ7ZbosKXSTYe5r8eO+jsl7QWi?=
 =?us-ascii?Q?QS+oZ7YY+I1zqwzxNJtPV8ZONhG8y+6mTxXrobIM7DsTxyBlj87atdhQpndm?=
 =?us-ascii?Q?b5AwA3GzYZOh+vVuI9RuC1PNUSLVgS0XngzbWoEK2fOTDtuLE2zgszliFeOJ?=
 =?us-ascii?Q?0UINQWbea8GCklGtZeM9VY1peP2BTFBgPb0vqKkAEAvCeAHviKFVsCdI8Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:36:47.6950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ce9c05-2b8a-451f-e12d-08dd871a820e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462

Hi,

Not very many changes here. Just:

v5->v6:
  * Denis' suggestion to rename a few helpers to fdt_*
  * Change to last patch to only pass CDF_iommu to domains with
    DOMAIN_CAPS_HARDWARE.

I _think_ this addresses all feedback I got so far and I don't expect
anything major remaining before commit. If there's something I was asked
and I haven't delivered yet, please bring it up again.

v5: https://lore.kernel.org/xen-devel/20250424161027.92942-1-agarciav@amd.com/
v4: https://lore.kernel.org/xen-devel/20250417124844.11143-1-agarciav@amd.com/
v3: https://lore.kernel.org/xen-devel/20250408160802.49870-1-agarciav@amd.com/
v2: https://lore.kernel.org/xen-devel/20241226165740.29812-1-dpsmith@apertussolutions.com/
v1: https://lore.kernel.org/xen-devel/20241123182044.30687-1-dpsmith@apertussolutions.com/

========= Original cover letter:

The Hyperlaunch device tree for dom0 series is the second split out for the
introduction of the Hyperlaunch domain builder logic. These changes focus on
introducing the ability to express a domain configuration that is then used to
populate the struct boot_domain structure for dom0. This ability to express a
domain configuration provides the next step towards a general domain builder.

The splitting of Hyperlaunch into a set of series are twofold, to reduce the
effort in reviewing a much larger series, and to reduce the effort in handling
the knock-on effects to the construction logic from requested review changes.

Alejandro Vallejo (1):
  x86/hyperlaunch: Add helpers to locate multiboot modules

Daniel P. Smith (11):
  kconfig: introduce CONFIG_DOMAIN_BUILDER
  common/hyperlaunch: introduce the domain builder
  x86/hyperlaunch: initial support for hyperlaunch device tree
  x86/hyperlaunch: locate dom0 kernel with hyperlaunch
  x86/hyperlaunch: obtain cmdline from device tree
  x86/hyperlaunch: locate dom0 initrd with hyperlaunch
  x86/hyperlaunch: add domain id parsing to domain config
  x86/hyperlaunch: specify dom0 mode with device tree
  x86/hyperlaunch: add memory parsing to domain config
  x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
  x86/hyperlaunch: add capabilities to boot domain

 xen/arch/x86/dom0_build.c              |  11 +
 xen/arch/x86/include/asm/boot-domain.h |  14 +
 xen/arch/x86/include/asm/bootinfo.h    |  10 +-
 xen/arch/x86/setup.c                   |  66 +++-
 xen/common/Kconfig                     |   2 +
 xen/common/Makefile                    |   1 +
 xen/common/domain-builder/Kconfig      |  15 +
 xen/common/domain-builder/Makefile     |   2 +
 xen/common/domain-builder/core.c       |  86 +++++
 xen/common/domain-builder/fdt.c        | 512 +++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h        |  40 ++
 xen/include/xen/domain-builder.h       |  37 ++
 xen/include/xen/libfdt/libfdt-xen.h    |  23 ++
 13 files changed, 801 insertions(+), 18 deletions(-)
 create mode 100644 xen/common/domain-builder/Kconfig
 create mode 100644 xen/common/domain-builder/Makefile
 create mode 100644 xen/common/domain-builder/core.c
 create mode 100644 xen/common/domain-builder/fdt.c
 create mode 100644 xen/common/domain-builder/fdt.h
 create mode 100644 xen/include/xen/domain-builder.h

-- 
2.43.0


