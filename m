Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C217AC3EDE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 19:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFM9w-0003gN-71; Tue, 01 Oct 2019 17:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFM9u-0003gH-LO
 for xen-devel@lists.xen.org; Tue, 01 Oct 2019 17:41:58 +0000
X-Inumbo-ID: c3d37a4c-e472-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id c3d37a4c-e472-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 17:41:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B94C12053B;
 Tue,  1 Oct 2019 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569951717;
 bh=vwW2gDuGNOWhqxraVnn++lBKjPUzTdDuqj1BndwfZ7M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=PR1imiiHZ1SMnbXuVjMDn5Bm7FnmSM1tPqng28u7ge96Od1ty5TNYVNo+n8dxW08V
 wOsAcaWwhArXhjRLDAvbbA8UVK06hsxZ6cqDS+1rLVTSq2ktSyH71fIx9CGFV8QSzU
 iiZl+YQiI8j3U+UNlHP5vXpRQj54VZ2UG5iXm9T4=
Date: Tue, 1 Oct 2019 10:41:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <56d8660e-1098-603b-1a30-b0118c072e30@arm.com>
Message-ID: <alpine.DEB.2.21.1910011039150.20899@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-5-sstabellini@kernel.org>
 <0eef5f6f-a8f2-4a6c-745f-56a16314d3ac@arm.com>
 <e1ccdeff-58f7-11ff-f07f-1e9457ca578d@gmail.com>
 <d24ff53d-b153-b00f-4374-5fe9fbd80e47@arm.com>
 <alpine.DEB.2.21.1909271627160.2594@sstabellini-ThinkPad-T480s>
 <697f53cd-2e3b-8890-45e8-4897a29b4133@gmail.com>
 <f2f155dd-4387-61ca-9a16-496c958352a7@arm.com>
 <alpine.DEB.2.21.1909301415250.2594@sstabellini-ThinkPad-T480s>
 <56d8660e-1098-603b-1a30-b0118c072e30@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-18548701-1569951717=:20899"
Subject: Re: [Xen-devel] [PATCH v5 5/8] xen/arm: assign devices to boot
 domains
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Achin Gupta <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Oleksandr <olekstysh@gmail.com>, nd <nd@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-18548701-1569951717=:20899
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 1 Oct 2019, Julien Grall wrote:
> Hi Stefano,
> 
> On 01/10/2019 00:24, Stefano Stabellini wrote:
> > On Mon, 30 Sep 2019, Julien Grall wrote:
> > > Hi Oleksandr,
> > > 
> > > On 30/09/2019 10:34, Oleksandr wrote:
> > > > On 28.09.19 02:28, Stefano Stabellini wrote:
> > > > > > > I have to admit that I don't know about dom0less feature enough
> > > > > > > ...
> > > > > > > 
> > > > > > > 
> > > > > > > But, shouldn't we check if the device is behind the IOMMU and try
> > > > > > > to
> > > > > > > add
> > > > > > > it (iommu_add_dt_device) before assigning it (this is needed for
> > > > > > > drivers
> > > > > > > which support generic IOMMU DT bindings in the first place).
> > > > > > > 
> > > > > > > [please take a look at
> > > > > > > https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02714.html
> > > > > > > if so]
> > > > > > > 
> > > > > > > Julien, what do you think?
> > > > > > Yes you are right.
> > > > > > 
> > > > > > @Stefano, this is a recently merged feature. Without it, you will
> > > > > > not be
> > > > > > able to use passthrough with dom0less guest when the IOMMU (such as
> > > > > > IPMMU) is using the generic DT bindings.
> > > > > Just double-checking but it should be only a matter of the following,
> > > > > right?
> > > > > 
> > > > > +        res = iommu_add_dt_device(node);
> > > > > +        if ( res < 0 )
> > > > > +            return res;
> > > > 
> > > > I think, the change above is correct.
> > > > 
> > > > 
> > > > > +
> > > > > +        if ( dt_device_is_protected(node) )
> > > > > +        {
> > > > > +            res = iommu_assign_dt_device(kinfo->d, node);
> > > > > +            if ( res < 0 )
> > > > > +                return res;
> > > > > +        }
> > > > > +
> > > > > 
> > > > > (I am asking because I couldn't quite test it due to the error with
> > > > > mmu-masters I mentioned in the other email.)
> > > > Regarding the check "if (dt_device_is_protected(node))" here. I think,
> > > > it
> > > > depends on the "xen,path" purpose.
> > > > 
> > > > 1. If "xen,path" property is, let say, close to "dtdev" property in
> > > > domain
> > > > config file, where we describe master devices which are behind the
> > > > IOMMU, so
> > > > *must* be protected, then that check should be removed. Please see
> > > > iommu_do_dt_domctl().
> > > > 
> > > > 2. If "xen,path" property can also be used to describe devices which are
> > > > not
> > > > behind the IOMMU (so don't need to be protected), but just for the
> > > > "interrupt mappings" purposes, then that check is correct and should
> > > > remain.
> > > 
> > > Some device may not be behind an IOMMU but still do DMA. We are not doing
> > > a
> > > favor to the user to continue the assignment as this could lead to at best
> > > to
> > > a non-working device (at worst a security issue).
> > > 
> > > Therefore I am against the solution 2).
> > 
> > I agree. (And honestly, "xen,path" was introduced as an equivalent of
> > "dtdev" initially.)
> > 
> > 
> > > However, this raises some questions why MMIOs are treated differently (i.e
> > > they don't need an IOMMU).
> > > 
> > > In the current setup, you would not be able to passthrough a non
> > > DMA-capable
> > > to a guest if they needs interrupts (e.g. an UART) but you would be if
> > > they
> > > don't use interrupts.
> > > 
> > > So I think we need a couple of more changes:
> > >     1) Introduce an option to allow the user to ignore IOMMU issues
> > > (something
> > > like "xen,force-assign-without-iommu").
> > >     2) "xen,reg" cannot be specified without "xen,path". This allows us to
> > > police the user DT.
> > 
> > Interesting questions.
> > 
> > Something like "xen,force-assign-without-iommu" would be useful. The
> > upside of being able to assign a non-IOMMU-protected non-DMA-capable
> > device outweighs the downsides.
> > 
> > I am less sure about having to specify "xen,reg" together with
> > "xen,path". It is fairly common to have a control register MMIO region
> > page in FPGA that doesn't do any DMA and has no related interrupts. In
> > those cases, it is nice to be able to handle it by just having one
> > "xen,reg" property. But maybe if the user also passes
> > "xen,force-assign-without-iommu" then we could also ignore a missing
> > "xen,path".
> > 
> > In any case, my preference would be to keep the series as is for now,
> > and make these changes later. 
> 
> Bindings are meant to be stable, so we would end up to have to create a new
> bindings to cater the solution discussed here. So I would rather avoid to take
> that approach.

Adding a note here from our discussion on IRC. One idea would be to keep
the code as is (v7a) but to make sure the docs reflect that xen,reg and
xen,path are both required. That would be good. However, the docs
already imply it so I didn't actually need to make any changes in that
respect in v7a. In any case, I could certainly add a statement or two to
the docs if it helps.


> > However, for the sake of moving things
> > forward quickly, I also implemented Julien's suggestions. So I'll send
> > two v7 updates to this series:
> > 
> > - v7a: the minimal changes version, without things discussed here except
> >         for removing the "if (dt_device_is_protected(node))" check
> > - v7b: a version with all the changes discussed here
> > 
> > Julien, I'll let you pick your favorite, hopefully one of them will be
> > to your liking.
> 
> Thank you for suggesting the two versions. I will have a look at them.

--8323329-18548701-1569951717=:20899
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-18548701-1569951717=:20899--

