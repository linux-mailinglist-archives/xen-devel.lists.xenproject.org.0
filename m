Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8462A9B383
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966530.1356706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zA5-0001pa-H0; Thu, 24 Apr 2025 16:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966530.1356706; Thu, 24 Apr 2025 16:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zA5-0001nT-Dc; Thu, 24 Apr 2025 16:10:53 +0000
Received: by outflank-mailman (input) for mailman id 966530;
 Thu, 24 Apr 2025 16:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zA3-0001nH-4z
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:10:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2415::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aece9006-2126-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:10:49 +0200 (CEST)
Received: from BYAPR08CA0025.namprd08.prod.outlook.com (2603:10b6:a03:100::38)
 by PH7PR12MB9173.namprd12.prod.outlook.com (2603:10b6:510:2ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 16:10:43 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::a0) by BYAPR08CA0025.outlook.office365.com
 (2603:10b6:a03:100::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 16:10:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:10:42 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:10:39 -0500
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
X-Inumbo-ID: aece9006-2126-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkO7RcKsZYtx9tdBos2NbUD2WygTwWkvfzSHUzpTj6unSyHOConggUA+G38jCD/RLX+ylVzj3ZXkTnQYId3Ouozs4dFX6v8b7MU4rhGeDOIDgGXjUmZvNmDUAPxhPGF5TNjuy9nFS+fkwQyr7YBUGReUTeo4r6/glZmcn+Yk57Y824qeZg0rhCh1qYdUcL/xo8aTsO7MJjudBq3RuMcRiRB0W8TTnC+yajtg0DlHG6lQVs4fZ+BHTYfuILeQFSTd4hinKn3dhwfIVkzyppzuD+erXrcn4pfuaHppTrowDnNK7cUA9J+18h+bqqV1dv1qk4LtJDQ7wlq9fB0Uwb/PzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGj901I88ijCCm+6lDmMWrORShiINxAGWituBp32fFo=;
 b=yU2HPvRpHICaAbJz/euf4OLaRiBqTLnO8V5Y7lOeBWDfVms8+VY5pcuOjaC7txlHwCwwTQm3EkZfZ3IWAESGYMd95YIVllKg/72xBof1X9ThNGDxP93xJ62sn6ZBN+G/5KxOUBNx706ZswgOJ+zk0Weck6EXOh/m5S/R4mRWJyqaeb/1hHHhNtfKjUf6LKW87L64c3ggPbg7Tx08Rm3tOPgNHdVzIBvg37jp7JLdWMCSSjQ14tUnCY97TfXooP6IVT7LO8g/iWMJJrqk/c3SEUy2AhSVb2bRBIwViM6AR+KoKwGLt5sJBb/UbJI2wM4Ef+drT0YJm7uCKljlLr68Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGj901I88ijCCm+6lDmMWrORShiINxAGWituBp32fFo=;
 b=3YYKsaGYR3gCyUV+Vkm5kuSNIR6cxWWp6UVZ8y90FZukdcr15A/NPpL4sw8WKfRcT0Ihb2wbDd/S4Fr0OQTnuTbnIW7ayXmuwZD2HrNxFzSl75SGxfkBhWmC/k2+pjcczw+jqG1295pbBovFBRUCgOWmH59x002dn300hXSU1H0=
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
Subject: [PATCH v5 00/12] Hyperlaunch device tree for dom0
Date: Thu, 24 Apr 2025 17:10:10 +0100
Message-ID: <20250424161027.92942-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|PH7PR12MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b724c8-75fb-4045-a770-08dd834a9022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m8zJ1csSbbWRDpNBiTCCP5VCUHcaMz1YpZjdb50jtm3dQXFCjn9p6BT6WJgz?=
 =?us-ascii?Q?EcGWwzPTitZSTJXlkBXsvWTsLgYY9cZ/JN6jH/alU+Hdo0Hk3dGkUak1Trru?=
 =?us-ascii?Q?jaQnbUxyMwb1g+ncmQtZ02SnRJseaISeorpycLb9AXZjwmEvtfC9xkEAcDih?=
 =?us-ascii?Q?397AD93rPFpwW/z9rt8/dytDHZRe9l+wY2AoHuUzFaWH6SccOmpgJH6K2SBH?=
 =?us-ascii?Q?+CqMTnomTu0ByBHGuIyPGgvrI/ddUT0r5UHQgrNGAaoisa77Mfox0Bd3aHyS?=
 =?us-ascii?Q?FroGEDAZDOa6dPBQgzyqqfo09CgjnGZMShAGIhQ3mI29MS7K6QAzrvTbThAZ?=
 =?us-ascii?Q?4jFj5DjnRaKxgSPGdwClfSGd4J3s7h8rhahygwXy0mIkV+YEBKJgwrdfLNuD?=
 =?us-ascii?Q?2XZ2OT1nGokr/Lj35UvlGkX1toY1T8MimssrAqK07lDrHw0UpKJUpM2LSosF?=
 =?us-ascii?Q?XVS6aKUWMs6IabISBnDLJZR9qqIR12yWL29kp+CRIHafv3Dj6zk4na/EXys0?=
 =?us-ascii?Q?4FDMFjMVnmz580p2+3uMbg7/berrKCELgsuT0S7tPINyrZlZeVwgunO6ph7Y?=
 =?us-ascii?Q?wynjhL/e6k8v2X79kSTx3/e5j2cGvP1LgMrHZkaNF9Ycwb31JbSK9zA2q5rX?=
 =?us-ascii?Q?8nrZcUVcICYsoiKmkAs93D2rB9/IHM1pouy7KhBmXhEabM3WyfYLvhpVA0qe?=
 =?us-ascii?Q?FLjbun3zEKfZYXyTJ/U/QkyK5sURO7GWwTsH8/ZMi5u+UTuIhyjwixc73y2b?=
 =?us-ascii?Q?dndNnA2JnGkbNtyBsePCaOnEO4MlFVWjairzmQ1ou6nIZlHkUIFZ0QVOYGXm?=
 =?us-ascii?Q?V3ViUe3o5LcrDHX//sw1q7XoJiRKtn1W3fLCg7IeV4ANhCi8VxjBbQ4XyhY+?=
 =?us-ascii?Q?TIlEpTqH+xJIsFZm3IztZurg7QC6ddAJhJ0CiddAha4PDR8nSzCyefg5lbmk?=
 =?us-ascii?Q?MZgbcpmu0krZtg13NC9GFbmM5QQ1bpjZTuCbiIzq2xc8qtm01p2DzRHtaQzz?=
 =?us-ascii?Q?rnYjt9PgIeZ5v73F7zCV0SMAlXQpuUu0xUwFE5WYJYGG05Imwctq1zYDV01a?=
 =?us-ascii?Q?uZa1T+8O0XNslJSwEfIgWOYuFS1yXyImL6V63uRJLL+MwyUhBWUUf9ohLZL7?=
 =?us-ascii?Q?qQY0UiFvscwXWJ0SptvHNlO6BtSjUtVowAcwOusnmv9NaZIzvtdZlW3XU28Q?=
 =?us-ascii?Q?ohQommszC/8FRmrA2qf46QnA6W737uswum0p5s+8BRJmqJmQr38Kdwhs+GNZ?=
 =?us-ascii?Q?2TIQzmt21Phu20Atve0md6c3wsa56BkYB6lZGWbGyjvgfR7GXJ+bqKAeKau/?=
 =?us-ascii?Q?IcPh5NNFUeVgS3VqFs/41jRAORd61Ux5tI0iayY3fdJyM0n6ERkT1mc4iXw6?=
 =?us-ascii?Q?bMfwW0pwWDu2HjVZty/wfega3Kq019L9kNNfd7SFcOF+6pcebmA/hrqMGfN/?=
 =?us-ascii?Q?CW0A+bx9UIqKr5keIRj4Leb1niEjwPjYGxq4BGftWnaPWrTGmku1m1mLPwNf?=
 =?us-ascii?Q?CWpiiNrav4eIgABcgKXsq+ewCfJ+BGWMlFFZPbmuHf8tDorqbOQupj4pXw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:10:42.4237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b724c8-75fb-4045-a770-08dd834a9022
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9173

Hi,

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
  kconfig: introduce domain builder config options
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
 xen/arch/x86/setup.c                   |  64 +++-
 xen/common/Kconfig                     |   2 +
 xen/common/Makefile                    |   1 +
 xen/common/domain-builder/Kconfig      |  15 +
 xen/common/domain-builder/Makefile     |   2 +
 xen/common/domain-builder/core.c       |  86 +++++
 xen/common/domain-builder/fdt.c        | 512 +++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h        |  40 ++
 xen/include/xen/domain-builder.h       |  37 ++
 xen/include/xen/libfdt/libfdt-xen.h    |  23 ++
 13 files changed, 800 insertions(+), 17 deletions(-)
 create mode 100644 xen/common/domain-builder/Kconfig
 create mode 100644 xen/common/domain-builder/Makefile
 create mode 100644 xen/common/domain-builder/core.c
 create mode 100644 xen/common/domain-builder/fdt.c
 create mode 100644 xen/common/domain-builder/fdt.h
 create mode 100644 xen/include/xen/domain-builder.h

-- 
2.43.0


