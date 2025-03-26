Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DACA71050
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927140.1329958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpe-0000wX-Ni; Wed, 26 Mar 2025 06:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927140.1329958; Wed, 26 Mar 2025 06:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpe-0000sx-Is; Wed, 26 Mar 2025 06:01:42 +0000
Received: by outflank-mailman (input) for mailman id 927140;
 Wed, 26 Mar 2025 06:01:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJiZ-00083W-AA
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:54:23 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:200a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ed825c-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:54:22 +0100 (CET)
Received: from MW4PR02CA0007.namprd02.prod.outlook.com (2603:10b6:303:16d::33)
 by CH0PR12MB8463.namprd12.prod.outlook.com (2603:10b6:610:187::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 05:54:15 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::67) by MW4PR02CA0007.outlook.office365.com
 (2603:10b6:303:16d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:54:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:54:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:54:09 -0500
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
X-Inumbo-ID: c2ed825c-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS5U2wdPHPyqviX7lS3GuMDnxskm3zpwoC7mYVxIv+2LXlBt0nxc5oIX+06jPEUNMKxeYW94OkWvrT49Osrgj4xkn+TVtqxUeMABQl/MONrvUnhBpv+hUjby3L3kBtaBGrOQNq7rwQDuHTaVV9F2WSfnSbv8T7GjdIVRTlNmGcEhJIbmRH+Wr0BFqzD93ZTrCRC4FuEkinLpkWAbEH+u/L9lq7G6imKhUodWJQHGs9YgngWOgEP5O6guB13kYoZPqr6lpmWaeQBhMwNzV0X1/gCznijl69uBGYD81xaZYxDkLXDZPFDHFcFVU1ec0TPbDKZn0/RF9A3NLKIWoXGV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhP3wDm2HcbDP/Jr6t5e2kUjv8IqtbnFN3jumgtN+lg=;
 b=cjWNDXtKbsFvpevNtLr+AxXhUxN5Ohw4edLZKthcASXF/qD1ehXdSaEOKsZfla+JW3vBhRbyNjgy6xaK/az5u1JwzmERqFZ/DpVBGyAsx+VFaNGIR26KM5bdltlYXG7F0B27PxVhzWdwE7SkknKb1PEy4F9hbQHB+FkO9Er5+WhvCYVilasYdeUOiDro3BN6qo4tQulqO3vYd8sX6ri0SP7LWag9ee943I1vfnjy5ITpoanem2WbM4gNrSuy8rves6IfqjG4zCH3Y953U50oEX2t1+QhlOOViaeFFjDVIG9ZBjOvaQQrI9jYZWxCSsGSx5g6VBNTJmkZmz5KtgOdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhP3wDm2HcbDP/Jr6t5e2kUjv8IqtbnFN3jumgtN+lg=;
 b=gq+neaWufP8MsFu1dR7qxASYRCx40BCCtq0EAtgxFTNRkGW36Uiz4ROgNIr+c/1ESADfRas0XWBWcsjq8iM7rfu0qBf8yYZa/6aguKurjMiBHNZZ5MO88sgLIHguxfAayXreIJKqb0Ce1on1VTSeIHcR//CPkoIovrBArjMpvoo=
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
Subject: [PATCH v2 18/19] xen/sysctl: wrap around arch-specific arch_do_sysctl
Date: Wed, 26 Mar 2025 13:50:52 +0800
Message-ID: <20250326055053.3313146-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|CH0PR12MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f984c3f-90f6-49e9-2b77-08dd6c2aa3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hDYjutqxNuDyUQjNW1MwtYqbzXYz2TTaYUJ7b3FLUKT5n71jZgh93jcxl/qS?=
 =?us-ascii?Q?ccVebM8/i3OXz0PD6ibGLjXjh+3rq1G0gRVVv5enLoDMrr3eWXLlqdgDwayp?=
 =?us-ascii?Q?t9cLa8VmtU9+LYrf69Vhq0MPsRA+051kRLnRWNmq/lFRmBIpSD1sVQkyoYbz?=
 =?us-ascii?Q?wfPDSktill+iRQCMRqy+AZtwjcCcpUbncXf+wViwqe5tZ5xkyTfra0slL35z?=
 =?us-ascii?Q?q7WJnoYO7VjT0P+ayQ+mhp9Y+MUe1aLOJF8/fHbQXItxi/whgZaQ254JOPEG?=
 =?us-ascii?Q?apxAbzF0t6CdwZ9qwe+dDqY8ECDL7LyIAJE+aQPMif1/wX6OH7qgcjC4vd9I?=
 =?us-ascii?Q?9JDqHmWeIG57htStV5EPT1q6AnVouKeaEMtsCalEjlbfVSMgp8aP8mbtJYvh?=
 =?us-ascii?Q?Wp6ZMskfXCD+G1XyY2s/G2WaCEUMWjCAxHcpKWC4sNVjKQcADEyVZKAFV/VD?=
 =?us-ascii?Q?ixmPMZC4VO+uT05CM42iZXd9D4x1zvkEE2UBzdtu7VMk1xHxkF9Vwsh2PpFy?=
 =?us-ascii?Q?6BwucgMvuv8sT4H2pqqcvI4/nd77N325olMLzoHVxFX5wztltVlbvvHoqUGw?=
 =?us-ascii?Q?MBqs2G5PnpacTiKZb8R5Bt6EA3knS9yf00JzmEJKPtPxF89LKS0LgbpGJDXM?=
 =?us-ascii?Q?CTYcgSN05wJe06c6xVR+lzX19tkR6DpQvlL+O3FhwNs1FV9dRhjvnObzXFcS?=
 =?us-ascii?Q?o7B5ZkVnS7eAQqS03qdujdk0cB+A6vStVnxdlvQJFI5XX+/PAcXEdfEWhFUo?=
 =?us-ascii?Q?QDKRqpQRL1JuwTxnuwLm7G/FThek90rD5VgNOQHIayE8QTTf+YA6FHHROwkG?=
 =?us-ascii?Q?ep2IMy2dsd59651rXtwuOBoLMXAHdtbNCoAsbPohYPu8TK8frXZI2mSJxP02?=
 =?us-ascii?Q?VQkW01Y+DyhTQU9r68Rsu9yVlwXHGNlck2uD70wUmtWBl/OeQBQg2Z11CEyr?=
 =?us-ascii?Q?vLMlXxiTcO3zGQ2Q/BzD+hQzaAfZnBevwqyg0mqa+068j8GIOqTDIiTR8b0G?=
 =?us-ascii?Q?Kf39rT3lektc21HW8BuJlT8ccxcGC89IGEY8BuBRmY/+uzX2GxOJHunUrkmu?=
 =?us-ascii?Q?TqWRebXhBHNRnwuw5AUsfs2ryWWlBOqxB8/ta3LOP23U5FNTPCzpt7psiH1H?=
 =?us-ascii?Q?0lBKusjHuAgI/YCw+uvq3ssTIhvdXzGRNN8nxGeAKsKiywPs/YNXHfS4nx1F?=
 =?us-ascii?Q?0BwGEcasud3IwOJFPxWZJisyD0QGqzBC0Gt9wUGDltSlmfUUw7ZU7v4TDb3P?=
 =?us-ascii?Q?1GULNBiEfgpM/8PomHhRtGZfequZ04pEZNc2ffzy8XvCcI9N7VNZAQftpqU6?=
 =?us-ascii?Q?tZEQsRpWrVoTCMZR8phP7rl5Wh8soGZ9i9xwiTX9MKyu5oI8+A09aiI9FM1C?=
 =?us-ascii?Q?EtjClaZ8FT07QPhpy/RnPXRIi/xtsSypxC5VFXfnllhcxL8cKpUrpnK+F0sm?=
 =?us-ascii?Q?FkHjf2rIlpgLySucRht2EKOffqX/+wWb+jgRF3dvH+ikIcPgKuIZI2y0xItM?=
 =?us-ascii?Q?D3cvqTABfUq0L08=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:54:15.0514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f984c3f-90f6-49e9-2b77-08dd6c2aa3f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8463

Function arch_do_sysctl is to perform arch-specific sysctl op.
Some functions, like psr_get_info for x86, DTB overlay support for arm,
are solely available through sysctl op, then they all shall be wrapped
with CONFIG_SYSCTL
Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
we put the guardian in Makefile for the whole file.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
- use "depends on" for config OVERLAY_DTB
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
 xen/arch/arm/Kconfig   |  1 +
 xen/arch/arm/Makefile  |  2 +-
 xen/arch/arm/sysctl.c  |  2 --
 xen/arch/riscv/stubs.c |  2 +-
 xen/arch/x86/Makefile  |  2 +-
 xen/arch/x86/psr.c     | 18 ++++++++++++++++++
 xen/arch/x86/sysctl.c  |  2 --
 xen/common/sysctl.c    |  2 ++
 8 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ffdff1f0a3..aa1b4a6e6b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -141,6 +141,7 @@ config HAS_ITS
 
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
index 7b3f748886..ae865e1972 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -322,13 +322,13 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
 
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
index f59c9665fd..837eafcbc0 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -79,7 +79,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
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
index d7da476379..1b04947516 100644
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
-#endif
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 76622503e2..b0e2e43c7e 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -490,8 +490,10 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 
     default:
+#ifdef CONFIG_SYSCTL
         ret = arch_do_sysctl(op, u_sysctl);
         copyback = 0;
+#endif
         break;
     }
 
-- 
2.34.1


