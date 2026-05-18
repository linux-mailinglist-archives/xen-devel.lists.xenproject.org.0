Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LDLEv/wCmqv+AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 12:59:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39D56B1B2
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 12:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311765.1581914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOvfj-00043e-2b; Mon, 18 May 2026 10:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311765.1581914; Mon, 18 May 2026 10:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOvfi-00041r-VL; Mon, 18 May 2026 10:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1311765;
 Mon, 18 May 2026 10:58:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOvfh-00041l-MP
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 10:58:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOvfh-008Lzl-2W
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 12:58:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0af0b4-e002-0a2a0a5209dd-0a2a45079cec-40
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 12:58:04 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0af0bc-229c-0a2a45070019-d155a72abd92-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 12:58:04 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5a74ac8b40aso2367623e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 03:58:04 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779101884; cv=none;
        d=google.com; s=arc-20240605;
        b=HpvkUI03UJ2oPWJ+vj6rcnnSuVMHk++DTWnG1zBWvtz1CKwO6Dute4llZqJHSCCCbF
         Q3UDohBpEQbcI2w1RsWo7gMJs+Xlj646PIk7/RefCl7B8/Lv4GQHLMZ/h/nmtzKjEM6P
         sumsShKpErjAr21bo0uuNiScJyaueBD94+hl9rj3HGg6WX6D+BL4r3DEpHMdafnG4GlV
         +1MFUAFvzY/EwGvHFkAhU289aRVVqbtNDpzJ+H87Pl48Gno5ifLKR3kmyOB9Br/KvfxL
         Gwwnq7rlRLgLsGtqCPcSPWGid0ZpTHYCz8ezTnTagfXKw0enlxCXsrIQ3VUnNQXfDP1C
         ZFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iDEX8UDptJhfWKvz2TeyO+2B8cGilsxQsbRsQorvcUQ=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=FDtCkP928OSjq6D56hzW9n4ITrFBHHH/Uh/hKk2uaKA4juIWMYb2Y+xrVSckGrpFCk
         sdtiUtkh8BjT4Kghgh+d+X9Y6WkhVrrsGEuuXAsJizovWD+h1accC36zkHp91ADP6oc/
         Ymi8qtD6CNm4zs9qGSBSG8FvGBoBlVhbEtHcONMCSaXf4fiZEaY5XJ/S8/vyLXnKSiHZ
         YyEj1khweaNLDaUJYw9cUcGVG3ToGYy9fWycAvS6obzb+zXHY8wN4mbXcq8RQVIXvAr3
         GlKWrAjZNStC3E1k/VVvWBrFfBcqxnoiF72C1kheCeDBasGE3Fu/d8sfnxTdLLLwElDE
         HXJg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101884; x=1779706684; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDEX8UDptJhfWKvz2TeyO+2B8cGilsxQsbRsQorvcUQ=;
        b=MydVJ5cGfvl7SrujubgFRJWekQplRsvEoTnhIVIUbRnyjUY6rQ48TD7F5q/iQreJlq
         pPqD5VgI+V8c6we7pnfdWA6vtfdq3NOJJpArRZvNYH9CThfqOl1CjG3yxmvMR3kWcxZ8
         2mFIYFftpJdW2LBBuPfTk8VyfMnWUPrtahkBzTTvGCw3u5iYYjK0C9REkP+W7Zvj5Rso
         4HYEIO67a3WlUiIFnxezbNMgxxg/LNaJQXAdEhB345qbXaxxuctJH+BYUfa8d5s9YdqG
         U7U5mkX+kRHI9D3cxSqvP1jloJsQD3yWAWnJ02vEDHBSSSAfugiC+JKi3HEzT3FykBzc
         ObYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101884; x=1779706684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iDEX8UDptJhfWKvz2TeyO+2B8cGilsxQsbRsQorvcUQ=;
        b=Wg18r+hBDjXUPnqTtAFl+PdIGHElQXbVEgkPUj634qJie/2H9i0NPha/RQeHxZSRg5
         QTS9K/K7mtZyqkQMvkokmbMlBgy0wReVio0otTfEsqxh0lVG35N1nG92E2A58LM9cC5J
         UdJttzJANJcexAU02ULKyy1R88cwQ4FnZNu0+VbaLBZ13/8Jfl9I35itv4T8j7oeGuwH
         292D6dXBynGvLaxiZuQ35f1R1bLwYIVqLud6lrr0IQMqdL/It/K5rHrd2GA9LndHYGXo
         uRtTqfChcLqYvIX8N5ncUZEdqYcYMdCMkrGUtV9inA/gGBnXvOGAXji8YvYKiYzihzgD
         9zYA==
X-Gm-Message-State: AOJu0YwCpMvFbrUBDZ6mY7GGgB55EKVQQDeUb7k25QKG6jsrfb1sIjzR
	2RYP+bUtqt92Lztm1DcZSS9qbe3HdMCpUGNLNFGGeWeJ+CFgzUMPpbV6xL2SqooHZ7uD3lvd+wo
	CR3voYmmfutYohM7vHGKJmyYs1J1pTdE=
X-Gm-Gg: Acq92OGR/N6s552rDIZLPZmzXWKHcb8zafsZXL+uHSLb2ERyblqpckDUZ6QTNJ6FxVA
	DJpZlV+usWCHMqPdGWpkzhvGtJyGzkAnV9JECmvBWdbYP1yEAcR5KTntejlinGhDa9w6vMUpHhV
	ZkVGBaHa8efUwM9Q27EraC3Kw3tYueveCv4pi7Pxva1X5XpiGIMEYDT53sFC5CqiJkcICUj0PFz
	xJ0IcGj2f2XlsOcmdRDHDU/cILJBi+IniKDU95K3YknCQH0vlEvtExQLo2uP+poPEedmBJPWSML
	s4G1
X-Received: by 2002:ac2:4e0a:0:b0:5a3:d1d9:6080 with SMTP id
 2adb3069b0e04-5aa0e76a4abmr3831035e87.29.1779101883808; Mon, 18 May 2026
 03:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <8973fc6bf69d8b20cebb61289c1b8596b1a09900.1778605274.git.mykola_kvach@epam.com>
 <BA33B390-3ECC-4EBF-8305-5E91C8451398@arm.com>
In-Reply-To: <BA33B390-3ECC-4EBF-8305-5E91C8451398@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 13:57:52 +0300
X-Gm-Features: AVHnY4JIQPONCjjmKRJsEdQBFTYJgXXhCyzRS5OaDDBSDz37fWZ0avdzJM1muVQ
Message-ID: <CAGeoDV-X=P44aTfYP3ZbbszMBBhq_ig72nMM9qLnmPWMFm64Xg@mail.gmail.com>
Subject: Re: [PATCH v9 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1779101884-0A573C48-CD234429/0/0
X-purgate-type: clean
X-purgate-size: 9698
X-Rspamd-Queue-Id: 9E39D56B1B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid];
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
	NEURAL_HAM(-0.00)[-0.964];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Luca,

Thank you for the detailed review.

On Wed, May 13, 2026 at 7:12=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
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
>
> I think here we should clear GICR_WAKER_ProcessorSleep, the Arm IHI 0069H=
.b, section
> 11.1 says that
>
> =E2=80=9C=E2=80=9D"
> When GICR_WAKER.ProcessorSleep =3D=3D 1 or GICR_WAKER.ChildrenAsleep =3D=
=3D 1 then a write to any GICC_*,
> GICV_*, GICH_*, ICC_*, ICV_*, or ICH_* registers, other than those in the=
 following list, is unpredictable:
> =E2=80=A2 ICC_SRE_EL1.
> =E2=80=A2 ICC_SRE_EL2.
> =E2=80=A2 ICC_SRE_EL3
> =E2=80=9C""
> But in the error path used in gicv3_suspend() we are writing ICH_HCR_EL2 =
and ICC_IGRPEN1_EL1.

Agreed. I will fix the abort path by calling gicv3_enable_redist() before
restoring the CPU/virtual interface state.

>
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
> > +static void gicv3_restore_spi_irq_config(struct dist_irq_block *irqs,
> > +                                         unsigned int i, bool is_espi)
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
> > +}
> > +
> > +static void gicv3_restore_spi_irq_routing(struct dist_irq_block *irqs,
> > +                                          unsigned int i, bool is_espi=
)
> > +{
> > +    void __iomem *base;
> > +    unsigned int irq;
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
> > +    base +=3D i * sizeof(irqs->irouter);
> > +    for ( irq =3D 0; irq < ARRAY_SIZE(irqs->irouter); irq++ )
> > +        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
> > +}
> > +
> > +static void gicv3_restore_spi_irq_state(struct dist_irq_block *irqs,
> > +                                        unsigned int i, bool is_espi)
> > +{
> > +    void __iomem *base;
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
> Should we check that ICC_AP1R<n>_EL1 =3D=3D 0 before continuing our
> suspend? Like we do in the GICv2?

Yes, I agree. This is the GICv3 equivalent of the GICv2
GICC_APR<n> check for the physical CPU interface active-priority
state.

I will use ICH_VTR_EL2.PREbits to decide which AP1R registers are
implemented, so we do not read an unimplemented ICC_AP1R<n>_EL1
register.

>
> > +
> > +    ret =3D gicv3_disable_redist();
> > +    if ( ret )
> > +        goto out_enable_iface;
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
> > +    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
> > +    isb();
> > +
> > +    return ret;
> > +}
> > +
> > +static void gicv3_resume(void)
> > +{
> > +    int ret;
> > +    unsigned int i;
> > +    uint32_t dist_ctlr;
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
> > +        gicv3_restore_spi_irq_config(gicv3_ctx.dist.irqs + i - 1, i, f=
alse);
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> > +    {
> > +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + i * 4);
> > +        gicv3_restore_spi_irq_config(gicv3_ctx.dist.espi_irqs + i, i, =
true);
> > +    }
> > +#endif
> > +
> > +    dist_ctlr =3D gicv3_ctx.dist.ctlr & GICD_CTLR_ARE_NS;
> > +    if ( dist_ctlr )
> > +    {
> > +        writel_relaxed(dist_ctlr, GICD + GICD_CTLR);
> > +        gicv3_dist_wait_for_rwp();
> > +
> > +        for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ =
)
> > +            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.irqs + i - 1,=
 i,
> > +                                          false);
>
> I think we have an issue in this loop as we are accessing GICD_IROUTER<10=
20=E2=80=A61023>
> and GICD_IPRIORITYR255, while the specs says 1020=E2=80=A61023 are reserv=
ed and
> GICD_IPRIORITYR<n> goes from 0 to 254. here and in the gicv3_suspend()

Ack. I will fix this.

Best regards,
Mykola

