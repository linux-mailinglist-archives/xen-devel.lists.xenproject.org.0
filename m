Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B479F1B7838
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzBs-0005Js-A9; Fri, 24 Apr 2020 14:20:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRzBq-0005IQ-PR
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:20:26 +0000
X-Inumbo-ID: b4c0268e-8636-11ea-94b3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4c0268e-8636-11ea-94b3-12813bfff9fa;
 Fri, 24 Apr 2020 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o5SnQls1sfBymIOf+4o9qpecybtOaO0mboyyYZ2aKLQ=; b=Hg19jqtVuBc+wGTbHQcBF73XMV
 NwqJi9b8qMUOOywxbAmYS7TBtCOv7xp37h0CLLUb7GGsyz2KTC+KfvBCBn8SQDiAgid+J558maWD9
 +FBLqgWWybabeoSoFW+rHKgsxsShMmkODR+CZvDNDbtvRmMc5PZVC5DWHRdAzTrSL0wA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRzBa-0001xJ-CN; Fri, 24 Apr 2020 14:20:10 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1R-0001fN-1h; Fri, 24 Apr 2020 14:09:41 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 15/15] x86/mm: drop _new suffix for page table APIs
Date: Fri, 24 Apr 2020 15:09:06 +0100
Message-Id: <9ff8ad5d4ba7602f3d7137a650aba5de52dacd80.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/mm.c        | 48 ++++++++++++++++++++--------------------
 xen/arch/x86/smpboot.c   | 12 +++++-----
 xen/arch/x86/x86_64/mm.c | 10 ++++-----
 xen/common/efi/boot.c    | 10 ++++-----
 xen/include/asm-x86/mm.h |  4 ++--
 5 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 7e212cc3e0..a17ae0004a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -356,7 +356,7 @@ void __init arch_init_memory(void)
             ASSERT(root_pgt_pv_xen_slots < ROOT_PAGETABLE_PV_XEN_SLOTS);
             if ( l4_table_offset(split_va) == l4_table_offset(split_va - 1) )
             {
-                mfn_t l3mfn = alloc_xen_pagetable_new();
+                mfn_t l3mfn = alloc_xen_pagetable();
 
                 if ( !mfn_eq(l3mfn, INVALID_MFN) )
                 {
@@ -4919,7 +4919,7 @@ int mmcfg_intercept_write(
  * them. The caller must check whether the allocation has succeeded, and only
  * pass valid MFNs to map_domain_page().
  */
-mfn_t alloc_xen_pagetable_new(void)
+mfn_t alloc_xen_pagetable(void)
 {
     if ( system_state != SYS_STATE_early_boot )
     {
@@ -4934,7 +4934,7 @@ mfn_t alloc_xen_pagetable_new(void)
 }
 
 /* mfn can be INVALID_MFN */
-void free_xen_pagetable_new(mfn_t mfn)
+void free_xen_pagetable(mfn_t mfn)
 {
     if ( system_state != SYS_STATE_early_boot && !mfn_eq(mfn, INVALID_MFN) )
         free_domheap_page(mfn_to_page(mfn));
@@ -4955,7 +4955,7 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
     {
         bool locking = system_state > SYS_STATE_boot;
         l3_pgentry_t *l3t;
-        mfn_t l3mfn = alloc_xen_pagetable_new();
+        mfn_t l3mfn = alloc_xen_pagetable();
 
         if ( mfn_eq(l3mfn, INVALID_MFN) )
             return NULL;
@@ -4974,7 +4974,7 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l3mfn);
+        free_xen_pagetable(l3mfn);
     }
 
     return map_l3t_from_l4e(*pl4e) + l3_table_offset(v);
@@ -4993,7 +4993,7 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
     {
         bool locking = system_state > SYS_STATE_boot;
         l2_pgentry_t *l2t;
-        mfn_t l2mfn = alloc_xen_pagetable_new();
+        mfn_t l2mfn = alloc_xen_pagetable();
 
         if ( mfn_eq(l2mfn, INVALID_MFN) )
         {
@@ -5012,7 +5012,7 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l2mfn);
+        free_xen_pagetable(l2mfn);
     }
 
     BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
@@ -5035,7 +5035,7 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
     {
         bool locking = system_state > SYS_STATE_boot;
         l1_pgentry_t *l1t;
-        mfn_t l1mfn = alloc_xen_pagetable_new();
+        mfn_t l1mfn = alloc_xen_pagetable();
 
         if ( mfn_eq(l1mfn, INVALID_MFN) )
         {
@@ -5054,7 +5054,7 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l1mfn);
+        free_xen_pagetable(l1mfn);
     }
 
     BUG_ON(l2e_get_flags(*pl2e) & _PAGE_PSE);
@@ -5163,10 +5163,10 @@ int map_pages_to_xen(
                         ol2e = l2t[i];
                         if ( (l2e_get_flags(ol2e) & _PAGE_PRESENT) &&
                              !(l2e_get_flags(ol2e) & _PAGE_PSE) )
-                            free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                            free_xen_pagetable(l2e_get_mfn(ol2e));
                     }
                     unmap_domain_page(l2t);
-                    free_xen_pagetable_new(l3e_get_mfn(ol3e));
+                    free_xen_pagetable(l3e_get_mfn(ol3e));
                 }
             }
 
@@ -5205,7 +5205,7 @@ int map_pages_to_xen(
                 continue;
             }
 
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5233,7 +5233,7 @@ int map_pages_to_xen(
                 spin_unlock(&map_pgdir_lock);
             flush_area(virt, flush_flags);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         pl2e = virt_to_xen_l2e(virt);
@@ -5267,7 +5267,7 @@ int map_pages_to_xen(
                         flush_flags(l1e_get_flags(l1t[i]));
                     flush_area(virt, flush_flags);
                     unmap_domain_page(l1t);
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
             }
 
@@ -5313,7 +5313,7 @@ int map_pages_to_xen(
                     goto check_l3;
                 }
 
-                l1mfn = alloc_xen_pagetable_new();
+                l1mfn = alloc_xen_pagetable();
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
 
@@ -5340,7 +5340,7 @@ int map_pages_to_xen(
                     spin_unlock(&map_pgdir_lock);
                 flush_area(virt, flush_flags);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
 
             pl1e  = map_l1t_from_l2e(*pl2e) + l1_table_offset(virt);
@@ -5406,7 +5406,7 @@ int map_pages_to_xen(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5457,7 +5457,7 @@ int map_pages_to_xen(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable_new(l3e_get_mfn(ol3e));
+                free_xen_pagetable(l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5546,7 +5546,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             }
 
             /* PAGE1GB: shatter the superpage and fall through. */
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5570,7 +5570,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         /*
@@ -5606,7 +5606,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             {
                 l1_pgentry_t *l1t;
                 /* PSE: shatter the superpage and try again. */
-                mfn_t l1mfn = alloc_xen_pagetable_new();
+                mfn_t l1mfn = alloc_xen_pagetable();
 
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
@@ -5630,7 +5630,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
         }
         else
@@ -5697,7 +5697,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5742,7 +5742,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l2mfn);
+                free_xen_pagetable(l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 71d61794ec..06c8e3ddf0 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -730,7 +730,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
 
     if ( !(root_get_flags(rpt[root_table_offset(linear)]) & _PAGE_PRESENT) )
     {
-        mfn_t l3mfn = alloc_xen_pagetable_new();
+        mfn_t l3mfn = alloc_xen_pagetable();
 
         if ( mfn_eq(l3mfn, INVALID_MFN) )
             goto out;
@@ -747,7 +747,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
 
     if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
     {
-        mfn_t l2mfn = alloc_xen_pagetable_new();
+        mfn_t l2mfn = alloc_xen_pagetable();
 
         if ( mfn_eq(l2mfn, INVALID_MFN) )
             goto out;
@@ -766,7 +766,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
 
     if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
     {
-        mfn_t l1mfn = alloc_xen_pagetable_new();
+        mfn_t l1mfn = alloc_xen_pagetable();
 
         if ( mfn_eq(l1mfn, INVALID_MFN) )
             goto out;
@@ -908,15 +908,15 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
                     continue;
 
                 ASSERT(!(l2e_get_flags(l2t[i2]) & _PAGE_PSE));
-                free_xen_pagetable_new(l2e_get_mfn(l2t[i2]));
+                free_xen_pagetable(l2e_get_mfn(l2t[i2]));
             }
 
             unmap_domain_page(l2t);
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         unmap_domain_page(l3t);
-        free_xen_pagetable_new(l3mfn);
+        free_xen_pagetable(l3mfn);
     }
 
     free_xenheap_page(rpt);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 12e9dc6eb2..d37f6a3755 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -444,7 +444,7 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
                 l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
             else
             {
-                mfn_t l2_ro_mpt_mfn = alloc_xen_pagetable_new();
+                mfn_t l2_ro_mpt_mfn = alloc_xen_pagetable();
 
                 if ( mfn_eq(l2_ro_mpt_mfn, INVALID_MFN) )
                 {
@@ -497,7 +497,7 @@ void __init paging_init(void)
               _PAGE_PRESENT) )
         {
             l3_pgentry_t *pl3t;
-            mfn_t l3mfn = alloc_xen_pagetable_new();
+            mfn_t l3mfn = alloc_xen_pagetable();
 
             if ( mfn_eq(l3mfn, INVALID_MFN) )
                 goto nomem;
@@ -511,7 +511,7 @@ void __init paging_init(void)
     }
 
     /* Create user-accessible L2 directory to map the MPT for guests. */
-    l3_ro_mpt_mfn = alloc_xen_pagetable_new();
+    l3_ro_mpt_mfn = alloc_xen_pagetable();
     if ( mfn_eq(l3_ro_mpt_mfn, INVALID_MFN) )
         goto nomem;
     l3_ro_mpt = map_domain_page(l3_ro_mpt_mfn);
@@ -602,7 +602,7 @@ void __init paging_init(void)
         {
             UNMAP_DOMAIN_PAGE(l2_ro_mpt);
 
-            l2_ro_mpt_mfn = alloc_xen_pagetable_new();
+            l2_ro_mpt_mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2_ro_mpt_mfn, INVALID_MFN) )
                 goto nomem;
 
@@ -626,7 +626,7 @@ void __init paging_init(void)
     UNMAP_DOMAIN_PAGE(l3_ro_mpt);
 
     /* Create user-accessible L2 directory to map the MPT for compat guests. */
-    l2_ro_mpt_mfn = alloc_xen_pagetable_new();
+    l2_ro_mpt_mfn = alloc_xen_pagetable();
     if ( mfn_eq(l2_ro_mpt_mfn, INVALID_MFN) )
         goto nomem;
     compat_idle_pg_table_l2 = map_domain_page_global(l2_ro_mpt_mfn);
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 715217d2a9..d70d06084c 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1456,7 +1456,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
             continue;
         if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
         {
-            mfn_t l3mfn = alloc_xen_pagetable_new();
+            mfn_t l3mfn = alloc_xen_pagetable();
 
             BUG_ON(mfn_eq(l3mfn, INVALID_MFN));
             l3dst = map_domain_page(l3mfn);
@@ -1608,7 +1608,7 @@ void __init efi_init_memory(void)
      * Set up 1:1 page tables for runtime calls. See SetVirtualAddressMap() in
      * efi_exit_boot().
      */
-    efi_l4_mfn = alloc_xen_pagetable_new();
+    efi_l4_mfn = alloc_xen_pagetable();
     BUG_ON(mfn_eq(efi_l4_mfn, INVALID_MFN));
     efi_l4_pgtable = map_domain_page(efi_l4_mfn);
     clear_page(efi_l4_pgtable);
@@ -1643,7 +1643,7 @@ void __init efi_init_memory(void)
 
         if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
         {
-            mfn_t l3mfn = alloc_xen_pagetable_new();
+            mfn_t l3mfn = alloc_xen_pagetable();
 
             BUG_ON(mfn_eq(l3mfn, INVALID_MFN));
             pl3e = map_domain_page(l3mfn);
@@ -1656,7 +1656,7 @@ void __init efi_init_memory(void)
         pl3e += l3_table_offset(addr);
         if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
         {
-            mfn_t l2mfn = alloc_xen_pagetable_new();
+            mfn_t l2mfn = alloc_xen_pagetable();
 
             BUG_ON(mfn_eq(l2mfn, INVALID_MFN));
             pl2e = map_domain_page(l2mfn);
@@ -1671,7 +1671,7 @@ void __init efi_init_memory(void)
         pl2e += l2_table_offset(addr);
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
-            mfn_t l1mfn = alloc_xen_pagetable_new();
+            mfn_t l1mfn = alloc_xen_pagetable();
 
             BUG_ON(mfn_eq(l1mfn, INVALID_MFN));
             l1t = map_domain_page(l1mfn);
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index cf855b48fd..ef7a20ac7d 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -583,8 +583,8 @@ int vcpu_destroy_pagetables(struct vcpu *);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
-mfn_t alloc_xen_pagetable_new(void);
-void free_xen_pagetable_new(mfn_t mfn);
+mfn_t alloc_xen_pagetable(void);
+void free_xen_pagetable(mfn_t mfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
 
-- 
2.24.1.AMZN


