Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8A532CD8
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 17:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336593.560947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntW4Z-0004k4-SE; Tue, 24 May 2022 15:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336593.560947; Tue, 24 May 2022 15:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntW4Z-0004hM-PB; Tue, 24 May 2022 15:03:47 +0000
Received: by outflank-mailman (input) for mailman id 336593;
 Tue, 24 May 2022 15:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FE+p=WA=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1ntW4Y-0004hE-Ua
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 15:03:46 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4f77fe7-db72-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 17:03:45 +0200 (CEST)
Received: by mail-qt1-f170.google.com with SMTP id x7so11698642qta.6
 for <xen-devel@lists.xenproject.org>; Tue, 24 May 2022 08:03:45 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 b84-20020ae9eb57000000b006a35ac236c4sm6328388qkg.113.2022.05.24.08.03.41
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 08:03:42 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id v26so3064515ybd.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 May 2022 08:03:41 -0700 (PDT)
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
X-Inumbo-ID: b4f77fe7-db72-11ec-bd2c-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xvY3YRGz6Q5JdIA0GD3/2z1w0vgXjW2K3nWPGIL58cE=;
        b=l0lRcPUICIZ8JDuZ92d1Dm1MQxdI68Gu2fqad8tgtRc5ygknRRmkvf1blmcdLdsabH
         qNVkpl7d/zf0I+K4TF4QTaTYQ9MZ5yUuRNQ3V+5h+LpxVetHUq0bZMwZpZ/F1SIo1ZNL
         cbx/G6C0qg9TJv1JRG17VPYjkOIErFdstsGJOkQ28BcWG/5z1WwBAggEPZpTLYY+Lu3M
         P5S5fVl8NwqvUho4ilM+/POLdnXb75IUwQf2B82VoV5FInk/tk0A1kBJFRHJie5NZc7F
         k/wrxPxWShuR066K1UaNW3WMRD0yBFVW1pZ9RH0c+bOBG7xJEDSdweSM32vrp7Rw9ffM
         gdmQ==
X-Gm-Message-State: AOAM530J0JQpuJiRDzF4kjTOHAPxOFihbs664J24rc6Ph173va4PgKan
	HDEW6Ua1mPIZ5v/t370W22gmszFro3zlGaQ1
X-Google-Smtp-Source: ABdhPJx5Ucq0yhsG1V8gn7d4NwKO0a9Ja3zJgx7Tkmpskrt2PNGCV3iO4qNS/HKBqh8KZfKf40jiow==
X-Received: by 2002:a05:622a:144a:b0:2f3:bd33:5a1f with SMTP id v10-20020a05622a144a00b002f3bd335a1fmr20179797qtx.96.1653404624065;
        Tue, 24 May 2022 08:03:44 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr28501106ywh.384.1653404610585; Tue, 24
 May 2022 08:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <20220509233235.995021-8-dmitry.osipenko@collabora.com> <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
 <c4914e14-1882-55a1-bcbd-a905852b45a3@collabora.com>
In-Reply-To: <c4914e14-1882-55a1-bcbd-a905852b45a3@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 May 2022 17:03:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBWWVeegvLQQzT8CRL5z38AhXigaNjzw8p0NwQ1B4DPQ@mail.gmail.com>
Message-ID: <CAMuHMdWBWWVeegvLQQzT8CRL5z38AhXigaNjzw8p0NwQ1B4DPQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/27] kernel/reboot: Add kernel_can_power_off()
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
	linux-tegra <linux-tegra@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, May 24, 2022 at 3:41 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> On 5/24/22 16:14, Geert Uytterhoeven wrote:
> > On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >> Add kernel_can_power_off() helper that replaces open-coded checks of
> >> the global pm_power_off variable. This is a necessary step towards
> >> supporting chained power-off handlers.
> >>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >
> > Thanks for your patch, which is now commit 0e2110d2e910e44c
> > ("kernel/reboot: Add kernel_can_power_off()") in pm/linux-next.
> >
> > This causes the "poweroff" command (Debian nfsroot) to no longer
> > cleanly halt the system on arm32 systems, but fail with a panic
> > instead:
> >
> > -reboot: System halted
> > +reboot: Power down
> > +Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00000=
000
> > +CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted
> > 5.18.0-rc7-shmobile-00007-g0e2110d2e910 #1274
> > +Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> > + unwind_backtrace from show_stack+0x10/0x14
> > + show_stack from dump_stack_lvl+0x40/0x4c
> > + dump_stack_lvl from panic+0xf4/0x330
> > + panic from do_exit+0x1c8/0x8e4
> > + do_exit from __do_sys_reboot+0x174/0x1fc
> > + __do_sys_reboot from ret_fast_syscall+0x0/0x54
> > +Exception stack(0xf0815fa8 to 0xf0815ff0)
> > +5fa0:                   004e6954 00000000 fee1dead 28121969 4321fedc f=
0d94600
> > +5fc0: 004e6954 00000000 00000000 00000058 befa0c78 00000000 befa0c10 0=
04e56f8
> > +5fe0: 00000058 befa0b6c b6ec8d45 b6e4a746
> > +---[ end Kernel panic - not syncing: Attempted to kill init!
> > exitcode=3D0x00000000 ]---
> >
> > On arm64, "poweroff" causes a clean "reboot: Power down" before/after.
> >
> > On both arm32 and arm64, the same handlers are registered:
> >   - SYS_OFF_MODE_POWER_OFF_PREPARE: legacy_pm_power_off_prepare
> >   - SYS_OFF_MODE_POWER_OFF: legacy_pm_power_off
> >
> > On both arm32 and arm64, legacy_pm_power_off_prepare() is called.
> > On both arm32 and arm64, legacy_pm_power_off() does not seem to
> > be called.
> >
> > On arm32, both pm_power_off_prepare and pm_power_off are NULL.
> > On arm64, pm_power_off_prepare is NULL, and
> > pm_power_off is psci_sys_poweroff.
> >
> > Do you have a clue?
> > Thanks!
>
> Thank you, Geert! I see the problem, the kernel_can_power_off() checks wh=
ether power-off handler is registered, but it's always registered because l=
egacy_pm_power_off is registered unconditionally. So it causes trouble for =
platforms that don't have power-off handler installed at all. All platforms=
 that I tested have a power-off handler, so now wonder that I didn't notice=
 this before.
>
> This change should fix the problem, please give it a try:

Thank you, that fixes the problem for me!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

