Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FF9D106F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 13:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839317.1255138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD0dJ-0007BB-M6; Mon, 18 Nov 2024 12:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839317.1255138; Mon, 18 Nov 2024 12:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD0dJ-00078k-J6; Mon, 18 Nov 2024 12:13:33 +0000
Received: by outflank-mailman (input) for mailman id 839317;
 Mon, 18 Nov 2024 12:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1K7B=SN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tD0dH-0006nk-Up
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 12:13:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2417::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 849eef51-a5a6-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 13:13:29 +0100 (CET)
Received: from DS7PR03CA0053.namprd03.prod.outlook.com (2603:10b6:5:3b5::28)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 12:13:25 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::c5) by DS7PR03CA0053.outlook.office365.com
 (2603:10b6:5:3b5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20 via Frontend
 Transport; Mon, 18 Nov 2024 12:13:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 12:13:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 06:13:23 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 18 Nov 2024 06:13:22 -0600
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
X-Inumbo-ID: 849eef51-a5a6-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjJmIiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijg0OWVlZjUxLWE1YTYtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTMyMDA5LjIzNDYzNiwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgIxYZ6oW2R1GmwX5wGwcEC2QZh+wm1f/tB/SQKUXBavUfmYLGh1WlfHQXnekzK9dHJdj23/E9BtNdHPzW0b4q9TF9YXH/xRf5OTEC/irkYvmIvbjt0GXcXDO66CjrHHSKgPXeedlqEMkfknewKwRCKipF9Mu3sngygtec3iXfL0eIMPwiZSHoTSeF0VzatHX5kktoZFCdNmcByO0iVm9cla4zN6vk9nHsjhsYQTX6bjJ3O56FqMp3wPeWpztgeR34bN28MXwMRHh3Am6kLyyPIYVEcNeEorSIFWwBYsmVofvack2xEpKC6u4KMJwF60Qm1G9TZ4UKs/nwB8YeD70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pf5rKI3RCPGFn3GWmPsWPEZ7LwVUj9QdIKHlVuEvfDQ=;
 b=w4Dx2mclJNo77LhujtR/xrj6pikK3NtMMFm+0mEAMf+u6t3UuEroOYAtxUuGqbIfPk5SCU8iH553UJP+MIm1gaf6p599/I0wAG14+lXC1okzoatjByGk/6NOrNAspQz9Ysid4+ed5v3yhXFav4Z067EUSPcVs1nxxCYgw2Nmh5NnCWiITACAbah+0R1n/5+YMmN7WPBdFUxnlxTM7LaNSHPyke37FFVZLmveybQAOKnWhLkB0wXUCNDNyn7fncEf9w5oqppQ8C35wr2REPm1Kzd6S2VfGeEes/5dpepzWZmhB0JMAYye2mmzsA9yDVpK7sXIWdlm2sOotfB/nJ1EWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.12) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf5rKI3RCPGFn3GWmPsWPEZ7LwVUj9QdIKHlVuEvfDQ=;
 b=bGuwEd6N0+Fw1lt88r6XI2et6BuWcXmbbFLq1T9Ag6eMDa3UHWS/iuBaHgqG/FijLinVm4KC0RkZYPtQimg63ixlvEtvLv9wXXXXQup42cymtmNxT2hHi9/3xGyulJnMDbC0r1By5vIMwN6954Nh4LavAtEJZH7R8SkjG5ljbHE=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.12) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.12 as permitted sender)
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 2/3] xen/arm: mpu: Enable MPU
Date: Mon, 18 Nov 2024 12:12:49 +0000
Message-ID: <20241118121250.4027441-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
References: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b904da-e4f7-4005-4c43-08dd07ca66d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?siOztfXVwhd2dAmEfNf19u0hWVCeQI0O3dB2g7a4pmdfKka5qPaYXj7m688V?=
 =?us-ascii?Q?+YlsSFuzHpnrrX4xfDrr8V+HGTle+o+CVHWeMJJ/a6BJvgUQ4fQE48uq78sA?=
 =?us-ascii?Q?ghdDtiyHK3KCXWkwFSAACLjwyR4VxXF70jgropeEfJD0r7CE20Hcch3NnNrI?=
 =?us-ascii?Q?XMCLEfx8M1c+1NpLPqqvoTaucdKBwq74ibhD/Xz1HTeq2UC++qQNRn/O2X++?=
 =?us-ascii?Q?fDM9Q5w8JElfG9tjQZmfY33XLNYN/Kh7ZwbbSmlID6gRajqRbeMH2PV17Lk7?=
 =?us-ascii?Q?o51jcAdXQMhUgh5weyeOtXW5j6GuCJ7prbgrTD+kFINvLUL9XzonPi5OLMIm?=
 =?us-ascii?Q?QtHCyMdLtt+kdV5pVvaoMKUumChrcGQClvrsk/zYnhl2T3da7PJMeut24xP1?=
 =?us-ascii?Q?XBGJAQPs79nQxonqPNR/v2ornwHNxDcvPdAsvsi87U8aONVV+fH0I0KCN1Dn?=
 =?us-ascii?Q?20UC7hmchOia6gj9O0XChKfgS2ijaRbJSYvYsE9798o9IbrruNuQ7nw6yWXu?=
 =?us-ascii?Q?YkRsFJuOLoCDsse9jZjBwP7Rxkcx6dPegxrzxFVzIdheRZIlgj4J6JIiwrRq?=
 =?us-ascii?Q?7vaSaI/glE41YjFBhAl3h7VTfyQqKtLdYpIg9eAUmXzjTsk61py9LOm45hNX?=
 =?us-ascii?Q?PvZ/un8Gvv3wQB6lIFh3qyYCE2PlzsmWMQemBWpl+F+UYXeZBpnwFW6uQcZw?=
 =?us-ascii?Q?IVbkg3c3S/x0qn9p5fpraXJfzOvK6gi4QbkqNn/PkjGEL21YihiAwSGW04Cq?=
 =?us-ascii?Q?HpWpM4fCNcTI7q1y+qE0YFWH7nOYLcpW1xgGrt11E1SRhvR46x3OGmmUsE7F?=
 =?us-ascii?Q?4G03II9KvVJZB9B+WvsOAiDh99lJ4kENCsL65WHhTSB0DgnW97bV2gH5xYv+?=
 =?us-ascii?Q?dZOaqHSHI3D2CXKxPUiM7ZM1Lq1zIL69+4PoP9VVmgCBn3TaLl9RweicIulz?=
 =?us-ascii?Q?dfOYgWsYg59upwjR/zA6hjIgO97TtACwEiIyyZ+GPl0pCBZox0wKgYFqzvhA?=
 =?us-ascii?Q?qQHH689DlbkHg31GBwsOjY6wfoDxgVcyBzVzN9S9dJRT+QYSeqA/zolDrH+I?=
 =?us-ascii?Q?/ZURPFZxiYb2rdRW0akHrcSWU1kO79HRxwnA9bA0CVAHx4GNplzG8gqHgDxo?=
 =?us-ascii?Q?zoFncrEJrMMrNta7X8BaC4U+mxczIBHq0cL5L2n1JX3PkUz/QKuL80GQwwvL?=
 =?us-ascii?Q?0nhTi84dn+InhrynS0LuN8K/1mFCVF5eGFV0sjNd0Q9xSyLZdLJMjdf5aXk3?=
 =?us-ascii?Q?9bz7tH40iAJUXGTiIex+ZbGZW9KZ4zuhzwe8g6sc2gBL9PaxObUodhcatbS0?=
 =?us-ascii?Q?GDHE9eI38zVPeVPw1YBg+A4pJSvAOIsH8UuzBS8DdMdVP3JwYzrmGS43PqFD?=
 =?us-ascii?Q?vvrtZXm8oXaRVpyuOOtZLHLVD+F3GbSVU1/W8lDHkOKVsqavBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 12:13:24.5387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b904da-e4f7-4005-4c43-08dd07ca66d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587

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

v5 - 1. No changes.

 xen/arch/arm/arm64/mpu/head.S | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 1ab65e8ebb..c56c693cc2 100644
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
@@ -73,6 +76,29 @@ FUNC_LOCAL(fail_insufficient_regions)
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
@@ -112,6 +138,7 @@ FUNC(enable_boot_cpu_mm)
     ldr   x2, =__bss_end
     prepare_xen_region x0, x1, x2, x3, x4, x5
 
+    b    enable_mpu
     ret
 END(enable_boot_cpu_mm)
 
-- 
2.25.1


