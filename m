Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A789E524F2F
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 16:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327726.550603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9OC-0001bw-Ow; Thu, 12 May 2022 14:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327726.550603; Thu, 12 May 2022 14:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9OC-0001Za-Kx; Thu, 12 May 2022 14:02:00 +0000
Received: by outflank-mailman (input) for mailman id 327726;
 Thu, 12 May 2022 14:01:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVjp=VU=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1np9OB-0001Gk-1j
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 14:01:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15d8e904-d1fc-11ec-a406-831a346695d4;
 Thu, 12 May 2022 16:01:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D99FD61A4F;
 Thu, 12 May 2022 14:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E6AC385B8;
 Thu, 12 May 2022 14:01:56 +0000 (UTC)
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
X-Inumbo-ID: 15d8e904-d1fc-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652364116;
	bh=veazphcYW1xAUy40XJ7IGNsO6QwIdAH+107wflvfuDw=;
	h=Subject:To:Cc:From:Date:From;
	b=tAdlGNgjhrx4BOlJ8FZRkq3L8YGJVzUvXFHB4Dv5JY64czZe9cLD2bKuJ+jp4RLn4
	 RoHBtBx236snzAcL/Nhxlvk8xyFFiRhTP1hqbFbt2eegFfQBGfOYmKFUaZ01JLWhzq
	 OHf3+HgcwdfYYjK3h9tW5bz926DPP/Uxw2koLeeA=
Subject: Patch "x86: xen: kvm: Gather the definition of emulate prefixes" has been added to the 5.4-stable tree
To: andrew.cooper3@citrix.com,boris.ostrovsky@oracle.com,bp@alien8.de,gregkh@linuxfoundation.org,jgross@suse.com,jpoimboe@redhat.com,mheyne@amazon.de,mhiramat@kernel.org,mingo@kernel.org,peterz@infradead.org,rdunlap@infradead.org,sstabellini@kernel.org,x86@kernel.org,xen-devel@lists.xenproject.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 May 2022 16:01:38 +0200
Message-ID: <1652364098240167@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    x86: xen: kvm: Gather the definition of emulate prefixes

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     x86-xen-kvm-gather-the-definition-of-emulate-prefixes.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From b3dc0695fa40c3b280230fb6fb7fb7a94ce28bf4 Mon Sep 17 00:00:00 2001
From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 6 Sep 2019 22:13:59 +0900
Subject: x86: xen: kvm: Gather the definition of emulate prefixes

From: Masami Hiramatsu <mhiramat@kernel.org>

commit b3dc0695fa40c3b280230fb6fb7fb7a94ce28bf4 upstream.

Gather the emulate prefixes, which forcibly make the following
instruction emulated on virtualization, in one place.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lkml.kernel.org/r/156777563917.25081.7286628561790289995.stgit@devnote2
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/include/asm/emulate_prefix.h |   14 ++++++++++++++
 arch/x86/include/asm/xen/interface.h  |   11 ++++-------
 arch/x86/kvm/x86.c                    |    4 +++-
 3 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 arch/x86/include/asm/emulate_prefix.h

--- /dev/null
+++ b/arch/x86/include/asm/emulate_prefix.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_EMULATE_PREFIX_H
+#define _ASM_X86_EMULATE_PREFIX_H
+
+/*
+ * Virt escape sequences to trigger instruction emulation;
+ * ideally these would decode to 'whole' instruction and not destroy
+ * the instruction stream; sadly this is not true for the 'kvm' one :/
+ */
+
+#define __XEN_EMULATE_PREFIX  0x0f,0x0b,0x78,0x65,0x6e  /* ud2 ; .ascii "xen" */
+#define __KVM_EMULATE_PREFIX  0x0f,0x0b,0x6b,0x76,0x6d	/* ud2 ; .ascii "kvm" */
+
+#endif
--- a/arch/x86/include/asm/xen/interface.h
+++ b/arch/x86/include/asm/xen/interface.h
@@ -379,12 +379,9 @@ struct xen_pmu_arch {
  * Prefix forces emulation of some non-trapping instructions.
  * Currently only CPUID.
  */
-#ifdef __ASSEMBLY__
-#define XEN_EMULATE_PREFIX .byte 0x0f,0x0b,0x78,0x65,0x6e ;
-#define XEN_CPUID          XEN_EMULATE_PREFIX cpuid
-#else
-#define XEN_EMULATE_PREFIX ".byte 0x0f,0x0b,0x78,0x65,0x6e ; "
-#define XEN_CPUID          XEN_EMULATE_PREFIX "cpuid"
-#endif
+#include <asm/emulate_prefix.h>
+
+#define XEN_EMULATE_PREFIX __ASM_FORM(.byte __XEN_EMULATE_PREFIX ;)
+#define XEN_CPUID          XEN_EMULATE_PREFIX __ASM_FORM(cpuid)
 
 #endif /* _ASM_X86_XEN_INTERFACE_H */
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -68,6 +68,7 @@
 #include <asm/mshyperv.h>
 #include <asm/hypervisor.h>
 #include <asm/intel_pt.h>
+#include <asm/emulate_prefix.h>
 #include <clocksource/hyperv_timer.h>
 
 #define CREATE_TRACE_POINTS
@@ -5583,6 +5584,7 @@ EXPORT_SYMBOL_GPL(kvm_write_guest_virt_s
 
 int handle_ud(struct kvm_vcpu *vcpu)
 {
+	static const char kvm_emulate_prefix[] = { __KVM_EMULATE_PREFIX };
 	int emul_type = EMULTYPE_TRAP_UD;
 	char sig[5]; /* ud2; .ascii "kvm" */
 	struct x86_exception e;
@@ -5590,7 +5592,7 @@ int handle_ud(struct kvm_vcpu *vcpu)
 	if (force_emulation_prefix &&
 	    kvm_read_guest_virt(vcpu, kvm_get_linear_rip(vcpu),
 				sig, sizeof(sig), &e) == 0 &&
-	    memcmp(sig, "\xf\xbkvm", sizeof(sig)) == 0) {
+	    memcmp(sig, kvm_emulate_prefix, sizeof(sig)) == 0) {
 		kvm_rip_write(vcpu, kvm_rip_read(vcpu) + sizeof(sig));
 		emul_type = EMULTYPE_TRAP_UD_FORCED;
 	}


Patches currently in stable-queue which might be from mhiramat@kernel.org are

queue-5.4/x86-xen-kvm-gather-the-definition-of-emulate-prefixes.patch
queue-5.4/x86-xen-insn-decode-xen-and-kvm-emulate-prefix-signature.patch
queue-5.4/x86-asm-allow-to-pass-macros-to-__asm_form.patch
queue-5.4/x86-kprobes-prohibit-probing-on-instruction-which-has-emulate-prefix.patch

