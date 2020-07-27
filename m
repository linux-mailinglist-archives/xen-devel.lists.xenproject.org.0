Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F029122F272
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:40:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04ID-0000eA-3g; Mon, 27 Jul 2020 14:39:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k04IC-0000dz-0t
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:39:52 +0000
X-Inumbo-ID: 06c48874-d017-11ea-a7dc-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06c48874-d017-11ea-a7dc-12813bfff9fa;
 Mon, 27 Jul 2020 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ky65fKbvqZ7A8L5Gk8ErEdsQ2qdgoYphiYBmd6L4iJg=; b=DVityTAwQyVGVd1B7Zqmo7qwz0
 vevx4Ecb6lvT+slCDPePZ0AhFfzNmvQOEyGc77ehhHQM/d0F6+xt3YgPwihcyWRboZ9N9bpyXrDg3
 NdHVJvlhalWof5smlhW08eCrKeI7PUxMmDjryzY5ypRY9/zl2nrZfWOnndl+WcofOeas=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k04IA-0001kl-1W; Mon, 27 Jul 2020 14:39:50 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041W-0002w6-H1; Mon, 27 Jul 2020 14:22:38 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 15/15] x86/mm: drop _new suffix for page table APIs
Date: Mon, 27 Jul 2020 15:22:05 +0100
Message-Id: <5ee357f27bb604305dca480fecb8b56e9de5d8d3.1595857947.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm.c        | 44 ++++++++++++++++++++++----------------------
 xen/arch/x86/smpboot.c   |  6 +++---
 xen/arch/x86/x86_64/mm.c |  2 +-
 xen/include/asm-x86/mm.h |  4 ++--
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 8348f6329f..465a5bf0df 100644
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
@@ -4931,7 +4931,7 @@ int mmcfg_intercept_write(
  * them. The caller must check whether the allocation has succeeded, and only
  * pass valid MFNs to map_domain_page().
  */
-mfn_t alloc_xen_pagetable_new(void)
+mfn_t alloc_xen_pagetable(void)
 {
     if ( system_state != SYS_STATE_early_boot )
     {
@@ -4945,7 +4945,7 @@ mfn_t alloc_xen_pagetable_new(void)
 }
 
 /* mfn can be INVALID_MFN */
-void free_xen_pagetable_new(mfn_t mfn)
+void free_xen_pagetable(mfn_t mfn)
 {
     if ( system_state != SYS_STATE_early_boot && !mfn_eq(mfn, INVALID_MFN) )
         free_domheap_page(mfn_to_page(mfn));
@@ -4953,7 +4953,7 @@ void free_xen_pagetable_new(mfn_t mfn)
 
 void *alloc_map_clear_xen_pt(mfn_t *pmfn)
 {
-    mfn_t mfn = alloc_xen_pagetable_new();
+    mfn_t mfn = alloc_xen_pagetable();
     void *ret;
 
     if ( mfn_eq(mfn, INVALID_MFN) )
@@ -4999,7 +4999,7 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l3mfn);
+        free_xen_pagetable(l3mfn);
     }
 
     return map_l3t_from_l4e(*pl4e) + l3_table_offset(v);
@@ -5034,7 +5034,7 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l2mfn);
+        free_xen_pagetable(l2mfn);
     }
 
     BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
@@ -5073,7 +5073,7 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l1mfn);
+        free_xen_pagetable(l1mfn);
     }
 
     BUG_ON(l2e_get_flags(*pl2e) & _PAGE_PSE);
@@ -5182,10 +5182,10 @@ int map_pages_to_xen(
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
 
@@ -5224,7 +5224,7 @@ int map_pages_to_xen(
                 continue;
             }
 
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5252,7 +5252,7 @@ int map_pages_to_xen(
                 spin_unlock(&map_pgdir_lock);
             flush_area(virt, flush_flags);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         pl2e = virt_to_xen_l2e(virt);
@@ -5286,7 +5286,7 @@ int map_pages_to_xen(
                         flush_flags(l1e_get_flags(l1t[i]));
                     flush_area(virt, flush_flags);
                     unmap_domain_page(l1t);
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
             }
 
@@ -5331,7 +5331,7 @@ int map_pages_to_xen(
                     goto check_l3;
                 }
 
-                l1mfn = alloc_xen_pagetable_new();
+                l1mfn = alloc_xen_pagetable();
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
 
@@ -5358,7 +5358,7 @@ int map_pages_to_xen(
                     spin_unlock(&map_pgdir_lock);
                 flush_area(virt, flush_flags);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
 
             pl1e  = map_l1t_from_l2e(*pl2e) + l1_table_offset(virt);
@@ -5424,7 +5424,7 @@ int map_pages_to_xen(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5475,7 +5475,7 @@ int map_pages_to_xen(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable_new(l3e_get_mfn(ol3e));
+                free_xen_pagetable(l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5564,7 +5564,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             }
 
             /* PAGE1GB: shatter the superpage and fall through. */
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5588,7 +5588,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         /*
@@ -5624,7 +5624,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             {
                 l1_pgentry_t *l1t;
                 /* PSE: shatter the superpage and try again. */
-                mfn_t l1mfn = alloc_xen_pagetable_new();
+                mfn_t l1mfn = alloc_xen_pagetable();
 
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
@@ -5648,7 +5648,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
         }
         else
@@ -5715,7 +5715,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5760,7 +5760,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l2mfn);
+                free_xen_pagetable(l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index f431f526da..a01412a986 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -902,15 +902,15 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
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
index 640f561faf..74c0bbb4aa 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -622,7 +622,7 @@ void __init paging_init(void)
     UNMAP_DOMAIN_PAGE(l3_ro_mpt);
 
     /* Create user-accessible L2 directory to map the MPT for compat guests. */
-    mfn = alloc_xen_pagetable_new();
+    mfn = alloc_xen_pagetable();
     if ( mfn_eq(mfn, INVALID_MFN) )
         goto nomem;
     compat_idle_pg_table_l2 = map_domain_page_global(mfn);
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 1bd8198133..908d67664d 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -582,8 +582,8 @@ int vcpu_destroy_pagetables(struct vcpu *);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
-mfn_t alloc_xen_pagetable_new(void);
-void free_xen_pagetable_new(mfn_t mfn);
+mfn_t alloc_xen_pagetable(void);
+void free_xen_pagetable(mfn_t mfn);
 void *alloc_map_clear_xen_pt(mfn_t *pmfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
-- 
2.16.6


