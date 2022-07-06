Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D82E568A4C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 15:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362252.592224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o95Xx-0007uY-CO; Wed, 06 Jul 2022 13:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362252.592224; Wed, 06 Jul 2022 13:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o95Xx-0007rB-8m; Wed, 06 Jul 2022 13:58:29 +0000
Received: by outflank-mailman (input) for mailman id 362252;
 Wed, 06 Jul 2022 13:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM8T=XL=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1o95R6-0006zi-C1
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 13:51:24 +0000
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7babe9b-fd32-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 15:51:23 +0200 (CEST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-31cb2c649f7so66161287b3.11
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 06:51:22 -0700 (PDT)
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
X-Inumbo-ID: b7babe9b-fd32-11ec-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5SiPC3jj492VC8TfaG5lxiX62rjLNKysidcQlbSYqow=;
        b=UWYqV0K+ik5Wj4BVvddmvfJa7bgzjlAqRtfQqPMO1VPWC5wrHl/mLcNuYY6B6nAqH1
         bAyduHFyhkl7p+8TZO3K4Hvl2qYqRnj96WiTCpUJTDVIh8JM2tOOIj2Xe+CUIGuu7xua
         a4kVkhcqoYGL1bXReRQbtXcnvY7vCRRPljaxRdiK0XpJluoBlj8ZgkUt+yI0adR6SsuB
         vAFhsw4HJq3gI6MvEJruwpX+RqbxRNYGENpE+QJXllOcsKI0ogg/fEpJDo9lwoZcrs4P
         ljspHfgp8TrOfxXh9FSWy1Yo4K5GwrmoWwOtFI9p5udi8yytJSvjJ8iz8NgJ03N0DrAt
         9FUg==
X-Gm-Message-State: AJIora/yBDk29+amlyurx8T0BPV7wYo8KLVXX3AW4k1D55gUYGwkZqeW
	38Vj2VTOUZoxP2R2/MkQryl880Iz3+0uf1cG5RQ=
X-Google-Smtp-Source: AGRyM1t2zFLeLAi3TOz/3FKNOaozLIghzMJavy2698E42fvxt6d4SsTob1/anQx1a1kTDZPSEUZEInHEN/JL2sa2rXc=
X-Received: by 2002:a81:1b97:0:b0:2db:640f:49d8 with SMTP id
 b145-20020a811b97000000b002db640f49d8mr45075306ywb.326.1657115480888; Wed, 06
 Jul 2022 06:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144516.109792837@infradead.org>
In-Reply-To: <20220608144516.109792837@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 6 Jul 2022 15:51:09 +0200
Message-ID: <CAJZ5v0jO9+jRSm3d58K15JaO3=kgM2Ueo7W+Smi3WCBPR_VM5Q@mail.gmail.com>
Subject: Re: [PATCH 03/36] cpuidle/poll: Ensure IRQ state is invariant
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, ulli.kroll@googlemail.com, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, bcain@quicinc.com, 
	Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name, 
	Geert Uytterhoeven <geert@linux-m68k.org>, sammy@sammy.net, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, dinguyen@kernel.org, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, Stafford Horne <shorne@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>, 
	Richard Weinberger <richard@nod.at>, anton.ivanov@cambridgegreys.com, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, acme@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, jolsa@kernel.org, namhyung@kernel.org, 
	Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu, amakhalov@vmware.com, 
	pv-drivers@vmware.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Chris Zankel <chris@zankel.net>, jcmvbkbc@gmail.com, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Anup Patel <anup@brainfault.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, 
	Petr Mladek <pmladek@suse.com>, senozhatsky@chromium.org, 
	John Ogness <john.ogness@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, quic_neeraju@quicinc.com, 
	Josh Triplett <josh@joshtriplett.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Benjamin Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, vschneid@redhat.com, 
	jpoimboe@kernel.org, linux-alpha@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-snps-arc@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux OMAP Mailing List <linux-omap@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, openrisc@lists.librecores.org, 
	Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-xtensa@linux-xtensa.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> cpuidle_state::enter() methods should be IRQ invariant
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/cpuidle/poll_state.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> --- a/drivers/cpuidle/poll_state.c
> +++ b/drivers/cpuidle/poll_state.c
> @@ -17,7 +17,7 @@ static int __cpuidle poll_idle(struct cp
>
>         dev->poll_time_limit = false;
>
> -       local_irq_enable();
> +       raw_local_irq_enable();
>         if (!current_set_polling_and_test()) {
>                 unsigned int loop_count = 0;
>                 u64 limit;
> @@ -36,6 +36,8 @@ static int __cpuidle poll_idle(struct cp
>                         }
>                 }
>         }
> +       raw_local_irq_disable();
> +
>         current_clr_polling();
>
>         return index;
>
>

