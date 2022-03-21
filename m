Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDC54E29E2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 15:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293014.497676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWIlp-0001YZ-VS; Mon, 21 Mar 2022 14:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293014.497676; Mon, 21 Mar 2022 14:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWIlp-0001W8-S1; Mon, 21 Mar 2022 14:12:29 +0000
Received: by outflank-mailman (input) for mailman id 293014;
 Mon, 21 Mar 2022 14:12:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ob4L=UA=citrix.com=prvs=0720edaad=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nWIln-0001Vx-SI
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 14:12:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede5e6a4-a920-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 15:12:26 +0100 (CET)
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
X-Inumbo-ID: ede5e6a4-a920-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647871946;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mafovDzuI/9KH39XYeumNUYSslRqvNPaZnhQOUghNbY=;
  b=VpF7fLPUpb48r9Z/OtWluI5oaZH+l6/Seu46RNBhlfR8zPA50c0x317M
   Ls4ojv9YFs+rM3J5Gld01rdkSXVE59nE+GJx1f0mTnL1X1rMzSuc3AlD3
   voKMnhBYqIgE8yfhcA5e5/erT0jhrtJVYjoNY4te5N1oK3N99K1Y3Ww5U
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66686804
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TaZeO6DkemiE/hVW/1njw5YqxClBgxIJ4kV8jS/XYbTApD8lhjVWy
 zNMUDyObK2CNGb9c9p/YIW1oRwAvZTVxoU3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgtk
 vlQro2wWTwpEbfNuNknVxxfKhBxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4QQ6aAN
 5JFAdZpRAXwY0B+EVQZM6N9hur0hnb/UTJGpGvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0B4B8DvYr6BG2yoXO4iakPGwBSQdwZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP+D2BLwQKChRqlEGp+ZgPd1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyHzJNgJuWEnfxYB3iM4ldjBO
 hK7hO+szMULYCvCgVFfPepd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs+1yEr
 YwAa5PUl32ykoTWO0HqzGLaFnhSRVBTOHw8g5UGHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:HsqDy6w6cSU5PzsZK5byKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="66686804"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/apic: Fix function typechecking in TSC Deadline errata check
Date: Mon, 21 Mar 2022 14:12:07 +0000
Message-ID: <20220321141207.18422-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Sadly, cf_check typechecking doesn't work through casts.  Introduce an ad-hoc
typecheck and fix *_readline_rev() checks to be cf_check.

This is a latent bug.  The affected models don't have CET-IBT, so won't
actually explode from lacking endbr64 instructions.

Reported-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/apic.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 96d73a744964..794bbc21ae2c 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1092,12 +1092,17 @@ static void setup_APIC_timer(void)
     local_irq_restore(flags);
 }
 
+#define DEADLINE_MODEL_FUNCT(m, fn) \
+    { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
+      .feature = X86_FEATURE_TSC_DEADLINE, \
+      .driver_data = fn + (0 * sizeof(fn == ((unsigned int (*)(void))NULL))) }
+
 #define DEADLINE_MODEL_MATCH(m, fr) \
     { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
       .feature = X86_FEATURE_TSC_DEADLINE, \
       .driver_data = (void *)(unsigned long)(fr) }
 
-static unsigned int __init hsx_deadline_rev(void)
+static unsigned int __init cf_check hsx_deadline_rev(void)
 {
     switch ( boot_cpu_data.x86_mask )
     {
@@ -1108,7 +1113,7 @@ static unsigned int __init hsx_deadline_rev(void)
     return ~0U;
 }
 
-static unsigned int __init bdx_deadline_rev(void)
+static unsigned int __init cf_check bdx_deadline_rev(void)
 {
     switch ( boot_cpu_data.x86_mask )
     {
@@ -1121,7 +1126,7 @@ static unsigned int __init bdx_deadline_rev(void)
     return ~0U;
 }
 
-static unsigned int __init skx_deadline_rev(void)
+static unsigned int __init cf_check skx_deadline_rev(void)
 {
     switch ( boot_cpu_data.x86_mask )
     {
@@ -1135,17 +1140,17 @@ static unsigned int __init skx_deadline_rev(void)
 
 static const struct x86_cpu_id __initconstrel deadline_match[] = {
     DEADLINE_MODEL_MATCH(0x3c, 0x22),             /* Haswell */
-    DEADLINE_MODEL_MATCH(0x3f, hsx_deadline_rev), /* Haswell EP/EX */
+    DEADLINE_MODEL_FUNCT(0x3f, hsx_deadline_rev), /* Haswell EP/EX */
     DEADLINE_MODEL_MATCH(0x45, 0x20),             /* Haswell D */
     DEADLINE_MODEL_MATCH(0x46, 0x17),             /* Haswell H */
 
     DEADLINE_MODEL_MATCH(0x3d, 0x25),             /* Broadwell */
     DEADLINE_MODEL_MATCH(0x47, 0x17),             /* Broadwell H */
     DEADLINE_MODEL_MATCH(0x4f, 0x0b000020),       /* Broadwell EP/EX */
-    DEADLINE_MODEL_MATCH(0x56, bdx_deadline_rev), /* Broadwell D */
+    DEADLINE_MODEL_FUNCT(0x56, bdx_deadline_rev), /* Broadwell D */
 
     DEADLINE_MODEL_MATCH(0x4e, 0xb2),             /* Skylake M */
-    DEADLINE_MODEL_MATCH(0x55, skx_deadline_rev), /* Skylake X */
+    DEADLINE_MODEL_FUNCT(0x55, skx_deadline_rev), /* Skylake X */
     DEADLINE_MODEL_MATCH(0x5e, 0xb2),             /* Skylake D */
 
     DEADLINE_MODEL_MATCH(0x8e, 0x52),             /* Kabylake M */
-- 
2.11.0


