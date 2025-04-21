Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3CAA94D4E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960996.1352606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lj0-0007o4-Br; Mon, 21 Apr 2025 07:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960996.1352606; Mon, 21 Apr 2025 07:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lj0-0007mJ-98; Mon, 21 Apr 2025 07:37:54 +0000
Received: by outflank-mailman (input) for mailman id 960996;
 Mon, 21 Apr 2025 07:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6liy-0007m8-Hd
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:37:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2414::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86510256-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:37:50 +0200 (CEST)
Received: from MN2PR04CA0021.namprd04.prod.outlook.com (2603:10b6:208:d4::34)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Mon, 21 Apr
 2025 07:37:45 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::2b) by MN2PR04CA0021.outlook.office365.com
 (2603:10b6:208:d4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.31 via Frontend Transport; Mon,
 21 Apr 2025 07:37:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:37:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:37:39 -0500
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
X-Inumbo-ID: 86510256-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOHTQise1nwiqhQ03qCfCL8J+g1sHQloVC+E9+JZZhtK3+IQQFhmHnFYGkPUel571kbwiVkzothrxVFqaRIr7J4v8VSpBmT+q2rkrZNZ07Cja0KBe5hoXCIagDQ0WpvxbjkPjUCmX4GYmSUsIuuR25qzx725G8BXwstmvi7XcEQ6HsgaVhhBs8ONDegxyNEF79aWuXF5xC+vZk76NOVficHGCsht9xcvS1KSnGfgdfWd04DQtqogNZ4VQ5jkn1QaTmPOtxjSfFCAuw/qdi9bg6premFNMHTshNXjCsWreiqYrvIMDcQqx/vdPXX1NpTqU51WODVPdHBLhiq/V1BnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHwtQoUXOLe8JsiTb5ocVLRP+W5abyHJLBWNclqbEuw=;
 b=rxrRGeweSOfkhU+HMMjgTdXlhEPg6Tg1cYQWdpVlA5i9OzgTNKlC/4R5maRNQAgonsk6n3ubi+0m5E04Ho+NFpYb5AYn/hBSCr+xICRwgKKti7hDd7dkcZN/vkofc88u7eOZq2TUVbi3cz2ML/J8MGdlL7yw84dvxqV+Ussvpz2l35JzmcAj0ZHsRGKpi33BCIyxN78ehfdYdBQJ1q5IDmwRnrcRO1JUc7CCI2FJwRjxDsy/CJRKVdQWkLs2e1ZHh3mlvQZpqW+VrgXRzbKwEV7ubich6UgxiUTsOoQXj2QuzoR2iB+vMHDcvRaqB14kyfcU3JoeGSj1rR6cb1yhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHwtQoUXOLe8JsiTb5ocVLRP+W5abyHJLBWNclqbEuw=;
 b=k043BRLySF+Mkv6SuwGTu7mGkRk8F3zdLU0ZLKx2w2Hu6yqo6QL23oM2sc6BwR4iYI4KbyXiVHF/d9zbh7Bk+ft00gn1Jsu4VeXm4xubR3KvEYDxvBcFU/io7uUGfmVIwzQmajtMMATAnDceWmIHwHKBj1aZFcOq8+SYnilWWtY=
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
Subject: [PATCH v3 00/20] xen: introduce CONFIG_SYSCTL
Date: Mon, 21 Apr 2025 15:37:03 +0800
Message-ID: <20250421073723.3863060-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaeeb18-cb7d-4801-1207-08dd80a76824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B4G/rRsCNrNs6GWAFOIB4XFVL/9mhr6XudDfpMgsgnO132mZHAq+e4WHSF0Y?=
 =?us-ascii?Q?NjhDZdB7BgV+j3pUyHKNlaApvCtZFYSojd7erre+yB5YuzYm6sZzbRjqozP+?=
 =?us-ascii?Q?csxfIsDOgEM49pSW9ibLzFL5jxr96enLWw5JNTk79kGySBO+k//4zcEeqMaY?=
 =?us-ascii?Q?kh64VRdAMLVPklkgkayTCHezxZQUproLi8ODFEamArfLOVWnlBIYzQ06Rnsg?=
 =?us-ascii?Q?WqRmnylPl4uZBo8nHgCRN6QzojP9vQdIXbwxVGd7UA4Spr6/ZXX9pCKQ+T0w?=
 =?us-ascii?Q?ALMkfCiM1cw3tSFFKTV1DXqai1sqYmGQFijGDT+xFkL4bcDTILDzn7gS7rSi?=
 =?us-ascii?Q?IMG1kPXOtxxLLxiuEx4eRoAVMZgGwnvDDqv15dKCKSwDNhwWYhtL/txxfIa3?=
 =?us-ascii?Q?2tOHznIIqT34y7ecnG7qvfL3662g9NjHbDxpqo3jCVedWMH17nS+a7KcXdQP?=
 =?us-ascii?Q?dHSlvVbdIBfVV5ICrFJkRqCAP4Xli1X/cveR1xCdUOJop/e44tWsJrL5cCdQ?=
 =?us-ascii?Q?6qWFNq6DtYFoWTy1Pdqo0gG50w2g8sx87ULgIYeFtk7FBMlTo18/Uo7ZcEZ6?=
 =?us-ascii?Q?hsmv//X1dg0d4/ZdQ8q4PQJ3QN5PKdE9UAcEuAt9pAJTU1bHHvTgJCp+elQG?=
 =?us-ascii?Q?pAmGF+BoxeSKjV7FfzgcLFdhUexYveDu+r5a/at5KpFWF2CCJWlSMOJWrREq?=
 =?us-ascii?Q?8JuEkwl0DZBlQL6voG6lOjmC04G1/T9/uAFFsdBS7Xg86wrY7dbyV5ax1uVA?=
 =?us-ascii?Q?fs7et1BxG9P4GOv//DQC12WLZm5gY64tIukAOLMjwUzDI1tgduDfYq+u2ki4?=
 =?us-ascii?Q?AYiRyzmBbXP6DjRmGYAUISjlhKJaDbfzaa6gh+T6YhytCpw/4/BM/4lRhH7Y?=
 =?us-ascii?Q?h3PNgqSa64BVYY84XS3nEyyRLGDgPi9u2GP68wuorS0hXfz1HH7YOw2FCTeC?=
 =?us-ascii?Q?eyp2L30etFJjSvIg5kCsAd2nGlXMI8e7Si5uLrnpfrfzlALj7pLZCWdKkjTJ?=
 =?us-ascii?Q?pNyfc3lSzCmt2OWOt0PQVwVNo6rTycpWVPTccM4D7fMWP/sfNVECi38kk1de?=
 =?us-ascii?Q?Njo2N+VlAu7zpjHIZQOWSpo22MGybQf0sUV+MdejqX6QdH1zMQhNWqEtDWQ3?=
 =?us-ascii?Q?GyNwA7cS6kD1HF48JRqzRVtSJW/J2mIh5YntARf7vfoSvyx+8illCJ7jzdh8?=
 =?us-ascii?Q?ULFeav+BUSz46P0ICXO3lrCBmOY2O8nPoCaSoBM1AqS/ktH9nI4Tor+Gmru8?=
 =?us-ascii?Q?sA7yLWj7e1vGzkIrW1VjRtEvXvDYnKE2JivvlL3jUpbWK2r1PBJvcKJKwCMs?=
 =?us-ascii?Q?JXwy8Rbdw+pzTFWJD865peEbKChd5YFiopRUbXFBgw3L/BllqBOZGhB2i7JA?=
 =?us-ascii?Q?venhILn5P5Nauqop+EelOlRrRv2Z7g/rZQ64V4maxVQhwz6BeG3O4MjNQVrU?=
 =?us-ascii?Q?bAgQKKFnzIGhZSRcsPJiNbZgTY5FUgPSHocKw5jdeThyUZg1OiaUHnTdgCmS?=
 =?us-ascii?Q?EXUvWqIQApUKEdXwbjM//eS4BgK68FewNBUO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:37:45.1151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaeeb18-cb7d-4801-1207-08dd80a76824
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462

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

Penny Zheng (18):
  xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
  xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_readconsole
  xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_sched_id
  xen/sysctl: wrap around XEN_SYSCTL_perfc_op
  xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
  xen/pmstat: consolidate code into pmstat.c
  xen/pmstat: introduce CONFIG_PM_OP
  xen/sysctl: introduce CONFIG_PM_STATS
  xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
  xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
  xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
  xen: make avail_domheap_pages() inlined into get_outstanding_claims()
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
 xen/common/sysctl.c                          |   7 +-
 xen/drivers/acpi/Makefile                    |   3 +-
 xen/drivers/acpi/pm_op.c                     | 409 ++++++++++++++
 xen/drivers/acpi/pmstat.c                    | 559 ++++++-------------
 xen/drivers/char/console.c                   |   2 +
 xen/drivers/cpufreq/cpufreq.c                |  31 +
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                | 203 -------
 xen/drivers/video/Kconfig                    |   4 +-
 xen/include/acpi/cpufreq/cpufreq.h           |   5 -
 xen/include/acpi/cpufreq/processor_perf.h    |  14 +-
 xen/include/hypercall-defs.c                 |   8 +-
 xen/include/xen/mm.h                         |   1 -
 xen/include/xsm/xsm.h                        |  18 +
 xen/xsm/dummy.c                              |   6 +
 xen/xsm/flask/hooks.c                        |  14 +
 39 files changed, 804 insertions(+), 648 deletions(-)
 create mode 100644 xen/drivers/acpi/pm_op.c

-- 
2.34.1


