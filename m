Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENOEAT69/WmOiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 12:38:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575BE4F5193
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 12:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303443.1576847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLIbN-0006WC-Qk; Fri, 08 May 2026 10:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303443.1576847; Fri, 08 May 2026 10:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLIbN-0006Uk-MJ; Fri, 08 May 2026 10:38:37 +0000
Received: by outflank-mailman (input) for mailman id 1303443;
 Fri, 08 May 2026 10:38:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wLIbN-0006Ue-0z
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 10:38:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLIbM-00FUU8-Dw
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 12:38:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fdbd26-2eae-0a2a0a5409dd-0a2a45089710-24
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:38:36 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fdbd2c-63b5-0a2a45080019-d155d0b1d496-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:38:36 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3922b35e69cso14942231fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 03:38:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1778236715; cv=none;
        d=google.com; s=arc-20240605;
        b=JsgYiNddQ3hnbiCdg/c2zVTxhpoFrbgCgbSu3HVeHttWBKRLKslTsWAcEzklY1DEdT
         4yY0XDbRuduJ5UxGR9ULI7hGDTMNPhjCphwAcpTFPnK3JlhiYKQH3dQ8azSsiWb1CS4s
         B83Qtjd6bi6IUIoAAVm0xlXM8FDLGQHh30v/sRj3DZI4OKrmIBALrSPzT2fAt7zf77zq
         P9Y2ruVIGFLCuMgZmT2A3KQ3bosbuxnlflWPgomAKWg2VanWoR42oelHf5UwiF+6EZOg
         61l7wToavagUG9526OvLvNVxue3ynqyu7fYgA6zJpLGkAxPk9waM+0WyvrfujBy0C0VV
         pBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2GUqezJvc/MLviBnqNjIuAYBZeMy4IiHwGhP3ieXKFw=;
        fh=HHRjWkdysX2ZkNpVMY4DcdwfNbPq2J2BPJfxbJK3Acs=;
        b=JMZjiMb7VOLnSVafTxq3ZyS3uwuYu5fC1F96WccySCO3qsUGXzaLUREZVE9D2FwFgJ
         fYV2vn6IFc9eF/keL8jPuG9oa85rBJM0OtK36mjsZQF1DhqnZgQXHLPU5oHLbjaa8dVq
         +9ffPK+oq4nUojcrIbnEWuknjcRSqbKT4qI8CDAlZdZ400biphNFX4Zdt8nNlOZGp1CY
         TBcFMB+wK07twsDpXKigcsfaGOxQw6BLUudDy716dVmJX57RoEmPZxDYA7WpJrWpR5x4
         oo92DHcr5OQapKIsrNCsA0+tIeB+6jz9TcZiIM5/bnHW9OFzJ2b3uluW2ScxTaHaktee
         OSGg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236715; x=1778841515; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GUqezJvc/MLviBnqNjIuAYBZeMy4IiHwGhP3ieXKFw=;
        b=Jhg1hOfYI0Cwy2rbL6D48+00Hw9Fjvbp0qljl0RAIngx4u8iJdIIzuLHSumnUafB9k
         7Jb7X2D9l8JJ+INNECi+nErpiMtI+4ocX6ZK3V9RJOQHJS9itmXuGno0CKhqQb5Nlhu0
         UXNkR1iqYO7VMSPFBdiMQe7dmJYzRES5vQxR4QMkcE3rXOyToml8IdRxCl/AlpUd1w71
         0dL2JCha0b4lOHN3NQcK9u7jVVcP0nJ+oZeJThYZIXZAFB+Wk3YilF4RAJW77lga58Jq
         RoI3iQUcWEaSQNfw33eTYcTRvtlEwN+29kIeODsNfdXhIlf2Py2BGVvABkPIBq0Fkfod
         BXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236715; x=1778841515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GUqezJvc/MLviBnqNjIuAYBZeMy4IiHwGhP3ieXKFw=;
        b=WXJeK4+T+zD9eVPIqzU8NItCKAu/cUdoa6CDIx7fE0uD7wMvif5L2QMCxHkBdAXI1f
         /uwVKOXJhkL7hS8vSd8NTk5DqBMi9q4E/UFUYZiQxLrxmRouea9LsJgijg5DpihbRlmY
         UtH48DVcyRvGoa5eD7gFBzEBd0bNq3cZ3p7IbeTOsiDZXMaHi13AfGDB09GBmHe7VMrQ
         YYgeAZ149O/12q4hEe5H0MjNMccfOXudeFidRTALTEi0tRFvQD+PNXvCu6o9w3e19fGD
         zkvN1MbY+B024mT17uKe1EN1Ze8cH5akP3FvXDoOVnoTWgWQ9mt73zK6ehlrv9LC4YmV
         iTLA==
X-Gm-Message-State: AOJu0YwVBBO5w7BPGHtZXIl40AjRkEMwTzipRbMm5LkbBpoLMqOYh0hi
	RMTbWgXlfy5y2Yzib+8GRmLoZnP/TR3r7M/z+ksWkrs3IKLkYM3rFC2nBfV8+3qVeJboBybMC64
	68E9LLA4msvRafjaxDc+bKVZi6WCm09g=
X-Gm-Gg: Acq92OH3lAutgqdWyVcwZfdOpTBzIDTt1Pc758yNni0QrCqmN18xce85bgG+IF76Aik
	bGSKhqHVjGE5SLRgmm0YXEVT+XET2r2J5/9z0zSaQdyMiYREDQ385mJmgnUaaur6glbW0Zk3kai
	08eYVg1q7VKfayIQHQnSwm/alNBqZhJTdJSzxICpHSTkmy+e7XqsFjmFnNPD6D3P6pxyEoARqCh
	nS2YAr7ppkUDpxsigrdlvPFEVi7LmyI2A+D56YWnPKkIY4pDPQ6bqXaMZnqkSI5FXHtJgHwxsva
	nKuMbKHh/+S9ljmG
X-Received: by 2002:a05:651c:154e:b0:393:8585:f9e4 with SMTP id
 38308e7fff4ca-393c40cfd1emr46415461fa.4.1778236715160; Fri, 08 May 2026
 03:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
 <87tssisw41.fsf@epam.com>
In-Reply-To: <87tssisw41.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 8 May 2026 13:38:24 +0300
X-Gm-Features: AVHnY4JlozUSNvhy8wXCtlMYC7rK6agBwsWomgaChMHdZYvMJ539aO9EpDsPkJw
Message-ID: <CAGeoDV-fpr86T165VTDeGqN2ybJDZkWKFke1ZpnY9__zKkBLrw@mail.gmail.com>
Subject: Re: [PATCH v8 11/13] xen/arm: Save/restore context on suspend/resume
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1778236716-B6F72DB1-924C254B/0/0
X-purgate-type: clean
X-purgate-size: 8864
X-Rspamd-Queue-Id: 575BE4F5193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Volodymyr,

Thanks for taking a look at this.

On Fri, May 8, 2026 at 1:17=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mikola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > The context of CPU general purpose and system control registers must be
> > saved on suspend and restored on resume. This is implemented in
> > prepare_resume_ctx and before the return from the hyp_resume function.
> > The prepare_resume_ctx must be invoked just before the PSCI system susp=
end
> > call is issued to the ATF. The prepare_resume_ctx must return a non-zer=
o
> > value so that the calling 'if' statement evaluates to true, causing the
> > system suspend to be invoked. Upon resume, the context saved on suspend
> > will be restored, including the link register. Therefore, after
> > restoring the context, the control flow will return to the address
> > pointed to by the saved link register, which is the place from which
> > prepare_resume_ctx was called. To ensure that the calling 'if' statemen=
t
> > does not again evaluate to true and initiate system suspend, hyp_resume
> > must return a zero value after restoring the context.
> >
> > Note that the order of saving register context into cpu_context structu=
re
> > must match the order of restoring.
> >
> > Support for ARM32 is not implemented. Instead, compilation fails with a
> > build-time error if suspend is enabled for ARM32.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v8:
> > - fix alignments in code
> >
> > Changes in v7:
> > - no changes
> > ---
> >  xen/arch/arm/Makefile              |  1 +
> >  xen/arch/arm/arm64/head.S          | 90 +++++++++++++++++++++++++++++-
> >  xen/arch/arm/include/asm/suspend.h | 26 +++++++++
> >  xen/arch/arm/suspend.c             | 14 +++++
> >  4 files changed, 130 insertions(+), 1 deletion(-)
> >  create mode 100644 xen/arch/arm/suspend.c
> >
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index 69200b2728..c36158271a 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -51,6 +51,7 @@ obj-y +=3D setup.o
> >  obj-y +=3D shutdown.o
> >  obj-y +=3D smp.o
> >  obj-y +=3D smpboot.o
> > +obj-$(CONFIG_SYSTEM_SUSPEND) +=3D suspend.o
> >  obj-$(CONFIG_SYSCTL) +=3D sysctl.o
> >  obj-y +=3D time.o
> >  obj-y +=3D traps.o
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 596e960152..2cb02ee314 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -562,6 +562,52 @@ END(efi_xen_start)
> >  #endif /* CONFIG_ARM_EFI */
> >
> >  #ifdef CONFIG_SYSTEM_SUSPEND
> > +/*
> > + * int prepare_resume_ctx(struct cpu_context *ptr)
>
> "cpu_context" is very generic name, especially taking into account that
> you are introducing a global variable with the same name. How about
> "resume_cpu_context"?

Ack.

>
> > + *
> > + * x0 - pointer to the storage where callee's context will be saved
> > + *
> > + * CPU context saved here will be restored on resume in hyp_resume fun=
ction.
> > + * prepare_resume_ctx shall return a non-zero value. Upon restoring co=
ntext
> > + * hyp_resume shall return value zero instead. From C code that invoke=
s
> > + * prepare_resume_ctx, the return value is interpreted to determine wh=
ether
> > + * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
> > + */
> > +FUNC(prepare_resume_ctx)
> > +        /* Store callee-saved registers */
>
> How are planning to synchronise this code with actual cpu_context?
>
> I am pretty sure it is better to use offsets generated by asm-offset.c

Ack.

>
> > +        stp   x19, x20, [x0], #16
> > +        stp   x21, x22, [x0], #16
> > +        stp   x23, x24, [x0], #16
> > +        stp   x25, x26, [x0], #16
> > +        stp   x27, x28, [x0], #16
> > +        stp   x29, lr, [x0], #16
> > +
> > +        /* Store stack-pointer */
> > +        mov   x2, sp
> > +        str   x2, [x0], #8
> > +
> > +        /* Store system control registers */
> > +        mrs   x2, VBAR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, VTCR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, VTTBR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, TPIDR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, MDCR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, HSTR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, CPTR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, HCR_EL2
> > +        str   x2, [x0], #8
> > +
> > +        /* prepare_resume_ctx must return a non-zero value */
> > +        mov   x0, #1
> > +        ret
> > +END(prepare_resume_ctx)
> >
> >  FUNC(hyp_resume)
> >          /* Initialize the UART if earlyprintk has been enabled. */
> > @@ -580,7 +626,49 @@ FUNC(hyp_resume)
> >          b     enable_secondary_cpu_mm
> >
> >  mmu_resumed:
> > -        b .
> > +        /* Now we can access the cpu_context, so restore the context h=
ere */
> > +        ldr   x0, =3Dcpu_context
> > +
> > +        /* Restore callee-saved registers */
> > +        ldp   x19, x20, [x0], #16
> > +        ldp   x21, x22, [x0], #16
> > +        ldp   x23, x24, [x0], #16
> > +        ldp   x25, x26, [x0], #16
> > +        ldp   x27, x28, [x0], #16
> > +        ldp   x29, lr, [x0], #16
> > +
> > +        /* Restore stack pointer */
> > +        ldr   x2, [x0], #8
> > +        mov   sp, x2
> > +
> > +        /* Restore system control registers */
> > +        ldr   x2, [x0], #8
> > +        msr   VBAR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   VTCR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   VTTBR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   TPIDR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   MDCR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   HSTR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   CPTR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   HCR_EL2, x2
> > +        isb
> > +
> > +        /*
> > +         * Since context is restored return from this function will ap=
pear
> > +         * as return from prepare_resume_ctx. To distinguish a return =
from
> > +         * prepare_resume_ctx which is called upon finalizing the susp=
end,
> > +         * as opposed to return from this function which executes on r=
esume,
> > +         * we need to return zero value here.
> > +         */
> > +        mov   x0, #0
> > +        ret
> >  END(hyp_resume)
> >
> >  #endif /* CONFIG_SYSTEM_SUSPEND */
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > index 31a98a1f1b..c127fa3d78 100644
> > --- a/xen/arch/arm/include/asm/suspend.h
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -3,6 +3,8 @@
> >  #ifndef ARM_SUSPEND_H
> >  #define ARM_SUSPEND_H
> >
> > +#include <xen/types.h>
> > +
> >  struct domain;
> >  struct vcpu;
> >  struct vcpu_guest_context;
> > @@ -14,6 +16,30 @@ struct resume_info {
> >
> >  void arch_domain_resume(struct domain *d);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +#ifdef CONFIG_ARM_64
> > +struct cpu_context {
> > +    register_t callee_regs[12];
> > +    register_t sp;
> > +    register_t vbar_el2;
> > +    register_t vtcr_el2;
> > +    register_t vttbr_el2;
> > +    register_t tpidr_el2;
> > +    register_t mdcr_el2;
> > +    register_t hstr_el2;
> > +    register_t cptr_el2;
> > +    register_t hcr_el2;
> > +} __aligned(16);
> > +#else
> > +#error "Define cpu_context structure for arm32"
> > +#endif
> > +
> > +extern struct cpu_context cpu_context;
> > +
> > +int prepare_resume_ctx(struct cpu_context *ptr);
> > +void hyp_resume(void);
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >  #endif /* ARM_SUSPEND_H */
> >
> >  /*
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > new file mode 100644
> > index 0000000000..e38566b0b7
> > --- /dev/null
> > +++ b/xen/arch/arm/suspend.c
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#include <asm/suspend.h>
> > +
> > +struct cpu_context cpu_context =3D {};
>
> Don't need to zero-initialize a global variable.

Ack.

Best regards,
Mykola

>
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
>
> --
> WBR, Volodymyr

