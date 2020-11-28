Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27E2C6F4A
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 08:59:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39854.72908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiv8W-0005PF-Og; Sat, 28 Nov 2020 07:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39854.72908; Sat, 28 Nov 2020 07:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiv8W-0005Oq-LU; Sat, 28 Nov 2020 07:59:16 +0000
Received: by outflank-mailman (input) for mailman id 39854;
 Sat, 28 Nov 2020 07:59:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Sga=FC=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kiv8U-0005Oh-Jm
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 07:59:14 +0000
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e82116d-3edf-4cba-9b27-ff542b1763f4;
 Sat, 28 Nov 2020 07:59:13 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id q5so6336580qkc.12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2020 23:59:13 -0800 (PST)
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
X-Inumbo-ID: 2e82116d-3edf-4cba-9b27-ff542b1763f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g6TwH1mAsGEvpO10D1ozDkWdXriqYEzkcHX3VrHAXfo=;
        b=h880v3+VZ+X2TRoR4qjQL30o0ema8uM5rktJS927fexqI3U/K9FJpMsBJ+P7Zv/FiU
         q5kdxMVUIq086+Ue3acsmNX3YqMBCOA6JGhTNufdcndPnT3o7fYGDM/FlxOVPF1M9E55
         PlsePgQ6cXbQPk1ArCrjg7zJ3D3Mb6oaiqbeJQicbHAygzfdCxuyId108MW2L0dBP5n+
         JbN2W3CkMIllwFctvgeZ0G1l25BE9ZNjt39+HFwUcXyCtpnDv3qUToH9G/R1Z7cb6fMO
         sVek+dDfKryOpDwo6DJyQmSeQgKyttm5jKes/vuRhSdKr2+wGTQ8xuEXGIzc5AEUOcr6
         GbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g6TwH1mAsGEvpO10D1ozDkWdXriqYEzkcHX3VrHAXfo=;
        b=jzHa8bmiTdtRwVYQyKNxaFdvJXQHliJ4VImhhzlWqEEvXYj3n03YCg9dPq2lcmPEyd
         d4QOJgr7ZdEZNxKcF+5fXD4xuKtqPyRENv1kxLrZir31XxgXbM0AQmXNXjqbzWbJ37X6
         aI+1Qo9aKydJPf23m3CXTVT1IMRVfeXtnMMKFQ5w04ffyjwx63rIx7qb619pMjzfZC5M
         KFjHHZPbmEz9lMzsMMYTS68yJfwXbExNnMndau9hxlw6pGKxRnck+PbVzZCE6wamwQYy
         s7b6P1J9iO7iddSS2Wo7t+LiT2CPxByEfbl27QQ8ukfj0bQasYgwmf7bcjD4q2uoB/tC
         674Q==
X-Gm-Message-State: AOAM531EYb2vUEOQJkQw/bCz1MnPKRTfmPrSuH+ve1sBWGwygW4qU7qt
	umk4cdYUvEPcWj5ZENp+j0CdXQvUsVXR83yRSNIBBA==
X-Google-Smtp-Source: ABdhPJyoPxhXeDn4leCEjmmQJ1whU30j0GXX3jzrxIQvxHGmgd51/PS7TtrDLO3wLKyBz+vfCefvNiBZPMufn4Hw1KA=
X-Received: by 2002:a37:6546:: with SMTP id z67mr12564751qkb.22.1606550353466;
 Fri, 27 Nov 2020 23:59:13 -0800 (PST)
MIME-Version: 1.0
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com> <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>
 <X73ghKgQEXLv2z2p@mattapan.m5p.com> <CAMmSBy-Qdpj+6FAk9D15=+87_=68T80Y1NGnvyAB=tOFveifiQ@mail.gmail.com>
 <X73owDP0UXx+lvJd@mattapan.m5p.com> <alpine.DEB.2.21.2011251051240.7979@sstabellini-ThinkPad-T480s>
 <X78irfLB6DQhkPvd@mattapan.m5p.com>
In-Reply-To: <X78irfLB6DQhkPvd@mattapan.m5p.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 27 Nov 2020 23:59:10 -0800
Message-ID: <CAMmSBy_4ry2DwMNT1Ai1-11wBHHuO71muvkfEWLRV=h0QiKyoA@mail.gmail.com>
Subject: Re: Xen on RP4
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 7:36 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> On Wed, Nov 25, 2020 at 10:57:31AM -0800, Stefano Stabellini wrote:
> > On Tue, 24 Nov 2020, Elliott Mitchell wrote:
> > > My testing section for Xen is:
> > >     xen_hypervisor /boot/xen-4.14-arm64.efi
> > >     xen_module /boot/vmlinuz-5.8.10-2rp4-6.1.7 root=UUID=01234567-dead-beef-d13d-456789abcdef ro
> > >     devicetree /boot/dtb-5.8.10-2rp4-6.1.7
> > >     xen_module --nounzip /boot/initrd.img-5.8.10-2rp4-6.1.7
> > >
> > > I've frankly got no idea how to ensure the correct device-tree is passed
> > > to Xen.  Is GRUB's `devicetree` command correct when loading Xen?  Is a
> > > device-tree matched to the Linux kernel appropriate for Xen?
> > >
> > > (I'm guessing the second is "yes", but the first I don't have a clue)
> >
> > Yes, devicetree is correct. I have not used the graphical output, so I
> > cannot help you there but yes the best bet is to use the devicetree that
> > comes with the kernel.
>
> Well, I've now got everything together for a "proper" Debian Raspberry PI
> installation.  Apparently since 5.2 (perhaps earlier, but 5.2 is
> confirmed), Debian's kernel source packages have had their Raspberry PI
> device-trees garbled.  I do have full untouched Linux kernel source
> handy, but I tend to stick with the distribution until that proves
> untenable.

Yup. Same here. I started with upstream kernel, wasted a lot of time,
threw in the towel
and imported all of the RPi Foundation patches wholesale :-(

Thanks,
Roman.

