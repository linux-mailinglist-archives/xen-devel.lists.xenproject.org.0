Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A736E495E2D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 12:09:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259315.447485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArn7-0003nD-Ng; Fri, 21 Jan 2022 11:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259315.447485; Fri, 21 Jan 2022 11:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArn7-0003k8-Jo; Fri, 21 Jan 2022 11:09:13 +0000
Received: by outflank-mailman (input) for mailman id 259315;
 Fri, 21 Jan 2022 11:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s92u=SF=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nArn5-0003k2-Ox
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 11:09:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c9d8b88-7aaa-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 12:09:08 +0100 (CET)
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
X-Inumbo-ID: 8c9d8b88-7aaa-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642763348;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LpVopR6E3NiVqnRIn8fPlfgyuvitNizA2LQ+RR6U1Nk=;
  b=SI+gK4egu72zZvY+DXjCCNY/r8g5gfbOC8rZzyGlKDhQneerI//s5OE5
   s2/NI9Qcx1fdjTZvnzkbVMRqNeZOc71P8ERpe98a3WC5Q/GLd3focsxu/
   hYuql7Cy68MPYGsvp9q/Pw5rXfYNSInSkn8/ZZ1HugCBO7ykP2DhEv/nL
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7OetraLyTe8VlY6e1aTH1oBlLyDpUrI50GQLTVY35+hMRm60MUpB/ZLE0R5A0VBXLt3JYmdzaW
 UP8jKYYHAO6bHd4aiCH/0Mv9r0Gymbisn1sRRT4NUfWjWnMhQRHRapnJPMMvSSNii9G4pbUkVw
 T4StMO2pUro0UcWhwtnJK3xLDRtkCIbgUrCjyNgibHWBFacbJkXwXrK9RNNObhaDFhiAlKuTTm
 frcM8ydoGkTuXhHrXciXRXxR7RgcJyRDjcxVDW8UTnhq4yK22PMkCEUtMQUG0RHi1bm0XIYuze
 YQr5HHk5+tgKoM6ITo034JRU
X-SBRS: 5.2
X-MesageID: 62888867
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HuYUE6+uCz9nM0EHqEPdDrUDBXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 mMXXT+BM62PY2uketkibd7loEpV6MWAy4JlHlRo+3o8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhz5
 NJL6JuAVzwAEf3vvtsSWBtdNAdXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4UTaaON
 5RGAdZpRBTfRxx3eQoxNKN9msaN2zr/QhsA+U3A8MLb5ECMlVcsgdABKuH9eMGMA8NcnU+ap
 2fP12X/HhwecteYzFKt8X+yh+mJgSLyXqoTEqG18rhhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3rW4qjXvPhgLFkYtNQwicgQO4dzEhqhm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab8P9TwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8R5n9hO0yT6FWy13N2YDB04WirjUWW4C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFXYpHo/NBfMgTiFfK0QfUcXY
 s/znSGEVi5yNEia5GDuG7d1PUEDm0jSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOcwxiBSVlVPje9pwGHsbec1EOMDxwVJfsLUYJJtYNc1J9zLmYp
 xlQmyZwlTLCuJEwAVzaMy84MOK2A88XQLBSFXVEAGtEEkMLOe6HhJrzvbNsFVX+3OA8n/NyU
 dcffMCMXqZGRjjdomxPZpjhto1yMh+sgFvWbSaiZTE+eb9mRhDIpYC4Lle+qnFWA3rlr9Y6r
 p2hyhjfHcgJSTN9AZuEc/mo1V6w4yQQwbogQ0vSL9BPU0zw64w2eTfph/o6LphUexXOzzeXz
 SiMBhIcqbWfqoM56oCR16uFs52oA611GU8DRzvX6rO/NC/7+Gu/wNAfDLbULG6FDG6tofesf
 +RYyf34IcYrplcSvtouCatvwII/+8Dr++1QwDN7ESiZdF+sEL5hfCWLhJEdqq1Xy7ZFkgKqQ
 UbTqMJCMLCENc65Ql4cIA0pMraK2f0Ow2SA6P00JAPx5TNt/arBWkJXZkHehCtYJbpzEYUk3
 eZ+55JGt13h0kInYoSckyRZ12WQNXhRAawou6YTDJLvlgd2mEpJZobRC3Ou7ZyCAzmW3pLG/
 tNAaHL+uolh
IronPort-HdrOrdr: A9a23:mYccnqj8ryCvPKISmQJX1+gcY3BQXtQji2hC6mlwRA09TySZ//
 rOoB19726TtN9xYgBGpTnuAtjifZqxz/FICOoqTNOftWvdyQmVxehZhOOIqVCNJ8SXzJ8l6U
 4KSchD4bPLY2SS9fyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62888867"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] x86/vmx: Fold VMCS logic in vmx_{get,set}_segment_register()
Date: Fri, 21 Jan 2022 11:08:34 +0000
Message-ID: <20220121110834.9143-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xen's segment enumeration almost matches the VMCS encoding order, while the
VMCS encoding order has the system segments immediately following the user
segments for all relevant attributes.

Use a sneaky xor to hide the difference in encoding order to fold the switch
statements, dropping 10 __vmread() and 10 __vmwrite() calls.  Bloat-o-meter
reports:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-433 (-433)
  Function                                     old     new   delta
  vmx_set_segment_register                     804     593    -211
  vmx_get_segment_register                     778     556    -222

showing that these wrappers aren't trivial.  In addition, 20 BUGs worth of
metadata are dropped.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

We could make x86_seg_* match the VMCS encoding order if we're willing to make
v->arch.hvm.vmx.vm86_saved_seg[] one entry longer, but I don't think the added
complexity to the vmx_realmode logic is worth it.
---
 xen/arch/x86/hvm/vmx/vmx.c | 77 ++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c44cf8f5d425..9765cfd90a0a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -986,6 +986,7 @@ static void vmx_get_segment_register(struct vcpu *v, enum x86_segment seg,
                                      struct segment_register *reg)
 {
     unsigned long attr = 0, sel = 0, limit;
+    unsigned int tmp_seg;
 
     /*
      * We may get here in the context of dump_execstate(), which may have
@@ -1009,34 +1010,34 @@ static void vmx_get_segment_register(struct vcpu *v, enum x86_segment seg,
         return;
     }
 
-    switch ( seg )
+    /*
+     * Xen's x86_seg_* enumeration *almost* matches the VMCS encoding order.
+     *
+     * tr and ldtr are reversed, and other areas of code rely on this, so we
+     * can't just re-enumerate.
+     */
+    BUILD_BUG_ON(x86_seg_tr   != 6);
+    BUILD_BUG_ON(x86_seg_ldtr != 7);
+    BUILD_BUG_ON(x86_seg_gdtr != 8);
+    BUILD_BUG_ON(x86_seg_idtr != 9);
+    switch ( tmp_seg = seg )
     {
-    case x86_seg_es ... x86_seg_gs:
-        __vmread(GUEST_SEG_SELECTOR(seg), &sel);
-        __vmread(GUEST_SEG_LIMIT(seg),    &limit);
-        __vmread(GUEST_SEG_BASE(seg),     &reg->base);
-        __vmread(GUEST_SEG_AR_BYTES(seg), &attr);
-        break;
     case x86_seg_tr:
-        __vmread(GUEST_TR_SELECTOR, &sel);
-        __vmread(GUEST_TR_LIMIT,    &limit);
-        __vmread(GUEST_TR_BASE,     &reg->base);
-        __vmread(GUEST_TR_AR_BYTES, &attr);
-        break;
+    case x86_seg_ldtr:
+        tmp_seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
+        fallthrough;
+
+    case x86_seg_es ... x86_seg_gs:
+        __vmread(GUEST_SEG_SELECTOR(tmp_seg), &sel);
+        __vmread(GUEST_SEG_AR_BYTES(tmp_seg), &attr);
+        fallthrough;
+
     case x86_seg_gdtr:
-        __vmread(GUEST_GDTR_LIMIT, &limit);
-        __vmread(GUEST_GDTR_BASE,  &reg->base);
-        break;
     case x86_seg_idtr:
-        __vmread(GUEST_IDTR_LIMIT, &limit);
-        __vmread(GUEST_IDTR_BASE,  &reg->base);
-        break;
-    case x86_seg_ldtr:
-        __vmread(GUEST_LDTR_SELECTOR, &sel);
-        __vmread(GUEST_LDTR_LIMIT,    &limit);
-        __vmread(GUEST_LDTR_BASE,     &reg->base);
-        __vmread(GUEST_LDTR_AR_BYTES, &attr);
+        __vmread(GUEST_SEG_LIMIT(tmp_seg),    &limit);
+        __vmread(GUEST_SEG_BASE(tmp_seg),     &reg->base);
         break;
+
     default:
         BUG();
         return;
@@ -1150,32 +1151,22 @@ static void vmx_set_segment_register(struct vcpu *v, enum x86_segment seg,
 
     switch ( seg )
     {
+    case x86_seg_tr:
+    case x86_seg_ldtr:
+        seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
+        fallthrough;
+
     case x86_seg_es ... x86_seg_gs:
         __vmwrite(GUEST_SEG_SELECTOR(seg), sel);
-        __vmwrite(GUEST_SEG_LIMIT(seg),    limit);
-        __vmwrite(GUEST_SEG_BASE(seg),     base);
         __vmwrite(GUEST_SEG_AR_BYTES(seg), attr);
-        break;
-    case x86_seg_tr:
-        __vmwrite(GUEST_TR_SELECTOR, sel);
-        __vmwrite(GUEST_TR_LIMIT, limit);
-        __vmwrite(GUEST_TR_BASE, base);
-        __vmwrite(GUEST_TR_AR_BYTES, attr);
-        break;
+        fallthrough;
+
     case x86_seg_gdtr:
-        __vmwrite(GUEST_GDTR_LIMIT, limit);
-        __vmwrite(GUEST_GDTR_BASE, base);
-        break;
     case x86_seg_idtr:
-        __vmwrite(GUEST_IDTR_LIMIT, limit);
-        __vmwrite(GUEST_IDTR_BASE, base);
-        break;
-    case x86_seg_ldtr:
-        __vmwrite(GUEST_LDTR_SELECTOR, sel);
-        __vmwrite(GUEST_LDTR_LIMIT, limit);
-        __vmwrite(GUEST_LDTR_BASE, base);
-        __vmwrite(GUEST_LDTR_AR_BYTES, attr);
+        __vmwrite(GUEST_SEG_LIMIT(seg),    limit);
+        __vmwrite(GUEST_SEG_BASE(seg),     base);
         break;
+
     default:
         BUG();
     }
-- 
2.11.0


