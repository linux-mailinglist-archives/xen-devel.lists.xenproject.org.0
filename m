Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6CB1E2223
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 14:42:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdYtf-0006Iv-7o; Tue, 26 May 2020 12:41:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N6lx=7I=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdYte-0006Iq-JK
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 12:41:30 +0000
X-Inumbo-ID: 355e72e8-9f4e-11ea-9dbe-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 355e72e8-9f4e-11ea-9dbe-bc764e2007e4;
 Tue, 26 May 2020 12:41:24 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 93C19122804;
 Tue, 26 May 2020 14:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590496883;
 bh=mxUxU5t9xa4Ak/X6Fq1E38zK1T3h4xJHYO9Uxz717QI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N/ttzeYNqHDj/uLecT8xdoCkI9UMRPxwZHYz66WxZcWhHiY7NXIPaTQAXr/eJRFSV
 AoSSP3IQLc5TnXHgXgF2Gzgc1UU7Js0PAgoxfptStuy/LMz1ABWXiY+vbtlswr0Adw
 F577C6xq+ylyGDBmNJuTrKg/J0gJh4Xx6lHdcDNV4vsKgFxYmTp8rqPx5tlWwijepS
 KOqj0tW84V1ElpBIFhIoZ591GNNArX7IOa6l3to7Z0zS6mArfLBZGMScjzoohQxaaN
 0gFr6hUdsZ6RAFjLRxzDC0lSTelvrFuTm9sSVRBfEFBLjFRK4Ke6zftaeR1MmMcZnC
 i3nm4WMLwux1w==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 7A7D6268436E; Tue, 26 May 2020 14:41:23 +0200 (CEST)
Date: Tue, 26 May 2020 14:41:23 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Mail-Followup-To (was Re: Xen PVH domU start-of-day VCPU state)
Message-ID: <20200526124123.GA25283@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <36363b39-c8c1-82bf-af37-f0d917844bb4@citrix.com>
 <20200526115446.GA24386@nodbug.lucina.net>
 <14a27bd6-7013-2cbb-e202-05f0b32caf9a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14a27bd6-7013-2cbb-e202-05f0b32caf9a@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, 26.05.2020 at 12:58, Andrew Cooper wrote:
> On 26/05/2020 12:54, Martin Lucina wrote:
> > On Tuesday, 26.05.2020 at 11:58, Andrew Cooper wrote:
> >> On 26/05/2020 09:52, Martin Lucina wrote:
> >>> On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
> >>>> On 25/05/2020 17:42, Jürgen Groß wrote:
> >>>>> You need to setup virtual addressing and enable 64 bit mode before using
> >>>>> 64-bit GDT.
> >>>>>
> >>>>> See Mini-OS source arch/x86/x86_hvm.S
> >>>> Or
> >>>> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
> >>>>
> >>>> But yes - Juergen is correct.  Until you have enabled long mode, lgdt
> >>>> will only load the bottom 32 bits of GDTR.base.
> >>> Ah, I missed Jurgen's and your reply here.
> >> So the mailing list is doing something evil and setting:
> >>
> >> Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
> >>     =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
> >>     xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
> >>     anil@recoil.org, dave@recoil.org
> >>
> >> which causes normal replies to cut you out.
> > I _think_ I've fixed this, it was due to ancient Mutt configuration (using
> > xensource.com / xen.org !?) for xen-devel at my end.
> >
> > Dropped the other direct Ccs to lessen the noise, but I have no real way of
> > testing without replying, so here goes.
> 
> Sorry - still no luck.  Had to add you back in manually.

How about now?

-mato

