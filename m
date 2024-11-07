Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26D9C0994
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831923.1247313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t944W-0007gv-B6; Thu, 07 Nov 2024 15:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831923.1247313; Thu, 07 Nov 2024 15:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t944W-0007ef-7m; Thu, 07 Nov 2024 15:05:20 +0000
Received: by outflank-mailman (input) for mailman id 831923;
 Thu, 07 Nov 2024 15:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shok=SC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t944U-0007dL-Pw
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:05:18 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0ee9450-9d19-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:05:15 +0100 (CET)
Received: from SJ0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:a03:2c2::20)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 15:05:09 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::3a) by SJ0PR13CA0045.outlook.office365.com
 (2603:10b6:a03:2c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.14 via Frontend
 Transport; Thu, 7 Nov 2024 15:05:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 15:05:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 09:05:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 09:05:05 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 7 Nov 2024 09:05:04 -0600
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
X-Inumbo-ID: b0ee9450-9d19-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxODo6NjA0IiwiaGVsbyI6Ik5BTTEyLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImIwZWU5NDUwLTlkMTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkxOTE1LjAzNTEyNSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zG2HohGWpSyX4aVaue0OBpr1WDIw/uAtr6OONtLnR2YOzY6pKAMJIIUA2PW9cig/7zoijKVG2Saf3AwOmXrhWSFwE8bOfJZXPP/aB1X0Bx0AVzowyC9yt1RNchnfXkkAxtr40Uu3aW0AevMCx/wAV5vBHMKaZPCZymyjHeZhTZqyoggvovK9dxo+y7GmQAfFnzk5lZiPgGirc4rjQ1CN/ja1AkAkPY7g429D/ZRdM4yFqTPVgagqVU4jeM0av6oHRksnnuttxQ5TwaMtk5o3xnwkKSrSXqEC6eSWLiH7aArGosE3h32TzxmqZ7UUqqwUy8611143jMmOYuLjdZtqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iC2GdZCuxuVwaZw2qvbMt7m8oDLf7Amskjm7zxYii5I=;
 b=QvakQ16TsKOmj15y9eNAU1yDysl6F+NBwIMngJTu+7F97ZBBP7tgwFhs5qIG8f5FGa4cYurkWZ2WiYrJrn91MUaitSozVNO0Qh7w8Lcz9tfqR3liyv2bt1hPGyZuSh4ImDbeSYquHZgo9yZn3rFiTHSr+JsiTIqONOIsb4Potg90ipkTHi4Ae8gNU7BLexHYLx/sOmbQgRucNFlhbpPUQ6n+HgHsgYXcRiJ7c9QuKkuByBVp+mWPDLMP4pf+p9yUNVu/ka4UwslIyOxTF9KMY/dwmUzeky+vVcJKvBzBXKl7bmaW4w10AZ1+G+fZzQaCR9r8MIbvLVr8ceymRAZ1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iC2GdZCuxuVwaZw2qvbMt7m8oDLf7Amskjm7zxYii5I=;
 b=H8dBc+BTvfW6v30lhc4wL1FDq17zA90QxbyH5wd8nsK/5ORtvI+OdAsuNoWQWFDjHvDda4Y7/kcK70d9Gr3xSYjgzYaZSsXnpfda1r8CcDHhaH9klJdAfgqQamnLH/HZmZIDneCqilnj9VT1VcX9fImIjQ5ZvaaIhnvtSGpt+Ls=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 2/3] xen/arm: mpu: Enable MPU
Date: Thu, 7 Nov 2024 15:03:29 +0000
Message-ID: <20241107150330.181143-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
References: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5faa20-b652-4a31-38ec-08dcff3d91a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zu/P9rrT3uaYyihTHUBa+Db5CkACcB50pI8NiZ/mOMMsFnzi7wCzm3p34BJg?=
 =?us-ascii?Q?rxZ+s8H8O7Twak3WpO0EsgagYR0En2viUq/M0Vpuj/gn1rsVBsizWSV/a3Pp?=
 =?us-ascii?Q?RyHwMM1sPvdDK16q4B1l8CeVe7MP9ecM10dUxC5mXmxHi3ut41aa9KibHdcW?=
 =?us-ascii?Q?GwjG/Rn5z/kahoPXKdynjXpJlsDcTyXGiv0lH+SNBC1mCwhAF/Tcp4qM5Kap?=
 =?us-ascii?Q?M55AHVbBgYk7PwP1BzONeJrFGoMMSN5Os/779wJ75kbNTnQ9cBFcWhDrthp2?=
 =?us-ascii?Q?fdBAnofiQhppBYtDTVJZRQpv+S08CJpLb/RL+RN1DVpTmv0Sb6jAdzgfGRT7?=
 =?us-ascii?Q?tFA687mKpAso7XbFytE0S7SJ0dfOuxAusy4cZiaDGakdPwtCKoqUxGAWoFFy?=
 =?us-ascii?Q?xoyz0n3jZN7xxhKidAe3roGfXEfWH65P2uTv71VDlHb8d4CLqfHaIswwZrMY?=
 =?us-ascii?Q?38PPHpqYJr/AvJVv9h/b4iLFja8chIZSkjDHzB8gKdkU1H3ff61EvDfl8oCx?=
 =?us-ascii?Q?Xee5Hbaklz7vecKFv7uqTp7G2/3hSovZ/eVeAkGwjgnr5UFnVt2v9ZWDEFpX?=
 =?us-ascii?Q?ru5T5PNFLcjXCM14qzgZhxUFvjNmQfCn7RG6w3WkgHDneh93oNIESVvnNs/O?=
 =?us-ascii?Q?huZMTr+6fQ/4RPvDYnZjKESOdHnMztBFbvly2dUrFiLKyohull6zLsMGTsPn?=
 =?us-ascii?Q?H5iBTqnWCBgUqy2HYlGsco/FPUviw8beb1z15PuNQHn8T54D2Nz4EyDlEmhL?=
 =?us-ascii?Q?VoG592PpxSWkLxGB46gh743Cnw4TMaEdu6bIyCh/R1xeZ3V2yxmWMC3lCPUl?=
 =?us-ascii?Q?IwwKxxOBBeY5VVGTkWm5lCy9/1HIvmAGxi0fJ0j2yeX4atxA/fMCxtI0LGKa?=
 =?us-ascii?Q?UkQofiZOALyeBwP6TXpysXakQALzOUxBsNETfDAUf8sY0XCh7fgMfy0fLncO?=
 =?us-ascii?Q?f20ieX4PIM5MMwWjUBANH9w4Mv7GhzVZPK5r+58mwRrGnEQ2uO/zBqX0l+8g?=
 =?us-ascii?Q?5jG4JEM+7U07VuXrUt144km5o4F7ytBCZ2LrySQpiREjN/j8deYH2A/lV+S0?=
 =?us-ascii?Q?pwNJRsIN/73qKSfurXdIdJOfHUgBkcgeJDBA6SXgYLR5IcPu34PGl2eFTUkx?=
 =?us-ascii?Q?QR8NMSAFJXz9rq4UnuKBDjwOQE268qHo64F7xTIZDSd/PJSq3WhykEAbnIkg?=
 =?us-ascii?Q?bgAPtWnXYTuk6IZBrR4/BpyR4wOezAAyXgZ+L5j5QMW9oWiS0RnHOz1jrDPT?=
 =?us-ascii?Q?QX61JtiwVbgZg2MkUrZeOywUKr4RFBFHZpH7skerbYvLGKSLPLvxqsTwYJI4?=
 =?us-ascii?Q?lIs3QKSC34cljzn1SBP7T0nm52YJuv3pf6gi7m8w5VmTgJ9Njq/25Qh1q4ZW?=
 =?us-ascii?Q?gYL4N4/LJPXR0dnDm0TqEan4SZRqphOtaHxy0rwdOAp8r5QQ4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 15:05:07.9923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5faa20-b652-4a31-38ec-08dcff3d91a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280

After the regions have been created, now we enable the MPU. For this we disable
the background region so that the new memory map created for the regions take
effect. Also, we treat all RW regions as non executable and the data cache is
enabled.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from :-

v2 - 1. Extracted from the previous patch into a new one.

2. Disabled background region.

v3 - 1. Removed dsb before setting SCTLR_EL2. The reason being
From ARM DDI 0487K.a D23-7349:
"Direct writes to these registers (includes SCTLR_EL2) are not allowed to affect
any instructions appearing in program order before the direct write."
So, we don't need a synchronization barrier before writing to SCTLR_EL2.
Further, we do have synchronization barriers after writing the MPU region
registers (which happens before we read SCTLR_EL2). So, SCTLR_EL2 is written
after the MPU registers are synchronized. And, thus adding a 'isb' to flush the
instruction pipeline ensures that the subsequent instructions are fetched after
the MPU has been enabled.

2. Saved and restored lr in enable_boot_cpu_mm().

v4 - 1. Moved the definition of SCTLR_ELx_BR from sysregs.h from head.S. The
reason being sysregs.h does not exist any longer (refer to previous patch for
details) and SCTLR_ELx_BR is used in head.S only.
(I have preserved the R-b abd A-b, let me know if that is ok).

 xen/arch/arm/arm64/mpu/head.S | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 37e4b455bb..a449aeca67 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -5,6 +5,9 @@
 
 #include <asm/arm64/mpu.h>
 
+/* Backgroud region enable/disable */
+#define SCTLR_ELx_BR    BIT(17, UL)
+
 #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
 #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
@@ -69,6 +72,29 @@ FUNC_LOCAL(fail_insufficient_regions)
     b   1b
 END(fail_insufficient_regions)
 
+/*
+ * Enable EL2 MPU and data cache
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch64 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers x0
+ *
+ */
+FUNC_LOCAL(enable_mpu)
+    mrs   x0, SCTLR_EL2
+    bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
+    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
+    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
+    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
+    msr   SCTLR_EL2, x0
+    isb
+
+    ret
+END(enable_mpu)
+
 /*
  * Maps the various sections of Xen (described in xen.lds.S) as different MPU
  * regions.
@@ -111,6 +137,7 @@ FUNC(enable_boot_cpu_mm)
     ldr   x2, =__bss_end
     prepare_xen_region x0, x1, x2, x3, x4, x5
 
+    b    enable_mpu
     ret
 END(enable_boot_cpu_mm)
 
-- 
2.25.1


