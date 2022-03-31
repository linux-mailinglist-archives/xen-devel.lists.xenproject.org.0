Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F0C4EDEE8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 18:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297037.505839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZxmQ-0004bI-Ig; Thu, 31 Mar 2022 16:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297037.505839; Thu, 31 Mar 2022 16:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZxmQ-0004YU-Fi; Thu, 31 Mar 2022 16:36:14 +0000
Received: by outflank-mailman (input) for mailman id 297037;
 Thu, 31 Mar 2022 16:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR9h=UK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZxmP-0004YO-KF
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 16:36:13 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acb7dc48-b110-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 18:36:11 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id v12so528393ljd.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Mar 2022 09:36:11 -0700 (PDT)
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
X-Inumbo-ID: acb7dc48-b110-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vz6V7NDzAK8ul9bNLxeg5qB1GRW45PBYLuRXsRjj4z8=;
        b=dmc9Qt5TPOUN4JdV6YeMZ6mQfLv0zDZMsa+F4CwBFIP2yS0AJVxaSuOsifdizXDq3M
         CxXpCDeDDCtOJ42Z0+I1SZcfSzArVQvMcd8NJQvvOM5iDjlw0IyY4KP1mvDiCvo4UwaD
         EVURdoe2K9rk5E4vscJFV6OpEhL+Qev5EY4btufQgKSXj0cu7fSdmQigQVoorGpPMkbk
         kCf8906JW9pFT6ze+gnmf2kRAcVmTOe4G7Kt99O9vDBMQcRz8uesH9dzjZqTCidntBp9
         A8jSwfLzZDaQB9u8Zu+CCWGl98N3HhtpnEJvwuvqMngqwjk4VPC62rIuHdANhjAw/fOT
         8LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vz6V7NDzAK8ul9bNLxeg5qB1GRW45PBYLuRXsRjj4z8=;
        b=XXvAjz1m2zqy0yzrbgfiOVyStN9A0OWClWsEUGtLgLcqu5PoggA4btJLAOmwkIClC/
         19e5QD4AiqknOKOaRPH9e04vK0HpBHZVJTW9COifwX0S8s0p/vmZZKVE4wMheUM/Z6uG
         Xf/Dy8T1Dsr5+fdtuLMqq3HazQurB7vxCw/ATfiEgiUxK38d/tMcx1CHT6KXfg1wUW6S
         QqCSZG/BGnmn93pw5yGhwFulwHR5CSe7hPicitp/MH1LY4uLkW3jHb0J/zeY69J9Pbzv
         Eu/bqAqOzywTmQM78ui+pv6PA3BG6ciFo8mb4i5sLJ6gmXBHbBc03mRGivlY5/0OVeEo
         XzGA==
X-Gm-Message-State: AOAM532MiClH3vW+B0TpDbBSv4MdL4CIZ6VzvL62FyDqR6CmkilVlk0t
	3y1ElP6v+qOG4ApfBB4kQGEJQUxXkY5ZMs5i+10=
X-Google-Smtp-Source: ABdhPJxH1hkPaiirQ5EQuAdZ18zIALQvZrLsyF6/vhuvTdvPDq6iOgw+0acVS8UE4OSQhbowYq1nXM6D37sWXRuhD+E=
X-Received: by 2002:a2e:b0c9:0:b0:24a:fb55:8661 with SMTP id
 g9-20020a2eb0c9000000b0024afb558661mr1980993ljl.168.1648744571188; Thu, 31
 Mar 2022 09:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181727.30303-1-jandryuk@gmail.com> <YkW2OGC5T4pE7lGW@perard.uk.xensource.com>
In-Reply-To: <YkW2OGC5T4pE7lGW@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 31 Mar 2022 12:35:58 -0400
Message-ID: <CAKf6xptJ+1YPZ2wC9mECiPXfgq5siwPSx+cMO1-WQe=QRQRDow@mail.gmail.com>
Subject: Re: [PATCH] libxl: Don't segfault on soft-reset failure
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 10:10 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Wed, Mar 30, 2022 at 02:17:27PM -0400, Jason Andryuk wrote:
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index 15ed021f41..631caa416d 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -1970,7 +1970,8 @@ static void domcreate_complete(libxl__egc *egc,
> >      libxl_domain_config *const d_config = dcs->guest_config;
> >      libxl_domain_config *d_config_saved = &dcs->guest_config_saved;
> >
> > -    libxl__xswait_stop(gc, &dcs->console_xswait);
> > +    if (dcs->console_xswait.path)
> > +        libxl__xswait_stop(gc, &dcs->console_xswait);
>
> libxl__xswait_stop() needs to be called here. It's a function that can
> be called several time without ill effect, as long as `console_xswait`
> is initialised properly (by calling libxl__xswait_init() like you did
> below.
>
> >      libxl__domain_build_state_dispose(&dcs->build_state);
> >
> > @@ -2176,6 +2177,10 @@ static int do_domain_soft_reset(libxl_ctx *ctx,
> >                                aop_console_how);
> >      cdcs->domid_out = &domid_out;
> >
> > +    /* Initialize in case we end up in domcreate_complete without calling
> > +     * initiate_domain_create. */
>
> That comment isn't needed. This is just part of the initialisation of
> `cdcs->dcs`.
>
> > +    libxl__xswait_init(&cdcs->dcs.console_xswait);
> > +
> >      dom_path = libxl__xs_get_dompath(gc, domid);
> >      if (!dom_path) {
> >          LOGD(ERROR, domid, "failed to read domain path");
>
>
> As part of the patch, could you also move the libxl__xswait_init() call
> in initiate_domain_create() to do_domain_create()? That would avoid
> `console_xswait` been initialised twice, and do_domain_create() is the
> function that initialise `dcs` before calling initiate_domain_create().

Sure, that all sounds good.  Thanks!

Regards,
Jason

