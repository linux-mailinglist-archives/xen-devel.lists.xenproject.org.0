Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JUOIbsDxGnOvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:48:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ECE328671
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262688.1555108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QSb-0000x4-8f; Wed, 25 Mar 2026 15:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262688.1555108; Wed, 25 Mar 2026 15:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QSb-0000vB-5W; Wed, 25 Mar 2026 15:47:57 +0000
Received: by outflank-mailman (input) for mailman id 1262688;
 Wed, 25 Mar 2026 15:47:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5QSa-0000v5-5H
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:47:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5QSZ-005Y5v-HY
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:47:55 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c403a9-e002-0a2a0a5209dd-0a2a450acd32-10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:47:55 +0100
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c403ab-1772-0a2a450a0019-d155d0b2f198-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:47:55 +0100
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-38be5e86918so25640351fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:47:55 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774453674; cv=none;
        d=google.com; s=arc-20240605;
        b=XKLJZapprnbqy1h+U4D5egSIO15tkfG8vJc6aD9QkAXyrtM1oOI7nsAkMjycJzfoPU
         fJkn1RGzRd6Hcns1l9SkZaIJDFr4+BNvU+tUqg48CZ5iieJ37f3ohc85AdWysfElFUaa
         z+vGKToM8tO2wSV2m8LaOW6S3t5bjOvaSnvycUwWElXSIKoZ9mMGMs387juIbiZVDZUc
         VSM26LseT5V2bJjiQkNQlC3KOAHaDdp9TgXNiJZ8GxlBttEWf11DEQymtKSmbB1ls+wE
         oqAz8RfwkGwRfGZfVvbk1PgYWZHN3MTzXtt1OGh5QVZFQFQYDTulGHyYx6QQ/3ojUftW
         qP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wAC3dqVfQvzAfd2kLmhoLQ9o/WOFwtsH7xtwSy4+Feo=;
        fh=HHRjWkdysX2ZkNpVMY4DcdwfNbPq2J2BPJfxbJK3Acs=;
        b=OdSYwgx70M4wgo9RLMKAmvrTrRbUoavgNqefGvRhUM6vOZIfEQNvI+O8Em4HWfdvXh
         qDT7RSBtu4kCBSzkwKSv1E7dEv1Hn3E9mU/qzljVIXjJXjjVIdgYY0LxzqfHod6hRE4i
         QlsUTEx1+Vot3rEPI0DoywAbfzyrbXBq6XIHLbMP6/jg5Xjw9WjxpbM1QiI7Wr1E6sHB
         l5Ux+20vCzSL5mGwxGK3LmCDhmiDqD8pzZbByAo4kUbjx0KQ2SV/NxyV0Uj6hqYa+zlw
         tm8qYpz1Rd3B9B7m9ESUKNaJ4cEZSViV5hQIQx8WpFA74wuI3uyWXL3eeMOYJNr5T8Pj
         m05g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774453674; x=1775058474; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAC3dqVfQvzAfd2kLmhoLQ9o/WOFwtsH7xtwSy4+Feo=;
        b=jDs599uW66+WvcJjMxhNuLWDA8kaLXtbMeLBXf8XMskAZF8oeUry6gBJileQ6ltcPy
         6YlP2frtLTmj0StqYCXVOdV5/JHQWg5PJ0IHKL6zJt4dEczL1sAlNSiPDD7ZJnxQelLk
         bXxAliQjf72LDmSpeGS9FiFpP+PFRjCIFdJ68dJq9TqygmqRp/pmcMX3lg+Tx8EMnQpt
         IHnJ8BqJBBAm8QA73TZroPUdbqMMAklvMhSsddi3h4pGM5V1S8Bskk2FnzQ0zdvdnY69
         /D5vdtJ0S/DZlMPMtVatCbC872UAekNR74XNGJGTKr32TtSCngHXp+Mwyyqe4dzAaOm6
         xg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774453674; x=1775058474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAC3dqVfQvzAfd2kLmhoLQ9o/WOFwtsH7xtwSy4+Feo=;
        b=AkhlhIGxuv9IuaWUDw06h/DMf3RVkvNQDchfK8gXUG/JgY2eaiKAYgaxkxZMUo9jqw
         gwOm75xsFm1AAO4axNgYBD41p3sG0993BWpAShjRXGkgF/TytaGri7c1MmVIf1SIL+y9
         4FBI96o6qF/1wpKcYstXI/lZ7vEP7JzrScNYRVThHKaEW5jOTYSdbzqRxV5Ttie8YRk9
         Wl3lE827yDta3BWAerqAmV33FuxJfvw6KgEVLtjk8yBBq3p4B/oDueZL1uW+RvMZC/In
         muVm7imhJn2HiY1NPWTtQoC7eDBnLck+cqqIROIRH+CiBsP6xlUK27jv2jmk8oBNAVya
         jTuw==
X-Gm-Message-State: AOJu0Ywx7Joq0AujrN3OBn5PaJCAcFT3Z9qlF3I64HHNEbDdiDVgZaSk
	UyrOMt4OuywlbjATRGW/KRjOeAd7v7kHu2Eu46Te+8WAiHPgdQjSfmJh331BuPLamS3ep747sDE
	MVxllcNsd/xQVfkZ5mJSBrrNtYw7SyPY=
X-Gm-Gg: ATEYQzzWosAdLQtf+VEiLsfvCRGFn+ZNAnQxEBMw4G85dbZT9yu/9IwZVhT59ulOBfz
	hlB+lnOJXwozzru3HS1+TJHa9WzCsdZe+0IDvoCQM9VZeHsaajZ3fDy+ZlFcHY5BHHx76sWbR7z
	0X4tyVJrPLFjhr8DUVVoTg7vQCBocfkmh8AO7Fjs+PwPrkqiOfWltNYiBtARihqsm/TscLqGDzC
	chsWkmhxisoYexX2rNt6gKIq5vbgZ2HWzoM7/fdNn9Mkv0hwoY6yggcpS6SxBwg9OZPTwe+oKWQ
	yEIZ
X-Received: by 2002:a2e:90d2:0:b0:389:e6d4:e7cb with SMTP id
 38308e7fff4ca-38c4313da9dmr11147721fa.22.1774453674110; Wed, 25 Mar 2026
 08:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774431310.git.mykola_kvach@epam.com> <5b68fa0a8403ea60db3047f6505876bc03a41f3f.1774431310.git.mykola_kvach@epam.com>
 <87bjgcvul6.fsf@epam.com>
In-Reply-To: <87bjgcvul6.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 25 Mar 2026 17:47:43 +0200
X-Gm-Features: AQROBzBnvr8t7Gz0_HZFVSoDxw4XxCynisr9rsnzwBgu3i9XQHZjS24fTikQv2o
Message-ID: <CAGeoDV87irnVf8k+Z2L6=k41p87N9O6DpLCFdkMwErzDpXB9KA@mail.gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: its: collect quirk flags and honor dma-noncoherent
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1774453675-BCA83900-C48F5392/0/0
X-purgate-type: clean
X-purgate-size: 6385
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,bootlin.com:url];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D3ECE328671
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Volodymyr,

Thank you for the review.

On Wed, Mar 25, 2026 at 4:42=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Replace the per-quirk init callback with declarative flags in
> > struct its_quirk, and introduce gicv3_its_collect_quirks() to gather
> > the effective workaround flags from both the IIDR-matched quirk entry
> > and the "dma-noncoherent" device-tree property.
> >
> > This lets non-coherent platforms force non-cacheable ITS table
> > attributes even when no IIDR quirk entry matches.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/arch/arm/gic-v3-its.c | 70 ++++++++++++++++++++++++---------------
> >  1 file changed, 43 insertions(+), 27 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 9ba068c46f..00524b43a3 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -57,71 +57,87 @@ struct its_device {
> >   */
> >  struct its_quirk {
> >      const char *desc;
> > -    bool (*init)(struct host_its *hw_its);
> >      uint32_t iidr;
> >      uint32_t mask;
> > +    uint32_t flags;
> >  };
> >
> >  static uint32_t __ro_after_init its_quirk_flags;
> >
> > -static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
> > -{
> > -    its_quirk_flags |=3D HOST_ITS_WORKAROUND_NC_NS |
> > -        HOST_ITS_WORKAROUND_32BIT_ADDR;
> > -
> > -    return true;
> > -}
> > -
> >  static const struct its_quirk its_quirks[] =3D {
> >      {
> > -        .desc        =3D "R-Car Gen4",
> > -        .iidr        =3D 0x0201743b,
> > -        .mask        =3D 0xffffffffU,
> > -        .init        =3D gicv3_its_enable_quirk_gen4,
> > +        .desc  =3D "R-Car Gen4",
> > +        .iidr  =3D 0x0201743b,
> > +        .mask  =3D 0xffffffffU,
> > +        .flags =3D HOST_ITS_WORKAROUND_NC_NS |
> > +                 HOST_ITS_WORKAROUND_32BIT_ADDR,
> >      },
> >      {
> >          /* Sentinel. */
> >      }
> >  };
> >
> > -static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
> > +static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
> >  {
> > -    const struct its_quirk *quirks =3D its_quirks;
> > +    const struct its_quirk *quirk =3D its_quirks;
> >
> > -    for ( ; quirks->desc; quirks++ )
> > +    for ( ; quirk->desc; quirk++ )
> >      {
> > -        if ( quirks->iidr =3D=3D (quirks->mask & iidr) )
> > -            return (struct its_quirk *)quirks;
> > +        if ( quirk->iidr !=3D (quirk->mask & iidr) )
> > +            continue;
> > +
> > +        return quirk;
> >      }
> >
> >      return NULL;
> >  }
> >
> > -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> > +static uint32_t gicv3_its_collect_quirks(const struct host_its *hw_its=
,
> > +                                         const struct its_quirk **matc=
hed_quirk)
> >  {
> > +    const struct its_quirk *quirk;
> > +    uint32_t flags =3D 0;
> >      uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
> > -    const struct its_quirk *quirk =3D gicv3_its_find_quirk(iidr);
> >
> > -    if ( quirk && quirk->init(hw_its) )
> > +    quirk =3D gicv3_its_find_quirk(iidr);
> > +    if ( quirk )
> > +        flags |=3D quirk->flags;
> > +
> > +    if ( hw_its->dt_node &&
> > +         dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
> > +        flags |=3D HOST_ITS_WORKAROUND_NC_NS;
> > +
> > +    if ( matched_quirk )
> > +        *matched_quirk =3D quirk;
> > +
> > +    return flags;
> > +}
> > +
> > +static void gicv3_its_enable_quirks(struct host_its *hw_its)
> > +{
> > +    const struct its_quirk *quirk;
> > +
> > +    its_quirk_flags =3D gicv3_its_collect_quirks(hw_its, &quirk);
> > +
> > +    if ( quirk )
> >          printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc=
);
> >  }
> >
> >  static void gicv3_its_validate_quirks(void)
> >  {
> > -    const struct its_quirk *quirk =3D NULL, *prev =3D NULL;
> > +    uint32_t quirks, prev_quirks;
> >      const struct host_its *hw_its;
> >
> >      if ( list_empty(&host_its_list) )
> >          return;
> >
> >      hw_its =3D list_first_entry(&host_its_list, struct host_its, entry=
);
> > -    prev =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GIT=
S_IIDR));
> > +    prev_quirks =3D gicv3_its_collect_quirks(hw_its, NULL);
> >
> > -    list_for_each_entry(hw_its, &host_its_list, entry)
> > +    list_for_each_entry_continue(hw_its, &host_its_list, entry)
> >      {
> > -        quirk =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base =
+ GITS_IIDR));
> > -        BUG_ON(quirk !=3D prev);
> > -        prev =3D quirk;
> > +        quirks =3D gicv3_its_collect_quirks(hw_its, NULL);
> > +        BUG_ON(quirks !=3D prev_quirks);
>
> I know it was in the previous version, but as you are already touching
> this... This is not Xen BUG(). This is a platform problem. So you need
> to panic here. Something like
>
>  if (quirks !=3D prev_quirks)
>         panic("Different ITS instances has different quirks")

Ack.


>
>
> Also, I want to point out that you are not validating "dma-noncoherent"
> quirk here. I mean, some ITS entries can have this property, some other
> - don't. This makes me think that you need to promote this
> "dma-noncoherent" quirk from open coded check to a `struct
> its_quirk` entry, so it will be handled in generic way.

Just to clarify your point about dma-noncoherent:

In the current version it is already part of the effective quirk set,
because gicv3_its_validate_quirks() compares the flags returned by
gicv3_its_collect_quirks(), and those already include the
dma-noncoherent DT property.

So is your concern that DT-derived ITS properties such as
dma-noncoherent should also go through the same common quirk/collection
plumbing as the other ITS workaround sources, rather than being handled
as a separate open-coded check, similar to how Linux models this [1]?

Or did you have something else in mind?


Best regards,
Mykola

[1] https://elixir.bootlin.com/linux/v6.19.9/source/drivers/irqchip/irq-gic=
-v3-its.c#L4973

>
>
> --
> WBR, Volodymyr

