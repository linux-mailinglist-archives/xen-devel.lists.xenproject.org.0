Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA13844EF16
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 23:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225451.389332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlejL-0003rD-PZ; Fri, 12 Nov 2021 22:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225451.389332; Fri, 12 Nov 2021 22:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlejL-0003oz-Mc; Fri, 12 Nov 2021 22:09:07 +0000
Received: by outflank-mailman (input) for mailman id 225451;
 Fri, 12 Nov 2021 22:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ivG=P7=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1mlejK-0003ot-7Q
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 22:09:06 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26604f33-4405-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 23:09:05 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id w1so43355247edd.10
 for <xen-devel@lists.xenproject.org>; Fri, 12 Nov 2021 14:09:05 -0800 (PST)
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
X-Inumbo-ID: 26604f33-4405-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1aAdVhZrGx1VVUufcWK3aM+UtMcm+wfTpnCMR8hcQWQ=;
        b=nJFmxWxrqF1f0y6ZTbeKJvsMocxcFyomRpg/mgP6npv/wFZoBAEs2/MAae3+nGXIu8
         8rII15kxHD4LEgWOOlr1dZ0Mjw6SovR8A/8oPS+Uqmc7y13z7WfWxL+Zb45wrJIXj0w4
         UW4Q5COVW5ncWLmqqU9Pqf+P+WwSEshuOOkRxYiS7gTyNaonT02M3HthXeTbbMoURo37
         Q7jfYQJfhUQUVfJH7zZJztLKnb7LDrMcLXCdCep5dp88WXWkJ3DMD1u1VfCpMk/WglQK
         uMcbq2nk0j6VlrQOayj0pX4EWekEVWGpOP64Xa+K1mTt/YziVMZbJayOIjskjz9PiK/c
         0BFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1aAdVhZrGx1VVUufcWK3aM+UtMcm+wfTpnCMR8hcQWQ=;
        b=ZMupko9wUTTkCGIaa1zQV9lFzwuR2CL6x4uePUvV7H8UI6LEfPcrk4RHeSN5wFU5E8
         jAFZvocoFM8TbOYLqPEsN8wxUr93LqR2Ioip8Bpce0c1pKCv9JBgm8YuzH4qMN8aFJUx
         rXW+J+4J0juxCss04qTKiaa0mVEkJ7XeNKwjwSUY75q8fpbaSADWABwVZePYoF8FNbXH
         2naqMSXZkEI3El1b5bWcnfHGPXiLORMNOd5FjRLTKSxhPeNRs73rjQb/+LTSpqH2T0My
         2uSRXSabNtXRIf5BMYIFNsDYXwgPBzpHX/wwetUcpM0bIO6nselcGOHrwgTk7cSl4avk
         WwTg==
X-Gm-Message-State: AOAM5303g2c1GrTsDIORM/pzU0/bZR8fjDIrAhKoZBkGndyOv38ODnxF
	9Ah7B1se4Bfihl438pIjxXZUn4Y72muBFOd6yQA=
X-Google-Smtp-Source: ABdhPJy0ttAzYMDIXn5ilP1autdaLpFhJWMhbTs9u/Lulhpnbcb7osIm6YQcBYrhvqRz8dXFTkY/Aq7AvwsQrA3L3CQ=
X-Received: by 2002:a17:906:a041:: with SMTP id bg1mr23461099ejb.470.1636754944892;
 Fri, 12 Nov 2021 14:09:04 -0800 (PST)
MIME-Version: 1.0
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com> <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com> <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <YY6bsu8/y/LeMfg3@mattapan.m5p.com> <40474f12-e269-f251-99b1-cb5b0a317bb2@xen.org>
 <YY7ZVPQSTapB7Jnj@mattapan.m5p.com>
In-Reply-To: <YY7ZVPQSTapB7Jnj@mattapan.m5p.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 12 Nov 2021 22:08:54 +0000
Message-ID: <CAJ=z9a0EooNfXyrNB82_4yT9qnz5fxEJtVN6oUbVyCzjU4hEKA@mail.gmail.com>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Elliott,

On Fri, 12 Nov 2021 at 21:15, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > I had been left with the impression the DSDT parsing was going to be
> > > needed for Domain 0 to access the framebuffer.  This was found
> > > unnecessary for framebuffer access for Domain 0?
> >
> > I thought you were asking for using framebuffer in Xen. There is no need
> > for Xen to parse the DSDT if the framebuffer is solely used by Dom0.
> >
> > Your problem with the framebuffer is likely not related to the DSDT. But
> > I can't really provide a lot of input until I see the logs.
>
> https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01841.html
>
> That is more or less a statement of handling of DSDT is the Right(tm)
> solution for Domain 0 to have framebuffer on such a platform.

Reading through the thread, I agree this is the correct theoretical thing to do.
However, as already pointed out back then, the effort seems quite big for the
benefit of a single board (AFAIK none of the other SoC we support
requires this).

My preference is to introduce a per-platform quirk (I believe Stefano was happy
with this). The advantage is we could get ACPI support for your board hopefully
merged quicker.

I would be happy to review any patches you send.

Cheers,

