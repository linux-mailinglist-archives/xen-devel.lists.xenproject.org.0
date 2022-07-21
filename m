Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCF57CAB7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372684.604559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVPm-0006kF-EC; Thu, 21 Jul 2022 12:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372684.604559; Thu, 21 Jul 2022 12:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVPm-0006hc-BF; Thu, 21 Jul 2022 12:36:26 +0000
Received: by outflank-mailman (input) for mailman id 372684;
 Thu, 21 Jul 2022 12:36:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6Vl=X2=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1oEVPl-0006hW-5D
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:36:25 +0000
Received: from MTA-12-4.privateemail.com (mta-12-4.privateemail.com
 [198.54.127.107]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba34de1e-08f1-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 14:36:23 +0200 (CEST)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id DF38918000B1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jul 2022 08:36:21 -0400 (EDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by mta-12.privateemail.com (Postfix) with ESMTPA id B88D018000A6
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jul 2022 08:36:21 -0400 (EDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-31e623a4ff4so15560907b3.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jul 2022 05:36:21 -0700 (PDT)
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
X-Inumbo-ID: ba34de1e-08f1-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1658406981;
	bh=WeAe2LC7xCKJ81qdi9Kp9Kj6Yu7gsNTKz8RVccqjdSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LcQzNPbXnECcG9DVG6468KWzox/qFFVdlyJH+4sVN9r7OwPlqTHKNB/6thT+BtiST
	 wj6OIIjzPyQgR0VjLQZTmY/YPYeU1aG2eyZ/YF6iLVgA85wDcmfdlfTea5O9QcC0it
	 wP2rjxTG72EaisChK/GYQgEQBfbPnXeUhGwxfrkJ8zKmqJn6vHCfTOjsUATR0n7Uc2
	 B18diI509JoKwZx4nC1VhbuzxjR4eGB+6gpRaqYYgvkJrdjIRil5BjkOgnIqXwP8q8
	 pqAeHipm+eP8YLkFwIO/7pFh+9vw9MCcUvQOH+SuP33rGiqqW7GEcvQnGRTWMe1nwW
	 nT8TWh0vlvEOQ==
X-Gm-Message-State: AJIora+SnNeogO7h4/Y8B1Aq1B7JJwZ84rBho+EHoarpELswz4/0rLHp
	xRnkAG7RgYq0yBXqkieRwVcXucgtr+hc6NkN04g=
X-Google-Smtp-Source: AGRyM1uiwC3kDgZwxczFKEVW5SAG5hFs0gH/AYnU4j/7P+vWA/O0hU7IA0XKb4ofhfG3y9HX3srny2kiYH/zZIYNMaY=
X-Received: by 2002:a0d:f746:0:b0:31e:80dc:725f with SMTP id
 h67-20020a0df746000000b0031e80dc725fmr2091114ywf.460.1658406980878; Thu, 21
 Jul 2022 05:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <a8a66208064c209e65c08380c59bc6aeff5f57f8.1658340502.git.tamas.lengyel@intel.com>
 <cb26974c-2eb1-d27b-9de2-cbd3b501cb62@citrix.com>
In-Reply-To: <cb26974c-2eb1-d27b-9de2-cbd3b501cb62@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 21 Jul 2022 08:35:44 -0400
X-Gmail-Original-Message-ID: <CABfawhktWg0T8RU_hxsE3MqWDovX1tP5P=d80rQsOS28AsYtSg@mail.gmail.com>
Message-ID: <CABfawhktWg0T8RU_hxsE3MqWDovX1tP5P=d80rQsOS28AsYtSg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/mem_sharing: support forks with active vPMU state
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Jul 21, 2022 at 8:03 AM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> On 20/07/2022 19:47, Tamas K Lengyel wrote:
> > diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
> > index 9bacc02ec1..4c76e24551 100644
> > --- a/xen/arch/x86/cpu/vpmu_amd.c
> > +++ b/xen/arch/x86/cpu/vpmu_amd.c
> > @@ -518,6 +518,14 @@ static int cf_check svm_vpmu_initialise(struct vcpu *v)
> >      return 0;
> >  }
> >
> > +#ifdef CONFIG_MEM_SHARING
> > +static int cf_check amd_allocate_context(struct vcpu *v)
> > +{
> > +    ASSERT_UNREACHABLE();
>
> What makes this unreachable?
>
> I know none of this is tested on AMD, but it is in principle reachable I
> think.
>
> I'd just leave this as return 0.  It will be slightly less rude to
> whomever adds forking support on AMD.

The only caller is the vm fork route and vm forks are explicitly only
available on Intel (see mem_sharing_control). So this is unreachable
and IMHO should be noted as such.

>
> > +    return 0;
> > +}
> > +#endif
> > +
> >  static const struct arch_vpmu_ops __initconst_cf_clobber amd_vpmu_ops = {
> >      .initialise = svm_vpmu_initialise,
> >      .do_wrmsr = amd_vpmu_do_wrmsr,
> > @@ -527,6 +535,10 @@ static const struct arch_vpmu_ops __initconst_cf_clobber amd_vpmu_ops = {
> >      .arch_vpmu_save = amd_vpmu_save,
> >      .arch_vpmu_load = amd_vpmu_load,
> >      .arch_vpmu_dump = amd_vpmu_dump,
> > +
> > +#ifdef CONFIG_MEM_SHARING
> > +    .allocate_context = amd_allocate_context
>
> Trailing comma please, and in the Intel structure.

Ack

> > +#endif
> >  };
> >
> >  static const struct arch_vpmu_ops *__init common_init(void)
> > diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
> > index 8612f46973..01d4296485 100644
> > --- a/xen/arch/x86/cpu/vpmu_intel.c
> > +++ b/xen/arch/x86/cpu/vpmu_intel.c
> > @@ -282,10 +282,17 @@ static inline void __core2_vpmu_save(struct vcpu *v)
> >      for ( i = 0; i < fixed_pmc_cnt; i++ )
> >          rdmsrl(MSR_CORE_PERF_FIXED_CTR0 + i, fixed_counters[i]);
> >      for ( i = 0; i < arch_pmc_cnt; i++ )
> > +    {
> >          rdmsrl(MSR_IA32_PERFCTR0 + i, xen_pmu_cntr_pair[i].counter);
> > +        rdmsrl(MSR_P6_EVNTSEL(i), xen_pmu_cntr_pair[i].control);
> > +    }
> >
> >      if ( !is_hvm_vcpu(v) )
> >          rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_status);
> > +    /* Save MSR to private context to make it fork-friendly */
> > +    else if ( mem_sharing_enabled(v->domain) )
> > +        vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
> > +                           &core2_vpmu_cxt->global_ctrl);
>
> /sigh.  So we're also not using the VMCS perf controls either.
>
> That wants fixing too, but isn't a task for now.

It does get saved and swapped on vmexit but we don't want to do this
vmx_read/vmx_write in the mem_sharing codebase. It's much cleaner if
this is saved into the vpmu context structure and reloaded from there,
so we can just do a memcpy in mem_sharing without having to know the
details.

> Everything else LGTM.

Cheers!
Tamas

