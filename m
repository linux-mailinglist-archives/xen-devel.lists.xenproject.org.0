Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE039DAD40
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 19:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845061.1260566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMwk-0003p7-DP; Wed, 27 Nov 2024 18:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845061.1260566; Wed, 27 Nov 2024 18:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMwk-0003nR-98; Wed, 27 Nov 2024 18:39:30 +0000
Received: by outflank-mailman (input) for mailman id 845061;
 Wed, 27 Nov 2024 18:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPyn=SW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tGMwi-0003ey-AY
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 18:39:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2418::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb26a7ee-acee-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 19:39:23 +0100 (CET)
Received: from MW4PR04CA0358.namprd04.prod.outlook.com (2603:10b6:303:8a::33)
 by SN7PR12MB8601.namprd12.prod.outlook.com (2603:10b6:806:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 18:39:17 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::ec) by MW4PR04CA0358.outlook.office365.com
 (2603:10b6:303:8a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 27 Nov 2024 18:39:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 18:39:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 12:39:15 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 27 Nov 2024 12:39:14 -0600
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
X-Inumbo-ID: eb26a7ee-acee-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxODo6NjE2IiwiaGVsbyI6Ik5BTTEyLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImViMjZhN2VlLWFjZWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzMyNzYzLjAyMDAxNywic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2RbwfX6xTpf5R/kORNeu+o6nLlj4GEySUirxPFdtf2BM52Meyb3crdvkD6YQOGMAmv9c+OY78Xf2S350Zn8IgsUEY9Gtr0CjBWrHNFK8zgz9Rkt/udxM67wcjOJaoSXA+4mY6EszQSYUQvsbH0ho+ISUa4iz91vONAs2ylMNA2a9AX3I6wzbGmFYYmb0gt466JU6Emu2X+VjpF0iEuQUS9kM4xhg+k/nCyo0pNyDFN3trnU3F0HAbQt5dqlfACoC+kU0TXKhr88BKrHIMLXzkX7Kn6gjKKwphJhJf6JXM0OTUd3Yk4o5n4yUelf8t+r5vt6o8JW6ObC0CuYoC4HRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y0rqKXx3iOgUdFHLMYjo9xQCZSV35vv3Q1T2p0SOFI=;
 b=vkE3hW1Ea7kmwUb3kUqNeEimOiiyvYSZMVv4SnQgCD6UQGRYeOERcwgPI0ncufAW3OCq2e/lmxgaQLhwJagfNfdV85bi4xodyDtCqAo1JfcYxPIioIv1gGSsxpq8iA5FtimrywUFzGw4Ryf5kxQRo9OQQRKVPHfbDJqaBuy+O8NLkBKJnjFvkD7Zf4PyIFR/3O10oTMZ1Ft4KVmeoJHtLBFcwnPF+qveznmDf3NDDRJK8K00C8QQ/Nr8ojT0zfTvFZ3SNdfndGbOHUfiRWdWTa+YhsvCa797Jtm5tp5yFjpy1SpNCpGXarHPsoLM5iQBzgQ8WW4Pq76eIJyZQObcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4y0rqKXx3iOgUdFHLMYjo9xQCZSV35vv3Q1T2p0SOFI=;
 b=Zq8EUiQ8jIxCEyUyN6z4qgylFYriFZ6wKcb6pWEFsfGdby324EnwAJYDfjXp79bE6D7SyuD7zrK+pIS7nlRXLcjbDkbzBdaAfn+bl+3HZf7OLF4lQJuxsUIMd6jHhJY8OXLfTTCRD8drF0dgBfNS9iZrWZNSiGL8KWDc1H2gfBQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Date: Wed, 27 Nov 2024 18:39:05 +0000
Message-ID: <20241127183906.485824-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|SN7PR12MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3b41ab-d065-4906-1b9d-08dd0f12cc17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jx0rjZZVodD4/tJ1I6ZRurYos7O3lwBx8RufauL/h2r9nImnRoxkzl3W8jiG?=
 =?us-ascii?Q?LoDeSBcxcmlL3dSBU1jr2uoTJZ699wRqLZxpFi69spZuuRXlOLvO7Uaou7Yt?=
 =?us-ascii?Q?Zx4DNDVhCIMR1/uuLsQQecq59d4EYazsgDCRoNR+Ht9c5lTL1GytXuWwmBlz?=
 =?us-ascii?Q?4rOR4qrDYe4j981g5xmfd8MiYQIVciK+pWA7nVMiR2eyawbh2EPkZgx+wJ2K?=
 =?us-ascii?Q?QMuReypAGVvDXfPL431dsBbs44yK5pK5b0OxPpvehH+L/ChVgCipkFFAQMMw?=
 =?us-ascii?Q?DnB1P3r2bVrPNTM7M6x0VC7f+wQ7HIrpaaxV5EauXAxY6RT80SeQOJ1zh084?=
 =?us-ascii?Q?Bn4G/sH0fS2+sOOCweTC1rjtwlAuDl837j6dUED2ioS3WRsvWzvs6zKkUlax?=
 =?us-ascii?Q?vrUFWZmAE6FVooDh5QJUJ2DioVLIAnA6Cqej0To87MYryoVkJWXwuopQdkHL?=
 =?us-ascii?Q?wo7sRmS+RmOJ7MqLXH2xQrIdoh09g3o/tGcUCzWE58NXkrPZDuIIaxw7f2zL?=
 =?us-ascii?Q?nY8AqG6MrU6fgnv0rvGL7qGrkBGNrSe8j7NgEmRKKkqzjIXWkiGAhAuvYIiS?=
 =?us-ascii?Q?x9E2fhfOL2VycxwFXjfQE9aZWX/InullpM2Lg2DI4OYXX7hFahLpBKnBGrq3?=
 =?us-ascii?Q?u3nDGsxZWK3Vkb842hlxFdk5T/+H/LCr9WFThn21ikvF01vAYGKqI6w0Co8k?=
 =?us-ascii?Q?UoQIQmmZTjvJeY812SBkYGd8eJrV7HQADatFhZEcKM3y+zW1xDDKUgRRg1MI?=
 =?us-ascii?Q?PPlonsvb/Z28qOJoyztR5L8Zk73F2WJmjLYcKpX+8jp7olKLnCRzbgj4LMoI?=
 =?us-ascii?Q?mAhhvUGaAsxdHIFpuXZYnWn0mRnrYAFrIEQrlMqdMfHxnNSBVkWfeZ7G6aqE?=
 =?us-ascii?Q?lTK46xMJzs7sMgjeVXFs6Y0hHAtbL/2dx3GUzjA9jMKpuDPjH3xnMzxBROGp?=
 =?us-ascii?Q?dt46yw0DQyJcepc0WGJ2N6i6g3be4UCiHev3taKVDEWQZQq5AXviUXOJW1YN?=
 =?us-ascii?Q?Xz7/QYGb1QxZWUvXpmEQI/aUInMSI4n8Qg0VnTRE10vANmyTuqBMvxY8Frqg?=
 =?us-ascii?Q?ORwOgiPANy3es+DMLLiMo0DKcaB1w4wRO8OzPxpzmX7WjLXrnmm0BrtehOF6?=
 =?us-ascii?Q?4nQdKqAJan/5Sqi1+SAkReU+RqsuDhXIVJY0YBWRbJPkGNebWo+IXt82NdcT?=
 =?us-ascii?Q?38TqZaJmgzJRPk9wk4rN1MO1dY9S0WWNOqrdlY4EScQFBIprEQJ8/6BQDnbb?=
 =?us-ascii?Q?1aFgOfgJWSPy4QQUgAZGveATwE+/++6F3i2axj6dH+ISCJgzEemmPTOItM3Y?=
 =?us-ascii?Q?7xaT351PzKRN2t8BHJLOJnQ8TPIhXR/5XJHX+WOCTYVmqfPLgINaX6rhOJOK?=
 =?us-ascii?Q?z0ePd4eM7X5lpa6LItupkK6ogPMF+ZN7NOg65CAQULRbuO1zjfT8NRaRLhS5?=
 =?us-ascii?Q?y6KtOYzYP4g2Y/yIiB7Kums3x/TLqZyz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 18:39:16.2654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3b41ab-d065-4906-1b9d-08dd0f12cc17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8601

CONFIG_EARLY_UART_SIZE is introduced to let user provide physical size of
early UART. Unlike MMU where we map a page in the virtual address space,
here we need to know the exact physical size to be mapped.
As VA == PA in case of MPU, the memory layout follows exactly the hardware
configuration. As a consequence, we set  EARLY_UART_VIRTUAL_ADDRESS as physical
address.

EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE should be aligned to the minimum
size of MPU region (ie 64 bits) as per the hardware restrictions. Refer ARM
DDI 0600A.d ID120821 A1.3 "A minimum protection region size of 64 bytes.".

UART is mapped as nGnRE region (as specified by ATTR=100 , refer G1.3.13,
MAIR_EL2, "---0100 Device memory nGnRE") and Doc ID - 102670_0101_02_en
Table 4-3, Armv8 architecture memory types (nGnRE - Corresponds to Device in
Armv7 architecture). Also, it is mapped as outer shareable, RW at EL2 only
and execution of instructions from the region is not permitted.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. UART base address and size should be aligned to the minimum size of MPU
region (and not PAGE_SIZE).

 xen/arch/arm/Kconfig.debug              |  7 +++++++
 xen/arch/arm/arm64/mpu/head.S           |  9 ++++++++
 xen/arch/arm/include/asm/early_printk.h | 28 ++++++++++++++++++++++++-
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 7660e599c0..84a0616102 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -121,6 +121,13 @@ config EARLY_UART_BASE_ADDRESS
 	hex "Early printk, physical base address of debug UART"
 	range 0x0 0xffffffff if ARM_32
 
+config EARLY_UART_SIZE
+       depends on EARLY_PRINTK
+       depends on MPU
+       hex "Early printk, physical size of debug UART"
+       range 0x0 0xffffffff if ARM_32
+       default 0x1000
+
 config EARLY_UART_PL011_BAUD_RATE
 	depends on EARLY_UART_PL011
 	int "Early printk UART baud rate for pl011"
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index f692fc7443..86e4019a0c 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -11,8 +11,10 @@
 #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
 #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
 
 #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
 
 /*
  * Macro to prepare and set a EL2 MPU memory region.
@@ -138,6 +140,13 @@ FUNC(enable_boot_cpu_mm)
     ldr   x2, =__bss_end
     prepare_xen_region x0, x1, x2, x3, x4, x5
 
+#ifdef CONFIG_EARLY_PRINTK
+    /* Xen early UART section. */
+    ldr   x1, =CONFIG_EARLY_UART_BASE_ADDRESS
+    ldr   x2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+#endif
+
     b    enable_mpu
     ret
 END(enable_boot_cpu_mm)
diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index 46a5e562dd..606aaedd6e 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -15,6 +15,29 @@
 
 #ifdef CONFIG_EARLY_PRINTK
 
+#if defined(CONFIG_MPU)
+
+/*
+ * For MPU systems, there is no VMSA support in EL2, so we use VA == PA
+ * for EARLY_UART_VIRTUAL_ADDRESS.
+ */
+#define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
+
+/*
+ * User-defined EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE must be aligned to
+ * minimum size of MPU region.
+ */
+
+#if (EARLY_UART_BASE_ADDRESS % MPU_REGION_ALIGN) != 0
+#error "EARLY_UART_BASE_ADDRESS must be aligned to minimum MPU region size"
+#endif
+
+#if (EARLY_UART_SIZE % MPU_REGION_ALIGN) != 0
+#error "EARLY_UART_SIZE must be aligned to minimum MPU region size"
+#endif
+
+#elif defined(CONFIG_MMU)
+
 /* need to add the uart address offset in page to the fixmap address */
 #define EARLY_UART_VIRTUAL_ADDRESS \
     (FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
@@ -22,6 +45,9 @@
 #define TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS \
     (TEMPORARY_FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
-#endif /* !CONFIG_EARLY_PRINTK */
+#else
+#error "Unknown Memory management system"
+#endif
 
+#endif /* !CONFIG_EARLY_PRINTK */
 #endif
-- 
2.25.1


