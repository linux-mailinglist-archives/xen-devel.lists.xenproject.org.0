Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D427E83A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 14:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.642.2153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNavG-0002Xm-3G; Wed, 30 Sep 2020 12:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642.2153; Wed, 30 Sep 2020 12:09:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNavF-0002XN-W3; Wed, 30 Sep 2020 12:09:25 +0000
Received: by outflank-mailman (input) for mailman id 642;
 Wed, 30 Sep 2020 12:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNavF-0002XI-68
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:09:25 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a761e47a-0c4f-4c24-8ec8-c3d9632cfd69;
 Wed, 30 Sep 2020 12:09:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o5so1504988wrn.13
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 05:09:23 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id k12sm2566312wrn.39.2020.09.30.05.09.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 05:09:22 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNavF-0002XI-68
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:09:25 +0000
X-Inumbo-ID: a761e47a-0c4f-4c24-8ec8-c3d9632cfd69
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a761e47a-0c4f-4c24-8ec8-c3d9632cfd69;
	Wed, 30 Sep 2020 12:09:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o5so1504988wrn.13
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=ZqGsPplOxneV53h2PKsnNM+KwrR0xoyuqpOHVruZs5Q=;
        b=gVL5e45xjcnMSejHHDAjDD0ELpsgu5Ucz/9iFHsAyVC8g8fFEfKBmQWMjdj28Brhv1
         7T5zhu1otU9mUayiIx/uKAZNMshOHERaBjoSau9as0zI+0CdSTJTH3coDBx3PiVECvl9
         /8tcDz2AG0Minfj/XK9z0KSJZ7NWqgbHdcEl4jT+91ctjs1nIl3ST9FSxUJsCmxTL0d+
         cLHgMz3Gim1LzJ1uZt6A6vulGJS1Bm5ohXexpZcHOsdjFQCix0A7Upv8MOeQZVbncBXC
         I6nFPXZEVFhRz63PMVO3wFN5R4AE/w5pFS93R7K8fW4siZBnqak3KHT9YIoaXOjh5wTE
         eB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=ZqGsPplOxneV53h2PKsnNM+KwrR0xoyuqpOHVruZs5Q=;
        b=mmm241wnpO6QbVvEVwhLWYwuVaHAFYkH64RtDM1AQiGhxOVjC1U2Q+YFbAG/elLUeI
         qNBdItO6Zn09e1NB7vApPOcDwUKWHORdnLVZ8s59W2ZDNP8EqtMmO+55a0k4hPWuDXrw
         Bx4aJ+UnVpR6ynwDBZhD4QLOzyvINoEzPRhgMlyE89dIz8hfPXAf9FsJgBjGar48SXYF
         zHmA+dUbZB0GlP/ikEy4D4a6lzz9/2+Tnc1nkvgDVQv9P/2POqCorA29SbjVGIAMU0I7
         D/OHUn01xd+L0roEPbdF4aWC5emKp+nwnJlN6KWghVs4Lf/XBVTxTk8Ksey1X8B7J4Xe
         hlbA==
X-Gm-Message-State: AOAM532v2uPZcM4CNbyYhWvUry8XThSsDqIXb0dPNT+PpQ9oQx9jaD4C
	btvTEEJ7v2rIEzPLDtTsVWo=
X-Google-Smtp-Source: ABdhPJzi6ty+2BZtmST14iwEktC76yOvtkhG7WcmPIglQydYqIVjhHlBl+6EWUTf7aqHaCdST5gexA==
X-Received: by 2002:adf:e4c5:: with SMTP id v5mr2724115wrm.320.1601467762868;
        Wed, 30 Sep 2020 05:09:22 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id k12sm2566312wrn.39.2020.09.30.05.09.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 05:09:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Wei Liu'" <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com> <20200930104108.35969-6-roger.pau@citrix.com>
In-Reply-To: <20200930104108.35969-6-roger.pau@citrix.com>
Subject: RE: [PATCH v2 05/11] x86/vioapic: switch to use the EOI callback mechanism
Date: Wed, 30 Sep 2020 13:09:21 +0100
Message-ID: <007501d69722$88272f80$98758e80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFWh0BMRanGT2UHRfj8GGEV+vuDtQI9scK1qm9HqMA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Roger Pau Monne
> Sent: 30 September 2020 11:41
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH v2 05/11] x86/vioapic: switch to use the EOI callback =
mechanism
>=20
> Switch the emulated IO-APIC code to use the local APIC EOI callback
> mechanism. This allows to remove the last hardcoded callback from
> vlapic_handle_EOI. Removing the hardcoded vIO-APIC callback also
> allows to getting rid of setting the EOI exit bitmap based on the
> triggering mode, as now all users that require an EOI action use the
> newly introduced callback mechanism.
>=20
> Move and rename the vioapic_update_EOI now that it can be made static.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Remove the triggering check in the update_eoi_exit_bitmap call.
>  - Register the vlapic callbacks when loading the vIO-APIC state.
>  - Reduce scope of ent.
> ---
>  xen/arch/x86/hvm/vioapic.c | 131 =
++++++++++++++++++++++++-------------
>  xen/arch/x86/hvm/vlapic.c  |   5 +-
>  2 files changed, 86 insertions(+), 50 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index 752fc410db..dce98b1479 100644
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -375,6 +375,50 @@ static const struct hvm_mmio_ops vioapic_mmio_ops =
=3D {
>      .write =3D vioapic_write
>  };
>=20
> +static void eoi_callback(unsigned int vector, void *data)
> +{
> +    struct domain *d =3D current->domain;
> +    struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
> +    unsigned int i;
> +
> +    ASSERT(has_vioapic(d));
> +
> +    spin_lock(&d->arch.hvm.irq_lock);
> +
> +    for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
> +    {
> +        struct hvm_vioapic *vioapic =3D domain_vioapic(d, i);
> +        unsigned int pin;
> +
> +        for ( pin =3D 0; pin < vioapic->nr_pins; pin++ )
> +        {
> +            union vioapic_redir_entry *ent =3D =
&vioapic->redirtbl[pin];
> +
> +            if ( ent->fields.vector !=3D vector )
> +                continue;
> +
> +            ent->fields.remote_irr =3D 0;
> +
> +            if ( is_iommu_enabled(d) )
> +            {
> +                spin_unlock(&d->arch.hvm.irq_lock);
> +                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
> +                spin_lock(&d->arch.hvm.irq_lock);

Is this safe? If so, why lock around the whole loop in the first place?

  Paul

> +            }
> +
> +            if ( (ent->fields.trig_mode =3D=3D VIOAPIC_LEVEL_TRIG) &&
> +                 !ent->fields.mask &&
> +                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
> +            {
> +                ent->fields.remote_irr =3D 1;
> +                vioapic_deliver(vioapic, pin);
> +            }
> +        }
> +    }
> +
> +    spin_unlock(&d->arch.hvm.irq_lock);
> +}
> +
>  static void ioapic_inj_irq(
>      struct hvm_vioapic *vioapic,
>      struct vlapic *target,
> @@ -388,7 +432,8 @@ static void ioapic_inj_irq(
>      ASSERT((delivery_mode =3D=3D dest_Fixed) ||
>             (delivery_mode =3D=3D dest_LowestPrio));
>=20
> -    vlapic_set_irq(target, vector, trig_mode);
> +    vlapic_set_irq_callback(target, vector, trig_mode,
> +                            trig_mode ? eoi_callback : NULL, NULL);
>  }
>=20
>  static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int =
pin)
> @@ -495,50 +540,6 @@ void vioapic_irq_positive_edge(struct domain *d, =
unsigned int irq)
>      }
>  }
>=20
> -void vioapic_update_EOI(unsigned int vector)
> -{
> -    struct domain *d =3D current->domain;
> -    struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
> -    union vioapic_redir_entry *ent;
> -    unsigned int i;
> -
> -    ASSERT(has_vioapic(d));
> -
> -    spin_lock(&d->arch.hvm.irq_lock);
> -
> -    for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
> -    {
> -        struct hvm_vioapic *vioapic =3D domain_vioapic(d, i);
> -        unsigned int pin;
> -
> -        for ( pin =3D 0; pin < vioapic->nr_pins; pin++ )
> -        {
> -            ent =3D &vioapic->redirtbl[pin];
> -            if ( ent->fields.vector !=3D vector )
> -                continue;
> -
> -            ent->fields.remote_irr =3D 0;
> -
> -            if ( is_iommu_enabled(d) )
> -            {
> -                spin_unlock(&d->arch.hvm.irq_lock);
> -                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
> -                spin_lock(&d->arch.hvm.irq_lock);
> -            }
> -
> -            if ( (ent->fields.trig_mode =3D=3D VIOAPIC_LEVEL_TRIG) &&
> -                 !ent->fields.mask &&
> -                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
> -            {
> -                ent->fields.remote_irr =3D 1;
> -                vioapic_deliver(vioapic, pin);
> -            }
> -        }
> -    }
> -
> -    spin_unlock(&d->arch.hvm.irq_lock);
> -}
> -
>  int vioapic_get_mask(const struct domain *d, unsigned int gsi)
>  {
>      unsigned int pin =3D 0; /* See gsi_vioapic */
> @@ -592,6 +593,8 @@ static int ioapic_save(struct vcpu *v, =
hvm_domain_context_t *h)
>  static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
>  {
>      struct hvm_vioapic *s;
> +    unsigned int i;
> +    int rc;
>=20
>      if ( !has_vioapic(d) )
>          return -ENODEV;
> @@ -602,7 +605,43 @@ static int ioapic_load(struct domain *d, =
hvm_domain_context_t *h)
>           d->arch.hvm.nr_vioapics !=3D 1 )
>          return -EOPNOTSUPP;
>=20
> -    return hvm_load_entry(IOAPIC, h, &s->domU);
> +    rc =3D hvm_load_entry(IOAPIC, h, &s->domU);
> +    if ( rc )
> +        return rc;
> +
> +    for ( i =3D 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
> +    {
> +        const union vioapic_redir_entry *ent =3D =
&s->domU.redirtbl[i];
> +        unsigned int vector =3D ent->fields.vector;
> +        unsigned int delivery_mode =3D ent->fields.delivery_mode;
> +        struct vcpu *v;
> +
> +        /*
> +         * Add a callback for each possible vector injected by a =
redirection
> +         * entry.
> +         */
> +        if ( vector < 16 || !ent->fields.remote_irr ||
> +             (delivery_mode !=3D dest_LowestPrio && delivery_mode =
!=3D dest_Fixed) )
> +            continue;
> +
> +        for_each_vcpu ( d, v )
> +        {
> +            struct vlapic *vlapic =3D vcpu_vlapic(v);
> +
> +            /*
> +             * NB: if the vlapic registers where restored before the =
vio-apic
> +             * ones we could test whether the vector is set in the =
vlapic IRR
> +             * or ISR registers before unconditionally setting the =
callback.
> +             * This is harmless as eoi_callback is capable of dealing =
with
> +             * spurious callbacks.
> +             */
> +            if ( vlapic_match_dest(vlapic, NULL, 0, =
ent->fields.dest_id,
> +                                   ent->fields.dest_mode) )
> +                vlapic_set_callback(vlapic, vector, eoi_callback, =
NULL);
> +        }
> +    }
> +
> +    return 0;
>  }
>=20
>  HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_load, 1, =
HVMSR_PER_DOM);
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 8a18b33428..35f12e0909 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -189,7 +189,7 @@ void vlapic_set_irq_callback(struct vlapic =
*vlapic, uint8_t vec, uint8_t trig,
>=20
>      if ( hvm_funcs.update_eoi_exit_bitmap )
>          alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, =
vec,
> -                          trig || callback);
> +                          callback);
>=20
>      if ( hvm_funcs.deliver_posted_intr )
>          alternative_vcall(hvm_funcs.deliver_posted_intr, target, =
vec);
> @@ -493,9 +493,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 =
vector)
>      unsigned long flags;
>      unsigned int index =3D vector - 16;
>=20
> -    if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> -        vioapic_update_EOI(vector);
> -
>      spin_lock_irqsave(&vlapic->callback_lock, flags);
>      callback =3D vlapic->callbacks[index].callback;
>      vlapic->callbacks[index].callback =3D NULL;
> --
> 2.28.0
>=20



