Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D28C789E6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168718.1494773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOth-0001Lo-9d; Fri, 21 Nov 2025 11:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168718.1494773; Fri, 21 Nov 2025 11:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtg-0001Ej-KX; Fri, 21 Nov 2025 11:01:48 +0000
Received: by outflank-mailman (input) for mailman id 1168718;
 Fri, 21 Nov 2025 11:01:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrU-0007TB-KL
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:32 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25bafe3b-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:59:28 +0100 (CET)
Received: from CH2PR07CA0037.namprd07.prod.outlook.com (2603:10b6:610:5b::11)
 by MW6PR12MB8757.namprd12.prod.outlook.com (2603:10b6:303:239::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Fri, 21 Nov
 2025 10:59:23 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:5b:cafe::8) by CH2PR07CA0037.outlook.office365.com
 (2603:10b6:610:5b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:59:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:22 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:19 -0800
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
X-Inumbo-ID: 25bafe3b-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+OhLO9QQuXwusL1S/as/zdw5Hd48CY1mOfWhzyOlt1tVwGaLIB7HJPlSLHz5KExvtsZmT4kmi0aeo+frBCE9fIPPSvYxG60ZnIeBRYaFiwpPDbCuL894LY4CCsLMKFlbJXEZ4JeQABd1oQIyyCCvfxx7WrqdUvGGZIPTC2CAXH34+vkmlC452ZFLTDTWhxQRMyUvN9mcNC02nzdXaPTZJ9vk3oaw7UrxDKluZUdWQSbqeSZ+gWpbCAq5kDkXU58i8Q9o88hFzM89CdhgjCsA/Eihi/yIrIr4ZZYMoRL194f3vlzOacORCyRoObQJF3LRY+2JvcBiZINB4HJ6KrsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXCICJruve1evaLcc0VBzB4csGxFXhFrGDVb16+CJEc=;
 b=v0hfNg6AIFbNgVXLFNEwK+EvhHH/N8CEAtYn+rP6EU5NFWyc2U0/oSGp2eehABcO+5OFQ6AUTTYwEhUx56r5Yv8chCpoDLnNRbUIxWhYiRFg+MbpYeRfwwf1k08jOvIFjULGjt+fu9fPhO2arsxSLUlxm57y7OYuKZMNh0hJBC5qppjlX/KvGWS4jY0r9ZCp+MjLvDGh22TMPi9dtkvpQDTwqJm8QMof09XHRqvDL0YH4vdWp0IZ3825unIZ8lyePvGHevkxnaizaLVF1cPYXdndb/SQ/AkabmJkOON5Rl/FMCxX6ytpSv9q0lH00Bxp85RR1/F54/+fvdyHdVKixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXCICJruve1evaLcc0VBzB4csGxFXhFrGDVb16+CJEc=;
 b=CYRhRILUCU5MwbhTac81LME/GL3BlMEa0CmSq8M/sd3RuxZo9mJAgRCKOtj+J4qk9Rw5gmniu00MOWrPO8G6D2KPixPgx8UR06Qv6AmhYKR+naJy3093u7T25WIUPdRh/Bh0rkbWnsvGcc+6bS/AsjEozO0ikYxtKR3JyWhI2tQ=
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
Subject: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:57 +0800
Message-ID: <20251121105801.1251262-21-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|MW6PR12MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: afd61635-e19b-42d2-226f-08de28ed075a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?doufl69hO38xm4Bh6VM12MwiSdOntTO7wbxzhHQtW/+qKiN6AXCpw7Xr9mma?=
 =?us-ascii?Q?i8bvl2gtX3XbpZkbWRfv7tRhvdRMystuVTp17wMlO7UTrrM6qiikRgArUh0I?=
 =?us-ascii?Q?M0+LtsRzYZ5Mkrx9FoZvdUj8h6pc8Lolk4dkh931KqeT9s995rrdPpQVYMtj?=
 =?us-ascii?Q?bzS473LSdmyAgLcK8gGSWNkfq6qhUbHVo0H4k+VXt6xD0+g90aZW/NRvjwrE?=
 =?us-ascii?Q?omX/yik0G7Qv/M3lDrNOaBJYuNN5CvrXZUMQyLQ0zJ4XRIMDjm1ShamyBPYZ?=
 =?us-ascii?Q?rJeoC6miuSZLNlopCt4BZkMGyNHPZksyEOhgVrydacFxt2HHF03MQdVaNmxn?=
 =?us-ascii?Q?/ZHiuHfMZkwH19NdLvRpshr+8WC2WeQHQPLaueZ0F9P/I4Bhi3JyCEUlAKD/?=
 =?us-ascii?Q?3XCni3zCrsgJwA3sR5PXjB+9Eiclux+FO1BymJxckeMoohvQwmu0Qh4v+MsX?=
 =?us-ascii?Q?KZKY6zIh3lQNecUX12eoW90Q3O7BSo9Q4fIYzUFyVZYi5NnFTh6ghFkddQ1Z?=
 =?us-ascii?Q?cLPqn0itQcU/9edlomnYYX9cVHxKUwOEtepWeJArsHBGXrji+oJAoFL5y1Xe?=
 =?us-ascii?Q?M9LmvZUyWRUCgjc078fAgqKL9LXAlDlcXjvJ8sqGbcbWfbB7vq2VnoHQ/t3R?=
 =?us-ascii?Q?J26dpmy4YX/CxsQlwLyFSSlKlJDWLzsyxlyVN0nKGm27w4u0CG0WachEVF6d?=
 =?us-ascii?Q?BlJca/RYD1LmY0M5vEiDKEDx489knXoVIGok99XuqOpN+6SUdedzTX6ZP83e?=
 =?us-ascii?Q?Rg9nc77JzOYIdRj1qnwbKG3tOd4iQAJgCyuwX9xRxpaV+2/58H561qklNna+?=
 =?us-ascii?Q?jWyMaXp5PMr62//87E1XCITNPacWZTjxPfT4u20M0XHNg0wG1CX9Q2HmxAq9?=
 =?us-ascii?Q?z+eZJ3ooNvuyNEgc16rusQpGhlIpiqTvXaZxutTUPwPm0LpxVgUra42wiRIa?=
 =?us-ascii?Q?RR7Ijinlfb7Lm4949ovGX+K5ls3c2ndthl+SATHvbYyBSkZ6E6vx1Els3gAW?=
 =?us-ascii?Q?FUdgrsJxvgK/XboyxgCJfP1T8FgDSaprtjJ+yVrYLkGdKLfb1hnRh+QzTQnZ?=
 =?us-ascii?Q?pCtdH29w8Fium0HCrbqPxUbH+wY8EuKjakTLo6CpIzQKkk0K4qZRs1+n1lIn?=
 =?us-ascii?Q?jgcCSHAfrdJaX92ym7wbnEbYH97Vz8Z9RtdGgCvad9nnk6LEDyKYwL8pA3ch?=
 =?us-ascii?Q?YJ2xC2oyNyILWSuD8wxEyS+hdqDvPKppItCWr1ZyVpAU9Vei/fJEDgCoR5MI?=
 =?us-ascii?Q?nc7m7ePbwSBiT9y0jUEx1XYOMAdvPPoqa7qhcgachjB6gesMnvEylJsKE9bJ?=
 =?us-ascii?Q?/VvVxFKUyuJ0XQRlkPRuqBt4xNWOLdKImxpK/s7SNgTg7cZ1jAhob/IlquD8?=
 =?us-ascii?Q?F0Df+gVndQL4BUugQ4Hh1+vWKEdRj2XQ5aG4/nl3DjhRG2rm8uBGhbQa59mP?=
 =?us-ascii?Q?ioGmlSgm8x5JFlixmLMqca4G9m7yUUd60yitN502fgVIHPcJdzLzGJ3T80yw?=
 =?us-ascii?Q?eXvHWyxMBR1d9TkH6w2YpdoRBSlADjycE64YIrUsHSEBPhLxPDgyN0+OnY2G?=
 =?us-ascii?Q?LMgc76G5M7JGL80UWTg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:22.8350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afd61635-e19b-42d2-226f-08de28ed075a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8757

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
- make cpuid.o/policy.o/msr.o depend on CONFIG_MGMT_HYPERCALLS
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
 xen/Kconfig.debug                 | 1 +
 xen/arch/x86/Kconfig              | 2 +-
 xen/arch/x86/Makefile             | 2 +-
 xen/arch/x86/hvm/Kconfig          | 1 +
 xen/arch/x86/hvm/hvm.c            | 2 ++
 xen/arch/x86/hvm/pmtimer.c        | 2 ++
 xen/arch/x86/include/asm/p2m.h    | 2 +-
 xen/arch/x86/include/asm/paging.h | 2 +-
 xen/include/hypercall-defs.c      | 4 +++-
 xen/lib/x86/Makefile              | 6 +++---
 10 files changed, 16 insertions(+), 8 deletions(-)

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
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 8368c6ecf0..d49681beed 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,7 +29,7 @@ config X86
 	select HAS_PCI_MSI
 	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
-	imply HAS_SOFT_RESET
+	select HAS_SOFT_RESET if MGMT_HYPERCALLS
 	select HAS_UBSAN
 	select HAS_VMAP
 	select HAS_VPCI if HVM
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d21fdd49df..006a6e56d3 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -79,7 +79,7 @@ obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index d540c0ebf3..52b22e5d17 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -37,6 +37,7 @@ config INTEL_VMX
 config VMTRACE
 	bool "HW VM tracing support"
 	depends on INTEL_VMX
+	depends on MGMT_HYPERCALLS
 	default y
 	help
 	  Enables HW VM tracing support which allows to configure HW processor
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d03f563d76..b03f7dfcf6 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5204,6 +5204,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int hvm_debug_op(struct vcpu *v, int32_t op)
 {
     int rc = 0;
@@ -5246,6 +5247,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
 
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
index 0c06b0a7a8..ba5ba7324e 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
+#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE) && defined(CONFIG_MGMT_HYPERCALLS)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 4840de805b..38b21dccbd 100644
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
@@ -299,7 +299,9 @@ hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
+#ifdef CONFIG_MGMT_HYPERCALLS
 paging_domctl_cont                 do       do       do       do       -
 #endif
+#endif
 
 #endif /* !CPPCHECK */
diff --git a/xen/lib/x86/Makefile b/xen/lib/x86/Makefile
index ac6d4369f3..124af43ea0 100644
--- a/xen/lib/x86/Makefile
+++ b/xen/lib/x86/Makefile
@@ -1,4 +1,4 @@
-obj-y += cpuid.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += cpuid.o
 obj-y += cpuid-generic.o
-obj-y += msr.o
-obj-y += policy.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += msr.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += policy.o
-- 
2.34.1


