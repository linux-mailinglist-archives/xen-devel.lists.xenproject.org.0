Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJkqIQ9E/GnMNgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:49:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C2D4E4404
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302221.1576199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtTn-0004Hy-UT; Thu, 07 May 2026 07:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302221.1576199; Thu, 07 May 2026 07:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtTn-0004Fm-R5; Thu, 07 May 2026 07:49:07 +0000
Received: by outflank-mailman (input) for mailman id 1302221;
 Thu, 07 May 2026 07:49:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKtTm-0004Fb-SL
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 07:49:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKtTl-00148W-QJ
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:49:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fc43e7-2eae-0a2a0a5409dd-0a2a4502834c-36
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:49:05 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fc43f1-af86-0a2a45020019-d155a72bc4fd-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:49:05 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5a86e4b950cso368632e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 00:49:05 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778140145; cv=none;
        d=google.com; s=arc-20240605;
        b=KGkt4Rv1OZEfFY5XjGw+4yDnbNUSoMGB8rurbwV3N3NNh95ejA3C3i2fv6SpM3fl1O
         MELl+WLwQnq8Iu82zMAbwz3CvDubUt5vvdNvChIV7hWvjkefP4KgBuB/YiPBlOuFe5+r
         N2pnl3d+CGkVswU1OJg32298KE+/17aLmZ8lUTYDIn50/k5UAAVWdtAy2e8bwX4yi/kj
         /kPG9spB/UHBPBLFkYDewFX28Dd6K8XjIFfniRvoiGYqLAhAZCYJax7DrLF8RJSezca9
         76Mf0u6X7VyCT5uGvsNzcmzSbCJ4fEzaRARrEALy5cZgTYjxWu+bbXFKDThP0ZGzptqK
         URxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FpH9ivn7J+a7CnqyryEVPZL0SHq/fQAbKBNReVXHWkM=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=fqUPtk7fNfk/3pn9ur5iswJsAyxFZ65cIUXORd83fL+EDgcRZxT6g4dW5YfxG2JQmD
         sJpAGInLi0fT5g+7clz+oOtxHoBoK/x0+piJclPScTldqeQhtB+r+TxuMilhCMAk+sYW
         gFaYFx/yrVRnDzGPnlUYp2O2mcbrLcPlT3SGaZMAxv4BMlo4aNPodwVWeNhMKHaSgecr
         Sfmqmom0P97118xAjoYtSQZ3GxPRUeiE/Peed2xXwFChLzIrhdh37X7EZ21if5mEzvFE
         winKeZHDkuQXk0F3CFH+iO/EbH3ldoYc70teK01hHH5GQp3v37bhXMYKsVbKX0niB/US
         g8fQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778140145; x=1778744945; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpH9ivn7J+a7CnqyryEVPZL0SHq/fQAbKBNReVXHWkM=;
        b=Ep6iSL/CrPssqfhxINdNwa8t92H0Gi10k+oiV1/4d1tVGv/ZnkDruU74W1RJSljYN4
         YMOqH8Hj5Eci0ICbCuFMvZ9CIr4IB/yThspEfbbXuFa1gXB0q2+17dZm2Fjp7cCiAoRC
         0nCqBbCv8Z/bi6aUtDPOBpP6hMP60NhKigDhM7APU0nGkXdCBc8/fQ3/qhtLytW0yaJN
         3pyrb15/fh7e12Hy8BGE6gCAHzrU7ow07b64l+RErarJ5daC1QPewpTC15g50qhOfkok
         xo6xnx0PWemukH/Rkc3rRhmZIHYNNHYOykQLVS/PE9bJC+fJeXx4ZbKh0VNifYBj7iMA
         /DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140145; x=1778744945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FpH9ivn7J+a7CnqyryEVPZL0SHq/fQAbKBNReVXHWkM=;
        b=qmZnRjwR4QAS1WCBeVJVSvWHzVa/1MiGs/c1i0GVLizC/6RZPovl/yiwt3TijiaGQ6
         8BQLHb4tAgEfDG9Q4HD8VWmzqtrdM/03bAITzILuw4Cd0UhlWKef+VazP9r8sdM34Z5u
         zxE2rgeTZvsU9eNugMJhXfZgYnKNaakjp7dD4Sqy+esuKymhFjY1sm5Xz7GOOQ4Jn3JO
         4qm7kqoTEAEYff4MbUnpuiAiidsg4Uj03tplr998MeldN7c3/TgeuvRjeeVS57Ajoyce
         Vd8SQWNhLVJxOfHljtzdfhTh+DPAXjtpwoq3PAZ1vF3CqM+iYPPH3TOwUKUG8vufz7Na
         YI2Q==
X-Gm-Message-State: AOJu0Yyzl/BQf8f78/N5WNABXfNjCdAWB9OEYh+ts9KOKzSbYkjMA2Ts
	fFcCHCv55YijuxMdJxJT2lO06uTEKZon6USB5LN1buwurWVECPKVJmJndqS7XTbrvi3kzng44nR
	YbAzU9r2fKNbo5j1NYc/LScHq+j+F7bI=
X-Gm-Gg: AeBDievCG4JLi+60IpydX2NLGFqlbaxS/aMAPpVgtmbDgoGRNsWSeyRi109FXFjKYRU
	KuhqQ78RCMiEf86GfXYuoNbRiWcbVDwRmQkl/hkukGnT8P9SnOyjqLt4KcZpn7iZf0FnUIhDdD7
	JW8MLip6FFZNT9z+dQccxdq901EESamPvHTg9WS5cnyLxCReCYyt/4HFgU20HmR4kdRPsjhvW7D
	k2qopVz7gxM1f9ovCDA4RvZg/ztqSTEQAIixviaM9Ml/t2R9vsGN3W+56mrdDeYwrCNY07j5zp6
	dS1UP1T4GzqrBYuZZqXKUN/HXVgDwwd0Td8Jpw==
X-Received: by 2002:a05:6512:b86:b0:5a8:91c1:7110 with SMTP id
 2adb3069b0e04-5a891c172c7mr1307443e87.29.1778140144402; Thu, 07 May 2026
 00:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <5e1951e1c17037e020de9c0eecb5fba94edcd9dd.1775125380.git.mykola_kvach@epam.com>
 <EB3F884F-FCD6-4AE7-84FA-79ABF31EA88E@arm.com>
In-Reply-To: <EB3F884F-FCD6-4AE7-84FA-79ABF31EA88E@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 7 May 2026 10:48:52 +0300
X-Gm-Features: AVHnY4JyCMWnh7af7YUMRsqcpCkfcPjyqh0VRnG7JWBC1lK6NFUYwK6bEhIz_PY
Message-ID: <CAGeoDV80QHdesYQF-J4fg7wYQ6RLNg6u27aQhj4F+JoM4hU3uQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1778140145-8336C161-E189388F/0/0
X-purgate-type: clean
X-purgate-size: 6948
X-Rspamd-Queue-Id: E9C2D4E4404
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Luca,

Thank you for the feedback.

On Tue, Apr 21, 2026 at 4:26=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> >
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index b23e72a3d0..dbff470962 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -1098,6 +1098,129 @@ static int gicv2_iomem_deny_access(struct domai=
n *d)
> >     return iomem_deny_access(d, mfn, mfn + nr);
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +/* This struct represents block of 32 IRQs */
> > +struct irq_block {
> > +    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
> > +    uint32_t ipriorityr[8];
> > +    uint32_t isenabler;
> > +    uint32_t isactiver;
> > +    uint32_t itargetsr[8];
> > +};
> > +
> > +/* GICv2 registers to be saved/restored on system suspend/resume */
> > +struct gicv2_context {
> > +    /* GICC context */
> > +    struct cpu_ctx {
> > +        uint32_t ctlr;
> > +        uint32_t pmr;
> > +        uint32_t bpr;
> > +    } cpu;
> > +
> > +    /* GICD context */
> > +    struct dist_ctx {
> > +        uint32_t ctlr;
> > +        /* Includes banked SGI/PPI state for the boot CPU. */
> > +        struct irq_block *irqs;
> > +    } dist;
> > +};
> > +
> > +static struct gicv2_context gic_ctx;
> > +
> > +static int gicv2_suspend(void)
> > +{
> > +    unsigned int i, blocks =3D DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> > +
> > +    /* Save GICC_CTLR configuration. */
> > +    gic_ctx.cpu.ctlr =3D readl_gicc(GICC_CTLR);
> > +
> > +    /* Quiesce the GIC CPU interface before suspend. */
> > +    gicv2_cpu_disable();
> > +
> > +    /* Save GICD configuration */
> > +    gic_ctx.dist.ctlr =3D readl_gicd(GICD_CTLR);
> > +    writel_gicd(0, GICD_CTLR);
> > +
> > +    gic_ctx.cpu.pmr =3D readl_gicc(GICC_PMR);
> > +    gic_ctx.cpu.bpr =3D readl_gicc(GICC_BPR);
> > +
> > +    for ( i =3D 0; i < blocks; i++ )
> > +    {
> > +        struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
> > +        size_t j, off =3D i * sizeof(irqs->isenabler);
> > +
> > +        irqs->isenabler =3D readl_gicd(GICD_ISENABLER + off);
> > +        irqs->isactiver =3D readl_gicd(GICD_ISACTIVER + off);
> > +
> > +        off =3D i * sizeof(irqs->ipriorityr);
> > +        for ( j =3D 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
> > +        {
> > +            irqs->ipriorityr[j] =3D readl_gicd(GICD_IPRIORITYR + off +=
 j * 4);
> > +            irqs->itargetsr[j] =3D readl_gicd(GICD_ITARGETSR + off + j=
 * 4);
>
> regarding GICD_ITARGETSR ...
>
> > +        }
> > +
> > +        off =3D i * sizeof(irqs->icfgr);
> > +        for ( j =3D 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> > +            irqs->icfgr[j] =3D readl_gicd(GICD_ICFGR + off + j * 4);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void gicv2_resume(void)
> > +{
> > +    unsigned int i, blocks =3D DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> > +
> > +    gicv2_cpu_disable();
> > +    /* Disable distributor */
> > +    writel_gicd(0, GICD_CTLR);
> > +
> > +    for ( i =3D 0; i < blocks; i++ )
> > +    {
> > +        struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
> > +        size_t j, off =3D i * sizeof(irqs->isenabler);
> > +
> > +        writel_gicd(GENMASK(31, 0), GICD_ICENABLER + off);
> > +        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
> > +
> > +        writel_gicd(GENMASK(31, 0), GICD_ICACTIVER + off);
> > +        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
> > +
> > +        off =3D i * sizeof(irqs->ipriorityr);
> > +        for ( j =3D 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
> > +        {
> > +            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j=
 * 4);
> > +            writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j *=
 4);
>
> =E2=80=A6 please let me know if I read correctly this loop, but here GICD=
_ITARGETSR0 =E2=80=A6 7
> are restored when i=3D0, but the specificaitons says that this block is r=
ead only on
> multiprocessor, so we should skip the restore part.
> Also saving it could be skipped because each field returns a value that c=
orresponds
> only to the processor reading the register.
>
> 4.3.12 User constraints [1]

You are right, thanks for pointing this out.
I will skip saving/restoring the read-only GICD_ITARGETSR0..7 block in v9.

>
> > +        }
> > +
> > +        off =3D i * sizeof(irqs->icfgr);
> > +        for ( j =3D 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> > +            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
> > +    }
> > +
> > +    /* Make sure all registers are restored and enable distributor */
> > +    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
> > +
> > +    /* Restore GIC CPU interface configuration */
> > +    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
> > +    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
> > +
> > +    /* Enable GIC CPU interface */
> > +    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
> > +}
> > +
>
> I also see that we don=E2=80=99t save pending SGIs state (by GICD_CPENDSG=
IRn/GICD_SPENDSGIRn) or Active Priorities registers
> state (GICC_APRn/GICC_NSAPRn [latter if security extension are there]) as=
 written in [1] =E2=80=9C4.5 Preserving and restoring GIC state=E2=80=9D,
> was it intentional?

Yes, this was intentional.

The GICv2 suspend callback is called at a quiescent point in the
SYSTEM_SUSPEND path: all domains are already shut down for suspend, guest
execution is quiesced, the scheduler is disabled, non-boot CPUs have been
offlined, and CPU0 enters gic_suspend() with local interrupts disabled.

For SGIs, I don't consider GICD_CPENDSGIRn/GICD_SPENDSGIRn part of the save=
d
host GIC context. Xen uses physical SGIs as IPIs, and IPI delivery is an
internal synchronization mechanism, not architectural state that should be
replayed after SYSTEM_SUSPEND. Guest SGI state is virtual GIC state and is =
not
represented by these physical GICD SGI pending registers.

For GICC_APRn/GICC_NSAPRn, those registers describe active priority state f=
or
interrupts already acknowledged by the CPU interface. The final suspend pat=
h is
not expected to run with an active physical interrupt context. If those
registers were non-zero there, restoring only APR/NSAPR would not make the
corresponding interrupt handling context valid after resume, and could inst=
ead
leave the CPU interface with stale active priority state.

So I did not add save/restore for GICD_CPENDSGIRn/GICD_SPENDSGIRn or
GICC_APRn/GICC_NSAPRn in this patch. I can add a short comment in v9 to mak=
e
this scope explicit.

Please let me know if you think there is a suspend/resume path where this
state still needs to be preserved.

Best regards,
Mykola

>
> [1] https://developer.arm.com/documentation/ihi0048/bb/?lang=3Den
>
> Cheers,
> Luca
>
>

