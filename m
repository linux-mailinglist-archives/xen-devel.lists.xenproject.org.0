Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H3pEja26WkJiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 08:03:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7C844D66D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 08:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291561.1570441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFn8v-0000C9-JG; Thu, 23 Apr 2026 06:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291561.1570441; Thu, 23 Apr 2026 06:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFn8v-0000Ag-FP; Thu, 23 Apr 2026 06:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1291561;
 Thu, 23 Apr 2026 06:02:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wFn8t-0000Aa-OE
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 06:02:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFn8t-00DGoq-1E
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:02:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e9b5ef-bab6-0a2a0a5309dd-0a2a45078fe8-14
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 08:02:26 +0200
Received: from [209.85.167.41] (helo=mail-lf1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e9b5f2-229c-0a2a45070019-d155a729dc46-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 08:02:26 +0200
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5a3fcb2c718so5292779e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 23:02:26 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1776924146; cv=none;
        d=google.com; s=arc-20240605;
        b=hMjEb9weXROHPQM+rmOR0GGi+G+PlD/iR4jEFGYoStG39xChCalN0g7aSzGnGex836
         Bvi9Mf7gVK1MKh/pwPBu71pTHj1x0ISWQWptMi89Wabt+JIk7bBNiQ/qOoaOVcFi/vYc
         janWTv+nTRLGCxJnh7M1tEw+yWnou/FItNG4dVPQFy6C932mS2sl0S0ANZVkjF6YHncq
         ySDgiIprtf/O4wAJ0NWTnO1zNI5Y2Bs8y3vvLfXjs/k3xDw3E+RQvxhvwkFf0Md2We4C
         OgzmQzzPT7DR2qRu2aP0Bbe8ks2rgkGpOX5s6ZIbOOYv1XRAl5EpepEar0kmLkRhPDnT
         D9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nl7cIH8Ft8KrXNepYu/GHtaIZIBfWGZDLBrbsxutfCw=;
        fh=lnG/EjedhIb/IfplijZjNTuDmIWktIpSdwgeAb6fZ6k=;
        b=jbpoR02C0gU/a8MID/XbWgmKf2vUNWApjWe5n/BomRt6QsEOWWRxjCRGlkFPLk3xE+
         OEhaliE0CWOzHKB6U4qXlB7zMbN6X9bTnVzK9aYj7dEC4kX09o/o41hnhKg4ZhPoJG9m
         quYEtYWm7Vk7Q0otzCeipcvLCOCYRIYyE94+YI7QZAWrCEsr+9s3hQ+g7f9KN7l7fDXv
         mYELhnIRIpFnjGOqJi5zfYFy1YHK7KTnxIOc2pceLhfPsBZ/uLxV7rEVEHTw9azYK49V
         r50FIdzdpSMo+BUHnvGOMM8K1C1IBJM8MMwVQ3LLfLA0Cc1end7ezNz0+6DzMEE1Q5ZZ
         Vi2w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776924146; x=1777528946; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nl7cIH8Ft8KrXNepYu/GHtaIZIBfWGZDLBrbsxutfCw=;
        b=WAnyPxb7FAMCXfYq/weamzwH9wchPYYZrd277UK8QVgh/I5AE2fwnMJmPvRiYpxq89
         vTz73QJHVu70FdUc5m9sAjv/WWgCKy2fVfAA4WsNdstcVoYImIi9FIQGq6vVbgkgAJ8e
         vjIqqtKjBr8+XiqwFjam/+PURZjWuw/b7ChyRGwkbh1W/G8K1zUBV26X/XWHh53EOzDe
         DQub5y6niMYbI0Wdy52/qt3JRgGMJW/99KFoOgvKMaZwSknSvRfUeEeqS5U7zIDBGucA
         JWRBOJGdfqeByljyPd9+3b/XCG4eP7mdqrvs4omegZIA8foHK8RZYcI3WqNz7t4gLruC
         k6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776924146; x=1777528946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nl7cIH8Ft8KrXNepYu/GHtaIZIBfWGZDLBrbsxutfCw=;
        b=CbuF4UzjvRE2r/7e1y/cm+KaEXY/28frOBeGEt0KTbiCjuixl/EzW8VrbrDzi1ult3
         LT9wgkJUgynuxmD2xnLRHDLi+X6sVJ6uuDvA6yxbtMe+AWEQqtgZTObX+ISuT/Ep3GvE
         jDLnFvX55/fjiahrkjHusoE3MQwT8PlF2qGxhBG7YHMJvSbpzzEhPP++xOPYPaApgw42
         +W9iPfSvOzNRWMfcreXV6i+mLRozPdKhOqj2wBpXYO7nOlSTkw2GTXPWFoaNK8AAqYBQ
         he8EDDRR+X6lM3dQ1r9wT3il9v3WFMEsL0CoAtUeZE2jhoYVTGtuu/5YgaGL4tzQiVdF
         v8vg==
X-Gm-Message-State: AOJu0YxP1yXPW3IYN5oKCDnsZyvOcdNMmPiv8iMQNQ/uPFsMBgNXKxgK
	Pro0VHIvJjgvkO4emotExBe5p1eqAhJTAeszJ3KjSq8SkmzUxFog3IiJGX6+7GzMgd8plP7ql5Q
	VPCgP/O5kq6xOIjjqlIyoh7eiYHJ9LMU=
X-Gm-Gg: AeBDiet44kLLl4iECRuVJrlpd3QGnqB9hUbir9+ZwE0l1U5DwQGJvDnWYt9/5hK26qB
	NMrOWOO+evRBXAbrkU0hwQujFHvA5HkhYFyczQpTLx5o3uadJ9RpV04hijk9pRY8QU1mn1A/Ygf
	ziZNhOmouEr4VDCx4lsyJrAHcEbAQhSvNGc/NmqvjyRd54U7cOFntA8ynnP1LFk8jdW7fMU0fVe
	WLCIB4sVQv6eyIg+gqkBbofB2qSEfYlpuI/nsZisFm2/ZN0nGTjcEpKQhdFmvEpXICD7gmteB82
	0cyLmznjSgvFH/Rh
X-Received: by 2002:a05:6512:1189:b0:5a2:b59a:5e99 with SMTP id
 2adb3069b0e04-5a4172e7bdemr8494688e87.22.1776924145838; Wed, 22 Apr 2026
 23:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <7c20230fcd388ebe398ce19a21a1cd3c2c73d5fa.1775839987.git.mykola_kvach@epam.com>
 <9cd3e2f1-1b6f-4946-86c2-ff72f34ba138@amd.com>
In-Reply-To: <9cd3e2f1-1b6f-4946-86c2-ff72f34ba138@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 23 Apr 2026 09:02:14 +0300
X-Gm-Features: AQROBzCNmduihI4PEKZsBSneyCVeFzRWeRZvzdf9Oyv5svjzLUrGsGIoBl9eQsg
Message-ID: <CAGeoDV_79OHToZi3+woaGaMGqZZsQq32neEamxVNQ6RdMp502w@mail.gmail.com>
Subject: Re: [PATCH v2] arm/gicv3: Decode cacheability fields before comparing
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1776924146-2B979C48-5202E71C/0/0
X-purgate-type: clean
X-purgate-size: 4396
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9F7C844D66D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thank you for the review.

On Mon, Apr 13, 2026 at 12:28=E2=80=AFPM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 10/04/2026 19:34, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > GITS_BASER_INNER_CACHEABILITY_MASK and
> > GICR_PROPBASER_INNER_CACHEABILITY_MASK are shifted masks. Comparing the
> > masked but unshifted values against GIC_BASER_CACHE_nC, which is an
> > unshifted enum value, leads to incorrect detection of non-cacheable
> > GITS_CBASER command queue, GITS_BASER tables, and GICR_PROPBASER
> > mappings.
> >
> > Use MASK_EXTR() to decode these cacheability fields before comparing
> > against GIC_BASER_CACHE_nC, so the backing memory is flushed when
> > required.
> >
> > Fixes: 8ed8d21373be ("ARM: GICv3 ITS: map ITS command buffer")
> > Fixes: 05238012b86d ("ARM: GICv3 ITS: allocate device and collection ta=
ble")
> > Fixes: c9b939863c89 ("ARM: GICv3: allocate LPI pending and property tab=
le")
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - use MASK_EXTR() instead of open-coding the BASER field shift
> > - fix the analogous PROPBASER cacheability comparison in
> >   gicv3_lpi_set_proptable()
> > - fix the CBASER command queue cacheability check as well
> > ---
> >  xen/arch/arm/gic-v3-its.c | 6 ++++--
> >  xen/arch/arm/gic-v3-lpi.c | 3 ++-
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 9ba068c46f..e87465d2ff 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -424,7 +424,8 @@ static void *its_map_cbaser(struct host_its *its)
> >       * If the command queue memory is mapped as uncached, we need to f=
lush
> >       * it on every access.
> >       */
> > -    if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
> You don't seem to mention this change. This one does not compare to
> GIC_BASER_CACHE_nC and checks against 0, which means we are on the safe s=
ide. If
> you still want to change it, then you should also look few lines above wh=
ere we
> have:
> if ( (reg & GITS_BASER_SHAREABILITY_MASK) =3D=3D 0 )
>
> > +    if ( MASK_EXTR(reg, GITS_BASER_INNER_CACHEABILITY_MASK) <=3D
> > +         GIC_BASER_CACHE_nC )
> This is a functional change. Previously we where comparing against 0 and =
now you
> compare against <=3D 1

You are right, the CBASER hunk is not fixing the same shifted-mask
comparison bug as the BASER/PROPBASER hunks.

My intention was to also handle InnerCache =3D=3D 0b001, which is Normal
Inner Non-cacheable, so the command queue should need flushing in that
case as well. I agree this is a separate functional change.

I will drop the CBASER hunk from this patch to keep it focused on the
BASER/PROPBASER shifted-mask fix. I will send the CBASER change
separately with a dedicated explanation.

Best regards,
Mykola

>
> ~Michal
>
> >      {
> >          its->flags |=3D HOST_ITS_FLUSH_CMD_QUEUE;
> >          printk(XENLOG_WARNING "using non-cacheable ITS command queue\n=
");
> > @@ -496,7 +497,8 @@ retry:
> >          }
> >          attr =3D regc & BASER_ATTR_MASK;
> >      }
> > -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER_CA=
CHE_nC )
> > +    if ( MASK_EXTR(regc, GITS_BASER_INNER_CACHEABILITY_MASK) <=3D
> > +         GIC_BASER_CACHE_nC )
> >          clean_and_invalidate_dcache_va_range(buffer, table_size);
> >
> >      /* If the host accepted our page size, we are done. */
> > diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> > index de5052e5cf..9ee338edc2 100644
> > --- a/xen/arch/arm/gic-v3-lpi.c
> > +++ b/xen/arch/arm/gic-v3-lpi.c
> > @@ -351,7 +351,8 @@ static int gicv3_lpi_set_proptable(void __iomem * r=
dist_base)
> >      }
> >
> >      /* Remember that we have to flush the property table if non-cachea=
ble. */
> > -    if ( (reg & GICR_PROPBASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER=
_CACHE_nC )
> > +    if ( MASK_EXTR(reg, GICR_PROPBASER_INNER_CACHEABILITY_MASK) <=3D
> > +         GIC_BASER_CACHE_nC )
> >      {
> >          lpi_data.flags |=3D LPI_PROPTABLE_NEEDS_FLUSHING;
> >          /* Update the redistributors knowledge about the attributes. *=
/
>

