Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /0bgKhj30GmjCwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 04 Apr 2026 13:33:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE039AF0F
	for <lists+xen-devel@lfdr.de>; Sat, 04 Apr 2026 13:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1273628.1560242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8zEv-0001wx-V7; Sat, 04 Apr 2026 11:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1273628.1560242; Sat, 04 Apr 2026 11:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8zEv-0001um-Rz; Sat, 04 Apr 2026 11:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1273628;
 Sat, 04 Apr 2026 11:32:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1w8zEu-0001ug-2c
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 11:32:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8zEt-003J0d-Ek
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 13:32:31 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69d0f6c2-5cb7-0a2a0a5109dd-0a2a450589c6-12
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 13:32:31 +0200
Received: from [74.125.224.50] (helo=mail-yx1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <freddy77@gmail.com>)
 id 69d0f6ce-3760-0a2a45050019-4a7de032c071-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 13:32:31 +0200
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-65009bfdcfdso2736914d50.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 04:32:31 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1775302350; cv=none;
        d=google.com; s=arc-20240605;
        b=JQRxQQOHWy4IgqgNYUm0IdKHxqJmBWyZXk8xsQY84e1uO+5uk3zVkErLB+9Ps+b8RR
         VLVsMeaWxMmb7T366PVO/U9/cwtXopAuItdEWl94caziAkhJzUCb8ht9pcAkKyurOZub
         KEZsgqawnzDmpgCNex5Kx2IVb5Nkv0gkpigH8j6CwlXdKZy0vqv6s86hJ8yx0R6WlSia
         H+02OubRmIZCni5g1x9WDL+vDhCk/j3a9+GSeZCqTLCDsxoZcKiAM1SccJwzyB9d7EGK
         TQi1B7T1r+QFPS+p++xx/n6XF/9hjbKhjKJsRUz1MAuXcLgkCggYUG/43q+lvVnHnU9g
         8hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qSgJUGOjVvt6CunX03PcQu1j3L3Kic8yq9H+84Der8g=;
        fh=jtpI8BNv+OQCCB7Kc0MT2qsQdfu4U3IegNxehlgRw8Y=;
        b=YsCcweSqNCvDj3eEciFcFUM5wsB9N0BYqLyAjoYrIZPkuoUn7StGkcqYFrNdiNslsE
         n3b1NBTNv2Ek26WBG8ZMNOolfNDZ4pDikkDD/qMz1UKZVaA2n3ENhgdaCmzCudNvsQVG
         y2kPTIMKrmbRhIpKNXqPgo/2TI1ngbipacpXCnJOY1RkiOAw4jooZkHmiId9Xfn+Iuop
         Y60/kyaR7Ez5vdXXDZtzzMOpBn8l10vTjf8huE8TZlOntN3RX5z2SC2a/VFDwqsxMUlN
         alqxyPbbK8KVYjJR0b2OU/k/PE/mbQ+evHVRQfQchwUNWQMIi5opqWYSlCnmyjQHnU4p
         3xmg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775302350; x=1775907150; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSgJUGOjVvt6CunX03PcQu1j3L3Kic8yq9H+84Der8g=;
        b=qGp//11lcFrkOg6Xh7UmzWvWYee+kGdrBFAIyMJLkka1DwoJEIOxdFiD8G3RkjKEOZ
         dPJJmiBQ4sh2jUQXFKXhPeYi7Kr6Uxe/1gTJQIGfBKXALx41kfqxIyi6AiV9PIYZtBEv
         rXQF7z0jS8xyNSxbERmAgmapcSln0g7I/qRCzhmeEECHJeYuagX3Cy3QxXTvv9PV2qo+
         4XLODwAJ+Lts7sZn7Fd99L4diN5+yzrLqMp8vBGY42LZx3gdCVAGIfoPfvaj35hXcszf
         gzAp3oGlvNzacdxVJyrvPEDr/8BvDrwnGAFlkMNpCePyjFVP301RtobqJ5/W5WSFVD6v
         R5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775302350; x=1775907150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSgJUGOjVvt6CunX03PcQu1j3L3Kic8yq9H+84Der8g=;
        b=D4GjWElfYBVM0ivrFXK9ryjRO106vF3bRSrhZEd26PCnC2EkFy3DCKMIufq1AlJhp6
         td4+C+2FQGlfer4Ty9x1oNSqDlW1jrCL7uPM11bobj5WNX7nKAo7Fs6vqJaZRpJMu7nx
         5W0Tv6RvFhvN27cZNIbxmfs6BZ8cy6pAxb93mjeOyimMClHyyWNlHhI0yPUMY4DRG72Z
         bD0Z8mI0nM/I0WfivsY+g9f10CsMaOznAgQbLtxDrtPr3E9HLqrxb66W8Urzh/khMWSY
         mrox/NfshlFCYER0Gj1f9YV8Hs57lCayRdxWAUr1h/OA3fRiHrMo6kjVA5c9oPUP6IMf
         GBIA==
X-Gm-Message-State: AOJu0YwI7HYvBcuF+DQnDRlwDU3oJAVhtjoFaHWUFyCwHq4hNFKYNWNz
	qWQCFs85meHo1r21nR8nb3nTbnzA92bEe6JVQVd0561Rk9Wbd974p/f2RXEFTnvL2LaofUlvb4T
	CDhaWNV9eEGMrunVaVQR2wQIj8/YgwVI=
X-Gm-Gg: AeBDietDWroRf8Y7ep91OccYfqZ7ebnjCJMkx+vwxYxBkN2OkcZHyaf4K4mws/2jeky
	q15hbO4PvtsSwCwdx1JQb2Sr/8yMmcGATcJZR8GS/ywaBn0eEc3VeiZxlCjYACJyOW80BbTLskm
	MuRzADvrmOGzNZr8VFiEwIRtsUw79/g2zGvhx1C7uiD+QUCSz0KdvUbJawzw8iv9uu1fvgApiFm
	HS7+0tvShn5oePgQE0x9MIYh2wwQ6Ftyez87YE6cXZgo9Sm/YhOr3RE/8ZEYGre2zt6zEoZczN6
	d52NWLjN7NTQ7zya
X-Received: by 2002:a05:690e:140b:b0:64a:e589:ecb2 with SMTP id
 956f58d0204a3-65048877510mr5853419d50.62.1775302349827; Sat, 04 Apr 2026
 04:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260402155512.80170-1-frediano.ziglio@cloud.com> <ac-SNHWwML98cLYA@wifi-campus-l-10-3-197-236.u-ga.fr>
In-Reply-To: <ac-SNHWwML98cLYA@wifi-campus-l-10-3-197-236.u-ga.fr>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 4 Apr 2026 12:32:18 +0100
X-Gm-Features: AQROBzA2RkU_b1hqzlm5riiCwhlWPKxXibwghJW3qQteUFSuVYYYfA4AzhDVtUk
Message-ID: <CAHt6W4c-aF+6+Cb6XKMGs_gr9RhsZHPJN1uN7KeH1F1MJqT+FA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/x86: Check supported features even for PVH dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1775302351-30D3796F-605BCF37/0/0
X-purgate-type: clean
X-purgate-size: 2761
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,citrix.com:email,cloud.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: CEAE039AF0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 3 Apr 2026 at 11:11, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>
> On Thu, Apr 02, 2026 at 04:55:10PM +0100, Frediano Ziglio wrote:
> > The supported features ELF notes was tested only if the dom0 was
> > PV. Factor out a function to check ELF notes and reuse it even
> > for PVH.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > --
> > Changes since v1:
> > - fix typo in title;
> > - fix minor formatting issue;
> > - use is_hardware_domain instead of checking is_pv_shim;
> > - reduce indentation returning earlier;
> > - return error instead of jumping to cleanup code.
> > ---
> >  xen/arch/x86/dom0_build.c             | 14 ++++++++++++++
> >  xen/arch/x86/hvm/dom0_build.c         |  3 +++
> >  xen/arch/x86/include/asm/dom0_build.h |  2 ++
> >  xen/arch/x86/pv/dom0_build.c          | 10 ++--------
> >  4 files changed, 21 insertions(+), 8 deletions(-)
> >
> > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > index 864dd9e53e..a33ce77321 100644
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struc=
t domain *d,
> >      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
> >  }
> >
> > +int __init dom0_check_parms(
> > +    struct domain *d, const struct elf_dom_parms *parms)
>
> d should be const also.
>
> > +{
> > +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type =3D=3D =
XEN_ENT_NONE )
> > +        return 0;
> > +
> > +    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_sup=
ported) )
> > +    {
> > +        printk("Kernel does not support Dom0 operation\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    return 0;
> > +}
> >
> >  /*
> >   * If allocation isn't specified, reserve 1/16th of available memory f=
or
> > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_buil=
d.c
> > index d69a83b089..f95a00acfd 100644
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -699,6 +699,9 @@ static int __init pvh_load_kernel(
> >      if ( !check_and_adjust_load_address(d, &elf, &parms) )
> >          return -ENOSPC;
> >
> > +    if ( (rc =3D dom0_check_parms(d, &parms)) !=3D 0 )
> > +        return rc;
>
> I would do the check ahead of check_and_adjust_load_address(), as then
> we could avoid the load address adjustment if we detect earlier than
> the dom0 feature is not present.  But that's just my taste.
>
> I can adjust the const-ification of d on commit if there are no
> further objections:
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Thanks, Roger.

Fine with me.

Frediano

