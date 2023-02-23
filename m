Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCEC6A0ED3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 18:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500605.772084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVFZW-0002iX-T9; Thu, 23 Feb 2023 17:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500605.772084; Thu, 23 Feb 2023 17:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVFZW-0002gO-QE; Thu, 23 Feb 2023 17:39:58 +0000
Received: by outflank-mailman (input) for mailman id 500605;
 Thu, 23 Feb 2023 17:39:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn77=6T=citrix.com=prvs=4118f8fe8=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pVFZV-0002gI-JZ
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 17:39:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 148b60a9-b3a1-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 18:39:55 +0100 (CET)
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
X-Inumbo-ID: 148b60a9-b3a1-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677173995;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=heX9QGJ3ArrOvzL0t7BU7TpHkq708TM4w75XVc2gD9M=;
  b=dlhAdYYCGCvgeOVZM2oN2hGQPKWzWMRTZDHSzAO8CRqjdVReBv9pWotz
   a093++O08/mbfU2zddbwQMpYcQUOpZNkze+qdR/KCXXwJZ+0WL+fQvfXP
   4U3FDlcOUaPQYNYRrhdIo1TbrGeLkjAsPKn3asVNVAONroFahx7rzCHYh
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97090717
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tn5tnaz3v5ztyWoyXix6t+cjxirEfRIJ4+MujC+fZmUNrF6WrkUPx
 mEfWGqCPq2CZDDzL91waITloU4BsMPWxtNjSFc++SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkP6sT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWFkt
 sEqAXMHVBeK3aWW/Y+9ZMJNi+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+zi2PwfiwepEOcvq42y2PS0BZwwP7mN9+9ltmiFJoNzx7H/
 z2uE2LRWxRHBdGZ6Da+tVGmgbTGnwLLer0xG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9LUVBWB0tDgE/5NC556EOsxThZfduOfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT/FWyzyGskTKuMDirjUW6BX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YuK1fWpHA3PRHPgwgBdXTAdollZ
 P+mnTuEVy5GWcyLMhLrLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/KrTaf1M7RjB8U5c8A9oJIuRYokicrc+Ql
 lnVZ6OS4AOXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:X3PHfaigYN2fxGKocYJsONQRTnBQXs4ji2hC6mlwRA09TySZ//
 rAoB17726RtN9/YhAdcLy7VZVoIkmskKKdg7NwAV7KZmCP0wGVxelZnOnfKlbbdREWmNQw6U
 4ZSdkcNOHN
X-IronPort-AV: E=Sophos;i="5.97,322,1669093200"; 
   d="scan'208";a="97090717"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH v5] x86/ucode/AMD: late load the patch on every logical thread
Date: Thu, 23 Feb 2023 17:39:24 +0000
Message-ID: <20230223173924.11815-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Currently late ucode loading is performed only on the first core of CPU
siblings.  But according to the latest recommendation from AMD, late
ucode loading should happen on every logical thread/core on AMD CPUs.

To achieve that, introduce is_cpu_primary() helper which will consider
every logical cpu as "primary" when running on AMD CPUs.  Also include
Hygon in the check for future-proofing.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v5:
- refactored the code by adding is_cpu_primary() helper
- include Hygon cpus into the check

v4:
- new patch
---
 xen/arch/x86/cpu/microcode/core.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index ba6e7b42c6..cfa2d5053a 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -276,6 +276,20 @@ static bool microcode_update_cache(struct microcode_patch *patch)
     return true;
 }
 
+/* Returns true if ucode should be loaded on a given cpu */
+static bool is_cpu_primary(unsigned int cpu)
+{
+    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+        /* Load ucode on every logical thread/core */
+        return true;
+
+    /* Intel CPUs should load ucode only on the first core of SMT siblings */
+    if ( cpu == cpumask_first(per_cpu(cpu_sibling_mask, cpu)) )
+        return true;
+
+    return false;
+}
+
 /* Wait for a condition to be met with a timeout (us). */
 static int wait_for_condition(bool (*func)(unsigned int data),
                               unsigned int data, unsigned int timeout)
@@ -382,7 +396,7 @@ static int primary_thread_work(const struct microcode_patch *patch)
 static int cf_check microcode_nmi_callback(
     const struct cpu_user_regs *regs, int cpu)
 {
-    unsigned int primary = cpumask_first(this_cpu(cpu_sibling_mask));
+    bool primary_cpu = is_cpu_primary(cpu);
     int ret;
 
     /* System-generated NMI, leave to main handler */
@@ -395,10 +409,10 @@ static int cf_check microcode_nmi_callback(
      * ucode_in_nmi.
      */
     if ( cpu == cpumask_first(&cpu_online_map) ||
-         (!ucode_in_nmi && cpu == primary) )
+         (!ucode_in_nmi && primary_cpu) )
         return 0;
 
-    if ( cpu == primary )
+    if ( primary_cpu )
         ret = primary_thread_work(nmi_patch);
     else
         ret = secondary_nmi_work();
@@ -549,7 +563,7 @@ static int cf_check do_microcode_update(void *patch)
      */
     if ( cpu == cpumask_first(&cpu_online_map) )
         ret = control_thread_fn(patch);
-    else if ( cpu == cpumask_first(this_cpu(cpu_sibling_mask)) )
+    else if ( is_cpu_primary(cpu) )
         ret = primary_thread_fn(patch);
     else
         ret = secondary_thread_fn();
@@ -642,7 +656,7 @@ static long cf_check microcode_update_helper(void *data)
     /* Calculate the number of online CPU core */
     nr_cores = 0;
     for_each_online_cpu(cpu)
-        if ( cpu == cpumask_first(per_cpu(cpu_sibling_mask, cpu)) )
+        if ( is_cpu_primary(cpu) )
             nr_cores++;
 
     printk(XENLOG_INFO "%u cores are to update their microcode\n", nr_cores);
-- 
2.17.1


