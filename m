Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C23C371829
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121708.229578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldagG-00029k-FC; Mon, 03 May 2021 15:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121708.229578; Mon, 03 May 2021 15:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldagG-00029B-AX; Mon, 03 May 2021 15:40:20 +0000
Received: by outflank-mailman (input) for mailman id 121708;
 Mon, 03 May 2021 15:40:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldagE-00024k-PX
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:40:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c9f735a-84bf-45b9-93ac-1f6aa835f82c;
 Mon, 03 May 2021 15:40:13 +0000 (UTC)
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
X-Inumbo-ID: 6c9f735a-84bf-45b9-93ac-1f6aa835f82c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620056413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jIHwbXNLvjr4f1oZ4tb+qy7o6+MtjNlDvDcd+ysvfTI=;
  b=BuqCEfw74JtwAkbgUHEaJ4rW7Lvf+g4qEZ2gem1LZsno/9w2T50EiQzC
   1hjkaCF43UD5FvAxD5vkXiWC2hhI4BrEEo02kSn6Jqc2E8LSJeV8PSfO5
   uAM8B2hUPOXRKdQvySIjKreLPUe89c/837zxvqHj5/ubatgU7Hx2dTBIB
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: H8alMazpCCJaYOggVvYZDMfYy/DJMgq68K+15edzm5ilvKT9vOwyZAbK4zXMFQsGjpvIl4Ip/0
 nwLK/2Zp9/y1udBRVGmlXdRyG4omwm65Jugrc0AMhyjBcJM022qsa80ghR3JcJVnUZILxfJav9
 gnpBHL2P//yUwAI+4a8TTlnlUuyxAf04CVtk+J7l2zgXYRXL4S31rkABAslf3MqDY+N23PEZpe
 /VmAKPrEU9vp2EXqUxVFK4ByskrxZ4Io22/XvN3/gNd9OGtI1/Nx3vQrFO1WMR69GPug7arKUI
 t2U=
X-SBRS: 5.1
X-MesageID: 42942252
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gYQGjKgbg5jonU+AM8TG8wVStHBQXl0ji2hD6mlwRA09T+Wzva
 mV/cgz/xnylToXRTUcgtiGIqaNWjfx8pRy7IkXM96ZLXHbkUGvK5xv6pan/i34F0TFh5dg/I
 ppbqQWMqySMXFUlsD/iTPWL/8Bx529/LmslaPiyR5WPGVXQoVByys8NQqBCE1xQ2B9dPwEPb
 6R/NBOqTblWVl/VLXYOlA/U+LOp8LGmfvdCHZsbXNK1CC0gTyl87L8GRSDty1uNA9n+rs+7X
 PD1zXw+6TLiYDB9jbny2TR455K8eGA9vJ/AqW35PQ9G3HJggasaJ8JYczmgAwI
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="42942252"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] x86/xstate: Rename _xstate_ctxt_size() to hw_uncompressed_size()
Date: Mon, 3 May 2021 16:39:35 +0100
Message-ID: <20210503153938.14109-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210503153938.14109-1-andrew.cooper3@citrix.com>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The latter is a more descriptive name, as it explicitly highlights the query
from hardware.

Simplify the internal logic using cpuid_count_ebx(), and drop the curr/max
assertion as this property is guaranteed by the x86 ISA.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/xstate.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index f82dae8053..e6c225a16b 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -554,19 +554,18 @@ void xstate_free_save_area(struct vcpu *v)
     v->arch.xsave_area = NULL;
 }
 
-static unsigned int _xstate_ctxt_size(u64 xcr0)
+static unsigned int hw_uncompressed_size(uint64_t xcr0)
 {
     u64 act_xcr0 = get_xcr0();
-    u32 eax, ebx = 0, ecx, edx;
+    unsigned int size;
     bool ok = set_xcr0(xcr0);
 
     ASSERT(ok);
-    cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
-    ASSERT(ebx <= ecx);
+    size = cpuid_count_ebx(XSTATE_CPUID, 0);
     ok = set_xcr0(act_xcr0);
     ASSERT(ok);
 
-    return ebx;
+    return size;
 }
 
 /* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
@@ -578,7 +577,7 @@ unsigned int xstate_ctxt_size(u64 xcr0)
     if ( xcr0 == 0 )
         return 0;
 
-    return _xstate_ctxt_size(xcr0);
+    return hw_uncompressed_size(xcr0);
 }
 
 /* Collect the information of processor's extended state */
@@ -635,14 +634,14 @@ void xstate_init(struct cpuinfo_x86 *c)
          * xsave_cntxt_size is the max size required by enabled features.
          * We know FP/SSE and YMM about eax, and nothing about edx at present.
          */
-        xsave_cntxt_size = _xstate_ctxt_size(feature_mask);
+        xsave_cntxt_size = hw_uncompressed_size(feature_mask);
         printk("xstate: size: %#x and states: %#"PRIx64"\n",
                xsave_cntxt_size, xfeature_mask);
     }
     else
     {
         BUG_ON(xfeature_mask != feature_mask);
-        BUG_ON(xsave_cntxt_size != _xstate_ctxt_size(feature_mask));
+        BUG_ON(xsave_cntxt_size != hw_uncompressed_size(feature_mask));
     }
 
     if ( setup_xstate_features(bsp) && bsp )
-- 
2.11.0


