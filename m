Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHvXCqTSBmqKoAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:00:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8283354AF3D
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309690.1580741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNnSO-0005lf-8V; Fri, 15 May 2026 07:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309690.1580741; Fri, 15 May 2026 07:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNnSO-0005il-52; Fri, 15 May 2026 07:59:40 +0000
Received: by outflank-mailman (input) for mailman id 1309690;
 Fri, 15 May 2026 07:59:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wNnSM-0005if-Km
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 07:59:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNnSL-00FD96-TZ
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:59:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a06d267-2eae-0a2a0a5409dd-0a2a4509940c-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:59:37 +0200
Received: from [209.85.167.52] (helo=mail-lf1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a06d269-2497-0a2a45090019-d155a734d4cf-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:59:37 +0200
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5a8721851e2so9790167e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 00:59:37 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778831977; cv=none;
        d=google.com; s=arc-20240605;
        b=CYMPQ6cwoHOhJ8YhG/hLCqp9Ccqt1/IlcjjZGI2OhgB7REcnZLPWTlmqgZBT60f90/
         eBO0Bo7foQ+HSxfqn/kRlkkJqtERH1WpuFZlDOt0KaAr0WGO6hiAtrx0h26KI8jpCkML
         9k0dYObYUsSiXbAj6Vv2GEaf58P+LVbjKzVaVqYyv42dRXZUGl8cM8j7rbfJFtUDbah7
         16JWn56eQrYWb8KP7dbO2/HKtTTqrNVrHNAh4CDPkDSwU0yCABkZ2iHz9+yWdDyfdzPn
         zLpINPYGYtkgbqXKFlJmPsA/rtZ1+bAqLfDh+1Vsakj73PVjRO91QMwZCoXyyMYEERhJ
         Lq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aj5jvFEFmH+xjzvdxI8gC16245Xuwn0Bz0BnEbU1mKU=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=ZEDlPIuIsGb1e6mwnVM83ExHl8pQ37Go4NgAMQPEOtoHkX2OhbVeUCBlmQay+3a7pA
         91lgZl30IRg0FRIbpB53cg0/M6jd7FUozoTqq03BhLdw0aePoOScypxdbmOuQq/OfHDP
         4EYTozpTIZ540ASVg3nncdN+Gsj7YbsSLMBnJfHfvudZJWKdL+VQdFb/eT7tF4gFwDRU
         YVc6jRITni9k8BaV5ugOppUF+18+E3ftRsXWQnu/Ba9bnyUD8EdZMeJUaAulTzV9PNaQ
         gwiiTv9rQbm4SVvn483bmLNBCD3GWvBCvPOJafz8MBwE3pIGEoBJUs+NTkgkP1ROxotV
         4Jeg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778831977; x=1779436777; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj5jvFEFmH+xjzvdxI8gC16245Xuwn0Bz0BnEbU1mKU=;
        b=fZxBV3fr0snY3lBzPbBThAgAJnr11kuAL8KqsVya+L3xnY8rHyASFZlgY83C7NwOLd
         WA7c0UdQmetTM9dnGTmK+dlukuOf24O1vCjyEUx4nvfqp4Inh1OIdfDGsSOFzrfyw/Da
         Xv9Zes/nwincbZbi4XIWcf19os4Y2O/KIqi/XASHE18eg60RVfrKrdPW05rFEHx1NQr0
         bHXQWwSvCF0BBG68lZ73SI7t2twRorDyun5ktQusWtyFSvTuTOfhdURBzh8HnVdxzxhA
         BD9Nr/seced+W9ZYP6n+5dsXtOXZkRcd2CHT3mmPCnsOec3It6Zqo9SrKxMYjccBDAl5
         8X7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831977; x=1779436777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aj5jvFEFmH+xjzvdxI8gC16245Xuwn0Bz0BnEbU1mKU=;
        b=FCaZxBDrZcnGA/9If3n9+ILjy9UMu8kCpkgOdH14o5SaqeyFwFTNgz1aKBWk1K3Vly
         2wn3jpJiZvFSsCZcp2IZxjxFkSHRwMQ6r85MdtDhljJazEnV7yvDDYIa6un2lDRugx6x
         /hdrhmoFU4E+vTjvY0SX5Lb7ZYgYiyZzrgH4A44JJ3rTj3oSGnzw5FZrBr5rGlxC+qPT
         iHYwyp409LnuXcBKjzbbeCaWmnFdyWJSy2MRL8jD00dh+prmQIBRJcHZKq+vnE1I/E9S
         y0HTf493AnZ7K9spKQFqfBF2n78eTsNHDEHG4jqzmBJaLnFBc1ZgnwnNCWpSaNmJA600
         nJIg==
X-Gm-Message-State: AOJu0YyqbP9XWohGaXS0dztNNwxn4lkWob9j04Sm0l7tzcmZgSO73EXJ
	o6BckC39uqsDSBhhoGbA5u/zO5kfkVokL1q1uOtRt0AF8mCIC3j/gRq9aiUdgeuHf2DgUWwRPUY
	S3Z97VL0KW/Kx5NE7caKK4mClsYahoo0=
X-Gm-Gg: Acq92OE3p9Abf1h5nLNbEheoWC6N7tw2Sw25L75fB3fcLQXDDlFQHjJrZHIh3JmhVCr
	l41q3tMdyMEvRqgm3ynOqbjd5oAM9sNRVOXXE2DYgzQWHHMZVa4SaatfvqiV7UfSaQdghlmWF0p
	7PECj/rs6Sog7xV/5lyJvk4DCjWIhBikBzCwYOjgaQc8Bda7ZTtzSLFnL0t2u5aGaGMwzssd1WH
	CQSLHgSK41fSkiSIhey3uS1w/O7ni3JScCBSzlHdSSbaS+XPmZ4vLekY/kqUfE5AF7X2mxFZwen
	ccbl
X-Received: by 2002:a05:6512:3c97:b0:5a8:57de:e6c1 with SMTP id
 2adb3069b0e04-5aa0e73ca79mr821694e87.7.1778831976680; Fri, 15 May 2026
 00:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <613c8d67a66924ea62c2436dac14708d939f6784.1778605274.git.mykola_kvach@epam.com>
 <8E531A25-5AB5-41CD-AB61-C426C58C8E1C@arm.com>
In-Reply-To: <8E531A25-5AB5-41CD-AB61-C426C58C8E1C@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 15 May 2026 10:59:24 +0300
X-Gm-Features: AVHnY4JzqS1e-GDRhrtCpflAyrSxxjQjzE7jFpqNOb8CSWUw8EOHczoJG15eeNQ
Message-ID: <CAGeoDV8aKWLKVZN1oz4cUoaZbXX39q4gHgOp=w=0zPhhaN311A@mail.gmail.com>
Subject: Re: [PATCH v9 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1778831977-88D76A53-50F340EA/0/0
X-purgate-type: clean
X-purgate-size: 5207
X-Rspamd-Queue-Id: 8283354AF3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[9];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Luca,

Thank you for the detailed review.

On Wed, May 13, 2026 at 5:09=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
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
> > +            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j=
 * 4);
>
> apologies for spotting these only now, in case gicv2_info.nr_lines is 102=
0,
> here and below for GICD_ITARGETSR we are going to save also IDs 1020-1023
> which are reserved.
>
> Could we assume irqs->ipriorityr and irqs->itargetsr have the same size a=
nd implement
> some cap logic which might cap the last loop (eventually):
>
>     for ( i =3D 0; i < blocks; i++ )
>     {
>         struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
>         size_t j, off =3D i * sizeof(irqs->isenabler);
>         size_t nr_regs =3D ARRAY_SIZE(irqs->ipriorityr);
>
>         if ( i =3D=3D blocks - 1 )
>             nr_regs =3D DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
>
>         [=E2=80=A6]
>
>         off =3D i * sizeof(irqs->ipriorityr);
>         for ( j =3D 0; j < nr_regs; j++ )
>             writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j * =
4);
>
>         /*
>          * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
>          * they are read-only on multiprocessor implementations and RAZ/W=
I
>          * on uniprocessor implementations.
>          */
>         if ( i )
>         {
>             off =3D i * sizeof(irqs->itargetsr);
>             for ( j =3D 0; j < nr_regs; j++ )
>                 writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j =
* 4);
>         }
>
>         [=E2=80=A6]
>     }

This was intentional to keep the logic simpler.

For the 1020-interrupt case, the extra word would correspond to
interrupt IDs 1020-1023. My reading of ARM IHI 0048B.b is that this
is architecturally harmless: section 4.1.2 says that reserved
Distributor register addresses are RAZ/WI, and Table 4-1 marks
GICD_IPRIORITYR offset 0x7fc and GICD_ITARGETSR offset 0xbfc as
Reserved.

Would you be OK with keeping this as-is, or would you prefer me to add
the cap logic anyway?

>
> > +
> > +        /*
> > +         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to sav=
e:
> > +         * they are read-only on multiprocessor implementations and RA=
Z/WI
> > +         * on uniprocessor implementations.
> > +         */
> > +        if ( i )
> > +        {
> > +            off =3D i * sizeof(irqs->itargetsr);
> > +            for ( j =3D 0; j < ARRAY_SIZE(irqs->itargetsr); j++ )
> > +                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off +=
 j * 4);
> > +        }
> > +
> > +        off =3D i * sizeof(irqs->icfgr);
> > +        for ( j =3D 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> > +            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
>
> in the GICv2 specs the usage constraints
> of GICD_ICFGR says: =E2=80=9CBefore changing the value of a programmable =
Int_config field,
> software must disable the corresponding interrupt, otherwise GIC behavior=
 is
> UNPREDICTABLE"
>
> ARM IHI 0048B.b, 4.3.13.
>
> I think we should move this restore just after GICD_ICENABLER write, befo=
re writing
> GICD_ISENABLER.

Good catch, I agree.

I will move the GICD_ICFGR restore after the GICD_ICENABLER writes
and before restoring GICD_ISENABLER, so that programmable Int_config
fields are restored while the corresponding interrupts are disabled.

I will also check whether it makes sense to move the other
configuration restores before GICD_ISENABLER as well. The spec does
not seem to impose the same strict requirement there, but keeping all
configuration restores before re-enabling the interrupts might make
the ordering clearer.

>
> And also the section says that the GICD_ICFGR0 is read-only.

For GICD_ICFGR0, my intention was to keep the restore loop uniform.
There should be no useful SGI state to restore here: section 4.3.13
says that SGI Int_config[1] is not programmable and RAO/WI, while
Int_config[0] is reserved. Also, the value written is the value
previously read from the same register.

So I do not expect this write to affect the architected SGI
configuration. However, if you prefer avoiding the write to
GICD_ICFGR0 explicitly, I will skip it in the next version of
this series.

Best regards,
Mykola

