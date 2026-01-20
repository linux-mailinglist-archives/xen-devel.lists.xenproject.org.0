Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EFDD3C434
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208564.1520729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8RI-0006oa-Cd; Tue, 20 Jan 2026 09:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208564.1520729; Tue, 20 Jan 2026 09:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8RI-0006mK-9E; Tue, 20 Jan 2026 09:54:20 +0000
Received: by outflank-mailman (input) for mailman id 1208564;
 Tue, 20 Jan 2026 09:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8RG-0006Yj-Bu
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:54:18 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb100f66-f5e5-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 10:54:16 +0100 (CET)
Received: from PH8PR02CA0033.namprd02.prod.outlook.com (2603:10b6:510:2da::6)
 by DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:54:12 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:510:2da:cafe::67) by PH8PR02CA0033.outlook.office365.com
 (2603:10b6:510:2da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 09:54:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Tue, 20 Jan 2026 09:54:11 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:54:07 -0600
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
X-Inumbo-ID: fb100f66-f5e5-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lB4WXlTfdqboyj9scm3g3IJxXEycgB1KFpRUQxcXYxAFcF57XBUrA3bWGKOuG4nYqjcIiyVSVtFVSFZev4X80C2W8In9OMinHdGmj1UskGkBcgdh0Bh46IywO2nUFk7QEvVg9gNx9d1/TySyFFdQeMEZ4Hkk72wo237+pKtvPybBU8cQVFzo3uvVO+cuKwaguefXTarBtoHzi2yY6MvQZZfiKbJEWmk2pDqbeGx6pM+5CSBvEVQYj6Os0qpZEQR3NrY0u4wZdbSOVKTh1oLBz42xi15xUVgC7koMiEgehhqPM+Z8wo9dQROV0RRVN2Y/7aOusg/P6jGWd4E73ugl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALJ37co92itax4shhvmhJjbaEOS6iiqt/fVSHH2YXWw=;
 b=Nuo4iIUjrgfNVGJYkQRi2h9q/pPyisVqEvfGKlJ8XF6Lmm0/LMWUhh6TIHpF4c0YJz754Fh8UB6k9wuSZsButjK/Bw6ZM2yhMWKqpivc0bDMu9ovAFRn8CafZoorbsTk+nRzVydGAGCb5CVv4VHtk9YsexOT5zO8acDCy7GCVM6p+Czbi4jm7ueyb+Hzh9h0AsHM+l92VCbUVxhgeWMLOruQiVTKu1KHLRin4qnxMEgxoJgqMIrh11g6AR3SwUWLdO076mvk0mX2o5auMqpYqxW6egv3cfRMfRhgGL9/YfAFWmmb5qYFuIxzPDpox9ebl5NaQ979sbRFmkfo0LJlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALJ37co92itax4shhvmhJjbaEOS6iiqt/fVSHH2YXWw=;
 b=1iM0rJBJ24pyCfTJb1bM56R5nGcZcXMF2MRVkjWt4rfpJOZKtL/aFXaUquf+Y+PPdKcU/vZoPhwcHsCG1LcZapLz5wTHasOMM2pboIZNSKp3FwNVLYZITKyV2FIOErb/tEAPrnwxKV90Vv6mTgeHh3TKsVMyOfujPPvAD1hiy2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] x86/svm: Add infrastructure for Bus Lock Threshold
Date: Tue, 20 Jan 2026 10:53:49 +0100
Message-ID: <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|DM4PR12MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e07b17-52b2-466b-16f6-08de5809dcc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SKjPp0Z3nLLemRmP+Tf3pepXN/XbGlIvxrNDP2FpcPpeUEF73DYgI5BznMdH?=
 =?us-ascii?Q?2W+w+hANbR8qwwCwIrf9JJgRgoh4eRWkXyTpNquKBuIVe7vWFCnQp5x1garG?=
 =?us-ascii?Q?HJMPrxaTZWYt16sQTeY8JNF90tGqqcCHBNb3xoyDNhjl0PzXZXJ+EAw4abrO?=
 =?us-ascii?Q?5QhxWbx3AxBB/K5XB6mX4uSfLXbUUQMf/8ZVeXMBSm5uf2Fr1XeDB5fIjr3O?=
 =?us-ascii?Q?ddsKLMjwTC5K6phq9oq06fyXDBsrqYWWZhpDZOGVsT2LPZ1weMhxu2+t1miU?=
 =?us-ascii?Q?k/f7fdkhA82V+yzL8RTkas+fHpfYLw1X75bwGAY89tm4t02k4nLxjhU5zCb0?=
 =?us-ascii?Q?6CNtu99MJzqs7gbrYk/dIbydmWC5AuSaPIedDKRqP7F9tkBLwuFOASK2WVT8?=
 =?us-ascii?Q?uWE+tp5YCfUpYBJ7Y5jya+yQQUNW7I1YXYvRNKIFN6+xKtqLTcrj6fEI4oPC?=
 =?us-ascii?Q?Gjrl9mTULICZ1XOZXOtg8WtSC+MQwhNtHAeFwGxHskyyZNx7J4L4DeVhs5WM?=
 =?us-ascii?Q?0wwLs2S9RJhERlo1PpNISER9NiTMOeQQqWIsFK1WnHqOjVUTupb2DnprMgmi?=
 =?us-ascii?Q?yhCJ9Q3BJKdHLHtIap4NK9s9UxaXutLUIfK8Ahb5/JZbo4zYB5ab5Im3bH+b?=
 =?us-ascii?Q?AB52foblad8f1gGPrIf+dz3QoU7pq5iLQtrMLlgrxSNaN15u2ITQ3ul//0a7?=
 =?us-ascii?Q?zaULFyPC43rspaOGUIRpwDJbKmAifXz9GzLxNoxMonJM2MoWoA6TwQjdO3cK?=
 =?us-ascii?Q?dcg7k/QBYS1b37VW869WHNCDJoJrLFqC2g3GZSBfC9XbcMdGJLGvFFsOOmJm?=
 =?us-ascii?Q?T4FWCfOlTP7Np5/COQvDfpmmctpxo5KTubEi8oaSpFTgdQsbz61Uy5lMdssY?=
 =?us-ascii?Q?C5HrgDmHq2oGyNuixHkR2xqX8SmLRZiEvafGnI3xSMJMsjnD8ma9tMxTneZo?=
 =?us-ascii?Q?Sqkvdgw4ULqIAp0EAweir3/zrPUo20+l3/7ecFe1Wotg/78GjkPgOhZP7hlq?=
 =?us-ascii?Q?PAPLB7UjYpCB82Osbol+H+qYs2HtLKeFMB0qxeMMRlTOrgYCYDyUI/3jrRwD?=
 =?us-ascii?Q?ZZA4mkdOplsJzLxtWhkXyEL/C/SnjtlzeC+UJq5/0CZCdEpyIci5eiN6+wkz?=
 =?us-ascii?Q?P9KkcLfSa3I4RzGf87HDTlXaR5fGSjW4xQPciccbZqt5GlKiZ7R5xo4TxvEN?=
 =?us-ascii?Q?LV4dpH1OGEDfyHyEltuia3ottvvwRxkjwgggKPqZJmELK+JswLnG7HoaSFvY?=
 =?us-ascii?Q?tfOckBg2cJMKQVguyLLMyRGYeX0tNyYsQrkC5MFsyGh/o3q5J+nstFnxHDKC?=
 =?us-ascii?Q?tNorT5/nStYkrl3OPchZWKkCzlg9PIXlpXPttK37IT76t2acOhg2XDSbnhus?=
 =?us-ascii?Q?WWrVp9p4yCfRWfxSWwOt5loEhN+A7GNARPhpwCLvoWfYbL4Io7BGrIAb8RWr?=
 =?us-ascii?Q?IJd2kARC5/videSLG5MrY4cSq9DrkSQm1qF8jXzqS8V9e8bDusNIrxpY9TOO?=
 =?us-ascii?Q?bLNAa8oqSh94MyLbgCVK5iQEcgj9J8gkqrc7Sx3MUIq5Ebo9a92ki6sVHVDp?=
 =?us-ascii?Q?4/skGrLUQrd+5ib2U1lydB0ucTiwUC1hMHCi+KOh6OH4MhQqL8w/Q5NS5tzW?=
 =?us-ascii?Q?J6Qxm/F5nd0eiyxzl2jJuCg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:54:11.4502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e07b17-52b2-466b-16f6-08de5809dcc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890

Add missing scaffolding to enable BusLock Threshold. That is:

  * Add general_intercepts_3.
  * Add missing VMEXIT
  * Adjust NPF perf counter base to immediately after the buslock counter

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/svm/svm.c            |  1 +
 xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
 xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
 xen/arch/x86/include/asm/perfc_defn.h |  2 +-
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5d23603fc1..9748df87d8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_tsc_ratio, "TSC Rate MSR");
     P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
     P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
+    P(cpu_has_bus_lock_thresh, "BusLock-Intercept Filter");
 #undef P
 
     if ( !printed )
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index ba554a9644..85e194f247 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -65,6 +65,11 @@ enum GenericIntercept2bits
     GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
 };
 
+/* general 2 intercepts */
+enum GenericIntercept3bits
+{
+    GENERAL3_INTERCEPT_BUS_LOCK_THRESH = 1 << 5,
+};
 
 /* control register intercepts */
 enum CRInterceptBits
@@ -289,6 +294,7 @@ enum VMEXIT_EXITCODE
     VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
     VMEXIT_XSETBV           = 141, /* 0x8d */
     VMEXIT_RDPRU            = 142, /* 0x8e */
+    VMEXIT_BUSLOCK          = 165, /* 0xa5 */
     /* Remember to also update VMEXIT_NPF_PERFC! */
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
     /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
@@ -405,7 +411,8 @@ struct vmcb_struct {
     u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
     u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
     u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
-    u32 res01[10];
+    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
+    u32 res01[9];
     u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
     u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
     u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
@@ -489,7 +496,10 @@ struct vmcb_struct {
     u64 nextrip;                /* offset 0xC8 */
     u8  guest_ins_len;          /* offset 0xD0 */
     u8  guest_ins[15];          /* offset 0xD1 */
-    u64 res10a[100];            /* offset 0xE0 pad to save area */
+    u64 res10a[8];              /* offset 0xE0 */
+    u16 bus_lock_thresh;        /* offset 0x120 */
+    u16 res10b[3];              /* offset 0x122 */
+    u64 res10c[91];             /* offset 0x128 pad to save area */
 
     union {
         struct segment_register sreg[6];
@@ -583,6 +593,7 @@ VMCB_ACCESSORS(dr_intercepts, intercepts)
 VMCB_ACCESSORS(exception_intercepts, intercepts)
 VMCB_ACCESSORS(general1_intercepts, intercepts)
 VMCB_ACCESSORS(general2_intercepts, intercepts)
+VMCB_ACCESSORS(general3_intercepts, intercepts)
 VMCB_ACCESSORS(pause_filter_count, intercepts)
 VMCB_ACCESSORS(pause_filter_thresh, intercepts)
 VMCB_ACCESSORS(tsc_offset, intercepts)
diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
index a6d7e4aed3..14fe4abf96 100644
--- a/xen/arch/x86/include/asm/hvm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm.h
@@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
+#define SVM_FEATURE_BUS_LOCK_THRESH 29 /* Bus Lock Threshold */
 
 static inline bool cpu_has_svm_feature(unsigned int feat)
 {
@@ -56,6 +57,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
+#define cpu_has_bus_lock_thresh cpu_has_svm_feature(SVM_FEATURE_BUS_LOCK_THRESH)
 
 #define MSR_INTERCEPT_NONE    0
 #define MSR_INTERCEPT_READ    1
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index d6127cb91e..ac7439b992 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -7,7 +7,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 #ifdef CONFIG_HVM
 
 #define VMX_PERF_EXIT_REASON_SIZE 76
-#define VMEXIT_NPF_PERFC 143
+#define VMEXIT_NPF_PERFC 166
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
                   MAX(VMX_PERF_EXIT_REASON_SIZE, SVM_PERF_EXIT_REASON_SIZE))
-- 
2.43.0


