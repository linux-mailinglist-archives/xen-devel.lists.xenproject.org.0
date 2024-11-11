Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A881B9C3F57
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833745.1249044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDP-0002Yh-1a; Mon, 11 Nov 2024 13:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833745.1249044; Mon, 11 Nov 2024 13:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDO-0002QL-Kf; Mon, 11 Nov 2024 13:12:22 +0000
Received: by outflank-mailman (input) for mailman id 833745;
 Mon, 11 Nov 2024 13:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDM-0008Hn-NC
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:20 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 932399e7-a02e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 14:12:17 +0100 (CET)
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:14 +0000
Received: from EX19MTAUEC001.ant.amazon.com [10.0.44.209:15977]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.2.148:2525]
 with esmtp (Farcaster)
 id 71b9e65c-e286-4e80-970a-17bc9d0d5a85; Mon, 11 Nov 2024 13:12:13 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:13 +0000
Received: from EX19MTAUWC002.ant.amazon.com (10.250.64.143) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:13 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:12 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id D8E7542116; Mon, 11 Nov 2024 13:12:11 +0000 (UTC)
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
X-Inumbo-ID: 932399e7-a02e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjUyLjk1LjQ4LjE1NCIsImhlbG8iOiJzbXRwLWZ3LTYwMDEuYW1hem9uLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjkzMjM5OWU3LWEwMmUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzMwNzM4LjA5Njk4Mywic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330738; x=1762866738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a3qHJmgpqMWwC9H8xuKHEpxdqP0+YnnyLyKfARA+G5s=;
  b=ZhqJMhk3dK5wlug/OY08MdEPt7iNVamZ6gfbPvlJZx0xSRs4zt9nG/I2
   ssBCgUP8JXrJDH5s7qFgeBnkyoTD31a9RygP5xeoywwA+A6PQgtvcba2R
   DuYeVSUNYlaGCPfp3WcJ1abvk4rvRpLKAPRnTti6JFHE/AZ8KawmB0UMw
   E=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="438680628"
X-Farcaster-Flow-ID: 71b9e65c-e286-4e80-970a-17bc9d0d5a85
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V4 13/15] xen/arm64: mm: Use per-pCPU page-tables
Date: Mon, 11 Nov 2024 13:11:46 +0000
Message-ID: <20241111131148.52568-14-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Julien Grall <jgrall@amazon.com>

At the moment, on Arm64, every pCPU is sharing the same page-tables.

In a follow-up patch, we will allow the possibility to remove the
direct map and therefore it will be necessary to have a mapcache.

While we have plenty of spare virtual address space to reserve part
for each pCPU, it means that temporary mappings (e.g. guest memory)
could be accessible by every pCPU.

In order to increase our security posture, it would be better if
those mappings are only accessible by the pCPU doing the temporary
mapping.

In addition to that, a per-pCPU page-tables opens the way to have
per-domain mapping area.

Arm32 is already using per-pCPU page-tables so most of the code
can be re-used. Arm64 doesn't yet have support for the mapcache,
so a stub is provided (moved to its own header asm/domain_page.h).

Take the opportunity to fix a typo in a comment that is modified.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changelog since v1:
        * Rebase
        * Fix typoes

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 671eaadbc1d5..c1c6450ca2e3 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -76,6 +76,7 @@ static void __init prepare_runtime_identity_mapping(void)
     paddr_t id_addr = virt_to_maddr(_start);
     lpae_t pte;
     DECLARE_OFFSETS(id_offsets, id_addr);
+    lpae_t *root = this_cpu(xen_pgtable);
 
     if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
         panic("Cannot handle ID mapping above %uTB\n",
@@ -86,7 +87,7 @@ static void __init prepare_runtime_identity_mapping(void)
     pte.pt.table = 1;
     pte.pt.xn = 0;
 
-    write_pte(&xen_pgtable[id_offsets[0]], pte);
+    write_pte(&root[id_offsets[0]], pte);
 
     /* Link second ID table */
     pte = pte_of_xenaddr((vaddr_t)xen_second_id);
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 856f2dbec4ad..87a315db013d 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -1,12 +1,6 @@
 #ifndef __ARM_ARM32_MM_H__
 #define __ARM_ARM32_MM_H__
 
-#include <xen/percpu.h>
-
-#include <asm/lpae.h>
-
-DECLARE_PER_CPU(lpae_t *, xen_pgtable);
-
 /*
  * Only a limited amount of RAM, called xenheap, is always mapped on ARM32.
  * For convenience always return false.
@@ -16,8 +10,6 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return false;
 }
 
-bool init_domheap_mappings(unsigned int cpu);
-
 static inline void arch_setup_page_tables(void)
 {
 }
diff --git a/xen/arch/arm/include/asm/domain_page.h b/xen/arch/arm/include/asm/domain_page.h
new file mode 100644
index 000000000000..e9f52685e2ec
--- /dev/null
+++ b/xen/arch/arm/include/asm/domain_page.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_ARM_DOMAIN_PAGE_H__
+#define __ASM_ARM_DOMAIN_PAGE_H__
+
+#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
+bool init_domheap_mappings(unsigned int cpu);
+#else
+static inline bool init_domheap_mappings(unsigned int cpu)
+{
+    return true;
+}
+#endif
+
+#endif /* __ASM_ARM_DOMAIN_PAGE_H__ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 5abd4b0d1c73..cbfaeb2c4da1 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -2,6 +2,9 @@
 #define __ARCH_ARM_MM__
 
 #include <xen/kernel.h>
+#include <xen/percpu.h>
+
+#include <asm/lpae.h>
 #include <asm/page.h>
 #include <public/xen.h>
 #include <xen/pdx.h>
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index c5e03a66bf9e..c03c3a51e46b 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -2,6 +2,8 @@
 #ifndef __ARM_MMU_MM_H__
 #define __ARM_MMU_MM_H__
 
+DECLARE_PER_CPU(lpae_t *, xen_pgtable);
+
 /* Non-boot CPUs use this to find the correct pagetables. */
 extern uint64_t init_ttbr;
 
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index da28d669e796..1ed1a53ab1f2 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -607,9 +607,9 @@ static int xen_pt_update(unsigned long virt,
     unsigned long left = nr_mfns;
 
     /*
-     * For arm32, page-tables are different on each CPUs. Yet, they share
-     * some common mappings. It is assumed that only common mappings
-     * will be modified with this function.
+     * Page-tables are different on each CPU. Yet, they share some common
+     * mappings. It is assumed that only common mappings will be modified
+     * with this function.
      *
      * XXX: Add a check.
      */
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 9664e85ee6c0..850a961ae5ef 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -30,17 +30,15 @@
  * PCPUs.
  */
 
-#ifdef CONFIG_ARM_64
-DEFINE_PAGE_TABLE(xen_pgtable);
-static DEFINE_PAGE_TABLE(xen_first);
-#define THIS_CPU_PGTABLE xen_pgtable
-#else
 /* Per-CPU pagetable pages */
 /* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
 DEFINE_PER_CPU(lpae_t *, xen_pgtable);
 #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
 /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
 static DEFINE_PAGE_TABLE(cpu0_pgtable);
+
+#ifdef CONFIG_ARM_64
+static DEFINE_PAGE_TABLE(xen_first);
 #endif
 
 /* Common pagetable leaves */
@@ -232,17 +230,20 @@ void __init setup_pagetables(void)
     lpae_t pte, *p;
     int i;
 
+    p = cpu0_pgtable;
+
+    /* arch_setup_page_tables() may need to access the root page-tables. */
+    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
+
     arch_setup_page_tables();
 
 #ifdef CONFIG_ARM_64
     pte = pte_of_xenaddr((uintptr_t)xen_first);
     pte.pt.table = 1;
     pte.pt.xn = 0;
-    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
+    p[zeroeth_table_offset(XEN_VIRT_START)] = pte;
 
-    p = (void *) xen_first;
-#else
-    p = (void *) cpu0_pgtable;
+    p = xen_first;
 #endif
 
     /* Map xen second level page-table */
@@ -285,19 +286,12 @@ void __init setup_pagetables(void)
     pte.pt.table = 1;
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
-#ifdef CONFIG_ARM_64
-    ttbr = virt_to_maddr(xen_pgtable);
-#else
     ttbr = virt_to_maddr(cpu0_pgtable);
-#endif
+
 
     switch_ttbr(ttbr);
 
     xen_pt_enforce_wnx();
-
-#ifdef CONFIG_ARM_32
-    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
-#endif
 }
 
 void *__init arch_vmap_virt_end(void)
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 37e91d72b785..e4bde31605bd 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -7,6 +7,7 @@
 
 #include <xen/domain_page.h>
 
+#include <asm/domain_page.h>
 #include <asm/setup.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
@@ -93,20 +94,6 @@ static void set_init_ttbr(lpae_t *root)
     unmap_domain_page(ptr);
 }
 
-#ifdef CONFIG_ARM_64
-int prepare_secondary_mm(int cpu)
-{
-    clear_boot_pagetables();
-
-    /*
-     * Set init_ttbr for this CPU coming up. All CPUs share a single setof
-     * pagetables, but rewrite it each time for consistency with 32 bit.
-     */
-    set_init_ttbr(xen_pgtable);
-
-    return 0;
-}
-#else
 int prepare_secondary_mm(int cpu)
 {
     lpae_t *root = alloc_xenheap_page();
@@ -136,7 +123,6 @@ int prepare_secondary_mm(int cpu)
 
     return 0;
 }
-#endif
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 71ebaa77ca94..b33483b8eacf 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -42,6 +42,7 @@
 #include <asm/gic.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/domain_page.h>
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/setup.h>
-- 
2.40.1


