Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF8F57CAA8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372678.604549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVLE-00066R-TV; Thu, 21 Jul 2022 12:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372678.604549; Thu, 21 Jul 2022 12:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVLE-00063y-QJ; Thu, 21 Jul 2022 12:31:44 +0000
Received: by outflank-mailman (input) for mailman id 372678;
 Thu, 21 Jul 2022 12:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6Vl=X2=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1oEVLC-00063s-WB
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:31:43 +0000
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com
 [68.65.122.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11e897ed-08f1-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 14:31:41 +0200 (CEST)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
 by mta-05.privateemail.com (Postfix) with ESMTP id 6465E18000AE
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jul 2022 08:31:39 -0400 (EDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by mta-05.privateemail.com (Postfix) with ESMTPA id 4019718000B5
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jul 2022 08:31:39 -0400 (EDT)
Received: by mail-yb1-f175.google.com with SMTP id b143so1286571yba.11
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jul 2022 05:31:39 -0700 (PDT)
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
X-Inumbo-ID: 11e897ed-08f1-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1658406699;
	bh=ouzZKxhU4ni00EoPmITNmMZrvXc+0VDuuzT2eDNtyio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lf4nUNGNCIhoy89VUCoIKRLR/+NDxvei33qes4UKV4H0gVSxuW2cOM5Q2W5/m1RH3
	 c7sTVjbrEv3eh3xAQ/hOUAAlGdb8k6C4QZVu5A0VtoUAcxYyhItIGpt/bcwdt/RTa5
	 35R1EEqSwOfauimszTBywxr+3Y5omXiT8e49bujQwUFkVQdVE32GjUC5ja1xImOrFj
	 IXyxuXzd4W3OOVC0lPbrmn2Zz9tD6IlIqTnqMoJIRrQt9WbaaUZJtjwOlRNMlzq8k5
	 F848qI+vEV5n2Iiuf4lvNQ3d+lgnSpROk2SlGd8afvPl1GqQxhEDzcEYmlSGlCgPvj
	 dQ3fsmJBz5b5g==
X-Gm-Message-State: AJIora99oU2AX5dzMmM0lM9zCZmouKvRjjAN7cid8R7rOTcu5JmxcJ4A
	cM23C5/LhBeO2roJg70R2xJ2MONgMznRs956rgw=
X-Google-Smtp-Source: AGRyM1u1m8FbtuDJQAFIubrmlgoohpd7wGsqHai3ANJGBSkUC4gR0n4A99diGsxfJcp8lFazfNannpjvOmwkaKWwUmI=
X-Received: by 2002:a25:9d01:0:b0:66e:9087:4fb9 with SMTP id
 i1-20020a259d01000000b0066e90874fb9mr42996041ybp.159.1658406698340; Thu, 21
 Jul 2022 05:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <a8a66208064c209e65c08380c59bc6aeff5f57f8.1658340502.git.tamas.lengyel@intel.com>
 <3160640f-f74d-725e-f2fe-3d33c4999772@suse.com>
In-Reply-To: <3160640f-f74d-725e-f2fe-3d33c4999772@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 21 Jul 2022 08:31:01 -0400
X-Gmail-Original-Message-ID: <CABfawhnvHGQqkgoK+RS=c_7gHoborGYXXvcjDCEB14uAE8WpUA@mail.gmail.com>
Message-ID: <CABfawhnvHGQqkgoK+RS=c_7gHoborGYXXvcjDCEB14uAE8WpUA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/mem_sharing: support forks with active vPMU state
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Jul 21, 2022 at 6:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.07.2022 20:47, Tamas K Lengyel wrote:
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1653,6 +1653,46 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> >      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >  }
> >
> > +static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> > +{
> > +    struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> > +    struct vpmu_struct *cd_vpmu = vcpu_vpmu(cd_vcpu);
>
> I would hope two of the four pointers could actually be constified.

I don't think so, we do modify both the vpmu and vcpu state as-needed
on both the parent and the child.

> > +    if ( !vpmu_are_all_set(d_vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED) )
> > +        return 0;
> > +    if ( vpmu_allocate_context(cd_vcpu) )
> > +        return -ENOMEM;
>
> The function supplies an error code - please use it rather than
> assuming it's always going to be -ENOMEM. Alternatively make the
> function return bool. (Ideally the hook functions themselves would
> be well-formed in this regard, but I realize that the Intel one is
> pre-existing in its present undesirable shape.)

Sure.

> > +    /*
> > +     * The VPMU subsystem only saves the context when the CPU does a context
> > +     * switch. Otherwise, the relevant MSRs are not saved on vmexit.
> > +     * We force a save here in case the parent CPU context is still loaded.
> > +     */
> > +    if ( vpmu_is_set(d_vpmu, VPMU_CONTEXT_LOADED) )
> > +    {
> > +        int pcpu = smp_processor_id();
>
> unsigned int please.
>
> > +        if ( d_vpmu->last_pcpu != pcpu )
> > +        {
> > +            on_selected_cpus(cpumask_of(d_vpmu->last_pcpu),
> > +                             vpmu_save_force, (void *)d_vcpu, 1);
>
> No need for the cast afaict.
>
> > +            vpmu_reset(d_vpmu, VPMU_CONTEXT_LOADED);
> > +        } else
>
> Nit: Style.

Sure, these were all pretty much copy-pasted but will fix them.

> > +            vpmu_save(d_vcpu);
> > +    }
> > +
> > +    if ( vpmu_is_set(d_vpmu, VPMU_RUNNING) )
> > +        vpmu_set(cd_vpmu, VPMU_RUNNING);
> > +
> > +    /* Make sure context gets (re-)loaded when scheduled next */
> > +    vpmu_reset(cd_vpmu, VPMU_CONTEXT_LOADED);
> > +
> > +    memcpy(cd_vpmu->context, d_vpmu->context, d_vpmu->context_size);
> > +    memcpy(cd_vpmu->priv_context, d_vpmu->priv_context, d_vpmu->priv_context_size);
>
> Nit: Long line.

Ack.

Thanks,
Tamas

