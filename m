Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D2C78960
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168572.1494540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqZ-0007Ut-Di; Fri, 21 Nov 2025 10:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168572.1494540; Fri, 21 Nov 2025 10:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqZ-0007TM-Aj; Fri, 21 Nov 2025 10:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1168572;
 Fri, 21 Nov 2025 10:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqX-0007TB-CZ
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:33 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 034ccf21-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:58:30 +0100 (CET)
Received: from SN7PR04CA0005.namprd04.prod.outlook.com (2603:10b6:806:f2::10)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:58:25 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:f2:cafe::2) by SN7PR04CA0005.outlook.office365.com
 (2603:10b6:806:f2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:58:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:24 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:18 -0800
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
X-Inumbo-ID: 034ccf21-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtJUTDKk8SepobQ1k2Kw+kGIdij+L4EoK5WS1PgvWNaL/0r6Lb5B4Yr+BVkfSiQw/nZ3+3CpDNMmuV/A6xNU3yVE7wgzokAztTHgE/gqOb4z4Or8TBthzRGn+2sT0IPe5woI3r1BSyhmKmTLZP1LyI+HX8AQeD9pwM5/m5Qq7QPWP52xNIP7GgUYmCDe468XMTfdAHrmVD0Zrhmzokx5QOc9YAduJETo/iQRIHR7T4dvIezEZb1/CrSvCrr67PgAewTqN/ZTK4ECJRTcikBIQ1sEuWFgLDfUd82Nec0vXIlylofTLgDNChXYIcTYVyfF40CiOVxms45j8qdzztTnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/ICZEYJIc/nVeFvpt8PzQMJ9pR5CWGfMKwhk5DYjg4=;
 b=u1ht+PUYjSyNo/t1MxuuisDHTUU5czsx2dOQ5OcgxouB3K0/AHdDyUrr07sRnUIZJoYrzUiCCaNWTTmGpGNQFwVGn4adZ1AydJd5C6MJCPAqcvchpb1u4HaFbz5Z0rgrspq2xusEdJaGPFCz1xXP28ag7rCSsQ3QAygm2+j32KaEiG57Fiy32kPOMNnKTB+fXBYkS0VcNgQ3s+/f4lTIzWrw8spM5lxShKYHALKvWi3LF6bS2j/WOSLxmEtUifthc2V4JwH8c4agYRguCobkJnVjXRXyfYoSon15sppVZN92SAPaTOQp/7aoeSPTjXUpKuUIGVRd1R9YS/re3X0H8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/ICZEYJIc/nVeFvpt8PzQMJ9pR5CWGfMKwhk5DYjg4=;
 b=U9DtWUNZ+p4YgvaL51IyF659nsuoqlvDKBPJQAUuic3rYOMGujjRb0EwSKd++7YTNhs0M6GopLoZLlG/spZB459SaT3USBErwH1zKS3wYH8CrjWb4UxUicodj7anAdJoJJvLeXFHjj3jLSpC8GgB2FsIrYlnYwDiz3vyhkORyIE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Juergen Gross <jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, "Meng Xu" <mengxu@cis.upenn.edu>, Jason
 Andryuk <jason.andryuk@amd.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v4 00/24] Disable domctl-op via CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:37 +0800
Message-ID: <20251121105801.1251262-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: e343590e-1de5-4d0e-1541-08de28ece4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ke7Gmthyo6ow8Q4JznIIYj/nNmhpq3JenJ+b/rhqC0/wdQrSlJAF86GgkqhO?=
 =?us-ascii?Q?8H7Ch3EpAxPAdxPHNnRNuZ6ylxDbvJWbjpU1PAd4pr2sWpAge7tbRuSeZbkF?=
 =?us-ascii?Q?SfIKKX5p2WcxKF73q8+z83gE/hvMRv1MFiYBOPkkgAJPhURd9mWFJvw+mrad?=
 =?us-ascii?Q?IkGaFVelP48X/ybhM9ovGWYWVlqgPuxj2ObmZdjuRYKsgZSi2W8JCxcIURNR?=
 =?us-ascii?Q?o6qKQHK+NTfk4tOi5BRLAALLKaFG2danSYzhuwa4DEaAEtHfIg9scnwcTPED?=
 =?us-ascii?Q?KwZDGuHmc38RYbIKpE8NyhSJSRS29yuwr7hQH695HP5V4Y00/H0ggtZLmn3g?=
 =?us-ascii?Q?0M8aKDR9m9h7XYdK4qXFy/sMsjEZrfWNAaB8wvBRjddLAOHcWGVXfk4xExtE?=
 =?us-ascii?Q?6qxL9SoOo4p69LdW1MlzUVccsU249m+UPj8bZciLV8nuunaIvpDNxNh+r+fh?=
 =?us-ascii?Q?3yeXvKrUsS3pZN3A2AlptBMEDBszyJIbJQ+1ljP9wBEG+jQb9gJsPXjCZdgK?=
 =?us-ascii?Q?21QhVnitnzIFNrk11qmcxKJ2Lh5gMDl1sVPi5Nldx0yxzDSCEkv2AlJw2b+e?=
 =?us-ascii?Q?CT++rrDmNuSNq3EXMHU5BcD4Eo6DRmTPyqVHrUjywYHokJ5oDHIZUBmoiMuy?=
 =?us-ascii?Q?+X/eEKqBcbKfbDa+Ov/Cc+iUTK01xVQmScSExnTncQxsoTH4CAie3N1HbNf3?=
 =?us-ascii?Q?Lsj062fUxp0xmCUIrOIHkMynNgeEBXFB1Ojvl+Cdzqa0msMBRR8kl5UnWDP5?=
 =?us-ascii?Q?mJPo5xCHJa24ekgefEB+Ga4f+xFYtsLECT0gyONZUPI4X17Itl53e63sFXJS?=
 =?us-ascii?Q?GpZZc7gx6On33f+ri8GEqnRGcTNAKkaq/jo5soS8/YOKAH9+qTHngKH6h3YN?=
 =?us-ascii?Q?xfTQN3z4gOBLe3k6TOJDH5sBNEs5/6uGFPyvPnTBoNaanTHPklnqkKR0BA5K?=
 =?us-ascii?Q?7Enr3/GRa4lkOrOjDRRqj1NYcF1yUNT4LAuN0Ue46WP0Q/mBiF8xKIT8oJ4K?=
 =?us-ascii?Q?taugGqf+J0ijTIb61iwQx/I+FJguu0bXuJGIOdRvxkQzzpwfuZHpq5nap3Ck?=
 =?us-ascii?Q?+c968ZpfWCdvm/lHdN+bcgnb2aKT9m006GstB9K3kr7NsI0gkMxH/mLiP4Ow?=
 =?us-ascii?Q?QiFMs65b1zT8Q4cpswHy+fhVOOBxgzyjfcFjf59crtkwNN66Y26PwWCu392d?=
 =?us-ascii?Q?GdXmXDv/aGpppA4aFcuQHbgpoidwtf48PwDOJ09Q0zPyrzP2mmr3bRm7Gegm?=
 =?us-ascii?Q?bVg7lorD1x7w27UZYEVscpmwm2C/babLxRj5eUNcgHAp6UW/tIyqca/PMZ2Q?=
 =?us-ascii?Q?/lNkmDHyekmU3HtMfC55XTPGvtHeDIOk/fdnpS3+Nhs9xSQVwWUxllri7EYF?=
 =?us-ascii?Q?yCPGtpaY3T9fODwkXKss/HCALA2pibryvP7QrZsa9+MWadtN02KDx2mVRJ3g?=
 =?us-ascii?Q?XDuuLHfHh0H99UX4uLQGSEloFprXc9IPlrK6bCAPzEq9RGQs2gG9R9vXfrdV?=
 =?us-ascii?Q?PxjoVow3gbxtj5Urq7mZCbOKvX22GG7srG4teg+TSUj5ya6qDqDEekgrcISa?=
 =?us-ascii?Q?rJ1uMdq1SqtTnIAxEkQo/wfCylpXCTqRxEL69R97?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:24.7355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e343590e-1de5-4d0e-1541-08de28ece4bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190

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

It is derived from Stefano Stabellini's commit "xen: introduce kconfig options
to disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)
---
This patch serie is based on two patch serie, one is
"[XEN][PATCH v4] xen: make VMTRACE support optional" and "
[PATCH v3 0/7] consolidate vm event subsystem"
---
Penny Zheng (24):
  xen/xsm: remove redundant xsm_iomem_mapping()
  xen: consolidate cpuid library
  xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_HYPERCALLS
  xen/domctl: make MGMT_HYPERCALLS transiently def_bool
  xen/vm_event: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
  xen/domctl: consolidate domain.c with MGMT_HYPERCALLS
  xen/mem_sharing: make memory sharing depend on MGMT_HYPERCALLS
  xen/domctl: wrap domain_kill() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap vcpu_affinity_domctl() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap sched_adjust() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap xsm_irq_permission with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap arch-specific domain_set_time_offset() with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap xsm_set_target() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap pci-subset iommu-related domctl op with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap device-tree-subset iommu-related domctl op with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap arch_{get,set}_paging_mempool_size() with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: make CONFIG_X86_PSR depend on CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap hvm_save{,load} with CONFIG_MGMT_HYPERCALLS
  xen/x86: wrap x86-specific domctl-op with CONFIG_MGMT_HYPERCALLS
  xen/arm: wrap arm-specific domctl-op with CONFIG_MGMT_HYPERCALLS
  xen/domctl: domctl_lock synchronization only when MGMT_HYPERCALLS=y
  xen/domctl: wrap common/domctl.c with CONFIG_MGMT_HYPERCALLS
  xen: move MGMT_HYPERCALLS out of PV_SHIM_EXCLUSIVE

 tools/fuzz/cpu-policy/Makefile               |   2 +-
 tools/fuzz/x86_instruction_emulator/Makefile |  10 +-
 tools/libs/guest/Makefile.common             |   2 +-
 tools/tests/cpu-policy/Makefile              |   2 +-
 tools/tests/x86_emulator/Makefile            |   2 +-
 xen/Kconfig.debug                            |   3 +-
 xen/arch/arm/Kconfig                         |   2 +-
 xen/arch/arm/Makefile                        |   4 +-
 xen/arch/arm/arm32/Makefile                  |   2 +-
 xen/arch/arm/arm64/Makefile                  |   2 +-
 xen/arch/arm/domain.c                        |   3 +
 xen/arch/arm/include/asm/tee/tee.h           |   2 +
 xen/arch/arm/mmu/p2m.c                       |   8 +
 xen/arch/arm/mpu/p2m.c                       |   2 +
 xen/arch/arm/tee/ffa.c                       |   4 +
 xen/arch/arm/tee/optee.c                     |   4 +
 xen/arch/arm/tee/tee.c                       |   2 +
 xen/arch/arm/time.c                          |   2 +
 xen/arch/ppc/stubs.c                         |   2 +
 xen/arch/riscv/stubs.c                       |   8 +-
 xen/arch/x86/Kconfig                         |   3 +-
 xen/arch/x86/Makefile                        |   4 +-
 xen/arch/x86/configs/pvshim_defconfig        |   2 +-
 xen/arch/x86/domain.c                        |   2 +
 xen/arch/x86/emul-i8254.c                    |   2 +
 xen/arch/x86/hvm/Kconfig                     |   3 +-
 xen/arch/x86/hvm/hvm.c                       |   7 +-
 xen/arch/x86/hvm/pmtimer.c                   |   2 +
 xen/arch/x86/hvm/save.c                      | 154 +++++------
 xen/arch/x86/include/asm/p2m.h               |   2 +-
 xen/arch/x86/include/asm/paging.h            |   2 +-
 xen/arch/x86/mm/p2m-pod.c                    |   2 +
 xen/arch/x86/mm/p2m.c                        |   2 +
 xen/arch/x86/mm/paging.c                     |   4 +
 xen/arch/x86/psr.c                           |  18 --
 xen/arch/x86/time.c                          |   2 +
 xen/common/Kconfig                           |  28 +-
 xen/common/Makefile                          |   7 +-
 xen/common/device-tree/device-tree.c         |   2 +
 xen/common/domain.c                          | 116 ++++----
 xen/common/domctl.c                          |   2 +-
 xen/common/page_alloc.c                      |   8 +-
 xen/common/perfc.c                           |   4 +-
 xen/common/sched/arinc653.c                  |  11 +-
 xen/common/sched/core.c                      |   8 +-
 xen/common/sched/cpupool.c                   |  16 +-
 xen/common/sched/credit.c                    |  10 +-
 xen/common/sched/credit2.c                   |  10 +-
 xen/common/sched/private.h                   |  10 +-
 xen/common/sched/rt.c                        |   4 +
 xen/common/spinlock.c                        |   4 +-
 xen/drivers/char/console.c                   |   4 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c  |  20 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c     |  26 +-
 xen/drivers/passthrough/arm/smmu-v3.c        |   4 +
 xen/drivers/passthrough/arm/smmu.c           |  55 ++--
 xen/drivers/passthrough/device_tree.c        | 108 ++++----
 xen/drivers/passthrough/iommu.c              |   2 +
 xen/drivers/passthrough/pci.c                |  52 ++--
 xen/drivers/passthrough/vtd/iommu.c          |   6 +-
 xen/drivers/vpci/header.c                    |   2 +-
 xen/include/hypercall-defs.c                 |  14 +-
 xen/include/xen/domain.h                     |   4 -
 xen/include/xsm/dummy.h                      |  29 +-
 xen/include/xsm/xsm.h                        |  60 ++--
 xen/lib/x86/Makefile                         |   7 +-
 xen/lib/x86/cpuid-generic.c                  | 273 +++++++++++++++++++
 xen/lib/x86/cpuid.c                          | 260 ------------------
 xen/xsm/dummy.c                              |  21 +-
 xen/xsm/flask/hooks.c                        |  54 ++--
 70 files changed, 812 insertions(+), 708 deletions(-)
 create mode 100644 xen/lib/x86/cpuid-generic.c

-- 
2.34.1


