Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559214C8BCD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281334.479638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1nz-0006Bu-Dp; Tue, 01 Mar 2022 12:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281334.479638; Tue, 01 Mar 2022 12:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1nz-00068i-8q; Tue, 01 Mar 2022 12:40:39 +0000
Received: by outflank-mailman (input) for mailman id 281334;
 Tue, 01 Mar 2022 12:40:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kl2V=TM=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nP1nx-0005sl-8S
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:40:37 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e89::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9aa9b9b-995c-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 13:40:35 +0100 (CET)
Received: from SN2PR01CA0023.prod.exchangelabs.com (2603:10b6:804:2::33) by
 MN2PR02MB5789.namprd02.prod.outlook.com (2603:10b6:208:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 12:40:30 +0000
Received: from SN1NAM02FT0008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::8c) by SN2PR01CA0023.outlook.office365.com
 (2603:10b6:804:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Tue, 1 Mar 2022 12:40:30 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0008.mail.protection.outlook.com (10.97.5.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 12:40:29 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 1 Mar 2022 12:40:28 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 1 Mar 2022 12:40:28 +0000
Received: from [10.108.8.223] (port=53852 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nP1nn-0000Ui-E4; Tue, 01 Mar 2022 12:40:27 +0000
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
X-Inumbo-ID: c9aa9b9b-995c-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWkYG6IsxD98zWO/PTntRRXAGNpiCFZ5m2MTz+NczXGmqgmzXOmb61sCiRrsx0cgTu470mGSpoOIwgubL03DW4y6u004an2sMrxbGTtjN6vpSGOGKghc5HUcPsXHjxpTlLQgR8I2z0kqepG3CaymOOKqWNNJUh2VWQLWWzaFTMEcHz3AW8sLEFqNVopN5mAYsF7IOKdXG63G9wamzEelJzjeamlHnwjxRml+4tFcb+wpnSpdlyCgRiHeXBIPxEHugnzyCENLkNXA3TMIAOAEPdEGTYzmyElqPAOc4CLl1QFUs8spwwR58a2keUWc6a82+HctRy6bFGe/jQA72QdDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8o+9YqgUrb/hZmnZVc0UJwjMZa2ok5VdKErypv1CWA=;
 b=nIs4ZL9Y50uOtuGMr2h+UDusOmyID/I2rqNPrtLrHLyXZJ96AuZUjvhfekB+YE4uZ7Ggjxzjay/Rct/nstZ2OSBI4PcACqaxKVNxg63XV5e0/nLIsqNwvY7ob3A74z42F+z2yCuTctJJVTQiPChLFdMQLSOs7r5ONU69bAQ449lxIniQwKfBrgIFKjtWZfpLgBUVwV5Tpv0b/6+8r0bHHVxZto0BWHbGQd67MLP/23HyFe1/2+IUMCyD0OhIoS7apbnzEJ+f6yAFW7vpRTgnjFUojbH7u+Qlrb7UrXGkIl2qoNVDF/7ue7dlGfvm4dX9pFqy1GIGytv2hLO4T1MS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8o+9YqgUrb/hZmnZVc0UJwjMZa2ok5VdKErypv1CWA=;
 b=AjSpIuuuitsivCu0lnB85CBTJ3YjBzlY24BA4tIHK6murMzFDZ+CP5yP3OVerAk7zSNLzeg2goZbcB1M/CCKAEHcm9ZBoL8+ofG8QZd5tHHL6N0DDPkgqgHtvogeVrzibP+7f4xfE/eqzHEgQ/w9XSmOgIlrvDkAaWuIUsxjUYk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v9 1/4] xen/arm64: Decode ldr/str post increment operations
Date: Tue, 1 Mar 2022 12:40:19 +0000
Message-ID: <20220301124022.10168-2-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220301124022.10168-1-ayankuma@xilinx.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6defbd93-9392-4130-6e1c-08d9fb80ab89
X-MS-TrafficTypeDiagnostic: MN2PR02MB5789:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB5789204D5E0342FA94A33F62B2029@MN2PR02MB5789.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uAsw3kCEpuF9xuCyCTcGTWwwTIBaae0a3G805rvbUBXsGLqDZ5BAJx2XMQrYRkt+fJxsRJ2ZEA4xv7T8pMm9+RTKwp8lqFpnLP/uxRBMldPgZ1jF3NJGa655+A5WW17Or0lJn9rCP8Sg25nyfITxioy8h0JY4sWPIuzsEfajLAMO9qNENrt6SltaCVqffBnY32Wah5nPICHZSBEBcSOKtQsokWHHxmQxZhWmDfV0KtmmFWi+hms3a817A0KjU9sFj8+eaxk11zt0ct6Jg3elSZtp9CjXRHqv0rf7X8enfzUrETGIFBx0SfH28US8FzX63EM8WN4028SZPyeBEURde3VsyOiDaLAbY0ViEN8QroWyLF4uzD6LrH3xa66qLiYkArzGOta88tlR2TBku3j+J9Rdv3s42sKZnmwBAFQHvHksI29LBXEEwZ3P57WIo203Wo5vmkDc+4bN37Daojr2quD4MeDI4vM3VoXm8Oat1m1kXm7mSUz4oS+aUgw8yunApe5MwNm1sP+3lrnxL+O848djA3DExiP2PES9hiW+tUOabNEcnYuJzpzC4p+wWNqGFdVt/pryEnINpRA/Hc70Rm/uU7z3H9tzWK3UCE78BVtmMNaPHHaa2bQp9UcMyYylsWC3n/K5mEJ6I5rxR74eN2Pw1R2Ra2YVfjV4kZ6U60ZGjOR8IyLpGgfTCZNchnbj/1qTxgMqt8sSmYy0qf5U3Q==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(26005)(54906003)(40460700003)(6916009)(6666004)(186003)(36756003)(356005)(7416002)(82310400004)(107886003)(2616005)(5660300002)(1076003)(316002)(508600001)(47076005)(7636003)(7696005)(83380400001)(2906002)(70586007)(8676002)(70206006)(336012)(426003)(8936002)(4326008)(36860700001)(9786002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 12:40:29.9276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6defbd93-9392-4130-6e1c-08d9fb80ab89
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5789

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

v9 - 1. Rebased on top of the master.
     2. Renamed psr_mode_is_32bit to regs_mode_is_32bit.

 xen/arch/arm/decode.c           | 79 ++++++++++++++++++++++++++++++++-
 xen/arch/arm/decode.h           | 48 +++++++++++++++++---
 xen/arch/arm/include/asm/mmio.h |  4 ++
 xen/arch/arm/io.c               |  2 +-
 4 files changed, 124 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 792c2e92a7..3add87e83a 100644
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
+    if ( !regs_mode_is_32bit(regs) )
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
index 1a066f9ae5..fad103bdbd 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -141,7 +141,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     {
         int rc;
 
-        rc = decode_instruction(regs, &info.dabt);
+        rc = decode_instruction(regs, &info);
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
-- 
2.17.1


