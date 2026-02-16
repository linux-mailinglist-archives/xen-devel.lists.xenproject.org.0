Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PnnAZwkk2kX1wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:07:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CEE1446FC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234162.1537497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytQ-000801-LX; Mon, 16 Feb 2026 13:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234162.1537497; Mon, 16 Feb 2026 13:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytQ-0007xF-G1; Mon, 16 Feb 2026 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1234162;
 Mon, 16 Feb 2026 13:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfU3=AU=bounce.vates.tech=bounce-md_30504962.69931f1f.v1-b9b5c5ead9004716bf05dfc35d46d2e5@srs-se1.protection.inumbo.net>)
 id 1vrytP-0007hl-4B
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 13:44:03 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c74fc17-0b3d-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 14:44:01 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fF3sC4xYlzPm0PYM
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 13:43:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b9b5c5ead9004716bf05dfc35d46d2e5; Mon, 16 Feb 2026 13:43:59 +0000
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
X-Inumbo-ID: 8c74fc17-0b3d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771249439; x=1771519439;
	bh=8ylKuGd2BMY1tYigbaDonsjt+0UlJARYpSIysh5XnsQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=g3t1tEAUX/Hwr7m69E0W6oiHtXKiEPgfO9J9r4Z5VzSohA553lrdkgklB4mX72s2P
	 3gZtkRT6aOUSXkfDOrcF1sjWow0otGnD9CGDaB4v5hnUvP2ZJ7QsP9JuDglXBE89u8
	 0JqBL3PADqwtBprHaEsbmVZ9k1+F3K1f7ATksZtekspbs2YtqFdGZDRZgizTxDRf3e
	 5ym27DIri9lwjxEOJiThMdrgbW0Jh/3wj/JXhckr++8YGZ0LLIJI+Q9zTjYuZTF8h1
	 C/e6XAeiDSF5I7wQVynccrtvlQ+D90eqaYFS92Em4GUV8PWuN1HBNfPn6nfYIM3JqZ
	 ECH7h836za+xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771249439; x=1771509939; i=julian.vetter@vates.tech;
	bh=8ylKuGd2BMY1tYigbaDonsjt+0UlJARYpSIysh5XnsQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zFWanLLTSQ9GDGybif5GeUk2sTb9nGOi87qcVSLNwYp9WwWTRK3X7o5zmh4GM2T5L
	 lu4SgSRayHsFwuXr9hzLwB2fUQBZK1C5Bje/LVEIQYmsUO+W+IzkfhfmCBqaihsv5A
	 aTfiNTUCg2jDXeRAKb2/5P0gG6JdEoZ6wunpR+A7U4wVDVgO5DgFh7aHUY/hoPB4SC
	 CND4AJTSmBivv/hiChQaWKv+O1TfpX+yDDWlh81YnYqZycPGkYlLSz7a4yX8ee9cev
	 Qhouf0t8THvQfQxNpFWWeGF8Oijh3iZ4A5l8lpKN+Gf8diyztHMhO39URbj3A2JSp/
	 3BvIwKAqW46Ng==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=202/3]=20x86/ioreq:=20Prepare=20spacing=20for=20upcoming=20patch?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771249437847
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260216134334.3510048-3-julian.vetter@vates.tech>
In-Reply-To: <20260216134334.3510048-1-julian.vetter@vates.tech>
References: <20260216134334.3510048-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b9b5c5ead9004716bf05dfc35d46d2e5?=
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
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
X-Rspamd-Queue-Id: 58CEE1446FC
X-Rspamd-Action: no action

This patch just changes indentation, to make the next patch easier to
review.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v2
- New patch
---
 xen/arch/x86/hvm/ioreq.c | 86 ++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 39 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..5ebc48dbd4 100644
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
@@ -176,12 +180,14 @@ static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct domain *d = s->target;
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return;
 
-    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
-        domain_crash(d);
-    clear_page(iorp->va);
+        if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
+            domain_crash(d);
+        clear_page(iorp->va);
+    }
 }
 
 static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
@@ -190,16 +196,18 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     int rc;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return 0;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return 0;
 
-    clear_page(iorp->va);
+        clear_page(iorp->va);
 
-    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
-    if ( rc == 0 )
-        paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
+        rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
+        if ( rc == 0 )
+            paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
 
-    return rc;
+        return rc;
+    }
 }
 
 int arch_ioreq_server_map_pages(struct ioreq_server *s)
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


