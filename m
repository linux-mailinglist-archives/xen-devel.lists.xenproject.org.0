Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E6ECB7D40
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184892.1507175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQI-0007GK-MW; Fri, 12 Dec 2025 04:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184892.1507175; Fri, 12 Dec 2025 04:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQI-0007Dr-Jl; Fri, 12 Dec 2025 04:06:30 +0000
Received: by outflank-mailman (input) for mailman id 1184892;
 Fri, 12 Dec 2025 04:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQH-0007Dl-N1
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:29 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee0cbd0d-d70f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:06:27 +0100 (CET)
Received: from MN0PR04CA0028.namprd04.prod.outlook.com (2603:10b6:208:52d::27)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 04:06:21 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::45) by MN0PR04CA0028.outlook.office365.com
 (2603:10b6:208:52d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 04:06:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:21 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:15 -0600
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
X-Inumbo-ID: ee0cbd0d-d70f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ9golsnhrwVdhgGRiqsCiMP5QhzLOagVoErBH41484mASf7fLpgHu7HB4M40tQ10BP72vjL1McJEVhfGy6uC+x8Z8oETqgBUwMDA4KEpqOrKvOChBqWHHv4cZ1zfIGeOaTojjuqM+6ojOLPgYYw8FjEmaCRdT29qs0Ly6/+ZPD/ag0GTCQXNlOlN/bpp8Iu7eNWlr/jUO/sFYO/wDbzq29eJGFCbVvXmWLWk52L1T/TzBX9E87/UbDYWS8TMsikR6cHRUIaboahOUrADXSkjXhoIk46akuEcfPJtYfD77oEUf+5Ab9e1KC1Ag7kPBjwf+Qo3iGVS3hA1rBcrRY4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6B+fNWpx31hMHg3dP8sP4vDat2ye+/ctgcn3sOSvSs=;
 b=DLestk2Jkvz38DuUEH9UjsyFaHnfd70/Wcnjzf36408Ox59eeCxPU9rWq9//5T3mmHSNMN+xFU0+qApxFzihbAsqv9gQ1motKeTphVI70SdynbsjTGBrXQ/tn5tXulStKCFR9fmfECTb6bX4nFceh6os1q/hkL7OQO1xyobmNL+P4LJmHf2wBSTJMyP+MqUDOmbZgV4GKSeha2T1+CzfSm3MJqml9R4zbCeaQxjrfT+6Vdi7u/CpjxRVNpS4DyJWV0afxxK23pfO7P06sdNP3qVLps97UJbmD5Cw7PBbhfn3FOBiCg5k5lPs1RUBtQC5vfCdUjYkIKW1g2CF3+tQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6B+fNWpx31hMHg3dP8sP4vDat2ye+/ctgcn3sOSvSs=;
 b=Qi1Pqd5qXgzaeseBA0NPPKqIBIN6qoTL84jvpjQsicSGKJHTpWqCVuRCtOXRP9D+TM/O60NjUja9F49hNAAlKZhAuflsgERi9o10o5boQUI8LvGuHob6c0nBpaNOOggoKpaKfo7WeKfUJLsq6XQKRYAMSdeqQVjy7cy9MkGBpaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Juergen Gross" <jgross@suse.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Nathan Studer
	<nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>, Dario
 Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>, Timothy
 Pearson <tpearson@raptorengineering.com>, "Meng Xu" <mengxu@cis.upenn.edu>,
	Jason Andryuk <jason.andryuk@amd.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v5 00/24] Disable domctl-op via CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:45 +0800
Message-ID: <20251212040209.1970553-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf46fcc-383c-4886-3c2e-08de3933cf1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RXtjU9ljONfId2jS8Nqu3vYqPdgPjzrfvTBDwIa8DfI59KtfbMGqefsS6pQF?=
 =?us-ascii?Q?dTOC6NUri47oJXg2sxa+JpmXvqNCwzk2HCGI647ZZbxPXIydtLBlcEVjr5RF?=
 =?us-ascii?Q?5MxYrXMmoOZ5ZfdhdWEqyp00MPAVAvnRbbz8n3xsqcRoY2NxgqHDW5E91Bg2?=
 =?us-ascii?Q?bb8WivK4KiwJuA6eTcynDTDcNN4n+zn/SVQsxBeRGj+L9ZQpOMKv+KB+FDDS?=
 =?us-ascii?Q?gPBQjdlT0QHZKU7TBQ7GD/SdE6KFTctO0FSrZDwA+DO0DP+6cy9GM1bp8EB9?=
 =?us-ascii?Q?8CiqmO2veYnqF1mdwIC8f4I/SMAXp36TrsHtVtnHg+FpKr1VHSoUmTc24zKE?=
 =?us-ascii?Q?nAw4DTXL7H90JrB8n0jyAd4HQPc+OYBdRh1fAFL9iSvPFTmIASBhC/+pCmVb?=
 =?us-ascii?Q?kgvPVwDrp39MsGyI6U7/bbNpPOZhg3kaNc8+D/Oj7P9s3w3aVppirjPy8HV2?=
 =?us-ascii?Q?GojIFUddhQgwK2307INpuRtvlV5Bq2ywMdUF9QgYXov0pkqtzRXrvoDqsGWa?=
 =?us-ascii?Q?zlupIwQHVUzwIfQeHusVPr7HZMG3+jfPyvOlrQ1bC3CN78jEY03Sntm3ePyv?=
 =?us-ascii?Q?NLfuc3yOEOo0unzE0yz5Du+CgZf33BnQ4R044rQDZEuj4DOQ/QEFbZC3qlGf?=
 =?us-ascii?Q?pL50g4A3IX04eRduTzXA9C42nZR6B4lQUULLZikN+/UMblAazsqrDbm7EmKU?=
 =?us-ascii?Q?6upjazGzFKPP0YalWZwo77kTIQGZEzTege/9pgPbOBULhVg4fMSp1TrHgcA6?=
 =?us-ascii?Q?qlnEDfC6YBUianHY1QIO8R/NzFyBgmriS1YuV63KtdninTGJ6VcyXa1yy67O?=
 =?us-ascii?Q?ZL2x7dtM2jXEgvl3MoIKZFQrNZrIsYMSOBTcMlXOSO1QQsCbQ/mnxKG1mkjq?=
 =?us-ascii?Q?8T/rL1QJl/Lqm9eRs5KpANS/HCtbZtp1xlxi4Jl0vbck2uKZpGkC8HDGDU7K?=
 =?us-ascii?Q?P9nA9Oi2dG720RWK9sqVo3O+YVwX0NKfuXNMyvPQrVu5wz5KVr1wVi6cvrzG?=
 =?us-ascii?Q?x4odiIqMcgXGMMEvGww3GXRyixQT/EeYVbfRRIhKA29JrBoOsxjEAhZLDJyh?=
 =?us-ascii?Q?bRkFqp3YiFpFWGSuOJvIDvBUjBE67etOeeOVWlx/hLdBwG9BAud0u1L1Q2Bb?=
 =?us-ascii?Q?9OY+t54J5kY4A2/KWqykCM6Y22YkxM5UTbnIlGCZQtODo2nuluAkOuIBQodG?=
 =?us-ascii?Q?98YJE5OETiLBT7V1kmD4+gcKupm2dBSUkz0JJDgK+eLRuyhpk4eBtVDVvQ4T?=
 =?us-ascii?Q?W/PAA3T31vjSoR4PDfAvyreWRdNgbjvHz5bfEtfaHNbyD8OPiLDWd624iOcM?=
 =?us-ascii?Q?Dj2cukPt+kIQCMDYm9Nutp5d24dX9y9tW0pew622KiEndd1n3MxxtiOKzGJX?=
 =?us-ascii?Q?/Gz6Q76qEVbdAU4TtUCYsYsszW+Oh6StEwnNKBxdDjpNBJfIQikNbIRVyTA6?=
 =?us-ascii?Q?Ws4tBNMeVuRRe+Zql8nM+BRuOkhBhmInmrs2+il3e+fyEMXv6GtR/DtEjbhj?=
 =?us-ascii?Q?Auc52x+Q4oC0lfVgUgXAPJ2dF0Xe68g9y0/Rx4ZelkDBGJ2apyafM7xEA6j6?=
 =?us-ascii?Q?ydL6j8N6Yc7kEsspREPUzrOA3I8y2JcuubI/UmPS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:21.3489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf46fcc-383c-4886-3c2e-08de3933cf1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017

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
This patch serie is based on "[PATCH v3 0/7] consolidate vm event subsystem"
---
The following commits are prerequisite, and could be committed independently:
- xen/xsm: remove redundant flask_iomem_mapping()
- xen/x86: library-fy cpuid-releated functions
- xen/arm: move dt_find_node_by_gpath() to passthrough/device_tree.c
- xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_HYPERCALLS
---
Penny Zheng (24):
  xen/xsm: remove redundant flask_iomem_mapping()
  xen/x86: library-fy cpuid-releated functions
  xen/arm: move dt_find_node_by_gpath() to passthrough/device_tree.c
  xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_HYPERCALLS
  xen/domctl: make MGMT_HYPERCALLS transiently def_bool
  xen/vm_event: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
  xen/domctl: consolidate domain.c towards MGMT_HYPERCALLS
  xen/mem_sharing: make memory sharing depend on MGMT_HYPERCALLS
  xen/domctl: wrap domain_kill() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap vcpu_affinity_domctl() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap sched_adjust() with CONFIG_MGMT_HYPERCALLS
  xen/xsm: wrap xsm_irq{,iomem}_permission with CONFIG_MGMT_HYPERCALLS
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
  xen/x86: wrap x86-specific domctl-op with CONFIG_MGMT_HYPERCALLS
  xen/arm: wrap arm-specific domctl-op with CONFIG_MGMT_HYPERCALLS
  x86/hvm: domctl_lock synchronization only when MGMT_HYPERCALLS=y
  xen/domctl: wrap common/domctl.c with CONFIG_MGMT_HYPERCALLS
  xen: decouple PV_SHIM_EXCLUSIVE and MGMT_HYPERCALLS

 tools/fuzz/cpu-policy/Makefile               |   4 +-
 tools/fuzz/x86_instruction_emulator/Makefile |  11 +-
 tools/libs/guest/Makefile.common             |   4 +-
 tools/tests/cpu-policy/Makefile              |   3 +-
 tools/tests/x86_emulator/Makefile            |   3 +-
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
 xen/arch/x86/Kconfig                         |   1 +
 xen/arch/x86/Makefile                        |   4 +-
 xen/arch/x86/configs/pvshim_defconfig        |   2 +-
 xen/arch/x86/domain.c                        |   2 +
 xen/arch/x86/domctl.c                        |   2 +-
 xen/arch/x86/emul-i8254.c                    |   2 +
 xen/arch/x86/hvm/Kconfig                     |   2 +
 xen/arch/x86/hvm/hvm.c                       |   7 +-
 xen/arch/x86/hvm/pmtimer.c                   |   2 +
 xen/arch/x86/include/asm/p2m.h               |   2 +-
 xen/arch/x86/include/asm/paging.h            |   3 +-
 xen/arch/x86/mm/p2m-pod.c                    |   2 +
 xen/arch/x86/mm/p2m.c                        |   2 +
 xen/arch/x86/mm/paging.c                     |   4 +
 xen/arch/x86/psr.c                           |  18 --
 xen/arch/x86/time.c                          |   2 +
 xen/common/Kconfig                           |  28 +-
 xen/common/Makefile                          |   6 +-
 xen/common/device-tree/device-tree.c         |  16 --
 xen/common/domain.c                          | 116 ++++----
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
 xen/drivers/passthrough/arm/smmu-v3.c        |   6 +
 xen/drivers/passthrough/arm/smmu.c           |  55 ++--
 xen/drivers/passthrough/device_tree.c        | 136 +++++----
 xen/drivers/passthrough/iommu.c              |   2 +
 xen/drivers/passthrough/pci.c                |  52 ++--
 xen/drivers/passthrough/vtd/iommu.c          |   6 +-
 xen/include/hypercall-defs.c                 |  14 +-
 xen/include/xen/device_tree.h                |  13 -
 xen/include/xen/domain.h                     |   4 -
 xen/include/xen/iommu.h                      |   2 +
 xen/include/xsm/dummy.h                      |  22 +-
 xen/include/xsm/xsm.h                        |  52 ++--
 xen/lib/Makefile                             |   5 +
 xen/lib/x86/Makefile                         |   4 +-
 xen/lib/x86/cpuid-cp2buf.c                   | 123 ++++++++
 xen/lib/x86/cpuid-cpfrbuf.c                  | 129 +++++++++
 xen/lib/x86/cpuid.c                          | 286 -------------------
 xen/lib/x86/cpupolicy-clr.c                  |  73 +++++
 xen/xsm/dummy.c                              |  20 +-
 xen/xsm/flask/hooks.c                        |  55 ++--
 73 files changed, 827 insertions(+), 665 deletions(-)
 create mode 100644 xen/lib/x86/cpuid-cp2buf.c
 create mode 100644 xen/lib/x86/cpuid-cpfrbuf.c
 create mode 100644 xen/lib/x86/cpupolicy-clr.c

-- 
2.34.1


