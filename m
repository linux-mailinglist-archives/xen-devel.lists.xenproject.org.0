Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A790444A8D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 22:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221151.382713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miOGl-0001Kp-Ak; Wed, 03 Nov 2021 21:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221151.382713; Wed, 03 Nov 2021 21:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miOGl-0001IU-7c; Wed, 03 Nov 2021 21:58:07 +0000
Received: by outflank-mailman (input) for mailman id 221151;
 Wed, 03 Nov 2021 21:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5wz0=PW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1miOGj-0001IO-MH
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 21:58:05 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d8f50f4-3cf1-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 22:58:03 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6644C60EDF;
 Wed,  3 Nov 2021 21:58:01 +0000 (UTC)
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
X-Inumbo-ID: 1d8f50f4-3cf1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635976681;
	bh=MKD442ERJpq553kE5jnV7aSNqk9dxH5xuAEN+miOdOw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QAgGRNUD0xjPNW4QG6ZHJVsqyQtwoytNhmUJcX+jSBq3sr+wkONcPnD7lzRGcssAH
	 nEBA0iLs7DpGij5I2GTnKrZTVxkaeTdltMR4n5SebxO4z+hhLeQzI7dbYoilbAQ4My
	 kWTRcNpygzr3g69r/pzE4AjP/o15dZRtKodshNt171sKOgGqdI9uNbuUQ5+t4uj7ZV
	 GAuu8hI4RZJTVgF5W0nRIpvveLzA4uo0wPf2xRSXOVq09ux+avYLeZAzO9BgpyKveW
	 KOXE24j06aVr12gAir4M1HKXn5rFieOzGCZ7YZeB6o5y6zYT/4NAx1KV4ATTupzqdQ
	 R3A9bSMN2NDGQ==
Date: Wed, 3 Nov 2021 14:57:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com
Subject: Re: Arm EFI boot issue for Dom0 module listed inside subnode of
 chosen
In-Reply-To: <f4daf916-06bd-e002-8b74-be6fb45ef257@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111031457540.267621@ubuntu-linux-20-04-desktop>
References: <8A60FA62-2BAA-400B-BB53-AB3E8CCA67F1@arm.com> <alpine.DEB.2.21.2111021625160.18170@sstabellini-ThinkPad-T480s> <f4daf916-06bd-e002-8b74-be6fb45ef257@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1519837360-1635976681=:267621"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1519837360-1635976681=:267621
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 3 Nov 2021, Julien Grall wrote:
> On 02/11/2021 23:36, Stefano Stabellini wrote:
> > On Tue, 2 Nov 2021, Luca Fancellu wrote:
> > > Hi all,
> > > 
> > > We recently discovered that there is a way to list Dom0 modules that is
> > > not supported by the EFI boot,
> > > It’s happened browsing some Wiki pages like this one:
> > > https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Lager
> > > 
> > > In that page the Dom0 modules are listed inside a subnode of the /chosen
> > > node:
> > > 
> > > chosen {
> > > 
> > >      modules {
> > >          #address-cells = <1>;
> > >          #size-cells = <1>;
> > > 
> > >          module@0x72000000 {
> > >              compatible = "multiboot,kernel", "multiboot,module";
> > >              reg = <0x72000000 0x2fd158>;
> > >          };
> > > 
> > >          module@0x74000000 {
> > >              compatible = "xen,xsm-policy", "multiboot,module";
> > >              reg = <0x74000000 0x2559>;
> > >          };
> > >      };
> > > };
> > > 
> > > Instead for how it is implemented now in the EFI code and described in:
> > > 1) https://xenbits.xen.org/docs/unstable/misc/arm/device-tree/booting.txt
> > > 2) https://xenbits.xen.org/docs/unstable/misc/efi.html
> > > 
> > > Only the following approach is supported, so Dom0 modules must be a direct
> > > child of /chosen:
> 
> Do you mean this is not supported after your changes or this was never
> supported? (see more below).
> 
> > > 
> > > chosen {
> > >      #address-cells = <1>;
> > >      #size-cells = <1>;
> > > 
> > >      module@0x72000000 {
> > >          compatible = "multiboot,kernel", "multiboot,module";
> > >          reg = <0x72000000 0x2fd158>;
> > >      };
> > > 
> > >      module@0x74000000 {
> > >          compatible = "xen,xsm-policy", "multiboot,module";
> > >          reg = <0x74000000 0x2559>;
> > >      };
> > > };
> > > 
> > > Is this a problem that needs a fix?
> > 
> > 
> > Let me start by saying that I don't feel strongly either way, so I am
> > happy to go with other people's opinion on this one.
> > 
> > In this kind of situations I usually look at two things:
> > - what the specification says
> > - what the existing code actually does
> > 
> > In general, I try to follow the specification unless obviously
> > production code relies on something that contradicts the spec, in which
> > case I'd say to update the spec.
> > 
> > In this case, although it is true that "modules" could be nice to have,
> > it is missing a compatible string,
> 
> There are a few nodes in the DT without compatible (e.g. cpus, memory, chosen,
> soc). So I am a bit confused why this is a problem.

They tend to be "exceptions". Node names are usually not meaningful
except for few top-level nodes without a compatible string. Cpus, memory
and chosen are all top level nodes. I don't know about "soc", that one
should probably be compatible = "simple-bus". If you have a pointer to
an "soc" node without a compatible I'd be interested in taking a look.
No worries if you don't have it handy, I was just curious.


> > it is not described in arm/device-tree/booting.txt,
> 
> Up until Xen 4.4, we had the following sentence:
> 
> "
> Each node has the form /chosen/modules/module@<N> and contains the following
> properties:
> "
> 
> This was removed by commit af82a77f3abc "xen: arm: remove innaccurate
> statement about multiboot module path". But, IMHO, the new wording still
> doesn't explicit says the module should be directly in /chosen.

Nice work of archaeology there!


> > and it is only rarely used.
> 
> Hmmm... We have quite a few examples on the wiki that create 'module' under
> 'modules'. In fact, we have provided U-boot script [2] that can be easily
> re-used. So I would not call it rare.
> 
> > 
> > For these reasons, I don't think it is a problem that we need to fix.
> > Especially considering that the EFI case is the only case not working
> > and it was never supported until now.
> 
> Hmmm... Looking at the implementation of efi_arch_use_config_file() in 4.12,
> we are looking for the compatible "mutiboot,module". So I would say this is
> supported.
> 
> > If we want to add support for "modules", that could be fine, but I think
> > we should describe it in arm/device-tree/booting.txt and also add a
> > compatible string for it. For 4.16 
> 
> I think the first question we need to resolved is whether this has ever been
> supported in EFI. I think it was and therefore this is technically a
> regression.
> 
> That said, outside of the dom0less case, I don't expect any UEFI users will
> bother to create the nodes manually and instead rely on GRUB to create them.
> So I think breaking it would be OK.
> 
> I am less convinced about breaking it for non-UEFI case.
>
> That said, I think the documentation should be updated either way for
> 4.16 (the more if this has been broken as part of recent changes).

It would be good to clarify. If we decide to go with making it clear
that "modules" is not supported then from a device tree point of view I
think we should say that "multiboot,module" nodes for Dom0 and Xen (xsm)
are children of /chosen. I prefer this option because I think that if
we wanted to group the dom0 and/or Xen modules together (which could be
good) we could come up with something better than "modules", more
aligned with dom0less.

Otherwise we could try to add a "modules" node to the description with a
compatible string and a comment saying certain legacy versions might not
have a compatible string.


> > I'd just update the wikipage.
> 
> There are quite a few places to update on the wiki page. AFAICT, they are all
> related to U-boot, so I don't think there is an action needed here.

OK
--8323329-1519837360-1635976681=:267621--

