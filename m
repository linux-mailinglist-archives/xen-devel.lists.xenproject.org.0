Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27A4247AC6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 00:57:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7o3S-0003ah-MG; Mon, 17 Aug 2020 22:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ksrr=B3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k7o3R-0003aZ-Hy
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 22:56:37 +0000
X-Inumbo-ID: 2d259eb3-c148-4b07-b6c1-90521798231a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d259eb3-c148-4b07-b6c1-90521798231a;
 Mon, 17 Aug 2020 22:56:37 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 173F52063A;
 Mon, 17 Aug 2020 22:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597704996;
 bh=c8k07hcxQKNWy3U+OmbUJJxQd7rXJX1Xiw2hD++JWqI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=E0NPXF+dFhGEvAQkt8dHeRucf/q6VE47nUqY4StluXa7wdocLcuqV0js9rqU1PzfV
 Xg/D9MVVsn9/6VCIErODyba5q6WsV8vHLiOzE4pCt/4T7rbH5JxxpDq6/3Ldk8wIEh
 qWwnGp4MT9CNu0Mej1Cn+ArictwLOoYVVvJ3kGbI=
Date: Mon, 17 Aug 2020 15:56:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
 xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
 george.dunlap@citrix.com, ian.jackson@eu.citrix.com, julien@xen.org, 
 wl@xen.org, Stefano Stabellini <stefano.stabellini@xilinx.com>, 
 Bertrand.Marquis@arm.com
Subject: Re: [PATCH 05/14] kernel-doc: public/features.h
In-Reply-To: <8b8a63fb-5b79-42ba-7d6f-d1538775033a@suse.com>
Message-ID: <alpine.DEB.2.21.2008171520060.15985@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-5-sstabellini@kernel.org>
 <ab1a0562-6fe0-9613-b6c9-a09714af02cf@suse.com>
 <alpine.DEB.2.21.2008071239130.16004@sstabellini-ThinkPad-T480s>
 <8b8a63fb-5b79-42ba-7d6f-d1538775033a@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 17 Aug 2020, Jan Beulich wrote:
> On 07.08.2020 23:52, Stefano Stabellini wrote:
> > On Fri, 7 Aug 2020, Jan Beulich wrote:
> >> On 07.08.2020 01:49, Stefano Stabellini wrote:
> >>> @@ -41,19 +41,25 @@
> >>>   * XENFEAT_dom0 MUST be set if the guest is to be booted as dom0,
> >>>   */
> >>>  
> >>> -/*
> >>> - * If set, the guest does not need to write-protect its pagetables, and can
> >>> - * update them via direct writes.
> >>> +/**
> >>> + * DOC: XENFEAT_writable_page_tables
> >>> + *
> >>> + * If set, the guest does not need to write-protect its pagetables, and
> >>> + * can update them via direct writes.
> >>>   */
> >>>  #define XENFEAT_writable_page_tables       0
> >>
> >> I dislike such redundancy (and it's more noticable here than with
> >> the struct-s). Is there really no way for the tool to find the
> >> right item, the more that in the cover letter you say that you
> >> even need to get the placement right, i.e. there can't be e.g.
> >> intervening #define-s?
> > 
> > Let me clarify that the right placement (nothing between the comment and
> > the following structure) is important for structs, typedefs, etc., but
> > not for "DOC". DOC is freeform and doesn't have to be followed by
> > anything specifically.
> > 
> > 
> > In regards to the redundancy, there is only another option, that I
> > didn't choose because it leads to worse documents being generated.
> > However, they are still readable, so if the agreement is to use the
> > other format, I would be OK with it.
> > 
> > 
> > The other format is the keyword "macro" (this one would have to have the
> > right placement, straight on top of the #define):
> > 
> > /**
> >  * macro XENFEAT_writable_page_tables
> >  *
> >  * If set, the guest does not need to write-protect its pagetables, and
> >  * can update them via direct writes.
> >  */
> > 
> > 
> > Which could be further simplified to:
> > 
> > /**
> >  * macro
> >  *
> >  * If set, the guest does not need to write-protect its pagetables, and
> >  * can update them via direct writes.
> >  */
> > 
> > 
> > In terms of redundancy, that's the best we can do.
> > 
> > The reason why I say it is not optimal is that with DOC the pleudo-html
> > generated via sphinx is:
> > 
> > ---
> > * XENFEAT_writable_page_tables *
> > 
> > If set, the guest does not need to write-protect its pagetables, and
> > can update them via direct writes.
> > ---
> > 
> > While with macro, two () parenthesis gets added to the title, and also an
> > empty "Parameters" section gets added, like this:
> > 
> > ---
> > * XENFEAT_writable_page_tables() *
> > 
> > ** Parameters **
> > 
> > ** Description **
> > 
> > If set, the guest does not need to write-protect its pagetables, and
> > can update them via direct writes.
> > ---
> > 
> > 
> > I think it could be confusing to the user: it looks like a macro with
> > parameters, which is not what we want.
> 
> Agreed, so ...
> 
> > For that reason, I think we should stick with "DOC" for now.
> 
> ... if there are no (better) alternatives we'll have to live with the
> redundancy.

Thanks Jan. I would prefer to get this series in as is (with the other
minor changes we discussed) as basic enablement for kernel-doc. I
volunteer to have a look into this issue and try to come up with a
better alternative afterward.

