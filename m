Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD622A92E6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 10:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20567.46575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayCo-0001ff-EB; Fri, 06 Nov 2020 09:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20567.46575; Fri, 06 Nov 2020 09:38:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayCo-0001fI-A8; Fri, 06 Nov 2020 09:38:50 +0000
Received: by outflank-mailman (input) for mailman id 20567;
 Fri, 06 Nov 2020 09:38:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kayCn-0001fA-4R
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:38:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 530704a9-601a-42ed-9867-1ea560e60947;
 Fri, 06 Nov 2020 09:38:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7535DAC35;
 Fri,  6 Nov 2020 09:38:47 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kayCn-0001fA-4R
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:38:49 +0000
X-Inumbo-ID: 530704a9-601a-42ed-9867-1ea560e60947
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 530704a9-601a-42ed-9867-1ea560e60947;
	Fri, 06 Nov 2020 09:38:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604655527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCfZA7E0DDQIE58Cvfe3oRsW91UfgHbT3ojqFCv1fG4=;
	b=O8m6+TKDxUzdQVOjFBwmmDkfYXYkV2mqTQ2qNclffpNjx401Oismzf9934kNqelYzkIUl4
	crVgBRfSr0F4kXVsiT/IeZIouNyyQDIT8WT8iQ/iyaqmdwBHDY5GLNNquMCF3LWFfKZEz/
	eZ9sE5IZVRTNccTcvc3jUmxH2eDI/Lk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7535DAC35;
	Fri,  6 Nov 2020 09:38:47 +0000 (UTC)
Subject: [PATCH v2 8/9] x86/shadow: cosmetics to sh_unshadow_for_p2m_change()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Message-ID: <db7e83c8-e40d-3642-4acf-6320b643140f@suse.com>
Date: Fri, 6 Nov 2020 10:38:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Besides the adjustments for style
- use switch(),
- widen scope of commonly used variables,
- narrow scope of other variables.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3081,7 +3081,9 @@ static void sh_unshadow_for_p2m_change(s
                                        l1_pgentry_t old, l1_pgentry_t new,
                                        unsigned int level)
 {
+    mfn_t omfn = l1e_get_mfn(old);
     unsigned int oflags = l1e_get_flags(old);
+    p2m_type_t p2mt = p2m_flags_to_type(oflags);
 
     /*
      * If there are any shadows, update them.  But if shadow_teardown()
@@ -3090,53 +3092,57 @@ static void sh_unshadow_for_p2m_change(s
     if ( unlikely(!d->arch.paging.shadow.total_pages) )
         return;
 
-    /* The following assertion is to make sure we don't step on 1GB host
-     * page support of HVM guest. */
-    ASSERT(!(level > 2 && (oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE)));
-
-    /* If we're removing an MFN from the p2m, remove it from the shadows too */
-    if ( level == 1 )
+    switch ( level )
     {
-        mfn_t mfn = l1e_get_mfn(old);
-        p2m_type_t p2mt = p2m_flags_to_type(oflags);
+    default:
+        /*
+         * The following assertion is to make sure we don't step on 1GB host
+         * page support of HVM guest.
+         */
+        ASSERT(!((oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE)));
+        break;
 
-        if ( (p2m_is_valid(p2mt) || p2m_is_grant(p2mt)) && mfn_valid(mfn) )
+    /* If we're removing an MFN from the p2m, remove it from the shadows too */
+    case 1:
+        if ( (p2m_is_valid(p2mt) || p2m_is_grant(p2mt)) && mfn_valid(omfn) )
         {
-            sh_remove_all_shadows_and_parents(d, mfn);
-            if ( sh_remove_all_mappings(d, mfn, _gfn(gfn)) )
+            sh_remove_all_shadows_and_parents(d, omfn);
+            if ( sh_remove_all_mappings(d, omfn, _gfn(gfn)) )
                 guest_flush_tlb_mask(d, d->dirty_cpumask);
         }
-    }
+        break;
 
-    /* If we're removing a superpage mapping from the p2m, we need to check
+    /*
+     * If we're removing a superpage mapping from the p2m, we need to check
      * all the pages covered by it.  If they're still there in the new
-     * scheme, that's OK, but otherwise they must be unshadowed. */
-    if ( level == 2 && (oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE) )
-    {
-        unsigned int i;
-        cpumask_t flushmask;
-        mfn_t omfn = l1e_get_mfn(old);
-        mfn_t nmfn = l1e_get_mfn(new);
-        l1_pgentry_t *npte = NULL;
-        p2m_type_t p2mt = p2m_flags_to_type(oflags);
+     * scheme, that's OK, but otherwise they must be unshadowed.
+     */
+    case 2:
+        if ( !(oflags & _PAGE_PRESENT) || !(oflags & _PAGE_PSE) )
+            break;
 
         if ( p2m_is_valid(p2mt) && mfn_valid(omfn) )
         {
+            unsigned int i;
+            cpumask_t flushmask;
+            mfn_t nmfn = l1e_get_mfn(new);
+            l1_pgentry_t *npte = NULL;
+
             cpumask_clear(&flushmask);
 
             /* If we're replacing a superpage with a normal L1 page, map it */
-            if ( (l1e_get_flags(new) & _PAGE_PRESENT)
-                 && !(l1e_get_flags(new) & _PAGE_PSE)
-                 && mfn_valid(nmfn) )
+            if ( (l1e_get_flags(new) & _PAGE_PRESENT) &&
+                 !(l1e_get_flags(new) & _PAGE_PSE) &&
+                 mfn_valid(nmfn) )
                 npte = map_domain_page(nmfn);
 
             gfn &= ~(L1_PAGETABLE_ENTRIES - 1);
 
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
             {
-                if ( !npte
-                     || !p2m_is_ram(p2m_flags_to_type(l1e_get_flags(npte[i])))
-                     || !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
+                if ( !npte ||
+                     !p2m_is_ram(p2m_flags_to_type(l1e_get_flags(npte[i]))) ||
+                     !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
                 {
                     /* This GFN->MFN mapping has gone away */
                     sh_remove_all_shadows_and_parents(d, omfn);
@@ -3150,6 +3156,8 @@ static void sh_unshadow_for_p2m_change(s
             if ( npte )
                 unmap_domain_page(npte);
         }
+
+        break;
     }
 }
 


