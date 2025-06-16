Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0ABADA870
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016509.1393397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xh-0008Dg-MH; Mon, 16 Jun 2025 06:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016509.1393397; Mon, 16 Jun 2025 06:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xh-0008AZ-JK; Mon, 16 Jun 2025 06:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1016509;
 Mon, 16 Jun 2025 06:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xg-0008AT-Nw
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 023dfabb-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:03 +0200 (CEST)
Received: from PH0PR07CA0051.namprd07.prod.outlook.com (2603:10b6:510:e::26)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:41:56 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::2) by PH0PR07CA0051.outlook.office365.com
 (2603:10b6:510:e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 06:41:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:41:55 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:41:50 -0500
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
X-Inumbo-ID: 023dfabb-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7wblkaGtkOFGe7SLfcD8doc14+CjrCihwezYhOLIBqKkXymNjjZQXcGJO8migm2u1I49zIeZa4Yp4heGXsuuPO5NnkUQ6G6//nSzM/SydrW7C56XI1jNGTd5tcJRZODqiwfm02VGJy/fucuU/h/Hi0U/RpFFOpNMba3ZKtl3uCnmF2FqNMezyJEpejDFrWdBGO/iVFdh1XHIzywkop1LFiQ7sivZ4wSVUXNYHR8GYX8XOLC2YYyWQCWBc9Mqv0cnQuBwZbzCs+3rBvQEi0PFVH/bOmryaenrGm1Hmo6kHmwjJi1PEyChWp96Z3nCQy0Co6r9l1pgdHS8BRlIzcZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItL/mFS8c4oPecd9mD13j1wnQZRdCrGzOnxc+ZiEBKI=;
 b=VLcmDGFmDmm4mgrg6QZmVInfAsbPBk+BvwH7qJLU42YiFF3g1Jf/j24EVwNKoW/tBHlZk0nNmttNXOQW7w58lv5Ikixt3RB6dJuRDO0Jpjrj6B9NZdxcZg4q1ClYEzy8jkK9j0FLj0Qbz92X+QN4hxB+Wk/uce6qAoloKXevjAAfDMhioymed/buEKMLl3NIEmUAjSczn0W9qfKGD6AUC0l+VnvTUOulurFJqzhLpPYkwoXooBRA4AZx25SVqz+Btv/BpMEc+rFCLc15B8zEqNShkz/8csTFsiQ20gkjqwUBO9LqDUOtuAOPy3K/rd3xcANuJQ70+V1lSeVi3Bk+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItL/mFS8c4oPecd9mD13j1wnQZRdCrGzOnxc+ZiEBKI=;
 b=f/pYrXoR75C5eObT4PYZ3i603Q+06VhmMV1/HFZ6NJSPUEmKqT6+dHLRdhr49i+E9o2V6CDy6ZcEvTPvfMny6qD5ctpM57UT6fJrKM9t4icqKlarq2DOSDETP5yU3kntfkLf5c34KfdopT0ivBquHXLlay7ZwrIjA4viS6nsKQA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Nathan Studer <nathan.studer@dornerworks.com>, "Stewart
 Hildebrand" <stewart@stew.dk>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v5 00/18] xen: introduce CONFIG_SYSCTL
Date: Mon, 16 Jun 2025 14:41:10 +0800
Message-ID: <20250616064128.581164-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 1421b45f-825b-4f79-7f2d-08ddaca0e2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LWD4048LrXXiet76Aca/9WpGmxPRG3v3ZrLPIl80iFkCTn25uuLSBoWVjrb3?=
 =?us-ascii?Q?5OToOJPhSUhl4B9fsIWWHunPjvgzhqJNmpqV8DZU4ynRKpm8mzYOjs8slVmx?=
 =?us-ascii?Q?w5lo04PZCcs8HCtpWggGgZkiL+frH9DxrhVPs6kYEAycA+Blxwq7bHtENVEj?=
 =?us-ascii?Q?uU1LlgDD2fdz7PtqvgeVP9f9ENP32MHlLVZ4RSAJh9WScTIwnVrnSHlQs1aq?=
 =?us-ascii?Q?SROh/dtVP1Bg3h/ifhEn32WkVlx49tyig6P/wEhUWLvjzITNdm0Qc76p+mgv?=
 =?us-ascii?Q?PReEPylIdHpUhxvSrJdKWnAJwu8NK+X4f63rFra7qp+toErubpaFFy+Lb87X?=
 =?us-ascii?Q?PSQNj229alFFYgXFd2oEKgRauPQjOxLUqQ2W0ye/PrcrKINGZ0pQtD/9/8wu?=
 =?us-ascii?Q?EsZRQfkFt9WPio2vRS1nRtosWuqNNmWckR9Ihg27/qHlCmAbxgIOd+5qPmC/?=
 =?us-ascii?Q?ylDYYvqhzbAg5iA9gIphvRtjxKvKMYsAIo/QY+0funDvkIe8E/Lo9Z080HD4?=
 =?us-ascii?Q?+dO3WyLKrgMEw6JpFQKapjfsqxANAGKyzuSvjXdTYNRBbjO45jhEGHz02Lmf?=
 =?us-ascii?Q?IMOlOq+ggTRQ4q59NcfKoj72XSO6/DxMaa8TbcjzG4ShxRjm3tfgDKSBcil/?=
 =?us-ascii?Q?r+3l4zMFvVcOKVEF0e7+f+JMOOhs9cmCVyaGpjz8jKNOMtooXRNSh24df16y?=
 =?us-ascii?Q?3vqwU5zV7/Xdr+VzmbTDfWlA7vnUTuGxNEMoj7yJzIC8iGtZJmwAomRFSMKE?=
 =?us-ascii?Q?BVltgi+kZCWHCwtBUd7nffsH3vtmToMzcbPhRrK9iLItwtZbgigtjNu5dzMY?=
 =?us-ascii?Q?mmZjRGEVUGd1dn7hJdnmVjLJKOOW5inc4a6LMzeTCmonyqv/6MmytaUAi2cL?=
 =?us-ascii?Q?AvkzDWvvMkJJY3yGqQXxCiCU7sRFihY0W+mAUn3RhK7qDRwLZli0TLANk0rU?=
 =?us-ascii?Q?pV6ypgqMrnjTrEourwtAtkUeasIdEqsyioo7ohoXmVoARO2C1DFhncG1gHVn?=
 =?us-ascii?Q?ZRXW4PNOBMbcTZewJsX2ri8x6D/58ETRPMkL2B0TNgUedwavvOi4KPcwNXqq?=
 =?us-ascii?Q?bVetm1/0WklB1dEM0Ub7ab/yP8s/y7jaENskDpEZAJkbBOXYlWkWEX589j/Z?=
 =?us-ascii?Q?YXzlEFAi8zatVkamNyFfxbPXJ5r4YvxRg/BQVq98WdeZmpBqk0HWNDxL0OMX?=
 =?us-ascii?Q?wlBXF/Bcw2nB0jzL0AMwLTde6uXWlaLKh0/stwoc0Uk0CsNma/uDU9nDqPJ+?=
 =?us-ascii?Q?uC8OOC/nrg+rsEB0ODkJWP626j4CVix+k8p/IkPCq242F0tEgYnOlKg1A04+?=
 =?us-ascii?Q?txefi6vPB+qrgo/zito2pd+W7lc2dpNzvhBddekBCRKHqBpmRNSEELIsrvHK?=
 =?us-ascii?Q?Kh0vtQD0I+xk7AjIAAYYsr0/LdE95Qhr3fssvjo18TUUY3Cn+o8XpIfg8hoi?=
 =?us-ascii?Q?DZ69k4aGv/GwC7poH+9qrBAJV8g5JVFO1cRtOtQHHIgZQ3r6g40j2nan2gva?=
 =?us-ascii?Q?gN1NWAft1ReAFWCV/SD70xyOlnaXlQqx6r9c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:41:55.8412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1421b45f-825b-4f79-7f2d-08ddaca0e2fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674

It can be beneficial for some dom0less systems to further reduce Xen footprint
via disabling some hypercalls handling code, which may not to be used &
required in such systems. Each hypercall has a separate option to keep
configuration flexible.

Options to disable hypercalls:
- sysctl
- domctl
- hvm
- physdev
- platform

This patch serie is only focusing on introducing CONFIG_SYSCTL. Different
options will be covered in different patch serie.

Features, like LIVEPATCH, Overlay DTB, which fully rely on sysctl op, will
be wrapped with CONFIG_SYSCTL, to reduce Xen footprint as much as possible.

It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

Penny Zheng (16):
  xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
  xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_readconsole
  xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_sched_id
  xen/sysctl: wrap around XEN_SYSCTL_perfc_op
  xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
  xen/pmstat: introduce CONFIG_PM_OP
  xen/sysctl: introduce CONFIG_PM_STATS
  xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
  xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
  xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
  xen/sysctl: wrap around XEN_SYSCTL_physinfo
  xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
  xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
  xen/sysctl: wrap around arch-specific arch_do_sysctl

Stefano Stabellini (2):
  xen: introduce CONFIG_SYSCTL
  xen/sysctl: wrap around sysctl hypercall

 xen/Kconfig.debug                            |   2 +-
 xen/arch/arm/Kconfig                         |   1 +
 xen/arch/arm/Makefile                        |   2 +-
 xen/arch/riscv/stubs.c                       |   2 +
 xen/arch/x86/Kconfig                         |   4 -
 xen/arch/x86/Makefile                        |   2 +-
 xen/arch/x86/acpi/cpu_idle.c                 |   2 +
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/arch/x86/configs/pvshim_defconfig        |   1 +
 xen/arch/x86/hvm/Kconfig                     |   1 -
 xen/arch/x86/psr.c                           |  18 +
 xen/common/Kconfig                           |  31 +-
 xen/common/Makefile                          |   2 +-
 xen/common/page_alloc.c                      |   4 +
 xen/common/perfc.c                           |   2 +
 xen/common/sched/arinc653.c                  |   6 +
 xen/common/sched/core.c                      |   4 +
 xen/common/sched/cpupool.c                   |   8 +
 xen/common/sched/credit.c                    |   4 +
 xen/common/sched/credit2.c                   |   4 +
 xen/common/sched/private.h                   |   4 +
 xen/common/spinlock.c                        |   2 +
 xen/common/sysctl.c                          |   4 +-
 xen/drivers/acpi/Makefile                    |   3 +-
 xen/drivers/acpi/pm-op.c                     | 397 +++++++++++++++++++
 xen/drivers/acpi/pmstat.c                    | 357 -----------------
 xen/drivers/char/console.c                   |   2 +
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                |  41 --
 xen/drivers/video/Kconfig                    |   2 +-
 xen/include/acpi/cpufreq/cpufreq.h           |   3 -
 xen/include/acpi/cpufreq/processor_perf.h    |  10 +
 xen/include/hypercall-defs.c                 |   8 +-
 xen/include/xsm/xsm.h                        |  18 +
 xen/xsm/dummy.c                              |   6 +
 xen/xsm/flask/hooks.c                        |  14 +
 38 files changed, 569 insertions(+), 416 deletions(-)
 create mode 100644 xen/drivers/acpi/pm-op.c

-- 
2.34.1


