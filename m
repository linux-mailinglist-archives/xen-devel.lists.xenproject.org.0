Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHOkGhfE+Wk0DgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:19:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7664CAE87
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300480.1575011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCre-0006mU-95; Tue, 05 May 2026 10:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300480.1575011; Tue, 05 May 2026 10:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCre-0006jV-5z; Tue, 05 May 2026 10:18:54 +0000
Received: by outflank-mailman (input) for mailman id 1300480;
 Tue, 05 May 2026 10:18:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKCrc-0006jP-Qa
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:18:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCrc-00Bzju-69
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:18:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f9c407-2eae-0a2a0a5409dd-0a2a45049894-2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:18:52 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f9c40b-1dec-0a2a45040019-d155d0b2ccbe-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:18:52 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-39393ec4ed0so25929751fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 03:18:52 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777976331; cv=none;
        d=google.com; s=arc-20240605;
        b=BfQWkc4/422jcjKOTZ12kLrhm4JOz5Z3OHk/amvD1UQ9ENI45elsF7q/cJq9pjNQTt
         U8i2aTP+D3d8KjT6uSZTWKp0HuQd2mpWnEni9fIzBOomimgIxljjbco8hkliVi8IRU7m
         mgOHFqDb17Hu4dnxD3CefqWv5yq7FI6pbW9SrSXSJHsO1fUgvTGFQ12zBmYMTLTEADiZ
         6tG42QyxEsVwpra9GUUX4kpLn57XDoQGiR7zrTeZNrVjGWSwFvd7znVLX2hRLHIDBKM4
         7+BCcoTlgHklhFthdhwmsS9AQRiIIztHqB9Xmt7HJ4jy35rr9TqWJWzBaJjHUq43qI41
         nCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1U65eNbtkKV3mllMX338BcDp2zbFoL57vU+Lzv7wek=;
        fh=WN+dxI8BWGEvyCtKTDN97slsPx57wxpKUn64COmgY4w=;
        b=Q2eOkKdXXoLgj064lx4wOadPryifRWHY4IYe2Pdl+yGK9LU3WXVtg5GbAwRbewuGmo
         wgh5zZ1GWvE6B60Fa9wPNYix4w7J/Id8N+DyOK3BCoZmMKTJnc9XViMIOGGVV4HmVN+w
         L4Yn3GpKc4tFwe4strJunnd+l1cpmzPq5xXwNdYKVnsHGyIsEYPxdYZgys+Ffo8WrY+r
         wuNcA0JNeBKUr/nV+aDfEiLC0FYxzT87Mj/HYuYJklQstkFbPVJniK1vkXlkb9k7a5bp
         195cRTS6CHHoPEnTDSMmjvOUqYFbrw9m2mI7HZvQLmGCh0gYxCia1EO8OH1ADeVA4AD8
         ET/w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777976331; x=1778581131; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1U65eNbtkKV3mllMX338BcDp2zbFoL57vU+Lzv7wek=;
        b=O2VAQ0ZE0sy53svMmr0lDDX36j0uJqndoTAKbCMUy8JFrdVtzLtckIy7DSS+WhI5uy
         7nF3PsME3TOVAAY31mdiSMY0HddLMC1MZ/vgJAHpKZlw7hjrIApTA0iStynF0MkEEZHa
         ZiBfquWTSCEwzdsL1gGXvwsSXavOIOo3JTvicai0jfGW0Mg7+ddzDlQxnGTOMVNWCTk+
         vPSv2cDrPpS2sp0RXQ9YUeYpRz9nnQNPTkx+UUYj/6nFI3rNPrwqXc1i5L3CaSq6pQGU
         vFqL6d7mKm80Gu3sXn1TOBwVOqWwgExo+SXz95nX3YuzxpsqQ0AVS+GKTNe7+QlrzRLO
         rK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976331; x=1778581131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1U65eNbtkKV3mllMX338BcDp2zbFoL57vU+Lzv7wek=;
        b=kieItZh0IfG2jXHlM6NjoJFbEydIQF+yutPXHq+svxCO0gHjohZMeS4uM6l5TiOyNk
         XBUmybrtnnDCr0TJU+8NVTY3i1kQ01/YV/NC937ETbaFSQYiBuuH50HkCl+TNT6nyWcE
         yDN6Rpm5EJ76aLfycL8sKjMzN3PzkVjmjz4GE54WP/ZNMTV7YSBIcR1Zv3q4zWy8GJY/
         FsV2/8jGukQyGMD+rYP+sthlmhYehA9VrPWFBvGwJTyvNvPmIKYszAhOFehYcn235LlG
         yZQn413MsiclCmENMpUTDoEgXbzyXW9hj/9WNQNr3UmvBXOasMg9mIVtg5delTLaOLdU
         u2eQ==
X-Gm-Message-State: AOJu0YwOI34l5K52Jfkxmhg6Uuv9OzXK0yYTtowO7cGl66ABcKXxmHRI
	x9NO2nTLr3PkUnhRBoDlPEfcjPnCOtWfUauEnzfX7+yE8d1CwmbbNrp2uX5kbFtuPTSQrK5VBdj
	MRvrPGfMPbDOjR2EBSff8N4LodS4Ha3M=
X-Gm-Gg: AeBDieviTR85LL/eHiJXejmDw5wGkqNwY6wJh0xwRPLqsZobxCNPSVMe6ODU6gHpp87
	GIGw15NVftsZz48EP+JhMW5NQHJa0+rvAU8UWlg6juJQ3/+L3Micxnm8y94uqnPhZnf0j7w/dlE
	hcMlIGl/fg55+mqvXX5d1yNfvJjWx48wtSzR///WIkUxpKrNYEDg/ybNsGZVYOBWkILLwbbjbeN
	4kQmwojtyC+1yv1dEIxp3qxNVDdejJvGCJm3cYsPVeVagZXGT8bYd625jWHwNetDhM5o78IqJTu
	iuvUyElYffY5RFR1
X-Received: by 2002:a05:6512:10d6:b0:5a4:175d:1278 with SMTP id
 2adb3069b0e04-5a87f1a0551mr1106353e87.1.1777976331114; Tue, 05 May 2026
 03:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <a977e246d1d0a32a6618efd1385ad178779c2a61.1775125380.git.mykola_kvach@epam.com>
 <8B067451-681E-45CA-843A-1F0FD34ABF3C@arm.com>
In-Reply-To: <8B067451-681E-45CA-843A-1F0FD34ABF3C@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 13:18:40 +0300
X-Gm-Features: AVHnY4Lh2TgfsJXmLLfDTHnZO4AfN0LJzrVBjJSiTtfqzJH9HElEdrL1QbaUmU4
Message-ID: <CAGeoDV-Caf5CyxPxxJjVsdahsJrr4FETPy7M=xCyB7n8bKrfGg@mail.gmail.com>
Subject: Re: [PATCH v8 07/13] xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1777976332-2B96A3FF-C99E03BA/0/0
X-purgate-type: clean
X-purgate-size: 4711
X-Rspamd-Queue-Id: CF7664CAE87
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Bertrand,

Thank you for the review.

On Mon, Apr 27, 2026 at 11:22=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 2 Apr 2026, at 12:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The FF-A notification SRI interrupt handler was not correctly tied to
> > CPU hotplug and suspend/resume. As a result, CPUs going offline and
> > back online could end up with stale or missing handlers, breaking
> > delivery of FF-A notifications.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> This will probably need a rebase if the harden notification and VM to VM =
notification
> serie in FF-A is merged first.

I will rebase this patch if the FF-A notification series lands first.

>
> Anyway, changes look good so:
>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thank you, I will add your Reviewed-by.

Best regards,
Mykola

>
> Cheers
> Bertrand
>
> > ---
> > xen/arch/arm/tee/ffa_notif.c | 63 ++++++++++++++++++++++++++++--------
> > 1 file changed, 50 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.=
c
> > index 186e726412..513c399594 100644
> > --- a/xen/arch/arm/tee/ffa_notif.c
> > +++ b/xen/arch/arm/tee/ffa_notif.c
> > @@ -360,10 +360,28 @@ static int32_t ffa_notification_bitmap_destroy(ui=
nt16_t vm_id)
> >     return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0=
, 0);
> > }
> >
> > -void ffa_notif_init_interrupt(void)
> > +static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, sri_irq);
> > +
> > +static int request_sri_irq(void)
> > {
> >     int ret;
> > +    struct irqaction *sri_action =3D &this_cpu(sri_irq);
> > +
> > +    sri_action->name =3D "FF-A notif";
> > +    sri_action->handler =3D notif_irq_handler;
> > +    sri_action->dev_id =3D NULL;
> > +    sri_action->free_on_release =3D 0;
> > +
> > +    ret =3D setup_irq(notif_sri_irq, 0, sri_action);
> > +    if ( ret )
> > +        printk(XENLOG_ERR "ffa: setup_irq irq %u failed: error %d\n",
> > +               notif_sri_irq, ret);
> >
> > +    return ret;
> > +}
> > +
> > +void ffa_notif_init_interrupt(void)
> > +{
> >     if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
> >     {
> >         /*
> > @@ -376,14 +394,36 @@ void ffa_notif_init_interrupt(void)
> >          * pending, while the SPMC in the secure world will not notice =
that
> >          * the interrupt was lost.
> >          */
> > -        ret =3D request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A=
 notif",
> > -                          NULL);
> > -        if ( ret )
> > -            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %=
d\n",
> > -                   notif_sri_irq, ret);
> > +        request_sri_irq();
> >     }
> > }
> >
> > +static void deinit_ffa_notif_interrupt(void)
> > +{
> > +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
> > +        release_irq(notif_sri_irq, NULL);
> > +}
> > +
> > +static int cpu_ffa_notif_callback(struct notifier_block *nfb,
> > +                                  unsigned long action,
> > +                                  void *hcpu)
> > +{
> > +    switch ( action )
> > +    {
> > +    case CPU_DYING:
> > +        deinit_ffa_notif_interrupt();
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +
> > +    return NOTIFY_DONE;
> > +}
> > +
> > +static struct notifier_block cpu_ffa_notif_nfb =3D {
> > +    .notifier_call =3D cpu_ffa_notif_callback,
> > +};
> > +
> > void ffa_notif_init(void)
> > {
> >     const struct arm_smccc_1_2_regs arg =3D {
> > @@ -392,7 +432,6 @@ void ffa_notif_init(void)
> >     };
> >     struct arm_smccc_1_2_regs resp;
> >     unsigned int irq;
> > -    int ret;
> >
> >     /* Only enable fw notification if all ABIs we need are supported */
> >     if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> > @@ -408,13 +447,11 @@ void ffa_notif_init(void)
> >         notif_sri_irq =3D irq;
> >         if ( irq >=3D NR_GIC_SGI )
> >             irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> > -        ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", N=
ULL);
> > -        if ( ret )
> > -        {
> > -            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %=
d\n",
> > -                   irq, ret);
> > +
> > +        if ( request_sri_irq() )
> >             return;
> > -        }
> > +
> > +        register_cpu_notifier(&cpu_ffa_notif_nfb);
> >         fw_notif_enabled =3D true;
> >     }
> > }
> > --
> > 2.43.0
> >
>

