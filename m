Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBL6D+ZJxmmIIQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 10:12:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A392C3418D7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 10:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265239.1556257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w63EF-0001Mi-0m; Fri, 27 Mar 2026 09:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265239.1556257; Fri, 27 Mar 2026 09:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w63EE-0001Kt-UB; Fri, 27 Mar 2026 09:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1265239;
 Fri, 27 Mar 2026 09:11:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w63EC-0001Kn-Ue
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 09:11:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w63EC-007WLY-As
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:11:40 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c649b9-2eae-0a2a0a5409dd-0a2a4505b002-40
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 10:11:40 +0100
Received: from [209.85.208.170] (helo=mail-lj1-f170.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c649cb-5aeb-0a2a45050019-d155d0aaadb4-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 10:11:40 +0100
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-38a23dd61c1so15009271fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 02:11:40 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774602699; cv=none;
        d=google.com; s=arc-20240605;
        b=O0KzzXAM4rCUBmdkzzIo+Qy81UZjvhRhm4a+LL5w+pg8GQYbdB1MJISfbuPZeDKLob
         ULfU9l4JF3fMhN+pU33yDJzfnP/xyUp/Uxc283ECE/53XPMpQRONf6S5a/nPvkiYEbKQ
         QRh92Sw8/HpUlsUTc1KaBwL7EeIDZvVJExpv8PsCqGrFn4wF2qRqJQ9Ynk/N5EuS2SCk
         gRCfMpEoGklMLqpcWoBY5nPyiJAAxqHWGCtG6GzFncK1/v8bgij/s13OzXKAJIJStoCL
         /3A8dTaNpStkPTCFQSDeFDobol7tLraktmdsat4zy3Sj5NGQXJchXA8wS2QhDC7nV/hk
         lH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KQML13fyfgAorc0tVFiOps1RwCyueKtabRMPDC/JYrY=;
        fh=GcAnV04oVU2HKEblD282Gh+CXQ2cxEXfEru6Er11u4o=;
        b=StctDlTMkJUDNfKzln1q0n02R9Byn8X/Kj/foi6agx2Kx8bCTE2Of1NQdXiRRWudR+
         uVKSKMq62yUGYNVCPinoRXs3/monbs0sZ2tOwYfl2Af7R5KIVoPXu2q7g+tXtoS6OA8W
         RYQePVQhoQczyNptxHl2JnPXFNWp1UiYt0cbQSfdAZTtkg4216sNjeE5WyfPQoqZwhQ4
         +5lLQgdrZVjX4qhiShSSY+OWf8ZCdDSONp5zZ7NWzcevozZMHy7yjgsj2O9jPJpU5bN1
         3ymKaCV9g8Mwe/vCvQyh23Pkk2zyFu2yxdLP3Z/n/v58Slplf1QWgTpGcjMXI9U40+ue
         bkyA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602699; x=1775207499; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQML13fyfgAorc0tVFiOps1RwCyueKtabRMPDC/JYrY=;
        b=ObZU6+NIB1Sn+euYiHSBtkoIfmStj8hIytxsFk9aJAbB42Lkbj+avQ5kWz7f6Vp0gi
         deA9ckijVWHgjtqVTAWzKXEz4+sy+VVPeL9sL6ePg4nf+pZ+zV2gt3VHGXUb618U9cRK
         nIumOcFmIcaTaH6/TXzw8Gdvi8+0XNcZvB6qPzYRzrXDtmPV8lMlvRqzN7edD691ZcGw
         cyAL913YvQVa/V5uH4o3NRIe4aDuNYDMCRcIPBNVKHNiROgnhP7l71BNd3yXJiZtZDQC
         x9Ezk4u9+y+HXtLRKu6VuYgDBjt9dx4f+QSKauYMkc5IC+Tf19GcQroMiPUl151bqSEB
         xD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602699; x=1775207499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KQML13fyfgAorc0tVFiOps1RwCyueKtabRMPDC/JYrY=;
        b=c83vXtKJeF5fhjL0Uez9F0GO9OssBk79Lm8lHFqzZm8p+gIsRKa+ntvm9cHKgKLRu7
         ktsPD75cwHbgAVKPiUQDCHT8/Hh3nKHQ2hWCYJ9oLPl+9fpQmMJ8qDK/2IezcEv89iMj
         0RLXCj/h1j5b8ztkZ35WvzZOdKIXGRb13yXm/boHue4hs8TV7ydrdmcWy4qeeDtGiQSc
         /pAljUIWMuhna+tg/KPSUgUdeNlW71nhDv+dcgEAO0nv+eREvfS7a4OKvBDj9KmAdhMh
         2u3NssY00BoVTHnecp5D1TaS035vMCO9cJ/4nXfJoJle55jXrp2Dayu0z1kZADFSvssq
         Bz0w==
X-Gm-Message-State: AOJu0Yy4/Kn4i/s9gwoaswN42D+4mRsXt/jQZNGa7bpmhpVBuVrJx75t
	mkkRYKeGpLoa1rDLbdv0KuleIAp/VnbnnQgcCsVoZ9y8pPfAbPrJgGfyf4cekTaStL46M/sVWb0
	0dJ3hrjhpzPtaxKn1jVNtav/ZRoeKAic=
X-Gm-Gg: ATEYQzxE1lA+s12CjsucAokXeJxLI3d1JMmQfJ3u1Z1mTTiS7sQIBjKWdSIEd5rQ9zu
	wXK3no4qo2wqOVTNkEM1aaCl5C2AAvTtd6VsWKY0/rEsr1e17javOSGz3Md2ei353czDJVoclKx
	agl1n0ULtBkC7dOoAtwG4at8Y/WZkusHkaf7EAF4QwBW7duc94u8FGYWdk/IW3QcyGIr73JoAi8
	N0XRIWA5SYMdnEOSWUR5e6WPS/YZ8Llb6lI/L6lVCy1P7dPAKnn672WGb3nXFeJs6gLXOf0xeO0
	ovOe
X-Received: by 2002:a2e:a00d:0:b0:38c:59a9:d536 with SMTP id
 38308e7fff4ca-38c74028a0amr4353691fa.26.1774602698960; Fri, 27 Mar 2026
 02:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1765472890.git.mykola_kvach@epam.com> <58c1873d355f5ea9b5182349895905d25cb57256.1765472890.git.mykola_kvach@epam.com>
 <c5466813-7436-4e24-b14a-24374d6a2c68@gmail.com>
In-Reply-To: <c5466813-7436-4e24-b14a-24374d6a2c68@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 27 Mar 2026 11:11:26 +0200
X-Gm-Features: AQROBzBXSP3M8Ym4qBUfuqigJw3iSO5nFiqZmtjmSOHbByaD-g9K9_nHct7djfQ
Message-ID: <CAGeoDV8krzHDWuJmBvDZkiomgsEynAq5qGQRzX7kQyVvXvvygg@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] arm/smmu-v3: add suspend/resume handlers
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1774602700-83347488-25D9FD76/0/0
X-purgate-type: clean
X-purgate-size: 13279
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A392C3418D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksandr,

Thank you for the review.

On Sat, Jan 31, 2026 at 7:42=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 11.12.25 20:43, Mykola Kvach wrote:
>
> Hello Mykola
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Before we suspend SMMU, we want to ensure that all commands (especially
> > ATC_INV) have been flushed by the CMDQ, i.e. the CMDQs are empty.
> >
> > The suspend callback configures the SMMU to abort new transactions,
> > disables the main translation unit and then drains the command queue
> > to ensure completion of any in-flight commands.
> >
> > The resume callback performs a full device reset via 'arm_smmu_device_r=
eset'
> > to bring the SMMU back to an operational state.
> >
> > Link: https://lore.kernel.org/linux-iommu/20251117191433.3360130-1-praa=
n@google.com   /
> > Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >   xen/drivers/passthrough/arm/smmu-v3.c | 170 ++++++++++++++++++++-----=
-
> >   1 file changed, 134 insertions(+), 36 deletions(-)
> >
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index bf153227db..10c4c5dee0 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -1814,8 +1814,7 @@ static int arm_smmu_write_reg_sync(struct arm_smm=
u_device *smmu, u32 val,
> >   }
> >
> >   /* GBPA is "special" */
> > -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> > -                                       u32 set, u32 clr)
> > +static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set,=
 u32 clr)
> >   {
> >       int ret;
> >       u32 reg, __iomem *gbpa =3D smmu->base + ARM_SMMU_GBPA;
> > @@ -1995,10 +1994,29 @@ err_free_evtq_irq:
> >       return ret;
> >   }
> >
> > +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> > +{
> > +     int ret;
> > +     u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> > +
> > +     if ( smmu->features & ARM_SMMU_FEAT_PRI )
> > +             irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > +
> > +     /* Enable interrupt generation on the SMMU */
> > +     ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > +                                   ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTR=
LACK);
> > +     if ( ret )
> > +     {
> > +             dev_warn(smmu->dev, "failed to enable irqs\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> >   {
> >       int ret, irq;
> > -     u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> >
> >       /* Disable IRQs first */
> >       ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> > @@ -2028,22 +2046,7 @@ static int __init arm_smmu_setup_irqs(struct arm=
_smmu_device *smmu)
> >               }
> >       }
> >
> > -     if (smmu->features & ARM_SMMU_FEAT_PRI)
> > -             irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > -
> > -     /* Enable interrupt generation on the SMMU */
> > -     ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > -                                   ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTR=
LACK);
> > -     if (ret) {
> > -             dev_warn(smmu->dev, "failed to enable irqs\n");
> > -             goto err_free_irqs;
> > -     }
> > -
> >       return 0;
> > -
> > -err_free_irqs:
> > -     arm_smmu_free_irqs(smmu);
> > -     return ret;
> >   }
> >
> >   static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> > @@ -2057,7 +2060,7 @@ static int arm_smmu_device_disable(struct arm_smm=
u_device *smmu)
> >       return ret;
> >   }
> >
> > -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> >   {
> >       int ret;
> >       u32 reg, enables;
> > @@ -2163,17 +2166,9 @@ static int __init arm_smmu_device_reset(struct a=
rm_smmu_device *smmu)
> >               }
> >       }
> >
> > -     ret =3D arm_smmu_setup_irqs(smmu);
> > -     if (ret) {
> > -             dev_err(smmu->dev, "failed to setup irqs\n");
> > +     ret =3D arm_smmu_enable_irqs(smmu);
> > +     if ( ret )
> >               return ret;
> > -     }
> > -
> > -     /* Initialize tasklets for threaded IRQs*/
> > -     tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu=
);
> > -     tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu=
);
> > -     tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_t=
asklet,
> > -                              smmu);
> >
> >       /* Enable the SMMU interface, or ensure bypass */
> >       if (disable_bypass) {
> > @@ -2181,20 +2176,16 @@ static int __init arm_smmu_device_reset(struct =
arm_smmu_device *smmu)
> >       } else {
> >               ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> >               if (ret)
> > -                     goto err_free_irqs;
> > +                     return ret;
> >       }
> >       ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> >                                     ARM_SMMU_CR0ACK);
> >       if (ret) {
> >               dev_err(smmu->dev, "failed to enable SMMU interface\n");
> > -             goto err_free_irqs;
> > +             return ret;
> >       }
> >
> >       return 0;
> > -
> > -err_free_irqs:
> > -     arm_smmu_free_irqs(smmu);
> > -     return ret;
> >   }
> >
> >   static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> > @@ -2558,10 +2549,23 @@ static int __init arm_smmu_device_probe(struct =
platform_device *pdev)
> >       if (ret)
> >               goto out_free;
> >
> > +     ret =3D arm_smmu_setup_irqs(smmu);
> > +     if ( ret )
> > +     {
> > +             dev_err(smmu->dev, "failed to setup irqs\n");
> > +             goto out_free;
> > +     }
> > +
> > +     /* Initialize tasklets for threaded IRQs*/
> > +     tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu=
);
> > +     tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu=
);
> > +     tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_t=
asklet,
> > +                             smmu);
> > +
> >       /* Reset the device */
> >       ret =3D arm_smmu_device_reset(smmu);
> >       if (ret)
> > -             goto out_free;
> > +             goto out_free_irqs;
> >
> >       /*
> >        * Keep a list of all probed devices. This will be used to query
> > @@ -2575,6 +2579,8 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> >
> >       return 0;
> >
> > +out_free_irqs:
> > +     arm_smmu_free_irqs(smmu);
> >
> >   out_free:
> >       arm_smmu_free_structures(smmu);
> > @@ -2855,6 +2861,94 @@ static void arm_smmu_iommu_xen_domain_teardown(s=
truct domain *d)
> >       xfree(xen_domain);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +static int arm_smmu_suspend(void)
> > +{
> > +     struct arm_smmu_device *smmu;
> > +     int ret =3D 0;
> > +
> > +     list_for_each_entry(smmu, &arm_smmu_devices, devices)
> > +     {
> > +             /* Abort all transactions before disable to avoid spuriou=
s bypass */
> > +             ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > +             if ( ret )
> > +                     goto fail;
> > +
> > +             /* Disable the SMMU via CR0.EN and all queues except CMDQ=
 */
> > +             ret =3D arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMM=
U_CR0,
> > +                                     ARM_SMMU_CR0ACK);
> > +             if ( ret )
> > +             {
> > +                     dev_err(smmu->dev, "Timed-out while disabling smm=
u\n");
> > +                     goto fail;
> > +             }
> > +
> > +             /*
> > +              * At this point the SMMU is completely disabled and won'=
t access
> > +              * any translation/config structures, even speculative ac=
cesses
> > +              * aren't performed as per the IHI0070 spec (section 6.3.=
9.6).
> > +              */
> > +
> > +             /* Wait for the CMDQs to be drained to flush any pending =
commands */
> > +             ret =3D queue_poll_cons(&smmu->cmdq.q, true, 0);
>
> I wonder, why ignoring ARM_SMMU_FEAT_SEV in suspend? In the runtime
> function __arm_smmu_cmdq_issue_sync(), the driver checks if the SMMU
> supports ARM_SMMU_FEAT_SEV and passes this flag to queue_poll_cons().
> However, here, this check is missing, and the wfe argument is hardcoded
> to 0.

Good catch, that's an oversight on my side. The suspend path should indeed
use the same SEV/WFE handling as the runtime CMD_SYNC path instead of
hardcoding wfe =3D 0. I'll switch this to pass
!!(smmu->features & ARM_SMMU_FEAT_SEV) to queue_poll_cons().

>
>
> > +             if ( ret )
> > +             {
> > +                     dev_err(smmu->dev, "Draining queues timed-out\n")=
;
> > +                     goto fail;
> > +             }
> > +
> > +             /* Disable everything */
> > +             ret =3D arm_smmu_device_disable(smmu);
> > +             if ( ret )
> > +                     goto fail;
> > +
> > +             dev_dbg(smmu->dev, "Suspended smmu\n");
> > +     }
> > +
> > +     return 0;
> > +
> > + fail:
> > +     {
> > +             int rc;
> > +
> > +             /* Reset the device that failed as well as any already-su=
spended ones. */
> > +             rc =3D arm_smmu_device_reset(smmu);
> > +             if ( rc )
> > +                     dev_err(smmu->dev, "Failed to reset during resume=
 operation: %d\n", rc);
> > +
> > +             list_for_each_entry_continue_reverse(smmu, &arm_smmu_devi=
ces, devices)
> > +             {
> > +                     rc =3D arm_smmu_device_reset(smmu);
> > +                     if ( rc )
> > +                             dev_err(smmu->dev, "Failed to reset durin=
g resume operation: %d\n", rc);
> > +             }
>
> NIT: Could this duplicated reset call (and error message) be optimized
> somehow? Maybe, by using a do-while loop to manually walk back up the
> list from the current SMMU to the head, but not sure.

Yes, that can be cleaned up. The duplicated reset + error reporting is just
rollback boilerplate, so I'll fold it into a small helper and reuse it for
the failing SMMU and the reverse walk over the already-suspended ones.
That should also let me fix the misleading "during resume operation"
wording in this suspend rollback path.

>
>
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static void arm_smmu_resume(void)
> > +{
> > +     int ret;
> > +     struct arm_smmu_device *smmu;
> > +
> > +     list_for_each_entry(smmu, &arm_smmu_devices, devices)
> > +     {
> > +             dev_dbg(smmu->dev, "Resuming device\n");
> > +
> > +             /*
> > +             * The reset will re-initialize all the base addresses, qu=
eues,
> > +             * prod and cons maintained within struct arm_smmu_device =
as well as
> > +             * re-enable the interrupts.
> > +             */
> > +             ret =3D arm_smmu_device_reset(smmu);
> > +             if ( ret )
> > +                     dev_err(smmu->dev, "Failed to reset during resume=
 operation: %d\n", ret);
>
> In your GICv3 ITS patch, a failure during resume triggers a panic(), but
> here only an error message that might go unnoticed. May I please ask,
> why such diverging? The IOMMU is as critical as the Interrupt
> Controller. I see that you configure Abort state during suspend, so if I
> understand the things correctly - if the SMMU fails to reset (e.g.,
> remains in GBPA_ABORT), all DMA for for any passed-through devices
> behind it will be blocked after resuming.

Fair point. Logging only is too weak here. Unlike the suspend failure path,
resume has no recovery path, and iommu_ops.resume() currently cannot
propagate an error upwards. If arm_smmu_device_reset() fails, the SMMU may
remain unusable after resume (for example, with transactions still aborted
or translation disabled), which can silently break DMA for devices behind
it. I will therefore treat a resume reset failure as fatal rather than
just logging it.


Best regards,
Mykola

>
>
> > +     }
> > +}
> > +#endif
> > +
> >   static const struct iommu_ops arm_smmu_iommu_ops =3D {
> >       .page_sizes             =3D PAGE_SIZE_4K,
> >       .init                   =3D arm_smmu_iommu_xen_domain_init,
> > @@ -2867,6 +2961,10 @@ static const struct iommu_ops arm_smmu_iommu_ops=
 =3D {
> >       .unmap_page             =3D arm_iommu_unmap_page,
> >       .dt_xlate               =3D arm_smmu_dt_xlate,
> >       .add_device             =3D arm_smmu_add_device,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +     .suspend                =3D arm_smmu_suspend,
> > +     .resume                 =3D arm_smmu_resume,
> > +#endif
> >   };
> >
> >   static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>

