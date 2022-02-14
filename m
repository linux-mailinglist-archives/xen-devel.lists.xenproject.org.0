Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88B4B5164
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271941.466701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDk-00042L-35; Mon, 14 Feb 2022 13:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271941.466701; Mon, 14 Feb 2022 13:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDj-0003zG-VC; Mon, 14 Feb 2022 13:16:47 +0000
Received: by outflank-mailman (input) for mailman id 271941;
 Mon, 14 Feb 2022 13:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4F-0008IH-Cc
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb8b33b2-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:57 +0100 (CET)
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
X-Inumbo-ID: fb8b33b2-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Mej6N2PECBXwwElk/AVZTwxR6YCdehxfIEnvABetLnE=;
  b=ddeI0GA2NG5fEWunYEzgTst/T8YrJGF9ORjC6WsJgcnZRIHmGnk1bsYf
   nX++QGlZTrF7JHs4C7gm0m7BNAOqiXX4R+hLJsWqLG+ZlCYJ8TS5hIqwN
   dL5jN2YgI/MCGUlAklebq7fl6ZWZ7s4ofnlzU10VNmK8KIIRBQagStXHq
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4xuPf0XVUbXgWG0v6rS7g0s9+dMqxffyXCBK0hrLTCa9u6ylaVMULtaJR697DxZ6PVle1cTTxw
 TvPZ0va8h/gcdAZVeV0Xrf9VMKnAHJJ1pmGwIN1Gj1H3fMDV0XyP6XUqeqVaWOuVPHr/3qr4mM
 veLJ/OBXAePlVJQsIaSPCTBUUEmCxz2/Li/xfaJJnPv2fUAOdr/uNL0UMr1S4mEyMX4urIR/vT
 e4iESUp8TmMacNBHMQcSsLPUhTz0kX/LDFR8wPt+ktMnXRB4kU4aRR/f8IXzXf9ZITLFfIVrIY
 +beXpwySc4UuVvYd3FHWPpI7
X-SBRS: 5.1
X-MesageID: 64554298
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qTxo7qpaha/Fuq7jhrFlBmk6T4leBmIAYhIvgKrLsJaIsI4StFCzt
 garIBmHO6yJZmunLtBxOY+zpBgFu8TXxoQyHlNprC03RntBp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbbqRw15FKeVoedDTisHOSVAPu5/qZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZENGY1PUSojxtnPVgGGI0UwvmTi0b5UQZF+WOJvvMNyj2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16KVGj3qc02hvJnDVVUUBIEwvgyRWktqKgc/gFJ
 UZE0CB3lKts6X70ZN3DXF6B8VfR63bwROFsO+E97QiMzI/d7ACYGnUIQ1Z9VTA2iCMlbWd0j
 wHUxrsFERQq6eTIEizFqt94uBvvYXB9EIMUWcMToeLpCfHHqZp7sB/AR80L/EWd3oysQmGYL
 9xnQUEDa1QvYSwjiv/TEbPv2WvESn31oukdvFu/Y45dxlklDLNJnqTxgbQh0d5OLZyCUn6Kt
 2Uels6V4YgmVM/RyHPdELhQROjyvZ5p1QEwZnY1QfEcG8mFoSb/Lei8HhkiTKuWDir0UWCwO
 xKC0e+gzJRSIGGrfcdKj3GZUKwXIVzbPY29DJj8N4MWCrAoLVPv1Hw+NCa4gjG2+GBxwP5XB
 HtuWZv1ZZrsIf88l2TeqiZ0+eJD+x3SMkuNGcGln0z/i+L2ibz8Ye5tDWZip9sRtMusyDg5O
 f4FbJPiJ8x3XLKsby/J35QUKFxWf3E3CYqv855cd/KZIxogE2YkUqeDzbQkco1jvqJUiuaXo
 S3tBh4GkALy1S/dNAGHSnF/c7ezD5xxmm02YH43NlGy1nl9PYv2tPUDd4E6dKUM/fB4yaImV
 OEMfsiNW6wdSjnO9zkHQ4P6qYhuKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSl07XsjMaf+pw1eghlQnmbp/DxnSP91eWETw64w2eSb/ueA6fpMXIhLZyzrEi
 wvPWUUEpfPAqpMe+cXSgfzWtJ+gFuZzExYIH2Tf6rrqZyDW8nD6nN1FWeeMOzvcSHn16OOpY
 uAMl6PwN/gOnVBrtYtgEuk0kfJitoW3/7IKnB55GHjrbkiwDuIyK3aL6sBDq6lRy+ILogCxQ
 E+OpoFXNLjh1BkJy7LNyN7Jtti+6Mw=
IronPort-HdrOrdr: A9a23:9CJNna6Vyk/F5eKSygPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554298"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 30/70] xen/misc: CFI hardening
Date: Mon, 14 Feb 2022 12:50:47 +0000
Message-ID: <20220214125127.17985-31-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm.c                        | 6 ++++--
 xen/arch/x86/setup.c                     | 4 ++--
 xen/common/domain.c                      | 2 +-
 xen/common/gdbstub.c                     | 5 ++---
 xen/common/livepatch.c                   | 7 +++----
 xen/common/memory.c                      | 4 ++--
 xen/common/page_alloc.c                  | 2 +-
 xen/common/radix-tree.c                  | 4 ++--
 xen/common/rangeset.c                    | 2 +-
 xen/common/spinlock.c                    | 6 +++---
 xen/common/vm_event.c                    | 6 +++---
 xen/common/xmalloc_tlsf.c                | 4 ++--
 xen/drivers/passthrough/amd/iommu_init.c | 2 +-
 13 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 3b8bc3dda977..4b6956c5be78 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -835,7 +835,8 @@ struct mmio_emul_range_ctxt {
     unsigned long mfn;
 };
 
-static int print_mmio_emul_range(unsigned long s, unsigned long e, void *arg)
+static int cf_check print_mmio_emul_range(
+    unsigned long s, unsigned long e, void *arg)
 {
     const struct mmio_emul_range_ctxt *ctxt = arg;
 
@@ -4606,7 +4607,8 @@ static int _handle_iomem_range(unsigned long s, unsigned long e,
     return 0;
 }
 
-static int handle_iomem_range(unsigned long s, unsigned long e, void *p)
+static int cf_check handle_iomem_range(
+    unsigned long s, unsigned long e, void *p)
 {
     int err = 0;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eceff0a4e2b4..735f69d2cae8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2023,8 +2023,8 @@ int __hwdom_init xen_in_range(unsigned long mfn)
     return 0;
 }
 
-static int __hwdom_init io_bitmap_cb(unsigned long s, unsigned long e,
-                                     void *ctx)
+static int __hwdom_init cf_check io_bitmap_cb(
+    unsigned long s, unsigned long e, void *ctx)
 {
     struct domain *d = ctx;
     unsigned int i;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index a49c26064601..a3614539e472 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -370,7 +370,7 @@ static void cf_check _free_pirq_struct(struct rcu_head *head)
     xfree(container_of(head, struct pirq, rcu_head));
 }
 
-static void free_pirq_struct(void *ptr)
+static void cf_check free_pirq_struct(void *ptr)
 {
     struct pirq *pirq = ptr;
 
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index 079c3ca9616a..d6872721dc0d 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -69,7 +69,7 @@ static void gdb_smp_resume(void);
 static char __initdata opt_gdb[30];
 string_param("gdb", opt_gdb);
 
-static void gdbstub_console_puts(const char *str, size_t nr);
+static void cf_check gdbstub_console_puts(const char *str, size_t nr);
 
 /* value <-> char (de)serialzers */
 static char
@@ -546,8 +546,7 @@ __gdb_ctx = {
 };
 static struct gdb_context *gdb_ctx = &__gdb_ctx;
 
-static void
-gdbstub_console_puts(const char *str, size_t nr)
+static void cf_check gdbstub_console_puts(const char *str, size_t nr)
 {
     const char *p;
 
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index e8714920dc8f..ec301a9f120c 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -157,10 +157,9 @@ unsigned long livepatch_symbols_lookup_by_name(const char *symname)
     return 0;
 }
 
-static const char *livepatch_symbols_lookup(unsigned long addr,
-                                            unsigned long *symbolsize,
-                                            unsigned long *offset,
-                                            char *namebuf)
+static const char *cf_check livepatch_symbols_lookup(
+    unsigned long addr, unsigned long *symbolsize, unsigned long *offset,
+    char *namebuf)
 {
     const struct payload *data;
     unsigned int i, best;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index ede45c4af9db..69b0cd1e50de 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1051,8 +1051,8 @@ struct get_reserved_device_memory {
     unsigned int used_entries;
 };
 
-static int get_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr,
-                                      u32 id, void *ctxt)
+static int cf_check get_reserved_device_memory(
+    xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
 {
     struct get_reserved_device_memory *grdm = ctxt;
     uint32_t sbdf = PCI_SBDF3(grdm->map.dev.pci.seg, grdm->map.dev.pci.bus,
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3caf5c954b24..46357182375a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1238,7 +1238,7 @@ struct scrub_wait_state {
     bool drop;
 };
 
-static void scrub_continue(void *data)
+static void cf_check scrub_continue(void *data)
 {
     struct scrub_wait_state *st = data;
 
diff --git a/xen/common/radix-tree.c b/xen/common/radix-tree.c
index 33b47748ae49..adc3034222dc 100644
--- a/xen/common/radix-tree.c
+++ b/xen/common/radix-tree.c
@@ -52,7 +52,7 @@ struct rcu_node {
 	struct rcu_head rcu_head;
 };
 
-static struct radix_tree_node *rcu_node_alloc(void *arg)
+static struct radix_tree_node *cf_check rcu_node_alloc(void *arg)
 {
 	struct rcu_node *rcu_node = xmalloc(struct rcu_node);
 	return rcu_node ? &rcu_node->node : NULL;
@@ -65,7 +65,7 @@ static void cf_check _rcu_node_free(struct rcu_head *head)
 	xfree(rcu_node);
 }
 
-static void rcu_node_free(struct radix_tree_node *node, void *arg)
+static void cf_check rcu_node_free(struct radix_tree_node *node, void *arg)
 {
 	struct rcu_node *rcu_node = container_of(node, struct rcu_node, node);
 	call_rcu(&rcu_node->rcu_head, _rcu_node_free);
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 885b6b15c229..a6ef2640462a 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -384,7 +384,7 @@ int rangeset_consume_ranges(struct rangeset *r,
     return rc;
 }
 
-static int merge(unsigned long s, unsigned long e, void *data)
+static int cf_check merge(unsigned long s, unsigned long e, void *data)
 {
     struct rangeset *r = data;
 
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 25bfbf3c47f7..62c83aaa6a73 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -375,7 +375,7 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
     spin_unlock(&lock_profile_lock);
 }
 
-static void spinlock_profile_print_elem(struct lock_profile *data,
+static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
     int32_t type, int32_t idx, void *par)
 {
     struct spinlock *lock = data->lock;
@@ -404,7 +404,7 @@ void cf_check spinlock_profile_printall(unsigned char key)
     spinlock_profile_iterate(spinlock_profile_print_elem, NULL);
 }
 
-static void spinlock_profile_reset_elem(struct lock_profile *data,
+static void cf_check spinlock_profile_reset_elem(struct lock_profile *data,
     int32_t type, int32_t idx, void *par)
 {
     data->lock_cnt = 0;
@@ -428,7 +428,7 @@ typedef struct {
     int                      rc;
 } spinlock_profile_ucopy_t;
 
-static void spinlock_profile_ucopy_elem(struct lock_profile *data,
+static void cf_check spinlock_profile_ucopy_elem(struct lock_profile *data,
     int32_t type, int32_t idx, void *par)
 {
     spinlock_profile_ucopy_t *p = par;
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 70ab3ba406ff..84cf52636bc4 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -523,21 +523,21 @@ int __vm_event_claim_slot(struct domain *d, struct vm_event_domain *ved,
 
 #ifdef CONFIG_MEM_PAGING
 /* Registered with Xen-bound event channel for incoming notifications. */
-static void mem_paging_notification(struct vcpu *v, unsigned int port)
+static void cf_check mem_paging_notification(struct vcpu *v, unsigned int port)
 {
     vm_event_resume(v->domain, v->domain->vm_event_paging);
 }
 #endif
 
 /* Registered with Xen-bound event channel for incoming notifications. */
-static void monitor_notification(struct vcpu *v, unsigned int port)
+static void cf_check monitor_notification(struct vcpu *v, unsigned int port)
 {
     vm_event_resume(v->domain, v->domain->vm_event_monitor);
 }
 
 #ifdef CONFIG_MEM_SHARING
 /* Registered with Xen-bound event channel for incoming notifications. */
-static void mem_sharing_notification(struct vcpu *v, unsigned int port)
+static void cf_check mem_sharing_notification(struct vcpu *v, unsigned int port)
 {
     vm_event_resume(v->domain, v->domain->vm_event_share);
 }
diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index e3f6886e6b62..d2ad909502d0 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -512,13 +512,13 @@ int xmem_pool_maxalloc(struct xmem_pool *pool)
 
 static struct xmem_pool *xenpool;
 
-static void *xmalloc_pool_get(unsigned long size)
+static void *cf_check xmalloc_pool_get(unsigned long size)
 {
     ASSERT(size == PAGE_SIZE);
     return alloc_xenheap_page();
 }
 
-static void xmalloc_pool_put(void *p)
+static void cf_check xmalloc_pool_put(void *p)
 {
     free_xenheap_page(p);
 }
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 06b4d2b1fea0..cebcd68a6c04 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1073,7 +1073,7 @@ static void * __init allocate_ppr_log(struct amd_iommu *iommu)
 #define IVRS_MAPPINGS_DEVTAB(m) (m)[ivrs_bdf_entries].intremap_table
 
 /* Gets passed to radix_tree_destroy(), so its param needs to be void *. */
-static void __init free_ivrs_mapping_callback(void *ptr)
+static void __init cf_check free_ivrs_mapping_callback(void *ptr)
 {
     const struct ivrs_mappings *ivrs_mappings = ptr;
 
-- 
2.11.0


