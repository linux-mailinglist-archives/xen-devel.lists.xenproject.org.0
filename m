Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO77C0smk2kX1wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:14:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC0144780
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:14:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234163.1537511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytR-0008PK-Ry; Mon, 16 Feb 2026 13:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234163.1537511; Mon, 16 Feb 2026 13:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytR-0008Mc-Ny; Mon, 16 Feb 2026 13:44:05 +0000
Received: by outflank-mailman (input) for mailman id 1234163;
 Mon, 16 Feb 2026 13:44:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0bf=AU=bounce.vates.tech=bounce-md_30504962.69931f1f.v1-d76f599d107e4e6ba4639d252a67c5d0@srs-se1.protection.inumbo.net>)
 id 1vrytQ-0007hl-4E
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 13:44:04 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cbf39b9-0b3d-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 14:44:01 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fF3sC5nCbzPm0PZr
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 13:43:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d76f599d107e4e6ba4639d252a67c5d0; Mon, 16 Feb 2026 13:43:59 +0000
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
X-Inumbo-ID: 8cbf39b9-0b3d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771249439; x=1771519439;
	bh=F1SS3wigxhXzgwX235EXJtDoch2rIlhw5Qmf1Ym2oJI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hrwo6tnjMsuP5FJAbw7H9IKcfR04O4r/m1VC9UPyULUm4kcvgPqhG5A3nd52LL8Dm
	 kgzaR0MqqevAnFbZwoyI7uXqKynbQV5xaABLZB4IAcgtvwq7yjT+x7hmhY8dujlpam
	 bpk2e+Ujh7t4fsydpmC6mfPYwAPLBxLfdNNfqekpy/FMn6tNigBcEInGzFC8nO4INS
	 ZcOIiyabo1MhrvYKYTkTMD4+xj/EzI/Lee7xgq6vqXyGJVETftDgV7kKEZO42yFa5T
	 1mNufl1Lgvv2KfnO8VMFdGr7y9AqtUYoz6G6Z7bakn1AoqLQKcpmKqHkzRDwUygzRl
	 vlOQYmK+jRlYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771249439; x=1771509939; i=julian.vetter@vates.tech;
	bh=F1SS3wigxhXzgwX235EXJtDoch2rIlhw5Qmf1Ym2oJI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ruFgZSOnc9hZvE0PtMTt4nvSkdlNcbHeq8K7aVoAosNu4IT6Bh9wfhqZw3qs3YJJ8
	 XAuad5PYxdFcSLY5MJa1ggtlTjPz/9NgT2A71pvW7BV+QH1pt4HPHLtXPCCbRAKXrk
	 ms3tPOw7rJQsOFdtMt+LNPNC3WKHSZia0u+sR6rSEa0W3DXqi8fHe20JJEnfCJEW18
	 CEP+SU21HMuayKRN42rg+rni7PO65AMPQ/5FbvieW/yJT1H+MXo50QzIFwIVeZSgTC
	 W+hyHo8OyucBTrKBSuHL3OTMLMWkv78dDfz1TnclECxMayV8jgM+5CZ1gT8jjgvIaO
	 RGKFJnS82QtQQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=203/3]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771249438581
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260216134334.3510048-4-julian.vetter@vates.tech>
In-Reply-To: <20260216134334.3510048-1-julian.vetter@vates.tech>
References: <20260216134334.3510048-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d76f599d107e4e6ba4639d252a67c5d0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 13:43:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 77BC0144780
X-Rspamd-Action: no action

A single shared ioreq page provides PAGE_SIZE/sizeof(ioreq_t) = 128
slots, limiting HVM guests to 128 vCPUs. To support more vCPUs, extend
the ioreq server to use xvzalloc_array() for allocating a contiguous
virtual array of ioreq_t slots sized to d->max_vcpus, backed by
potentially non-contiguous physical pages.

For the GFN-mapped path (x86), individual pages are mapped via
prepare_ring_for_helper() and then combined into a single contiguous
VA using vmap(). The number of ioreq pages is computed at runtime
via nr_ioreq_pages(d) = DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE),
so small VMs only allocate one page. All existing single-page paths
(bufioreq, legacy clients) remain unchanged.

Mark the now-unused shared_iopage_t in the public header as deprecated.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v2
- Use xvalloc_array to allocate the contigeous region
- Removed unncessary includes
- nr_ioreq_pages is now based on d->max_vcpus and not the HVM_MAX_VCPUS
  define
- Reduced indentation by 1 level in hvm_alloc_ioreq_gfns
- Added blank lines between declarations and statements
- Added comment why we can just return in hvm_add_ioreq_gfn without
  rollback
---
 xen/arch/x86/hvm/ioreq.c       | 198 ++++++++++++++++++++++++++++++++-
 xen/common/ioreq.c             |  95 ++++++++++++----
 xen/include/public/hvm/ioreq.h |   5 +
 xen/include/xen/ioreq.h        |  13 ++-
 4 files changed, 285 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 5ebc48dbd4..a77f00dd96 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -6,6 +6,7 @@
  */
 
 #include <xen/domain.h>
+#include <xen/domain_page.h>
 #include <xen/event.h>
 #include <xen/init.h>
 #include <xen/ioreq.h>
@@ -15,6 +16,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/trace.h>
+#include <xen/vmap.h>
 #include <xen/vpci.h>
 
 #include <asm/hvm/emulate.h>
@@ -89,6 +91,39 @@ static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
     return hvm_alloc_legacy_ioreq_gfn(s);
 }
 
+static gfn_t hvm_alloc_ioreq_gfns(struct ioreq_server *s,
+                                  unsigned int nr_pages)
+{
+    struct domain *d = s->target;
+    unsigned long mask;
+    unsigned int i, run;
+
+    if ( nr_pages == 1 )
+        return hvm_alloc_ioreq_gfn(s);
+
+    /* Find nr_pages consecutive set bits */
+    mask = d->arch.hvm.ioreq_gfn.mask;
+
+    for ( i = 0, run = 0; i < BITS_PER_LONG; i++ )
+    {
+        if ( !test_bit(i, &mask) )
+            run = 0;
+        else if ( ++run == nr_pages )
+        {
+            /* Found a run - clear all bits and return base GFN */
+            unsigned int start = i - nr_pages + 1;
+            unsigned int j;
+
+            for ( j = start; j <= i; j++ )
+                clear_bit(j, &d->arch.hvm.ioreq_gfn.mask);
+
+            return _gfn(d->arch.hvm.ioreq_gfn.base + start);
+        }
+    }
+
+    return INVALID_GFN;
+}
+
 static bool hvm_free_legacy_ioreq_gfn(struct ioreq_server *s,
                                       gfn_t gfn)
 {
@@ -121,11 +156,23 @@ static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
     }
 }
 
+static void hvm_free_ioreq_gfns(struct ioreq_server *s, gfn_t gfn,
+                                unsigned int nr_pages)
+{
+    unsigned int i;
+
+    for ( i = 0; i < nr_pages; i++ )
+        hvm_free_ioreq_gfn(s, gfn_add(gfn, i));
+}
+
 static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
             return;
 
@@ -134,16 +181,41 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 
         hvm_free_ioreq_gfn(s, iorp->gfn);
         iorp->gfn = INVALID_GFN;
+        return;
+    }
+
+    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+        return;
+
+    nr_pages = nr_ioreq_pages(s->target);
+
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct page_info *pg = vmap_to_page((char *)s->ioreq +
+                                            i * PAGE_SIZE);
+
+        put_page_and_type(pg);
+        put_page(pg);
     }
+    vunmap(s->ioreq);
+    s->ioreq = NULL;
+
+    hvm_free_ioreq_gfns(s, s->ioreq_gfn, nr_pages);
+    s->ioreq_gfn = INVALID_GFN;
 }
 
 static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages;
+    gfn_t base_gfn;
+    mfn_t *mfns;
     int rc;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( iorp->page )
         {
             /*
@@ -173,30 +245,122 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 
         return rc;
     }
+
+    /* ioreq: multi-page with contiguous VA */
+    if ( s->ioreq )
+    {
+        if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+            return -EPERM;
+        return 0;
+    }
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    nr_pages = nr_ioreq_pages(d);
+    base_gfn = hvm_alloc_ioreq_gfns(s, nr_pages);
+
+    if ( gfn_eq(base_gfn, INVALID_GFN) )
+        return -ENOMEM;
+
+    mfns = xmalloc_array(mfn_t, nr_pages);
+    if ( !mfns )
+    {
+        hvm_free_ioreq_gfns(s, base_gfn, nr_pages);
+        return -ENOMEM;
+    }
+
+    /*
+     * Use prepare_ring_for_helper() to obtain page and type references
+     * for each GFN. Discard its per-page VA immediately, as all pages
+     * will be combined into a single contiguous VA via vmap() below.
+     */
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct page_info *pg;
+        void *va;
+
+        rc = prepare_ring_for_helper(d, gfn_x(base_gfn) + i, &pg, &va);
+        if ( rc )
+            goto fail;
+
+        /* Discard per-page VA */
+        unmap_domain_page_global(va);
+        mfns[i] = page_to_mfn(pg);
+    }
+
+    /* Map all mfns as single contiguous VA */
+    s->ioreq = vmap(mfns, nr_pages);
+    if ( !s->ioreq )
+    {
+        rc = -ENOMEM;
+        goto fail;
+    }
+
+    s->ioreq_gfn = base_gfn;
+    xfree(mfns);
+
+    return 0;
+
+ fail:
+    while ( i-- > 0 )
+    {
+        struct page_info *pg = mfn_to_page(mfns[i]);
+
+        put_page_and_type(pg);
+        put_page(pg);
+    }
+    hvm_free_ioreq_gfns(s, base_gfn, nr_pages);
+    xfree(mfns);
+
+    return rc;
 }
 
 static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
             return;
 
         if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
             domain_crash(d);
         clear_page(iorp->va);
+        return;
+    }
+
+    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+        return;
+
+    nr_pages = nr_ioreq_pages(d);
+
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        gfn_t gfn = gfn_add(s->ioreq_gfn, i);
+        struct page_info *pg = vmap_to_page((char *)s->ioreq +
+                                            i * PAGE_SIZE);
+
+        if ( p2m_remove_page(d, gfn, page_to_mfn(pg), 0) )
+            domain_crash(d);
     }
+    memset(s->ioreq, 0, nr_pages * PAGE_SIZE);
 }
 
 static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages;
     int rc;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
             return 0;
 
@@ -208,6 +372,32 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 
         return rc;
     }
+
+    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+        return 0;
+
+    nr_pages = nr_ioreq_pages(d);
+    memset(s->ioreq, 0, nr_pages * PAGE_SIZE);
+
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        gfn_t gfn = gfn_add(s->ioreq_gfn, i);
+        struct page_info *pg = vmap_to_page((char *)s->ioreq +
+                                            i * PAGE_SIZE);
+
+        rc = p2m_add_page(d, gfn, page_to_mfn(pg), 0, p2m_ram_rw);
+        if ( rc )
+            /*
+             * No rollback of previously added pages: The caller
+             * (arch_ioreq_server_disable) has no error handling path,
+             * and partial failure here will be cleaned up when the
+             * ioreq server is eventually destroyed.
+             */
+            return rc;
+
+        paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn)));
+    }
+    return 0;
 }
 
 int arch_ioreq_server_map_pages(struct ioreq_server *s)
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 5d722c8d4e..0ad86d3af3 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -26,6 +26,7 @@
 #include <xen/paging.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/guest_atomics.h>
 #include <asm/ioreq.h>
@@ -95,12 +96,10 @@ static struct ioreq_server *get_ioreq_server(const struct domain *d,
 
 static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
 {
-    shared_iopage_t *p = s->ioreq.va;
-
     ASSERT((v == current) || !vcpu_runnable(v));
-    ASSERT(p != NULL);
+    ASSERT(s->ioreq != NULL);
 
-    return &p->vcpu_ioreq[v->vcpu_id];
+    return &s->ioreq[v->vcpu_id];
 }
 
 /*
@@ -260,9 +259,32 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
 
 static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp;
     struct page_info *page;
 
+    if ( !buf )
+    {
+        if ( s->ioreq )
+        {
+            /*
+             * If a guest frame has already been mapped (which may happen
+             * on demand if ioreq_server_get_info() is called), then
+             * allocating a page is not permitted.
+             */
+            if ( !gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+                return -EPERM;
+
+            return 0;
+        }
+
+        s->ioreq = xvzalloc_array(ioreq_t, s->target->max_vcpus);
+
+        return s->ioreq ? 0 : -ENOMEM;
+    }
+
+    /* bufioreq: single page allocation */
+    iorp = &s->bufioreq;
+
     if ( iorp->page )
     {
         /*
@@ -309,8 +331,17 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 
 static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page = iorp->page;
+    struct ioreq_page *iorp;
+    struct page_info *page;
+
+    if ( !buf )
+    {
+        XVFREE(s->ioreq);
+        return;
+    }
+
+    iorp = &s->bufioreq;
+    page = iorp->page;
 
     if ( !page )
         return;
@@ -334,11 +365,29 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
+        if ( s->bufioreq.page == page )
         {
             found = true;
             break;
         }
+
+        if ( s->ioreq )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < nr_ioreq_pages(d); i++ )
+            {
+                if ( vmap_to_page((char *)s->ioreq +
+                                  i * PAGE_SIZE) == page )
+                {
+                    found = true;
+                    break;
+                }
+            }
+
+            if ( found )
+                break;
+        }
     }
 
     rspin_unlock(&d->ioreq_server.lock);
@@ -351,7 +400,7 @@ static void ioreq_server_update_evtchn(struct ioreq_server *s,
 {
     ASSERT(spin_is_locked(&s->lock));
 
-    if ( s->ioreq.va != NULL )
+    if ( s->ioreq != NULL )
     {
         ioreq_t *p = get_ioreq(s, sv->vcpu);
 
@@ -591,7 +640,7 @@ static int ioreq_server_init(struct ioreq_server *s,
     INIT_LIST_HEAD(&s->ioreq_vcpu_list);
     spin_lock_init(&s->bufioreq_lock);
 
-    s->ioreq.gfn = INVALID_GFN;
+    s->ioreq_gfn = INVALID_GFN;
     s->bufioreq.gfn = INVALID_GFN;
 
     rc = ioreq_server_alloc_rangesets(s, id);
@@ -770,7 +819,7 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
     }
 
     if ( ioreq_gfn )
-        *ioreq_gfn = gfn_x(s->ioreq.gfn);
+        *ioreq_gfn = gfn_x(s->ioreq_gfn);
 
     if ( HANDLE_BUFIOREQ(s) )
     {
@@ -813,26 +862,30 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
     if ( rc )
         goto out;
 
-    switch ( idx )
+    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq)
     {
-    case XENMEM_resource_ioreq_server_frame_bufioreq:
         rc = -ENOENT;
         if ( !HANDLE_BUFIOREQ(s) )
             goto out;
 
         *mfn = page_to_mfn(s->bufioreq.page);
         rc = 0;
-        break;
-
-    case XENMEM_resource_ioreq_server_frame_ioreq(0):
-        *mfn = page_to_mfn(s->ioreq.page);
-        rc = 0;
-        break;
+    }
+    else if (( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) ) &&
+             ( idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) ))
+    {
+        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
 
-    default:
         rc = -EINVAL;
-        break;
+        if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&
+             page_idx < nr_ioreq_pages(d) && s->ioreq )
+        {
+            *mfn = vmap_to_mfn((char *)s->ioreq + page_idx * PAGE_SIZE);
+            rc = 0;
+        }
     }
+    else
+        rc = -EINVAL;
 
  out:
     rspin_unlock(&d->ioreq_server.lock);
diff --git a/xen/include/public/hvm/ioreq.h b/xen/include/public/hvm/ioreq.h
index 7a6bc760d0..1c1a9e61ae 100644
--- a/xen/include/public/hvm/ioreq.h
+++ b/xen/include/public/hvm/ioreq.h
@@ -49,6 +49,11 @@ struct ioreq {
 };
 typedef struct ioreq ioreq_t;
 
+/*
+ * Deprecated: shared_iopage is no longer used by Xen internally.
+ * The ioreq server now uses a dynamically sized ioreq_t array
+ * to support more than 128 vCPUs.
+ */
 struct shared_iopage {
     struct ioreq vcpu_ioreq[1];
 };
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index e86f0869fa..a4c7621f3f 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -19,9 +19,19 @@
 #ifndef __XEN_IOREQ_H__
 #define __XEN_IOREQ_H__
 
+#include <xen/macros.h>
 #include <xen/sched.h>
 
 #include <public/hvm/dm_op.h>
+#include <public/hvm/ioreq.h>
+
+/* 4096 / 32 = 128 ioreq slots per page */
+#define IOREQS_PER_PAGE  (PAGE_SIZE / sizeof(ioreq_t))
+
+static inline unsigned int nr_ioreq_pages(const struct domain *d)
+{
+    return DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE);
+}
 
 struct ioreq_page {
     gfn_t gfn;
@@ -45,7 +55,8 @@ struct ioreq_server {
     /* Lock to serialize toolstack modifications */
     spinlock_t             lock;
 
-    struct ioreq_page      ioreq;
+    ioreq_t                *ioreq;
+    gfn_t                  ioreq_gfn;
     struct list_head       ioreq_vcpu_list;
     struct ioreq_page      bufioreq;
 
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


