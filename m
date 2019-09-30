Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB07C2ACE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 01:27:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF51w-0000UH-TB; Mon, 30 Sep 2019 23:24:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF51v-0000UB-IF
 for xen-devel@lists.xen.org; Mon, 30 Sep 2019 23:24:35 +0000
X-Inumbo-ID: 7581fd13-e3d9-11e9-96ea-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 7581fd13-e3d9-11e9-96ea-12813bfff9fa;
 Mon, 30 Sep 2019 23:24:34 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42EEE20842;
 Mon, 30 Sep 2019 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569885873;
 bh=CCRBoxCKjmCqDJS6d0lFfToJc27NK5OfmbgY1vpqNKQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BL+Wlo6w+FcsfJ923Nwg8Xa+iXloHnCy3i6gqeVzitLhFJ/HWP/GF1z44GQrhQGNc
 UgNFrJ61CL5TiMBxQOWBeLGefzGQeOp7yy3ppWZEZ/dJ2BgBuLCQouKzvmamlEcsla
 FQWfyGE7ArgZIbyukgmf/otyd6fy55o46X//8oAw=
Date: Mon, 30 Sep 2019 16:24:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <f2f155dd-4387-61ca-9a16-496c958352a7@arm.com>
Message-ID: <alpine.DEB.2.21.1909301415250.2594@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-5-sstabellini@kernel.org>
 <0eef5f6f-a8f2-4a6c-745f-56a16314d3ac@arm.com>
 <e1ccdeff-58f7-11ff-f07f-1e9457ca578d@gmail.com>
 <d24ff53d-b153-b00f-4374-5fe9fbd80e47@arm.com>
 <alpine.DEB.2.21.1909271627160.2594@sstabellini-ThinkPad-T480s>
 <697f53cd-2e3b-8890-45e8-4897a29b4133@gmail.com>
 <f2f155dd-4387-61ca-9a16-496c958352a7@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-695441122-1569878525=:2594"
Content-ID: <alpine.DEB.2.21.1909301422080.2594@sstabellini-ThinkPad-T480s>
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

--8323329-695441122-1569878525=:2594
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1909301422081.2594@sstabellini-ThinkPad-T480s>

On Mon, 30 Sep 2019, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 30/09/2019 10:34, Oleksandr wrote:
> > On 28.09.19 02:28, Stefano Stabellini wrote:
> > > > > I have to admit that I don't know about dom0less feature enough ...
> > > > > 
> > > > > 
> > > > > But, shouldn't we check if the device is behind the IOMMU and try to
> > > > > add
> > > > > it (iommu_add_dt_device) before assigning it (this is needed for
> > > > > drivers
> > > > > which support generic IOMMU DT bindings in the first place).
> > > > > 
> > > > > [please take a look at
> > > > > https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02714.html
> > > > > if so]
> > > > > 
> > > > > Julien, what do you think?
> > > > Yes you are right.
> > > > 
> > > > @Stefano, this is a recently merged feature. Without it, you will not be
> > > > able to use passthrough with dom0less guest when the IOMMU (such as
> > > > IPMMU) is using the generic DT bindings.
> > > Just double-checking but it should be only a matter of the following,
> > > right?
> > > 
> > > +        res = iommu_add_dt_device(node);
> > > +        if ( res < 0 )
> > > +            return res;
> > 
> > I think, the change above is correct.
> > 
> > 
> > > +
> > > +        if ( dt_device_is_protected(node) )
> > > +        {
> > > +            res = iommu_assign_dt_device(kinfo->d, node);
> > > +            if ( res < 0 )
> > > +                return res;
> > > +        }
> > > +
> > > 
> > > (I am asking because I couldn't quite test it due to the error with
> > > mmu-masters I mentioned in the other email.)
> > Regarding the check "if (dt_device_is_protected(node))" here. I think, it
> > depends on the "xen,path" purpose.
> > 
> > 1. If "xen,path" property is, let say, close to "dtdev" property in domain
> > config file, where we describe master devices which are behind the IOMMU, so
> > *must* be protected, then that check should be removed. Please see
> > iommu_do_dt_domctl().
> > 
> > 2. If "xen,path" property can also be used to describe devices which are not
> > behind the IOMMU (so don't need to be protected), but just for the
> > "interrupt mappings" purposes, then that check is correct and should remain.
> 
> Some device may not be behind an IOMMU but still do DMA. We are not doing a
> favor to the user to continue the assignment as this could lead to at best to
> a non-working device (at worst a security issue).
> 
> Therefore I am against the solution 2).

I agree. (And honestly, "xen,path" was introduced as an equivalent of
"dtdev" initially.)


> However, this raises some questions why MMIOs are treated differently (i.e
> they don't need an IOMMU).
> 
> In the current setup, you would not be able to passthrough a non DMA-capable
> to a guest if they needs interrupts (e.g. an UART) but you would be if they
> don't use interrupts.
> 
> So I think we need a couple of more changes:
>    1) Introduce an option to allow the user to ignore IOMMU issues (something
> like "xen,force-assign-without-iommu").
>    2) "xen,reg" cannot be specified without "xen,path". This allows us to
> police the user DT.

Interesting questions.

Something like "xen,force-assign-without-iommu" would be useful. The
upside of being able to assign a non-IOMMU-protected non-DMA-capable
device outweighs the downsides.

I am less sure about having to specify "xen,reg" together with
"xen,path". It is fairly common to have a control register MMIO region
page in FPGA that doesn't do any DMA and has no related interrupts. In
those cases, it is nice to be able to handle it by just having one
"xen,reg" property. But maybe if the user also passes
"xen,force-assign-without-iommu" then we could also ignore a missing
"xen,path".

In any case, my preference would be to keep the series as is for now,
and make these changes later. However, for the sake of moving things
forward quickly, I also implemented Julien's suggestions. So I'll send
two v7 updates to this series:

- v7a: the minimal changes version, without things discussed here except
       for removing the "if (dt_device_is_protected(node))" check
- v7b: a version with all the changes discussed here

Julien, I'll let you pick your favorite, hopefully one of them will be
to your liking.
--8323329-695441122-1569878525=:2594
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-695441122-1569878525=:2594--

