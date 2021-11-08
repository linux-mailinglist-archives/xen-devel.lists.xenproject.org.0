Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A4E447B5D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 08:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223091.385634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjzNR-0005Tz-9E; Mon, 08 Nov 2021 07:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223091.385634; Mon, 08 Nov 2021 07:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjzNR-0005RB-5H; Mon, 08 Nov 2021 07:47:37 +0000
Received: by outflank-mailman (input) for mailman id 223091;
 Mon, 08 Nov 2021 07:47:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVlX=P3=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1mjzNP-0005R5-LH
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 07:47:35 +0000
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2205577b-4068-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 08:47:34 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so8128350pji.5
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 23:47:34 -0800 (PST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172])
 by smtp.gmail.com with ESMTPSA id e14sm5368584pfv.18.2021.11.07.23.47.32
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:47:32 -0800 (PST)
Received: by mail-pg1-f172.google.com with SMTP id g28so5782870pgg.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 23:47:32 -0800 (PST)
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
X-Inumbo-ID: 2205577b-4068-11ec-9787-a32c541c8605
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=niQCVpji9nu8a8Mfie3ofua8MkF1HzpLuS22ys5pvwg=;
        b=0QcHrMMSQJxp831IZSg0XwnJLCIW4yZsqYFIcYJTblNau1cRQ1anGsrxszTYA41DdP
         IJHggbGpsJWQzYCAXBoPMES7hGTN/cncUtgam3OA27p83ngBazrtQGEYPd8O6UDeO3fi
         Ld6+EWW8mQBn0NnoZN5zxu04BlqF1wTW6/EOlBKXJi/qdnU9zKqWwuFTWtjsMth5SiFz
         k3QlPFhO5ffoAL3+2SOGpfcfw2Wtj92z68DnE4+iLYqWsBg6RthYKwImoslmQQrm3QMD
         60775Rs0/1fBVXQ0CF3ykzr50AkeqWJH+iskgzmIIb5aTRiEH1zrxZ1sizkS25Wpp4Dn
         6uug==
X-Gm-Message-State: AOAM530fBxvujElYAdqD49Z2ANd9iNBA26eEJuhhBYZUPq5wh7leFq7L
	bwOnaRuECsvDiYsfslH/RVq5ZcyABO4ZTw==
X-Google-Smtp-Source: ABdhPJwwnw8cYmijPCKsVWR3w8z+YZUgFiQu0Glm7Hx3iYQvNzbkhoPqd9fcDkx54n+OSQNWFg5hXw==
X-Received: by 2002:a17:903:32c5:b0:141:eb39:30b7 with SMTP id i5-20020a17090332c500b00141eb3930b7mr49187230plr.41.1636357652580;
        Sun, 07 Nov 2021 23:47:32 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id b7mr71214037vsu.35.1636357641114;
 Sun, 07 Nov 2021 23:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20211108004524.29465-1-digetx@gmail.com> <20211108004524.29465-22-digetx@gmail.com>
In-Reply-To: <20211108004524.29465-22-digetx@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 08:47:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpW0389_uJR2xg+HCstXanutPxrcRdvgu8kxH1J9T++w@mail.gmail.com>
Message-ID: <CAMuHMdXpW0389_uJR2xg+HCstXanutPxrcRdvgu8kxH1J9T++w@mail.gmail.com>
Subject: Re: [PATCH v3 21/25] m68k: Switch to new sys-off handler API
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
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
	Santosh Shilimkar <ssantosh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 8, 2021 at 1:48 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> Kernel now supports chained power-off handlers. Use
> register_power_off_handler() that registers power-off handlers and
> do_kernel_power_off() that invokes chained power-off handlers. Legacy
> pm_power_off() will be removed once all drivers will be converted to
> the new power-off API.
>
> Normally arch code should adopt only the do_kernel_power_off() at first,
> but m68k is a special case because it uses pm_power_off() "inside out",
> i.e. pm_power_off() invokes machine_power_off() [in fact it does nothing],
> while it's machine_power_off() that should invoke the pm_power_off(), and
> thus, we can't convert platforms to the new API separately. There are only
> two platforms changed here, so it's not a big deal.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

