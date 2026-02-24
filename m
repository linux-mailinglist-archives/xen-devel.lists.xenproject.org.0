Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJqsC86CnWlsQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:51:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1E185ABF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:51:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239796.1541207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuq12-0004g6-M3; Tue, 24 Feb 2026 10:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239796.1541207; Tue, 24 Feb 2026 10:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuq12-0004eV-IH; Tue, 24 Feb 2026 10:51:44 +0000
Received: by outflank-mailman (input) for mailman id 1239796;
 Tue, 24 Feb 2026 10:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xb8T=A4=bounce.vates.tech=bounce-md_30504962.699d82b7.v1-b23a52783cba4c85add3ee778284c931@srs-se1.protection.inumbo.net>)
 id 1vuq10-0004eP-NL
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 10:51:42 +0000
Received: from mail186-12.suw21.mandrillapp.com
 (mail186-12.suw21.mandrillapp.com [198.2.186.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca2a8756-116e-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 11:51:36 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-12.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4fKvfb3Cf0z705l4D
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 10:51:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b23a52783cba4c85add3ee778284c931; Tue, 24 Feb 2026 10:51:35 +0000
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
X-Inumbo-ID: ca2a8756-116e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771930295; x=1772200295;
	bh=/TXyyKPvyNOfr9WgduPAeT4QAKdPcNDxmEaL9+XY6V4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=hEGWuuJx06mnWuGy9jyOHEK4isposbcmixKNuQcw+IqljV8Qlq7z5tV0exdnEobli
	 h/y3xvcjrJ5wJXPWLa+H5MN4SvoSwsyhUmR1Mh+UEp/HBLcHS+oh/kBbwunZPl4IHh
	 jisEVSvVF5Rw13H6hMKTAdzNS9bbwWksyEGZZIyRQptOFwd+uSEt6uRYOt2ABkxEx6
	 zp/oNTd8m+RFTaW22Bu9sE1aUjWmyo3suFZOgWRV2zgcO7iF4IFzEqWbVwP1eFAR3O
	 oKuWlWBY2YbmGsSpfywuZjZCGI6sJVGduUv3xTSe5ixGu3cn3GCxeFGJrNlK6uZAiV
	 j6jx3Nr3y7D6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771930295; x=1772190795; i=teddy.astie@vates.tech;
	bh=/TXyyKPvyNOfr9WgduPAeT4QAKdPcNDxmEaL9+XY6V4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=JdpH1BRdBB8Gb5jl5Lc22VcPvXAZIv5g0yXZCQ4ChEngdYBaE33vLyV0/+yBxJLSp
	 DgXRCUUISFaTg7pS6OUHIHlzqXUV+UWk2ysd5sfe+5xs75nSAaFpbokg/RUsqOIUPK
	 ANryeeHnTEj5WvAgFLm1uXqBfmkJImguXsfYqz+98ngKIwcVu/Iy14JsSHVRTVOEbq
	 LP/EccPVCK/QWGe78GY8ylqiYfG4BdmIudNE07Lknz1WaQCAmERP1FBjVoLfCwp5Sm
	 r7oQUtHuGLCbnEH7DYiJmtfzInr80WtEmvZJRBC5EJQnPGWy9ft/+ViFKyj/nL18y/
	 S8bsnLYY8ZoFA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH]=20x86/xen:=20Consider=20Xen=20PVH=20support=20in=20CONFIG=5FXEN=5FPVHVM?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771930294336
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Boris Ostrovsky" <boris.ostrovsky@oracle.com>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Message-Id: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b23a52783cba4c85add3ee778284c931?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260224:md
Date: Tue, 24 Feb 2026 10:51:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:teddy.astie@vates.tech,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,oracle.com:email,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 91C1E185ABF
X-Rspamd-Action: no action

It's currently possible to build Linux with CONFIG_PVH|CONFIG_XEN_PVHVM
and no CONFIG_XEN_PVH. That leads to inconsistent kernels that fails with
"Missing xen PVH initialization" when booting using PVH boot method or
display various errors and fail to initialize Xen PV drivers when booting
with PVH-GRUB.

    platform_pci_unplug: Xen Platform PCI: unrecognised magic value
    ...
    # modprobe xen-blkfront
    modprobe: ERROR: could not insert 'xen_blkfront': No such device
    # modprobe xen-netfront
    modprobe: ERROR: could not insert 'xen_netfront': No such device

When built without CONFIG_XEN_PVH, PVH-specific logic is disabled, hence when
booting with e.g PVH-OVMF, Linux assumes we are a HVM guest, even when we aren't
actually one (in the "with HVM emulated devices" sense).

As it is actually possible to boot Xen PVH without CONFIG_PVH; and that most
Xen-related logic exist within CONFIG_XEN_PVHVM; consider PVH guests support
within CONFIG_XEN_PVHVM instead of CONFIG_XEN_PVH.

Keep CONFIG_XEN_PVH as a shortcut to enable PVH boot, ACPI support and PVHVM.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

A tentative patch, I'm not sure of the way of dealing with the KConfig part,
keeping CONFIG_XEN_PVH as a shortcut is interesting, but there may be other
options.

There are widespreadly used Linux distributions that have a similar configuration
to this one, thus exhibit this issue i.e fail to boot.

I'm not sure which commit to target for a Fixes: note.

 arch/x86/xen/Makefile        | 2 +-
 arch/x86/xen/enlighten_hvm.c | 2 --
 arch/x86/xen/grant-table.c   | 2 +-
 arch/x86/xen/xen-head.S      | 8 ++++----
 include/xen/xen.h            | 2 +-
 5 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index a9ec8c9f5c5d..7fbe17c8ba89 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -33,7 +33,7 @@ obj-$(CONFIG_XEN_PV)		+= irq.o
 obj-$(CONFIG_XEN_PV)		+= multicalls.o
 obj-$(CONFIG_XEN_PV)		+= xen-asm.o
 
-obj-$(CONFIG_XEN_PVH)		+= enlighten_pvh.o
+obj-$(CONFIG_XEN_PVHVM)		+= enlighten_pvh.o
 
 obj-$(CONFIG_EVENT_TRACING)	+= trace.o
 
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index fe57ff85d004..38c2cdfdcc44 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -264,7 +264,6 @@ static bool __init msi_ext_dest_id(void)
 
 static __init void xen_hvm_guest_late_init(void)
 {
-#ifdef CONFIG_XEN_PVH
 	/* Test for PVH domain (PVH boot path taken overrides ACPI flags). */
 	if (!xen_pvh &&
 	    (x86_platform.legacy.rtc || !x86_platform.legacy.no_vga))
@@ -282,7 +281,6 @@ static __init void xen_hvm_guest_late_init(void)
 
 	machine_ops.emergency_restart = xen_emergency_restart;
 	pv_info.name = "Xen PVH";
-#endif
 }
 
 static uint32_t __init xen_platform_hvm(void)
diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
index 5f4060b5a40d..4d717c92b624 100644
--- a/arch/x86/xen/grant-table.c
+++ b/arch/x86/xen/grant-table.c
@@ -149,7 +149,7 @@ int arch_gnttab_init(unsigned long nr_shared, unsigned long nr_status)
 	return -ENOMEM;
 }
 
-#ifdef CONFIG_XEN_PVH
+#ifdef CONFIG_XEN_PVHVM
 #include <xen/events.h>
 #include <xen/xen-ops.h>
 static int __init xen_pvh_gnttab_setup(void)
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 5dad6c51cdc3..e262caac3ca9 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -162,10 +162,10 @@ SYM_FUNC_END(xen_hypercall_intel)
 #else
 # define FEATURES_PV 0
 #endif
-#ifdef CONFIG_XEN_PVH
-# define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted)
+#ifdef CONFIG_XEN_PVHVM
+# define FEATURES_PVHVM (1 << XENFEAT_linux_rsdp_unrestricted)
 #else
-# define FEATURES_PVH 0
+# define FEATURES_PVHVM 0
 #endif
 #ifdef CONFIG_XEN_DOM0
 # define FEATURES_DOM0 (1 << XENFEAT_dom0)
@@ -173,7 +173,7 @@ SYM_FUNC_END(xen_hypercall_intel)
 # define FEATURES_DOM0 0
 #endif
 	ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
-		.long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
+		.long FEATURES_PV | FEATURES_PVHVM | FEATURES_DOM0)
 	ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
 	ELFNOTE(Xen, XEN_ELFNOTE_SUSPEND_CANCEL, .long 1)
 
diff --git a/include/xen/xen.h b/include/xen/xen.h
index f280c5dcf923..4d066fbf9714 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -16,7 +16,7 @@ extern enum xen_domain_type xen_domain_type;
 #define xen_domain_type		XEN_NATIVE
 #endif
 
-#ifdef CONFIG_XEN_PVH
+#ifdef CONFIG_XEN_PVHVM
 extern bool xen_pvh;
 #else
 #define xen_pvh			0
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


