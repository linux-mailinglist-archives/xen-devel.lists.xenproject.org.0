Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vgw7DvH++mkRVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:42:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010B4D7FCA
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301300.1575591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXpP-0002BP-GV; Wed, 06 May 2026 08:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301300.1575591; Wed, 06 May 2026 08:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXpP-00028f-DR; Wed, 06 May 2026 08:41:59 +0000
Received: by outflank-mailman (input) for mailman id 1301300;
 Wed, 06 May 2026 08:41:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKXpO-00028Z-1g
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:41:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXpN-001oY3-6L
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:41:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fafece-5cb7-0a2a0a5109dd-0a2a4504b53a-34
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:41:56 +0200
Received: from [52.101.56.2]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fafed3-1dec-0a2a45040019-346538025e3b-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:41:56 +0200
Received: from BL1PR13CA0009.namprd13.prod.outlook.com (2603:10b6:208:256::14)
 by PH7PR12MB8105.namprd12.prod.outlook.com (2603:10b6:510:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:41:51 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::85) by BL1PR13CA0009.outlook.office365.com
 (2603:10b6:208:256::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 08:41:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 08:41:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 03:41:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 03:41:46 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Wed, 6 May 2026 03:41:45 -0500
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
 b=Gn5Pn5W+znKF5LA+OkYlre/VtmhBHAwtoNpYm+sQ+5MN3rPKInbdfoheYJVftiD5hdXYttrGcDERzN8dX89QdycEILpqXLSwqBmJtWJADB5yLmRpxPY34WP6z6ldIwx22CcRyxqqQJSbH5wbPajMHBy0NxPJa3JVa0qXAl1tCak4R+EaRWaLZTinCuq0xIN7JaPoTTr5lBiCxiwlW8jZqgN0VBaBsALP3/Sus0wM4ZId8NZOVx5Uo7QgbQfbQz+GsH+Iw0NHpBWmNvR34zsHUN3broKtzd9vkhJqQOfHS3Lk2B/y4zLjraQegID7c+xfD16PEz6Sd/SB/Vo8SYKe8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la/wxfFIVE8P7U52iG/jws8cONQRuWDh6i4z0z3RURQ=;
 b=ToT3WQhFZA/BRmC5llWKTO3x325ZayCWe2xpCo6gABgctCbm8j98ns0h6Ez9ishdUHsMP2eSNi2zYijDshQjfCtAHgo8Nz4CZb6eNij7mcIG5+778RtNIKsAK4AVc9KfiV6+qP2KA66be4WW7o0YGeDWtI2VfHrjgTMXCeIm9qr6f6+r6yqMbW6Lc7aCMsmGzZZDGcnxW5LJk6V5tPT/hSIR/Xev6XXz7psZzzVVSVQ4H8oNw1G8GCG7tI/dyKLrFf7w8w7ycLENHTJg8oGiduvlzVd05mFlnsDskI45EJGmCk5dav+WAPylEg5ThgkPYk0b2k5ad1WZBzvu7jEYuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la/wxfFIVE8P7U52iG/jws8cONQRuWDh6i4z0z3RURQ=;
 b=dnMFez2KTKywfaNZgQXo6FdAWaBZ76/a2yFJRgTUkbHt8HjnAFTQVglmH7VSURguKxkwHzSrIeMME4H3qhTt0on4DwhZrKXXqUWIucuozqJr+V/MC4x+G5B2ri9lqKyDEZuaeZFTTJwNloHbzn9nNEGD3gc5c4pdUUUZZDDr1VQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm: skip holes in physical address space when setting up frametable
Date: Wed, 6 May 2026 10:41:37 +0200
Message-ID: <20260506084137.40913-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|PH7PR12MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 276a9620-9f95-44d2-451e-08deab4b4f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XbeBhU5nw00yHQabv266JeQlfzoVEdv3P0Ypa2Cdr2pw2CfbVLxiM8mb3vkZKE60UfOXKv7g5Nk2RjjRuacy0Yt9+l/JlvgjrLjxQ8ghCPq9ac8xidXVI9I41n+We8VxHN/8EYDh7nl+2kTwtJsWNxAIkCImkutpTHHfAWI0TZ7yxRL9NcidttHCYgoa+IecpaY/EcUTShUqA6tYvPh+XxItBwXxIHtB5gMG8iFSN/1RnP8WRhK8s1c/ysWnSOxU9h58GHoglNLuR20g5EfxbcdGywmcg+I2Yqp8uflptrbqFCBrwFYOAjAD0DJwb4X55l0MBiCb9kRnU+3AVUPUBvhnL1GDeVMYFdVpxFPJqDwE/BzvKsNMuT8dnbZLzjgzKPJFhFUhOMujEAeb4aTo/GeBZWDRgPWAGBY48l7rMtPUFt2iguZzWlT4Oo9Y67BV3RNUsgAFdvgUn2Wb7UvdaLQ2tsT2Lhy7kUNKdaGalIdwycqYJIOEPKpineG5etUGG/IOVtIpbeBQRBxHa4LScGKCHmVqKzSPrGfUaQyFjB3LQ7T4ki14O2C5q6byOIO9MISvW+oS8fRCENZz7DkwLhIVcCFAVayqtQ7Lj+vpggWEtfHhBIpyrnoiK4JRdqn4kr7yQwyEbiAwk9ByLunA5PiKbJHZeYooNskOCXnIQzZF9eoO+zpRiPDB9tZsQlcM1cLYFf+mwza4LfLJJYBAt7QAtkETyaQEma9aEsuLordl8H1MF7SE+LwbtMlHfOOr
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G5FAaZ736o6YnnhI35F6Pp65fVzkCQ2Oh+YS0OAEXHuOYZLdQANpj79iyBRH4DRWkQOjJWn8SMhGE/gprlX5RswyHiXkNsjz4HtW55da4NJBlmTaTP7QosS0cRQHbttbrfSGnnLyDJWqik24AiK0GiPxRR3lMgAOMPta+BIgY/Q97DLKQfuCzWn0+OlKsm6T0VPM9UXiVaUXAzwqVuaKFvHqiFaW0OmHmSMnZ8y35Hts5HPqxhdGrh+og08sZYDQY86E1T3qKQ2TVVVDk+JXSAvWbGVVZtObWzP5BjvUV3DSyp6V4hGVarQfhklnX0p+ovh5zvGrCaHOtAJRT1cXPQnPbNpwEv9k5YCIltR61S7YE46jURcwriargzoNsJ6OvbMMoyMkmQZhtWQLHAMuoR95r9vwou/yT7xD+WTj93B6A+ao6l6IXM6Av+XB/f0w
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:41:47.2495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 276a9620-9f95-44d2-451e-08deab4b4f33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8105
X-purgate-ID: tlsNG-ebf023/1778056916-2B1663FF-7239EC51/0/0
X-purgate-type: clean
X-purgate-size: 11641
X-Rspamd-Queue-Id: 7010B4D7FCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]

Refactor setup_frametable_mappings() into init_frametable(), modeled
after x86's implementation. Instead of mapping one contiguous frametable
covering ram_start to ram_end (including holes), iterate the
pdx_group_valid bitmap to allocate and map frametable memory only for
valid PDX groups, skipping gaps in the physical address space.

This reduces memory consumption on systems with sparse RAM layouts by
not allocating frametable entries for non-existent memory regions.

The chunk allocator rounds chunk_size up to PAGE_SIZE only, rather than
to a larger mapping granularity, to avoid overshooting past chunk
boundaries into subsequent gaps or valid regions. This rounding has no
impact for in-loop chunks given that chunk size is a multiple of 14MB
on Arm64 and 2MB on Arm32. The rounding matters only for the last
out-of-loop chunk.

Physical allocations prefer 32MB alignment so that map_pages_to_xen()
can use the contiguous bit for larger TLB entries where virtual
alignment also permits. Fall back to 2MB if the chunk is smaller than
32MB.

Add a comment explaining why we don't use pdx_to_page(). For complete
discussion see [1].

As ram_end is no longer needed by init_frametable(), drop the now-dead
ram_end/bank_end computation from setup_mm().

Update the MPU implementation to match the new init_frametable()
signature. Since MPU has no virtual address translation (ma == va),
hole-skipping is not possible and the frametable remains a single
contiguous allocation.

[1] https://lore.kernel.org/xen-devel/20260430125103.401811-1-michal.orzel@amd.com/T/#m803025eb6720a1425443dd0f8e72be93ef02f344

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
 - don't generalize pdx_to_page with frametable_base_pdx
 - use different alignment depending on chunk size
 - drop tags due to the above changes
Changes in v2:
 - fix overshoot problem with 32MB rounding
---
 xen/arch/arm/arm32/mmu/mm.c   |  3 +-
 xen/arch/arm/include/asm/mm.h |  4 +-
 xen/arch/arm/mm.c             |  5 +-
 xen/arch/arm/mmu/mm.c         | 99 +++++++++++++++++++++++++++--------
 xen/arch/arm/mpu/mm.c         | 23 ++++----
 5 files changed, 92 insertions(+), 42 deletions(-)

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
index 72a692862420..2eb8465aa904 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -196,8 +196,8 @@ extern void *early_fdt_map(paddr_t fdt_paddr);
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
index 6eddbcf912ee..65aea71c4351 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -33,7 +33,6 @@ void __init setup_mm(void)
 {
     const struct membanks *banks = bootinfo_get_mem();
     paddr_t ram_start = INVALID_PADDR;
-    paddr_t ram_end = 0;
     paddr_t ram_size = 0;
     unsigned int i;
 
@@ -42,11 +41,9 @@ void __init setup_mm(void)
     for ( i = 0; i < banks->nr_banks; i++ )
     {
         const struct membank *bank = &banks->bank[i];
-        paddr_t bank_end = bank->start + bank->size;
 
         ram_size = ram_size + bank->size;
         ram_start = min(ram_start, bank->start);
-        ram_end = max(ram_end, bank_end);
     }
 
     total_pages = ram_size >> PAGE_SHIFT;
@@ -62,7 +59,7 @@ void __init setup_mm(void)
 
     setup_mm_helper();
 
-    setup_frametable_mappings(ram_start, ram_end);
+    init_frametable(ram_start);
 
     init_staticmem_pages();
     init_sharedmem_pages();
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 6604f3bf4e6a..c4018a61aa01 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -6,18 +6,55 @@
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
+    unsigned long pfn_align;
+    struct page_info *pg;
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
+     * Try to align the allocation to the contiguous mapping size so that
+     * map_pages_to_xen() can use the contiguous bit.
+     */
+    pfn_align = ((chunk_size >= MB(32)) ? MB(32) : MB(2)) >> PAGE_SHIFT;
+
+    base_mfn = alloc_boot_pages(chunk_size >> PAGE_SHIFT, pfn_align);
+
+    /*
+     * Resolve the frametable VA via mfn_to_page(pdx_to_mfn(...)) rather
+     * than pdx_to_page() because the generic pdx_to_page() does not subtract
+     * frametable_base_pdx. There's more work to be done to make it generic, so
+     * for now route through mfn_to_page(), which on Arm applies the
+     * frametable_base_pdx offset and yields the correct VA.
+     */
+    pg = mfn_to_page(pdx_to_mfn(pdx_s));
+    rc = map_pages_to_xen((unsigned long)pg, base_mfn,
+                          chunk_size >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the frametable mappings\n");
+
+    memset(pg, 0, nr_pdxs * sizeof(struct page_info));
+    memset(pg + nr_pdxs, -1,
+           chunk_size - nr_pdxs * sizeof(struct page_info));
+}
+
+void __init init_frametable(paddr_t ram_start)
+{
+    unsigned int sidx, nidx, max_idx;
 
     /*
      * The size of paddr_t should be sufficient for the complete range of
@@ -26,24 +63,40 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
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
+     * Mapping address in init_frametable_chunk must be page-aligned
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


