Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6013B01234
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040361.1411839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5RC-0004je-SY; Fri, 11 Jul 2025 04:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040361.1411839; Fri, 11 Jul 2025 04:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5RC-0004hy-OA; Fri, 11 Jul 2025 04:32:42 +0000
Received: by outflank-mailman (input) for mailman id 1040361;
 Fri, 11 Jul 2025 04:32:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua5RC-0003OR-2H
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 04:32:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2412::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 137f53db-5e10-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 06:32:40 +0200 (CEST)
Received: from BN8PR16CA0033.namprd16.prod.outlook.com (2603:10b6:408:4c::46)
 by CY1PR12MB9625.namprd12.prod.outlook.com (2603:10b6:930:106::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 11 Jul
 2025 04:32:35 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:4c:cafe::ae) by BN8PR16CA0033.outlook.office365.com
 (2603:10b6:408:4c::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 04:32:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Fri, 11 Jul 2025 04:32:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 23:32:31 -0500
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
X-Inumbo-ID: 137f53db-5e10-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrZDh2uexMmCUBlGxR7jIxR6B+UKmxlnmIL7/O0/Gt80skWupebMEAPcPyAnE2raGoan38jahvLxYk9E0OP53nn7ypCgqMg6tpoWdJmEbqfTL7UWg3HHM8pED3XAcI4Qsl9ev5eb6pxOauFHVIGTHCD20BKrdMtVBoQCZMvq6ogntj5uERv0aKj8BCI8JgvqqeH1NHvHHqikj8ZIvaV9IXxXebKSeq1jTCe8arIN64fCNeo1stXMaZ3X7h7omG7KEU32k0ILTxogs/GbSFMo2xuuso/7uFJ8trHnZSRZ+z/cxZwvewcfIgEasvMRmbZZAyuP4a6vff1mzzZm4ReUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFLZ7b6gl3GP+IHNPjkhHrTHCTAFBKAP01UJHvvbNv4=;
 b=MF464yP40zmw02bLdP1l7rUmlNy5inAsnvQZCd1yuwn22QIGipyRcYORTmyYpjWhJMtm+8jehCSoFliQ4XPIy2NaaN+LM10UVhZjhzvezQhVncaE+Y/k8hWOuncMemM3kPd6iG1z1oFB9Ebf53ATf44PW7QaEiNCojeJa4EJLzArLfCiHnkZSjceFby4bAz9jqdHLJ1UAZZQ/O5uH6VvLyx4Tjp/NkeQu/CQY7QTpf4xyGGqlClc+46GkUECpP6VnrIEoZy9b63FefRUv9TPA0e/Q8LvgSUU9KOgwIQOvrAVzNDj/gN1kMYO3qJbWIXDEFAYmbiB2FNFUmAY2Lmu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFLZ7b6gl3GP+IHNPjkhHrTHCTAFBKAP01UJHvvbNv4=;
 b=oOBaO9Gj6Iuhakr7ssOrU0O7ZlJJ0Aax5VTfYnifqYkU3F5C5W41p2pL3eHtoS+0Jl3MbqDq+sZMFRQnoPWmc716HWOo3+pL3BvPHr0jPiSCHyldl1XRKM/k5R53s98pFCGEF0hWoSP9+v/EibYWxzdcB0krLqPq+EpnJ2A2CT4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Stefano Stabellini" <stefano.stabellini@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [PATCH v8 5/7] xen/sysctl: wrap around arch-specific arch_do_sysctl
Date: Fri, 11 Jul 2025 12:31:56 +0800
Message-ID: <20250711043158.2566880-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711043158.2566880-1-Penny.Zheng@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|CY1PR12MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: e48a1e5a-4b66-4a36-bb17-08ddc033f584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/BXlwpzlH7BAcp77sUwMzjmJ/9KFFsgVSH0TzftKfFGxeKLcNk4OuoiRyqmH?=
 =?us-ascii?Q?Rk8BDPUgFHDXCKlPfmMgx7wsFqj4g9150ATOtvKeb4Wo3yiole+AW7OLwOSN?=
 =?us-ascii?Q?BsIdcE4dqB3KPpkXPQV1zdyK/aI1EhigXIfRwlVgAeZBU+71OakxDvBAUT6j?=
 =?us-ascii?Q?ze0HYBhLMGxYLydA7zhxL0NcD5YYNq3XzNjVEcHn2Kf87NYaiksWaMY0BN+D?=
 =?us-ascii?Q?TD/EUXGat6FLUMKxBSkVR0ZTqOeyINgx55tZHGcdl5NWQcjmIeMXxrhaq+u7?=
 =?us-ascii?Q?BOZnxz/HhNAlO/lvgP3RvFhbJ+RwpYqboiJ0mkOkaD+RV/ujd+7YlIqrrwy6?=
 =?us-ascii?Q?PpLnft6RP+E68FZ5u5e6un19+U0W1oG9DjbUsYEDHUTIQguAc4Bh05exuUIR?=
 =?us-ascii?Q?oCib8lVjrxaMKU4PGWwe1bhCOF6IlZnU0vdjR2clyxHnw4vccK5PB4YiB2+w?=
 =?us-ascii?Q?qRr4wr0l/Z5eMuum4KjswEFJxvMT8xPOdtx6xkyxEY4EbWSCejQACHv/fYE3?=
 =?us-ascii?Q?1ZDDN6CwbxxtVbuqlzzfFX6/BMGpU0lH57qMmbngC+4sOyGs67MQ7Q3ub0Ld?=
 =?us-ascii?Q?rVlFX1xxrw/A7MPkmjZCNDH6coLlHYx37ykRf+XiT3rbJ8BAxg8N13oBRCzK?=
 =?us-ascii?Q?LCRnpXHnRpC6LTDuRHhDqKUM85e1xXDD12NUXho5I6yVjFeHO3v/EIZFVbTa?=
 =?us-ascii?Q?R8MsUj38YVWhTy7UdsbiwMiOtTvetEbRv4VwXQUyLqVB6KhcdtR+LiwCGrMs?=
 =?us-ascii?Q?mAKFiJcF+nmMgyzsvVeJYYX+iFccCufsRbOWLNqme3D9ixGAA1q7XToRSur6?=
 =?us-ascii?Q?PBMBKgZAuWTKB5bVa/PsukK81RZqWHMNaZYePgh/UarjTGokltuXgKoBvfDn?=
 =?us-ascii?Q?WBlrj0OIw7bOtRBcFuDrP3bIR26ITRWUru4CfGTsT73fAJ+S6GF/qsxPU2VV?=
 =?us-ascii?Q?QeENnN04V+NT+arsKdNpqcjrrNRisv8LSkOjpGFIBAf6u+zejF4FW2chjhsp?=
 =?us-ascii?Q?TpeYqeYsPjV20XYDcpuLKxu1uXTrme0K2sKVq6fOsVcdZfwesAJsxJYt5cZU?=
 =?us-ascii?Q?LGNvKkQI+3g6+9xVfQ8+slCJOv8hlzmGfVr6c2vT+v6RqddKfa7hExdJdlIM?=
 =?us-ascii?Q?5+bjZjn5W9nuvUGRQpXa1hcyCUWXv12vHYGbOnHRzOYceCpMemx87z9oLiok?=
 =?us-ascii?Q?GN9C0aJ0ODWygTwTTXphIM+vU4yzdu1lYOR6oj+7mYYPd4xvYsp+Q2vbrksx?=
 =?us-ascii?Q?jLlFnIJlXmz+m+l9x3ynjuFuBYkty+kWMU2LrCsU92UzwPKL/KnajEFFzyNe?=
 =?us-ascii?Q?8inDv5J55f7iT+E4wd6X7N+Fpc3W5BnIg7m3NBTA41lXtpF1l97osd6VZJOB?=
 =?us-ascii?Q?1NcenkLD9b3TV84EudboXHRo1LA8nsiHdZMs9OQcFeaSU7geCkZu1Pq7cMpQ?=
 =?us-ascii?Q?98dKt/e5B7b4eNdfQ46ZyjsQVFo3B6xluuep7Ez8BRw9lNw1jny3Zd+ixSMl?=
 =?us-ascii?Q?YBH3VVOAHkmN94Dv7ah4w57CGMf7XFUDJ6+4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:32:35.1038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e48a1e5a-4b66-4a36-bb17-08ddc033f584
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9625

Function arch_do_sysctl is to perform arch-specific sysctl op.
Some functions, like psr_get_info() for x86, DTB overlay support for arm,
are solely available through sysctl op, then they all shall be wrapped
with CONFIG_SYSCTL

Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
we put the guardian in Makefile for the whole file.
Since PV_SHIM_EXCLUSIVE needs sorting in the future, we move
obj-$(CONFIG_SYSCTL) += sysctl.o out of PV_SHIM_EXCLUSIVE condition.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- use "depends on" for config OVERLAY_DTB
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3:
- move obj-$(CONFIG_SYSCTL) += sysctl.o out of PV_SHIM_EXCLUSIVE condition
- move copyback out of #ifdef
- add #else process for default label
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
- move #ifdef ahead of the comment
---
 xen/arch/arm/Kconfig   |  1 +
 xen/arch/arm/Makefile  |  2 +-
 xen/arch/arm/sysctl.c  |  2 --
 xen/arch/riscv/stubs.c |  2 +-
 xen/arch/x86/Makefile  |  2 +-
 xen/arch/x86/psr.c     | 18 ++++++++++++++++++
 xen/arch/x86/sysctl.c  |  2 --
 7 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 3f25da3ca5..e076419d5e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -139,6 +139,7 @@ config HAS_ITS
 
 config OVERLAY_DTB
 	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	depends on SYSCTL
 	help
 	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index ab0a0c2be6..f833cdf207 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,7 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += vcpreg.o
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 2d350b700a..32cab4feff 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,7 +15,6 @@
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -23,7 +22,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
-#endif
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index f86a1c17cb..8918cebf35 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -302,6 +302,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_SYSCTL
 /* sysctl.c */
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
@@ -310,7 +311,6 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
     BUG_ON("unimplemented");
 }
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index ce724a9daa..96d63219e7 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -63,6 +63,7 @@ obj-y += smpboot.o
 obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps-setup.o
 obj-y += traps.o
@@ -78,7 +79,6 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
-obj-y += sysctl.o
 endif
 
 extra-y += asm-macros.i
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 5815a35335..499d320e61 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -133,9 +133,11 @@ static const struct feat_props {
      */
     enum psr_type alt_type;
 
+#ifdef CONFIG_SYSCTL
     /* get_feat_info is used to return feature HW info through sysctl. */
     bool (*get_feat_info)(const struct feat_node *feat,
                           uint32_t data[], unsigned int array_len);
+#endif
 
     /* write_msr is used to write out feature MSR register. */
     void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
@@ -418,6 +420,7 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
     return true;
 }
 
+#ifdef CONFIG_SYSCTL
 static bool cf_check cat_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
@@ -430,6 +433,7 @@ static bool cf_check cat_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 /* L3 CAT props */
 static void cf_check l3_cat_write_msr(
@@ -442,11 +446,14 @@ static const struct feat_props l3_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L3_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = cat_get_feat_info,
+#endif
     .write_msr = l3_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
+#ifdef CONFIG_SYSCTL
 /* L3 CDP props */
 static bool cf_check l3_cdp_get_feat_info(
     const struct feat_node *feat, uint32_t data[], uint32_t array_len)
@@ -458,6 +465,7 @@ static bool cf_check l3_cdp_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void cf_check l3_cdp_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -473,7 +481,9 @@ static const struct feat_props l3_cdp_props = {
     .type[0] = PSR_TYPE_L3_DATA,
     .type[1] = PSR_TYPE_L3_CODE,
     .alt_type = PSR_TYPE_L3_CBM,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = l3_cdp_get_feat_info,
+#endif
     .write_msr = l3_cdp_write_msr,
     .sanitize = cat_check_cbm,
 };
@@ -489,11 +499,14 @@ static const struct feat_props l2_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L2_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = cat_get_feat_info,
+#endif
     .write_msr = l2_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
+#ifdef CONFIG_SYSCTL
 /* MBA props */
 static bool cf_check mba_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
@@ -508,6 +521,7 @@ static bool cf_check mba_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void cf_check mba_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -545,7 +559,9 @@ static const struct feat_props mba_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_MBA_THRTL,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = mba_get_feat_info,
+#endif
     .write_msr = mba_write_msr,
     .sanitize = mba_sanitize_thrtl,
 };
@@ -808,6 +824,7 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
     return socket_info + socket;
 }
 
+#ifdef CONFIG_SYSCTL
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len)
 {
@@ -839,6 +856,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 
     return -EINVAL;
 }
+#endif /* CONFIG_SYSCTL */
 
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type)
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index f64addbe2b..1b04947516 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -91,7 +91,6 @@ static long cf_check smt_up_down_helper(void *data)
     return ret;
 }
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
@@ -105,7 +104,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
 }
-#endif /* CONFIG_SYSCTL */
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
-- 
2.34.1


