Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB1A94D69
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961159.1352781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmc-0004vX-0W; Mon, 21 Apr 2025 07:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961159.1352781; Mon, 21 Apr 2025 07:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmb-0004qG-Ov; Mon, 21 Apr 2025 07:41:37 +0000
Received: by outflank-mailman (input) for mailman id 961159;
 Mon, 21 Apr 2025 07:41:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljs-0007m8-SC
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:200a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8709860-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:47 +0200 (CEST)
Received: from BN0PR10CA0028.namprd10.prod.outlook.com (2603:10b6:408:143::34)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 07:38:42 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::8) by BN0PR10CA0028.outlook.office365.com
 (2603:10b6:408:143::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 07:38:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:37 -0500
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
X-Inumbo-ID: a8709860-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxr/PCEtGd73pnQu23t4AhXYc+qGLtv6DJxtStBNQLLkwS0Rb5sa3Xrmx6s/5N7Kad0J6K9MUSzOtv5oSU823gjGe4qkefaF3NFyg/uVCGiaibwvfDltAsEyi33FI82ocLSqw8iC17A7CSUNn7/5i8sitr1pxeDHM67Fi8wrnoXJGaDrtqTWwieZHzn+9D/FWDiiBtJ18PdGZ1YkcPUi8TgUBak3KVBA3uMKHybl5LQZyD8YigLVt7lQJN58uCCMPLJ0ZSe7tvvDHLDhUcQhPIlgxI+pD38hscqz0oqLwIhe+ejv2WCDhzXDMQIeCdTuDl1ssxRPybRdy8ZfdW9wOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4CC5cQALjU255G8esQCS8p/0H3qw2m1TSkbz36wHas=;
 b=qdU+ylGA45VPkE+R0YoID1skWHEw/EULxh2WzdQopg51OkvHiobZjv5tkYbnYReKnAWPlhP8IjCCB6NVIaGPml6ZXqx0LCqID+UFOUbg3An7u+S4TQ5MhXJHzswP3W5DTF/D4O7DeCEzZF+fVvVaqW+PBRY+pZYOxQ1FDa2ygl2b8b9OG3HEUp3HEZettTXo4Cc2OQfj3TXUzueCW449VGbtBWMFia1F/Ukghprz5SsjRLlbZVKSDTBrzmmq6XqmJC/udrdgGdrvdeeDsYwsBFL3lnaOFYqpX6UME8fh5Cfb/ZtcjNsRSnKVY0rqeFiokAGlkq4jKEflBxPMwU99+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4CC5cQALjU255G8esQCS8p/0H3qw2m1TSkbz36wHas=;
 b=4RIRRbzBO6fAtCt14uMLBVVG2R6VnN7quseaM6hVryyM+uVlO+epNGZNjq/DD7FoKCo0vkg0dRjVOBbm7CnGMYEHO57CuC84JnfjpOOUUf94olCtXlLXhjgOXWQlH46Gv5NXKUpUKEEhrzjU/FsvU5btLpRCT1Rgf8b5ZnBx8Tc=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [PATCH v3 19/20] xen/sysctl: wrap around arch-specific arch_do_sysctl
Date: Mon, 21 Apr 2025 15:37:22 +0800
Message-ID: <20250421073723.3863060-20-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8275ca-be2e-468b-7eb6-08dd80a78a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oblTil7FVuukgfl5BcLzX5CSoUhrC6JRiS9XjqAAmgyvHHcOhK1JEzx5s2JS?=
 =?us-ascii?Q?znDNrFUMTRnf58ks/CxPaWxJdajiZUK1BGnWqrcVzK3NmWRZ3fFxT6jpVYHq?=
 =?us-ascii?Q?SHJqpVMAvB396U3wDqCSwkeX7shKHx/clifNbcIVLIoSV2LLrTwm+ybpWEmF?=
 =?us-ascii?Q?lWLChiYiK7uixLsh20GNMpe20XwfunQ80U+bk77w4na3jWf2nbACuVDDHkAZ?=
 =?us-ascii?Q?sIYGdB1no5ik1sPhzJJDNHWHAVQHztRAUvCm6atWY8lc3U8Kd1ZMBb/rPJCe?=
 =?us-ascii?Q?t0xLDff+2d79vQZgN4mr/nihUIGTla6ohHHGGfwlQy6jVq+VeHFB5xAZqVxv?=
 =?us-ascii?Q?i0Bl0Fcoj5fB0Yv4LTPhdM7aDfq5/c2wib9EynOwUNMr2LhNKOZv9Ip/+Rna?=
 =?us-ascii?Q?+ftt/raM60U7/XBmy5xjvRLFczgopCQUmUxfRYwJeToymUswviMC2HJ9UA6e?=
 =?us-ascii?Q?a06k/5EJYS2d8vfPVJVhS+YqhkAqbwcX1yQs0Cl/1dWRh4dR+wJGj/waOYTc?=
 =?us-ascii?Q?yJ28HSKRu56ESx5IXH6LK1DDrcumMzfrc81EBLti3/go22+w6oTqnwGbmkqD?=
 =?us-ascii?Q?sP6V7xXqKjkFuT8J3mB6cjES/bbDSA2vut+dQvl6A7q8DVTvJkoVj068GHX2?=
 =?us-ascii?Q?xtRuQBrWRluaP79NYiSWJ/WhZicVYNmgqim2TZ/rx+X1oKALRBBnGHuyg2rP?=
 =?us-ascii?Q?9nI1gvhz+Da47gsGvCa21bQNHGcVfqGu3mfCyRt1NP4acuUY69wnohUTUXT/?=
 =?us-ascii?Q?tjBGcYJG9N9rBLvf3OopmRVK4buAxBcWWpvi1m4+xrwOP5nL6fJpYR0H5xGS?=
 =?us-ascii?Q?mdv7C6SJGYBQ2TDIzAtHoCeuFr791ygjM6Xmez1I3bDVJsK/FQx25MLK9+xg?=
 =?us-ascii?Q?HSNhwv/FKQawF+1elACIUkIJmsV8CtscrNfGA+uTZqQzPcNvrJoV6YJ0WtAB?=
 =?us-ascii?Q?7QHRdhZqU+iUzQcWCI1lBA55fVRtxy9eq3Q6zVK0Pbqk959ObA/sJlMt5GjX?=
 =?us-ascii?Q?H9dsmnQWItdJPFNRnFnlzgPBxAWUeturBw2pCW6XdV+404C74HlwUBQn732F?=
 =?us-ascii?Q?oeNbqgy+04gRiYeWpLtXCdlLbboQaHkElPFHv3voADQGK7e4gHi+8ZQjFlu2?=
 =?us-ascii?Q?XoNc3s/WernYnHvwl/tFqgpDw/BEuZFRgOuGnxVCZ/WegS3p/IlAxyBPB9hm?=
 =?us-ascii?Q?hTl+/Xxps4hiNpHuOv2T0P5WXi7l4i5qJklzabYX9U1XiJFeclOttag9vHLx?=
 =?us-ascii?Q?y3lgvAA9TRC1OhCHEMtLXGzG7Yoz8iDO8endmAgg8lrncT21tSOUVG2POa7b?=
 =?us-ascii?Q?DYe2i2DJcG4yWyJEthlZLL1XcQ9EK9BDG8yxc26mV62U47P6vBp9vEg8PHim?=
 =?us-ascii?Q?mZipUofEn8kXLRs6OgrybNvJYkRxz7MgfIc6zZy9nCMIG/ekUlo95P2YDS8N?=
 =?us-ascii?Q?Dz9pBUsbxDy8mje1s0olIxHw3eqeJWPsPfwLO0Nw+lZNCgTzenaSQnJoKbqC?=
 =?us-ascii?Q?bQZqDXrnbhJHCBQ4WUcGkBfD3C7vF1WnIRhk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:42.1796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8275ca-be2e-468b-7eb6-08dd80a78a27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526

Function arch_do_sysctl is to perform arch-specific sysctl op.
Some functions, like psr_get_info for x86, DTB overlay support for arm,
are solely available through sysctl op, then they all shall be wrapped
with CONFIG_SYSCTL

Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
we put the guardian in Makefile for the whole file.
Since PV_SHIM_EXCLUSIVE needs sorting as a prereq in the future, we move
obj-$(CONFIG_SYSCTL) += sysctl.o out of PV_SHIM_EXCLUSIVE condition.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
- use "depends on" for config OVERLAY_DTB
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3
- move obj-$(CONFIG_SYSCTL) += sysctl.o out of PV_SHIM_EXCLUSIVE condition
- move copyback out of #ifdef
- add #else process for default label
---
 xen/arch/arm/Kconfig   |  1 +
 xen/arch/arm/Makefile  |  2 +-
 xen/arch/arm/sysctl.c  |  2 --
 xen/arch/riscv/stubs.c |  2 +-
 xen/arch/x86/Makefile  |  2 +-
 xen/arch/x86/psr.c     | 18 ++++++++++++++++++
 xen/arch/x86/sysctl.c  |  2 --
 xen/common/sysctl.c    |  4 ++++
 8 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index da8a406f5a..9ac015b0cd 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -144,6 +144,7 @@ config HAS_ITS
 
 config OVERLAY_DTB
 	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	depends on SYSCTL
 	help
 	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4837ad467a..7c6015b84d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -54,7 +54,7 @@ obj-y += smpboot.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
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
index 295456d0c8..cb9b90591a 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -315,13 +315,13 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
 
 /* sysctl.c */
 
+#ifdef CONFIG_SYSCTL
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
     BUG_ON("unimplemented");
 }
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f59c9665fd..1602f4fd21 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -64,6 +64,7 @@ obj-y += smpboot.o
 obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps-setup.o
 obj-y += traps.o
@@ -79,7 +80,6 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
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
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index b4feb07e60..85a1adacdd 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -493,7 +493,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 
     default:
+#ifdef CONFIG_SYSCTL
         ret = arch_do_sysctl(op, u_sysctl);
+#else
+        ret = -EOPNOTSUPP;
+#endif
         copyback = 0;
         break;
     }
-- 
2.34.1


