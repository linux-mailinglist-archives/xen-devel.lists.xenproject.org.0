Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E9059F844
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392408.630760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo6w-0001oz-I7; Wed, 24 Aug 2022 10:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392408.630760; Wed, 24 Aug 2022 10:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo6w-0001lv-Es; Wed, 24 Aug 2022 10:59:50 +0000
Received: by outflank-mailman (input) for mailman id 392408;
 Wed, 24 Aug 2022 10:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQo6v-0001Gd-F5
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:59:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddf38264-239b-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 12:59:48 +0200 (CEST)
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
X-Inumbo-ID: ddf38264-239b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661338788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ea/jZybnglsFeEUUogUtQhSeX6C4gXqXHZmw0VungnM=;
  b=HtyCeLI6lV2V58EgSV5c5dRbDNw4ZHHnMAh7hqufekUwqER9cN6mqlTr
   0OLWhd9O020mIeEEWYBiKKwSx5yaHE+1V1XD9PerCHCntVAHdf9wsyJca
   4O552hogsL+H4P1cNmoeS8nRu/g6fK1ELvEjehOiq/Cu1EhWXKRmvPyYQ
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81343715
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:znvxNq8b1l343a/kqLatDrUD436TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GMWWj3XOKrZMTD2c9p2bdzjoE8Eu5LVmoMwGgBoryk8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM14Kyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGFwJmMaIy0f9LGCJEp
 dYHaz0KP0vEiLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoShtDIFoITrk5m/+lnCLXeDxEslOF46Ew5gA/ySQhieOxa4WMJ7RmQ+0MpU+yl
 mnE/l2gGzUnKPiuw2Gv0y2F07qncSTTB9tJSezQGuRRqEKX7nweDlsRT1TTiduTh1O6WtlfA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYWnepru7hxirBTFWJz8oemwJSlpepNa29enfkSnzosZf/L+d14OrQGupk
 mDW8UDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBva/t3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK510IvsACbSH0Nv8nC25UNyjN5fmIKDgYfqqMMoomjmZZLmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL9rxJJdxmUjSM0uPGs2gp/lmuJLCDEOopUAtagLVMbtktvvd+W04M
 b93bqO39vmWa8WmCgG/zGLZBQliwaQTbXwul/FqSw==
IronPort-HdrOrdr: A9a23:F4VgE67QtppRJbWfUwPXwPLXdLJyesId70hD6qhwISY1TiX+rb
 HXoB17726MtN9/YgBCpTntAsa9qDbnhPpICOoqTNGftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkENDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="81343715"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/4] x86/hvmloader: SMP improvements
Date: Wed, 24 Aug 2022 11:59:12 +0100
Message-ID: <20220824105915.32127-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220824105915.32127-1-andrew.cooper3@citrix.com>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Use MOV CR instead of LMSW.  LMSW has no decode assist at all on AMD CPUs,
   forcing us to fully emulate the instruction.
 * Use __attribute__((used)) to fix the comment about ap_start().
 * Have ap_start() perform a self-INIT for APs, rather than having boot_cpu()
   do it.  This is marginally more parallel, and reduces the amount of remote
   vCPU management that Xen has to do on behalf of the guest.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/firmware/hvmloader/smp.c | 46 ++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 082b17f13818..80154950ac32 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -35,9 +35,9 @@ asm (
     "    mov   %cs,%ax               \n"
     "    mov   %ax,%ds               \n"
     "    lgdt  gdt_desr-ap_boot_start\n"
-    "    xor   %ax, %ax              \n"
-    "    inc   %ax                   \n"
-    "    lmsw  %ax                   \n"
+    "    mov   %cr0, %eax            \n"
+    "    or    $1, %al               \n"
+    "    mov   %eax, %cr0            \n"
     "    ljmpl $0x08,$1f             \n"
     "gdt_desr:                       \n"
     "    .word gdt_end - gdt - 1     \n"
@@ -50,8 +50,6 @@ asm (
     "    movl  $stack_top,%esp       \n"
     "    movl  %esp,%ebp             \n"
     "    call  ap_start              \n"
-    "1:  hlt                         \n"
-    "    jmp  1b                     \n"
     "                                \n"
     "    .align 8                    \n"
     "gdt:                            \n"
@@ -68,14 +66,37 @@ asm (
     "    .text                       \n"
     );
 
-void ap_start(void); /* non-static avoids unused-function compiler warning */
-/*static*/ void ap_start(void)
+static void __attribute__((used)) ap_start(void)
 {
-    printf(" - CPU%d ... ", ap_cpuid);
+    unsigned int cpu = ap_cpuid;
+
+    printf(" - CPU%d ... ", cpu);
     cacheattr_init();
     printf("done.\n");
-    wmb();
-    ap_callin = 1;
+
+    /*
+     * Call in to the BSP.  For APs, take ourselves offline.
+     *
+     * We must not use the stack after calling in to the BSP.
+     */
+    asm volatile (
+        "    movb $1, ap_callin          \n"
+
+        "    test %[icr2], %[icr2]       \n"
+        "    jz   .Lbsp                  \n"
+
+        "    movl %[icr2], %[ICR2]       \n"
+        "    movl %[init], %[ICR1]       \n"
+        "1:  hlt                         \n"
+        "    jmp  1b                     \n"
+
+        ".Lbsp:                          \n"
+        :
+        : [icr2] "r" (SET_APIC_DEST_FIELD(LAPIC_ID(cpu))),
+          [init] "i" (APIC_DM_INIT),
+          [ICR1] "m" (*(uint32_t *)(LAPIC_BASE_ADDRESS + APIC_ICR)),
+          [ICR2] "m" (*(uint32_t *)(LAPIC_BASE_ADDRESS + APIC_ICR2))
+        : "memory" );
 }
 
 static void lapic_wait_ready(void)
@@ -111,11 +132,6 @@ static void boot_cpu(unsigned int cpu)
      */
     while ( !ap_callin )
         cpu_relax();
-
-    /* Take the secondary processor offline. */
-    lapic_write(APIC_ICR2, icr2);
-    lapic_write(APIC_ICR, APIC_DM_INIT);
-    lapic_wait_ready();    
 }
 
 void smp_initialise(void)
-- 
2.11.0


