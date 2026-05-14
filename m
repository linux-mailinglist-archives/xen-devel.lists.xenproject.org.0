Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMvcDpXhBWqNdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 16:52:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9748A543819
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 16:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308969.1580195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNXPj-0005WF-Bl; Thu, 14 May 2026 14:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308969.1580195; Thu, 14 May 2026 14:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNXPj-0005Uo-92; Thu, 14 May 2026 14:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1308969;
 Thu, 14 May 2026 14:51:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wNXPh-0005Ui-Nq
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 14:51:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNXPf-00FIXN-5R
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 16:51:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a05e149-e002-0a2a0a5209dd-0a2a4505d048-44
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:51:48 +0200
Received: from [209.85.208.172] (helo=mail-lj1-f172.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a05e184-aaa8-0a2a45050019-d155d0acb00f-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:51:48 +0200
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-39397d63804so93455251fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 07:51:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778770308; cv=none;
        d=google.com; s=arc-20240605;
        b=ZULRKXErdrQW3HpmDvIgQJ+hwoDkqsdXpUKjGjZa9Ov4MazpyuUHUoEN/wtyDnlj2n
         fnYbTfsrnPy/xJ0UzkL6B0zmOms9BWUJR+N1X7wS+GZ3vmOhljri3HLhZzZHlnxSvvF7
         SB3Iriw5HfIqIdQtQ1OxS8Y4fUQLkau/sP7K8+BwxiYJAmFysNo8h9EAe0ItPVPirSGu
         VPouy9FUwamIFquVHTIJQCfTDBg4VrSSsiT5IwlYxVUn22FeBCynuv/KJYbA7iFulaJ7
         +fy65Rr1c6tODoKuhy7o1aFV7N8YGrJbMNy5Y7APzZu2dB+03hdV+EOOS5ryyXJ0GRoH
         m6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KIIiwCBbQ685Z7X9m9+JX/D+mioY59yU2loMFYxhtWQ=;
        fh=GgMYjtlO+qGjk4ieOEUMK5gpFDA70JLVlWtgRNJ+MYY=;
        b=jtC8aXgQq8CywyTtOXqPggsgWOj5Ra7xotCqIHSw+7KQs4adZ4GxPSC+3FxYGyytNI
         CMYsSpCmI5/mqUAKY80/h1LydJPl/5Pzr1L+rwel0eLhq+s7sExEgOr12C+by9TJWry5
         fcKX+T4FBJEtDOZS8dNh5l2bLNQd/smpQH9PMGmoGV0H3FUnJ7aJJpA0Ze/jQKyFW7KS
         UQ9bQhQ7JFwjCfF2IU8lyDd+NpdJF6f6tFIANQKavzOPVN5DMaTVP8QKxmVfHromxCqS
         bLx2Ygp+Pad/08rHqhKvdj9OFgwutRcLwtJnoldx9sVcmevurWker9eFsiGYOnUKi2FR
         118g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778770308; x=1779375108; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIIiwCBbQ685Z7X9m9+JX/D+mioY59yU2loMFYxhtWQ=;
        b=d/QC5ca//pUsbCXx/3sFfpstYfTaanAXkDKt9G+N4VPwLqNdVS5ceEAN8k0Ryc+z4o
         8D+wmEUobzwaPeT/2YOoPPTCCc15peqLj//06nhPuGVH3R7SbdQCkKrGF6pilUQmUVwc
         jyH4iPKA4o0z7XwfGBDwupWO9MA7iUaPeEjictWCBmVi7XO9x4rEQVLbi9xK1Ss8OqjP
         6M68acgXllVF7EwK5Rd87iU+BMlR1+NU9fNN2FJagewoi44QqqmQr9rV6JHuiV4f8O8C
         4wlrOUNOfzg58M93iQdUPaiY40fCOUPsnXjHkqev5SOHxDJ7kOFo8H41ZY3Vs6wlD0+C
         ZjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778770308; x=1779375108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KIIiwCBbQ685Z7X9m9+JX/D+mioY59yU2loMFYxhtWQ=;
        b=OOa+iSfRZjc+t52xxronALk2pvuWG8K/m3DMrMB8MUKuV77MUXhfDfETSwnjDJvYEI
         4laisSzkkgMxtEGQNFJe38PVLLP/YIcZk/xd38if3/Hdk17qF1QSfXM/feDE9WlLZQFy
         HN7eI3Vl+rJ4JKS6U3CVmCc5TfcPEo/3rgr+zetryfPJE2Tt9chi9WTfyWNQGQ73+U83
         CYpYTyS49c3mqqrWvUZX6wo6Rb8rx4g4IM/LRF5GQnPMHa+n5GxN++m4u7OgTK05yqoQ
         81BaFcC4kM5J7tNGlD2EUc6NGhtnintjo2X7k8EX18Jum0E9oKonMH1qD9m9lREFlwJ/
         6lrg==
X-Forwarded-Encrypted: i=1; AFNElJ9PdtJFHKl4Uhpi65dk7sAhZ800+tDytPDum8rWCBW1p2DRIcHILCF/N964GUk40lWuQU1vcL1LgTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnYSxAxf3gJ8VGUBvnsQwaC1hU8+T+OLuE+LvwIqeuqL1lGXgl
	d4TchvZKq5X32D5tmwq8g0ANWqgmP4QPODXJ9qOMQsxOkXL76iqVKTFuY8U20ibDJiU535aw5WU
	gZLf/W1TRu7THu9sYIjHPYnzgSBrx1+0=
X-Gm-Gg: Acq92OFVAVDXASZcOefMNTM5ZeSwgDuDH7YTCBcvBNoZmSk2Wa5jC/BZr1lpTlTKAB6
	v3wWbWvirZatzrlIHOOhOpxIU6b0uR+RNnJqgkmGt9RzphN7b4Bwf3IKKiGw/i4dh5bwU1+c1Sw
	igPBJ8wzorQWuoB/zImcFLPz5euFJndhtV90dROLZPqQaaTjX6vfbdivIW559/OUUkV02ZH+xYK
	/MKEb4mSM9zqKTYQqY72K+CMd8RNMKHK+QiG5QiG69Lb+FZyULz4PnUSxBAp6WPtQNYUxa5lIdU
	ipgXhNF+EdO6Mrs=
X-Received: by 2002:a05:651c:24a:b0:394:5c9a:f315 with SMTP id
 38308e7fff4ca-3945c9afc6cmr15373501fa.14.1778770307546; Thu, 14 May 2026
 07:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <06448a30ef6694a55ac85d4c8c78ca2d71342430.1778605274.git.mykola_kvach@epam.com>
 <7a540913-adc4-4172-9108-9c91eaf854fe@suse.com>
In-Reply-To: <7a540913-adc4-4172-9108-9c91eaf854fe@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 14 May 2026 17:51:36 +0300
X-Gm-Features: AVHnY4JWFNAD9wNXPx--H8U3_8L_mpDIMMkgHAKqUqL7_4hcbV5XqSOH_oqu7g8
Message-ID: <CAGeoDV8cmFJPcaJRg_dqxZqc7Q+=CDS9jvw-HDw1pDfb3HGfog@mail.gmail.com>
Subject: Re: [PATCH v9 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1778770308-E0A66443-DE9AD681/0/0
X-purgate-type: clean
X-purgate-size: 7462
X-Rspamd-Queue-Id: 9748A543819
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:rahul.singh@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Jan,

Thank you for the review.

On Wed, May 13, 2026 at 9:54=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.05.2026 19:07, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> > capability for platforms where the hardware domain can be parked with
> > SHUTDOWN_suspend without calling hwdom_shutdown().
> >
> > Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> > non-control domains, including the hardware domain when it is not actin=
g as a
> > control domain, the call is handled as a guest/domain suspend request a=
nd
> > parks the domain in SHUTDOWN_suspend.
> >
> > Control domains need additional sequencing because their SYSTEM_SUSPEND
> > request is used to coordinate host-wide suspend. A non-last awake contr=
ol
> > domain may be parked in SHUTDOWN_suspend without requiring the host sus=
pend
> > path to be available. The last awake control domain is treated as the p=
oint
> > where the request becomes a host-suspend request, and it may only proce=
ed
> > when all non-control domains are already in SHUTDOWN_suspend and the ho=
st
> > suspend path is available.
> >
> > Keep the control-domain sequencing and domain-readiness checks out of
> > PSCI_FEATURES. They are per-attempt runtime conditions rather than stab=
le PSCI
> > function availability. Advertise SYSTEM_SUSPEND as implemented by vPSCI=
 and
> > enforce the sequencing policy in the call handler.
> >
> > Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEN=
D so
> > that SHUTDOWN_suspend from the hardware domain can be treated as a doma=
in
> > suspend state rather than as a hardware-domain initiated host shutdown.=
 This
> > does not by itself imply that host-wide suspend is available.
> >
> > Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPE=
ND
> > capability with runtime blockers reported by Xen-owned subsystems. Add
> > runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ p=
aths
> > lacking suspend/resume support. These blockers are runtime based, so th=
ey
> > only apply to drivers or paths that Xen actually uses on the platform. =
For
> > SMMUv3, the blocker applies only when Xen actually uses the MSI IRQ pat=
h,
> > since resume does not restore the SMMU *_IRQ_CFGn MSI registers yet.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/arch/arm/Kconfig                  |   1 +
> >  xen/arch/arm/gic.c                    |   6 ++
> >  xen/arch/arm/include/asm/psci.h       |   3 +
> >  xen/arch/arm/include/asm/suspend.h    |  10 ++-
> >  xen/arch/arm/psci.c                   |   7 ++
> >  xen/arch/arm/suspend.c                |  40 +++++++++
> >  xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
> >  xen/common/Kconfig                    |   3 +
> >  xen/common/domain.c                   |   7 +-
> >  xen/drivers/char/serial.c             |  12 +++
> >  xen/drivers/passthrough/arm/iommu.c   |   4 +
> >  xen/drivers/passthrough/arm/smmu-v3.c |   4 +
> >  xen/include/xen/serial.h              |   1 +
> >  xen/include/xen/suspend.h             |   2 +
> >  14 files changed, 201 insertions(+), 13 deletions(-)
> >
>
> Contrary to what the cover letter says, there's no revlog here.

Right, I should have added a short note for this patch as well.

This is a new patch in this version of the series, so there was no previous
version of this particular patch to compare against, but I agree that this
should still have been mentioned explicitly, e.g. as "New in v9". I will ad=
d
that in the next version.

>
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,9 +1,49 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > +#include <asm/psci.h>
> >  #include <asm/suspend.h>
> >
> > +#include <xen/lib.h>
> > +#include <xen/serial.h>
> > +
> >  struct resume_cpu_context resume_cpu_context;
> >
> > +/*
> > + * Non-PSCI infrastructure can make host suspend impossible even when =
the PSCI
> > + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has=
 no valid
> > + * suspend/resume path.
> > + *
> > + * This gate is checked only when the last awake control domain attemp=
ts to
> > + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> > + */
> > +static bool host_system_suspend_runtime_allowed =3D true;
> > +
> > +static bool host_serial_suspend_allowed(void)
> > +{
> > +    if ( serial_suspend_supported() )
> > +        return true;
> > +
> > +    printk_once(XENLOG_INFO
> > +                "Host SYSTEM_SUSPEND blocked: serial driver lacks susp=
end/resume support\n");
>
> Please try to keep log messages down to a reasonable size. In the case he=
re,
> what value does "suspend/resume" add?

Fair point. The important part is that the serial driver cannot support the
host suspend path. I will shorten the message somehow.

>
> > +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> > +{
> > +    struct domain *other;
> > +    bool last_awake_control_domain =3D true;
> > +    bool awake_non_control_domain =3D false;
> > +
> > +    /* Only control domains participate in sequencing policy. */
> > +    if ( !is_control_domain(d) )
> > +        return 0;
> > +
> > +    rcu_read_lock(&domlist_read_lock);
> > +
> > +    for_each_domain ( other )
> > +    {
> > +        bool suspended;
> > +
> > +        if ( other =3D=3D d )
> > +            continue;
> > +
> > +        suspended =3D domain_in_suspend_state(other);
> > +        if ( suspended )
> > +            continue;
> > +
> > +        if ( is_control_domain(other) )
> > +        {
> > +            last_awake_control_domain =3D false;
> > +            break;
> > +        }
> > +
> > +        awake_non_control_domain =3D true;
> > +    }
> > +
> > +    rcu_read_unlock(&domlist_read_lock);
> > +
> > +    /*
> > +     * Another control domain is still awake. This request is only the=
 first
> > +     * phase of the sequencing: park this control domain and leave the=
 host
> > +     * running. Host-wide suspend gates must not block this intermedia=
te state.
> > +     */
> > +    if ( !last_awake_control_domain )
> > +        return 0;
> > +
> > +    /*
> > +     * This is the last awake control domain. It must not be parked un=
less the
> > +     * request can proceed as a host-suspend request; otherwise Xen wo=
uld lose
> > +     * the last domain that can coordinate the system suspend.
> > +     */
> > +    if ( awake_non_control_domain )
> > +    {
> > +        printk(XENLOG_DEBUG
> > +               "SYSTEM_SUSPEND denied: last awake control domain dom%u=
 requested host suspend while non-control domains are still awake\n",
> > +               d->domain_id);
>
> Same here, plus please use %pd.

Ack, I will shorten the message and use %pd.

>
> > --- a/xen/drivers/char/serial.c
> > +++ b/xen/drivers/char/serial.c
> > @@ -497,6 +497,8 @@ const struct vuart_info *serial_vuart_info(int idx)
> >
> >  #ifdef CONFIG_SYSTEM_SUSPEND
> >
> > +static bool __read_mostly serial_suspend_available =3D true;
>
> __ro_after_init?

Good catch, yes.
I will use __ro_after_init for this variable.

Best regards,
Mykola

>
> Jan

