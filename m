Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4QfZJ5AsEGqSUgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:14:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05405B1CFE
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316548.1585922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQMtH-0000hD-8x; Fri, 22 May 2026 10:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316548.1585922; Fri, 22 May 2026 10:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQMtH-0000fE-62; Fri, 22 May 2026 10:14:03 +0000
Received: by outflank-mailman (input) for mailman id 1316548;
 Fri, 22 May 2026 10:14:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQMtE-0000e3-VE
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:14:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQMtD-006PAg-T7
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:13:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a102c61-2eae-0a2a0a5409dd-0a2a4502d7de-18
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:13:59 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a102c67-af86-0a2a45020019-d155d0afac11-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:13:59 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3937014be0cso14153981fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 03:13:59 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779444839; cv=none;
        d=google.com; s=arc-20240605;
        b=OUUAqPPwaFFD9BYbhTUT1OEw6GJXMo++kT9TFhr8Ubm48hiNvY0fdTkUtZEtS2Flff
         +1BsSvS+q5b0Cw0dhekgxOB/Ib5bilfAzszVkKmxfwiUFlSSF7kiLmE014P/PDA1QJZ6
         aiC0cVsWMZ05PuWEhLwPyOhG/8YWTXaiYsYUdB8EteMw+qWOm3VzDP37vOurQKNwuy45
         QUaXlLWxUS6rtbR4SyP8GfikV/Z2Dis+wc5gWPpsBVJtnzzjIM2C5ZdSjB6WLLznTlK/
         J+HVHqNOwJihksa2YOxJFqbQqJlkwXLozrpOEYzog/AN+zEfQ6s+4rRwExB2QMUEch+E
         q1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JUX6vHTa7p0Sfwz+CeidZwv32/WawPrRTHCpIPs0Gdc=;
        fh=zL8KVAj6rSaYbk/102rEWeOa69wm5cw+i9nXMzeM8z8=;
        b=VcxvFykSeKMh428DFLWUPtDRfjZLT/VIYvSLXdWHl0bDocDI6WcAMOIHuEZn1ckF1d
         NWzJBJroYQfAZdS8Un+/m/mQR3lZLb7tgKZmcW9USR11uAtr3a/ZsLKbPn10wS0He0uN
         IOvHsTwjqJZ8UPp4KbXgBvDVXIfNyHF5GCDuhQIJBdfq2SiRgEr4G7HVmTjUs8GVDjqg
         7mHvhV/tb72ABjDBC6BxnGoie0nUvHTcO5JB3bfGrwkSSPSJibLYQ3uXONX/Pm0Cki2i
         k5TnR3yAL/gAAZsUa9ljLxIbXUXBLUlAbFKLEXOEZ4zwnoBicePx9EwDvcvgUCX+m0st
         j1Jw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444839; x=1780049639; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUX6vHTa7p0Sfwz+CeidZwv32/WawPrRTHCpIPs0Gdc=;
        b=LPIeRfwNH1X6nF+0631fonW5AZZahlbS5Fxs/uJwp7iYYvo7TzesuuENHud3D1f4uc
         RpTTR+bjeX+eEQvmd5gl36GfhGjY2/dE9fHhfhuRWsL6j1dWemR/uF68l55CabJUSSF6
         thuCGS5H1Fk3UcL7mtqEbd1VCbLV2/4rSM4Pq6Hoq75OEdbPOFx/9w2jmUpWHwlJIuTX
         pshDHH/4VAS38S4SbvhnVwNT2rCxiw5H0sPxfYFJ0CV6T+YcQxKsM+yluPDrCwMJsSIk
         FCRjoDQJOBlbE8Q8TCMdARpFEJlvycx6ULezP4MnCX8jn6Cgd5j8Q0Mey9Rhtc+q3Xq7
         Hw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444839; x=1780049639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUX6vHTa7p0Sfwz+CeidZwv32/WawPrRTHCpIPs0Gdc=;
        b=HaqIb5UXBK8zqSCOO5jUD/144LrUjbCjTNwuZH9Nz+7bcK23jThlJ2AuO/0IQsFS61
         Ia9AZ/BjI3iuluoFyBai4f17q3oI+ZPYKMnYJgk/xvjLr7zgash6raKdFfVV+K0bPmbp
         mQvexRwLgNcLUW32W83ONhcqCGOLKKtqzzbUy4smXmFE5295oWvxDHjBRT3TvhIr/I8T
         +sgFtgsqb+LWGJ+JKAzHDNV5CwYk8U6b7GjtQ0UQEYO26zlcLJPWlrnuFtltIrFBSP7l
         LL9o8TTVsIdF0RY88/LGjbFBoDCywxzLwNsgb345U4lDIRAH8NDIwP/W1FDcVln6nwsH
         QMXg==
X-Gm-Message-State: AOJu0YxlrE39Am7qqARHn2zSAAE8iPTJxsyNNxyF1EWHWr+yBrSg4zDP
	6n4Pg8MHG80IqjQjRjWVNCbbAkocGGorIC4MYMu9CQ39KC6bV1LcbTVMaLlVfWKmPtNsq39tbOX
	1bVtWnDPHI6GXCShGjRHSm29UgvISaek=
X-Gm-Gg: Acq92OHCXOV7+WpU+9RsxUJ4mZ1VAKDolIvjZiVd43JVdPf7Q1OnRArmAXJJedh6ggA
	nQL9e20kyUVv32S977e6FSvB2TuPzTp1wvyubqbDzlfS27mck+LXuV0j3EOMJJGzbKd5twh3jem
	tqfkVyMW0i/DR+aBSWJRpn+UFjBCWTcFbzSQluLbjzpqPFClT7u2SguSP5QgKdRtcUxhHvgnYUl
	0iEK7Mrw9y6AzZ4/v0f4QcjZy8mOp7wpvw0tsFvuXvhXvPJJ9y3rcSXKq8KRAYaEbZRhCsM4eoY
	zMNV1lDPeeJTBrY=
X-Received: by 2002:a2e:be2c:0:b0:393:bffa:d815 with SMTP id
 38308e7fff4ca-395d8d3c6f4mr8774721fa.21.1779444838764; Fri, 22 May 2026
 03:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <998162706f89bb3100bda409d8fde3c8b143eae6.1777886129.git.mykola_kvach@epam.com>
 <6ebccf8b-c90f-4dca-acf3-ea9cc0dd97f9@amd.com>
In-Reply-To: <6ebccf8b-c90f-4dca-acf3-ea9cc0dd97f9@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 22 May 2026 13:13:47 +0300
X-Gm-Features: AVHnY4JTY5oRYwLyLX9db7cgfHvfqQZA12KjiW4RrfsCgewum5DgEcTugvUwajg
Message-ID: <CAGeoDV8e1=hqR1VC51ouzFhy125FMtasNB6kLG_g6fJ3GTuLAg@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: scan CLIDR Ctype fields upwards when probing LLC
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1779444839-83F66161-DA40A2A9/0/0
X-purgate-type: clean
X-purgate-size: 4039
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: F05405B1CFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thank you for the feedback.

On Fri, May 22, 2026 at 9:41=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 04-May-26 11:19, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > get_llc_way_size() currently scans CLIDR_EL1 Ctype fields from the
> > highest level downwards and stops at the first unified cache it finds.
> >
> > However, CLIDR_EL1 describes the cache hierarchy from Ctype1 upwards.
> > Arm ARM DDI 0487J.a, D19.2.27 says that once software has seen a
> > Ctype value of 0b000 while reading from Ctype1 upwards, no caches
> > manageable by the architected set/way maintenance instructions exist at
> > further-out levels, and the higher Ctype fields must be ignored.
> >
> > The current reverse scan can therefore select a unified cache level fro=
m
> > a Ctype field above the first no-cache level. Such a field is not part =
of
> > the architecturally described CLIDR/CCSIDR cache hierarchy and should n=
ot
> > be used for selecting the CCSIDR level.
> >
> > Scan Ctype fields from L1 upwards, stop at the first no-cache level, an=
d
> > keep the outermost unified cache observed before that point.
> >
> > This preserves the result for regular cache hierarchies, while avoiding
> > selection of an architecturally ignored Ctype field.
> >
> > Fixes: f4985fce6f0b ("xen/arm: add initial support for LLC coloring on =
arm64")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > This patch follows the xen-devel discussion:
> > https://lists.xenproject.org/archives/html/xen-devel/2026-01/msg00345.h=
tml
> >
> > In that thread, Michal noted that the reverse scan was a simplification
> > rather than an intentional requirement, and that changing the
> > implementation would be fine.
> >
> > Testing performed:
> > - standalone synthetic CLIDR tests covered both regular and pathologica=
l
> >   Ctype sequences and showed that the forward scan ignores unified cach=
e
> >   levels above the first Ctype =3D=3D 0b000 while the reverse scan can =
pick
> >   them
> > - Renesas H3ULCB booted with llc-coloring=3Don
> > ---
> >  xen/arch/arm/llc-coloring.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> > index 6f78817c57..3783f4c824 100644
> > --- a/xen/arch/arm/llc-coloring.c
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -22,21 +22,33 @@ unsigned int __init get_llc_way_size(void)
> >      register_t id_aa64mmfr2_el1 =3D READ_SYSREG(ID_AA64MMFR2_EL1);
> >      uint32_t ccsidr_numsets_shift =3D CCSIDR_NUMSETS_SHIFT;
> >      uint32_t ccsidr_numsets_mask =3D CCSIDR_NUMSETS_MASK;
> > -    unsigned int n, line_size, num_sets;
> > -
> > -    for ( n =3D CLIDR_CTYPEn_LEVELS; n !=3D 0; n-- )
> > +    unsigned int n, line_size, num_sets, llc_level =3D 0;
> > +
> > +    /*
> > +     * CLIDR_EL1 Ctype fields are interpreted from Ctype1 upwards. Onc=
e a
> > +     * no-cache level is seen, higher Ctype fields are architecturally=
 ignored
> > +     * for the CLIDR/CCSIDR set/way manageable cache hierarchy.
> > +     *
> > +     * Keep the outermost unified cache before that point.
> > +     */
> > +    for ( n =3D 1; n <=3D CLIDR_CTYPEn_LEVELS; n++ )
> >      {
> >          uint8_t ctype_n =3D (clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) &
> >                             CLIDR_CTYPEn_MASK;
> >
> > +        if ( ctype_n =3D=3D 0b000 )
> > +            break;
> > +
> >          /* Unified cache (see Arm ARM DDI 0487J.a D19.2.27) */
> >          if ( ctype_n =3D=3D 0b100 )
> > -            break;
> > +            llc_level =3D n;
> >      }
> >
> > -    if ( n =3D=3D 0 )
> > +    if ( !llc_level )
> >          return 0;
> >
> > +    n =3D llc_level;
> After a loop, n does not carry any meaning, so I find this assignment a b=
it odd
> and confusing to read. Just use llc_level below. With that:

Ack.

Best regards,
Mykola

