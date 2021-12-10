Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D24D4708E0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 19:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244227.422405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkhG-0001kr-Af; Fri, 10 Dec 2021 18:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244227.422405; Fri, 10 Dec 2021 18:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkhG-0001iO-7h; Fri, 10 Dec 2021 18:32:42 +0000
Received: by outflank-mailman (input) for mailman id 244227;
 Fri, 10 Dec 2021 18:32:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dzg=Q3=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1mvkhE-0001iI-FU
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 18:32:40 +0000
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d7e1936-59e7-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 19:32:39 +0100 (CET)
Received: by mail-ot1-f54.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so10482431otj.7
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 10:32:39 -0800 (PST)
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
X-Inumbo-ID: 8d7e1936-59e7-11ec-ad7a-b7ef48004f0a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XYFeMefDtygzQHG6cGasFJft83PyhMCvIHgML7JQ1W8=;
        b=GWUFwvt/Uw5U+ek9xO5fZc3BUkwAkF2qhUk/SvNVsh0s0GFQHk59QIydpKDYMMIz1H
         osVr9M9jjDQSQt1sMxuJYkJhwGwkrvw9Z/6FSu4kEmKOg4gLgHgG0aeM9zikHZdiXG7Y
         dPTus7aeEdmK+i3OhA+QqfuJcX5j4dTv9o0RudDHNHDokxSXcgbRDHrYfFezr8arNSiH
         xNvt/hcynw3dIvorTsJ9xYfQc7387aqXyl+vBCu8+BGlKcDw/nKQmIE1W9mFGJw31LHR
         RCV2o336KQhGKCsX4EpWxN+bcW7frU6c61B5uzZ5Ci3spYA4+ut3LxtJfCKBvCenF/DL
         ZVzg==
X-Gm-Message-State: AOAM530xlrVmeC6XOd4W0SfllfxwCyi1E3gTOYM8G9UWe+7dKFRDsm7j
	lk1d8Gk0f0WdlsRKUPRibmFWu6HdphTcDFgiGWw=
X-Google-Smtp-Source: ABdhPJy/ApH2I9ley83OfAtDiEoSWuJBoE9Gqun3QKF0IviB+39TRacgd3bR+5yVv4MXsqS5F4aemy99lcaDR84MB0I=
X-Received: by 2002:a05:6830:348f:: with SMTP id c15mr12642134otu.254.1639161158278;
 Fri, 10 Dec 2021 10:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-7-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-7-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:32:27 +0100
Message-ID: <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler() fails
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
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
	Santosh Shilimkar <ssantosh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	alankao@andestech.com, "K . C . Kuen-Chern Lin" <kclin@andestech.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Emit warning if unregister_restart_handler() fails since it never should
> fail. This will ease further API development by catching mistakes early.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  kernel/reboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index e6659ae329f1..f0e7b9c13f6b 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
>   */
>  int unregister_restart_handler(struct notifier_block *nb)
>  {
> -       return atomic_notifier_chain_unregister(&restart_handler_list, nb);
> +       return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));

The only reason why it can fail is if the object pointed to by nb is
not in the chain.  Why WARN() about this?  And what about systems with
panic_on_warn set?

>  }
>  EXPORT_SYMBOL(unregister_restart_handler);
>
> --
> 2.33.1
>

