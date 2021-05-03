Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD75037181F
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121700.229541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldafq-0001BB-Er; Mon, 03 May 2021 15:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121700.229541; Mon, 03 May 2021 15:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldafq-0001Ab-9y; Mon, 03 May 2021 15:39:54 +0000
Received: by outflank-mailman (input) for mailman id 121700;
 Mon, 03 May 2021 15:39:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldafo-0001AE-H9
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:39:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c419d8a6-f98f-46b6-a958-3e897796841f;
 Mon, 03 May 2021 15:39:51 +0000 (UTC)
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
X-Inumbo-ID: c419d8a6-f98f-46b6-a958-3e897796841f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620056391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O2yVEz5u95v8j+WwtRne2yHrcHV1GGCzk+PGhtB6nEs=;
  b=K4hFoYpeokTeD06OFn/amVtCtKK3JmgB7QqKnmlYuT0yS+5qWtv5wKi7
   ie907rwrhukH9TeY//dTd7aDxpnStZgRGCaEyKgzGIdI/mPZPGERm1wK5
   lwoauB+HsqFYUYvBKG5CtAkWut/RKpLlZHkmbRaSlRCY3y1l5Lo9C11j3
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ND6u3vdoKm4YWMNTymQAmDMkd0lpy/mP8prIe8qqAfuEtlNhe+FCyGdoS390/SYVs8FM+ek5sC
 GsMAwiWTB3sy/ypNi5KzHL2DcZlwucTKGSVVElcdEFExPw41PsRPe/VE6TXsJC6kWz33idZ8DO
 JmwATgSbNnNL6OfW1NlbdSgKpWTzVhdS2jIxs0wRHf0/m+TyTcdA+9Wq/UjNezRK/sHCy+w9tK
 YAc8+Fje0uwWB+rrv8vPO0u2tr9Tn4mQHSDLziD0qvZhCTrEmDeAeWsfm5EhXgQL3I6MBpc18H
 DpQ=
X-SBRS: 5.1
X-MesageID: 43332334
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9sViJagXbX0eZuIcRW07O+jHQXBQXl0ji2hD6mlwRA09T+Wzva
 mV/cgz/xnylToXRTUcgtiGIqaNWjfx8pRy7IkXM96ZLXHbkUGvK5xv6pan/i34F0TFh5dg/I
 ppbqQWMqySMXFUlsD/iTPWL/8Bx529/LmslaPiyR5WPGVXQoVByys8NQqBCE1xQ2B9dPwEPb
 6R/NBOqTblWVl/VLXYOlA/U+LOp8LGmfvdCHZsbXNK1CC0gTyl87L8GRSDty1uNA9n+rs+7X
 PD1zXw+6TLiYDB9jbny2TR455K8eGA9vJ/AqW35PQ9G3HJggasaJ8JYczmgAwI
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="43332334"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] x86/cpuid: Fix handling of xsave dynamic leaves
Date: Mon, 3 May 2021 16:39:38 +0100
Message-ID: <20210503153938.14109-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210503153938.14109-1-andrew.cooper3@citrix.com>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

If max leaf is greater than 0xd but xsave not available to the guest, then the
current XSAVE size should not be filled in.  This is a latent bug for now as
the guest max leaf is 0xd, but will become problematic in the future.

The comment concerning XSS state is wrong.  VT-x doesn't manage host/guest
state automatically, but there is provision for "host only" bits to be set, so
the implications are still accurate.

Introduce {xstate,hw}_compressed_size() helpers to mirror the uncompressed
ones.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpuid.c         | 23 +++++++--------------
 xen/arch/x86/xstate.c        | 49 ++++++++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/xstate.h |  1 +
 3 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index c7f8388e5d..92745aa63f 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -1041,24 +1041,15 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case XSTATE_CPUID:
         switch ( subleaf )
         {
+        case 0:
+            if ( p->basic.xsave )
+                res->b = xstate_uncompressed_size(v->arch.xcr0);
+            break;
+
         case 1:
             if ( p->xstate.xsaves )
-            {
-                /*
-                 * TODO: Figure out what to do for XSS state.  VT-x manages
-                 * host vs guest MSR_XSS automatically, so as soon as we start
-                 * supporting any XSS states, the wrong XSS will be in
-                 * context.
-                 */
-                BUILD_BUG_ON(XSTATE_XSAVES_ONLY != 0);
-
-                /*
-                 * Read CPUID[0xD,0/1].EBX from hardware.  They vary with
-                 * enabled XSTATE, and appropraite XCR0|XSS are in context.
-                 */
-        case 0:
-                res->b = cpuid_count_ebx(leaf, subleaf);
-            }
+                res->b = xstate_compressed_size(v->arch.xcr0 |
+                                                v->arch.msrs->xss.raw);
             break;
         }
         break;
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index d4c01da574..03489f0cf4 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -602,6 +602,55 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
     return size;
 }
 
+static unsigned int hw_compressed_size(uint64_t xstates)
+{
+    uint64_t curr_xcr0 = get_xcr0(), curr_xss = get_msr_xss();
+    unsigned int size;
+    bool ok;
+
+    ok = set_xcr0(xstates & ~XSTATE_XSAVES_ONLY);
+    ASSERT(ok);
+    set_msr_xss(xstates & XSTATE_XSAVES_ONLY);
+
+    size = cpuid_count_ebx(XSTATE_CPUID, 1);
+
+    ok = set_xcr0(curr_xcr0);
+    ASSERT(ok);
+    set_msr_xss(curr_xss);
+
+    return size;
+}
+
+unsigned int xstate_compressed_size(uint64_t xstates)
+{
+    unsigned int i, size = XSTATE_AREA_MIN_SIZE;
+
+    xstates &= ~XSTATE_FP_SSE;
+    for_each_set_bit ( i, &xstates, 63 )
+    {
+        if ( test_bit(i, &xstate_align) )
+            size = ROUNDUP(size, 64);
+
+        size += xstate_sizes[i];
+    }
+
+    /* In debug builds, cross-check our calculation with hardware. */
+    if ( IS_ENABLED(CONFIG_DEBUG) )
+    {
+        unsigned int hwsize;
+
+        xstates |= XSTATE_FP_SSE;
+        hwsize = hw_compressed_size(xstates);
+
+        if ( size != hwsize )
+            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x != hwsize %#x\n",
+                        __func__, xstates, size, hwsize);
+        size = hwsize;
+    }
+
+    return size;
+}
+
 /* Collect the information of processor's extended state */
 void xstate_init(struct cpuinfo_x86 *c)
 {
diff --git a/xen/include/asm-x86/xstate.h b/xen/include/asm-x86/xstate.h
index 02d6f171b8..ecf7bbc5cd 100644
--- a/xen/include/asm-x86/xstate.h
+++ b/xen/include/asm-x86/xstate.h
@@ -108,6 +108,7 @@ void xstate_free_save_area(struct vcpu *v);
 int xstate_alloc_save_area(struct vcpu *v);
 void xstate_init(struct cpuinfo_x86 *c);
 unsigned int xstate_uncompressed_size(uint64_t xcr0);
+unsigned int xstate_compressed_size(uint64_t states);
 
 static inline uint64_t xgetbv(unsigned int index)
 {
-- 
2.11.0


