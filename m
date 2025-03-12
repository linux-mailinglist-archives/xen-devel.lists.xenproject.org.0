Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFEA5D500
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909761.1316693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQY-0005Xt-1E; Wed, 12 Mar 2025 04:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909761.1316693; Wed, 12 Mar 2025 04:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQX-0005V0-Qi; Wed, 12 Mar 2025 04:10:41 +0000
Received: by outflank-mailman (input) for mailman id 909761;
 Wed, 12 Mar 2025 04:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNt-0006o2-1k
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:57 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2417::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9272a07f-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:55 +0100 (CET)
Received: from BN9PR03CA0514.namprd03.prod.outlook.com (2603:10b6:408:131::9)
 by CY8PR12MB8299.namprd12.prod.outlook.com (2603:10b6:930:6c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:50 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::93) by BN9PR03CA0514.outlook.office365.com
 (2603:10b6:408:131::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 04:07:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:50 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:45 -0500
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
X-Inumbo-ID: 9272a07f-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPrlNH7+r5ucrknBPN16oRBDMkLrYH7tfmzKJE4TM86DOA+rhTeU737X+jUnp7nIGkT5+tSsDIv0ibHr9uxIywVqElbHX/pYKOw68QXAORmfLcL/ptjFp7ARD5MPR8Czqh+ELZ0EStYvcdzLJ2eU4BrO1Vo6wdXT50ZhOmRN15s7dedo582yvvw5VQlg1bYJogzzUENrlj6o9CuXFcNGOCC6ZPYTcn+7Vx8GEfcIsQcTHasl01kSwnmzpkJnSqCGX3wKuJBGRWqINzzWnfEhIWhmGTFswAOmfaZ0DrliznLjSJ6zVPYYcvxP74oTNqtdQrH325xKp99VnMJdV+bS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43BgmY4i5cZIm1j7X2+C+muvoJWuYwilxkRMR7zAawM=;
 b=rOZKbzUAO26c/DGIoDxv1dtx3rr0OsOt7J2RDod+9/bPQxvioTDG2G/7go2AUi8sCGkYkeJArLdjJhsT80oUbSbsu/xLfxdXx0CKLpap89IUEBC8SxVBEMeTExHycucPEGOvcl6WFnZ4/xa//6bunStxp+m1JBycKDSzFGyrZBdc6x7Wo8Hlb8kS4H4KpqlOR48Zkpxf42K6z1i/4GVLcp5JldAAowRK7/HHF/JIU0QTyEiGEbPbdyFAnMQCmm2BAuY9A0K23V3Eap+gUI36hza7o6PIXFNfCzocaATaJfF3xqMGIZNUdPq5Z7VdCPgmcm/1belY8U3dMaQOhjMplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43BgmY4i5cZIm1j7X2+C+muvoJWuYwilxkRMR7zAawM=;
 b=N0EqCfGDNvfYR+CWLFFWkKv7OFyQcPoSIUq3Sop0oxmanAJOqJWQItk3lB7B3eh0JHQ0mM/75eUPTYRZTVNFaG7C9i1K0Qj0CohkoNfOrVN9qYo9HBeF5NjbL9J3Q/cHXWPI9Xa7TSqOpepSLPkYc/t+1cUlhMe8SCZATnVIIiY=
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
Subject: [PATCH v1 18/19] xen/sysctl: wrap around arch-specific arch_do_sysctl
Date: Wed, 12 Mar 2025 12:06:31 +0800
Message-ID: <20250312040632.2853485-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|CY8PR12MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: a6497d8c-6b44-4853-e365-08dd611b745b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qLxWzcsuNROObUlkHKxUCO7ocpEp7Ir+wWsn//kbBZwupNDHWBUDlpJ3UA2S?=
 =?us-ascii?Q?giF0JvSyV1ezF3lqpRQMz/iY5l4UifIXN0uuS9Wt0Czqq27JIOZJgqG9ewQu?=
 =?us-ascii?Q?ovJNZaSDvwDblqcUf8KpB0MWTvXZFnBEgxCeSR8fujzqsXJGsZpVQAq7yyZL?=
 =?us-ascii?Q?axT1J28tXGlU5n7AtsTlsC7LBnp1sUVMLLw5ZKMIeb0U2EKebZjSXvd8obu/?=
 =?us-ascii?Q?1tDTpn64bkYFOXaxJSzB2lNfVGGyP6l3gX2LHrkeCOiAmTPlLyrZj6QAiSG7?=
 =?us-ascii?Q?ZoWLbWimb18HP/663aU6OwRqUTR7aUO/dJAPVz1+JDLa5ibvnvRtq1qWV/Kk?=
 =?us-ascii?Q?HJcpPHumObqZEsldhdRgzZQnSWBfAHBzbM91348EYzxy3wk4uW+dKHRmkfQV?=
 =?us-ascii?Q?F4RrmovOgJgRf4UdlHZPs5TfzEz2neT+MjVN0K4G/MqM5y4KTmPI7QEnMvot?=
 =?us-ascii?Q?Y74gmULEBH/QjOhPwwgr3fxYzPb0KxrunfU90kJSPfTaHGc80wudWsCBJiVd?=
 =?us-ascii?Q?qlbcGL1YcPQtVk0G3VMACa07Qs3ASYRsMFDT4w1bU9ONq74bGrTC5AyeECGH?=
 =?us-ascii?Q?4WwcAkPZ8YjndEIWaYpDY0bfL6kABiDb6dLSv5UpxpJdCaLzPn4dudUE4A2i?=
 =?us-ascii?Q?2vZG/ispsvSio1Q5AfyPAdNl6mopY+IkbyveMb7Zug5nmXuux9yeR7xa/etI?=
 =?us-ascii?Q?gvkA2xwPVm729rmy1J73R6eAJD8s9ASwWDsbjoE8kTP6SXK9qkifsLfeoqg7?=
 =?us-ascii?Q?BUDo37dVD7IDhCgwXC9WsSRFgYgV30TNOuhvjz1eVACemG8z0w1qK3Gw00+t?=
 =?us-ascii?Q?YrFSMcnV7gujcT4xy7HHibX5UVCRhYE+kbrtFBpw5Y+sxeQhjhagxAi6aznO?=
 =?us-ascii?Q?fsXLBVfVH9hBEoDEJmMP/hkgllyjpbAo0ouUyCYimlM60qRXYcvTD5RPqiPJ?=
 =?us-ascii?Q?8afpya1bRPKFGIKjJBzvVM0F9Sk0Y9xwEBmPSE6+GU9Q6gemNBM0r9n4U5bB?=
 =?us-ascii?Q?RT61Ug98m/QubLM94JPcf49uCxhbZk1+SX1jHc4iUqSheVJEPlnGH0FpahxO?=
 =?us-ascii?Q?sXoyqEYhSrXmWUqfTAvSAdOO9bxFxMvXn/DG+KdfKDUhp96zgPTvk1Dk7uqu?=
 =?us-ascii?Q?4Ue3eFVl/NzRLa46H3o8qUZ8KDA/Z8nCcai2tMt3NHPgDXlJXIm9xg1plD3F?=
 =?us-ascii?Q?hCibqGZf/Hlc9fWhqy0AxwMLjvIrh6qWrQICeZMcwIDVxUtsDwNPapZGig2z?=
 =?us-ascii?Q?vZa3XRlabSM/nknVMNPMIdrQ3zXeQJ3Y9thi66uM05g/zTFbdJCayL9/B7vt?=
 =?us-ascii?Q?el71tspOUwfJDuAszIS3Xl6iDsvhC+0qKhe333aipPtqcesvM0kvS9kh9rdT?=
 =?us-ascii?Q?DAOIoHtaXa8Xk6GHeMGSBCIGO+8CtbDLOTqjizkbQlj6d6eyv6T3ObvNnqYW?=
 =?us-ascii?Q?YLApMqeKxLEveiXrqV2xjQwBui2juDLB+VKaoFaxzrOg2hM5KZJkKAAeolL9?=
 =?us-ascii?Q?khobOza7674HQF8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:50.0200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6497d8c-6b44-4853-e365-08dd611b745b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8299

Function arch_do_sysctl is to perform arch-specific sysctl op.
Some functions, like psr_get_info for x86, DTB overlay support for arm,
are solely available through sysctl op, then they all shall be wrapped
with CONFIG_SYSCTL

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/Kconfig           |  2 +-
 xen/arch/arm/Makefile          |  2 +-
 xen/arch/arm/sysctl.c          |  2 --
 xen/arch/riscv/stubs.c         |  2 +-
 xen/arch/x86/Makefile          |  2 +-
 xen/arch/x86/include/asm/psr.h |  2 ++
 xen/arch/x86/psr.c             | 18 ++++++++++++++++++
 xen/arch/x86/sysctl.c          |  2 --
 xen/include/xen/hypercall.h    |  8 ++++++++
 9 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e1182..001e65b336 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -140,7 +140,7 @@ config HAS_ITS
         depends on GICV3 && !NEW_VGIC && !ARM_32
 
 config OVERLAY_DTB
-	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED && SYSCTL
 	help
 	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index fb0948f067..5819c7e4d3 100644
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
index 0321ad57f0..28590efb65 100644
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
index c763f80b0b..1949c4276e 100644
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
diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/psr.h
index d21a59d98f..e466da7428 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -75,8 +75,10 @@ static inline bool psr_cmt_enabled(void)
 int psr_alloc_rmid(struct domain *d);
 void psr_free_rmid(struct domain *d);
 
+#ifdef CONFIG_SYSCTL
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len);
+#endif
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type);
 int psr_set_val(struct domain *d, unsigned int socket,
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 5815a35335..34d5de8d2c 100644
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
+#endif
 
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
+#endif
 
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
+#endif
 
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
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 15b6be6ec8..d0ea64b332 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -29,10 +29,18 @@ arch_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
+#ifdef CONFIG_SYSCTL
 extern long
 arch_do_sysctl(
     struct xen_sysctl *sysctl,
     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
+#else
+static inline long arch_do_sysctl(struct xen_sysctl *sysctl,
+                                  XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 extern long
 pci_physdev_op(
-- 
2.34.1


