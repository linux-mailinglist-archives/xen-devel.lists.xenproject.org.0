Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ADB3D0F79
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 15:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159359.293132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6CFT-0005wv-2S; Wed, 21 Jul 2021 13:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159359.293132; Wed, 21 Jul 2021 13:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6CFS-0005v6-VE; Wed, 21 Jul 2021 13:26:54 +0000
Received: by outflank-mailman (input) for mailman id 159359;
 Wed, 21 Jul 2021 13:26:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tag6=MN=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m6CFR-0005v0-Pc
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 13:26:53 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1c9dbf6-5c2b-4faf-96a7-9cf267334348;
 Wed, 21 Jul 2021 13:26:53 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b26so3164118lfo.4
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 06:26:52 -0700 (PDT)
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
X-Inumbo-ID: d1c9dbf6-5c2b-4faf-96a7-9cf267334348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XLEV1G1OHX8N30wx04oggOiCX4wJRTaEhY/fKjMOoR4=;
        b=Tp0YavYGw5mYJpIzt1vHwMqoGOaH6qUXPQ5c6k0Cuyc46PKZ9NDcdUjkezlrGzPL6X
         VW+0TBCxLO9+8rlQGVt09tHbPx7YymBotMBhIZvCVKJxBccC0P6x16IFtHFb+Z7mSxd+
         5q4ni88DZA0/yvRsSCHwblDVkyZd+RaLtYg/g7suhAzIWdzbeFiTzjqKBZMUeQZ8D8SH
         j/bZJ3m0NarHGqD2haf2j5Ed89xiNxezxGt+t6NblD0AK/lSS2woar4nh9huqbzZsWfQ
         dg7B9BomKZdGLSZ/9x6OCo19212a8RAJPRFUT6Xp/thLXHiTsSk61kYOq41k0GxRW4d4
         fMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XLEV1G1OHX8N30wx04oggOiCX4wJRTaEhY/fKjMOoR4=;
        b=jK0kv3m92959g+IvOiE3MKCKxC+YvlJTBFYf9EXVUd8EHxWWsH/MRsNEndxRlIv7q9
         JmV5G6mRzeA2H5M8MWukHKS0LAORyTMkpGHG4hH/40u9EBrcTqpSUXpuyMG9WlTqM1gv
         PE6CffDc0wbre4e7RCQp2sxCBXWAvznU2K/2QOuH53noV1oXMTqY6W7btQIZEncQS6+1
         alv8bFxl5lULs4iYl3BBO7bNDKAqHCuA5VBfbAeAdYbC3DGZrpVTSb0FRtsYc0910ytK
         Q4ORakyZS2gGYwDvKtyh2VmpSix9HeIRAVY4PpX/wFxsSRFptvvxWktbohOh7DrehZ1r
         bG0g==
X-Gm-Message-State: AOAM532W9yLFTcBTL7XdV2ruOK1ovkGGCY+xdiG57P6KhBvGtHGntQaF
	7N1CGfpDXI0n8zeuvnl1ZYGHcKMY+4ko7GfbiPM=
X-Google-Smtp-Source: ABdhPJwkObpYVWD8S8Nwb0DG8GuWS3z19ETDKvSyH4lr8Zw8pMAo4qfoYXyb2hcLdMhcvsnpe14W27eb5FOcqCHjPpg=
X-Received: by 2002:a05:6512:3d28:: with SMTP id d40mr25248573lfv.562.1626874012004;
 Wed, 21 Jul 2021 06:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
 <CAKf6xpucqRp5Db6z0J7PLbTVxBZThn7j2Mjvjn9z7nJ5Lf5F_g@mail.gmail.com> <24824.6179.909691.713305@mariner.uk.xensource.com>
In-Reply-To: <24824.6179.909691.713305@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 21 Jul 2021 09:26:40 -0400
Message-ID: <CAKf6xptO4mrZHxwr9mFPx-x=o5g_DbHLrEKMgwCpSDqHAUEgqw@mail.gmail.com>
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
To: Ian Jackson <iwj@xenproject.org>
Cc: Scott Davis <scottwd@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Scott Davis <scott.davis@starlab.io>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 8:50 AM Ian Jackson <iwj@xenproject.org> wrote:
>
> Jason Andryuk writes ("Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg"):
> > I think this option actually sets the string, so you want "Set
> > B<STRING> as the device-model stubdomain kernel command line." or
> > something equivalent?
> >
> > With a suitable change,
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>
> Does it then override an existing commandline calculated by libxl ?

Today, libxl doesn't handle a command line string for the stubdom
kernel, so it defaults to an empty string.

> Often people want to just add an option, so a config setting to append
> things is useful (but one to override it completely is useful too).

Yes, they can both be useful.  Append is sufficient until you want to
override or remove an option that is already included.  Set can be
tedious since you have to copy the existing options before appending
your new one.

Anyway, I just wanted the documentation to match the implementation.
Looks like xl.cfg.5.pod.in says Append for cmdline/root/extra, so
Scott was repeating that.  Looking around, aside from concatenating
root and extra in xl_parse.c:parse_cmdline(), libxl doesn't seem to
calculate command lines.  If libxl is reserving the right to calculate
cmdline in the future, then keeping Append is fine by me.

Regards,
Jason

