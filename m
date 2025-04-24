Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D0A9ADD2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 14:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966264.1356529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7vxQ-0001Vn-JA; Thu, 24 Apr 2025 12:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966264.1356529; Thu, 24 Apr 2025 12:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7vxQ-0001Sf-GC; Thu, 24 Apr 2025 12:45:36 +0000
Received: by outflank-mailman (input) for mailman id 966264;
 Thu, 24 Apr 2025 12:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7vxP-0001SZ-Nh
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 12:45:35 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:2408::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00b26c82-210a-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 14:45:30 +0200 (CEST)
Received: from MW4PR03CA0100.namprd03.prod.outlook.com (2603:10b6:303:b7::15)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 12:45:25 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::41) by MW4PR03CA0100.outlook.office365.com
 (2603:10b6:303:b7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Thu,
 24 Apr 2025 12:45:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 12:45:24 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 07:45:21 -0500
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
X-Inumbo-ID: 00b26c82-210a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwRLOwMfQtsoBX0OcPe5L4VKTUkE7jqhPuQmgo+9/RdJ36fu8DW6Z3C6+fJ0vrgNcjqt8zQPAc0/4PJAu3sCs8y0vDMZE6YwyqF6B6enB0c9+vUE7fSytucA8azrG+eJ77BFJdXlMbO2PaMhaekATDmJ3FY/gDBls6GTE/RmJQc68a5DOfdJQ9wP4oazkGvf8gXI/1rRpgQmeyf4dLc6tDxb6iuMS2n8F10G2kC5Ip1eoCSYtAbq+wmVYtXyHaUCrXnXJX0qGQLBiiWPxHWKqrgWaRIIzj8gRXyF8UvPjozGL251Al02+UUdeg0OrY1mMySWBIui7eBvgOtHaZ+R5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQQ8c6Jmffzt+ZdPDHxA9EutCM1UQAQdRALjk9nLMFo=;
 b=aUWgLd89L6VNpZeMXDpgeAVYSaY16QlO1OWdFyBSX13EZiB++qhgo1q/o3j/h9YTqCI57nph+gpz3V5O/S0WwtrOy5McPbPmb4i19XN10hs3k1RQf9LZnr9MaHSzjzMB0xBItZ6pPT/cIipVb5wBQWcowFlLylJCI099EFLcUWoFN58tn+Lo+df4bD7G15G3XH6HZUIS5OjYHtQ9uohId+JLv51BmjK2H7PnPq91Ez8Rqho7CJPjkrLcqjBS4DzSl9aM85aNvN7UDbUrnnGtV+kAiqk3o7lJ2qNRpdTtNLWJXr7cSP4RoVvp9lSvx937aXNVlOF1JALS36Ngct6PCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQQ8c6Jmffzt+ZdPDHxA9EutCM1UQAQdRALjk9nLMFo=;
 b=3KSjHzegesQv+YJJcNe12nVYfgChYtFN184cHA+KfHnbviETN/zGqHrYAvIHh9OKnIrwrIjITVVQESymZ+NM78WOEX0NcvHD+KSGrCu6hqx4ybRp/WEWnxW0Wjdbjw4fALdFZttVz2XBImS8N9b20RdtJEX6ibe2yZx7u1zgL9E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH] x86/hyperv: Adjust hypercall page placement
Date: Thu, 24 Apr 2025 13:45:03 +0100
Message-ID: <20250424124505.42156-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a996bee-9047-4167-7af9-08dd832de1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WSJ70hfTye4JsRfZ3w2ruCFsleEYmMiyf6/CgwCH7oc3hbKw9vb7zWz5rD8I?=
 =?us-ascii?Q?jSIGEn/y2afW5lxIS0O34oeBRXOmrr24aIFeMLlmC/NAUEmQFCNoGPelDYzM?=
 =?us-ascii?Q?lTJQ5xrHASEkA1qaoDUkbLX+rwUFmzzzWo04RMM1zkJDPZO+vi0ulWE2SvYG?=
 =?us-ascii?Q?Wb2VOtJ9PXOHkLLwVnGwdqRbTLwgQLqUDljj3RchyhEmouFBKjbBCx+jnKRr?=
 =?us-ascii?Q?YAuCjrSGeEN7qpSt7NaAUu+yD1E6q0taTxCydM9PF19erL4gAo21fjR1zihx?=
 =?us-ascii?Q?QAaJySJZFcMFNZ7KXtAq8kJBfWZvK+ivq5e90++cylBrbQFNLpH6J2IrVRcu?=
 =?us-ascii?Q?8tV0vA/8hmFJJ2Q9uVwPs6gPdINjAKqyneWvkw1HZU2vIJEcKHesx1KzUSsb?=
 =?us-ascii?Q?bYKhgfnl2Rgdx7bAEiqEWzALqavoGNJO49fTVC5UsJIz6uISG5pmuRIyTBS0?=
 =?us-ascii?Q?GCxeCLLlgK3qjGb2tikRWkwITK/m/bKFH3lSsc6Qd360+l8+xFV+yuk7l7ua?=
 =?us-ascii?Q?cDh08kQuAddABVsl6mPZhI/e9sFNFb+9VkrD2rggjR+AiqiTGp0igZjELBLq?=
 =?us-ascii?Q?RoVDk4vPntbnPrdCr4l3MJK8xaH1mFUKAp4n0OblQGb9lIlo1s3NbsGvqYKe?=
 =?us-ascii?Q?wKAGsQfVJhbbzJPsL5InsyKUumPHh/LeYgmtgTcMtC2eYcV1nDG/3+SA3gAC?=
 =?us-ascii?Q?Y+1iwzJzDV9iBi1uF+ne/Q+3DC0AGp6hLVbTZVLabxTv231F7fi4DB8Pr4ia?=
 =?us-ascii?Q?AgLeRJKEHbNuRHMJtdKxiNmOR4P54vzhTNCY8TTm7FLoT3PMk4nSRBtBtdSM?=
 =?us-ascii?Q?PZfraqY7ahdlx99NQJBjRqoPgxQz87kuFOb+W/zEV+cbDhchATsYblghoKMI?=
 =?us-ascii?Q?eFeUKqLgH50SpSAotHfFltvRZXzHfnqpqgwKHMSTCu2LMsJtDnC0sFrAPTXO?=
 =?us-ascii?Q?nU1TegVCAL7QkAsxstSYaMy4v4P9ELrTiGoFfFLMbN9ZJ8o7imJs8wBilscf?=
 =?us-ascii?Q?b0JvdySI4RMA2DkZRYWWmEgFS5WER3gmDO3nnBGCXGh4rJbBSI8mntu8bA42?=
 =?us-ascii?Q?tFs30p3/JbkLHerWkLl6pzzjyraZOpKjf5KAqXlGCPVAVdGIJ/jf7p3+OCMl?=
 =?us-ascii?Q?ozeV1H96e8wJMHltUqGXFw+kuvyo5YyJC2GPOX8V0pVEciS1TRx3zvsh/h/M?=
 =?us-ascii?Q?P059E+EyfkFvyZcsOWILrf50tk9Kog4zW0iXPIm5aMwwROKjlnzt+UzQPDhU?=
 =?us-ascii?Q?2i99UXpwXCXP8yIWC9wKmnoKwBtuZqVKwIZf9CaWQ5R9chJMcnnjDAlETFB/?=
 =?us-ascii?Q?X5k1toFlGeb4OlSMKQRTYv2/TxdbWe4n1ieZtu+X9NBKyQLO+rmgF5Fu2Om3?=
 =?us-ascii?Q?ynX9oeeZ58hC9jdmND5fwO0kjLLpW691ZzogJ0OeITMMRUvaaarGJTT0JJqA?=
 =?us-ascii?Q?VNNxSOqBW4YGgp4X0w4nDXFinn1cldV1MbZ4RDQLuHhlWFo8WFcKFGtf5SkG?=
 =?us-ascii?Q?P+sJbEMn2HAUuDMQkYxpf1jPwjpXwn8C1hYI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 12:45:24.1005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a996bee-9047-4167-7af9-08dd832de1dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

Xen nowadays crashes under some Hyper-V configurations when
paddr_bits>36. At the 44bit boundary we reach an edge case in which the
end of the guest physical address space is not representable using 32bit
MFNs. Furthermore, it's an act of faith that the tail of the physical
address space has no reserved regions already.

This commit uses the first unused MFN rather than the last, thus
ensuring the hypercall page placement is more resilient against such
corner cases.

While at this, add an extra BUG_ON() to explicitly test for the
hypercall page being correctly set, and mark hcall_page_ready as
__ro_after_init.

Fixes: 620fc734f854("x86/hyperv: setup hypercall page")
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/x86/e820.c                     | 14 ++++++++++++++
 xen/arch/x86/guest/hyperv/hyperv.c      | 20 ++++++++++----------
 xen/arch/x86/include/asm/e820.h         |  1 +
 xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
 4 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index ca577c0bde..7be9a8db34 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -582,6 +582,20 @@ int __init e820_add_range(uint64_t s, uint64_t e, uint32_t type)
     return 1;
 }
 
+uint64_t __init e820_reserve_hole(void)
+{
+    for ( unsigned int i = 0; i < e820.nr_map; i++ )
+    {
+        uint64_t hole = e820.map[i].addr + e820.map[i].size;
+        if ( e820_add_range(hole, hole + PAGE_SIZE, E820_RESERVED) )
+            return hole;
+    }
+
+    print_e820_memory_map(e820.map, e820.nr_map);
+    panic("Unable to find a hole in e820");
+}
+
+
 int __init e820_change_range_type(
     struct e820map *map, uint64_t s, uint64_t e,
     uint32_t orig_type, uint32_t new_type)
diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 6989af38f1..7617f94808 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -22,7 +22,8 @@ DEFINE_PER_CPU_READ_MOSTLY(void *, hv_vp_assist);
 DEFINE_PER_CPU_READ_MOSTLY(unsigned int, hv_vp_index);
 
 unsigned int __read_mostly hv_max_vp_index;
-static bool __read_mostly hcall_page_ready;
+static bool __ro_after_init hcall_page_ready;
+static unsigned long __ro_after_init hcall_page_mfn = INVALID_MFN_RAW;
 
 static uint64_t generate_guest_id(void)
 {
@@ -84,7 +85,6 @@ static void __init setup_hypercall_page(void)
 {
     union hv_x64_msr_hypercall_contents hypercall_msr;
     union hv_guest_os_id guest_id;
-    unsigned long mfn;
 
     BUILD_BUG_ON(HV_HYP_PAGE_SHIFT != PAGE_SHIFT);
 
@@ -98,18 +98,18 @@ static void __init setup_hypercall_page(void)
     rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
     if ( !hypercall_msr.enable )
     {
-        mfn = HV_HCALL_MFN;
         hypercall_msr.enable = 1;
-        hypercall_msr.guest_physical_address = mfn;
+        hypercall_msr.guest_physical_address = hcall_page_mfn;
         wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
     }
     else
-        mfn = hypercall_msr.guest_physical_address;
+        hcall_page_mfn = hypercall_msr.guest_physical_address;
 
     rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
     BUG_ON(!hypercall_msr.enable);
+    BUG_ON(hypercall_msr.guest_physical_address != hcall_page_mfn);
 
-    set_fixmap_x(FIX_X_HYPERV_HCALL, mfn << PAGE_SHIFT);
+    set_fixmap_x(FIX_X_HYPERV_HCALL, hcall_page_mfn << PAGE_SHIFT);
 
     hcall_page_ready = true;
 }
@@ -189,10 +189,10 @@ static int cf_check ap_setup(void)
 
 static void __init cf_check e820_fixup(void)
 {
-    uint64_t s = HV_HCALL_MFN << PAGE_SHIFT;
-
-    if ( !e820_add_range(s, s + PAGE_SIZE, E820_RESERVED) )
-        panic("Unable to reserve Hyper-V hypercall range\n");
+    printk(XENLOG_DEBUG "reserving hole for the hypercall page");
+    hcall_page_mfn = e820_reserve_hole() >> PAGE_SHIFT;
+    printk(XENLOG_INFO "hyperv: hypercall page %#lx",
+           hcall_page_mfn << PAGE_SHIFT);
 }
 
 static int cf_check flush_tlb(
diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
index 8e7644f887..74cbbea62d 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -26,6 +26,7 @@ struct e820map {
 extern int sanitize_e820_map(struct e820entry *biosmap, unsigned int *pnr_map);
 extern int e820_all_mapped(u64 start, u64 end, unsigned type);
 extern int reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);
+extern uint64_t e820_reserve_hole(void);
 extern int e820_change_range_type(
     struct e820map *map, uint64_t s, uint64_t e,
     uint32_t orig_type, uint32_t new_type);
diff --git a/xen/arch/x86/include/asm/guest/hyperv.h b/xen/arch/x86/include/asm/guest/hyperv.h
index c05efdce71..5792e77104 100644
--- a/xen/arch/x86/include/asm/guest/hyperv.h
+++ b/xen/arch/x86/include/asm/guest/hyperv.h
@@ -10,9 +10,6 @@
 
 #include <xen/types.h>
 
-/* Use top-most MFN for hypercall page */
-#define HV_HCALL_MFN   (((1ull << paddr_bits) - 1) >> HV_HYP_PAGE_SHIFT)
-
 /*
  * The specification says: "The partition reference time is computed
  * by the following formula:
-- 
2.43.0


