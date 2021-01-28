Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E2E308060
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 22:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77471.140325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ei6-0003wE-SR; Thu, 28 Jan 2021 21:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77471.140325; Thu, 28 Jan 2021 21:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ei6-0003vp-PE; Thu, 28 Jan 2021 21:20:14 +0000
Received: by outflank-mailman (input) for mailman id 77471;
 Thu, 28 Jan 2021 21:20:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PalS=G7=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l5Ei4-0003vk-Sr
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 21:20:12 +0000
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33d56585-0432-4e3a-8684-95c17e8267c1;
 Thu, 28 Jan 2021 21:20:11 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id rv9so9867935ejb.13
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 13:20:11 -0800 (PST)
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
X-Inumbo-ID: 33d56585-0432-4e3a-8684-95c17e8267c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xr/AYR5AS5VfQ9CkBWnrcSZ2NlIftma9Wmk8hR5umPY=;
        b=Rr9mnmyei57Mh5I2/D380QS0TgrLOWnPuF2MUvoHZWiwkParzTMDVMP4e88DM1JZDB
         GjAT/oeUyGRvwWJulJVnSpjhpjFWOp2KMxVib5LeRa4ZTpeAfP5YU2Y/O5/aXrzqv0k9
         sjJYdPuIvcL408RMhnKdZ4B8SivpcUNQSIhp6q9PLtGQgLJPaMAjUbx1DBTdCZkrToDV
         f4p1HDzvIVJOW4gTpkfNedIHXF0vQ6I9oooSBkJYz9OpE6DT5MYV1/3pn67EUhbmDb4+
         ajULk9R3YUu3ehkB70HDnh/r+a6tuv7Hsdx9pbmjotLZ/pwTBouUisghAmqaSMv20+2J
         PNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xr/AYR5AS5VfQ9CkBWnrcSZ2NlIftma9Wmk8hR5umPY=;
        b=hR3Ohh189EUIhKQJeBrGZpf3X9A2+qSgEGOgcWWjSGdnvR5f4clQnHZZ0SZOaKx8EU
         UWRBPXiYjjYS5SjVfSaJgQhuWz2KvXAzkSA2+MjKoR7kRmRqLUJhSnhsLlGic+Az2vz1
         hmpYNatucoaTgC/dH3MgvBW1zj6TZF7svaRGudSxL8Ylq6gND1+gp8uJolatY6ecICJ5
         jpv2Px0KUKi+7QdSA1xZLcDVkZnNw9Xb7pcByy8NAi4Kuirc9GYkLk7vmrL/UKJ/9r+d
         Ypbx+I4dshZsuG6MoIAVKhEg3gOv6LdRP63nzT6GebKZ8ZqmtgJU7JX/VmkwxAD5M8cT
         pItQ==
X-Gm-Message-State: AOAM531b+Kji3m1Av8Hk5ERayI0ludvLEThBsO7MZt8xRB9MUYT67sv3
	uXhzNvEE9MYaDe1s2854J61jnrmIC5zVMDmQKmE=
X-Google-Smtp-Source: ABdhPJwCHPVhSw4mEwXpdUA1mwOJkEfFti6JuelEhTOIrwQy4ldgs2HvsqAMxTuLPwJ/JZ2wxnRf91EoUDh2mjW2Jpg=
X-Received: by 2002:a17:906:a082:: with SMTP id q2mr1364945ejy.483.1611868810465;
 Thu, 28 Jan 2021 13:20:10 -0800 (PST)
MIME-Version: 1.0
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <ca1375c7-852d-fb3a-6895-5ef12ea7a01e@xen.org> <alpine.DEB.2.21.2101280919590.9684@sstabellini-ThinkPad-T480s>
 <1bdfda04-5954-a285-db0f-3f1633e5fd2e@xen.org> <5fa7024d-b259-3507-c708-676c52c13c68@citrix.com>
 <9d0e2e0a-4409-ee37-636b-a0403e3571fc@xen.org> <8c980248-f516-b41d-2699-2bc23ba49d53@citrix.com>
In-Reply-To: <8c980248-f516-b41d-2699-2bc23ba49d53@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 28 Jan 2021 21:19:59 +0000
Message-ID: <CAJ=z9a11DzO8j0Hs+ZPVujF1enDXeTLLCTeQ1L1-MuHY3nBuYQ@mail.gmail.com>
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, 
	Artem Mygaiev <joculator@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Jan 2021 at 20:10, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 28/01/2021 18:16, Julien Grall wrote:
> > Hi Andrew,
> >
> > On 28/01/2021 18:10, Andrew Cooper wrote:
> >> On 28/01/2021 17:44, Julien Grall wrote:
> >>>
> >>>
> >>> On 28/01/2021 17:24, Stefano Stabellini wrote:
> >>>> On Thu, 28 Jan 2021, Julien Grall wrote:
> >>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
> >>>>>    > Patch series [8] was rebased on recent "staging branch"
> >>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is
> >>>>>> unmapped) and
> >>>>>> tested on
> >>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio
> >>>>>> disk
> >>>>>> backend [9]
> >>>>>> running in driver domain and unmodified Linux Guest running on
> >>>>>> existing
> >>>>>> virtio-blk driver (frontend). No issues were observed. Guest domain
> >>>>>> 'reboot/destroy'
> >>>>>> use-cases work properly. Patch series was only build-tested on x86.
> >>>>>
> >>>>> I have done basic testing with a Linux guest on x86 and I didn't
> >>>>> spot any
> >>>>> regression.
> >>>>>
> >>>>> Unfortunately, I don't have a Windows VM in hand, so I can't confirm
> >>>>> if there
> >>>>> is no regression there. Can anyone give a try?
> >>>>>
> >>>>> On a separate topic, Andrew expressed on IRC some concern to
> >>>>> expose the
> >>>>> bufioreq interface to other arch than x86. I will let him explain
> >>>>> his view
> >>>>> here.
> >>>>>
> >>>>> Given that IOREQ will be a tech preview on Arm (this implies the
> >>>>> interface is
> >>>>> not stable) on Arm, I think we can defer the discussion past the
> >>>>> freeze.
> >>>>
> >>>> Yes, I agree that we can defer the discussion.
> >>>>
> >>>>
> >>>>> For now, I would suggest to check if a Device Model is trying to
> >>>>> create an
> >>>>> IOREQ server with bufioreq is enabled (see ioreq_server_create()).
> >>>>> This would
> >>>>> not alleviate Andrew's concern, however it would at allow us to
> >>>>> judge whether
> >>>>> the buffering concept is going to be used on Arm (I can see some use
> >>>>> for the
> >>>>> Virtio doorbell).
> >>>>>
> >>>>> What do others think?
> >>>>
> >>>> Difficult to say. We don't have any uses today but who knows in the
> >>>> future.
> >>>
> >>> I have some ideas, but Andrew so far objects on using the existing
> >>> bufioreq interface for good reasons. It is using guest_cmpxchg() which
> >>> is really expensive.
> >>
> >> Worse.  Patch 5 needs to switch cmpxchg() to guest_cmpxchg() to avoid
> >> reintroducing XSA-295, but doesn't.
> >
> > The memory is only shared with the emulator (we don't allow the legacy
> > interface on Arm).
>
> Excellent.
>
> > So why do you think it is re-introducing XSA-295?
>
> Because the Xen security model considers "stubdomain can DoS Xen" a
> security issue.
>
> Yes - I know that right now, it will only be the hardware domain which
> can use acquire_resource on ARM, but eventually we'll fix the
> refcounting bug, and lifting the "translate && !hwdom" restriction would
> be the thing that actually reintroduces XSA-295.

By refcounting bugs, are you referring to mapping foreign pages in a
domain? If so, on Arm, we always increment the reference counter on
the foreign page during the map request. The reference will be
released when the emulator unmap it. Therefore, we don't need the
restriction "translate && !hwdom" (see patch #16 [1]).

In addition to that, patch #13 [2] is replacing the cmpxchg() with
guest_cmpxchg() to prevent XSA-295 from reappearing.

So unless I am missing something, the two security issues you
mentioned are already covered by this series.

Cheers,

[1]  https://lore.kernel.org/xen-devel/1611601709-28361-17-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/1611601709-28361-14-git-send-email-olekstysh@gmail.com/

