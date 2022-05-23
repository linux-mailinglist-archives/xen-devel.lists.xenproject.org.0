Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B190153244C
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336232.560593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPB2-0006Po-AE; Tue, 24 May 2022 07:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336232.560593; Tue, 24 May 2022 07:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPB1-0006JQ-T8; Tue, 24 May 2022 07:41:59 +0000
Received: by outflank-mailman (input) for mailman id 336232;
 Tue, 24 May 2022 07:41:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FE+p=WA=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1ntP6f-0003DA-VE
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:37:30 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55a081ad-dac2-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 20:01:14 +0200 (CEST)
Received: by mail-qt1-f170.google.com with SMTP id g21so4644559qtg.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 May 2022 11:01:14 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 y2-20020ac85242000000b002f39b99f6c4sm4573161qtn.94.2022.05.23.11.01.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 11:01:12 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id x2so26474862ybi.8
 for <xen-devel@lists.xenproject.org>; Mon, 23 May 2022 11:01:11 -0700 (PDT)
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
X-Inumbo-ID: 55a081ad-dac2-11ec-837e-e5687231ffcc
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N4rBBcobCQCpRnDX0N4E6NWTW64w3K1pdJQpMj8qNhc=;
        b=y6RadUp4wQj9jBXhaazYsxG8oQiK1rVeHfq1ev4q9Sx/EI9maaq9kY2cK6bRMhPCSP
         5+eQzPyNEM48nHEBzkDGY4d63x1qzxpwZoW/tVpE1gFKDEkPsEOnytD1B1uUF1Oed9SO
         QvXQ01o9JVy8bn4uQMZhX5skN9ra/Ku76CqCltsHh6q3TvEwMJOIGdPfrMIZD8O4Y6mP
         1tmMd+ZCGwmK+LOJ/cMdRg93dpHtIozfgRc5Pb3zNxhRmymrTzyAVmD+145FzmZXJuN+
         9OsTuKs/2NJzR2tsC47NxfFrxzi+n2e+0QrZv71rMghBBK/3LSW8S3kkF3hxYdV7SkGJ
         Vg6g==
X-Gm-Message-State: AOAM531foEnqPeKnrAiS3iysvjrsPRActHN9B0CZpT3H/iNGvqi4gKMI
	sbz1Sn0BKKSx9kj99Aeb5nvs/aIyvHFYecxktV0=
X-Google-Smtp-Source: ABdhPJxrgCQkt4YlApx/X3lW/cYTC6wPuP0E3c2ZnkOjLSK7XFEkMXiNvVCk4FPEaF7nnwvCpEVvSw==
X-Received: by 2002:ac8:5dcf:0:b0:2f9:15de:2e40 with SMTP id e15-20020ac85dcf000000b002f915de2e40mr15295924qtx.526.1653328872813;
        Mon, 23 May 2022 11:01:12 -0700 (PDT)
X-Received: by 2002:a81:ad11:0:b0:2fe:fb00:a759 with SMTP id
 l17-20020a81ad11000000b002fefb00a759mr24887559ywh.283.1653328860919; Mon, 23
 May 2022 11:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com> <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
In-Reply-To: <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 May 2022 20:00:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
Message-ID: <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
Subject: Re: [PATCH v8 00/27] Introduce power-off+restart call chain API
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Rafael,

On Wed, May 18, 2022 at 4:46 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:

> >   m68k: Switch to new sys-off handler API

Sorry, I didn't realize this was going to interact with the new m68k
virtual machine support, which is included in the m68k pull request
for v5.19.

> However, I'm going to send a pull request with it in the second half
> of the merge window, after the majority of the other changes in the
> subsystems touched by it have been integrated.

And presumably you will have to merge in v5.19-rc1, too?

I've sent a fix.  It should appear at
https://lore.kernel.org/r/20220523175520.949681-1-geert@linux-m68k.org
soon.

Can you please include that in your PR?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

