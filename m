Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9593D4B38B0
	for <lists+xen-devel@lfdr.de>; Sun, 13 Feb 2022 00:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270874.465221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJ1uo-0001ml-Nt; Sat, 12 Feb 2022 23:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270874.465221; Sat, 12 Feb 2022 23:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJ1uo-0001k0-Jl; Sat, 12 Feb 2022 23:34:54 +0000
Received: by outflank-mailman (input) for mailman id 270874;
 Sat, 12 Feb 2022 23:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0Ww=S3=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nJ1un-0001U4-Jj
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 23:34:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe59::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f6668da-8c5c-11ec-8eb8-a37418f5ba1a;
 Sun, 13 Feb 2022 00:34:52 +0100 (CET)
Received: from SN4PR0401CA0039.namprd04.prod.outlook.com
 (2603:10b6:803:2a::25) by BL0PR02MB4580.namprd02.prod.outlook.com
 (2603:10b6:208:40::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Sat, 12 Feb
 2022 23:34:47 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::39) by SN4PR0401CA0039.outlook.office365.com
 (2603:10b6:803:2a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14 via Frontend
 Transport; Sat, 12 Feb 2022 23:34:46 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Sat, 12 Feb 2022 23:34:46 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 12 Feb 2022 23:34:44 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 12 Feb 2022 23:34:44 +0000
Received: from [10.108.8.223] (port=57002 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nJ1ue-0006SM-OS; Sat, 12 Feb 2022 23:34:44 +0000
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
X-Inumbo-ID: 5f6668da-8c5c-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6lSejk360ZSRTP207x2kJsCPXRZa6RYXDQJcQ0EaT0GG7Zx1BNXhE1sXVgqq9VOwbhGKnE5BmR3eMEB0YVLifJ+/+KFL8erVqgXaTiDQZq2M3W0WU2KV778BVD9odQepzj42Aq+3d3+V/DnnFqCThyCD/A5cvSX7NVuz2EJT4RurM1YMOs3l6FPHmPrOXbTYE047n3Sigu5dnKk/WwKpJXLL5xnqrkVEystfYXYRrYgxDoVXNFsF0gnS7yb9Cv0qzSDIW6UkWACiFy8Cokt7lm20NrpODpc6B1/TB0AO52O8tyqfB/Oa0IrRi3RFJsHi0sMHiDTnhNnz+GMYvo3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HT5IRRBRqCfZCmtaXFR4rjZP12Su6d9eB8IzF3Ul0o=;
 b=F1L35XKchQJ+B7XfRoFxW+vMmq4WH5YxmqiyB2ji/ui3iCX26Hfksm1XsjG00qRa4gfe2JykolsU9ST8aPPh6XjhI6Zx0ixCt0v6pCG5L8UPVdD6yrdR6ttwBYgiumjqeMAyWQnZi4ZNh2ov0HOj9GpPfgXjkProc/nWdGIJMb1UbSxzGXTkChtiVjAkDMCadOKgrmHbtAGqebze7RGdIuJY+TVpsXucNE0XP8PpLV7HHlzweHBpKlJbWIiVBQsEa0B/6CKsLemQZz17xRBleRJZr7WpV9AX5am07Dgrn4jRkPVMNBjgB2qv8gX1UOaFBJo/hFZ3Cx1akITR89L+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HT5IRRBRqCfZCmtaXFR4rjZP12Su6d9eB8IzF3Ul0o=;
 b=T6HNiH3Y58wxs1b/6ckP8q9crNw4XwtpvMdj9K6eQ7o0UhhKb82GAyaObukQV/r5VgWuhMn0b4CKWeiAyVRUa1bEDyTOx4wAx5LfgXULb61nyAoKO9OoDYpVno/nUIZR+K7wqRXtD+wRBpzDbK5VbP4qUm9Nhzl8PC/xiUDP5IY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v8 1/2] xen/arm64: Decode ldr/str post increment operations
Date: Sat, 12 Feb 2022 23:34:32 +0000
Message-ID: <20220212233433.46018-2-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220212233433.46018-1-ayankuma@xilinx.com>
References: <20220212233433.46018-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5720377c-b70b-4657-a1b4-08d9ee804110
X-MS-TrafficTypeDiagnostic: BL0PR02MB4580:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR02MB458057193C2E5C3F3498BB15B2319@BL0PR02MB4580.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sg9SZVG3dUGhgOiRX2Dp1djwdXLh0vHlodUDIjH4HS0FczZhO1RAhIzVT2N8mztM7xZEd+h5bpWDRtWdmT5WhDkV8S19RXS2UhqyOQp2RF3zQjHzNx5Y+jFfYcdeXLq1R0gVZy9TedB/megMWuLFc6hyiD2obljIkEZtCRaWfPoDufaBHDAwFvQSWoNJ9hGa4yfTBDklI6TIZ0gNXD/SgPcx56P6gSKuppHtxeey5MQwWUUCxO2EmZNogAh67Mv047BDdrYDc2SbvtM/KigN7A23POQme9CY1FWcTb6rpLez7zwJLCduc0uR/3CffV5rCOc5OdsZ2Ibg7Z4GQsiqavY/gpVWGxuY8j7McC+Fp7BQDnQC8Q5yN9NttcZPmE3E8+TLsaXxTZEDq3RIaJDInkW4+b/KyYT2SyITzotcRVeDlAQDoxtz8TmRN7LDebfXbxb2SuJCxo9THyThFxdQp7TejKIxtQv1JpcqRfpunz0e6a+cMr64UEISPt0JiVze1RWinaRHCBM8pOdlLbKPc1BZfSzF64GHlD1VSORrcUzhxI+L3WahrlesgyKCvvV6DP8KtIR9KmV5rplYS0J+q7D0mrjmSBgrEjbcjkdA/TozGdINnBoc4k7b1F5rKtH6TgfdMTWtyGFG/FzX71s0UoQRtzSsdNV480xzskTUR4yrXhyW7AdwYZmApgKlSAhm
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(5660300002)(2616005)(336012)(426003)(6666004)(83380400001)(8936002)(9786002)(1076003)(107886003)(508600001)(36756003)(186003)(26005)(7696005)(2906002)(36860700001)(4326008)(6916009)(82310400004)(47076005)(54906003)(316002)(356005)(70586007)(8676002)(70206006)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2022 23:34:46.1813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5720377c-b70b-4657-a1b4-08d9ee804110
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4580

At the moment, Xen does not decode any of the arm64 instructions. This
means that when hsr_dabt.isv == 0, Xen cannot handle those instructions.
This will lead to Xen to abort the guests (from which those instructions
originate).

With this patch, Xen is able to decode ldr/str post indexing instructions.
These are a subset of instructions for which hsr_dabt.isv == 0.

The following instructions are now supported by Xen :-
1.      ldr     x2,    [x1],    #8
2.      ldr     w2,    [x1],    #-4
3.      ldr     x2,    [x1],    #-8
4.      ldr     w2,    [x1],    #4
5.      ldrh    w2,    [x1],    #2
6.      ldrb    w2,    [x1],    #1
7.      str     x2,    [x1],    #8
8.      str     w2,    [x1],    #-4
9.      strh    w2,    [x1],    #2
10.     strb    w2,    [x1],    #1

In the subsequent patch, decode_arm64() will get invoked when
hsr_dabt.isv == 0.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-

v2..v5 - Mentioned in the cover letter.

v6 - 1. Fixed the code style issues as mentioned in v5.

v7 - No change.

v8 - 1. Removed some un-necessary header files inclusion.
     2. Some style changes pointed out in v7.

 xen/arch/arm/decode.c           | 79 ++++++++++++++++++++++++++++++++-
 xen/arch/arm/decode.h           | 48 +++++++++++++++++---
 xen/arch/arm/include/asm/mmio.h |  4 ++
 xen/arch/arm/io.c               |  2 +-
 4 files changed, 124 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 792c2e92a7..3c3cd703e0 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -84,6 +84,78 @@ bad_thumb2:
     return 1;
 }
 
+static int decode_arm64(register_t pc, mmio_info_t *info)
+{
+    union instr opcode = {0};
+    struct hsr_dabt *dabt = &info->dabt;
+    struct instr_details *dabt_instr = &info->dabt_instr;
+
+    if ( raw_copy_from_guest(&opcode.value, (void * __user)pc, sizeof (opcode)) )
+    {
+        gprintk(XENLOG_ERR, "Could not copy the instruction from PC\n");
+        return 1;
+    }
+
+    /*
+     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
+     * "Shared decode for all encodings" (under ldr immediate)
+     * If n == t && n != 31, then the return value is implementation defined
+     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
+     * this. This holds true for ldrb/ldrh immediate as well.
+     *
+     * Also refer, Page - C6-1384, the above described behaviour is same for
+     * str immediate. This holds true for strb/strh immediate as well
+     */
+    if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
+    {
+        gprintk(XENLOG_ERR, "Rn should not be equal to Rt except for r31\n");
+        goto bad_loadstore;
+    }
+
+    /* First, let's check for the fixed values */
+    if ( (opcode.value & POST_INDEX_FIXED_MASK) != POST_INDEX_FIXED_VALUE )
+    {
+        gprintk(XENLOG_ERR,
+                "Decoding instruction 0x%x is not supported\n", opcode.value);
+        goto bad_loadstore;
+    }
+
+    if ( opcode.ldr_str.v != 0 )
+    {
+        gprintk(XENLOG_ERR,
+                "ldr/str post indexing for vector types are not supported\n");
+        goto bad_loadstore;
+    }
+
+    /* Check for STR (immediate) */
+    if ( opcode.ldr_str.opc == 0 )
+        dabt->write = 1;
+    /* Check for LDR (immediate) */
+    else if ( opcode.ldr_str.opc == 1 )
+        dabt->write = 0;
+    else
+    {
+        gprintk(XENLOG_ERR,
+                "Decoding ldr/str post indexing is not supported for this variant\n");
+        goto bad_loadstore;
+    }
+
+    gprintk(XENLOG_INFO,
+            "opcode->ldr_str.rt = 0x%x, opcode->ldr_str.size = 0x%x, opcode->ldr_str.imm9 = %d\n",
+            opcode.ldr_str.rt, opcode.ldr_str.size, opcode.ldr_str.imm9);
+
+    update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
+
+    dabt_instr->rn = opcode.ldr_str.rn;
+    dabt_instr->imm9 = opcode.ldr_str.imm9;
+
+    return 0;
+
+ bad_loadstore:
+    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", opcode.value);
+    return 1;
+}
+
 static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
 {
     uint16_t instr;
@@ -150,10 +222,13 @@ bad_thumb:
     return 1;
 }
 
-int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
+int decode_instruction(const struct cpu_user_regs *regs, mmio_info_t *info)
 {
     if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
-        return decode_thumb(regs->pc, dabt);
+        return decode_thumb(regs->pc, &info->dabt);
+
+    if ( !psr_mode_is_32bit(regs) )
+        return decode_arm64(regs->pc, info);
 
     /* TODO: Handle ARM instruction */
     gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 4613763bdb..13db8ac968 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -23,19 +23,55 @@
 #include <asm/regs.h>
 #include <asm/processor.h>
 
-/**
+/*
+ * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
+ * Page 318 specifies the following bit pattern for
+ * "load/store register (immediate post-indexed)".
+ *
+ * 31 30 29  27 26 25  23   21 20              11   9         4       0
+ * ___________________________________________________________________
+ * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
+ * |____|______|__|____|____|__|_______________|____|_________|_______|
+ */
+union instr {
+    uint32_t value;
+    struct {
+        unsigned int rt:5;     /* Rt register */
+        unsigned int rn:5;     /* Rn register */
+        unsigned int fixed1:2; /* value == 01b */
+        signed int imm9:9;     /* imm9 */
+        unsigned int fixed2:1; /* value == 0b */
+        unsigned int opc:2;    /* opc */
+        unsigned int fixed3:2; /* value == 00b */
+        unsigned int v:1;      /* vector */
+        unsigned int fixed4:3; /* value == 111b */
+        unsigned int size:2;   /* size */
+    } ldr_str;
+};
+
+#define POST_INDEX_FIXED_MASK   0x3B200C00
+#define POST_INDEX_FIXED_VALUE  0x38000400
+
+/*
  * Decode an instruction from pc
- * /!\ This function is not intended to fully decode an instruction. It
- * considers that the instruction is valid.
+ * /!\ This function is intended to decode an instruction. It considers that the
+ * instruction is valid.
  *
- * This function will get:
- *  - The transfer register
+ * In case of thumb mode, this function will get:
+ *  - The transfer register (ie Rt)
  *  - Sign bit
  *  - Size
+ *
+ * In case of arm64 mode, this function will get:
+ * - The transfer register (ie Rt)
+ * - The source register (ie Rn)
+ * - Size
+ * - Immediate offset
+ * - Read or write
  */
 
 int decode_instruction(const struct cpu_user_regs *regs,
-                       struct hsr_dabt *dabt);
+                       mmio_info_t *info);
 
 #endif /* __ARCH_ARM_DECODE_H_ */
 
diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index 7ab873cb8f..3354d9c635 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -29,6 +29,10 @@
 typedef struct
 {
     struct hsr_dabt dabt;
+    struct instr_details {
+        unsigned long rn:5;
+        signed int imm9:9;
+    } dabt_instr;
     paddr_t gpa;
 } mmio_info_t;
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 729287e37c..a289d393f9 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -134,7 +134,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     {
         int rc;
 
-        rc = decode_instruction(regs, &info.dabt);
+        rc = decode_instruction(regs, &info);
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
-- 
2.17.1


