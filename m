Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262B35E379
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 18:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109970.209897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWLYX-0002rD-Pw; Tue, 13 Apr 2021 16:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109970.209897; Tue, 13 Apr 2021 16:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWLYX-0002qs-Mb; Tue, 13 Apr 2021 16:06:25 +0000
Received: by outflank-mailman (input) for mailman id 109970;
 Tue, 13 Apr 2021 16:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lWLYW-0002qn-7A
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 16:06:24 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a673bb3f-73fb-472f-8a2e-a21dc51dca85;
 Tue, 13 Apr 2021 16:06:23 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id w8so19706469lfr.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Apr 2021 09:06:23 -0700 (PDT)
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
X-Inumbo-ID: a673bb3f-73fb-472f-8a2e-a21dc51dca85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1fd25UFmEZ/ZTlF5UgodHjiEAkehs5Oy53Oboyxk4g=;
        b=kqanzS1LrM6Bu6VOWkYJ0ofYXh7Yth7t6N9jK0FYfqB/veeHBm9rmWg8hAyz35KjY9
         Ow+oHKtCkl6QkrWvu9Kwqni3Bt0w2Q9np1YBAk1zhc90qH77y6Q8Vr+P8fGtkbdiJSjv
         patj07mWM4ShBfqFvKlU8Gg9HdocLtEZZL+TKRE2NniIV9jpQPRgnaWaFsnbaSrj7boc
         BUEOGBEzg2jf/63CozpSvdPVeg85ZkLcOd0835TUq12B4Hnty5QsTNzpCrZbrZ/Nbeos
         iyTxA2ieBm183TJKv+bMJH0BU2jPFQTypAMfcc2Qy6ahExXpVAIMTExBtUWqqZyVmzxK
         5/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1fd25UFmEZ/ZTlF5UgodHjiEAkehs5Oy53Oboyxk4g=;
        b=p4i9rsjIYZAVIVoQcum2+5uXpnooScdw17Bnj6KVx/nwnnN+vnRl9EADQzXvEUQzOP
         iBFoRfCcffDAZvRQkW5ax5pNsAQOHF3TfqBem5Dc6zRnUdyg1dYVE7nLj6W+t03tst/6
         0dAQyQmtTvdfZCVumJY+8+6GjfOM3itzRekS+2P+X1+5mxkodZ+C3GeX3I4b6EJhTmBH
         4fWNr9Lr8UqRndoR2P3omdU/ZytKJ/cgijg1nKasRiwnOilLs6vIDh5xI6xh/JK/yogy
         hOBIOinHDprW3kGJMxqt7jhJY19g8rsC1bJbCr1W4rbEEarQ0h7t9cLfK7qm7roRwe/l
         sr6w==
X-Gm-Message-State: AOAM531PyG8WTQFarTHvO+ZiIsxs4fAfyuVGVM/R/x5DfLWtjKpjtCPV
	JFLGrBZ0SnZjPn2siB7y2fGtURIroVG7dcoDrPA=
X-Google-Smtp-Source: ABdhPJwgkA0IgrdjYFu/tkXFmMTchvqtVB2XrLQ/dwq1hgpccvnXLda/5YWGjrYyXmSuG/+Bzkzx9sVbwTQZNdsdr4M=
X-Received: by 2002:ac2:5083:: with SMTP id f3mr15015956lfm.562.1618329980772;
 Tue, 13 Apr 2021 09:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <602469f5-1028-8f36-7195-f102b6d2af0c@tabit.pro>
 <427bfd62-48c0-5859-7300-c618331b4e5a@citrix.com> <20200922133047.4646b2ab62cszn46@liuwe-devbox-debian-v2>
 <CAKf6xpsOfM=PSFW6sUx5yozmEji9f5t2p+5+mrpX_2cOqGBOmQ@mail.gmail.com> <301e8abc-f50f-0159-a373-d9eb54f9836b@citrix.com>
In-Reply-To: <301e8abc-f50f-0159-a373-d9eb54f9836b@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 13 Apr 2021 12:06:08 -0400
Message-ID: <CAKf6xps7XihHRjMKUnng9z8Uvu1ERTS+Zn5LjB-+tEKhYXpDzg@mail.gmail.com>
Subject: Re: [PATCH] libxl: User defined max_maptrack_frames in a stub domain
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Dmitry Fedorov <d.fedorov@tabit.pro>, 
	xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 13, 2021 at 10:23 AM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 10/04/2021 16:55, Jason Andryuk wrote:
> > On Tue, Sep 22, 2020 at 9:31 AM Wei Liu <wl@xen.org> wrote:
> >> On Mon, Sep 14, 2020 at 04:27:45PM +0100, Andrew Cooper wrote:
> >>> On 14/09/2020 15:50, Dmitry Fedorov wrote:
> >>>> Hi,
> >>>>
> >>>> Implementing qrexec+usbip+qemu in Linux-based stub domain leads me to
> >>>> an issue where a device model stub domain doesn't have maptrack entries.
> >>>>
> >>>> Would it be possible to apply a user defined max_maptrack_frames value
> >>>> to dm_config in the same way as for max_grant_frames?
> >>>>
> >>>> Signed-off-by: Dmitry Fedorov <d.fedorov@tabit.pro>
> >>> This looks entirely reasonable.
> >>>
> >>> CC'ing the maintainers for their opinion.
> >>>
> >> Looks fine to me.
> >>
> >> Acked-by: Wei Liu <wl@xen.org>
> > Hi,
> >
> > Wei, looks like you Acked but did not apply this patch.  And after the
> > libs rename, the file paths no longer match.  Do you want to fix this
> > up, or should Dmitry re-submit?
>
> Apologies for the process failure here.

No worries.

> I have committed
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=80714e55042b2242cd82eccfb7405d671ecbebda

Thank you, Andrew.

> I take it that it wants flagging for backports?

The Qubes qrexec+usbip+qemu feature isn't merged yet, but they have a
backport to 4.14 as part of the series.

Regards,
Jason

