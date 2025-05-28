Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF2EAC6598
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999103.1379859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCxh-0007Bg-QE; Wed, 28 May 2025 09:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999103.1379859; Wed, 28 May 2025 09:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCxh-00078Z-N3; Wed, 28 May 2025 09:20:37 +0000
Received: by outflank-mailman (input) for mailman id 999103;
 Wed, 28 May 2025 09:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvs-0000yL-0D
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:44 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20605.outbound.protection.outlook.com
 [2a01:111:f403:240a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf03691b-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:18:43 +0200 (CEST)
Received: from SN7PR18CA0009.namprd18.prod.outlook.com (2603:10b6:806:f3::17)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 09:18:35 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::ef) by SN7PR18CA0009.outlook.office365.com
 (2603:10b6:806:f3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 28 May 2025 09:18:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:34 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:29 -0500
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
X-Inumbo-ID: bf03691b-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqEIoEtyMbT7mazyXLDeQZveaD2Xkr1HjysOWYRBmaJTAETGUd5DO+waHQxIFj3FjUlQqT8LRn9sk83KwGhLAVXCe5GU7AwRmazbnEsMWMVbx5d1+4SxRz7h1og7nVzEs07TgWeLsNhYlMj7Ik6RZu4eicbOgFQyyQn53akagHpXLPn+E5FBavgsybjundFqlfKXFoDx34YE9VIw/ApUnEGolKp4OHsKANYskAvKUsLfLOK2aBqr0sGVDnaGN0yJlKe6v6l415Tfq7h2/6wm/WpTBpj+GGg4/LN5lWDabGE0ZW685dcdgp9vLxQarFDwtHZUOvaGtqCAcSOzuKdxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us3XyiiEJ1jpBaIa5d6mu+gEoTYclWxk5heaEhLXVv0=;
 b=QNRzCHXrohzv1DfFURMLZchFFi/JTzVn12m48XWXJk/3LEz6rDZVnSXb1RD0qu4aDkYNvwWJdjmwKKr90yLFMAySMt5LCggnOvt5pJbky49XzfMJIqn3ZIY1VHVgPBo3PPRkhGhNkhda2LG2ST7tgUbtlVEp5cQV1miu6Zbqg6xI0IhpVMg/QedlyEOsO/850bDHBkEaBLvu+h8YkFaN668+e70YQEZqgUlQvp7gyjIgtQlXKWnnnJ4rd5zGskAnk/JJma8Sa66GseLoZe/TcH4vyd1tJ9FLcGa8y4pRsWsTnmhJo2YkgiP2Og2Q0698wnYOMXDQtk/liYJahD+Mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=us3XyiiEJ1jpBaIa5d6mu+gEoTYclWxk5heaEhLXVv0=;
 b=Y48suomkiZkd7U0uceyFN3JcY/4AaKVSUbbrDUSZ2tVnmLo3L7CEg2pMYP/93bQPzFcf6ismwv+M37qluOvS82HqmLbzWpRv4er84ur52xwKZ9G0fTieTOOJJwhZTDUCVkF/zIj1izmKQnDaPu/64HUZ7W/wP6hqTGar26Dymr4=
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
Subject: [PATCH v4 19/20] xen/sysctl: wrap around arch-specific arch_do_sysctl
Date: Wed, 28 May 2025 17:17:07 +0800
Message-ID: <20250528091708.390767-20-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 256563e6-d0eb-485b-a43b-08dd9dc89f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FJG7a1T1UAyxnnL3LGwyUKUz1vmNOSoWNHc+MUPOtuaEiIvrJs15vgXyv8Op?=
 =?us-ascii?Q?2kLfsW/w0KM0+Qt1L1QvWoDt22bkVOqrUrQ5CCYa/j2raBT7NEuTX+YW7anq?=
 =?us-ascii?Q?CXv7oSyyIN584M3/0K7aWi5qtieeW9EQW39/V4QSVsL9Lyl1L8n4xbKECMvo?=
 =?us-ascii?Q?3OeNRCyvntX6vGH/o+Lw04XmfPf/q5Cb71JBTDy4Z9BnxnEKmz5kIH49Rsuf?=
 =?us-ascii?Q?ctcb4TsY3CGwVx+4lTg0uN2dt3niUgCtFkJSYQHiRZ8IsJubXdC6mHwEbutP?=
 =?us-ascii?Q?/A3L0OmgOcQEeiGCm+xb8SKQWLGYcIg6BH9esai2rJLHNl+VYExkQQHMJHmi?=
 =?us-ascii?Q?zMBBmN6oK6KwKt/2/Edlk69dL/ZyPcmeP4yBfT+jWi/G3GYCwr0UhSEyK/eG?=
 =?us-ascii?Q?2fzFQ5b/0rUaoiGCTTyQHCrBnF+rkbKn8DvgPzHpYsuDMywDnwRTxAK8SCzQ?=
 =?us-ascii?Q?XZBOfNe0MbFoYcLGYLqY/TNINka/M7MhOtX/tdqWV0gImKN/B8XihZIxVz9j?=
 =?us-ascii?Q?KPw0TvmBe0V7Kiy96BsFlRIswT+GXkQdS6gGbLebk5hbcXfGsvtIrt8jSx0R?=
 =?us-ascii?Q?lJkLLb+DC/BcFVEgXJkf/Qe8g/BOIpBfN9xYr81bYfYi9PuAnC3+hCBHRhjj?=
 =?us-ascii?Q?PUEr6YE023qwCForQE/PDP3GD9BqMp7Kb6IfDjNwCbE86B7s3QmE5IbThT02?=
 =?us-ascii?Q?wrO/fc9NR72tNbZpvSHbyVIFxIMp5k8TDKWnioWj24Rq8kBifsIjMx7RcwLu?=
 =?us-ascii?Q?17hCOnIiKpEmScLaRdZC01F16t09qeDQRm93b4dQxC+i4fl42WWBPJ8BTsWD?=
 =?us-ascii?Q?q95mVW4b6Ddjel79qOOm8IhrSBwkGQ5A3JFqN+LxuQu0rP8QpGPoMmWWRPaB?=
 =?us-ascii?Q?fl3w0J+Ujsjt3uWNo1Oyw0toRkVSuIIArmTck2eVaQVYzVX7MpoAFoiOE9HH?=
 =?us-ascii?Q?u79N5f+rF0ri5iZzHijJfqp3kzfb0Bc5ddcT5Hg4bA1aYVbEOgJzfyeWM3gP?=
 =?us-ascii?Q?02nSvoZcz+kejeTQwuSITi8lLpCFxMD3joa17/npS8okGFKifvzHMoVznsnl?=
 =?us-ascii?Q?D4Mj5d4By77wxbdpqV9lAFRCjo+3MsUCtyP8VsudmkFhR19MdGZbRUEGGVZJ?=
 =?us-ascii?Q?zzNIZX3YCkBo3VEh3wS3JsMcZrbLm/HfRkkVvQvpEMQS5D1RlbCVxjywTRYR?=
 =?us-ascii?Q?b/aBPmXe5yT323BwKCN2wy1LETeKmO+pQBpJW5Y9ANBdgUdG/1ruwCrYtCIb?=
 =?us-ascii?Q?PQ6S1BiZ2lgPVUo1kNpwpk54QZq88AyumUMqRPBnvCh7pb8u6rrts44urX5Y?=
 =?us-ascii?Q?GFN/+OjEULxwyRAw3rmXTsH1/A0mSZmHtUHR9715xdXC54TtZT9LBXaHaN1C?=
 =?us-ascii?Q?pyZQFJHIjKS1bn3DF+uf6BaSx2N5RHayL/e/rEsynWgShsDZhyB7hIHZiq62?=
 =?us-ascii?Q?0xYg2/3YgAsgtyQYmIFJrchVg59RWYc4fGqxYx08447afrNZPfDG3Dob6+1U?=
 =?us-ascii?Q?cTI2X6KyPNU3hX++ijUkjOIUHaNfkHUU+R++?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:34.2805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 256563e6-d0eb-485b-a43b-08dd9dc89f05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079

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
index a5aad97a68..91a77560a6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -139,6 +139,7 @@ config HAS_ITS
 
 config OVERLAY_DTB
 	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	depends on SYSCTL
 	help
 	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 129a109d6e..dd455b4773 100644
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
index 295456d0c8..cca3767249 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -313,6 +313,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_SYSCTL
 /* sysctl.c */
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
@@ -321,7 +322,6 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
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


