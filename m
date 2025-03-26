Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43311A7103E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 06:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927005.1329818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhp-00006A-3C; Wed, 26 Mar 2025 05:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927005.1329818; Wed, 26 Mar 2025 05:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJho-0008WP-WB; Wed, 26 Mar 2025 05:53:36 +0000
Received: by outflank-mailman (input) for mailman id 927005;
 Wed, 26 Mar 2025 05:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJhn-0008HQ-N5
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:35 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a26f2ad7-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:53:26 +0100 (CET)
Received: from MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::31)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:53:22 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::c3) by MW4P222CA0026.outlook.office365.com
 (2603:10b6:303:114::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:21 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:15 -0500
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
X-Inumbo-ID: a26f2ad7-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXluVazyJvRAqtMIy0t5Lvl+xmLHjLRS23BfrGDXSFULqZ9wvY2f8TS5ul0E/P9MrWjNILP3Epswgk1qqTWYFg4gXwE82vLVNI/UiR2r+EajqfkrUlANazSCDEWAfWbix/f+5yMSFpqnio2V4E7HGUHikzqbKlaph8njr67vZW7dIdjMjuevkx7M15Pz4o+tYej/Po6COyjLpxj5xolHslacXqNWo3RNF6+fbRum5eujq9R9MooH1Fb35uNlJbuYC4RJYtn4KNdXuYN0VbmAXC36zljnq8YaiS3VL/Bw9UoabF72V5RmcCZ9lXO2HaAlJa3WbItT92uLs+E+YBF4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUJdVnXURuza91rse+oG1ukKv455/uqImpCRJcgHC8w=;
 b=ya3uZ9+cqdDa92HH5PRqD//uMpIxWS8nYVEtmzviPZRwQx93Rpe5IWJsms2S5P7vMucizI+G8a+NnLYZsy9j63mUFaXorfFm6rYNFr8Nwyya7r7BkbexSL203mLsoBaV12NfVRNo6Eqif+C1cg/9+vH4F7dus11QBcxH+fl9R1jufvTJUOwdJx6G6kY6k8u4V7+qTXm/Vlu9y4ICRXdmT1PW2j2zPdoOxptLqqL0aVRBc9qcu1iCmbsgyO7wSz+PxJZRVjpdOf3A/PUZmRo6o4Th0GwH96/5gDh1zEimRRe5PN7DtTJgscj8nb1bGLmeHEerM7Yva8BqdH3BWPWo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUJdVnXURuza91rse+oG1ukKv455/uqImpCRJcgHC8w=;
 b=OM4O8dwL2jZTviBn98cLEr9qHZbsV4oHI8aDyJam2htl5t5lQgPXa8Hlb4fZawHjmy+QB1CZdoCSlGPVyR+Vldwrcj6xHG1CTsXsWsLJtdRDHBF3YPtOer4ZeMlP/j/YioQ5+x6rsCPIqxK+ZH3u6+wvAwc1ERSFAIMp4WkAg/0=
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
Subject: [PATCH v2 00/19] xen: introduce CONFIG_SYSCTL
Date: Wed, 26 Mar 2025 13:50:34 +0800
Message-ID: <20250326055053.3313146-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 781e5090-af9c-4c40-e9b4-08dd6c2a83ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pp44K15EBE3N82DFYKUtnFgYqKT5n6AkRU1tnFeDJp8O1d5mQZNWL1qdzLxt?=
 =?us-ascii?Q?Yrvx6aHdF1bLj2hxj333erQeUsbMUtbVsBnRkU2ViR7RagEiKvAddobEdNIA?=
 =?us-ascii?Q?hKOC+t4O19wbGfxCdVB36r34flj0w2R5fO4QrZU97oKjt9Ykek4r+a0vPMAH?=
 =?us-ascii?Q?UFuqVX/fbvmKqJ9SP62uc1XjVR7gJfTst0FidfbzSSrbHYbaOaNxNLLsk7JE?=
 =?us-ascii?Q?WH7PbYCTiPiDjUoTkeOts7OzFoAwqqtGExXPWI2/nPxp9bY23uPO3txdKKU0?=
 =?us-ascii?Q?oYIHrvJsctQfmJBM3u5D3CIoye6a0bywUX6cIki7xOoq9wLSS9GpZoGDIj69?=
 =?us-ascii?Q?rOJF/QGZIUE6VktCo7CGC90HA2ehsHj+W8bi/ocpj1CASzI5tAqI4l20yLxY?=
 =?us-ascii?Q?I6DUA6F3N72vy4lLBm35mGrPJ5g3ucqRcxp3fmop94GjsbVDo5ZB1WzrSqOy?=
 =?us-ascii?Q?hw7vns0X/nRPDoXukXBhFD2inPkym4K66vansk9soV56aB3UXLgKGRSPjLcH?=
 =?us-ascii?Q?2heYJJrzsdnkvHkSgu5GFY0kD0K5LeyemvZLiODTOqZ7EUztCkgQFr+ECv+y?=
 =?us-ascii?Q?yBgQPPhx5qxXFHkLArWpL700GlcXIGt+mxPc+WDndZ+w6wZgv80KdEJ5GsrH?=
 =?us-ascii?Q?tPgmYId5TbKnEzjoBs7t6s91pzZeTwCSVj+XpLwhNThApLJilrZ+HBG0uTyD?=
 =?us-ascii?Q?4Atz2NAlOoN4gehtz0arLEoSZTcBG/RwXyxlxYIAMjKyg2lJjta92fmcQal4?=
 =?us-ascii?Q?TcvfnyVruVTDCHIM9iDA7KzgFBgjoxaktPNYMI77jaod/3/KHjMxV1Vy0dCu?=
 =?us-ascii?Q?tDK0SHT3XFJO7t5d4RTKihHHz4cws070GMcfyT/P9cJvDp8/TmlI9IyDOFSS?=
 =?us-ascii?Q?1/42taP6uaKTVmJrVRAWrBhkt9GQQTFhGfM2OeCSs/HJdDy4p8G7zx7968Yk?=
 =?us-ascii?Q?GQyZuVITOxk7cv741Eu8YUwcMG0aBuArB4LPUjMFaya3VED+eoNXXhPl/qyg?=
 =?us-ascii?Q?T6mFipot1EJtMHwlZiBOPTvJ5nWmlpwiaqA9e/udWZPvmilUXLVTluJbL5Zb?=
 =?us-ascii?Q?ATLEhcnh3fVlhWOjaQkliiw+5iOwsDnnvHnT5GzqdHS+5EvePqW/GRcx7lf0?=
 =?us-ascii?Q?HDEO5nesuqkkbcg82aKlwuJevY2B/3q3NGKmzFmp+/SienbFWuE6hkI/6a7z?=
 =?us-ascii?Q?cUPgnlhQ8XrddPh2Q5W9JubR9Lv8JaMHUqZQX36hWooJb07MzVgMezyZysTn?=
 =?us-ascii?Q?vyZhbYLcRBKoGOykwMKPTeHMoHxYmvo6j/Ur/mcK0XCRgLG+8Y/ZjefxshKl?=
 =?us-ascii?Q?7MaA5XvcmNkRmzvsMhzcQ3TOylcpWEZDRwFILV/hYzFI9xigoUX9XEYN7KZe?=
 =?us-ascii?Q?y5lEbz7+Qc18K243uu5pERrd5O4VIh8Q9YgJO17bH7vJ+FrZTqc2DPQFUpmo?=
 =?us-ascii?Q?QQ3GX0q4alBY16TEeh4MimVQ7kaCpuCb/8Bmx3WZ6MM/gDu/hwb7WqVC/orj?=
 =?us-ascii?Q?QrIWqcxldOpaC4U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:21.0768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 781e5090-af9c-4c40-e9b4-08dd6c2a83ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228

It can be beneficial for some dom0less systems to further reduce Xen footprint
and disable some hypercalls handling code, which may not to be used & required
in such systems. Each hypercall has a separate option to keep configuration
flexible.

Options to disable hypercalls:
- sysctl
- domctl
- hvm
- physdev
- platform

This patch serie is only focusing on introducing CONFIG_SYSCTL. Different
options will be covered in different patch serie.

Features, like LIVEPATCH, Overlay DTB, which fully rely on sysctl op, are also
being wrapped with proper CONFIG_SYSCTL, to reduce Xen footprint as much as
possible.

It is based on Stefano Stabellini's commit "xen: introduce kconfig options to
disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

Penny Zheng (17):
  xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
  xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_readconsole
  xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_sched_id
  xen/sysctl: wrap around XEN_SYSCTL_perfc_op
  xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
  xen/pmstat: clean up pmstat.c
  xen/sysctl: introduce CONFIG_PM_STATS
  xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
  xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
  xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
  xen: make avail_domheap_pages() static
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
 xen/arch/x86/Kconfig                         |   6 +-
 xen/arch/x86/Makefile                        |   2 +-
 xen/arch/x86/acpi/cpu_idle.c                 |   2 +
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/arch/x86/hvm/Kconfig                     |   1 -
 xen/arch/x86/psr.c                           |  18 ++
 xen/common/Kconfig                           |  19 +-
 xen/common/Makefile                          |   2 +-
 xen/common/page_alloc.c                      |  55 +++--
 xen/common/perfc.c                           |   2 +
 xen/common/sched/arinc653.c                  |   6 +
 xen/common/sched/core.c                      |   4 +
 xen/common/sched/cpupool.c                   |   8 +
 xen/common/sched/credit.c                    |   4 +
 xen/common/sched/credit2.c                   |   4 +
 xen/common/sched/private.h                   |   4 +
 xen/common/spinlock.c                        |   2 +
 xen/common/sysctl.c                          |   4 +-
 xen/drivers/acpi/Makefile                    |   2 +-
 xen/drivers/acpi/pmstat.c                    | 199 ++++++++++++++++---
 xen/drivers/char/console.c                   |   2 +
 xen/drivers/cpufreq/cpufreq.c                |  31 +++
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                | 162 ---------------
 xen/drivers/video/Kconfig                    |   4 +-
 xen/include/acpi/cpufreq/processor_perf.h    |  16 +-
 xen/include/hypercall-defs.c                 |   8 +-
 xen/include/xen/mm.h                         |   1 -
 xen/include/xsm/xsm.h                        |  18 ++
 xen/xsm/dummy.c                              |   6 +
 xen/xsm/flask/hooks.c                        |  14 ++
 37 files changed, 385 insertions(+), 242 deletions(-)

-- 
2.34.1


