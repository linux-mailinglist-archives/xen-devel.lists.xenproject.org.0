Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692CF2843BF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 03:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3092.8961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPbXi-0006Br-Dd; Tue, 06 Oct 2020 01:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3092.8961; Tue, 06 Oct 2020 01:13:26 +0000
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
	id 1kPbXi-0006BS-AY; Tue, 06 Oct 2020 01:13:26 +0000
Received: by outflank-mailman (input) for mailman id 3092;
 Tue, 06 Oct 2020 01:13:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh4O=DN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kPbXh-0006BN-7H
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 01:13:25 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37b15ab4-d4fd-4b26-aa5a-94a112e44c6a;
 Tue, 06 Oct 2020 01:13:24 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BB812076B;
 Tue,  6 Oct 2020 01:13:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oh4O=DN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kPbXh-0006BN-7H
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 01:13:25 +0000
X-Inumbo-ID: 37b15ab4-d4fd-4b26-aa5a-94a112e44c6a
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 37b15ab4-d4fd-4b26-aa5a-94a112e44c6a;
	Tue, 06 Oct 2020 01:13:24 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5BB812076B;
	Tue,  6 Oct 2020 01:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601946803;
	bh=vu//iV9DFORvtpOSAwSb6Cxpg+zQ2L0xIZTcyUKvZok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t3p14RX2TmiiKLDeyQDTfo98b1wPAx0w/xAAEuIv5ZxxtlNPm8Ixbv2YyqiyOLors
	 fpEfj/NWTzAWFRe3bpAgnpGxrZlkXYC+Unl8Rxe10yhEgO8LdQftSDen7MXMSb2yTs
	 BJu643jbm2fK6lKNhN7ZUS9zn8YUaAMpqBgS9hdY=
Date: Mon, 5 Oct 2020 18:13:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Masami Hiramatsu <mhiramat@kernel.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    takahiro.akashi@linaro.org, jgross@suse.com, boris.ostrovsky@oracle.com
Subject: Re: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn
 correctly
In-Reply-To: <b205ec9c-c307-2b67-c43a-cf2a67179484@xen.org>
Message-ID: <alpine.DEB.2.21.2010051526550.10908@sstabellini-ThinkPad-T480s>
References: <160190516028.40160.9733543991325671759.stgit@devnote2> <b205ec9c-c307-2b67-c43a-cf2a67179484@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Oct 2020, Julien Grall wrote:
> Hi Masami,
> 
> On 05/10/2020 14:39, Masami Hiramatsu wrote:
> > Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu
> > address conversion.
> > 
> > In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted
> > to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)
> > assumes the given virtual address is in contiguous kernel memory
> > area, it can not convert the per-cpu memory if it is allocated on
> > vmalloc area (depends on CONFIG_SMP).
> 
> Are you sure about this? I have a .config with CONFIG_SMP=y where the per-cpu
> region for CPU0 is allocated outside of vmalloc area.
> 
> However, I was able to trigger the bug as soon as CONFIG_NUMA_BALANCING was
> enabled.

I cannot reproduce the issue with defconfig, but I can with Masami's
kconfig.

If I disable just CONFIG_NUMA_BALANCING from Masami's kconfig, the
problem still appears.

If I disable CONFIG_NUMA from Masami's kconfig, it works, which is
strange because CONFIG_NUMA is enabled in defconfig, and defconfig
works.


> [...]
> 
> > Fixes: 250c9af3d831 ("arm/xen: Add support for 64KB page granularity")
> 
> FWIW, I think the bug was already present before 250c9af3d831.

Yeah, I bet 250c9af3d831 is not what introduced the issue. Whatever
caused virt_to_phys to stop working on vmalloc'ed addresses is the cause
of the problem. It is something that went in 5.9 (5.8 works) but I don't
know what for sure.


> > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > ---
> >   arch/arm/xen/enlighten.c |    2 +-
> >   include/xen/arm/page.h   |    3 +++
> >   2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> > index e93145d72c26..a6ab3689b2f4 100644
> > --- a/arch/arm/xen/enlighten.c
> > +++ b/arch/arm/xen/enlighten.c
> > @@ -150,7 +150,7 @@ static int xen_starting_cpu(unsigned int cpu)
> >   	pr_info("Xen: initializing cpu%d\n", cpu);
> >   	vcpup = per_cpu_ptr(xen_vcpu_info, cpu);
> >   -	info.mfn = virt_to_gfn(vcpup);
> > +	info.mfn = percpu_to_gfn(vcpup);
> >   	info.offset = xen_offset_in_page(vcpup);
> >     	err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
> > diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
> > index 39df751d0dc4..ac1b65470563 100644
> > --- a/include/xen/arm/page.h
> > +++ b/include/xen/arm/page.h
> > @@ -83,6 +83,9 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
> >   	})
> >   #define gfn_to_virt(m)		(__va(gfn_to_pfn(m) <<
> > XEN_PAGE_SHIFT))
> >   +#define percpu_to_gfn(v)	\
> > +	(pfn_to_gfn(per_cpu_ptr_to_phys(v) >> XEN_PAGE_SHIFT))
> > +
> >   /* Only used in PV code. But ARM guests are always HVM. */
> >   static inline xmaddr_t arbitrary_virt_to_machine(void *vaddr)
> >   {


The fix is fine for me. I tested it and it works. We need to remove the
"Fixes:" line from the commit message. Ideally, replacing it with a
reference to what is the source of the problem.

Aside from that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

