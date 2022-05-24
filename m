Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99344532B06
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 15:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336557.560902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntUNd-0008RX-3K; Tue, 24 May 2022 13:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336557.560902; Tue, 24 May 2022 13:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntUNd-0008P7-0O; Tue, 24 May 2022 13:15:21 +0000
Received: by outflank-mailman (input) for mailman id 336557;
 Tue, 24 May 2022 13:15:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FE+p=WA=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1ntUNb-0008P1-Ar
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 13:15:19 +0000
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e00fba1-db63-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 15:15:18 +0200 (CEST)
Received: by mail-vk1-f180.google.com with SMTP id m203so8446394vke.13
 for <xen-devel@lists.xenproject.org>; Tue, 24 May 2022 06:15:17 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 o13-20020ab02a0d000000b003629ce160f9sm1014482uar.29.2022.05.24.06.15.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 06:15:15 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id x11so6251056uao.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 May 2022 06:15:15 -0700 (PDT)
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
X-Inumbo-ID: 8e00fba1-db63-11ec-837f-e5687231ffcc
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S/pNo5ypsj8sjqbjG1l1gWrym6AVA3NFtAtotZSuvpI=;
        b=zN2QoBd3ZJC+qgjGqhih4YSiUTctWXw3yl65rv5juiDBki8CVMiVEK4nZWwoZuMLR9
         exttk0D6c2kwjttQb/Jkdat8L5Zw95AbSLOhMYbhJC569/lsuJmWYrVoR6OICYi2/S+f
         q+XxD9sWaNVCT5S9voPvcfkQIPRUP/2Eop1aZFKVEhjtbC0h5uLPZSJwJDsabh/gOW4v
         PEZ585HHviANhJEG7/F892Azo6Q8KBKtRby6Mxzu8ATsyRzum3JH8eVWG3iZaR6YfEkO
         un2YjswxC87Nxf8WRWiAaZp2Z2j8herPBrxtEEcskZ0Wm2sUNetEMWn2jQvB+7SbBBEC
         uucA==
X-Gm-Message-State: AOAM530vAGSikAH0Knrq6lLurDBn38EJ7ELaSMbBjAeNfVWjnffws5xi
	lxm3HyGpc+VBvHVpc7OOsQyHwRq+tt2Orm1iD4g=
X-Google-Smtp-Source: ABdhPJxBdwXSMoc0F/VcD+OmPpfb/yYEjQM0Tz9uMFPhfs8pTC10BOL+1aG06zLeRqfJtZ8vsryjtQ==
X-Received: by 2002:a05:6122:8d5:b0:356:deb3:3c50 with SMTP id 21-20020a05612208d500b00356deb33c50mr9550423vkg.28.1653398116554;
        Tue, 24 May 2022 06:15:16 -0700 (PDT)
X-Received: by 2002:a25:e7ce:0:b0:64d:6028:96b9 with SMTP id
 e197-20020a25e7ce000000b0064d602896b9mr25151338ybh.365.1653398104009; Tue, 24
 May 2022 06:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com> <20220509233235.995021-8-dmitry.osipenko@collabora.com>
In-Reply-To: <20220509233235.995021-8-dmitry.osipenko@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 May 2022 15:14:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
Message-ID: <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
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

Hi Dmitry,

On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Add kernel_can_power_off() helper that replaces open-coded checks of
> the global pm_power_off variable. This is a necessary step towards
> supporting chained power-off handlers.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Thanks for your patch, which is now commit 0e2110d2e910e44c
("kernel/reboot: Add kernel_can_power_off()") in pm/linux-next.

This causes the "poweroff" command (Debian nfsroot) to no longer
cleanly halt the system on arm32 systems, but fail with a panic
instead:

-reboot: System halted
+reboot: Power down
+Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
+CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted
5.18.0-rc7-shmobile-00007-g0e2110d2e910 #1274
+Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
+ unwind_backtrace from show_stack+0x10/0x14
+ show_stack from dump_stack_lvl+0x40/0x4c
+ dump_stack_lvl from panic+0xf4/0x330
+ panic from do_exit+0x1c8/0x8e4
+ do_exit from __do_sys_reboot+0x174/0x1fc
+ __do_sys_reboot from ret_fast_syscall+0x0/0x54
+Exception stack(0xf0815fa8 to 0xf0815ff0)
+5fa0:                   004e6954 00000000 fee1dead 28121969 4321fedc f0d94600
+5fc0: 004e6954 00000000 00000000 00000058 befa0c78 00000000 befa0c10 004e56f8
+5fe0: 00000058 befa0b6c b6ec8d45 b6e4a746
+---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000000 ]---

On arm64, "poweroff" causes a clean "reboot: Power down" before/after.

On both arm32 and arm64, the same handlers are registered:
  - SYS_OFF_MODE_POWER_OFF_PREPARE: legacy_pm_power_off_prepare
  - SYS_OFF_MODE_POWER_OFF: legacy_pm_power_off

On both arm32 and arm64, legacy_pm_power_off_prepare() is called.
On both arm32 and arm64, legacy_pm_power_off() does not seem to
be called.

On arm32, both pm_power_off_prepare and pm_power_off are NULL.
On arm64, pm_power_off_prepare is NULL, and
pm_power_off is psci_sys_poweroff.

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

