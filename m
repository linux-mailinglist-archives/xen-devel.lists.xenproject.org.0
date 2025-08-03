Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E9B1933C
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068342.1432348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKJ-0006MI-K7; Sun, 03 Aug 2025 09:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068342.1432348; Sun, 03 Aug 2025 09:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKJ-0006Io-Ee; Sun, 03 Aug 2025 09:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1068342;
 Sun, 03 Aug 2025 09:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKI-0005K3-9K
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:22 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2406::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fce075e8-704e-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:21 +0200 (CEST)
Received: from BYAPR21CA0019.namprd21.prod.outlook.com (2603:10b6:a03:114::29)
 by SA1PR12MB6677.namprd12.prod.outlook.com (2603:10b6:806:250::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:13 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::ef) by BYAPR21CA0019.outlook.office365.com
 (2603:10b6:a03:114::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.1 via Frontend Transport; Sun, 3
 Aug 2025 09:48:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:09 -0500
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
X-Inumbo-ID: fce075e8-704e-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfoZlCjQKi0Q41R8y5EPVdQdCmy697IBYCjQiRvXZsgqFR0VKlSWE+QJjzAKElt1Hg+wCnnPTDjTTIUB81BFPOo+qR/W+vOm8qdRm4ExM3rWYVr2SZfZVGUAecqn7Q6VtW7h6gmYJAIjI5Xh77mcowA/saD9TPqGWpP9pWTZ26aaXkHtPWLIBotxB+GrFKjXl+qel6zzao8evSGtiZ8m+TYnxNuSI+5FIJ+vQxAaylgnXiu1zMAVimYsFX7cGmFWvDQzhaBxaj5wShQ75MLQ6VAuJ+jSDG9ak3006vPkYOse8sak3Y48l2tsMCi3jNKWqD5vThsq1IMC4DtYATn1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MV3wGFTRYAMafdJvIGfoiQrNKsxtOc6bfvGSnYb3iL4=;
 b=qgd4CNqHZ2dAWQ0Ak3SBHJGK7crzFTieYTc4r3+LR8t9yDpGlEYHCRI7BJd9KIRIRtTO9Ik8/FFh08LchGlyh49aBRzpysw+YsJwW20FeWoOuo18zS/BkrR90RM79GBec0+6OzMM08f/vJ0LIf9I4rMysXM71Hc20UZfQ0ZZuS3HNCqFhIIJ/8HZC5iiKGuKZFUFa72HM+Edc9qYmU1sZXJgZM+KzvAuTbEsLfvCSEjaJcTOq6bs6jtT6b7eIRzwYxDj7isHEZnTWzZ1fDSjwXl836XamwAL9Wjt6jrtBJc9vWYdSjiB/D5qW7CllAvS15qEewDZM+D/M/34g1PBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV3wGFTRYAMafdJvIGfoiQrNKsxtOc6bfvGSnYb3iL4=;
 b=nH3yye/2iWjkdhxqAKkunQMFffHNvS/W4DO84r5PbQ0n+7JzCDozZgkxsQ14gR7svDQnrY0Lz6JB8q0Q2qzgzYb3MFob3FL+41AWYFWGHnezLMA0iMpzDht6Znv1trg/a6VQUi9N9i/HJDILPmA87O4eAcHHoR2hhYqD+wMr/ZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1 04/25] xen: consolidate CONFIG_VM_EVENT
Date: Sun, 3 Aug 2025 17:47:17 +0800
Message-ID: <20250803094738.3625269-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SA1PR12MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7c965d-0ae3-42e5-9ab3-08ddd272dcf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sOK1cK9PyVxFxAwd1fCtobDgkZvMOw3FYkjk5zIfc35mQZVbJveAUJ5RdT4q?=
 =?us-ascii?Q?Saq7OsJfVlK5p+VYPo3n4eaExYnhNC/t316xjq9Vcs8zngUXxiuG5PlPnhMa?=
 =?us-ascii?Q?9XUhFMu8QKozLKC5fxLJxvmagUgAS+QLJO0ccaDOZ4GHbO+mt5boaChpBlJj?=
 =?us-ascii?Q?cM7GpIpB/Mp4D5BZ4KTD2CY/GxzxLEsy7/3HxfafFLyp3kbqfq/Ii2o6kalf?=
 =?us-ascii?Q?+ytFV4g1gBUUItYhUAohhWqjvZg0cOoPrLfSD9p7O+rCCo6GZiS191jS+e1M?=
 =?us-ascii?Q?CaK/l1fh1x3XUoiAN3A+eCc3grVqt09KB0INSMVcSYq8iVKRmn1a7njDqhQz?=
 =?us-ascii?Q?7owRmIMNnhE2PaN8sGgK9FvBDgFhj5hrTCft6z3iM968dC9Wrud/G/0wRrPH?=
 =?us-ascii?Q?Qiox/j0mJxDfcvfMKoxvn1AqgDA/K2S0KFMper6HRqZPdgoyy2ZfpCwsvbPa?=
 =?us-ascii?Q?SRpid4QXdqSeZbm8ta2F09+p0KX/6uvcczEi/XzgK5TBf6zTo1WIos27A+nf?=
 =?us-ascii?Q?TCF10JcbUXtnGIP4spuEyrqY2bxutD5//xPvJUgTk0zuGB7uxUvQxuap0EJY?=
 =?us-ascii?Q?+UbOQ01WnGDpadQnAPOfZ3jiYqAn5+Cnn8wxuxTThhCM5g2AGP+jy4TjCBwo?=
 =?us-ascii?Q?NEE5RFTVAC8fwjeFCGLrkQhZrAfrR11BDLLmTrpu7doVVnNMxEh0zuDB5WI1?=
 =?us-ascii?Q?Uz2dJoie3SPISkGrch4k9eUuzUDHT6zJ31U6W2zvdWHJY4FdNPIWZisj7WGu?=
 =?us-ascii?Q?0yX3f6MZk9M0rglS/yWL0afL2AwmFxlJGdQccGLYIBlOJwWeyzFTwPVRCrid?=
 =?us-ascii?Q?7pmuXngcmMQveBLCygZiruzRw2NZ0G8H5jxFATIIQazRv+ULCRo5I112Qb0H?=
 =?us-ascii?Q?EU7g2QEBx+r8bdbm71kffJRoTV4AKW4EJZBLuM7oSesCfPSGzJBhTVgFCo+N?=
 =?us-ascii?Q?knptIDjsGlZvXf/tZiulMe5C0LKxz/o/H7m56htdfnpcZHPP/OK0rsbaj+bH?=
 =?us-ascii?Q?OOhyYlpTfie/iOqMAHFjC9k1eqdHUFADWXAUPTl8kioG3daiQM/TPYwTNfpu?=
 =?us-ascii?Q?GsXVPLKzDNr9PY1MbGWs/yOqilA8C4elVr2h9/T8C3L2an9AR4r2NHWh8gae?=
 =?us-ascii?Q?c/hvA22ZrBy+jNvOyCtqVkB+b/qamasiwEFCSzo/irCT7BWdRSdqTaNXJJde?=
 =?us-ascii?Q?W4mrhE1kpZg2+TAk1UyK7fBHsgSW/+xFA48D03HUMFnu9JsBYN4FT1M9gu1T?=
 =?us-ascii?Q?jaKYlZcRXGNS0mrtbsXMlnvWBaYveYnXguFEtn3iumGctmibnoHlKyPIAsz/?=
 =?us-ascii?Q?9fqnGKXrBUDie7Q+QyXfY9W4y/dWoTKsYPmlGtFPVRP1U2Znpw2y8aTywjp8?=
 =?us-ascii?Q?O42meopJccPe5PcFPEXhylpKSGvVrlHKwjQAJOpZGSGLQ2/QS7JiowBNgar+?=
 =?us-ascii?Q?FAu30MFkLG0MURccCHh0qW99f6LnMwaY2PDTefjLQrK1F65967MBdfaGzn6W?=
 =?us-ascii?Q?PZpEYixM3pV+MtaKKrI4YeRLN4lihS8CbuUy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:13.0457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7c965d-0ae3-42e5-9ab3-08ddd272dcf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6677

File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
Futhermore, features about monitor_op and memory access are both based on
vm event subsystem, so monitor.o/mem_access.o shall be wrapped under
CONFIG_VM_EVENT.

Although CONFIG_VM_EVENT is forcibly enabled on x86, we could disable it
through disabling CONFIG_DOMCTL in the future.
In consequence, a few functions, like the ones defined in hvm/monitor.h,
needs stub to pass compilation when CONFIG_VM_EVENT=n.
Remove the CONFIG_VM_EVENT wrapper for "#include <asm/mem_access.h>", as
we need declaration there to pass compilation when CONFIG_VM_EVENT=n

The following functions are developed on the basis of vm event framework, or
only invoked by vm_event.c/monitor.c/mem_access.c, so they all shall be
wrapped with CONFIG_VM_EVENT:
- hvm_toggle_singlestep
- hvm_fast_singlestep
- p2m_mem_paging_drop_page
- p2m_mem_paging_populate_page
- p2m_mem_paging_resume
- hvm_enable_msr_interception
  - hvm_function_table.enable_msr_interception
- hvm_has_set_descriptor_access_existing
  - hvm_function_table.set_descriptor_access_existing
- xsm_vm_event_control

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/ppc/stubs.c                    |  2 +
 xen/arch/x86/Makefile                   |  2 +-
 xen/arch/x86/hvm/Makefile               |  4 +-
 xen/arch/x86/hvm/hvm.c                  |  2 +
 xen/arch/x86/hvm/svm/svm.c              |  8 +++
 xen/arch/x86/hvm/vmx/vmx.c              | 10 ++++
 xen/arch/x86/include/asm/hvm/hvm.h      | 10 ++++
 xen/arch/x86/include/asm/hvm/monitor.h  | 65 ++++++++++++++++++++++++-
 xen/arch/x86/include/asm/hvm/vm_event.h |  4 ++
 xen/arch/x86/include/asm/mem_access.h   |  9 ++++
 xen/arch/x86/include/asm/monitor.h      | 15 ++++++
 xen/arch/x86/include/asm/p2m.h          |  6 +++
 xen/arch/x86/mm/mem_paging.c            |  2 +
 xen/include/xen/mem_access.h            | 36 ++++++++++++--
 xen/include/xen/monitor.h               |  8 ++-
 xen/include/xen/vm_event.h              | 24 ++++++++-
 xen/include/xsm/xsm.h                   |  4 +-
 xen/xsm/dummy.c                         |  2 +-
 xen/xsm/flask/hooks.c                   |  4 +-
 19 files changed, 200 insertions(+), 17 deletions(-)

diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 671e71aa0a..4679cf9360 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -60,6 +60,7 @@ void vcpu_show_execution_state(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_VM_EVENT
 /* vm_event.c */
 
 void vm_event_fill_regs(vm_event_request_t *req)
@@ -76,6 +77,7 @@ void vm_event_monitor_next_interrupt(struct vcpu *v)
 {
     /* Not supported on PPC. */
 }
+#endif /* CONFIG_VM_EVENT */
 
 /* domctl.c */
 void arch_get_domain_info(const struct domain *d,
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 7676d7cdd8..17f0e1dbc9 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -76,7 +76,7 @@ obj-y += usercopy.o
 obj-y += x86_emulate.o
 obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db..952db00dd7 100644
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
@@ -26,7 +26,7 @@ obj-y += save.o
 obj-y += stdvga.o
 obj-y += vioapic.o
 obj-y += vlapic.o
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += vmsi.o
 obj-y += vpic.o
 obj-y += vpt.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ea97815deb..f464f401aa 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5251,6 +5251,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
 {
     ASSERT(atomic_read(&v->pause_count));
@@ -5275,6 +5276,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     v->arch.hvm.fast_single_step.enabled = true;
     v->arch.hvm.fast_single_step.p2midx = p2midx;
 }
+#endif /* CONFIG_VM_EVENT */
 
 /*
  * Segment caches in VMCB/VMCS are inconsistent about which bits are checked,
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index fce750ca1f..d71f499986 100644
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
@@ -2455,9 +2459,13 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .fpu_dirty_intercept  = svm_fpu_dirty_intercept,
     .msr_read_intercept   = svm_msr_read_intercept,
     .msr_write_intercept  = svm_msr_write_intercept,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = svm_enable_msr_interception,
+#endif
     .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
+#ifdef CONFIG_VM_EVENT
     .set_descriptor_access_exiting = svm_set_descriptor_access_exiting,
+#endif
     .get_insn_bytes       = svm_get_insn_bytes,
 
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cb82d52ef0..9e4ad864fa 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1515,6 +1515,7 @@ static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmx_vmcs_exit(v);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -1529,6 +1530,7 @@ static void cf_check vmx_set_descriptor_access_exiting(
     vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void cf_check vmx_init_hypercall_page(void *p)
 {
@@ -2408,6 +2410,7 @@ static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
         printk_once(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -2415,6 +2418,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
 {
@@ -2862,7 +2866,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
+#endif
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
@@ -3068,9 +3074,11 @@ const struct hvm_function_table * __init start_vmx(void)
 
     vmx_function_table.caps.singlestep = cpu_has_monitor_trap_flag;
 
+#ifdef CONFIG_VM_EVENT
     if ( cpu_has_vmx_dt_exiting )
         vmx_function_table.set_descriptor_access_exiting =
             vmx_set_descriptor_access_exiting;
+#endif
 
     /*
      * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
@@ -3141,8 +3149,10 @@ void __init vmx_fill_funcs(void)
     if ( !cpu_has_xen_ibt )
         return;
 
+#ifdef CONFIG_VM_EVENT
     vmx_function_table.set_descriptor_access_exiting =
         vmx_set_descriptor_access_exiting;
+#endif
 
     vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
     vmx_function_table.process_isr            = vmx_process_isr;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index bf8bc2e100..bd53fcf155 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -191,7 +191,9 @@ struct hvm_function_table {
     void (*handle_cd)(struct vcpu *v, unsigned long value);
     void (*set_info_guest)(struct vcpu *v);
     void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
+#ifdef CONFIG_VM_EVENT
     void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
+#endif
 
     /* Nested HVM */
     int (*nhvm_vcpu_initialise)(struct vcpu *v);
@@ -223,7 +225,9 @@ struct hvm_function_table {
                                 paddr_t *L1_gpa, unsigned int *page_order,
                                 uint8_t *p2m_acc, struct npfec npfec);
 
+#ifdef CONFIG_VM_EVENT
     void (*enable_msr_interception)(struct domain *d, uint32_t msr);
+#endif
 
     /* Alternate p2m */
     void (*altp2m_vcpu_update_p2m)(struct vcpu *v);
@@ -430,10 +434,12 @@ static inline bool using_svm(void)
 
 #define hvm_long_mode_active(v) (!!((v)->arch.hvm.guest_efer & EFER_LMA))
 
+#ifdef CONFIG_VM_EVENT
 static inline bool hvm_has_set_descriptor_access_exiting(void)
 {
     return hvm_funcs.set_descriptor_access_exiting;
 }
+#endif /* CONFIG_VM_EVENT */
 
 static inline void hvm_domain_creation_finished(struct domain *d)
 {
@@ -680,10 +686,12 @@ static inline int nhvm_hap_walk_L1_p2m(
         v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static inline bool hvm_is_singlestep_supported(void)
 {
@@ -923,10 +931,12 @@ static inline void hvm_inject_hw_exception(unsigned int vector, int errcode)
     ASSERT_UNREACHABLE();
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline bool hvm_has_set_descriptor_access_exiting(void)
 {
     return false;
 }
+#endif /* CONFIG_VM_EVENT */
 
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index 02021be47b..561ca2e585 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -17,14 +17,16 @@ enum hvm_monitor_debug_type
     HVM_MONITOR_DEBUG_EXCEPTION,
 };
 
+#define hvm_monitor_crX(cr, new, old) \
+                        hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
+
+#ifdef CONFIG_VM_EVENT
 /*
  * Called for current VCPU on crX/MSR changes by guest. Bool return signals
  * whether emulation should be postponed.
  */
 bool hvm_monitor_cr(unsigned int index, unsigned long value,
                     unsigned long old);
-#define hvm_monitor_crX(cr, new, old) \
-                        hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
 bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value);
 void hvm_monitor_descriptor_access(uint64_t exit_info,
                                    uint64_t vmx_exit_qualification,
@@ -45,6 +47,65 @@ int hvm_monitor_vmexit(unsigned long exit_reason,
 
 int hvm_monitor_io(unsigned int port, unsigned int bytes,
                    bool in, bool str);
+#else
+static inline bool hvm_monitor_cr(unsigned int index, unsigned long value,
+                                  unsigned long old)
+{
+    return false;
+}
+
+static inline bool hvm_monitor_msr(unsigned int msr, uint64_t new_value,
+                                   uint64_t old_value)
+{
+    return false;
+}
+
+static inline void hvm_monitor_descriptor_access(uint64_t exit_info,
+                                        uint64_t vmx_exit_qualification,
+                                        uint8_t descriptor, bool is_write) {}
+
+static inline int hvm_monitor_debug(unsigned long rip,
+                                    enum hvm_monitor_debug_type type,
+                                    unsigned int trap_type,
+                                    unsigned int insn_length,
+                                    unsigned int pending_dbg)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int hvm_monitor_cpuid(unsigned long insn_length,
+                                    unsigned int leaf, unsigned int subleaf)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline void hvm_monitor_interrupt(unsigned int vector,
+                                         unsigned int type,
+                                         unsigned int err, uint64_t cr2) {}
+
+static inline bool hvm_monitor_emul_unimplemented(void)
+{
+    return false;
+}
+
+static inline bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn,
+                                         uint32_t pfec, uint16_t kind)
+{
+    return false;
+}
+
+static inline int hvm_monitor_vmexit(unsigned long exit_reason,
+                                     unsigned long exit_qualification)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int hvm_monitor_io(unsigned int port, unsigned int bytes,
+                                 bool in, bool str)
+{
+    return -EOPNOTSUPP;
+}
+#endif /* CONFIG_VM_EVENT */
 
 #endif /* __ASM_X86_HVM_MONITOR_H__ */
 
diff --git a/xen/arch/x86/include/asm/hvm/vm_event.h b/xen/arch/x86/include/asm/hvm/vm_event.h
index 506a85c774..1628230182 100644
--- a/xen/arch/x86/include/asm/hvm/vm_event.h
+++ b/xen/arch/x86/include/asm/hvm/vm_event.h
@@ -8,7 +8,11 @@
 #ifndef __ASM_X86_HVM_VM_EVENT_H__
 #define __ASM_X86_HVM_VM_EVENT_H__
 
+#ifdef CONFIG_VM_EVENT
 void hvm_vm_event_do_resume(struct vcpu *v);
+#else
+static inline void hvm_vm_event_do_resume(struct vcpu *v) {}
+#endif /* CONFIG_VM_EVENT */
 
 #endif /* __ASM_X86_HVM_VM_EVENT_H__ */
 
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 1a52a10322..c786116310 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -14,6 +14,7 @@
 #ifndef __ASM_X86_MEM_ACCESS_H__
 #define __ASM_X86_MEM_ACCESS_H__
 
+#ifdef CONFIG_VM_EVENT
 /*
  * Setup vm_event request based on the access (gla is -1ull if not available).
  * Handles the rw2rx conversion. Boolean return value indicates if event type
@@ -25,6 +26,14 @@
 bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
                           struct npfec npfec,
                           struct vm_event_st **req_ptr);
+#else
+static inline bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
+                                        struct npfec npfec,
+                                        struct vm_event_st **req_ptr)
+{
+    return false;
+}
+#endif /* CONFIG_VM_EVENT */
 
 /* Check for emulation and mark vcpu for skipping one instruction
  * upon rescheduling if required. */
diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
index 3c64d8258f..815de8fda2 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -71,6 +71,7 @@ int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 {
     uint32_t capabilities = 0;
@@ -102,6 +103,13 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 
     return capabilities;
 }
+#else
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+#endif /* CONFIG_VM_EVENT */
 
 int arch_monitor_domctl_event(struct domain *d,
                               struct xen_domctl_monitor_op *mop);
@@ -123,7 +131,14 @@ static inline void arch_monitor_cleanup_domain(struct domain *d) {}
 
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
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 58b56e575e..9c92f67443 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -775,10 +775,16 @@ static inline int relinquish_p2m_mapping(struct domain *d)
 /* Modify p2m table for shared gfn */
 int set_shared_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
 
+#ifdef CONFIG_VM_EVENT
 /* Tell xenpaging to drop a paged out frame */
 void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn, p2m_type_t p2mt);
 /* Start populating a paged out frame */
 void p2m_mem_paging_populate(struct domain *d, gfn_t gfn);
+#else
+static inline void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn,
+                                            p2m_type_t p2mt) {}
+static inline void p2m_mem_paging_populate(struct domain *d, gfn_t gfn) {}
+#endif /* CONFIG_VM_EVENT */
 /* Resume normal operation (in case a domain was paused) */
 struct vm_event_st;
 void p2m_mem_paging_resume(struct domain *d, struct vm_event_st *rsp);
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index ac8d34ffa0..636c0533b3 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -15,6 +15,7 @@
 
 #include "mm-locks.h"
 
+#ifdef CONFIG_VM_EVENT
 /*
  * p2m_mem_paging_drop_page - Tell pager to drop its reference to a paged page
  * @d: guest domain
@@ -186,6 +187,7 @@ void p2m_mem_paging_resume(struct domain *d, vm_event_response_t *rsp)
         gfn_unlock(p2m, gfn, 0);
     }
 }
+#endif /* CONFIG_VM_EVENT */
 
 /*
  * nominate - Mark a guest page as to-be-paged-out
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4de651038d..e9aaa7b321 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -33,9 +33,7 @@
  */
 struct vm_event_st;
 
-#ifdef CONFIG_VM_EVENT
 #include <asm/mem_access.h>
-#endif
 
 /*
  * Additional access types, which are used to further restrict
@@ -73,6 +71,7 @@ typedef enum {
     /* NOTE: Assumed to be only 4 bits right now on x86. */
 } p2m_access_t;
 
+#ifdef CONFIG_VM_EVENT
 struct p2m_domain;
 bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
                                  xenmem_access_t xaccess,
@@ -99,10 +98,41 @@ long p2m_set_mem_access_multi(struct domain *d,
 int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
                        unsigned int altp2m_idx);
 
-#ifdef CONFIG_VM_EVENT
 int mem_access_memop(unsigned long cmd,
                      XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t) arg);
 #else
+struct p2m_domain;
+static inline bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
+                                               xenmem_access_t xaccess,
+                                               p2m_access_t *paccess)
+{
+    return false;
+}
+
+static inline long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
+                                      uint32_t start, uint32_t mask,
+                                      xenmem_access_t access,
+                                      unsigned int altp2m_idx)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline long p2m_set_mem_access_multi(struct domain *d,
+                            const XEN_GUEST_HANDLE(const_uint64) pfn_list,
+                            const XEN_GUEST_HANDLE(const_uint8) access_list,
+                            uint32_t nr, uint32_t start, uint32_t mask,
+                            unsigned int altp2m_idx)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int p2m_get_mem_access(struct domain *d, gfn_t gfn,
+                                     xenmem_access_t *access,
+                                     unsigned int altp2m_idx)
+{
+    return -EOPNOTSUPP;
+}
+
 static inline
 int mem_access_memop(unsigned long cmd,
                      XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t) arg)
diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
index c086c4390c..1b7984909e 100644
--- a/xen/include/xen/monitor.h
+++ b/xen/include/xen/monitor.h
@@ -30,6 +30,7 @@ struct xen_domctl_monitor_op;
 #ifdef CONFIG_VM_EVENT
 int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
 void monitor_guest_request(void);
+int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
 #else /* !CONFIG_VM_EVENT */
 static inline int monitor_domctl(struct domain *d,
                                  struct xen_domctl_monitor_op *mop)
@@ -37,8 +38,11 @@ static inline int monitor_domctl(struct domain *d,
     return -EOPNOTSUPP;
 }
 static inline void monitor_guest_request(void) {}
+static inline int monitor_traps(struct vcpu *v, bool sync,
+                                vm_event_request_t *req)
+{
+    return -EOPNOTSUPP;
+}
 #endif /* !CONFIG_VM_EVENT */
 
-int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
-
 #endif /* __XEN_MONITOR_H__ */
diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
index 27d0c74216..4b3d0d15ec 100644
--- a/xen/include/xen/vm_event.h
+++ b/xen/include/xen/vm_event.h
@@ -50,6 +50,7 @@ struct vm_event_domain
     unsigned int last_vcpu_wake_up;
 };
 
+#ifdef CONFIG_VM_EVENT
 /* Returns whether a ring has been set up */
 bool vm_event_check_ring(struct vm_event_domain *ved);
 
@@ -68,6 +69,20 @@ bool vm_event_check_ring(struct vm_event_domain *ved);
  */
 int __vm_event_claim_slot(struct domain *d, struct vm_event_domain *ved,
                           bool allow_sleep);
+#else
+static inline bool vm_event_check_ring(struct vm_event_domain *ved)
+{
+    return false;
+}
+
+static inline int __vm_event_claim_slot(struct domain *d,
+                                        struct vm_event_domain *ved,
+                                        bool allow_sleep)
+{
+    return -EOPNOTSUPP;
+}
+#endif /* CONFIG_VM_EVENT */
+
 static inline int vm_event_claim_slot(struct domain *d,
                                       struct vm_event_domain *ved)
 {
@@ -82,23 +97,28 @@ static inline int vm_event_claim_slot_nosleep(struct domain *d,
 
 void vm_event_cancel_slot(struct domain *d, struct vm_event_domain *ved);
 
+#ifdef CONFIG_VM_EVENT
 void vm_event_put_request(struct domain *d, struct vm_event_domain *ved,
                           vm_event_request_t *req);
 
-#ifdef CONFIG_VM_EVENT
 /* Clean up on domain destruction */
 void vm_event_cleanup(struct domain *d);
 int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec);
+
+void vm_event_vcpu_pause(struct vcpu *v);
 #else /* !CONFIG_VM_EVENT */
+static inline void vm_event_put_request(struct domain *d,
+                                        struct vm_event_domain *ved,
+                                        vm_event_request_t *req) {}
 static inline void vm_event_cleanup(struct domain *d) {}
 static inline int vm_event_domctl(struct domain *d,
                                   struct xen_domctl_vm_event_op *vec)
 {
     return -EOPNOTSUPP;
 }
+static inline void vm_event_vcpu_pause(struct vcpu *v) {};
 #endif /* !CONFIG_VM_EVENT */
 
-void vm_event_vcpu_pause(struct vcpu *v);
 void vm_event_vcpu_unpause(struct vcpu *v);
 
 void vm_event_fill_regs(vm_event_request_t *req);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index dad69905c9..7c61f27366 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -155,9 +155,9 @@ struct xsm_ops {
     int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
     int (*get_vnumainfo)(struct domain *d);
 
+#ifdef CONFIG_VM_EVENT
     int (*vm_event_control)(struct domain *d, int mode, int op);
 
-#ifdef CONFIG_VM_EVENT
     int (*mem_access)(struct domain *d);
 #endif
 
@@ -651,13 +651,13 @@ static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
     return alternative_call(xsm_ops.get_vnumainfo, d);
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline int xsm_vm_event_control(
     xsm_default_t def, struct domain *d, int mode, int op)
 {
     return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
-#ifdef CONFIG_VM_EVENT
 static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
     return alternative_call(xsm_ops.mem_access, d);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 8a893c6eee..6f8b06b45f 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -115,9 +115,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .remove_from_physmap           = xsm_remove_from_physmap,
     .map_gmfn_foreign              = xsm_map_gmfn_foreign,
 
+#ifdef CONFIG_VM_EVENT
     .vm_event_control              = xsm_vm_event_control,
 
-#ifdef CONFIG_VM_EVENT
     .mem_access                    = xsm_mem_access,
 #endif
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 0382182f94..fd7aea460f 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1365,12 +1365,12 @@ static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM_OP);
 }
 
+#ifdef CONFIG_VM_EVENT
 static int cf_check flask_vm_event_control(struct domain *d, int mode, int op)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
 }
 
-#ifdef CONFIG_VM_EVENT
 static int cf_check flask_mem_access(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_ACCESS);
@@ -1969,9 +1969,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .do_xsm_op = do_flask_op,
     .get_vnumainfo = flask_get_vnumainfo,
 
+#ifdef CONFIG_VM_EVENT
     .vm_event_control = flask_vm_event_control,
 
-#ifdef CONFIG_VM_EVENT
     .mem_access = flask_mem_access,
 #endif
 
-- 
2.34.1


