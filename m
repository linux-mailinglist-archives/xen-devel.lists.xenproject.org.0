Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6233CB5B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 03:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98160.186116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLzN7-0000ni-QK; Tue, 16 Mar 2021 02:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98160.186116; Tue, 16 Mar 2021 02:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLzN7-0000nJ-N4; Tue, 16 Mar 2021 02:23:49 +0000
Received: by outflank-mailman (input) for mailman id 98160;
 Tue, 16 Mar 2021 02:23:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2g6=IO=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lLzN6-0000nE-7Y
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 02:23:48 +0000
Received: from mail-qv1-xf30.google.com (unknown [2607:f8b0:4864:20::f30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79ec000e-e70b-4659-a6dd-38ab9324d96d;
 Tue, 16 Mar 2021 02:23:47 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id q9so3386029qvm.6
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 19:23:47 -0700 (PDT)
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
X-Inumbo-ID: 79ec000e-e70b-4659-a6dd-38ab9324d96d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKFVgcP8rDu3O4/q+NqywBi00Mw2quqcf5bwocfHgn4=;
        b=bAJ9ssX9l8UhL4z+BAlHgWhLJQP+YRE+/ZPyoaTXVSxj+0sAQDfXxRN/kQgiiQl+La
         7Lm3XB0uETopun/2sPTIdTFB4RS9ENrCzb+eEYGT69PXviiIDliiiH5dAr7mpzqZbXbq
         HQQLohFjK4mR4vTWW/t9a88grzQFivht+Mn0qgA5LqRFmW3XoHmnHlJavWt10iW5QI0f
         z00BP17+uBALq0D8hBmfn8ZnL3yhnW2y+2Ot4cQJc2T0f6DpUy0cBA1FaNW5yimaLqZZ
         y5hDyUaApIHU5nadDKTJvYhkKZgG5mNUBNjcr2pamMnvp6i++qw66Yev1UOalhXDTk8A
         gwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKFVgcP8rDu3O4/q+NqywBi00Mw2quqcf5bwocfHgn4=;
        b=fHHiAm9gfUqqah39SbSOpAIfsIdrU83hymxt9Uh4VEzWgPswL4WFNJy6ocsLjUwUjB
         cnredYLWlg+aKW7y4SSRzbRUcLao45Dg4J9er3Hsb7H44Luw/rmO6j9RUD1fuT3RUli+
         3KfE1IrMmvrPD+ACEgw+t8y6iZdMX+423bUas9C3wvn9St2tA5sRdJM+OIzIPmYIuK4k
         hjmJsZ+TU3u42rPqK5GQI7qrc+ZUYFUyWUPaFQZOulkT2NtLE7o9aC9oXgOSitCTgHBh
         6yFr2t6GPbRfQWdDxrmyqWIyslZJ17at6c6hQz/6DtEMMlElslCf+5Ez95p6T2OUkGOX
         871A==
X-Gm-Message-State: AOAM532fXeWzjb43PcxStGV2bjhyyy+rB33k96bHvhNrhut0xgbCdyoQ
	UYznOlYMD1LvMqeGnRRFP+gqsswdSl4rhMR4aKVDHQ==
X-Google-Smtp-Source: ABdhPJwcyPMpViRIX54o00BN829wIMTqMBk9AFVbsx4LM5HthKHDPF43kGCobYZRUeTRcKS0gjb7c+C4q83ojT665Dw=
X-Received: by 2002:a0c:f702:: with SMTP id w2mr27809826qvn.0.1615861427110;
 Mon, 15 Mar 2021 19:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy-iwV86QB+P4OCDgevx9MND0NzwBECUVqavT6cF+bvrcA@mail.gmail.com>
 <CAJ=z9a1_BrnCzqdZ6xoc1VwTM8V0jr1B_rv=28fW5VSe2rwG4Q@mail.gmail.com>
In-Reply-To: <CAJ=z9a1_BrnCzqdZ6xoc1VwTM8V0jr1B_rv=28fW5VSe2rwG4Q@mail.gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 15 Mar 2021 19:23:43 -0700
Message-ID: <CAMmSBy-u8-=r20UimHdUvFDjcegraK+v=v5QhvhrtNk4j4TGDg@mail.gmail.com>
Subject: Re: Xen 4.14 build failing on aarch64 with GCC 10.2.1
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 3:15 PM Julien Grall <julien.grall.oss@gmail.com> wrote:
>
> On Wed, 10 Mar 2021 at 21:15, Roman Shaposhnik <roman@zededa.com> wrote:
> >
> > Hi!
>
> Hi,
>
> >
> > just came across this failure on aarch64:
> >
> > ld: prelink.o: in function `_spin_lock_cb':
> > 19187(.text+0x1f26c): undefined reference to `__aarch64_ldadd4_acq_rel'
> > 19188ld: prelink.o: in function `_spin_lock':
> > 19189(.text+0x1f2ec): undefined reference to `__aarch64_ldadd4_acq_rel'
> > 19190ld: prelink.o: in function `_spin_lock_irq':
> > 19191(.text+0x1f35c): undefined reference to `__aarch64_ldadd4_acq_rel'
> > 19192ld: prelink.o: in function `_spin_lock_irqsave':
> > 19193(.text+0x1f3d4): undefined reference to `__aarch64_ldadd4_acq_rel'
> > 19194ld: prelink.o: in function `_spin_lock_recursive':
> > 19195(.text+0x1f6b0): undefined reference to `__aarch64_ldadd4_acq_rel'
> >
> > This, of course, goes away if I build Xen with:
> >    CFLAGS=-mno-outline-atomics
> >
> > However, at this point I'm curious if this is going to get addressed in Xen
> > proper or not.
>
> This has already been fixed and backported to Xen 4.14 (included in
> 4.14.1). Are you using the latest 4.14 branch?

Aaaand that appears to works as intended -- sorry for the noise -- I
thought I was using the latest, but apparently not.

Thanks,
Roman.

