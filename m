Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCVNIYsL+mlsIgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:23:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE964D0246
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300812.1575277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKHce-0003J4-K1; Tue, 05 May 2026 15:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300812.1575277; Tue, 05 May 2026 15:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKHce-0003HE-Gu; Tue, 05 May 2026 15:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1300812;
 Tue, 05 May 2026 15:23:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKHcd-0003H8-Bj
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:23:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKHcc-00H1Tz-Ov
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 17:23:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fa0b56-bab6-0a2a0a5309dd-0a2a4506c922-42
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:23:42 +0200
Received: from [209.85.208.170] (helo=mail-lj1-f170.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fa0b7e-7371-0a2a45060019-d155d0aad4b5-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:23:42 +0200
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3922b35e69cso45595741fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:23:42 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777994622; cv=none;
        d=google.com; s=arc-20240605;
        b=V1/yl2kwNBL6msYMjex6OvdJ11LCAuT+GPUejXZ7T9e88b2qrFv78vdYkVNDflmzFG
         wyBnvKsUvMoT/0C80Z+kBkLb6wC/KjEyZGh6wfyfyOR6eX+EviMvFStXePFjpAmmhIp2
         G3U12AxPuDsbQ/+9s9YK1xRO+w7Fy+vWv35L8jpAsyMMCchPwiAQIk+X/eY+91H+ZcuG
         SBae+iNo+krXudmy4RQUvP+aSwVLHDoXOsJ+UQBEq4/YXR6ittMhfoLeMUV2ki1q47ds
         Obyorq9wDn4WWXAXm/ArllO6opLqoDlHVupTLhUs6zNh6Xg2OmZ1Kmo392dTZOBfKZmM
         TkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wMRiOKPRyEcaHZOOkpd9/VztiqgN92b+wRpsUBVO2Qw=;
        fh=jXKZth/5dXfK4eyQ3th9VcbDCKu2IJKxdxWeypBGkUc=;
        b=baPGUZB55y1TtnPt/5Ea+Bzl/Eu8qMudyQwzbVLHoUZJFa76Iosk8Nj/GV31SFXJ17
         LhjRndJHj3q4CTJNYbFgCJrgyMQ1VkrPuL5TFPo6nkKaCNg/3DFRB1BuQr4AS5OKQUXW
         4OeeldPdVwVGViBdy1+umWa1D3H9+fGci/AM5sdPsL+eNld/MjOC8u3/8nSmJmSZ2NJn
         JePOodlPfiU4nR1SdicTB8c6fsixt/81wJMJoZ/giZIyHJJBDTyAjU1JOmECAp3h1LhW
         0dZ66Rs5RGpl/eWvzdQQfStcrOdPjigihL/5s+KrgNeSz56Eul9pQH7KXXsEJVsrdf1V
         vD+w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777994622; x=1778599422; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMRiOKPRyEcaHZOOkpd9/VztiqgN92b+wRpsUBVO2Qw=;
        b=XgruQDVCnrd1sAifQle04NylrnIGdqCJDngfAfsDIM8lSb33WO7A0IiJf4jdpbVNcK
         tkUejBNiJK8mJ/ZDd1Z+vNH+9mw0CM3hoikx7Gd/76x+ezsODLFazovY99PZJaeixZID
         4T5lDvdGYp7nBn5XHs7kmgR0n+nLSi8Cbs1gMS27CDfrly74BV++kq4JAZqDH+eBG67Q
         dGfKcRXxFLNGA0xfWtZmek447U17A+C5dsW0GO3ZSeN1+pRvdXNQCqBvNu5lSplv43Mu
         rR7tU1GAlgWoCHG4sp0SDFusvj6fpwCpnPhT2V+lc4usf2mONszAsHx1XKAOAyP7VdDT
         5GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777994622; x=1778599422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wMRiOKPRyEcaHZOOkpd9/VztiqgN92b+wRpsUBVO2Qw=;
        b=e3LjG7Ar8By5WoyqRLTQAU5TPYoTqBVSLI5KJGkWjwDRBmlp4svMuWpLCOlHKLJIRs
         t6Pu2t4AjtXaZjrGkHX1FeYejRqlXXZdl5hzBPq6zi0jV0GX6aQGBqs/XOKqJjLNDv+3
         KMdMPALyXI/AuqHRvH8xdkW3H2/hwu2NqDUZWOCFIiV65JJHUkP8t3hhlwsOyaIfbCEi
         ZtH533eHJ0rpQ++1j9eLlG1qtnrNy34P/AEz2azOf8u7/7wlmtQWrV5xEyJCzciIVK5T
         67bLgliiGF9M8h06av9gaiQssJXwxFiSQff04TCwN0Da/E+hcoy+A+PlnGICL1+883e3
         DH1Q==
X-Gm-Message-State: AOJu0YwaTRT78Au8drUXR7uxA7vzuN/irsuGcl+LfzdeG2Gbbzda5KYH
	1wc8hc1h2BZFiiyNmr2xYN0dEtbgxJbbu8q0mlP8ejSBD2eK35qsGzcs1htJcR3Fs4EeEsQ1KAz
	Zp86k+tuVGm/xar73VUxmRKKgsy8O426GXO6YDbQ=
X-Gm-Gg: AeBDievohqaegWANrMQ5/dB+MxDNlwe2Eu5/u3ZLd0eaW4ZcvB2Vs2Xs8ES7GnYw/GC
	LERh3FHyFV9s5qPvjcRHKxsQD/SekWc3ZskFgE5G+sKj2z9hPFMD2wDSKUYTs0MNxxaePBOlm7l
	FJmgk5pOqwSTh332PriINMohopVE2evc4KoQ+w2LjOxbl13kmEPwjGM2xalWGZWSIPWaZOGR5a6
	A1A3CTkP5Yz37/ZKTP4bqfpsTk8RJdFMAPId16fsYn4QSsPxyXQTXqU4JNDbs34s8u9GVI4nt0L
	//4oThdPbLtJIdhUo1orJwHA3PI=
X-Received: by 2002:a2e:a54b:0:b0:383:20cd:52fe with SMTP id
 38308e7fff4ca-393b4d47acemr14985801fa.17.1777994621480; Tue, 05 May 2026
 08:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
 <F5384D51-933E-48E6-AE7E-B54022AEAE11@arm.com>
In-Reply-To: <F5384D51-933E-48E6-AE7E-B54022AEAE11@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 18:23:28 +0300
X-Gm-Features: AVHnY4Lp8PLNiPSH_rXiXH9DXGfRY9OSOlaX6QNN69iV-sQmD-KYv1xHa12HpPs
Message-ID: <CAGeoDV907jTK5RsN51ezapA5inhvG1jWpeybbqF=LkxWcEGnbQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1777994622-53B7DD75-BCDF7250/0/0
X-purgate-type: clean
X-purgate-size: 9432
X-Rspamd-Queue-Id: EBE964D0246
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,mail.gmail.com:mid];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Luca,

Thank you for the review.

On Mon, Apr 27, 2026 at 5:03=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> >
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index bf153227db..7607ffc9ca 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -1814,8 +1814,7 @@ static int arm_smmu_write_reg_sync(struct arm_smm=
u_device *smmu, u32 val,
> > }
> >
> > /* GBPA is "special" */
> > -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> > -                                       u32 set, u32 clr)
> > +static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set,=
 u32 clr)
> > {
> > int ret;
> > u32 reg, __iomem *gbpa =3D smmu->base + ARM_SMMU_GBPA;
> > @@ -1995,10 +1994,29 @@ err_free_evtq_irq:
> > return ret;
> > }
> >
> > +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> > +{
> > + int ret;
> > + u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> > +
> > + if ( smmu->features & ARM_SMMU_FEAT_PRI )
> > + irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > +
> > + /* Enable interrupt generation on the SMMU */
> > + ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > +      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> > + if ( ret )
> > + {
> > + dev_warn(smmu->dev, "failed to enable irqs\n");
> > + return ret;
> > + }
> > +
> > + return 0;
> > +}
> > +
> > static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> > {
> > int ret, irq;
> > - u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> >
> > /* Disable IRQs first */
> > ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> > @@ -2028,22 +2046,7 @@ static int __init arm_smmu_setup_irqs(struct arm=
_smmu_device *smmu)
> > }
> > }
> >
> > - if (smmu->features & ARM_SMMU_FEAT_PRI)
> > - irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > -
> > - /* Enable interrupt generation on the SMMU */
> > - ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > -      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> > - if (ret) {
> > - dev_warn(smmu->dev, "failed to enable irqs\n");
> > - goto err_free_irqs;
> > - }
> > -
> > return 0;
> > -
> > -err_free_irqs:
> > - arm_smmu_free_irqs(smmu);
> > - return ret;
> > }
> >
> > static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> > @@ -2057,7 +2060,7 @@ static int arm_smmu_device_disable(struct arm_smm=
u_device *smmu)
> > return ret;
> > }
> >
> > -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > {
> > int ret;
> > u32 reg, enables;
> > @@ -2163,17 +2166,9 @@ static int __init arm_smmu_device_reset(struct a=
rm_smmu_device *smmu)
> > }
> > }
> >
> > - ret =3D arm_smmu_setup_irqs(smmu);
> > - if (ret) {
> > - dev_err(smmu->dev, "failed to setup irqs\n");
>
> We are moving this one to the probe and ..
>
> > + ret =3D arm_smmu_enable_irqs(smmu);
> > + if ( ret )
>
> changing with this one, but arm_smmu_setup_irqs() also calls arm_smmu_set=
up_unique_irqs() which
> calls arm_smmu_setup_msis(), are we sure that on resume we will get the s=
ame state?

This follows the split introduced in the Linux arm-smmu-v3 runtime/system s=
leep
series:

https://lore.kernel.org/linux-iommu/20260414194702.1229094-1-praan@google.c=
om/

The intent is to keep IRQ handler registration as one-time probe state, whi=
le
reset/resume only restores the SMMU hardware state and re-enables interrupt
generation.

You are right that the MSI case needs extra care. In the Linux series this =
is
handled by arm_smmu_resume_msis(), which restores the SMMU-side MSI
configuration. I did not port that part in this patch because Xen SMMUv3 MS=
I
support is currently documented as unsupported and is not part of the
supported/tested path, so this patch only covers the wired IRQ path used by=
 Xen
today.

If Xen SMMUv3 MSI support becomes usable in the future, the resume path wil=
l
need an equivalent MSI restore step before IRQ_CTRL is re-enabled.

I will add a code comment and update the commit message to make this scope
explicit. I also noticed that I accidentally dropped the reference to Pranj=
al's
Linux series while reworking the patch; I will restore the Link/attribution=
 in
the next version.

>
> > return ret;
> > - }
> > -
> > - /* Initialize tasklets for threaded IRQs*/
> > - tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> > - tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> > - tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_taskl=
et,
> > - smmu);
> >
> > /* Enable the SMMU interface, or ensure bypass */
> > if (disable_bypass) {
> > @@ -2181,20 +2176,16 @@ static int __init arm_smmu_device_reset(struct =
arm_smmu_device *smmu)
> > } else {
> > ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> > if (ret)
> > - goto err_free_irqs;
> > + return ret;
> > }
> > ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> >     ARM_SMMU_CR0ACK);
> > if (ret) {
> > dev_err(smmu->dev, "failed to enable SMMU interface\n");
> > - goto err_free_irqs;
> > + return ret;
> > }
> >
> > return 0;
> > -
> > -err_free_irqs:
> > - arm_smmu_free_irqs(smmu);
> > - return ret;
> > }
> >
> > static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> > @@ -2558,10 +2549,23 @@ static int __init arm_smmu_device_probe(struct =
platform_device *pdev)
> > if (ret)
> > goto out_free;
> >
> > + ret =3D arm_smmu_setup_irqs(smmu);
> > + if ( ret )
> > + {
> > + dev_err(smmu->dev, "failed to setup irqs\n");
> > + goto out_free;
> > + }
> > +
> > + /* Initialize tasklets for threaded IRQs*/
> > + tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> > + tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> > + tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_taskl=
et,
> > + smmu);
> > +
> > /* Reset the device */
> > ret =3D arm_smmu_device_reset(smmu);
> > if (ret)
> > - goto out_free;
> > + goto out_free_irqs;
> >
> > /*
> > * Keep a list of all probed devices. This will be used to query
> > @@ -2575,6 +2579,8 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> >
> > return 0;
> >
> > +out_free_irqs:
> > + arm_smmu_free_irqs(smmu);
> >
> > out_free:
> > arm_smmu_free_structures(smmu);
> > @@ -2855,6 +2861,96 @@ static void arm_smmu_iommu_xen_domain_teardown(s=
truct domain *d)
> > xfree(xen_domain);
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device=
 *smmu)
> > +{
> > + int ret =3D arm_smmu_device_reset(smmu);
> > +
> > + if ( ret )
> > + dev_err(smmu->dev, "Failed to reset during suspend rollback: %d\n",
> > + ret);
> > +}
> > +
> > +static int arm_smmu_suspend(void)
> > +{
> > + struct arm_smmu_device *smmu;
> > + int ret =3D 0;
> > +
> > + list_for_each_entry(smmu, &arm_smmu_devices, devices)
> > + {
> > + bool wfe =3D !!(smmu->features & ARM_SMMU_FEAT_SEV);
> > +
> > + /* Abort all transactions before disable to avoid spurious bypass */
> > + ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > + if ( ret )
> > + goto fail;
> > +
> > + /* Disable the SMMU via CR0.EN and all queues except CMDQ */
> > + ret =3D arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
> > + ARM_SMMU_CR0ACK);
> > + if ( ret )
> > + {
> > + dev_err(smmu->dev, "Timed-out while disabling smmu\n");
> > + goto fail;
> > + }
> > +
> > + /*
> > + * At this point the SMMU is completely disabled and won't access
> > + * any translation/config structures, even speculative accesses
> > + * aren't performed as per the IHI0070 spec (section 6.3.9.6).
> > + */
> > +
> > + /* Wait for the CMDQs to be drained to flush any pending commands */
> > + ret =3D queue_poll_cons(&smmu->cmdq.q, true, wfe);
> > + if ( ret )
> > + {
> > + dev_err(smmu->dev, "Draining queues timed-out\n");
> > + goto fail;
> > + }
>
> polling the queue doesn=E2=80=99t give you the assurance that all prior c=
ommands are complete,
> I would use arm_smmu_cmdq_issue_sync for that instead of the above.
>
> ret =3D arm_smmu_cmdq_issue_sync(smmu);
> if ( ret )
>    goto fail;

Yes, I agree.

Polling CONS only shows that the SMMU has consumed the CMDQ entries; it doe=
s
not provide the completion semantics we want here. I will replace the direc=
t
queue_poll_cons() in the suspend path with arm_smmu_cmdq_issue_sync(), whil=
e
CMDQ is still enabled, and update the comment/commit message accordingly.

Best regards,
Mykola

>
> > +
> > + /* Disable everything */
> > + ret =3D arm_smmu_device_disable(smmu);
> > + if ( ret )
> > + goto fail;
> > +
> > + dev_dbg(smmu->dev, "Suspended smmu\n");
> > + }
> > +
> > + return 0;
> > +
> > + fail:
> > + /* Reset the device that failed as well as any already-suspended ones=
. */
> > + arm_smmu_reset_for_suspend_rollback(smmu);
> > +
> > + list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices=
)
> > + arm_smmu_reset_for_suspend_rollback(smmu);
> > +
> > + return ret;
> > +}
> > +
>
> Cheers,
> Luca
>
>

