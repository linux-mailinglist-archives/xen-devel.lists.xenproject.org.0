Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12EC577C5E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 09:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369277.600639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1n-0005rB-Is; Mon, 18 Jul 2022 07:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369277.600639; Mon, 18 Jul 2022 07:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1n-0005gn-Do; Mon, 18 Jul 2022 07:18:51 +0000
Received: by outflank-mailman (input) for mailman id 369277;
 Mon, 18 Jul 2022 07:18:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDL1l-0004tp-GG
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 07:18:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd22d0f-0669-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 09:18:48 +0200 (CEST)
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
X-Inumbo-ID: ddd22d0f-0669-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658128728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XkwkicbnqybarudXENzuLnv1vjxC0glvjl5QcpNJ1bw=;
  b=Vz3PPRUgdVdDfZEX51XXFe+pmhT1AL5iIn+wrslCYDDwMuYRR3eaTSQ1
   KDP11ZTmTJHofKwcAxPNuARg/IjlcC/NyKc4N+++LirLZO3FV+ZTa1J/e
   76ZK486u99VGRgEdVGbNyYn4bOdymMtZPzgChq8IYjHk21vDkrECDamBg
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76442484
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YD4n06JDNufvLTwkFE+RuJUlxSXFcZb7ZxGr2PjKsXjdYENS1j1Wn
 WRLXWGBb/mIM2D8KIhzYdi+9kkF7ZfRm9NlHgJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYjdJ5xYuajhOs/3a90s11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE8sh+J2IbbY4iw6VRGmVC0
 eIqcgIQcUXW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HRRLMeRBQfHwQD4ozhryAjXjjaTxI7lmSoMLb5kCMklAtiuS9bLI5fPSJaf1Rwk/Bq
 ljo/m/aLEgIaMXClheKpyfEaujnwnqgBdN6+KeD3uFuqE2ewCoUEhJ+fXmRrOS9i0W+c8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmIyoWVm+2+eXlwrxHzMRIUscV3U2UBRQtrEPv7oPYgLzosdLSfDo0YytSGCsm
 VhmvwBl2exN0JdjO7GTuAme3mny/sWhohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAYlRujBCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hKD4VMLtcALZSr2BUOSX25WI51wpZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGfuR4YIhIf0+lFKeGrZCuYLHMwhkmgs/s7inkEn8uVdfDVbJIYo43KymNL1hsvPc/VmJq
 76y9aKikn1ibQE3WQGPmaZ7ELzABSJT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:ENnVu62qu+sCT10vgT5uSwqjBIgkLtp133Aq2lEZdPRUGvb4qy
 nIpoVi6faUskdpZJhOo6HiBEDtexzhHNtOkO0s1NSZLW/bUQmTXeNfBOLZqlWKcUCTygce79
 YGT0EXMqyKMbEQt6bHCWeDferIuOP3lZyVuQ==
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76442484"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/5] xen/wait: Minor asm improvements
Date: Mon, 18 Jul 2022 08:18:23 +0100
Message-ID: <20220718071825.22113-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220718071825.22113-1-andrew.cooper3@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no point preserving all registers.  Instead, preserve an arbitrary 6
registers, and list the rest as clobbered.  This does not alter the register
scheduling at all, but does reduce the amount of state needing saving.

Use a named parameter for page size, instead of needing to parse which is
parameter 3.  Adjust the formatting of the parameters slightly to simply the
diff of the subsequent patch.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/wait.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index 4dcfa17a8a3f..4bc030d1a09d 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -151,13 +151,12 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
      * copies in from wqv->stack over the active stack.
      */
     asm volatile (
-        "push %%rax; push %%rbx; push %%rdx; push %%rbp;"
-        "push %%r8;  push %%r9;  push %%r10; push %%r11;"
-        "push %%r12; push %%r13; push %%r14; push %%r15;"
+        "push %%rbx; push %%rbp; push %%r12;"
+        "push %%r13; push %%r14; push %%r15;"
 
         "sub %%esp,%%ecx;"
-        "cmp %3,%%ecx;"
-        "ja .L_skip;"
+        "cmp %[sz], %%ecx;"
+        "ja .L_skip;"       /* Bail if >4k */
         "mov %%rsp,%%rsi;"
 
         /* check_wakeup_from_wait() longjmp()'s to this point. */
@@ -165,12 +164,12 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         "mov %%rsp,%%rsi;"
 
         ".L_skip:"
-        "pop %%r15; pop %%r14; pop %%r13; pop %%r12;"
-        "pop %%r11; pop %%r10; pop %%r9;  pop %%r8;"
-        "pop %%rbp; pop %%rdx; pop %%rbx; pop %%rax"
+        "pop %%r15; pop %%r14; pop %%r13;"
+        "pop %%r12; pop %%rbp; pop %%rbx;"
         : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
-        : "i" (PAGE_SIZE), "0" (0), "1" (cpu_info), "2" (wqv->stack)
-        : "memory" );
+        : "0" (0), "1" (cpu_info), "2" (wqv->stack),
+          [sz] "i" (PAGE_SIZE)
+        : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
 
     if ( unlikely(wqv->esp == 0) )
     {
@@ -224,11 +223,12 @@ void check_wakeup_from_wait(void)
      * All other GPRs are available for use; they're either restored from
      * wqv->stack or explicitly clobbered.
      */
-    asm volatile (
-        "mov %1,%%"__OP"sp; jmp .L_wq_resume;"
-        : : "S" (wqv->stack), "D" (wqv->esp),
-          "c" ((char *)get_cpu_info() - (char *)wqv->esp)
-        : "memory" );
+    asm volatile ( "mov %%rdi, %%rsp;"
+                   "jmp .L_wq_resume;"
+                   :
+                   : "S" (wqv->stack), "D" (wqv->esp),
+                     "c" ((char *)get_cpu_info() - (char *)wqv->esp)
+                   : "memory" );
     unreachable();
 }
 
-- 
2.11.0


