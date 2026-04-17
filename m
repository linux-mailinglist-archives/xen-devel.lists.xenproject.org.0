Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDuuLGP54Wn50AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 11:12:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBA84191F5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 11:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284076.1566001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDfEi-0001tu-6V; Fri, 17 Apr 2026 09:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284076.1566001; Fri, 17 Apr 2026 09:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDfEi-0001qr-3E; Fri, 17 Apr 2026 09:11:40 +0000
Received: by outflank-mailman (input) for mailman id 1284076;
 Fri, 17 Apr 2026 09:11:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wDfEh-0001ql-Av
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 09:11:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDfEg-008YgU-Nm
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 11:11:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e1f94a-2eae-0a2a0a5409dd-0a2a45069c6a-0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 11:11:38 +0200
Received: from [52.101.43.7]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e1f947-7371-0a2a45060019-34652b079f3f-4
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 11:11:37 +0200
Received: from MN2PR14CA0016.namprd14.prod.outlook.com (2603:10b6:208:23e::21)
 by LV5PR12MB9802.namprd12.prod.outlook.com (2603:10b6:408:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 09:11:31 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:23e::4) by MN2PR14CA0016.outlook.office365.com
 (2603:10b6:208:23e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 09:11:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 09:11:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Apr
 2026 04:11:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Apr
 2026 04:11:30 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 17 Apr 2026 04:11:29 -0500
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
 b=HRPEn3d5ayI0BjsbzZkEOxc084lvabMGENemJg4jCEtFaojF6aAyqfJheyuNgK75Fel9oySFz7xVevWaHne//WJqci+ExxgBCSc4xVyJfNJYIQ3ox/U2fkzy0vcO9IIMjRAZyWRdTjVoT2SqB+FXrp7aWZ5z+LXD75hMZQspdMLhY2jsDLGDiPlZDeuKSR5COYqeqNQYQ/47o2BirUhhWCIAhDMOzGQTdzu3bH4Llop4KsYmCcfeBQqW7u3o/bbFAWKPU3L9IcX6q0FHPHqIPNCLloi7H8W93bmRUVPHjdIClRf6TsufkDH8ZEYPAtvSHaYYr8iPoy4REg20FP9TLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGc9GNkzYOS/7hCAiOqhZl9P60tqMRQR33zQMxicpOA=;
 b=kOAOeLp0SzCui9RG5kgEREvz259dzRJ456venuG/trTBhYyOt0U4Qv6nyIDk57/PVf7JwvHZrUnQsvJ17DZQ+CgZTM35uqf/Qf+65WA5tHqfVxyrcqUyN4h1m5PeKzJWBbG2b61+Rhk01CPjEAHPSQip8p2EPmYtDVpUvihACih4knlqXqUCTAkFnmYGg4yPZWrZLdx6Qr1nyPP0uKXzV8KoJfqWJz9rMGOT4yI2RfxNUb0+YMLxv6qQfkI6wb6knIIwzoiZHD8BcEUfUXgVULjcC0+fxVrRj1Qky/OWIVe6XGMHYglYr5Jje/HoKO8aCJMkzUQjVI6qNGnt7jmA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGc9GNkzYOS/7hCAiOqhZl9P60tqMRQR33zQMxicpOA=;
 b=NjTc8nV+53AxHQOO6h9Pus9UKQQzSuwjCoJP1JeZahhZ3zOBaEYscTB3zqQEWgKY30pw3LbCOFW4opMn1YLMwD5nQKedCtc09mf0CCOi+u1l6hBItbvpXDHAXYZ4UPPeMT1Ket8Z3tJ9Cf503waL3Hfj3LqOVx7T3bSestNCXpY=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: [PATCH] xen/arm: skip holes in physical address space when setting up frametable
Date: Fri, 17 Apr 2026 11:11:24 +0200
Message-ID: <20260417091124.39552-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|LV5PR12MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: 665f9581-10c9-4707-1bd9-08de9c6150a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18096099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AIq9Lr8i+r10IGU992LSTRwTZTrXhtXvjHBq8MXqyH9qPkVYOzK+eb8W8VqoowYrSlzTNvKOPfxeB4pWkdE7JfrJVnukYEaQaGzM4laTLapyh6K8BsBd9D76br80qCt1PdX+4DYpDfZK+W8NUbKNQ0XbYQcaj9IkBBOCGezkIAtkeJhr4S/ttLFoM6t3eeGrbEoMwjwhKcgo2ldSddph0ZWGe5jsFEukr0S1xgmlo/sSyMXpxl28aQYCU67p3mukQ5HJzgTVEeazWbZ3sIUlkGMo96BJ3+C2qcc9iT+j3NXvzETwUD9mHeJMErrqQRLwUdKb5ImcZXDUeNJlvhEXN+qrd6XX7esVm1UuOUnvSsbI7C2U/5FIP7/av2qn4jm/pj3OW281ScJ/7BfL0YlehWnZnKyFKEXHUvJDMDqxRCg+Ja+gSF8pYqDyWDQVWnRk30CXL3fn5C7PiK90BebF78ZMLukqPQAWiIPF08WAXa7l7wWTJajfriTQKsJN3K2M5UFxHdpYPitYE238cDcGtD75zLjce2pLOcw9EU+HNYm/98SgIm3VoSsSAfeqSEGsiFQo5EAVGaiPJvj02qKtttu+g6qYha9yUghmt7SukgOEd9Q5kCnhYS+iX/2hQ8If5SHvqq5zBSmUm+FT4/BsA6GskmeAKtQ3DGAeDYfjwaOmrQzzicAm11ybl5w3suV7CVP+j/rptterk78TI3fI2Ft6i7So1EnbGu7wdhQMvhE45Tjv/cHPPcbnzDNcSL8XwMXPD1TbmOXqjx48+NCvVg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18096099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YyzHTxFnjxjJN0nWg+DGsr86lgb1ay66CJY/qx6Sc5/jagFxYibOmqtOYtR8n5ERyLmULrW+7sCC5u1mojpe0QVWnzo/ZtPNtOxC7fl3f097glCkX/XCwHGUXaFS9q+ny93UUA94s2N2QDZEfhICjuGgiywKJEWxK+bKxjfI7vF88DRTP2dxU23vynHNHxF/kNOyD+nnYWOjE5PUgj7vixiBwmyLCuzjCes+KDeg8d88WjPmULZQ4X56p66diLyiwUwc1VZMm2zwv4gSfMOjbtAYAojTQqPiyreUjgMkrOpbFuHaaneGAqM984GEOLqApOK7RK2ANJR728x1C3PtHBft+qP27bGfbLJn0MmgzmRo9BxI16cOvA2XpIfx2s4R6ds1ns3cj9fY05eokWaQiaZa8KsVzRL7BOEQWQf2GclhFHRyFYE4vmFWkEEVDUUv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 09:11:31.1443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 665f9581-10c9-4707-1bd9-08de9c6150a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9802
X-purgate-ID: tlsNG-16d1c6/1776417098-50158D75-DFCA6778/0/0
X-purgate-type: clean
X-purgate-size: 9600
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Luca.Fancellu@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: CFBA84191F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor setup_frametable_mappings() into init_frametable(), modeled
after x86's implementation. Instead of mapping one contiguous frametable
covering ram_start to ram_end (including holes), iterate the
pdx_group_valid bitmap to allocate and map frametable memory only for
valid PDX groups, skipping gaps in the physical address space. At the
moment we don't really take into account pdx_group_valid bitmap.

This reduces memory consumption on systems with sparse RAM layouts by
not allocating frametable entries for non-existent memory regions.

A file-local pdx_to_page() override is needed because the generic macro
in xen/include/xen/pdx.h does not account for ARM's non-zero
frametable_base_pdx.

Update the MPU implementation to match the new init_frametable()
signature. Since MPU has no virtual address translation (ma == va),
hole-skipping is not possible and the frametable remains a single
contiguous allocation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
We've been using this approach at AMD for a while now. Without this we would not
be able to boot some of our boards that have huge holes in the PA space, so I
consider this patch a great improvement.

Two things to consider as a follow-up in the future:
 - change generic pdx_to_page, page_to_pdx to take into account offset that
   on x86 is zero but on other arches it is not. The page list code is
   for now unaffected because the offset cancels out,
 - use the same on RISCV.
---
 xen/arch/arm/arm32/mmu/mm.c   |  3 +-
 xen/arch/arm/include/asm/mm.h |  4 +-
 xen/arch/arm/mm.c             |  2 +-
 xen/arch/arm/mmu/mm.c         | 77 ++++++++++++++++++++++++-----------
 xen/arch/arm/mpu/mm.c         | 23 ++++++-----
 5 files changed, 70 insertions(+), 39 deletions(-)

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
index 6df8b616e464..e6b651956927 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -62,7 +62,7 @@ void __init setup_mm(void)
 
     setup_mm_helper();
 
-    setup_frametable_mappings(ram_start, ram_end);
+    init_frametable(ram_start);
 
     init_staticmem_pages();
     init_sharedmem_pages();
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 6604f3bf4e6a..4b4da349c16c 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -8,16 +8,37 @@
 #include <xen/pdx.h>
 #include <xen/string.h>
 
-/* Map a frame table to cover physical addresses ps through pe */
-void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+#undef pdx_to_page
+#define pdx_to_page(pdx) gcc11_wrap(frame_table + ((pdx) - frametable_base_pdx))
+
+static void __init
+init_frametable_chunk(unsigned long pdx_s, unsigned long pdx_e)
 {
-    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
-                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
-    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
-    mfn_t base_mfn;
-    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2)
-                                                                : MB(32);
+    unsigned long nr_pdxs = pdx_e - pdx_s;
+    unsigned long chunk_size = nr_pdxs * sizeof(struct page_info);
+    const unsigned long mapping_size = chunk_size < MB(32) ? MB(2) : MB(32);
+    unsigned long virt;
     int rc;
+    mfn_t base_mfn;
+
+    /* Round up to 2M or 32M boundary, as appropriate. */
+    chunk_size = ROUNDUP(chunk_size, mapping_size);
+    base_mfn = alloc_boot_pages(chunk_size >> PAGE_SHIFT, 32 << (20 - 12));
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
@@ -26,24 +47,34 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
 
-    if ( frametable_size > FRAMETABLE_SIZE )
-        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
-              ps, pe);
+    max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
+    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
 
-    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
-    /* Round up to 2M or 32M boundary, as appropriate. */
-    frametable_size = ROUNDUP(frametable_size, mapping_size);
-    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
+    /*
+     * pdx_to_page(pdx_s) in init_frametable_chunk must be page-aligned
+     * for map_pages_to_xen(). Aligning to PDX_GROUP_COUNT guarantees this
+     * because PDX_GROUP_COUNT * sizeof(page_info) is always a multiple of
+     * PAGE_SIZE by construction.
+     */
+    frametable_base_pdx = ROUNDDOWN(frametable_base_pdx, PDX_GROUP_COUNT);
 
-    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
-                          frametable_size >> PAGE_SHIFT,
-                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
-    if ( rc )
-        panic("Unable to setup the frametable mappings.\n");
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


