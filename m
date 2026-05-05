Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JG0GMyb+Wkn+QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 09:27:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F77D4C7E44
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 09:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300239.1574767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKAB4-00063b-Mo; Tue, 05 May 2026 07:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300239.1574767; Tue, 05 May 2026 07:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKAB4-00062A-JT; Tue, 05 May 2026 07:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1300239;
 Tue, 05 May 2026 07:26:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKAB3-000624-IU
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 07:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKAB2-00BQcD-UD
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 09:26:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f99bb1-bab6-0a2a0a5309dd-0a2a450ba790-14
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 09:26:44 +0200
Received: from [209.85.167.44] (helo=mail-lf1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f99bb4-212f-0a2a450b0019-d155a72cc13f-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 09:26:44 +0200
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5a86c1fe573so3345260e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 00:26:44 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777966004; cv=none;
        d=google.com; s=arc-20240605;
        b=Huwg4e0zbCTcfdwM9V6WTz77WhFRgwjTm9riaSqcSqo4urI7vKjcG/Jyw9xU2bP6q9
         y0kFJF7D1+WRpWiiYx6HWqBaH2TtmvOeQWT+xG1FxCDRDQ03dSXRHouaeTCtwxs2joMv
         Cj4TNRWUFkzNJDHVSheIm2KXMGtvfQ/A1fHLBdbQVafAm4fWtajrsHTaJwZCctOgr43P
         AgcB4T1XN5JlRTuKja7S1oOJb93Mj43co/SrJwB+oJdgqgCPxk2s6Z4FDjzeo9IDycF9
         EOmdSVkcLrlCdDJQpEsl5tiPwT4UmPPzPLYajXWQYEldqvWLq3uklc8KOt5edplyWmrX
         Czsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJxBCTgTohl1pMx8+6kEX1CK8xPhaZnIMEyskNzn4a4=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=WKScqAsni3FR11J/5KSR3rL2zBLrLopjmTA51Hqp4HOmpEzLyWZdvIWiQ+dVRXwJKd
         OX5GOaGNkYBk3GXSI2zM+N/3Uh4i7CkKbUKJzj5w2bSAqoOGOEk/GFKo5AcwdGMMeaxd
         x92WywLfYioOG3B3iHqKTPSsbBTMqQ8ww9BojB9acmtvmsXtBf5FDvCk3HQGs8yStWm7
         JQRJqhQ6GdXpAKY+nQrAkdT8uskV0IDs7OG91o9Nks9MzYZKG/hFLZg99Ew1KbPn6B7g
         ILL272l+7I1Pnzhq+TfVnkZW+C0lz8Ygohir3YL5eoNPZgZ0B+46mv4My0BoklV6S3Vs
         EDJQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777966004; x=1778570804; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJxBCTgTohl1pMx8+6kEX1CK8xPhaZnIMEyskNzn4a4=;
        b=EwIloe7z8Es7LEhc5k7/3IQoW+nbMBn7bvm6lIUzHLLAOpLm5d/d+Xwmiy54b9wepB
         CUBvIaPNi9rKbyO+I02HqsajdHDbG/52caDow6iX1khy4H6nO95cpPtZDbImMgbrE7wJ
         b1Ff93yqsasBq4g6vKkRMIIbNYHcprUo7JHmSC/IEZnR78Edt/K+cukRL/IehVktqYlJ
         B7HmYNhfI5O9oJoNzqUNKtDO3w/yKtnceQUIg2Lw37a9YsEIoNO/l5/ErArLbL5JuA9k
         N4Vz2A2PyvxW3MkZ3XLB9iOYuagjjNdDAJpW/YWpy5n7BC4Tm5lF4SNVd1W1mNSV6uhk
         WPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966004; x=1778570804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uJxBCTgTohl1pMx8+6kEX1CK8xPhaZnIMEyskNzn4a4=;
        b=rL/A4pJTSrzMce3z23cssgZi3kho6OtfXTfaE1hb8GsbzgTy0DksCp7lAaf6wF8Xhq
         VCR7kseRjxU4szkBldtmHLU7KPDW3fRMwTurPFPw7Cg96wxhensKakdnq6br8zdIjSZJ
         L9gUQMCdLwp2VCUvCSsFFECKJBCfcFmgX1o3tC7WjZ7zjW5qFKRZhwI0YOBousBTucPd
         KcbYWc1FJA5owJtJUPAWvxIl/EQl+Y/a4XrCphRDqFzJ7lsAsnWbvKjZHs+tVCpOXh5Z
         oN/ls4DYfeG+jW8T8+J3JqtxRPbYS09DnvK7iEhyFwE5BQQ+JyV3KlbEbK1lzXeAJ0sP
         Lplw==
X-Gm-Message-State: AOJu0YyYyOb7+1tJ3XBeEgveNRdvk+Y0oAWTzig/yki6Tsox0kFRGaDB
	Tio7ITBa6Um58GQ0DnZee2NGrwwl/p21YnRrToAUpOQX4YNEC0fSSmdR2nMsBUMjZrlM4BV6wLJ
	2PzkgH4fpNPCuuHYJDQYoVwifO3WypNA=
X-Gm-Gg: AeBDieuGUNfkfweAykE7EZIa0jc7uuFdQ/QYPPWDyka1/y3A3rn+QCqi/Bb74LRDewY
	IO4qUQgbQhBA5jeCfC+XRLshmzZlMioClYl8RvWmXshXxgF19g4mSq8wQs8zDCHu9/oVx7UgI4O
	qYrF1Xo9Ou+XPNJ1ge/tGAntB+vJJivpBtngaUwJrr1XXoaC2LJLvWyZGXjN38+PMnXUyfHPpYk
	x6JMRxY38WZNrhgSYRMUxnMpODmNc02DQW4wfg0i7hXNjFeji5g+zVcEB9/j4E2prp2mw37/q4c
	YINy99s7ztwrJtl6
X-Received: by 2002:a05:6512:31c8:b0:5a2:abe6:7bcd with SMTP id
 2adb3069b0e04-5a8631bac61mr3764812e87.19.1777966003685; Tue, 05 May 2026
 00:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <d3398c62b8604bb869c204e3786f0b0246de7375.1775125380.git.mykola_kvach@epam.com>
 <EA1567BB-4ED9-41C7-BDD9-9DABAA2D2855@arm.com>
In-Reply-To: <EA1567BB-4ED9-41C7-BDD9-9DABAA2D2855@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 10:26:31 +0300
X-Gm-Features: AVHnY4Ky8uJFLCBFZxjqUatpRvUbmjeQYVNb3WJbGYVqkHisl24pBjVF68cIxuo
Message-ID: <CAGeoDV_ahBPZg1EW5zTYug4xLAFZe0SU2Wk9=ysuBP3+5QZXzg@mail.gmail.com>
Subject: Re: [PATCH v8 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1777966004-7F57BF3B-15AC97D2/0/0
X-purgate-type: clean
X-purgate-size: 16123
X-Rspamd-Queue-Id: 6F77D4C7E44
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid];
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

On Thu, Apr 23, 2026 at 2:29=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index 34fb065afc..d182a71478 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -1072,12 +1072,12 @@ out:
> >     return res;
> > }
> >
> > -static void gicv3_hyp_disable(void)
> > +static void gicv3_hyp_enable(bool enable)
> > {
> >     register_t hcr;
> >
> >     hcr =3D READ_SYSREG(ICH_HCR_EL2);
> > -    hcr &=3D ~GICH_HCR_EN;
> > +    hcr =3D enable ? (hcr | GICH_HCR_EN) : (hcr & ~GICH_HCR_EN);
> >     WRITE_SYSREG(hcr, ICH_HCR_EL2);
> >     isb();
> > }
> > @@ -1184,7 +1184,7 @@ static void gicv3_disable_interface(void)
> >     spin_lock(&gicv3.lock);
> >
> >     gicv3_cpu_disable();
> > -    gicv3_hyp_disable();
> > +    gicv3_hyp_enable(false);
> >
> >     spin_unlock(&gicv3.lock);
> > }
> > @@ -1920,6 +1920,313 @@ static bool gic_dist_supports_lpis(void)
> >     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +/* This struct represent block of 32 IRQs */
>
> NIT: s/represent/represents

Ack.

>
> > +struct dist_irq_block {
> > +    uint32_t icfgr[2];
> > +    uint32_t ipriorityr[8];
> > +    uint64_t irouter[32];
> > +    uint32_t isactiver;
> > +    uint32_t isenabler;
> > +};
> > +
> > +struct redist_ctx {
> > +    uint32_t ctlr;
> > +    uint32_t icfgr; /* only PPIs stored */
> > +    uint32_t igroupr;
>
> I think Xen writes also GICD_IGROUPR<n>E, we are not saving it so in case=
 of a reset
> we would have GICD_IGROUPR<n>E containing the reset value which is zero.
> Or we could decide to re-initialise it in the same way Xen does (all 1s).

Yes, good point.

For the normal SPI range I re-initialise GICD_IGROUPR to all 1s during resu=
me,
but I missed doing the same for the eSPI range. I will add the correspondin=
g
GICD_IGROUPR<n>E re-initialisation, matching the normal Xen initialisation =
path.

>
> > +    uint32_t ipriorityr[8];
> > +    uint32_t isactiver;
> > +    uint32_t isenabler;
> > +
> > +    uint64_t pendbase;
> > +    uint64_t propbase;
> > +};
> > +
> > +/* GICv3 registers to be saved/restored on system suspend/resume */
> > +struct gicv3_ctx {
> > +    struct dist_ctx {
> > +        uint32_t ctlr;
> > +        struct dist_irq_block *irqs, *espi_irqs;
>
> NIT: I would declare them one after the other and not in the same line, b=
ut this is a matter of taste
> maybe so I will leave the decision to the maintainers.

Ack.

>
> > +    } dist;
> > +
> > +    /* have only one rdist structure for last running CPU during suspe=
nd */
> > +    struct redist_ctx rdist;
> > +
> > +    struct cpu_ctx {
> > +        uint32_t ctlr;
> > +        uint32_t pmr;
> > +        uint32_t bpr;
> > +        uint32_t sre_el2;
> > +        uint32_t grpen;
> > +    } cpu;
> > +};
> > +
> > +static struct gicv3_ctx gicv3_ctx;
> > +
> > +static void __init gicv3_alloc_context(void)
> > +{
> > +    uint32_t blocks =3D DIV_ROUND_UP(gicv3_info.nr_lines, 32);
> > +
> > +    /* The spec allows for systems without any SPIs */
> > +    if ( blocks > 1 )
> > +    {
> > +        gicv3_ctx.dist.irqs =3D xzalloc_array(struct dist_irq_block, b=
locks - 1);
> > +        if ( !gicv3_ctx.dist.irqs )
> > +            panic("Failed to allocate memory for GICv3 suspend context=
\n");
> > +    }
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    if ( !gic_number_espis() )
> > +        return;
> > +
> > +    blocks =3D gic_number_espis() / 32;
> > +    gicv3_ctx.dist.espi_irqs =3D xzalloc_array(struct dist_irq_block, =
blocks);
> > +    if ( !gicv3_ctx.dist.espi_irqs )
> > +        panic("Failed to allocate memory for GICv3 eSPI suspend contex=
t\n");
> > +#endif
> > +}
> > +
> > +static int gicv3_disable_redist(void)
> > +{
> > +    void __iomem *waker =3D GICD_RDIST_BASE + GICR_WAKER;
> > +    s_time_t deadline;
> > +
> > +    /*
> > +     * Avoid infinite loop if Non-secure does not have access to GICR_=
WAKER.
> > +     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
> > +     *     When GICD_CTLR.DS =3D=3D 0 and an access is Non-secure acce=
sses to this
> > +     *     register are RAZ/WI.
> > +     */
> > +    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
> > +        return 0;
> > +
> > +    deadline =3D NOW() + MILLISECS(1000);
> > +
> > +    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, w=
aker);
> > +    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) =3D=3D =
0 )
> > +    {
> > +        if ( NOW() > deadline )
> > +        {
> > +            printk("GICv3: Timeout waiting for redistributor to sleep\=
n");
> > +            return -ETIMEDOUT;
> > +        }
> > +        cpu_relax();
> > +        udelay(10);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +#define GET_SPI_REG_OFFSET(name, is_espi) \
> > +    ((is_espi) ? GICD_##name##nE : GICD_##name)
> > +
> > +static void gicv3_store_spi_irq_block(struct dist_irq_block *irqs,
> > +                                      unsigned int i, bool is_espi)
> > +{
> > +    void __iomem *base;
> > +    unsigned int irq;
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(ir=
qs->icfgr);
> > +    irqs->icfgr[0] =3D readl_relaxed(base);
> > +    irqs->icfgr[1] =3D readl_relaxed(base + 4);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
> > +    base +=3D i * sizeof(irqs->ipriorityr);
> > +    for ( irq =3D 0; irq < ARRAY_SIZE(irqs->ipriorityr); irq++ )
> > +        irqs->ipriorityr[irq] =3D readl_relaxed(base + 4 * irq);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
> > +    base +=3D i * sizeof(irqs->irouter);
> > +    for ( irq =3D 0; irq < ARRAY_SIZE(irqs->irouter); irq++ )
> > +        irqs->irouter[irq] =3D readq_relaxed_non_atomic(base + 8 * irq=
);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
> > +    base +=3D i * sizeof(irqs->isactiver);
> > +    irqs->isactiver =3D readl_relaxed(base);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
> > +    base +=3D i * sizeof(irqs->isenabler);
> > +    irqs->isenabler =3D readl_relaxed(base);
> > +}
> > +
> > +static void gicv3_restore_spi_irq_block(struct dist_irq_block *irqs,
> > +                                        unsigned int i, bool is_espi)
> > +{
> > +    void __iomem *base;
> > +    unsigned int irq;
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(ir=
qs->icfgr);
> > +    writel_relaxed(irqs->icfgr[0], base);
> > +    writel_relaxed(irqs->icfgr[1], base + 4);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
> > +    base +=3D i * sizeof(irqs->ipriorityr);
> > +    for ( irq =3D 0; irq < ARRAY_SIZE(irqs->ipriorityr); irq++ )
> > +        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
> > +    base +=3D i * sizeof(irqs->irouter);
> > +    for ( irq =3D 0; irq < ARRAY_SIZE(irqs->irouter); irq++ )
> > +        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
>
>
> The [1] 12.9.22 GICD_IROUTER<n> says "these registers are used only when =
affinity routing is enabled.
> When affinity routing is not enabled: These registers are RES0. An implem=
entation is permitted to make
> the register RAZ/WI in this case=E2=80=9D
>
> So I think these needs to be written after we set GICD_CTLR or we are goi=
ng to loose anything written there
> and also the configuration won=E2=80=99t be restored.

You are right. Restoring IROUTER before restoring the affinity-routing stat=
e is
not safe, because these registers are only meaningful when affinity routing=
 is
enabled.

I will fix the restore ordering in the next version.

>
>
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ICENABLER, is_espi) + i * 4;
> > +    writel_relaxed(GENMASK(31, 0), base);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
> > +    base +=3D i * sizeof(irqs->isenabler);
> > +    writel_relaxed(irqs->isenabler, base);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ICACTIVER, is_espi) + i * 4;
> > +    writel_relaxed(GENMASK(31, 0), base);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
> > +    base +=3D i * sizeof(irqs->isactiver);
> > +    writel_relaxed(irqs->isactiver, base);
> > +}
> > +
> > +static int gicv3_suspend(void)
> > +{
> > +    unsigned int i;
> > +    void __iomem *base;
> > +    int ret;
> > +    struct redist_ctx *rdist =3D &gicv3_ctx.rdist;
> > +
> > +    /* Save GICC configuration */
> > +    gicv3_ctx.cpu.ctlr     =3D READ_SYSREG(ICC_CTLR_EL1);
> > +    gicv3_ctx.cpu.pmr      =3D READ_SYSREG(ICC_PMR_EL1);
> > +    gicv3_ctx.cpu.bpr      =3D READ_SYSREG(ICC_BPR1_EL1);
> > +    gicv3_ctx.cpu.sre_el2  =3D READ_SYSREG(ICC_SRE_EL2);
> > +    gicv3_ctx.cpu.grpen    =3D READ_SYSREG(ICC_IGRPEN1_EL1);
> > +
> > +    gicv3_disable_interface();
>
> this one is calling also gicv3_cpu_disable() that will zero ICC_IGRPEN1_E=
L1 ...
>
> > +
> > +    ret =3D gicv3_disable_redist();
> > +    if ( ret )
> > +        goto out_enable_iface;
>
> =E2=80=A6 but when we fail here ...
>
> > +
> > +    /* Save GICR configuration */
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    base =3D GICD_RDIST_BASE;
> > +
> > +    rdist->ctlr =3D readl_relaxed(base + GICR_CTLR);
> > +
> > +    rdist->propbase =3D readq_relaxed(base + GICR_PROPBASER);
> > +    rdist->pendbase =3D readq_relaxed(base + GICR_PENDBASER);
> > +
> > +    base =3D GICD_RDIST_SGI_BASE;
> > +
> > +    /* Save priority on PPI and SGI interrupts */
> > +    for ( i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> > +        rdist->ipriorityr[i] =3D readl_relaxed(base + GICR_IPRIORITYR0=
 + 4 * i);
> > +
> > +    rdist->isactiver =3D readl_relaxed(base + GICR_ISACTIVER0);
> > +    rdist->isenabler =3D readl_relaxed(base + GICR_ISENABLER0);
> > +    rdist->igroupr   =3D readl_relaxed(base + GICR_IGROUPR0);
> > +    rdist->icfgr     =3D readl_relaxed(base + GICR_ICFGR1);
> > +
> > +    /* Save GICD configuration */
> > +    gicv3_dist_wait_for_rwp();
> > +    gicv3_ctx.dist.ctlr =3D readl_relaxed(GICD + GICD_CTLR);
> > +
> > +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> > +        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, fals=
e);
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> > +        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, tru=
e);
> > +#endif
> > +
> > +    return 0;
> > +
> > + out_enable_iface:
> > +    gicv3_hyp_enable(true);
> > +    WRITE_SYSREG(gicv3_ctx.cpu.ctlr, ICC_CTLR_EL1);
>
> we don=E2=80=99t recover ICC_IGRPEN1_EL1

Yes, you are right.

This series missed the change introduced by commit 18b718b6af3d ("xen/arm:
gic-v3: disable Group 1 before CPU power-down"). Since gicv3_cpu_disable() =
now
disables ICC_IGRPEN1_EL1, the error path needs to restore it before returni=
ng.

I will fix this in the next version.

Best regards,
Mykola

>
> > +    isb();
> > +
> > +    return ret;
> > +}
> > +
> > +static void gicv3_resume(void)
> > +{
> > +    int ret;
> > +    unsigned int i;
> > +    void __iomem *base;
> > +    struct redist_ctx *rdist =3D &gicv3_ctx.rdist;
> > +
> > +    writel_relaxed(0, GICD + GICD_CTLR);
> > +
> > +    for ( i =3D NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i +=3D 32 =
)
> > +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) =
* 4);
> > +
> > +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> > +        gicv3_restore_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, fa=
lse);
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> > +        gicv3_restore_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, t=
rue);
> > +#endif
> > +
> > +    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
> > +    gicv3_dist_wait_for_rwp();
> > +
> > +    ret =3D gicv3_lpi_init_rdist(GICD_RDIST_BASE);
> > +    /*
> > +     * If LPIs are already enabled, assume firmware or the still-power=
ed
> > +     * redistributor has valid PROPBASER/PENDBASER and skip reprogramm=
ing.
> > +     * Return -EBUSY so callers can ignore this case.
> > +     */
> > +    if ( ret && ret !=3D -ENODEV && ret !=3D -EBUSY )
> > +        panic("GICv3: Failed to re-initialize LPIs during resume\n");
> > +    else if ( ret =3D=3D -EBUSY ) /* extra checks, just to be sure */
> > +    {
> > +        base =3D GICD_RDIST_BASE;
> > +        if ( readq_relaxed(base + GICR_PROPBASER) !=3D rdist->propbase=
 ||
> > +             readq_relaxed(base + GICR_PENDBASER) !=3D rdist->pendbase=
 )
> > +        {
> > +            panic("GICv3: LPIs already enabled with unexpected PROPBAS=
ER/PENDBASER during resume\n");
> > +        }
> > +    }
> > +
> > +    /* Restore GICR (Redistributor) configuration */
> > +    if ( gicv3_enable_redist() )
> > +        panic("GICv3: Failed to re-enable redistributor during resume\=
n");
> > +
> > +    base =3D GICD_RDIST_SGI_BASE;
> > +
> > +    writel_relaxed(GENMASK(31, 0), base + GICR_ICENABLER0);
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    for ( i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> > +        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 +=
 i * 4);
> > +
> > +    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
> > +    writel_relaxed(rdist->igroupr,   base + GICR_IGROUPR0);
> > +    writel_relaxed(rdist->icfgr,     base + GICR_ICFGR1);
> > +
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
> > +    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
> > +
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
> > +    isb();
> > +
> > +    /* Restore CPU interface (System registers) */
> > +    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
> > +    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
> > +    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
> > +    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
> > +    isb();
> > +
> > +    gicv3_hyp_init();
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> > /* Set up the GIC */
> > static int __init gicv3_init(void)
> > {
> > @@ -1994,6 +2301,10 @@ static int __init gicv3_init(void)
> >
> >     gicv3_hyp_init();
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    gicv3_alloc_context();
> > +#endif
> > +
> > out:
> >     spin_unlock(&gicv3.lock);
> >
> > @@ -2033,6 +2344,10 @@ static const struct gic_hw_operations gicv3_ops =
=3D {
> > #endif
> >     .iomem_deny_access   =3D gicv3_iomem_deny_access,
> >     .do_LPI              =3D gicv3_do_LPI,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    .suspend             =3D gicv3_suspend,
> > +    .resume              =3D gicv3_resume,
> > +#endif
> > };
> >
> > static int __init gicv3_dt_preinit(struct dt_device_node *node, const v=
oid *data)
> > diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/incl=
ude/asm/gic_v3_defs.h
> > index c373b94d19..992c8f9c2f 100644
> > --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> > +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> > @@ -94,6 +94,7 @@
> > #define GICD_TYPE_LPIS               (1U << 17)
> >
> > #define GICD_CTLR_RWP                (1UL << 31)
> > +#define GICD_CTLR_DS                 (1U << 6)
> > #define GICD_CTLR_ARE_NS             (1U << 4)
> > #define GICD_CTLR_ENABLE_G1A         (1U << 1)
> > #define GICD_CTLR_ENABLE_G1          (1U << 0)
> >
>
> Cheers,
> Luca
>
>
>
>

