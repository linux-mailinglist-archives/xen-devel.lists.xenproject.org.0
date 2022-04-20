Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5555508A6B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309288.525426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5M-0002Pj-3V; Wed, 20 Apr 2022 14:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309288.525426; Wed, 20 Apr 2022 14:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5L-0002Gm-TJ; Wed, 20 Apr 2022 14:13:35 +0000
Received: by outflank-mailman (input) for mailman id 309288;
 Wed, 20 Apr 2022 14:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhB5J-0001HT-AI
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:13:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0de30529-c0b4-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 16:13:30 +0200 (CEST)
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
X-Inumbo-ID: 0de30529-c0b4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650464010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gXnxEoUiWo8s2nXZt3K2P0Lqj86T6+uf6sicbBh7yZU=;
  b=J3knBZaezJhIuzzcdTBpkP7meSkUhWyAX3Mdu2a07ASW/Shr9T+UAO70
   XScZz+mSFegg09ZEhyoJNPO+9UI44Uozgw68ohqRQXxL0mzBOlJoc7C6q
   2Y8ZPkA8J84NL9a5KM/YENkyM3JgBKYlktD4ksgdJdflWSW/VSamAZ9OL
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69534207
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZpbATarVUlS7DXBnP68teaupsJBeBmLwZRIvgKrLsJaIsI4StFCzt
 garIBmCP6uNZGv1LY10Ydni8kgBvJPSz9BqTwNrq39gFC4Q9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 4uq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBEqTok783SAFhIyhQOL1qwZDKB1WYiJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxPUmbP0cXZT/7Droz3+r02lXgIgRhj2O0+7sq8y+CzQF+he2F3N39JYXRGJQ9clyjj
 mDb+2X0BDkKOdrZziCKmlqzgsffkCW9X5gdfJWy++R2mlSVyioWAQcPSFqgifCjjwi1XNc3A
 3IT/i0ivK0j7nuBR9P2XwC7iHOctxtaUN1Ve8Uw7wuH2+zZ+AadC20NSBZObdUnsIk9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiijgIzmrEShs4jzLig8BbMhDfEm3TSZldrvEONBDvjt14nIt7+D2C11bTFxdpJCI3CZEKZh
 UgNtc2OwNkhALegsxXYFY3hA4qVz/qCNTTdh3tmEJ8g6ymh9hafQGxA3N1tDBw3a5hZIFcFd
 GeW4FoMv8ELYBNGeIctO+qM59IWIb8M/DgPftTddZJwb5d4b2drFwk+NBfLjwgBfKXB+JzT2
 Kt3k+7xVR726ow9lVJaotvxNpdxmEgDKZv7H8yT8vhe+eP2iISpYbkEKkCSSesy8bmJpg7Ym
 /4GaZbSl00FDLKhOHmLmWL2EbzsBSFqbXwRg5YJHtNv3yI8QD1xYxMv6e9Jl3NZc1R9yb6To
 yDVtr5ww1vjn3zXQThmmVg4AI4Dqa1X9CphVQR1ZA7A8yF6Pe6HsfZEH7NqLOZPyQCW5aMtJ
 xXzU57YUqonp/Wu02l1UKQRW6Q7LUrw1FPSZXf9CNX9FrY5LzH0FhbfVlOH3EEz4uCf6aPSf
 5XIOtvnfKc+
IronPort-HdrOrdr: A9a23:m3VoOamXvnPmrWDt/Obggpc5ltHpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.90,275,1643691600"; 
   d="scan'208";a="69534207"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bobby Eshleman <bobby.eshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH v5 6/6] xen: Split x86/debugger.h into common and arch specific parts
Date: Wed, 20 Apr 2022 15:13:07 +0100
Message-ID: <20220420141307.24153-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420141307.24153-1-andrew.cooper3@citrix.com>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobby.eshleman@gmail.com>

With all the non-CONFIG_CRASH_DEBUG functionality moved elsewhere, split
x86/debugger.h in two, with the stubs and explanation moved to xen/debugger.h.

In particular, this means that arches only need to provide an $arch/debugger.h
if they implement CONFIG_CRASH_DEBUG, and ARM's stub can be deleted.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

v5:
 * Clean up includes
 * Drop rendundant comments
---
 xen/arch/arm/include/asm/debugger.h                | 15 --------
 xen/arch/x86/include/asm/debugger.h                | 34 +----------------
 xen/arch/x86/traps.c                               |  2 +-
 xen/common/keyhandler.c                            |  2 +-
 xen/common/shutdown.c                              |  2 +-
 xen/drivers/char/console.c                         |  2 +-
 .../x86/include/asm => include/xen}/debugger.h     | 44 +++++++---------------
 7 files changed, 20 insertions(+), 81 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/debugger.h
 copy xen/{arch/x86/include/asm => include/xen}/debugger.h (54%)

diff --git a/xen/arch/arm/include/asm/debugger.h b/xen/arch/arm/include/asm/debugger.h
deleted file mode 100644
index ac776efa7899..000000000000
--- a/xen/arch/arm/include/asm/debugger.h
+++ /dev/null
@@ -1,15 +0,0 @@
-#ifndef __ARM_DEBUGGER_H__
-#define __ARM_DEBUGGER_H__
-
-#define debugger_trap_fatal(v, r) (0)
-#define debugger_trap_immediate() ((void) 0)
-
-#endif /* __ARM_DEBUGGER_H__ */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/arch/x86/include/asm/debugger.h
index 5bac2ee4c2a4..a5c299c6c34d 100644
--- a/xen/arch/x86/include/asm/debugger.h
+++ b/xen/arch/x86/include/asm/debugger.h
@@ -1,30 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
- * asm/debugger.h
- * 
- * Generic hooks into arch-dependent Xen.
- * 
- * Each debugger should define two functions here:
- * 
- * debugger_trap_fatal():
- *  Called when Xen is about to give up and crash. Typically you will use this
- *  hook to drop into a debug session. It can also be used to hook off
- *  deliberately caused traps (which you then handle and return non-zero).
+ * xen/arch/x86/include/asm/debugger.h
  *
- * debugger_trap_immediate():
- *  Called if we want to drop into a debugger now.  This is essentially the
- *  same as debugger_trap_fatal, except that we use the current register state
- *  rather than the state which was in effect when we took the trap.
- *  For example: if we're dying because of an unhandled exception, we call
- *  debugger_trap_fatal; if we're dying because of a panic() we call
- *  debugger_trap_immediate().
+ * x86-specific debugger hooks.
  */
-
 #ifndef __X86_DEBUGGER_H__
 #define __X86_DEBUGGER_H__
 
-#ifdef CONFIG_CRASH_DEBUG
-
 #include <xen/gdbstub.h>
 #include <xen/stdbool.h>
 
@@ -45,16 +27,4 @@ static inline bool debugger_trap_fatal(
 /* Int3 is a trivial way to gather cpu_user_regs context. */
 #define debugger_trap_immediate() __asm__ __volatile__ ( "int3" )
 
-#else
-
-static inline bool debugger_trap_fatal(
-    unsigned int vector, struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-#define debugger_trap_immediate() ((void)0)
-
-#endif
-
 #endif /* __X86_DEBUGGER_H__ */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d91532461189..25bffe47d7ae 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -36,6 +36,7 @@
 #include <xen/shutdown.h>
 #include <xen/guest_access.h>
 #include <asm/regs.h>
+#include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/event.h>
 #include <xen/spinlock.h>
@@ -64,7 +65,6 @@
 #include <asm/uaccess.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
 #include <asm/xenoprof.h>
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index ca9ee0790149..0a551033c443 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -3,6 +3,7 @@
  */
 
 #include <asm/regs.h>
+#include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
 #include <xen/param.h>
@@ -20,7 +21,6 @@
 #include <xen/mm.h>
 #include <xen/watchdog.h>
 #include <xen/init.h>
-#include <asm/debugger.h>
 #include <asm/div64.h>
 
 static unsigned char keypress_key;
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index abde48aa4ca0..a933ee001ea4 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -2,13 +2,13 @@
 #include <xen/lib.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+#include <xen/debugger.h>
 #include <xen/domain.h>
 #include <xen/delay.h>
 #include <xen/watchdog.h>
 #include <xen/shutdown.h>
 #include <xen/console.h>
 #include <xen/kexec.h>
-#include <asm/debugger.h>
 #include <public/sched.h>
 
 /* opt_noreboot: If true, machine will need manual reset on error. */
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index d9d6556c2293..f9937c5134c0 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -15,6 +15,7 @@
 #include <xen/init.h>
 #include <xen/event.h>
 #include <xen/console.h>
+#include <xen/debugger.h>
 #include <xen/param.h>
 #include <xen/serial.h>
 #include <xen/softirq.h>
@@ -26,7 +27,6 @@
 #include <xen/kexec.h>
 #include <xen/ctype.h>
 #include <xen/warning.h>
-#include <asm/debugger.h>
 #include <asm/div64.h>
 #include <xen/hypercall.h> /* for do_console_io */
 #include <xen/early_printk.h>
diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/include/xen/debugger.h
similarity index 54%
copy from xen/arch/x86/include/asm/debugger.h
copy to xen/include/xen/debugger.h
index 5bac2ee4c2a4..72684268aff7 100644
--- a/xen/arch/x86/include/asm/debugger.h
+++ b/xen/include/xen/debugger.h
@@ -1,11 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
- * asm/debugger.h
- * 
- * Generic hooks into arch-dependent Xen.
- * 
- * Each debugger should define two functions here:
- * 
+ * Arch specific debuggers should implement:
+ *
  * debugger_trap_fatal():
  *  Called when Xen is about to give up and crash. Typically you will use this
  *  hook to drop into a debug session. It can also be used to hook off
@@ -20,41 +16,29 @@
  *  debugger_trap_immediate().
  */
 
-#ifndef __X86_DEBUGGER_H__
-#define __X86_DEBUGGER_H__
+#ifndef __XEN_DEBUGGER_H__
+#define __XEN_DEBUGGER_H__
 
 #ifdef CONFIG_CRASH_DEBUG
 
-#include <xen/gdbstub.h>
-#include <xen/stdbool.h>
-
-#include <asm/x86-defns.h>
-
-/* Returns true if GDB handled the trap, or it is surviveable. */
-static inline bool debugger_trap_fatal(
-    unsigned int vector, struct cpu_user_regs *regs)
-{
-    int rc = __trap_to_gdb(regs, vector);
-
-    if ( rc == 0 )
-        return true;
+#include <asm/debugger.h>
 
-    return vector == X86_EXC_BP;
-}
+#else
 
-/* Int3 is a trivial way to gather cpu_user_regs context. */
-#define debugger_trap_immediate() __asm__ __volatile__ ( "int3" )
+#include <xen/stdbool.h>
 
-#else
+struct cpu_user_regs;
 
 static inline bool debugger_trap_fatal(
-    unsigned int vector, struct cpu_user_regs *regs)
+    unsigned int vector, const struct cpu_user_regs *regs)
 {
     return false;
 }
 
-#define debugger_trap_immediate() ((void)0)
+static inline void debugger_trap_immediate(void)
+{
+}
 
-#endif
+#endif /* CONFIG_CRASH_DEBUG */
 
-#endif /* __X86_DEBUGGER_H__ */
+#endif /* __XEN_DEBUGGER_H__ */
-- 
2.11.0


