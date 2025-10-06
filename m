Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C8EBBDB06
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 12:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138043.1473839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5iSI-0002VQ-Iw; Mon, 06 Oct 2025 10:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138043.1473839; Mon, 06 Oct 2025 10:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5iSI-0002MW-DQ; Mon, 06 Oct 2025 10:28:34 +0000
Received: by outflank-mailman (input) for mailman id 1138043;
 Mon, 06 Oct 2025 10:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5iSH-00025a-7T
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 10:28:33 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33543ef6-a29f-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 12:28:29 +0200 (CEST)
Received: from SJ0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:33a::6)
 by CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 10:28:19 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::25) by SJ0PR03CA0001.outlook.office365.com
 (2603:10b6:a03:33a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 10:28:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 10:28:18 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 03:28:16 -0700
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
X-Inumbo-ID: 33543ef6-a29f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmqMdHAebE65e2OZo9Mp0GK4Wp8qf63mIsVuXqvigxjnHsGOdKo9Xyqf+H0zgk4KPvGfGCRVZGCTH2vNBf55su9Yl66fCmfqHrHr+ttmn33RH/iarXFoACyVAtGbtf5BsUAijf5RWJWLMeuhS5tjYfdYevlIjCXC6ZSU6PLSbQDBtUMPeQN+bJcuedomh4nOfJXkqr97xpVGp+taIevXD3ytwRWLF7DAIZ9qkNF1xCmvTcIXtxCCOnhHn51Dvp3IInjqxOsKinJrc5Y2W4jPbiikGaECNoPxb+jttnaLvB3m+qPzFnTrzpjbNcbvlFTj7+0se4o7XaBAKxLi8h8puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSMzU7bE9Ybv33ngMzEle9ovbrOIGUbmOQRWhev2j/E=;
 b=W24zH/ouXqpeCu1L2X1YyWtXZFnsnq2i5T7v6EyidsPXNUVkNgx6lT3kKU9ogKFn8hqDyvuY3nE+pSKPkBY1hLqYASmrxSNiqrqLw6uEVyddb4BJX7XVDC+fVqyCmY5KUUTf6hXYZjhuwa/n3q59RKdNcsxZD4gQt496cpdlB9pZ1IKiaLfbEDAMj/jQpmYbDqJpPX+lJoDoTN2nEkR/GZecj9Ixg1UVccDvR6+/Gvlu5MscsHPP56MORoDc4d0o/xGZIjjU2qFB6LqoLAdWmj0vmpOT2bkPV/6sHKZWuNgIeodKnS0R77wmSRxps7CUt6fPvj6+GyilHEao+HRQCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSMzU7bE9Ybv33ngMzEle9ovbrOIGUbmOQRWhev2j/E=;
 b=zPuky1Ry+OIwhDk/sKkdtt0xsUXZq6LVoafqB2m1luYQ9JQehhXlNGXM/DK4eXNaU64Kb2Yc8t+mIlgOLxLkdvP8mNCJ4zjLNAaSeisuKL2wkRHrwv/Sc3HOT4crmkPgUdlqRv3oOEIWn3kgK4cteW8bjSV5Wkd8Jjw5+qqwBls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [XTF PATCH v3 2/3] x86: Allow exiting QEMU in TCG/QEMU
Date: Mon, 6 Oct 2025 12:25:57 +0200
Message-ID: <20251006102743.3907-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006102743.3907-1-alejandro.garciavallejo@amd.com>
References: <20251006102743.3907-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|CY8PR12MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf96bea-961d-4947-ce96-08de04c3112b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lPVSfregYQdKMjoxBTBXZcFvwxBfjxFiaP1yhXu2wdes/1YRUswAwo71mG15?=
 =?us-ascii?Q?FVtPKXEbxDUTKnDgYEkfF4DEIEeI++ADH+MmNmjkSxBSTm09OXAELYA6dceY?=
 =?us-ascii?Q?mHEvqYppMWYML3BOvMtts1VMR1tekpPYCJW4pwx9m/p5Y06JUho2dBG6thP5?=
 =?us-ascii?Q?pn2OiNB9wd5Zl82lG2WAw8ThOqvdcgU0AlcKQOilK0n3UeshFciSLSWPuEJG?=
 =?us-ascii?Q?v2sj6JEli35/KVH70+XfSSHWJB+L1KeRTVVCUREiURllMlEVzCCrocGJPQoJ?=
 =?us-ascii?Q?Xzqk8qbV11D5I/Wg3qAG/zHPgv2gTgVK/y3XVlAlwKLREPtwfyVI8gcnHy8+?=
 =?us-ascii?Q?cSgVh0b8XuiQURhDkxIQYI1sDWSCLlDBTn5bu3ZN2xGkqpsrcMeZs//3ADmF?=
 =?us-ascii?Q?EiR7m6NmBQzRsyZzIAYoG5/xT51JiUjotjNhaYg09ObzUlCsscnXSC453eMh?=
 =?us-ascii?Q?OjoXuVFbL+wZT/ppncr0k3oGEFsP47/PLwweNgpsa8JM47GWK3u9xWtrXVmp?=
 =?us-ascii?Q?pDjbIu4cic62YISbPHo/hHsG/cyv3cVBN119S0svFQ6LSvEQ7ljLLWGGvqcs?=
 =?us-ascii?Q?GpEyd6RSDYLAuEVw2dWm5eFAWfp5CAl7WsI0zd1B5cNjDCUbjYPpSgTp3s+E?=
 =?us-ascii?Q?uT97ROty1KOcIl98NrtGa/pSZm89TijOlKDQqjIwbBbxlEOwoqQBaNKpyxrC?=
 =?us-ascii?Q?8MhENpF0oZw8kcb9wJokejbBmzUpe27EjudR1bTsJPXEHhzJjdS9wu8ff7IS?=
 =?us-ascii?Q?eBP38EADxPM+78c+6hCmZ7qQk0cz+tpPbLwbF/OgL0Z27UvYySH5m3usEiDT?=
 =?us-ascii?Q?lcuaxPjGc9og/2M3RsiCggy7X54TOX9AhTnisnKNkntcdUKQNjHxyoaN1jLS?=
 =?us-ascii?Q?2zafjPmuyYxNoEU9MCN6sVJOCI5Iwz5yxePRtt75FeD1TQ7CX66EYrPPI6A7?=
 =?us-ascii?Q?29uwh9hGmosCIf7zexWZhjJxn3Lx1ncnWJZISDX7Mi0zS1Y7eIDqLWONKqoO?=
 =?us-ascii?Q?pj8XI3WAsKmiLgktvTUY359a0jf+zIsZ+2XDNhPW++b4CYokqRpT6D0WHrAj?=
 =?us-ascii?Q?5dnZ56s9d1Q31QcZFds61W3/BDBBDJ+HFtNGFlMPQqWvIGCBTVmX2VTd14Kq?=
 =?us-ascii?Q?KZpBTuU/E7/WKrgfXDkcCblcaAlFVUFKrOrMc4RJa5JntWN1KmaaHTCaH6cu?=
 =?us-ascii?Q?3CRIc3+C86BpuGC/mU2T5IuTgoB2KdLD5prq8qq6+psCJil/CfxnZF2LEPOf?=
 =?us-ascii?Q?ZYx5+rd+5dXGVThz6haTYGYTeAYZS+JRKK1MQ7dJ9pIAoFKePdyIMTJLKQe6?=
 =?us-ascii?Q?wsNg1K4GlQJ5PDsNx4w5/m5fRqNnQp5TnZadRxFbsvZHVtql7Dr7yuhZa4uH?=
 =?us-ascii?Q?X3j4SXIE4hWKOt2+srXDAOVuFptUPaob9av2TjRj2hb2OU1Cx7u1rnBpnsZC?=
 =?us-ascii?Q?kQvl3DejQe0Wa2ConBuETIh7tV+5cijPK6o+5cXm01YrvLexkWny6ZYn2sb7?=
 =?us-ascii?Q?30KPbD4DWBe/PEyFsdWomhsJW32w2S/97lSZs9Xs149J+eUMO3l7iI0No/lT?=
 =?us-ascii?Q?5ct9M/dGhy8PQWqSkLI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 10:28:18.5067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf96bea-961d-4947-ce96-08de04c3112b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434

If QEMU has a debug isa-debug-exit device, we can simply write to it
to exit rather than spinning after a failed hypercall.

There's nothing to signal its existence, so it's a best-effort write
after a shutdown attempt via hypercall.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v3:
  * Moved arch_shutdown() from HVM/PV folders to arch/x86/traps.c
    There's nothing terribly specific about it.
  * Gated calling hypercall_shutdown() on cpu_has_xen being set
---
 arch/x86/traps.c        | 15 +++++++++++++++
 common/lib.c            |  2 +-
 common/report.c         |  8 +++++---
 include/xtf/framework.h |  3 +++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/x86/traps.c b/arch/x86/traps.c
index 1f82752..b530719 100644
--- a/arch/x86/traps.c
+++ b/arch/x86/traps.c
@@ -80,6 +80,21 @@ void __weak do_evtchn(struct cpu_regs *regs)
     panic("Unhandled evtchn upcall\n");
 }
 
+void arch_shutdown(unsigned int reason)
+{
+    if ( cpu_has_xen )
+        hypercall_shutdown(reason);
+
+    /*
+     * Not running under Xen. Attempt exit via the QEMU ISA debug exit device on
+     * its default port.
+     *
+     * QEMU's rc is (reason << 1) | 1, if "-device isa-debug-exit" is set.
+     */
+    if ( IS_DEFINED(CONFIG_HVM) )
+        outb(reason, 0x501);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/common/lib.c b/common/lib.c
index 7f1813f..f4de22e 100644
--- a/common/lib.c
+++ b/common/lib.c
@@ -25,7 +25,7 @@ void __noreturn panic(const char *fmt, ...)
 
     printk("******************************\n");
 
-    hypercall_shutdown(SHUTDOWN_crash);
+    arch_shutdown(SHUTDOWN_crash);
     arch_crash_hard();
 }
 
diff --git a/common/report.c b/common/report.c
index ffdf098..158876e 100644
--- a/common/report.c
+++ b/common/report.c
@@ -1,6 +1,8 @@
+#include <xtf/framework.h>
 #include <xtf/lib.h>
 #include <xtf/report.h>
-#include <xtf/hypercall.h>
+
+#include <xen/sched.h>
 
 enum test_status {
     STATUS_RUNNING, /**< Test not yet completed.       */
@@ -124,8 +126,8 @@ bool xtf_status_reported(void)
 void xtf_exit(void)
 {
     xtf_report_status();
-    hypercall_shutdown(SHUTDOWN_poweroff);
-    panic("xtf_exit(): hypercall_shutdown(SHUTDOWN_poweroff) returned\n");
+    arch_shutdown(SHUTDOWN_poweroff);
+    panic("xtf_exit(): arch_shutdown(SHUTDOWN_poweroff) returned\n");
 }
 
 /*
diff --git a/include/xtf/framework.h b/include/xtf/framework.h
index 95de195..e852882 100644
--- a/include/xtf/framework.h
+++ b/include/xtf/framework.h
@@ -16,6 +16,9 @@ void arch_setup(void);
 /* Set up test-specific configuration. */
 void test_setup(void);
 
+/* Stop the machine. See SHUTDOWN_poweroff et al for reasons */
+void arch_shutdown(unsigned int reason);
+
 /*
  * In the case that normal shutdown actions have failed, contain execution as
  * best as possible.
-- 
2.43.0


