Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1587B50FAE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117573.1463648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQ5-00061R-Ev; Wed, 10 Sep 2025 07:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117573.1463648; Wed, 10 Sep 2025 07:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQ5-0005z0-AS; Wed, 10 Sep 2025 07:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1117573;
 Wed, 10 Sep 2025 07:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQ3-0005yo-TA
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a183332-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:05 +0200 (CEST)
Received: from SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::20)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:00 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::19) by SJ0P220CA0013.outlook.office365.com
 (2603:10b6:a03:41b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:38:59 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:38:51 -0700
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
X-Inumbo-ID: 3a183332-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7pjUR1xiJYV84RJKpDjO61360xjrzptu23HzBmPZ+nu9umuhZnOAs62VvUPxpEid+s4X1/O1eOld8vcIYggXduMd75wIH6UT+VqaoGtLSw87U0IoMs2OAAjAwfObVVYaXFeSdWTgKuCWOi/DpwqOuDrEH+Y6VMyQuJnUxRa9/fDQwP66yGasPM0YqmlnE/Qj3sDoevuHv8zVENkPYwBkmsFT14IIDQQsxy/qq0suzAigSJx3Mh7bh9JiIcMOGJjRqpgODG9zwNMZqpQZYxNnx13uv3wsodmyMnr96lhgTbcBv45zHvSIUyEwrPl6VYfu58JJaKWkZ9RmoQ/zyAzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylJOAkC+9Y2pugvuLeeDf16FjlbynvMsbrnjYJVPdNA=;
 b=qBZmgokhC5B+8PV+/ffvVKZkB04rpcX+GqGGVIHPcbbKGJIpWpE/6QYlsEgoXWKR9J8xNLCPv51pnwHBu8ce4gLBLD3n7kySx1WkpocTSlHeyJXk7eQp+HKQSmcd3Pgh88gwP3a1fA2ArD7UAw6y/e5En34RVhQo3CGaTOCtFRTG2B87qp35pXbRUiWYlbdFy5R7MWTm6rYkHMwDgwqa8AvBvS79NzIWLDaRr/sNqUi3nj/qfqTabJEz0tko9nVYujR86c2P86CjanUukVr/BwpRVOYKAmO7t6N4nfkOYQINLx57x8gGfsTK6iKBierreAZzz4uOPr4/u49gLZVtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylJOAkC+9Y2pugvuLeeDf16FjlbynvMsbrnjYJVPdNA=;
 b=jiu6Z/i9YPlVcQsmNQXNTOKkDAlTlRYAv1pFiZjhi7ZXDpZcJn7nzVDCYbp0BDzO6j7rAgmf/zCoqeimymtMVLaauHparV2WZRImmbPq1sR7CvovxsjTwvRA7OamWfEvrDHg6CjyLXgaHJOWPZ5bjaJCeISrza5f3CoYsl1iVKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Nathan Studer
	<nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "Tamas K Lengyel" <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Meng Xu <mengxu@cis.upenn.edu>, Rahul Singh
	<rahul.singh@arm.com>
Subject: [PATCH v2 00/26] Disable domctl-op via CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:01 +0800
Message-ID: <20250910073827.3622177-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9549af-3cae-463b-1618-08ddf03d1b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uE5QUSGhDGo+C4Ob24HGYuMKyjeO7EL1V/UWxWrpXwHndyPmbJT4L7M0Jwlu?=
 =?us-ascii?Q?tJ+twlDvoWcXF0RAqOwbmLM2BosWxZvTKVT1Aax+m9jHphLErfefd8d3SpwG?=
 =?us-ascii?Q?UqCT5ZzhSkr+urHN7Ys8eD3jVtyhbLm7KkVUoJMdLb/nC46a78BcHSfQ0npW?=
 =?us-ascii?Q?Bc9El2E6BqIRZa0N+WOxyEm+dZpFcI4VsseodtFB6wCKs1uXoyuN9fEWaOJr?=
 =?us-ascii?Q?GqtPAAPBJE7yJIIJlM5qTl5XfMLL7JQbgDYV6E7lDUwwsFttuatFuXcZhyXd?=
 =?us-ascii?Q?4By5FiuD1M+gtm/aZ09Odex1yZocvq4Jrbz/Wk770VowDmuE5VmOXn8iIiGF?=
 =?us-ascii?Q?4/AWO0OJuCe3xFD6b4WBB5CvAP/jFyzGOKhEpaYDnMcEZMHv8ADeonOlLezt?=
 =?us-ascii?Q?GfIjvsijKeyDYkBN4Ov1mLhQuhD112B2EeITZD+oXVULrgjAwZ64O2CcWdmp?=
 =?us-ascii?Q?kB8teXvzvn0T/qbkQD0DPq8yi8PUvCdyHei/3YxSd37mDCzCpeYov9tGykfk?=
 =?us-ascii?Q?tsk1PophSe+eykvutw+JodwmtcRbL8o8/+HdZyhQ/O1rTFDNmLkdfo70e3VF?=
 =?us-ascii?Q?hrZ4B6zKDe6mm/O6Lng4iuidjO4Hxh10MMU/FSlgv6pC3PyDSx9P+7mSYzWK?=
 =?us-ascii?Q?nebg5qC0BVKwuPctdUxHviagLiDugqJlIZwS6HJP6OgBw9Zf5xVgOiVV0arC?=
 =?us-ascii?Q?LLpmHoAUhel9K4inPNDm0qzSoIJ5ingn1SGvkXzwQu9NsmXp/Tq2DdJmzY28?=
 =?us-ascii?Q?ZRQYu5PdvZ2oNQma5P8uHg4mGJErkIqfBkIEBHRcTg24KAx52TMt4ExswAiQ?=
 =?us-ascii?Q?nZgpdlEWaReQmtE4GpDKAKGIkCCNMvIx7/QBEZGFARH564bGi99qUlx34I28?=
 =?us-ascii?Q?YjiM6U6iOKolN2GgdRnRh7UNEgZEcwRXP15spCKGRvhskCGCqAQfDwf4iffu?=
 =?us-ascii?Q?u0fGxCRFWDaFl3ixXepAOoby8rBnYB4NkBLmm3ceB5KK5qd662Y6vOmIJOJb?=
 =?us-ascii?Q?fiUcI/6uACdTqB4W6ovgagJg5zFfGEJ56aM8YJ8paJizkJJM6CzxviokM4WA?=
 =?us-ascii?Q?hWYyY7USyWVPZH1Mv2OGH9r7APpQhIlpUfBt1l1jLI90IWJ3p4Je9sRq6zy7?=
 =?us-ascii?Q?WdeDj4Fvxq/UT1gfC7al8suTgKWtJAz2FjYqQba2gzX3TzvAqQiyu1nokMi9?=
 =?us-ascii?Q?Qk5XeWsNGgGmXE6E/w1XFqkBwKZ2AcjqUZPlfO4Pl28rkGObCcxTwPqKhtnG?=
 =?us-ascii?Q?mgjBtxVEOHA34oaknUIuLRBYno2zFvzf5ERpmCyMx/NLc4gXVSIrNt0HQnoC?=
 =?us-ascii?Q?PdgASco6wohQ4flR8FpdSOWEKttVsXBJ5/D74Xjs7PKOcp/aoscZHQIGM4Fa?=
 =?us-ascii?Q?3sFQDAJNdOqPWqhYWKT0fmlI/dawPHpgVx64WQIDYD5HJ2YfUJRpjMnhQyou?=
 =?us-ascii?Q?b5tI69k+VZkf7Ph8CxZ2XbVD3rXGbQH97HCFSUX6yqm8xkvhILWxyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:38:59.7345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9549af-3cae-463b-1618-08ddf03d1b46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669

It can be beneficial for some dom0less systems to further reduce Xen footprint
via disabling some hypercalls handling code, which may not to be used &
required in such systems.
We are introducing a new single Kconfig CONFIG_MGMT_HYPERCALLS to manage
such hypercalls.

We are trying to disable hypercalls in the following aspects:
- sysctl
- domctl
- hvm
- physdev
- platform
This patch serie is only focusing on domctl-op. Different aspects will be
covered in different patch serie.

Features, like VM event, or paging log-dirty support, which fully rely on
domctl-op, will be wrapped with CONFIG_MGMT_HYPERCALLS, to reduce Xen
footprint as much as possible.

It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

Penny Zheng (26):
  xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
  xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_DOMCTL
  xen/x86: consolidate vram tracking support
  xen: consolidate CONFIG_VM_EVENT
  xen/x86: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
  xen/xsm: wrap xsm_vm_event_control() with CONFIG_VM_EVENT
  xen/domctl: wrap domain_pause_by_systemcontroller() with
    MGMT_HYPERCALLS
  xen/domctl: wrap domain_soft_reset() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap domain_resume() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap domain_kill() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap domain_set_node_affinity() with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap vcpu_affinity_domctl() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap sched_adjust() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap arch-specific arch_get_info_guest() with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap xsm_{irq_permission,iomem_permission} with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap arch-specific domain_set_time_offset() with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap xsm_set_target() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap xsm_getdomaininfo() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap set_global_virq_handler() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
  xen/xsm: wrap xsm-iommu-related functions with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap arch_{get,set}_paging_mempool_size() with
    CONFIG_MGMT_HYPERCALLS
  xen/x86: make CONFIG_X86_PSR depend on CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap arch-specific domctl-op with CONFIG_MGMT_HYPERCALLS
  xen/xsm: wrap xsm functions with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap common/domctl.c with CONFIG_MGMT_HYPERCALLS

 xen/Kconfig.debug                           |  4 +-
 xen/arch/arm/Makefile                       |  2 +-
 xen/arch/arm/arm32/Makefile                 |  2 +-
 xen/arch/arm/arm64/Makefile                 |  2 +-
 xen/arch/arm/domain.c                       |  5 ++
 xen/arch/arm/include/asm/tee/tee.h          |  2 +
 xen/arch/arm/mmu/p2m.c                      |  8 +++
 xen/arch/arm/mpu/p2m.c                      |  2 +
 xen/arch/arm/tee/ffa.c                      |  4 ++
 xen/arch/arm/tee/optee.c                    |  4 ++
 xen/arch/arm/tee/tee.c                      |  2 +
 xen/arch/arm/time.c                         |  2 +
 xen/arch/riscv/stubs.c                      |  4 +-
 xen/arch/x86/Kconfig                        |  1 +
 xen/arch/x86/Makefile                       |  6 +-
 xen/arch/x86/configs/pvshim_defconfig       |  2 +-
 xen/arch/x86/domain.c                       |  4 ++
 xen/arch/x86/emul-i8254.c                   |  2 +
 xen/arch/x86/hvm/Makefile                   |  4 +-
 xen/arch/x86/hvm/hvm.c                      |  4 ++
 xen/arch/x86/hvm/pmtimer.c                  |  2 +
 xen/arch/x86/hvm/save.c                     |  2 +
 xen/arch/x86/hvm/svm/svm.c                  |  8 +++
 xen/arch/x86/hvm/vmx/vmx.c                  | 16 +++++
 xen/arch/x86/include/asm/hvm/hvm.h          | 20 +++++++
 xen/arch/x86/include/asm/hvm/monitor.h      | 65 ++++++++++++++++++++-
 xen/arch/x86/include/asm/hvm/vm_event.h     |  4 ++
 xen/arch/x86/include/asm/mem_access.h       |  9 +++
 xen/arch/x86/include/asm/monitor.h          |  7 +++
 xen/arch/x86/include/asm/p2m.h              |  6 +-
 xen/arch/x86/include/asm/paging.h           | 34 +++++------
 xen/arch/x86/mm/hap/hap.c                   |  4 +-
 xen/arch/x86/mm/mem_sharing.c               |  4 ++
 xen/arch/x86/mm/p2m-pod.c                   |  2 +
 xen/arch/x86/mm/p2m.c                       | 30 ++++++++++
 xen/arch/x86/mm/paging.c                    | 36 ++----------
 xen/arch/x86/psr.c                          | 18 ------
 xen/arch/x86/time.c                         |  2 +
 xen/common/Kconfig                          | 22 +++----
 xen/common/Makefile                         |  7 +--
 xen/common/argo.c                           |  2 +
 xen/common/device-tree/device-tree.c        |  2 +
 xen/common/domain.c                         | 10 ++++
 xen/common/event_channel.c                  |  2 +
 xen/common/grant_table.c                    |  2 +
 xen/common/page_alloc.c                     |  8 +--
 xen/common/perfc.c                          |  4 +-
 xen/common/sched/arinc653.c                 | 10 ++--
 xen/common/sched/core.c                     | 10 ++--
 xen/common/sched/cpupool.c                  | 16 ++---
 xen/common/sched/credit.c                   | 10 +++-
 xen/common/sched/credit2.c                  | 10 +++-
 xen/common/sched/private.h                  |  6 +-
 xen/common/sched/rt.c                       |  4 ++
 xen/common/spinlock.c                       |  4 +-
 xen/drivers/char/console.c                  |  4 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  8 +++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c    |  6 ++
 xen/drivers/passthrough/arm/smmu-v3.c       |  4 ++
 xen/drivers/passthrough/arm/smmu.c          |  4 ++
 xen/drivers/passthrough/device_tree.c       |  6 ++
 xen/drivers/passthrough/iommu.c             |  2 +
 xen/drivers/passthrough/pci.c               |  6 ++
 xen/drivers/passthrough/vtd/iommu.c         |  6 ++
 xen/include/hypercall-defs.c                | 14 ++---
 xen/include/xen/domain.h                    | 13 +++--
 xen/include/xen/mem_access.h                | 35 ++++++++++-
 xen/include/xen/monitor.h                   |  8 ++-
 xen/include/xen/vm_event.h                  | 24 +++++++-
 xen/include/xsm/xsm.h                       | 58 +++++++++++++-----
 xen/lib/x86/Makefile                        |  2 +-
 xen/xsm/dummy.c                             | 16 ++---
 xen/xsm/flask/hooks.c                       | 44 +++++++-------
 73 files changed, 522 insertions(+), 202 deletions(-)

-- 
2.34.1


