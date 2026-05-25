Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEymEHaRFGrnOQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 20:14:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3EF5CD935
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 20:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319427.1587044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRZo8-0007l7-Uf; Mon, 25 May 2026 18:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319427.1587044; Mon, 25 May 2026 18:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRZo8-0007if-Rf; Mon, 25 May 2026 18:13:44 +0000
Received: by outflank-mailman (input) for mailman id 1319427;
 Mon, 25 May 2026 18:13:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wRZo7-0007iZ-Sw
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 18:13:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRZo7-000KFS-9E
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 20:13:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a149157-2eae-0a2a0a5409dd-0a2a4502a4e4-0
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 20:13:43 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a149157-af86-0a2a45020019-d1558033c94e-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 20:13:43 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4903974854dso36801255e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 11:13:43 -0700 (PDT)
Received: from [10.17.80.122] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a198sm261352985e9.10.2026.05.25.11.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 11:13:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779732822; x=1780337622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5qNL9NLYIShWV0EtgOl0wbtFjiszAbVXdLcKC+uCmo=;
        b=KMc7L6b/9XkblbDx/RSt4UAPvNe4cMgwj8cK0RznVDjHxDU+MsPPDCjgGHOttCik3o
         JdG/UY86o2ZiLmn+hz2cY1YIZtLT6KgNdF8afpQRt880cCEGivIKeBH6W8KYT7DljcCE
         xmeZ4vJ8xKwsat7m+69gpR0wGL4z/JdmxkxjTBE+kLnxx3mHRavPaCle57C7MQW06dvH
         v6/rTKg6zdFCp78+2WX+dG0EKXS/a0xwqguoHLKtkdcnsA9RlNikOwo7jykX+iArjJVv
         UIC+22L9uil6aqjHw9SIi7+Z+qFWP4cm8igf/6VEMnfWLevLBuPLwtbKLzKAn3dHJkzv
         jguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732823; x=1780337623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5qNL9NLYIShWV0EtgOl0wbtFjiszAbVXdLcKC+uCmo=;
        b=EoyNF+GnzqhdHnp5+187YeIMZOmnvoBmWC+DFAaUyA9UkTjpZ0I2yEU0myvD7OHMqz
         5Jt4B6Of25HlCuBIzU7xZVWZ13d8a7GhnJFL7cw8FK3y9AM5r00tYkslXks6TZeChJpG
         u1unwWOzr3xBlvcd0j4e79hJ5fWIUnyjA9bNbBOxfga46hys6M5VlnkOH6KQUFw/BqTe
         VbCbL6hfzSYDSwJIR3y5v4RrYep/w56irB7XqgBtGu0aOlXU5tGn+NDZoR7yg7/cVmU5
         k9vqLINQ+036lZNsq+Wczy4WDRnPeHhxkvfxPcWABFxS+4koyueUnShk1+bD6pXOoTbA
         IKnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/SfYqZoZuWK2IkHodLV0cd63Xdhe6cXScHmKBK03SwjGdNkbY1870+20X9h+z9sWrBiKjwc37fOc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdzXbxcHf1+QeYZHMeR50iyYqbMjemx1F8P7c10SYhGwfYN6gM
	5VZTtBowg17XTHwOznE/2/lgD+sNGgE9p/dE/54kT/ekm3w6KyP9SHU8
X-Gm-Gg: Acq92OE6ulDqv+aj13MePHqxlWmFC2ZExf9O0pIkYq9WSXhEuUGI39WNporAOe7zFqR
	QZKImL1stfgKiZeX0bSPD5eu03l5oJ5RVwlaXGm8e8pLeYy7Vmb3a4UxZqtTFlxYbQTosREQqRd
	FbaXPBO9wLI0T8JHOASK2Az3kkuFq6cJeDPVVb5ReNtdIjEdn4nBA4Mvuu/E/UxxhME64dLEU5V
	uUt9yNRnizQLrF3MF39fmyADNi1gOID5wnKRFLf1XJqRFn5c/sX8J5j0wcVQuI2igTcf91TTHio
	YSUUtWG4YOyPFw7JIStEiE3Fa108ahOYpRpWJIgCqCXlxHBXbmvk+i1bMyNXUqcenH18aPAmbes
	kNNN73k8R9IiH5LV8KsMcjLtlljoWrVLdXKrS9IwRwyA9MINQGQ4NEp1MquKp0+LSBCzSK2oFh/
	UR4jEwFkl3zo6qPGeo9MOms8GbWmTf4SSNfvDrxUW8vw6STYy8GprqF/0=
X-Received: by 2002:a05:600c:8b77:b0:490:5368:743 with SMTP id 5b1f17b1804b1-49053680a94mr189972415e9.32.1779732822145;
        Mon, 25 May 2026 11:13:42 -0700 (PDT)
Message-ID: <63daeec4-a691-4d6f-b75a-bf34965b26f4@gmail.com>
Date: Mon, 25 May 2026 21:13:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <1d49511fff3ef5f77bc2d4daac00e6895c1359b1.1779385072.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <1d49511fff3ef5f77bc2d4daac00e6895c1359b1.1779385072.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1779732823-AAB68161-EC91C0E7/0/0
X-purgate-type: clean
X-purgate-size: 19847
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:rahul.singh@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.967];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7F3EF5CD935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 20:45, Mykola Kvach wrote:

Hello Mykola

> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> capability for platforms where the hardware domain can be parked with
> SHUTDOWN_suspend without calling hwdom_shutdown().
> 
> Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> non-control domains, including the hardware domain when it is not acting
> as a control domain, the call is handled as a guest/domain suspend request
> and parks the domain in SHUTDOWN_suspend.
> 
> Control domains need additional sequencing because their SYSTEM_SUSPEND
> request is used to coordinate host-wide suspend. A non-last awake control
> domain may be parked in SHUTDOWN_suspend without requiring the host
> suspend path to be available. The last awake control domain is treated as
> the point where the request becomes a host-suspend request, and it may
> only proceed when all non-control domains are already in SHUTDOWN_suspend
> and the host suspend path is available.
> 
> Keep the control-domain sequencing and domain-readiness checks out of
> PSCI_FEATURES. They are per-attempt runtime conditions rather than stable
> PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
> vPSCI and report attempt-time policy failures as PSCI_DENIED.
> 
> Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
> so that SHUTDOWN_suspend from the hardware domain can be treated as a
> domain suspend state rather than as a hardware-domain initiated host
> shutdown. This does not by itself imply that host-wide suspend is
> available.
> 
> Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
> capability with runtime blockers reported by Xen-owned subsystems. Add
> runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
> paths lacking suspend/resume support. These blockers are runtime based,
> so they only apply to drivers or paths that Xen actually uses on the
> platform. For SMMUv3, the blocker applies only when Xen actually uses the
> MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
> registers yet.
> 
> Add a struct domain forward declaration to xen/suspend.h so the generic
> header can expose arch_domain_resume() without requiring a full domain.h
> include.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V10:
> - Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
>    control domain cannot proceed to host suspend, keeping PSCI_FEATURES
>    stable once SYSTEM_SUSPEND is advertised.
> - Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
>    control domain.
> - Mark serial_suspend_available as __ro_after_init.
> - Mention the struct domain forward declaration added to xen/suspend.h.

I did not spot obvious issues while reviewing this patch, so you can add:

Reviewed-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>

Several nits/remarks below, feel free to skip them if you find them 
irrelevant or not useful.


> 
> Changes in V9:
> - Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
>    so that hardware-domain SHUTDOWN_suspend support is not tied to
>    host-wide system suspend availability.
> - Add runtime host suspend blockers for Xen-owned subsystems lacking
>    suspend/resume support.
> - Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforce
>    control-domain sequencing in the call handler.
> ---
>   xen/arch/arm/Kconfig                  |   1 +
>   xen/arch/arm/gic.c                    |   6 ++
>   xen/arch/arm/include/asm/psci.h       |   3 +
>   xen/arch/arm/include/asm/suspend.h    |  10 ++-
>   xen/arch/arm/psci.c                   |   7 ++
>   xen/arch/arm/suspend.c                |  40 +++++++++
>   xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
>   xen/common/Kconfig                    |   3 +
>   xen/common/domain.c                   |   7 +-
>   xen/drivers/char/serial.c             |  12 +++
>   xen/drivers/passthrough/arm/iommu.c   |   4 +
>   xen/drivers/passthrough/arm/smmu-v3.c |   4 +
>   xen/include/xen/serial.h              |   1 +
>   xen/include/xen/suspend.h             |   2 +
>   14 files changed, 201 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 79622b46a1..54a5bfb9ae 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
>   	select HAS_ALTERNATIVE if HAS_VMAP
>   	select HAS_DEVICE_TREE_DISCOVERY
>   	select HAS_DOM0LESS
> +	select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
>   	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>   	select HAS_STACK_PROTECTOR
>   	select HAS_UBSAN
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 7727ffed5a..60488c95b4 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -26,6 +26,7 @@
>   #include <asm/device.h>
>   #include <asm/io.h>
>   #include <asm/gic.h>
> +#include <asm/suspend.h>
>   #include <asm/vgic.h>
>   #include <asm/acpi.h>
>   
> @@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(void)
>   void register_gic_ops(const struct gic_hw_operations *ops)
>   {
>       gic_hw_ops = ops;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !ops->suspend || !ops->resume )
> +        host_system_suspend_disable("GIC driver lacks suspend support");
> +#endif
>   }
>   
>   static void clear_cpu_lr_mask(void)
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
> index bb3c73496e..142fa1bfe5 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
>   void call_psci_system_off(void);
>   void call_psci_system_reset(void);
>   int call_psci_system_suspend(void);
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +bool psci_system_suspend_allowed(void);
> +#endif
>   
>   /* Range of allocated PSCI function numbers */
>   #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
> index c848fc6340..50dc6e9fdf 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
>   
>   int prepare_resume_ctx(void);
>   void hyp_resume(void);
> -#endif /* CONFIG_SYSTEM_SUSPEND */
> +bool host_system_suspend_allowed(void);
> +void host_system_suspend_disable(const char *reason);
> +
> +#else /* !CONFIG_SYSTEM_SUSPEND */
> +
> +static inline bool host_system_suspend_allowed(void) { return false; }
> +static inline void host_system_suspend_disable(const char *reason) {}
> +
> +#endif
>   
>   #endif /* ARM_SUSPEND_H */
>   
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index e05dae1133..e9d78668fd 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
>   
>   #define PSCI_RET(res)   ((int32_t)(res).a0)
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +bool psci_system_suspend_allowed(void)
> +{
> +    return has_psci_system_suspend;
> +}
> +#endif
> +
>   int call_psci_cpu_on(int cpu)
>   {
>       struct arm_smccc_res res;
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 6ea4a0f9cc..98ddd46a47 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,9 +1,49 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> +#include <asm/psci.h>
>   #include <asm/suspend.h>
>   
> +#include <xen/lib.h>
> +#include <xen/serial.h>
> +
>   struct resume_cpu_context resume_cpu_context;
>   
> +/*
> + * Non-PSCI infrastructure can make host suspend impossible even when the PSCI
> + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has no valid
> + * suspend/resume path.
> + *
> + * This gate is checked only when the last awake control domain attempts to
> + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> + */
> +static bool host_system_suspend_runtime_allowed = true;

All callers of host_system_suspend_disable() appear to execute during 
boot. I noticed you added __ro_after_init to serial_suspend_available 
(same lifecycle), making the omission here a bit inconsistent. Should 
host_system_suspend_runtime_allowed be marked as __ro_after_init as 
well? Or I missed something?

> +
> +static bool host_serial_suspend_allowed(void)
> +{
> +    if ( serial_suspend_supported() )
> +        return true;
> +
> +    printk_once(XENLOG_INFO
> +                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
> +
> +    return false;
> +}
> +
> +bool host_system_suspend_allowed(void)
> +{
> +    return psci_system_suspend_allowed() &&
> +           host_serial_suspend_allowed() &&
> +           host_system_suspend_runtime_allowed;
> +}
> +
> +void host_system_suspend_disable(const char *reason)
> +{
> +    host_system_suspend_runtime_allowed = false;
> +
> +    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
> +           reason ? reason : "unsupported suspend/resume path");

On a system with N SMMUv3 instances using MSIs (each calling 
host_system_suspend_disable() from arm_smmu_setup_msis()),
the same message is printed N times...

> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index ac6af6118f..0bae42c1bd 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -5,6 +5,7 @@
>   
>   #include <asm/current.h>
>   #include <asm/domain.h>
> +#include <asm/suspend.h>
>   #include <asm/vgic.h>
>   #include <asm/vpsci.h>
>   #include <asm/event.h>
> @@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
>       domain_shutdown(d,SHUTDOWN_reboot);
>   }
>   
> +/*
> + * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend transition,
> + * so multiple control domains cannot all observe each other as still awake.
> + */
> +static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
> +
> +static bool domain_in_suspend_state(struct domain *d)
> +{
> +    bool suspended;
> +
> +    spin_lock(&d->shutdown_lock);
> +    suspended = d->is_shut_down && d->shutdown_code == SHUTDOWN_suspend;
> +    spin_unlock(&d->shutdown_lock);
> +
> +    return suspended;
> +}
> +
> +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> +{
> +    struct domain *other;
> +    bool last_awake_control_domain = true;
> +    bool awake_non_control_domain = false;
> +
> +    /* Only control domains participate in sequencing policy. */
> +    if ( !is_control_domain(d) )
> +        return 0;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( other )
> +    {
> +        bool suspended;
> +
> +        if ( other == d )
> +            continue;
> +
> +        suspended = domain_in_suspend_state(other);
> +        if ( suspended )
> +            continue;
> +
> +        if ( is_control_domain(other) )
> +        {
> +            last_awake_control_domain = false;
> +            break;
> +        }
> +
> +        awake_non_control_domain = true;
> +    }
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    /*
> +     * Another control domain is still awake. This request is only the first
> +     * phase of the sequencing: park this control domain and leave the host
> +     * running. Host-wide suspend gates must not block this intermediate state.
> +     */
> +    if ( !last_awake_control_domain )
> +        return 0;
> +
> +    /*
> +     * This is the last awake control domain. It must not be parked unless the
> +     * request can proceed as a host-suspend request; otherwise Xen would lose
> +     * the last domain that can coordinate the system suspend.
> +     */
> +    if ( awake_non_control_domain )
> +    {
> +        printk(XENLOG_DEBUG
> +               "SYSTEM_SUSPEND denied for %pd: non-control domains awake\n",
> +               d);
> +        return PSCI_DENIED;
> +    }
> +
> +    /*
> +     * Host-wide gates are relevant only for the last-control-domain case. They
> +     * must not block parking of a non-last control domain, but they must deny
> +     * the last control domain when host suspend is not currently available.
> +     */
> +    if ( !host_system_suspend_allowed() )
> +        return PSCI_DENIED;
> +
> +    return 0;
> +}
> +
>   static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>   {
>       int32_t rc;
> @@ -232,10 +316,6 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>       if ( is_64bit_domain(d) && is_thumb )
>           return PSCI_INVALID_ADDRESS;
>   
> -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> -    if ( is_hardware_domain(d) )
> -        return PSCI_NOT_SUPPORTED;
> -
>       /* Ensure that all CPUs other than the calling one are offline */
>       domain_lock(d);
>       for_each_vcpu ( d, v )
> @@ -252,16 +332,29 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>       if ( rc )
>           return PSCI_DENIED;
>   
> -    rc = domain_shutdown(d, SHUTDOWN_suspend);
> +    spin_lock(&vpsci_system_suspend_lock);
> +
> +    rc = domain_psci_system_suspend_policy(d);
> +    if ( !rc )
> +    {
> +        rc = domain_shutdown(d, SHUTDOWN_suspend);
> +        if ( rc )
> +            rc = PSCI_DENIED;
> +        else
> +        {
> +            rctx->ctxt = ctxt;
> +            rctx->wake_cpu = current;
> +        }
> +    }
> +
> +    spin_unlock(&vpsci_system_suspend_lock);
> +
>       if ( rc )
>       {
>           free_vcpu_guest_context(ctxt);
> -        return PSCI_DENIED;
> +        return rc;
>       }
>   
> -    rctx->ctxt = ctxt;
> -    rctx->wake_cpu = current;
> -
>       gprintk(XENLOG_DEBUG,
>               "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
>               epoint, cid);
> @@ -287,10 +380,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>       case PSCI_0_2_FN32_SYSTEM_RESET:
>       case PSCI_1_0_FN32_PSCI_FEATURES:
>       case ARM_SMCCC_VERSION_FID:
> -        return 0;
>       case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>       case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED : 0;
> +        return 0;
>       default:
>           return PSCI_NOT_SUPPORTED;
>       }
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 5ff71480ee..816a1a4ecb 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -140,6 +140,9 @@ config HAS_EX_TABLE
>   config HAS_FAST_MULTIPLY
>   	bool
>   
> +config HAS_HWDOM_SYSTEM_SUSPEND
> +	bool
> +
>   config HAS_IOPORTS
>   	bool
>   
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index bb9e210c28..d3edfb2a13 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1375,6 +1375,11 @@ void __domain_crash(struct domain *d)
>       domain_shutdown(d, SHUTDOWN_crash);
>   }
>   
> +static inline bool want_hwdom_shutdown(uint8_t reason)
> +{
> +    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
> +           reason != SHUTDOWN_suspend;
> +}
>   
>   int domain_shutdown(struct domain *d, u8 reason)
>   {
> @@ -1391,7 +1396,7 @@ int domain_shutdown(struct domain *d, u8 reason)
>           d->shutdown_code = reason;
>       reason = d->shutdown_code;
>   
> -    if ( is_hardware_domain(d) )
> +    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
>           hwdom_shutdown(reason);
>   
>       if ( d->is_shutting_down )
> diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> index adb312d796..e5348b5445 100644
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -497,6 +497,8 @@ const struct vuart_info *serial_vuart_info(int idx)
>   
>   #ifdef CONFIG_SYSTEM_SUSPEND
>   
> +static bool __ro_after_init serial_suspend_available = true;
> +
>   void serial_suspend(void)
>   {
>       int i;
> @@ -513,6 +515,11 @@ void serial_resume(void)
>               com[i].driver->resume(&com[i]);
>   }
>   
> +bool serial_suspend_supported(void)
> +{
> +    return serial_suspend_available;
> +}
> +
>   #endif /* CONFIG_SYSTEM_SUSPEND */
>   
>   void __init serial_register_uart(int idx, struct uart_driver *driver,
> @@ -521,6 +528,11 @@ void __init serial_register_uart(int idx, struct uart_driver *driver,
>       /* Store UART-specific info. */
>       com[idx].driver = driver;
>       com[idx].uart   = uart;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !driver->suspend || !driver->resume )
> +        serial_suspend_available = false;
> +#endif
>   }
>   
>   void __init serial_async_transmit(struct serial_port *port)
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
> index 100545e23f..547048af05 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -19,6 +19,7 @@
>   #include <xen/device_tree.h>
>   #include <xen/iommu.h>
>   #include <xen/lib.h>
> +#include <xen/suspend.h>
>   
>   #include <asm/device.h>
>   
> @@ -46,6 +47,9 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
>       }
>   
>       iommu_ops = ops;
> +
> +    if ( !ops->suspend || !ops->resume )
> +        host_system_suspend_disable("IOMMU driver lacks suspend support");

I was initially wondering why the suspend/resume checks for the GIC and 
serial are wrapped in #ifdef CONFIG_SYSTEM_SUSPEND, but the IOMMU check 
is not, despite host_system_suspend_disable() acting as no-op when 
CONFIG_SYSTEM_SUSPEND=n. Then I realized the divergence here because the 
suspend/resume members in struct iommu_ops are not gated with #ifdef, 
unlike those in struct gic_hw_operations and struct uart_driver.


>   }
>   
>   int __init iommu_hardware_setup(void)
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index be8028c036..1b6bb1bc5f 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -91,6 +91,7 @@
>   #include <asm/io.h>
>   #include <asm/iommu_fwspec.h>
>   #include <asm/platform.h>
> +#include <asm/suspend.h>
>   
>   #include "smmu-v3.h"
>   
> @@ -1903,6 +1904,9 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>   		}
>   	}
>   
> +	host_system_suspend_disable(
> +		"SMMUv3 MSI IRQ path is unsupported for host suspend");
> +
>   	/* Add callback to free MSIs on teardown */
>   	devm_add_action(dev, arm_smmu_free_msis, dev);
>   }
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 8e18445552..418b00ead0 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx);
>   /* Serial suspend/resume. */
>   void serial_suspend(void);
>   void serial_resume(void);
> +bool serial_suspend_supported(void);
>   #endif
>   
>   /*
> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> index 6f94fd53b0..a941331035 100644
> --- a/xen/include/xen/suspend.h
> +++ b/xen/include/xen/suspend.h
> @@ -6,6 +6,8 @@
>   #if __has_include(<asm/suspend.h>)
>   #include <asm/suspend.h>
>   #else
> +struct domain;
> +
>   static inline void arch_domain_resume(struct domain *d) {}
>   #endif
>   


