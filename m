Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656805B9CC0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407423.649946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpfW-00008u-OV; Thu, 15 Sep 2022 14:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407423.649946; Thu, 15 Sep 2022 14:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpfW-00005Z-KT; Thu, 15 Sep 2022 14:16:42 +0000
Received: by outflank-mailman (input) for mailman id 407423;
 Thu, 15 Sep 2022 14:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaaQ=ZS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1oYpfV-00005T-3x
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:16:41 +0000
Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com
 [198.54.122.105]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0334041a-3501-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 16:16:39 +0200 (CEST)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id AC86718000A9
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 10:16:37 -0400 (EDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 8712018000A4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 10:16:37 -0400 (EDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-3321c2a8d4cso222291827b3.5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 07:16:37 -0700 (PDT)
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
X-Inumbo-ID: 0334041a-3501-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1663251397;
	bh=fAcQ92HRAYdVimKlK+uqkmFsfjVtOfVJWk9TUw4Gge0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WO3JE8gRm6u3+FUDavA8b2j27gZIWEl6ZgvEParG4m21fkPEu8u6HnZRJZLAEXHBp
	 QvpbtZd6peERlKe3ATcUr5q3oqpaXhUUBilSVmVsbYovWvAEkl1/JLsDyxM2bnjJ3y
	 Gf2+pwVfqY3fS8DLw/inJuP3EFXUPiU81haV7l8vR/HXter0RiCJMb3KU9SUs/e9bU
	 uJKH6PfUYuAEGJ9uXL/fPUW2gYreh54jnNW5jmuJSxZ/uhSyRS0Ud1ez0ZyOo/d68S
	 rIATTcQELQSRU/tv90tmZEFF0YPDNRJd2NOa74yJNL34g0f1pEbz0WlKvBrF2Ok19l
	 vX/Ay0tg7/8bQ==
X-Gm-Message-State: ACrzQf02qXk9R7r9XPOqoFKaST9N6pQpwmr15XRhgBD+wmRF7uDeEf9p
	xN72L7RxISIlGZc9teXG8ruVIf94h5ux8BZ91F0=
X-Google-Smtp-Source: AMsMyM42+qYKtuotJxuZlXRUwuv+sHkQpOK3KNYCKA8ab3IAAcN2CbkWpIjzfDIQkeRww954ouRjBuJzcx/0xsDrzKA=
X-Received: by 2002:a81:840f:0:b0:345:efb:1a2a with SMTP id
 u15-20020a81840f000000b003450efb1a2amr22098ywf.204.1663251396704; Thu, 15 Sep
 2022 07:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl> <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com> <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
In-Reply-To: <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 15 Sep 2022 10:16:00 -0400
X-Gmail-Original-Message-ID: <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
Message-ID: <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
Subject: Re: Console output stops on dbgp=xhci
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Sep 15, 2022 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.09.2022 16:05, Tamas K Lengyel wrote:
> > On Thu, Sep 15, 2022 at 3:56 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 15.09.2022 02:41, Tamas K Lengyel wrote:
> >>>>> Do you have any idea what might be going on and preventing the output
> >>>>> from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
> >>>>> present on the receiving side, just nothing is being received over it.
> >>>>
> >>>> There are few more patches in the series that are de facto required.
> >>>> Especially those about IOMMU, otherwise it can only possibly work with
> >>>> iommu=0 (which I'm not sure if even is enough).
> >>>
> >>> Unfortunately with iommu=0 Xen doesn't boot at all for me. I see this
> >>> on the console:
> >>>
> >>> (XEN) Panic on CPU 0:
> >>> (XEN) FATAL PAGE FAULT
> >>> (XEN) [error_code=0011]
> >>> (XEN) Faulting linear address: 00000000328b3a54
> >>
> >> Perhaps in another thread, could you post details about this? I guess
> >> we want to address this independent of your XHCI issue. That's an
> >> attempt to execute code outside of the Xen image - the only reason I
> >> can think of for this would be an EFI boot services or runtime
> >> services call, with (possibly but not necessarily) quirky EFI firmware.
> >> Any other context this is appearing in would quite certainly require a
> >> fix in Xen, and I don't see how "iommu=0" could affect the set of EFI
> >> calls we make.
> >
> > This was indeed observed with a xen.efi booted directly from UEFI.
> > Beside the limited boot log I get through xhci I don't have more
> > insight but happy to send that (and anything else you think would be
> > useful).
>
> And with "iommu=0" but no use of XHCI it doesn't crash? Or there you have
> no way to collect the log then?
>
> In any event, from your description the interesting part might be the
> EFI memory map. That ought to be pretty stable between boots, so you may
> be able to collect that in full via "xl dmesg" in a run without "iommu=0".

I see the same crash with no xhci debug use. The EFI map is:

(XEN) EFI memory map:

(XEN)  0000000000000-000000009bfff type=7 attr=000000000000000f

(XEN)  000000009c000-000000009dfff type=2 attr=000000000000000f

(XEN)  000000009e000-000000009efff type=0 attr=000000000000000f

(XEN)  000000009f000-000000009ffff type=4 attr=000000000000000f

(XEN)  0000000100000-00000175a6fff type=7 attr=000000000000000f

(XEN)  00000175a7000-00000175e6fff type=4 attr=000000000000000f

(XEN)  00000175e7000-0000021e9efff type=7 attr=000000000000000f

(XEN)  0000021e9f000-0000028587fff type=2 attr=000000000000000f

(XEN)  0000028588000-000002ab79fff type=1 attr=000000000000000f

(XEN)  000002ab7a000-000002bcd7fff type=7 attr=000000000000000f

(XEN)  000002bcd8000-000002c6cafff type=2 attr=000000000000000f

(XEN)  000002c6cb000-000002cd8cfff type=4 attr=000000000000000f

(XEN)  000002cd8d000-000002cdcefff type=7 attr=000000000000000f

(XEN)  000002cdcf000-000002ce77fff type=4 attr=000000000000000f

(XEN)  000002ce78000-000002ced4fff type=7 attr=000000000000000f

(XEN)  000002ced5000-000002ced7fff type=4 attr=000000000000000f

(XEN)  000002ced8000-000002cedafff type=7 attr=000000000000000f

(XEN)  000002cedb000-000002cedcfff type=4 attr=000000000000000f

(XEN)  000002cedd000-000002ceddfff type=7 attr=000000000000000f

(XEN)  000002cede000-000002e179fff type=4 attr=000000000000000f

(XEN)  000002e17a000-000002e194fff type=3 attr=000000000000000f

(XEN)  000002e195000-000002e1bffff type=4 attr=000000000000000f

(XEN)  000002e1c0000-000002e1c9fff type=3 attr=000000000000000f

(XEN)  000002e1ca000-000002e1e3fff type=4 attr=000000000000000f

(XEN)  000002e1e4000-000002e1edfff type=3 attr=000000000000000f

(XEN)  000002e1ee000-000002e1f2fff type=4 attr=000000000000000f

(XEN)  000002e1f3000-000002e20dfff type=3 attr=000000000000000f

(XEN)  000002e20e000-000002e22cfff type=4 attr=000000000000000f

(XEN)  000002e22d000-000002e22efff type=3 attr=000000000000000f

(XEN)  000002e22f000-000002e233fff type=4 attr=000000000000000f

(XEN)  000002e234000-000002e236fff type=3 attr=000000000000000f

(XEN)  000002e237000-000002e23dfff type=4 attr=000000000000000f

(XEN)  000002e23e000-000002e23ffff type=3 attr=000000000000000f

(XEN)  000002e240000-000002e245fff type=4 attr=000000000000000f

(XEN)  000002e246000-000002e246fff type=3 attr=000000000000000f

(XEN)  000002e247000-000002e24bfff type=4 attr=000000000000000f

(XEN)  000002e24c000-000002e250fff type=3 attr=000000000000000f

(XEN)  000002e251000-000002e26afff type=4 attr=000000000000000f

(XEN)  000002e26b000-000002e29dfff type=3 attr=000000000000000f

(XEN)  000002e29e000-000002e2d4fff type=4 attr=000000000000000f

(XEN)  000002e2d5000-000002e2d5fff type=3 attr=000000000000000f

(XEN)  000002e2d6000-000002e2e6fff type=4 attr=000000000000000f

(XEN)  000002e2e7000-000002e2e7fff type=3 attr=000000000000000f

(XEN)  000002e2e8000-000002e2f8fff type=4 attr=000000000000000f

(XEN)  000002e2f9000-000002e2fbfff type=3 attr=000000000000000f

(XEN)  000002e2fc000-000002e30efff type=4 attr=000000000000000f

(XEN)  000002e30f000-000002e30ffff type=3 attr=000000000000000f

(XEN)  000002e310000-000002e320fff type=4 attr=000000000000000f

(XEN)  000002e321000-000002e340fff type=3 attr=000000000000000f

(XEN)  000002e341000-000002e341fff type=4 attr=000000000000000f

(XEN)  000002e342000-000002e352fff type=3 attr=000000000000000f

(XEN)  000002e353000-000002e3edfff type=4 attr=000000000000000f

(XEN)  000002e3ee000-000002e3f4fff type=3 attr=000000000000000f

(XEN)  000002e3f5000-000002e40bfff type=4 attr=000000000000000f

(XEN)  000002e40c000-000002e417fff type=3 attr=000000000000000f

(XEN)  000002e418000-000002e42efff type=4 attr=000000000000000f

(XEN)  000002e42f000-000002e42ffff type=3 attr=000000000000000f

(XEN)  000002e430000-000002e440fff type=4 attr=000000000000000f

(XEN)  000002e441000-000002e444fff type=3 attr=000000000000000f

(XEN)  000002e445000-000002f56cfff type=4 attr=000000000000000f

(XEN)  000002f56d000-000002f588fff type=3 attr=000000000000000f

(XEN)  000002f589000-0000031ca5fff type=4 attr=000000000000000f

(XEN)  0000031ca6000-0000031f71fff type=7 attr=000000000000000f

(XEN)  0000031f72000-0000032a95fff type=3 attr=000000000000000f

(XEN)  0000032a96000-0000034f95fff type=0 attr=000000000000000f

(XEN)  0000034f96000-0000035215fff type=9 attr=000000000000000f

(XEN)  0000035216000-0000035323fff type=10 attr=000000000000000f

(XEN)  0000035324000-0000035efefff type=6 attr=800000000000000f

(XEN)  0000035eff000-0000035ffefff type=5 attr=800000000000000f

(XEN)  0000035fff000-0000035ffffff type=4 attr=000000000000000f

(XEN)  0000100000000-00008c07fffff type=7 attr=000000000000000f

(XEN)  00000000a0000-00000000fffff type=0 attr=0000000000000000

(XEN)  0000036000000-0000039ffffff type=0 attr=000000000000000f

(XEN)  000003a000000-000003affffff type=0 attr=0000000000000009

(XEN)  000003b000000-000003f7fffff type=0 attr=0000000000000000

(XEN)  00000e0000000-00000efffffff type=11 attr=8000000000000001

(XEN)  00000fc000000-00000fc01ffff type=11 attr=800000000000100d

(XEN)  00000fe000000-00000fe010fff type=11 attr=8000000000000001

(XEN)  00000fec00000-00000fec00fff type=11 attr=8000000000000001

(XEN)  00000fed00000-00000fed00fff type=11 attr=8000000000000001

(XEN)  00000fed20000-00000fed7ffff type=0 attr=0000000000000000

(XEN)  00000fee00000-00000fee00fff type=11 attr=8000000000000001

(XEN)  00000ff000000-00000ffffffff type=11 attr=800000000000100d

(XEN) alt table ffff82d0406953b0 -> ffff82d040697686

