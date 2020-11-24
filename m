Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122682C19EE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 01:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35293.66748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khM9G-0003pl-9Y; Tue, 24 Nov 2020 00:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35293.66748; Tue, 24 Nov 2020 00:25:34 +0000
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
	id 1khM9G-0003pM-6Q; Tue, 24 Nov 2020 00:25:34 +0000
Received: by outflank-mailman (input) for mailman id 35293;
 Tue, 24 Nov 2020 00:25:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khM9E-0003pH-N8
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:25:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15bd4e62-52f7-49d0-b69d-fda49432d0fc;
 Tue, 24 Nov 2020 00:25:31 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B70220729;
 Tue, 24 Nov 2020 00:25:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khM9E-0003pH-N8
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:25:32 +0000
X-Inumbo-ID: 15bd4e62-52f7-49d0-b69d-fda49432d0fc
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 15bd4e62-52f7-49d0-b69d-fda49432d0fc;
	Tue, 24 Nov 2020 00:25:31 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9B70220729;
	Tue, 24 Nov 2020 00:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606177530;
	bh=zRsMQ1sdMyKyuXMkMtUSFWYf/9u5wU1Aw7W/E8hs25o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=0/54lLXhqIcRaCOiYEzIl7O2kG3JRXpA42CtsNMs+l1GhhcSu2rxL42iCWfu7Wvoe
	 YaYMG8zOLz4dbCP54KKlVavby9LalyjXlV12FAc/IiVDNxEPa298rS9lCaYeeH9WMI
	 c8hsOjQu686uaC8O9StyxjpThkLDKY0PyiTP9CZ0=
Date: Mon, 23 Nov 2020 16:25:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
In-Reply-To: <eff4cb40-ac90-940c-aa97-16a5021386d3@xen.org>
Message-ID: <alpine.DEB.2.21.2011231612330.7979@sstabellini-ThinkPad-T480s>
References: <20201119190751.22345-1-julien@xen.org> <20201119190751.22345-5-julien@xen.org> <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s> <1ba4afef-7efa-6d1a-5929-ec2652dbbb21@xen.org> <alpine.DEB.2.21.2011231409050.7979@sstabellini-ThinkPad-T480s>
 <eff4cb40-ac90-940c-aa97-16a5021386d3@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/11/2020 22:27, Stefano Stabellini wrote:
> > On Fri, 20 Nov 2020, Julien Grall wrote:
> > > > >        /*
> > > > >         * For arm32, page-tables are different on each CPUs. Yet, they
> > > > > share
> > > > > @@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long virt,
> > > > >          spin_lock(&xen_pt_lock);
> > > > >    -    for ( ; addr < addr_end; addr += PAGE_SIZE )
> > > > > +    while ( left )
> > > > >        {
> > > > > -        rc = xen_pt_update_entry(root, addr, mfn, flags);
> > > > > +        unsigned int order;
> > > > > +        unsigned long mask;
> > > > > +
> > > > > +        /*
> > > > > +         * Don't take into account the MFN when removing mapping (i.e
> > > > > +         * MFN_INVALID) to calculate the correct target order.
> > > > > +         *
> > > > > +         * XXX: Support superpage mappings if nr is not aligned to a
> > > > > +         * superpage size.
> > > > 
> > > > It would be good to add another sentence to explain that the checks
> > > > below are simply based on masks and rely on the mfn, vfn, and also
> > > > nr_mfn to be superpage aligned. (It took me some time to figure it out.)
> > > 
> > > I am not sure to understand what you wrote here. Could you suggest a
> > > sentence?
> > 
> > Something like the following:
> > 
> > /*
> >   * Don't take into account the MFN when removing mapping (i.e
> >   * MFN_INVALID) to calculate the correct target order.
> >   *
> >   * This loop relies on mfn, vfn, and nr_mfn, to be all superpage
> >   * aligned, and it uses `mask' to check for that.
> 
> Unfortunately, I am still not sure to understand this comment.
> The loop can deal with any (super)page size (4KB, 2MB, 1GB). There are no
> assumption on any alignment for mfn, vfn and nr_mfn.
> 
> By OR-ing the 3 components together, we can use it to find out the maximum
> size that can be used for the mapping.
> 
> So can you clarify what you mean?

In pseudo-code:

  mask = mfn | vfn | nr_mfns;
  if (mask & ((1<<FIRST_ORDER) - 1))
  if (mask & ((1<<SECOND_ORDER) - 1))
  if (mask & ((1<<THIRD_ORDER) - 1))
  ...

As you wrote the mask is used to find the max size that can be used for
the mapping.

But let's take nr_mfns out of the equation for a moment for clarity:

  mask = mfn | vfn;
  if (mask & ((1<<FIRST_ORDER) - 1))
  if (mask & ((1<<SECOND_ORDER) - 1))
  if (mask & ((1<<THIRD_ORDER) - 1))
  ...

How would you describe this check? I'd call this an alignment check,
is it not?


> >   *
> >   * XXX: Support superpage mappings if nr_mfn is not aligned to a
> >   * superpage size.
> >   */
> > 
> > 
> > > Regarding the TODO itself, we have the exact same one in the P2M code. I
> > > couldn't find a clever way to deal with it yet. Any idea how this could be
> > > solved?
> >   I was thinking of a loop that start with the highest possible superpage
> > size that virt and mfn are aligned to, and also smaller or equal to
> > nr_mfn. So rather than using the mask to also make sure nr_mfns is
> > aligned, I would only use the mask to check that mfn and virt are
> > aligned. Then, we only need to check that superpage_size <= left.
> > 
> > Concrete example: virt and mfn are 2MB aligned, nr_mfn is 5MB / 1280 4K
> > pages. We allocate 2MB superpages until onlt 1MB is left. At that point
> > superpage_size <= left fails and we go down to 4K allocations.
> > 
> > Would that work?
> 
> Unfortunately no, AFAICT, your assumption is that vfn/mfn are originally
> aligned to higest possible superpage size. There are situation where this is
> not the case.

Yes, I was assuming that vfn/mfn are originally aligned to higest
possible superpage size. It is more difficult without that assumption
:-)


> To give a concrete example, at the moment the RAM is mapped using 1GB
> superpage in Xen. But in the future, we will only want to map RAM regions in
> the directmap that haven't been marked as reserved [1].
> 
> Those reserved regions don't have architectural alignment or placement.
> 
> I will use an over-exegerated example (or maybe not :)).
> 
> Imagine you have 4GB of RAM starting at 0. The HW/Software engineer decided to
> place a 2MB reserved region start at 512MB.
> 
> As a result we would want to map two RAM regions:
>    1) 0 to 512MB
>    2) 514MB to 4GB
> 
> I will only focus on 2). In the ideal situation, we would want to map
>    a) 514MB to 1GB using 2MB superpage
>    b) 1GB to 4GB using 1GB superpage
> 
> We don't want be to use 2MB superpage because this will increase TLB pressure
> (we want to avoid Xen using too much TLB entries) and also increase the size
> of the page-tables.
> 
> Therefore, we want to select the best size for each iteration. For now, the
> only solution I can come up with is to OR vfn/mfn and then use a series of
> check to compare the mask and nr_mfn.

Yeah, that's more or less what I was imagining too. Maybe we could use
ffs and friends to avoid or simplify some of those checks.


> In addition to the "classic" mappings (i.e. 4KB, 2MB, 1GB). I would like to
> explore contiguous mapping (e.g. 64KB, 32MB) to further reduce the TLBs
> pressure. Note that a processor may or may not take advantage of contiguous
> mapping to reduce the number of TLBs used.
> 
> This will unfortunately increase the numbers of check. I will try to come up
> with a patch and we can discuss from there.

OK

