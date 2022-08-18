Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48D5988C0
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 18:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389686.626779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOiKA-00007z-1Y; Thu, 18 Aug 2022 16:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389686.626779; Thu, 18 Aug 2022 16:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOiK9-00005m-TK; Thu, 18 Aug 2022 16:24:49 +0000
Received: by outflank-mailman (input) for mailman id 389686;
 Thu, 18 Aug 2022 16:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+/fD=YW=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oOiK8-00005g-NR
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 16:24:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45eb6ab2-1f12-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 18:24:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB93A615A1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 16:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B039C43470
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 16:24:45 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h24so2311300wrb.8
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 09:24:45 -0700 (PDT)
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
X-Inumbo-ID: 45eb6ab2-1f12-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660839885;
	bh=NXFD9jFkOQ6+Ym6W8+5vTdTbJMZRvb8Xi37Aa0qPDYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SK+45akmrq80tGoEvjjGSX6UyHnCDueQbDBWTKVIVffhTMxnJ6f+l2ea7KY6QByxM
	 8ZXRPDfKSyBBsEO96mmYRg32nAJkHjOXGDvYd7gADdDqheXyuTWJrahBR1/CelfxLs
	 Bi1WlxixdnwizltoEtTfZLFGp8VmaCOQ4YutwaEu2rXuoM5ScrbO/AV7QtYPy1sKQs
	 5NZQZut1nXPrIkdulb2G8drsfNJUvOq+L92PXUzQGYD3njCUS32yptmbD5qA/TUmrQ
	 63VWO9gHJXJHcW7/+gwFpU5Qrep+MN0XgRzmMb4ImNOmXW0UhxD5AfW62YO23pjsaq
	 ikGXQ7PHIWwCw==
X-Gm-Message-State: ACgBeo03WJ1r3gHB3ALGVUc7DxSTXe8hvnUuzu75lzocKnhUGzN5mUzJ
	5/NxKi74lt4ERi/voj6ilJemvBfYk8e8K7usFx8=
X-Google-Smtp-Source: AA6agR4wUmC0VZaVWOkODMq7wCo33c0WNoc1EQUBvcV58Uj/gxzyfvOquzmU4k+F5Gi10pye8Gb1/ldyRBsRrfebkwc=
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id
 g9-20020a5d64e9000000b002207dd763ebmr2078232wri.590.1660839883321; Thu, 18
 Aug 2022 09:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220817105720.111618-1-leo.yan@linaro.org> <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan> <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org> <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
In-Reply-To: <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 18 Aug 2022 18:24:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
Message-ID: <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
To: Leo Yan <leo.yan@linaro.org>
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Marc Zyngier <maz@kernel.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Peter Griffin <peter.griffin@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <jgrall@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Aug 2022 at 17:49, Leo Yan <leo.yan@linaro.org> wrote:
>
> On Thu, Aug 18, 2022 at 11:04:48AM +0100, Julien Grall wrote:
>
> [...]
>
> > > > Seems it's broken for kdump/kexec if kernel boots with using DT?
> > > >
> > >
> > > EFI supports both DT and ACPI boot, but only ACPI *requires* EFI.
> > >
> > > So DT boot on hardware with affected GICv3 implementations works fine
> > > with kdump/kexec as long as EFI is being used. Using non-EFI boot and
> > > kexec on such systems will likely result in a splat on the second
> > > kernel, unless there is another mechanism being used to reserve the
> > > memory in DT as well.
> > >
> > > Maybe we should wire up the EFI_PARAVIRT flag for Xen dom0 on arm64,
> > > so that we can filter out the call above. That would mean that
> > > Xen/arm64/dom0/kexec on affected hardware would result in a splat in
> > > the second kernel as well, but whether that matters depends on your
> > > support scope.
> >
> > In the context of Xen, dom0 doesn't have direct access to the host ITS
> > because we are emulating it. So I think it doesn't matter for us because we
> > can fix our implementation if it is affected.
> >
> > That said, kexec-ing dom0 (or any other domain) on Xen on Arm would require
> > some work to be supported. OOI, @leo is it something you are investigating?
>
>
> Now I am working on automative reference platform; the first thing for
> me is to resolve the kernel oops.
>
> For long term, I think the kexec/kdump would be important to be
> supported, to be clear, so far supporting kexec/kdump for Xen/Linux is
> not priority for my work.
>
> Also thanks a lot for Ard and Mark's replying. To be honest, I missed
> many prerequisites (e.g. redistributor configurations for GIC in
> hypervisor) and seems Xen uses a different way by emulating GICv3
> controller for guest OS.  So now I am bit puzzle what's for next step
> or just keep as it is?
>

If i understand Julien's remark correctly, the dom0 GICv3 is emulated,
and so it should not suffer from the issue that we are working around
here.

Given that this workaround is still the sole user of the MEMRESERVE
API, we would like to remain free to rip it out and replace it
completely if we need to, and so implementing it in Xen is a bad idea,
especially if the issue in question does not even exist in your case.
This means that even if you do decide to support kexec, things should
work fine in spite of this warning regarding the failure to perform
the memory reservation, as the GIC can simply be reconfigured.

So perhaps we should just [conditionally] tone down the warning?

