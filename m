Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238B47B1EF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 18:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249921.430409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzMEa-0002mm-Tm; Mon, 20 Dec 2021 17:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249921.430409; Mon, 20 Dec 2021 17:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzMEa-0002l0-QT; Mon, 20 Dec 2021 17:14:00 +0000
Received: by outflank-mailman (input) for mailman id 249921;
 Mon, 20 Dec 2021 17:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D44S=RF=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1mzMEZ-0002ku-DI
 for xen-devel@lists.xen.org; Mon, 20 Dec 2021 17:13:59 +0000
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36c84863-61b8-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 18:13:57 +0100 (CET)
Received: by mail-io1-f41.google.com with SMTP id b187so14183845iof.11
 for <xen-devel@lists.xen.org>; Mon, 20 Dec 2021 09:13:56 -0800 (PST)
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
X-Inumbo-ID: 36c84863-61b8-11ec-85d3-df6b77346a89
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=9Z86u/eYv90k7dQ52gyj/BqP0l/kowECwRY5YIzP74Y=;
        b=Ku7PhNfztlsHg40t/VM99telGuW02R3x+FjgpMzXQVME/HawF1Bb3bGsv0PaHwMeUm
         XdIYEc1JCu9vd85JNjIRxNTNtNkXnSuo9O6iG5w1kYoecSCCXrgo4oZk7qoZ9gdTLgz2
         3cS91StxUPaLzZRJthKRb4DK7K+yHjqjm2zW54WjlwRh0JVwJSY2xmRSLmknErb2nBcP
         4E5D0IvzAAQVxjghMI9wOizKp0nBrrfiIg78juHDMcI1jBwefpR+u6lqzuRq32CAUeKJ
         25XpYP0VxmCQ/PzhRiWwvx+/cELxMB6fDbjl4ypJg6F2c56HpWH5rG29i8n4X4BMDr72
         WgFg==
X-Gm-Message-State: AOAM530gCbTh9vnWVF1+t1bcCR2jE2zeQfBnq6IdgA9Znj5pI//0pIXf
	JWFMhfZNQSIu06ApyNuAat4u6UarYviHJraLubAEpcT7zgSdLw==
X-Google-Smtp-Source: ABdhPJza7/162JEYtwTrJZzxa5Cj4SKBusS0LTjdBRO5Ju33CFQ7ocBu5BOyBBCSGp36EVCTPWJA5aTQtbQul7AtKdo=
X-Received: by 2002:a6b:7f04:: with SMTP id l4mr8666403ioq.62.1640020435440;
 Mon, 20 Dec 2021 09:13:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
In-Reply-To: <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Tue, 21 Dec 2021 01:13:43 +0800
Message-ID: <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

First of all, thank you for your quick response, Juergen and Roger.
I just realized that I run into mail forwarding issue from sourceforge
mail alias service, and only found the responses when I checked the
list archive. As a result, I have to manually merge Roger's response
to reply...

> > I have to admit that this trial process is blind as I have no idea
> > which component in the combo is to be blamed. Is it a bug in the
> > backend-driver, frontend-driver or the hypervisor itself? Or due to
> > incompatible versions? Any suggestion on other diagnose ideas (e.g.
> > debug logs) will be welcome, while I work on the planned experiments.
>
> This is a bug in FreeBSD netfront, so no matter which Linux or Xen
> version you use.
>
> Does it make a difference if you disable TSO and LRO from netfront?
>
> $ ifconfig xn0 -tso -lro
It does not, the fatal error still show up after this command.

>
> Do you have instructions I can follow in order to try to reproduce the
> issue?
I don't know if there are any special details in my setup.
Hopefully I don't miss anything useful:
1. Build a TrueNAS 12.0U7 DOM-U by flushing the OS image into a vdisk
2. Create / import a zfs pool to the DOM-U
3. Create and share some file based iSCSI extents on the pool
4. Mount the iSCSI extent through some initiator clients.
The domU xn0 should be disabled immediately after step #4.

I omitted all operational details with the assumption that you are familiar
with TrueNAS and iSCSI setup.
For step #4, I can reproduce it with both ipxe initiator and the win7
built-in client.
As a result, I assume the client version does not matter.
For #2, I actually have a physical disk and controller assigned to DOM-U.
But I suspect this is probably irrelevant.
For #3, I'm not sure if the content in the extent matters.
So far I have been testing the same extent, which is formatted as an NTFS disk.

>
> Thanks, Roger.

> >
> > Thanks,
> > G.R.

