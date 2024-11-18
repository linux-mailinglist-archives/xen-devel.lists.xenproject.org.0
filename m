Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DA9D1070
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 13:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839316.1255129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD0dD-0006q7-EQ; Mon, 18 Nov 2024 12:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839316.1255129; Mon, 18 Nov 2024 12:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD0dD-0006o4-Aj; Mon, 18 Nov 2024 12:13:27 +0000
Received: by outflank-mailman (input) for mailman id 839316;
 Mon, 18 Nov 2024 12:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1K7B=SN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tD0dB-0006nk-Lp
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 12:13:25 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2412::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f60e820-a5a6-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 13:13:21 +0100 (CET)
Received: from DM6PR11CA0030.namprd11.prod.outlook.com (2603:10b6:5:190::43)
 by CH2PR12MB4040.namprd12.prod.outlook.com (2603:10b6:610:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 12:13:13 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::31) by DM6PR11CA0030.outlook.office365.com
 (2603:10b6:5:190::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend
 Transport; Mon, 18 Nov 2024 12:13:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 12:13:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 06:13:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 06:13:12 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 18 Nov 2024 06:13:11 -0600
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
X-Inumbo-ID: 7f60e820-a5a6-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjA4IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjdmNjBlODIwLWE1YTYtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTMyMDAxLjk3ODU4Miwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+ZFcb8EImFu1nT3r+PRJ6dv83MkvZzaQ8OzDy3Nbq8b5lammoYqHivAYpq6W3ai3nssUZdBrSozwnLpaY6z+OeSB7/XZkKd1KQCeEjrSrUaiVbCQjV62BUX59VUaC7KPEp4cnBpTXIUryeY/aBjaEC++c3hFa1AFmCMrZ3xm9sW+ZlUrI2hCbwet4kAKB1bBJ7qE91fRbGxshvcy9KgM71vQ9m4n6p4xQWc6ey7aXsWLKOVX1hhqwM3fz1PO43wyxDg6DwXQDO9ziQSd5k4VuSrn74sKeKsBOOp2i9CcVKF45R+9E0fbPwa+R39mgFAV7nR4QYyAr4gg6kxuPJFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uRGvx+KoW4EOPw2mfGTehds5bl03kdfygMMa3gQhYM=;
 b=ic5ksn5Cjz7l3nbsnwY8kHnMZ6nqJde1AzUoqLRzcIMVHsT6cVi57uZQZnEscv9fQIGrnIVnkO6aK7PRR9Nd+FGWvLdgf8rSOvFIqvnf0m6sFCSsoGsloSgI5EVVJPkQ5G8UDoeMtaaGctsqDiggoiS5kjrHuA6NmMnFJZ+4WKVZBO9JPp55GAtAm94YdGrKz0VmYk0/z6JKhhi/RVGk4vqUPkvqBgaNNfivBtCEBz0A4ic1GnYWcr9maogHmo2eSZOP8ttW6W47U1W2r++pc2TZ6RyDfD9osXZeOhkr9IGvli4VbNwV2SRYGEVZxPSFf3MG4xFZUtM6V8t5UQh3Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.12) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uRGvx+KoW4EOPw2mfGTehds5bl03kdfygMMa3gQhYM=;
 b=s4jJMfad+crOpQMjAcNepMw4N18/fxFNZmFf97rsePme1nGBiASDDI0tttgZ86MpJL8y7+l0LKNrx0YUqJm+Fh/UJ+U/LzGv80Ikr3zg56W3icOFr+62heA25Dc8b1NMgsmrCctqeaQZrgMM1wk4GuUgRNB5gcNQ/aTOBGj8YK8=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v6 1/3] xen/arm: mpu: Create boot-time MPU protection regions
Date: Mon, 18 Nov 2024 12:12:48 +0000
Message-ID: <20241118121250.4027441-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
References: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|CH2PR12MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: 25256eba-ac25-4d15-c3e0-08dd07ca6020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dQl5hbi1PjzcmmLbc0UUGP3ex50sOvZM+s/gl/gBltzf2G8DRrnbNo9OCRbD?=
 =?us-ascii?Q?S0m4u8cbJCoFjF+ryZWtv8q5oLXsFIijKJ1xbS2axSJuCkvr1ovAvQ2IpOwh?=
 =?us-ascii?Q?rNlSxT4BD3SNUJlDOWU2wXBQw/pB37GeS+KhM1VVYsdKiqbAKbVo8gZKU+Ou?=
 =?us-ascii?Q?S23SF98y6ggcVEUVXZjjUQZzEVvDAcbME3gUhruz1eaR+Tm8QYgFsDD5IjEw?=
 =?us-ascii?Q?8xP8NdG2MAUPQsoUmFTn8PdsQyRpeaWHl+c881KGiunnUq7TsjYNt9BDOT9L?=
 =?us-ascii?Q?cNgfQOBz3SfLsOSi0QZ4fCwf0cj3BLqovx0+hwOINimCpBIGi80/zdgacAvD?=
 =?us-ascii?Q?9voCHkSMbi6rHmcrdS+ASmPcLqtFdQm+N7umz4LY1UWi1moAydpBGDpr+Nav?=
 =?us-ascii?Q?xQtPrV56mdcTwD4C6Wf/+MNh/cXoLHxu7Z9TQSym0ldkB3tgxzZ1S+qLlhQY?=
 =?us-ascii?Q?c59lgBj26gGgNRiNJc4ZI+8klfjiJeEPcIr05JV8hlKOi9H5K+0JN6IFeO33?=
 =?us-ascii?Q?gqngOg+AFgPABPYPmgCqEqWHzPkEtOtZ58S3dVpa2gqiGBQZKeWLWMDLycwY?=
 =?us-ascii?Q?g+DnjWOfhI4k0U53K4vqzJIfH5urV5Z4PovBlWNFSLyENcTGqZQDl+xmJhXS?=
 =?us-ascii?Q?VvISPbqc3hElXesBNkOaeAlQe4zq8tPq5TQIjlKKWF5xE8aefcMxSRr/S/NL?=
 =?us-ascii?Q?+v+aWCTk4VkP227CkJy+C5Pf7T5SG0IVwsGy5PmtCRlPigqD4MJKx33WFpx2?=
 =?us-ascii?Q?atjCFtbY79Oes40uJHCp2iy4eQqJ/DKnaPL6WOuRBpH7sgKGXpy7w5rkQWB3?=
 =?us-ascii?Q?t/QkuvTl75lC7h3+e1mJ8/U/DocCsVQjDTclWWDl/BfLMq4Ol/Xz8X8iNarn?=
 =?us-ascii?Q?4UV7dsV719mF343GKq5pXbUNrxm7/gP0IpgyaBiz/ZSoDQI5X4usNWBPj4jC?=
 =?us-ascii?Q?H/gp/fSymZ7fDDpFcMUL7Y+JdIylWmIlvLTQMZDcHKbdBMBKFdgqiSoDVZAp?=
 =?us-ascii?Q?3zfLgr+BIi+1hz+ELP1G6DoSfzLrbot36LOVWHINkvqIBTmzVh4cMyPUYm6L?=
 =?us-ascii?Q?fAPVv5n4GoGx3p8W3qsx/2HDJT55uc9uCttqPufyBwtThftvSU1I9jrVtvwj?=
 =?us-ascii?Q?On8XgJJnQjPaB34dyg8WcFWgaawyL5CvcB1KiKrYCYDgUM9uA+LhwOdqcIbT?=
 =?us-ascii?Q?j/ONqbYy6g6GKhYZeo3VlhbgAU+4fKu+1hUR7a/9PrZ0S09OvFdOCw5wF+Cz?=
 =?us-ascii?Q?FOv134weq6LwdL09BXHWYcUJZLEhlcFHets4L31SCIyHrRiFXxkEF4B9blqt?=
 =?us-ascii?Q?QVaDiVxwgRVqc9d91EFcF43YhdxfzS11i9XA8LZbC0dFi8Bk5i17xDXZLzpB?=
 =?us-ascii?Q?pz2V2UymEecNnA3WzcZFINlnnsqWZxLTpC3RZvD5mYDXAAbjqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 12:13:13.2932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25256eba-ac25-4d15-c3e0-08dd07ca6020
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4040

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
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
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

v5 - 1. Modified the description of prepare_xen_region (added parameter details
which are clobbered and preserved, base address need not be page-aligned).
2. Modified description of enable_boot_cpu_mm (removed 'Inputs' as lr is no
longer preserved).

 xen/arch/arm/arch.mk                 |   4 +
 xen/arch/arm/arm64/mpu/Makefile      |   1 +
 xen/arch/arm/arm64/mpu/head.S        | 123 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu.h |  25 ++++++
 xen/arch/arm/include/asm/mm.h        |   2 +-
 xen/arch/arm/xen.lds.S               |   1 +
 6 files changed, 155 insertions(+), 1 deletion(-)
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
index 0000000000..1ab65e8ebb
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -0,0 +1,123 @@
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
+ * sel:         region selector
+ * base:        reg storing base address
+ * limit:       reg storing limit address
+ * prbar:       store computed PRBAR_EL2 value
+ * prlar:       store computed PRLAR_EL2 value
+ * maxcount:    maximum number of EL2 regions supported
+ * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_DATA_PRBAR
+ * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_NORMAL_PRLAR
+ *
+ * Preserves \maxcount
+ * Clobbers \sel, \base, \limit, \prbar, \prlar
+ *
+ * Note that all parameters using registers should be distinct.
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


