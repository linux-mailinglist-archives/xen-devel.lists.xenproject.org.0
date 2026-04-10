Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN9+Ijnj2GnHjAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:47:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E736E3D6552
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278833.1563554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAK0-0001t4-01; Fri, 10 Apr 2026 11:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278833.1563554; Fri, 10 Apr 2026 11:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAJz-0001r0-TZ; Fri, 10 Apr 2026 11:46:47 +0000
Received: by outflank-mailman (input) for mailman id 1278833;
 Fri, 10 Apr 2026 11:46:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wBAJy-0001qt-SP
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:46:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBAJy-00C2VM-7v
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 13:46:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8e322-bab6-0a2a0a5309dd-0a2a450cd8de-16
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:46:46 +0200
Received: from [209.85.208.179] (helo=mail-lj1-f179.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8e325-f40c-0a2a450c0019-d155d0b3dc39-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:46:46 +0200
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-38ce0ab821cso16445101fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 04:46:46 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1775821605; cv=none;
        d=google.com; s=arc-20240605;
        b=f8mYsxe1Lw0x1D5qUzLCwc5C5g+XXDwwLbik2+HltHu8ooft5RdWTZCLYIFp271AMv
         mo9taYjnUX0Em6/MsQ7odtX6rl0rpD0W0jui8I5l6kg+T8oWugQGEUD5qF0umHjGxZXl
         oUi9IAT4+peYYP9c7x0sbSYmhBXVg+f16rif6EUbQe6bI8lOvqdV9/xWON437JC7O0uc
         c2cMaLPBUj1pYrazBPvfUqTjqlBqy+x8xQH8pFzX9+Tz/9xXAhlyATeHEAmlDPGk71Jj
         SbWPlwiX8McnOYjsbK7lrcbHmr/JrRKruG7Jhgq+aD1uRkP0hk8S4SmlRXCQ7sBJZV+G
         tQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9q37rZP7jMWns3qTUHzx9hn/p3edhuLnNUeTWCCXISM=;
        fh=Npxxo2G+SZBYUBqLWTl4tfcxykh8zXXoyL5qOyJ4M6I=;
        b=A9rInS/Bst8AoVPEoTHDveR5sPEhsI0cguuOT+yg9G4g7ioPJzh1kxQ9niOP7V8uJ/
         s3DeblrXXU8oX1UtgHTfXPP4usOepB8AUuRrQH3r5ukB5Kfi2Mv2cC6ogpENGiV5W57F
         gcfrgbUeKRemDp5ZYrMRDp69ybEb2r/3D6tlryUukVd/jktwIWVE8HnJgo+zt2DBYyFY
         Upok4fHHi75ziHF45+nFtCeJHuJGjTh/o66j8geYWi98zMxCuBuG9XxUmaRN7CBDAKOv
         MxJxafiBKcvFJwVpEuUjBJbr7++nN8dJF7MZScgCIPRumWfU1RilkVM4XwRBB7nLpjUI
         PNcQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775821605; x=1776426405; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q37rZP7jMWns3qTUHzx9hn/p3edhuLnNUeTWCCXISM=;
        b=R6bvipdVkj3ri5tB7uBMJPi/Kf+bmgNxP5YSQi0NtdvwucPWwG6qawjf1CMpg4Vqr3
         2KysL5MLgsVKhC61qr3AJMOlwVbNm0CkK+L9cA0I4G6R4lEYip3R2HJF1t02NzwMcIdz
         QBE7DggiamujFMFzE/SM9MD8llH9c3Qn0ThYwoBOvYubzvXvW7ZGfB8gULj52trfMVqu
         N3hc4G7AUIG5bTInQCbe/x7GwRZ7cjqhxoyG+FyARhIc2dgW7mTkzXLm30WhtCcNuhWb
         fruXeiYg5yA1o59m2rrZu8AJvh86uJDlfUjO2BilcAfoKdDPSQ4OAxHYrI3umdgsmRHm
         npiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775821605; x=1776426405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9q37rZP7jMWns3qTUHzx9hn/p3edhuLnNUeTWCCXISM=;
        b=EdHKCLYNkgw5DhhZ0ylwQ/LPXTtZhQB6VqLgH9BC81rvHuoe4d0rm7jiWrPF1bPhdu
         LW2NVd4cYkz5xZRUMRcDeZNF+R49/2Hg249BrZ71TaTNV6XmDAIxZdfn6xh0zQNemfv5
         YTgAJh5WrvGV42QqzHAAMTVGujpHT6TvH6GkS2cGUexIjlpO8klY0n0SgJV+dgkVuzCN
         JxIVrzzNf9160h21GGKgu8koAr5h59jVqBE9s+4/dtH1tdDxjuh/86a0mMlu7wipnSed
         4JVPj6aDnfUvek78wURag+BfCrmvwimfcCtMjZk2qaNN8gT9pd0Nd6mODqL1VzXJXCLE
         oJng==
X-Forwarded-Encrypted: i=1; AJvYcCXQBH3hptOwHZe9BE5gOWn6KGH9XBrTFpIkDN6bCI2j9yx7wUYgW/10WaXE15EbAP1tO3/Q0dqH4TM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwppCYPpXrZWAm8G4dkbUxUcNM7VnP+YlJGCg5Ng7nqP09oP6+k
	K99L5nb5DN+UQWFuXiMrxmcbX6XY7X4u5FBnICRPGZtdhH2uFJd6VlbTXMy1KpIwVr+xV59JNaL
	/eewO7a36mpznyZmdr0QKzDcOBsdTTVY=
X-Gm-Gg: AeBDievwd/oeRE4DTG9cyLgJeTvT5mDrPUQcCowX50cvwJ0RoS1H38Bpnd44+b7PFwj
	O1m6xbb0RJiJ+WxvnPCGoQpl1fTcvkK/aXYo/54MCEdzq6wq8TGiFWfYlCeAi6BXRB90SHbLFU1
	r6yUNGKhuZfTh6/hlwerpAXkbrMjrkeEWxFOwLZKtq1Tx1c5Ch4FeDvxUtxyizrZAXp1j+My8/j
	0DoV1C+Gvg6wbanjL46l2gwTGvy5qPyo8daufE1DG1SUck3XXfdVZwR0SOpaIM0Dlch7iaRlo/v
	8bk+rg==
X-Received: by 2002:a05:651c:106d:b0:37c:d689:7e1c with SMTP id
 38308e7fff4ca-38e4bf65f4bmr6244031fa.23.1775821605138; Fri, 10 Apr 2026
 04:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
 <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com> <CAGeoDV8OAiZL6d8+qs6T8bRT++H-tpY--8yhb7He1bMgVvHeUg@mail.gmail.com>
 <09b58fe8-cc6a-4bc0-b2e9-ed2e76d19ed9@citrix.com>
In-Reply-To: <09b58fe8-cc6a-4bc0-b2e9-ed2e76d19ed9@citrix.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 10 Apr 2026 14:46:33 +0300
X-Gm-Features: AQROBzBGSA9XRFciydYAK3lqHex7swavykdzY2GaWphjhX9OomREzhc_aVLufBY
Message-ID: <CAGeoDV9+Z_zZ9w3ea1daXEyDuN8fpNZZNkp0bE+q3e+LbGG9CQ@mail.gmail.com>
Subject: Re: [PATCH] arm/its: Decode BASER cacheability field before comparing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1775821606-FFB44A3D-45729CFF/0/0
X-purgate-type: clean
X-purgate-size: 1586
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,citrix.com:email,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E736E3D6552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

Thank you for the review.

On Fri, Apr 10, 2026 at 2:33=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 10/04/2026 12:30 pm, Mykola Kvach wrote:
> > On Fri, Apr 10, 2026 at 9:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 10.04.2026 08:09, Mykola Kvach wrote:
> >>> --- a/xen/arch/arm/gic-v3-its.c
> >>> +++ b/xen/arch/arm/gic-v3-its.c
> >>> @@ -496,7 +496,8 @@ retry:
> >>>          }
> >>>          attr =3D regc & BASER_ATTR_MASK;
> >>>      }
> >>> -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER_=
CACHE_nC )
> >>> +    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
> >>> +          GITS_BASER_INNER_CACHEABILITY_SHIFT) <=3D GIC_BASER_CACHE_=
nC )
> >> Are you aware of MASK_EXTR()? This is one of the cases that we have it=
 for.
> >> Really all *_SHIFT constants should be purged, as they can be calculat=
ed
> >> from their *_MASK counterparts (leveraging MASK_{EXTR,INSR}() to keep =
the
> >> code readable).
> >>
> >> Further, doesn't gicv3_lpi_set_proptable() have the same issue with
> >> GICR_PROPBASER_INNER_CACHEABILITY_MASK?
> > Is it acceptable to include Fixes tags for two different commits in
> > a single patch, or would it be better to split it? Both issues are
> > logically identical, just in different functions.
>
> Multiple fixes tags is entirely fine, and we have several examples in
> fight even now.
>
> I'd absolutely recommend one patch with two fixes tags in this case.

Understood, thanks.


Best regards,
Mykola

>
> ~Andrew

