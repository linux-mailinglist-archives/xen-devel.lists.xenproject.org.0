Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED3F640C89
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 18:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452190.710011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1A8o-00084y-QW; Fri, 02 Dec 2022 17:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452190.710011; Fri, 02 Dec 2022 17:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1A8o-000822-M9; Fri, 02 Dec 2022 17:48:02 +0000
Received: by outflank-mailman (input) for mailman id 452190;
 Fri, 02 Dec 2022 17:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gvms=4A=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1p1A8m-000811-So
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 17:48:01 +0000
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75dfdd05-7269-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 18:48:00 +0100 (CET)
Received: by mail-qt1-f178.google.com with SMTP id x28so5080498qtv.13
 for <xen-devel@lists.xenproject.org>; Fri, 02 Dec 2022 09:47:59 -0800 (PST)
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
X-Inumbo-ID: 75dfdd05-7269-11ed-91b6-6bf2151ebd3b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZkrcSltncE8/ZuZoYv4b2d7hscDOxyl0JUDZPI6liw=;
        b=OYDvxwGFka8sDKZdxMaaxl2933kARopCpQRbF3hz/8dlFUfeoXLAEUV7KKf6OBlmGI
         SddRnY4r/0DGIgr2mVe0ME36taPHc0UBYy8aCFexWSl0pb5EGTe3jAUFobPjKIq+3UVn
         8kAwBjc6qPG3OFH6rOTBSZ5YENp/j3bkdSln68f2IFHutsbJOBh+Z1RUZpRimGbsDz93
         mhnaTHmeA2Dn5MpicVPREqE9bvkE71ULF+OUIRAL5ySF4y4UbleNlKtVgA/RQ5mGVRBO
         Kam37AL32Io/UrQ/3cnGKT1iBrsR6vnBBcDfXGYhRgbi1V3oHBLZ67xiXOIsQfh3+N5W
         TUmg==
X-Gm-Message-State: ANoB5pnPHMaduX5u4/w+OCb8IitZ0Q4i77+78yJgrtmYOfso38+YJ935
	nNZRwYyTJexSAwhV+gnQBjuFszxbUpJ+WELzw5s=
X-Google-Smtp-Source: AA0mqf51uIOWkjKSwhAqxTpfKMjsu42I0eiMVKrm0VEx7HQYTsVmieNicP3p40lc7YCyIthr+ry0hUYCl4VWsxspqf0=
X-Received: by 2002:ac8:7dcb:0:b0:3a6:8dd0:4712 with SMTP id
 c11-20020ac87dcb000000b003a68dd04712mr11196833qte.411.1670003278849; Fri, 02
 Dec 2022 09:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org> <20221127-snd-freeze-v8-2-3bc02d09f2ce@chromium.org>
In-Reply-To: <20221127-snd-freeze-v8-2-3bc02d09f2ce@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 2 Dec 2022 18:47:47 +0100
Message-ID: <CAJZ5v0jbKSTQopEoXW9FpqDmAqp6Pn=-Om5QP2-7ocuGdq8R9w@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] freezer: refactor pm_freezing into a function.
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Juergen Gross <jgross@suse.com>, Mark Brown <broonie@kernel.org>, 
	Chromeos Kdump <chromeos-kdump@google.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Len Brown <len.brown@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Eric Biederman <ebiederm@xmission.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Joel Fernandes <joel@joelfernandes.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Ingo Molnar <mingo@redhat.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Dexuan Cui <decui@microsoft.com>, Takashi Iwai <tiwai@suse.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	kexec@lists.infradead.org, alsa-devel@alsa-project.org, 
	stable@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 1, 2022 at 12:08 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Add a way to let the drivers know if the processes are frozen.
>
> This is needed by drivers that are waiting for processes to end on their
> shutdown path.
>
> Convert pm_freezing into a function and export it, so it can be used by
> drivers that are either built-in or modules.
>
> Cc: stable@vger.kernel.org
> Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Why can't you export the original pm_freezing variable and why is this
fixing anything?

> ---
>  include/linux/freezer.h |  3 ++-
>  kernel/freezer.c        |  3 +--
>  kernel/power/process.c  | 24 ++++++++++++++++++++----
>  3 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/freezer.h b/include/linux/freezer.h
> index b303472255be..3413c869d68b 100644
> --- a/include/linux/freezer.h
> +++ b/include/linux/freezer.h
> @@ -13,7 +13,7 @@
>  #ifdef CONFIG_FREEZER
>  DECLARE_STATIC_KEY_FALSE(freezer_active);
>
> -extern bool pm_freezing;               /* PM freezing in effect */
> +bool pm_freezing(void);
>  extern bool pm_nosig_freezing;         /* PM nosig freezing in effect */
>
>  /*
> @@ -80,6 +80,7 @@ static inline int freeze_processes(void) { return -ENOSYS; }
>  static inline int freeze_kernel_threads(void) { return -ENOSYS; }
>  static inline void thaw_processes(void) {}
>  static inline void thaw_kernel_threads(void) {}
> +static inline bool pm_freezing(void) { return false; }
>
>  static inline bool try_to_freeze(void) { return false; }
>
> diff --git a/kernel/freezer.c b/kernel/freezer.c
> index 4fad0e6fca64..2d3530ebdb7e 100644
> --- a/kernel/freezer.c
> +++ b/kernel/freezer.c
> @@ -20,7 +20,6 @@ EXPORT_SYMBOL(freezer_active);
>   * indicate whether PM freezing is in effect, protected by
>   * system_transition_mutex
>   */
> -bool pm_freezing;
>  bool pm_nosig_freezing;
>
>  /* protects freezing and frozen transitions */
> @@ -46,7 +45,7 @@ bool freezing_slow_path(struct task_struct *p)
>         if (pm_nosig_freezing || cgroup_freezing(p))
>                 return true;
>
> -       if (pm_freezing && !(p->flags & PF_KTHREAD))
> +       if (pm_freezing() && !(p->flags & PF_KTHREAD))
>                 return true;
>
>         return false;
> diff --git a/kernel/power/process.c b/kernel/power/process.c
> index ddd9988327fe..8a4d0e2c8c20 100644
> --- a/kernel/power/process.c
> +++ b/kernel/power/process.c
> @@ -108,6 +108,22 @@ static int try_to_freeze_tasks(bool user_only)
>         return todo ? -EBUSY : 0;
>  }
>
> +/*
> + * Indicate whether PM freezing is in effect, protected by
> + * system_transition_mutex.
> + */
> +static bool pm_freezing_internal;
> +
> +/**
> + * pm_freezing - indicate whether PM freezing is in effect.
> + *
> + */
> +bool pm_freezing(void)
> +{
> +       return pm_freezing_internal;
> +}
> +EXPORT_SYMBOL(pm_freezing);

Use EXPORT_SYMBOL_GPL() instead, please.

> +
>  /**
>   * freeze_processes - Signal user space processes to enter the refrigerator.
>   * The current thread will not be frozen.  The same process that calls
> @@ -126,12 +142,12 @@ int freeze_processes(void)
>         /* Make sure this task doesn't get frozen */
>         current->flags |= PF_SUSPEND_TASK;
>
> -       if (!pm_freezing)
> +       if (!pm_freezing())
>                 static_branch_inc(&freezer_active);
>
>         pm_wakeup_clear(0);
>         pr_info("Freezing user space processes ... ");
> -       pm_freezing = true;
> +       pm_freezing_internal = true;
>         error = try_to_freeze_tasks(true);
>         if (!error) {
>                 __usermodehelper_set_disable_depth(UMH_DISABLED);
> @@ -187,9 +203,9 @@ void thaw_processes(void)
>         struct task_struct *curr = current;
>
>         trace_suspend_resume(TPS("thaw_processes"), 0, true);
> -       if (pm_freezing)
> +       if (pm_freezing())
>                 static_branch_dec(&freezer_active);
> -       pm_freezing = false;
> +       pm_freezing_internal = false;
>         pm_nosig_freezing = false;
>
>         oom_killer_enable();
>
> --

