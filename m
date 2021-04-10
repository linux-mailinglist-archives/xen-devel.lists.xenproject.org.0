Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B935F35AEF6
	for <lists+xen-devel@lfdr.de>; Sat, 10 Apr 2021 17:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108219.206602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVFxX-00079r-2M; Sat, 10 Apr 2021 15:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108219.206602; Sat, 10 Apr 2021 15:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVFxW-00079V-VN; Sat, 10 Apr 2021 15:55:42 +0000
Received: by outflank-mailman (input) for mailman id 108219;
 Sat, 10 Apr 2021 15:55:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkbf=JH=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lVFxW-00079Q-75
 for xen-devel@lists.xenproject.org; Sat, 10 Apr 2021 15:55:42 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52d7f38b-acc4-44ef-882b-972ba4c8544e;
 Sat, 10 Apr 2021 15:55:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b4so14436323lfi.6
 for <xen-devel@lists.xenproject.org>; Sat, 10 Apr 2021 08:55:40 -0700 (PDT)
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
X-Inumbo-ID: 52d7f38b-acc4-44ef-882b-972ba4c8544e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kaurunJOW3GvxHGKNAXvkHbr+QbCN1WTyDCD7fyvilg=;
        b=l4/uIYoUScHQb+RSKMo1uElfv5F5k2e25cLeUmkBDFbzY9RGOo/hgKJIEwBRzs4QXv
         BKCk2xHng0rD2GC2qysrImaKsEeSFeSA7YYgdkzLnBNgjFBZ88yPLKvM8Xc59XCJaRkA
         l9fbWWT7Dluu7YMI7OBXPJsa9ASQH1pi0F/EEzE2+XkmYKHsiUkvK9xCYLErg3Q8ZxHS
         hLwk1fcCMYhM/COW/cBw8mxbFkRoxWyX7n+HvWAfaMSjiCyjrMj0lGEFsxLhSiVqV0xy
         fnCMb109Ntx757LbqUFUzK5KzCnINY3GevuJLxbjk5H6LQHsAvPt87q3TRwwSnQfcGCH
         2J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kaurunJOW3GvxHGKNAXvkHbr+QbCN1WTyDCD7fyvilg=;
        b=WctJWlaZkJqH2GAPEpIKV38GnJQNk7EULm79uNt+1CH4mGt5SHJvdFPl4WlGsSbKyu
         IgtP4SzxbmOC2HaX1SpGjD5hTvVqLtNxjd7nSE1anr/yh/uQ+VeiBT/3q5sTvcRYrE7m
         dItEVumBiABQ0YJOvx+lvi34qKkAq5vfi+5mGRrl7mVz/Q4g7aBYPLlYVkcB4+hyjoF8
         MxDwGyJyBD2BRYNMQ3tJexdb2PFaAAKxaJBALKW0IaLAdY4nXSwG0RPg268/Nqo9bxCc
         YRaQNr8wTzCtsIiBbGdWQwghZJzWSJoUJo43Uae27y4qCSXo1lH8CFKJlCW/wJJTFPRK
         6Jyg==
X-Gm-Message-State: AOAM533qeiyef0lP5njLqfAjjQH3i4siHsrAgQojZAV96M++ssIndJA1
	9FtvXfyNjqP10Yecmo5ggwaIbEMlTX+LaqgIxhU=
X-Google-Smtp-Source: ABdhPJzE++6vehK1NID/LT8ON6swiSM3wG4HzT2xJH2zRXzDPjGwpR5h4ag77zwxmNnWz6+svA7Hu9dVVYXQHnKRk4A=
X-Received: by 2002:a19:c302:: with SMTP id t2mr13508061lff.150.1618070139798;
 Sat, 10 Apr 2021 08:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <602469f5-1028-8f36-7195-f102b6d2af0c@tabit.pro>
 <427bfd62-48c0-5859-7300-c618331b4e5a@citrix.com> <20200922133047.4646b2ab62cszn46@liuwe-devbox-debian-v2>
In-Reply-To: <20200922133047.4646b2ab62cszn46@liuwe-devbox-debian-v2>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 10 Apr 2021 11:55:28 -0400
Message-ID: <CAKf6xpsOfM=PSFW6sUx5yozmEji9f5t2p+5+mrpX_2cOqGBOmQ@mail.gmail.com>
Subject: Re: [PATCH] libxl: User defined max_maptrack_frames in a stub domain
To: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Dmitry Fedorov <d.fedorov@tabit.pro>, 
	xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 22, 2020 at 9:31 AM Wei Liu <wl@xen.org> wrote:
>
> On Mon, Sep 14, 2020 at 04:27:45PM +0100, Andrew Cooper wrote:
> > On 14/09/2020 15:50, Dmitry Fedorov wrote:
> > > Hi,
> > >
> > > Implementing qrexec+usbip+qemu in Linux-based stub domain leads me to
> > > an issue where a device model stub domain doesn't have maptrack entries.
> > >
> > > Would it be possible to apply a user defined max_maptrack_frames value
> > > to dm_config in the same way as for max_grant_frames?
> > >
> > > Signed-off-by: Dmitry Fedorov <d.fedorov@tabit.pro>
> >
> > This looks entirely reasonable.
> >
> > CC'ing the maintainers for their opinion.
> >
>
> Looks fine to me.
>
> Acked-by: Wei Liu <wl@xen.org>

Hi,

Wei, looks like you Acked but did not apply this patch.  And after the
libs rename, the file paths no longer match.  Do you want to fix this
up, or should Dmitry re-submit?

Regards,
Jason

> > ~Andrew
> >
> > > ---
> > >  tools/libxl/libxl_dm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
> > > index f2dc5696b9..f044f2566c 100644
> > > --- a/tools/libxl/libxl_dm.c
> > > +++ b/tools/libxl/libxl_dm.c
> > > @@ -2292,7 +2292,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc,
> > > libxl__stub_dm_spawn_state *sdss)
> > >      dm_config->b_info.target_memkb = dm_config->b_info.max_memkb;
> > >
> > >      dm_config->b_info.max_grant_frames =
> > > guest_config->b_info.max_grant_frames;
> > > -    dm_config->b_info.max_maptrack_frames = 0;
> > > +    dm_config->b_info.max_maptrack_frames =
> > > guest_config->b_info.max_maptrack_frames;
> > >
> > >      dm_config->b_info.u.pv.features = "";
> > >
> > > --
> > > 2.26.2
> > >
> > >
> >
>

