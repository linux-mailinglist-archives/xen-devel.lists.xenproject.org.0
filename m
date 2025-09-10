Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910EB50FEB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117785.1463900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXM-0001o5-10; Wed, 10 Sep 2025 07:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117785.1463900; Wed, 10 Sep 2025 07:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXL-0001by-IZ; Wed, 10 Sep 2025 07:46:39 +0000
Received: by outflank-mailman (input) for mailman id 1117785;
 Wed, 10 Sep 2025 07:46:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFRH-0005yt-7R
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:40:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2418::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67af338e-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:40:22 +0200 (CEST)
Received: from SN6PR01CA0009.prod.exchangelabs.com (2603:10b6:805:b6::22) by
 PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:40:15 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::da) by SN6PR01CA0009.outlook.office365.com
 (2603:10b6:805:b6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:40:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:40:14 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:40:01 -0700
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
X-Inumbo-ID: 67af338e-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGYKk8no+4KzoG7QdOuvFHB3+G/uKkJIJ2ZWJvcNWvjyuCfgSEmP2MZMDu2gk4VGL2qJgYteunEkbOTUmdQOYC48yg+dsZoHM3BMUl5nV4EG45XvWVZzJ02xkSUb+ttG+1QZEJxStdWl5ZNpub83o9pbPKmepP2g+OTtpXAuqDPKUyYIH8FWNErRR9CtMrFq3MOG2WTxkkQ9oWa+8qsxNn95yToCcK2+qfBnWsg8mzh5SI6BaWsMLdZvStGgNykX7jxT+ZfOivMwPfQ3ZCWpUi3Wu6U32k1pU9wapfhjXGlH3mz20b3yvDuAC0SXLPny2KvM8+V+VF4stAqb3psvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPpP+b+/IukhAi2FKipdO0pKRRyw4rGNMr68r7YHWug=;
 b=xn8iP5Am4moSGR5Gf8YYehMyAwpguOiME3F72L/oHDSQNhDJI40b/S0mk+dqwTerZ2uydeeOjjMczf8R8AvNJ7+5tiMIE4zOmcoMO3TqrYBJOxl5AHOGSG/B0/6bmsGHOWctFmXRQ2nSO6QToXponc526wu88LkfwKpNCfzoihguG7zacDPqJJFx4xk7aHvKvMUnDMNaOMIIvfMKC2ub9ZtCzBgxfGcCQMVTfbX7AHPTknsqQ98QnisA1Ca9vTL6wkq6NP8My+KDu1Mo+nw3kr7LC3YgTlaIg6LfQ5nlakdmTLDXyml5EcDPd+/XNNiqOxyzosJpgEFWbb7pYS5e8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPpP+b+/IukhAi2FKipdO0pKRRyw4rGNMr68r7YHWug=;
 b=fUqJYcMC7yNDw9AdbnqiiRG6BpSN1c6IisbZiQWwnFwZEXL7qatF8ZgTAQ8PqfycX+SUvzN762DrQavtVDMalxGNGv0FgvYERjwg3D0c4P8TVH0efmkETLaglL313/6egK826KZVYnaVxXcXmEphIoUrW2FaPcnvVo2ng+74S1s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 24/26] xen/domctl: wrap arch-specific domctl-op with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:25 +0800
Message-ID: <20250910073827.3622177-25-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: e4723181-0433-465e-761e-08ddf03d478e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T+U/ja/36brzF1BhhqMUoODrhA+e9rvnfX3iYu6HLuD1Jlioo44m7Bm1vnul?=
 =?us-ascii?Q?nkO6w/yZjYRM7u77YhzvcH/v11j57153AiN/WxPoh+Cn/GbSlj+sIkVNF9Z+?=
 =?us-ascii?Q?HIpRmHb5OyQqTHBrmKgGhf6dBD1YkEEMEW1pKZyjEv1oY4tO5FODlRQvInFB?=
 =?us-ascii?Q?UjmxjDJ5iT3ssGPbw6se6UTefnuY3Sq/kK8qIsDyPBTOmxetUoe5pAZAT2aB?=
 =?us-ascii?Q?havpM2YzuJXcEIOCwxosyOGnYPfBCfEMggnUrM9i/EloHnbM0vJeYjMBtw/t?=
 =?us-ascii?Q?rdxSqeYCduuMrQpF2+NlqeoocNxnGVOE+DRgIPjZAS4UDRcEJMiC4p4zWOkl?=
 =?us-ascii?Q?Y6RuDkw/k9mEwXU6JDtVEq9RVXRyaCzMcmxJgujCxKPrsH/NzI2NNY9qSL3H?=
 =?us-ascii?Q?wrmDyZG50tUWCaWK3wdUiTUrwEe7knnIFndMDyttypdl3OK24lW5enpZExSo?=
 =?us-ascii?Q?gmR9gLc/5NvIRf8oxhdAyGRLq6g41Og4efkZnP313MnTD/FMOo8gbOjElYqo?=
 =?us-ascii?Q?phQy0B/RE3Dp/5c/kOniO4I/KY8JTWEqye2OZsP1CQqT63lnzdUCEBqTQT3g?=
 =?us-ascii?Q?NYqhKct734JHLAbBG1ad0WbmU7rODuj3ni8PvK8TbjEDXc91HNjaFxfjIbfe?=
 =?us-ascii?Q?zoJ1aXTRTkNob+OuNArJU23JiewoEilTbtiIC3bwpAJrPUUSTSiqESBBP+iT?=
 =?us-ascii?Q?sa43Aym0QuEXLYNugIyfOVFe7mLVgu1Yfems3WOc5EdNU8dAthOuMjaZacij?=
 =?us-ascii?Q?ac3fI0iK0QuJQeVvwWnboiMsDszvlcfGxB4NR54y6F83yJ3J5N14pUwUBpgw?=
 =?us-ascii?Q?mW8HUXbQRHZItsYl+z2neo33OFQx8XAdC7Ek3yNi6D1+Y6KxjGRwxKWRuDzg?=
 =?us-ascii?Q?QcguEJ02+Va1wHIDEL1xMf0+C3BGUGS+de5oY9zpr1tga1x6R57aMKh2o5At?=
 =?us-ascii?Q?buPxxcOtx9QO18iEDN1Gaf1qXUI8U9zj5HCX2MA54a6NJ9YzOcSY4H1c3AiG?=
 =?us-ascii?Q?rxM6L2zOuSkBFie6eV5ytzqnE9ZXPAaVyY5OayO2sLG5aPYU8lCOE+DAuUcm?=
 =?us-ascii?Q?rXCj4EnWzsLy3vozUdbtUxbaC9yk6+jWqfZ5mrVBBzjaU/jp8aFJ8XQuXZYz?=
 =?us-ascii?Q?AVougIevW9KlxN0H0HmHgh0qYxUAGocB2rRNmX6g+6zSigcs84VCbPzl/f6e?=
 =?us-ascii?Q?jrPTfpat9/xXctIKZTckJ+nR+r5Nofi4W81TzuWUfg4xIrCcsrXNmLMwPapw?=
 =?us-ascii?Q?u7rmMpLGuNFzSJlZt4Zl/lk3BiqAOylpvgrd8Kr8K+CziWqDqxCC8wdd3q0H?=
 =?us-ascii?Q?YywcbnVIQw6mo9NQ4wUUZ4YDQ7cMb0qven+BhDos6R31oaB3WCy+hTAQSI8/?=
 =?us-ascii?Q?zVsds4EANhzwc+wWHhuhFjW+CwBiDoxKGz43KpG3ZAagkJ5/LWCT7ZkA6f2T?=
 =?us-ascii?Q?a+B0ZYMBspwNWKe0fzZDsmLFf2ziZR5tyfzcHttiSr5qYFQjV9710qsiSTM9?=
 =?us-ascii?Q?eIpXSi9uBkRhEZtYvUtHoyFn6O1sefdxdl/y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:40:14.0060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4723181-0433-465e-761e-08ddf03d478e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124

Function arch_do_domctl() is responsible for arch-specific domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS
Tracking its calling chain and the following functions shall be wrapped with
CONFIG_MGMT_HYPERCALLS:
For x86:
- hvm_save_one
- hvm_acpi_power_button
- hvm_acpi_sleep_button
- hvm_debug_op
- mem_sharing_domctl
- make P2M_AUDIT depend on CONFIG_MGMT_HYPERCALLS
- make PG_log_dirty depend on CONFIG_MGMT_HYPERCALLS
- make policy.o depend on CONFIG_MGMT_HYPERCALLS
- do_vmtrace_op
  - hvm_vmtrace_control
    - hvm_funcs.vmtrace_control
  - hvm_vmtrace_get_option
    - hvm_funcs.vmtrace_get_option
  - hvm_vmtrace_set_option
    - hvm_funcs.vmtrace_set_option
- paging_domctl_cont
For ARM:
- subarch_do_domctl

Also, remove all #ifdef CONFIG_MGMT_HYPERCALLS-s in arch-specific domctl.c, as
we put the guardian in Makefile for the whole file.
Wrap default-case and arch_get_domain_info() transiently with
CONFIG_MGMT_HYPERCALLS, and it will be removed when introducing
CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- split out xsm parts
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap default-case and arch_get_domain_info() transiently
---
 xen/Kconfig.debug                  |  2 +-
 xen/arch/arm/arm32/Makefile        |  2 +-
 xen/arch/arm/arm64/Makefile        |  2 +-
 xen/arch/arm/domctl.c              |  2 --
 xen/arch/x86/Makefile              |  2 +-
 xen/arch/x86/domctl.c              |  2 --
 xen/arch/x86/hvm/hvm.c             |  2 ++
 xen/arch/x86/hvm/pmtimer.c         |  2 ++
 xen/arch/x86/hvm/save.c            |  2 ++
 xen/arch/x86/hvm/vmx/vmx.c         |  6 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 10 ++++++++++
 xen/arch/x86/include/asm/p2m.h     |  2 +-
 xen/arch/x86/include/asm/paging.h  |  2 +-
 xen/arch/x86/mm/mem_sharing.c      |  2 ++
 xen/common/domctl.c                |  6 ++++++
 xen/include/hypercall-defs.c       |  4 ++--
 xen/lib/x86/Makefile               |  2 +-
 17 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index a69615cd63..0dd44d2b10 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -15,7 +15,7 @@ if DEBUG || EXPERT
 
 config GDBSX
 	bool "Guest debugging with gdbsx"
-	depends on X86
+	depends on X86 && MGMT_HYPERCALLS
 	default y
 	help
 	  If you want to enable support for debugging guests from dom0 via
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 531168f58a..f8cbf14211 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_MPU) += mpu/
 
 obj-y += cache.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b..6b77a15abe 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -6,7 +6,7 @@ obj-y += cache.o
 obj-y += cpufeature.o
 obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index d3263e4d03..ad914c915f 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -184,7 +184,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
     }
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 {
     struct vcpu_guest_context *ctxt = c.nat;
@@ -200,7 +199,6 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     if ( !test_bit(_VPF_down, &v->pause_flags) )
         ctxt->flags |= VGCF_online;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index a7bfe4c0b1..8427dc52fd 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -28,7 +28,7 @@ obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
 obj-y += e820.o
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index ea5f5b20cf..6153e3c07e 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1370,7 +1370,6 @@ long arch_do_domctl(
     return ret;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
@@ -1563,7 +1562,6 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     c(vm_assist = d->vm_assist);
 #undef c
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index b044dc2ecb..08bb1ba857 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5223,6 +5223,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int hvm_debug_op(struct vcpu *v, int32_t op)
 {
     int rc = 0;
@@ -5265,6 +5266,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 87a7a01c9f..f080f7561d 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -56,6 +56,7 @@ static void pmt_update_sci(PMTState *s)
         hvm_isa_irq_deassert(s->vcpu->domain, SCI_IRQ);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void hvm_acpi_power_button(struct domain *d)
 {
     PMTState *s = &d->arch.hvm.pl_time->vpmt;
@@ -81,6 +82,7 @@ void hvm_acpi_sleep_button(struct domain *d)
     pmt_update_sci(s);
     spin_unlock(&s->lock);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* Set the correct value in the timer, accounting for time elapsed
  * since the last time we did that. */
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 8ab6405706..0d966911a2 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -121,6 +121,7 @@ size_t hvm_save_size(struct domain *d)
     return sz;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * Extract a single instance of a save record, by marshalling all records of
  * that type and copying out the one we need.
@@ -195,6 +196,7 @@ int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
     xfree(ctxt.data);
     return rv;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int hvm_save(struct domain *d, hvm_domain_context_t *h)
 {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4cf5da70ad..056f46673e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2585,6 +2585,7 @@ static bool cf_check vmx_get_pending_event(
     (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
      RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check vmtrace_get_option(
     struct vcpu *v, uint64_t key, uint64_t *output)
 {
@@ -2693,6 +2694,7 @@ static int cf_check vmtrace_control(struct vcpu *v, bool enable, bool reset)
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 {
@@ -2883,10 +2885,14 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
 #endif
+#ifdef CONFIG_MGMT_HYPERCALLS
     .vmtrace_control = vmtrace_control,
+#endif
     .vmtrace_output_position = vmtrace_output_position,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .vmtrace_set_option = vmtrace_set_option,
     .vmtrace_get_option = vmtrace_get_option,
+#endif
     .vmtrace_reset = vmtrace_reset,
 
     .get_reg = vmx_get_reg,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index b2c75b733e..6e5ec65a8e 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -239,10 +239,14 @@ struct hvm_function_table {
 #endif
 
     /* vmtrace */
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
+#endif
     int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
+#endif
     int (*vmtrace_reset)(struct vcpu *v);
 
     uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
@@ -747,8 +751,10 @@ bool altp2m_vcpu_emulate_ve(struct vcpu *v);
 
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
+#ifdef CONFIG_MGMT_HYPERCALLS
     if ( hvm_funcs.vmtrace_control )
         return alternative_call(hvm_funcs.vmtrace_control, v, enable, reset);
+#endif
 
     return -EOPNOTSUPP;
 }
@@ -765,8 +771,10 @@ static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 static inline int hvm_vmtrace_set_option(
     struct vcpu *v, uint64_t key, uint64_t value)
 {
+#ifdef CONFIG_MGMT_HYPERCALLS
     if ( hvm_funcs.vmtrace_set_option )
         return alternative_call(hvm_funcs.vmtrace_set_option, v, key, value);
+#endif
 
     return -EOPNOTSUPP;
 }
@@ -774,8 +782,10 @@ static inline int hvm_vmtrace_set_option(
 static inline int hvm_vmtrace_get_option(
     struct vcpu *v, uint64_t key, uint64_t *value)
 {
+#ifdef CONFIG_MGMT_HYPERCALLS
     if ( hvm_funcs.vmtrace_get_option )
         return alternative_call(hvm_funcs.vmtrace_get_option, v, key, value);
+#endif
 
     return -EOPNOTSUPP;
 }
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 1856cc396c..f29605df54 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -20,7 +20,7 @@
 #include <asm/page.h>    /* for pagetable_t */
 
 /* Debugging and auditing of the P2M code? */
-#if !defined(NDEBUG) && defined(CONFIG_HVM)
+#if !defined(NDEBUG) && defined(CONFIG_HVM) && defined(CONFIG_MGMT_HYPERCALLS)
 #define P2M_AUDIT     1
 #else
 #define P2M_AUDIT     0
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 1b0694bb36..db3e5b8f31 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#ifdef CONFIG_PAGING
+#if defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index d7cbf2047b..3210cf5553 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -2319,6 +2319,7 @@ out:
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
 {
     int rc;
@@ -2336,6 +2337,7 @@ int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_dump_shared_mem_info(void)
 {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index c87c28cea2..5657b95089 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -114,7 +114,9 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 
     memcpy(info->handle, d->handle, sizeof(xen_domain_handle_t));
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     arch_get_domain_info(d, info);
+#endif
 }
 
 bool domctl_lock_acquire(void)
@@ -882,7 +884,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     default:
+#ifdef CONFIG_MGMT_HYPERCALLS
         ret = arch_do_domctl(op, d, u_domctl);
+#else
+        ret = -EOPNOTSUPP;
+#endif /* CONFIG_MGMT_HYPERCALLS */
         break;
     }
 
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index cd2c801af6..02d7b93e80 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -197,7 +197,7 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
 domctl(xen_domctl_t *u_domctl)
@@ -296,7 +296,7 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 paging_domctl_cont                 do       do       do       do       -
 #endif
 
diff --git a/xen/lib/x86/Makefile b/xen/lib/x86/Makefile
index 780ea05db1..ee5bec225e 100644
--- a/xen/lib/x86/Makefile
+++ b/xen/lib/x86/Makefile
@@ -1,3 +1,3 @@
 obj-y += cpuid.o
 obj-y += msr.o
-obj-y += policy.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += policy.o
-- 
2.34.1


