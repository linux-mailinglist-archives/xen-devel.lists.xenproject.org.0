Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7183AA480
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 21:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143518.264453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltbRb-0001FB-BC; Wed, 16 Jun 2021 19:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143518.264453; Wed, 16 Jun 2021 19:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltbRb-0001DM-7A; Wed, 16 Jun 2021 19:43:23 +0000
Received: by outflank-mailman (input) for mailman id 143518;
 Wed, 16 Jun 2021 19:43:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ltbRa-0001DG-Ag
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 19:43:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60a7a4f4-7cae-44e4-878f-a8b8ad831aa8;
 Wed, 16 Jun 2021 19:43:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34428610CA;
 Wed, 16 Jun 2021 19:43:20 +0000 (UTC)
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
X-Inumbo-ID: 60a7a4f4-7cae-44e4-878f-a8b8ad831aa8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623872600;
	bh=Tv+VlQHMa9PphzjEUQvV8mYdb7RPlUZ7Ia9IIGJ92Zs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qRUXzEzhGlSZ3FtiDtK+a0JBksN6Fuvx2oXZbLBOi7wEgny6mxwAHdMrYeQlbay6S
	 2RRtcu+ehRGv6C/jdEj0LjiePdFHN/AUfgVoJNU0cd+apeW/dZ2/hmt2Faji3M0VO2
	 3HyslkSiTmVYvYBm9ktc9wnDYXFcyUcWTQjnLAxjeOdaHj5fRpqObS1hxgFKt70bTV
	 VW1iF/r5vF7NuNXQak05iJu/4XLWpMczV2p97GFPtXxUwzMhUWklV6MDyHUeoMcHSG
	 HEoGfFqyq6qlwaKIvF3pMcH+/ifNQGXRdTiwDE10E7flGpkg33YDNp7xzXAbx/+TyI
	 jjxbmAvI0BOEA==
Date: Wed, 16 Jun 2021 12:43:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Konstantina Chremmou <konstantina.chremmou@citrix.com>
cc: Ian Jackson <iwj@xenproject.org>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@citrix.com>, 
    Chandrika Srinivasan <chandrika.srinivasan@citrix.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    Rob Hoes <Rob.Hoes@citrix.com>, "Li Zhang (3P)" <Li.Zhang@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: RE: [PATCH] code-of-conduct.rst: Add Stefano Stabellini as a Conduct
 Team member
In-Reply-To: <DM6PR03MB356233FB38691977790D2E0EF00F9@DM6PR03MB3562.namprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2106161242300.24906@sstabellini-ThinkPad-T480s>
References: <20210616151430.224739-1-george.dunlap@citrix.com> <4df84ee7-6c79-03c3-dac4-32de3595e861@citrix.com> <24778.8917.652550.796651@mariner.uk.xensource.com> <DM6PR03MB356233FB38691977790D2E0EF00F9@DM6PR03MB3562.namprd03.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Thank you all for the support!


On Wed, 16 Jun 2021, Konstantina Chremmou wrote:
> +1
> 
> -----Original Message-----
> From: Ian Jackson <iwj@xenproject.org> 
> Sent: 16 June 2021 5:12 PM
> To: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Cc: George Dunlap <George.Dunlap@citrix.com>; xen-devel@umich.edu; Wei Liu <wl@xen.org>; Jan Beulich <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Paul Durrant <paul@xen.org>; Owen Smith <owen.smith@citrix.com>; Chandrika Srinivasan <chandrika.srinivasan@citrix.com>; Christian Lindig <christian.lindig@citrix.com>; Konstantina Chremmou <konstantina.chremmou@citrix.com>; Rob Hoes <Rob.Hoes@citrix.com>; Li Zhang (3P) <Li.Zhang@citrix.com>
> Subject: Re: [PATCH] code-of-conduct.rst: Add Stefano Stabellini as a Conduct Team member
> 
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> Andrew Cooper writes ("Re: [PATCH] code-of-conduct.rst: Add Stefano Stabellini as a Conduct Team member"):
> > On 16/06/2021 16:14, George Dunlap wrote:
> > > With my upcoming leave, Ian will be the only person actively on the 
> > > Conduct Team.  Stefano has volunteered to join the team, so that 
> > > there are at least two members.
> ...
> > +1
> 
> +1
> 

