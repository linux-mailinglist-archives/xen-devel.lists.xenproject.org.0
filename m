Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN7kLvHB+Wn/DAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:09:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6364CA967
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300444.1574975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCin-0003M0-KJ; Tue, 05 May 2026 10:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300444.1574975; Tue, 05 May 2026 10:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCin-0003JX-GZ; Tue, 05 May 2026 10:09:45 +0000
Received: by outflank-mailman (input) for mailman id 1300444;
 Tue, 05 May 2026 10:09:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKCim-0003JP-9v
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:09:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCik-0035VL-0O
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:09:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f9c1e4-bab6-0a2a0a5309dd-0a2a450c9314-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:09:43 +0200
Received: from [209.85.208.173] (helo=mail-lj1-f173.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f9c1e7-62f1-0a2a450c0019-d155d0ade5bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:09:43 +0200
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3938d17d6c5so23225521fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 03:09:43 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777975783; cv=none;
        d=google.com; s=arc-20240605;
        b=fRAlpKczIekO5NkUY5I8FI1+7bO2ZGy/u9cWmYbnfVQbTEagS5y2e4Fwyuj0/f9E2y
         0CD+HefMoqqdVtBIbLYBCixy3HoFHLHF9uugxc2dDdW9PzPG/BjswLNzfXztlqkZJyap
         hVhcVl3khBZ7DGS7jv+d8hsFvJv6Kg34vsyk/Ane1Kub4XYkOAimNpVexndKku1ZzHzp
         8f+rqsP5u3CKQOBLRH2jo5CWge22pH5ns+toqHN1WWr60Rha+UNKKxauhqEHQZPT0eym
         3Za996Lft9sVGdOBIZH7bLiU9XFYOgBCotsJ6bdgIRm+qxbEOhWgM55MvWS3Yu/zPSiy
         FH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ubUxc2UgV5FQSM7BgjCzZ28UKumn5+tYQ8/ylDMe6Hc=;
        fh=URHEk7klKxjqc5bXwxtPgt12zwbJaOVjsCphaVnE7cw=;
        b=P9O74Np/pY1MndYznybXKEaxlSXYxxmtQSHkygBtHbPV3Ch8T2rl2xkE+HfQlIAYCj
         HbwqlIEWkekD138//U1EAjirSejtUB+Thh46DKikEgBLwaH5mc2pTxDGawhjQD+nprps
         gTGL3XGEEqicP2xOGsbs+dTjgGqyWp3OBm8tfOYyuaSY5/WMuTd3jkYNgE+lRWL5tCvP
         MEf+XrdeqzJuexy7vkRG7m8n345BXaJ+HIxsBsgTxA/pVRGM+E+iyTtgLRVWV7Fj6/Q3
         wNaNEhge/iTZ729b85JVeIaHI4EuWG5cQKzoAR8hQge4tT9Iyp291v8TLM6V6S7X3+2j
         9BAw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777975783; x=1778580583; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubUxc2UgV5FQSM7BgjCzZ28UKumn5+tYQ8/ylDMe6Hc=;
        b=n0POY9FJ9L6cUXBxb9ZDaqTEsApuNbjevTzacPZTmT/w/Wo1u6wUOjnjCiCIOoRcaB
         2cMI5g6Ajew2dnq52uVjIEoCxFTJKYbmUnAtdWTzPMWnygGGXYGdTMgedOgcA3MokVOS
         wJPCe1IAiQRRVAvbBThFumdaiQgy98qJP1WS/HY/TPgbT+LeCtkCzo4Vv7r52lVlOw/g
         rW1P/acALJRLUftZjoww8rKPDuvNqMaMgVUncvba32Ze8qDh0SZeDXd3W8hP3UvU4Pa3
         kFX/8P1lId6UejB8SfGfCMACrmoF+TAMT0fQ+6MJRpGB4B9G3nbwtp/etaJNLPMI+jeE
         xm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975783; x=1778580583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubUxc2UgV5FQSM7BgjCzZ28UKumn5+tYQ8/ylDMe6Hc=;
        b=h549v/ZAQFKo3AEgwIJorT5rIV9vQFw2FzNiPPgf8ydiO0h3JHOswbgAw/nNxgF8Fj
         n+VMPpDnQ7ptxAJHJRnYkxCWs2KqDfxjIbcnyVj6fEuZgJsxYDF2gewwuVmZOGPIqTv+
         23ACbBonW4QO0MqCrPOXnkkFLj/zKE7LQjkg8DjX+oCjZ86GGlLXPA2N+NhrIT+OlowS
         aKviuywjQYWVMRbXFsvEFP3RhwZUzqBKUbwrGrI+PbwgAjFoHkXTXCcbsklr0bWUElzL
         TZI4b06idfKMHsVt5o0wFuawvTHCU40iqV6v1HlaYbuibxHnlVmn7MYLFrA0acDkzkQX
         1Frg==
X-Gm-Message-State: AOJu0YyRbeSc75ZeCccS9QrkCE8Qt72kZjC8JD24lru0hnrBKoNi6+vm
	HR3KxcpP86eBgpTJVCMFbRHBxXaM2mZKR33Bq2A62kCtP/oROD5O0qMMsNm9OfCwPPY4KfXvDeV
	lbb0YwNq4IPoV8LEltEzpkchEW8nyHZo=
X-Gm-Gg: AeBDiet/95bIhiQUhvcmBtKsHRoWULJlzswY9eJsSt6WjqjVQZRc60mOne3K6vhnEbt
	WkWzyyy7CzAl5CxGgddfuFqTzSaaoaSW1Gk/p+cXOnAc/q3Ud8WqlA97l8wqhv6uaKghM3ncDj+
	dzMQwjUnjlfEjwDg2V2Y6Ikw9RF2op6QkGPfayERzq+RXWOn3M8uGefmKHWujwFs933/YUMZ6o+
	Mh8UjBXyV2J08jUCmQzGsp3U1Ti2TsdEYt5Wk+ZLqCHYoZZqNbnctEJ6j9pCwBhC8anEbRsrSKz
	VQFWeFH5iXUVghrN
X-Received: by 2002:a2e:a802:0:b0:393:7987:5862 with SMTP id
 38308e7fff4ca-39379875e33mr45872251fa.19.1777975782305; Tue, 05 May 2026
 03:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <5a42b7c32fadf21262b8342f27e685916d0e5812.1775125380.git.mykola_kvach@epam.com>
 <FDA8FF59-989D-42A8-9E75-1300E0B5EBD0@arm.com>
In-Reply-To: <FDA8FF59-989D-42A8-9E75-1300E0B5EBD0@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 13:09:30 +0300
X-Gm-Features: AVHnY4JhWkbLY0_2SqeXFrOSTkFxupjeVNP9Dy0mDpQdrzGqbniy_ZLQ99nMdsI
Message-ID: <CAGeoDV_OkizsZj0hNXM3W84FpoeVjgSnzoRmAr3YtZj1Ri_3eA@mail.gmail.com>
Subject: Re: [PATCH v8 05/13] xen/arm: gic-v3: add ITS suspend/resume support
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1777975783-6ED73CF5-1C07ADAC/0/0
X-purgate-type: clean
X-purgate-size: 9123
X-Rspamd-Queue-Id: 2A6364CA967
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,arm.com:email,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Luca,

Thank you for the review.

On Fri, Apr 24, 2026 at 1:54=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > On 2 Apr 2026, at 11:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
> > working after firmware powers the GIC down. Snapshot the CPU interface,
> > distributor and last-CPU redistributor state, disable the ITS to cache =
its
> > CTLR/CBASER/BASER registers, then restore everything and re-arm the
> > collection on resume.
> >
> > Add list_for_each_entry_continue_reverse() in list.h for the ITS suspen=
d
> > error path that needs to roll back partially saved state.
> >
> > Based on Linux commit dba0bc7b76dc ("irqchip/gic-v3-its: Add ability to=
 save/restore ITS state")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V8:
> > - Reword the CBASER/CWRITER comment to match Xen and drop the stale Lin=
ux
> >  cmd_write reference.
> > - Clarify the list_for_each_entry_continue_reverse() comment.
> > - Factor out per-ITS helpers for collection setup and resume.
> > - Restore each ITS and re-establish its collection mapping in the same
> >  loop, so a failed ITS resume is not followed by MAPC/SYNC on that
> >  un-restored instance.
> > - panic in case when resume of an ITS failed
> > - cleanup baser cache during suspend
> > ---
> > xen/arch/arm/gic-v3-its.c             | 126 ++++++++++++++++++++++++--
> > xen/arch/arm/gic-v3.c                 |  15 ++-
> > xen/arch/arm/include/asm/gic_v3_its.h |  23 +++++
> > xen/include/xen/list.h                |  14 +++
> > 4 files changed, 166 insertions(+), 12 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 9ba068c46f..fe2865eac9 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -335,6 +335,22 @@ static int its_send_cmd_inv(struct host_its *its,
> >     return its_send_command(its, cmd);
> > }
> >
> > +static int gicv3_its_setup_collection_single(struct host_its *its,
> > +                                             unsigned int cpu)
> > +{
> > +    int ret;
> > +
> > +    ret =3D its_send_cmd_mapc(its, cpu, cpu);
> > +    if ( ret )
> > +        return ret;
> > +
> > +    ret =3D its_send_cmd_sync(its, cpu);
> > +    if ( ret )
> > +        return ret;
> > +
> > +    return gicv3_its_wait_commands(its);
> > +}
> > +
> > /* Set up the (1:1) collection mapping for the given host CPU. */
> > int gicv3_its_setup_collection(unsigned int cpu)
> > {
> > @@ -343,15 +359,7 @@ int gicv3_its_setup_collection(unsigned int cpu)
> >
> >     list_for_each_entry(its, &host_its_list, entry)
> >     {
> > -        ret =3D its_send_cmd_mapc(its, cpu, cpu);
> > -        if ( ret )
> > -            return ret;
> > -
> > -        ret =3D its_send_cmd_sync(its, cpu);
> > -        if ( ret )
> > -            return ret;
> > -
> > -        ret =3D gicv3_its_wait_commands(its);
> > +        ret =3D gicv3_its_setup_collection_single(its, cpu);
> >         if ( ret )
> >             return ret;
> >     }
> > @@ -1209,6 +1217,106 @@ int gicv3_its_init(void)
> >     return 0;
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +int gicv3_its_suspend(void)
> > +{
> > +    struct host_its *its;
> > +    int ret;
> > +
> > +    list_for_each_entry(its, &host_its_list, entry)
>
> NIT: codestyle, spaces after and before the parenthesis

Ack, I will fix the coding style.

>
> > +    {
> > +        unsigned int i;
> > +        void __iomem *base =3D its->its_base;
> > +
> > +        its->suspend_ctx.ctlr =3D readl_relaxed(base + GITS_CTLR);
> > +        ret =3D gicv3_disable_its(its);
>
> This is called from system_suspend(), along the path iommu_suspend and
> console_suspend() are called, finally reaching gic_suspend() and this one=
.
>
> In the IHI 0069H.b, 5.6.2 Disabling an ITS, it says:
> =E2=80=9CEnsure that all interrupts that target the ITS that is being pow=
ered down are
> either redirected or disabled=E2=80=9D, is it correct to assume all the I=
TS targeting source
> at this point are disabled because domains should be already suspended?

Yes, that is the assumption here.

Before Xen reaches this path, each domain must already have entered
SHUTDOWN_suspend. In other words, the guest OS has already requested
SYSTEM_SUSPEND only after completing its own suspend flow, so the
ITS-targeting interrupt sources owned by that OS are expected to be
quiesced at this point.

So this code relies on the owning OS having disabled or otherwise
quiesced those sources before issuing SYSTEM_SUSPEND, rather than Xen
explicitly doing that in gicv3_its_suspend().

>
>
> > +        if ( ret )
> > +        {
> > +            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
>
> here and in the other places we write GITS_CTLR, this reg has Quiescent a=
s RO,
> maybe we should mask the write to only the other bits that are writable?

Yes, this was inherited from the Linux ITS suspend/resume code, which resto=
res
the saved GITS_CTLR value directly.

That said, masking the write to the writable bits is cleaner, and I will do
that in the next version.

>
> > +            goto err;
> > +        }
> > +
> > +        its->suspend_ctx.cbaser =3D readq_relaxed(base + GITS_CBASER);
> > +
> > +        for (i =3D 0; i < GITS_BASER_NR_REGS; i++)
>
> NIT: codestyle on the spaces and parenthesis
>
> > +        {
> > +            uint64_t baser =3D readq_relaxed(base + GITS_BASER0 + i * =
8);
> > +
> > +            its->suspend_ctx.baser[i] =3D 0;
> > +
> > +            if ( !(baser & GITS_VALID_BIT) )
> > +                continue;
> > +
> > +            its->suspend_ctx.baser[i] =3D baser;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +
> > + err:
> > +    list_for_each_entry_continue_reverse(its, &host_its_list, entry)
> > +        writel_relaxed(its->suspend_ctx.ctlr, its->its_base + GITS_CTL=
R);
> > +
> > +    return ret;
> > +}
> > +
> > +static int gicv3_its_resume_single(struct host_its *its, unsigned int =
cpu)
> > +{
> > +    void __iomem *base =3D its->its_base;
> > +    unsigned int i;
> > +    int ret;
> > +
> > +    /*
> > +     * Make sure that the ITS is disabled. If it fails to quiesce,
> > +     * don't restore it since writing to CBASER or BASER<n>
> > +     * registers is undefined according to the GIC v3 ITS
> > +     * Specification.
> > +     */
> > +    WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
> > +    ret =3D gicv3_disable_its(its);
> > +    if ( ret )
> > +        return ret;
> > +
> > +    writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
> > +
> > +    /*
> > +     * Writing CBASER resets CREADR to 0, so reset CWRITER to
> > +     * keep the command queue pointers aligned.
> > +     */
> > +    writeq_relaxed(0, base + GITS_CWRITER);
> > +
> > +    /* Restore GITS_BASER from the value cache. */
> > +    for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
> > +    {
> > +        uint64_t baser =3D its->suspend_ctx.baser[i];
> > +
> > +        if ( !(baser & GITS_VALID_BIT) )
> > +            continue;
> > +
> > +        writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
> > +    }
> > +
> > +    writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> > +
> > +    return gicv3_its_setup_collection_single(its, cpu);
> > +}
> > +
> > +void gicv3_its_resume(void)
> > +{
> > +    struct host_its *its;
> > +    unsigned int cpu =3D smp_processor_id();
> > +    int ret;
> > +
> > +    list_for_each_entry(its, &host_its_list, entry)
> > +    {
> > +        ret =3D gicv3_its_resume_single(its, cpu);
> > +        if ( ret )
> > +            panic("GICv3: ITS@%"PRIpaddr": failed to restore during re=
sume: %d\n",
> > +                   its->addr, ret);
> > +    }
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> >
> > /*
> >  * Local variables:
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index d182a71478..ef8318dd50 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -862,7 +862,7 @@ static bool gicv3_enable_lpis(void)
> >     return true;
> > }
> >
> > -static int __init gicv3_populate_rdist(void)
> > +static int gicv3_populate_rdist(void)
> > {
> >     int i;
> >     uint32_t aff;
> > @@ -932,7 +932,7 @@ static int __init gicv3_populate_rdist(void)
> >                     ret =3D gicv3_lpi_init_rdist(ptr);
> >                     if ( ret && ret !=3D -ENODEV && ret !=3D -EBUSY )
> >                     {
> > -                        printk("GICv3: CPU%d: Cannot initialize LPIs: =
%u\n",
> > +                        printk("GICv3: CPU%d: Cannot initialize LPIs: =
%d\n",
>
> this is to fix the mistake of a patch before,

Yes, I will fold this into the previous patch.

Best regards,
Mykola

>
> Cheers,
> Luca
>

