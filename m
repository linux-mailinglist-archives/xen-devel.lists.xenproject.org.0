Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B62E4F39D8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 16:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299195.509697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbkbx-0000ky-0F; Tue, 05 Apr 2022 14:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299195.509697; Tue, 05 Apr 2022 14:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbkbw-0000j8-TH; Tue, 05 Apr 2022 14:56:48 +0000
Received: by outflank-mailman (input) for mailman id 299195;
 Tue, 05 Apr 2022 14:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HhHa=UP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nbkbv-0000j2-Lx
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 14:56:47 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d285d60-b4f0-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 16:56:46 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id b43so17412282ljr.10
 for <xen-devel@lists.xenproject.org>; Tue, 05 Apr 2022 07:56:46 -0700 (PDT)
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
X-Inumbo-ID: 9d285d60-b4f0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X/Bq21aIGH20txJFUtqEmma1uM4faSauTpjrY1bPxs0=;
        b=oc0xzbn6ucHu0D0cwGPwINsSD6km+B+lbONMkvQ0H+zUNYL3x0klg3URjOllipTpba
         psPWm9UKl+pGj/boPtv2NcFjEeW0UvndILkQIOFSJ6KtHn2fWYZFHBgMTBRUjborwe3N
         dxtRnqAYAbzepYtkGEtc17sAEmOhIG/Ko2l8S8UIw8gyJFmXHJc8vdGLpNw/tO7Y1kYS
         0BnIAh9sibsJwrhqCeQ8jzgi1BxcfdMemEJ8uD2+KFdnOg76rGSUYpGQemSt2EtUnDAf
         6A8A1KbO35WSWb5z8+FOXHdgagxgydUK4nhGnEkX0mBnXBSEdG/T84m9aW9oo7Y3INCG
         /PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X/Bq21aIGH20txJFUtqEmma1uM4faSauTpjrY1bPxs0=;
        b=GQzdIZpNKfEphkKZC4G0u7TrVNFwwWSAVnSLQYzD5AdX1KrSzxjpVAW0jW9wYtlsRD
         hISBreDwplQNMIqkFhKTittEsWIYeYCaik5DKA46teoS9rUA7rCYPg1d9URppD1vKp9O
         ChMBZgKj7E4jTp1p13l2BotHjGVnqW2FuPWChg2KTMTUoATHivqFVKxOJVip3c5bs2eJ
         ikxEBYS/+MRpSr7OpYlQCHN0/2z8vpnLCwH2n6BKB1kOMLXgDaesggSRfr1P3VmPpsAm
         ML9N6LoPZDB8JkZu/X2WWZPXXPg0XZd8TIiXxMdkHQIfoY7C3j0mVe/G+JFAKcyzv/yi
         WV1w==
X-Gm-Message-State: AOAM530wbtzhSs0zmge6yG22LjIrT+o1IsmsuYfl7XK5k4u/3FOWW+rn
	PyXI+NPSo/YMDqgeGi+ICNls/okbDnswSLomLC2ZYGLz
X-Google-Smtp-Source: ABdhPJwbaYFzjKt84/kVDmmk/xncbnKw7liqak5f3qtm92+pYZi+I2CAeaYHVPQaptA1ACgPg/RWRLNQobRuW8PgU7Y=
X-Received: by 2002:a2e:a372:0:b0:249:7108:6778 with SMTP id
 i18-20020a2ea372000000b0024971086778mr2464963ljn.403.1649170605921; Tue, 05
 Apr 2022 07:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181734.30319-1-jandryuk@gmail.com> <f5225d49-fcc5-c02c-2e48-cd96cc2bd940@suse.com>
In-Reply-To: <f5225d49-fcc5-c02c-2e48-cd96cc2bd940@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 5 Apr 2022 10:56:34 -0400
Message-ID: <CAKf6xpuVJTBvKCK6FtKP7STEAQ-A0GXX=918DRPmYAt3P_byKA@mail.gmail.com>
Subject: Re: [PATCH] x86/irq: Skip unmap_domain_pirq XSM during destruction
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 5, 2022 at 4:18 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 30.03.2022 20:17, Jason Andryuk wrote:
> > xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
> > complete_domain_destroy as an RCU callback.  The source context was an
> > unexpected, random domain.  Since this is a xen-internal operation,
> > we don't want the XSM hook denying the operation.
> >
> > Check d->is_dying and skip the check when the domain is dead.  The RCU
> > callback runs when a domain is in that state.
>
> One question which has always been puzzling me (perhaps to Daniel): While
> I can see why mapping of an IRQ needs to be subject to an XSM check, it's
> not really clear to me why unmapping would need to be, at least as long
> as it's the domain itself which requests the unmap (and which I would
> view to extend to the domain being cleaned up). But maybe that's why it's
> XSM_HOOK ...
>
> > ---
> > Dan wants to change current to point at DOMID_IDLE when the RCU callback
> > runs.  I think Juergen's commit 53594c7bd197 "rcu: don't use
> > stop_machine_run() for rcu_barrier()" may have changed this since it
> > mentions stop_machine_run scheduled the idle vcpus to run the callbacks
> > for the old code.
> >
> > Would that be as easy as changing rcu_do_batch() to do:
> >
> > +        /* Run as "Xen" not a random domain's vcpu. */
> > +        vcpu = get_current();
> > +        set_current(idle_vcpu[smp_processor_id()]);
> >          list->func(list);
> > +        set_current(vcpu);
> >
> > or is using set_current() only acceptable as part of context_switch?
>
> Indeed I would question any uses outside of context_switch() (and
> system bringup).
>
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -2340,10 +2340,14 @@ int unmap_domain_pirq(struct domain *d, int pirq)
> >          nr = msi_desc->msi.nvec;
> >      }
> >
> > -    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> > -                               msi_desc ? msi_desc->dev : NULL);
> > -    if ( ret )
> > -        goto done;
> > +    /* When called by complete_domain_destroy via RCU, current is a random
> > +     * domain.  Skip the XSM check since this is a Xen-initiated action. */
>
> Comment style.

Yes.  Sorry about that.

> > +    if ( d->is_dying != DOMDYING_dead ) {
>
> Please use !d->is_dying. Also please correct the placement of the brace.
> Or you could avoid the need for a brace by leveraging that ret is zero
> ahead of this if(), i.e. ...

Here I was patting myself on the back for remembering the spaces
inside the parens, and I screwed up the brace...  Sorry.

I intentionally chose DOMDYING_dead because, from my reading of the
code, complete_domain_destroy should only reach here when dead (and
not dying).  If this function is reached when DOMDYING_dying, then
that is unexpected.  That would be a guest-initiated action and
therefore the XSM check should apply.

Just checking is_dying is fine, but I want to explain and highlight this aspect.

> > +        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> > +                                   msi_desc ? msi_desc->dev : NULL);
> > +        if ( ret )
> > +            goto done;
> > +    }
>
>
>     if ( !d->is_dying )
>         ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
>                                    msi_desc ? msi_desc->dev : NULL);
>     if ( ret )
>         goto done;

I'm planning to just do it this way.

Thank you for reviewing.

-Jason

