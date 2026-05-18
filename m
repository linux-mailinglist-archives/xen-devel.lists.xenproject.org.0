Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B1wOZqUC2ohJgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 00:37:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3295749EC
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 00:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312269.1582410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP6Zm-00036g-BQ; Mon, 18 May 2026 22:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312269.1582410; Mon, 18 May 2026 22:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP6Zm-00035E-8W; Mon, 18 May 2026 22:36:42 +0000
Received: by outflank-mailman (input) for mailman id 1312269;
 Mon, 18 May 2026 22:36:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wP6Zl-000358-8t
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 22:36:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP6Zk-00HTli-4e
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 00:36:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b9452-2eae-0a2a0a5409dd-0a2a45048334-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:36:40 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b9477-1dec-0a2a45040019-d155d0b1b8e3-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:36:39 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-393c93a0166so31155171fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:36:39 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779143799; cv=none;
        d=google.com; s=arc-20240605;
        b=OF+Uj7cfKnYGSyn668pydX58vrnnvHoyY9yY8pNUCbLCX2a9o+fsN0f1dhucS3Zbfr
         xXqdw3qZUls7GDSUpd+r7y9O/Dlqc+YirRVB98PuzudLf7z3P+ORyW5X0O2AGNO3JGCj
         vQrxlsmGn5k3gAYoVFXwlVfB7JASGSikRBStfXozyE8t3oQVyEIWFF97tLycHuPqCP66
         MYZ3e4srd0SivZhRZlbSLFpYHwla8MWJh6Da32Y33BuOdB16SPvyznYjZSUvMmNaYoZI
         SiChD/GUcH+2ck7bj6MG7ArYv7v+QKoEtjR2V3SOu0xuaapBQ2jkI8IU2tUAS+6nNY/7
         REUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vxjc9Rh85UVDLOa6UVs+hSnPillcyypzCV/sXZmXpZM=;
        fh=URHEk7klKxjqc5bXwxtPgt12zwbJaOVjsCphaVnE7cw=;
        b=S2iIOZn2NA5XtDcw7FRGgDeyxeznBBR1RPqQwMd7Yl/3wNvJ6MrTOVRq5UInQYelQO
         pMJCrFmdeCiibGW4M+8bRbQP6WcedIQ0hJkn9PO2jmFyBR7pMG7DjvpURzz/eylRf3vP
         3/uuzopnKdTbwZFp6ilVPsMTuanrE9+DPxthprU2dHgt9klsjXoFFxZTbTUu1RjmVgEW
         oxEo8QWaAqrC478K2cH7+iyWx+fgWQ9M3on3TSg5piPNSfLFMZxUdoNOIz44tpV8HQFc
         Jmm3K4QFjbPC8jT/jnpDGuCgaM6+6mch/Lpy0TepuBUJZVawG+BaiID1yAVN22Or//CA
         2FGA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779143799; x=1779748599; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxjc9Rh85UVDLOa6UVs+hSnPillcyypzCV/sXZmXpZM=;
        b=k7q4nOB1an6n7Ev76exccvK76OaSUynCgabgMMv4vlf9zj0k7UrfIKlDoIvnDSU0sm
         aphpJtxtpFdDLIPbvewpGTApHYg6FKiJ1ms16WseL9k1wRIoEDaaDMAHv+ZCM1Lfqk4n
         H+bUiesnuAlkedxWDrESg/PciLV70j7ovxrB/QTJvPyRk4CJgzUQRFkGQ7IfkzrR2MDV
         9xp8ptSKHdpCWkPOiWWwdapeRZo1LMKyT/ry4gjSQKt7IvSKh/8sNi6ccFaQeDKnYs8+
         evvBH8DnhcGZsAVNpkuVz2DHPfNwFoWSi17FcTYc+Bna0ADMRbu4mMTjjjlNd+/lpYJB
         6pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779143799; x=1779748599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vxjc9Rh85UVDLOa6UVs+hSnPillcyypzCV/sXZmXpZM=;
        b=n/NTni7nTVAsoLyfpkYQ4uGqXxuVCXAJtOVa8biES5PWdll8Q7rKWaX5uiF11U0e8V
         kfecnLCFV0UWpv/bNvq5yEw80c7zudQWesi4si3f7HA+CJKlHXkz3W+CyrVIo2W7NW4v
         udJ3KC16fkIwXeMz61kIjNWeo98dJX6JYuKyf9ZOqAe3l5JCI6TDTxTU/9e1/C0cnd22
         zrR5RVUeLqEg0l68sI52ZopFvUwaFEq8HK3WoXB8AnU5KPdJamATH3Snpnka5dtoNuPz
         vjUALWbABAy/ibtgRGS3K2+bYeW2vCRYs68pU7uz1x69A7S9ahe5XYUCpBHCwYP8uV7h
         HTFg==
X-Gm-Message-State: AOJu0YzsCDBnu9XOJxq+dBoY7bhmswFfKYpPDmdMnpvUQySRAAU8iWiS
	g6rq22VbhOzco+2YH3MYu01BEzxvCz1yxoEfUGvMkoV0YY1Hz4dB3CJ646vF8Vw9qQEY6m1L9pH
	vBGCBvpbTeALtjI5W/afsH2wXmfWUPmQ=
X-Gm-Gg: Acq92OHYvybMqGnhritMEDwqEvtB8/D7I1owTPsAl2OZCCAN/Bi+bprvKwt4ErDdP2K
	1cLjrJYTYsx+U6Z160wtytlgBuBSxXc2PSedNJAhyrIhnNULJUyJgjGazMWLnG8njiVIghI0jCw
	hSnCwq+S9A8Gi3IcWYjUzRLCgbdkwqUMZJQUorQoszj43sG+BmlxSmRe07MQdQFL2uqQ0r+irsl
	wksc4RphuTk4azHKAIwlHgB6JG+cof+Ky+k0/yTyaEXB9j6yMtwFySgxfEspbUqTUz00d53kEq3
	KPa0
X-Received: by 2002:a05:651c:515:b0:393:975b:5634 with SMTP id
 38308e7fff4ca-39561c8b784mr49655891fa.11.1779143799011; Mon, 18 May 2026
 15:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <bd79226263c1dd9c915a7fffd4f92b194af864ee.1778605274.git.mykola_kvach@epam.com>
 <5323B63C-7F37-418C-97C6-0A94F9D03B4F@arm.com>
In-Reply-To: <5323B63C-7F37-418C-97C6-0A94F9D03B4F@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 19 May 2026 01:36:27 +0300
X-Gm-Features: AVHnY4Ku4LoE7n8DvxKqiqS6D51-CFgb9rxrL3rIPk1MoKeL7dmPSVikAsYebDE
Message-ID: <CAGeoDV-fkfUh_+tQ=kddHdPiaGJhgSdFsm79qCWhAyJ6sS0tdw@mail.gmail.com>
Subject: Re: [PATCH v9 05/13] xen/arm: gic-v3: add ITS suspend/resume support
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1779143799-2B5683FF-DB206C5E/0/0
X-purgate-type: clean
X-purgate-size: 7917
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4B3295749EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

Thank you for the detailed review.

On Thu, May 14, 2026 at 5:46=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > On 12 May 2026, at 18:07, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
> > working after firmware powers the GIC down. Save and restore the ITS
> > CTLR, CBASER and BASER registers, and re-establish the collection mappi=
ng
> > on resume.
> >
> > Add list_for_each_entry_continue_reverse() in list.h for the ITS suspen=
d
> > error path that needs to roll back partially saved state.
> >
> > Based on Linux commit dba0bc7b76dc:
> > "irqchip/gic-v3-its: Add ability to save/restore ITS state".
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V9:
> > - fix the ITS suspend/resume coding-style nits;
> > - preserve the saved GITS_CTLR state while masking the read-only
> >  QUIESCENT bit.
> >
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
> > xen/arch/arm/gic-v3-its.c             | 133 ++++++++++++++++++++++++--
> > xen/arch/arm/gic-v3.c                 |  11 ++-
> > xen/arch/arm/include/asm/gic_v3_its.h |  23 +++++
> > xen/include/xen/list.h                |  14 +++
> > 4 files changed, 171 insertions(+), 10 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 9005ce8ce5..582c26d964 100644
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
> > @@ -1210,6 +1218,113 @@ int gicv3_its_init(void)
> >     return 0;
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +int gicv3_its_suspend(void)
> > +{
> > +    struct host_its *its;
> > +    int ret;
> > +
> > +    list_for_each_entry( its, &host_its_list, entry )
> > +    {
> > +        unsigned int i;
> > +        void __iomem *base =3D its->its_base;
> > +
> > +        /*
> > +         * By the time Xen reaches gic_suspend(), every domain is alre=
ady in
> > +         * SHUTDOWN_suspend, so ITS-targeting interrupt sources are ex=
pected
> > +         * to have been quiesced by the owning OS before SYSTEM_SUSPEN=
D.
> > +         */
> > +        /* Preserve saved GITS_CTLR state, excluding read-only QUIESCE=
NT. */
> > +        its->suspend_ctx.ctlr =3D readl_relaxed(base + GITS_CTLR) &
> > +                                ~GITS_CTLR_QUIESCENT;
> > +        ret =3D gicv3_disable_its(its);
> > +        if ( ret )
> > +        {
> > +            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> > +            goto err;
> > +        }
> > +
> > +        its->suspend_ctx.cbaser =3D readq_relaxed(base + GITS_CBASER);
> > +
> > +        for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
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
> > +    list_for_each_entry_continue_reverse( its, &host_its_list, entry )
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
>
> s/undefined/unpredictable/ ?

Ack.

>
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
>
> This will always issue a MAPC V=3D1, in the section 5.3.9 it sais it=E2=
=80=99s "unpredictable
> if there are interrupts that are mapped to the specified collection and t=
he
> collection is currently mapped to a Redistributor, unless MAPC is followe=
d by MOVALL=E2=80=9D,
> in this case the redistributor is the same but the specs don=E2=80=99t sa=
y anything about this case,
> it=E2=80=99s generally unpredictable if we are remapping an already-live =
collection.
>
> I see Linux reply the MAPC V=3D1 only if the collection is stored in the =
ITS (not memory backed),
> our col_id is `cpu`, which I believe that for the suspend path is always =
zero (?), so by looking into
> HCC we could check if we need to issue the MAPC or not.
>
> if ( cpu < GITS_TYPER_HCC(readq_relaxed(base + GITS_TYPER)) )
>     return gicv3_its_setup_collection_single(its, cpu);
>
> return 0;
>

Good point, I agree.

Replaying MAPC unconditionally is not needed here and may be unsafe for
memory-backed collections. Since Xen currently uses col_id =3D=3D cpu, I wi=
ll
add the HCC check before calling gicv3_its_setup_collection_single(), as
you suggested.

I will also add a short comment to make clear that the check is about the
CollectionID being ITS-held.

Best regards,
Mykola

