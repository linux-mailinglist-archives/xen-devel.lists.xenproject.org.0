Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKJpOAm7wmlilAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:25:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5B318F90
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261062.1554194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54Yg-0006bs-Iw; Tue, 24 Mar 2026 16:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261062.1554194; Tue, 24 Mar 2026 16:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54Yg-0006Yo-Fg; Tue, 24 Mar 2026 16:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1261062;
 Tue, 24 Mar 2026 16:24:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w54Ye-0006Yh-B6
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:24:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54Yb-009h15-Qs
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:24:43 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2bab4-bab6-0a2a0a5309dd-0a2a4505daf0-22
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:24:43 +0100
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2baca-5aeb-0a2a45050019-d155a72ddd0e-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:24:43 +0100
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5a27a90a7b6so1720657e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:24:43 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774369482; cv=none;
        d=google.com; s=arc-20240605;
        b=kzZBp3rE6f4wn+qgAe4AoByumMP8oRw6Hg8PdJyT3E7Nhz4mIvEme/juJrwZnXLf27
         c/c33shkHsaBgCJkedS4gwmB36VVWDaBpYgHFx7/Ge9slxHhYFku4LJP4optQ1JydMs7
         lwVM6VUkjZF3qWy8FIGvULNSvzwZPci6S5W7Xc0n19z2LBpyJpvMFvV0MGJr6ukbrhRb
         CR7yETDpiAtbJIxsUyQMhDZX+1A8HYqu8w3Ja+yJwJkAELTGa26ASQRZEoTCLO2sDUOA
         q+j1g4On4LjMzCthDItRM2dS6TN9AGmNrKS/ydRRRzQVg+kbwOGj98q9I+YbSUUn3u/X
         iLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uk1J0shv0ren+up2Q6z4S0bwgGP9AaPTIapT/x0ApEs=;
        fh=SmKtTP+//FoTguQaCWAbd7P0/DDZIbvi8at9iFw3jIU=;
        b=XygAqx/oirSDCciH2OAteGZMWq+mhPrk3m6oy9EPnsm/FsOJ3mN9LK1SuvrWqs9rV5
         0ikrs4JdX1syXO32YXlKONYufK3m8St7QDD+AVy+NoWFGFOgiIUvYGajk0DJE7s1Ftf5
         axDHHpce6KPo7SHNF0+3dn/LvEg5yhsRh3CQpVABBwlk7ZROIENXx4QknyBa7zQw83Nr
         SMa3NsToF//cn50sGD43Ozh9HrPlUcoe1jiie+AK05GMLn7r0ZwE4dsLCxij3tsCQxoN
         /2iBLwjop/xmx9Rvxm0cYon2dI7xsOHEzC5cofCFTBSB3MK+Ugof3mCNMhlwAfFKboX5
         4mzg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774369482; x=1774974282; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uk1J0shv0ren+up2Q6z4S0bwgGP9AaPTIapT/x0ApEs=;
        b=g8tdTDyxRckj5umjMIzQIhVAASTOzYA9jtUoW4uSnH7VpAcp/R1/WKp8Wps/AQUuB+
         eNiqt+tF9Cv3rDRLUC08mp4fQaiEm6PXN8AO22/P2zmNCk/TsmLs90pTVIgS4TVZZ/CQ
         7dSzJ5hDd2lguzQR6TVUVNSmvEEFR2TJ3VdzYOm70BQ26jFU2hDej3MWzSVgWFaAkIwP
         ZV4jDw2Wv4UQ9ub+rfQawyLS+KznOa3ER8GflTtKtGmeyBd4omRYGZgGnQs15fer7V1B
         Az9wE87Y6/zrJnvCzEg0t5y3r+Knn96MCrGnRyM4skV1QegVjfyV7lMsyYzuGlgzluuy
         rHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369482; x=1774974282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uk1J0shv0ren+up2Q6z4S0bwgGP9AaPTIapT/x0ApEs=;
        b=fSGwArzSNxgUapJx7LpTFwPC3xSABNZC1tP9o7qBTdux+KY8vgyNZe17pHhZvt/l1a
         1VekZ5M+hfRZNxJwhxCauq/bL4vBU14TthsXX6OWGMbxoCIr6wvbGA4eqdpQl2yUngHC
         ypUcb75I7NjfU1GJ8zTskhdtvDw+nkV65iz30pujSa5FhwfBkHJ39O/Q+vf2/FCkpS6A
         4426m+jqbAI8T3qd+tnl+44XirRXVpFRDsX+Vo/a/zrfPM7BseDJIZX+B6SV2F36gsng
         E800fi/108AyTjP22zLwZtAWH0ZaneLxVYdZKIWwSB/OzmjfqMnpXjhVZ5BBuDDXWybs
         4bYQ==
X-Gm-Message-State: AOJu0Yyhd9odM88MA2TSiZREzEZcSUN/RzNmWa7mFnLvi1AfVnicxm+0
	Cq4+TLJtD4lR1figx8dfJ7ep9oN1uI50hkY6nlVs5BAefUm2pyu7/JzKKa1ThMlTFjTZ5tn1Ble
	TDC3x79aubJLl/PKg+RnX3xR6r7YWL/E=
X-Gm-Gg: ATEYQzxg5c8/KJmC8wJkLzsh556oULBe8DY7renzyp0H308dqxgJJqUoqo2q9v6j+Ay
	eW649ZroYclSHU2J4AaZQhONZUW79414hm8pQLnt1CLFqbBivWB1w+4RtLS6c3gHqxjLhmCCWtq
	uHf9yRGZ5NvBJfxEpRuFCbLDL/j1z5ejD9arHZDtZuDBb61uyCQh+/DVviVrvb39w7KSBIRQJ20
	ydcrhZM8OKDWPpU96orAlivh6Kc/hUo6Kewhc2D4ou9AsWkBc/3WIghiaztS9PXrPWFtSic8tYz
	RgBRfg==
X-Received: by 2002:a05:6512:3b91:b0:5a1:30b2:f2c with SMTP id
 2adb3069b0e04-5a29b99fdc8mr42672e87.42.1774369482137; Tue, 24 Mar 2026
 09:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <cb5ad24b-03a5-4c1b-9d98-8df534854b2f@suse.com>
In-Reply-To: <cb5ad24b-03a5-4c1b-9d98-8df534854b2f@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Mar 2026 18:24:31 +0200
X-Gm-Features: AaiRm53Nb8iz0N-DlYakcJEISvkTK7zZB-TWHAsseQuRuTjeIwkuSsxusNtWwv4
Message-ID: <CAGeoDV-zq+=HWg1v53KXyPR+kxBPpE2jUruc=JFVSjXTKv662w@mail.gmail.com>
Subject: Re: [PATCH] unlzma: avoid UB shift
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Kamil Frankowicz <kamil.frankowicz@cert.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1774369483-80568488-CB3F0587/0/0
X-purgate-type: clean
X-purgate-size: 1596
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4AF5B318F90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 5:27=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Shifting signed quantities has restrictions. Since the wrapping macro of
> read_int() type-casts the result anyway, switch function return type as
> well as the local variable to the corresponding unsigned type.
>
> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> We've inherited that code from Linux, and the same code still exists
> there. As I'm entirely uncertain whether they would even care, I'd prefer
> to not take the route of posting a patch against Linux first.
>
> --- a/xen/common/unlzma.c
> +++ b/xen/common/unlzma.c
> @@ -30,10 +30,10 @@
>
>  #include "decompress.h"
>
> -static long long __init read_int(unsigned char *ptr, int size)
> +static unsigned long long __init read_int(unsigned char *ptr, int size)

nit: Since we're touching read_int() anyway, would it make sense to also
tighten the helper's interface, i.e. make ptr const and use size_t for
size?

That would better match the actual usage: the buffer is only read from,
and size is really a byte count, usually coming from sizeof().

>  {
>         int i;
> -       long long ret =3D 0;
> +       unsigned long long ret =3D 0;
>
>         for (i =3D 0; i < size; i++)
>                 ret =3D (ret << 8) | ptr[size-i-1];

Separately, the loop could also be written without the temporary i, using
a simpler reverse traversal, for example:

while ( size )
    ret =3D (ret << 8) | ptr[--size];

>

Best regards,
Mykola

