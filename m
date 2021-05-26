Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2D3919EF
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 16:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132539.247182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lluOA-000544-Mq; Wed, 26 May 2021 14:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132539.247182; Wed, 26 May 2021 14:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lluOA-00051P-Iw; Wed, 26 May 2021 14:20:02 +0000
Received: by outflank-mailman (input) for mailman id 132539;
 Wed, 26 May 2021 14:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqRz=KV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lluO8-0004ty-64
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 14:20:00 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6353e0e5-2e27-49af-b3fa-cd64bca7f290;
 Wed, 26 May 2021 14:19:59 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id v5so1850718ljg.12
 for <xen-devel@lists.xenproject.org>; Wed, 26 May 2021 07:19:58 -0700 (PDT)
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
X-Inumbo-ID: 6353e0e5-2e27-49af-b3fa-cd64bca7f290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D4hFRvfhndbQ0kDZcfbLCf6Wo7jdMEsACo6DVcaA1gg=;
        b=nqvAn2KiezJBX+v6TEIiWmWQktpeX1QaiuImizwFyEg5qIxf2TY6OKd6jLXSJwa7/t
         8nXPvium9kBZu9eUKrNgPFjJ8jC0DK3hUfADxkwwEZO/RFoKEVJKgJGz4zq+/34TQQKe
         ixYVULUiSav1YQHvS8S3s9UrL9iakQTPISQyugQP6RjS8lX79xGv5JgfaYGFnXMmNIQ+
         pGCNNBo3Xx7Kr0ki4wNORTVZuagZ46Oyx9rYX5/tKomhdesR7OM5kYovkLD5UC0uGqxI
         yFw82xze5ZxNep+eaGY2AnBiXRuhud+keTpxLodlYj05BVQKW3HrYr9dTJ80l5ic5lG3
         3r3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4hFRvfhndbQ0kDZcfbLCf6Wo7jdMEsACo6DVcaA1gg=;
        b=ZakS5Ux3IQ7zv+1z0PkNQMWe34wtLrIasZ1YAKONb9fHJShggoVAQSg7vhnP4Y5/7y
         GS8rYVnoTqwXNz11l8J7Ha6b1IWzU8AhhdQuKhV8RshEF95b4pvLKhxyc/TBhjNCNK22
         QJoNvmpxV/REc3gRacgmXyNUvGWFmbbTfXK5/aedOwXIw/eqPZq8iIpcWUVBpWdD58vR
         dgAO9q+bFzn0WzkstPdNir8CLTkowWaDjL/zP1RkAPWmuWdsoAjkMLfBnWsMKc5ls9j4
         UfmO6ix3fiGd4lg5Bx5XgZrG6+9lp/xQ0jiapJ/3M6hmag5jhQRw/wrdST0U/lpqhbOX
         OrYQ==
X-Gm-Message-State: AOAM533mka1fIGrM3Q8MxPzJoXarfTYgQsdp9AShWcsav3elM38zKUOO
	8g/lCKYA+yCNxtMHDbKsZUZAQfXkYFVOcU4Flpc=
X-Google-Smtp-Source: ABdhPJyJ+tggwotGdFo6o3KFtsI+wNVRN8GDWuYyaKW3RACTfl7+yrDuPjolnsA4AH6gvxvlqgBa78SirESMBmE+BRs=
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr2395805ljn.77.1622038797873;
 Wed, 26 May 2021 07:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210503192810.36084-1-jandryuk@gmail.com> <20210503192810.36084-3-jandryuk@gmail.com>
 <6f3d3833-8540-ca92-8d1c-e4b7bd2217ce@suse.com>
In-Reply-To: <6f3d3833-8540-ca92-8d1c-e4b7bd2217ce@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 May 2021 10:19:46 -0400
Message-ID: <CAKf6xpsqeNPtGQ-4f7oc5idZTHurMWxen2H94LNzHdkXGmC7uw@mail.gmail.com>
Subject: Re: [PATCH 02/13] cpufreq: Add perf_freq to cpuinfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 9:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 03.05.2021 21:27, Jason Andryuk wrote:
> > acpi-cpufreq scales the aperf/mperf measurements by max_freq, but HWP
> > needs to scale by base frequency.  Settings max_freq to base_freq
> > "works" but the code is not obvious, and returning values to userspace
> > is tricky.  Add an additonal perf_freq member which is used for scaling
> > aperf/mperf measurements.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > I don't like this, but it seems the best way to re-use the common
> > aperf/mperf code.  The other option would be to add wrappers that then
> > do the acpi vs. hwp scaling.
>
> Not sure I understand what you mean by "wrappers". I would assume that
> for hwp you simply install a different getavg hook? Or else I guess
> I'd need to see at least an outline of what you see as the alternative.

Something like a common get_measured_perf() returning just the
aperf/mperf ratio with cpufreq_driver specific getavg() scaling as
appropriate.

Regards,
Jason

