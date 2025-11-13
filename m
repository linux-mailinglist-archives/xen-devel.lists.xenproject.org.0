Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50508C55830
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 04:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160543.1488673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpt-0004lT-JF; Thu, 13 Nov 2025 03:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160543.1488673; Thu, 13 Nov 2025 03:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpt-0004iT-FU; Thu, 13 Nov 2025 03:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1160543;
 Thu, 13 Nov 2025 03:17:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWJc=5V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJNps-0003dm-Ae
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 03:17:24 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 447725bc-c03f-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 04:17:22 +0100 (CET)
Received: from BN9PR03CA0279.namprd03.prod.outlook.com (2603:10b6:408:f5::14)
 by DS4PR12MB9746.namprd12.prod.outlook.com (2603:10b6:8:2a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 03:17:13 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::51) by BN9PR03CA0279.outlook.office365.com
 (2603:10b6:408:f5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Thu,
 13 Nov 2025 03:17:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 03:17:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 12 Nov 2025 19:17:09 -0800
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
X-Inumbo-ID: 447725bc-c03f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/SFmDRRjRN05KadZFDubnECPRlNLb5yYpjDQzpdeSXXurCvtJf2tkY0vffPFJc/R+E42j7OO8zTo7PYI/GEMOrnyTFYnXwVdH81R6LjUAfyYICK8M1m1lfucfjx1bZ9fSg4dB/g+24U0Zb0P95zzTfXWQzPPBX4nzAHIz2CfjTD+GeIOuNxOqbdTucJ9LHY0fRHV0QF4MM+Qj3M/xAtseReKgC2W0AeOQy/8xi2ajIlsJaUf8FAI4ru3QATXHtQgiG3YX2+1WuMja+x+MNN62lZ3jY0t7V4F2aQwPtwlh45dQ16+7P6Tx15ECNPx8k6rlpJXG7P62MDdg9Pxd9hjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKCKALH1kF3T6qF6WwQEaecmZDHj8AqCwh32rmOdMv4=;
 b=Ayi2CwiF6t2Nn673oq+f/nTQ5aB7zKEPMB4XhLyDl3TbzP1CuyRVnasC6pBBjY10Cl4Z4JA9r1tuqnZeY/hna9X3OUYvRrMjQh23tXYMGjqpfm48lgN1VcBRJ/XOlkIOpcQq+S1YLD6aEPXWCUht7O51Jcp7pMK75hiyOiiJx1DoPkfpHPneKVPREF7ALhu14QjSRugq7forYQQfFyXWeGDkXgpzG0IiM/n4hQzgwwElx4rUQSyQMxPzPjhpNw2aZhjiAAQMr0wVlAHe4n/Qlk3vGEJdVY8TaVqtqzOgnqRZ8uuEpihzMbw8PCLVsuL+9lwgdoIiJhhZT7kYBWv3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKCKALH1kF3T6qF6WwQEaecmZDHj8AqCwh32rmOdMv4=;
 b=Z7EMWRyOzS0byWQ2d/AhuRdyq9FFDtCibLXL8YXiWPyrGhB+81PqBtaXe9ddy4HdFFC3TZdRLrP0rvwEC82A2WB+ARBKbsVFPskMtGLCPH/rLWFfgSbPlogs9MHovAriiJPBGpavAgK+tbFkvCY4Zign06O/BaWwucg1OrJf0js=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Tamas
 K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v1 7/7] xen/vm_event: consolidate CONFIG_VM_EVENT
Date: Thu, 13 Nov 2025 11:16:30 +0800
Message-ID: <20251113031630.1465599-8-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|DS4PR12MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ff8ba0-4d99-4b98-c692-08de22632405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FDcAfJp1U6Ii+fmSMHNKMXIJQQPS/IepEDdskwbvBlf9ecIn5IBoc/Zixpuy?=
 =?us-ascii?Q?Zus6/atzI3qMHX3AFjPma2ABcjSxlN9akzXNdhSBoPfXh9spZ9mRu5bXSsKh?=
 =?us-ascii?Q?yllvqBXO409WRxFhtGlRcfsWaHbvkqzVPIW5xNywYt87V6dv5IXmUk3aSKdf?=
 =?us-ascii?Q?YocLSj0GojpMES1ddiXKqwJJ+lwO2EDNFJiU2gdqhH3CmEj0Iz/zPxg0ofx5?=
 =?us-ascii?Q?avxInJPkpRcP8qaXEbYHfz/MB0C43/2tU9jcHG6xHj6e47DPFNdiZTJ6VIrN?=
 =?us-ascii?Q?hy6AttQ1+XHjt0n3u3G7LnihpMG/DfFJEJbEvnAX9cEB2FJ4reC/uyzvCV1r?=
 =?us-ascii?Q?pj/EmQZ14WnrIgA+IjpV6fgHvjJInSBzvrllEPGsmEv2Rw0iebsoiIacmV+v?=
 =?us-ascii?Q?nSdlJKtyEyoWmYY3NcG5xH/q3AbQF5xGboy1dWtQR7iEgg7sZxEDCJ7+QC6D?=
 =?us-ascii?Q?HPmxNiD7ppgUbi3zKg2coztxmrTAGQ4M8d9yDMtDf+WVE/6K1XZUgnl6Wlcd?=
 =?us-ascii?Q?Rf0MW6FNcRyPSBfpoi3ukEUcyFjoImq1V/27Hgrg+Sj0Q+eRficLx5XEwvrA?=
 =?us-ascii?Q?F3U2hN118QDtvx8n2dshCga46uqXhzt37C/4IQffUU6DEQ/kcesJ10qP/AiN?=
 =?us-ascii?Q?C1mganS6qQY8tXTHkvipAwOp95D39bMq1YH5oivXeJYRZo588C5tmQWUaggK?=
 =?us-ascii?Q?+Yq+FNe3Ls5OW0qf/ZMlsrmYUABPmQPKmN6CIReNKDR3vOMjSBi+2wz7Bg5e?=
 =?us-ascii?Q?9pCuaO5sOJ2d/1oF97LETBHQROU71OwkQNgJqkuvjvTLKtYezLNGi74vxNoy?=
 =?us-ascii?Q?RIgz3l5VYq1t+GDf0YZpYog8iS667t9GXYrVav3EXyEWgWAdDvtV98RQsWle?=
 =?us-ascii?Q?nQ6JUJ0FuHapIuRAUEgDAeahgr19+gnWz+EWBrHCEVTSUSZiSbasEquvaobr?=
 =?us-ascii?Q?E4oce8mspALlYzIdEzSh+iJ84McDyP/fzWHM4gr61Tta/15ot0vhNKfn0Low?=
 =?us-ascii?Q?PtVt6W8auywARJneck36mInLt7FdRac+ucHqxUFd3lL3JDffOINhrhz7aPjk?=
 =?us-ascii?Q?BClPZNtscT9zhTD+aFu1vNfBSAKQXeoaAcsvvGsOyeTKz19CWWZHhRasUaT5?=
 =?us-ascii?Q?QdSS86UrbyiGU/b4AXtGCdKlRjQVikURNY5qD+CbzIo0hwF+mCvoD21gpXSp?=
 =?us-ascii?Q?4Y5Wmo8gEYMriRrCuM0Bh8PcEmcQgHQWLy8fsfYLEvIccw2VJhEn5N36xSS+?=
 =?us-ascii?Q?FwzQ5/uP2ce2ULOxk5iSAae+S6VAhtf7ZiBTdKFCq0TRJZ/oI2uCDKp1jwnj?=
 =?us-ascii?Q?f+HZ9bPxYSt6/h5T7DO1PkXy5sm+FFna17iOsDEjnT6wYC68AIi+O884Qw2N?=
 =?us-ascii?Q?RO0ApadnRrHY+n1R3D5pkNz1Pbbs63zQmS1Soy+oMaDMD/awlDIHwZdpvcuq?=
 =?us-ascii?Q?ptKYbuSopcGGwkAKr8JIY91xCwYI6d9rZpoVHjqylPh0hHxkRdXe7BSOwpsF?=
 =?us-ascii?Q?hydLXFBGKVlPfBlBUew+VsfttC6zkAX8wWlV0CgqdbwdkAQvGp9RX8Jc5J23?=
 =?us-ascii?Q?zoxFjXlmsDmOX+NpA/k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 03:17:13.4226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ff8ba0-4d99-4b98-c692-08de22632405
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9746

File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.

Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and
make VM_EVENT=y on default only on x86 to retain the same.

The following functions are developed on the basis of vm event framework, or
only invoked by vm_event.c, so they all shall be wrapped with CONFIG_VM_EVENT
(otherwise they will become unreachable and
violate Misra rule 2.1 when VM_EVENT=n):
- hvm_toggle_singlestep
- hvm_fast_singlestep
- hvm_emulate_one_vm_event
    - hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
And Function vm_event_check_ring() needs stub to pass compilation when
VM_EVENT=n.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- split out XSM changes
- remove unnecessary stubs
- move "struct p2m_domain" declaration ahead of the #ifdef
---
v2 -> v3:
- move .enable_msr_interception and .set_descriptor_access_exiting together
- with the introduction of "vm_event_is_enabled()", all hvm_monitor_xxx()
stubs are no longer needed
- change to use in-place stubs in do_altp2m_op()
- no need to add stub for monitor_traps(), __vm_event_claim_slot(),
vm_event_put_request() and vm_event_vcpu_pause()
- remove MEM_ACCESS_ALWAYS_ON
- return default p2m_access_rwx for xenmem_access_to_p2m_access() when
VM_EVENT=n
- add wrapping for hvm_emulate_one_vm_event/
hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
---
 xen/arch/x86/Makefile      |  2 +-
 xen/arch/x86/hvm/Kconfig   |  1 -
 xen/arch/x86/hvm/Makefile  |  2 +-
 xen/arch/x86/hvm/emulate.c | 58 ++++++++++++++++++++------------------
 xen/arch/x86/hvm/hvm.c     |  2 ++
 xen/common/Kconfig         |  7 ++---
 xen/include/xen/vm_event.h |  7 +++++
 7 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 407571c510..f71ca9f18b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -75,7 +75,7 @@ obj-y += usercopy.o
 obj-y += x86_emulate.o
 obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index f10a2b3744..ea957363a9 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -4,7 +4,6 @@ menuconfig HVM
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
-	select MEM_ACCESS_ALWAYS_ON
 	help
 	  Interfaces to support HVM domains.  HVM domains require hardware
 	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 50e0b6e63b..952db00dd7 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -26,7 +26,7 @@ obj-y += save.o
 obj-y += stdvga.o
 obj-y += vioapic.o
 obj-y += vlapic.o
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += vmsi.o
 obj-y += vpic.o
 obj-y += vpt.o
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index fe75b0516d..d56ef02baf 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1615,6 +1615,7 @@ static int cf_check hvmemul_blk(
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 static int cf_check hvmemul_write_discard(
     enum x86_segment seg,
     unsigned long offset,
@@ -1717,6 +1718,7 @@ static int cf_check hvmemul_cache_op_discard(
 {
     return X86EMUL_OKAY;
 }
+#endif /* CONFIG_VM_EVENT */
 
 static int cf_check hvmemul_cmpxchg(
     enum x86_segment seg,
@@ -2750,33 +2752,6 @@ static const struct x86_emulate_ops hvm_emulate_ops = {
     .vmfunc        = hvmemul_vmfunc,
 };
 
-static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
-    .read          = hvmemul_read,
-    .insn_fetch    = hvmemul_insn_fetch,
-    .write         = hvmemul_write_discard,
-    .cmpxchg       = hvmemul_cmpxchg_discard,
-    .rep_ins       = hvmemul_rep_ins_discard,
-    .rep_outs      = hvmemul_rep_outs_discard,
-    .rep_movs      = hvmemul_rep_movs_discard,
-    .rep_stos      = hvmemul_rep_stos_discard,
-    .read_segment  = hvmemul_read_segment,
-    .write_segment = hvmemul_write_segment,
-    .read_io       = hvmemul_read_io_discard,
-    .write_io      = hvmemul_write_io_discard,
-    .read_cr       = hvmemul_read_cr,
-    .write_cr      = hvmemul_write_cr,
-    .read_xcr      = hvmemul_read_xcr,
-    .write_xcr     = hvmemul_write_xcr,
-    .read_msr      = hvmemul_read_msr,
-    .write_msr     = hvmemul_write_msr_discard,
-    .cache_op      = hvmemul_cache_op_discard,
-    .tlb_op        = hvmemul_tlb_op,
-    .cpuid         = x86emul_cpuid,
-    .get_fpu       = hvmemul_get_fpu,
-    .put_fpu       = hvmemul_put_fpu,
-    .vmfunc        = hvmemul_vmfunc,
-};
-
 /*
  * Note that passing VIO_no_completion into this function serves as kind
  * of (but not fully) an "auto select completion" indicator.  When there's
@@ -2887,6 +2862,34 @@ int hvm_emulate_one(
     return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, completion);
 }
 
+#ifdef CONFIG_VM_EVENT
+static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
+    .read          = hvmemul_read,
+    .insn_fetch    = hvmemul_insn_fetch,
+    .write         = hvmemul_write_discard,
+    .cmpxchg       = hvmemul_cmpxchg_discard,
+    .rep_ins       = hvmemul_rep_ins_discard,
+    .rep_outs      = hvmemul_rep_outs_discard,
+    .rep_movs      = hvmemul_rep_movs_discard,
+    .rep_stos      = hvmemul_rep_stos_discard,
+    .read_segment  = hvmemul_read_segment,
+    .write_segment = hvmemul_write_segment,
+    .read_io       = hvmemul_read_io_discard,
+    .write_io      = hvmemul_write_io_discard,
+    .read_cr       = hvmemul_read_cr,
+    .write_cr      = hvmemul_write_cr,
+    .read_xcr      = hvmemul_read_xcr,
+    .write_xcr     = hvmemul_write_xcr,
+    .read_msr      = hvmemul_read_msr,
+    .write_msr     = hvmemul_write_msr_discard,
+    .cache_op      = hvmemul_cache_op_discard,
+    .tlb_op        = hvmemul_tlb_op,
+    .cpuid         = x86emul_cpuid,
+    .get_fpu       = hvmemul_get_fpu,
+    .put_fpu       = hvmemul_put_fpu,
+    .vmfunc        = hvmemul_vmfunc,
+};
+
 void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     unsigned int errcode)
 {
@@ -2949,6 +2952,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
 
     hvm_emulate_writeback(&ctx);
 }
+#endif /* CONFIG_VM_EVENT */
 
 void hvm_emulate_init_once(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c3417b0593..196de2db67 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5297,6 +5297,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
 {
     ASSERT(atomic_read(&v->pause_count));
@@ -5323,6 +5324,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     v->arch.hvm.fast_single_step.p2midx = p2midx;
 }
 #endif
+#endif /* CONFIG_VM_EVENT */
 
 /*
  * Segment caches in VMCB/VMCS are inconsistent about which bits are checked,
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 53f681bbb2..0070fe42a6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -170,13 +170,10 @@ config HAS_VMAP
 config LIBFDT
 	bool
 
-config MEM_ACCESS_ALWAYS_ON
-	bool
-
 config VM_EVENT
-	def_bool MEM_ACCESS_ALWAYS_ON
-	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
+	bool "Memory Access and VM events"
 	depends on HVM
+	default X86
 	help
 
 	  Framework to configure memory access types for guests and receive
diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
index 27d0c74216..1b76ce632e 100644
--- a/xen/include/xen/vm_event.h
+++ b/xen/include/xen/vm_event.h
@@ -51,7 +51,14 @@ struct vm_event_domain
 };
 
 /* Returns whether a ring has been set up */
+#ifdef CONFIG_VM_EVENT
 bool vm_event_check_ring(struct vm_event_domain *ved);
+#else
+static inline bool vm_event_check_ring(struct vm_event_domain *ved)
+{
+    return false;
+}
+#endif /* CONFIG_VM_EVENT */
 
 /* Returns 0 on success, -ENOSYS if there is no ring, -EBUSY if there is no
  * available space and the caller is a foreign domain. If the guest itself
-- 
2.34.1


