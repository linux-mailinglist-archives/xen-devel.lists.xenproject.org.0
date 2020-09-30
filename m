Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2FC27E805
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 13:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621.2056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNajp-0000im-LL; Wed, 30 Sep 2020 11:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621.2056; Wed, 30 Sep 2020 11:57:37 +0000
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
	id 1kNajp-0000iP-Hi; Wed, 30 Sep 2020 11:57:37 +0000
Received: by outflank-mailman (input) for mailman id 621;
 Wed, 30 Sep 2020 11:57:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNajn-0000iI-E1
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:57:35 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79dceaad-66e4-482b-a31b-da7488a06f78;
 Wed, 30 Sep 2020 11:57:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so1482775wrs.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 04:57:34 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id y68sm2468134wmd.39.2020.09.30.04.57.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 04:57:32 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNajn-0000iI-E1
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:57:35 +0000
X-Inumbo-ID: 79dceaad-66e4-482b-a31b-da7488a06f78
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 79dceaad-66e4-482b-a31b-da7488a06f78;
	Wed, 30 Sep 2020 11:57:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so1482775wrs.5
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=0fwjisWbWBOOCzBUoK5YOa2b6YP6IdlBANlrdizz7jc=;
        b=dceP/pjNjGcvhMSjB2Oz0CoFmy5WzwU8zD71GxBGGNFlTpyqUB4zjh7Eom1RTbt3S0
         4RyWJs0mDWxKczQWfTiEZvImOgrZVj1+9+5b9xXpbcbmrqCgMA2hHfwuvOcA1fHsl76n
         kNSWhwWMY6y0GwlF4yEren3W+v9+9IF8w8eQQr5jnYEI/ESt1UTaz4045SrzDtMJvZ1T
         ko2/+DB/EbJcORuAmJnSOttP8Y26zEAm07CCLV6xd1fbUYuRPZvXdCDzkjyGpY1kutFO
         Au18jPx4BB7pai92Ra25yuCNeu+vrw9Ih7rG0R9Dan9U48yISKdR3TP/EzXn1feIG/7A
         mjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=0fwjisWbWBOOCzBUoK5YOa2b6YP6IdlBANlrdizz7jc=;
        b=eg/W9/mE/bvSng0pHA8rvRXILZg2nNlR5WLXPRxffBsdkpb3bJTT7nmmDNwXHXxUEf
         NlvEfFlnEphIz+8/SfuJrrOXkKYOKpIzsKSsClEeab2a21F5CFT4yGV+5Q/4YKAg5B+n
         MbJDknPOhJN4t5/NM9h2U2FsPmx6spuYCvRlcM6cFneWTFG7AJzUr6J5Jjmdtcl2+vDI
         N6DdGqi/yWLEB0c/5QrCY7kxHbRxFrWugtGrywgURiomnZkW2KCL36M7p1WT+bG8378W
         8VCx7Pz+9vGmnYhBFGRVkzyIXE5chBoYj3MCK7k0u6875unpaaghKpel0WioA6mLbV4Y
         buQw==
X-Gm-Message-State: AOAM530YcBaNpYe9zwivpW6rg+murL5KA679P97k3FdSQcsBRCDu2R9K
	2bbQeSEJdJTYeqk4bvZHKjhuJpePTlFung==
X-Google-Smtp-Source: ABdhPJz3RhbZrR6qPgBQg+BJL6HHtQHTnUSRfZqpO1mC8sTrUFlQOR/9lXkLZNT5XDxulHAdxjqjhA==
X-Received: by 2002:adf:a29a:: with SMTP id s26mr2765674wra.197.1601467053379;
        Wed, 30 Sep 2020 04:57:33 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id y68sm2468134wmd.39.2020.09.30.04.57.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 04:57:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Wei Liu'" <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com> <20200930104108.35969-5-roger.pau@citrix.com>
In-Reply-To: <20200930104108.35969-5-roger.pau@citrix.com>
Subject: RE: [PATCH v2 04/11] x86/vmsi: use the newly introduced EOI callbacks
Date: Wed, 30 Sep 2020 12:57:31 +0100
Message-ID: <006f01d69720$e14a7830$a3df6890$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFWh0BMRanGT2UHRfj8GGEV+vuDtQG1EzSvqnOJLJA=

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 30 September 2020 11:41
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH v2 04/11] x86/vmsi: use the newly introduced EOI =
callbacks
>=20
> Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> and instead use the newly introduced EOI callback mechanism in order
> to register a callback for MSI vectors injected from passed through
> devices.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/vlapic.c    |  2 --
>  xen/arch/x86/hvm/vmsi.c      | 36 =
++++++++++++++++++++++--------------
>  xen/drivers/passthrough/io.c |  2 +-
>  xen/include/asm-x86/hvm/io.h |  2 +-
>  4 files changed, 24 insertions(+), 18 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 38c62a02e6..8a18b33428 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -496,8 +496,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 =
vector)
>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
>          vioapic_update_EOI(vector);
>=20
> -    hvm_dpci_msi_eoi(vector);
> -
>      spin_lock_irqsave(&vlapic->callback_lock, flags);
>      callback =3D vlapic->callbacks[index].callback;
>      vlapic->callbacks[index].callback =3D NULL;
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 7ca19353ab..e192c4c6da 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -44,11 +44,9 @@
>  #include <asm/event.h>
>  #include <asm/io_apic.h>
>=20
> -static void vmsi_inj_irq(
> -    struct vlapic *target,
> -    uint8_t vector,
> -    uint8_t trig_mode,
> -    uint8_t delivery_mode)
> +static void vmsi_inj_irq(struct vlapic *target, uint8_t vector,
> +                         uint8_t trig_mode, uint8_t delivery_mode,
> +                         vlapic_eoi_callback_t *callback, void *data)
>  {
>      HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "vmsi_inj_irq: vec %02x trig %d dm =
%d\n",
>                  vector, trig_mode, delivery_mode);
> @@ -57,17 +55,17 @@ static void vmsi_inj_irq(
>      {
>      case dest_Fixed:
>      case dest_LowestPrio:
> -        vlapic_set_irq(target, vector, trig_mode);
> +        vlapic_set_irq_callback(target, vector, trig_mode, callback, =
data);
>          break;
>      default:
>          BUG();
>      }
>  }
>=20
> -int vmsi_deliver(
> -    struct domain *d, int vector,
> -    uint8_t dest, uint8_t dest_mode,
> -    uint8_t delivery_mode, uint8_t trig_mode)
> +static int vmsi_deliver_callback(struct domain *d, int vector, =
uint8_t dest,
> +                                 uint8_t dest_mode, uint8_t =
delivery_mode,
> +                                 uint8_t trig_mode,
> +                                 vlapic_eoi_callback_t *callback, =
void *data)
>  {
>      struct vlapic *target;
>      struct vcpu *v;
> @@ -78,7 +76,8 @@ int vmsi_deliver(
>          target =3D vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
>          if ( target !=3D NULL )
>          {
> -            vmsi_inj_irq(target, vector, trig_mode, delivery_mode);
> +            vmsi_inj_irq(target, vector, trig_mode, delivery_mode, =
callback,
> +                         data);
>              break;
>          }
>          HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "null MSI round robin: =
vector=3D%02x\n",
> @@ -89,8 +88,8 @@ int vmsi_deliver(
>          for_each_vcpu ( d, v )
>              if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
>                                     0, dest, dest_mode) )
> -                vmsi_inj_irq(vcpu_vlapic(v), vector,
> -                             trig_mode, delivery_mode);
> +                vmsi_inj_irq(vcpu_vlapic(v), vector, trig_mode, =
delivery_mode,
> +                             callback, data);
>          break;
>=20
>      default:
> @@ -103,6 +102,14 @@ int vmsi_deliver(
>      return 0;
>  }
>=20
> +

Stray blank line

> +int vmsi_deliver(struct domain *d, int vector, uint8_t dest, uint8_t =
dest_mode,
> +                 uint8_t delivery_mode, uint8_t trig_mode)
> +{
> +    return vmsi_deliver_callback(d, vector, dest, dest_mode, =
delivery_mode,
> +                                 trig_mode, NULL, NULL);
> +}
> +
>  void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci =
*pirq_dpci)
>  {
>      uint32_t flags =3D pirq_dpci->gmsi.gflags;
> @@ -119,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const =
struct hvm_pirq_dpci *pirq_dpci)
>=20
>      ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
>=20
> -    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, =
trig_mode);
> +    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, =
trig_mode,
> +                          hvm_dpci_msi_eoi, NULL);

I think there are more efficiencies possible here. E.g. if =
is_hardware_domain(d) is true then hvm_dpci_msi_eoi() will do nothing, =
so no point in setting up the callback in that case.

  Paul

>  }
>=20
>  /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id =
*/
> diff --git a/xen/drivers/passthrough/io.c =
b/xen/drivers/passthrough/io.c
> index 536e91ad76..bff0f6628a 100644
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -874,7 +874,7 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
>      return 0;
>  }
>=20
> -void hvm_dpci_msi_eoi(unsigned int vector)
> +void hvm_dpci_msi_eoi(unsigned int vector, void *data)
>  {
>      struct domain *d =3D current->domain;
>=20
> diff --git a/xen/include/asm-x86/hvm/io.h =
b/xen/include/asm-x86/hvm/io.h
> index b05f619435..759ee486af 100644
> --- a/xen/include/asm-x86/hvm/io.h
> +++ b/xen/include/asm-x86/hvm/io.h
> @@ -158,7 +158,7 @@ struct hvm_hw_stdvga {
>  void stdvga_init(struct domain *d);
>  void stdvga_deinit(struct domain *d);
>=20
> -extern void hvm_dpci_msi_eoi(unsigned int vector);
> +void hvm_dpci_msi_eoi(unsigned int vector, void *data);
>=20
>  /* Decode a PCI port IO access into a bus/slot/func/reg. */
>  unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
> --
> 2.28.0



