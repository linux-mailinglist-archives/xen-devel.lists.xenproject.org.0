Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98479B541C9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 06:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121387.1465712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwvmi-0003nW-LS; Fri, 12 Sep 2025 04:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121387.1465712; Fri, 12 Sep 2025 04:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwvmi-0003ly-Hv; Fri, 12 Sep 2025 04:53:20 +0000
Received: by outflank-mailman (input) for mailman id 1121387;
 Fri, 12 Sep 2025 04:53:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DZes=3X=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwvmh-0003lq-A6
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 04:53:19 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2405::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 648bdeaf-8f94-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 06:53:17 +0200 (CEST)
Received: from CH2PR05CA0049.namprd05.prod.outlook.com (2603:10b6:610:38::26)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 04:53:11 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::a7) by CH2PR05CA0049.outlook.office365.com
 (2603:10b6:610:38::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.7 via Frontend Transport; Fri,
 12 Sep 2025 04:53:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 04:53:10 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 21:53:07 -0700
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
X-Inumbo-ID: 648bdeaf-8f94-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWoLnkR+FZstMDl918V9MsD0ZOwh8btE3NJ554DF4afp+Yz0AGhnZBr+AvsPvdYpPYv9R8ZIshzF9SHkhAb8k5u6VGpXPncVnfdN59WN2YWr4tX455OfBa5jGbfP39VyG3q/uxkgSm8fGxFKT8X0lWmEnrnc8k5ZhEqP5GcJQH8MgDwq74wj14ZwuxBJVi21j5nVXQUL9gIRozaxWvkP1dD+DOSJOqeSTitjFAa6wYaVxXWXRh9j6Z6wEvOqoZ9kOcjTLf9yehWwD89g/EEAp6mh7z5fCUy3t/6n+BcyFinGZ+tJKPUMXEcrwQQaqHo5RX3wpBVpcId7ocQMVxphvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS4zBvwuCK+Oq5V6/9fIKJDP99q1GGCdKKoXl0OBYLg=;
 b=QovQPx9MK7WLo6xJ7PALUspiElxO9U1mmQo4Ne1eEdDQr/EJ+ihULhKzCEqaOiMrUSBXPWBU3JXP/KfS2S/T20WKkLKjx00TqLqDu5cMgqxp4Pwr/EJn5S88gykOVyHxMxC9tJXwFTIX43PxxQ0mxGQSshIqqwvcmD+0TBtUEKIgTBOAjlqdZkAhH0YWM3s5nTSmaspqgKuavarW6Wi4lqf7pU7cZqHLWwLgnEwKKf4+7wNrj7vogSFrqP3s7phNKmoGFUoz0b0FpIJmOSRghnMnSoFmXd/gfrfiJ9/jUffK5I3J5aV3klIAo/K51w6NBIssequMLCSLH6TlCLTF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qS4zBvwuCK+Oq5V6/9fIKJDP99q1GGCdKKoXl0OBYLg=;
 b=gfN436iSI4ePrQLG8MpQXxWwdf+ZRnRXK+bIEnLmpbkYEuF8Nu5Sh1yFt2Y3quD+1XOzjBOZekxofQgAjHzGup2poojU3ZDzW0Hx8UIef6yOQFqhPUQWJwREToj+0FuzrrjZR1smZQTmu+FbCiDpJPCPIMfbkX4spzwEazy1JA0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>
Subject: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
Date: Fri, 12 Sep 2025 12:52:54 +0800
Message-ID: <20250912045254.3731398-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SA3PR12MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 99349b40-5060-4293-8b9d-08ddf1b845e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4PI4yEFzxupo2PCM6TIwSTc2hBLk35v3gkdlKkqamzkoX/wc8g1kYWsVWWnd?=
 =?us-ascii?Q?oJ/IJSd+H0VQB2as0ckHCFGU2F/kcXv2xaXiXhPPG47J62GFQZo1kK6qWadC?=
 =?us-ascii?Q?gIDv7wxjtM5lDKcc1fhLJ/y0KsgnRw8qw36zEk9AjSBDOCtCv23iD9Bs8uRl?=
 =?us-ascii?Q?14J3lrs48kvr7oOIHaCL695h+eYhi0ESkef8YSAIDlT/kjdRkjMcq6YAPdpJ?=
 =?us-ascii?Q?UrqRTNZoXppxM12TXYpWrEOP75sguzLY7CGy6g6+h1KuLj6dNJAnjZaw1MxW?=
 =?us-ascii?Q?FekOeMw5UY4wFEeWbS16i6TlKtzyB/9EmwGfVN4U4vYw9h2n/fXKKqNcJj3E?=
 =?us-ascii?Q?ur3lpqT3VeU0VtRpVB8Qvd/vV5vkaMvvaia2791uQAOFUFsFcwi/pi1alhhN?=
 =?us-ascii?Q?SASQIoWXb4vuYIBwOsACOM3RAkN7L7PVYezXo2TEu42hnsUVkphosHd4ZQQ/?=
 =?us-ascii?Q?Q9EBUTVCbO1oAPtsdJLm92hnCqjntSeI2J1r/zN8pcm7A19ALCQsSmcc0xa9?=
 =?us-ascii?Q?7k29+62+ZdfvXByeNbwgmtZIT/jqnG/mQdETX62aDxmEgd+f5togpQcaaSQp?=
 =?us-ascii?Q?oJd2hwtWZjRbp2Y/WDtwZcuescpIggzOjiPRMO/OxG1WkW71TnL0U6lqcjuL?=
 =?us-ascii?Q?Cgoh26xbOFsKQoAOvW+HL3QNMxKduRyeNGCbJzO6sNLCaFIBEL6YBFqj2llO?=
 =?us-ascii?Q?fTT5drC1Mo1uIqSXXLY3QGYqV5HJNzpjm/sVLJYaBHFgrAymeXIoIETCpjH/?=
 =?us-ascii?Q?VXhnNPAoB6juH0U3OB5lN+xf+J6UwE+DUt6gWzPTiMqRIhBM8NNSR/Arpj3p?=
 =?us-ascii?Q?RLuUVPvesm3RUKGP2zIqCqeRc1xGSYJoUnBx4r0Hl5AaswZjAK9eM8G79b08?=
 =?us-ascii?Q?HG8nQ3woBWUTFGGFgGrSl2mKKPSSRINyxiUqzwuvQ1NRvq4rLad986PHj/nE?=
 =?us-ascii?Q?DadInz5PvRzV6r8Z5gGxpxDs53BkrIjpdnSloZVUi9FT5qYQBt8TF8mI09wP?=
 =?us-ascii?Q?vo2PhGd/r7Q+0J/wGbC0xzHWzNeHZyyHeqzIdc6JQXFXZtDn6Q8XFmaF50+x?=
 =?us-ascii?Q?yJcurbzNu+/dFqkrhlPMDLsdSYOvpMCnj0rqIDLaH45KcEKhYmTJrbJKV3q/?=
 =?us-ascii?Q?XQEqwr52Wq1AG30lCXf9PEgfUZ/KMwe9DYZvxs0BUiL/d1gJVTBuJvdzLg7L?=
 =?us-ascii?Q?kws/s1ef02HcCnCCvfUWIBAbyaduOAKJhyFCsgCCyq/Acs0A3hPQOAmuicFU?=
 =?us-ascii?Q?GhH3rvg0BV14TWCncyR2mp9rVgywqL2vuxRsHXfTCAxfaRR00eZ3NJQcVFQm?=
 =?us-ascii?Q?qLZ+yqs0ckMIBigyb6y7TztdEDbX/u9JXvjevp+XI22Opfn1x+Z/FgcfIW59?=
 =?us-ascii?Q?2sWC6C3ugQB8C2Yhd2Lkqp34p83dU7iVTibFa25ANP42fjwOgaQVVx866jwU?=
 =?us-ascii?Q?kUKnJtTkhzJLzCa5iVmbLh4ARisVyP5kl3P0pRi6qa6ElCsukCqOYn6y3PYk?=
 =?us-ascii?Q?J+ywZKhwsqhceRoY3WfxzEfPB3SsSn0IM1T8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 04:53:10.4359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99349b40-5060-4293-8b9d-08ddf1b845e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904

Function vm_event_is_enabled() is introduced to check if vm event is enabled,
and also make the checking conditional upon CONFIG_VM_EVENT, which could help
DCE a lot calls/codes, such as hvm_monitor_io(), etc when VM_EVENT=n.
In-place assertion of arch.vm_event is kinds of redundant and could be
removed.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/hvm/emulate.c          |  6 ++---
 xen/arch/x86/hvm/hvm.c              | 41 +++++++++++++----------------
 xen/arch/x86/hvm/svm/intr.c         |  2 +-
 xen/arch/x86/hvm/vmx/intr.c         |  2 +-
 xen/arch/x86/include/asm/vm_event.h |  9 +++++++
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 2af4f30359..75567db403 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -105,7 +105,7 @@ static int set_context_data(void *buffer, unsigned int size)
 {
     struct vcpu *curr = current;
 
-    if ( curr->arch.vm_event )
+    if ( vm_event_is_enabled(curr) )
     {
         unsigned int safe_size =
             min(size, curr->arch.vm_event->emul.read.size);
@@ -771,7 +771,7 @@ static void *hvmemul_map_linear_addr(
             ASSERT(p2mt == p2m_ram_logdirty || !p2m_is_readonly(p2mt));
         }
 
-        if ( unlikely(curr->arch.vm_event) &&
+        if ( unlikely(vm_event_is_enabled(curr)) &&
              curr->arch.vm_event->send_event &&
              hvm_monitor_check_p2m(addr, gfn, pfec, npfec_kind_with_gla) )
         {
@@ -1870,7 +1870,7 @@ static int hvmemul_rep_outs_set_context(
     int rc = X86EMUL_OKAY;
 
     ASSERT(bytes_per_rep <= 4);
-    if ( !ev )
+    if ( !vm_event_is_enabled(current) )
         return X86EMUL_UNHANDLEABLE;
 
     ptr = ev->emul.read.data;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 23bd7f078a..e3abd2849a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -532,7 +532,7 @@ void hvm_do_resume(struct vcpu *v)
     if ( !vcpu_ioreq_handle_completion(v) )
         return;
 
-    if ( unlikely(v->arch.vm_event) )
+    if ( unlikely(vm_event_is_enabled(v)) )
         hvm_vm_event_do_resume(v);
 
     /* Inject pending hw/sw event */
@@ -546,11 +546,12 @@ void hvm_do_resume(struct vcpu *v)
         v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
     }
 
-    if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
+    if ( unlikely(vm_event_is_enabled(v)) &&
+         v->arch.monitor.next_interrupt_enabled )
     {
         struct x86_event info;
 
-        if ( hvm_get_pending_event(v, &info) )
+        if ( hvm_get_pending_event(v, &info) && vm_event_is_enabled(v) )
         {
             hvm_monitor_interrupt(info.vector, info.type, info.error_code,
                                   info.cr2);
@@ -2088,7 +2089,7 @@ int hvm_handle_xsetbv(u32 index, u64 new_bv)
 {
     int rc;
 
-    if ( index == 0 )
+    if ( index == 0 && vm_event_is_enabled(current) )
         hvm_monitor_crX(XCR0, new_bv, current->arch.xcr0);
 
     rc = x86emul_write_xcr(index, new_bv, NULL);
@@ -2337,9 +2338,7 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
     if ( may_defer && unlikely(v->domain->arch.monitor.write_ctrlreg_enabled &
                                monitor_ctrlreg_bitmask(VM_EVENT_X86_CR0)) )
     {
-        ASSERT(v->arch.vm_event);
-
-        if ( hvm_monitor_crX(CR0, value, old_value) )
+        if ( vm_event_is_enabled(v) && hvm_monitor_crX(CR0, value, old_value) )
         {
             /* The actual write will occur in hvm_do_resume(), if permitted. */
             v->arch.vm_event->write_data.do_write.cr0 = 1;
@@ -2462,9 +2461,8 @@ int hvm_set_cr3(unsigned long value, bool noflush, bool may_defer)
     if ( may_defer && unlikely(currd->arch.monitor.write_ctrlreg_enabled &
                                monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3)) )
     {
-        ASSERT(curr->arch.vm_event);
-
-        if ( hvm_monitor_crX(CR3, value, curr->arch.hvm.guest_cr[3]) )
+        if ( vm_event_is_enabled(curr) &&
+             hvm_monitor_crX(CR3, value, curr->arch.hvm.guest_cr[3]) )
         {
             /* The actual write will occur in hvm_do_resume(), if permitted. */
             curr->arch.vm_event->write_data.do_write.cr3 = 1;
@@ -2544,9 +2542,7 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
     if ( may_defer && unlikely(v->domain->arch.monitor.write_ctrlreg_enabled &
                                monitor_ctrlreg_bitmask(VM_EVENT_X86_CR4)) )
     {
-        ASSERT(v->arch.vm_event);
-
-        if ( hvm_monitor_crX(CR4, value, old_cr) )
+        if ( vm_event_is_enabled(v) && hvm_monitor_crX(CR4, value, old_cr) )
         {
             /* The actual write will occur in hvm_do_resume(), if permitted. */
             v->arch.vm_event->write_data.do_write.cr4 = 1;
@@ -3407,7 +3403,7 @@ static enum hvm_translation_result __hvm_copy(
             return HVMTRANS_bad_gfn_to_mfn;
         }
 
-        if ( unlikely(v->arch.vm_event) &&
+        if ( unlikely(vm_event_is_enabled(v)) &&
              (flags & HVMCOPY_linear) &&
              v->arch.vm_event->send_event &&
              hvm_monitor_check_p2m(addr, gfn, pfec, npfec_kind_with_gla) )
@@ -3538,6 +3534,7 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
     struct vcpu *curr = current;
     unsigned int leaf = regs->eax, subleaf = regs->ecx;
     struct cpuid_leaf res;
+    int ret = 0;
 
     if ( curr->arch.msrs->misc_features_enables.cpuid_faulting &&
          hvm_get_cpl(curr) > 0 )
@@ -3554,7 +3551,10 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
     regs->rcx = res.c;
     regs->rdx = res.d;
 
-    return hvm_monitor_cpuid(inst_len, leaf, subleaf);
+    if ( vm_event_is_enabled(curr) )
+        ret = hvm_monitor_cpuid(inst_len, leaf, subleaf);
+
+    return ret;
 }
 
 void hvm_rdtsc_intercept(struct cpu_user_regs *regs)
@@ -3694,9 +3694,8 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
         if ( ret != X86EMUL_OKAY )
             return ret;
 
-        ASSERT(v->arch.vm_event);
-
-        if ( hvm_monitor_msr(msr, msr_content, msr_old_content) )
+        if ( vm_event_is_enabled(v) &&
+             hvm_monitor_msr(msr, msr_content, msr_old_content) )
         {
             /* The actual write will occur in hvm_do_resume(), if permitted. */
             v->arch.vm_event->write_data.do_write.msr = 1;
@@ -3854,12 +3853,10 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
 
-    if ( currd->arch.monitor.descriptor_access_enabled )
-    {
-        ASSERT(curr->arch.vm_event);
+    if ( currd->arch.monitor.descriptor_access_enabled &&
+         vm_event_is_enabled(curr) )
         hvm_monitor_descriptor_access(exit_info, vmx_exit_qualification,
                                       descriptor, is_write);
-    }
     else if ( !hvm_emulate_one_insn(is_sysdesc_access, "sysdesc access") )
         domain_crash(currd);
 
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 46186a1102..557ebc98d8 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -130,7 +130,7 @@ void asmlinkage svm_intr_assist(void)
     enum hvm_intblk intblk;
 
     /* Block event injection while handling a sync vm_event. */
-    if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
+    if ( unlikely(vm_event_is_enabled(v)) && v->arch.vm_event->sync_event )
         return;
 
     /* Crank the handle on interrupt state. */
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index b35dc8c586..a8ced95871 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -239,7 +239,7 @@ void asmlinkage vmx_intr_assist(void)
     }
 
     /* Block event injection while handling a sync vm_event. */
-    if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
+    if ( unlikely(vm_event_is_enabled(v)) && v->arch.vm_event->sync_event )
         return;
 
 #ifdef CONFIG_MEM_SHARING
diff --git a/xen/arch/x86/include/asm/vm_event.h b/xen/arch/x86/include/asm/vm_event.h
index 46e77ed6d9..446d02c7d5 100644
--- a/xen/arch/x86/include/asm/vm_event.h
+++ b/xen/arch/x86/include/asm/vm_event.h
@@ -45,4 +45,13 @@ void vm_event_sync_event(struct vcpu *v, bool value);
 
 void vm_event_reset_vmtrace(struct vcpu *v);
 
+static inline bool vm_event_is_enabled(struct vcpu *v)
+{
+#ifdef CONFIG_VM_EVENT
+    return v->arch.vm_event != NULL;
+#else
+    return false;
+#endif
+}
+
 #endif /* __ASM_X86_VM_EVENT_H__ */
-- 
2.34.1


