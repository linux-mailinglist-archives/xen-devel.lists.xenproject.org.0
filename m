Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D57FD23874
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204482.1519147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfW-0008B5-5v; Thu, 15 Jan 2026 09:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204482.1519147; Thu, 15 Jan 2026 09:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfV-00085s-Vs; Thu, 15 Jan 2026 09:29:29 +0000
Received: by outflank-mailman (input) for mailman id 1204482;
 Thu, 15 Jan 2026 09:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7XDq=7U=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgJfU-0007JZ-KT
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:29:28 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af4e2ab2-f1f4-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:29:27 +0100 (CET)
Received: from CH0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:610:11a::27)
 by SJ0PR12MB8090.namprd12.prod.outlook.com (2603:10b6:a03:4ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 09:29:21 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::8b) by CH0PR03CA0337.outlook.office365.com
 (2603:10b6:610:11a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 09:29:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 09:29:21 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 15 Jan 2026 03:29:16 -0600
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
X-Inumbo-ID: af4e2ab2-f1f4-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bD7/C+UBRoYpllMLVGEYP3cN/RCtfTf38x/Gd+hXq4AQPwye0i0oBbV2mexw6eKyPK98wXllh9sqKnZZ9ttaI44W6JJRCBmKsljvI746y1c6bgkcUetuvdZwOMsXjiu5BXsexPupogv9pBLAepjuePkFLRjJ/82yUgfP3wOfLGPsX4ZEhipYNz47KxQ8haGX2CJ86eVfJSEIyASpJOcsftriFfjCBL6ADa83wdp+GZwzYcmvvXMRJrUeghZ0Z1L37+1zwU/3MUpe+6DD5t5KeHDgCyCO+8GV2iqOv1v3uJmYG4zg9vr+5DqDZo/1VQUnBSBp4beQffgVIvhXlC5vGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LALbY4dL3KCQh/g6RMK77IghwWdSjrOw31tRRJG4UsA=;
 b=JrKnDxU0KSX/ZmFk0PSJanrxpmB90dJduuYL08wG+Ayljp6ejAzAezUIa4yBpjaoc5A9XemV00/e7ZTyt/bmXXTz7RGhQiCQol5p5L6i4FIB0exbMXuVvy8PkiRLGMtilxCPM20L57472vzt1mTGT2MgKHP2ZM53B3O9Z7LE37aI+kApwMLGrtFMQ7Uk4jqQ5H3I4Uqe2QSi/vjqbMsrZHVoqeUNPlUBiKL4AaqKCJ16ascRcQQdkjirndz2vbdIzKW1K2xGaZM8nP5Bh6KLPfwCaiF3OKDPfj3k+x1Qjfw+OnsGlMzIyqvJxQBVQHseG8t1tAhRhRCWbJm5x0AG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LALbY4dL3KCQh/g6RMK77IghwWdSjrOw31tRRJG4UsA=;
 b=itEnpKbS0s1G7TwHmUsYc95sVBTI4Hm3KnfIOiaIIOx3CrNq5tUEnhVoR5ITKGMFIPxzRJr4L/+Qvsz0UvV3x5w2g/3w+FwWwF0X/OSmrEDFmkQTExYYyY5tgv0GqOO6B66osLxJ897yADcJStKJUvCIHBfZW1ICHmf+XRIVe2E=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Tamas
 K Lengyel" <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v4 6/6] xen/vm_event: consolidate CONFIG_VM_EVENT
Date: Thu, 15 Jan 2026 17:28:41 +0800
Message-ID: <20260115092841.2651224-7-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|SJ0PR12MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b50ec80-4176-4da8-01d5-08de541890a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ob25nXPVEoUAi0i8tngJ1EyXRq60XBiVsPwnSlD0PRnGDtJZMbsBAeakiWRt?=
 =?us-ascii?Q?PtDCtluhX7C5Ugj1k1m56FFZNPNiriZPXNZYBCIazHT0LppBquppFbjKLlv9?=
 =?us-ascii?Q?zuVsjrNT2LjX5aP9ks7d47DAj8LFJomANJDvb4hDxJ1kJ2fC+kOxbMYz/X2/?=
 =?us-ascii?Q?vRt3UK6kYVtGzM5diXLBxlrSq2DfMZhlbCIRTCNoAM/69+bpkBdUuYBt5KxU?=
 =?us-ascii?Q?tTpQMxtj0nBkF6w86JU//IYbGbsGLqnka2qBTwjPpz9XWbb0jpJ/lhj/Dr5A?=
 =?us-ascii?Q?GY9ULrpW0YqZJXqysAVEhwyC4sKUojNPGQ9XF2izHie6K3ThnCBg8ZpKT4KT?=
 =?us-ascii?Q?LiAfpwH/tBW4rKKRAmVpeI/DnvtQWztwDVMiN0jHaVPVYiqIh+rauhotctF7?=
 =?us-ascii?Q?wTvOy+/fsVWrGUZj+uytwQifBXHxhpEtnyalULT80qN2q5CcbpMIU25dSED4?=
 =?us-ascii?Q?AYkjPQbm7XBKCmN9Szp6rnXpqjF+bAlUAIhI4RVxYFz6d1AZDJ4dRl6UM9mm?=
 =?us-ascii?Q?KBEZn88EIMmGKCbw/dmxeVyrzIWpav/LPbyrl6xIq5nU0CssiiNVMgBt9O78?=
 =?us-ascii?Q?xLD/weGSwNp4H2r7LwHjQGn+C2MdSEabSiW6FSsT2xSSiu3GCTX6aTUnipfu?=
 =?us-ascii?Q?YmyROKRz7mv20ol3zrHnaN/QvYsJTG90ep1a5WzLYos+Uy3df2ad06VCVUTN?=
 =?us-ascii?Q?oszSlaj00VNmtPSJmwB76nc9KJrTbWOSj8VTt8RqlQad1kM/Of2lLgmfcT9v?=
 =?us-ascii?Q?7pkJxLLuvvZUCOanDe+28xHNccF/7lJ7fKh5bIDWMf+7qKAM+yZJZl8qgcpO?=
 =?us-ascii?Q?FlE6mLYC/h2WQnBLLjtIzkZBgGMmwcm9F2AyGmfadQxCLapbyF4M2dTq07sw?=
 =?us-ascii?Q?UpgGggSpJ4s0qwWtxkTu2NwqkSMUsiF7KUWx9QYbOanzMk35rtAa/5tVhkjB?=
 =?us-ascii?Q?bv71eOs9pxCFYkdpGPWAmpoMV2LU6/3lTJH0gLB8JCcE4tW/jir8bOGaMIEs?=
 =?us-ascii?Q?sOyvC6RLHZ2O+wd7UTX3Lz+TvfdZ715XlY3xITkvwBjmsyiH24fjcIHcZIFU?=
 =?us-ascii?Q?kG5+lbwx5bBZIQSV1zeCEctZGcnYGzEzi5q7yHLyHo82bRahM0bjIYHvuEqY?=
 =?us-ascii?Q?pybpSnsnjC6mUCib+i7gpei81ScQ9J29PJp1PgY5UnjEeYUUHRBC0lrngfEA?=
 =?us-ascii?Q?StyHDeEQf1OojA4YmvBAKaBEl8VOC7FDHXrdEmB5QnQkGCHqT1IDJlUMedEI?=
 =?us-ascii?Q?VANMs+AwL8Mh/yABR8p6R4Q4g8I6yaT2n273mWaUpj43j4pYD0VXv/qHxAP8?=
 =?us-ascii?Q?mZZfI3HUHaYRDb6Vd+c4UaZSjzfrxqKEaJewDJBml+SirvDmdHrXw2TDdjVQ?=
 =?us-ascii?Q?OapVUToHpqJBbK3gVcxIzOsIbhXCSl/bGObQXQB/kL1979MEM8196noaXcNU?=
 =?us-ascii?Q?eLR3UOk6IxIJsKfV65Y1ON4dFezo4Kz2PJPQCnAZsmEQp8FqPogcFAuERBfZ?=
 =?us-ascii?Q?kyV87DLRcqrLNbJzv+XHePempMbOqZ1wn2DFzzW8CPJKYKz6NWFZ/dzskqyX?=
 =?us-ascii?Q?9ZWDG4+q4AZUF2BBnKxMrmHItzJUQlM5rE48i4ItILME+rHZiV7wYoApzDiK?=
 =?us-ascii?Q?fZHAkOuv+7VOCI8zVQ8yBcQi3PBHvcSuvg5+oFplJBqWTBvtdVTG+UhBn8kl?=
 =?us-ascii?Q?UP8BIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:29:21.5091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b50ec80-4176-4da8-01d5-08de541890a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8090

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
together with prereq commit 8d708e98ad, 8b4147009f, dbfccb5918, ae931f63a0,
37ec0e2b75.
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
index d8b41cec16..5bf3578983 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -69,7 +69,7 @@ obj-$(CONFIG_INTEL) += tsx.o
 obj-y += x86_emulate.o
 obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index c1a131d185..25eb3e374f 100644
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
index ee4b45a4ee..f34fb03934 100644
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
index b34cd29629..4d37a93c57 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5250,6 +5250,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
 {
     ASSERT(atomic_read(&v->pause_count));
@@ -5276,6 +5277,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     v->arch.hvm.fast_single_step.p2midx = p2midx;
 }
 #endif
+#endif /* CONFIG_VM_EVENT */
 
 /*
  * Segment caches in VMCB/VMCS are inconsistent about which bits are checked,
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 38320b248a..d7e79e752a 100644
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


