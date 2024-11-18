Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8729D1071
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 13:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839321.1255148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD0dW-0007fb-4i; Mon, 18 Nov 2024 12:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839321.1255148; Mon, 18 Nov 2024 12:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD0dW-0007cH-1R; Mon, 18 Nov 2024 12:13:46 +0000
Received: by outflank-mailman (input) for mailman id 839321;
 Mon, 18 Nov 2024 12:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1K7B=SN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tD0dV-0007aK-3W
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 12:13:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b1e5498-a5a6-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 13:13:41 +0100 (CET)
Received: from BN9PR03CA0251.namprd03.prod.outlook.com (2603:10b6:408:ff::16)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 12:13:34 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:408:ff:cafe::3e) by BN9PR03CA0251.outlook.office365.com
 (2603:10b6:408:ff::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend
 Transport; Mon, 18 Nov 2024 12:13:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 12:13:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 06:13:33 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 18 Nov 2024 06:13:32 -0600
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
X-Inumbo-ID: 8b1e5498-a5a6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjI1IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjhiMWU1NDk4LWE1YTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTMyMDIxLjQwNTc1Mywic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raxAJz5SsrKA7qQx+A2qmkWjtZHgkCPCGJ407LxS6AltLxx0PbjCuuvuXNYIFwlbO5BGlOoM8Cl8ykqtihOYUjPA1iy3UNHbDwSmTMvCetFvQRpiPPDrYpLlXukJzjHGr0jyn1YumYXJrk6Xp14JREAd52S6jyXnmEFWkVRjVMgfa0/bHTspR7y0J8iFxGe/hNZEMRTyn2v/kWhHAyZ6j8dzCXuDfpiijLdGhrRKRf8Ast1pqk3aPK0siuXZm5E8g4L9Tf3afuzYd229nEcDeBsLCZo+Sr6WS0ajIPbCDAo5zQ0uU5Q0XkqyrcorKTIKbgWiE7vo8KP0wMy9OQhrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THkJUSUkfVKn7mJityoAfrgY4wqfLzF0xJ68zkmM5zk=;
 b=nFaWcCjWLkm2fETA+iwvbFktUfLHPbZE8EcFqSADEAvIEI73Ding2KYa9WtoRVe4nqVztBKgTY+Wmh1/YLyRl6UMUQEKdop2BkY6lS+bLx8hek2H8XlRjcBpm3Sn6+xQS21Bs6lAaLtPiFjZSHJMmmj2UXz4TtswDSevbK+9LlfoLlL6qSH9dXe5Hd69Ty1jTM0nATSJcqgstVxQySLYf9jJOWbZKbAVlvX67un2MGpay0ZjC2RU/VBPz07ore9pmSpA6V9qTbFdw6KL+ElOPNhsf0MbkF3E5GPiXYLUf1kIsd5ytjlwrcuOgGM7tDDE7kiVqNsCNDv915jVeaJN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.12) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THkJUSUkfVKn7mJityoAfrgY4wqfLzF0xJ68zkmM5zk=;
 b=HjPc2SH9O5XNei3dSMM21JhWy+87WrJMoBmFPYDUFlvoZukibkikxdS/fXeEsqtpFSd+PXq+XXL4cgq8haQQ3EwG4XovYVAVRY1dp8qT8iGxEQCSzXmjD8Aq75DTNjavBhPURfrpWHGOS94Tmw4X4zbCDhPjK/BfAP2N2OCQ/e4=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.12) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.12 as permitted sender)
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 3/3] xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm
Date: Mon, 18 Nov 2024 12:12:50 +0000
Message-ID: <20241118121250.4027441-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
References: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|SA1PR12MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 195080aa-d1b8-48af-a52a-08dd07ca6c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU1qM3h1R051cWx6ZlRaOGMwK1hjL0dLZTVQN1Y1VzhUc2c2NGR6a3BSakpi?=
 =?utf-8?B?anpkRjdOMlU2RWpRK3NqcG1xa2RoMkpOTC8zSGFmSjA1N2JEM280THBQcXBz?=
 =?utf-8?B?NVNQSUNIZkVTZGNzeXVMMkYvK0NjNU12RU12K2Zyekh0UDJpbEUzaVNOUEVF?=
 =?utf-8?B?U1lFOC9VMnRrUXphMzNIeEFUU29qWkR4ejlUeWF2bFJMczVLWUxBVlN6VURs?=
 =?utf-8?B?WG1uNDRPSXZ6NDREV3VOS1dNckNHbXZvUjZGSWlnaEdHam11Q3ZnKzA3cVFp?=
 =?utf-8?B?OVNmc2dXNDMyWUZGQnFZNkZ6cmZ3OU5LNmZKVXUrQVNXMXMxLys1NnoyUzN5?=
 =?utf-8?B?RE9EVjZhVzdzY09GTGZ4WHBKODJNYVdxbE1tSmcwcWFQaVViSXQ3aXNJVERU?=
 =?utf-8?B?Q1FCTlZDSDNUTENURFZFaEFiWURlRFBNby96RUNQYmFDMjFSRWpHemVERG1l?=
 =?utf-8?B?Tkk2WUpVWDZ4bVpPQVBuSjd5VTA3WkxQTG1HWjJHU2VIUlJ1N1l2bFVFdzFO?=
 =?utf-8?B?dFJuazFsV1FVUGp4UzZTb1lzR2xJa25oRjd6Q0YzTURnMVFaVHFoYllkOGZx?=
 =?utf-8?B?RWtkemIrNkVFRHNFeDNEaTJ4M29GbW5FejcvMDBINytMN0hVWHBGN2FsSFVv?=
 =?utf-8?B?TGZwRGJqckJrT1NDM0xTbElXbDZlNmF5WnVFWUVkWFduWGdOSjcrc3N5VytT?=
 =?utf-8?B?L1Q4OXlUK0svR00rNzdHREtuSmNnaXE0N2NaZ0tieUEwVWN0OGx5V3pCbnpk?=
 =?utf-8?B?MEtrd2x2VnBkbUM2Vjk4cU4yTzc4QWRvWDlLaU52S0x5ZUNuWGUrbmFPL2dm?=
 =?utf-8?B?Y3lVR3NXODZadnBVRkpPZnhjUU5Nd0kwd3h0R2R6RnBkbW55cjV5TWtqc1M4?=
 =?utf-8?B?REcvblRFMzB0VlZnQ2hQSW9vRG9yb3prVytSeDAvZGp1UktiV2xjQkJZN3F2?=
 =?utf-8?B?bGlGb0pLOGVSK0FMWTlNWlB0aEFhS2I1NXlmZHlqZzIwb2k3UmpHS2gxeXVw?=
 =?utf-8?B?SjlzcHMwc0JUK2E4TmE0bVNZWFduRVA1eVM5VG9xSFl2ZmxXM25GT2lhMUdl?=
 =?utf-8?B?K3NlVnpnN1Ftb0tnTjZoamsrOGJ2aFpWN1RTa01pNXJYTTBoVUJwVVczek1Y?=
 =?utf-8?B?RUpDS3V2SGtzbnJiNjcrbDlDRHNlNEcwK0FGcTR3TzNKb3F4V0FzcHdLcGhV?=
 =?utf-8?B?TFNSNkNtZWl4bDhnYjUvb2E5L2NvRWdKa3pqc3ljeFUyQ3BCdStYaVk4TlJ2?=
 =?utf-8?B?dUVoeWVCNzJ6blFrV3FPamx4Q25qUXplUGtrVitUQXpROTZXbEtzc1luMVFq?=
 =?utf-8?B?eVJQcVptU0JlVUY3ZkpyekxVcUtmOHphQXh5d2FDWkNaSTFvSkRQbk9WVWFz?=
 =?utf-8?B?ejFmcG9DWHYyVmJJTDJKdENaenpZWk5FNHZ5ckUvYVhuZ1R2WE9wUC9paEN1?=
 =?utf-8?B?YWQrb0lRS3A1UWt5NUJCRWNObmNyOG5sdUtQOUFwOEI4RDFPQTFjTDMzZXE1?=
 =?utf-8?B?L1dVbUNJQWgya2RtQ3ZkNFFtQ1NxWlprREd4UitFWkJkSmozUEw3UHA4NElx?=
 =?utf-8?B?TEtZekJtc1czREoyNEFRRFdWd2UwdC9tYy9PZ2ZnZUtlWllZMEdmc2xKaEU0?=
 =?utf-8?B?NUhCK1o1SGVsK1FuTUVuWUpqanVVVTBxOVIxZzRHZkM1U1FIZXQyUmlsdjFl?=
 =?utf-8?B?WVc3eTA0QUpIMUxJZFZpVERLMk9xNm9TVUVveWY2S0F2VzVuOW95dGI3N1hp?=
 =?utf-8?B?UjdaZTducnJnSG9IZS9hQ1A5L1BrSkpEY1FVQ21ENWEwaFlBSnBRanI0MEFL?=
 =?utf-8?B?WkQ5alpmRFFQTURzSlNIdmhGUGJyYVc3OU43ZDFzYnlrekt0TEFZckNONnFJ?=
 =?utf-8?B?aTVRRHpQTXBaQzNIVUh3M09SMURQbjc0WCsxTzVKVEJJVUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 12:13:34.0331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 195080aa-d1b8-48af-a52a-08dd07ca6c78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104

Secondary cpus initialization is not yet supported. Thus, we print an
appropriate message and put the secondary cpus in WFE state.
And we introduce to BUILD_BUG_ON to prevent users using from building Xen
on multiprocessor based MPU systems.

In Arm, there is no clean way to disable SMP. As of now, we wish to support
MPU on UNP only. So, we have defined the default range of NR_CPUs to be 1 for
MPU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from :-

v1 - 1. NR_CPUS is defined as 1 for MPU

2. Added a message in enable_secondary_cpu_mm()

v2 - 1. Added the range

2. Clarified in the commit message why/how we have disabled SMP.

v3 - 1. BUILD_BUG_ON() is moved to smp.c.

v4 - 1. Moved "default "1" if ARM && MPU” right after “default "256" if X86”.

v5 - 1. Added Ack.

 xen/arch/Kconfig              |  2 ++
 xen/arch/arm/arm64/mpu/head.S | 10 ++++++++++
 xen/arch/arm/smp.c            | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 308ce129a8..9f4835e37f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -6,8 +6,10 @@ config PHYS_ADDR_T_32
 
 config NR_CPUS
 	int "Maximum number of CPUs"
+	range 1 1 if ARM && MPU
 	range 1 16383
 	default "256" if X86
+	default "1" if ARM && MPU
 	default "8" if ARM && RCAR3
 	default "4" if ARM && QEMU
 	default "4" if ARM && MPSOC
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index c56c693cc2..f692fc7443 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -142,6 +142,16 @@ FUNC(enable_boot_cpu_mm)
     ret
 END(enable_boot_cpu_mm)
 
+/*
+ * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
+ * please the common code.
+ */
+ENTRY(enable_secondary_cpu_mm)
+    PRINT("- SMP not enabled yet -\r\n")
+1:  wfe
+    b 1b
+ENDPROC(enable_secondary_cpu_mm)
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index c11bba93ad..b372472188 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/init.h>
 #include <xen/mm.h>
 #include <asm/system.h>
 #include <asm/smp.h>
@@ -6,6 +7,16 @@
 #include <asm/gic.h>
 #include <asm/flushtlb.h>
 
+static void __init __maybe_unused build_assertions(void)
+{
+#ifdef CONFIG_MPU
+    /*
+     * Currently, SMP is not enabled on MPU based systems.
+     */
+    BUILD_BUG_ON(NR_CPUS > 1);
+#endif
+}
+
 void arch_flush_tlb_mask(const cpumask_t *mask)
 {
     /* No need to IPI other processors on ARM, the processor takes care of it. */
-- 
2.25.1


