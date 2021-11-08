Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14184480F7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 15:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223353.386019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5Iu-00034V-8K; Mon, 08 Nov 2021 14:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223353.386019; Mon, 08 Nov 2021 14:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5Iu-00032I-5L; Mon, 08 Nov 2021 14:07:20 +0000
Received: by outflank-mailman (input) for mailman id 223353;
 Mon, 08 Nov 2021 14:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVlX=P3=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1mk5Is-00032C-Fv
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:07:18 +0000
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dde7282-409d-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 15:07:17 +0100 (CET)
Received: by mail-vk1-f171.google.com with SMTP id bc10so8260196vkb.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Nov 2021 06:07:17 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175])
 by smtp.gmail.com with ESMTPSA id f11sm976215vkk.50.2021.11.08.06.07.14
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 06:07:14 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id t127so8233052vke.13
 for <xen-devel@lists.xenproject.org>; Mon, 08 Nov 2021 06:07:14 -0800 (PST)
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
X-Inumbo-ID: 2dde7282-409d-11ec-a9d2-d9f7a1cc8784
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=srssYsTsVb5ivMDmTAt6Y7lXgP/lHHGiJX97jzZpFII=;
        b=GzS14cOoSvkQgT+7oyq3SzolYQ93C5ToR72Pk2OlU7XPjSvlP5nYnHbvk/SrHLKZ8O
         TA6f/wsj76sCk1/WrDmV9ZRSs6SqgnNMJgANshHtz1n98qGe2WCtrYOIko3oBNo3Z3bb
         Op9YCyfiAjn7XsLd4dxoJ3nxuMLhIZ7NJ2wNBhECZ7PlBMOLdvYFckYmL9Y/6/ha4oHc
         2HWvXMv1S7Z8o8v57EIVYdK0h5YHbU+FAVPKrgIr8E5otpgB5H1JwAMBYjPcT7VtMH27
         YVg5M8YSIpaSkFaWGIOsLceI0d9sHl4RIZav10Rjq6Pz1VUst4T4OeXD2H/y/Nk12VTb
         Gd5Q==
X-Gm-Message-State: AOAM531v2LOi1Qs8vN/CYXn1PI9DJ+szBGn7d6t6kMh05ibbKiQSLYuy
	BKHoJtdxw3YKZnDfPCfoQ5Ln20lXWv/qolZz
X-Google-Smtp-Source: ABdhPJzOmeNaSuceIBbZaZpv/a1siIsbwJIOdxhcxFSukyfj4Xqae45wnivUf7l21tGcWGdHL9REZQ==
X-Received: by 2002:a05:6122:548:: with SMTP id y8mr13363304vko.24.1636380435863;
        Mon, 08 Nov 2021 06:07:15 -0800 (PST)
X-Received: by 2002:a05:6122:1350:: with SMTP id f16mr21288847vkp.26.1636380434409;
 Mon, 08 Nov 2021 06:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20211108101157.15189-1-bp@alien8.de> <20211108101157.15189-43-bp@alien8.de>
In-Reply-To: <20211108101157.15189-43-bp@alien8.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
Message-ID: <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rohit Maheshwari <rohitm@chelsio.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, intel-gvt-dev@lists.freedesktop.org, 
	alpha <linux-alpha@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-edac@vger.kernel.org, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linux-hyperv@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-leds <linux-leds@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	Linux PM list <linux-pm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	scsi <linux-scsi@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	linux-staging@lists.linux.dev, linux-tegra <linux-tegra@vger.kernel.org>, 
	linux-um <linux-um@lists.infradead.org>, USB list <linux-usb@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, netdev <netdev@vger.kernel.org>, 
	openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, 
	sparclinux <sparclinux@vger.kernel.org>, "the arch/x86 maintainers" <x86@kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Mon, Nov 8, 2021 at 11:13 AM Borislav Petkov <bp@alien8.de> wrote:
> From: Borislav Petkov <bp@suse.de>
>
> The notifier registration routine doesn't return a proper error value
> when a callback has already been registered, leading people to track
> whether that registration has happened at the call site:
>
>   https://lore.kernel.org/amd-gfx/20210512013058.6827-1-mukul.joshi@amd.c=
om/
>
> Which is unnecessary.
>
> Return -EEXIST to signal that case so that callers can act accordingly.
> Enforce callers to check the return value, leading to loud screaming
> during build:
>
>   arch/x86/kernel/cpu/mce/core.c: In function =E2=80=98mce_register_decod=
e_chain=E2=80=99:
>   arch/x86/kernel/cpu/mce/core.c:167:2: error: ignoring return value of \
>    =E2=80=98blocking_notifier_chain_register=E2=80=99, declared with attr=
ibute warn_unused_result [-Werror=3Dunused-result]
>     blocking_notifier_chain_register(&x86_mce_decoder_chain, nb);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Drop the WARN too, while at it.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Borislav Petkov <bp@suse.de>

Thanks for your patch!

> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -141,13 +141,13 @@ extern void srcu_init_notifier_head(struct srcu_not=
ifier_head *nh);
>
>  #ifdef __KERNEL__
>
> -extern int atomic_notifier_chain_register(struct atomic_notifier_head *n=
h,
> +extern int __must_check atomic_notifier_chain_register(struct atomic_not=
ifier_head *nh,
>                 struct notifier_block *nb);
> -extern int blocking_notifier_chain_register(struct blocking_notifier_hea=
d *nh,
> +extern int __must_check blocking_notifier_chain_register(struct blocking=
_notifier_head *nh,
>                 struct notifier_block *nb);
> -extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
> +extern int __must_check raw_notifier_chain_register(struct raw_notifier_=
head *nh,
>                 struct notifier_block *nb);
> -extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
> +extern int __must_check srcu_notifier_chain_register(struct srcu_notifie=
r_head *nh,
>                 struct notifier_block *nb);

I think the addition of __must_check is overkill, leading to the
addition of useless error checks and message printing.  Many callers
call this where it cannot fail, and where nothing can be done in the
very unlikely event that the call would ever start to fail.

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

