Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCY8JVJx+2kNbQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:50:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087994DE4FF
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301960.1576065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfRc-0000Ev-4D; Wed, 06 May 2026 16:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301960.1576065; Wed, 06 May 2026 16:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfRc-0000DE-0o; Wed, 06 May 2026 16:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1301960;
 Wed, 06 May 2026 16:49:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wKfRb-0000D8-4b
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:49:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKfRa-00ANsr-HV
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 18:49:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69fb7127-5cb7-0a2a0a5109dd-0a2a4501b11a-18
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:49:54 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69fb7131-c1f2-0a2a45010019-ca0c7c9ab193-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:49:54 +0200
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 3BD7C7A013C;
 Wed,  6 May 2026 12:49:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Wed, 06 May 2026 12:49:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 May 2026 12:49:50 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778086192;
	 x=1778172592; bh=3j65QrDhCEnlZV7m0VWWzT8nKjetcPN09saEXNs6av0=; b=
	frMhhACoooQGjn70vvdBUwrCx8QoRkNixbBWkwpV1AwTdbZVaqT5BbYJNzQIHUyh
	RITUmHIoQCkk0oDMeFAn77Ycxg6bhUidnnCOkLRl5XtPvOyvQy4b7XNw3Cz8nXv4
	qo+QcOpgUsOh0ll0xDXQ+ZsOEMC2CdIlFG6p5jMVux/7y4j7ByKeQgq6usXQAasy
	3rSoBJ0FvjAWv2L90a+d0/kiZlPYQPhT35cvtPz1SEVhhtR1mBPxykAMDk6i4A4R
	Mobt7owEU6OhoDiW6SGanJm7mIbhvHiWRfFsgZ0JdlESAw6U5im20vk6YQjVdy0f
	a5552suLvoi60sSBr949ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778086192; x=1778172592; bh=3j65QrDhCEnlZV7m0VWWzT8nKjetcPN09sa
	EXNs6av0=; b=Yn2So1Vc/4cPZ8cv95cfYDkfz0CB5NJIkw3Hm4RGkLgqqeDJnjE
	CKC1oWaRASwvVkHc2REcE+GU+f51dVQm+gYWBUs/4eiyOyfpIGmEa5oTCZpX/qQQ
	hL155TrsDiuXctGHegHL7OFyA+JQBfAEZZl8nu3j/kTHtHdnUosq/ZILeMmt/KT3
	XLHXbYkxfOBZldx+kuULWRgVludITuZyTbcgum88lx437Oc0fAZvP7hLct1dGmct
	sH2S1Xm36WjuRN3nc7t0qrgpmEfpuBmZWRxDw8F8UsTmp5p9JBHpt9+u7PxWWJAD
	1BvYdb+92vblgjnABfZNx2C0ooOWAbYmofA==
X-ME-Sender: <xms:L3H7aWBAhFZNp91so5aYyqS4eFoyFgpsKpTVSOvQDQ_x2l3kH32gJA>
    <xme:L3H7aUPqFjgIdZL16p6zdADm7siuh48Xc14-54kW3mfx04iYseAK32qcl-MVdmRC_
    8sPBjKhWJTYGDd0ecU5KIa9bD2cQlxhGQKd_-z-q-epsmq_>
X-ME-Received: <xmr:L3H7aTZLwdDaIcrdxmkSG4ysme786wH_Zxox-4_CSdsds0nU6djHKm2IFHxYuSVOj_G1kHF9OP3pG23oVmW4RkoLc4xNdbnRUik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdehudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdetvdfh
    kedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgt
    phhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpth
    htohepjhgrshhonhdrrghnughrhihukhesrghmugdrtghomhdprhgtphhtthhopehtvggu
    ugihrdgrshhtihgvsehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:L3H7abv5lJltNv8Ah7Zyet-91sRBJb6xbdThd7L8sCwnRiGl1u26xA>
    <xmx:L3H7adMlpgUpKtqS-i14N-O9qxJFlQgOm2ghjx6UHI6E6vmDKBG1Hw>
    <xmx:L3H7aa7LbRX1NZ_5Bo4xLya8xBVq7QFWAzBQcKDE6Xkg8nwqVK4ozg>
    <xmx:L3H7abSDLnvpB18ndtILFPIthiCa94Wb0SNT_KOzSdHadoYH0XQiZg>
    <xmx:MHH7ac9Epei0FVLCSpqavxFvhT6sXA6U9MKS3uMkrW5XlrpKFnSdN6Oq>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 6 May 2026 18:49:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 0/2] iommu/amd-vi: remove zeroing of MMIO region
Message-ID: <aftxLNbCYKnLrEXM@mail-itl>
References: <20260506135514.47310-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j8Y+pyk47lYf6y1a"
Content-Disposition: inline
In-Reply-To: <20260506135514.47310-1-roger.pau@citrix.com>
X-purgate-ID: tlsNG-d62444/1778086194-AD5AFFF4-42852402/0/0
X-purgate-type: clean
X-purgate-size: 1949
X-Rspamd-Queue-Id: 087994DE4FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]


--j8Y+pyk47lYf6y1a
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 May 2026 18:49:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 0/2] iommu/amd-vi: remove zeroing of MMIO region

On Wed, May 06, 2026 at 03:55:12PM +0200, Roger Pau Monne wrote:
> Hello,
>=20
> Unconditionally zeroing the whole IOMMU MMIO region is dangerous, at
> least on an upcoming platform this does put the IOMMU in a broken state
> that's not recoverable by the init procedure in Xen.
>=20
> Get rid of the zeroing, and instead attempt to disable the IOMMU ahead
> of enabling it.

Just to mention it here, while this looks like a step in the right
direction, even better would be to not disable IOMMU at boot, but
reconfigure it - to preserve uninterrupted protection when boot time DMA
protection is enabled in firmware. But that's definitely more work...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--j8Y+pyk47lYf6y1a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmn7cSwACgkQ24/THMrX
1yyZxQf8CUJvMP7I1sv1PMxXjTsfAkxSupuMPirems1yZ7ya/Qq6eUBU5MSAVO6E
1INLuyh3xsdiXHkVWZEN58ugv/G7S00FrBcjQs0qjZlYRgLdkZJGtBsDEyszbHzW
x3y8STslRt7A6091KHjQwfbUK2ft0tOJVcxQRGipIhQYyDyQh1CRE4FWFgHEGiDc
P6+jF3guzNBskqtnt2dUQL2YxGH7wh4Os6oDEIwqDMlozH1eQP2SPSTU1w3sgi+r
QOlGHAjrMwLtKR/+YzagBuImky9XAmkbWRX4thHiWIDNSp/h4qq8JanlUdATBgd4
ul18mLA1eUVeYh6JrAO8x2KqY5Hz6w==
=6TDJ
-----END PGP SIGNATURE-----

--j8Y+pyk47lYf6y1a--

