Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA5C77C01
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168295.1494380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLt1-0005Ur-II; Fri, 21 Nov 2025 07:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168295.1494380; Fri, 21 Nov 2025 07:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLt1-0005RV-BN; Fri, 21 Nov 2025 07:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1168295;
 Fri, 21 Nov 2025 07:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMLsz-0004J2-UO
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:48:54 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 857080ff-c6ae-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 08:48:52 +0100 (CET)
Received: from MW4PR03CA0003.namprd03.prod.outlook.com (2603:10b6:303:8f::8)
 by DM4PR12MB6568.namprd12.prod.outlook.com (2603:10b6:8:8f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 07:48:43 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::96) by MW4PR03CA0003.outlook.office365.com
 (2603:10b6:303:8f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 07:48:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:48:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 20 Nov 2025 23:48:39 -0800
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
X-Inumbo-ID: 857080ff-c6ae-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ggke7/85Xt9z98hE1Sy6QnaJ3iQ1kVkieZkS9Y8DRNB/cxNZoV9iJVws8qQo0TSeROnuFbF1svAvH4VOreZa+IIKBY+2uBfjeyi2RB6JpzEUwJFDar2bF1xdN60viZ9DcaY6QdP1SEA3dlG3SUqjMT8dl6zWZIKzfyUBV6Qvc091ceVW7vGW11RoUohKzgCCOILsfyvm/eJ2kaxDEeYNyYiO0CyMSQgNKNymy9LaCMtHeTNDBrYzt588vlJuD/bfx96/5A4DLIrxi3VDuKbET3pqjddMaOYZmQVnohsfLpLMQH68JZN8jyySMXiRlMrUohV7x543MO1XDN3CdSUcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4LvTd6kW2t3yqi/HCtygHWHtFUbYeEEurKMnhPvWLA=;
 b=lDc6SCs2OqJ7aHktNja95uld0Q5kwQvclcqc++4hcXNtgKyBgePHoHb6EM6LJqC76fDwHfZpEIMUahRote3Vaa6lYNJB+znGnVfkUw1bfsckts3RIN7ntF3jaTj/Z3UlPZO8OkL8xhR4k/z65pkjBy1xWiPrm88Y2kyk6ELAHl554l95/5xIxL0nUEcM6SVL+wU2g/DXjB86SlqAoZQtVggkV3v9dvzXOMewBhZlXRreDInMN3MOJC5FImp4sOvfYPfrgro1TiDcPzk6+d08vfvi+NNY4szHDqRmXAbRUQ16CYtrbivsjnLxsm6e/zrBR7+JJGaRjXKJEkyakWNkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4LvTd6kW2t3yqi/HCtygHWHtFUbYeEEurKMnhPvWLA=;
 b=nz10ZbQvJ2gb5qNXWJif/tz+vvJDBCOAmnE4k11nebhO2cz0XyqTmB0kUj/REdN0MbwNypVMpTGw6bt6vF3W97wNCUq5Iqd1bwYeTxRkE6MarW1wt0gW3NgsfyXLU2tqr0V346Wxw7IpKLQqhQ5k4AubgDmxzCKquNh4oZNrfO8=
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
Subject: [PATCH v2 4/7] x86/monitor: wrap monitor_op under CONFIG_VM_EVENT
Date: Fri, 21 Nov 2025 15:48:00 +0800
Message-ID: <20251121074803.312568-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121074803.312568-1-Penny.Zheng@amd.com>
References: <20251121074803.312568-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|DM4PR12MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fe33b7-f42c-4aea-8acc-08de28d26495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LhkFzevuC4DukLUpy7AAZeKsMcX46PXau3F1KhyAyhSuDuh5FeITZyaRu80a?=
 =?us-ascii?Q?kXSVASAa9Mz/+x7ov3mRaDjn1lo/O+XGt4uS5WbG2YLjXHN03rFbBVq6GYsC?=
 =?us-ascii?Q?+M93uCwSyLP4uE7XdDNpM8t/Wje3xWADuQjwLdsUcW9L0/k3Uak+tQaLAQJu?=
 =?us-ascii?Q?oUUQX5URsc9AJLEegww/oEspC9397ujWLNuiRKLqrRXEt3UKZ9fgZzR8D8HD?=
 =?us-ascii?Q?puCg6jp/wn7ibKUjhkTKBC6+vsQ4aaEk9v1O0hytVrPCmzhH8Dkpn+0r+3j4?=
 =?us-ascii?Q?ISLlRpNfOhOx9NbHAUA59BBwA6rUw+2qVIFpjl5AIWOIfZsYkCdXRUm2e/n0?=
 =?us-ascii?Q?uZFpVQrs3HeSCWWCn995DhUQq3FGnAEOP7WQJRw8CGwRh81S3DZtripNF/F2?=
 =?us-ascii?Q?mGvmm3lrTgmze+kOGztiYJoObA8EDQwS1bFSltoMRv3h0wyPGRko273CYyOG?=
 =?us-ascii?Q?zdVbjha+diNQo0mQq/RTotUbUnlshizYagdUG8Ix1tT4ZJ1cvSeLwQSGSbQ9?=
 =?us-ascii?Q?8QM7oD3x9jjMCS0wzEMmaZbmF/GREda+e5dHysQwk9iNOUzxf4RduuhDI8P/?=
 =?us-ascii?Q?yPlwtUI3nQOgGXNsFr6cptfu4MrCA8LI6fs5MIbu1rhRg/f0lyup+Y52m6Lq?=
 =?us-ascii?Q?42zgv8Y3Ed9kom32c/EPrL2EU1Oz6zjQNaby0S14DDlBdW9HeO9DvFwTjznk?=
 =?us-ascii?Q?Rw91cQPzorBoC5B0PKcaz2pdip57t+QqlOQLSuZS7phjJEHVZff5X315vXfn?=
 =?us-ascii?Q?GrhtTfDMT9HqPiz3ArpZXqjfR1PRrCzliLtFjhs6uRywVZYuZAuQuFl0KleL?=
 =?us-ascii?Q?AluIJx/ZtTFJs2tFCwXAw/jfySBvr1n3CQ1S3rH0RvIsjOloCGmDcEipaRc8?=
 =?us-ascii?Q?+BqhcBmk5UWwUgKDEYhbhx+cO9PbSkI+T9nb4WLHHaoWnEg73V3g1oH64fkd?=
 =?us-ascii?Q?N7UnnYbiijFw5nntFAZ/VvB8NHAp1Jn4bKxQBB9jP9lLmkTPbWhOIfgaAoLx?=
 =?us-ascii?Q?Kpid+NMno2K5fyUFJp3shVAFVfnX/u7Jc7RGAEQXTSYY2Gl0kwOygkpxaovC?=
 =?us-ascii?Q?pT5sgUvS1veinpbzOH4lLHgIoZLTlvCFAmHZkTTBuwH/0+itGhcuHLe/vKTV?=
 =?us-ascii?Q?FNWEyjy0HLp/095lWvZE24IcS8M0V7+HnXf7Uw4ppXZ0Gbl1n63+nSQochE5?=
 =?us-ascii?Q?i/H84XX9aMKH4ibd7LJYJhimQmmVMc5QDQNe7/aD7UuXpP6arvy6jZma04+A?=
 =?us-ascii?Q?YWg24CZ+MFQZq45RmBYGx9gAKWwcIYE7FFHFGSFy3QBC+lJqQGaxZ6VODkJk?=
 =?us-ascii?Q?/MV9Kwm0p9LBgE32vOsZMC24dyzCnhhhBwJjjPA6JU99wGJkv0PBXBoX8V2c?=
 =?us-ascii?Q?SYOlww8Qrf/Zcx3xtzIKrx4SqNey8QDxlWQ8URXpmgeRt9hIdRXMCMczfsLa?=
 =?us-ascii?Q?O4DgKFztwzOg+pm4vq+6sHHyoHtxU+fh7rm+LRcjZLQseOTwox2b1S005xFl?=
 =?us-ascii?Q?BtBZhvUee/7qR06v7aNCuK5eDHe5Uy53LSbyHehx7GUnnG3OvUMdsEj+irw8?=
 =?us-ascii?Q?6pl3bS+2fsG5QVdgnMg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:48:42.7623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fe33b7-f42c-4aea-8acc-08de28d26495
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6568

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


