Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D7AFAA19
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035085.1407362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJX-0001rt-Gm; Mon, 07 Jul 2025 03:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035085.1407362; Mon, 07 Jul 2025 03:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJX-0001mt-5j; Mon, 07 Jul 2025 03:14:43 +0000
Received: by outflank-mailman (input) for mailman id 1035085;
 Mon, 07 Jul 2025 03:14:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJV-0007KZ-GA
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:41 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2416::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8477790a-5ae0-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 05:14:40 +0200 (CEST)
Received: from BY3PR10CA0006.namprd10.prod.outlook.com (2603:10b6:a03:255::11)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 7 Jul
 2025 03:14:34 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::b2) by BY3PR10CA0006.outlook.office365.com
 (2603:10b6:a03:255::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:33 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:29 -0500
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
X-Inumbo-ID: 8477790a-5ae0-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MS9hV+vi0suzY2gAXozYI+LVDqqLkah72vBMVrc+AxVNRibvUn0yygWEDByTgKE26eXJpVFepFXABJAhw8yhhYI2mBs92rAVInr9upTO+KgMcNFLLzkjZlk0yoBdrVK85i7N+dUvx3SJxIvMVuIAY01bC2dG1yAphE7/2LqKammMeL0owXxMIFxDebFm0dKUmcQ9BHiE3bMxO5yQ5cu/MRBf4euhNFoq8w7d6zcdQEWeseU2HiYM+t60dJCGzi0MxWMWo53dw2WjNqD/YT0r/Qs7F1wxXM6BFVKe/MwsPLk6yMO8CoZmU6O9HK0f3ridnYZC24obzik7+eX2ZcOBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFLZ7b6gl3GP+IHNPjkhHrTHCTAFBKAP01UJHvvbNv4=;
 b=j+UoKIive99mGoGWM+NjEm4GXfUnQDurgoaWiFPuglupayVTk2n5e4Q/KGqG+OG0Fa95ljIUP8RU7xe08Liq3Ljlmt1Urv5cGUZQ8Nv4NNakInx4fAazBD5jQVeLmAlsOmkzt0k0zehIaoQ6sl4j5XpOBxRyQnSGB9o/XnCtj2PYxHfetfP6qYw7wXa8iZOJ8u8pwHFUxEHRDOb6OvB3P6VItkggxZNWK/WDAhC+PAzNUvJ+hg7VJa8Q5oy1cpw6GptfhkzGODR+96TpKhMOfSF1ruL+yfIN6H68A+jdPa6hhv76UY4sttMhb48JFpL+CIFpPsr/+sSbbEcD3w6NAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFLZ7b6gl3GP+IHNPjkhHrTHCTAFBKAP01UJHvvbNv4=;
 b=bKx5juODLbjzUcXBIWDn82E5ktXY0F1ghfRmEQGlZWK/2SMinKAbo3DICC2V9p6N1R8UhQlLwos4QF7pG6Qem1BNZjLzZpXz5bR0E07SaS6IoVmugOy4wALU3/cWlzFokEOLI44MTANK41mK3kpRfrzpymbPTY84V55RmW+JC4E=
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
Subject: [PATCH 09/11] xen/sysctl: wrap around arch-specific arch_do_sysctl
Date: Mon, 7 Jul 2025 11:13:44 +0800
Message-ID: <20250707031346.901567-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: a52ac6f2-5c3b-4ac1-3445-08ddbd0465b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BaXfton8BEftg5Mv9SLYJZBYw1FvlgFwvi4apAzbv3Gc7mKwc0WQg0koKP1f?=
 =?us-ascii?Q?xOhGj3vLPcBrt+WxyYoLczLD6xWmfs0vCoAg/vMct8Jt1JSO9NMolr84PMEy?=
 =?us-ascii?Q?fkh7ubqlUf7Aq6guEhiuzsxw4XjXR+/HULyY2A5/fs6gQPsZfIblCBFduqaO?=
 =?us-ascii?Q?jEyixvdGO1rUJ0Uua+45fl0/4T1CR1q4Dw4a5/3OyHxXDdlp8V9huFIgIwZv?=
 =?us-ascii?Q?xbfPdBOfYIzPQNYL5/VzuU1onlEeNZTvjW941POTfzWCeQ0zJ8dRQHEO00rK?=
 =?us-ascii?Q?jmrcBb57rczCaTE3pMvqET1u17yyoQocOTgLJkSqCgVCp87N19bJvdAfUUT5?=
 =?us-ascii?Q?ePMl6rZt1eE4F01+3uD3tBykF11AB56NSt/2+1ukWqsWlgefxJw8fXvsGhr7?=
 =?us-ascii?Q?DElKjUZXSoeaRPHfuSI96jJuKE+hFA0TYKyK5yXgiLoCi+9hJBQ9uMD0GLQ9?=
 =?us-ascii?Q?GNt+KKteuqf5LcWWm8hH1yolhAiKqDavjEBtdsBVhtN5Lp8mryYeTbjLwRDC?=
 =?us-ascii?Q?UxfEqEmSus9Kl/UQpzX2EWi6xykoneZHHcBT68PFGaOPSA/1KNKP+/OcBISS?=
 =?us-ascii?Q?flFdfjyldBJU+MxcoEwdq25S4rqOvRZvoWxhvYvjp28v6QmLxGEuGeaQsQpL?=
 =?us-ascii?Q?/jW8i3mmIwDO6xe2z1Y0vIC6h7HubqvGuqUBMCmKXFGTNEuY6M9HI2P9g7Un?=
 =?us-ascii?Q?v9Z1c8CaqwkE2hSqMm1wkiG2yq6mE38r8nLCqt6eaARAGwW/8xedkKt35EQ5?=
 =?us-ascii?Q?I2cK/TmxBHu9bcgRz9QS+6U8XFewho7IC9TnXWXgvmDArYkvR9Mce9Adorgk?=
 =?us-ascii?Q?VY5FQKDRRRxKZlURDFqXcygMJfEeKEcrCdwliF0h5IniZk2AWOs0tnEssQ78?=
 =?us-ascii?Q?fjtwFswXRI+aR1kfYvg5TGsu12IOSLTqMWoCxE0gGixBv0VOjnPWoqHSserS?=
 =?us-ascii?Q?wQvFvk/qAqFwu8Ur4fHfqQvm95rr7PYiwoKKgbxJjRdnd4CuIGGOtoGPCkyN?=
 =?us-ascii?Q?NAEy+Gi7BE1V2DEA/7nOIrFYY0AS18+lWCNny/hgf7lq4nKmpN2J6KqY25mp?=
 =?us-ascii?Q?4wdOYpYm3sIeQbweOQb+Wtb5sTgMPDVH5sEl29VMNFOOZtkufA6t8/V4n0rP?=
 =?us-ascii?Q?TamuleR09A/2mfYzxzI2nG/fdPlaSz5Ou7oN8AXV3swb3SqRc8N6K9VedFnp?=
 =?us-ascii?Q?vYihfzlYZALyagOIUSlLnwjC4RlHXx/OPhtxBPXtBYxVPn3NXriX3coEyxkv?=
 =?us-ascii?Q?Dvrmtnc90AuZmaUo3jWlw2+LnGtTdoU1KiuvbKwBTvsjhpg1mL87TxV4Twxh?=
 =?us-ascii?Q?V+wpHLtQ1uryV87glSiXb1Xv8Ti5rKTu7JsTo6wJiku8dJuUl+sPvGnG9BNz?=
 =?us-ascii?Q?rsX+2zYDQih7oykJKogUkyiPwlE3/m5+uJSe9KNh0rbwU1ADGOGvES/N/gFh?=
 =?us-ascii?Q?rPefGEtnnO4ckcrIqC5Pl5wIp3XNubiDSUfuiNOHcr2JsdgpWed46Sy7LQVf?=
 =?us-ascii?Q?ldPt4WMQXI5ISliZ3PSzFpZ33K1BCLLs8J7+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:33.8705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52ac6f2-5c3b-4ac1-3445-08ddbd0465b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557

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


