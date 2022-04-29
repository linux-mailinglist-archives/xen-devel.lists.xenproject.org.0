Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D61D513FA5
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 02:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316841.535923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkEhA-0002kr-Lm; Fri, 29 Apr 2022 00:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316841.535923; Fri, 29 Apr 2022 00:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkEhA-0002iS-Hz; Fri, 29 Apr 2022 00:41:16 +0000
Received: by outflank-mailman (input) for mailman id 316841;
 Fri, 29 Apr 2022 00:41:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkEh8-0002iM-BE
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 00:41:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ef8493-c755-11ec-8fc3-03012f2f19d4;
 Fri, 29 Apr 2022 02:41:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9FD8621A0;
 Fri, 29 Apr 2022 00:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AF6C385A9;
 Fri, 29 Apr 2022 00:41:09 +0000 (UTC)
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
X-Inumbo-ID: 10ef8493-c755-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651192870;
	bh=mKEymw8KHvNr0gMWZtrppwrbSLOzYD3jOEAZWtclph0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ioc3nJuVy+OjaUHRXuGcts27MuXrrmWCvT3gyeJGA+x5cqRGaqT1nLplTNlMt0a4W
	 L++oaeEKbkSfFahXC+SvDRKQDJObPwo5wTnAMsxZdfCbfScXpEtiu2cB3AsPZc4H8v
	 qefi3OifidS2PdGs+oj+emAKnVZgZ1aTDTTwXoXb2MhPCQ9Bik9S77Mr83+xEcIjGF
	 2o6fef31q3CKm1NStEidubA8XdQyJ9GrI5xk4xSgXmZp35jY7T9UDFR8T3dCD5G4P9
	 /2Vqle+RGF4CsyfojhlXLr5CGwShCToZ01MBC4Mi353FZEaavwdLmLI1ofnPtWfmM6
	 1ftJEyckDv33w==
Date: Thu, 28 Apr 2022 17:41:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien.grall.oss@gmail.com>, 
    osstest service owner <osstest-admin@xenproject.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, David Vrabel <dvrabel@amazon.co.uk>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
In-Reply-To: <ac0a0bf0-81a8-63c7-6a62-377672e24069@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204281647540.915916@ubuntu-linux-20-04-desktop>
References: <osstest-169781-mainreport@xen.org> <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org> <alpine.DEB.2.22.394.2204271556110.915916@ubuntu-linux-20-04-desktop> <CAJ=z9a1bu=3sX0rvWy+T-ey4363DMUEJvzkSqkQkTnvOQtT0=A@mail.gmail.com>
 <alpine.DEB.2.22.394.2204271622520.915916@ubuntu-linux-20-04-desktop> <ac0a0bf0-81a8-63c7-6a62-377672e24069@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Apr 2022, Julien Grall wrote:
> On 28/04/2022 01:47, Stefano Stabellini wrote:
> > On Thu, 28 Apr 2022, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On Thu, 28 Apr 2022, 00:02 Stefano Stabellini, <sstabellini@kernel.org>
> > > wrote
> > >        It seems to me that it is acceptable to allocate memory with
> > > interrupt
> > >        disabled during __init. I cannot see any drawbacks with it. I think
> > > we
> > >        should change the ASSERT to only trigger after __init: system_state
> > > ==
> > >        SYS_STATE_active.
> > > 
> > >        What do you think?
> > > 
> > > 
> > > This would solve the immediate problem but not the long term one (i.e cpu
> > > hotplug).
> > > 
> > > So I think it would be better to properly fix it right away.
> > 
> > Yeah, you are right about cpu hotplug. I think both statements are true:
> > 
> > - it is true that this is supposed to work with cpu hotplug and these
> >    functions might be directly affected by cpu hotplug (by a CPU coming
> >    online later on)
> > 
> > - it is also true that it might not make sense to ASSERT at __init time
> >    if IRQs are disabled. There might be other places, not affected by cpu
> >    hotplug, where we do memory allocation at __init time with IRQ
> >    disabled. It might still be a good idea to add the system_state ==
> >    SYS_STATE_active check in the ASSERT, not to solve this specific
> >    problem but to avoid other issues.
> 
> AFAIU, it is not safe on x86 to do TLB flush with interrupts disabled *and*
> multiple CPUs running. So we can't generically relax the check.
> 
> Looking at the OSSTest results, both Arm32 and Arm64 without GICv3 ITS tests
> have passed. So it seems unnecessary to me to preemptively relax the check
> just for Arm.

It is good news that it works already (GICv3 aside) on ARM. If you
prefer not to relax it, I am OK with it (although it makes me a bit
worried about future breakages).

 
> > In regard to gicv3_lpi_allocate_pendtable, I haven't thought about the
> > implications of cpu hotplug for LPIs and GICv3 before. Do you envision
> > that in a CPU hotplug scenario gicv3_lpi_init_rdist would be called when
> > the extra CPU comes online?
> 
> It is already called per-CPU. See gicv3_secondary_cpu_init() ->
> gicv3_cpu_init() -> gicv3_populate_rdist().

Got it, thanks!


> > Today gicv3_lpi_init_rdist is called based on the number of
> > rdist_regions without checking if the CPU is online or offline (I think ?)
> 
> The re-distributors are not banked and therefore accessible by everyone.
> However, in Xen case, each pCPU will only touch its own re-distributor (well
> aside TYPER to figure out the ID).
> 
> The loop in gicv3_populate_rdist() will walk throught all the
> re-distributor to find which one corresponds to the current pCPU. Once we
> found it, we will call gicv3_lpi_init_rdist() to fully initialize the
> re-distributor.
> 
> I don't think we want to populate the memory for each re-distributor in
> advance.

I agree.

Currently we do:

    start_secondary
        [...]
        gic_init_secondary_cpu()
            [...]
            gicv3_lpi_init_rdist()
        [...]
        local_irq_enable();

Which seems to be the right sequence to me. There must be an early boot
phase where interrupts are disabled on a CPU but memory allocations are
possible. If this was x86 with the tlbflush limitation, I would suggest
to have per-cpu memory mapping areas so that we don't have to do any
global tlb flushes with interrupts disabled.

On ARM, we don't have the tlbflush limitation so we could do that but we
wouldn't have much to gain from it.

Also, this seems to be a bit of a special case, because in general we
can move drivers initializations later after local_irq_enable(). But
this is the interrupt controller driver itself -- we cannot move it
after local_irq_enable().

So maybe an ad-hoc solution could be acceptable?

The only one I can think of is to check on system_state ==
SYS_STATE_active now. In the future for CPU hotplug we could have a
per-CPU system_state, like cpu_system_state, and do a similar check.

I am totally open to other ideas, I couldn't come up with anything
better at the moment.

