Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D7C77C07
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168303.1494399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLt9-0006Io-6D; Fri, 21 Nov 2025 07:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168303.1494399; Fri, 21 Nov 2025 07:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLt9-0006Ei-2O; Fri, 21 Nov 2025 07:49:03 +0000
Received: by outflank-mailman (input) for mailman id 1168303;
 Fri, 21 Nov 2025 07:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMLt7-0004hA-UR
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:49:02 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89dc8752-c6ae-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 08:48:59 +0100 (CET)
Received: from SJ0PR03CA0086.namprd03.prod.outlook.com (2603:10b6:a03:331::31)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Fri, 21 Nov
 2025 07:48:53 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::7) by SJ0PR03CA0086.outlook.office365.com
 (2603:10b6:a03:331::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Fri,
 21 Nov 2025 07:48:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:48:53 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 20 Nov 2025 23:48:48 -0800
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
X-Inumbo-ID: 89dc8752-c6ae-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWkYs0UVqVu2mz/5DclA9eYy6o5G7TTfP59tXhsktvPVwnk5cXsBYD7551mnVLP9yYpznyKYZVnw3Y4T351lcQLFqT1kDN7qQtm9ZvHfD22P/8AMkjCSfFA0cNW9BxTM1jtOkOLJ6K4kPmv7sbGEryise7c54cLEOu1IowsBFASXWVdu5jqUWFmPcfDP2yWiU+wd94D5x05zCoa3QVxpb+fPqwEk5p0MnmUYxVhqxgF3gQkSPD1/EQveo53ZVwvLi5zK0x9bQNIyD30zZYKzJCD/GoOxMhFfQ8MwtbmXOJrgY1ldafUYpn1YTZcgxmvf2t3xUQxLGCjMVvJ4se9Ekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBhj9JaATXl8b6nI+SV8v93BChTELw2B1eNiGpwtWHM=;
 b=djLwRxUF3v3apFofUvslP6A3aVe/8JKc0VbQsWvvuNtKP8rhAX5qBtsMM90p1DzNyTMeXMojnGjrDw1XmqvCOL5qITK6pyd3tcUHqnx09Wj8G9FUOwolgCNK3U0Tv81X+87nx8HPO1Cv50p6bRKVMvhLTOXOJocs8lgwhxodpNSiaGvVEh7t95RlxF0KcyV9MkbawsGZ21XjxLg77OkokY9KJiD5xviFymdiyWQiSEDbPIl+g0StbCMsV8aasMBn8JDwqFshF8wa+FQAmHZcoL0yjJjVa1WZxQ63ilTr+ZHt+gEfvR4GCxOkNyFSDge5KAvDPg+zDK34kZSp6aRlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBhj9JaATXl8b6nI+SV8v93BChTELw2B1eNiGpwtWHM=;
 b=PcsQoS2a2Nb0v5567+0EYXL/z4Ti/cbe+uIE6lKnc9IppPqQaDYQqe2Aw+dlBu5qRpWBRIoz23UsFS1Kjvk/B9U+jIvjKa/LMJR/YkTyOJzrWgLiDrKkg9DQ+IuTAmf4FWhbooPdESKWnSa8CDI8UDPfFMCV1EAefsqPwoC+tAA=
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
Subject: [PATCH v2 7/7] xen/vm_event: consolidate CONFIG_VM_EVENT
Date: Fri, 21 Nov 2025 15:48:03 +0800
Message-ID: <20251121074803.312568-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121074803.312568-1-Penny.Zheng@amd.com>
References: <20251121074803.312568-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8571c2-e384-4809-a252-08de28d26ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EA5zg29ZeJkC8JlzEU4Ar5kwwdLvZmJyAJSPidrMGY9SR2c3sCezUSvZfkAK?=
 =?us-ascii?Q?Opdmjj2VnCMnvpdZVLc3O5R4bNFxVeplF8Vc/F3IE019a+Mx9/Q8joq4IAef?=
 =?us-ascii?Q?xbRk/Y7E+MvdgQkRPCDYtimD7k9LfaZzxtFVnnawC2V7UKvbNNuHRrpsro/1?=
 =?us-ascii?Q?RR+3GLYKLujUKsQBts+ELV0D5etSzTA4cQQOOH6euE2gLY6ldGFDzmXm+ZVX?=
 =?us-ascii?Q?s7A31MU6zv4/30n0HiHdXm0lAxCA+xHFv2H18KsPuLZWJAbXqx3xN9QfVVGV?=
 =?us-ascii?Q?i7251UEttMenulq94ROW9A8cVdERMWahwToo4jO5syWolDOPeTGYfIBknsQ0?=
 =?us-ascii?Q?vjqnarZacpCNgy1Tipg0WrfV6VG00YFrzXS8EFWbKvJrG1oC6Pj2Q+tio21K?=
 =?us-ascii?Q?cNcQFav7fEmg0X1pN/g5IrDaVeMQXnY5q5xoOgD5bTTdg6meerpbGlnNotoK?=
 =?us-ascii?Q?DrnAxgQFAi84fUx6ioeMmelvLcf1yjuNFMoz2d4YHJbrfrgWyHPVcFV5QvWV?=
 =?us-ascii?Q?OG3rOi8zF7VEzXjhyUmHjrpDuCVudqbycBj7r3aYY1SyIJLtWQAS+VJF96Av?=
 =?us-ascii?Q?K6pbtLJ9wo3XTmIwihhfPaSBp0XhJ+0SngShxsddsnGQJfZrwUQH1u0PcD0F?=
 =?us-ascii?Q?rNipcWxbEGQE7Yymp4bw90VehE6tGqat77vcWEWNg6L3Fz3PkFsg9z47VSFl?=
 =?us-ascii?Q?kJ/0U2jgnXn8rAhAfW3GZpyCqgZTrhS6buzFH978MOggvXb0PmKQ/pJpktab?=
 =?us-ascii?Q?jsiYphq6Svp6LHPkk+QCF+f9Uw00Mer5Tel9lp4eb8XLEGtJ067EhylunHSD?=
 =?us-ascii?Q?2J8URKTO4w43SlRbzeHJzaDRKxvK1y59XRZPlG8vXzCIIhJmrL76vXt38AkZ?=
 =?us-ascii?Q?h8jsz1ahBgeIRbM5F6vF0v6m0J6YqqyLXcTT9DHVYSBYTTiLib98BYyy+6GC?=
 =?us-ascii?Q?KJbehlFVDaEAkol/NIwkrGwvpLTE2iFTWSuAQQ33vQB1SKIFZdYK+H4SL893?=
 =?us-ascii?Q?aYM8Lv9VFvcs/IbRNrCBDZW/KE2rU/r6L+ORJON9eQYUj1fxFXfQIe4JndZz?=
 =?us-ascii?Q?fbcwz7w0jN/dwuosbs39esmxdZz/JAboY5fwhgwYDUUu5qQfo7BnBJ8gxGR1?=
 =?us-ascii?Q?Wm6W/cEYWhe4Q9wOywkB8zq7F4L5b2J5nL0vpGKvZ2cjBr6a2mnT9EQaOsYZ?=
 =?us-ascii?Q?l/8hToSm5nBvybzNtqnz76rvc99//l6dDGIybIkjwXpnpwXGVFoE9fvuNob6?=
 =?us-ascii?Q?tMc12evhY1hj7HdgHP+1NpPFfg4gp1SGzDibUXAdAR0BUmjgFbdlUndRzFs+?=
 =?us-ascii?Q?CS38UTufNwRxq9dZ89tZQfK21VPmga49REqj/+PO3NmM8suo0BAmHZYpQnSQ?=
 =?us-ascii?Q?DRx4BNNk3MvZv/op/T5ZgtU0S+f/5jcJEtt7+hOj5xN29zWdZrJeo4i1sngv?=
 =?us-ascii?Q?VrDVjClcZD1G6JrKaROas208zvBTH9a/T/mfGfjZsSBaVbQNVGSBSENaVdvp?=
 =?us-ascii?Q?4kfdXG1htWaerfwkIVUWVdceYaJa1sd7r5qIdPHFmSWIOtxwpN9OOpwyX7V7?=
 =?us-ascii?Q?iQQUnCqdOut/VqHI/aY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:48:53.0058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8571c2-e384-4809-a252-08de28d26ab0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787

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
As the last commit, plz commited either in the last, or shall be commited
together with prereq commit 6435bdf209, dcef13c65e, 648fdf2bdf, 5ca05aad31,
and 48587d9448
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
index 0103f5c6ba..77cf541e26 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5246,6 +5246,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
 {
     ASSERT(atomic_read(&v->pause_count));
@@ -5272,6 +5273,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
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


