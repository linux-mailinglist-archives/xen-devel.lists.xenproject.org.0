Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D88E5223B1
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 20:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325965.548780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noUND-0007oO-Tg; Tue, 10 May 2022 18:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325965.548780; Tue, 10 May 2022 18:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noUND-0007mB-Qd; Tue, 10 May 2022 18:14:15 +0000
Received: by outflank-mailman (input) for mailman id 325965;
 Tue, 10 May 2022 18:14:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dEKS=VS=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1noUNC-0007m4-B8
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 18:14:14 +0000
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe42a14a-d08c-11ec-a406-831a346695d4;
 Tue, 10 May 2022 20:14:12 +0200 (CEST)
Received: by mail-yb1-f174.google.com with SMTP id v59so32171681ybi.12
 for <xen-devel@lists.xenproject.org>; Tue, 10 May 2022 11:14:12 -0700 (PDT)
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
X-Inumbo-ID: fe42a14a-d08c-11ec-a406-831a346695d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qpqXrLDWUEHd+BUtmgMjhwAa3QcGPruT6uNMBEv9rjU=;
        b=U3Um5tuc/JePLD08JZdzeJsPB022i8qjlz0FzJMOe0JoFvdG+NwPaqIbKKczkJSjni
         LGwPmx/lA/DQfsmVZnK0yPAJPtvNUHougiJotyNRrSlj0REk9AUiYAI4DcxcBxppsbOu
         778UaN0sUn7/g/zONMhYmYDAJLiU4sua5dBiKhl3YrdyRhLAAFcvvzUuQMmLDy1QwhBA
         FMHp8Gw7WrYkka1wavXWlGZdXCiTh95LVocLdcEFoIRP27jtrqHWBGXA7XGtX+XI7u4x
         5QYJ5L9oKHJx2aK0QXvWS6Brxv7ktbrr3NbhTNN71HAjoKGaGsp8lNMrJUpvkfAPHIT1
         6nVg==
X-Gm-Message-State: AOAM533vRtAstAXjUwhlzjHb5nOElZDTRqIVaMArmNBygiEX50uFFFQA
	RbJVFVAaZiMFaiU0TRMWeqp1ncrL/A7cevbk7AQ=
X-Google-Smtp-Source: ABdhPJy/3C7Xf5XL6o3yFhMZ917Dv3JWEaRfPbmjw9NKhK3//cChodJMWe9FmxWaGm5UEgRYGP1Nqk2NauJUMOpu3kk=
X-Received: by 2002:a25:e792:0:b0:645:7ddb:b5eb with SMTP id
 e140-20020a25e792000000b006457ddbb5ebmr19781278ybh.482.1652206451725; Tue, 10
 May 2022 11:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com> <20220509233235.995021-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20220509233235.995021-2-dmitry.osipenko@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 10 May 2022 20:14:00 +0200
Message-ID: <CAJZ5v0gApRhc9+jZLxgNXC2B2tmz450=8+mFZUjTFF1iU7C-gw@mail.gmail.com>
Subject: Re: [PATCH v8 01/27] notifier: Add atomic_notifier_call_chain_is_empty()
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
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Add atomic_notifier_call_chain_is_empty() that returns true if given
> atomic call chain is empty.

It would be good to mention a use case for it.

> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  include/linux/notifier.h |  2 ++
>  kernel/notifier.c        | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/linux/notifier.h b/include/linux/notifier.h
> index 87069b8459af..95e2440037de 100644
> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -173,6 +173,8 @@ extern int blocking_notifier_call_chain_robust(struct=
 blocking_notifier_head *nh
>  extern int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
>                 unsigned long val_up, unsigned long val_down, void *v);
>
> +extern bool atomic_notifier_call_chain_is_empty(struct atomic_notifier_h=
ead *nh);
> +
>  #define NOTIFY_DONE            0x0000          /* Don't care */
>  #define NOTIFY_OK              0x0001          /* Suits me */
>  #define NOTIFY_STOP_MASK       0x8000          /* Don't call further */
> diff --git a/kernel/notifier.c b/kernel/notifier.c
> index ba005ebf4730..aaf5b56452a6 100644
> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -204,6 +204,19 @@ int atomic_notifier_call_chain(struct atomic_notifie=
r_head *nh,
>  EXPORT_SYMBOL_GPL(atomic_notifier_call_chain);
>  NOKPROBE_SYMBOL(atomic_notifier_call_chain);
>
> +/**
> + *     atomicnotifier_call_chain_is_empty - Check whether notifier chain=
 is empty
> + *     @nh: Pointer to head of the blocking notifier chain
> + *
> + *     Checks whether notifier chain is empty.
> + *
> + *     Returns true is notifier chain is empty, false otherwise.
> + */
> +bool atomic_notifier_call_chain_is_empty(struct atomic_notifier_head *nh=
)
> +{
> +       return !rcu_access_pointer(nh->head);
> +}
> +
>  /*
>   *     Blocking notifier chain routines.  All access to the chain is
>   *     synchronized by an rwsem.
> --
> 2.35.1
>

