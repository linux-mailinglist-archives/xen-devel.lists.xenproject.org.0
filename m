Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18297C78155
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 10:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168463.1494489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNG1-0008Sb-Ev; Fri, 21 Nov 2025 09:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168463.1494489; Fri, 21 Nov 2025 09:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNG1-0008PF-BL; Fri, 21 Nov 2025 09:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1168463;
 Fri, 21 Nov 2025 09:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMNFz-0007sJ-TL
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 09:16:44 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca769b3f-c6ba-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 10:16:42 +0100 (CET)
Received: from CH0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:610:b3::28)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 09:16:36 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::30) by CH0PR03CA0053.outlook.office365.com
 (2603:10b6:610:b3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 09:16:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 09:16:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 01:16:33 -0800
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
X-Inumbo-ID: ca769b3f-c6ba-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URiExy++3xI81okqPzDOUpEHZI7F+TrGt709QNVdZIx6hYi+ww+GNcxv3M39UQDqo3NYkTXCaXcSA6dcPfcYfjz2pYF95Ecw4lv1wUOC7vDMSRszLRwO7/LHtexRRCdUZIsL1ZdW7BghfR+EIMY1mggchF3+CGclyyCaYll/NeRk2vTQ1Rbc/dr27z0TQQaAL5O+5GBl04duM0b67ySyxWjsQuSMYEuOhBdoNOKk19TtA3pCpttd1lpP610/2X+eQZuxAUvh6CCqdD4SoaNlkZ6hUpipO71GOcqFUBhHuZ/YIcFq/aq7LVDbAfBinKkyR/B5uKk92TfuhMesPtu14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4LvTd6kW2t3yqi/HCtygHWHtFUbYeEEurKMnhPvWLA=;
 b=Wl3Ub7HyzINWyrSkTHE5dgow9JugqZyQf/4grFDWdiOLBONq10ij4FxcEAlH4p8HbbJ/th8NOWb66mUkJnO3IwiC7k5lxBn4V9Bfp9PR2+YacW2G9ci1+fnr/7/PG1yWrQyBohNGTIsO7TiTiXUXGhV6wkbjXVsvizL02JdtH75Omj9H6Z9Sx/ngy1+aDPGR3i2HQRiq3OjNSxlVX8HRvb/SXSVDS0tSOSVcs8vJISIDCSJUmc60qIsutyhrIEA9Uswi+pWrrJeU7Ll9XTuC3tGN3GGKfbEMfj5Mie1KARYkV89K5o6/180NFfc9SxqMk6KEMidjzjfg4Yn46rdq1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4LvTd6kW2t3yqi/HCtygHWHtFUbYeEEurKMnhPvWLA=;
 b=TEZle0Ay8AU0hRE/ecGrxfm9wffXrSRiz06zD3eNKn/nacw+FhoJaHPkGWTzS1XOdoIq/ysp4F6ZzztICTbANdbpK48giNn67JL4PhhvB6qXzaqjrjSyA8ArfdxTMj2F9IA6/DK63zrK8wu8eZrZktDjEAnTBuYUiWq0mssDmyc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, "Tamas K
 Lengyel" <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v3 4/7] x86/monitor: wrap monitor_op under CONFIG_VM_EVENT
Date: Fri, 21 Nov 2025 17:15:51 +0800
Message-ID: <20251121091554.1003315-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121091554.1003315-1-Penny.Zheng@amd.com>
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f8629c-dfcf-4fbd-54f2-08de28deabc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y31gPR/uHkhSXxWDQyFEPBNHjFatrpbMyC34NjqR+vJARlXZ2DVwOpJ31zcT?=
 =?us-ascii?Q?/fR4HayekhFM/ilfu9c7JCBcG35skSK9X8MXUgXf11QqoQyvZ83V+8fPk2l8?=
 =?us-ascii?Q?q5SPWzHq6L0wY8DrfSOsgIanX7lZmZtWQRx4KYJyHD4eldvTTmtgCBRbRMY4?=
 =?us-ascii?Q?gWP+yguqs5pH4A3Myb6iadJ/qFmv1XUoYasR9gQy2Loih1I3L0y7c+7AfPLw?=
 =?us-ascii?Q?dzGDgI3C3d+XvkXSSqli7NQcwS9OVU9GKlCKW0y5tyBawL5ygoxzZIPTH7h3?=
 =?us-ascii?Q?tDS7mbzZSGgDhhoTDc+oVxge9zmoimxfDNmnw9TGxvGEFrLfxsuzBGJJtgsm?=
 =?us-ascii?Q?YlF9iHXSi8zSPVa4CsMOMuxDPEhunjDnAOK7Cpo/skMvNq31rE9TN2PUH+Rw?=
 =?us-ascii?Q?ZMscgj1rI1JkV7Y/Djoj4YgTphfxalsmJo27ixcAPOPgN/6Y0e5T3RexyuKi?=
 =?us-ascii?Q?0FX7wyNpjAxYKoVISea7QRlgwi4cm+8XzjwuIHQPX8tfx2OyQmYONp/RnSwb?=
 =?us-ascii?Q?MT+UiAILx2CdT6QhqFkteeddnPjUjTYsgkOKASC9E70DILjPDrKj2w7OIrNs?=
 =?us-ascii?Q?TPvU+bGzs5REz8EZY7YJFKV0/O8x/qZ1d12r2SPWkQTRg5hWQT96Yt+0Q5bz?=
 =?us-ascii?Q?4XgnyWH4k+rTYLe0nPsS7laga0gEvlnR65y3iPI7qv0ZXCAEdc8UUPv55xXM?=
 =?us-ascii?Q?dQ+W9a0euDjd+wWIm6d/Q05FHkwCOGh+dBVkxhbHLkqi0lAP2KRsyk6LQ7QN?=
 =?us-ascii?Q?YDxni+1p4+SXl5dnLGtjFDHCVxjb67bdPQrDmbCmSP+3/XY0Y93qOr16hh10?=
 =?us-ascii?Q?V3N+MPYXhbtJ9C9dTXVg69mu6K9CeS0Qj+Qg5s/3GHNZii/XSMz2wdgTVSSg?=
 =?us-ascii?Q?K3IW6nieWTKV2xwSGUXmS9pghk3to6HaSV22Y8y+0ZVKGzCLfYwbQFKi8g+V?=
 =?us-ascii?Q?XhW4ndH7L+CUhi7vgbH3n3swPcxjwxoy924sCNRkEcBQ2ljdy2MoMsd+9HN8?=
 =?us-ascii?Q?RLL4+yUXp3oJJ2y1MF3HJLnOJvaEaHvOp2yI+uacbTpxs9maKR1YTTmi9WdG?=
 =?us-ascii?Q?6En9rzs6f/XuuVnG3l8/ZSbzASvafxofnyPIfIaUcE+QN5Lak/OsBEFsvofa?=
 =?us-ascii?Q?rrsRvm0lHbTsRvO8MqKzuIuztpm6tKu43AQGxq9RF5iIfSwXCvT6bAY5ojDQ?=
 =?us-ascii?Q?U8g59a272/h5bzMxzlyJ0uTGXKTMpird42BYcAYS2i1uhmp8ZU/drjP3D3O7?=
 =?us-ascii?Q?c4baVo0bEhJ5C57YBDhezkvgcv1kcxGU9m3gtw7yn3MZ0hE0PbnVmYw4kcSS?=
 =?us-ascii?Q?3vmSw9Wbp0WjxliQvtVGN+G1C4IWrHjJi+iIny1YsLpzXEKMxKCMD7p8EZfH?=
 =?us-ascii?Q?wKcygM9mi82E3YotpbgxNY84zLKiwSa+GxDFOhgmBLyPP+elzaKaKxFlyNV1?=
 =?us-ascii?Q?V21pm3J1Qx8eVew31JhmNcB7OHp2szTR5XQTsK1hBKKEiGuBNP+Te4dbMI36?=
 =?us-ascii?Q?JK7oMXXAr9QQBjXhtC3YvQKhor7i9jb3NU+AcyJ+glE+bVZSitqZdIwINmRj?=
 =?us-ascii?Q?MIQvO49KL49Geu6vBog=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 09:16:36.2085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f8629c-dfcf-4fbd-54f2-08de28deabc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

Feature monitor_op is based on vm event subsystem, so monitor.o shall be
wrapped under CONFIG_VM_EVENT.
The following functions are only invoked by monitor-op, so they all shall be
wrapped with CONFIG_VM_EVENT (otherwise they will become unreachable and
violate Misra rule 2.1 when VM_EVENT=n):
- hvm_enable_msr_interception
  - hvm_function_table.enable_msr_interception
- hvm_has_set_descriptor_access_existing
  - hvm_function_table.set_descriptor_access_existi
- arch_monitor_get_capabilities
Function monitored_msr() still needs a stub to pass compilation when
VM_EVENT=n.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/hvm/Makefile          |  2 +-
 xen/arch/x86/hvm/svm/svm.c         |  8 +++++++-
 xen/arch/x86/hvm/vmx/vmx.c         | 10 ++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 18 +++++++++++-------
 xen/arch/x86/include/asm/monitor.h |  9 +++++++++
 5 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db..50e0b6e63b 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -16,7 +16,7 @@ obj-y += io.o
 obj-y += ioreq.o
 obj-y += irq.o
 obj-y += mmio.o
-obj-y += monitor.o
+obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mtrr.o
 obj-y += nestedhvm.o
 obj-y += pmtimer.o
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e9d39f59a9..ce4fbbe488 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -299,6 +299,7 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -306,6 +307,7 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void svm_save_dr(struct vcpu *v)
 {
@@ -826,6 +828,7 @@ static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmcb_set_general2_intercepts(vmcb, general2_intercepts);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check svm_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -843,6 +846,7 @@ static void cf_check svm_set_descriptor_access_exiting(
 
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
 {
@@ -2457,9 +2461,11 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .fpu_dirty_intercept  = svm_fpu_dirty_intercept,
     .msr_read_intercept   = svm_msr_read_intercept,
     .msr_write_intercept  = svm_msr_write_intercept,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = svm_enable_msr_interception,
-    .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .set_descriptor_access_exiting = svm_set_descriptor_access_exiting,
+#endif
+    .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .get_insn_bytes       = svm_get_insn_bytes,
 
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3ca18302e5..75e0ea8d52 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1583,6 +1583,7 @@ static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmx_vmcs_exit(v);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -1597,6 +1598,7 @@ static void cf_check vmx_set_descriptor_access_exiting(
     vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void cf_check vmx_init_hypercall_page(void *p)
 {
@@ -2476,6 +2478,7 @@ static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
         printk_once(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -2483,6 +2486,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
+#endif /* CONFIG_VM_EVENT */
 
 #ifdef CONFIG_ALTP2M
 
@@ -2934,7 +2938,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
+#endif
 #ifdef CONFIG_ALTP2M
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
@@ -3142,9 +3148,11 @@ const struct hvm_function_table * __init start_vmx(void)
 
     vmx_function_table.caps.singlestep = cpu_has_monitor_trap_flag;
 
+#ifdef CONFIG_VM_EVENT
     if ( cpu_has_vmx_dt_exiting )
         vmx_function_table.set_descriptor_access_exiting =
             vmx_set_descriptor_access_exiting;
+#endif
 
     /*
      * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
@@ -3215,8 +3223,10 @@ void __init vmx_fill_funcs(void)
     if ( !cpu_has_xen_ibt )
         return;
 
+#ifdef CONFIG_VM_EVENT
     vmx_function_table.set_descriptor_access_exiting =
         vmx_set_descriptor_access_exiting;
+#endif
 
     vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
     vmx_function_table.process_isr            = vmx_process_isr;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 56ad63dc57..a513f47b7a 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -192,7 +192,11 @@ struct hvm_function_table {
     void (*handle_cd)(struct vcpu *v, unsigned long value);
     void (*set_info_guest)(struct vcpu *v);
     void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
+
+#ifdef CONFIG_VM_EVENT
     void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
+    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
+#endif
 
     /* Nested HVM */
     int (*nhvm_vcpu_initialise)(struct vcpu *v);
@@ -224,8 +228,6 @@ struct hvm_function_table {
                                 paddr_t *L1_gpa, unsigned int *page_order,
                                 uint8_t *p2m_acc, struct npfec npfec);
 
-    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
-
 #ifdef CONFIG_ALTP2M
     /* Alternate p2m */
     void (*altp2m_vcpu_update_p2m)(struct vcpu *v);
@@ -435,11 +437,18 @@ static inline bool using_svm(void)
 
 #define hvm_long_mode_active(v) (!!((v)->arch.hvm.guest_efer & EFER_LMA))
 
+#ifdef CONFIG_VM_EVENT
 static inline bool hvm_has_set_descriptor_access_exiting(void)
 {
     return hvm_funcs.set_descriptor_access_exiting;
 }
 
+static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
+{
+    alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
+}
+#endif /* CONFIG_VM_EVENT */
+
 static inline void hvm_domain_creation_finished(struct domain *d)
 {
     if ( hvm_funcs.domain_creation_finished )
@@ -681,11 +690,6 @@ static inline int nhvm_hap_walk_L1_p2m(
         v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
 }
 
-static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
-{
-    alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
-}
-
 static inline bool hvm_is_singlestep_supported(void)
 {
     return hvm_funcs.caps.singlestep;
diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
index 3c64d8258f..9249324fd0 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -71,6 +71,7 @@ int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 {
     uint32_t capabilities = 0;
@@ -102,6 +103,7 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 
     return capabilities;
 }
+#endif /* CONFIG_VM_EVENT */
 
 int arch_monitor_domctl_event(struct domain *d,
                               struct xen_domctl_monitor_op *mop);
@@ -123,7 +125,14 @@ static inline void arch_monitor_cleanup_domain(struct domain *d) {}
 
 #endif
 
+#ifdef CONFIG_VM_EVENT
 bool monitored_msr(const struct domain *d, u32 msr);
+#else
+static inline bool monitored_msr(const struct domain *d, u32 msr)
+{
+    return false;
+}
+#endif
 bool monitored_msr_onchangeonly(const struct domain *d, u32 msr);
 
 #endif /* __ASM_X86_MONITOR_H__ */
-- 
2.34.1


