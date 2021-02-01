Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE52230B2A5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 23:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80162.146404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6hSn-00005z-DB; Mon, 01 Feb 2021 22:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80162.146404; Mon, 01 Feb 2021 22:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6hSn-00005c-A8; Mon, 01 Feb 2021 22:14:29 +0000
Received: by outflank-mailman (input) for mailman id 80162;
 Mon, 01 Feb 2021 22:14:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTc=HD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6hSl-00005X-Qv
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 22:14:27 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e734d697-f43a-46d2-8722-8d8448923f1e;
 Mon, 01 Feb 2021 22:14:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id o5so649868wmq.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 14:14:26 -0800 (PST)
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
X-Inumbo-ID: e734d697-f43a-46d2-8722-8d8448923f1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TW6/+i6xxLsh0EqOzgpV/nui3BqyZzoaQpTf8n/t8Fo=;
        b=Cf7LpT0pqUxYYkmIY/8zzH+AjPGoFVdwEtbm0JMG9nDPPj/mEnaH08powxAAjOi2k+
         m7xqDIoKlQKxsxXyYxmbnf0HYAu7kaImc4pHFMakfW4znAWeeOImGXOreajYwME+6+rt
         8DPdiaTwb/TWmSr3y144x3hEXYLOKMX7eRIqkP5Afz51vIibDT2WNVTTmijViVPY+sN9
         CdsNCXSr+JsczQkCtB6OtGK3iUO890KUEKxW6EGxf4sldyFKTAt8dpy7mbRY7rzlhvAk
         zZv/gDRdvO5siw8JpwDuHGamNLRUDemGZ7lJ6S7PDyQaEABKBRX1XRZeSBjz+WrTVGTV
         1jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TW6/+i6xxLsh0EqOzgpV/nui3BqyZzoaQpTf8n/t8Fo=;
        b=revZRlP+Rgo96oQBN3KqriRAhLmHaBgJA7TgxPHlre0CVFGD6gtoXpp5Dbh9Jq8tz9
         Mb7C5wif0yRNRqMzq9Xa3u7qaTfcm+l/M9KX2NqmyVV7r9SVu5jJt9y9vuLHowSEw8Gl
         j+vMHL9LpJVkGSpA351z34sNvugCJ7DV6VRuHddD4OaImTUE8oIK13JaKTXU4K2TP9yF
         rRaZtM4r4ig1xw9RM62gJdr7IfqX9ok9f373d7ysJW/RDvChtK2Ya5OSWZEdLhLj1bg1
         dkdSkkbPnhYXCDx70GyKqWi7inn8BPLXFm6keQhcCXIIJN1jClzq+3k57QcaG40S0+3R
         fBGA==
X-Gm-Message-State: AOAM533jNlJVKtSTQ+NzW8Wa8XHgUC9IuNT243WbtT5Btfe3GWaYIKqj
	vYm4Yc9ZY1iUG93PuiDH49N0s27wi9+ogieCXWA=
X-Google-Smtp-Source: ABdhPJwKQ+p2lSjCC8U2eSOiulb3ai5FDO3HKkOsTFN5/4H52/RjazbxKdTXx4bdhqggkxygrYtAHCEzvqJzJmgIv+s=
X-Received: by 2002:a05:600c:214d:: with SMTP id v13mr824621wml.186.1612217666007;
 Mon, 01 Feb 2021 14:14:26 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
 <YBeXfWf8lQ2nwMtI@mattapan.m5p.com> <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com>
 <YBhxmo5sFyTs/XTr@mattapan.m5p.com>
In-Reply-To: <YBhxmo5sFyTs/XTr@mattapan.m5p.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 1 Feb 2021 17:13:48 -0500
Message-ID: <CABfawhmWDGM3bNQ3K_GRbnOmHoE1nT=-V8w8NkeceQqMB-Zfgg@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 4:24 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> On Mon, Feb 01, 2021 at 10:23:34AM -0500, Tamas K Lengyel wrote:
> > On Mon, Feb 1, 2021 at 12:54 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > On Sun, Jan 31, 2021 at 09:43:13PM -0500, Tamas K Lengyel wrote:
> > > > No output from dom0 received even with the added console options
> > > > (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> > > > c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> > > > with 4.19 next.
> > >
> > > So, their current HEAD.  This reads like you've got a problematic kernel
> > > configuration.  What procedure are you following to generate the
> > > configuration you use?
> > >
> > > Using their upstream as a base and then adding the configuration options
> > > for Xen has worked fairly well for me (`make bcm2711_defconfig`,
> > > `make menuconfig`, `make zImage`).
> > >
> > > Notably the options:
> > > CONFIG_PARAVIRT
> > > CONFIG_XEN_DOM0
> > > CONFIG_XEN
> > > CONFIG_XEN_BLKDEV_BACKEND
> > > CONFIG_XEN_NETDEV_BACKEND
> > > CONFIG_HVC_XEN
> > > CONFIG_HVC_XEN_FRONTEND
> > >
> > > Should be set to "y".
> >
> > Yes, these configs are all set the same way for all Linux builds by the script:
> >         make O=.build-arm64 ARCH=arm64
> > CROSS_COMPILE=aarch64-none-linux-gnu- bcm2711_defconfig xen.config
> >
> > I tried with both the rpi-5.10.y and rpi-5.9.y, neither boot up as
> > dom0. So far only 4.19 boots.
>
> So you're using a scripted procedure to generate the configuration.  The
> actual kernel configuration is saved in the file ".config" in the build
> directory.  Could you confirm whether those are actually being set?
>
> Try running `grep -eCONFIG_PARAVIRT -eCONFIG_XEN_DOM0 -eCONFIG_XEN
> -eCONFIG_HVC_XEN -eCONFIG_HVC_XEN_FRONTEND .config`, those 5 must
> be "=y".  Various kernel configuration options depend upon others, so
> there could be potential you need to set one before those get enabled.

These options are all set, it was one of the first things I did was to
confirm in the actual config file. There is no output from 5.9 or
5.10. With 4.19 and 5.4 there is, but only 4.19 actually manages to
boot to a workable state.

Tamas

