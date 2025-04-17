Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7177A91CD0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957511.1350613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgB-00051m-A1; Thu, 17 Apr 2025 12:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957511.1350613; Thu, 17 Apr 2025 12:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgB-0004zF-70; Thu, 17 Apr 2025 12:49:19 +0000
Received: by outflank-mailman (input) for mailman id 957511;
 Thu, 17 Apr 2025 12:49:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5Og9-0004z9-Of
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:17 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:240a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dc0df84-1b8a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:49:15 +0200 (CEST)
Received: from CH2PR05CA0052.namprd05.prod.outlook.com (2603:10b6:610:38::29)
 by CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 12:49:10 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::69) by CH2PR05CA0052.outlook.office365.com
 (2603:10b6:610:38::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.13 via Frontend Transport; Thu,
 17 Apr 2025 12:49:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:09 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:08 -0500
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
X-Inumbo-ID: 5dc0df84-1b8a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZbOShdQai4RPb4lZv0r7FsHnSt2gF+GdabafLkTUqfp0aBFuyxUBvHq1nGS03h8sO6XPgEss6ZpW9nYeuyEVQz5Arw96jIHgcU1nWKMy1eCOr4ACPLTcy4BEyjjrDgliXgCl1bI25jeD3ZYPnAfHGS6wKExvQeQVWFrSCCkJMLV2/uS2AvMAIHgGFUAi9R49Egqldo88uXGJGc/tzHRkvm4lNFQMoYd8u4Povlj1K90+kFZhIam3a9Ep45MytqkQdj7HwkGcVEHIBqqTjZW+lL86U/iWDizUpdsLrt7peSE7UEUdT4zqUWCjxl83MqVBsRV+ZSs78j0q8BH6Ohy1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0V8J3XxDGZtykescY6/CNgGnDmTrlCK6rwDVmn+jSo=;
 b=P0oE07yvgEu56svo8Xk24JI2rKMiYV6/XNdZUgCkpU56iOoI7YRF6TRm2mpUuWvf0IPJ+kdMUqL2zpXkF+6t34xdoF9ZtJROg5AiXecLaP0U1lFfzbU+c6N0VH1RLHpGrXITvwNM6BTo2v7Rry5zVSf//bGk2fhmi9C3YgdQNucP6GFTFR6aP9DeYM7Mc72sDhLRlBd3VTS01Ttg6u1vBLyIq4+i2+KkAzsmYkOTRzMQ4cUuSg4NmUR5bNrthGxx6bpQ0z8M9jnrLFMG7J+JEOt/iL38bgTO2h/mkDKpe+UIPuFyUW5cviFIWwoSNRm7qEsdZgXUsQ23HXzv57MLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0V8J3XxDGZtykescY6/CNgGnDmTrlCK6rwDVmn+jSo=;
 b=Vjx4qDrriLjGGFMMOfk9GtNyAiqGIqlGht7sdq6D9bcMWMa4t4faxE2gA2tVcPPXDCkRLyHZrA4ckDR5UguwHnBlxoWyeBjAz987xo47x3VVq/4kkRUMrIl1GPhcpaXpxZrUZmP7+6t3Z3lYrbyKIbbV/n7HR74+yngz9hjkiHY=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH v4 00/13] Hyperlaunch device tree for dom0
Date: Thu, 17 Apr 2025 13:48:22 +0100
Message-ID: <20250417124844.11143-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CY8PR12MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 597053f6-13ab-4564-4927-08dd7dae3f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3eFCRpjGi/TzHp9dIm5HnvO4KHoOjp1DTIWkpJgaEHpQQTIOGBdf6FAfaYyD?=
 =?us-ascii?Q?1ou35vfrm1JcW+gVhKmCsha2gCzR5JbF9TvMnyk/49UzaEGI3T+GpFiFOBQa?=
 =?us-ascii?Q?xYHN2H9efaSbNOUQ7xETOFOPezwVcCbJXMavanLh68v9tNhJBZWCZZOdjt82?=
 =?us-ascii?Q?WEbaGCh0IyA6Eh/X2Mzi1iXFmdWHS5kuUvwBoJmM9F7YrXAxQwtXWECq/VA0?=
 =?us-ascii?Q?vLQCptbuDY2YwYUe8ZRMwsINRpKdSJ5e4CrEMSXHtRapcnErAG4e79lwUwlT?=
 =?us-ascii?Q?AIXRYXTJiDmce3tfeau3X9O35T6tnUHHtXH1axAiMZrK0zb8mBL6ez1zFTPq?=
 =?us-ascii?Q?/5f21lKpy3JAfl5JfQAkmkRxsUNhKX2oiCguVckCVwPIJNFKccrS0Q7n0wTl?=
 =?us-ascii?Q?xVrS8MMzyX4XHbyVUu7uAVSesH4NgGv8Wsjs1F8RFJL8AIKpfm6ACI5UC3gH?=
 =?us-ascii?Q?dlpiIFqc/+AbLrtPXXJ7SwVXZ18SLOOm/2DgiSDGOKVz0f9H6HMn52K6co0D?=
 =?us-ascii?Q?BHf8z98w13RYEe56B+XzNudogGYXsRcw41fbMmS+xJCvAV4Z5LRighlI6Vg1?=
 =?us-ascii?Q?/GH1IfAwWjmobGkOUmgBSBj0Se6ZDPU5cjGnsdz+nVDBu0VQiGGBPp5Q9I/r?=
 =?us-ascii?Q?eb3CD1oteUEF+CqAFtZvLEiaXFxXoz5l1uSpc7yR8zHtu7TxbtCfYzWur84c?=
 =?us-ascii?Q?kvQwZTFh9SPV1UAIwQA38aio/bl2KLNf0r022vxUkdvYEslUltKu4Y/n5qe6?=
 =?us-ascii?Q?h1mV1EINLdH9ts036JEbNeyOyOdKA67fHurgOaa89tPws6AXxfjH8tYQW9Ut?=
 =?us-ascii?Q?OypjMibPGuzGy+2RMluXe1fGR9t0J1Ez94gVFxlEQXzJlkZdLMggvUhZEnKw?=
 =?us-ascii?Q?Q4CCj39hAxxHur51Q7y8p02hwDR29smU3iwRho0PvfTrlBYvvy1WABf9WfHo?=
 =?us-ascii?Q?nQ9XpHrqTNCQBgeoU91YKfatyDD2SgPiDKPWlWZrqzun6Exbit5bppkcuEc1?=
 =?us-ascii?Q?yUDek0XsKYsF8IbKRKlDrrH0ZbRu/tjuVxJZFz92N7GHt0tWgHTUDuU27MQw?=
 =?us-ascii?Q?ivsAf7DBtOt2nTXVMSspJS4+dwu2gAu8eNBbgpi7nW8lg0+7cTCvcAT1h3al?=
 =?us-ascii?Q?a55jzMW5QMjXWy0A1pLo1SQPTdlainOMIau7yTm9qXMOS8c4CeqFQHDBMS9U?=
 =?us-ascii?Q?IxGLh/QNmJAPbSPl+ad8a0M5obdhMtCzCa7PM97KafRK97z2UCmddfWHmP9k?=
 =?us-ascii?Q?dMaME/lyRPrT1UnhAQdNMCh+s2jpydX54lO9EtVwQ+nvrD3VM+e5yWH2ZhxC?=
 =?us-ascii?Q?23tJpQlS90WI+/v2qYnjnnlOLvc5M++5t63wYkdS2x7M5HVPsp1asZeI9KYZ?=
 =?us-ascii?Q?dAtMF4XMhpadTjchQpLg0MJfzFvAkSu628ilVdYBhS0RERWBCT8HtHItY59T?=
 =?us-ascii?Q?XsJl6BQm09Vsv8o4hSudssgOZHKZB8QKABtRDcCcHyeWFTgLWM2rArJ8nEwr?=
 =?us-ascii?Q?H302mtID4KnjOYY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:09.9178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597053f6-13ab-4564-4927-08dd7dae3f83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8300

Hi,

Here's a new version. Took a while to integrate all the feedback, but
here it is.

v4 pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1772300721

v3: https://lore.kernel.org/xen-devel/20250408160802.49870-1-agarciav@amd.com/
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

Alejandro Vallejo (1):
  x86/hyperlaunch: Add helpers to locate multiboot modules

Daniel P. Smith (12):
  x86/boot: add cmdline to struct boot_domain
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

 xen/arch/x86/Kconfig                   |   1 +
 xen/arch/x86/dom0_build.c              |  11 +
 xen/arch/x86/hvm/dom0_build.c          |  31 +-
 xen/arch/x86/include/asm/boot-domain.h |  17 +
 xen/arch/x86/include/asm/bootinfo.h    |  10 +-
 xen/arch/x86/pv/dom0_build.c           |   4 +-
 xen/arch/x86/setup.c                   |  91 +++--
 xen/common/Kconfig                     |   5 +
 xen/common/Makefile                    |   1 +
 xen/common/domain-builder/Kconfig      |  18 +
 xen/common/domain-builder/Makefile     |   2 +
 xen/common/domain-builder/core.c       | 110 ++++++
 xen/common/domain-builder/fdt.c        | 488 +++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h        |  39 ++
 xen/include/xen/domain-builder.h       |  13 +
 xen/include/xen/libfdt/libfdt-xen.h    |  44 +++
 16 files changed, 839 insertions(+), 46 deletions(-)
 create mode 100644 xen/common/domain-builder/Kconfig
 create mode 100644 xen/common/domain-builder/Makefile
 create mode 100644 xen/common/domain-builder/core.c
 create mode 100644 xen/common/domain-builder/fdt.c
 create mode 100644 xen/common/domain-builder/fdt.h
 create mode 100644 xen/include/xen/domain-builder.h

-- 
2.43.0


