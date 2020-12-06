Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17E2D0615
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 17:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45705.81123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klxCN-0001jW-6F; Sun, 06 Dec 2020 16:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45705.81123; Sun, 06 Dec 2020 16:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klxCN-0001j7-33; Sun, 06 Dec 2020 16:47:47 +0000
Received: by outflank-mailman (input) for mailman id 45705;
 Sun, 06 Dec 2020 16:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnKb=FK=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1klxCL-0001j2-TS
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 16:47:46 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a62cf928-3956-4ded-9bbf-f5dcc643e8d3;
 Sun, 06 Dec 2020 16:47:44 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a9so14587019lfh.2
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 08:47:44 -0800 (PST)
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
X-Inumbo-ID: a62cf928-3956-4ded-9bbf-f5dcc643e8d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RW0lDqSJK11o5Hdo0ZTtiX38zMds7s0ivaE30jYDc08=;
        b=fyWAecBmSWqbeKTDqjVW+CVkNXAQmZ410oGJ+xz0B3svfmdqi9ApYJY14RYlLULq1X
         NQfKYWKNfPcKgC+hJNLBviDdi4gBw6UW0zBYYEzqUyiPbgT5G5L/KO8GooMOlf8fcq8V
         t75RXhiKmf+bn3sH0AYBYtKLi3q2jhRa/RQpy5AYfan7yvFFFKQqrH8wwvd+Vy6atRaf
         is1yTY0QYFtQXGVSI7EWg9vnv6exSx3VEEew5PE68sbe+WTEaviOQmbo8QaJLc2eaK7y
         HuNPjjSrWCxhDwki9gHeW6OEwhG/glGZEokkXpBsTQWHYr1m1cgxf2uOFGFRVK13vvp0
         MUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RW0lDqSJK11o5Hdo0ZTtiX38zMds7s0ivaE30jYDc08=;
        b=oCBAb40Vg6Lso/3nZnkEd7H5YaphMpcf+FZnD6ckqIILQagHXZYQy7kQJlmzz+5CLw
         HRrmBsSjujznmjPT5ekERYELabykL0V4aBoxQeNVyht5hJSHS5GrT4Cl7UYpBuLXsZ9R
         rojK621JOOmdK5U4BxqGCHR3LylqLqGMSvWW2nEUH67FDOO7k7WwKKByZk/uu2LYR4nL
         H583png105YXMZrcXUABStk5r6OGHB8hZBkBYFeLHla/9ii0C0RUM+RaXVth8FweeXoK
         Zd3Pe57Af/WXkamXcWJEwoblCmo5AwsKasV/cV57RxnOwO1U/FPM3zur+lTWhQcT4FzO
         j7CQ==
X-Gm-Message-State: AOAM531NSt81PWouUv1LuTZoR52Wy1+ld7WOgLQ14eT/B9TOAUAolV5M
	XwlQTyIyZZsOSt+kWQm1xLIpj55z4Pye6Wyvxkc=
X-Google-Smtp-Source: ABdhPJw9vQiBpQRjhN/8CX+xAjLRplV+JVJIeCtYqBQQJnmgOmlExZLWBZV8I1M5wikJWFGCCY4w8C0bQqI+B6jfbXY=
X-Received: by 2002:a19:3c5:: with SMTP id 188mr6378736lfd.202.1607273263606;
 Sun, 06 Dec 2020 08:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20201129035639.GW2532@mail-itl> <20201130164010.GA23494@redsun51.ssa.fujisawa.hgst.com>
 <20201202000642.GJ201140@mail-itl> <20201204110847.GU201140@mail-itl>
 <20201204120803.GA20727@lst.de> <20201204122054.GV201140@mail-itl> <20201205082839.ts3ju6yta46cgwjn@Air-de-Roger>
In-Reply-To: <20201205082839.ts3ju6yta46cgwjn@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 6 Dec 2020 11:47:32 -0500
Message-ID: <CAKf6xpvdD-XJoRO91B+Lwc=0Sb6Luw2X8Y9sH_MQsAWhZmj+hw@mail.gmail.com>
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-nvme@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 5, 2020 at 3:29 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Fri, Dec 04, 2020 at 01:20:54PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Dec 04, 2020 at 01:08:03PM +0100, Christoph Hellwig wrote:
> > > On Fri, Dec 04, 2020 at 12:08:47PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > culprit:
> > > >
> > > > commit 9e2369c06c8a181478039258a4598c1ddd2cadfa
> > > > Author: Roger Pau Monne <roger.pau@citrix.com>
> > > > Date:   Tue Sep 1 10:33:26 2020 +0200
> > > >
> > > >     xen: add helpers to allocate unpopulated memory
> > > >
> > > > I'm adding relevant people and xen-devel to the thread.
> > > > For completeness, here is the original crash message:
> > >
> > > That commit definitively adds a new ZONE_DEVICE user, so it does look
> > > related.  But you are not running on Xen, are you?
> >
> > I am. It is Xen dom0.
>
> I'm afraid I'm on leave and won't be able to look into this until the
> beginning of January. I would guess it's some kind of bad
> interaction between blkback and NVMe drivers both using ZONE_DEVICE?
>
> Maybe the best is to revert this change and I will look into it when
> I get back, unless someone is willing to debug this further.

Looking at commit 9e2369c06c8a and xen-blkback put_free_pages() , they
both use page->lru which is part of the anonymous union shared with
*pgmap.  That matches Marek's suspicion that the ZONE_DEVICE memory is
being used as ZONE_NORMAL.

memmap_init_zone_device() says:
* ZONE_DEVICE pages union ->lru with a ->pgmap back pointer
* and zone_device_data.  It is a bug if a ZONE_DEVICE page is
* ever freed or placed on a driver-private list.

Regards,
Jason

