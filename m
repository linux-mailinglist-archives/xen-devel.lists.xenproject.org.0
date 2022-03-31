Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320EE4EDB98
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 16:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297003.505773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvek-0006FX-Gy; Thu, 31 Mar 2022 14:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297003.505773; Thu, 31 Mar 2022 14:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvek-0006Da-Ce; Thu, 31 Mar 2022 14:20:10 +0000
Received: by outflank-mailman (input) for mailman id 297003;
 Thu, 31 Mar 2022 14:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR9h=UK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZvei-00069S-TC
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 14:20:08 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaad42d5-b0fd-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 16:20:08 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id p10so35910812lfa.12
 for <xen-devel@lists.xenproject.org>; Thu, 31 Mar 2022 07:20:07 -0700 (PDT)
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
X-Inumbo-ID: aaad42d5-b0fd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p3bJsFQzV0nmaX1BNLZN1J7nl6h9FjtFUiXHa6u29nY=;
        b=a3zbjfN+I2ZT5SJAED3UP+s0WbtS7f0L4RH3CHrbES0kiCdc/uKv8VrZBcbhM6m8N+
         6uoMADXaZG4MBBxV+fqm8MQkz3lHAkhHpW7gFU66beyGMLCJMcV8Ex4zEXsfLfSwFdRs
         /NZjdXwI5mpqwlUP08g3m8Gj3P3+kdOimLRAZjfde4w6UyOmwvnLcgcdwhfDLYxLQKkh
         CAu2NepdtWKUhBjBiPSoUGEb54/MhAlnaTc/RNka19jlXgp6YoSTFk+AGy/n4LgQz9Dx
         1tt7mxrnjRgG3UpVG0yWhPG1aYF7TeiUoaw2pPC1iSvfRVRGWi+fqzNtM2NPkt7o6ESl
         t1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p3bJsFQzV0nmaX1BNLZN1J7nl6h9FjtFUiXHa6u29nY=;
        b=iIprTrNI231Rs67SUYPPf/V+eHuAKjuUX6453exQA9BPs/YYZ15QuPi3QbHRCQGnKm
         EBQ7MkeR3GhDQ0IKtWwwO0qLbOJASD1IlkYJ02kWltoKIAsGacUKe3cx9RvjMaDbI5cw
         pXU1TFrLZf+3WrVnRvMcpE4YudoWm8aS2XO0+Pintzrw43vudPdps1mr5ZQIcO9vnrSQ
         jT1UzI6+5K4Ptm2Qmwnk+hIKVhjRkUdgJm+qu+8DIRXryLuM9l5hGej2bmeDZE6ozj5n
         EIWObcZh3rjdQ94uFFzYYdb5enusjvNvEXyRbW5Edn0iOiSN52TmtulrYDIkFWek6GVT
         i+jA==
X-Gm-Message-State: AOAM532kq4N5woUNAPllIC0ZPVFrnnLqS1hH5MwwrVJgc2H7jvaJ8TMj
	feMTCKvEshWDfwnljZ/wBQ5gU2uhfXRAZlgvzao=
X-Google-Smtp-Source: ABdhPJwRWFbfHmzCFgAthzyK5ieGQdMPZqMifbgJFLIWHrnyWyZ5KmjzSR6ZT9rlFnGPd2cGKsEaVC7rwr0JPQzpD1k=
X-Received: by 2002:ac2:5504:0:b0:44a:2117:e6bb with SMTP id
 j4-20020ac25504000000b0044a2117e6bbmr10880850lfk.388.1648736407568; Thu, 31
 Mar 2022 07:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181658.30209-1-jandryuk@gmail.com> <YkWrim6+yw3LBzPn@perard.uk.xensource.com>
In-Reply-To: <YkWrim6+yw3LBzPn@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 31 Mar 2022 10:19:56 -0400
Message-ID: <CAKf6xpuGGX9TNV6s0UhCYXVcx-WNR7KL1DsOFruj=wUpNbigUA@mail.gmail.com>
Subject: Re: [PATCH] libxl: Always set ao for qmp_proxy_spawn_outcome
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 9:24 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Wed, Mar 30, 2022 at 02:16:58PM -0400, Jason Andryuk wrote:
> > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > index 9a8ddbe188..59a8dcf3a9 100644
> > --- a/tools/libs/light/libxl_dm.c
> > +++ b/tools/libs/light/libxl_dm.c
> > @@ -2468,6 +2468,9 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
> >      uint32_t dm_domid = sdss->pvqemu.guest_domid;
> >      int need_qemu;
> >
> > +    /* Set for out label through qmp_proxy_spawn_outcome(). */
> > +    sdss->qmp_proxy_spawn.ao = ao;
>
> I don't think that's correct. I feels like `sdss->qmp_proxy_spawn`
> doesn't need to be initialised before calling spawn_qmp_proxy().
>
> Also `qmp_proxy_spawn.ao` only need to be set before calling
> libxl__spawn_spawn(), so at the same time as the rest of the
> initialisation of `qmp_proxy_spawn` in spawn_qmp_proxy().
>
>
> Next, about the uninitialized `ao` field:
> - qmp_proxy_spawn_outcome() shouldn't use `qmp_proxy_spawn.ao`, but
>   instead it should use the one available in `sdss`, that is
>   `sdss->dm.spawn.ao` (The one that libxl__spawn_stub_dm() or
>   spawn_stub_launch_dm() is using).
> - And spawn_qmp_proxy() should also use `sdss->dm.spawn.ao` for
>   STATE_AO_GC() as I don't think spawn_qmp_proxy() can expect
>   `qmp_proxy_spawn` to be initialised as that's the function that
>   initialise it.

That all sounds good.  Thanks, Anthony.

-Jason

