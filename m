Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC82B4B09
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 17:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28531.57629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kehMY-0002Ds-6r; Mon, 16 Nov 2020 16:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28531.57629; Mon, 16 Nov 2020 16:28:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kehMY-0002DT-3a; Mon, 16 Nov 2020 16:28:18 +0000
Received: by outflank-mailman (input) for mailman id 28531;
 Mon, 16 Nov 2020 16:28:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ru3m=EW=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1kehMW-0002DO-Lp
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:28:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ed66f31-a522-4214-827c-a0b053ab0a3f;
 Mon, 16 Nov 2020 16:28:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB8362222C
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 16:28:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id k2so19384667wrx.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:28:14 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ru3m=EW=kernel.org=luto@srs-us1.protection.inumbo.net>)
	id 1kehMW-0002DO-Lp
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:28:16 +0000
X-Inumbo-ID: 7ed66f31-a522-4214-827c-a0b053ab0a3f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7ed66f31-a522-4214-827c-a0b053ab0a3f;
	Mon, 16 Nov 2020 16:28:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AB8362222C
	for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605544095;
	bh=x3FHK31Xm/BBB7HpLRBIa98x7QEqf275AgxsToa6mkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dSp2LxJUJ58gcX59eL2xT0qVUTROA6hs+/D6p0wzaVRwjytMTLR0IOaUwLCw0qvV9
	 oPxeDEHDRvLSTb6pZKi4znh9AdooQXrCYtwzhXRxhD5nuPb55BqjjPXvLVpCG0M3FD
	 iDc77eS+vloBkEmarGAjuhz3e8qNrbVN/RCsAOsE=
Received: by mail-wr1-f43.google.com with SMTP id k2so19384667wrx.2
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:28:14 -0800 (PST)
X-Gm-Message-State: AOAM530EMi1c2Btqt4OFd/Mm5I7xoAfY12bkSV+TLcsykbM5Qsn17mgb
	ckcrCzus2X5hNlsCFNlxd8SZb6YAvkT08r6yZUXfMA==
X-Google-Smtp-Source: ABdhPJyncJCxKduqliOLf7Ic4pClunkNO5+SsixRmuCBm2erhKc8dlxKlGJlIEYjuLvuG7ANk+QxxpsYnP+LvzP3zfc=
X-Received: by 2002:a5d:4991:: with SMTP id r17mr20556285wrq.70.1605544093233;
 Mon, 16 Nov 2020 08:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20201116152301.24558-1-jgross@suse.com> <20201116152301.24558-5-jgross@suse.com>
In-Reply-To: <20201116152301.24558-5-jgross@suse.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 16 Nov 2020 08:28:00 -0800
X-Gmail-Original-Message-ID: <CALCETrW_UO9sksa1agOfs5E7yV+RqOyugEEOBjZY8Z47R-04Pg@mail.gmail.com>
Message-ID: <CALCETrW_UO9sksa1agOfs5E7yV+RqOyugEEOBjZY8Z47R-04Pg@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/xen: drop USERGS_SYSRET64 paravirt call
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, X86 ML <x86@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Virtualization <virtualization@lists.linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>, 
	"VMware, Inc." <pv-drivers@vmware.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 7:23 AM Juergen Gross <jgross@suse.com> wrote:
>
> USERGS_SYSRET64 is used to return from a syscall via sysret, but
> a Xen PV guest will nevertheless use the iret hypercall, as there
> is no sysret PV hypercall defined.
>
> So instead of testing all the prerequisites for doing a sysret and
> then mangling the stack for Xen PV again for doing an iret just use
> the iret exit from the beginning.
>
> This can easily be done via an ALTERNATIVE like it is done for the
> sysenter compat case already.
>
> While at it remove to stale sysret32 remnants.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andy Lutomirski <luto@kernel.org>

FWIW, you've lost the VGCF_in_syscall optimization.  Let me see if I
can give it back to you better.

> ---
>  arch/x86/entry/entry_64.S             | 22 +++++++++-------------
>  arch/x86/include/asm/irqflags.h       |  6 ------
>  arch/x86/include/asm/paravirt.h       |  5 -----
>  arch/x86/include/asm/paravirt_types.h |  8 --------
>  arch/x86/kernel/asm-offsets_64.c      |  2 --
>  arch/x86/kernel/paravirt.c            |  5 +----
>  arch/x86/kernel/paravirt_patch.c      |  4 ----
>  arch/x86/xen/enlighten_pv.c           |  1 -
>  arch/x86/xen/xen-asm.S                | 20 --------------------
>  arch/x86/xen/xen-ops.h                |  2 --
>  10 files changed, 10 insertions(+), 65 deletions(-)
>
> diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
> index a876204a73e0..df865eebd3d7 100644
> --- a/arch/x86/entry/entry_64.S
> +++ b/arch/x86/entry/entry_64.S
> @@ -46,14 +46,6 @@
>  .code64
>  .section .entry.text, "ax"
>
> -#ifdef CONFIG_PARAVIRT_XXL
> -SYM_CODE_START(native_usergs_sysret64)
> -       UNWIND_HINT_EMPTY
> -       swapgs
> -       sysretq
> -SYM_CODE_END(native_usergs_sysret64)
> -#endif /* CONFIG_PARAVIRT_XXL */
> -
>  /*
>   * 64-bit SYSCALL instruction entry. Up to 6 arguments in registers.
>   *
> @@ -123,12 +115,15 @@ SYM_INNER_LABEL(entry_SYSCALL_64_after_hwframe, SYM_L_GLOBAL)
>          * Try to use SYSRET instead of IRET if we're returning to
>          * a completely clean 64-bit userspace context.  If we're not,
>          * go to the slow exit path.
> +        * In the Xen PV case we must use iret anyway.
>          */
> -       movq    RCX(%rsp), %rcx
> -       movq    RIP(%rsp), %r11
>
> -       cmpq    %rcx, %r11      /* SYSRET requires RCX == RIP */
> -       jne     swapgs_restore_regs_and_return_to_usermode
> +       ALTERNATIVE __stringify( \
> +               movq    RCX(%rsp), %rcx; \
> +               movq    RIP(%rsp), %r11; \
> +               cmpq    %rcx, %r11;     /* SYSRET requires RCX == RIP */ \
> +               jne     swapgs_restore_regs_and_return_to_usermode), \
> +       "jmp    swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV

I'm not in love with this save-a-few-bytes stringify, but I can live with it.

--Andy

