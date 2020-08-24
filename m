Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7303E250127
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 17:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAEQJ-0005Ir-KB; Mon, 24 Aug 2020 15:30:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnWE=CC=gmail.com=luckybreak051779@srs-us1.protection.inumbo.net>)
 id 1kAEQI-0005Im-3F
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 15:30:14 +0000
X-Inumbo-ID: 2b6388ce-6871-430d-90b3-72862b1f89f3
Received: from mail-ej1-x634.google.com (unknown [2a00:1450:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b6388ce-6871-430d-90b3-72862b1f89f3;
 Mon, 24 Aug 2020 15:30:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id si26so12455016ejb.12
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=akxax/GyXVTdUVK8vYkFh/05zkmlyka4fNfVGgZDewE=;
 b=PIFl+MDvzbdqmXyP/geeiNs0YAqypjyqyXxKEBAXTe6suN5rZ42xllSJTkaOhROdjG
 OxcdPYbtCnAXnb20oz5kb1aHtAgANYbGl9f5hbBrzCGNVxQq7Kc6MKuqDf7YDwfibYMk
 CNNrcbgghctWhRJc9+kv6b+w/wIX5Okml3h8m2He1rryje2MLunixU5pne0a6n3yLNPT
 apE7cmXLGCYdiNjVJJgh9T3D21WMZ3qJO89aslMTFtQvrXXKpEbLaiEN8EWmcz2hqt7E
 HED3ZqtJyzGVsXGdFupThBkcuk+uh/gMSXHgNtGzzCTiUwR/2uQMT6Fib57bA3H/ghBy
 4Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=akxax/GyXVTdUVK8vYkFh/05zkmlyka4fNfVGgZDewE=;
 b=HsNqqLA/pPQVr/OVth4plIL6BKVrpXd94sxI3igW0gkGk7T1AAZYQQpVd28tNCFB99
 VL35gd7JMFc6sqAQITGP0lutdCdrhFAIrTaYZOEDgAJ2Uy32UxR8fgkKUcnDYRMmpstx
 olcvUdWbQgSgHji5ucYUS7lRUuKkvBhN4+ccWCUZmKSswbchiSUi5vQVea/Oc5JCgvPW
 fjUh5IcFE6eK1Sf4Uu8YgUqUqzNktn9BsbiAksj1u9CSfu0Bg1eZPVrYvChShkWed1WQ
 9x0nHs09/fMvP0H0xwiAvvNFsnrUbv+0ImjIQNsUQYMUZ4BYgIABK5t6a3YeV5lLmiIV
 co6A==
X-Gm-Message-State: AOAM530jv/KHrm0W00GtGGcCQN4C+HGOi80i04lHAD9zKp88kL5OLB3z
 iW29lA9ktbbqknRmBScRb76Tsao5gNZ7Er1xk79bej9AANuYb6wZ
X-Google-Smtp-Source: ABdhPJwI6AlTSDHxRzVmfKlXx4Vk5OyfJHI2TmhxsvnsdHClgGZuekbj9Uj6D5VU+sBpNI+zP4JcOSABz/uyZYJjN8c=
X-Received: by 2002:a17:906:234b:: with SMTP id
 m11mr5950409eja.403.1598283012381; 
 Mon, 24 Aug 2020 08:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAN00iyXLZXkXkq2Umg8K+hyJS=-+bzLeBVcaUEWOuMe-91T4eA@mail.gmail.com>
 <aaf57295-0f13-2af6-650a-b9ccbf8d7733@xen.org>
In-Reply-To: <aaf57295-0f13-2af6-650a-b9ccbf8d7733@xen.org>
From: luckybreak051779 <luckybreak051779@gmail.com>
Date: Mon, 24 Aug 2020 11:29:59 -0400
Message-ID: <CAN00iyW2pr=nBjNTdC32ZeUR56W6_crZ3D8LTAabR6LPPDGdfA@mail.gmail.com>
Subject: Re: MFN on ARM
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Julien

Thanks for getting back to me.

On Mon, Aug 24, 2020 at 11:10 AM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 24/08/2020 15:23, luckybreak051779 wrote:
> > Xen Team:
> >
> > I am running Xen 4.13.0 on a 32-bit ARM processor.  In a domU driver I
> > use the dma_map_single() function to obtain a DMA address.
> > How can I get the MFN of that DMA address from inside the domU?
>
> We don't provide a way to find the MFN from a Guest Physical Frame.
>
> >  I need
> > the MFN to be able to differentiate between
> > two identical domUs running the same driver code (e.g. both calling
> > dma_map_single() ).
> Can you give more details of your setup? Are you trying to use the same
> physical device in two domUs?
>
I have an FPGA that needs to communicate with each domU via buffers
mapped from the dma_map_single() call.  The domU puts the bus address
received from dma_map_single() into a shared memory area in Dom0 that
the FPGA can read.  The problem is that the FPGA tries to use that
address and its not the "real" physical address in memory.  That's why
i'm trying to get the MFN so that I can give the FPGA the "real"
physical address associated with the domU buffer from
dma_map_single().  This code worked fine when it was originally in
dom0.

> Cheers,
>
> --
> Julien Grall

