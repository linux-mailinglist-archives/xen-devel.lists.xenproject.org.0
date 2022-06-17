Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6394E54F5EC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 12:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351295.577898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29WK-0006l3-SN; Fri, 17 Jun 2022 10:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351295.577898; Fri, 17 Jun 2022 10:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29WK-0006iZ-PD; Fri, 17 Jun 2022 10:48:08 +0000
Received: by outflank-mailman (input) for mailman id 351295;
 Fri, 17 Jun 2022 10:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTWu=WY=citrix.com=prvs=1609a9fe9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o29WJ-0006iT-BJ
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 10:48:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67282e7-ee2a-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 12:48:05 +0200 (CEST)
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
X-Inumbo-ID: f67282e7-ee2a-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655462885;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HDrLuO8sCXEgIPWCZmYj7yNU3KNf/lyGH4JJ9QdrWKs=;
  b=claK6JMsn+80mp1dRNwQkejM9WCo6xeUazLfWUJ10p99py03WB042sJg
   sIYSoLJmXOuX9g8SAxDxIzuyPo7iyHDlnLy1OptQeF6B34bKv0gVrcznx
   pbXJtNXrehbxZ2l9woPaCh0jeuuq66xf3E5chAwPO7VaMiT/0apLAckX/
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73852055
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JDivV6oUrG6Hc/aj5tJjasS2pIdeBmJEZRIvgKrLsJaIsI4StFCzt
 garIBnVM/7fYmr3ct9+ad7g9kMH75/TmtdmQQFp/Ho0FCgT+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrRRbrJA24DjWVvT4
 I2q/6UzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBFPTRpbVCUyJhUCh+JoZpxuTaI2GZvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIwN0SdOUUSZz/7Drofw/iGgymiIgdd61/Mg7g2/nKL6Qxuhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34Riv/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4oCN/jvIWWg/d31IaMcNm/FtWD4z8
 FDcyrsFGgdTXK2ppWO1r+nJ8G/pYXJNcAfudgdfE1JbvoCLTJUby0uWE409SPPdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi2+AswGzAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbmCB3QYzQ8R5rmn3k5JGQWy3yGAWGauUGpxcJW+Bj
 LH74mu9G6O/zFP1NPQqMupd+uwhzLT6FMSNa804muFmO8ArHCfepXkGTRfJgwjFzRh9+Ylia
 MzzWZv9Uh4n5VFPkWPeqxE1iuRwmEjTBAr7GPjG8vhQ+ePGPCDNEuxZYQTmgyJQxPrsnTg5O
 u13b6OioyizmsWnCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:lT/liqHI9VTP7myspLqE5seALOsnbusQ8zAXP0AYc31om6uj5q
 aTdZUgpHjJYVkqKRIdcLy7V5VoIkmskaKdg7NhX4tKNTOO0ADDQe1fBOPZskTd8kbFltK1u5
 0PT0EHMqyUMWRH
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="scan'208";a="73852055"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@eu.citrix.com>
Subject: [PATCH] x86/mm: Add an early PGT_validated exit in _get_page_type()
Date: Fri, 17 Jun 2022 11:47:39 +0100
Message-ID: <20220617104739.7861-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a continuation of the cleanup and commenting in:
  9186e96b199e ("x86/pv: Clean up _get_page_type()")
  8cc5036bc385 ("x86/pv: Fix ABAC cmpxchg() race in _get_page_type()")

With the re-arranged and newly commented logic, it's far more clear that the
second half of _get_page_type() only has work to do for page validation.

Introduce an early exit for PGT_validated.  This makes the fastpath marginally
faster, and simplifies the subsequent logic as it no longer needs to exclude
the fully validated case.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: George Dunlap <george.dunlap@eu.citrix.com>

Not that it's relevant, but bloat-o-meter says:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-300 (-300)
  Function                                     old     new   delta
  _get_page_type                              6618    6318    -300

which is more impressive than I was expecting.
---
 xen/arch/x86/mm.c | 70 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index ac74ae389c99..57751d2ed70f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3002,6 +3002,17 @@ static int _get_page_type(struct page_info *page, unsigned long type,
      * fully validated (PGT_[type] | PGT_validated | >0).
      */
 
+    /* If the page is fully validated, we're done. */
+    if ( likely(nx & PGT_validated) )
+        return 0;
+
+    /*
+     * The page is in the "validate locked" state.  We have exclusive access,
+     * and any concurrent callers are waiting in the cmpxchg() loop above.
+     *
+     * Exclusive access ends when PGT_validated or PGT_partial get set.
+     */
+
     if ( unlikely((x & PGT_count_mask) == 0) )
     {
         struct domain *d = page_get_owner(page);
@@ -3071,43 +3082,40 @@ static int _get_page_type(struct page_info *page, unsigned long type,
         }
     }
 
-    if ( unlikely(!(nx & PGT_validated)) )
+    /*
+     * Flush the cache if there were previously non-coherent mappings of
+     * this page, and we're trying to use it as anything other than a
+     * writeable page.  This forces the page to be coherent before we
+     * validate its contents for safety.
+     */
+    if ( (nx & PGT_non_coherent) && type != PGT_writable_page )
     {
-        /*
-         * Flush the cache if there were previously non-coherent mappings of
-         * this page, and we're trying to use it as anything other than a
-         * writeable page.  This forces the page to be coherent before we
-         * validate its contents for safety.
-         */
-        if ( (nx & PGT_non_coherent) && type != PGT_writable_page )
-        {
-            void *addr = __map_domain_page(page);
+        void *addr = __map_domain_page(page);
 
-            cache_flush(addr, PAGE_SIZE);
-            unmap_domain_page(addr);
+        cache_flush(addr, PAGE_SIZE);
+        unmap_domain_page(addr);
 
-            page->u.inuse.type_info &= ~PGT_non_coherent;
-        }
+        page->u.inuse.type_info &= ~PGT_non_coherent;
+    }
 
-        /*
-         * No special validation needed for writable or shared pages.  Page
-         * tables and GDT/LDT need to have their contents audited.
-         *
-         * per validate_page(), non-atomic updates are fine here.
-         */
-        if ( type == PGT_writable_page || type == PGT_shared_page )
-            page->u.inuse.type_info |= PGT_validated;
-        else
+    /*
+     * No special validation needed for writable or shared pages.  Page
+     * tables and GDT/LDT need to have their contents audited.
+     *
+     * per validate_page(), non-atomic updates are fine here.
+     */
+    if ( type == PGT_writable_page || type == PGT_shared_page )
+        page->u.inuse.type_info |= PGT_validated;
+    else
+    {
+        if ( !(x & PGT_partial) )
         {
-            if ( !(x & PGT_partial) )
-            {
-                page->nr_validated_ptes = 0;
-                page->partial_flags = 0;
-                page->linear_pt_count = 0;
-            }
-
-            rc = validate_page(page, type, preemptible);
+            page->nr_validated_ptes = 0;
+            page->partial_flags = 0;
+            page->linear_pt_count = 0;
         }
+
+        rc = validate_page(page, type, preemptible);
     }
 
  out:
-- 
2.11.0


