Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED53625CC7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442569.696874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrF-0007qW-55; Fri, 11 Nov 2022 14:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442569.696874; Fri, 11 Nov 2022 14:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrF-0007ni-0w; Fri, 11 Nov 2022 14:18:13 +0000
Received: by outflank-mailman (input) for mailman id 442569;
 Fri, 11 Nov 2022 14:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrC-0006iO-AT
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:10 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe59::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e8a8f8-61cb-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:18:08 +0100 (CET)
Received: from DS7PR03CA0097.namprd03.prod.outlook.com (2603:10b6:5:3b7::12)
 by LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 11 Nov
 2022 14:18:04 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::8f) by DS7PR03CA0097.outlook.office365.com
 (2603:10b6:5:3b7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:03 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:02 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 06:18:02 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:01 -0600
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
X-Inumbo-ID: a9e8a8f8-61cb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNKDI362Avd+lC5c3Zb/psgtuOKmblKmUAoa+P4Ybu30d7slGsM2Vh08ApNmw7bnT4HhkqFDDzWdEBhPC/Pxrq+AG/3WLIRkGwAaFgwIFuYA3NnKq71dI67xDF3X7sOXbvJxlJ6mcSi29xjImCFtLkPlNAhCsBfDqV51UVFPt+RPGWfRLcmbnTwpF5zC1dz5DrnbHi6B6ZpsN9zs+jsMDF/U49muvw/giEZIG7BvTBLXpApu+V2eMmnnylkchYbwkVBOVckykhe27DnkXf73J8rMHeCgLdmSisOTUTDW0wnzorgQLdXFOSSqslqcJaczQBs0Omet79/iQgPeCMSg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SAGGElGou5wa0MfGAJqr0ibpG1sOdIuxKIEF2iwXxM=;
 b=ZAHW+r7lS+N+J4B8dPqag1Dk2UMW+xDOof/Ei8Au5z7ZfuIgN00xI1nwF4hc+tiGIeED5mfUgS2MTkLXrbGEqT8b8hnYti9brr2fVx+I9XhUqKUuBAJc/IDWdNQniFpmnl0ZdCsmxxz3IpbbmEyo/Y6s9wM3J1SLIPojC4w2SrNMkr03b6upBeKKuqFhT/V6XAj4FOVcU/aGX5U9flLlO4govqpatxiFsV1qSfs+1mGXLNJe1a2OT8uuXDzE23hva8RT5Z3DoOEQOXTI5TiDg5GXXkEBq2h975VrPvXmKAf/6CQ30QTCxRhsp11aSrYyHD9cljbu5e9VIcD8hwG8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SAGGElGou5wa0MfGAJqr0ibpG1sOdIuxKIEF2iwXxM=;
 b=2ukgacSQX7mgIoNq5PeJDFOrrFQecBDRZ7Smy3Bb9FPyi7RcksXG3875lC0FIcGT8XsTLH6v8aFpyeVFFBAF5WFUZZUyl59fIaOVIo0KUvshHwBofU4Sk73/Ytx8w/qRrK26eWzWEeYC5XYeIhEC6s95zFpCVsxNTIMtE0vx4D4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v3 03/12] xen/Arm: vreg: Support vreg_reg64_* helpers on AArch32
Date: Fri, 11 Nov 2022 14:17:30 +0000
Message-ID: <20221111141739.2872-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT025:EE_|LV2PR12MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cfbe62-499d-441f-5b40-08dac3ef8bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LYU+lVrkeNW4TlYNSjmLHWbykoKFJmIPeSrOoj+GB2tc4iLJWGc0yFAJW+aHKxvYC+3un8XlDSCBHLwcnlbiq5r45bmgt0SpME2/PBZVLQVvVW8KobIYFUza6RVdVAyXWwFGx2G/1tJbDSPlzIUqbBiP5rq0Bw/PWo/IqSaPzA78gmu481Z09OqorY648gi0H9dQhU2SVYbM7g0OBE/2KAXAKLoE3ncVmfw9aQoV/Trck772t1QZoFPqj7p6TChaKoaeMPVsRGZdP6SZCF501o4sdswEoNmD2iXgnys/HWhnP3HGJL8EazaoiX6op0luX1gPfFJPtrzQBU4ewWtBSGQLEM49Ts4DEvO7zG86hHM5hCWtIPaV5G3pdycEBJywaHO8TcKrlmB6eHbWvJ/w4PJ6tdcoSV98s0JF+0SK48KeTNZEJnqHhMQDS7oAhGEqFrJU6KiCtlVJtUC/oXSIEg9qzY8p4zlDuGXBE1oUaHr6p+kjKuPYYno2Wyq8+1v4Oxw837FmlrgMIh9YLpOjDmdKHeW9J9tt5vP03McXQzuL6m+iYQwfBVKWazMGmBmrIvomWCXntgae6LYuiPhQHcIEc+ClJOW/VRi/FFpqMD0hcik9vUBkpQtym3ziGV6dDLkVZhev0lfKbyWIGZvNOxDsrqr7eK2EjazNDSBE5YzvOw/jxq0n77aopI3z6PC9RlO0konefKBEn5e4ATo21oWTCPo4TEEiUABO3O5+EpKumiWk6m1aFG6ic/V5esHUpzsq9529vrn+XfNNXp6G0PUCWdogU2ct4p/v6is8RdWyo4huxbEub+nwDGhQuYrR
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(2906002)(82740400003)(40480700001)(6666004)(36756003)(356005)(81166007)(103116003)(186003)(478600001)(83380400001)(26005)(41300700001)(316002)(54906003)(8676002)(36860700001)(6916009)(4326008)(2616005)(70206006)(40460700003)(70586007)(5660300002)(1076003)(336012)(426003)(8936002)(47076005)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:03.5787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cfbe62-499d-441f-5b40-08dac3ef8bcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750

In some situations (e.g. GICR_TYPER), the hypervior may need to emulate
64bit registers in AArch32 mode. In such situations, the hypervisor may
need to read/modify the lower or upper 32 bits of the 64 bit register.

In AArch32, 'unsigned long' is 32 bits. Thus, we cannot use it for 64 bit
registers.

While we could replace 'unsigned long' by 'uint64_t', it is not entirely clear
whether a 32-bit compiler would not allocate register for the upper 32-bit.
Therefore fold vreg_reg_* helper in the size specific one and use the
appropriate type based on the size requested.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - 1. Remove vreg_reg_extract(), vreg_reg_update(), vreg_reg_setbits() and
vreg_reg_clearbits(). Moved the implementation to  vreg_reg##sz##_*.
'mask' and 'val' is now using uint##sz##_t.

v2 - 1. Use 'unsigned int' for 'shift' variable.
2. Updated the commit message.

 xen/arch/arm/include/asm/vreg.h | 86 ++++++++-------------------------
 1 file changed, 19 insertions(+), 67 deletions(-)

diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index f26a70d024..d92450017b 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -89,106 +89,58 @@ static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr
  * The check on the size supported by the register has to be done by
  * the caller of vreg_regN_*.
  *
- * vreg_reg_* should never be called directly. Instead use the vreg_regN_*
- * according to size of the emulated register
- *
  * Note that the alignment fault will always be taken in the guest
  * (see B3.12.7 DDI0406.b).
  */
-static inline register_t vreg_reg_extract(unsigned long reg,
-                                          unsigned int offset,
-                                          enum dabt_size size)
-{
-    reg >>= 8 * offset;
-    reg &= VREG_REG_MASK(size);
-
-    return reg;
-}
-
-static inline void vreg_reg_update(unsigned long *reg, register_t val,
-                                   unsigned int offset,
-                                   enum dabt_size size)
-{
-    unsigned long mask = VREG_REG_MASK(size);
-    int shift = offset * 8;
-
-    *reg &= ~(mask << shift);
-    *reg |= ((unsigned long)val & mask) << shift;
-}
-
-static inline void vreg_reg_setbits(unsigned long *reg, register_t bits,
-                                    unsigned int offset,
-                                    enum dabt_size size)
-{
-    unsigned long mask = VREG_REG_MASK(size);
-    int shift = offset * 8;
-
-    *reg |= ((unsigned long)bits & mask) << shift;
-}
-
-static inline void vreg_reg_clearbits(unsigned long *reg, register_t bits,
-                                      unsigned int offset,
-                                      enum dabt_size size)
-{
-    unsigned long mask = VREG_REG_MASK(size);
-    int shift = offset * 8;
-
-    *reg &= ~(((unsigned long)bits & mask) << shift);
-}
 
 /* N-bit register helpers */
 #define VREG_REG_HELPERS(sz, offmask)                                   \
 static inline register_t vreg_reg##sz##_extract(uint##sz##_t reg,       \
                                                 const mmio_info_t *info)\
 {                                                                       \
-    return vreg_reg_extract(reg, info->gpa & (offmask),                 \
-                            info->dabt.size);                           \
+    unsigned int offset = info->gpa & (offmask);                        \
+                                                                        \
+    reg >>= 8 * offset;                                                 \
+    reg &= VREG_REG_MASK(info->dabt.size);                              \
+                                                                        \
+    return reg;                                                         \
 }                                                                       \
                                                                         \
 static inline void vreg_reg##sz##_update(uint##sz##_t *reg,             \
                                          register_t val,                \
                                          const mmio_info_t *info)       \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
+    unsigned int offset = info->gpa & (offmask);                        \
+    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
+    unsigned int shift = offset * 8;                                    \
                                                                         \
-    vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
-                    info->dabt.size);                                   \
-                                                                        \
-    *reg = tmp;                                                         \
+    *reg &= ~(mask << shift);                                           \
+    *reg |= ((uint##sz##_t)val & mask) << shift;                        \
 }                                                                       \
                                                                         \
 static inline void vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
                                           register_t bits,              \
                                           const mmio_info_t *info)      \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
-                                                                        \
-    vreg_reg_setbits(&tmp, bits, info->gpa & (offmask),                 \
-                     info->dabt.size);                                  \
+    unsigned int offset = info->gpa & (offmask);                        \
+    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
+    unsigned int shift = offset * 8;                                    \
                                                                         \
-    *reg = tmp;                                                         \
+    *reg |= ((uint##sz##_t)bits & mask) << shift;                       \
 }                                                                       \
                                                                         \
 static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
                                             register_t bits,            \
                                             const mmio_info_t *info)    \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
-                                                                        \
-    vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
-                       info->dabt.size);                                \
+    unsigned int offset = info->gpa & (offmask);                        \
+    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
+    unsigned int shift = offset * 8;                                    \
                                                                         \
-    *reg = tmp;                                                         \
+    *reg &= ~(((uint##sz##_t)bits & mask) << shift);                    \
 }
 
-/*
- * 64 bits registers are only supported on platform with 64-bit long.
- * This is also allow us to optimize the 32 bit case by using
- * unsigned long rather than uint64_t
- */
-#if BITS_PER_LONG == 64
 VREG_REG_HELPERS(64, 0x7);
-#endif
 VREG_REG_HELPERS(32, 0x3);
 
 #undef VREG_REG_HELPERS
-- 
2.17.1


