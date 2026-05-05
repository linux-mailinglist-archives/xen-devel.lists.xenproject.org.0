Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BXrEGNU+mlPMgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 22:34:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E74D3B15
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 22:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301089.1575429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKMTS-0004yN-D1; Tue, 05 May 2026 20:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301089.1575429; Tue, 05 May 2026 20:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKMTS-0004wv-AI; Tue, 05 May 2026 20:34:34 +0000
Received: by outflank-mailman (input) for mailman id 1301089;
 Tue, 05 May 2026 20:34:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKMTQ-0004wl-W7
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:34:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKMTO-004pG8-RJ
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 22:34:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fa5454-e002-0a2a0a5209dd-0a2a4503a162-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 22:34:32 +0200
Received: from [209.85.167.41] (helo=mail-lf1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fa5458-672d-0a2a45030019-d155a729e588-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 22:34:32 +0200
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5a2b636b944so5853860e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 13:34:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1778013271; cv=none;
        d=google.com; s=arc-20240605;
        b=alPwggRqdE3sEh7sc9qxtDyJq8ZgfNMjarpKoVw/uzrQG6SVuHSMPyX+iXCgB8GFoS
         SKdU9LnzTOxzIAogRffGvE5oh8aw9ELm3vbe2X4NvvxPJSq86cU1Vqz/TFuMlmJ/+uXD
         uxDC1NjG+flT23eZWNwzXn2L99MKXK3uyqMExmSHE9aOzI21sMzKKemiIcvN5rp4Yt6u
         AkmruM6th6HEVxy/cwLZZBdkTXD+QhUY3Pj+fN03veVu28zRD3L9P2Tv0Sxym/hu8ZF6
         0igS4OzCSiqpbjha22AliUW8Bxw9gRBGuMThXSVY0h7hIPAaSCbKvqWZgZ5Aj9aFkLYA
         hfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x1jfw1bJF05hjjJ7T/x2gQU6csfYvm0MxMfH1I6JXOs=;
        fh=eEq7B6rg7ssf3icSookiwOw/XyVLUuCIMVm7gUWrf/I=;
        b=HNQjZRxOV4tr0+kckHzlqxIWBjz8ZEz44Oq6Lsj58J/ril8kjdDKkXUXLU6WLhZArf
         v8yW8Js1rOgYZJqAxbpyLtHTiGb/AwDzHdxWe14EsjDjUN+Q8RzHSsufTphk5/QgR6XO
         OYeQoNmKvM9Rz1EQbLGXYQALCHdf0W+GEFUc6bP8gQpJ/q7UDnTNo2tccLh62AKjv+7q
         zfI7WoeipWllY1QN0k4mOiUYXnsQ0ogFqe+K2KsUk8HX1qwhQOZpkQXv5OuQxtRH7Bdt
         TYmoHacLmX2yVyzGb+lV5lN3bER/Vi/6WaJYIAq7ycNpedRBsd5+PWDRhsaVqz7aGkva
         l8mQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778013271; x=1778618071; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1jfw1bJF05hjjJ7T/x2gQU6csfYvm0MxMfH1I6JXOs=;
        b=bsftxq7SpGirKIKyB0leKALvSKzS5+iLSTlsrjcxCpSqEOujSdavSB+j0AZPZbC6H/
         EVruwrC/CPb8gkJWIEBQsku024JbR3bXiv+8yTfAdZubVoRUvwwYiurUK3XC59QfGKEg
         IvfetBGTo37XeZgNH+fot5mng+tgbZqpycCDFf75aEwUU42ger9KYiXKjuvxBug1hA2X
         SzcvFd4MhtsIvur627jiWVzr4qfJsVTyUfenFUleIS+HFy/io8iKRqgiopdTYQFWCqGc
         qocuY3Zh+jaBu7SpqboNi6D46A61dpiIB9BzaYLev8d+cotaoMXcSFH0uBp8N3MBfxjP
         uTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778013271; x=1778618071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x1jfw1bJF05hjjJ7T/x2gQU6csfYvm0MxMfH1I6JXOs=;
        b=ZA/0LBGjT/Z0W37RrtJ4K+YZYraDx/J6qm+/2MnG8uMDIab8Ues3rUlcax2QTW3JmN
         lW1O2WwA/IP5CleFFBm3vv3pgKrNKRcluUe6Z1/W6xdyZxSGtm9rIoiew3v53Jzrp+Ms
         V7vqv+2uqjyPAm937zhd1z+oRHj6rQEM0WsX8E+BAgmLAWVrPA0D+8Mgy+AAA0HQdiuD
         DPSanlAo5e1apW0PsRiTTpCivqIa7pp1V4dKTE3EN9CdIpEHoPhOS6hu/2qexueWaPm8
         uHVdv/VmVyDhyWWA6wY5Sl+tKyRZfqVwdeWpCRyEfFczoKDJivahJbvehZIXLjnPl/kl
         P+jg==
X-Gm-Message-State: AOJu0Ywq5Lm2NSvMXs5vYcnqEmwYUnh5c4zfp9NqGQP3txMQvqqurxt+
	S2Y0jfAU8DQAFPkELWXkTTjcDqqMlySsgUAXS2OHXdotyD7D00xre/fEU5N7c9sqBRHEOZSKq3e
	DB5Riy00ZX8V4izCFL5om3NDH3D6s9Z4=
X-Gm-Gg: AeBDieu9OZwLhWkzP+8HD6M4IbUMzyVIzbrzQwuEoE4T8lbb9bFs1NMFMTb28D/Ehjl
	Ol71ILHqEAe6cOVE4fZsYV/VgqDdKoZgTtgbOJo6Zgc+0wKeE+nLxlHvLu+2p4BUtLTs08PlyGh
	GQA93Nejfz88oWT+OdIP4/sFQhObnDST9QsMj7nJxmviTTnJqZEwaA9aBQmk4nVNnpqKA3sPY5q
	FvZjL2NSUK5htl8IyaNs1AaABR9zNxSHFi7YnSJo2epzbHl0EvudWPSgfXwDgxcxiP5/FhQv2LD
	0DRzHMZzUM3hcGms
X-Received: by 2002:a05:6512:1113:b0:5a2:c6f2:fd5a with SMTP id
 2adb3069b0e04-5a887cded48mr93092e87.21.1778013271104; Tue, 05 May 2026
 13:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
 <4977CF18-39CC-4CC0-936A-890BAE5E8615@arm.com>
In-Reply-To: <4977CF18-39CC-4CC0-936A-890BAE5E8615@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 23:34:18 +0300
X-Gm-Features: AVHnY4K3UZk2RzYUFWDotoJb9uIiNxdTcGP2Cj4IhABczaSfQaf-V__RkQSzYVA
Message-ID: <CAGeoDV8WkRGubF0qEXd4+PsXuabz3914G7bTYxTbaxZ2DsnY6w@mail.gmail.com>
Subject: Re: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Rahul Singh <Rahul.Singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1778013272-A2B64938-1ED61C94/0/0
X-purgate-type: clean
X-purgate-size: 15558
X-Rspamd-Queue-Id: 7E2E74D3B15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Rahul.Singh@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[192.237.175.120:server fail,10.42.69.3:server fail,209.85.167.41:server fail,195.190.135.10:server fail];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Luca,

Thanks for the feedback.

On Wed, Apr 29, 2026 at 11:06=E2=80=AFAM Luca Fancellu <Luca.Fancellu@arm.c=
om> wrote:
>
> Hi Mykola,
>
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index e38566b0b7..4d1289776b 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,9 +1,190 @@
> > /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > +#include <asm/psci.h>
> > #include <asm/suspend.h>
> >
> > +#include <public/sched.h>
> > +#include <xen/console.h>
> > +#include <xen/cpu.h>
> > +#include <xen/errno.h>
> > +#include <xen/iommu.h>
> > +#include <xen/sched.h>
> > +#include <xen/tasklet.h>
> > +
> > struct cpu_context cpu_context =3D {};
> >
> > +static int can_system_suspend(void)
> > +{
> > +    int ret =3D 0;
> > +    struct domain *d;
> > +
> > +    rcu_read_lock(&domlist_read_lock);
> > +
> > +    for_each_domain ( d )
> > +    {
> > +        bool domain_suspended;
> > +
> > +        spin_lock(&d->shutdown_lock);
> > +        domain_suspended =3D d->is_shut_down &&
> > +                           d->shutdown_code =3D=3D SHUTDOWN_suspend;
> > +        spin_unlock(&d->shutdown_lock);
> > +
> > +        if ( domain_suspended )
> > +            continue;
> > +
> > +        printk(XENLOG_ERR
> > +               "System suspend requires all domains to be shut down fo=
r suspend (dom%d: isn't in suspend state)\n",
>
> d->domain_id is unsigned if I=E2=80=99m not mistaken, it wants %u (typede=
f uint16_t domid_t;)

Ack, I will fix it in v9.

>
> > +               d->domain_id);
> > +
> > +        ret =3D -EBUSY;
> > +        break;
> > +    }
> > +
> > +    rcu_read_unlock(&domlist_read_lock);
> > +
> > +    return ret;
> > +}
> > +
> > +/* Xen suspend. data identifies the domain that initiated suspend. */
> > +static void system_suspend(void *data)
> > +{
> > +    int status;
> > +    unsigned long flags;
> > +    struct domain *d =3D (struct domain *)data;
> > +
> > +    BUG_ON(system_state !=3D SYS_STATE_active);
> > +
> > +    system_state =3D SYS_STATE_suspend;
> > +
> > +    printk("Xen suspending...\n");
> > +
> > +    freeze_domains();
> > +    scheduler_disable();
> > +
> > +    status =3D can_system_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_scheduler;
>
> When we have an error and we get the resume_scheduler path, we apply back=
 the
> context of the guest saved previously in do_psci_1_0_system_suspend(), so=
 am I
> correct saying the guest won=E2=80=99t get any PSCI error back and we res=
ume the guest
> from the guest resume entrypoint?
>
> In case, should we have a different path that returns a PSCI error (PSCI_=
*) into the guest
> x0, and skips the context restore?

You are right about the current control flow: once the virtual
SYSTEM_SUSPEND request has been accepted and the domain has been parked, a
later failure in the Xen-wide suspend path resumes the domain through the n=
ormal
domain resume path, rather than returning a PSCI error from the original ca=
ll.

This is intentional in the current design. The virtual PSCI SYSTEM_SUSPEND
path parks the domain and saves its resume context. The actual Xen-wide hos=
t
suspend is a separate step that is attempted only after all domains are
suspended.

So a failure in the later Xen-wide suspend step is treated as an abort of t=
he
host suspend attempt after the domain suspend was already accepted. The dom=
ain
is then resumed through the existing domain resume path, similarly to the
toolstack/xl suspend-resume flow, rather than by re-entering the guest PSCI
call path and modifying the saved vCPU context again.

I agree this design is not obvious from the patch. I will clarify the commi=
t
message and comments. If you or the maintainers think that failures before =
the
physical SYSTEM_SUSPEND call succeeds should be reported back through the
original virtual PSCI call, then this would require a different flow. I was
trying to avoid that extra complexity in this series.

>
> > +    }
> > +
> > +    /*
> > +     * Non-boot CPUs have to be disabled on suspend and enabled on res=
ume
> > +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to=
 PSCI
> > +     * CPU_OFF to be called by each non-boot CPU. Depending on the und=
erlying
> > +     * platform capabilities, this may lead to the physical powering d=
own of
> > +     * CPUs.
> > +     */
> > +    status =3D disable_nonboot_cpus();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_nonboot_cpus;
> > +    }
> > +
> > +    time_suspend();
> > +
> > +    status =3D iommu_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_time;
> > +    }
> > +
> > +    console_start_sync();
> > +    status =3D console_suspend();
> > +    if ( status )
> > +    {
> > +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n=
", status);
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_end_sync;
> > +    }
> > +
> > +    local_irq_save(flags);
> > +    status =3D gic_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_irqs;
> > +    }
> > +
> > +    set_init_ttbr(xen_pgtable);
> > +
> > +    /*
> > +     * Enable identity mapping before entering suspend to simplify
> > +     * the resume path
> > +     */
> > +    update_boot_mapping(true);
> > +
> > +    if ( prepare_resume_ctx(&cpu_context) )
> > +    {
> > +        status =3D call_psci_system_suspend();
> > +        /*
> > +         * If suspend is finalized properly by above system suspend PS=
CI call,
> > +         * the code below in this 'if' branch will never execute. Exec=
ution
> > +         * will continue from hyp_resume which is the hypervisor's res=
ume point.
> > +         * In hyp_resume CPU context will be restored and since link-r=
egister is
> > +         * restored as well, it will appear to return from prepare_res=
ume_ctx.
> > +         * The difference in returning from prepare_resume_ctx on syst=
em suspend
> > +         * versus resume is in function's return value: on suspend, th=
e return
> > +         * value is a non-zero value, on resume it is zero. That is wh=
y the
> > +         * control flow will not re-enter this 'if' branch on resume.
> > +         */
> > +        if ( status )
> > +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=
=3D%d\n",
> > +                    status);
> > +    }
> > +
> > +    system_state =3D SYS_STATE_resume;
> > +    update_boot_mapping(false);
> > +
> > +    gic_resume();
> > +
> > + resume_irqs:
> > +    local_irq_restore(flags);
> > +
> > +    console_resume();
> > + resume_end_sync:
> > +    console_end_sync();
> > +
> > +    iommu_resume();
> > +
> > + resume_time:
> > +    time_resume();
> > +
> > + resume_nonboot_cpus:
> > +    /*
> > +     * The rcu_barrier() has to be added to ensure that the per cpu ar=
ea is
> > +     * freed before a non-boot CPU tries to initialize it (_free_percp=
u_area()
> > +     * has to be called before the init_percpu_area()). This scenario =
occurs
> > +     * when non-boot CPUs are hot-unplugged on suspend and hotplugged =
on resume.
> > +     */
> > +    rcu_barrier();
> > +    enable_nonboot_cpus();
> > +
> > + resume_scheduler:
> > +    scheduler_enable();
> > +    thaw_domains();
> > +
> > +    system_state =3D SYS_STATE_active;
> > +
> > +    printk("Resume (status %d)\n", status);
> > +
> > +    domain_resume(d);
> > +}
> > +
> > +static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
> > +
> > +void host_system_suspend(struct domain *d)
> > +{
> > +    system_suspend_tasklet.data =3D (void *)d;
> > +    /*
> > +     * The suspend procedure has to be finalized by the pCPU#0 (non-bo=
ot pCPUs
> > +     * will be disabled during the suspend).
> > +     */
> > +    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
> > +}
> > +
> > /*
> >  * Local variables:
> >  * mode: C
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index bd87ec430d..8fb9172186 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -5,6 +5,7 @@
> >
> > #include <asm/current.h>
> > #include <asm/domain.h>
> > +#include <asm/suspend.h>
> > #include <asm/vgic.h>
> > #include <asm/vpsci.h>
> > #include <asm/event.h>
> > @@ -232,8 +233,7 @@ static int32_t do_psci_1_0_system_suspend(register_=
t epoint, register_t cid)
> >     if ( is_64bit_domain(d) && is_thumb )
> >         return PSCI_INVALID_ADDRESS;
> >
> > -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> > -    if ( is_hardware_domain(d) )
> > +    if ( !IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && is_hardware_domain(d) )
> >         return PSCI_NOT_SUPPORTED;
> >
> >     /* Ensure that all CPUs other than the calling one are offline */
> > @@ -266,6 +266,9 @@ static int32_t do_psci_1_0_system_suspend(register_=
t epoint, register_t cid)
> >             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D=
%#"PRIregister"\n",
> >             epoint, cid);
> >
> > +    if ( is_control_domain(d) )
>
> Why is_control_domain() here and not is_hardware_domain() ?

The use of is_control_domain() is intentional.

The intended model is that Xen-wide host suspend is orchestrated by the
privileged management/control domain. The control domain coordinates the
toolstack side, asks other domains to enter suspend, and then issues the fi=
nal
SYSTEM_SUSPEND request to Xen.

This does not have to be the same entity as the hardware domain. If the
hardware domain is separate, it is one of the domains that the control doma=
in
parks before the final host suspend step.

The hwdom-specific checks in this patch have a different purpose: they avoi=
d
the old hwdom_shutdown() path for SHUTDOWN_suspend and allow the hardware
domain to be parked as part of the suspend sequence. They do not define the
policy for who is allowed to trigger Xen-wide host suspend.

That said, this policy may not be optimal for all configurations, especiall=
y
when the control and hardware domain roles are split. I would appreciate yo=
ur
view, as well as the maintainers' views, on whether the trigger should rema=
in
control-domain based, be tied to the hardware domain instead, or be express=
ed
through a separate host-suspend capability/helper.

>
> > +        host_system_suspend(d);
> > +
> >     return rc;
> > }
> >
> > @@ -290,7 +293,10 @@ static int32_t do_psci_1_0_features(uint32_t psci_=
func_id)
> >         return 0;
> >     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTE=
D : 0;
> > +        if ( IS_ENABLED(CONFIG_SYSTEM_SUSPEND) ||
> > +             !is_hardware_domain(current->domain) )
>
> Should this have also the condition that =E2=80=9Cis hardware domain and =
psci_ver >=3D PSCI_VERSION(1, 0)=E2=80=9D?
> Otherwise if the host machine doestn=E2=80=99t support PSCI 1.0 we would =
return OK here but the call would
> fail later in call_psci_system_suspend()?

Good point.

I agree that, for the domain allowed to trigger Xen-wide suspend, Xen shoul=
d
not advertise SYSTEM_SUSPEND if the host suspend path cannot be used.

I think this should be checked as an explicit host SYSTEM_SUSPEND capabilit=
y,
rather than only as psci_ver >=3D PSCI_VERSION(1, 0). The same capability c=
heck
also needs to be enforced in the actual SYSTEM_SUSPEND handler before parki=
ng
the domain, because a caller may invoke SYSTEM_SUSPEND directly without fir=
st
querying PSCI_FEATURES.

For ordinary guests, the physical PSCI version is not relevant because they
cannot trigger host suspend; their SYSTEM_SUSPEND path is virtual.

I will make this consistent in v9: PSCI_FEATURES will advertise SYSTEM_SUSP=
END
for the host-suspend-triggering domain only when the host SYSTEM_SUSPEND ba=
ckend
is available, and the actual SYSTEM_SUSPEND path will enforce the same chec=
k.

>
> > +            return 0;
> > +        fallthrough;
> >     default:
> >         return PSCI_NOT_SUPPORTED;
> >     }
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 0a20aa0a12..feb1336f46 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -137,6 +137,9 @@ config HAS_EX_TABLE
> > config HAS_FAST_MULTIPLY
> > bool
> >
> > +config HAS_HWDOM_SYSTEM_SUSPEND
> > + bool
> > +
> > config HAS_IOPORTS
> > bool
> >
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index bb9e210c28..d3edfb2a13 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1375,6 +1375,11 @@ void __domain_crash(struct domain *d)
> >     domain_shutdown(d, SHUTDOWN_crash);
> > }
> >
> > +static inline bool want_hwdom_shutdown(uint8_t reason)
> > +{
> > +    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
> > +           reason !=3D SHUTDOWN_suspend;
> > +}
> >
> > int domain_shutdown(struct domain *d, u8 reason)
> > {
> > @@ -1391,7 +1396,7 @@ int domain_shutdown(struct domain *d, u8 reason)
> >         d->shutdown_code =3D reason;
> >     reason =3D d->shutdown_code;
> >
> > -    if ( is_hardware_domain(d) )
> > +    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
> >         hwdom_shutdown(reason);
> >
> >     if ( d->is_shutting_down )
> > diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrou=
gh/arm/smmu.c
> > index 22d306d0cb..45f29ef8ec 100644
> > --- a/xen/drivers/passthrough/arm/smmu.c
> > +++ b/xen/drivers/passthrough/arm/smmu.c
> > @@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(struc=
t domain *d)
> > xfree(xen_domain);
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +static int arm_smmu_suspend(void)
> > +{
> > + return -ENOSYS;
> > +}
> > +#endif
>
> Maybe we want to gate the feature also to !CONFIG_ARM_SMMU ? I would wait=
 for the maintainers
> view on this.

I feel that gating this strictly on !CONFIG_ARM_SMMU might not be the most
optimal approach here.

CONFIG_ARM_SMMU is a build-time option and does not mean that an old SMMUv1=
/v2
device is actually present. Using it would disable system suspend even on
platforms where only SMMUv3 is used, because CONFIG_ARM_SMMU is enabled by
default for Arm.

The condition should be runtime-based: whether the active/probed IOMMU devi=
ces
have system suspend/resume support. For the old ARM SMMU driver this is not
implemented today, so a platform with an SMMUv1/v2 instance should not expo=
se
or attempt host suspend.

I think we should handle this by tracking whether any old ARM SMMUv1/v2 dev=
ice
was actually probed, or by adding a generic IOMMU suspend capability check.=
 Then
the host suspend availability check can reject system suspend only when suc=
h an
unsupported IOMMU is present, instead of disabling the feature for all
Arm builds
with CONFIG_ARM_SMMU enabled.

I would be interested to hear if you or the maintainers see a better way to
express this capability.

Best regards,
Mykola

>
> Cheers,
> Luca
>
>

