Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCYdGq9Q82lnzQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 14:53:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF34A2EC6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 14:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298145.1573686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIQri-0001hA-7C; Thu, 30 Apr 2026 12:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298145.1573686; Thu, 30 Apr 2026 12:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIQri-0001bw-2b; Thu, 30 Apr 2026 12:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1298145;
 Thu, 30 Apr 2026 12:51:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wIQre-0001YE-I1
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 12:51:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIQrd-005gLh-UH
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 14:51:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f35053-2eae-0a2a0a5409dd-0a2a450cab80-20
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 14:51:33 +0200
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f35054-62f1-0a2a450c0019-3465c10bc5ad-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 14:51:33 +0200
Received: from CY5PR22CA0049.namprd22.prod.outlook.com (2603:10b6:930:1d::14)
 by DS5PPF23E22D637.namprd12.prod.outlook.com (2603:10b6:f:fc00::647)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 30 Apr
 2026 12:51:24 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::c) by CY5PR22CA0049.outlook.office365.com
 (2603:10b6:930:1d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 12:51:24 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 12:51:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 07:51:23 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 07:51:23 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Thu, 30 Apr 2026 07:51:22 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmZ3YWT6HzmIvFVts9fiNj70Lm6bZCvaCx9/wFDi0b3O3AntwXGG4cHneWAcItzW/9l+cisjSiQHgHXPsKII3m/8GeuMWBqE3mHxNaiUi0CnEYbsnMIrD6+Q9Ict18MG+hgcDqEFYMl5XrPWk/yyRB/7lPbj9I5ve7XofYQbLdEJCEXMzbzdm6MOFVI9FMzzmR4brYtiIGjjl3fPXfu0+BZKs8OoacaFCAD1w3Hs7eRBfWgo7LZg6KHQ91tTtomsB7yT0zebAx574UkFlOhwFDps56+oBE6YSMY/zL+dZmHe7cFyc3iJSXUsrcR8clI8ysJvYuY7OcKrnkdmaK9tcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcbHI0zv2A6jo2sS47YYIVvT0gsxIj1LAE92tpjwNP0=;
 b=BujcZjhjKTevsaUa2SV4HDseb/kzfXKZ3bhl2w7RS/71amq+uq3a136iKXh4WWCkc60SnoXbGnXDwZwZcQW2Ew0VJ1sRR8ebZGRVQpQzOJWtFjAJZUUR/WrvqSXok9W6XZ35gF4zjWnB52TNAJFzYH2hPOJ5JdqrH2nqt8px1pzagVQUMc7jBD+I7OX4PniHSyxXy55UoroQzPtjLUvw6aDmlq7L5iriZIqRMs8uPz2FwWpDk2thhqf6Nulgi9ztdHCkAZ7AVJx95DY28p5N4880/3yZxXNZOHO1toGS5Ezez0IGU3W2qUubR+urALu+3nBcW/+Al1ASZtWaFuPYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcbHI0zv2A6jo2sS47YYIVvT0gsxIj1LAE92tpjwNP0=;
 b=4MhZ3O0/ahbGe0PtErpbzwB2MrZFUGl6G/NRlwNyPZgRoYCYJQXWf6Zd70b0zzsVnr/LEwzk5O636UdR74ScX3DYQ3JHFn0C2obmCQJlb3ASxthhMSO7aTYxfxn8nuFU2lLU7TwuCYJyZqZXSSKEB753FgnUSBmIaNLZjT8RUuk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] xen/arm: skip holes in physical address space when setting up frametable
Date: Thu, 30 Apr 2026 14:51:03 +0200
Message-ID: <20260430125103.401811-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125103.401811-1-michal.orzel@amd.com>
References: <20260430125103.401811-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|DS5PPF23E22D637:EE_
X-MS-Office365-Filtering-Correlation-Id: bde2a835-c25d-402c-bbe9-08dea6b72fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cM31aXSWWhzVuT3q9bs3ZAH9jzM2GuN4l3/Cjc2emCjR5n9nKlAEwLTEgDyhUbujSEQvZRfjfpI6HFsm1XxDD2iniUKtYwRmQPiu5xHVKQVtYSazkLpOOBLWBtGTusCGiyxrHWPRY1A7i/4sLNwT8XUiz8M0kDR5Gx2rr7sxE0aZM+BQ9tS4pP5doP5Z+KrKqYgNPrAVkBqLCgG79MRTDMHcebV9Yl2zLoa4km6RoXwwUhFj4W6BGu3f1IIkknAge3CKZvHjhk7bEXcbSiBcHuCghObvqw65iRMg4A+VfjwHa9devl22IzRaaEfpwAInk7f8PEAEO4n3ko2MQDcPYgw8/t/TglanWMsY7PSAzFGRBbbI5D1xbEuO782KodlI5Ne+oka83u+t1FQfwR3+Rnb6t+iBBsHmk1b3vLf3sgp+e23j/wlfwjtlco622kcIIdLh/CeL4Fw4bW7oE1qtck3IaykDD6ZV4mqXJLAVeruS+FrF3vLLNMTzt2D1jGiBL9xZIJ3ak4Pgrvg1KVkvvb5hqk7yRBNvKQA5YW3CaOJclytp1piJ3X32xzMmhW8jXNa1rOgaVmiuLTXmIP/hu/42Gg3I/DM7Uu53zXRIYEGeK5HYuwhJUxWksLhiMFkrQAOIlBJPQRPCwkgrEZFJhXs5MfFbLZEYEWXejBfyvIH1loyuWxQbwFlJLtvdFkUcej2cL6VvCuyT3XJ7DtsajQCEIWnWxAYToSBvP9j8oNYBYFs4Ll6CnnO/qrYVaU3v6ixm3+vzXNMiIGEdtdkKmw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3xnPnRcNv+ncophZaaD9E57UXC7Nh2oAQNQCA5dsHiUk7abr8DJtnbe/Tyij3EkKvHUKZbryFR8wFEV6j0oW2g+Oca5DPsUBXBiDqZGvGesGQWsPZEYJlTmAUzcnOScwh6spyXPlJ77SkVbB11yntHQhGl9/NjSuEwLUdOt5CibiiIZkWUkr/4ZiAxDgZq3Lk8KHKH5Q/U8+3/eApmJP6Kd8RAgMTA4XvvYxJdB1+THUgqqBhmtvwORYgKNTbNPunqWpk+A+R780uksPf/a4Ki36/Fl8oOtzKp+Wx9TZ/6nfHHKL0/vFL8Z5WovSnhfgYL9q8QNZAQWkcUJfi3xyeoNSDTbuh4Gryv4ETG0Ia8zMXDk4jubeBTORspsZ+PmCvuKtX2mwuSduzXD75ZcALaiCD9jpzrdTGAEcIi73+dnvhCoZla2stcIhnY+pRzvL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:51:24.3586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bde2a835-c25d-402c-bbe9-08dea6b72fd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF23E22D637
X-purgate-ID: tlsNG-d25034/1777553493-6C965CF5-70E86224/0/0
X-purgate-type: clean
X-purgate-size: 10032
X-Rspamd-Queue-Id: A9CF34A2EC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]

Refactor setup_frametable_mappings() into init_frametable(), modeled
after x86's implementation. Instead of mapping one contiguous frametable
covering ram_start to ram_end (including holes), iterate the
pdx_group_valid bitmap to allocate and map frametable memory only for
valid PDX groups, skipping gaps in the physical address space. At the
moment we don't really take into account pdx_group_valid bitmap.

This reduces memory consumption on systems with sparse RAM layouts by
not allocating frametable entries for non-existent memory regions.

The chunk allocator rounds chunk_size up to PAGE_SIZE only, rather than
to a larger mapping granularity, to avoid overshooting past chunk
boundaries into subsequent gaps or valid regions. This rounding has no
impact for in-loop chunks given that chunk size is multiple of 14MB on
Arm64 and 2MB on Arm32. The rounding matters only for the last out-of-loop
chunk. Physical allocations use 32MB alignment so that map_pages_to_xen()
can use the contiguous bit for larger TLB entries where virtual alignment
also permits.

Update the MPU implementation to match the new init_frametable()
signature. Since MPU has no virtual address translation (ma == va),
hole-skipping is not possible and the frametable remains a single
contiguous allocation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - fix overshoot problem with 32MB rounding
---
 xen/arch/arm/arm32/mmu/mm.c   |  3 +-
 xen/arch/arm/include/asm/mm.h |  4 +-
 xen/arch/arm/mm.c             |  2 +-
 xen/arch/arm/mmu/mm.c         | 89 ++++++++++++++++++++++++++---------
 xen/arch/arm/mpu/mm.c         | 23 ++++-----
 5 files changed, 82 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 5e4766ddcf65..0b595baa11b3 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -178,8 +178,7 @@ void __init setup_mm(void)
 
     setup_directmap_mappings(mfn_x(directmap_mfn_start), xenheap_pages);
 
-    /* Frame table covers all of RAM region, including holes */
-    setup_frametable_mappings(ram_start, ram_end);
+    init_frametable(ram_start);
 
     /*
      * The allocators may need to use map_domain_page() (such as for
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 8180b1e12baf..2616a1305d58 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -191,8 +191,8 @@ extern void *early_fdt_map(paddr_t fdt_paddr);
 extern void remove_early_mappings(void);
 /* Prepare the memory subystem to bring-up the given secondary CPU */
 extern int prepare_secondary_mm(int cpu);
-/* Map a frame table to cover physical addresses ps through pe */
-extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
+/* Map a frame table */
+void init_frametable(paddr_t ram_start);
 /* Helper function to setup memory management */
 void setup_mm_helper(void);
 /* map a physical range in virtual memory */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index faef0efb327c..7297cca01551 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -63,7 +63,7 @@ void __init setup_mm(void)
 
     setup_mm_helper();
 
-    setup_frametable_mappings(ram_start, ram_end);
+    init_frametable(ram_start);
 
     init_staticmem_pages();
     init_sharedmem_pages();
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 6604f3bf4e6a..dfc888c8ee0e 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -6,18 +6,45 @@
 #include <xen/mm.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
+#include <xen/sizes.h>
 #include <xen/string.h>
 
-/* Map a frame table to cover physical addresses ps through pe */
-void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+static void __init init_frametable_chunk(unsigned long pdx_s,
+                                         unsigned long pdx_e)
 {
-    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
-                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
-    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
-    mfn_t base_mfn;
-    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2)
-                                                                : MB(32);
+    unsigned long nr_pdxs = pdx_e - pdx_s;
+    unsigned long chunk_size = nr_pdxs * sizeof(struct page_info);
+    unsigned long virt;
     int rc;
+    mfn_t base_mfn;
+
+    /*
+     * In-loop chunks span whole PDX groups, which are always page-size
+     * aligned. The last chunk ending at max_pdx may not be, so round up.
+     */
+    chunk_size = ROUNDUP(chunk_size, PAGE_SIZE);
+
+    /*
+     * Align the allocation to the contiguous mapping size so that
+     * map_pages_to_xen() can use the contiguous bit.
+     */
+    base_mfn = alloc_boot_pages(chunk_size >> PAGE_SHIFT,
+                                MB(32) >> PAGE_SHIFT);
+
+    virt = (unsigned long)pdx_to_page(pdx_s);
+    rc = map_pages_to_xen(virt, base_mfn, chunk_size >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the frametable mappings\n");
+
+    memset(pdx_to_page(pdx_s), 0, nr_pdxs * sizeof(struct page_info));
+    memset(pdx_to_page(pdx_e), -1,
+           chunk_size - nr_pdxs * sizeof(struct page_info));
+}
+
+void __init init_frametable(paddr_t ram_start)
+{
+    unsigned int sidx, nidx, max_idx;
 
     /*
      * The size of paddr_t should be sufficient for the complete range of
@@ -26,24 +53,40 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
 
-    if ( frametable_size > FRAMETABLE_SIZE )
-        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
-              ps, pe);
+    /* init_frametable_chunk() allocation alignment assumes 4KB granule */
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 
-    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
-    /* Round up to 2M or 32M boundary, as appropriate. */
-    frametable_size = ROUNDUP(frametable_size, mapping_size);
-    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
+    /* In-loop chunks must produce page-aligned frametable regions */
+    BUILD_BUG_ON((PDX_GROUP_COUNT * sizeof(struct page_info)) % PAGE_SIZE);
 
-    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
-                          frametable_size >> PAGE_SHIFT,
-                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
-    if ( rc )
-        panic("Unable to setup the frametable mappings.\n");
+    max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
+    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
+
+    /*
+     * pdx_to_page(pdx_s) in init_frametable_chunk must be page-aligned
+     * for map_pages_to_xen(). Aligning to PDX_GROUP_COUNT guarantees this
+     * because PDX_GROUP_COUNT * sizeof(page_info) is always a multiple of
+     * PAGE_SIZE by construction.
+     */
+    frametable_base_pdx = ROUNDDOWN(frametable_base_pdx, PDX_GROUP_COUNT);
+
+    if ( (max_pdx - frametable_base_pdx) > FRAMETABLE_NR )
+        panic("Frametable too small\n");
+
+    for ( sidx = (frametable_base_pdx / PDX_GROUP_COUNT); ; sidx = nidx )
+    {
+        unsigned int eidx;
+
+        eidx = find_next_zero_bit(pdx_group_valid, max_idx, sidx);
+        nidx = find_next_bit(pdx_group_valid, max_idx, eidx);
+
+        if ( nidx >= max_idx )
+            break;
+
+        init_frametable_chunk(sidx * PDX_GROUP_COUNT, eidx * PDX_GROUP_COUNT);
+    }
 
-    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
-    memset(&frame_table[nr_pdxs], -1,
-           frametable_size - (nr_pdxs * sizeof(struct page_info)));
+    init_frametable_chunk(sidx * PDX_GROUP_COUNT, max_pdx);
 }
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index aff88bd3a9c1..9c568831c128 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -186,16 +186,15 @@ static int is_mm_attr_match(pr_t *region, unsigned int attributes)
     return 0;
 }
 
-/* Map a frame table to cover physical addresses ps through pe */
-void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+/*
+ * Allocate a contiguous frame table covering ram_start through max_pdx.
+ * Unlike the MMU version, MPU cannot skip holes because there is no virtual
+ * address translation (ma == va).
+ */
+void __init init_frametable(paddr_t ram_start)
 {
+    unsigned long nr_pdxs, frametable_size;
     mfn_t base_mfn;
-    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
-    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
-
-    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(aligned_pe), -1)) -
-                            mfn_to_pdx(maddr_to_mfn(aligned_ps)) + 1;
-    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
 
     /*
      * The size of paddr_t should be sufficient for the complete range of
@@ -204,11 +203,13 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
 
+    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
+    nr_pdxs = max_pdx - frametable_base_pdx;
+    frametable_size = nr_pdxs * sizeof(struct page_info);
+
     if ( frametable_size > FRAMETABLE_SIZE )
-        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
-              ps, pe);
+        panic("Frametable too small\n");
 
-    frametable_base_pdx = paddr_to_pdx(aligned_ps);
     frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);
 
     base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
-- 
2.43.0


