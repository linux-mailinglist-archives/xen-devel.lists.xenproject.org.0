Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940929A1F0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 01:52:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12601.32781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXDDM-0002Xw-0k; Tue, 27 Oct 2020 00:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12601.32781; Tue, 27 Oct 2020 00:51:51 +0000
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
	id 1kXDDL-0002XX-Tw; Tue, 27 Oct 2020 00:51:51 +0000
Received: by outflank-mailman (input) for mailman id 12601;
 Tue, 27 Oct 2020 00:51:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXDDK-0002XR-Ph
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 00:51:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81e7d00f-58fe-478a-b75b-2255c36dca56;
 Tue, 27 Oct 2020 00:51:49 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8653F2076A;
 Tue, 27 Oct 2020 00:51:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXDDK-0002XR-Ph
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 00:51:50 +0000
X-Inumbo-ID: 81e7d00f-58fe-478a-b75b-2255c36dca56
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 81e7d00f-58fe-478a-b75b-2255c36dca56;
	Tue, 27 Oct 2020 00:51:49 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8653F2076A;
	Tue, 27 Oct 2020 00:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603759908;
	bh=2cj05f2qTvOdPYmIDkLVhVs8OKzu4GUW+BcubKJUduA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f1fA7PqGQ3NdYMwC5e8TAOxJ7FpQVVe1rU2D+7uIpd9pEhmTxJD4O/Ch+cs6cWdL0
	 61FFqjKm1JdFOoFrNQ0IIld13jc+I1R93GZj1V36bX+7s2OqGRW3zN0V0kIiGbbEIK
	 xkfWJ7+SoeGKKEk5+sVfVUur67O9CQxfdz2yW3UA=
Date: Mon, 26 Oct 2020 17:51:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
In-Reply-To: <bf3b65d2-2642-f1f6-39f1-2f88433e9901@xen.org>
Message-ID: <alpine.DEB.2.21.2010261726350.12247@sstabellini-ThinkPad-T480s>
References: <20201022014310.GA70872@mattapan.m5p.com> <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org> <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s> <b4ec906d-ebb6-add9-1bc0-39ab8d588026@xen.org> <alpine.DEB.2.21.2010230944090.12247@sstabellini-ThinkPad-T480s>
 <bf3b65d2-2642-f1f6-39f1-2f88433e9901@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1630026899-1603759908=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1630026899-1603759908=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 26 Oct 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/10/2020 17:57, Stefano Stabellini wrote:
> > On Fri, 23 Oct 2020, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 22/10/2020 22:17, Stefano Stabellini wrote:
> > > > On Thu, 22 Oct 2020, Julien Grall wrote:
> > > > > On 22/10/2020 02:43, Elliott Mitchell wrote:
> > > > > > Linux requires UEFI support to be enabled on ARM64 devices.  While
> > > > > > many
> > > > > > ARM64 devices lack ACPI, the writing seems to be on the wall of
> > > > > > UEFI/ACPI
> > > > > > potentially taking over.  Some common devices may need ACPI table
> > > > > > support.
> > > > > > 
> > > > > > Presently I think it is worth removing the dependancy on
> > > > > > CONFIG_EXPERT.
> > > > > 
> > > > > The idea behind EXPERT is to gate any feature that is not considered
> > > > > to be
> > > > > stable/complete enough to be used in production.
> > > > 
> > > > Yes, and from that point of view I don't think we want to remove EXPERT
> > > > from ACPI yet. However, the idea of hiding things behind EXPERT works
> > > > very well for new esoteric features, something like memory introspection
> > > > or memory overcommit.
> > > 
> > > Memaccess is not very new ;).
> > > 
> > > > It does not work well for things that are actually
> > > > required to boot on the platform.
> > > 
> > > I am not sure where is the problem. It is easy to select EXPERT from the
> > > menuconfig. It also hints the user that the feature may not fully work.
> > > 
> > > > 
> > > > Typically ACPI systems don't come with device tree at all (RPi4 being an
> > > > exception), so users don't really have much of a choice in the matter.
> > > 
> > > And they typically have IOMMUs.
> > > 
> > > > 
> > > >   From that point of view, it would be better to remove EXPERT from
> > > > ACPI,
> > > > maybe even build ACPI by default, *but* to add a warning at boot saying
> > > > something like:
> > > > 
> > > > "ACPI support is experimental. Boot using Device Tree if you can."
> > > > 
> > > > 
> > > > That would better convey the risks of using ACPI, while at the same time
> > > > making it a bit easier for users to boot on their ACPI-only platforms.
> > > 
> > > Right, I agree that this make easier for users to boot Xen on ACPI-only
> > > platform. However, based on above, it is easy enough for a developper to
> > > rebuild Xen with ACPI and EXPERT enabled.
> > > 
> > > So what sort of users are you targeting?
> > 
> > Somebody trying Xen for the first time, they might know how to build it
> > but they might not know that ACPI is not available by default, and they
> > might not know that they need to enable EXPERT in order to get the ACPI
> > option in the menu. It is easy to do once you know it is there,
> > otherwise one might not know where to look in the menu.
> 
> Right, EXPERT can now be enabled using Kconfig. So it is not very different
> from an option Foo has been hidden because the dependency Bar has not been
> selected.
> 
> It should be easy enough (if it is not we should fix it) to figure out the
> dependency when searching the option via menuconfig.

I do `make menuconfig` and there is no ACPI option. How do I even know
that ACPI has a kconfig option to enable? I'd assume that ACPI is always
enabled in the kconfig unless told otherwise.

But let's say that you know that you need to look for ACPI. I'd use the
search function, and it tells me:

  Symbol: ACPI [=n]                                                                                                                      │  
  Type  : bool                                                                                                                           │  
  Prompt: ACPI (Advanced Configuration and Power Interface) Support                                                                      │  
    Location:                                                                                                                            │  
  (1) -> Architecture Features                                                                                                           │  
    Defined at arch/arm/Kconfig:34                                                                                                       │  
    Depends on: ARM_64 [=y]
 
I go and look "Architecture Features" as told, but it is not there. How
do I need that I need to enable "Configure standard Xen features (expert
users)" to get that option?

 
> > > I am sort of okay to remove EXPERT.
> > 
> > OK. This would help (even without building it by default) because as you
> > go and look at the menu the first time, you'll find ACPI among the
> > options right away.
> 
> To be honest, this step is probably the easiest in the full process to get Xen
> build and booted on Arm.
> 
> I briefly looked at Elliot's v2, and I can't keep thinking that we are trying
> to re-invent EXPERT for ACPI because we think the feature is *more* important
> than any other feature gated by EXPERT.
> 
> In fact, all the features behind EXPERT are important. But they have been
> gated by EXPERT because they are not mature enough.

It is not as much a matter of "importance" but a matter of required for
booting. I don't think that EXPERT is really a good tool for gating
things that are required for booting. If we had something else (not
ACPI) that is required for booting and marked as EXPERT, I'd say the
same thing. The only other thing that might qualify is ITS support.


> We already moved EXPERT from a command line option to a menuconfig option. So
> it should be easy enough to enable it now. If it still not the case, then we
> should improve it.
> 
> But I don't think ACPI is mature enough to deserve a different treatment.

I fully agree ACPI is not mature.


> It would be more useful to get to the stage where ACPI can work
> without any crash/issue first. 

Yes indeed. I don't have any stake in this, given that none of my
systems have ACPI, so I'd better shut up maybe :-)


> > > But I still think building ACPI by default
> > > is still wrong because our default .config is meant to be (security)
> > > supported. I don't think ACPI can earn this qualification today.
> > 
> > Certainly we don't want to imply ACPI is security supported. I was
> > looking at SUPPORT.md and it is only says:
> > 
> > """
> > EXPERT and DEBUG Kconfig options are not security supported. Other
> > Kconfig options are supported, if the related features are marked as
> > supported in this document.
> > """
> > 
> > So technically we could enable ACPI in the build by default as ACPI for
> > ARM is marked as experimental. However, I can see that it is not a
> > great idea to enable by default an unsupported option in the kconfig, so
> > from that point of view it might be best to leave ACPI disabled by
> > default. Probably the best compromise at this time.
> From my understanding, the goal of EXPERT was to gate such features. With your
> suggestion, it is not clear to me what's the difference between "experimental"
> and option gated by "EXPERT".
> 
> Do you mind clarifying?

Ah! That's a good question actually. Is the expectation and
"experimental" in SUPPORT.md and EXPERT in Kconfig are pretty much the
same thing? I didn't think so. Let's have a look. SUPPORT.md says:

### KCONFIG Expert

    Status: Experimental


And EXPERT says:

config EXPERT
	bool "Configure standard Xen features (expert users)"
	help
	  This option allows certain base Xen options and settings
	  to be disabled or tweaked. This is for specialized environments
	  which can tolerate a "non-standard" Xen.
	  Only use this if you really know what you are doing.
	  Xen binaries built with this option enabled are not security
	  supported.
	

It seems that they are not the same: EXPERT is a *subset* of
Experimental for certain Xen options "for specialized environments" and
"expert users, which I think makes sense. ACPI is a good example of
something "experimental" but not for specialized environments.

--8323329-1630026899-1603759908=:12247--

