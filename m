Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB854709C8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 20:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244275.422496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlDH-0003Jz-Rj; Fri, 10 Dec 2021 19:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244275.422496; Fri, 10 Dec 2021 19:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlDH-0003Hy-NZ; Fri, 10 Dec 2021 19:05:47 +0000
Received: by outflank-mailman (input) for mailman id 244275;
 Fri, 10 Dec 2021 19:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dzg=Q3=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1mvlDG-0003Hp-7Y
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 19:05:46 +0000
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d0a3226-59ec-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 20:05:45 +0100 (CET)
Received: by mail-oi1-f172.google.com with SMTP id s139so14412522oie.13
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 11:05:45 -0800 (PST)
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
X-Inumbo-ID: 2d0a3226-59ec-11ec-ad7a-b7ef48004f0a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c+Gg3IcBrVO+p3DERDiz2wIK2rZh3JBEUqlmxz2Wt9w=;
        b=jZ6gimX04kWQogSZbFYT/iQs4r1jnOcDdPoME78rdegXAlfy4dcxqjSFXJnUn5B+81
         a9wQqrkPmVQaEOOZSe6JmTnDhq2c5IJAOibE2+qrfWViHyESe2tyOtjJObkGafgEU6bj
         QbjUkeJ2rMuwxp8FUuX1lmkAkM0Nffd3Oh996uiugB6E1TiIadhQ3IEVucfyTtyF6RWo
         1ifis9q+p0VtElgmGoih6QE2OqQMdRQzGokQ4yXGOeKan27qrOClfeNrKMzyqZbqMGMo
         wsprkP2Iu3m64fET3j6JHS+V6Q0fKW1kEvfI5vMl/B67382FWdQz91cP/zgZMKavJ2sh
         C2bQ==
X-Gm-Message-State: AOAM533Z+M0fck8J7k4467+9CDGhez4IRdWza1+BossI5F0Xjc7oYbKN
	ZtSgzEROElbWYkjthnaNJo01DobMbG+EFC0+IMI=
X-Google-Smtp-Source: ABdhPJyFnxvuCdo/SAuZsTrbeFY0ttrM6VIAZMHiyNGyFieUXOlcjM/63kmCFhhj1nwi5THbS12OxkRKZ5ROskKDe+g=
X-Received: by 2002:aca:eb0b:: with SMTP id j11mr14151206oih.51.1639163143930;
 Fri, 10 Dec 2021 11:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-4-digetx@gmail.com>
 <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com> <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
In-Reply-To: <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 20:05:32 +0100
Message-ID: <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
Subject: Re: [PATCH v4 03/25] notifier: Add atomic/blocking_notifier_has_unique_priority()
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
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
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 7:52 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 10.12.2021 21:19, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head =
*nh,
> >> +               struct notifier_block *n)
> >> +{
> >> +       unsigned long flags;
> >> +       bool ret;
> >> +
> >> +       spin_lock_irqsave(&nh->lock, flags);
> >> +       ret =3D notifier_has_unique_priority(&nh->head, n);
> >> +       spin_unlock_irqrestore(&nh->lock, flags);
> >
> > This only works if the caller can prevent new entries from being added
> > to the list at this point or if the caller knows that they cannot be
> > added for some reason, but the kerneldoc doesn't mention this
> > limitation.
>
> I'll update the comment.
>
> ..
> >> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_h=
ead *nh,
> >> +               struct notifier_block *n)
> >> +{
> >> +       bool ret;
> >> +
> >> +       /*
> >> +        * This code gets used during boot-up, when task switching is
> >> +        * not yet working and interrupts must remain disabled. At suc=
h
> >> +        * times we must not call down_read().
> >> +        */
> >> +       if (system_state !=3D SYSTEM_BOOTING)
> >
> > No, please don't do this, it makes the whole thing error-prone.
>
> What should I do then?

First of all, do you know of any users who may want to call this
during early initialization?  If so, then why may they want to do
that?

Depending on the above, I would consider adding a special mechanism for the=
m.

> >> +               down_read(&nh->rwsem);
> >> +
> >> +       ret =3D notifier_has_unique_priority(&nh->head, n);
> >> +
> >> +       if (system_state !=3D SYSTEM_BOOTING)
> >> +               up_read(&nh->rwsem);
> >
> > And still what if a new entry with a non-unique priority is added to
> > the chain at this point?
>
> If entry with a non-unique priority is added after the check, then
> obviously it won't be detected.

Why isn't this a problem?

> I don't understand the question. These
> down/up_read() are the locks that prevent the race, if that's the questio=
n.

Not really, they only prevent the race from occurring while
notifier_has_unique_priority() is running.

If anyone depends on this check for correctness, they need to lock the
rwsem, do the check, do the thing depending on the check while holding
the rwsem and then release the rwsem.  Otherwise it is racy.

