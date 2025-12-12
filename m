Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E19CB7D8F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185026.1507354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTubG-0001SO-DS; Fri, 12 Dec 2025 04:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185026.1507354; Fri, 12 Dec 2025 04:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTubG-0001Pt-AW; Fri, 12 Dec 2025 04:17:50 +0000
Received: by outflank-mailman (input) for mailman id 1185026;
 Fri, 12 Dec 2025 04:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuRG-0007SS-0i
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:30 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11be36f9-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:07:27 +0100 (CET)
Received: from BL0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:207:3c::26)
 by DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Fri, 12 Dec 2025 04:07:18 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::37) by BL0PR02CA0013.outlook.office365.com
 (2603:10b6:207:3c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Fri,
 12 Dec 2025 04:07:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:18 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:15 -0600
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
X-Inumbo-ID: 11be36f9-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtJBKnUIRPK6mTgGDpg11uAgkOTxIDKcTltV0NRSu6LOnebC6K+Jnn3pmA+JzFAz1fM9YHPGgeCUtMj2EKr4ocCAyPJW447VWU0svziDVlLz3DqrZOhaEb0R1V7AoRvzelOxV9uDmGme1kjJzJ2IBxxjJrYW3kX9mSlUJjws8hzsR2BiKnH149Cn/kZFLbtvIZHOJfnWpMVsVZWZWbctudmixUnxbIgoqKSF1tD5Z6wJdD0Fnq3GcwD3XGX90VOmthxCD4LNxhVUDmdSkzImSbJ2mY1CXNbqgRccmOAr2ylx+P0iSrJxsYIT4jEHkALUOzDRAc7ZITcd28/Jg/Bhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hazNCar4WYebJf7A/BJnz7JkBCn0HLXqiGSPgIqEUcQ=;
 b=n9iLfnpBV0w7C2gdPIXoe6zCM439OMhchlhHmmQV2rbjHjsFiPJagRou5A+5YQMoFFbl/aLWYeg9iz0oDyUFHMWwh9J4vF1GaBthMjBnfkhV0Fjv6RZOePZK+Nwn6dgXL4EktskuXyR4nQPhMZPCEJXl+4+b53TRcmQ7/mpfyeV//CG5sAxsEIiOzwIMAVgpjPdeT/QUjUqMmAv7qTKa8T1skmQnqu5s/L1Y6nIcjK0ROZNlpG5V0XZCw5nCchVuAK/FEKpLhWn8aRE5drx5QTUoMBYPJVEfywWg9aTTE55w/lF7n+zxjcgIYauiR+3RkZEkqJ0NgHtw3T3D08ocUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hazNCar4WYebJf7A/BJnz7JkBCn0HLXqiGSPgIqEUcQ=;
 b=CvrvAb/3XyOccrQKIhu/Z5sOQAKjUDCxqI8RGR5SamhlyEvSq4TKl4FfjalvfiZIazFPDWN33eR2vU6JqI5X+WaTxlWtNXtPyNOo+MRQ5q4tXodSzFrYb5Aw9wwKpNPN098olRIFB2LF2/9G6iHkAxvh+T/jhnoX1lx8PAi8v3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v5 20/24] xen/x86: wrap x86-specific domctl-op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:05 +0800
Message-ID: <20251212040209.1970553-21-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|DS7PR12MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad07a58-0817-41de-3aca-08de3933f128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?19M4b/V/O+JwWRuGFBwJOYqBVNgGTQ6qqjVal6tOoexGgtw20Tbfapt5mj3/?=
 =?us-ascii?Q?aHGFgm98eIZ7pUhTovwopu53Ox2p9uuvIaKKo+rBHLv41+Nwh4Rz/DTTIY7u?=
 =?us-ascii?Q?uVUJcADa+67db6RFCfCzNTksn6lsmafm8A5p421zmHxpT755C4heIOpgW/yF?=
 =?us-ascii?Q?WNa6FhZkjcwESUeYGE+1lp1od3kAZEQFTU0NfUpgFCD5deB/RxTHz94nS8nZ?=
 =?us-ascii?Q?hKdXTyW6DtaK0xUtoBTqsjbht6hyMAiw+Fdz7wDzO+FGvF4Fc2HJU1o+gafU?=
 =?us-ascii?Q?MSNl6PDM4KTC6ie5Buyb/RzUGxdkV6amtXvedW1wpiGctwZg/yYSy7PTbh6X?=
 =?us-ascii?Q?2RefDan7aUXP8OtZ0JaPok+RUizFZDddZiBa7NH7QSQXXj9cuBPr/8vNJ5UF?=
 =?us-ascii?Q?wpgNtGbbJFsBhZEKqxBsbqavC2UfQuGN679BPcyT5xRgrfYjA5qfNEoTG+Dj?=
 =?us-ascii?Q?Yd+yZh/fEtsla7J6F+4d0xyZKxrBfBAP9Tht2LNHwIuBx3awCMdj0TxoDmQF?=
 =?us-ascii?Q?6VZ9CKT4VbUwOzlsX4fwm3HxfnMKhsLlqMr3N9uVUJveLZkHVj5UQRxsPi08?=
 =?us-ascii?Q?8JubafIZFEYv7dCGQ3LLLau5VwKb4kjyZ4LRoSLxIJupdO5fVDwNXxcYvB0h?=
 =?us-ascii?Q?Ue3qX21GokgXBBDcso63RcXVn5cfzgMoiXjuSo+abXfX+3Pr2bwwi8KbdD6W?=
 =?us-ascii?Q?mlScpPtJok6wXhV+klRYFvRiSflfIth5yXwOsot5ItPvUFHfLwfNGjeQbZ7F?=
 =?us-ascii?Q?xNDTN9SI2AjOc9TGcN7eKgriSizes641g3naNa+IiKCsio9S/hb9MqZrxzq0?=
 =?us-ascii?Q?c28THroTXl2H4ZLhPpjOtkKzKHbymPpaQ7Hh9J02HQu92Lc7jLIiogsd2fb2?=
 =?us-ascii?Q?fryYweELVXOGwH0bDtZD0rnC9soHWl75j2VAhuW2Ey24vKLxZRcDifnOIMzd?=
 =?us-ascii?Q?5stAWIh5NBf58l1LxPt5Ie1RajlpeG2DJnnZo9oT4U+4ogmrZ4dR4WVZjAGQ?=
 =?us-ascii?Q?75MIiGLB/k1+lHZ4bopTEdkGhQlAtd06mf8reqo+ZNQVnEFyu/n1NmnyzyJ3?=
 =?us-ascii?Q?TDNeScr/rlTp80BsGSNCdewpJ5TxbbhNbvrszOw+aHB8NRxDWMwWIIWqqdJg?=
 =?us-ascii?Q?aGFXEMkmJHdJymYPL8oSgC/5W22OC9tdRGiKtzvuEOos+TcRlFQbcp+Xlunb?=
 =?us-ascii?Q?sy+o38dqV5NqvYuIM+zL9ZoUmqjgBmgX7w0GAI0UEYKYM1Lk7zDloNMVIFyB?=
 =?us-ascii?Q?mCIsu0l9ay4iulbgRfQbqdbaOiNnKQAtij4cWiEiLormwBQR2u7dVkQ2PIKS?=
 =?us-ascii?Q?IBbj4FJqcQ05KDABAQv8+jUwyAG9eptCFtMUwxChyZDe73gWvVeONENS7jIx?=
 =?us-ascii?Q?QssfZ2iakd3LvX1Hz7W0vKz/OlbrThP5L1ER8yMw1TbtC5JdztVma13yI0L0?=
 =?us-ascii?Q?oAVW3BNjwOgKAj0XNaDQ+B7MorMIVglXb05+ptAYA/BQvCRt6T6F7FhEUv3V?=
 =?us-ascii?Q?QCHTAHpgpCplWakiYUp/9MtZyS8cZjGs9EOB1Ti4Y9VQ38DVOo3dqCTFOyBL?=
 =?us-ascii?Q?wEbyWP8PqvaATxnGGgk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:18.4887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad07a58-0817-41de-3aca-08de3933f128
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6285

Function arch_do_domctl() is responsible for arch-specific domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS
We focus on x86 implementation here only. Tracking its calling chain and the
following functions shall be wrapped with CONFIG_MGMT_HYPERCALLS too.
Otherwise they will all become unreachable when MGMT_HYPERCALLS=n, and hence
violating Misra Rule 2.1.
- hvm_acpi_power_button
- hvm_acpi_sleep_button
- hvm_debug_op
- make P2M_AUDIT depend on CONFIG_MGMT_HYPERCALLS
- make PG_log_dirty depend on CONFIG_MGMT_HYPERCALLS
- make policy.o/msr.o depend on CONFIG_MGMT_HYPERCALLS
- make cpuid-cp2buf.o/cpuid-cpfrbuf.o/cpupolicy-clr.o depend on CONFIG_MGMT_HYPERCALLS
- make HAS_SOFT_RESET depend on CONFIG_MGMT_HYPERCALLS
- make VMTRACE depend on CONFIG_MGMT_HYPERCALLS
- paging_domctl_cont
We put the guardian in Makefile for the arch-specific domctl.o compilation.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- split out xsm parts
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap default-case and arch_get_domain_info() transiently
---
v2 -> v3:
- add missing guardian in arm/Makefile
- cover RTIT_CTL{,STATUS}_MASK #define-s
- add missing guardian for .vmtrace_output_position
- guard the whole static inline function
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around default-case and arch_get_domain_info()
---
v3 -> v4:
- make HAS_SOFT_RESET depend on CONFIG_MGMT_HYPERCALLS
- make VMTRACE depend on CONFIG_MGMT_HYPERCALLS
- seperate depends on condition for future convenience
- split arch-specific domctl-op into x86 and arm
---
v4 -> v5:
- do not undo imply and add "depends on MGMT_HYPERCALLS" in option
- use IS_ENABLED(...) to avoid too long line
- move paging_domctl_cont hypercall-def closer to avoid scattering #ifdef
---
 xen/Kconfig.debug                 | 1 +
 xen/arch/x86/Makefile             | 2 +-
 xen/arch/x86/hvm/Kconfig          | 1 +
 xen/arch/x86/hvm/hvm.c            | 2 ++
 xen/arch/x86/hvm/pmtimer.c        | 2 ++
 xen/arch/x86/include/asm/p2m.h    | 2 +-
 xen/arch/x86/include/asm/paging.h | 3 ++-
 xen/common/Kconfig                | 1 +
 xen/include/hypercall-defs.c      | 8 ++++----
 xen/lib/Makefile                  | 6 +++---
 xen/lib/x86/Makefile              | 4 ++--
 11 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index a69615cd63..c078c6bf2e 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -15,6 +15,7 @@ if DEBUG || EXPERT
 
 config GDBSX
 	bool "Guest debugging with gdbsx"
+	depends on MGMT_HYPERCALLS
 	depends on X86
 	default y
 	help
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 1e2ce8e72c..d389787bb3 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -80,7 +80,7 @@ obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index df9bea65b0..1989808810 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -54,6 +54,7 @@ config HVM_FEP
 config ALTP2M
 	bool "Alternate P2M support" if EXPERT
 	depends on INTEL_VMX
+	depends on MGMT_HYPERCALLS
 	default y
 	help
 	  Alternate-p2m allows a guest to manage multiple p2m guest physical
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5d297fb42a..ce75fb7839 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5208,6 +5208,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int hvm_debug_op(struct vcpu *v, int32_t op)
 {
     int rc = 0;
@@ -5250,6 +5251,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 87a7a01c9f..f080f7561d 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -56,6 +56,7 @@ static void pmt_update_sci(PMTState *s)
         hvm_isa_irq_deassert(s->vcpu->domain, SCI_IRQ);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void hvm_acpi_power_button(struct domain *d)
 {
     PMTState *s = &d->arch.hvm.pl_time->vpmt;
@@ -81,6 +82,7 @@ void hvm_acpi_sleep_button(struct domain *d)
     pmt_update_sci(s);
     spin_unlock(&s->lock);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* Set the correct value in the timer, accounting for time elapsed
  * since the last time we did that. */
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 9016e88411..3574e2eecd 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -20,7 +20,7 @@
 #include <asm/page.h>    /* for pagetable_t */
 
 /* Debugging and auditing of the P2M code? */
-#if !defined(NDEBUG) && defined(CONFIG_HVM)
+#if !defined(NDEBUG) && defined(CONFIG_HVM) && defined(CONFIG_MGMT_HYPERCALLS)
 #define P2M_AUDIT     1
 #else
 #define P2M_AUDIT     0
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 0c06b0a7a8..b95d80e75a 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -57,7 +57,8 @@
 #endif
 #if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 /* Enable log dirty mode */
-#define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
+#define PG_log_dirty   IS_ENABLED(CONFIG_MGMT_HYPERCALLS) &&                \
+                        (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
 #define PG_log_dirty   0
 #endif
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 2914508a8f..64023703ae 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -157,6 +157,7 @@ config HAS_SCHED_GRANULARITY
 
 config HAS_SOFT_RESET
 	bool
+	depends on MGMT_HYPERCALLS
 
 config HAS_STACK_PROTECTOR
 	bool
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 4840de805b..a08e80ed59 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -196,10 +196,10 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl(xen_sysctl_t *u_sysctl)
-#endif
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
+#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
 platform_op(xen_platform_op_t *u_xenpf_op)
@@ -279,6 +279,9 @@ hvm_op                             do       do       do       do       do
 #endif
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl                             do       do       do       do       do
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
+paging_domctl_cont                 do       do       do       do       -
+#endif
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
@@ -298,8 +301,5 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
-paging_domctl_cont                 do       do       do       do       -
-#endif
 
 #endif /* !CPPCHECK */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 9b3e03a511..26c6a0de33 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -46,7 +46,7 @@ lib32-y := divmod.o
 lib32-$(CONFIG_64BIT) :=
 lib-y += $(lib32-y)
 
-libx86-y := x86/cpuid-cp2buf.o
-libx86-y += x86/cpuid-cpfrbuf.o
-libx86-y += x86/cpupolicy-clr.o
+libx86-$(CONFIG_MGMT_HYPERCALLS) := x86/cpuid-cp2buf.o
+libx86-$(CONFIG_MGMT_HYPERCALLS) += x86/cpuid-cpfrbuf.o
+libx86-$(CONFIG_MGMT_HYPERCALLS) += x86/cpupolicy-clr.o
 lib-$(CONFIG_X86) += $(libx86-y)
diff --git a/xen/lib/x86/Makefile b/xen/lib/x86/Makefile
index 780ea05db1..89fb4bba27 100644
--- a/xen/lib/x86/Makefile
+++ b/xen/lib/x86/Makefile
@@ -1,3 +1,3 @@
 obj-y += cpuid.o
-obj-y += msr.o
-obj-y += policy.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += msr.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += policy.o
-- 
2.34.1


