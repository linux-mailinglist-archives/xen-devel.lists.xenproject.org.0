Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFGSDaEOxGk+vgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 17:34:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92654329175
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 17:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262754.1555152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RBT-0003N7-Fq; Wed, 25 Mar 2026 16:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262754.1555152; Wed, 25 Mar 2026 16:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RBT-0003LW-D0; Wed, 25 Mar 2026 16:34:19 +0000
Received: by outflank-mailman (input) for mailman id 1262754;
 Wed, 25 Mar 2026 16:34:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5RBS-0003L6-5U
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:34:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5RBP-00DOOh-Hq
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:34:17 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c40e74-e002-0a2a0a5209dd-0a2a4508cdaa-38
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 17:34:16 +0100
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c40e88-1950-0a2a45080019-d155a730a85a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 17:34:16 +0100
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a1443780c4so1040140e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 09:34:16 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774456456; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBkI3sC0XliC+PVcAXXT/ZyUmkaG4YCEGPpnhjNSipQyQTk7RV5JMVex89R7Hfn9Aq
         zZmJGYSELD+W0n+mau6Ii3L0CaJMrE+s7qn0AOc2xo2tCswmUsJOGm6UZa+SGY/an/Gn
         E5p1NMHn8ZhjRtD8exvSS64ZesnPppjQDQdHGS4iCc+upT+CLXMvfICXEjEtL78vIC4C
         skp9t2hjOHUeMWPx/x6YWjLgNmwNhHPp2pMyeZMwgrfLVqcfRn5X8bTZxuMSWA/RzN5D
         k4uzJdrtyyIy+Rtzp7NYvxbqWKY0tqAqi82FzgsH0yXr2BmFvvRyAe3xMxpSnkwcNo2b
         eYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oTEq9ukb/cjWdMxVcUQOINtz10aJOqZ6riJGIfoU3Sc=;
        fh=HHRjWkdysX2ZkNpVMY4DcdwfNbPq2J2BPJfxbJK3Acs=;
        b=UfcMGxgy9rNlqj3h20z3PZR9U7QcOW7tlQopgKaA45v/UWlJL+PaX4rvJaiatp80Zl
         v8Fmr6iWfUvOPdFK66GYsEa63BcBu/G50PpCt3FfKZKDIguvFIBzL3iu72SHzyJ0x/DP
         Qig+5bstFCJ6PV6tkknDmV+OuqxTtY31olPbuRmXSm9UrRd7Xps0eZR8tWR7tc8AWpU4
         J+sSExj7/Q8m/vPLCgcgORmRegjy0hfDSY5a2xjcgRBTUvEKj8CeBcTJlBqLWhcO51yR
         FBxwBnigNYZcQ9FDuvxP0Hl17miCm8vmXzJPBMIU+h09ROBFRHckDwQVV3Xijk6tPgqT
         hUKQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774456456; x=1775061256; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTEq9ukb/cjWdMxVcUQOINtz10aJOqZ6riJGIfoU3Sc=;
        b=kAQfd8cIU5FM90qq+wlsqqBMMMmobxdLQFgDlDd4e655cPA+bcFGu5rjMUXqhBWeXI
         9BeDSh5VOdtjRu4fdGlc5LLDSmCM/T9Wz/c0sFSCX/2a3qvw9cbtgy/ErBrmKlUAyhfi
         XHqztYZh120f2hQk9sVQBV8ig+3UggxtFfTx1ncaDQy4xGWWj0zXfK+pmit40QwCAUs3
         Hmxu9x8cUQXEfwnsiL5ijT24/6TFap55GpSR14iJ7N2S0JhLWZBuCmETniNaD6ZNiyPz
         NsmrjwBX6aNVmwjvPixz9FRUxY/OwJNo9vavlsoy49hThnyGfRIZK3+XIWOzNJ/MxWQK
         q+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456456; x=1775061256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oTEq9ukb/cjWdMxVcUQOINtz10aJOqZ6riJGIfoU3Sc=;
        b=OaND5PyGx3y1ayCxVYbYCU5ANgEHF265mkAuhsQNxQnU9kLvQ1gUzUKKb3xp52BiqS
         za7Oz8jAhqkSZXvM+qmB7KcwEPDlMQ3nKdM+ZiCiCXFmWt6U1nGGkUUGteMipw/kXiWy
         KnwDciA3KYIuWT7snViD+9LO5FpQ4PY18hyxXQRAjZr6vzSMNM479mwFFhSs9WAvvmpJ
         qVSZIuuV/TCeKgyxZrBedzPnZDfMxZhuHwKEKE+zZyUd3mCiMiRYLRpDJjXHRml74YjY
         zHUJFZAf117sG4sqinrywS2aZWEXMmxHiMUbMI4OacO71ROzRkOcCohrVVYZni2P12yu
         NRMQ==
X-Gm-Message-State: AOJu0Yw0EXV7SOhZyXzqgpRpnOXgHSDc7vttw6KVZdbl2LJ39rpzF1WV
	0jNfpJ2bPf8vaYgiTRLAwcm3i4wm08iqUm9lN1HOIAFeGHC5iqtXx2KnNwiOg2SERyrNq+L3r1x
	fzk3y9KDoLp0IOrl40lW//XPJ/TyWk4I=
X-Gm-Gg: ATEYQzx5+668Sg3sxzSjv78IjCMVaiPSCtCLyUl6cM6gXf2lZyf3CqdsEdPAmpMou4S
	ITx0vbNGhBeRp8026HgfOPjcoM8CgyuGEd7YOI1DJlNLEMQaaPYsImPHjsjCCFF54+dTkcOCazd
	3HdBpDRn1LHG/PTGM8ZYmXM39XkVfuFZfralXXLcPSRZngQ5VYHQJ9T75icZjZwrsnVgcc4X+8D
	RynbXxyd6NG/1rb43RXOl3FmyfEOFePY6Is8I8JToPrLgB5VjkntnJ7x0ozqum7j9h1UIw6Q7v9
	QXvQ9F0JMXys0Mw=
X-Received: by 2002:a05:6512:318f:b0:5a0:4ca4:4872 with SMTP id
 2adb3069b0e04-5a29b4ef506mr1498140e87.5.1774456455488; Wed, 25 Mar 2026
 09:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774431310.git.mykola_kvach@epam.com> <10da5cf38dded9c3373c4b0ba54d7f7a7b2fd98f.1774431311.git.mykola_kvach@epam.com>
 <87341ovugw.fsf@epam.com>
In-Reply-To: <87341ovugw.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 25 Mar 2026 18:34:04 +0200
X-Gm-Features: AaiRm51RmYn8g3aoKcsDWCg6iUpTKZ4RjUpaY2awpdyuUE5YQdrF3YhOTjgHPfY
Message-ID: <CAGeoDV_1Zzh8pxBe=Mf7Yu1OXfNhzH7aFpsT+ktM62DwK-ropg@mail.gmail.com>
Subject: Re: [PATCH 2/4] xen/arm: its: add platform match callback for ITS quirks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1774456456-EA892726-61C79DD5/0/0
X-purgate-type: clean
X-purgate-size: 5559
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 92654329175
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Volodymyr,

Thank you for the review.

On Wed, Mar 25, 2026 at 4:45=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Extend ITS quirk lookup with an optional match callback so that
> > platforms sharing the same IIDR can still be distinguished.
> >
> > Use the board compatible string to positively identify Renesas R-Car
> > Gen4 before applying ITS workaround flags, preventing false matches
> > on other SoCs that happen to use the same GIC IP block.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/arch/arm/gic-v3-its.c | 22 +++++++++++++++++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 00524b43a3..c40629731f 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -57,6 +57,7 @@ struct its_device {
> >   */
> >  struct its_quirk {
> >      const char *desc;
> > +    bool (*match)(const struct host_its *hw_its);
>
> If you are introducing match predicate, then why do you need...
>
> >      uint32_t iidr;
> >      uint32_t mask;
> >      uint32_t flags;
>
> these? You can use a predicate function to match against iidr

The rationale for keeping iidr/mask while adding match() is to keep
the quirk table declarative and easy to read. The match() callback is
meant only as an optional refinement for ambiguous cases where IIDR
alone is not sufficient to identify the platform.

In this design, iidr/mask remains the primary match key. If matching
were made entirely callback-based, the standard IIDR comparison would
have to move into callback code as well. That would make quirk entries
more open-coded and less data-driven, while the current split keeps the
common case simple and structured.

This is also close to what Linux does: IIDR-based matching remains the
generic declarative mechanism, and platform-specific checks such as
compatible strings are added only where needed.

That said, I agree that the callbacks introduced in this series are all
doing roughly the same kind of platform identification. A reasonable
follow-up cleanup would be to model this more generically, for example
by adding an optional compatible string list to struct its_quirk, and
reserving match() for cases that cannot be expressed through static
data.

So the intent here was to keep the table clean, with matching logic
effectively being:

  quirk_match =3D IIDR match && (no extra match rule || extra match passes)

If you prefer, I can rework this either into a fully callback-based
scheme, or introduce generic compatible-string matching in this series
and drop the match() callback for now.

>
> > @@ -64,11 +65,24 @@ struct its_quirk {
> >
> >  static uint32_t __ro_after_init its_quirk_flags;
> >
> > +static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_its)
> > +{
> > +    if ( !hw_its->dt_node )
> > +        return false;
> > +
> > +    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
> > +         !dt_machine_is_compatible("renesas,r8a779g0") )
> > +        return false;
> > +
> > +    return true;
> > +}
> > +
> >  static const struct its_quirk its_quirks[] =3D {
> >      {
> >          .desc  =3D "R-Car Gen4",
> >          .iidr  =3D 0x0201743b,
> >          .mask  =3D 0xffffffffU,
> > +        .match =3D gicv3_its_match_quirk_gen4,
> >          .flags =3D HOST_ITS_WORKAROUND_NC_NS |
> >                   HOST_ITS_WORKAROUND_32BIT_ADDR,
> >      },
> > @@ -77,7 +91,8 @@ static const struct its_quirk its_quirks[] =3D {
> >      }
> >  };
> >
> > -static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
> > +static const struct its_quirk *gicv3_its_find_quirk(
> > +    const struct host_its *hw_its, uint32_t iidr)
> >  {
> >      const struct its_quirk *quirk =3D its_quirks;
> >
> > @@ -86,7 +101,8 @@ static const struct its_quirk *gicv3_its_find_quirk(=
uint32_t iidr)
> >          if ( quirk->iidr !=3D (quirk->mask & iidr) )
> >              continue;
> >
> > -        return quirk;
> > +        if ( !quirk->match || quirk->match(hw_its) )
> > +            return quirk;

Also, while reviewing gicv3_its_find_quirk() I realized that the
current first-match semantics may not scale well. Since the table
supports partial IIDR masks, we could have a broad entry covering
an entire GIC family alongside a narrower entry for a specific
platform. With first-match, only one of them would ever apply, so
their flags could never be combined. The same issue applies to the
match() callback: if an entry with match() is checked first and
fails, the loop does continue, but if it succeeds, all subsequent
entries for the same IIDR -- whether with different masks or different
match() predicates -- are skipped entirely.

If others agree, I will switch to accumulating flags from all
matching entries in v2.


Best regards,
Mykola

> >      }
> >
> >      return NULL;
> > @@ -99,7 +115,7 @@ static uint32_t gicv3_its_collect_quirks(const struc=
t host_its *hw_its,
> >      uint32_t flags =3D 0;
> >      uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
> >
> > -    quirk =3D gicv3_its_find_quirk(iidr);
> > +    quirk =3D gicv3_its_find_quirk(hw_its, iidr);
> >      if ( quirk )
> >          flags |=3D quirk->flags;
>
> --
> WBR, Volodymyr

