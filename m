Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE0C5582F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 04:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160536.1488643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpi-0003wP-Li; Thu, 13 Nov 2025 03:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160536.1488643; Thu, 13 Nov 2025 03:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpi-0003tC-IK; Thu, 13 Nov 2025 03:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1160536;
 Thu, 13 Nov 2025 03:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWJc=5V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJNph-0003dm-6c
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 03:17:13 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eab5e93-c03f-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 04:17:12 +0100 (CET)
Received: from BN0PR04CA0001.namprd04.prod.outlook.com (2603:10b6:408:ee::6)
 by LV9PR12MB9832.namprd12.prod.outlook.com (2603:10b6:408:2f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 03:17:07 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::9d) by BN0PR04CA0001.outlook.office365.com
 (2603:10b6:408:ee::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Thu,
 13 Nov 2025 03:16:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 03:17:06 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 12 Nov 2025 19:17:00 -0800
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
X-Inumbo-ID: 3eab5e93-c03f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAgjckaBMC83nZ50BXC+BI0FO/pOOG+Bf0OnHc3pyamBmz0hT7KDJq1bkRtBhl449/v1mWz49vOg9jinloqVulbJa6Yi1pbkJxU72Sp+4kICXHex25bF0+U7FLL6NWQ35KwecdNT58Hh2Y57YMiPGzWJgeKVFX4quKkC26CvMaPN7hGcwnu/W0Cgsb1IH1gpkgeGjqNxHFakha9EyPVzQ11WPHgb72vA8C6vJZtQxxklMfgl7WqIkd1V2t6nmharhd6/3dUAgzoccUvgOCZ0b0NkIa38fRzgowx+nH8YWy3jcweZTg5L3pHVQN04cDX+82oczgaY8CyUQD2nPwV1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3kG+geAE72cNuegALIQOm3cZ5UOGQs4E87VfcT4cus=;
 b=Cq7pCqek7fHjbxWl44Z9UoqWU0X+G0LSIgaI0UkMjphk28kHYtOismokdNj6YAMR4xN2vaRizR9iZEBuu/FMho52V2ZYfON3+CRKV+sind4H3Qm056c8v/XCGaXvEz188YvKGCv6JUReP+InorWjvM2XyGZaw74qMDmfnMd2wexU1OpzTjSdLrqMVOVcpiQTrbuNzglllq4QOzeliPOl8bRXDBod/GDM0FbLfmp3vc1ElZjyGo0Prtxj0HCW1P88sYWQSC4FKzUirbdFZvddPFwWpkP2fqEqB7BpWHt9DBxTuiaaBnR/GG0UMQTjG3AutcH0XGUa44yUCZ9+gEQsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3kG+geAE72cNuegALIQOm3cZ5UOGQs4E87VfcT4cus=;
 b=oj3lBu4q8cMm0Jqa5SdhWdnj0oms/oWTn/1pp8YaJc7a8eJtB/RYnBaaHPW5nb92/qUKhc/e8g2ltyFiRDbPTH8VqK3pjkq9vREF+nzCYAixeKE4mLpYEx4p4kNyYaB726ytTBe+26JATcFADQPT+XEWCdAjvq1s9ua6xiUklrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, "Tamas K Lengyel" <tamas@tklengyel.com>, Alexandru
 Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>
Subject: [PATCH v1 3/7] xen/monitor: wrap monitor_op under CONFIG_VM_EVENT
Date: Thu, 13 Nov 2025 11:16:26 +0800
Message-ID: <20251113031630.1465599-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113031630.1465599-1-Penny.Zheng@amd.com>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|LV9PR12MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: d93d08d4-bafd-4e1f-3a9d-08de22632023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e9qvgQrHrCHuogUWaqwqc3ku9Tjt9F0avukwe0A8nT37fnSdGhcNWkOgH27j?=
 =?us-ascii?Q?fmC8pQcwchsqQf2gI/zvsPUVr5dTmD5YPc1Ngw7L9wWXtis6xgu3mLhAutq9?=
 =?us-ascii?Q?vHoEXdEt5y7shRaDeevJndMOcC0KjFtrBDivngJ1b6gNOycGlNRc4z7qj40q?=
 =?us-ascii?Q?ARWmiGUO0fBS86Mp2Stewhj4cQq9GYesuQGEagWkyci7Y33zrnvqMXjUtrG0?=
 =?us-ascii?Q?s16yIsQ7DqkPtsjl5pSozd3wnSel1+RN1FdQbWz7mqRlG4k1FXgZmagG7cMZ?=
 =?us-ascii?Q?PceFODxTA5fhWevanzpb8bAwLSiIF58XhUy2N8yHc+ZoBDUCh8iscbm3Z0uN?=
 =?us-ascii?Q?nT4CdUfa33Y7CX8uADRdYJDOzZ8WvCNEj+pZVztdmLiLBCImPz0B2ZifgQfm?=
 =?us-ascii?Q?BzyRd7AlPMnw1y1Pb9OfZUr8z330BpfzW/DyGt3gGy/d8NH5ZoqG2at36pg3?=
 =?us-ascii?Q?maLauqpU03kGy6Al73MFA/s3A/CmWvBXSKk+xjmo51b/pjvSvGWGA+beFo1J?=
 =?us-ascii?Q?W4YIIwqCuazeH6VkeB2pOPr+yg+46+A6XAMEeDMAnsOBFI6kRiuZA5tGbfm/?=
 =?us-ascii?Q?s1Swgtyln6vqrlwTvwo1IsLVKoiyd6idDLwRQ9Cz7Vg8peuoUdPw12IizQQ/?=
 =?us-ascii?Q?ojRAva81KzNLVRmVuG2UsDix/6xsxgboZhP97in/tqAYXubbCZuBqlzEkF8S?=
 =?us-ascii?Q?uye/0X+A3D7Nu/kyKmC2EdixRHXQcDeohiSM5YoWcr+PXu4fDrc8F2ZKsw2E?=
 =?us-ascii?Q?g/BUSPAMbwr+V8ylXJK3C0g97yvxPoqTcy2b8hWe6ATDdsuTz0e4iJh6RlwB?=
 =?us-ascii?Q?cUaExXZ23tqgXK2hQM/FUnUypGdOWd+wKn7HZL9V5Yah08r399D52GSWNqJI?=
 =?us-ascii?Q?moB0bW5M7+x+c+ptOr+OLyveGaEXFSy4M+l1UaftTRGaVNQKE7P1nHjmouor?=
 =?us-ascii?Q?2YE4yQl1oy8JB18uHpZtky8UXQP2dO+xMfJlWTfTg1Wh3jlWvdB1MvhJSXVQ?=
 =?us-ascii?Q?4f/bjJ7+lHiOYKCKKb9kvf0ZS6VKyAhnrZIDloeVWjRYvspEnCVRbzml/x7a?=
 =?us-ascii?Q?jeUPfD/HRz0WOYAnkbr0OcU2RJrD2SVcWHZoJg19/OeBn81XqANW2Zq/CViN?=
 =?us-ascii?Q?VDruTPH9ZKk7ArkWTEecFlfcab9Lx2a/L9ewlQc9jSM8YI4yqMSTEarSGHGh?=
 =?us-ascii?Q?Y/Et5QUA4fsvaUpH4OOgf1Hrf/UDn/To8/n5atsf9FZAhRLRXrBjiydzCECf?=
 =?us-ascii?Q?M4xmm7NT1qQKRX2E/clpmMtBPZV7Oj+YHAV+0yP58oOMXFHpvmClHxAyKZYn?=
 =?us-ascii?Q?95vMpA7sAvK4Z5ZeYBxc6vjcx+e3AF3NEvRycUHZNL63hpw57uIMrFyOOx/8?=
 =?us-ascii?Q?lb7LMTyTIF2BOQ8R20UMRXYeQMB0o1Q50oeaYLQE712ggSH5Ou17IEB+c3sQ?=
 =?us-ascii?Q?U3TTqJ+b4KFADU8ef613oJdrLAtstZj84OhoFfdWs+gc6KwFF5nq8MK+F9uB?=
 =?us-ascii?Q?wQBkBdn4zXD+WnJz1qQCJiDduAKyXUP2H8gMED5W3UcyumrLVAksKGIt6a39?=
 =?us-ascii?Q?KqSOhcLhyM8o+W4nz6g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 03:17:06.9043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d93d08d4-bafd-4e1f-3a9d-08de22632023
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832

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
---
v3 -> v4:
- a new commit split from previous "xen/vm_event: consolidate CONFIG_VM_EVENT"
- Another blank line ahead of the #ifdef
- Move hvm_enable_msr_interception() up into the earlier #ifdef
- only arch_monitor_get_capabilities() needs wrapping, as this static inline
function calls hvm_has_set_descriptor_access_exiting(), which is declared only
when VM_EVENT=y
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
index 9de2fd950e..06e4572d89 100644
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
index 2e9da26016..d29c9a2ff2 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1520,6 +1520,7 @@ static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmx_vmcs_exit(v);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -1534,6 +1535,7 @@ static void cf_check vmx_set_descriptor_access_exiting(
     vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void cf_check vmx_init_hypercall_page(void *p)
 {
@@ -2413,6 +2415,7 @@ static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
         printk_once(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -2420,6 +2423,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
+#endif /* CONFIG_VM_EVENT */
 
 #ifdef CONFIG_ALTP2M
 
@@ -2871,7 +2875,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
+#endif
 #ifdef CONFIG_ALTP2M
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
@@ -3079,9 +3085,11 @@ const struct hvm_function_table * __init start_vmx(void)
 
     vmx_function_table.caps.singlestep = cpu_has_monitor_trap_flag;
 
+#ifdef CONFIG_VM_EVENT
     if ( cpu_has_vmx_dt_exiting )
         vmx_function_table.set_descriptor_access_exiting =
             vmx_set_descriptor_access_exiting;
+#endif
 
     /*
      * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
@@ -3152,8 +3160,10 @@ void __init vmx_fill_funcs(void)
     if ( !cpu_has_xen_ibt )
         return;
 
+#ifdef CONFIG_VM_EVENT
     vmx_function_table.set_descriptor_access_exiting =
         vmx_set_descriptor_access_exiting;
+#endif
 
     vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
     vmx_function_table.process_isr            = vmx_process_isr;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index f02183691e..da00ed0694 100644
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
@@ -433,11 +435,18 @@ static inline bool using_svm(void)
 
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
@@ -679,11 +688,6 @@ static inline int nhvm_hap_walk_L1_p2m(
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


