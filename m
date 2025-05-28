Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE95AC6586
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:17:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999057.1379759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv0-00010p-Fe; Wed, 28 May 2025 09:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999057.1379759; Wed, 28 May 2025 09:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv0-0000yW-CR; Wed, 28 May 2025 09:17:50 +0000
Received: by outflank-mailman (input) for mailman id 999057;
 Wed, 28 May 2025 09:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCuy-0000yL-C1
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:17:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:2417::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d3cf003-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:17:46 +0200 (CEST)
Received: from SN4PR0501CA0108.namprd05.prod.outlook.com
 (2603:10b6:803:42::25) by PH0PR12MB8032.namprd12.prod.outlook.com
 (2603:10b6:510:26f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 09:17:41 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:803:42:cafe::e2) by SN4PR0501CA0108.outlook.office365.com
 (2603:10b6:803:42::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.13 via Frontend Transport; Wed,
 28 May 2025 09:17:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:17:41 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:36 -0500
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
X-Inumbo-ID: 9d3cf003-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meU5uzdtMEinPF9z9C10dGXX1sEsghdzm+pHaFpAl8eZh+o85T0d+Jwp6YhcsRpBFZfrJ99aHrwo3qMOhLC3vWShya+Qf10/pLsFG72UDAIAMUYZJ2+yGuKgO3U1y4zSi2GJ3KfP+95eiIbYHLBRsn/nefzaOXsB/G5Q08xgHvIQpT2/3vJiTfYGRgCmCAFKm/mNmq+OiFiCTvfTqWpkZjlc8Jx55RHvjMOCL9LSm82e92ad9ZuhykFtwjXR08yLYiIScStOHOe7qkoGfMqCRM2c0vA5kgTvyWxtehh2laYB/k3Uut5zQh1OT3wYjcrA8tch39IKFB8AV4dCWy+aMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fBy+00aMr8fjYdF68xRYh7Q/ZCOgcFRnmf07kIan4g=;
 b=K4dsj7wDAF8z96IA5UtN/Wkm6gAAvgTemw7QyKVjmmuXgFHgoR9RJQkajVdB3Gum9YTCTZa7ji0e2aF3nQJmjTGp1ih7Eqb/gbuvrQjbU0Y9WZ7PM7ZQz1ywTkCaWENIe4sQmJiCgyWLifFqFZvA6ePBiKJI97U4w9GFfZWW+d4eK3M7/swjr2R4yohuDy3IEyw/OmzHEV6VEwuk9nCba4e53oJldOqKWSxzf7PaV7F3da3yULqacbOR4lKkuxIneVXQgHhLrrkwn33sUps+S/kDr6+k7fNVhjXk/Emj73/CSrKtHkUWbE4650516aT3xpY3ahSjSf2w76Kb1UEZXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fBy+00aMr8fjYdF68xRYh7Q/ZCOgcFRnmf07kIan4g=;
 b=FLWQiYxp+8CKVCKNqGa6VkXESezko9kuhmg3vc5FUNM45LOsY0vHjkkrodGcwBaxtkWmbnd4EzYniA6DT4AalrVqV+1VgvceTDT7hi3iKjtu5Lw9WqzMmgWM1f/kP1iTVy/rSqYcYvGdqoOdIKuy6XzpInWCfJ1MbxnhI7cyECw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Nathan Studer <nathan.studer@dornerworks.com>, "Stewart
 Hildebrand" <stewart@stew.dk>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 00/20] xen: introduce CONFIG_SYSCTL
Date: Wed, 28 May 2025 17:16:48 +0800
Message-ID: <20250528091708.390767-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|PH0PR12MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cae79f8-0bd2-494c-ad85-08dd9dc87f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xnB5gNhkOaBi/fMwNPIinQRmu6k9mxoNya/r3zEMMiGTe+d3KUIzLpaZJE8m?=
 =?us-ascii?Q?18aODG/JcruOEdzVX9v7VwpuTpQwlSCaKnf164elhfKg+FtQdK7VhsKftlrk?=
 =?us-ascii?Q?/F1w8A0/fo16cr87gzdNVlIthDd7OIdFOdHw/NJA3UiYXgBDNCTJhkjC4sp9?=
 =?us-ascii?Q?FgKb1+2BIolLwp62cqDgW8qD2l37Z/KsvuHHOV2Pnn/3tPINmHTC+9P9bY0u?=
 =?us-ascii?Q?jUKALdlS38fiuOwAvzy3qZEQLHYkoSfsEzZIj+KYmJ7KJnLGJQkU71D4xZda?=
 =?us-ascii?Q?9LP9KjSZnII8LtwRfJopDoS5HM1eBXvdokOhjtObEw9kXqfWncT/X14++bd0?=
 =?us-ascii?Q?p2XQ1AUwyLb74kpK12cfi1ulOzIHEnyvRrXeWFD6wDMzkH8o6W2fYy/5Z+cu?=
 =?us-ascii?Q?4/C5PS7Cd7jkkooXM1lMtIY9Nkz7uJffJBGcIjO9eoC8FL7Hv6F8/ybUDS1a?=
 =?us-ascii?Q?U6ms4Tfpc8B3KNuGIR6Fyo0/GRtJ13ezCZkQ7gjYOorVVl8HKFsCZjcukIRV?=
 =?us-ascii?Q?fq29eOLOVA5dWfxpfS7e2Alre9nOAI4brTQAvHEkjnvchtjFKTQ+Cb5YfDLb?=
 =?us-ascii?Q?coiYOQiflsRHc0EDkjGBKU9pHBAqdkhTwUosUxEUNIdV0gAt64aTAGloqYTU?=
 =?us-ascii?Q?Ah99d/fT8vUx1w6iBr8Y+vZvZMHowYGr50uv1Lf5Qfk8mKkGKBklegG6zBYa?=
 =?us-ascii?Q?BySiXU6v/6JalcbkCh8VZzjKmYtGwWeiHautNTh20urQeEAur/ToDveJNQ9x?=
 =?us-ascii?Q?fZzkvzXo3jIAfvAOu2OoBbh+pnji5vPCpxHyTVXiQ49VespHmh3rUv/1ONt1?=
 =?us-ascii?Q?qo0uwr9wq1LqrYeCiLhlzkFeaP3F8VltJb3QhEeTuMSypgsptl7xf2Gw7hpG?=
 =?us-ascii?Q?1mEPesPtcP1pqvLqQ7Gy2hB+y7DSZIyS0mgGGZlLU3pRIqg5l34rGNHU+okx?=
 =?us-ascii?Q?WINiY48o07BthoN8h/cXJRSIbVpDYzj3/OaydsHTMW5+ARa6Wc9yXcFrbq52?=
 =?us-ascii?Q?PsJNLqrCngaLEvaQ8XBpVWuutpH/nTAGW41GNy0i1EUYaGwnNqF7ppbUjosx?=
 =?us-ascii?Q?N7iP07lSMmUA0qVTCx/aRhwOGudjLCtmCIHfEP9zRTTgRjwW2toYqee+iR80?=
 =?us-ascii?Q?PQ+Ce7g4SiAjZWCA60Ntt4ri5LfrmBDLgzF3wvK2+I83gZdPjUfwKusR+Psc?=
 =?us-ascii?Q?6PYKm8M8Mdyz/rT4kcu/V/kqTYAiq73fMncfbL+hMotxHtAdXS26V8ew/JKa?=
 =?us-ascii?Q?FHOfEMOUZ0KBitFCqMvI2vvwSUdTZ26aDR/tQtDnvZJR+w36ndJe4cEAby9s?=
 =?us-ascii?Q?cNtA2ywNUIZSRaBAMtJANJY6Skpl8W/oZdOAoFvVZ1pfQzQBAT0YY8J5Npto?=
 =?us-ascii?Q?zyXwHA8FMoIGCew7vwMyp/cUvIEQarx0Xzk/LAg53/oPvUn8ZoQza3aW2irU?=
 =?us-ascii?Q?qVTk4BM6YG/HRSDop+HV2qmGDEEImBQ94/3LvrGEQRht7rnsffWCiV43I5Kv?=
 =?us-ascii?Q?j0QMpewCrDY8ecCzJL4labWTmlG7922PyECbnqhMAaZXkDc6DeL9XPj9vA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:17:41.2803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cae79f8-0bd2-494c-ad85-08dd9dc87f6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8032

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

It is based on Stefano Stabellini's commit "xen: introduce kconfig options to
disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

Penny Zheng (18):
  xen/pmstat: consolidate code into pmstat.c
  xen: make avail_domheap_pages() inlined into get_outstanding_claims()
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
 xen/arch/x86/Kconfig                         |   6 +-
 xen/arch/x86/Makefile                        |   2 +-
 xen/arch/x86/acpi/cpu_idle.c                 |   2 +
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/arch/x86/configs/pvshim_defconfig        |   6 +
 xen/arch/x86/hvm/Kconfig                     |   1 -
 xen/arch/x86/psr.c                           |  18 +
 xen/common/Kconfig                           |  29 +-
 xen/common/Makefile                          |   2 +-
 xen/common/page_alloc.c                      |  55 +-
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
 xen/drivers/acpi/pm-op.c                     | 397 +++++++++++++
 xen/drivers/acpi/pmstat.c                    | 559 ++++++-------------
 xen/drivers/char/console.c                   |   2 +
 xen/drivers/cpufreq/cpufreq.c                |  31 +
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                | 204 -------
 xen/drivers/video/Kconfig                    |   4 +-
 xen/include/acpi/cpufreq/cpufreq.h           |   5 -
 xen/include/acpi/cpufreq/processor_perf.h    |  14 +-
 xen/include/hypercall-defs.c                 |   8 +-
 xen/include/xen/mm.h                         |   1 -
 xen/include/xsm/xsm.h                        |  18 +
 xen/xsm/dummy.c                              |   6 +
 xen/xsm/flask/hooks.c                        |  14 +
 40 files changed, 798 insertions(+), 648 deletions(-)
 create mode 100644 xen/drivers/acpi/pm-op.c

-- 
2.34.1


