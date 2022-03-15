Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735344DA085
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 17:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290900.493518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUAQu-0000tG-Qz; Tue, 15 Mar 2022 16:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290900.493518; Tue, 15 Mar 2022 16:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUAQu-0000qu-NR; Tue, 15 Mar 2022 16:54:04 +0000
Received: by outflank-mailman (input) for mailman id 290900;
 Tue, 15 Mar 2022 16:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDZV=T2=citrix.com=prvs=066e9a523=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUAQt-0000cD-Ew
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 16:54:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 826ccd5e-a480-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 17:54:00 +0100 (CET)
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
X-Inumbo-ID: 826ccd5e-a480-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647363241;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H0SNGKWs4zG8ho5bjRotDJE8ddvOcKGQyN+7cYpu6zk=;
  b=RXjcKOo0gvmSaEpis3/eJPsUWfRE/HFMo7v4VMRQPPr8BVu3PayWlCsQ
   DfWaDqagIGGPEnrYpPQeyZLarW1sh+RnkJG1rIaqhT+ll8Nwyd+5ye7Dz
   E61K/0koqbtCqr9jjwQICMcu9PEiMg3ssbiHHGffWYxcHVoLcWB/Iyklg
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65775682
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kY4/za8l15Ysr+N6UUhPDrUDpH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GFJCmyAaKmJZzfwco0lPoS+p0kF6MeAyt83SAVtqig8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHkW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbCLSyowOaf2pLkiDkV5SmJGD4MY2rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZdGNmcxPE6ojxtnK3NKAq0fhtuTnSfdYgZUommql4Mw2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkfPcaawCCI8VqtgPHOhiLxXI8OFLy++eVuiVfVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiFyuswMYWtFQO/Yn8wzLwa3Rizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxRDi7+4UHWXzIvJkm7uGHFWFV0sOw0LGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuq7t3N702wcH83wdG9KFoCbLkWd4um0WGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5CaqFNIMUMsErLmdrGR2Cg2bLhggBd2B2zckC1
 WqzK57wXR7294w6pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ+xvULzLiUp
 i/hMqKaoXKm7UD6xcyxQigLQNvSsVxX9hrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:aPMvgaE8D5576uXtpLqE5seALOsnbusQ8zAXP0AYc31om6uj5q
 aTdZUgpHjJYVkqKRIdcLy7V5VoIkmskaKdg7NhX4tKNTOO0ADDQe1fBOPZskTd8kbFltK1u5
 0PT0EHMqyUMWRH
X-IronPort-AV: E=Sophos;i="5.90,184,1643691600"; 
   d="scan'208";a="65775682"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow stack
Date: Tue, 15 Mar 2022 16:53:40 +0000
Message-ID: <20220315165340.32144-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

An unintended consequence of the BSP using cpu0_stack[] is that writeable
mappings to the BSPs shadow stacks are retained in the bss.  This renders
CET-SS almost useless, as an attacker can update both return addresses and the
ret will not fault.

We specifically don't want the shatter the superpage mapping .data/.bss, so
the only way to fix this is to not have the BSP stack in the main Xen image.

Break cpu_alloc_stack() out of cpu_smpboot_alloc(), and dynamically allocate
the BSP stack as early as reasonable in __start_xen().  As a consequence,
there is no need to delay the BSP's memguard_guard_stack() call.

Copy the top of cpu info block just before switching to use the new stack.
Fix a latent bug by setting %rsp to info->guest_cpu_user_regs rather than
->es; this would be buggy if reinit_bsp_stack() called schedule() (which
rewrites the GPR block) directly, but luckily it doesn't.

Finally, move cpu0_stack[] into .init, so it can be reclaimed after boot.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/smp.h |  2 ++
 xen/arch/x86/setup.c           | 20 +++++++++++++-------
 xen/arch/x86/smpboot.c         | 26 +++++++++++++++++++-------
 xen/arch/x86/xen.lds.S         |  4 ++--
 4 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index 1747772d232e..41a3b6a0dadf 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -85,6 +85,8 @@ extern cpumask_t **socket_cpumask;
 extern unsigned int disabled_cpus;
 extern bool unaccounted_cpus;
 
+void *cpu_alloc_stack(unsigned int cpu);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 22a9885dee5c..1f816ce05a07 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -148,7 +148,7 @@ cpumask_t __read_mostly cpu_present_map;
 
 unsigned long __read_mostly xen_phys_start;
 
-char __section(".bss.stack_aligned") __aligned(STACK_SIZE)
+char __section("init.bss.stack_aligned") __aligned(STACK_SIZE)
     cpu0_stack[STACK_SIZE];
 
 /* Used by the BSP/AP paths to find the higher half stack mapping to use. */
@@ -712,7 +712,6 @@ static void __init noreturn reinit_bsp_stack(void)
     percpu_traps_init();
 
     stack_base[0] = stack;
-    memguard_guard_stack(stack);
 
     rc = setup_cpu_root_pgt(0);
     if ( rc )
@@ -886,6 +885,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 {
     char *memmap_type = NULL;
     char *cmdline, *kextra, *loader;
+    void *bsp_stack;
+    struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
     multiboot_info_t *mbi;
     module_t *mod;
@@ -918,7 +919,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     /* Full exception support from here on in. */
 
     rdmsrl(MSR_EFER, this_cpu(efer));
-    asm volatile ( "mov %%cr4,%0" : "=r" (get_cpu_info()->cr4) );
+    asm volatile ( "mov %%cr4,%0" : "=r" (info->cr4) );
 
     /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
     enable_nmis();
@@ -1703,6 +1704,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      */
     vm_init();
 
+    bsp_stack = cpu_alloc_stack(0);
+    if ( !bsp_stack )
+        panic("No memory for BSP stack\n");
+
     console_init_ring();
     vesa_init();
 
@@ -1974,17 +1979,18 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( bsp_delay_spec_ctrl )
     {
-        struct cpu_info *info = get_cpu_info();
-
         info->spec_ctrl_flags &= ~SCF_use_shadow;
         barrier();
         wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
         info->last_spec_ctrl = default_xen_spec_ctrl;
     }
 
-    /* Jump to the 1:1 virtual mappings of cpu0_stack. */
+    /* Copy the cpu info block, and move onto the BSP stack. */
+    bsp_info = get_cpu_info_from_stack((unsigned long)bsp_stack);
+    *bsp_info = *info;
+
     asm volatile ("mov %[stk], %%rsp; jmp %c[fn]" ::
-                  [stk] "g" (__va(__pa(get_stack_bottom()))),
+                  [stk] "g" (&bsp_info->guest_cpu_user_regs),
                   [fn] "i" (reinit_bsp_stack) : "memory");
     unreachable();
 }
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 709704d71ada..b46fd9ab18e4 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1023,6 +1023,23 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     }
 }
 
+void *cpu_alloc_stack(unsigned int cpu)
+{
+    nodeid_t node = cpu_to_node(cpu);
+    unsigned int memflags = 0;
+    void *stack;
+
+    if ( node != NUMA_NO_NODE )
+        memflags = MEMF_node(node);
+
+    stack = alloc_xenheap_pages(STACK_ORDER, memflags);
+
+    if ( stack )
+        memguard_guard_stack(stack);
+
+    return stack;
+}
+
 static int cpu_smpboot_alloc(unsigned int cpu)
 {
     struct cpu_info *info;
@@ -1035,15 +1052,10 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     if ( node != NUMA_NO_NODE )
         memflags = MEMF_node(node);
 
-    if ( stack_base[cpu] == NULL )
-    {
-        stack_base[cpu] = alloc_xenheap_pages(STACK_ORDER, memflags);
-        if ( !stack_base[cpu] )
+    if ( stack_base[cpu] == NULL &&
+         (stack_base[cpu] = cpu_alloc_stack(cpu)) == NULL )
             goto out;
 
-        memguard_guard_stack(stack_base[cpu]);
-    }
-
     info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
     info->processor_id = cpu;
     info->per_cpu_offset = __per_cpu_offset[cpu];
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 4103763f6391..9cd4fe417e14 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -215,8 +215,9 @@ SECTIONS
   } PHDR(text)
   DECL_SECTION(.init.data) {
 #endif
+       . = ALIGN(STACK_SIZE);
+       *(.init.bss.stack_aligned)
 
-       . = ALIGN(POINTER_ALIGN);
        __initdata_cf_clobber_start = .;
        *(.init.data.cf_clobber)
        *(.init.rodata.cf_clobber)
@@ -300,7 +301,6 @@ SECTIONS
 
   DECL_SECTION(.bss) {
        __bss_start = .;
-       *(.bss.stack_aligned)
        *(.bss.page_aligned*)
        . = ALIGN(PAGE_SIZE);
        __per_cpu_start = .;
-- 
2.11.0


