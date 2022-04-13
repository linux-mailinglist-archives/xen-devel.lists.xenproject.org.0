Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138874FFE2D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 20:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304296.518909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nei2d-0003FD-PO; Wed, 13 Apr 2022 18:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304296.518909; Wed, 13 Apr 2022 18:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nei2d-0003C7-MI; Wed, 13 Apr 2022 18:48:35 +0000
Received: by outflank-mailman (input) for mailman id 304296;
 Wed, 13 Apr 2022 18:48:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c/QC=UX=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1nei2c-0003C1-GD
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 18:48:34 +0000
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51125bf8-bb5a-11ec-a405-831a346695d4;
 Wed, 13 Apr 2022 20:48:33 +0200 (CEST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2ec04a2ebadso32319047b3.12
 for <xen-devel@lists.xenproject.org>; Wed, 13 Apr 2022 11:48:33 -0700 (PDT)
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
X-Inumbo-ID: 51125bf8-bb5a-11ec-a405-831a346695d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1rErWVySlUxlEFN2u18NGS5Qm0qvXYHGlMsYpGhhEY=;
        b=xhMvKPzvCfc+XWaG1FFR5FVrQVBBptLTt/56JXYPvreiyt3YtwjXUSkGwFKiybboZP
         3U40GqG8HgmWaxRLkhG7q+Hyeqk18kP+UuCsroUHZFTH3UwdpsRGn91G52fxaFxPOkHL
         /J8O4cDJNGyCWndFtmKACRCa7qBmcoruvxMzz0jCzdQdbknLF6/zGct7f/Vsy4PWw+NX
         5YOZdvhq9BsAtx3BCiyHoXemHgLBeXerVbeErSoChOz7K+Ei8yVOrOi6jpi1yJS2qrSx
         xsZfmsVI4kDlNh6MSC4UdsWPNnhpdDzTTkUJKYq+UNFBtrP5CVJAW7DUZPc+HPiy9yb/
         iEpQ==
X-Gm-Message-State: AOAM530RWrSwbHibTVJ41vjgXf1luFGABzI++NME2lZ2isc8A2Kl8u4O
	zxeF01cxWwVjv2kyJX/CW1gZcbrdLa74l+XUyS8=
X-Google-Smtp-Source: ABdhPJz9BfsA7QIGi43YRDlzzrWhVjbeGEMJOs01j9nA3vXXWXOOPKhq5d8EhdtGHqqQ5dYXQmK91VGL/RQnfnI1jKs=
X-Received: by 2002:a81:7c45:0:b0:2eb:4759:cc32 with SMTP id
 x66-20020a817c45000000b002eb4759cc32mr224284ywc.515.1649875711933; Wed, 13
 Apr 2022 11:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com> <20220411233832.391817-4-dmitry.osipenko@collabora.com>
In-Reply-To: <20220411233832.391817-4-dmitry.osipenko@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 13 Apr 2022 20:48:20 +0200
Message-ID: <CAJZ5v0gf1J+yPW14TAdLGLGfO+-2s=r0DDP7d+Rgop3=dB0gaQ@mail.gmail.com>
Subject: Re: [PATCH v7 03/20] reboot: Print error message if restart handler
 has duplicated priority
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
	Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 12, 2022 at 1:39 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Add sanity check which ensures that there are no two restart handlers
> registered using the same priority. This requirement will become mandatory
> once all drivers will be converted to the new API and such errors will be
> fixed.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

The first two patches in the series are fine with me and there's only
one minor nit regarding this one (below).

> ---
>  kernel/reboot.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index ed4e6dfb7d44..acdae4e95061 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
>   */
>  int register_restart_handler(struct notifier_block *nb)
>  {
> +       int ret;
> +
> +       ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
> +       if (ret != -EBUSY)
> +               return ret;
> +
> +       /*
> +        * Handler must have unique priority. Otherwise call order is
> +        * determined by registration order, which is unreliable.
> +        *
> +        * This requirement will become mandatory once all drivers
> +        * will be converted to use new sys-off API.
> +        */
> +       pr_err("failed to register restart handler using unique priority\n");

I would use pr_info() here, because this is not a substantial error AFAICS.

> +
>         return atomic_notifier_chain_register(&restart_handler_list, nb);
>  }
>  EXPORT_SYMBOL(register_restart_handler);
> --

