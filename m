Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7031A4FD1CD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 09:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303455.517725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neAcJ-0006Oz-KJ; Tue, 12 Apr 2022 07:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303455.517725; Tue, 12 Apr 2022 07:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neAcJ-0006MS-HA; Tue, 12 Apr 2022 07:07:11 +0000
Received: by outflank-mailman (input) for mailman id 303455;
 Tue, 12 Apr 2022 07:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHcz=UW=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1neAcI-0006MM-2R
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 07:07:10 +0000
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a1925d6-ba2f-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 09:07:08 +0200 (CEST)
Received: by mail-qv1-f41.google.com with SMTP id kd21so15487048qvb.6
 for <xen-devel@lists.xenproject.org>; Tue, 12 Apr 2022 00:07:08 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 140-20020a370892000000b0069c1c277c58sm3727767qki.109.2022.04.12.00.07.05
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 00:07:05 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id z33so31532302ybh.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Apr 2022 00:07:05 -0700 (PDT)
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
X-Inumbo-ID: 2a1925d6-ba2f-11ec-a405-831a346695d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5mglcYZA42FcZWexfT//Na3N8U+QShWNDx9HhSMVxo=;
        b=Mx3nK3cU0R3yQKcQghWdLlubcbh5UGw7a1HeOLF+JeblpDRG6IMmTX2swWOgrDkK3z
         NWHy9OJFUlENAe82Tty+MlGai0hL1/N9t7DVTOjTkKo9bEH/NogYLpOLmM1iupTesQCX
         fhbdcT0CqNPKdZupM9QT5qVeBIxRZzkyLPCfX0XCrDMJsrOLL4k3vZ7dHFDL6kT2RppS
         1m6/VT1cCNDCk2e3X5GivsxROpk1FHHHYywW/txp6js6cygFBIfsRIzixDqhIgecrnCz
         +fLbawDLChJvPFT8XEhSnX4ADO4sP53es6JG/+b0xFBGEQbdWTCrAxAYUT3GXvaXyntZ
         2HoQ==
X-Gm-Message-State: AOAM533BvFcnC1dtQX4Q8FwAD6+EBoRmJtVfGsmgFjifYKYXuQUNCKah
	QgsI7E4vVvzHzyXU8W53x47DYOwVg0b9vLau
X-Google-Smtp-Source: ABdhPJy53YN6PMXFkSGTKM06ABQW2SkR5j9U3k9RxOa8ieLB5b9MGOfEBpBmxQWlNRekeDVM7bNnsQ==
X-Received: by 2002:a0c:c684:0:b0:444:3a32:e96e with SMTP id d4-20020a0cc684000000b004443a32e96emr10652595qvj.124.1649747226782;
        Tue, 12 Apr 2022 00:07:06 -0700 (PDT)
X-Received: by 2002:a25:c049:0:b0:634:6751:e8d2 with SMTP id
 c70-20020a25c049000000b006346751e8d2mr25945732ybf.6.1649747214062; Tue, 12
 Apr 2022 00:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 09:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
Message-ID: <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
Subject: Re: [PATCH v7 00/20] Introduce power-off+restart call chain API
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
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
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
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
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Tue, Apr 12, 2022 at 1:38 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Problem
> -------
>
> SoC devices require power-off call chaining functionality from kernel.
> We have a widely used restart chaining provided by restart notifier API,
> but nothing for power-off.

> Changelog:
>
> v7: - Rebased on a recent linux-next. Dropped the recently removed
>       NDS32 architecture. Only SH and x86 arches left un-acked.
>
>     - Added acks from Thomas Bogendoerfer and Krzysztof Kozlowski
>       to the MIPS and memory/emif patches respectively.

Looks like you forgot to add the actual acks?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

