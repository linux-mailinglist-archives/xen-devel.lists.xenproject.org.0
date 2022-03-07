Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2BD4D08F7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 21:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286413.485918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRKMQ-0007Sj-JR; Mon, 07 Mar 2022 20:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286413.485918; Mon, 07 Mar 2022 20:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRKMQ-0007Q3-G8; Mon, 07 Mar 2022 20:53:42 +0000
Received: by outflank-mailman (input) for mailman id 286413;
 Mon, 07 Mar 2022 20:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NfF=TS=citrix.com=prvs=058fb9784=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRKMP-0007Px-EY
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 20:53:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a898a0a6-9e58-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 21:53:39 +0100 (CET)
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
X-Inumbo-ID: a898a0a6-9e58-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646686419;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kGpvloH2UbvmNZsKLoVi6Ea5k+FfbGw44P7pdOUT/Vw=;
  b=PKbLKCUf+e9p7fmq7QESwJ+C+vtfFlUNGiXME2wuE89448nzMsEqSTDu
   5BJUzaQ8NACCYOzPTh7QWxeCMQT+0rhcKaqdI7aeO8W7GZs7OLZl+5L3+
   Ir9OfubJelbGjZ2injYMItWqAQtQ8w8JMZfXlFfV+Mmbri2d6nw9P7mlW
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65647635
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KNy4L6hw+01ltNmAD51CKmyyX161cBAKZh0ujC45NGQN5FlHY01je
 htvWDrUM/yONGD9L9pyaYmx8UhXu8eEydFqHFdur3wyE3gb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvS4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQ0wGPzNkd4FahRdHHEiNL1j5ZXWcHfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2cxMEueOEAn1lE/LJ0nt9WrqCLDQxYDoXK+o5UMv0zRw1kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPST1yCM+H+oruTGmz/yUsQUGaHQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa1mamU938VB2Qu2Ofs1gXXN84LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobTYz8
 A6IlunxPDFqv+3JQGK4652F/DznbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhrx/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyXTlrAYlRujBCxO53Nv02wYH834JrWjFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtztVZp1nfW7TIS4DZg4i+aihLArL2drGwk0OSatM53FyhBwwcnTx
 7/BGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l6U66Bme56Itc990mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:AHYWGKlMsYlrxmqXT/JykLdXdrvpDfIi3DAbv31ZSRFFG/Fxl6
 iV/cjzsiWE7gr5OUtQ/uxoV5PwIk80maQb3WBzB8bHYOCFghrLEGgK1+KLqFeMdxEWntQtrJ
 uIGJIfNDSfNzZHZL7BkWyFL+o=
X-IronPort-AV: E=Sophos;i="5.90,163,1643691600"; 
   d="scan'208";a="65647635"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, David Vrabel
	<dvrabel@cantab.net>
Subject: [PATCH] x86/kexec: Fix kexec-reboot with CET active
Date: Mon, 7 Mar 2022 20:53:13 +0000
Message-ID: <20220307205313.31247-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The kexec_reloc() asm has an indirect jump to relocate onto the identity
trampoline.  While we clear CET in machine_crash_shutdown(), we fail to clear
CET for the non-crash path.  This in turn highlights that the same is true of
resetting the CPUID masking/faulting.

Move both pieces of logic from machine_crash_shutdown() to machine_kexec(),
the latter being common for all kexec transitions.  Adjust the condition for
CET being considered active to check in CR4, which is simpler and more robust.

Fixes: 311434bfc9d1 ("x86/setup: Rework MSR_S_CET handling for CET-IBT")
Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
Fixes: 5ab9564c6fa1 ("x86/cpu: Context switch cpuid masks and faulting state in context_switch()")
Reported-by: David Vrabel (XXX which alias to use?)
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: David Vrabel <dvrabel@cantab.net>
---
 xen/arch/x86/crash.c         | 10 ----------
 xen/arch/x86/machine_kexec.c | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 003222c0f1ac..99089f77a7eb 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -187,16 +187,6 @@ void machine_crash_shutdown(void)
 
     nmi_shootdown_cpus();
 
-    /* Reset CPUID masking and faulting to the host's default. */
-    ctxt_switch_levelling(NULL);
-
-    /* Disable CET. */
-    if ( cpu_has_xen_shstk || cpu_has_xen_ibt )
-    {
-        wrmsrl(MSR_S_CET, 0);
-        write_cr4(read_cr4() & ~X86_CR4_CET);
-    }
-
     info = kexec_crash_save_info();
     info->xen_phys_start = xen_phys_start;
     info->dom0_pfn_to_mfn_frame_list_list =
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index 751a9efcaf6a..d83aa4e7e93b 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -156,6 +156,16 @@ void machine_kexec(struct kexec_image *image)
      */
     local_irq_disable();
 
+    /* Reset CPUID masking and faulting to the host's default. */
+    ctxt_switch_levelling(NULL);
+
+    /* Disable CET. */
+    if ( read_cr4() & X86_CR4_CET )
+    {
+        wrmsrl(MSR_S_CET, 0);
+        write_cr4(read_cr4() & ~X86_CR4_CET);
+    }
+
     /* Now regular interrupts are disabled, we need to reduce the impact
      * of interrupts not disabled by 'cli'.
      *
-- 
2.11.0


