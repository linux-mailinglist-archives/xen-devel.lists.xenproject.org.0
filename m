Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D831FDEB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87018.163927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9eq-0000Fv-8k; Fri, 19 Feb 2021 17:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87018.163927; Fri, 19 Feb 2021 17:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9eq-0000FV-5Q; Fri, 19 Feb 2021 17:33:36 +0000
Received: by outflank-mailman (input) for mailman id 87018;
 Fri, 19 Feb 2021 17:33:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fNr7=HV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lD9eo-0000FQ-19
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:33:34 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 408c43cb-f1d0-4303-b329-377b3d8e1312;
 Fri, 19 Feb 2021 17:33:33 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r23so24075641ljh.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:33:33 -0800 (PST)
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
X-Inumbo-ID: 408c43cb-f1d0-4303-b329-377b3d8e1312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=51CM+DXsCAF5/n+VLs066AKIfE8tu1fm5vrlyP+QoLE=;
        b=Enm7fweUIAJpRveohyyonM3+8L9ObWPqUsUbGOUFG7uwiYwefl/Bc1YP7nQX1lkXYz
         TW//aRBb4pYHCOVVedw5C9vMhDvizmJ56w9ltsAn+ERi3x/SL41foSzUDF/i7rSEhZTH
         2bxpXcUAqFf51ykfghWOTSZmltqAovzT3j1bzAA1uoRzzBPg9Mr3NRH7ew75aWw3pkQ1
         GQjl/nQrZ4RnPwqTuT5mEbzc96xsX7bZlgYre681NHroIKeZdowvZguUOhiE0cnZLspw
         qynsnJ/sO93dkUX9ph11FP1zMpaOFdeQMwGkMhIQWIrekGFJREQUw6O15Zbs7Y89sBqD
         n6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=51CM+DXsCAF5/n+VLs066AKIfE8tu1fm5vrlyP+QoLE=;
        b=WqWOE980PRmCtzOWJHSJzwtHAUm2ECObm4fokjo4HOSWCNHxrSoKVr0hqnGG58/PbO
         c+4pc8XXQeK2DxK1+LjkXTyB7ZdfAqEBM4amYxmXw94UcDT5XEHmXF6hAszdx4Be/r9h
         SMOZx9Cxe9A6lpN96k644dTppHl+xkc18srgsZuVHv4h6qrGwRiPEtS+AZdLw+3BKsB1
         x0JBgPI/rz19vcpM8Bqus9NDmrLCQsZL1jk9t2ZEeTTcjhM4FF5ygOpLPc5wNYHv9kXz
         uErchWxxct7UhaG8SIs/VmCZKGZti2Ncn0aFxD8RpSgXn7MdeQlTDKdpm2MnQilB2ovZ
         aXIQ==
X-Gm-Message-State: AOAM531dJZKgA7XHiJxKnUpZVT/vtuQizUZf3sj0uKjwoXFj/J8L9q+9
	JGF29+06NrRSje+25iZxL1W7S5MF1FxUAu8xKNWMChhq
X-Google-Smtp-Source: ABdhPJxRiVE3oUjMu4Aqa2d6pH4nKSN9qjhNuDf0ufr8ArPESV82V+cs3rrLlikFFCdc9vY/VDzUY6GpDfwBO+nqPmo=
X-Received: by 2002:a2e:8743:: with SMTP id q3mr6423327ljj.12.1613756012202;
 Fri, 19 Feb 2021 09:33:32 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com> <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CABfawhnwdkB01LKYbcNhyyhFXF2LbLFFmeN5kqh7VaYPevjzuw@mail.gmail.com> <CAKf6xpuACuY63f+m6U55EVoSBL+RR04OStGPytb-Aeacou32gg@mail.gmail.com>
In-Reply-To: <CAKf6xpuACuY63f+m6U55EVoSBL+RR04OStGPytb-Aeacou32gg@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 19 Feb 2021 12:33:21 -0500
Message-ID: <CAKf6xpueuBS4mN+JfQPVqK-LQ4eEx=AdnPF0p-qRbRYpHtk6Gg@mail.gmail.com>
Subject: tboot UEFI and Xen (was Re: i915 dma faults on Xen)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 1:13 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> On Thu, Oct 15, 2020 at 12:39 PM Tamas K Lengyel
> <tamas.k.lengyel@gmail.com> wrote:
> >
> > > > Can you paste the memory map as printed by Xen when booting, and what
> > > > command line are you using to boot Xen.
> > >
> > > So this is OpenXT, and it's booting EFI -> xen -> tboot -> xen
> >
> > Unrelated comment: since tboot now has a PE build
> > (http://hg.code.sf.net/p/tboot/code/rev/5c68f0963a78) I think it would
> > be time for OpenXT to drop the weird efi->xen->tboot->xen flow and
> > just do efi->tboot->xen. Only reason we did efi->xen->tboot was
> > because tboot didn't have a PE build at the time. It's a very hackish
> > solution that's no longer needed.
>
> Thanks for the pointer, Tamas.  If I recall correctly, there was also
> an issue with ExitBootServices.  Do you know if that has been
> addressed?

I tested tboot's UEFI build, but it didn't boot Xen:

Fedora UEFI shim -> grub2 -> tboot.mb2 -> xen
didn't work - hung at a black screen. Power button powered off
promptly, so it didn't get far enough for something to enable ACPI.
Fedora UEFI shim -> grub2 -> tboot.mb2 -> linux
booted and showed efi stuff in /sys

Naturally this is on a laptop without a serial port. I haven't looked
into this further as it's a low priority for me at this time.

Regards,
Jason

