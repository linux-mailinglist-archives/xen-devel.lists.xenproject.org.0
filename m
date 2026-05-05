Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHsGAfuI+WmF9gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 08:06:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F04C7178
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 08:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300207.1574740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK8vO-00039S-JA; Tue, 05 May 2026 06:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300207.1574740; Tue, 05 May 2026 06:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK8vO-00037E-GM; Tue, 05 May 2026 06:06:30 +0000
Received: by outflank-mailman (input) for mailman id 1300207;
 Tue, 05 May 2026 06:06:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wK8vM-000378-UV
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 06:06:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wK8vM-000gia-7I
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:06:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f988e3-e002-0a2a0a5209dd-0a2a450cbd0e-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:06:28 +0200
Received: from [209.85.208.170] (helo=mail-lj1-f170.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f988e3-62f1-0a2a450c0019-d155d0aacc67-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:06:27 +0200
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-39393ec4ed0so23528261fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 23:06:27 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777961187; cv=none;
        d=google.com; s=arc-20240605;
        b=XpTyLF2KJKHRVwWxqw3smaGi6u0N0Spf4zgXOySrm08f9qhxNXx4grSwHIifoqGyx/
         fnhPPJmKJ4Yyb/ixEp6svNb/HYidR9T1G4TMu0pzONgvyHD3+fDI/PpRvcYNIWLf6aNm
         wyA7A5BRWTOQQaBUA+0jq0AuJuWAT1/V5/5s9qNQucL2ApvWWFEBz97d3Zf6sdmlZGn7
         v36zAqCfz8Iza6RMOvY76jIkgUXMFp5Tl6VzmtzCYI2rQHX5+4Gk5U1BNYo1lGi1N04+
         aAkFEOusjNhCjpQ+uL2NESvGt8qWZWxP7WYLSnH+UB4nWtXR4VmQnWuJj+QgXJRELbGv
         alaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DFFOXtk38hAz46vOIiuiR5vJQlqZM0Bfd9SfSoYLs4g=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=SWHTs1g4sIDS5pKb7SCGPOc7UoiFxjCN2rRK33qML9eKZOVCUZliFm0asuQm/oy7/I
         uQsOzrKG2pjPsRpJI6pv0N1eq6lCA/Ijn+1+jGBz02R7JoieEVaD4iSaYMk+F0hb6djo
         X9Qrvv/cj41hJDFFbGEY4pJ3SXxmhPrm2AuEeJt3YXKWcrorz1HzqQ8dA8gtXvHlAF62
         WcnZnnk29PC8+ALBbSTcogogafufq9LsKjx61RdnjtuNz+P9cmQo11s26LhMeJgR5Mpz
         qMP8Dfd+dGSEv++rPZp8fA8nF4HijzOHnI3jwIL+x566fmHj3hCe0GCvA+K+DfAO3J02
         bN0w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777961187; x=1778565987; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFFOXtk38hAz46vOIiuiR5vJQlqZM0Bfd9SfSoYLs4g=;
        b=GEvMc5FXPt/2QE4sc6wKk2Gj4SHrDbjmGT4MdLenXSZ1SYIkj/8XRoyuhE+j4fSDTa
         /sRk+VGnqkWyuNhIltGMxHrMky7jyWVJ5o4eIt4upGeVa2RVScDfl24ndoB0KTppwRhE
         NYPJoyIVpBfmyFBFxF7oz83GOlZSD6EKKVgLa9m91K0mqof19CnGGN7pF3k9xtX/74zq
         mXc7RfcNQdYQFpUvJf8btN5jl1SrFsM14K9Ta2MlffYDkGuQ3mBRE5kjAv8o4G+Ns0jo
         6nJvJTU9/wiP2sbGqUETQ6HWC1lRRBbpLaC+kYgvQBYjGYVG+UTzXx/gOpuGmnTbtuxK
         +lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777961187; x=1778565987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DFFOXtk38hAz46vOIiuiR5vJQlqZM0Bfd9SfSoYLs4g=;
        b=R4m466d0BAHintINs5qAzl/F2HRxSYwWooPTN4YHOK8G++vHjRw1OzAEsDsJ2z4DDg
         UbV7Hs7QxGPSWIycQEU0f70L78YhVE7NAi4pryUyAqsjdRKzZHik/9j7b0EqmeWIOZfJ
         JRmyf2+i1isWwh/mzdDRXsP+AonZB/DtXblysjLEq65EgOzHUKfzqdq+BMoYmxryX3Gc
         wziOfLrxIk6gDHsD47kMl72kQ+lHp1e3jYOdg61DKy+jORi7MoxN+gRwli3tnvXJeckG
         kowQGvWqaPNOnCijBnKE4zU+8hjBntX0pgUHx+K/68SzoAXmUofMZmOYPpazGYzJTF5H
         aXoA==
X-Gm-Message-State: AOJu0Yx8aiTlI2Msl+W5l8HLc2J9jSKvYEG41FmA4UPpDjN/qNPX91iC
	CeOkJiU+WzBdM4ZCWDcSOgIut3o++ljzX+SUR/a71k9jB9M25mxMjwX2qQAEqOtRnh70iBC0S7N
	rVZwQ7uADpVeFPJip9PkjIzI6jCSio20=
X-Gm-Gg: AeBDieseQ1d4WQaWGTrgXOsfz5HVMbpTosPqcLWHo7Z23dXLAfCFDe2lmw4QVYgPmOg
	MRf2RcfyjVDC0luZhIXLFVCUg4lpM4pEzTFgnuiskXbdqUV6Nx5fkBC1Fppluj9C7Vh/GVBri6k
	KgnuHqiDPGlqIcvE1HbaTIMvR/kURZcU7LbxQ/bYK+xuBQMWLHEwP2AoY/JcUzcnCbBd4BX0u+d
	SsOVyPabmTZCC8MBiMBopHWTBTe68iithmW8LsIERkBBTF0272PmqL7OM8ZJG//htwiTagRjS2S
	17QNj2xAIr3sOjGJ
X-Received: by 2002:a05:6512:b82:b0:5a4:d4:5c5a with SMTP id
 2adb3069b0e04-5a87f1f8830mr648703e87.28.1777961186323; Mon, 04 May 2026
 23:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <df183c2bc095ec611cff03e15ac1e358f0faa982.1775125380.git.mykola_kvach@epam.com>
 <3235FD35-5EF1-4E77-B30E-AABEABCC081C@arm.com>
In-Reply-To: <3235FD35-5EF1-4E77-B30E-AABEABCC081C@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 09:06:15 +0300
X-Gm-Features: AVHnY4KGuXuIJPXZ56mqKw7xhaX19h8vIRKNSJ_Ys9-_ZZRDHVjaIz2EsfxTdIA
Message-ID: <CAGeoDV-uWWVC_NiU6EN8qOCavxH=KaYE7coLoT5qXaOZQKAd4A@mail.gmail.com>
Subject: Re: [PATCH v8 03/13] xen/arm: gic-v3: tolerate retained redistributor
 LPI state across CPU_OFF
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1777961187-F620CCF5-ECEF7BE5/0/0
X-purgate-type: clean
X-purgate-size: 5250
X-Rspamd-Queue-Id: 697F04C7178
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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

Hi Luca,

Thank you for the review.

On Wed, Apr 22, 2026 at 6:57=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > +
> > +static int gicv3_lpi_disable_lpis(void __iomem *rdist_base)
> > +{
> > +    uint32_t reg =3D readl_relaxed(rdist_base + GICR_CTLR);
> > +    int ret;
> > +
> > +    if ( !(reg & GICR_CTLR_ENABLE_LPIS) )
> > +        return 0;
> > +
> > +    writel_relaxed(reg & ~GICR_CTLR_ENABLE_LPIS, rdist_base + GICR_CTL=
R);
> > +
> > +    /*
> > +     * The spec only guarantees programmability when we have observed =
the bit
> > +     * cleared. Where clearing is supported, RWP must reach 0 before t=
ouching
> > +     * PROPBASER/PENDBASER again.
> > +     */
> > +    wmb();
> > +
> > +    ret =3D gicv3_do_wait_for_rwp(rdist_base);
>
> I=E2=80=99m looking into the implementation of gicv3_do_wait_for_rwp() an=
d I see
> it=E2=80=99s polling on bit 31 (UWP) instead of bit 3 (RWP)?
>
> Not related to this patch but I feel we need to raise this.

Good catch, thanks.

UWP does have SGI-related semantics, but it is not the same as redistributo=
r
RWP. The existing helper is used as an RWP wait helper after redistributor
register writes, so the redistributor path should poll GICR_CTLR.RWP rather
than GICR_CTLR.UWP.

I will send a separate prerequisite patch to make the redistributor
path use GICR_CTLR_RWP.

>
> > +    if ( ret )
> > +        return ret;
> > +
> > +    reg =3D readl_relaxed(rdist_base + GICR_CTLR);
> > +    if ( reg & GICR_CTLR_ENABLE_LPIS )
> > +        return -EBUSY;
> > +
> > +    return 0;
> > +}
> > +
> > /*
> >  * Tell a redistributor about the (shared) property table, allocating o=
ne
> >  * if not already done.
> > @@ -373,7 +434,21 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base=
)
> >     /* Make sure LPIs are disabled before setting up the tables. */
> >     reg =3D readl_relaxed(rdist_base + GICR_CTLR);
> >     if ( reg & GICR_CTLR_ENABLE_LPIS )
> > -        return -EBUSY;
> > +    {
> > +        if ( gicv3_lpi_tables_match(rdist_base) )
> > +            return -EBUSY;
> > +
> > +        ret =3D gicv3_lpi_disable_lpis(rdist_base);
> > +        if ( ret =3D=3D -EBUSY )
> > +        {
> > +            printk(XENLOG_ERR
> > +                   "GICv3: CPU%d: LPIs still enabled with unexpected r=
edistributor tables\n",
> > +                   smp_processor_id());
> > +            return -EINVAL;
> > +        }
> > +        if ( ret )
> > +            return ret;
> > +    }
> >
> >     ret =3D gicv3_lpi_set_pendtable(rdist_base);
> >     if ( ret )
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index bc07f97c16..34fb065afc 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -274,8 +274,8 @@ static void gicv3_enable_sre(void)
> >     isb();
> > }
> >
> > -/* Wait for completion of a distributor change */
> > -static void gicv3_do_wait_for_rwp(void __iomem *base)
> > +/* Wait for completion of a distributor/redistributor write-pending ch=
ange. */
> > +int gicv3_do_wait_for_rwp(void __iomem *base)
> > {
> >     uint32_t val;
> >     bool timeout =3D false;
> > @@ -295,17 +295,22 @@ static void gicv3_do_wait_for_rwp(void __iomem *b=
ase)
> >     } while ( 1 );
> >
> >     if ( timeout )
> > +    {
> >         dprintk(XENLOG_ERR, "RWP timeout\n");
> > +        return -ETIMEDOUT;
> > +    }
> > +
> > +    return 0;
> > }
> >
> > static void gicv3_dist_wait_for_rwp(void)
> > {
> > -    gicv3_do_wait_for_rwp(GICD);
> > +    (void)gicv3_do_wait_for_rwp(GICD);
> > }
> >
> > static void gicv3_redist_wait_for_rwp(void)
> > {
> > -    gicv3_do_wait_for_rwp(GICD_RDIST_BASE);
> > +    (void)gicv3_do_wait_for_rwp(GICD_RDIST_BASE);
> > }
> >
> > static void gicv3_wait_for_rwp(int irq)
> > @@ -925,7 +930,7 @@ static int __init gicv3_populate_rdist(void)
> >                     gicv3_set_redist_address(rdist_addr, procnum);
> >
> >                     ret =3D gicv3_lpi_init_rdist(ptr);
> > -                    if ( ret && ret !=3D -ENODEV )
> > +                    if ( ret && ret !=3D -ENODEV && ret !=3D -EBUSY )
> >                     {
> >                         printk("GICv3: CPU%d: Cannot initialize LPIs: %=
u\n=E2=80=9D,
>
> This should be the other way around? %u for smp_processor_id() and %d for=
 ret?

You're right, thanks. I will fix the format string.

>
> >                                smp_processor_id(), ret);
> > diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/inclu=
de/asm/gic_v3_its.h
> > index fc5a84892c..081bd19180 100644
> > --- a/xen/arch/arm/include/asm/gic_v3_its.h
> > +++ b/xen/arch/arm/include/asm/gic_v3_its.h
>
> Why this header and not gic.h?

You're right, this prototype is not ITS-specific. I will move it to gic.h.

Best regards,
Mykola

>
> > @@ -133,6 +133,7 @@ struct host_its {
> >
> > /* Map a collection for this host CPU to each host ITS. */
> > int gicv3_its_setup_collection(unsigned int cpu);
> > +int gicv3_do_wait_for_rwp(void __iomem *base);
> >
> > #ifdef CONFIG_HAS_ITS
> >
> >
>
> The rest looks ok to me!
>
> Cheers,
> Luca
>
>
>

