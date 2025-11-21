Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF26C781F5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 10:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168522.1494519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNKe-0003RR-G5; Fri, 21 Nov 2025 09:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168522.1494519; Fri, 21 Nov 2025 09:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNKe-0003Q0-DC; Fri, 21 Nov 2025 09:21:32 +0000
Received: by outflank-mailman (input) for mailman id 1168522;
 Fri, 21 Nov 2025 09:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMNGE-0007sJ-8J
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 09:16:58 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d380614a-c6ba-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 10:16:57 +0100 (CET)
Received: from DSZP220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::13) by
 CH1PR12MB9672.namprd12.prod.outlook.com (2603:10b6:610:2b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 09:16:46 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:280:cafe::5e) by DSZP220CA0003.outlook.office365.com
 (2603:10b6:5:280::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 09:16:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 09:16:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 01:16:42 -0800
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
X-Inumbo-ID: d380614a-c6ba-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ird+R+Bsx6aaZugbtaoWFwnij4OGf/gVqFGUZIlziiHH6yuwoj27kWmSAgjqRtVSKHwjTUhGBSD3hOMsPloaytfLVPeB/JZyVOJOct/vZu3PSVzO8GrzGXo2tNOcWBZbKPQwQJrm89EhU8KYySL0IBLrnFD987JdQB2bIaWg1ncXeKrA/sQFXgdKu1AVM79dE3hKmc0533bf3+0H4e7miJBpVPcMDLCNalQq5pCLC58q/typcKAy8XnG9K2mv4OqddQAEpLOOEuPD70W9tmqaFPCffBAhsYmjioeO/Xhwptp5cWhtszw4oOP9plU2cwy/9M8Rq0oRaCmi6lt1LtW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpxyTqyVm+vodOKO0BCKTxk0VoM8dxl5zHnLolJeEss=;
 b=Otx8Fjc5+gb6/ZsETXxtp9xUAvgmJ25hav8F9FTopG2v26Zl/Ka/P96KMjCfKfURhqh5IvZqZ82vQSqbOA4P5Z9P+fEHkQj3ZIq/X5HxIbGnDcZArGUNHu8VKm91NUNyiJl3nVc+a2yZAvH1GBDs43jXlCg/a0Uz0fALQk8Mxq1/P4gE6npr0epIihYRY11d5eW7aqWFzqOk6wCy0KJttsdamerzbt9EKWRdOLFHZVqEeC9MGrfENiGifwO6pWAoJIElqj8ivdei8/Ikf714EESD+jPzD/eBzzNokh/UFIVkALAd7WVvjjJ4/ZmpoZ63wcyS4DC8csWqmSo2AI1HQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpxyTqyVm+vodOKO0BCKTxk0VoM8dxl5zHnLolJeEss=;
 b=k9gJvJH23iO/0+TsDhWyMqA4qkx5+XdFuITutrlDAEhwawI0asZEFnsOYIpeHKMisTdWCE1aO/xfEVF31eC88p3yUq00d/rueBDoaQbxxwiS4sr1MxTKEfwjZ7/KfzVodCE7/dOn1Sa1D+BtvGmwMpp0ZfFaOgiYqQiA4TV6N1Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 7/7] xen/vm_event: consolidate CONFIG_VM_EVENT
Date: Fri, 21 Nov 2025 17:15:54 +0800
Message-ID: <20251121091554.1003315-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121091554.1003315-1-Penny.Zheng@amd.com>
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|CH1PR12MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb0d3f0-e3f8-4bbd-2a67-08de28deb1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eGa8vqpUX6Q8HggOX/9RnI8B5SIzNcX1ryeliezTvT+zc7c0kz1CLNWviw56?=
 =?us-ascii?Q?86mVLgWcgLk6iz1nTLXmu+cbqiEmhzJUwA55KiYQ25gX6iM8bzMvRw+qYPXG?=
 =?us-ascii?Q?8/dgNjokZ1n9gG8SIFuAp5JXQX/Uj6Ys4pKq0yyLKHbOCWXmabPBR2+Sx25f?=
 =?us-ascii?Q?djy1eI3De/nQmzj+NNe/IGAnGnjdq8AATHlCrbqnIPbW/f+INwVuwZVvTSLb?=
 =?us-ascii?Q?lDK8R6ITSdPTKqvbbbCVw5Yz5g9Cg9yh147i5M5ErN3hGNz803UcQvQEk5hj?=
 =?us-ascii?Q?rq/YARk34B9KD0XoDB0yL6YBxXMPCRhr0L/YveWb/2u/Oi7/wFlaTsS+QGHq?=
 =?us-ascii?Q?Zv8grRQniSAJx0o7ircK5fPttE224qrSXZmeAkk9s8Dy4NAMN4t30AnSIMBe?=
 =?us-ascii?Q?wPGollnG1DOY01D8MIG4+8KBEKzZ7vMLBaR28UIw/dcAk8I/dhMVQ3xYIMou?=
 =?us-ascii?Q?pap7HvjswDvswnAZaxnd9abKqpniXVn+sS7qbqNKOpX29rp2tCzMQGitz4Vd?=
 =?us-ascii?Q?reIFosqibBOn51XBQj4tPsrjHeYCDUx5A5dUYNMPjas/SUgkIc0GDbcpU8xh?=
 =?us-ascii?Q?ATZ0aWxCHsvZJ8AUIDslJSB8KOb725d51AreehTzq8S99iUjhAAEfvJLH8+Z?=
 =?us-ascii?Q?IozqklNfq/HLQvdZ22qTcY5Ijn+EshLA46W/AU99LRrS5eafyELuiT6ntUof?=
 =?us-ascii?Q?IjeDxDeASv8f3rntmxWeSCxQ8yQ3FIE7/DXQBCEHpffmX/d0NkORIPTv9oEP?=
 =?us-ascii?Q?rzyVF0hxsouTxadsUG50c/hxt32Xhte0lMjbACS7N8XBu7TvCsLzG80Ek/iN?=
 =?us-ascii?Q?5zByMJsQGIDnwlcXp73hegS7UDjNpywWUiyZxXjc1pKb1ZOxGyyzr1qe/36T?=
 =?us-ascii?Q?yjNSA10bEDtOY2FqyIkE2in9SK66V6bUHCK+ytIzGfirDapiRD+TJxB8y+O+?=
 =?us-ascii?Q?rpJEDqBbTqEdSIIpo5M7c4WG1vUfOVy+oqzWddM9fPLVkDoICTuRxt0AwyC7?=
 =?us-ascii?Q?zy2V8Xyc/7nqeKVtrZ2rJpF6QAylfjRBCjVaP1WGEUteBZhUf2m047bfO4+v?=
 =?us-ascii?Q?9Rf5N3/sPawfDtH7q4DwzXTfRCO8f1F4j/T9jre7SOLZy0fCAsw0rWdkhZVW?=
 =?us-ascii?Q?XaJkKZQyPrYdZbe6znb4OlynvL8GNmCkZuu48ptCWcVCg8l1aRF3eSzyZXYW?=
 =?us-ascii?Q?ozb1Ikt7o38IEg5lSGrV4aP2tBM3srjdRtB2k0hXmp0pxFOI0wfkRe6QvOUZ?=
 =?us-ascii?Q?rFoStDplIHPF1bsdlkpcqOTtHiJ8AvRFW9ABb8jl5UEhoD/ib1+/MhSN4Rkq?=
 =?us-ascii?Q?8FhIN+dsaCuo8ENY39pVPvWpdB8OuHTuHtem40Jmz83JLyw3Uk4dss7fBhn9?=
 =?us-ascii?Q?e8hEQEtkH5S0HVLBO2UgNvqKJ7SfInwSp+H2xjmlPdoY3+vofx3q7/lcN65v?=
 =?us-ascii?Q?f/N70EiQE+LlpaMGRcrwWp9BtTxWPKx/57C8l4LIE+qwSASzQh8tGk2jZAka?=
 =?us-ascii?Q?Hb/HyHajgt9Zsuk4YN9itg4k8xEcF1Q6U2qc7dlgPmpOFdmDvJVjvILznSZv?=
 =?us-ascii?Q?5a1V7faokeBhmm5wqsE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 09:16:46.1807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb0d3f0-e3f8-4bbd-2a67-08de28deb1b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9672

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
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
As the last commit, plz be commited either in the last, or shall be commited
together with prereq commit 55d5245f85, 2edfe59bc1, 316aac242d, 690b46c23d,
and 0bbd6cebfd
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
index c323d767e7..31859deb97 100644
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
index 8509b53585..d03f563d76 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5247,6 +5247,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
 {
     ASSERT(atomic_read(&v->pause_count));
@@ -5273,6 +5274,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     v->arch.hvm.fast_single_step.p2midx = p2midx;
 }
 #endif
+#endif /* CONFIG_VM_EVENT */
 
 /*
  * Segment caches in VMCB/VMCS are inconsistent about which bits are checked,
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 401d5046f6..218ac3d549 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -173,13 +173,10 @@ config HAS_VMAP
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


