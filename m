Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKv2IihV9GnDAgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 09:24:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFEF4AAF7F
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 09:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298553.1573753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIiDS-0000zW-9w; Fri, 01 May 2026 07:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298553.1573753; Fri, 01 May 2026 07:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIiDS-0000wt-6m; Fri, 01 May 2026 07:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1298553;
 Fri, 01 May 2026 07:23:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wIiDR-0000wm-7I
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 07:23:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIiDQ-001EoX-4Z
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 09:23:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f454da-bab6-0a2a0a5309dd-0a2a450cd658-30
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 09:23:12 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f454df-62f1-0a2a450c0019-d155a72ae430-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 09:23:12 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5a40502e63bso1685451e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 00:23:11 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777620191; cv=none;
        d=google.com; s=arc-20240605;
        b=JZhdxVuZDXPvN03djPwCx0Kr4LtBR5GNa9YfWsUr1he8JQBHqCI+yZtiiES4BACUpd
         HCPDhhsiZzGfAA0vnMWfgsl9OTl6WctJh8WJR7TY5xaWXWfwDHX+u1nWE9CADxeWtzZy
         rFlZHl6cuJQ8fCUBX2QGtG7SUL8PqQu56OE3NHfhsWdOzTV4rI18RY71qQuQY3JUzf8x
         zLtdxBTHuqncvrzDM9wAdTkbvmdVAmFmbWbTLn7qTBXmd69TSQIthRCe3N9AdKwK8hjG
         +ry4fkIobcrym3HEo3mdGqGNl6M27KOqL2I/x+Z+BL6Q0Bv+emS0tmFcjuYm6cE1sHA+
         eGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fy55Gi26L4UtTkEp2TW9ApDaRUteQFmsL32LkYDwn7w=;
        fh=zL8KVAj6rSaYbk/102rEWeOa69wm5cw+i9nXMzeM8z8=;
        b=ax5TMk4fazuu2Tdvi1/krAqYqGH3LAwB0VxobH4Q7i1R0vA2Brfo36tjtX3F9fKOJ+
         ZW9Ze7Pa7A8ph4JJfHEzMLujqiTef2c5iPrboBen0W56UEfFM2ijRplg8OGKtEL9wsNc
         fQlj6RywLV9XzEbDS6p/81UZzDjJQNfDyk5z9Y7df4RH0P8XgTYvqeuvWpZEFKO1PalV
         ENX5Ojvrwy2wRkrhsx39ilFnZ+YhxYHpJoOn6ek4MtFvMd7k04wURDagi4SR/7c9BhJ6
         z3+iIh66ue6wg3rILvZ9pOC9/Elwu0X/KtiBalOu07SX0HYiZTK1MfIPzCyHbklWi9qP
         ktjA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777620191; x=1778224991; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fy55Gi26L4UtTkEp2TW9ApDaRUteQFmsL32LkYDwn7w=;
        b=VLtd5sN1wJyDlfEsAUv4M0fd1vYZRXnPtVpVDyzpD1qrhrvZm3lY8gh/LcmM2OIJoI
         8+e+bjJDfcBpYQWQWpxCC9sSiEzfKNG1eqCuQw//518Uh4qdXUVmg9QJVpjAHDgBxBES
         mGk6UU8YqPA5FatYxDP7/0sI4kJIqtoewE+4p6Iozu1lA1nfApClmHRdHqO68/Wk6V+J
         GtITuLdC6DfZ2k4EnHUZFl2oZv8/SmZpVyizfLz6OsCPEzjVCnxlyw9z5QL7mqsOiYMY
         58Qtw9E7DGrW7Sl5+coE6flzQcnqjT6zN1DtTewlrzTrcf+dppbuAUX1QFVmdI8odoyk
         LXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777620191; x=1778224991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fy55Gi26L4UtTkEp2TW9ApDaRUteQFmsL32LkYDwn7w=;
        b=HfnLWQx6N+2cIrF10iNJPXTz0fOTLNoquzTQ2BGtpiRYmqhsac8nz8xSntHNR5XEwk
         hfGqx26rDes0vSr1FyYUeFj+3jqtubrVdo/mIUwrk5noa4WhRMAZyEwbV4pNztsjqhZE
         rgGauBJRkgViTMcsRy6PqVOdZCvLhjUNGoLHdjBV5mkKzoQm0kTLN8NkbhxHoxTxItnN
         oDSCrWYY0yKLm5pPaYnGZZfkWrmOgTn6MD18NRoFatWPnmOAmSzTP1feaO/6Dsm4Atpj
         pzA/wZuIG1PUJ9hYHGlWUiMb2DKlgWtyj2NjbX7Yklltnef6YB2RR8HtW5X6SMfKfJPV
         87pA==
X-Gm-Message-State: AOJu0YyGMEzws/n1A80++Kl86Ph5dN2KM/8s/2lNqg0eLJAu0fDyyKJl
	Hbmum3sTmcSGfPqDBlNGHoXVRzjA+2GVtFYWSczTcFB7j0s9x6kzMrx4Gnrrn2dNtgsssKPE4PQ
	jJLj5+noT2xySEU429kds0fiaWyBVeZA=
X-Gm-Gg: AeBDies+UqAknvitNNF3+G+48Vb093yOqwR6ey4cqTZz8Lul7Umf9k9+bCCUnFOC6aq
	Rkwhk8jpdgsIV2cx3H+OyzCpc/WczTfFjH8KBxbRCVxe+NNudOP7WBIB4nf8ffHX/ei43ehyJ3D
	tO68Cfl1s8MGVL6r54Onfi6bC53517qnFz51tfzY73218g4e5CoX9jEFpxOQmmV3X8bViKRgKlX
	YRAoJbHuH3urL7ma5/cXoi2BGnKLFpsNcr0QO2gfXHfPH8pllb53OwKiX6KwLoNL1a5QQs8qnJZ
	oa+f2x/R5sCXSbZv
X-Received: by 2002:a05:6512:3e0b:b0:5a7:47d8:337f with SMTP id
 2adb3069b0e04-5a8522b9a14mr2057001e87.9.1777620190959; Fri, 01 May 2026
 00:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <18c5532816d852fca073d0552dcb6d497730a6c2.1777377278.git.mykola_kvach@epam.com>
 <59548223-99d7-4a11-ac81-39eee6474562@amd.com>
In-Reply-To: <59548223-99d7-4a11-ac81-39eee6474562@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 1 May 2026 10:22:59 +0300
X-Gm-Features: AVHnY4Jg7wsotp_WVEbJIS2b0dMXEBHMbNKBBcE6O3vHIq4294XeOfKYTvjEgUQ
Message-ID: <CAGeoDV_mjLPUD2m+hmKm3aEaG=Vc8hjW=YqbRmzBXPMB+OXdLA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: gic-v2: disable interrupt bypass on CPU shutdown
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1777620192-F5403CF5-77CD04DB/0/0
X-purgate-type: clean
X-purgate-size: 7812
X-Rspamd-Queue-Id: DAFEF4AAF7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Michal,

On Wed, Apr 29, 2026 at 11:20=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 28-Apr-26 13:57, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
> >
> > Per IHI0048B.b section 2.3.1, clearing the architected bypass-disable
> > bits selects bypass rather than deasserted interrupt outputs when the
> > CPU interface stops driving them. Tables 2-2 and 2-3 show that a zeroed
> > GICC_CTLR can fall back to the legacy IRQ/FIQ inputs instead of fully
> > disabling the interface.
> >
> > Fix this by reading GICC_CTLR, then setting the bypass-disable bits and
> > clearing the group-enable bits that are architecturally defined for the
> > current GICC_CTLR view before writing the value back. When Security
> > Extensions are implemented Xen accesses the Non-secure copy of
> > GICC_CTLR, where IRQBypDisGrp1 and FIQBypDisGrp1 are at bits [6:5] and
> > bits [8:7] are reserved.
> >
> > Without Security Extensions there is no separate Secure/Non-secure CPU
> > interface view, so disabling both group-enable bits affects the shared
> > interface state. This is still appropriate for the CPU shutdown path,
> > which is expected to stop normal interrupt delivery through the interfa=
ce
> > and rely only on the architecturally separate wakeup event signaling.
> >
> > Section 2.3.2 also states that wakeup event signals remain available
> > even when both GIC interrupt signaling and interrupt bypass are
> > disabled, so disabling bypass does not break the power-management use
> > case, i.e. suspend modes.
> >
> > Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >
> > ---
> > Changes in v2:
> > - derive the shutdown masks from the active GICC_CTLR layout
> > - use the Non-secure GICC_CTLR layout when GICD_TYPER.SecurityExtn is s=
et
> > - stop writing reserved bits [8:7] on Security Extensions systems
> > ---
> >  xen/arch/arm/gic-v2.c          | 16 +++++++++++++++-
> >  xen/arch/arm/include/asm/gic.h | 25 +++++++++++++++++++++++--
> >  2 files changed, 38 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index 014f955967..241c1ff5c5 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -408,7 +408,21 @@ static void gicv2_cpu_init(void)
> >
> >  static void gicv2_cpu_disable(void)
> >  {
> > -    writel_gicc(0x0, GICC_CTLR);
> > +    uint32_t ctlr =3D readl_gicc(GICC_CTLR);
> > +
> > +    if ( readl_gicd(GICD_TYPER) & GICD_TYPE_SEC )
> > +    {
> > +        ctlr |=3D GICC_NS_CTLR_BYPASS_DISABLE_GRP1_MASK;
> > +        ctlr &=3D ~GICC_CTL_ENABLE;
> > +    }
> > +    else
> > +    {
> > +        ctlr |=3D GICC_CTLR_BYPASS_DISABLE_GRP0_MASK |
> > +                GICC_CTLR_BYPASS_DISABLE_GRP1_MASK;
> > +        ctlr &=3D ~(GICC_CTL_ENABLE | GICC_CTL_ENABLE_GRP1);
> > +    }
> I don't understand why you want to set both G0 and G1,
> Bits 5-6 in the NS view control Group 1, while the same bits in the
> Secure/single-security-state view control Group 0. So in the latter case =
you
> don't need to set G1. Without security extensions all interrupts are G0 a=
nd with
> security extensions (NS access) all interrupts are G1. The spec guarantee=
s the
> functional mapping.

I agree that this is not about Xen using both interrupt groups during
normal operation.

There are two separate points here.

For the group-enable bits, Xen currently only enables bit 0 in
gicv2_cpu_init(). So, in today's code, EnableGrp1 is expected to be clear
already. However, the old shutdown path wrote 0 to GICC_CTLR, which also
cleared every group-enable bit visible in the current view. Since this
patch changes the shutdown path from a plain zero write to a
read/modify/write, I wanted to preserve that part of the old shutdown
semantics and avoid leaving any normal interrupt delivery enabled in the
common GICC_CTLR view.

For the bypass-disable bits, the reason for setting both groups in the
single-security-state/common view is the GICv2 bypass logic, not normal
interrupt delivery. Once the group-enable bits are clear, the CPU
interface is no longer driving the physical IRQ/FIQ outputs through
normal GIC delivery. At that point, the bypass-disable bits decide
whether those outputs are deasserted or driven by the legacy inputs.

For example, with EnableGrp1 =3D=3D 0, EnableGrp0 =3D=3D 0 and FIQEn =3D=3D=
 0,
Table 2-2 requires IRQBypDisGrp1 to be set for the IRQ output to be
deasserted. Similarly, Table 2-3 requires both FIQBypDisGrp0 and
FIQBypDisGrp1 to be set for the FIQ output to be deasserted. This is why
the common-view case disables the bypass paths for both groups.

This is also not meant to make FIQ a supported delivery mode for Xen. It
is the opposite: when the CPU interface is disabled, the final state
should not allow the physical FIQ output to be driven by the legacy
bypass input. Arm32 has some fallback plumbing for FIQ exceptions, but Xen
does not configure FIQ as its normal GICv2 interrupt delivery mode.

So the intent is:

* with Security Extensions, touch only the Non-secure view bits visible
  to Xen;
* without Security Extensions, preserve the old "no normal delivery"
  shutdown behaviour, while changing the bypass-disable bits so that
  the physical outputs are deasserted rather than falling back to
  legacy bypass.

If you prefer, I can also make v3 more conservative and only clear the
group-enable bit that Xen currently sets in gicv2_cpu_init(), i.e.
EnableGrp0 in the common view / EnableGrp1 in the Non-secure view. The
bypass-disable bits would still be set for all bypass paths visible in
the current GICC_CTLR view, because that part is about the physical
IRQ/FIQ outputs after normal delivery has been disabled, not about which
interrupt group Xen normally uses.

Thanks,
Mykola

>
> ~Michal
>
>
> > +
> > +    writel_gicc(ctlr, GICC_CTLR);
> >  }
> >
> >  static void gicv2_hyp_init(void)
> > diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/=
gic.h
> > index 8e713aa477..ff22dea40d 100644
> > --- a/xen/arch/arm/include/asm/gic.h
> > +++ b/xen/arch/arm/include/asm/gic.h
> > @@ -102,8 +102,29 @@
> >  #define GICD_TYPE_SEC   0x400
> >  #define GICD_TYPER_DVIS (1U << 18)
> >
> > -#define GICC_CTL_ENABLE 0x1
> > -#define GICC_CTL_EOI    (0x1 << 9)
> > +/*
> > + * Xen runs in the Non-secure world. When Security Extensions are pres=
ent,
> > + * Xen accesses the Non-secure GICC_CTLR view, where bit[0] is EnableG=
rp1
> > + * and bits[6:5] are the Group 1 bypass-disable bits. Otherwise Xen se=
es the
> > + * common GICC_CTLR layout, where bit[0] is EnableGrp0, bit[1] is Enab=
leGrp1,
> > + * bits[6:5] are the Group 0 bypass-disable bits, and bits[8:7] are th=
e
> > + * Group 1 bypass-disable bits.
> > + */
> > +#define GICC_CTL_ENABLE        (0x1 << 0)
> > +#define GICC_CTL_ENABLE_GRP1   (0x1 << 1)
> > +#define GICC_CTL_FIQBypDisGrp0 (0x1 << 5)
> > +#define GICC_CTL_IRQBypDisGrp0 (0x1 << 6)
> > +#define GICC_CTL_FIQBypDisGrp1 (0x1 << 7)
> > +#define GICC_CTL_IRQBypDisGrp1 (0x1 << 8)
> > +
> > +#define GICC_CTLR_BYPASS_DISABLE_GRP0_MASK              \
> > +    (GICC_CTL_FIQBypDisGrp0 | GICC_CTL_IRQBypDisGrp0)
> > +#define GICC_CTLR_BYPASS_DISABLE_GRP1_MASK              \
> > +    (GICC_CTL_FIQBypDisGrp1 | GICC_CTL_IRQBypDisGrp1)
> > +#define GICC_NS_CTLR_BYPASS_DISABLE_GRP1_MASK           \
> > +    GICC_CTLR_BYPASS_DISABLE_GRP0_MASK
> > +
> > +#define GICC_CTL_EOI           (0x1 << 9)
> >
> >  #define GICC_IA_IRQ       0x03ff
> >  #define GICC_IA_CPU_MASK  0x1c00
>

