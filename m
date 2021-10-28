Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A475143E0DE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 14:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217995.378261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4Rd-0006tu-29; Thu, 28 Oct 2021 12:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217995.378261; Thu, 28 Oct 2021 12:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4Rc-0006rj-Uw; Thu, 28 Oct 2021 12:23:44 +0000
Received: by outflank-mailman (input) for mailman id 217995;
 Thu, 28 Oct 2021 12:22:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhoO=PQ=gmail.com=green.hu@srs-us1.protection.inumbo.net>)
 id 1mg4Pw-0006oU-Vf
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:22:01 +0000
Received: from mail-pj1-x1034.google.com (unknown [2607:f8b0:4864:20::1034])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 620ad1b5-302e-48e5-bad1-24cde6d35744;
 Thu, 28 Oct 2021 12:22:00 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso4545502pjt.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 05:22:00 -0700 (PDT)
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
X-Inumbo-ID: 620ad1b5-302e-48e5-bad1-24cde6d35744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sEQTGe1SdVzMEvdAS+JHzGs+s//rKDLb3zrHBeoZhQ4=;
        b=iTF+KxXEUPxEL0X/A/h2gzR6rfhKbueZtpV43T9ecbwhzi0t+l3q/o5Ua3AWvU+Enc
         ByGkTqENMRntgh3iznFMDxu2CMYcinTkd+zVseDqmIBVqNiOOl7jtDTN28tXnXeh/eHS
         f+SIvvi2YC7tI22dM3EDibcHeQLa3iIqsv5H8CiejoyVxtmYKOA3VOetskmtU4Lx+Pqb
         LjWvbMeTK5pVAec3h6exgixTZBuA0b6b4pLrHZnH5EOvWXMCcJgTfSDot7PpiFpwOrmA
         UDe0Zf8yyrgR8VQIYltC0W9ualVYljq6alX4ZkNWzu2NeGmBPW3wY5ZPA2p2XVSWoIe3
         jylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sEQTGe1SdVzMEvdAS+JHzGs+s//rKDLb3zrHBeoZhQ4=;
        b=EKIuycGZTZAGfIXLPPhyxNzb4IpONDf+HWiQU1zbMP8HlvVDFjK+weUbYkR3XTO4wD
         YjeHs5UyroUXGVC4VR28ipJ5/0pw9PFgSnrYSnw1Cw6r5BYIa8O5LEPKJXy+Fa7c0BuM
         rKKn1NFSE+snfT1XhRMqKLG4RL7IUqSkt3Y/BeZRW60tKod9cmuT/PfhM5C19GR90GZN
         wYbRXWcp9i1XWTh2BtThyZbxDlcRU2J5pMslrDUqlvABZ72JlvsVF8ySboQ4k3OZ3efm
         fGoOgp1OmwIvk5QBU/0XhVSl6qvXv4UQOSHZxB81fwnkvKLHMRrldaGcpULF99iAGct9
         BP9w==
X-Gm-Message-State: AOAM530xsLbs/W84qjz8B7boiouC4Tong3vlDu59FCZkELvKozywnLFO
	PsdSjoozIFtvsKul9TLXtlQwGIoJfQTNvWVlAkw=
X-Google-Smtp-Source: ABdhPJwgRG6Z5IlQAMmxkEb7xwk/3DRskWOoc9lq5s+Jze0PB67uqVa13ZU9GrnI44E+cb/61DiEpYjC8sFDBN8RSYA=
X-Received: by 2002:a17:902:b716:b0:13f:b2d1:f316 with SMTP id
 d22-20020a170902b71600b0013fb2d1f316mr3644234pls.24.1635423719258; Thu, 28
 Oct 2021 05:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com> <20211027211715.12671-16-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-16-digetx@gmail.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Thu, 28 Oct 2021 20:20:00 +0800
Message-ID: <CAEbi=3eTruN6rYvEHCtyhTEZ=Ep8n6g75UMpHffc=0UrVTGbdQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/45] nds32: Use do_kernel_power_off()
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Lee Jones <lee.jones@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Nick Hu <nickhu@andestech.com>, Vincent Chen <deanbo422@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Pavel Machek <pavel@ucw.cz>, 
	linux-arm-kernel@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, Alan Kao <alankao@andestech.com>, 
	=?UTF-8?B?Sy5DLiBLdWVuLUNoZXJuIExpbijmnpflnaTmiJAp?= <kclin@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Osipenko <digetx@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8828=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=885:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/nds32/kernel/process.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
> index 49fab9e39cbf..0936dcd7db1b 100644
> --- a/arch/nds32/kernel/process.c
> +++ b/arch/nds32/kernel/process.c
> @@ -54,8 +54,7 @@ EXPORT_SYMBOL(machine_halt);
>
>  void machine_power_off(void)
>  {
> -       if (pm_power_off)
> -               pm_power_off();
> +       do_kernel_power_off();
>  }
>
>  EXPORT_SYMBOL(machine_power_off);
> --
> 2.33.1
>

Loop in Alan and KC

