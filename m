Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLJ+EnhU+GnSswIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 10:10:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B059C4B9F13
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 10:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299563.1574101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoNi-0008Hc-Fs; Mon, 04 May 2026 08:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299563.1574101; Mon, 04 May 2026 08:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoNi-0008GB-CK; Mon, 04 May 2026 08:10:22 +0000
Received: by outflank-mailman (input) for mailman id 1299563;
 Mon, 04 May 2026 08:10:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wJoNh-0008G2-5q
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 08:10:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJoNg-007wsD-HL
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:10:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f8546c-5cb7-0a2a0a5109dd-0a2a450894ce-2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:10:20 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f8546c-63b5-0a2a45080019-d155a730b9d5-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:10:20 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a87782588cso194529e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 01:10:20 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777882220; cv=none;
        d=google.com; s=arc-20240605;
        b=d8ctxHhJZiANAcPK/4jYWehqxWggDWJKfFCrFqNj8iHmdn21lyNfBdWOLFg8kzzSmT
         Ang/MCRZCYYwQbPCRuk/+kvIUET6woQVNNOJEjgB2NqJUnrBuizA1IZIK+DwL1A2aseQ
         DLb7zHaPRPUlxCoq8WL/6MY9GSNXwmyKu8t+mO0zRh+odPIah32OFeE0/e+R5HTwHAEq
         TsyCCvsCo0uXXEh6XA+omnhfNaozvfHGAOSb+W53OZlEKglNuvpFabEPsY1Ey11Fyws3
         yasGTAr5nY38bNMgbR1rJKfEvFjZMUhZFNlLdGFwENv1w6HxQvqnfPdIPbfjEFmBjSqT
         Qzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zqMuJTjbYjXKX8muAXj/d6rJHV8iD5Yw7Jd6w7gmWcA=;
        fh=zL8KVAj6rSaYbk/102rEWeOa69wm5cw+i9nXMzeM8z8=;
        b=PvAX6k4wUiAGuDU5p708vqOy3vzFCc2pxyC8thmJY74736D31VpgLFCRSAV5JNwuCw
         r/H2cHOUNQ/NMY+EosJhBzNooTG64anyxnMT/4gX0JBKxtaKGqMs2mp2LoQC1mgzN5X6
         ZrjAne7MiwiSd/tJbKrGfj5IZjU5gvkfLIkurvlLlcGb0WeLnmL2bgKvjPtEhdH3k4kI
         VbfWOA76fltHYtrIAQPeYrSfL2uqiUGkXhOK5pGDL5uubRA8NuhCogARWF6daNKTLntJ
         CptG/KsdeL7roZTZJT5TeiEiaRavNLkM0ch3iPuCRT4sGyAq+jPXEHBbkHGcn996tDFZ
         gIhw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777882220; x=1778487020; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqMuJTjbYjXKX8muAXj/d6rJHV8iD5Yw7Jd6w7gmWcA=;
        b=FZGJ6spd3KvmTJqSWfCSozVxhRD/5gh43Bd+emHxcPtNY3uZ7ddp1hX+lsG4tyZ4GX
         RoFXj//VqJke96sN0f+ikSvrNRIhXl2ocGncZNJ0KOeydlBUqzXxXy7cHFJSyvF84It2
         SKjOJi9lPdrQ9Q5fQveEDqV+H+p6SfjINJX4NS2Ko4vISvtg3VH1N1JLBPgbyoQjoSwX
         LrZFXlHaqwUOiZ+rjnI3OHBe3UcZ3KcpLC3v4cZhBW1GME82jgygYr56cQs915Noc03+
         +gDGGqAK3MJv16AZHA8bq21oXGXvgpIBiWPnfA+369YybZY+kc7N1h3G0ERLqlV4FMFZ
         fCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882220; x=1778487020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zqMuJTjbYjXKX8muAXj/d6rJHV8iD5Yw7Jd6w7gmWcA=;
        b=RRELlScwImHzOi1ik2vZkplt/jijGJgAAV6cex19Lx5IwPO9YZ9xTEUzMBjx3CsIvw
         +9PxCWh2Alhhd5ZnkuA3txvWyXl+FpAP/Va7yrcEXax1KtHuw1nJ0KpiyrekOKqXmHOr
         hIsQgHOFXP44t2peWB2kqrntWKaiAoWZEmUiehyzW+bmEdPrLHjiIQPFHdOcMt86nmXX
         kVi8qiUrmKXaTcLSJ4FCV0zxmfUL0fOXhdEIDHDmjSA0def4ZcyXp1WjSWBVLaOBkAa+
         hKkd8smTCXWqHSMlcvJ/Br49Q03HtusTGFi4358a4yWtg2LD8vZX75S/2Ln9bd5LEPbi
         Jouw==
X-Gm-Message-State: AOJu0YyAxWpx2y4h+tpcMywqzH7pkeprp8qT0l0zgU3emOWlcC6aZHnT
	N8bSp9XvP7w7h5Bmjb75fHqhjZgEehEuR8Tv2c5qxYF+avL1b4nqQU+ODyY9nGgSvutqCTtASek
	afHVUay6ALaQPV9yOEKPZ3t/BTMT9fVE=
X-Gm-Gg: AeBDieuXZQQP9WdUkyyXNfKc3ocLfjOrvz0spV83aQPa371pWjc7Lub4MpIiMtnj2uQ
	L4lTxt2kLcJvVp5TRSbSK4tGgAlOeW90/2+rYjJDZdl7mQ8Mw5NypM0WS2Ca3z9Tid+aPTFPc1g
	wKU7v0LkxG0HF7soVY9e8Ruke8ZaCaUB6o7ogAYtP9xFIjx18pjF9TfnOrZKTTGh1LNXkESsQDv
	E+6ubyNX63WvgivchZqMakR+s1wvABj1Ldx254rbU8N/mRScB3+tcSL4jZuNDBPSnnM96rAMYFJ
	457cH7Z6+sN6iebf
X-Received: by 2002:a05:6512:2253:b0:5a4:17a6:9780 with SMTP id
 2adb3069b0e04-5a862fbcd27mr2405062e87.14.1777882219269; Mon, 04 May 2026
 01:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <18c5532816d852fca073d0552dcb6d497730a6c2.1777377278.git.mykola_kvach@epam.com>
 <59548223-99d7-4a11-ac81-39eee6474562@amd.com> <CAGeoDV_mjLPUD2m+hmKm3aEaG=Vc8hjW=YqbRmzBXPMB+OXdLA@mail.gmail.com>
 <50371416-8acf-4204-ae83-469602037e60@amd.com>
In-Reply-To: <50371416-8acf-4204-ae83-469602037e60@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 4 May 2026 11:10:08 +0300
X-Gm-Features: AVHnY4Lvp0A6YNCsGb-A6_HyiVqwRT8cWgHeDvY8l6NPOxpz4IfcSc588mOX25k
Message-ID: <CAGeoDV-_qoap77nj=bwuzibEr_rA=_-LK=EgyWrT3hCUD82Ktg@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: gic-v2: disable interrupt bypass on CPU shutdown
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1777882220-39161DB1-4FD0F04A/0/0
X-purgate-type: clean
X-purgate-size: 6971
X-Rspamd-Queue-Id: B059C4B9F13
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

On Mon, May 4, 2026 at 10:19=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 01-May-26 09:22, Mykola Kvach wrote:
> > Hi Michal,
> >
> > On Wed, Apr 29, 2026 at 11:20=E2=80=AFAM Orzel, Michal <michal.orzel@am=
d.com> wrote:
> >>
> >>
> >>
> >> On 28-Apr-26 13:57, Mykola Kvach wrote:
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
> >>>
> >>> Per IHI0048B.b section 2.3.1, clearing the architected bypass-disable
> >>> bits selects bypass rather than deasserted interrupt outputs when the
> >>> CPU interface stops driving them. Tables 2-2 and 2-3 show that a zero=
ed
> >>> GICC_CTLR can fall back to the legacy IRQ/FIQ inputs instead of fully
> >>> disabling the interface.
> >>>
> >>> Fix this by reading GICC_CTLR, then setting the bypass-disable bits a=
nd
> >>> clearing the group-enable bits that are architecturally defined for t=
he
> >>> current GICC_CTLR view before writing the value back. When Security
> >>> Extensions are implemented Xen accesses the Non-secure copy of
> >>> GICC_CTLR, where IRQBypDisGrp1 and FIQBypDisGrp1 are at bits [6:5] an=
d
> >>> bits [8:7] are reserved.
> >>>
> >>> Without Security Extensions there is no separate Secure/Non-secure CP=
U
> >>> interface view, so disabling both group-enable bits affects the share=
d
> >>> interface state. This is still appropriate for the CPU shutdown path,
> >>> which is expected to stop normal interrupt delivery through the inter=
face
> >>> and rely only on the architecturally separate wakeup event signaling.
> >>>
> >>> Section 2.3.2 also states that wakeup event signals remain available
> >>> even when both GIC interrupt signaling and interrupt bypass are
> >>> disabled, so disabling bypass does not break the power-management use
> >>> case, i.e. suspend modes.
> >>>
> >>> Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> ---
> >>> Changes in v2:
> >>> - derive the shutdown masks from the active GICC_CTLR layout
> >>> - use the Non-secure GICC_CTLR layout when GICD_TYPER.SecurityExtn is=
 set
> >>> - stop writing reserved bits [8:7] on Security Extensions systems
> >>> ---
> >>>  xen/arch/arm/gic-v2.c          | 16 +++++++++++++++-
> >>>  xen/arch/arm/include/asm/gic.h | 25 +++++++++++++++++++++++--
> >>>  2 files changed, 38 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> >>> index 014f955967..241c1ff5c5 100644
> >>> --- a/xen/arch/arm/gic-v2.c
> >>> +++ b/xen/arch/arm/gic-v2.c
> >>> @@ -408,7 +408,21 @@ static void gicv2_cpu_init(void)
> >>>
> >>>  static void gicv2_cpu_disable(void)
> >>>  {
> >>> -    writel_gicc(0x0, GICC_CTLR);
> >>> +    uint32_t ctlr =3D readl_gicc(GICC_CTLR);
> >>> +
> >>> +    if ( readl_gicd(GICD_TYPER) & GICD_TYPE_SEC )
> >>> +    {
> >>> +        ctlr |=3D GICC_NS_CTLR_BYPASS_DISABLE_GRP1_MASK;
> >>> +        ctlr &=3D ~GICC_CTL_ENABLE;
> >>> +    }
> >>> +    else
> >>> +    {
> >>> +        ctlr |=3D GICC_CTLR_BYPASS_DISABLE_GRP0_MASK |
> >>> +                GICC_CTLR_BYPASS_DISABLE_GRP1_MASK;
> >>> +        ctlr &=3D ~(GICC_CTL_ENABLE | GICC_CTL_ENABLE_GRP1);
> >>> +    }
> >> I don't understand why you want to set both G0 and G1,
> >> Bits 5-6 in the NS view control Group 1, while the same bits in the
> >> Secure/single-security-state view control Group 0. So in the latter ca=
se you
> >> don't need to set G1. Without security extensions all interrupts are G=
0 and with
> >> security extensions (NS access) all interrupts are G1. The spec guaran=
tees the
> >> functional mapping.
> >
> > I agree that this is not about Xen using both interrupt groups during
> > normal operation.
> >
> > There are two separate points here.
> >
> > For the group-enable bits, Xen currently only enables bit 0 in
> > gicv2_cpu_init(). So, in today's code, EnableGrp1 is expected to be cle=
ar
> > already. However, the old shutdown path wrote 0 to GICC_CTLR, which als=
o
> > cleared every group-enable bit visible in the current view. Since this
> > patch changes the shutdown path from a plain zero write to a
> > read/modify/write, I wanted to preserve that part of the old shutdown
> > semantics and avoid leaving any normal interrupt delivery enabled in th=
e
> > common GICC_CTLR view.
> >
> > For the bypass-disable bits, the reason for setting both groups in the
> > single-security-state/common view is the GICv2 bypass logic, not normal
> > interrupt delivery. Once the group-enable bits are clear, the CPU
> > interface is no longer driving the physical IRQ/FIQ outputs through
> > normal GIC delivery. At that point, the bypass-disable bits decide
> > whether those outputs are deasserted or driven by the legacy inputs.
> >
> > For example, with EnableGrp1 =3D=3D 0, EnableGrp0 =3D=3D 0 and FIQEn =
=3D=3D 0,
> > Table 2-2 requires IRQBypDisGrp1 to be set for the IRQ output to be
> > deasserted. Similarly, Table 2-3 requires both FIQBypDisGrp0 and
> > FIQBypDisGrp1 to be set for the FIQ output to be deasserted. This is wh=
y
> > the common-view case disables the bypass paths for both groups.
> >
> > This is also not meant to make FIQ a supported delivery mode for Xen. I=
t
> > is the opposite: when the CPU interface is disabled, the final state
> > should not allow the physical FIQ output to be driven by the legacy
> > bypass input. Arm32 has some fallback plumbing for FIQ exceptions, but =
Xen
> > does not configure FIQ as its normal GICv2 interrupt delivery mode.
> >
> > So the intent is:
> >
> > * with Security Extensions, touch only the Non-secure view bits visible
> >   to Xen;
> > * without Security Extensions, preserve the old "no normal delivery"
> >   shutdown behaviour, while changing the bypass-disable bits so that
> >   the physical outputs are deasserted rather than falling back to
> >   legacy bypass.
> >
> > If you prefer, I can also make v3 more conservative and only clear the
> > group-enable bit that Xen currently sets in gicv2_cpu_init(), i.e.
> > EnableGrp0 in the common view / EnableGrp1 in the Non-secure view. The
> > bypass-disable bits would still be set for all bypass paths visible in
> > the current GICC_CTLR view, because that part is about the physical
> > IRQ/FIQ outputs after normal delivery has been disabled, not about whic=
h
> > interrupt group Xen normally uses.
> The bypass argument is valid according to the tables. However, clearing G=
1 is
> unnecessary, so it should be dropped. I can do that on commit if you agre=
e. With
> that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Yes, I agree. Dropping the unnecessary clearing of G1 on commit is fine wit=
h me.

Thank you for the review and for taking care of the commit.

Best regards,
Mykola

>
> ~Michal
>

