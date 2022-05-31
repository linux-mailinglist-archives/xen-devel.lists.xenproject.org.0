Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D8A5396B9
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 21:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340003.564935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw7AX-00015K-8t; Tue, 31 May 2022 19:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340003.564935; Tue, 31 May 2022 19:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw7AX-00013Y-5I; Tue, 31 May 2022 19:04:41 +0000
Received: by outflank-mailman (input) for mailman id 340003;
 Tue, 31 May 2022 19:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yf9x=WH=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1nw7AV-00013S-PW
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 19:04:39 +0000
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8418e4b0-e114-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 21:04:38 +0200 (CEST)
Received: by mail-qk1-f170.google.com with SMTP id l82so13910601qke.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 May 2022 12:04:38 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 x4-20020a05622a000400b002f39b99f67fsm10243003qtw.25.2022.05.31.12.04.34
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 12:04:35 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id l204so14829617ybf.10
 for <xen-devel@lists.xenproject.org>; Tue, 31 May 2022 12:04:34 -0700 (PDT)
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
X-Inumbo-ID: 8418e4b0-e114-11ec-bd2c-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ZeGJTUXZPxAO5jhONwtVhilmc3GtYxBhVB9MqXOe9g=;
        b=bbNuy6GGnqhCzxdm5M5AYNaFP6sF5iSssQSZWQQVM9IEsPCp/XoC/WIOIx2v8/ipJl
         RCPDsDzvhdP3Dcy3/c72z7+v1hgM10HeUi5pn5cMvtmeWt+aMtYtBqH96N2wWwpflhWH
         0JRK6GXBCqWLO/vBHZnRkbvKOv/ULc/cB8zTp8wr8SZYHTT74M79vUQ7f0hYEdUd7xUy
         pxpieQoKTnhmS2N0Xfx15P7tTGz1ctwmNycZuBdnRKwcMs8yqYRrzIOiFDZsXuQNSBHJ
         lmEHh2XgDmeVjkPYSCKinOebwkw2JcE2v3PUga/1COjybUns+ZoqrrI14bWVhfBX+2lc
         5YiQ==
X-Gm-Message-State: AOAM5304pcj1Q2/2qY/cnPwl6pcIc5emT9AOZ9BZ+qmZ5s4e3usEKxfW
	q5SVRNt3sNuXhfDLaO+kLSoEUGXGe4+uag==
X-Google-Smtp-Source: ABdhPJxyqeVu0LSkHESkSCAU1VXDRr7WuU91RAaM4FMLTufljhoC7v+acq7a1DnFfvoyNStI+mdRfA==
X-Received: by 2002:a37:a642:0:b0:6a3:5952:c044 with SMTP id p63-20020a37a642000000b006a35952c044mr36488156qke.770.1654023876508;
        Tue, 31 May 2022 12:04:36 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr61384058ybb.202.1654023864081; Tue, 31
 May 2022 12:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com> <20220509233235.995021-17-dmitry.osipenko@collabora.com>
In-Reply-To: <20220509233235.995021-17-dmitry.osipenko@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 May 2022 21:04:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFqf58F31EAGnhp_cu9k-G4Sx1cmwx-PGb3mU+6bjRnQ@mail.gmail.com>
Message-ID: <CAMuHMdUFqf58F31EAGnhp_cu9k-G4Sx1cmwx-PGb3mU+6bjRnQ@mail.gmail.com>
Subject: Re: [PATCH v8 16/27] m68k: Switch to new sys-off handler API
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
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, May 10, 2022 at 1:34 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Kernel now supports chained power-off handlers. Use
> register_power_off_handler() that registers power-off handlers and
> do_kernel_power_off() that invokes chained power-off handlers. Legacy
> pm_power_off() will be removed once all drivers will be converted to
> the new sys-off API.
>
> Normally arch code should adopt only the do_kernel_power_off() at first,
> but m68k is a special case because it uses pm_power_off() "inside out",
> i.e. pm_power_off() invokes machine_power_off() [in fact it does nothing]=
,
> while it's machine_power_off() that should invoke the pm_power_off(), and
> thus, we can't convert platforms to the new API separately. There are onl=
y
> two platforms changed here, so it's not a big deal.
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Thanks for your patch, which is now commit f0f7e5265b3b37b0
("m68k: Switch to new sys-off handler API") upstream.

> --- a/arch/m68k/emu/natfeat.c
> +++ b/arch/m68k/emu/natfeat.c
> @@ -15,6 +15,7 @@
>  #include <linux/string.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/reboot.h>
>  #include <linux/io.h>
>  #include <asm/machdep.h>
>  #include <asm/natfeat.h>
> @@ -90,5 +91,5 @@ void __init nf_init(void)
>         pr_info("NatFeats found (%s, %lu.%lu)\n", buf, version >> 16,
>                 version & 0xffff);
>
> -       mach_power_off =3D nf_poweroff;
> +       register_platform_power_off(nf_poweroff);

Unfortunately nothing is registered, as this is called very early
(from setup_arch(), before the memory allocator is available.
Hence register_sys_off_handler() fails with -ENOMEM, and poweroff
stops working.

Possible solutions:
  - As at most one handler can be registered,
    register_platform_power_off() could use a static struct sys_off_handler
    instance,
  - Keep mach_power_off, and call register_platform_power_off() later.

Anything else?
Thanks!

> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -12,6 +12,7 @@
>
>  #include <linux/errno.h>
>  #include <linux/module.h>
> +#include <linux/reboot.h>
>  #include <linux/types.h>
>  #include <linux/mm.h>
>  #include <linux/tty.h>
> @@ -140,7 +141,6 @@ void __init config_mac(void)
>         mach_hwclk =3D mac_hwclk;
>         mach_reset =3D mac_reset;
>         mach_halt =3D mac_poweroff;
> -       mach_power_off =3D mac_poweroff;
>  #if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
>         mach_beep =3D mac_mksound;
>  #endif
> @@ -160,6 +160,8 @@ void __init config_mac(void)
>
>         if (macintosh_config->ident =3D=3D MAC_MODEL_IICI)
>                 mach_l2_flush =3D via_l2_flush;
> +
> +       register_platform_power_off(mac_poweroff);
>  }

This must have the same problem.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

