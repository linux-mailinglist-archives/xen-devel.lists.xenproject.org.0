Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E550153E5CE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 18:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342654.567723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyG3I-0001uy-IT; Mon, 06 Jun 2022 16:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342654.567723; Mon, 06 Jun 2022 16:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyG3I-0001ry-FO; Mon, 06 Jun 2022 16:58:04 +0000
Received: by outflank-mailman (input) for mailman id 342654;
 Mon, 06 Jun 2022 16:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BfO3=WN=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nyG3H-0001rs-4j
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 16:58:03 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2cb4155-e5b9-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 18:58:01 +0200 (CEST)
Received: by mail-ot1-x335.google.com with SMTP id
 f9-20020a9d2c09000000b0060bf1fa91f4so3961827otb.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jun 2022 09:58:01 -0700 (PDT)
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
X-Inumbo-ID: d2cb4155-e5b9-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ppm3GrxvJwEnNEauVXNoAW5TIJNNp56oxbhAKdsNZMg=;
        b=ouRIAQGbIvSRxuiIoxiBxOqePqwzGCNocbGL1MRXuBJfDRftNNmwROsteWE90Ib9VN
         QLMjFD5UxI7OrUkjHEYvXpU0Xg/7+KfJ7ZCfe7WRfxf6j7j2OwtD1YKnKjMybcmqZhVk
         UCAGADAgx/si41FNtsZ1R232B4v3Km/Nl9FvfQQtw/2SasQv094JTaRzNpzL8it/jGwU
         fQW8xgkwPR/R9AezkWoI3iVJZ8itZ34+qgR85ABER6a2N5lTWClP1uLABKcko/JHvK4A
         1fQdthrUr8iPxhjVk8uL10aWhlm/oyWwHLy6DlIwWtNGOtlFo6ieHk3pAUVPaqsB+fnj
         r64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ppm3GrxvJwEnNEauVXNoAW5TIJNNp56oxbhAKdsNZMg=;
        b=gSpYiy8TGLNEZ9UdNts+3em8wlGJJhgU/E5geQc9/+VxdCu/Ea6G45VL3viOWGL7r/
         rK8JO6SY022Fu718whlgxHtgqgz6tq5SO8jXWLHG7Bc923fC5jszhVcXYogMJjX1KDka
         zNKcCMsEov0cCzS3Y/Pp1goiX2B7fwBW8R2QQgLS/ZPng1vL6hwKfbnOAuWdHN9Q/Tv8
         yx0sfE2LypwscyztA1KnG0gQKoTvwJXAqn66AmWWCh0AlUcwHpwxHyhf3kShjy1rzR0B
         xDIbD8z4oARnh7f9hmmoKH8Ok9B9uqNY4FATET9AmXbUDe+yUbTld2Rf7O26w9bjwg8g
         Sfaw==
X-Gm-Message-State: AOAM530kiDKE/Sk7NqvQboQofjDjRII5FD7H6B4m3j2jMj4A+BgsBAaY
	TAkLTh2b8mTMu5MWwhgbp5jfNV51yRQUaVscjjqU3OXuvKV5Sw==
X-Google-Smtp-Source: ABdhPJx5wfsbyttE6EtMN0PpFUqQPjjcqUsz09nvDqDEdnms+pmJWJ+hO2u5jVBbwIzroqgiHhLGu5Isjr4UsVMEnmI=
X-Received: by 2002:a9d:5c01:0:b0:60b:f1fc:3a04 with SMTP id
 o1-20020a9d5c01000000b0060bf1fc3a04mr4629804otk.204.1654534680462; Mon, 06
 Jun 2022 09:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
 <8d45d05dae0b5a2aa62120c7ff62295319a74478.1654486751.git-series.marmarek@invisiblethingslab.com>
 <CABfawhn7XGoMRb9LsSwNyaCb92KD5jC4juM+NwOMyOntOgo5pg@mail.gmail.com>
 <Yp4JLd8UGS3jjD5Z@mail-itl> <CABfawhmz3+EJZ6qrqKOQ==Hmm93i+a4WBk8FcbOaBSxmaM3New@mail.gmail.com>
In-Reply-To: <CABfawhmz3+EJZ6qrqKOQ==Hmm93i+a4WBk8FcbOaBSxmaM3New@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 6 Jun 2022 12:57:26 -0400
Message-ID: <CABfawhkkGr6Lp4SBEw7nsqfUs28QEqoCuVgTRBg9ZUCirLW5_g@mail.gmail.com>
Subject: Re: [RFC PATCH 01/12] drivers/char: Add support for Xue USB3 debugger
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 6, 2022 at 10:10 AM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> On Mon, Jun 6, 2022 at 10:03 AM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Mon, Jun 06, 2022 at 09:32:52AM -0400, Tamas K Lengyel wrote:
> > > > +/* Supported xHC PCI configurations */
> > > > +#define XUE_XHC_CLASSC 0xC0330ULL
> > > > +#define XUE_XHC_VEN_INTEL 0x8086ULL
> > > > +#define XUE_XHC_DEV_Z370 0xA2AFULL
> > > > +#define XUE_XHC_DEV_Z390 0xA36DULL
> > > > +#define XUE_XHC_DEV_WILDCAT_POINT 0x9CB1ULL
> > > > +#define XUE_XHC_DEV_SUNRISE_POINT 0x9D2FULL
> > > > +#define XUE_XHC_DEV_CANNON_POINT 0x9DEDULL
> > >
> > > I had to add an extra device ID here to get it working on my NUC,
> > > would be nice if we could add that to the list of supported configs s=
o
> > > I don't need to custom patch:
> > >
> > > #define XUE_XHC_DEV_COMET_LAKE 0x02EDULL
> > >
> > > The patch is here:
> > > https://github.com/tklengyel/xen/commit/dd0423aba6caa4ef41dff65470598=
a1c0c1105ae
> >
> > Interesting, I think known_xhc() is used only in the EFI variant of Xue=
.
> > Xen one just looks for any XHC based on the device class. And indeed, I
> > works for me on Tiger Lake that is not included here.
> >
> > I did need to select specific controller, since I have 3 of them:
> > 00:0d.0 USB controller: Intel Corporation Tiger Lake-LP Thunderbolt 4 U=
SB Controller (rev 01)
> > 00:0d.2 USB controller: Intel Corporation Tiger Lake-LP Thunderbolt 4 N=
HI #0 (rev 01)
> > 00:14.0 USB controller: Intel Corporation Tiger Lake-LP USB 3.2 Gen 2x1=
 xHCI Host Controller (rev 20)
> >
> > So, I need dbgp=3Dxue2 or dbgp=3Dxue@pci00:14.0.
>
> Interesting! OK, I'll give that a shot and see if it works that way
> for me too, it's certainly been a while since I last tested :)

Yeap, with console=3Ddbgp dbgp=3Dxue@pci00:14.0 it works as expected.
Xen's boot does hang if you don't have a debug cable connected or if
the other end is not plugged into the right USB3 port. Not sure if
that behavior is documented anywhere. Once I found the right USB3 port
on the machine that receives the debug output it started booting and
everything works expected (ie. one-way communication only).

Tamas

