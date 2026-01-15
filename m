Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EBD2386A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204481.1519141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfV-00085C-Og; Thu, 15 Jan 2026 09:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204481.1519141; Thu, 15 Jan 2026 09:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfV-00083Y-Lo; Thu, 15 Jan 2026 09:29:29 +0000
Received: by outflank-mailman (input) for mailman id 1204481;
 Thu, 15 Jan 2026 09:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7XDq=7U=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgJfU-0007pe-IK
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:29:28 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af149d0a-f1f4-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 10:29:26 +0100 (CET)
Received: from CH0PR03CA0354.namprd03.prod.outlook.com (2603:10b6:610:11a::17)
 by CH3PR12MB8460.namprd12.prod.outlook.com (2603:10b6:610:156::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 09:29:20 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::16) by CH0PR03CA0354.outlook.office365.com
 (2603:10b6:610:11a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 09:29:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 09:29:19 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 15 Jan 2026 03:29:07 -0600
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
X-Inumbo-ID: af149d0a-f1f4-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgghZTfn2kD2B0gnvsGiWUGRboHEeFf0klMb3gp8MPVnXpuW7YU9wq7sniw83YyrVxF/vHHNogguCzTFqUBIzgVm/YhJCO8TERXE1eA7kfeCRcAV+I6GU64KCIWrB/6cFmG2opQ4UwzMR4IF3iMc+jWXM6gVjWhT2L5u716cHwLss9hEWT2jTBU9h3neGjjH3Sdy68Xd9Guidp49D0KN17SavPC7kIB8/765vlcN+9uVnoTbc2v8sUHK0mZ1LSv0ouDoqR6OZgiUziNA6wGppqkvEkFAkMplBASeHrdxhFnmnp8e4xGh7ZB7bbwHtYzgluBf4fxc5X4YEQCtpOrTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWULiMlAUpeVte6nMxTzyciI1mUUV5lwW8iQ0Q8ICbk=;
 b=M8sON7Fb/urS+oMgrpQ68X8B1Mf6TQKyS4aJSE5rSxZBlHC75uRWrmS0jS6PiAbS36cS+n1RYHznfLZcNanuoShSdVVZqn3QHPDCIt7qQPRTzHvXxeKIixu2i5z8M3FJsSBfV6T7VJyxn3vrK9meepuPdDG89uE0oI7HW0P7bUid1YK5GgMHjNMm2UgYqao4+un4ljjWvCk3JtI8kX2ddHinNVXLBS7kxLwzOOwA5go8UcNxYP/s8tOXGEUwrIs+OUwW6X69dR4hrOPA9sIJkezteAzP4NCIhj13IcnEBvsF5rlwbQzqH6qaMqIl3/xclYls+QzVF8GJS8xtNvfrBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWULiMlAUpeVte6nMxTzyciI1mUUV5lwW8iQ0Q8ICbk=;
 b=R1Mb+MJ/jeMJipVvvKqo2M2l7jqA4UGjFyDxFBxRUCLr9txYg2lgYG9pVKArAg7i4xQQsHkyIwG9odZxVQHU29chDqoqqB/IpnzPYeywp0HKCjLYIY/XMadmynpL029wMruz62I21MBiSqr/s+TdvYsBFr0VatNQz4ouYVQrFhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <jason.andryuk@amd.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>
Subject: [PATCH v4 3/6] x86/monitor: wrap monitor_op under CONFIG_VM_EVENT
Date: Thu, 15 Jan 2026 17:28:38 +0800
Message-ID: <20260115092841.2651224-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092841.2651224-1-Penny.Zheng@amd.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CH3PR12MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 858f4fb0-aef3-4470-f9ee-08de54188fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Yjt2mWj2Nx5cQnAV55ZFLIMJfAnoYl5TRo7BZz9sCVQlgbeoe0hAHXGetS6?=
 =?us-ascii?Q?GuqIu10/1KGoSr1773EYieQfrybFRzrAZ5gJ6p9WGFOiMW9Xqj5rCZ1veVcM?=
 =?us-ascii?Q?+rcq2KCNaIgkFDf6vYjeHz/4VfZx5cmQjk1zo3UloLoyn39hkvc1/d8L1zsP?=
 =?us-ascii?Q?P6g9bgtNi5mZ3GHe8XdDzxC6xx9NFyubcttvrumSxKgyD9LqfgcFOZXbTV48?=
 =?us-ascii?Q?VUfnMWft2F6LH+60UX5zwtDoB5vz/gGw83Jxch1pi6mdG3qW/E6ZU4U4WEXv?=
 =?us-ascii?Q?jIUqnD9uJwkMHEGdQYPK7BAHAPZxnR0BIdrNc4niOlsMJqFMySLtSI3GzRZb?=
 =?us-ascii?Q?N+hhwSqWAfiHzXs9FbzwoSARQhKmTi8p242Ndc5gNHalc3NR0h2TOS0Bzh29?=
 =?us-ascii?Q?9xeg1QCLVOw88g7bbnhqeqXBj/VeaYsvlTFA/BkCyNifWSTmnVFv8PDnVSXH?=
 =?us-ascii?Q?mn5GR56m/2o0AuziS+vya9HHeTDAkszPu+LOs8yjuLWxmQlP11uXP8tDADKP?=
 =?us-ascii?Q?ZSGBzss8QTHxM0w3BK4vwgK2osyRTPUHLYbz4aGsvZxYrQds/0JPNgjgLRZM?=
 =?us-ascii?Q?F22PaFDZkqxZGCEO4ZkJkQmtoGvB2uO0+RNqcl7weuaJrc//VpWup36otNaK?=
 =?us-ascii?Q?hufzqrNXW6AMOWnCw2joUvoT3muus9Z9QRXqnzWyS/qymSvOiE9m7OCnpvH2?=
 =?us-ascii?Q?D9gahTmMfgtryO7OfqQ+ngZ2V91rCCDC/GcSRrVUCLcbBnIG2UmuxfcYZMBc?=
 =?us-ascii?Q?dtA4sliSxFMUoFgeRQSfKGJrwvRjNCjH7QRjBfcjqAyYomSMETdx7T9Gbjf6?=
 =?us-ascii?Q?YsUaZYB2EOY04CCUDhfM2dxT1rPXSizvgxfGDG1eYBtrj2YDchJfIic2DPjA?=
 =?us-ascii?Q?KnAEKsliocAURoKp+W6y1+fyPLveF/fGvWpL1e/iY6jdWRrV9ukmRn5pnFRG?=
 =?us-ascii?Q?wifMTVW5mav/LjwLUV/86R9pHQq9KpTIpQ7ZTl38wne1FOAcK3fywE3MZrAg?=
 =?us-ascii?Q?dh1B7ZLyA2IAbcote09iM9uYyFIyrxsbK9H1M9drPqsgbRM73De8rFsaJv+P?=
 =?us-ascii?Q?+D0aNsWP40EvTNZM3RBYKr8S5QcaJacRlWXMDvIFY9KkPuLMRVnLmrAHYDdT?=
 =?us-ascii?Q?92Wgv53FDfcfUwC9Yyu67AGBEIWtozTcY78DUG7DIUhwZXIGl6YSozbqoFEL?=
 =?us-ascii?Q?ZE/I+01q2uQxX1pH8soPfUQ+P2AJKh5HqzvdWLYbTVakeOurGIlRMh9+I0Hc?=
 =?us-ascii?Q?hHt/RIQQU93INsxkAAlbw+d26eJi1MxyMmQIYI55vfsx0Qy4HugO/yczpJRE?=
 =?us-ascii?Q?z5LOlnhvFIjmb+pmsXFuQOG9bIcRHUaZfT2lwQbdG08nRTGpTxVHfSGeohmI?=
 =?us-ascii?Q?ce3+PO+Ds9pFg/tByRFxyrSgOmjQCVHimq2SikEIbxoNRJ+mWjbZ7V7fQSWx?=
 =?us-ascii?Q?xEO2jlYfCJPkEqrGLYRxvdyd1qIXI/5qrANmSSNPZCTEkzbE8SkDFOFvJoAe?=
 =?us-ascii?Q?f3/X4MVxICSqJeVDMf9+b4N8SHujmbBPMH1VdR9orRsTGH86vO97ImyL8jFl?=
 =?us-ascii?Q?Y0reSPUKBqapuMumRY6CqiAisOwoDWrmmEVUP/CBdsimzu3rWdFlao0CAdFC?=
 =?us-ascii?Q?fhk01+XdtwEybNBLUkCLj2SoUIxmHhj5bAD0EwqteogA1b68phRHaKoQYr08?=
 =?us-ascii?Q?3dQOhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:29:19.9728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 858f4fb0-aef3-4470-f9ee-08de54188fba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8460

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
index 1b97bdc624..ee4b45a4ee 100644
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
index 21f355a657..5d23603fc1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -297,6 +297,7 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -304,6 +305,7 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void svm_save_dr(struct vcpu *v)
 {
@@ -824,6 +826,7 @@ static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmcb_set_general2_intercepts(vmcb, general2_intercepts);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check svm_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -841,6 +844,7 @@ static void cf_check svm_set_descriptor_access_exiting(
 
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
 {
@@ -2454,9 +2458,11 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
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
index 89f9d9c7f6..40e4c71244 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1581,6 +1581,7 @@ static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmx_vmcs_exit(v);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -1595,6 +1596,7 @@ static void cf_check vmx_set_descriptor_access_exiting(
     vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void cf_check vmx_init_hypercall_page(void *p)
 {
@@ -2474,6 +2476,7 @@ static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
         printk_once(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -2481,6 +2484,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
+#endif /* CONFIG_VM_EVENT */
 
 #ifdef CONFIG_ALTP2M
 
@@ -2932,7 +2936,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
+#endif
 #ifdef CONFIG_ALTP2M
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
@@ -3141,9 +3147,11 @@ const struct hvm_function_table * __init start_vmx(void)
 
     vmx_function_table.caps.singlestep = cpu_has_monitor_trap_flag;
 
+#ifdef CONFIG_VM_EVENT
     if ( cpu_has_vmx_dt_exiting )
         vmx_function_table.set_descriptor_access_exiting =
             vmx_set_descriptor_access_exiting;
+#endif
 
     /*
      * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
@@ -3214,8 +3222,10 @@ void __init vmx_fill_funcs(void)
     if ( !cpu_has_xen_ibt )
         return;
 
+#ifdef CONFIG_VM_EVENT
     vmx_function_table.set_descriptor_access_exiting =
         vmx_set_descriptor_access_exiting;
+#endif
 
     vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
     vmx_function_table.process_isr            = vmx_process_isr;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 666fa402a8..af042ae858 100644
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


