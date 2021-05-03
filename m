Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7898537182A
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121711.229590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldagI-0002CQ-OZ; Mon, 03 May 2021 15:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121711.229590; Mon, 03 May 2021 15:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldagI-0002Bj-K6; Mon, 03 May 2021 15:40:22 +0000
Received: by outflank-mailman (input) for mailman id 121711;
 Mon, 03 May 2021 15:40:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldagG-00023Q-Jm
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:40:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 503cc877-2ae4-455c-add3-a9ba24c79b18;
 Mon, 03 May 2021 15:40:14 +0000 (UTC)
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
X-Inumbo-ID: 503cc877-2ae4-455c-add3-a9ba24c79b18
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620056414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L7RgdbGEd1jyg+A5R9ekb1vmEPCeoLbeT25HF5YV6ys=;
  b=Fo6y/mfH4tilvi2rNZGdCRu3ELjtjTRKZFN75E0ja+DjNRNaU2MumzpS
   FYUtliEd0BmgfxJGvCegInLmKaff+DAncDGV7uJlf4DO/1PoZVI2r23YV
   YkJRjy4tlg8FDtW+QUUaCD/UrXVjyXYx4uH97egXIbZyWhO+lfRsveG2T
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GmP/0IMBbxNpZqx3flufAKBbnNuepUNa6zZBqCJSu5LACseXfw6ekok5Z0rgXVko7KX9BIRgd3
 mBvcUPI63l31kjEYczwPlFfJkZjevfhSbt7ca7YvmTuCzQMept3XJ4uupBCOIWMsEBIJcrYHEy
 L/KBJlZXSDmwHxjogGD3hRT4T/5Sc3m5NV3GGD/72f3orz9PTfpxBTAgPapVCWN/tocfcRQrnt
 17bq54ACAzCZsff1MTMinMDTg+wHPOIGPe3KpdlWSOX/JHbWgqF0jdoPbANaDsIGZbWilv+/T9
 NtY=
X-SBRS: 5.1
X-MesageID: 42942253
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EOUCG6/QoiV6zIOdCWNuk+BfI+orLtY04lQ7vn1ZYzY9SK2lvu
 qpm+kW0gKxtS0YX2sulcvFFK6LR37d8pAd2/hoAZ6JWg76tGy0aLxz9IeK+UyYJwTS/vNQvJ
 0QEJRWJ8b3CTFB4vrSwA79KNo4xcnCzabAv5a7815IbSVHL55t9B14DAHzKDwReCBjCYAiHJ
 SRouprzgDQG0g/VciwCnkbU+WrnbSi//iKDSIuPBIp5BKDijml8tfBYn+l9ywTTi9VxvMa+X
 XF+jaJnZmLie2xyRPXygboj6h+pd2J8LV+Lf3JrsAULzn24zzYAbhcZw==
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="42942253"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/5] x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
Date: Mon, 3 May 2021 16:39:36 +0100
Message-ID: <20210503153938.14109-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210503153938.14109-1-andrew.cooper3@citrix.com>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We're soon going to need a compressed helper of the same form.

The size of the uncompressed image is a strictly a property of the highest
user state.  This can be calculated trivially with xstate_offsets/sizes, and
is much faster than a CPUID instruction in the first place, let alone the two
XCR0 writes surrounding it.

Retain the cross-check with hardware in debug builds, but forgo it normal
builds.  In particular, this means that the migration paths don't need to mess
with XCR0 just to sanity check the buffer size.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/domctl.c        |  2 +-
 xen/arch/x86/hvm/hvm.c       |  2 +-
 xen/arch/x86/xstate.c        | 40 +++++++++++++++++++++++++++++++---------
 xen/include/asm-x86/xstate.h |  2 +-
 4 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index e440bd021e..8c3552410d 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -899,7 +899,7 @@ long arch_do_domctl(
         uint32_t offset = 0;
 
 #define PV_XSAVE_HDR_SIZE (2 * sizeof(uint64_t))
-#define PV_XSAVE_SIZE(xcr0) (PV_XSAVE_HDR_SIZE + xstate_ctxt_size(xcr0))
+#define PV_XSAVE_SIZE(xcr0) (PV_XSAVE_HDR_SIZE + xstate_uncompressed_size(xcr0))
 
         ret = -ESRCH;
         if ( (evc->vcpu >= d->max_vcpus) ||
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 28beacc45b..e5fda6b387 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1203,7 +1203,7 @@ HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, hvm_load_cpu_ctxt, 1,
 
 #define HVM_CPU_XSAVE_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
                                            save_area) + \
-                                  xstate_ctxt_size(xcr0))
+                                  xstate_uncompressed_size(xcr0))
 
 static int hvm_save_cpu_xsave_states(struct vcpu *v, hvm_domain_context_t *h)
 {
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index e6c225a16b..d4c01da574 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -184,7 +184,7 @@ void expand_xsave_states(struct vcpu *v, void *dest, unsigned int size)
     /* Check there is state to serialise (i.e. at least an XSAVE_HDR) */
     BUG_ON(!v->arch.xcr0_accum);
     /* Check there is the correct room to decompress into. */
-    BUG_ON(size != xstate_ctxt_size(v->arch.xcr0_accum));
+    BUG_ON(size != xstate_uncompressed_size(v->arch.xcr0_accum));
 
     if ( !(xsave->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED) )
     {
@@ -246,7 +246,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
     u64 xstate_bv, valid;
 
     BUG_ON(!v->arch.xcr0_accum);
-    BUG_ON(size != xstate_ctxt_size(v->arch.xcr0_accum));
+    BUG_ON(size != xstate_uncompressed_size(v->arch.xcr0_accum));
     ASSERT(!xsave_area_compressed(src));
 
     xstate_bv = ((const struct xsave_struct *)src)->xsave_hdr.xstate_bv;
@@ -568,16 +568,38 @@ static unsigned int hw_uncompressed_size(uint64_t xcr0)
     return size;
 }
 
-/* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
-unsigned int xstate_ctxt_size(u64 xcr0)
+unsigned int xstate_uncompressed_size(uint64_t xcr0)
 {
-    if ( xcr0 == xfeature_mask )
-        return xsave_cntxt_size;
+    unsigned int size;
+    int idx = flsl(xcr0) - 1;
 
-    if ( xcr0 == 0 )
-        return 0;
+    /*
+     * The maximum size of an uncompressed XSAVE area is determined by the
+     * highest user state, as the size and offset of each component is fixed.
+     */
+    if ( idx >= 2 )
+    {
+        ASSERT(xstate_offsets[idx] && xstate_sizes[idx]);
+        size = xstate_offsets[idx] + xstate_sizes[idx];
+    }
+    else
+        size = XSTATE_AREA_MIN_SIZE;
 
-    return hw_uncompressed_size(xcr0);
+    /* In debug builds, cross-check our calculation with hardware. */
+    if ( IS_ENABLED(CONFIG_DEBUG) )
+    {
+        unsigned int hwsize;
+
+        xcr0 |= XSTATE_FP_SSE;
+        hwsize = hw_uncompressed_size(xcr0);
+
+        if ( size != hwsize )
+            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x != hwsize %#x\n",
+                        __func__, xcr0, size, hwsize);
+        size = hwsize;
+    }
+
+    return size;
 }
 
 /* Collect the information of processor's extended state */
diff --git a/xen/include/asm-x86/xstate.h b/xen/include/asm-x86/xstate.h
index 7ab0bdde89..02d6f171b8 100644
--- a/xen/include/asm-x86/xstate.h
+++ b/xen/include/asm-x86/xstate.h
@@ -107,7 +107,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size);
 void xstate_free_save_area(struct vcpu *v);
 int xstate_alloc_save_area(struct vcpu *v);
 void xstate_init(struct cpuinfo_x86 *c);
-unsigned int xstate_ctxt_size(u64 xcr0);
+unsigned int xstate_uncompressed_size(uint64_t xcr0);
 
 static inline uint64_t xgetbv(unsigned int index)
 {
-- 
2.11.0


