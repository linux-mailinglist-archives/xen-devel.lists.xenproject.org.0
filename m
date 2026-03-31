Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBEwN9CCy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:16:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68708365F31
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268626.1557861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UGe-0003cR-LU; Tue, 31 Mar 2026 08:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268626.1557861; Tue, 31 Mar 2026 08:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UGe-0003an-HP; Tue, 31 Mar 2026 08:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1268626;
 Tue, 31 Mar 2026 08:16:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w7UGc-0003aZ-NJ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:16:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UGc-00FdbH-2X
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:16:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69cb82be-2eae-0a2a0a5409dd-0a2a4506c1f6-40
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:16:06 +0200
Received: from [209.85.167.54] (helo=mail-lf1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69cb82c5-3034-0a2a45060019-d155a736a95f-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:16:05 +0200
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5a279ce9475so5803349e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:16:05 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774944965; cv=none;
        d=google.com; s=arc-20240605;
        b=SzwWiOc3zDFSuwE7RGcsD7JHqU3yAASJj/aUq3c1GX3jKUGONDDdbStrBd/ysG4vwT
         avQywB1E0ChE+LYl7TDfA0uZwi8BWgjoTK9FbsghADLIWumXz7+Mby4RcJLazbZXaKY+
         et3HmMepiE6OIZwAo2uio9L7WIrtYwV5GmN8MyCk/a0jrHqj0OzkshneqsQ8bLWpk2Vc
         ZeMU8NjQSsSdltgQ8JDRZ0LTHb1ryAnURUuAiD4L80bEtucPDd1DSo0Zf+2hXJfF+/ZG
         AJrZ396Vdkvjj2ccYUm4s1SKaF/85eFgcO9UyXTwITtJIzriltEPtvv2LgH0BQ9c12AI
         a+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+tM95Sy53sc1fIOGPBQ/xfKbDdyGaFRp+XTES8aHMQ=;
        fh=HHRjWkdysX2ZkNpVMY4DcdwfNbPq2J2BPJfxbJK3Acs=;
        b=Rciwzeqvjs7R7Vw1bA0SxrHpf6IOdV7vo/SiYbgfrzP5/6zDaaXtuTbOjzPIDTKy3e
         UOIVVX0OMYxb8l3NbgmmDsVbqQGduaGv8EeHXV/zEPMRAq7MMcGro5j9TGY1anZiGi+U
         6oFHeoI1l0swDZblYJfquy2eXWphWs6SG+BgZnwODipgAtoUsNxT66JG+Ygr64laY3wh
         2afrkMI7ydua9rEYscbUDhuWs5ADIGUiq/wSb7Yv+hAKzSWYhSMDwaNFBgFU1nZ6EfNJ
         WwZAgmO7PCTLfQheuBqlWZv5CrU/UQJKiB6bolJeB+6i8mF56jWVp1Y7Sz2ZoyRImZO4
         zv+w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774944965; x=1775549765; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+tM95Sy53sc1fIOGPBQ/xfKbDdyGaFRp+XTES8aHMQ=;
        b=aErbcOCexL/u9DEOb4rjlmcq7p+Hz9gw4PnIMNUb0Atwq2VzQoe27b9bUeerzYTwfD
         Di3KyF96QlluDuPErzQ0yEAR1yk9BCQpjlOpIncovaN0ET942/S3u8wPfi8Xa0L/RnQk
         QJMQbgL2yswy1AQNxC7fUCGAbKqBCEaLkbeNbSnadLGJYEFczaeoYDdvFRC6ng7wRRr9
         jDEt73xoQBPz5cg+tcaga5egCozgQn+K3yYz03PCu5wODveWb8rh+ALclsZ2k7rWfG7D
         scca4MaCAdayxOOPdoZDZExyIdkUirTHvJqmZHdGOUkrrVSYzLdHWwtrVQA7iMYurl84
         S+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944965; x=1775549765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+tM95Sy53sc1fIOGPBQ/xfKbDdyGaFRp+XTES8aHMQ=;
        b=KYREoREf9u1m3iujBIzDxoaiteYw9CqsEtMp0EeRxFZ1BKWB7dQXEUGy3seuJK5Vq/
         Eg9L74Sn3A6d1rFnX0F9GsvSNSEGu2cg1N90yxsdXoit28i1PcJm6IP/mQDIBbwy+XSC
         yRZK1HKHyLAsfsqrrqUgam83OeszoTlMFpuJ3/toXIyuhuO9t5MRtUBOHQcx0pmitOsI
         wSNfu6ZMyvYVun+ZHvCJTbR4tRUOZC6D5mOT9vKmP4Hu5XIKN5wxDy58G6XJsjHLn8zi
         xo3sQKuenkEdHniVgCWQHxAYW1iUIsFIc+A4BeqE+qBJ4W4rdHgb1QKS0TQyZiik5QK/
         Wi3Q==
X-Gm-Message-State: AOJu0Yzkt6h7lrl7TA8xdlFdNqN0f6xQAWUJnAXji2vKr4G1l4G/COqD
	OYxdJIBeWnLL88wkfmV0aRQfT2UlN2W9it9YGWj5ltAN5BW5NuYq6J+JB7Fmibn94n5R0fKOKiU
	JLstsQ6wQfMkHK9K6UVWxHx0F+AZGDQ4=
X-Gm-Gg: ATEYQzwT7JgUAz5XhC7fCOLiFhF+UC0lOayT0DsKky8BBbpzcRJkQn/Cvjs4+bWi9d4
	TlOTt4yLxud/Wf/lef+r9WUPYobRNFL9bclyVZKm2xFmfGrO74O5Y/I/Ecw93MZhwNDGKuspxzD
	fkXvWUv0hdSdUI3nheWaB8b7gGKmeBgjpDEH04rG3f3xihlNnP7BD8Aur4JCpt+tr/vFcZsYAPS
	CFu8FG2+Ms3GZ3eXobJbk3YpDVl2uyapGc9aVh6hY1KTllYuY1irq2dgnNjqGWtUgG4dZJ68xhw
	BLDlHbF/R1KV64g=
X-Received: by 2002:a05:6512:3f05:b0:5a1:2e7b:d885 with SMTP id
 2adb3069b0e04-5a2bab21cb1mr877963e87.25.1774944964723; Tue, 31 Mar 2026
 01:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774431310.git.mykola_kvach@epam.com> <10da5cf38dded9c3373c4b0ba54d7f7a7b2fd98f.1774431311.git.mykola_kvach@epam.com>
 <87341ovugw.fsf@epam.com> <CAGeoDV_1Zzh8pxBe=Mf7Yu1OXfNhzH7aFpsT+ktM62DwK-ropg@mail.gmail.com>
 <87a4vovo7u.fsf@epam.com>
In-Reply-To: <87a4vovo7u.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 31 Mar 2026 11:15:53 +0300
X-Gm-Features: AQROBzDWnCI5Y1jylDs0-CZ9TunIGDrww3rL4FGgqoqFBH-QqEbg-y3lhAoIKbc
Message-ID: <CAGeoDV_X8Opf4Hb9Kg43d-sR5WLK1ULHLZ_DZjcoE+U1VfPJvQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] xen/arm: its: add platform match callback for ITS quirks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1774944966-825911C2-7E84CF8A/0/0
X-purgate-type: clean
X-purgate-size: 8255
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 68708365F31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 3:26=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > Hi Volodymyr,
> >
> > Thank you for the review.
> >
> > On Wed, Mar 25, 2026 at 4:45=E2=80=AFPM Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com> wrote:
> >>
> >> Hi Mykola,
> >>
> >> Mykola Kvach <xakep.amatop@gmail.com> writes:
> >>
> >> > From: Mykola Kvach <mykola_kvach@epam.com>
> >> >
> >> > Extend ITS quirk lookup with an optional match callback so that
> >> > platforms sharing the same IIDR can still be distinguished.
> >> >
> >> > Use the board compatible string to positively identify Renesas R-Car
> >> > Gen4 before applying ITS workaround flags, preventing false matches
> >> > on other SoCs that happen to use the same GIC IP block.
> >> >
> >> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >> > ---
> >> >  xen/arch/arm/gic-v3-its.c | 22 +++++++++++++++++++---
> >> >  1 file changed, 19 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> >> > index 00524b43a3..c40629731f 100644
> >> > --- a/xen/arch/arm/gic-v3-its.c
> >> > +++ b/xen/arch/arm/gic-v3-its.c
> >> > @@ -57,6 +57,7 @@ struct its_device {
> >> >   */
> >> >  struct its_quirk {
> >> >      const char *desc;
> >> > +    bool (*match)(const struct host_its *hw_its);
> >>
> >> If you are introducing match predicate, then why do you need...
> >>
> >> >      uint32_t iidr;
> >> >      uint32_t mask;
> >> >      uint32_t flags;
> >>
> >> these? You can use a predicate function to match against iidr
> >
> > The rationale for keeping iidr/mask while adding match() is to keep
> > the quirk table declarative and easy to read. The match() callback is
> > meant only as an optional refinement for ambiguous cases where IIDR
> > alone is not sufficient to identify the platform.
> >
> > In this design, iidr/mask remains the primary match key. If matching
> > were made entirely callback-based, the standard IIDR comparison would
> > have to move into callback code as well. That would make quirk entries
> > more open-coded and less data-driven, while the current split keeps the
> > common case simple and structured.
> >
> > This is also close to what Linux does: IIDR-based matching remains the
> > generic declarative mechanism, and platform-specific checks such as
> > compatible strings are added only where needed.
> >
> > That said, I agree that the callbacks introduced in this series are all
> > doing roughly the same kind of platform identification. A reasonable
> > follow-up cleanup would be to model this more generically, for example
> > by adding an optional compatible string list to struct its_quirk, and
> > reserving match() for cases that cannot be expressed through static
> > data.
> >
> > So the intent here was to keep the table clean, with matching logic
> > effectively being:
> >
> >   quirk_match =3D IIDR match && (no extra match rule || extra match pas=
ses)
> >
> > If you prefer, I can rework this either into a fully callback-based
> > scheme, or introduce generic compatible-string matching in this series
> > and drop the match() callback for now.
>
> Well, I don't think that introducing "compatible" string matching will
> do any good. Actually, I think that it will introduce more problems.
>
> What you can do, is to introduce an additional data:
>
> struct its_quirk {
>         const char *desc;
>         bool (*match)(const struct host_its *hw_its, void *priv);
>         void *priv;
>         uint32_t flags;
> };
>
> struct its_iidr_match {
>         uint32_t iidr;
>         uint32_t mask;
> };
>
> static bool iidr_match(const struct host_its *hw_its, void *priv);
> static bool platform_compatbile_match(const struct host_its *hw_its, void=
 *priv);
>
> static struct its_quirk quirks[] =3D {
>         {.match =3D iidr_match,
>          .priv =3D &(struct its_iidr_match) {.iidr =3D 0xaaaa, .mask =3D =
0xbbbb}},
>         {.match =3D platform_compatbile_match,
>          .priv =3D "renesas,r8a779g0"},
> };
>
> Something like that. In this way you can use either a generic predicate
> function or implement your own for more complex cases.
>
> >
> >>
> >> > @@ -64,11 +65,24 @@ struct its_quirk {
> >> >
> >> >  static uint32_t __ro_after_init its_quirk_flags;
> >> >
> >> > +static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_it=
s)
> >> > +{
> >> > +    if ( !hw_its->dt_node )
> >> > +        return false;
> >> > +
> >> > +    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
> >> > +         !dt_machine_is_compatible("renesas,r8a779g0") )
> >> > +        return false;
> >> > +
> >> > +    return true;
> >> > +}
> >> > +
> >> >  static const struct its_quirk its_quirks[] =3D {
> >> >      {
> >> >          .desc  =3D "R-Car Gen4",
> >> >          .iidr  =3D 0x0201743b,
> >> >          .mask  =3D 0xffffffffU,
> >> > +        .match =3D gicv3_its_match_quirk_gen4,
> >> >          .flags =3D HOST_ITS_WORKAROUND_NC_NS |
> >> >                   HOST_ITS_WORKAROUND_32BIT_ADDR,
> >> >      },
> >> > @@ -77,7 +91,8 @@ static const struct its_quirk its_quirks[] =3D {
> >> >      }
> >> >  };
> >> >
> >> > -static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
> >> > +static const struct its_quirk *gicv3_its_find_quirk(
> >> > +    const struct host_its *hw_its, uint32_t iidr)
> >> >  {
> >> >      const struct its_quirk *quirk =3D its_quirks;
> >> >
> >> > @@ -86,7 +101,8 @@ static const struct its_quirk *gicv3_its_find_qui=
rk(uint32_t iidr)
> >> >          if ( quirk->iidr !=3D (quirk->mask & iidr) )
> >> >              continue;
> >> >
> >> > -        return quirk;
> >> > +        if ( !quirk->match || quirk->match(hw_its) )
> >> > +            return quirk;
> >
> > Also, while reviewing gicv3_its_find_quirk() I realized that the
> > current first-match semantics may not scale well. Since the table
> > supports partial IIDR masks, we could have a broad entry covering
> > an entire GIC family alongside a narrower entry for a specific
> > platform. With first-match, only one of them would ever apply, so
> > their flags could never be combined. The same issue applies to the
> > match() callback: if an entry with match() is checked first and
> > fails, the loop does continue, but if it succeeds, all subsequent
> > entries for the same IIDR -- whether with different masks or different
> > match() predicates -- are skipped entirely.
> >
> > If others agree, I will switch to accumulating flags from all
> > matching entries in v2.
>
> I don't think that there is a good use case for this right now, so
> personally I'd skip flags accumulation. Just write a comment that code
> stops and first match, so more specific quirks should go first.

I see the point about not mixing an open-coded DT property check with
the generic quirk matching path in the first patch of this series.

However, taken together with your comment here, that seems to pull the
design in two different directions.

My concern is that dma-noncoherent is not really an alternative
platform quirk, but an orthogonal ITS property that may need to
coexist with other quirks matched via IIDR, machine compatible, or a
custom match() callback.

With the current first-match semantics, if dma-noncoherent is promoted
to a regular struct its_quirk entry, then only one entry would apply,
and we could not combine it with another platform-specific quirk for
the same ITS. In that model, moving dma-noncoherent into the table
would actually make the behavior less generic, not more.

So I think there are two consistent options:

1. keep first-match semantics and leave dma-noncoherent as a separate
additive property, or
2. move dma-noncoherent into the quirk table and switch the lookup to
accumulate flags from all matching entries.

That is why I brought up accumulation in the first place:
dma-noncoherent looks like a concrete case where quirks are
composable rather than mutually exclusive.


Best regards,
Mykola

>
> --
> WBR, Volodymyr

