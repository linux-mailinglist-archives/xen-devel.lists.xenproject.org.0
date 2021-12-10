Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B1470822
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 19:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244177.422328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkKt-0002Jh-Pl; Fri, 10 Dec 2021 18:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244177.422328; Fri, 10 Dec 2021 18:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkKt-0002GP-Lx; Fri, 10 Dec 2021 18:09:35 +0000
Received: by outflank-mailman (input) for mailman id 244177;
 Fri, 10 Dec 2021 18:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dzg=Q3=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1mvkKs-0002GJ-5C
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 18:09:34 +0000
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52f89031-59e4-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 19:09:32 +0100 (CET)
Received: by mail-oo1-f53.google.com with SMTP id
 e17-20020a4a8291000000b002c5ee0645e7so2597993oog.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 10:09:32 -0800 (PST)
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
X-Inumbo-ID: 52f89031-59e4-11ec-ad7a-b7ef48004f0a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnSiIIEAxVbWb5ME0b4EjQTIeMlzMMlMKVBEVEKFmvo=;
        b=SiI7B9dMD8dgT1IefJRykV8jBRr8sgi+BJICE3aAS6zQjZhLcU6+HpzGfQTtJzE1/t
         WflBB9W/asLO5z2cQGn1JavwOH5RhJJYCNusQQmilQE0u/q8UugTMmJ3o2QFDtYj86aX
         CZFt+YdknMQRFqgTIFITdx8f1Z2K+HW2PH8hE6OVM1aqTVM00LP/fhR7b5U96Rdm0XC7
         hgr/hmiWYlsnDof3x173SlD4ZjPWlLXRwOdG/s3M2wsCrYut+C5uNPZR2rk/Q2/Rb8Vm
         oQ2/E11XWBzZ/9uU05DdoBKsoXzFWNlQQ35sOjCgSwfHsn1EIROh1L/vdE4IsiM5Sxej
         Zl+A==
X-Gm-Message-State: AOAM532fV6OSSsolNdW4bil8Adn37bq07mki4PMrRus6NV3T40VRw6O5
	qF+SQXyaq99VBE9/FczV7ULiEnEIc2nvDray6YY=
X-Google-Smtp-Source: ABdhPJylQaHxxBjvxLDdejK26dmax8gF5GO2emXKWarqrtdmHFUWV4Injg4wQQswc1tWUgMSYyPwJPfech+QMe2lThI=
X-Received: by 2002:a05:6820:388:: with SMTP id r8mr9365162ooj.0.1639159771506;
 Fri, 10 Dec 2021 10:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-8-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-8-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:09:20 +0100
Message-ID: <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function prototypes
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
> There is no need to annotate function prototypes with 'extern', it makes
> code less readable. Remove unnecessary annotations from <reboot.h>.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

I'm not sure that this is really useful.

Personally, I tend to respect the existing conventions like this.

Surely, this change is not required for the rest of the series to work.

> ---
>  include/linux/reboot.h | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index 7c288013a3ca..b7fa25726323 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -40,36 +40,36 @@ extern int reboot_cpu;
>  extern int reboot_force;
>
>
> -extern int register_reboot_notifier(struct notifier_block *);
> -extern int unregister_reboot_notifier(struct notifier_block *);
> +int register_reboot_notifier(struct notifier_block *);
> +int unregister_reboot_notifier(struct notifier_block *);
>
> -extern int devm_register_reboot_notifier(struct device *, struct notifier_block *);
> +int devm_register_reboot_notifier(struct device *, struct notifier_block *);
>
> -extern int register_restart_handler(struct notifier_block *);
> -extern int unregister_restart_handler(struct notifier_block *);
> -extern void do_kernel_restart(char *cmd);
> +int register_restart_handler(struct notifier_block *);
> +int unregister_restart_handler(struct notifier_block *);
> +void do_kernel_restart(char *cmd);
>
>  /*
>   * Architecture-specific implementations of sys_reboot commands.
>   */
>
> -extern void migrate_to_reboot_cpu(void);
> -extern void machine_restart(char *cmd);
> -extern void machine_halt(void);
> -extern void machine_power_off(void);
> +void migrate_to_reboot_cpu(void);
> +void machine_restart(char *cmd);
> +void machine_halt(void);
> +void machine_power_off(void);
>
> -extern void machine_shutdown(void);
> +void machine_shutdown(void);
>  struct pt_regs;
> -extern void machine_crash_shutdown(struct pt_regs *);
> +void machine_crash_shutdown(struct pt_regs *);
>
>  /*
>   * Architecture independent implementations of sys_reboot commands.
>   */
>
> -extern void kernel_restart_prepare(char *cmd);
> -extern void kernel_restart(char *cmd);
> -extern void kernel_halt(void);
> -extern void kernel_power_off(void);
> +void kernel_restart_prepare(char *cmd);
> +void kernel_restart(char *cmd);
> +void kernel_halt(void);
> +void kernel_power_off(void);
>
>  extern int C_A_D; /* for sysctl */
>  void ctrl_alt_del(void);
> @@ -77,15 +77,15 @@ void ctrl_alt_del(void);
>  #define POWEROFF_CMD_PATH_LEN  256
>  extern char poweroff_cmd[POWEROFF_CMD_PATH_LEN];
>
> -extern void orderly_poweroff(bool force);
> -extern void orderly_reboot(void);
> +void orderly_poweroff(bool force);
> +void orderly_reboot(void);
>  void hw_protection_shutdown(const char *reason, int ms_until_forced);
>
>  /*
>   * Emergency restart, callable from an interrupt handler.
>   */
>
> -extern void emergency_restart(void);
> +void emergency_restart(void);
>  #include <asm/emergency-restart.h>
>
>  #endif /* _LINUX_REBOOT_H */
> --
> 2.33.1
>

