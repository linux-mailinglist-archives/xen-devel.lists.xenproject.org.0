Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIkrDc6FxWlc+wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:15:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1D033ACAF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264757.1556130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5qAY-00069d-Jn; Thu, 26 Mar 2026 19:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264757.1556130; Thu, 26 Mar 2026 19:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5qAY-000683-Gd; Thu, 26 Mar 2026 19:15:02 +0000
Received: by outflank-mailman (input) for mailman id 1264757;
 Thu, 26 Mar 2026 19:15:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1w5qAW-00067w-4r
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 19:15:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5qAV-00458i-Dl
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 20:14:59 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69c5855e-e002-0a2a0a5209dd-0a2a4504bbce-46
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:14:59 +0100
Received: from [74.125.224.42] (helo=mail-yx1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <freddy77@gmail.com>)
 id 69c585b2-c823-0a2a45040019-4a7de02ac537-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:14:59 +0100
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-64ad79df972so1836078d50.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:14:58 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774552498; cv=none;
        d=google.com; s=arc-20240605;
        b=adkXrNpFMLqSOfnVe3NrNgXskxDL08oOXngiYDuz7TJZrjQFfGFs1ANl3SQ8gRIMV4
         kWRpiGDzAGfhYHnev/Pwt9TKHXS7zANJTtPmGDh7e1G8EcKHnrktY4O0ZR9cXOPcPYYg
         WCLdBo7NgbqB6vuP6e9mZTfaITlwlC4mlPKM39bkUpQWqpCm5wkf9k/QdAH7kuFE/hPx
         rT2JIjQOV8VOxn4oaYFa5cZ65KiZK1BJQ1A6HPfa6ShianVoR4tAUJzCjzL7CWr4VfjZ
         F/Nh0ptCeH+nGDV2J3eQumEvD+naW6BdTfLYsmmq8Kh8gyL25bxzZmywSp4qLnSJ5I9r
         nQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lVFuSMksdyADcslAlhv6lqx1bDjOdzZURNTs4avd3vg=;
        fh=vbpVoJ5l7XM4cklfGt2URSohpvrbMSl2gtnTqP4q0+w=;
        b=ek5So7NYQMgh/07plnFNASeTRUDmqLMZFVRSn18XYphyxwfNn7Qyz89dbYpl8UGKiK
         lVPwKRhPHR+fqmsjvunE+5soB54RBhE3leRMMP8q7iyumMsGLVpRflPHdaPJAukFNMMQ
         GY2mWnBWxn6gjs4vYUoxE0OFxRk5CnCeAZfZ7J9t27B17BzgukvPq1DggkpbkCrYyJBH
         4eHqdoNTZ0LYOMXJj/F1HPXl/eAcoScmgQZyYEfGGzzpXE8S9wC1PCOp9RX+3W4TRjem
         x3NoPY2AtNDle9EsPHvus88MbPxCSRMkCu27lADvpc25qc+EsP9RoklG4vstESCCXL1e
         Zixg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774552498; x=1775157298; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVFuSMksdyADcslAlhv6lqx1bDjOdzZURNTs4avd3vg=;
        b=RmilSV2YAEuZZqTnK63j2hz7M//Ah92ykRoYQclfitg3294dA3vC8nIf3nV0jm0DYW
         FAGXP5fDNlYp5A9ioDY69u0G1qozzaj3ZQeZeXoY7mDVITxI7VqAk/ABjmB7MwevIAx2
         ku12wkuUrTq8+MwFkBOLxcBdnGxFvLxVP4IpHjFXnzk1eIgMQ05pGATu9XMS9SAodMis
         cV/KRuCfYweyJFEEzMpYTko5T/yirbHhoKWphWy0NZYOTzTmkCl9I+9BnyCFHqU6laJc
         0kyO6jiKqmNLWZ7/H8CcKEOEgBVnrP+24LMGKQzZ+AldsKiihR96zFXR5nsawW+lwaYg
         1e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774552498; x=1775157298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVFuSMksdyADcslAlhv6lqx1bDjOdzZURNTs4avd3vg=;
        b=h1/XtfL+iyXCj8G5DZODNRsK8Jj6m7AhgO0asOUedlN5/TkihIATMzmqXAA5g7044q
         83qyEWYUA8z8+G6/8f79kds7eMwez3/xt/3kYLnOyg7ykK3uGDb3YcsmXBJVHsbciaz/
         NVzIsN3NLPxkSrMfP90qo52/sjHHoYSV7pMr9ZIPJUa1EZjVUB3YYOl4XMwuj7lF+QqJ
         ws/JCqiwUQe0AbnDUPS7B+z6E1lDxeydBPs78s/emwgQ8+ltxrfaQta+q/8GCeQ659vg
         5E4W1uuFDAWNJxGzJIk0XUumEpuUUatzXjxho4LnKcTIiEkqtumjn5Zgd+OuWZxMQ0yT
         U3jQ==
X-Gm-Message-State: AOJu0YyEncvMP1ssjzE9hy90smlu0H/+TdVBERf2MeBRbF4Va86qGird
	MdDq5gyzOn8jG4Ai3J4vNIXuH3/DA8vcdyG9SIF1NtUAZRF5n+JyKaI3HG4fHYG6mQns1bbOptv
	pyAB9Vc2A2aVyU6+2ltvG9XbMOPjhZ0M=
X-Gm-Gg: ATEYQzxHbgZJ54O06++HOXNXdhtCjXx/sBU2hEP4fGVbc2iP98L9G+yxyvvhm8Q4ds3
	UnZeff2s137Jpu8s2nujOAK/wuTNrIitbNsoGoFqYdnSJz2wFY6+IgKoDov++ImV/ujWDafaqHA
	OYLJqaCofNDnwRsiOqB5bLMFtTVjzEoFLd09fi4eZkLSwZZuzQkufv1xMrYZ+O6Dj+yhP/OWMEU
	g84HgiAXUw1Rz2Cau27TjQZUnO374+XKwQ13t1FDrQsE4d+u51UOhMgYM/pEh0KjeTty/6H2J4O
	9KE5QIXcfQQHa9er
X-Received: by 2002:a53:c986:0:b0:64a:e959:b3be with SMTP id
 956f58d0204a3-64ee6382833mr6734046d50.71.1774552497616; Thu, 26 Mar 2026
 12:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHt6W4f0iSN5vqbPHTCv6dLdoxUFXivoPX8BYV+gurxxv9q66Q@mail.gmail.com>
 <acUDmOqvggJfmhHu@macbook.local>
In-Reply-To: <acUDmOqvggJfmhHu@macbook.local>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 26 Mar 2026 19:14:45 +0000
X-Gm-Features: AQROBzBQZ_pkw89o0LWAXpKoJp7MBwY460TB1LFSHHkxuPpnpnx_z5OvlQstXhs
Message-ID: <CAHt6W4fDAPpTB5kj_TdtPa3Of=shrtOtqyh3AsEkOeaam2q=5g@mail.gmail.com>
Subject: Re: [PATCH] xen/x86: Check supported features even for PHV dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1774552499-BBA969D1-4658C0A4/0/0
X-purgate-type: clean
X-purgate-size: 4684
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BC1D033ACAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 09:59, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>
> Typo on the subject s/PHV/PVH/.
>

Fixed.

> On Wed, Mar 25, 2026 at 03:55:28PM +0000, Frediano Ziglio wrote:
> > The supported features ELF note was tested only if the dom0 was
> > PV. Factor out a function to check ELF notes and reuse it even
> > for PVH.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > ---
> >  xen/arch/x86/dom0_build.c             | 16 ++++++++++++++++
> >  xen/arch/x86/hvm/dom0_build.c         |  3 +++
> >  xen/arch/x86/include/asm/dom0_build.h |  2 ++
> >  xen/arch/x86/pv/dom0_build.c          | 10 ++--------
> >  4 files changed, 23 insertions(+), 8 deletions(-)
> >
> > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > index 864dd9e53e..c6bb2f8067 100644
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -321,6 +321,22 @@ unsigned long __init dom0_paging_pages(const
> > struct domain *d,
> >  }
> >
> >
> > +int __init dom0_check_parms(
> > +    const struct elf_dom_parms *parms, bool is_pv_shim)
> > +{
> > +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type !=3D
> > XEN_ENT_NONE )
>
> The patch seems to be mangled here?
>

email client, sorry about it.

> And the line is too long otherwise.  You might want to consider
> returning early here, to reduce the indentation of the following code
> block.
>

The line is actually exactly 80 characters, so it fits.

What about combining the 2 ifs instead ? In this case I would probably
need to split the line.

> > +    {
> > +        if ( !is_pv_shim && !test_bit(XENFEAT_dom0, parms->f_supported=
) )
>
> I think you want to pass the domain being built to this function, so
> you can do a check like:
>
> if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported)=
 )
> {
>     printk(...
>
> That way you don't need to explicitly check for pv-shim mode, and
> would more naturally work with things like
> Hyperlaunch/dom0less/late-hwdom.
>

It's not clear why. Are you saying that dom0 could be a no-hardware domain?
Wouldn't that change introduce a regression?

> > +        {
> > +            printk("Kernel does not support Dom0 operation\n");
> > +            return -EINVAL;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +
> >  /*
> >   * If allocation isn't specified, reserve 1/16th of available memory f=
or
> >   * things like DMA buffers. This reservation is clamped to a maximum o=
f 128MB.
> > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_buil=
d.c
> > index d69a83b089..ca96f32acd 100644
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -699,6 +699,9 @@ static int __init pvh_load_kernel(
> >      if ( !check_and_adjust_load_address(d, &elf, &parms) )
> >          return -ENOSPC;
> >
> > +    if ( (rc =3D dom0_check_parms(&parms, false)) !=3D 0 )
> > +        return rc;
> > +
> >      elf_set_vcpu(&elf, v);
> >      rc =3D elf_load_binary(&elf);
> >      if ( rc < 0 )
> > diff --git a/xen/arch/x86/include/asm/dom0_build.h
> > b/xen/arch/x86/include/asm/dom0_build.h
> > index ff021c24af..a322bf455c 100644
> > --- a/xen/arch/x86/include/asm/dom0_build.h
> > +++ b/xen/arch/x86/include/asm/dom0_build.h
> > @@ -8,6 +8,8 @@
> >
> >  extern unsigned int dom0_memflags;
> >
> > +int dom0_check_parms(const struct elf_dom_parms *parms,
> > +                     bool is_pv_shim);
> >  unsigned long dom0_compute_nr_pages(struct domain *d,
> >                                      struct elf_dom_parms *parms,
> >                                      unsigned long initrd_len);
> > diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.=
c
> > index 075a3646c2..9d0310ad91 100644
> > --- a/xen/arch/x86/pv/dom0_build.c
> > +++ b/xen/arch/x86/pv/dom0_build.c
> > @@ -494,14 +494,8 @@ static int __init dom0_construct(const struct
> > boot_domain *bd)
> >          return -EINVAL;
> >      }
> >
> > -    if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type !=3D XEN=
_ENT_NONE )
> > -    {
> > -        if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
> > -        {
> > -            printk("Kernel does not support Dom0 operation\n");
> > -            return -EINVAL;
> > -        }
> > -    }
> > +    if ( (rc =3D dom0_check_parms(&parms, pv_shim)) !=3D 0 )
>
> pv_shim is a global variable, you don't need to pass it around.
>

Okay, but in the other call I was always passing false. What do you think?

> Thanks, Roger.

Frediano

