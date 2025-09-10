Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68AAB50FA9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117588.1463697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQY-0007ew-4i; Wed, 10 Sep 2025 07:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117588.1463697; Wed, 10 Sep 2025 07:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQY-0007av-0k; Wed, 10 Sep 2025 07:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1117588;
 Wed, 10 Sep 2025 07:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQV-0005yo-Te
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2413::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ab49d7e-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:33 +0200 (CEST)
Received: from BYAPR11CA0037.namprd11.prod.outlook.com (2603:10b6:a03:80::14)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:26 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::1b) by BYAPR11CA0037.outlook.office365.com
 (2603:10b6:a03:80::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Wed,
 10 Sep 2025 07:39:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:08 -0700
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
X-Inumbo-ID: 4ab49d7e-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwst07hOzSoOjY8LqjmHZsMCrhlPKwOYHMjxyg6D3g9+HnnFPK2GLFpCOfFYY1AkzZqmkLmn/WIlOhcWihAHEtjdNtiqUzrRs7it+YGK1gq9Du10FPFiU4FXc5I61Qu0tvee9Bua+5b+0CwRaapcN+t8PY+LXYcwe+LlttSpKfh45e6L2Zc+lOyvel41bLxUPEoMdOGwTS2anvt9KWK6Gfkbdym6MLerw+eDBULmY8Vpg0+Ih7nZ+LVM+aiWhIAs/7IBv+8S45EapsRYwE2tHWXs5sUst9HlwjP6LRmYETsGrG8ASH/0jsltyIXOU4Z8krMkCdOsZB14pxthOq/Uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SvkVjnTmPEwi4ioI5p5ke75eXA6MP3pWxYaqdIpCbw=;
 b=SXda7LQZUJWxv2MVgyvrjDp0RPSOiNm/aDnyJqJcB9CFF49qCltL9MkLcUNr9wfq6L6cduqDJBEYfV7UAa0RMvUww/qlZRdwN6WsrvRTGqU5yHYExqjkFmNjZ/EwtJNKLbIDdDWCZ29T2PfoL6LIA4wTZCCR0onyd0RZAZ4oN8Kj4IM7mN2cv7/SorFq8tMXx3u8lhdqI5oqynfmzQ3Rn3CtUGS4RWGn8no1Y4E+nKbssZ+yhIIaXNnb9JaR1uVw2q1UNG6Hxt6iCpjT4yAohNn9+Ed6Fer8q0L0EKbhnDIJ6XAGRqK57FNqg7DmcGHurSoXTV0hhozOJrKH7l+8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SvkVjnTmPEwi4ioI5p5ke75eXA6MP3pWxYaqdIpCbw=;
 b=Hv6vHBQt8ZxKXzqMYC58SlC8nwsqfWekVozkqlJVoI/xdy7KMeXFAFyVNUPtojluFtpJ4MuzWNTX67K8/xG8BmzqnKz5BUdSgenxlgfvIZTfUxQRFbPlyrxP6/Jw8Pes2cOY70YDyJvj2VKw2eNAlfWOEF7lyMGjKzhdYqkvG/U=
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
 Pircalabu" <ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
Date: Wed, 10 Sep 2025 15:38:05 +0800
Message-ID: <20250910073827.3622177-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|MN2PR12MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: d1601738-a023-4573-46d1-08ddf03d2acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QQ2HpMtvMBYBUaLk/jQa7TPxm4KLaUJcFoe8X+B0Uz0Bo5JZYYC5JMbg9MyL?=
 =?us-ascii?Q?/0hqNQryUt3lYyoyE+YcPZVmWlyMdbd6AVqwFxAhxcU2Bar17MfDDvGnr1UO?=
 =?us-ascii?Q?/exBwL1OtAxgkAw9tzMpiyYNaiqFMx+ZxOIkaN1hnIl3V9lFjybJKTs6Cepl?=
 =?us-ascii?Q?T2cGhUIy0VxJOLvfGUPxuudnGOkr9NhqbMnH9OiakmQDWubxI0sS1p1qwQ3V?=
 =?us-ascii?Q?RU8QwL2g5EqdteXumchsBkWTC8zh1dc1stBKSGsgghSgZBrs5sHxuHXrOYVj?=
 =?us-ascii?Q?LLHDJw8P+uvFA8MvJXw+HcGYIGOa4LvURxciJRJHhAKnR+X+l2Uuqoz0KeFv?=
 =?us-ascii?Q?dkxE8WVEFkdePLOHOTz5lQazbKX7m5eLMDd4cQFr3FDqVFZL9b49HOtBakMv?=
 =?us-ascii?Q?EMEDp1dJb7GT3B6kAgXgTJW9KKV+dplnQPXlYcuG0SV34r2h8eaSjcKZF29+?=
 =?us-ascii?Q?nP+OJXoZOLMJmUw+iFB/DoN5Mae7csTB5FUHDlYNJ5OcPzzV/3HiFE8XJXKI?=
 =?us-ascii?Q?ju+gGGXR92o2LTUpoF9c5mvgD1VOYgpogDgBpRX84aQOzp7lxDP0nlHK/fwf?=
 =?us-ascii?Q?iJBf9HML6sxOfFFv434SX9Ymik+M+9/eQ2JJZLBkUXXnDRlHjrtKOhG+kH2P?=
 =?us-ascii?Q?uVSRKKGqJeEO29LKUAnIiqxWF1FC2yMJeYPFU8x/+rmW9/SODi0ELcwqubit?=
 =?us-ascii?Q?K239oAy4FjSSz65oWeeGuReEBYWQRYKdPHMWf1zxk551OsfuYYbPzlpNx3iW?=
 =?us-ascii?Q?fq7DAmw7mFhLcQ2YbGKM2s/3uw1N0Fm2/fNCC9oOdF5G25Rz4Sil5YUCjXr7?=
 =?us-ascii?Q?PTIml2xv9JWTUpAHQ0zOvpEOk2QOn2V+Lwb2cg3aXjN+z/mlRdZ7ue8G+CER?=
 =?us-ascii?Q?qpdOaj5CATWLin+RvnBuTJXePrlGc4JQLvJmkJVW0n1+JSQZNcQ7ODjWyRLm?=
 =?us-ascii?Q?05TGnGJIaNI2JOpGKrzWVZWmztSMd4H1Ul+HHV7Jlki8HFtOLNJpomtkvwS5?=
 =?us-ascii?Q?xvYrRg/13YTE/wRiAyZjP2vTXRppVsNOMZKpF43G6xx1v405uCZUQNv9QxjE?=
 =?us-ascii?Q?Jntr+l3mGJXD7LvT9wx7W/I/+7pg0hgutF0f3Cde8+9QG/r9ZcnuMuBYEfH6?=
 =?us-ascii?Q?9W9yQa7LwpzzQVAyzh4Ye25ENZkStyogf3ile9I7pmjkj1BXw55RhNJwstiG?=
 =?us-ascii?Q?3I/mpUsdwF2hd0s3Nlmy5ZU36fnrhjxHwgzydvF4lCag2ue2FKE581AAYV7p?=
 =?us-ascii?Q?k/t/ZVJx3WGkjrTJ3O8I8m6YVHEgZQp6qrFInSEt+sGA1ufhKRCvkYcIb6wO?=
 =?us-ascii?Q?ngscSstSOsZIkzs4uUEuWqMbgh+299mSSEoeilvKoe0iqBF6yNohvW7ZLIEz?=
 =?us-ascii?Q?PkrODbOrPyAhIobun1LaPxJf5d1o+tP62b2yJwiw28Vl8zT/EHGZDMMRA68g?=
 =?us-ascii?Q?hJy61gNTwiUJAFTFEtqJp5U26/5ohwmD5GlJEKfMDtIzyN7eubBJECVo6cfn?=
 =?us-ascii?Q?/btXSTYnANXrvSgY8/2zM9IoK6sZhM1s4ilj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:25.7498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1601738-a023-4573-46d1-08ddf03d2acc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334

File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
Futhermore, features about monitor_op and memory access are both based on
vm event subsystem, so monitor.o/mem_access.o shall be wrapped under
CONFIG_VM_EVENT.

Although CONFIG_VM_EVENT is forcibly enabled on x86, we could disable it
through disabling CONFIG_MGMT_HYPERCALLS in the future.
In consequence, a few functions, like the ones defined in hvm/monitor.h,
needs stub to pass compilation when CONFIG_VM_EVENT=n.
Remove the CONFIG_VM_EVENT wrapper for "#include <asm/mem_access.h>", as
we need stub of "p2m_mem_access_check()" to pass compilation on
CONFIG_VM_EVENT=n

The following functions are developed on the basis of vm event framework, or
only invoked by vm_event.c/monitor.c/mem_access.c, so they all shall be
wrapped with CONFIG_VM_EVENT:
- hvm_toggle_singlestep
- hvm_fast_singlestep
- hvm_enable_msr_interception
  - hvm_function_table.enable_msr_interception
- hvm_has_set_descriptor_access_existing
  - hvm_function_table.set_descriptor_access_existing

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- split out XSM changes
- remove unnecessary stubs
- move "struct p2m_domain" declaration ahead of the #ifdef
---
 xen/arch/x86/Makefile                   |  2 +-
 xen/arch/x86/hvm/Makefile               |  4 +-
 xen/arch/x86/hvm/hvm.c                  |  2 +
 xen/arch/x86/hvm/svm/svm.c              |  8 +++
 xen/arch/x86/hvm/vmx/vmx.c              | 10 ++++
 xen/arch/x86/include/asm/hvm/hvm.h      | 10 ++++
 xen/arch/x86/include/asm/hvm/monitor.h  | 65 ++++++++++++++++++++++++-
 xen/arch/x86/include/asm/hvm/vm_event.h |  4 ++
 xen/arch/x86/include/asm/mem_access.h   |  9 ++++
 xen/arch/x86/include/asm/monitor.h      |  7 +++
 xen/include/xen/mem_access.h            | 35 +++++++++++--
 xen/include/xen/monitor.h               |  8 ++-
 xen/include/xen/vm_event.h              | 24 ++++++++-
 13 files changed, 176 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index a9fdba0b4c..a7bfe4c0b1 100644
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
index 23bd7f078a..b044dc2ecb 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5266,6 +5266,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
 {
     ASSERT(atomic_read(&v->pause_count));
@@ -5275,6 +5276,7 @@ void hvm_toggle_singlestep(struct vcpu *v)
 
     v->arch.hvm.single_step = !v->arch.hvm.single_step;
 }
+#endif /* CONFIG_VM_EVENT */
 
 #ifdef CONFIG_ALTP2M
 void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b54f9d9af5..b726d760d4 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -298,6 +298,7 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -305,6 +306,7 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void svm_save_dr(struct vcpu *v)
 {
@@ -825,6 +827,7 @@ static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmcb_set_general2_intercepts(vmcb, general2_intercepts);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check svm_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -842,6 +845,7 @@ static void cf_check svm_set_descriptor_access_exiting(
 
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
 {
@@ -2456,9 +2460,13 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
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
index e2b5077654..4cf5da70ad 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1519,6 +1519,7 @@ static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmx_vmcs_exit(v);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -1533,6 +1534,7 @@ static void cf_check vmx_set_descriptor_access_exiting(
     vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void cf_check vmx_init_hypercall_page(void *p)
 {
@@ -2412,6 +2414,7 @@ static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
         printk_once(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -2419,6 +2422,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
+#endif /* CONFIG_VM_EVENT */
 
 #ifdef CONFIG_ALTP2M
 
@@ -2870,7 +2874,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
+#endif
 #ifdef CONFIG_ALTP2M
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
@@ -3078,9 +3084,11 @@ const struct hvm_function_table * __init start_vmx(void)
 
     vmx_function_table.caps.singlestep = cpu_has_monitor_trap_flag;
 
+#ifdef CONFIG_VM_EVENT
     if ( cpu_has_vmx_dt_exiting )
         vmx_function_table.set_descriptor_access_exiting =
             vmx_set_descriptor_access_exiting;
+#endif
 
     /*
      * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
@@ -3151,8 +3159,10 @@ void __init vmx_fill_funcs(void)
     if ( !cpu_has_xen_ibt )
         return;
 
+#ifdef CONFIG_VM_EVENT
     vmx_function_table.set_descriptor_access_exiting =
         vmx_set_descriptor_access_exiting;
+#endif
 
     vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
     vmx_function_table.process_isr            = vmx_process_isr;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index f02183691e..b2c75b733e 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -192,7 +192,9 @@ struct hvm_function_table {
     void (*handle_cd)(struct vcpu *v, unsigned long value);
     void (*set_info_guest)(struct vcpu *v);
     void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
+#ifdef CONFIG_VM_EVENT
     void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
+#endif
 
     /* Nested HVM */
     int (*nhvm_vcpu_initialise)(struct vcpu *v);
@@ -224,7 +226,9 @@ struct hvm_function_table {
                                 paddr_t *L1_gpa, unsigned int *page_order,
                                 uint8_t *p2m_acc, struct npfec npfec);
 
+#ifdef CONFIG_VM_EVENT
     void (*enable_msr_interception)(struct domain *d, uint32_t msr);
+#endif
 
 #ifdef CONFIG_ALTP2M
     /* Alternate p2m */
@@ -435,7 +439,11 @@ static inline bool using_svm(void)
 
 static inline bool hvm_has_set_descriptor_access_exiting(void)
 {
+#ifdef CONFIG_VM_EVENT
     return hvm_funcs.set_descriptor_access_exiting;
+#else
+    return false;
+#endif
 }
 
 static inline void hvm_domain_creation_finished(struct domain *d)
@@ -681,7 +689,9 @@ static inline int nhvm_hap_walk_L1_p2m(
 
 static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
+#ifdef CONFIG_VM_EVENT
     alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
+#endif
 }
 
 static inline bool hvm_is_singlestep_supported(void)
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
index 3c64d8258f..850c0798d7 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -123,7 +123,14 @@ static inline void arch_monitor_cleanup_domain(struct domain *d) {}
 
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
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4de651038d..efbb26b703 100644
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
@@ -74,6 +72,7 @@ typedef enum {
 } p2m_access_t;
 
 struct p2m_domain;
+#ifdef CONFIG_VM_EVENT
 bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
                                  xenmem_access_t xaccess,
                                  p2m_access_t *paccess);
@@ -99,10 +98,40 @@ long p2m_set_mem_access_multi(struct domain *d,
 int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
                        unsigned int altp2m_idx);
 
-#ifdef CONFIG_VM_EVENT
 int mem_access_memop(unsigned long cmd,
                      XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t) arg);
 #else
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
-- 
2.34.1


