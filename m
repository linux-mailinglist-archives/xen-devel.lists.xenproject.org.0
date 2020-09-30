Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779627E7A8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 13:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597.1981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNaJi-0006fF-Re; Wed, 30 Sep 2020 11:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597.1981; Wed, 30 Sep 2020 11:30:38 +0000
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
	id 1kNaJi-0006eq-OZ; Wed, 30 Sep 2020 11:30:38 +0000
Received: by outflank-mailman (input) for mailman id 597;
 Wed, 30 Sep 2020 11:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNaJh-0006ek-HZ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:30:37 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1816c07-16ad-4302-ad42-cb1d09fe1d4b;
 Wed, 30 Sep 2020 11:30:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so1375570wrm.9
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 04:30:36 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id n4sm2427068wrp.61.2020.09.30.04.30.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 04:30:35 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNaJh-0006ek-HZ
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:30:37 +0000
X-Inumbo-ID: d1816c07-16ad-4302-ad42-cb1d09fe1d4b
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d1816c07-16ad-4302-ad42-cb1d09fe1d4b;
	Wed, 30 Sep 2020 11:30:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so1375570wrm.9
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=ro4vjKOU9fsssym2SD/q/Z9nSAru7gjE6akaHzTD8qE=;
        b=uFuFUlk1vVB9QM+SJ+0UJE1P9sF6O1yUAB8vcXXhj/ag8pZESP4hJgSSRrIJ1b9mUE
         Wf0k8b3ZZD9mKDYp45yr3xr4FyyAmmHiR9x8+zb3Q9xVq9kYDLlriN53bJSBe0DkU+XB
         keZK44A+6v9WCaxKlweMjiOlkINJGFJZt22HE08v24FqObpJzQj77om86RQmXLPH4Lx1
         mW7YS7kyxe2YumLSCbE+eyyplMWYQk/xfZLWaZF+Dr1yK9V1c0zn0gngLs1SYfC6MixP
         07xwSEDKw+8cIIh6fQNEiDY+nlvpVxuAHjE7rXti9jaInwA52gg/rnJMcIA7Csu2YEt3
         leLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=ro4vjKOU9fsssym2SD/q/Z9nSAru7gjE6akaHzTD8qE=;
        b=KK0OtB6voqbpST6toMj6yY3lg2x8a7sKfkopx+IDbVviOhSHfBWw2sCiit28Jws87A
         FPZftYsdh+100kXbReo3Z75rWkRfn7Sy/2FJhR462Ru8a1SEkerKKhs7us8nKlRldqYG
         JPrystz4PTBz13Q972nudA1FZ6plCoLN+jh1Tr+hKpdrGRspUVosIz9A1aKMObSK2mdw
         it2Bw0q39TJB73UEJG/yCDEyM49LkZc4GNsjNi3WYZJ2+Fh7xnFr78h9ZQ6sV05dHbyD
         3PxOnQQrLZrJseYveoo0Va+xVQkqFSq4remjGChuAAv2uTB+7OOtQBT/OFxeDv9sT99f
         uc+g==
X-Gm-Message-State: AOAM5316aY97u1/1z3M38DpD+oUSu2AwXoz16ZI78eEEf+xvcjkWDp6x
	5uw3z6MZ1TRj4A/Zc63l2CU=
X-Google-Smtp-Source: ABdhPJythHAKMnrIDp1ggFdL5caFWBXqUUSqnzTolx71Dbn8/30LuYvbKsIYmGKyZQvGBNl6fCtboQ==
X-Received: by 2002:a5d:688b:: with SMTP id h11mr2585353wru.319.1601465435773;
        Wed, 30 Sep 2020 04:30:35 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id n4sm2427068wrp.61.2020.09.30.04.30.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 04:30:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>
References: <20200930104108.35969-1-roger.pau@citrix.com> <20200930104108.35969-2-roger.pau@citrix.com>
In-Reply-To: <20200930104108.35969-2-roger.pau@citrix.com>
Subject: RE: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI callbacks
Date: Wed, 30 Sep 2020 12:30:34 +0100
Message-ID: <006b01d6971d$1d1576c0$57406440$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFWh0BMRanGT2UHRfj8GGEV+vuDtQG8DEKzqnNLJtA=

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 30 September 2020 11:41
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>; Paul Durrant
> <pdurrant@amazon.com>
> Subject: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI =
callbacks
>=20
> EOIs are always executed in guest vCPU context, so there's no reason =
to
> pass a vCPU parameter around as can be fetched from current.
>=20
> While there make the vector parameter of both callbacks unsigned int.
>=20
> No functional change intended.
>=20
> Suggested-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> Changes since v1:
>  - New in this version.
> ---
>  xen/arch/x86/hvm/vioapic.c        | 5 +++--
>  xen/arch/x86/hvm/vlapic.c         | 7 ++-----
>  xen/drivers/passthrough/io.c      | 4 +++-
>  xen/include/asm-x86/hvm/io.h      | 2 +-
>  xen/include/asm-x86/hvm/vioapic.h | 2 +-
>  5 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index 67d4a6237f..0fb9147d99 100644
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -353,7 +353,7 @@ static int vioapic_write(
>=20
>  #if VIOAPIC_VERSION_ID >=3D 0x20
>      case VIOAPIC_REG_EOI:
> -        vioapic_update_EOI(v->domain, val);
> +        vioapic_update_EOI(val);
>          break;
>  #endif
>=20
> @@ -495,8 +495,9 @@ void vioapic_irq_positive_edge(struct domain *d, =
unsigned int irq)
>      }
>  }
>=20
> -void vioapic_update_EOI(struct domain *d, u8 vector)
> +void vioapic_update_EOI(unsigned int vector)
>  {
> +    struct domain *d =3D current->domain;
>      struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
>      union vioapic_redir_entry *ent;
>      unsigned int i;
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 4e3861eb7d..ae737403f3 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
>=20
>  void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
>  {
> -    struct vcpu *v =3D vlapic_vcpu(vlapic);
> -    struct domain *d =3D v->domain;
> -
>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> -        vioapic_update_EOI(d, vector);
> +        vioapic_update_EOI(vector);
>=20
> -    hvm_dpci_msi_eoi(d, vector);
> +    hvm_dpci_msi_eoi(vector);
>  }
>=20
>  static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int =
short_hand,
> diff --git a/xen/drivers/passthrough/io.c =
b/xen/drivers/passthrough/io.c
> index 6b1305a3e5..54f3e7b540 100644
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -874,8 +874,10 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
>      return 0;
>  }
>=20
> -void hvm_dpci_msi_eoi(struct domain *d, int vector)
> +void hvm_dpci_msi_eoi(unsigned int vector)
>  {
> +    struct domain *d =3D current->domain;
> +
>      if ( !is_iommu_enabled(d) ||
>           (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
>         return;
> diff --git a/xen/include/asm-x86/hvm/io.h =
b/xen/include/asm-x86/hvm/io.h
> index 558426b772..adec0f566a 100644
> --- a/xen/include/asm-x86/hvm/io.h
> +++ b/xen/include/asm-x86/hvm/io.h
> @@ -159,7 +159,7 @@ struct hvm_hw_stdvga {
>  void stdvga_init(struct domain *d);
>  void stdvga_deinit(struct domain *d);
>=20
> -extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
> +extern void hvm_dpci_msi_eoi(unsigned int vector);
>=20
>  /* Decode a PCI port IO access into a bus/slot/func/reg. */
>  unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
> diff --git a/xen/include/asm-x86/hvm/vioapic.h =
b/xen/include/asm-x86/hvm/vioapic.h
> index d6f4e12d54..fd602f8830 100644
> --- a/xen/include/asm-x86/hvm/vioapic.h
> +++ b/xen/include/asm-x86/hvm/vioapic.h
> @@ -64,7 +64,7 @@ int vioapic_init(struct domain *d);
>  void vioapic_deinit(struct domain *d);
>  void vioapic_reset(struct domain *d);
>  void vioapic_irq_positive_edge(struct domain *d, unsigned int irq);
> -void vioapic_update_EOI(struct domain *d, u8 vector);
> +void vioapic_update_EOI(unsigned int vector);
>=20
>  int vioapic_get_mask(const struct domain *d, unsigned int gsi);
>  int vioapic_get_vector(const struct domain *d, unsigned int gsi);
> --
> 2.28.0



