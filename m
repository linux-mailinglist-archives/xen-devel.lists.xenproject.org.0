Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B30AF8EED
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033202.1406667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcvS-0000iw-Vs; Fri, 04 Jul 2025 09:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033202.1406667; Fri, 04 Jul 2025 09:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcvS-0000gf-SY; Fri, 04 Jul 2025 09:41:46 +0000
Received: by outflank-mailman (input) for mailman id 1033202;
 Fri, 04 Jul 2025 09:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXcl7-0006x0-8B
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:31:05 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2416::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d37eb5-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:31:03 +0200 (CEST)
Received: from SJ0PR03CA0101.namprd03.prod.outlook.com (2603:10b6:a03:333::16)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:30:57 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::66) by SJ0PR03CA0101.outlook.office365.com
 (2603:10b6:a03:333::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:57 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:52 -0500
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
X-Inumbo-ID: 99d37eb5-58b9-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkbFTsu/YCmQtn2n8TPAAdP0i65GoOyXAwn/xyClmxDNddE047NmVKMwiF67VTb9CPR4D5TmlPNgfUK6eK9l7QiD7+7vauY0JJyDxG8n/CjabemK33I/fcktuy6OrPyO5/XP43SkXjdhnHwkQFXtjgCQrVT49nNgTJdbaFkP8aWNbqYcU0qhQamaSfb5wRrXqlveqgaGmWhamiJviRU+0HMpd9taWUq6IxynlXGKqlhBWVCFwFf/DPRI+sU5OpJvQVgztA4xu8UzFxVwl6YkQrZqVLFd1gtrx79PtltysL5UDwruWKN8AUVGNR1OdqNBfn52KQFidPDYD3llJymsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFLZ7b6gl3GP+IHNPjkhHrTHCTAFBKAP01UJHvvbNv4=;
 b=JeLtmxB/8ufRdoP8zlRChN3B/SCiumqWsxsYDXi3v/yJ14jRAPMf6z0z8AuFzSpaXVeuWwCSlRfvS9AGL4L+dF+BrXvPJEuh0WDc6hiF0aDvBiwI9BiQI/fH0cxeCajSS1RG6dx6YjKaO4KLcgLDKrn03FjX2nSKpLpp4hng+oMI3YWOGexmSr+ibW2l9ekMSrxjg/mdxFPWS4CVpZm9N9LfUw/KVjmsYfmAeyDkbiKcW348oLkFKqKPNJ6chjZ2EAWQJZryZUb7IeIzRM2oql3FbGHCHndrrLll7o9wW5Cm/knekO5dOnY6AQeDkaB93LZEYzeX4HSV8jOA1ZnuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFLZ7b6gl3GP+IHNPjkhHrTHCTAFBKAP01UJHvvbNv4=;
 b=sisBwPAgVo5DjAWOX/ls8+qup7s6IwDLnFB4kOawpsrWWul/U8DGGBHtxh91B+o7EXRkPUgIm8RCcZ3nAi/Cna3E/JHjjLePRSdO7hpNPr3NMkSxZJVqFgoXf9g4iMUa88ZN7L9TLe6w+Tu4nlcHrXPaarxsWvMW7rTs+wEdf48=
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
Subject: [PATCH v6 16/18] xen/sysctl: wrap around arch-specific arch_do_sysctl
Date: Fri, 4 Jul 2025 17:29:50 +0800
Message-ID: <20250704092952.822578-17-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c8a26b-3ec7-447f-85c8-08ddbadd7b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KxHV+irsv3/P+sNVzmL6+bHDtnG2SZSHxpWEJhttr487ZoQFE9EtcReR41P/?=
 =?us-ascii?Q?H10ezaUXbMWLJSItaioeQo4CVs5AT22cesUWkS4cW/tVoqdLYoY34ydZgI+c?=
 =?us-ascii?Q?fL6GswFwPPYwjs3ZnZaIuMMCNOzk/YjgumpzeoUCVgzt62IalIavG7dLFhSM?=
 =?us-ascii?Q?HsmXDqK3ch3IFiUg14izR70pEpQxJpnJ8hg2ZFSSD0YK37fAPRsdNgog2TNl?=
 =?us-ascii?Q?6kdWP3t6jsjwRO8EN+tuoOWhkXy4slspd1car1nW22VqNxVcLmoWe2RTXal5?=
 =?us-ascii?Q?uPlakwUMbXayvi9JrPiizFGz6qstkoWH/Qbfl3Jd+XhV2vDKQLZzbXDBl2L5?=
 =?us-ascii?Q?xHTDvngKMuLEUZZncEgF9TuzdFvVjfEZoA+BBgKUFeDoYuO7ZI9m6hcJugTd?=
 =?us-ascii?Q?3n83yG2wazMOkInPVVRQjLh/wKn7apBis5s5khs0cL0ui/WMpRp9Au/iaOXy?=
 =?us-ascii?Q?TaoDEgwFy0fE9KNZUgOn80m/Jflss9opUGR0jElHFhH/ZurijggfJq4uu0/k?=
 =?us-ascii?Q?Ow+BuhK2BWb/lFQZ2PhzaNXXJhy8b7ubjB1w3OfgGjSSBT3ZsSdrym63nVGf?=
 =?us-ascii?Q?1R0aBqgTVQjfXl0pq6Mkuy/EvjHpptlGMjmKV1v2SqJ1S1T6fq8gnNNawmlD?=
 =?us-ascii?Q?JIgMEu2F7PWPNUDOjfO4muWaF9aKvD1lf+PnuOZaOIX6idl/1rwwVLgPS5Kx?=
 =?us-ascii?Q?4wnYGqvaeqA3SgKFIWrI2xZyuOUZX3BN0bMmqIbkM458wP33jWQtp3hRabfG?=
 =?us-ascii?Q?9tAKNqx0Vq9K/byhmbcarlZnDt3ECKKpxZgqL4fDmSAwsWcnzdl5q1qJtUyc?=
 =?us-ascii?Q?haxG0o8y4jS9bBEy3PaWqXEmMjAjStuALF89OYNGx8cC8x5UY+fi8Oc+G+ub?=
 =?us-ascii?Q?Z13XeMj9Hwrlsbf4IfX1BzgGxjYHVvEEQNM45SIFsXVVez1p6Y+pISu5vCA2?=
 =?us-ascii?Q?5GzgBK8WXCeUZzk+KWNBxBM4aq8SSFjpLVN4pJ3FpoXb6R5dBOf0GMnHqlCe?=
 =?us-ascii?Q?EVj67iEHjVJyCaaZwQ96PswAhD9/Pm/3b1TBB7JzoiBNH7r5aR1516ErP+6E?=
 =?us-ascii?Q?Xpm64YJlrt21bYJuGXb3aaNzlXC4rgW+PYHMWoXDvED/90UnC9+YOqza59xw?=
 =?us-ascii?Q?tMtodGE5DkbXFVu7KtyR5G1Wk+r9Da1U3lUsNmxOSZy6dUeM9RhY3/pLqTP9?=
 =?us-ascii?Q?vIDom4uadyBbLrg4mbsiZvPYxQYPBB5LgAipfDvXzk5U7ZxAt6hsfTDhR9ys?=
 =?us-ascii?Q?ewkuxWNA4lDnh3XSm1F3Pn/KNml2YAutjRMI9pOI/P+nL1HHnBhDk7VctfiF?=
 =?us-ascii?Q?+NJgllb9QkElaZaFhHzt6ULFHbHvd8m/3oVsOPU5WFt1Z1UmQywixixuZBoE?=
 =?us-ascii?Q?jqt//cr2wjn3iI/Hu/kYuQvc94ZRBP8PXlDIxvxK3vuEjsDvxnPVmTvJLqNF?=
 =?us-ascii?Q?pjBuFWY8brFbGvszL/NMYF+kWbgOFPdBNfEjq33lrYIKG2zpH9iXFfF/5j/t?=
 =?us-ascii?Q?FbbzPt+CttQld3isRjBr15yjJqGaaIZwfUBO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:57.4933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c8a26b-3ec7-447f-85c8-08ddbadd7b56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601

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


