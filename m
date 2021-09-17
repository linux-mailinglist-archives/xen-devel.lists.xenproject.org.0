Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2940F45F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 10:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189094.338619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vi-00042Y-F9; Fri, 17 Sep 2021 08:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189094.338619; Fri, 17 Sep 2021 08:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vi-0003yu-At; Fri, 17 Sep 2021 08:46:18 +0000
Received: by outflank-mailman (input) for mailman id 189094;
 Fri, 17 Sep 2021 08:46:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mR9Vg-0003AK-FD
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 08:46:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3cf480a-1793-11ec-b674-12813bfff9fa;
 Fri, 17 Sep 2021 08:46:09 +0000 (UTC)
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
X-Inumbo-ID: b3cf480a-1793-11ec-b674-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631868369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=15+6z5EM4y397ipt3dNnQGW78oEoP00mzOswuO2CQJw=;
  b=VPdj1W4SV5GLu5vRqT0h05f4Bosx5qsSsO6WrK3h7pqXNoCsr/XTAgcl
   xn2V/2kGYGJVVEfZIbEuHf8D5o+YZNCMgKfb7GmfF4z3A3a/GcpIqQUHx
   5TfHJwvqKIz1REmNDkkuUnXcKnyT4vak/nLVbBOhAale1/H6zGbKA3xKB
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Aedc5C6amQnhqJGYqM0ObEOzLMD1itbaJL378IHVOSyhA/iAtFYUWo4wrkVc2bDkX6XdJgwwoE
 kMz/adWbfUBKyT1ebqyDC1TutMOzALTu0jlfTjKGbe196er4juLOpvIEIep7Pf9XiUAQl5eE0E
 uok2bAWOAn8r30LzNHugR/VtoL4L/XgjudRNT3SDPIWZk2MjqzBU1tWUYmDc+PxX51OhlWMhWP
 jLALNaRd3mUb7iZ/nZbt+DUfcGLJqlR7a0SvLOw8t5fOO3nLb0H6UVljrsDQLzlJZCTy109bRb
 YSgMW66agaqdKnRsLjq1g8Z3
X-SBRS: 5.1
X-MesageID: 52955350
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5XvjIKP4PmOGH+7vrR1ZkMFynXyQoLVcMsEvi/4bfWQNrUohgTQOm
 2YWCz2BbqqIY2LzeIwlYdy38hgEvsPSndJkQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Es8w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozyXpu5fz
 vVUjK2XVSslGKPOwroTYhYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgW1h250VQK62i
 8wxVRNASzPkMht0GHgKVbcYpdeCjF3wWmgNwL6SjfVuuDWCpOBr65DvLd7Ud9qiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntS/1UY0dFbq899ZxnUaegGcUDXU+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmM1aj88wufHnIDTDNKdJohrsBebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OKert+PbHxHp+
 gGtsAQyobsR15AF5qruqDgrnAmQSoj1oh8dv1uMBz/0sVwnPeZJdKTztgOKtq8owJKxCwDb5
 SlawZD2APUmUMnV/BFhVtnhC11ACxytCzTanVcnNJ0o7T3FF5WLLN0IvW0WyKuENK85ld7Vj
 K374lg5CHx7ZiLCgUpLj2SZUJxCIU/IT4+NaxwsRoASCqWdjSfelM2UWaJ144wLuBN0+U3YE
 czAGftA8F5AUfg3pNZIb75FjNfHORzSNUuMHMumnnxLIJK1ZWKPSKdtDbd9Rrlit8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnmBhYDmQag3CaeQehIA1g6AI7SsV9EhSpTFUQR0ZyAghDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:FCOFEqtGdC5Gp4shE4Ost2bi7skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.85,300,1624334400"; 
   d="scan'208";a="52955350"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH 6/6] xen/trace: Minor code cleanup
Date: Fri, 17 Sep 2021 09:45:59 +0100
Message-ID: <20210917084559.22673-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210917084559.22673-1-andrew.cooper3@citrix.com>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

 * Delete trailing whitespace
 * Replace an opencoded DIV_ROUND_UP()
 * Drop bogus smp_rmb() - spin_lock_irqsave() has full smp_mb() semantics.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/trace.c              | 37 +++++++++++++++----------------------
 xen/include/asm-x86/hvm/trace.h |  2 +-
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/xen/common/trace.c b/xen/common/trace.c
index 25af6e1bd25e..18008df69e10 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -75,10 +75,6 @@ static cpumask_t tb_cpu_mask;
 /* which tracing events are enabled */
 static u32 tb_event_mask = TRC_ALL;
 
-/* Return the number of elements _type necessary to store at least _x bytes of data
- * i.e., sizeof(_type) * ans >= _x. */
-#define fit_to_type(_type, _x) (((_x)+sizeof(_type)-1) / sizeof(_type))
-
 static int cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -96,8 +92,8 @@ static struct notifier_block cpu_nfb = {
 
 static uint32_t calc_tinfo_first_offset(void)
 {
-    int offset_in_bytes = offsetof(struct t_info, mfn_offset[NR_CPUS]);
-    return fit_to_type(uint32_t, offset_in_bytes);
+    return DIV_ROUND_UP(offsetof(struct t_info, mfn_offset[NR_CPUS]),
+                        sizeof(uint32_t));
 }
 
 /**
@@ -148,7 +144,7 @@ static int calculate_tbuf_size(unsigned int pages, uint16_t t_info_first_offset)
         pages = max_pages;
     }
 
-    /* 
+    /*
      * NB this calculation is correct, because t_info_first_offset is
      * in words, not bytes
      */
@@ -167,7 +163,7 @@ static int calculate_tbuf_size(unsigned int pages, uint16_t t_info_first_offset)
  * trace buffers.  The trace buffers are then available for debugging use, via
  * the %TRACE_xD macros exported in <xen/trace.h>.
  *
- * This function may also be called later when enabling trace buffers 
+ * This function may also be called later when enabling trace buffers
  * via the SET_SIZE hypercall.
  */
 static int alloc_trace_bufs(unsigned int pages)
@@ -401,7 +397,7 @@ int tb_control(struct xen_sysctl_tbuf_op *tbc)
         break;
     case XEN_SYSCTL_TBUFOP_enable:
         /* Enable trace buffers. Check buffers are already allocated. */
-        if ( opt_tbuf_size == 0 ) 
+        if ( opt_tbuf_size == 0 )
             rc = -EINVAL;
         else
             tb_init_done = 1;
@@ -438,7 +434,7 @@ int tb_control(struct xen_sysctl_tbuf_op *tbc)
     return rc;
 }
 
-static inline unsigned int calc_rec_size(bool_t cycles, unsigned int extra) 
+static inline unsigned int calc_rec_size(bool_t cycles, unsigned int extra)
 {
     unsigned int rec_size = 4;
 
@@ -597,7 +593,7 @@ static inline void __insert_record(struct t_buf *buf,
         rec->u.cycles.cycles_lo = (uint32_t)tsc;
         rec->u.cycles.cycles_hi = (uint32_t)(tsc >> 32);
         dst = rec->u.cycles.extra_u32;
-    } 
+    }
 
     if ( extra_data && extra )
         memcpy(dst, extra_data, extra);
@@ -717,9 +713,6 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
     if ( !cpumask_test_cpu(smp_processor_id(), &tb_cpu_mask) )
         return;
 
-    /* Read tb_init_done /before/ t_bufs. */
-    smp_rmb();
-
     spin_lock_irqsave(&this_cpu(t_lock), flags);
 
     buf = this_cpu(t_bufs);
@@ -735,14 +728,14 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
 
     /* Calculate the record size */
     rec_size = calc_rec_size(cycles, extra);
- 
+
     /* How many bytes are available in the buffer? */
     bytes_to_tail = calc_bytes_avail(buf);
-    
+
     /* How many bytes until the next wrap-around? */
     bytes_to_wrap = calc_bytes_to_wrap(buf);
-    
-    /* 
+
+    /*
      * Calculate expected total size to commit this record by
      * doing a dry-run.
      */
@@ -756,7 +749,7 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
         {
             total_size += bytes_to_wrap;
             bytes_to_wrap = data_size;
-        } 
+        }
         total_size += LOST_REC_SIZE;
         bytes_to_wrap -= LOST_REC_SIZE;
 
@@ -768,7 +761,7 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
     if ( rec_size > bytes_to_wrap )
     {
         total_size += bytes_to_wrap;
-    } 
+    }
     total_size += rec_size;
 
     /* Do we have enough space for everything? */
@@ -781,7 +774,7 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
     }
 
     /*
-     * Now, actually write information 
+     * Now, actually write information
      */
     bytes_to_wrap = calc_bytes_to_wrap(buf);
 
@@ -791,7 +784,7 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
         {
             insert_wrap_record(buf, LOST_REC_SIZE);
             bytes_to_wrap = data_size;
-        } 
+        }
         insert_lost_records(buf);
         bytes_to_wrap -= LOST_REC_SIZE;
 
diff --git a/xen/include/asm-x86/hvm/trace.h b/xen/include/asm-x86/hvm/trace.h
index 2bbac45044ce..fbf834d10aff 100644
--- a/xen/include/asm-x86/hvm/trace.h
+++ b/xen/include/asm-x86/hvm/trace.h
@@ -52,7 +52,7 @@
 #define DO_TRC_HVM_CLTS        DEFAULT_HVM_MISC
 #define DO_TRC_HVM_LMSW        DEFAULT_HVM_MISC
 #define DO_TRC_HVM_LMSW64      DEFAULT_HVM_MISC
-#define DO_TRC_HVM_REALMODE_EMULATE DEFAULT_HVM_MISC 
+#define DO_TRC_HVM_REALMODE_EMULATE DEFAULT_HVM_MISC
 #define DO_TRC_HVM_TRAP             DEFAULT_HVM_MISC
 #define DO_TRC_HVM_TRAP_DEBUG       DEFAULT_HVM_MISC
 #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
-- 
2.11.0


