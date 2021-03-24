Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC7348145
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 20:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101153.193280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP8to-0000cr-AO; Wed, 24 Mar 2021 19:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101153.193280; Wed, 24 Mar 2021 19:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP8to-0000cR-6t; Wed, 24 Mar 2021 19:10:36 +0000
Received: by outflank-mailman (input) for mailman id 101153;
 Wed, 24 Mar 2021 19:10:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDsp=IW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lP8tm-0000cM-R6
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 19:10:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff786bb9-3224-49e8-9c50-a7378defb61b;
 Wed, 24 Mar 2021 19:10:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AA8F61A02;
 Wed, 24 Mar 2021 19:10:32 +0000 (UTC)
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
X-Inumbo-ID: ff786bb9-3224-49e8-9c50-a7378defb61b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616613033;
	bh=UONJN0cilkIBDoBEFZiaM2uw0/0sCmD3z6DW/Qhnu40=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=okW+RlTRrjTB4Vw7gTb8u5J0y4W53BVg4M5enk0Fi6wko5qwz2gA3OMcjCHU75K20
	 p8KzdoZXdEWbj5QQ0WGrmuZsbRuPXPn7AEnb82F0RMfKVSzHD1uDp4nh1WlV0xsX6n
	 tVKRpYU2M8iCxuF5Chc7aGKVRbVqFAkcZgNQT3YfaYyUX6DyyGOdV3FwwSsj4yG4UJ
	 LV4vBqlvxHzzOtoxXPEgR22Bg25sutubSdXgNHgwhat4Q8siIYAjbmLzcE8RKwGK95
	 YRgUHu3fe0VgqaDo3y78GhiqsDjeBGHRexJcDH5RbrBZoZDkg3aq5T3LMpGwJ3GyAM
	 sPEwz+ZK2seMA==
Date: Wed, 24 Mar 2021 12:10:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Julien Grall <jgrall@amazon.com>, 
    Julien Grall <Julien.grall.oss@gmail.com>, iwj@xenproject.org, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Rich Persaud <persaur@gmail.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, luca.fancellu@arm.com, 
    paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
In-Reply-To: <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2103241206430.439@sstabellini-ThinkPad-T480s>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com> <20210316031814.10311-2-dpsmith@apertussolutions.com> <YFODOnQRAntdETY7@Air-de-Roger> <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com> <YFrxznV1kXeXsRCa@Air-de-Roger>
 <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Mar 2021, Christopher Clark wrote:
> > > > I'm also not sure how you are going to handle things like SR-IOV
> > > > devices. Right now SR-IOV capability is setup and initialized by the
> > > > hardware domain, and the new virtual devices are notified to Xen once
> > > > setup is done. Do you plan to move those bits into Xen, so that it can
> > > > setup and initialize the SR-IOV capability?
> > >
> > > While you could do it with the vPCI, as you point out this will not work
> > > for SR-IOV. With hyperlaunch, these cases will require the use of a boot
> > > domain, which is for all intents and purposes, a lightweight/restricted
> > > toolstack domain.
> > >
> > > The boot domain will have to do the necessary operations to ensure that
> > > when startup is finished, PCI passthrough will be successfully setup.
> > > Note, this may have to include the boot domain unpausing the hardware
> > > domain to help complete the setup before the boot domain can exit and
> > > allow the remaining domains to come online.
> >
> > OK, I was expecting hyperlaunch to do all domain creation in the
> > hypervisor.
> 
> That is my expectation too. It is what we've been planning for in our
> work so far but we can work on explaining the steps involved in
> constructing the domains more clearly.
> 
> > If you offload domain creation of guests with
> > pci-passthrough devices to a control domain and/or hardware domain,
> > I'm not sure I see the difference from normal domain creation, ie:
> > it's no longer something specific to hyperlaunch, as I could achieve
> > the same by using the existing xendomains init script.
> 
> So that's not what we've proposed, and hopefully not what we'll need to do.
> 
> Do you know if there is a need to perform work to support the
> assignment of PCI devices at the point of domain creation (ie. in
> domain_create), rather than handling it in a later step of domain
> configuration, prior to the domain being started?

Let's leave SR-IOV aside for a moment that can be a bit strange (if I
recall correctly sometimes VFs can only appear after the PF driver has
been loaded).

Just for my understanding, for regular PCI passthrough, why is it
important that the device assignment is done later by the control
domain, instead of straight away at domain creation by Xen?

I am fine either way but I meant to ask if it is just to make the
implementation easier or if there is some kind of policy involved.

