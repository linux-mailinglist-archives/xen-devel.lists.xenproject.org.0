Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA3hKt11wmnqdAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:30:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D675307547
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260385.1553731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zxi-0004tI-K9; Tue, 24 Mar 2026 11:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260385.1553731; Tue, 24 Mar 2026 11:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zxi-0004rF-HF; Tue, 24 Mar 2026 11:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1260385;
 Tue, 24 Mar 2026 11:30:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w4zxh-0004r4-4W
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:30:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4zxg-00CMMZ-Cr
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:30:16 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c275c5-bab6-0a2a0a5309dd-0a2a4502eae0-20
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:30:16 +0100
Received: from [103.168.172.155] (helo=fhigh-a4-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c275c6-63bb-0a2a45020019-67a8ac9bc88d-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:30:14 +0100
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 42A78140015D;
 Tue, 24 Mar 2026 07:30:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Tue, 24 Mar 2026 07:30:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Mar 2026 07:30:11 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774351813;
	 x=1774438213; bh=6sWhBFUaLKaPF7jUgKWv+ePnwEai9kvsIkgafUu+Pi0=; b=
	lMK7QaosgfXohBbcCaMr4JwsSUjqdxpK39JAUEYM5qvIKiwdRP1TJKKiHcZ/mDt8
	WoC03z+McFNXbaSGKovqYZrrz3LtrMxQAO0WWuR2TWbtfu2aLgwOfB9goB9Z9rn1
	+YAcZ25emj++9M4K1qxc3V0ImeluQu/cszQYhxFcCltQIEA/+WE5EIN5WHKL7tT1
	1udpumi5J24R5LTG6L+IKnuzTitpDHwqGJMbUpGeI7F0gZgOtVEgnVrUeVbH7/mu
	W+8cgQaCYEo2qxdJWg7njjbO3CgpewIvEyD3BHjJd9syi70YZ8Jwhu7hOCoz5EQ+
	LCk66lSNrhsA0Cdae30PnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774351813; x=1774438213; bh=6sWhBFUaLKaPF7jUgKWv+ePnwEai9kvsIkg
	afUu+Pi0=; b=0tkjPyQvRI8umxOtG4fUAlmRHR0WJuA2DQLY3xL9I82uLYcWGJB
	zj0H8KDoc1M7Z5asjyyU8y5EI8vcSa9Bl/dEzCmR+6x5K02swT+Yn8uysMSN5T1v
	SiX0ySMRtZ3JjFFxCfPTJtHr2+PMc88ocKy/OrKZ4O1J7oqmmzX9lIazp8FH18l6
	jQROJdCPYssrsSlGwseW9Q0SI3tl01K/FgG6DreD7eGrxSCrAFpDuyq5CnLp6T7M
	A0G5s10wT88ikjFfxGvRd8pAAqxRRkFptupZlfcVh0RAXfhdppkF3FvH7tt2iDDm
	dDtJ3htnAswx4/K6wPBolA23ab5kQ2ZjXUQ==
X-ME-Sender: <xms:xXXCaa0275mjKEjUeecrY_D2kxv4xOn10r_M-OVceKSf86FqKTMRuA>
    <xme:xXXCafW5Q-Kj2H6NsJh0I_a0Kw84w9_GwC4e6wtcI8kVMX1EOGGKumGOZ6JklgorS
    GkfG1gFjhl416THawx1k9ZuZQpbrgysMNSx7SbYPYfCdhs5>
X-ME-Received: <xmr:xXXCaVInCP9fFTfnWdr9lSyOmKZMOzv018XrwFvUfs7h7cj2ENVNqyeWtEIqG0en4_2mllCv3-HgzZKUu4DEHYqqcEa_x7wF5y4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvddugeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehsohhumhihrghjhihothhishgrrhhkrghrvdefsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgv
    tghtrdhorhhgpdhrtghpthhtohepshgrrhhkrghrshhouhhmhigrjhihohhtihdvfeesgh
    hmrghilhdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtgho
    mhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpd
    hrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:xXXCaR3YE9RPYsYFfyOwupGHDWrnfZocyjnsGU3CqrAhTPjAIGNYZA>
    <xmx:xXXCab7mDckLUklbyrgqRi52ci9F6F9AfXQpsdOV67yYaNyB2YlkSg>
    <xmx:xXXCaa9Sr-VATli42U-jSgvSh1TC15O2h31AOxOE05juT7xcZaANgA>
    <xmx:xXXCaSXKHb-lKTYmj2CX56EBsbin70WrV3zmTkKOKSdbIOVIi_UmSA>
    <xmx:xXXCaailOJ5NskiHTVw7D5S4wOrecPsM24zwa-bXwNiNv4T1eUp0Uznv>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Mar 2026 12:30:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 1/3] x86/efi: Add BGRT image preservation
 infrastructure
Message-ID: <acJ1wTlRz3lKKjDw@mail-itl>
References: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
 <20260324101726.6929-2-soumyajyotisarkar23@gmail.com>
 <acJxoijDI6vhs5wo@mail-itl>
 <56fa4fd5-19a8-4c46-9524-0f41090a8857@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3LqmlMSr7E/hSl4H"
Content-Disposition: inline
In-Reply-To: <56fa4fd5-19a8-4c46-9524-0f41090a8857@suse.com>
X-purgate-ID: tlsNG-720697/1774351815-42686DB8-57234BFD/0/0
X-purgate-type: clean
X-purgate-size: 2278
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,citrix.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 1D675307547
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3LqmlMSr7E/hSl4H
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Mar 2026 12:30:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 1/3] x86/efi: Add BGRT image preservation
 infrastructure

On Tue, Mar 24, 2026 at 12:23:19PM +0100, Jan Beulich wrote:
> On 24.03.2026 12:12, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Mar 24, 2026 at 03:47:24PM +0530, Soumyajyotii Ssarkar wrote:
> >> diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub=
=2Ec
> >> index 77f138a6c5..9e595600d7 100644
> >> --- a/xen/common/efi/common-stub.c
> >> +++ b/xen/common/efi/common-stub.c
> >> @@ -20,6 +20,7 @@ unsigned long efi_get_time(void)
> >>
> >>  void efi_halt_system(void) { }
> >>  void efi_reset_system(bool warm) { }
> >> +void __init efi_bgrt_status_info(void) { }
> >=20
> > This has a minor conflict with the current staging,
>=20
> In which case - against which tree was the submission? It shouldn't be
> against anything else than current staging, and I don't think there were
> any changes in this place recently.

There was - removal of efi_halt_system().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3LqmlMSr7E/hSl4H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnCdcEACgkQ24/THMrX
1yxsUQf7B+7mZe9Cwgcs2A3ULX7ZnVGzTTeUnJjZykp/QaFBrHnX43jJkEtg9uz1
+u5U+8hsaVCOs1cyfTXkEDvZ5FM0FW/ZKnGUeD4sfg5ltsZok3KsR045kyJu00y0
1GiTe7LINfVKG5CojdzyknA9zCWrA/KsOdsVtIlbNBxKt/ZOAurdQBtMIten8cU8
i2jEy62uOG9Vcs+bXw170lisFzTfGpYC3ehrlkOrEK6xsGEQNUapuGwAPp0i6xhz
q7fpOr1wcGR5mEqA89uwqXtZc7eLRhcS/Z0s+OfyksZfSjDGyMxit2GMPeMiU5OS
fTXLoQWd2cIrDWEdnO9fbcyfrjoa3w==
=IA6H
-----END PGP SIGNATURE-----

--3LqmlMSr7E/hSl4H--

