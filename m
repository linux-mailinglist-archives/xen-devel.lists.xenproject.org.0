Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B517C596826
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 06:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388639.625357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOAde-00054b-OX; Wed, 17 Aug 2022 04:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388639.625357; Wed, 17 Aug 2022 04:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOAde-00052o-LX; Wed, 17 Aug 2022 04:26:42 +0000
Received: by outflank-mailman (input) for mailman id 388639;
 Wed, 17 Aug 2022 04:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIU2=YV=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1oOAdc-00052Y-UX
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 04:26:41 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c893d26b-1de4-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 06:26:38 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-32fd97c199fso177395287b3.6
 for <xen-devel@lists.xenproject.org>; Tue, 16 Aug 2022 21:26:37 -0700 (PDT)
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
X-Inumbo-ID: c893d26b-1de4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Bvy/9Pfbis3IVpMKx38SkeHJHXRbjKHGNZtMW922TLc=;
        b=BN/GzPINQHC9lo4QCbZs3j4FwS6njxrQ1hd+lVcBG3rqvzOEWk/JrvMuarLANIHM/T
         DTv0X/0BuCQ81YZ0BB3TXVENR2j5tnQFTRJ4wPZMFOCsxS4Z2D1T1IiBsNIqlglbGbM2
         hjjMZayq4oNZco56CyeDVvkdS7LGObFEOo6Uei5W59tKbokEybQCAOpBNb7YyR/9bkFe
         z5eONbgAhoMe+sKTxt3gZlrrJKrgNq9MU3blAs1HDCLRA9UUYFCTjSM4KZp6vn1kKjy/
         57I9CsbqmIbdX5gVL4KDD8hT/Xf5FYuMyOKsTFJRvt7VeXKhoDRhetJwr37pITZMB3uw
         etlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Bvy/9Pfbis3IVpMKx38SkeHJHXRbjKHGNZtMW922TLc=;
        b=J3IOXfZZK6zm9n9ldCpw88Gv7NyPe0f8Q9QA4OqcfDCKcsFFkE5jibEqv5oxGS1Sjq
         wcFqNGFuUXkg0CCJxjC2BCqnWrNpEWQyW9gPDxo42SUWJzaEv6d2QsV1LP3vbbRPg4gP
         wKXUS5QzuBj5CdG6HkMewTST9Bq4V+pIClVMh+0lEl2k55CylImQkiVUBWW8LSl13ove
         Ix1zE/Dt9FG08nCKYRQNkuBhQfwXbtwzM4nO2ohCsxmmZLUTCgSU0IPs7wmlpX3CIu/o
         5LNsF4CE5fbBoxRbcEiLpNFA1WPcIDr7iC8pIyUnl4XVpKuHzPFFMYx0HA+uwLZyyFEA
         rrqQ==
X-Gm-Message-State: ACgBeo0/Hxd6MpxXdCWXCud4J7EPVgp4uWrUoLJotLs/rLFsfS2pRK5D
	eWx6OH5JsQQdVvZj+4CzzqDpXgVsqi6k8XE7mxQ=
X-Google-Smtp-Source: AA6agR7UZg63eGvx44ABnzj9B4GB1Una2uz7rHgcASUsetqcJIwIVJMCy3VHvBR9jRzHk2Mvebol7nOlrOs/bk37j2g=
X-Received: by 2002:a25:be44:0:b0:690:8e9:7d19 with SMTP id
 d4-20020a25be44000000b0069008e97d19mr1368381ybm.389.1660710396801; Tue, 16
 Aug 2022 21:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
 <20220810050712.9539-4-lukas.bulwahn@gmail.com> <081fa42d-8587-a69e-5e1c-672152ac8c3e@epam.com>
In-Reply-To: <081fa42d-8587-a69e-5e1c-672152ac8c3e@epam.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 17 Aug 2022 06:26:26 +0200
Message-ID: <CAKXUXMx4fBTN5e3aO9Hy2j3==3QDr85bknLxjyGLoT0geUq=jQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] xen: move XEN_BALLOON_MEMORY_HOTPLUG to generic config
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 1:32 PM Oleksandr Tyshchenko
<Oleksandr_Tyshchenko@epam.com> wrote:
>
>
> On 10.08.22 08:07, Lukas Bulwahn wrote:
>
> Hello Lukas, all
>
> > While reviewing arch/x86/configs/xen.config, I noticed the following
> > note in this file:
> >
> >    '# depends on MEMORY_HOTPLUG, arm64 doesn't enable this yet,
> >    '# move to generic config if it ever does.
> >    CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=y
> >
> > Commit 6c6685055a28 ("kconfig: add xenconfig defconfig helper") in June
> > 2015 adds this note. Fortunately, commit 4ab215061554 ("arm64: Add memory
> > hotplug support") from December 2018 adds the memory hotplug in arm64, so
> > the precondition of this note above is now met.
> >
> > Move setting the config XEN_BALLOON_MEMORY_HOTPLUG into the generic
> > xen.config now.
>
>
> I might have missed something but I have never heard of anyone using
> XEN_BALLOON_MEMORY_HOTPLUG on Arm.
>
> Looking into the code, I am afraid, CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
> won't be functional on Arm without reworking resource allocation logic
> in drivers/xen/ballon.c at least, since system "iomem_resource" cannot
> be used on Arm to allocate unused memory region(s), please see
> additional_memory_resource(). I might be wrong, but it feels to me that
> here we would need a similar logic like in
> drivers/xen/unpopulated-alloc.c which is functional on Arm since it uses
> specific Xen resource (on x86 it is just an iomem_resource, but on Arm
> it contains provided by the hypervisor extended regions).
>
> I am not aware of anyone working on it, so I wouldn't enable that
> support on Arm by default until the code is updated.
>

Thanks for the in-depth investigation and explanation. For now, let us
drop this patch here and keep the configs as they are.

Lukas

