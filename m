Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB42BD2800
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141905.1476093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbd-0004bR-KS; Mon, 13 Oct 2025 10:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141905.1476093; Mon, 13 Oct 2025 10:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbd-0004XQ-CN; Mon, 13 Oct 2025 10:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1141905;
 Mon, 13 Oct 2025 10:16:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fbb-0004Rd-Ps
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:16:39 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1905fcf-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:16:34 +0200 (CEST)
Received: from BY3PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:39a::23)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 10:16:28 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::79) by BY3PR03CA0018.outlook.office365.com
 (2603:10b6:a03:39a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:16:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:19 -0700
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
X-Inumbo-ID: b1905fcf-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB+Glpvaz8j/5LgT54CfEe1JoG5gOMO628yBGZCdk6BLG2kqioNvFZhm5Dh0b9d2U7vXarjOtwPTwwBf/YUxRq11TH5OGXX5GeRuQVgYiV/i01CSlVTaMnZ+6YmqNnaoF9mopIoMrnpCTxoRGnhkY2wNzz2ewpPWKKVr0/itwzO2/f9eoFfqTfdu8jRRt89ilThQt1zV/q2ZD9nOIrlcZ9kZrWd0b68zTEMs538b+KqwnvZZmQ3laAH6FzKW5/nHskMQuoRG7unqd61nAzVind5FZKvedCAbuDFXeU6dUhDB62ZDBptAudvDzGP5k3kkrctgjiRo5MMe8JIpW7lz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+5AW20V7RtR9dVUbX/WTQLNzCzr9zOZDFXOjm6Y8QI=;
 b=cmUTKGlOZsF7T2inoXN7RuYKlz4/S9HO3HjfIJGJJ9NPPCQnkq5GcD8Ftjdqp96u4Vycz+Gj2cByveX9KqOJJqW2JIm7PFoiYVDwI1i1C8gZdPnhMgap51RYjCARBqeGO8NNdC5XRAISRUtJeIuozTatPtNHQzOSGWv49e4ojmMAk5+cSV7qY99h1ZSsIp22Rp9ZX2APwahRC5l4t7W3wMQfBPkeggHuuW4RT+oYnQmSF8lGi3SLuTXA2LzQlRSF4jhQs0DtSbP4vgdSGe1JNC8sASGXVEFDed/cWvtRuVugChJPmWjAdPquQHWedtAjNc0Jvmc0vqDqB/ubU2iBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+5AW20V7RtR9dVUbX/WTQLNzCzr9zOZDFXOjm6Y8QI=;
 b=BbUhlI5RZl3z4i0AOYq2FPyJ3c5/DArnGbX07rUiENYI1DE0sRQ17PFm1l4ycXd3etpK476JIPoCv9ARkf/Yp/AJwABV7p0qBkYIsgxTBkPbYNdFryEnOyDwpLYXaoCHHZbbuvT30+bLpDusZ9EovBHBtZDPpqZW6K60H10gdXM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Dario Faggioli <dfaggioli@suse.com>, "Juergen
 Gross" <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	"Nathan Studer" <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Meng Xu <mengxu@cis.upenn.edu>, Rahul Singh
	<rahul.singh@arm.com>
Subject: [PATCH v3 00/28] Disable domctl-op via CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:12 +0800
Message-ID: <20251013101540.3502842-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 7baa987b-d320-4805-33f9-08de0a4191b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+XkBkhC8sl13/gbCb9fx+rKpy80od3clX1q9B3fhr9FFaLd49jc2/uJ8fekk?=
 =?us-ascii?Q?jNE2OlzdG/9U4Am4AAih5ikHDlBc/7sPTnBsBmlU+78LIMeO9Lz/nccKad/s?=
 =?us-ascii?Q?VSSTGDSROoKC96GiMlYjTwNfTqJRgh73rBx3Hw2FOkApfR2gjylItUcS1ggJ?=
 =?us-ascii?Q?Cq0LyufXBkugUAIKXkWzNkDcx5KQgpsx/HA4jzHmYvEgCoAV/hmi2Al0WjOz?=
 =?us-ascii?Q?WTObKQX9WXGqBagI1ctAKsiLBq1blqmNeqT+zNlGbC/DGwxZ48rB5ceBzN3H?=
 =?us-ascii?Q?7fhd+D9+zZ6t7ipwUf+6Qaq+QDCV8o2kEK8eq3+0/mc2/uBmalIH+h6npsDR?=
 =?us-ascii?Q?YKRo8yp3iQYaeGd1GpW8S3/Q2IkyY5hr3jku645/bUKnMQWY0Fr2Olr7D3Sp?=
 =?us-ascii?Q?FZw2rMxAGDoxUidyKvE8Am9H2ExbpTSmGW6pxi/jCg/b7xDXG5t4a4jnuY4o?=
 =?us-ascii?Q?KfyufVx3n9JP/wHEgmf5dXFey3sKF6gaN1NCJWZT+81YdIUVpf3JfVP5gqS6?=
 =?us-ascii?Q?sZutSX7tYgG1dZJ6VYfvp3vzGMiYIS+YooBfZuUacw2B9+jSl1mry+sai13R?=
 =?us-ascii?Q?e+DcD166NrzhMtadyAPjAk333gLrEQ/v3UhbL54ZLeB1c9KeeFnlctxjGzMu?=
 =?us-ascii?Q?17umuzEleyjR99soiBVQbjuDt9GDyXHUJwzCyAG63d87Bf99nbBusbitrJCG?=
 =?us-ascii?Q?9KZLzdZYGLB7DwI09MbAYlq03KaOKGGYiJUWrmanTs3mTmkPp69wwU/QB9L5?=
 =?us-ascii?Q?wKlKUSDIiPOTewFODFXPjL5Lcy1v8I17l5esqhat6CrZGd20UFugN8BSGKW/?=
 =?us-ascii?Q?9/vLYzUgqJ1b5Puo+YqBSQOGV6/xuSsq7JS+9ThNJWJCbZONKrIZpCDXweXF?=
 =?us-ascii?Q?Q3VSuVcMZGvo2zZ+ImZKuqpLwl484fWEJ8hVzL1z1xFmQBi00cqkPT21/9oV?=
 =?us-ascii?Q?l/tdJfLoE8U1Qt03pbBDhI3oAPdOnNMquFe+iDKOOpin63zK7zLm/+JTVN/0?=
 =?us-ascii?Q?JSMgEKNWjSMjUbhYw64El6fd9a9Igo74m9TeXBOIpN48182+3cGsstZgptzg?=
 =?us-ascii?Q?m05ST+FXbqZGQd4Uo8n95Q3UoPMXQklX0MFEgoXiHmjuTxUvI53Jfuu2rphv?=
 =?us-ascii?Q?p/pRdzrMRjTbn/qTptcNQRufHhoPLdCvL1n1loeR6yayi/yd/VxghdTKBypO?=
 =?us-ascii?Q?BVFtbjGaCFMTcDbJ/NUOQbRDGMUMgDJoCIIK6f3Jg/unVZBiZ1rcdHMnNmsX?=
 =?us-ascii?Q?oy44ZQSaLwfHL5c6BG6mSyzLxm4h2qI8T+Jj0D3M4/Dtho4hGoktX6duoSuT?=
 =?us-ascii?Q?C0JBqFRQmIbP+IcECwO/r+GDRKiWmwTgbyiLjhUCu0bIIvmPnBLWw0gMC81w?=
 =?us-ascii?Q?YktFVixrwXFVa8Lp+LnDW+YXZgp1vE0bZeyCBd1w+9mr2fHRgWX2ZZ0Lv4s1?=
 =?us-ascii?Q?y+LTlKLuVln/B2OlOCwSMZ+7+4aqcJSt3NhUBprP2Djtq/NAlb1oI/Um3mzf?=
 =?us-ascii?Q?mO2b1u6WkMt+JAsWc6ruNshwTt8rwzy9y4dr0kbbsNh6FzezXYo8PsxekTAL?=
 =?us-ascii?Q?1gBluEmPqihrUXQxqUCt1OPmJ1CG2G8/qhOl6VmS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:26.5727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7baa987b-d320-4805-33f9-08de0a4191b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222

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

Penny Zheng (28):
  xen/xsm: remove redundant xsm_iomem_mapping()
  xen/mem_sharing: wrap hvm_copy_context_and_params() with
    CONFIG_MEM_SHARING
  xen/altp2m: move p2m_set_suppress_ve_multi() forward
  xen/sched: remove vcpu_set_soft_affinity()
  xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_DOMCTL
  xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
  xen/domctl: make MGMT_HYPERCALLS transiently def_bool
  xen/vm_event: introduce vm_event_is_enabled()
  xen/vm_event: consolidate CONFIG_VM_EVENT
  xen/vm_event: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
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
  xen/domctl: wrap xsm_irq_permission with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap arch-specific domain_set_time_offset() with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap xsm_set_target() with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap arch_{get,set}_paging_mempool_size() with
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: make CONFIG_X86_PSR depend on CONFIG_MGMT_HYPERCALLS
  xen/domctl: avoid unreachable codes when both MGMT_HYPERCALLS and
    MEM_SHARING unset
  xen/domctl: wrap arch-specific domctl-op with CONFIG_MGMT_HYPERCALLS
  xen/domctl: make HVM_PARAM_IDENT_PT conditional upon
    CONFIG_MGMT_HYPERCALLS
  xen/domctl: wrap common/domctl.c with CONFIG_MGMT_HYPERCALLS

 xen/Kconfig.debug                           |   4 +-
 xen/arch/arm/Kconfig                        |   2 +-
 xen/arch/arm/Makefile                       |   4 +-
 xen/arch/arm/arm32/Makefile                 |   2 +-
 xen/arch/arm/arm64/Makefile                 |   2 +-
 xen/arch/arm/domain.c                       |   5 +
 xen/arch/arm/include/asm/tee/tee.h          |   2 +
 xen/arch/arm/mmu/p2m.c                      |   8 +
 xen/arch/arm/mpu/p2m.c                      |   2 +
 xen/arch/arm/tee/ffa.c                      |   4 +
 xen/arch/arm/tee/optee.c                    |   4 +
 xen/arch/arm/tee/tee.c                      |   2 +
 xen/arch/arm/time.c                         |   2 +
 xen/arch/ppc/stubs.c                        |   4 +
 xen/arch/riscv/stubs.c                      |  10 +-
 xen/arch/x86/Kconfig                        |   1 +
 xen/arch/x86/Makefile                       |   6 +-
 xen/arch/x86/configs/pvshim_defconfig       |   2 +-
 xen/arch/x86/domain.c                       |   4 +
 xen/arch/x86/emul-i8254.c                   |   2 +
 xen/arch/x86/hvm/Kconfig                    |   1 -
 xen/arch/x86/hvm/Makefile                   |   4 +-
 xen/arch/x86/hvm/emulate.c                  |  67 +++++----
 xen/arch/x86/hvm/hvm.c                      |  57 +++++++-
 xen/arch/x86/hvm/pmtimer.c                  |   2 +
 xen/arch/x86/hvm/save.c                     | 154 ++++++++++----------
 xen/arch/x86/hvm/svm/intr.c                 |   2 +-
 xen/arch/x86/hvm/svm/svm.c                  |  66 +++++----
 xen/arch/x86/hvm/vmx/intr.c                 |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c                  |  80 ++++++----
 xen/arch/x86/include/asm/hvm/hvm.h          |  17 ++-
 xen/arch/x86/include/asm/mem_access.h       |   9 ++
 xen/arch/x86/include/asm/monitor.h          |   9 ++
 xen/arch/x86/include/asm/p2m.h              |   2 +-
 xen/arch/x86/include/asm/paging.h           |   2 +-
 xen/arch/x86/include/asm/vm_event.h         |   9 ++
 xen/arch/x86/mm/altp2m.c                    |  34 ++---
 xen/arch/x86/mm/mem_sharing.c               |   7 +
 xen/arch/x86/mm/p2m-pod.c                   |   2 +
 xen/arch/x86/mm/p2m.c                       |   2 +
 xen/arch/x86/mm/paging.c                    |   4 +
 xen/arch/x86/psr.c                          |  18 ---
 xen/arch/x86/time.c                         |   2 +
 xen/common/Kconfig                          |  32 ++--
 xen/common/Makefile                         |   7 +-
 xen/common/argo.c                           |   2 +
 xen/common/device-tree/device-tree.c        |   2 +
 xen/common/domain.c                         |  10 ++
 xen/common/domctl.c                         |   2 +-
 xen/common/grant_table.c                    |   2 +
 xen/common/page_alloc.c                     |   8 +-
 xen/common/perfc.c                          |   4 +-
 xen/common/sched/arinc653.c                 |  11 +-
 xen/common/sched/core.c                     |  18 +--
 xen/common/sched/cpupool.c                  |  16 +-
 xen/common/sched/credit.c                   |  10 +-
 xen/common/sched/credit2.c                  |  10 +-
 xen/common/sched/private.h                  |  10 +-
 xen/common/sched/rt.c                       |   4 +
 xen/common/spinlock.c                       |   4 +-
 xen/drivers/char/console.c                  |   4 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |   8 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c    |   8 +
 xen/drivers/passthrough/arm/smmu-v3.c       |   4 +
 xen/drivers/passthrough/arm/smmu.c          |  10 ++
 xen/drivers/passthrough/device_tree.c       |   8 +
 xen/drivers/passthrough/iommu.c             |   2 +
 xen/drivers/passthrough/pci.c               |   6 +
 xen/drivers/passthrough/vtd/iommu.c         |   6 +
 xen/drivers/vpci/header.c                   |   2 +-
 xen/include/hypercall-defs.c                |  12 +-
 xen/include/xen/domain.h                    |   4 -
 xen/include/xen/mem_access.h                |  10 ++
 xen/include/xen/vm_event.h                  |   7 +
 xen/include/xsm/dummy.h                     |  33 +++--
 xen/include/xsm/xsm.h                       |  65 ++++-----
 xen/lib/x86/Makefile                        |   4 +-
 xen/xsm/dummy.c                             |  23 +--
 xen/xsm/flask/hooks.c                       |  58 ++++----
 79 files changed, 655 insertions(+), 395 deletions(-)

-- 
2.34.1


