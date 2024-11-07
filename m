Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9C9C0992
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831922.1247304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t944R-0007Qq-VE; Thu, 07 Nov 2024 15:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831922.1247304; Thu, 07 Nov 2024 15:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t944R-0007OF-Rl; Thu, 07 Nov 2024 15:05:15 +0000
Received: by outflank-mailman (input) for mailman id 831922;
 Thu, 07 Nov 2024 15:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shok=SC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t944Q-0007O4-FV
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:05:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2009::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae30684d-9d19-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 16:05:10 +0100 (CET)
Received: from BN0PR10CA0010.namprd10.prod.outlook.com (2603:10b6:408:143::14)
 by PH7PR12MB5655.namprd12.prod.outlook.com (2603:10b6:510:138::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 15:05:04 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::c3) by BN0PR10CA0010.outlook.office365.com
 (2603:10b6:408:143::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 15:05:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 15:05:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 09:05:02 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 7 Nov 2024 09:05:01 -0600
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
X-Inumbo-ID: ae30684d-9d19-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjExIiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImFlMzA2ODRkLTlkMTktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTkxOTEwLjYxMTc0MSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DME6xoVjRXZlvstwq4Zrhxo16w7gPKrHXVheuHarjcXxpaealqr3nptwT8DVDwrPQaZsGcHOV8XfMDl4+K3etxz6OCaD/MlLZZL+i+GfOeloAlMF44GcqjpDM8OfeiBNzpOhY1TbzixEhPUCOMteLe1hFl6rwCeeX/+tki3jWq5rbLGDfcb5/0rCtaeyVGNvGOH+hikl6eboDZGKul32Un4YzwSXUnpLafdQNG0Nz7tq0ftTkiAb9CCLtgWzM5tErBEnqYcaKOz6toUHySC/1i0KPk0h4DNZCcNeLgcG4uokopwJejGTe7EATDJ1IL/Nmgs8QAAz6HPg/XtKOAuUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65rTsyDXUybu7MXHbDYZzPLCUNdM5/rzSPP6wjr9au8=;
 b=inmt3LozASUdzCQDo0JB8YUfCI3OEybTe/heJfmf7nDsxAjWGop6NNFidluGKXfWmmvwq+d8Ko78869MT74X+i3gXrdxkkpSzLA5quwTFSHi7wPOAJTtHDFxZp3XyEKk51i4/6yQ2znqShj6Uy4QrxonHwK8bGLSAIKApW+mlfrojnJTeS3+dvYsUsCpHVWldExWz6T0tTKFbyYF04jaf82LpZ18kzZPxiJqd4UMrB6B6xp3FjszQVfiHKaXVdp5ghMAJ8lt/RweyJltBDqXwRo0xnuVwniOZ+EO7XWU26UIc9Rpg2JELSc18zRJr+Ykr5bxfm6S51fyCEh8Wbqj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65rTsyDXUybu7MXHbDYZzPLCUNdM5/rzSPP6wjr9au8=;
 b=Cf7krAZ6FFTbjlL6QIInnim1y0tfcZRwL1OhIbEN2IOa58XWnJdGHo5HYbrzNrdQA0RLx8JrewZUk4yHUVSiCUHgwZTvLI2JyI/pR/L7J5QIvbjeVghbJtNvVqU6UiChQguiBR4HaK8MuA5qWrioHi6UQpKv6cuiGffHicgLl9g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 1/3] xen/arm: mpu: Create boot-time MPU protection regions
Date: Thu, 7 Nov 2024 15:03:28 +0000
Message-ID: <20241107150330.181143-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
References: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH7PR12MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e489901-b447-40fe-fe72-08dcff3d8f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DZcSaOariQJuiwEVdVJjFrytsE5IITo5MjPaXJ07oD/W+ahX2kquNSr9C26L?=
 =?us-ascii?Q?G58N6B78HmBn7du/p64/SItid9E5hHL7vuf39Z2Y1uR+ognDHkphUJrQ8pUn?=
 =?us-ascii?Q?j5koB0jxb5Y5Qkg5j4/qkaLq6HqK2D+oJWLVX+AG9dP0GWwOg2QEMTwILaUM?=
 =?us-ascii?Q?BGUy5gsEdGm9QOZGSyy5zfvr5Gz3j6vdglTXoM2eEUMl+LZSAkjYj62bFI9s?=
 =?us-ascii?Q?seNYVIWDIivXvVazPCYpC762yEZAdMbuLG48uBMdnJMpNxjkACAYVqK1rq34?=
 =?us-ascii?Q?GkZyplQTC4V7V9pJI5k2D07MpaUb8L5wE/kCLCae2PcLcxUc7ZWFG6FB7Efc?=
 =?us-ascii?Q?DBcLOCqpI7IBRisAURqXXy9++ajgIytYVOu89nzhD8B9kVa7UcE2/PS3J7w4?=
 =?us-ascii?Q?0bsC/kQGp1if7pQfPec8fVQVOUjmnYGjZOdiNf69k3ZlU0/2aZJaPMC2VI/6?=
 =?us-ascii?Q?lIqSGOyjPX1CUCKHBWxm7XPAtP5NbZS5ZbVwJCxFE3JKNy8rdYKnW2JNXEjq?=
 =?us-ascii?Q?lYoMIqnAO5jRDzqYKIxdMvQxekm6RoWICecwFWlqKHayl9TB8Bw6XIEqAmD8?=
 =?us-ascii?Q?dO0GYrUE0G2hMO60ytMpT17ogIahpHjGciUCp6bnjKUOCc6ixjy2IWnoFKam?=
 =?us-ascii?Q?uktrrO+CHK1bN57X/R9z9vTj3Xu6A73Y/25rOS8yh57OBNefu/8csZpYzcj/?=
 =?us-ascii?Q?oqPTg8rAySiShXdDnaFbtwB2tSVP5Qj/Ba3lgFT2XRkFY0rUAlzjdZaaghqm?=
 =?us-ascii?Q?1vgDPoMSB5tfUyLXOrtpAhplbvOLieMzEtKsPy81RWNE0Bug+/f05grpmKgs?=
 =?us-ascii?Q?iOtqkXTCa5H1Hv6c18bHedFfsuZ7zeWNZ7WkwqRjMtH8stL8TI/zyKn9jXCf?=
 =?us-ascii?Q?K3Z7yMvCGk/akXuGVbfFqsyxXvB3gqjrXgcR8Ij3Xz8SbB/RhZ7IgXnygMyE?=
 =?us-ascii?Q?sgJi0+OgyNEL8pP5nj/K2g29x+JxZirhvIKofBsLx6mDLk8eLah/wfSL5x43?=
 =?us-ascii?Q?13kkdmHlEdPzdSMVocQtjCaheAdLxVKtuN5QaLE+fYu9NgTCdxB7Hj7NEb3V?=
 =?us-ascii?Q?r1BXrnBNt2UsRmWtJV02APM/2DkydIGyfkvcPEizFByjVsKGRfTCx5aHdG11?=
 =?us-ascii?Q?hedvG9CkNle+WO44Gq551Wn3lLLLMpPQ5HD9j3mQ7lWB1vVlONHCkR70LlFg?=
 =?us-ascii?Q?08f/yAnnvEX6uxJnk82wIMdh3ud9RnH/VDgAvMd01scGgaBcWuEQmiprBMDf?=
 =?us-ascii?Q?nU4yFAEfjjfmnp5tbMs0779wNqu9ZDsWfi2yUIpHllDSYxvpVvHtq333dgLW?=
 =?us-ascii?Q?r2sKdwqpzyUQ3yBOVSQwAib697H+cSARxeyXS506PiFmLoGrT6fLtm/zyz1b?=
 =?us-ascii?Q?/fHI3QKW4TsO1YBbCHJDJ/+19tN94S4AtbWtEGyLWQj4UDj6BA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 15:05:04.0369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e489901-b447-40fe-fe72-08dcff3d8f3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5655

Define enable_boot_cpu_mm() for the Armv8-R AArch64.

Like boot-time page table in MMU system, we need a boot-time MPU protection
region configuration in MPU system so Xen can fetch code and data from normal
memory.

To do this, Xen maps the following sections of the binary as separate regions
(with permissions) :-
1. Text (Read only at EL2, execution is permitted)
2. RO data (Read only at EL2)
3. RO after init data and RW data (Read/Write at EL2)
4. Init Text (Read only at EL2, execution is permitted)
5. Init data and BSS (Read/Write at EL2)

Before creating a region, we check if the count exceeds the number defined in
MPUIR_EL2. If so, then the boot fails.

Also we check if the region is empty or not. IOW, if the start and end address
are same, we skip mapping the region.

To map a region, Xen uses the PRBAR_EL2, PRLAR_EL2 and PRSELR_EL2 registers.
One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
Registers", to get the definitions of these registers. Also, refer to G1.2
"Accessing MPU memory region registers", the following

```
The MPU provides two register interfaces to program the MPU regions:
- Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
PRLAR<n>_ELx.
```

We use the above mechanism to create the MPU memory regions.

Also, the compiler needs the flag ("-march=armv8-r") in order to build Xen for
Armv8-R AArch64 MPU based systems. There will be no need for us to explicitly
define MPU specific registers.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Fix some of the coding style issues.
2. Reword the help message.
3. Updat the commit message.

v2 - Add clarification for the use of page and page size.

v3 - 1. Add a new file arm64/mpu/mm.c to contain the build assertion for page
size.
2. Enclosed the check for the start address within "#ifdef CONFIG_MPU".

v4 - 1. Increment the region selector in prepare_xen_region
2. Ensure that the first 8 bits of MPUIR_EL2 are read, to determine the maximum
number of supported regions.
3. Remove the inclusion of mm.h. *MPU_REGION* macros have been moved from mm.h
to mpu.h. The reason being mm.h cannot be included in an assembly file.
4. Add the build flags for "Armv8-R AArch64 MPU". As a result, we don't need
to define MPU registers. So, removed
xen/arch/arm/include/asm/arm64/mpu/sysregs.h.

 xen/arch/arm/arch.mk                 |   4 +
 xen/arch/arm/arm64/mpu/Makefile      |   1 +
 xen/arch/arm/arm64/mpu/head.S        | 122 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu.h |  25 ++++++
 xen/arch/arm/include/asm/mm.h        |   2 +-
 xen/arch/arm/xen.lds.S               |   1 +
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h

diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 022dcda192..9c4bedfb3b 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -9,7 +9,11 @@ CFLAGS-$(CONFIG_ARM_32) += -msoft-float
 CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-a15
 CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access
 
+ifeq ($(CONFIG_MPU),y)
+CFLAGS-$(CONFIG_ARM_64) += -march=armv8-r
+else
 CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
+endif
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
 $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
 
diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
index b18cec4836..a8a750a3d0 100644
--- a/xen/arch/arm/arm64/mpu/Makefile
+++ b/xen/arch/arm/arm64/mpu/Makefile
@@ -1 +1,2 @@
+obj-y += head.o
 obj-y += mm.o
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
new file mode 100644
index 0000000000..37e4b455bb
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/arm64/mpu.h>
+
+#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
+#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
+#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+
+#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+
+/*
+ * Macro to prepare and set a EL2 MPU memory region.
+ * We will also create an according MPU memory region entry, which
+ * is a structure of pr_t,  in table \prmap.
+ *
+ * Inputs:
+ * sel:         region selector
+ * base:        reg storing base address (should be page-aligned)
+ * limit:       reg storing limit address
+ * prbar:       store computed PRBAR_EL2 value
+ * prlar:       store computed PRLAR_EL2 value
+ * maxcount:    maximum number of EL2 regions supported
+ * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_DATA_PRBAR
+ * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_NORMAL_PRLAR
+ */
+.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
+    /* Check if the region is empty */
+    cmp   \base, \limit
+    beq   1f
+
+    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
+    cmp   \sel, \maxcount
+    bge   fail_insufficient_regions
+
+    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
+    and   \base, \base, #MPU_REGION_MASK
+    mov   \prbar, #\attr_prbar
+    orr   \prbar, \prbar, \base
+
+    /* Limit address should be inclusive */
+    sub   \limit, \limit, #1
+    and   \limit, \limit, #MPU_REGION_MASK
+    mov   \prlar, #\attr_prlar
+    orr   \prlar, \prlar, \limit
+
+    msr   PRSELR_EL2, \sel
+    isb
+    msr   PRBAR_EL2, \prbar
+    msr   PRLAR_EL2, \prlar
+    dsb   sy
+    isb
+
+    add   \sel, \sel, #1
+
+1:
+.endm
+
+/*
+ * Failure caused due to insufficient MPU regions.
+ */
+FUNC_LOCAL(fail_insufficient_regions)
+    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
+1:  wfe
+    b   1b
+END(fail_insufficient_regions)
+
+/*
+ * Maps the various sections of Xen (described in xen.lds.S) as different MPU
+ * regions.
+ *
+ * Inputs:
+ *   lr : Address to return to.
+ *
+ * Clobbers x0 - x5
+ *
+ */
+FUNC(enable_boot_cpu_mm)
+    /* Get the number of regions specified in MPUIR_EL2 */
+    mrs   x5, MPUIR_EL2
+    and   x5, x5, #NUM_MPU_REGIONS_MASK
+
+    /* x0: region sel */
+    mov   x0, xzr
+    /* Xen text section. */
+    ldr   x1, =_stext
+    ldr   x2, =_etext
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen read-only data section. */
+    ldr   x1, =_srodata
+    ldr   x2, =_erodata
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
+
+    /* Xen read-only after init and data section. (RW data) */
+    ldr   x1, =__ro_after_init_start
+    ldr   x2, =__init_begin
+    prepare_xen_region x0, x1, x2, x3, x4, x5
+
+    /* Xen code section. */
+    ldr   x1, =__init_begin
+    ldr   x2, =__init_data_begin
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen data and BSS section. */
+    ldr   x1, =__init_data_begin
+    ldr   x2, =__bss_end
+    prepare_xen_region x0, x1, x2, x3, x4, x5
+
+    ret
+END(enable_boot_cpu_mm)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
new file mode 100644
index 0000000000..f8a029f1a1
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * mpu.h: Arm Memory Protection Unit definitions.
+ */
+
+#ifndef __ARM64_MPU_H__
+#define __ARM64_MPU_H__
+
+#define MPU_REGION_SHIFT  6
+#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
+#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
+
+#define NUM_MPU_REGIONS_SHIFT   8
+#define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
+#define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
+#endif /* __ARM64_MPU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 5abd4b0d1c..59b774b7b8 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -16,7 +16,7 @@
 
 #if defined(CONFIG_MMU)
 # include <asm/mmu/mm.h>
-#else
+#elif !defined(CONFIG_MPU)
 # error "Unknown memory management layout"
 #endif
 
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index d1e579e8a8..bbccff1a03 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -147,6 +147,7 @@ SECTIONS
        *(.altinstr_replacement)
   } :text
   . = ALIGN(PAGE_SIZE);
+  __init_data_begin = .;
   .init.data : {
        *(.init.rodata)
        *(.init.rodata.*)
-- 
2.25.1


