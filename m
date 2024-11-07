Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2A9C0993
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831924.1247319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t944W-0007lq-KY; Thu, 07 Nov 2024 15:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831924.1247319; Thu, 07 Nov 2024 15:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t944W-0007gz-Fy; Thu, 07 Nov 2024 15:05:20 +0000
Received: by outflank-mailman (input) for mailman id 831924;
 Thu, 07 Nov 2024 15:05:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shok=SC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t944V-0007O4-0w
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:05:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2406::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0e37569-9d19-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 16:05:15 +0100 (CET)
Received: from BN9PR03CA0349.namprd03.prod.outlook.com (2603:10b6:408:f6::24)
 by IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 15:05:10 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::d2) by BN9PR03CA0349.outlook.office365.com
 (2603:10b6:408:f6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Thu, 7 Nov 2024 15:05:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 15:05:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 09:05:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 09:05:08 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 7 Nov 2024 09:05:07 -0600
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
X-Inumbo-ID: b0e37569-9d19-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNjo6NjExIiwiaGVsbyI6Ik5BTTAyLVNOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImIwZTM3NTY5LTlkMTktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTkxOTE1LjA1OTA1OSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDVjq3XWmm4foMccpqq1euTtZGCuRZk8EwDrqk793MnTgH/Q0TS8KviT+EEr2xk3VRnreo4vpumIxg1+V8mqhGBrk0QPrjMYfc4v9rv+gC/MJkXPd79D1dwNdSf/A+4cg5k5fWG8xXMahgwsa3YULEonWCovYwGLAzh7zcLdwwErQwp9PHjzQValhQL55gZsbMZRhBUgFm9sx0JZY+KytzHGyxGOOaRVGkXYY+dbL62i9rS0FNAc35UYbHi1R3/cOM7UMvBUqRATM+0wL+fuVDZe/fVNrJwGIUnPJs57L8DoJ0KIKlY7gTQSrACbSKSEe8Dv8A0VgAImcLuTcBZx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAQiWvLjbBtQ0a4CEJ8gt3eXVztXmRRY74/RrFG2CcQ=;
 b=dQUtunZGcf1cLMk5S8n4C1z3fpT2jduif1yrS3YICOlQwhhD9n1We/J0N1s2PpYOBA9l7hbLASBYxn+i7i7EpPk084jOUV50+yz87m7nEbVS33zyHEGQivXwj+CHsCkejuPO5QQv/EcW64bffwBPQWVi3FvzEDLPFiNDbzLHpB//EQJU4BRt+7sG0o5dVBzjlAIgpr8md5LiJy+iMyBIU4hdkZHXTR9v+pC31eG4A8J5P1phaU11t862ni1mUUcjh0k+ZtGEBm36UU1AjmUJeueQumwTY1lDFb96lUVDk7+VdvsJMX/RsBsax81Nnr/l0okGjzLG72CazwquP5LyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAQiWvLjbBtQ0a4CEJ8gt3eXVztXmRRY74/RrFG2CcQ=;
 b=FPS30SLMDy9Tq9FitBYKUfPo2gBhbc5Blt8WFBXJ8A7hFG8Ua0a5QhmBOYqlLwl+FQ7tApvHRkXaBeNZQzL2z//Fnuuss2RA4p8nBxj0XHf8B7TRkGPVQWDWN2NfkABjgoJbm/cSCd0K1QuBNztvY6+pZQ8PJa2x1vazvtvgIyE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH v5 3/3] xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm
Date: Thu, 7 Nov 2024 15:03:30 +0000
Message-ID: <20241107150330.181143-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
References: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e614b9-e260-4641-f8f0-08dcff3d92aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bC9NMFRFeTdaWmlRMXJaNDZPOWZCakhmaEZCcEF0QytYSElYeVlPV1FyNllj?=
 =?utf-8?B?YUpaK01Nd3ROQ1JKazZWQjJUdzJ6MlFGREh6bEhFV2dCU2x2aFhiWHcrdVNy?=
 =?utf-8?B?Q2pmSW5UQjI1ZVJVUUJHY2FWYjNIVEhuYkFmMXg2ZDJMSkpZTGs2UjBFa3Vm?=
 =?utf-8?B?QlYrOWlWNXlRY296RUhHaXhBd0Vuc2doUUM4ckpwOFNrdm83WXRub0VGcHpU?=
 =?utf-8?B?WG9Yem5rS2tlOVRUbTdkdGdvbDNveGp5dG9qNUwwYTY5M2o1SzZTaXUwTGcz?=
 =?utf-8?B?WGZvZjhzTjExT3BDRTlrWjZ6cmtQcFA2Z2lSR0RSNGFWTFI0WE1Seit1R1RU?=
 =?utf-8?B?cGlzYXl3MGpUUks4dFpnck5iSmlzbkR0ZDdxVm54OWtTUHlLREtsazNnRlpk?=
 =?utf-8?B?SGQrdFZpb2I1N1VRQTBOanVXVDAreUlFOXZHQ045VkoweXg3RVNBWG9ySXJH?=
 =?utf-8?B?STk5UElQcDEyYnp0eUNwaDZoblRiNlhuVDdUNCsrQmVHcnVzcHdrV0lMekNF?=
 =?utf-8?B?MDNDTjNsSG00d3dYNUZPM3h4SW5KMDA5ejNSSVFtOVIxOXRhcHN4N1Y4NURH?=
 =?utf-8?B?UENIQkxjREZQK1d2RGVQT2FuWmVBK0YvNHAxSW5SdXlpSUZ4UDZQQnJGc3o0?=
 =?utf-8?B?THpIdzhiS01heVZNWGtqRjBRK0lZODJUR2ZYRVBjQzhsK2lGcXJGenVHNStx?=
 =?utf-8?B?ZTNCWlZlbnpOaDlkK3pEWkZ3UTV5SnZPNVNJdHN4VU1qbVNOZkZTTzJVNEZ1?=
 =?utf-8?B?YXhkTENGcVZxdi84SWhGYVlqdGI1N3grZDhGQ0RrTU4zd3hCSEI2VDZwclJN?=
 =?utf-8?B?bEFVZjhBSjZpeEwrb1EzNFV2SDh0VFV4TndGRGNKaWtNY0xEeEs4Y0xCYklS?=
 =?utf-8?B?b0wrNGpVY0EvaE5ocVhMTzJVN3BqcEl3MnZsaUdvbVlMMHlGUzhZbi9BTnlz?=
 =?utf-8?B?V3ZadDdXb3MxMG41SEZCMnBlVTl1Z0NpMlVYWWc3anZXYkdOMEV5YllKZ3dE?=
 =?utf-8?B?aHJLUEcxYmtSQ0hldVNqUlhWa2tteG9MUS9wN1Z2R1lXQnNrcUcrcW1TT20r?=
 =?utf-8?B?ZkcvSjQyN3FNbk9DUHh5VUhtaGJtVDBSRnZJbjU5bWFNQWwwMzByaDE5UDRq?=
 =?utf-8?B?cC9kL0ZMdFIvazVYakRGVGl4OUhNSERFM29MMEd3Vy92VmJTVTBFM3Rad0ZK?=
 =?utf-8?B?clJ4UEFFU2dkU1BoQ1RSVW52SGNJZitqZFgrQ2JJQmdQK3dYTkpUVkhIcTI0?=
 =?utf-8?B?SjNxMWtLZ0FnaFI0RWlLSWxoVzVGaTh1ZTcxSDJIcVZVdFFrR25lS2xxbW9r?=
 =?utf-8?B?TWUwTzVLMXRkZ0JKN0c1am9sbVEwanFEcE9LSUxHTWtDZFVvZ2VSaDkzMkRm?=
 =?utf-8?B?RnVQMFVpL0NqcXBtYW1Oa0V0S1p0UEZzYjlSZlBUejlJQlZKZW8zZTlBUlZL?=
 =?utf-8?B?cTI4RmZkM2JqMGpkUFJFZGFoai9qakUycUYwUC91L1Z3Z1JWWlRZcHo0QVhp?=
 =?utf-8?B?NWRlZU1zM2FUZHZEMzRoTWgvL2lsSmhZUUovU1MyaHFjUmhtMGdvcDBHWHBq?=
 =?utf-8?B?eVJZL1BDTmc2MXk3enIrY2VtZlQ5Tjh2V21qWVVpWFEwd0Fid1BiWnlhUDlw?=
 =?utf-8?B?c1FDTmRFZEhoQzJjWmtOeE5TS0R0YUFBN01DOE9NVFRFeDBabGVtbWZ2cHFz?=
 =?utf-8?B?aThmUjh3ZlFqNUw0ejJiUFFzMjNOOFNIZGRHQjNGYUh2K1ZWcUlTVUtrNlJC?=
 =?utf-8?B?WEtvSDNVWGI4UDJYT1NrOHFRSVFodS85T1NWWnJDTEIrU2RYVjRPYWIrTkdp?=
 =?utf-8?B?OEU0MENpRUZoZFNhTEFHSjFudkY0ZkI0TW9jWFd2YmFNK08wMnhXcDErTUdh?=
 =?utf-8?B?MFpHNXhiR3hxbzkxeW1KMVhnT3YreTJERlVWT1ExNVFiQ2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 15:05:09.7752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e614b9-e260-4641-f8f0-08dcff3d92aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589

Secondary cpus initialization is not yet supported. Thus, we print an
appropriate message and put the secondary cpus in WFE state.
And we introduce to BUILD_BUG_ON to prevent users using from building Xen
on multiprocessor based MPU systems.

In Arm, there is no clean way to disable SMP. As of now, we wish to support
MPU on UNP only. So, we have defined the default range of NR_CPUs to be 1 for
MPU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from :-

v1 - 1. NR_CPUS is defined as 1 for MPU

2. Added a message in enable_secondary_cpu_mm()

v2 - 1. Added the range

2. Clarified in the commit message why/how we have disabled SMP.

v3 - 1. BUILD_BUG_ON() is moved to smp.c.

v4 - 1. Moved "default "1" if ARM && MPU” right after “default "256" if X86”.

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
index a449aeca67..731698aa3b 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -141,6 +141,16 @@ FUNC(enable_boot_cpu_mm)
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


