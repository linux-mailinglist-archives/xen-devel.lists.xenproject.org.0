Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B64958E0F3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 22:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383167.618289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLVi2-0001Ar-QX; Tue, 09 Aug 2022 20:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383167.618289; Tue, 09 Aug 2022 20:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLVi2-000184-Np; Tue, 09 Aug 2022 20:20:14 +0000
Received: by outflank-mailman (input) for mailman id 383167;
 Tue, 09 Aug 2022 20:20:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcHH=YN=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLVi1-00017y-7Y
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 20:20:13 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abc7b238-1820-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 22:20:11 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id l10so9520021lje.7
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 13:20:11 -0700 (PDT)
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
X-Inumbo-ID: abc7b238-1820-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MwWcOH6QFzEGzNmKF+NW5zZftPwMp71Q3OencNIuroY=;
        b=dP5Vyx/SDwI8cqpSVeyCYPTSoCiYuHHCdnJfdCJ91sHYTOO7s3AGq65o+l9VJVOAov
         PClnMZVgVwdIIKLc5IIeqe8uey3Jb9OU/+9ZS0UKws1TXCF4mVEUW4BaUsGW+kHCHcR7
         LIR8g/AlUoXURL7UlkMOCTGk1XdaBzhFt0nDyrHmnvi7x35ggMT07etZ+ua4y8pibhe8
         xLvU+QT+Yj/XhAxpJFArS/vlQMu+RzvSByNl6bnaa8KK1QRFRcx18PcJoB4ptzEg6wuv
         X4EaofNc5zNb/k4s7Y83iWsWaT2IF85Eusi859ar8Q+9CizoPHc6DCMZlVSpUe05hYeZ
         3bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MwWcOH6QFzEGzNmKF+NW5zZftPwMp71Q3OencNIuroY=;
        b=fHDC2xkVBXcUWVc7X2hUz2wDnK6SZV6P02K5lMxDXSd+Imenvyyq6uuN5x9oTfiAq8
         XwxGYa/v3ESyD4JVDzmQ8s6ho59Ii1TCe6PtxudbDa3WOImG3wJyVVrwgGUm1Dqk3rgk
         FIZZWOAlCEOq+pJ+2KYdU5Mx65DhQZWGdWsvluWV3MZ2bUkRw82ubj1/VagWxZKBFJOI
         63dQ6LlPAYLW94pb8fI7fU7DR5BOADuNuD9wI9w+LPpVVh4n2rhYuTRCC6n4vEZ3pjdf
         wor92ofEEI/4DF9Y7i6TSuguAbfmHbtPpY2T757fbuxwMW4hH9cpex5OiGNOaY3poELQ
         /fyg==
X-Gm-Message-State: ACgBeo25oSI6hQ5v0btswoMN+0ntX5GYntGIvrJQYQ2YV8seZVLHtGg8
	hcX1Md4dfDloniI68rd3cY7nGmFyYbqYgwi2Ckcf9Qf5zi4=
X-Google-Smtp-Source: AA6agR49b+igiqmnlBA41AksRsh5hN5Kgs4VVcA4KdzgzHjZEGhjRHmt9QjpdzHTNZiitRewrcUmTv2j08l7fcwXCzY=
X-Received: by 2002:a2e:9604:0:b0:25e:4ed7:ef45 with SMTP id
 v4-20020a2e9604000000b0025e4ed7ef45mr7474571ljh.389.1660076411518; Tue, 09
 Aug 2022 13:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220809170016.25148-1-andrew.cooper3@citrix.com> <20220809170016.25148-3-andrew.cooper3@citrix.com>
In-Reply-To: <20220809170016.25148-3-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Aug 2022 16:20:00 -0400
Message-ID: <CAKf6xpurnYVf-xz4VcFwq3uwbqBowyWJjgP=oLVZU3kWKtEWDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/spec-ctrl: Reduce HVM RSB overhead where possible
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2022 at 1:01 PM Andrew Cooper <andrew.cooper3@citrix.com> wr=
ote:
>
> The documentation for eIBRS has finally been clarified to state that it i=
s
> intended to flush the RSB on VMExit.  So in principle, we shouldn't have =
been
> using opt_rsb_hvm on eIBRS hardware.
>
> However, dropping the 32 entry RSB stuff makes us vulnerable to Post-Barr=
ier
> RSB speculation on affected Intel CPUs.
>
> Introduce hvm_rsb_calculations() which selects between a 32-entry stuff, =
a
> PBRSB specific workaround, or nothing, based on hardware details.
>
> To mitigate PBRSB, put an LFENCE at the top of vmx_vmexit_handler().  Thi=
s
> forces the necessary safety property, without having to do a 1-entry RSB =
stuff
> and fix up the stack(s) afterwards.
>
> Update opt_rsb_hvm to be tristate.  On eIBRS-capable CPUs not susceptible=
 to
> PBRSB, this disables HVM RSB software protections entirely.  On eIBRS-cap=
able
> CPUs suceptible to to PBRSB, this reduces a 32-entry RSB stuff down to ju=
st
> one LFENCE.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/hvm/vmx/entry.S           |   1 +
>  xen/arch/x86/hvm/vmx/vmx.c             |  20 ++++++-
>  xen/arch/x86/include/asm/cpufeatures.h |   1 +
>  xen/arch/x86/spec_ctrl.c               | 103 +++++++++++++++++++++++++++=
+++++-
>  4 files changed, 120 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
> index 5f5de45a1309..222495aed19f 100644
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -44,6 +44,7 @@ ENTRY(vmx_asm_vmexit_handler)
>          .endm
>          ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point.=
 */
> +        /* On PBRSB-vulenrable hardware, `ret` not safe before the start=
 of vmx_vmexit_handler() */

vulnerable

>
>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debu=
gging Xen. */
>          .macro restore_lbr
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 17e103188a53..8a6a5cf20525 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3934,8 +3934,24 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs=
)
>  {
>      unsigned long exit_qualification, exit_reason, idtv_info, intr_info =
=3D 0;
>      unsigned int vector =3D 0, mode;
> -    struct vcpu *v =3D current;
> -    struct domain *currd =3D v->domain;
> +    struct vcpu *v;
> +    struct domain *currd;
> +
> +    /*
> +     * To mitigate Post-Barrier RSB speculation, we must force one CALL
> +     * instruction to retire before letting a RET instruction execute.

I think it would be clearer if this comment mentioned LFENCE like the
commit message does.  Looking at this change without the commit
message the connection is not obvious to me at least.  Maybe "we must
force one CALL instruction to retire (with LFENCE) before letting a
RET instruction execute"?

> +     *
> +     * On PBRSB-vulnerable CPUs, it is not safe for a RET to be executed
> +     * before this point.
> +     *
> +     * Defer any non-trivial variable initialisation to avoid problems i=
f the
> +     * compiler decides to out-of-line any helpers.  This depends on
> +     * alternative() being a full compiler barrier too.
> +     */
> +    alternative("", "lfence", X86_BUG_PBRSB);
> +
> +    v =3D current;
> +    currd =3D v->domain;
>
>      __vmread(GUEST_RIP,    &regs->rip);
>      __vmread(GUEST_RSP,    &regs->rsp);


> +    /*
> +     * We're choosing between the eIBRS-capable models which don't enume=
rate
> +     * PBRSB_NO.  Earlier steppings of some models don't enumerate eIBRS=
 and
> +     * are excluded above.
> +     */
> +    switch ( boot_cpu_data.x86_model )
> +    {
> +        /*
> +         * Core (inc Hybrid) CPUs to date (August 2022) are vulenrable.

vulnerable

> +        case hvm_rsb_none:
> +            /*
> +             * Somewhat arbitrary.  If something is wrong and the user h=
as
> +             * forced HVM RSB protections on a system where we think not=
hing
> +             * is necessary, they they possibly know something we dont.

"then they" and "don't"

Regards,
Jason

