Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA827E7DD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 13:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618.2045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNabr-0008EX-PN; Wed, 30 Sep 2020 11:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618.2045; Wed, 30 Sep 2020 11:49:23 +0000
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
	id 1kNabr-0008E6-MM; Wed, 30 Sep 2020 11:49:23 +0000
Received: by outflank-mailman (input) for mailman id 618;
 Wed, 30 Sep 2020 11:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNabq-0008E1-Bj
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:49:22 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c7008dd-ec32-4232-8a93-b4322ac1aa7e;
 Wed, 30 Sep 2020 11:49:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k10so1441845wru.6
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 04:49:21 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id 91sm2697841wrq.9.2020.09.30.04.49.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 04:49:19 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNabq-0008E1-Bj
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:49:22 +0000
X-Inumbo-ID: 4c7008dd-ec32-4232-8a93-b4322ac1aa7e
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4c7008dd-ec32-4232-8a93-b4322ac1aa7e;
	Wed, 30 Sep 2020 11:49:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k10so1441845wru.6
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 04:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=tcZ+W/Re7EGksLiyreVz/+Yu+hgCdIO6TP/kiVZfZKw=;
        b=ME4m4wQNIaDP/saaHJ6AOO8e8kcTVRvRDAo0WaEZpq8JQyySUVw/08PbHNreeKkupU
         vMY+p/2GqRuB/dGWv7dK+8e95OPck4VI5RhQz4xLhjWaQTZAgUCMDbZuzGuHq97og0l8
         BR5/tzwTZIE2+hkl9M2KsdSeu5s6OEbRNWfOGP84XtwdnbDeD1V7PiRKXbqeYUfhhuBp
         WEAjKM5Wt+Yr9nlod1gwEy4wJZtI6rv8V6zULyfqGkVJMdGr5Hn7XvG2XZdMS2IbymV3
         SGmac8OYtyDsIhhRwr2fAQNqxVraHDycHWBXTYROort5mbeB1nmCpUrgcYE+J515lu75
         hdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=tcZ+W/Re7EGksLiyreVz/+Yu+hgCdIO6TP/kiVZfZKw=;
        b=Oc/62xe8eGYCd+NbEHEoc1TwRJ2gZC6+4forLmV9cIKdteRQkhSPr5cs8OIMf5OuNS
         XYxmSkSIo32cfOFP/F2pmelBfTZGFv/xwB2ZBQesdk5e6ng8hjg08Ky9b4JtNN+xLbuE
         7y6mQtAc+RAJlv79auN3UOvjhWAecDWKm16GrAlFcAWOLzdLF2mURmL9yIBNnU2ehNeC
         uYt8fjU4icxZeV+hL97v4PHVK54FnwR1e2f3bZ4hL7k2QZRCin2QYcSaKtPY1t8ytW8D
         7YBOdiKydPHCwSL40WiKaIKxspJuuDUGyb1xMq/bNG2XXHTe5Ik1TCtydLESmrTC1T/k
         S+VA==
X-Gm-Message-State: AOAM533FAH81GXt4XT0ivk4uaK14+UPofkNvkrhkAttR8Gf5NTTeFmfV
	ugRk/dtmZrFWEVxplmx+iHIuKRRrxQXMPA==
X-Google-Smtp-Source: ABdhPJyJoCwmsbpsOxBIfuJLY3Djf/UTanq992SLmsKiNlWsMQre/+v6bQGcHShYRQaZMT8+EpEvOA==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr2624593wrn.45.1601466560312;
        Wed, 30 Sep 2020 04:49:20 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id 91sm2697841wrq.9.2020.09.30.04.49.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 04:49:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Wei Liu'" <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com> <20200930104108.35969-4-roger.pau@citrix.com>
In-Reply-To: <20200930104108.35969-4-roger.pau@citrix.com>
Subject: RE: [PATCH v2 03/11] x86/vlapic: introduce an EOI callback mechanism
Date: Wed, 30 Sep 2020 12:49:18 +0100
Message-ID: <006e01d6971f$bb4e0080$31ea0180$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFWh0BMRanGT2UHRfj8GGEV+vuDtQEHNNVLqnjzTdA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Roger Pau Monne
> Sent: 30 September 2020 11:41
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH v2 03/11] x86/vlapic: introduce an EOI callback =
mechanism
>=20
> Add a new vlapic_set_irq_callback helper in order to inject a vector
> and set a callback to be executed when the guest performs the end of
> interrupt acknowledgment.
>=20
> Such functionality will be used to migrate the current ad hoc handling
> done in vlapic_handle_EOI for the vectors that require some logic to
> be executed when the end of interrupt is performed.
>=20
> No current users are migrated to use this new functionality yet, so
> not functional change expected as a result.

s/not/no

>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Make vlapic_set_irq an inline function on the header.
>  - Clear the callback hook in vlapic_handle_EOI.
>  - Introduce a helper to set the callback without injecting a vector.
>  - Remove unneeded parentheses.
>  - Reduce callback table by 16.
>  - Use %pv to print domain/vcpu ID.
> ---
> RFC: should callbacks also be executed in vlapic_do_init (which is
> called by vlapic_reset). We would need to make sure ISR and IRR
> are cleared using some kind of test and clear atomic functionality to
> make this race free.
> ---
>  xen/arch/x86/hvm/vlapic.c        | 62 =
++++++++++++++++++++++++++++++--
>  xen/include/asm-x86/hvm/vlapic.h | 18 +++++++++-
>  2 files changed, 77 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index ae737403f3..38c62a02e6 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -144,7 +144,32 @@ bool vlapic_test_irq(const struct vlapic *vlapic, =
uint8_t vec)
>      return vlapic_test_vector(vec, &vlapic->regs->data[APIC_IRR]);
>  }
>=20
> -void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
> +void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
> +                         vlapic_eoi_callback_t *callback, void *data)
> +{
> +    unsigned long flags;
> +    unsigned int index =3D vec - 16;
> +
> +    if ( !callback || vec < 16 || vec >=3D X86_NR_VECTORS )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return;
> +    }
> +
> +    spin_lock_irqsave(&vlapic->callback_lock, flags);
> +    if ( vlapic->callbacks[index].callback &&
> +         vlapic->callbacks[index].callback !=3D callback )
> +        printk(XENLOG_G_WARNING
> +               "%pv overriding vector %#x callback %ps (%p) with %ps =
(%p)\n",
> +               vlapic_vcpu(vlapic), vec, =
vlapic->callbacks[index].callback,
> +               vlapic->callbacks[index].callback, callback, =
callback);
> +    vlapic->callbacks[index].callback =3D callback;
> +    vlapic->callbacks[index].data =3D data;
> +    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
> +}
> +
> +void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, =
uint8_t trig,
> +                             vlapic_eoi_callback_t *callback, void =
*data)
>  {
>      struct vcpu *target =3D vlapic_vcpu(vlapic);
>=20
> @@ -159,8 +184,12 @@ void vlapic_set_irq(struct vlapic *vlapic, =
uint8_t vec, uint8_t trig)
>      else
>          vlapic_clear_vector(vec, &vlapic->regs->data[APIC_TMR]);
>=20
> +    if ( callback )
> +        vlapic_set_callback(vlapic, vec, callback, data);
> +

Can this not happen several times before an EOI? I.e. the vector could =
already be set in IRR, right?

  Paul

>      if ( hvm_funcs.update_eoi_exit_bitmap )
> -        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, =
vec, trig);
> +        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, =
vec,
> +                          trig || callback);
>=20
>      if ( hvm_funcs.deliver_posted_intr )
>          alternative_vcall(hvm_funcs.deliver_posted_intr, target, =
vec);
> @@ -459,10 +488,24 @@ void vlapic_EOI_set(struct vlapic *vlapic)
>=20
>  void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
>  {
> +    vlapic_eoi_callback_t *callback;
> +    void *data;
> +    unsigned long flags;
> +    unsigned int index =3D vector - 16;
> +
>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
>          vioapic_update_EOI(vector);
>=20
>      hvm_dpci_msi_eoi(vector);
> +
> +    spin_lock_irqsave(&vlapic->callback_lock, flags);
> +    callback =3D vlapic->callbacks[index].callback;
> +    vlapic->callbacks[index].callback =3D NULL;
> +    data =3D vlapic->callbacks[index].data;
> +    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
> +
> +    if ( callback )
> +        callback(vector, data);
>  }
>=20
>  static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int =
short_hand,
> @@ -1629,9 +1672,23 @@ int vlapic_init(struct vcpu *v)
>      }
>      clear_page(vlapic->regs);
>=20
> +    if ( !vlapic->callbacks )
> +    {
> +        vlapic->callbacks =3D =
xmalloc_array(typeof(*vlapic->callbacks),
> +                                          X86_NR_VECTORS - 16);
> +        if ( !vlapic->callbacks )
> +        {
> +            dprintk(XENLOG_ERR, "%pv: alloc vlapic callbacks =
error\n", v);
> +            return -ENOMEM;
> +        }
> +    }
> +    memset(vlapic->callbacks, 0, sizeof(*vlapic->callbacks) *
> +                                 (X86_NR_VECTORS - 16));
> +
>      vlapic_reset(vlapic);
>=20
>      spin_lock_init(&vlapic->esr_lock);
> +    spin_lock_init(&vlapic->callback_lock);
>=20
>      tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, =
v);
>=20
> @@ -1653,6 +1710,7 @@ void vlapic_destroy(struct vcpu *v)
>      destroy_periodic_time(&vlapic->pt);
>      unmap_domain_page_global(vlapic->regs);
>      free_domheap_page(vlapic->regs_page);
> +    XFREE(vlapic->callbacks);
>  }
>=20
>  /*
> diff --git a/xen/include/asm-x86/hvm/vlapic.h =
b/xen/include/asm-x86/hvm/vlapic.h
> index 8f908928c3..c380127a71 100644
> --- a/xen/include/asm-x86/hvm/vlapic.h
> +++ b/xen/include/asm-x86/hvm/vlapic.h
> @@ -73,6 +73,8 @@
>  #define vlapic_clear_vector(vec, bitmap)                              =
  \
>      clear_bit(VEC_POS(vec), (uint32_t *)((bitmap) + REG_POS(vec)))
>=20
> +typedef void vlapic_eoi_callback_t(unsigned int vector, void *data);
> +
>  struct vlapic {
>      struct hvm_hw_lapic      hw;
>      struct hvm_hw_lapic_regs *regs;
> @@ -89,6 +91,11 @@ struct vlapic {
>          uint32_t             icr, dest;
>          struct tasklet       tasklet;
>      } init_sipi;
> +    struct {
> +        vlapic_eoi_callback_t *callback;
> +        void                 *data;
> +    } *callbacks;
> +    spinlock_t               callback_lock;
>  };
>=20
>  /* vlapic's frequence is 100 MHz */
> @@ -111,7 +118,16 @@ void vlapic_reg_write(struct vcpu *v, unsigned =
int reg, uint32_t val);
>  bool_t is_vlapic_lvtpc_enabled(struct vlapic *vlapic);
>=20
>  bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec);
> -void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t =
trig);
> +void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
> +                         vlapic_eoi_callback_t *callback, void =
*data);
> +void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, =
uint8_t trig,
> +                             vlapic_eoi_callback_t *callback, void =
*data);
> +
> +static inline void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec,
> +                                  uint8_t trig)
> +{
> +    vlapic_set_irq_callback(vlapic, vec, trig, NULL, NULL);
> +}
>=20
>  int vlapic_has_pending_irq(struct vcpu *v);
>  int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool_t =
force_ack);
> --
> 2.28.0
>=20



