Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E2534954A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 16:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101422.193998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPRob-0005Og-42; Thu, 25 Mar 2021 15:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101422.193998; Thu, 25 Mar 2021 15:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPRob-0005OL-0h; Thu, 25 Mar 2021 15:22:29 +0000
Received: by outflank-mailman (input) for mailman id 101422;
 Thu, 25 Mar 2021 15:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8W+0=IX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lPRoZ-0005OG-8O
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 15:22:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2127d2f-42e6-49b6-8731-0585d3409ff9;
 Thu, 25 Mar 2021 15:22:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C43FF61A17;
 Thu, 25 Mar 2021 15:22:25 +0000 (UTC)
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
X-Inumbo-ID: a2127d2f-42e6-49b6-8731-0585d3409ff9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616685746;
	bh=gI+ya7eVajNSjdsRxoTQswbctEeD7muAW0SsciqCFJw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BjDbHAnf+ZH6ofUCPJ9exF0jNcwKBBBHrHIQAPvF5kdPgoXNKHzjj7wrTfu3L+wP9
	 RILZe3PiWcCap8Nx2I+0ogCf+E7C/cwTNMmBhbfGqFU6Z0He3KEJw02uyzZhtuhZs+
	 AED9Ik1gEedkxmoXnDM9ketYwyumb3VSit0LDwQHgR0nWvQW5vS5PfsBGYcRb95iuG
	 Q5oOgcAXWmSEk+kdKw3vbZQzS/dR5VA/FGW/BwcUQ/o9GYALBRJ+gVU+YRyKjj78ay
	 k8zuhwDAPTmLWMUnShljMBiOLmaogVXiXrENdu/Rljmahm9uGbKD+4E3PyrFg50YB7
	 M2jfsmbkbU5lQ==
Date: Thu, 25 Mar 2021 08:22:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Randy Dunlap <rdunlap@infradead.org>
cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, sstabellini@kernel.org, 
    linux@armlinux.org.uk, xen-devel@lists.xenproject.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] ARM: xen/mm.c: A mundane typo fix
In-Reply-To: <e3980acb-e6d7-645a-3be0-79cea6f2fd8e@infradead.org>
Message-ID: <alpine.DEB.2.21.2103250822120.439@sstabellini-ThinkPad-T480s>
References: <20210325043526.16289-1-unixbhaskar@gmail.com> <e3980acb-e6d7-645a-3be0-79cea6f2fd8e@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Mar 2021, Randy Dunlap wrote:
> On 3/24/21 9:35 PM, Bhaskar Chowdhury wrote:
> > s/acrros/across/
> > 
> > Plus some words need prural version...so did it.(page->pages)
> > 
> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> >  Changes from V1:
> >   Randy's findings incorporated.
> > 
> >  arch/arm/xen/mm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> > index 467fa225c3d0..8596dd32dcd5 100644
> > --- a/arch/arm/xen/mm.c
> > +++ b/arch/arm/xen/mm.c
> > @@ -105,8 +105,8 @@ bool xen_arch_need_swiotlb(struct device *dev,
> >  	 *	- The Linux page refers to foreign memory
> >  	 *	- The device doesn't support coherent DMA request
> >  	 *
> > -	 * The Linux page may be spanned acrros multiple Xen page, although
> > -	 * it's not possible to have a mix of local and foreign Xen page.
> > +	 * The Linux page may be spanned across multiple Xen pages, although
> > +	 * it's not possible to have a mix of local and foreign Xen pages.
> >  	 * Furthermore, range_straddles_page_boundary is already checking
> >  	 * if buffer is physically contiguous in the host RAM.
> >  	 *
> > --
> 
> 
> -- 
> ~Randy
> 

