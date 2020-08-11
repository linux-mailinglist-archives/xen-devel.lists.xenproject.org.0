Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8EF24177B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 09:42:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5OvE-0001b7-R0; Tue, 11 Aug 2020 07:42:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrfz=BV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5OvD-0001az-9U
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 07:42:11 +0000
X-Inumbo-ID: 74b323f7-1a81-4fc9-b82a-be93835b4198
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74b323f7-1a81-4fc9-b82a-be93835b4198;
 Tue, 11 Aug 2020 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597131731;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WSu7s2Lf8kXyXplp0k91hWyufrO1ODj/KA72M7I4wVY=;
 b=HdacQdX+f9DGi/gi/qSx7qXct0bT68QtF6hGD3a/vQodKGjEWlkJ7yTA
 36PaE91SPYyJqZShADgrzOAkTBEJOeu+s7XxXbE4zkVpK976aFdVecXdz
 xUlJqzmnItaELDPTbtX1Uq1xov7DISxgENVhjWGKcidSUvwPVOCXQazQO Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yoNpL3MbJDz7hb1vtBl3wTTeyXOH6O/zGiqTmrR2DOgQGToQbJySWkPkyAZqLRUWCyZusn+Q9A
 ygOCIOyQW02WiZsB0gAwtgpa7/Q55p+KhUWjYF80MWiC+sUF85boFWDPKS+6Vz/XAxRo7aG0oh
 9dvVVwvrrvQJKOVPXICqha/Tn3OaW3rgNGOpqtoZakJVWk2Xl0qK+TjixsFpA0UBa0gmOe13i3
 ziO1db3lawOfnZy8w6Wy+puckM9RAXTk2l0Dx7UL7evRjb20/6JFY+LYvbhlE1QOKHgvsUNCPo
 9h8=
X-SBRS: 2.7
X-MesageID: 24235665
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,460,1589256000"; d="scan'208";a="24235665"
Date: Tue, 11 Aug 2020 09:41:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: RESCHEDULED Call for agenda items for Community Call, August 13
 @ 15:00 UTC
Message-ID: <20200811074158.GA22095@Air-de-Roger>
References: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
 <40615946-FF55-48DB-91FB-58DD603FDD69@citrix.com>
 <9bfef1bf-31a7-1c95-60fa-2ca665942fda@suse.com>
 <047B12C2-71AA-459F-853C-DF1CD040D6C1@citrix.com>
 <37d5e973-7645-d4eb-7bd6-f8d3226d7cb5@suse.com>
 <b72f7526-4874-b29b-39d3-913b2b62799b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b72f7526-4874-b29b-39d3-913b2b62799b@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 03, 2020 at 03:18:08PM +0200, Jan Beulich wrote:
> On 31.07.2020 14:35, Jan Beulich wrote:
> > On 31.07.2020 14:27, George Dunlap wrote:
> >>> On Jul 31, 2020, at 1:25 PM, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 30.07.2020 17:41, George Dunlap wrote:
> >>>>> On Jul 30, 2020, at 4:17 PM, George Dunlap <George.Dunlap@citrix.com> wrote:
> >>>>>
> >>>>> Hey all,
> >>>>>
> >>>>> The community call is scheduled for next week, 6 August.  I, however, will be on PTO that week; I propose rescheduling it for the following week, 13 August, at the same time.
> >>>>>
> >>>>> The proposed agenda is in ZZZ and you can edit to add items.  Alternatively, you can reply to this mail directly.
> >>>>
> >>>> Sorry, in all my manual templating I seem to have missed this one.  Here’s the URL:
> >>>>
> >>>> https://cryptpad.fr/pad/#/3/pad/edit/9c58993a08fe97451f0a5b6c8bb906b1/
> >>>
> >>> I get "This link does not give you access to the document". Maybe a
> >>> permissions problem? I've meant to add a "minimum toolchain versions"
> >>> topic ...
> >>
> >> Try this one?
> >>
> >> https://cryptpad.fr/pad/#/2/pad/edit/VlLdjiw7iBm0R-efOMyCY+Ks/
> > 
> > Ah yes, this one works. Thanks.
> 
> And over the weekend I realized that the week of the 13th I'm going to be
> on PTO, so very likely won't be able to make the call. Not sure what to
> suggest you do with the topic ...

Maybe we can postpone to the next call?

I think you have strong opinions on the topic, so it won't seem fair
to have the discussion without you present.

Roger.

