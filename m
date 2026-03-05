Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IdvLcuEqWkd9gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:27:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200AC212953
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246591.1545707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy8Nk-0007jB-RL; Thu, 05 Mar 2026 13:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246591.1545707; Thu, 05 Mar 2026 13:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy8Nk-0007h5-OY; Thu, 05 Mar 2026 13:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1246591;
 Thu, 05 Mar 2026 13:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q3zb=BF=bounce.vates.tech=bounce-md_30504962.69a97f6b.v1-95b08eaea145431cae23f4ba27e0cbb9@srs-se1.protection.inumbo.net>)
 id 1vy8Ni-0007gz-PC
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:04:46 +0000
Received: from mail177-30.suw61.mandrillapp.com
 (mail177-30.suw61.mandrillapp.com [198.2.177.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e114a926-1893-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 14:04:45 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-30.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4fRVB30MgxzP0Jwss
 for <xen-devel@lists.xenproject.org>; Thu,  5 Mar 2026 13:04:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 95b08eaea145431cae23f4ba27e0cbb9; Thu, 05 Mar 2026 13:04:43 +0000
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
X-Inumbo-ID: e114a926-1893-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772715883; x=1772985883;
	bh=TrtrGEbMvZfgbcOGMyLdlPsgcFAr6G1EiZiAEmMYYP4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Re3g7yp+cFZrYZBzRlxp952Ijf8uZiBvW7E96kl/ktpWgng/+b1R2gZGp6eCYK5hO
	 HPMhEIqiZDV3pkd1Hi1x3qU59qkwisQgLEEZhGNbiityaIYouF+UdVdSFHHxH/pJS5
	 IvdVJzYopZ6lG0KNRyGaL/2FaS8z8WatA6zns7pg88gXqrCvGauiMnRMKGVU5G6h8V
	 bHCtt1aHsv3TxohmfJ2MXc894Oc0CUakU8mQIb5Hq1SsH7CIE7iCPBuPZXUUPZovZM
	 t3QtUJXLV/6AuqfsqUXn+I1tf4V9ZXLcS4LnH0bYRbd3jP8Jxhr3yqRJkMVXF7oI9N
	 02W4dvQa0yeZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772715883; x=1772976383; i=julian.vetter@vates.tech;
	bh=TrtrGEbMvZfgbcOGMyLdlPsgcFAr6G1EiZiAEmMYYP4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=a0MpJmTCtW+3kw6qc0uZdcYTAMxHkvxZ7UMZ6Z/3e82tKyz+0fv2GAspLYwMjN4c9
	 LefVaYywEW1DfFisK9f88ZMtwKJF+yQd8OmjvotbaW1wTWJy3V1RA/+Y5rnRI9lpzj
	 crxf1XIZ0aRKXMLXvipzvHTUAhoAfnK1XwYpdR2XJFbuX7UP1pNhscoNqQCwzUV7DL
	 LdiGTRfi47NR5PpfN5uvlkI+23VAQd9ANlnkUqdqcR3Bab7+6IQStGmK9mKaBMFIVw
	 G44wSv3AxZWDACjTRf7nLAUVErFzN6I5T9B4ZXoMCgOpbgTJLZu30C5js2tdsmMtE0
	 fdR+0XOeZW7xg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v4=201/2]=20This=20patch=20just=20changes=20indentation,=20to=20make=20the=20next=20patch=20easier=20to=20review.?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772715881758
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260305130434.635276-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.95b08eaea145431cae23f4ba27e0cbb9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260305:md
Date: Thu, 05 Mar 2026 13:04:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 200AC212953
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.836];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v4:
- No changes to this patch
---
 xen/arch/x86/hvm/ioreq.c | 58 ++++++++++++++++---------------
 xen/common/ioreq.c       | 74 +++++++++++++++++++++-------------------
 2 files changed, 70 insertions(+), 62 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..355b2ba12c 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -125,14 +125,16 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return;
 
-    destroy_ring_for_helper(&iorp->va, iorp->page);
-    iorp->page = NULL;
+        destroy_ring_for_helper(&iorp->va, iorp->page);
+        iorp->page = NULL;
 
-    hvm_free_ioreq_gfn(s, iorp->gfn);
-    iorp->gfn = INVALID_GFN;
+        hvm_free_ioreq_gfn(s, iorp->gfn);
+        iorp->gfn = INVALID_GFN;
+    }
 }
 
 static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
@@ -141,34 +143,36 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     int rc;
 
-    if ( iorp->page )
     {
-        /*
-         * If a page has already been allocated (which will happen on
-         * demand if ioreq_server_get_frame() is called), then
-         * mapping a guest frame is not permitted.
-         */
-        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-            return -EPERM;
-
-        return 0;
-    }
+        if ( iorp->page )
+        {
+            /*
+             * If a page has already been allocated (which will happen on
+             * demand if ioreq_server_get_frame() is called), then
+             * mapping a guest frame is not permitted.
+             */
+            if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+                return -EPERM;
+
+            return 0;
+        }
 
-    if ( d->is_dying )
-        return -EINVAL;
+        if ( d->is_dying )
+            return -EINVAL;
 
-    iorp->gfn = hvm_alloc_ioreq_gfn(s);
+        iorp->gfn = hvm_alloc_ioreq_gfn(s);
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return -ENOMEM;
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return -ENOMEM;
 
-    rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
-                                 &iorp->va);
+        rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
+                                     &iorp->va);
 
-    if ( rc )
-        hvm_unmap_ioreq_gfn(s, buf);
+        if ( rc )
+            hvm_unmap_ioreq_gfn(s, buf);
 
-    return rc;
+        return rc;
+    }
 }
 
 static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..2e284ad26c 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -263,41 +263,43 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page;
 
-    if ( iorp->page )
     {
-        /*
-         * If a guest frame has already been mapped (which may happen
-         * on demand if ioreq_server_get_info() is called), then
-         * allocating a page is not permitted.
-         */
-        if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
-            return -EPERM;
+        if ( iorp->page )
+        {
+            /*
+             * If a guest frame has already been mapped (which may happen
+             * on demand if ioreq_server_get_info() is called), then
+             * allocating a page is not permitted.
+             */
+            if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
+                return -EPERM;
 
-        return 0;
-    }
+            return 0;
+        }
 
-    page = alloc_domheap_page(s->target, MEMF_no_refcount);
+        page = alloc_domheap_page(s->target, MEMF_no_refcount);
 
-    if ( !page )
-        return -ENOMEM;
+        if ( !page )
+            return -ENOMEM;
 
-    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(s->emulator);
-        return -ENODATA;
-    }
+        if ( !get_page_and_type(page, s->target, PGT_writable_page) )
+        {
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            domain_crash(s->emulator);
+            return -ENODATA;
+        }
 
-    iorp->va = __map_domain_page_global(page);
-    if ( !iorp->va )
-        goto fail;
+        iorp->va = __map_domain_page_global(page);
+        if ( !iorp->va )
+            goto fail;
 
-    iorp->page = page;
-    clear_page(iorp->va);
-    return 0;
+        iorp->page = page;
+        clear_page(iorp->va);
+        return 0;
+    }
 
  fail:
     put_page_alloc_ref(page);
@@ -311,16 +313,18 @@ static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page = iorp->page;
 
-    if ( !page )
-        return;
+    {
+        if ( !page )
+            return;
 
-    iorp->page = NULL;
+        iorp->page = NULL;
 
-    unmap_domain_page_global(iorp->va);
-    iorp->va = NULL;
+        unmap_domain_page_global(iorp->va);
+        iorp->va = NULL;
 
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
+        put_page_alloc_ref(page);
+        put_page_and_type(page);
+    }
 }
 
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


