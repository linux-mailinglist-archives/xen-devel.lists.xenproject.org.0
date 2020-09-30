Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8637327E7B4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 13:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601.1995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNaMn-0006ot-Bo; Wed, 30 Sep 2020 11:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601.1995; Wed, 30 Sep 2020 11:33:49 +0000
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
	id 1kNaMn-0006oU-8U; Wed, 30 Sep 2020 11:33:49 +0000
Received: by outflank-mailman (input) for mailman id 601;
 Wed, 30 Sep 2020 11:33:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNaMl-0006oO-M8
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:33:47 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 278d722f-dcec-46b0-bc50-3c774d752711;
 Wed, 30 Sep 2020 11:33:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y15so1374596wmi.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 04:33:46 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id c4sm2422451wrp.85.2020.09.30.04.33.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 04:33:45 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNaMl-0006oO-M8
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:33:47 +0000
X-Inumbo-ID: 278d722f-dcec-46b0-bc50-3c774d752711
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 278d722f-dcec-46b0-bc50-3c774d752711;
	Wed, 30 Sep 2020 11:33:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y15so1374596wmi.0
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 04:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=80EKiHJe/ggR0PaSiz7NX+Po9LgpMS2zEyrNvKxcwkQ=;
        b=ieYtceLCznAWQDY+cZOUP2W1JaZKvqOWyy3OJqfU9Ai96qmHz30Y+Z6XeJiexkSXjX
         aqPMsHTNN1pZDwkeL1HRchtxQ2rRIWNVYHTxL9EbfTqBN9JSEJT0QEeetrDzSf+nkzC/
         hgjeO+73Y2vfRLsuryZ14QOi8I5bUK/ULbXfE4o0plwzW94GCxwLDgNZHJdp2CfXxUv4
         2T4nrHSQxxJT5TlN+RuEUem+sovRBqbBKLhYzWdBOty6fQTGTmhPBhk4r97UZmci1/XG
         hgOWkwluSB0Xi/dY+IDgHifKDwPIyO+HpusCN1pypqf3ijOMKtkGjHdiFPD+ILN/6i3z
         nM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=80EKiHJe/ggR0PaSiz7NX+Po9LgpMS2zEyrNvKxcwkQ=;
        b=QT9ViwvrTxLV4yen8oEksCdJs8BOR2yuHgAlnnCBz8Wm2Zb6BlHi43PVts7oURy3jQ
         7PPZ4l5AEXzMH/sFVbMsFtpqIGhC51hRW0QqGHZcLFQ1qMpMRXdA2PpvN5sOeG+8I882
         P33U23Vnea4Gpnpz2XWmzT8NQi3rVSjr+26DRudANqhrq83UgpTB1FI3NrybQmEiV5Kq
         /N6tpcZOhlqSTm5xjrexW7Jjc5tBSLg/vEeS5WePCjheUqA7w7QMfrD8rxc4meyXUDFj
         3A80ZKES96v4XUYWkX0Zm6q+/thRys2IOaK39Gl8PgXyCAlVaQ98Sx8TyG8gWFijlm/M
         mvVQ==
X-Gm-Message-State: AOAM5304FAogyg/Bv9XVfT2vLTqrF/VYkKOdGrCxjZ3M37h8a1SYhydH
	hBmNmjZRiR5rr5jrrdDOcHo=
X-Google-Smtp-Source: ABdhPJwai1BCMivbhv6tR3+0EBZz/cz3CAC1TeX9r2bzFvz+SjspLSDt9JQa/dcH4J1xq67joR/FhA==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr2492074wmc.81.1601465625915;
        Wed, 30 Sep 2020 04:33:45 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id c4sm2422451wrp.85.2020.09.30.04.33.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 04:33:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Wei Liu'" <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com> <20200930104108.35969-3-roger.pau@citrix.com>
In-Reply-To: <20200930104108.35969-3-roger.pau@citrix.com>
Subject: RE: [PATCH v2 02/11] x86/hvm: drop domain parameter from vioapic/vpic EOI callbacks
Date: Wed, 30 Sep 2020 12:33:44 +0100
Message-ID: <006c01d6971d$8e681580$ab384080$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFWh0BMRanGT2UHRfj8GGEV+vuDtQEIihEiqnjn6eA=

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 30 September 2020 11:41
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH v2 02/11] x86/hvm: drop domain parameter from =
vioapic/vpic EOI callbacks
>=20
> EOIs are always executed in guest vCPU context, so there's no reason =
to
> pass a domain parameter around as can be fetched from current->domain.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New in this version.

You could even squash this with the previous patch I think...

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  xen/arch/x86/hvm/vioapic.c   | 2 +-
>  xen/arch/x86/hvm/vpic.c      | 3 +--
>  xen/drivers/passthrough/io.c | 4 ++--
>  xen/include/asm-x86/hvm/io.h | 3 +--
>  4 files changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index 0fb9147d99..752fc410db 100644
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -522,7 +522,7 @@ void vioapic_update_EOI(unsigned int vector)
>              if ( is_iommu_enabled(d) )
>              {
>                  spin_unlock(&d->arch.hvm.irq_lock);
> -                hvm_dpci_eoi(d, vioapic->base_gsi + pin, ent);
> +                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
>                  spin_lock(&d->arch.hvm.irq_lock);
>              }
>=20
> diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
> index 3cf12581e9..26f74f4471 100644
> --- a/xen/arch/x86/hvm/vpic.c
> +++ b/xen/arch/x86/hvm/vpic.c
> @@ -262,8 +262,7 @@ static void vpic_ioport_write(
>                  /* Release lock and EOI the physical interrupt (if =
any). */
>                  vpic_update_int_output(vpic);
>                  vpic_unlock(vpic);
> -                hvm_dpci_eoi(current->domain,
> -                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | =
8) : pin),
> +                hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | =
8) : pin),
>                               NULL);
>                  return; /* bail immediately */
>              case 6: /* Set Priority                */
> diff --git a/xen/drivers/passthrough/io.c =
b/xen/drivers/passthrough/io.c
> index 54f3e7b540..536e91ad76 100644
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -1003,9 +1003,9 @@ static void hvm_gsi_eoi(struct domain *d, =
unsigned int gsi,
>      hvm_pirq_eoi(pirq, ent);
>  }
>=20
> -void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
> -                  const union vioapic_redir_entry *ent)
> +void hvm_dpci_eoi(unsigned int guest_gsi, const union =
vioapic_redir_entry *ent)
>  {
> +    struct domain *d =3D current->domain;
>      const struct hvm_irq_dpci *hvm_irq_dpci;
>      const struct hvm_girq_dpci_mapping *girq;
>=20
> diff --git a/xen/include/asm-x86/hvm/io.h =
b/xen/include/asm-x86/hvm/io.h
> index adec0f566a..b05f619435 100644
> --- a/xen/include/asm-x86/hvm/io.h
> +++ b/xen/include/asm-x86/hvm/io.h
> @@ -118,8 +118,7 @@ bool handle_mmio_with_translation(unsigned long =
gla, unsigned long gpfn,
>                                    struct npfec);
>  bool handle_pio(uint16_t port, unsigned int size, int dir);
>  void hvm_interrupt_post(struct vcpu *v, int vector, int type);
> -void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq,
> -                  const union vioapic_redir_entry *ent);
> +void hvm_dpci_eoi(unsigned int guest_irq, const union =
vioapic_redir_entry *ent);
>  void msix_write_completion(struct vcpu *);
>=20
>  #ifdef CONFIG_HVM
> --
> 2.28.0



