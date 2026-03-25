Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Kb+IWt/w2m6rAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 07:23:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBD320220
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 07:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261720.1554532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5HeF-0005JS-PX; Wed, 25 Mar 2026 06:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261720.1554532; Wed, 25 Mar 2026 06:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5HeF-0005HG-L6; Wed, 25 Mar 2026 06:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1261720;
 Wed, 25 Mar 2026 06:23:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5HeE-0005H9-3M
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 06:23:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5HeD-008XeZ-5U
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 07:23:21 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c37f53-2eae-0a2a0a5409dd-0a2a4504b32a-8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:23:21 +0100
Received: from [209.85.208.179] (helo=mail-lj1-f179.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c37f58-c823-0a2a45040019-d155d0b3d868-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:23:21 +0100
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-38bdb4b8e66so37348001fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 23:23:21 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774419800; cv=none;
        d=google.com; s=arc-20240605;
        b=Y82XPMqbJwjkC+M+/Y5ZBaevaiyaY5jsIeZThjRhF2dZ+L8EKkQ2RsZ4DpgirnX1kf
         anMTk0p61RqSW3uLrLZAHNFZfGfuSmFGGpytfU5NRRXsRlsUS77NWq+/15Ums/5R92ki
         Efywmyq93SX7iYCb+nG44koh9205QMgNkl1agw5Fw7vHzLZ+OWrlQq8oWi0TKWB8GN1I
         PZikiGTRNaNyK8w9YbzEVMLMZLKgsW+qWLiWEjD5cn9HDcfOVlzGyLS6WAOYJ2mcLzxM
         25IjLHK0RD67dWfACcJHr7B0wyQj+Wjg1eiBuMEQi3sObwf17wEFb0NZx5Ok1cFRvTeZ
         Vz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gLI3zfj2vWe8Jy4i59VK3Ls/StUu3snZgoD1oL5+Vfk=;
        fh=SmKtTP+//FoTguQaCWAbd7P0/DDZIbvi8at9iFw3jIU=;
        b=EK/mWuvp1bhb1IB5OBHyS/rrvrxRDN+Aig85BPgrVzinTrWUz3bf/UgAmc9W6Kcmg3
         GJs/3g01Lzdlo+xQt0O4zeDx3m4PFwGMW/NPVoPcRMpCIR9nGCtefeFAqKgNYCjnyWzv
         JcoPgzz3EXtU9Lb2IRx7E3LI6iw9gv45pgukeHAxyhFAzrN30CXeUtrCMl/Q9uU4XshU
         Ih71zbY+MSyouo/18r+O4gAJfQmP35UuFejLN/tMyuLQMxppzoRVBa6ZD0lIuHMugcWT
         mzFmojunggcYyDQ3yicCa6vpW2pbkWKlLURPC+fDKXWh3S4HRDfha4ewCBpbalUN7ZqX
         Pt/A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774419800; x=1775024600; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLI3zfj2vWe8Jy4i59VK3Ls/StUu3snZgoD1oL5+Vfk=;
        b=RxxZ839ZFvPg6MX1e7GdKY20Fn8MHXVTBkQ0a5VNl/ML0zoUdk59j0UOpn2gR9uwmI
         gRNh39AymJmrZ8mU+h/0pNgjJdUuopBtSLdKD6fpFNllwHrGhHDEc9ue6Ke63vgLSsR9
         1mdzLu0DbIhCp6zrzx2dSrR3xLYZ+CJZBK8Bf9NyOEeYNw8nhi3wqxHCsAjeP+L76ZT1
         LUy6F7xMWDYXEpSZ/RF0qvVM/FZpeA7zxFmEh2rCRqE9vtsD+mb5GDeDiTFyVubIUbdV
         9WFx91Z3220actUoMhkPniPrL2UXks6epJNZBP7/wOTgh+NS4ydDzs1sEzkqm3b4hEvi
         bu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774419800; x=1775024600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLI3zfj2vWe8Jy4i59VK3Ls/StUu3snZgoD1oL5+Vfk=;
        b=N6vgx5wpb2KNrFykWTvjr0kO2qKKNrKCeZEZfLQCKiaJzXVWSi80XzcWohV/HBkjEC
         GtqUVeEovhay8b025wfyt85xl63xbsnDEbMM20D5Sa1tiKrsUT5JC+3fkBUAPeteqePx
         eHyQ/XjV5ANoJmEDFJEn4zWkkJt9/cW4KxsYqTgu8QJqOA2NJTg5TnW4HcWuz0/FHF6m
         QC8deTvQd4JQ8BzWS1abJA1i9vcejE4aD9t9bBg/su/n4DnS18PmWLmruuMvNEljpEzH
         QI/3BMCWl/oVXtPSrGowsWwLA3DN9feXOL7OPxCjIbFVrQbFuxykiwnk0HjjnSH6H0oW
         6p3w==
X-Gm-Message-State: AOJu0YzTpqA3LCwofyiE0uvCELuQcZe1lSG0XwWvX0kLLCU0dhhFkVvD
	BjlkS0FVTvCbq1CWDpz05q6jQ3G5oPS7AGepNK8daKYej7Wjs2CGMMRhb/ZZSdPgBmF5EdGEWZY
	qmTsPRbbQDgjwNC3Oj0KtvvRI127ceKE=
X-Gm-Gg: ATEYQzydzZE/vN4Z6DSGIjcmQcfsQ7Je9v1th0n/ttqeqNZkXE0klCNHfVG8zISSF+D
	If8HqqiNVXWw0sqqK6J8pkiw2c7esOFSz5hed5S0oBCRuWzt0KUQSzcCBpXyXe3MMIyLHk3GFv6
	5Ch/8/xwyg4cW0prF9zGYqP5oCXfhE1zC0oVitZF58bsdylsQKAnbLfXAsXJgPbVOCTVPOPEL5Z
	vmcLS7Fp4JBKocG8l/HAc2BDHXemt5kP+NPIpBxelpz0VvD6iir3tTfUPu91bxpgE3UrYNf8kz7
	xm0S8g==
X-Received: by 2002:a2e:b1c9:0:b0:387:1337:8be7 with SMTP id
 38308e7fff4ca-38c431fe9a6mr5606421fa.36.1774419799772; Tue, 24 Mar 2026
 23:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com> <CAGeoDV-zPfn5iDN6gcwq2bA5vcG0SUsgZbQufDWpux1rugXFEg@mail.gmail.com>
 <f27fc3a2-77a3-4b14-99fd-a4d4dcb17585@suse.com>
In-Reply-To: <f27fc3a2-77a3-4b14-99fd-a4d4dcb17585@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 25 Mar 2026 08:23:08 +0200
X-Gm-Features: AaiRm505QOUprGYyBV791tg9vWBGbfQWTTB0Ar7k00vnIRRdIW0C_sAGWU1k9xs
Message-ID: <CAGeoDV87rNCYVrYYc4N1NiuYB8K3O3pRsCS+g2wdsN50c-kKrA@mail.gmail.com>
Subject: Re: [PATCH 2/5] llc-coloring: improve checking while parsing
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Kamil Frankowicz <kamil.frankowicz@cert.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1774419801-B96849D1-8673A121/0/0
X-purgate-type: clean
X-purgate-size: 1873
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,patchew.org:url];
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
X-Rspamd-Queue-Id: C2EBD320220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 8:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.03.2026 17:51, Mykola Kvach wrote:
> > On Tue, Mar 24, 2026 at 6:37=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> We can easily avoid the risk of wrapping UINT_MAX <-> 0 by applying a
> >> check against the compile-time-constant maximum number of colors.
> >>
> >> Additionally the overflow checks suffered from an off-by-1, as the par=
sed
> >> ranges are inclusive (e.g. end =3D=3D start being possible, requiring =
1 array
> >> slot, while availability of 0 slots was checked in that case).
> >>
> >> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> >> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> >
> > For reference, I previously reported the UINT_MAX wraparound aspect her=
e [1]
> > and later also here [2].
>
> I've added another Reported-by, yet I wonder (in particular wrt [2]): Why=
 did
> you not simply send patches? They likely would long have gone in.

Thank you.

I did not have the time earlier to turn those reports into proper patches.

This month I have had some bandwidth again, so I started revisiting a numbe=
r
of previously reported issues.

At the moment I am also preparing some other fixes related to ITS, and the
LLC issues were next on my list.


Best regards,
Mykola


>
> Jan
>
> > The off-by-1 in the inclusive-range accounting looks
> > like a separate issue.
> >
> > Those threads also mention a few other related corner cases.
> >
> >
> > Best regards,
> > Mykola
> >
> >
> > [1] https://patchew.org/Xen/20241217170637.233097-1-carlo.nonato@minerv=
asys.tech/20241217170637.233097-5-carlo.nonato@minervasys.tech/#db5d6a67-61=
d9-48d3-b6c4-213c1cbbda21@gmail.com
> > [2] https://lists.xen.org/archives/html/xen-devel/2026-01/msg00369.html

