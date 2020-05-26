Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287B51E2228
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 14:44:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdYwR-0006bG-1k; Tue, 26 May 2020 12:44:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N6lx=7I=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdYwP-0006aN-1B
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 12:44:21 +0000
X-Inumbo-ID: 9dacff18-9f4e-11ea-a636-12813bfff9fa
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9dacff18-9f4e-11ea-a636-12813bfff9fa;
 Tue, 26 May 2020 12:44:19 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id B40E5122804;
 Tue, 26 May 2020 14:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590497058;
 bh=DCk1HFmCWgmAdqJZvcRKU/bEbj5+p//dr2VZiaADZ60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N1gUJLExhUISbdI+NDunp+bQwwnT9Cq+5rDSIAmeSQVlGRi3crYWxNPl8fUJA10qZ
 gTAxHtBti9DrgLOzYQ0lXII72lJV+us9sxX10Mzr3D+ywFax69ZH//XpF2PP4J37J6
 7OnPy7Nvu5dJKbTqJ74QeEgg3/BKbweMSGGR/fNocOE710B20Jkmv5031JQf6fczFF
 M1nhuEB2IPCaEWuf1VwDdt4S+w5RSwoksOTzPV477EFDXAKcDxKzS1t0D8AOWNiUu6
 lkUt9MysCtp+Go/vdTExZ8+k3PBNbjweY20uNCyjfO3PYBXgFQ2PZ893Ru2s7wKgXy
 YmsDo7J8NgbMA==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 984BC268436E; Tue, 26 May 2020 14:44:18 +0200 (CEST)
Date: Tue, 26 May 2020 14:44:18 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Mail-Followup-To (was Re: Xen PVH domU start-of-day VCPU state)
Message-ID: <20200526124418.GB25283@nodbug.lucina.net>
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
 <20200526124123.GA25283@nodbug.lucina.net>
 <a6a7f5f7-6a96-3477-2239-bdd13eb00395@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6a7f5f7-6a96-3477-2239-bdd13eb00395@citrix.com>
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

On Tuesday, 26.05.2020 at 13:42, Andrew Cooper wrote:
> On 26/05/2020 13:41, Martin Lucina wrote:
> > On Tuesday, 26.05.2020 at 12:58, Andrew Cooper wrote:
> >> On 26/05/2020 12:54, Martin Lucina wrote:
> >>> On Tuesday, 26.05.2020 at 11:58, Andrew Cooper wrote:
> >>>> On 26/05/2020 09:52, Martin Lucina wrote:
> >>>>> On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
> >>>>>> On 25/05/2020 17:42, Jürgen Groß wrote:
> >>>>>>> You need to setup virtual addressing and enable 64 bit mode before using
> >>>>>>> 64-bit GDT.
> >>>>>>>
> >>>>>>> See Mini-OS source arch/x86/x86_hvm.S
> >>>>>> Or
> >>>>>> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
> >>>>>>
> >>>>>> But yes - Juergen is correct.  Until you have enabled long mode, lgdt
> >>>>>> will only load the bottom 32 bits of GDTR.base.
> >>>>> Ah, I missed Jurgen's and your reply here.
> >>>> So the mailing list is doing something evil and setting:
> >>>>
> >>>> Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
> >>>>     =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
> >>>>     xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
> >>>>     anil@recoil.org, dave@recoil.org
> >>>>
> >>>> which causes normal replies to cut you out.
> >>> I _think_ I've fixed this, it was due to ancient Mutt configuration (using
> >>> xensource.com / xen.org !?) for xen-devel at my end.
> >>>
> >>> Dropped the other direct Ccs to lessen the noise, but I have no real way of
> >>> testing without replying, so here goes.
> >> Sorry - still no luck.  Had to add you back in manually.
> > How about now?
> 
> That works.

Ok, TIL that I've been doing "subscribe" vs. "lists" in Mutt wrong. Here's
a good explanation of how it's intended to work:

https://lists.debian.org/debian-user/2003/05/msg05016.html

TL;DR if you want a Mail-Followup-To, use "lists", otherwise use
"subscribe".

-mato

