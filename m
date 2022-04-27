Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870D51189E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 16:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315117.533495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njiHo-0006wW-IJ; Wed, 27 Apr 2022 14:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315117.533495; Wed, 27 Apr 2022 14:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njiHo-0006tn-FM; Wed, 27 Apr 2022 14:04:56 +0000
Received: by outflank-mailman (input) for mailman id 315117;
 Wed, 27 Apr 2022 14:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dk3=VF=citrix.com=prvs=109ad7ccf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njiHn-0006tg-69
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 14:04:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0196835d-c633-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 16:04:53 +0200 (CEST)
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
X-Inumbo-ID: 0196835d-c633-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651068293;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BekWr44zF1XcL3Qo54apOLEDFyPhI0/bSyWgIKNtiD4=;
  b=AvEl5zqf0tBB8ND76BGgpu1/1B9skIq4XDbYagRYhORoR6Y72mrX3N5Y
   VVtKTyN9RyekeUDGotKXFhwqaAjLHyMBXqrKOUya5k1Mcps6LID5Xc2qN
   GJ/1uGfMSUBXrwMiWAT05MUspNKkinHcwXhjsWbL2/9Vx5caBgxJCUHQm
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69928105
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iUuvxa6K0eHA4tn2F5mMOQxRtEnHchMFZxGqfqrLsTDasY5as4F+v
 jEdUTuEPP6MMWWmKN10Oo+ypEoE6JLSxoRjTgo+q3g3Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjXFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTzSik0LIvVod45EBdgOCB3N/Rv5J3IdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RIOGA/NUydC/FJEmkOUoxuhrutulbiXWUGjGO1vpQlumeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MSqwKj17jy+j+jIisKdhVAYdZ/ndMUSml/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWuoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvWkvfxszaplfImWBj
 KrvVeR5vsE7AZdXRfUvP9LZ5zoCkMAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPmL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3apXalk0DALGvCsQVmKZKRW03wbEALcieg6RqmiSreVcO9L0JYxMJ/Y4cRg==
IronPort-HdrOrdr: A9a23:DXzUK6smr7I/IZ8cnzi1Pd2F7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="69928105"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mm: Remove unnecessary mfn_valid() call from get_page_from_l1e()
Date: Wed, 27 Apr 2022 15:04:00 +0100
Message-ID: <20220427140400.20152-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

mfn_valid() is not a trivially simple, and contains an evaluate_nospec() for
speculative defence.  Avoid calling it redundantly, and just store the result
of the first call.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/mm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 72dbce43b13a..31b9f96dc0df 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -887,7 +887,7 @@ get_page_from_l1e(
     uint32_t l1f = l1e_get_flags(l1e);
     struct vcpu *curr = current;
     struct domain *real_pg_owner;
-    bool write;
+    bool write, valid;
 
     if ( unlikely(!(l1f & _PAGE_PRESENT)) )
     {
@@ -902,13 +902,15 @@ get_page_from_l1e(
         return -EINVAL;
     }
 
-    if ( !mfn_valid(_mfn(mfn)) ||
+    valid = mfn_valid(_mfn(mfn));
+
+    if ( !valid ||
          (real_pg_owner = page_get_owner_and_reference(page)) == dom_io )
     {
         int flip = 0;
 
         /* Only needed the reference to confirm dom_io ownership. */
-        if ( mfn_valid(_mfn(mfn)) )
+        if ( valid )
             put_page(page);
 
         /* DOMID_IO reverts to caller for privilege checks. */
-- 
2.11.0


