Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78432568AF3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 16:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362295.592278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o95l5-0004et-1Y; Wed, 06 Jul 2022 14:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362295.592278; Wed, 06 Jul 2022 14:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o95l4-0004cA-UH; Wed, 06 Jul 2022 14:12:02 +0000
Received: by outflank-mailman (input) for mailman id 362295;
 Wed, 06 Jul 2022 14:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM8T=XL=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1o95eB-0003IU-7T
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 14:04:55 +0000
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bf35241-fd34-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 16:04:54 +0200 (CEST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-31bf3656517so140694127b3.12
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 07:04:54 -0700 (PDT)
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
X-Inumbo-ID: 9bf35241-fd34-11ec-924f-1f966e50362f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBE539EKjjJ8zkn99yLgr6sf0hQeHTgO/l2k1f9VAKg=;
        b=CI3FpnTrwAoYWjrBJ3csJxAMAd1O2iKqsJR0ZcBe2CAVlPCiu7Hh0++cIJlceq0bxh
         p7EvCCSPvYwbAQ042vjl+IeYC2oo0s+b77CVd+f4Z31ylKMHk88/llVsoR9qQhyVV6x+
         t6HEBNuJhSCRO7yvYWwNJV3rY3JahCRCSnT3IkmgHGMW/sI93KFYZzU01DkmG4u7RJwl
         NvPP0Kl6ZQL0ZfkU/Oje951wN50mRWj0Cr+LrQmyEC9/T5/4ZhQGIJAh26Lp+7enav8X
         fKn3gdDEk5oEAqnRsTPQ2du0zPOQA/wWD9slTu15UUM6OsX9Bpv9yzLA9x/Lk3vtHUC5
         /K0g==
X-Gm-Message-State: AJIora8vFlnX7TP2CsZuvFQX5RK/iXL3UTeEk9VdXRexd4mdmWVyj356
	Ufw1tlhwTzIvzkSbxt5pYN4KpC95Sv0b8+Fq63M=
X-Google-Smtp-Source: AGRyM1tzweDvK/HpOTrEcMtuYgu75xJlbU4wLmWYqVeEsIhNId5gL4a/NC1jAK4t+CVNf/Oa7/ufr1ZdqBFMCfc4FVA=
X-Received: by 2002:a81:24c7:0:b0:314:1e60:a885 with SMTP id
 k190-20020a8124c7000000b003141e60a885mr46512506ywk.301.1657116293184; Wed, 06
 Jul 2022 07:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.885263942@infradead.org>
In-Reply-To: <20220608144517.885263942@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 6 Jul 2022 16:04:42 +0200
Message-ID: <CAJZ5v0j6=x-u3dorwQNd6Sihaa1rx1-uaFXbL1Kc37Hu-fcH3A@mail.gmail.com>
Subject: Re: [PATCH 31/36] cpuidle,acpi: Make noinstr clean
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
> vmlinux.o: warning: objtool: io_idle+0xc: call to __inb.isra.0() leaves .noinstr.text section
> vmlinux.o: warning: objtool: acpi_idle_enter+0xfe: call to num_online_cpus() leaves .noinstr.text section
> vmlinux.o: warning: objtool: acpi_idle_enter+0x115: call to acpi_idle_fallback_to_c1.isra.0() leaves .noinstr.text section
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  arch/x86/include/asm/shared/io.h |    4 ++--
>  drivers/acpi/processor_idle.c    |    2 +-
>  include/linux/cpumask.h          |    4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> --- a/arch/x86/include/asm/shared/io.h
> +++ b/arch/x86/include/asm/shared/io.h
> @@ -5,13 +5,13 @@
>  #include <linux/types.h>
>
>  #define BUILDIO(bwl, bw, type)                                         \
> -static inline void __out##bwl(type value, u16 port)                    \
> +static __always_inline void __out##bwl(type value, u16 port)           \
>  {                                                                      \
>         asm volatile("out" #bwl " %" #bw "0, %w1"                       \
>                      : : "a"(value), "Nd"(port));                       \
>  }                                                                      \
>                                                                         \
> -static inline type __in##bwl(u16 port)                                 \
> +static __always_inline type __in##bwl(u16 port)                                \
>  {                                                                      \
>         type value;                                                     \
>         asm volatile("in" #bwl " %w1, %" #bw "0"                        \
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -593,7 +593,7 @@ static int acpi_idle_play_dead(struct cp
>         return 0;
>  }
>
> -static bool acpi_idle_fallback_to_c1(struct acpi_processor *pr)
> +static __always_inline bool acpi_idle_fallback_to_c1(struct acpi_processor *pr)
>  {
>         return IS_ENABLED(CONFIG_HOTPLUG_CPU) && !pr->flags.has_cst &&
>                 !(acpi_gbl_FADT.flags & ACPI_FADT_C2_MP_SUPPORTED);
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -908,9 +908,9 @@ static inline const struct cpumask *get_
>   * concurrent CPU hotplug operations unless invoked from a cpuhp_lock held
>   * region.
>   */
> -static inline unsigned int num_online_cpus(void)
> +static __always_inline unsigned int num_online_cpus(void)
>  {
> -       return atomic_read(&__num_online_cpus);
> +       return arch_atomic_read(&__num_online_cpus);
>  }
>  #define num_possible_cpus()    cpumask_weight(cpu_possible_mask)
>  #define num_present_cpus()     cpumask_weight(cpu_present_mask)
>
>

