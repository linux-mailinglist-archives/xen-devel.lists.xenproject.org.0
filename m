Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D955854828D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 10:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347843.574192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0frz-0007XS-Eb; Mon, 13 Jun 2022 08:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347843.574192; Mon, 13 Jun 2022 08:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0frz-0007U4-97; Mon, 13 Jun 2022 08:56:23 +0000
Received: by outflank-mailman (input) for mailman id 347843;
 Mon, 13 Jun 2022 08:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOj1=WU=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1o0fOo-00031i-0d
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 08:26:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c40d223-eaf2-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 10:26:13 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id q15so2508417wmj.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jun 2022 01:26:13 -0700 (PDT)
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
X-Inumbo-ID: 7c40d223-eaf2-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3JSggHLDbkXyuZCKaU+uQ7H5KVpBjE3ZWWl/F0t3JyI=;
        b=hln/7KIUboOODQa9/Iv7zWAXFI8kFLhiLL+AWnA7ZL0itAJaB93eguKFQupB8Lv94a
         mnMuLqlfVsMy6aSBFmNweaacWKXWw7aT6TScazfBGhspJqqH/PMOPWdnnnaxNLaf842d
         D+3NPCattkXMe8VyippSy6AVlz1Q90Igxi/lQII1yr2hkIK0YZRpsj0TKs2Px7tXlVgY
         915w6r1r+N9IHNGMPf7O4C6rOlcjLzR4xSEqc3Zfq8tMbY0ayFsU19Cug+0HkT25Saig
         zkxTdXbzsbpEfsV6HhW0WtRME3JJZVdyKx57BtFZ0WE2gh0TSNH76QSkgUTVIoEuHNxT
         f/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3JSggHLDbkXyuZCKaU+uQ7H5KVpBjE3ZWWl/F0t3JyI=;
        b=g8c4W/xTVMLeZGTKZ2bIoZCCkRMeYxUhKZ1GQo6i+ixBOACstvkagJme2Qv1gGzEum
         3nuMr6ffzNdoSbFu1VwfuOcebvTy2Q/fwq86A57e4MoRb0fOF5oqckhm3ezesL6rOpdI
         EtKm2sS3cusl6+jsr8xPkCWuAYBH11xLurtCiqBF8eMTpVreK5hxls6yTtpUW+aopq0X
         XfmdjPjvNTj96kFMuiGhfTbuC7I4Dgo6r1JTXUS3j9fNkHcgbLeoYhI73F2s+8rscvH5
         PvDk69JeLAiS/0KOCiFuFwCN0MJzd1kbPxczJ71qLlw1vezDZzxu7pUadA/I4Qsm8/Fs
         waEA==
X-Gm-Message-State: AOAM531hgUz3xgF8Ss01ic41l098ztHpdj6/ie6Aht/XBBoynC1UWS7t
	0GNl6lhsghxzNxDYefi6/L9w69CueZw63H0gO3s=
X-Google-Smtp-Source: ABdhPJxgJ3qlsWHXb4q5Q9LeHOXh1hQWbFNdZBk/6atfvyd1YyWRPGtuhT6/ZUDmb0vG1CLuyzfEgHlG2xi/itwptM8=
X-Received: by 2002:a05:600c:1c9a:b0:39c:7db4:90c3 with SMTP id
 k26-20020a05600c1c9a00b0039c7db490c3mr13053942wms.161.1655108772491; Mon, 13
 Jun 2022 01:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.251109029@infradead.org>
In-Reply-To: <20220608144517.251109029@infradead.org>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Mon, 13 Jun 2022 16:26:01 +0800
Message-ID: <CAJhGHyCnu_BsKf5STMMJKMWm0NVZ8qXT8Qh=BhhCjSSgwchL3Q@mail.gmail.com>
Subject: Re: [PATCH 21/36] x86/tdx: Remove TDX_HCALL_ISSUE_STI
To: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com, 
	linus.walleij@linaro.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, tony@atomide.com, khilman@kernel.org, 
	catalin.marinas@arm.com, Will Deacon <will@kernel.org>, guoren@kernel.org, 
	bcain@quicinc.com, Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name, 
	geert@linux-m68k.org, sammy@sammy.net, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org, paulus@samba.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, 
	Richard Weinberger <richard@nod.at>, anton.ivanov@cambridgegreys.com, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, acme <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, jolsa@kernel.org, 
	Namhyung Kim <namhyung@kernel.org>, Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu, 
	amakhalov@vmware.com, VMware Inc <pv-drivers@vmware.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, chris@zankel.net, jcmvbkbc@gmail.com, 
	rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz, gregkh@linuxfoundation.org, 
	mturquette@baylibre.com, sboyd@kernel.org, daniel.lezcano@linaro.org, 
	lpieralisi@kernel.org, sudeep.holla@arm.com, agross@kernel.org, 
	bjorn.andersson@linaro.org, Anup Patel <anup@brainfault.org>, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, jacob.jun.pan@linux.intel.com, 
	Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux@rasmusvillemoes.dk, 
	rostedt@goodmis.org, pmladek@suse.com, senozhatsky@chromium.org, 
	john.ogness@linutronix.de, paulmck@kernel.org, frederic@kernel.org, 
	quic_neeraju@quicinc.com, josh@joshtriplett.org, 
	mathieu.desnoyers@efficios.com, joel@joelfernandes.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	Isaku Yamahata <isaku.yamahata@gmail.com>, kirill.shutemov@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 10:48 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Now that arch_cpu_idle() is expected to return with IRQs disabled,
> avoid the useless STI/CLI dance.
>
> Per the specs this is supposed to work, but nobody has yet relied up
> this behaviour so broken implementations are possible.

I'm totally newbie here.

The point of safe_halt() is that STI must be used and be used
directly before HLT to enable IRQ during the halting and stop
the halting if there is any IRQ.

In TDX case, STI must be used directly before the hypercall.
Otherwise, no IRQ can come and the vcpu would be stalled forever.

Although the hypercall has an "irq_disabled" argument.
But the hypervisor doesn't (and can't) touch the IRQ flags no matter
what the "irq_disabled" argument is.  The IRQ is not enabled during
the halting if the IRQ is disabled before the hypercall even if
irq_disabled=false.

The "irq_disabled" argument is used for workaround purposes:
https://lore.kernel.org/kvm/c020ee0b90c424a7010e979c9b32a28e9c488a51.1651774251.git.isaku.yamahata@intel.com/

Hope my immature/incorrect reply elicits a real response from
others.

Thanks
Lai

