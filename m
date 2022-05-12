Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA1524F2D
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 16:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327725.550592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9O5-0001Jv-H1; Thu, 12 May 2022 14:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327725.550592; Thu, 12 May 2022 14:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9O5-0001H7-DF; Thu, 12 May 2022 14:01:53 +0000
Received: by outflank-mailman (input) for mailman id 327725;
 Thu, 12 May 2022 14:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVjp=VU=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1np9O4-0001Gk-0d
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 14:01:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 114d9b64-d1fc-11ec-a406-831a346695d4;
 Thu, 12 May 2022 16:01:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C41F961A39;
 Thu, 12 May 2022 14:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921B6C385B8;
 Thu, 12 May 2022 14:01:47 +0000 (UTC)
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
X-Inumbo-ID: 114d9b64-d1fc-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652364108;
	bh=Z/Ws/YqRZBPStcl75eglrGhJNELDeF5x+1KQttHEXBM=;
	h=Subject:To:Cc:From:Date:From;
	b=13VwfVIip4aeGa4GD3M92snk8Kd8iXwB9mXxu27b4EeUqOXF2AVIHjfHajYMV0/9B
	 EOIMy/GmKDQp1HOR+QvshXwnONrHHxUcyQPz8kMeMkLpen33lorqKHKjbFTbFma5rl
	 cl8a/Icq92V5aKJT6rlyZyEbQK0AbeBdP5D1Aa7A=
Subject: Patch "x86/asm: Allow to pass macros to __ASM_FORM()" has been added to the 5.4-stable tree
To: andrew.cooper3@citrix.com,boris.ostrovsky@oracle.com,bp@alien8.de,gregkh@linuxfoundation.org,jgross@suse.com,jpoimboe@redhat.com,mheyne@amazon.de,mhiramat@kernel.org,mingo@kernel.org,peterz@infradead.org,rdunlap@infradead.org,sstabellini@kernel.org,x86@kernel.org,xen-devel@lists.xenproject.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 May 2022 16:01:37 +0200
Message-ID: <16523640972042@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    x86/asm: Allow to pass macros to __ASM_FORM()

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     x86-asm-allow-to-pass-macros-to-__asm_form.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From f7919fd943abf0c77aed4441ea9897a323d132f5 Mon Sep 17 00:00:00 2001
From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 6 Sep 2019 22:13:48 +0900
Subject: x86/asm: Allow to pass macros to __ASM_FORM()

From: Masami Hiramatsu <mhiramat@kernel.org>

commit f7919fd943abf0c77aed4441ea9897a323d132f5 upstream.

Use __stringify() at __ASM_FORM() so that user can pass
code including macros to __ASM_FORM().

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lkml.kernel.org/r/156777562873.25081.2288083344657460959.stgit@devnote2
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/include/asm/asm.h |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- a/arch/x86/include/asm/asm.h
+++ b/arch/x86/include/asm/asm.h
@@ -7,9 +7,11 @@
 # define __ASM_FORM_RAW(x)     x
 # define __ASM_FORM_COMMA(x) x,
 #else
-# define __ASM_FORM(x)	" " #x " "
-# define __ASM_FORM_RAW(x)     #x
-# define __ASM_FORM_COMMA(x) " " #x ","
+#include <linux/stringify.h>
+
+# define __ASM_FORM(x)	" " __stringify(x) " "
+# define __ASM_FORM_RAW(x)     __stringify(x)
+# define __ASM_FORM_COMMA(x) " " __stringify(x) ","
 #endif
 
 #ifndef __x86_64__


Patches currently in stable-queue which might be from mhiramat@kernel.org are

queue-5.4/x86-xen-kvm-gather-the-definition-of-emulate-prefixes.patch
queue-5.4/x86-xen-insn-decode-xen-and-kvm-emulate-prefix-signature.patch
queue-5.4/x86-asm-allow-to-pass-macros-to-__asm_form.patch
queue-5.4/x86-kprobes-prohibit-probing-on-instruction-which-has-emulate-prefix.patch

