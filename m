Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SATXNhvCzGkWWgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:58:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BFA3757BA
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269771.1558673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pWl-0006E3-Jk; Wed, 01 Apr 2026 06:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269771.1558673; Wed, 01 Apr 2026 06:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pWl-0006C2-Gb; Wed, 01 Apr 2026 06:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1269771;
 Wed, 01 Apr 2026 06:58:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7pWj-0006Bw-In
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:58:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7pWi-00EdIk-Un
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:58:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ccc1f4-bab6-0a2a0a5309dd-0a2a450184b8-40
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:58:08 +0200
Received: from [103.168.172.154] (helo=fhigh-a3-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ccc1ff-6fc9-0a2a45010019-67a8ac9a97bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:58:08 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 4F6E51400259;
 Wed,  1 Apr 2026 02:58:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Wed, 01 Apr 2026 02:58:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 02:58:05 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775026687;
	 x=1775113087; bh=jF4ruGDylsCYBVSM6WacgUke1wH5r81mFGF0xur5YLQ=; b=
	K/d+HyZ1xIvdJOvrlb1xN5wvsA+e5LoB+qVSxHToAX4K/heU+5RhLxFpJenyaoRO
	5A+SuoaPF+uGW8uaWuY2Kuotdrt9tE55Bw+SxSeYb/AaMZnTwWDVrX9FJaDP3xUp
	E1YYD9GRKt+PdeCjUbgOXWIKdDQTeSaCflrBPl8HsaeYTcy0xiBrEbY4liveW12m
	wA674fz+tGTlphYMVUv3bVlGjF/RrbuQkU+48vxDjo0LdUtsGFay8bKuocAKcD5Z
	UkFpUx/U259Muc5lORAYuvXAppbXfls8dVL9r/eZMgvQ1DzSP08Xmtpxls9BqX4n
	SGe1+zt38yed8sEckWZhOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775026687; x=1775113087; bh=jF4ruGDylsCYBVSM6WacgUke1wH5r81mFGF
	0xur5YLQ=; b=MQdw0Bit3uPHo3gx+Vjtt1H7oe7167iKE8EtJzKKcHj1c1qfLl+
	z5Ml5adu9UN7+t6rsgpwOIySF2eyJrfXvn3FnoBTU2AoUZprJQsCPsJsSGRq6JHH
	uKjP5UFmFZkALzEbaix1amqK8/ueiqPkugBDbcLnWBYxgi2gIow87qz8/2I+5bLo
	AKzQBy2nEWCbTG+d/GJOv21i70z4TFsV1zYFFhWlsVFta8Fgsp7Mfvug/Out9nhf
	zM3CKIUgWdYXtqpSG6ANbfnJu8VpHR6/hL+KWOZ0mJC05+6Vwvp+xevMgZGu6X5F
	P7tEibGl6Ci7NKWuHCNfZ60RP6Gt6+kNrDw==
X-ME-Sender: <xms:_8HMab99CjNgDJoc1A76qbz8dbupby3-Qg4sq08XXDnTidzBjc3wpA>
    <xme:_8HMaekKstEcYS4OzYiX5H89agt-Eco6iaKdLcIhoJBfbaU1iDSyJwSn3_B4hfS75
    MOdn4NDkU0Hm6jeUJbEDL1gULJy1G3ErlWSsueC6WiwCtALqw>
X-ME-Received: <xmr:_8HMaRWOev5CQPxmmQZ_YOzVuip6-Fr1qw-CQBCy3rD9lAGoP3qpssa6IqHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvgeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgt
    ohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtg
    htrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidr
    tghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:_8HMaTGH0iwqmU4FgvD1QUvzoWtvH2fICX3dHH_aDZzB3u0DOylf-w>
    <xmx:_8HMaddSW4_JktwXhXXM-oZ40geweEfzj7yYgOauJ-JI4Dx34zAfGQ>
    <xmx:_8HMaULJf-odL08z-AsQLUAyWQSXGQU6dTBqx1pWgCckIOyprIcQGQ>
    <xmx:_8HMaSFFS8K_EXvX4hJIbcn9D1DBx0vVACi1AO7K1J33PMDhzvZFZA>
    <xmx:_8HMadOxhGck7v2q2LnnEEggqC8kNW7J_10t33Ceo0CV-_YCHBWc-wKR>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 1 Apr 2026 08:58:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 02/13] Switch Linux builds to use
 Alpine 3.22 container
Message-ID: <aczB_KRjioY3KCtA@mail-itl>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
 <652a2f219b370af5364d8ef29264acc33a89f676.1774999132.git-series.marmarek@invisiblethingslab.com>
 <bf843de8-dbfb-436c-ac33-ea801ac61b53@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xz4EeMhth/eSiNsR"
Content-Disposition: inline
In-Reply-To: <bf843de8-dbfb-436c-ac33-ea801ac61b53@amd.com>
X-purgate-ID: tlsNG-d62444/1775026688-BC766185-D48C7004/0/0
X-purgate-type: clean
X-purgate-size: 2474
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 34BFA3757BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--xz4EeMhth/eSiNsR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 1 Apr 2026 08:58:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 02/13] Switch Linux builds to use
 Alpine 3.22 container

On Wed, Apr 01, 2026 at 08:46:02AM +0200, Orzel, Michal wrote:
> Why not 3.23 if it's already there?

Because it wasn't yet when I prepared this patch series :)

I can update again and see if any other changes are needed with 3.23.
Other patches are independent of this change.

>=20
> ~Michal
>=20
> On 01/04/2026 01:21, Marek Marczykowski-G=C3=B3recki wrote:
> > Slowly phase out 3.18 one.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  .gitlab-ci.yml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 17d25ce0f921..36622c723ce9 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -21,14 +21,14 @@ stages:
> >    tags:
> >      - arm64
> >    variables:
> > -    CONTAINER: alpine:3.18-arm64-build
> > +    CONTAINER: alpine:3.22-arm64-build
> > =20
> >  .x86_64-artifacts:
> >    extends: .artifacts
> >    tags:
> >      - x86_64
> >    variables:
> > -    CONTAINER: alpine:3.18-x86_64-build
> > +    CONTAINER: alpine:3.22-x86_64-build
> > =20
> >  #
> >  # ARM64 artifacts
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xz4EeMhth/eSiNsR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnMwfwACgkQ24/THMrX
1yx4Mgf9HlomCIgdYQGzIcdVZXpF299QHlto6g1BSy6RnqxZqtqjI4ry+0Y1QLTJ
u414KT2mvB84qGWi2FpKeYvrEm2hGCgo1i3axkV3mc8/S8wfuZXvwF4ukwfbB8Mp
ozqPW0br0pZlwjZstfZeSCmn8ZYgR3tKmtgUrXlRK2Fsp1amiAOdLrAwg1ZnQnw1
LyBxl2Y7ZcTqA6JxeVjDuE9YSLXfxYNJV/Qm2trxe/mXWEwcgdhX0RLO8fP/s/t9
v1041rd5Vu+LT/dhy6KbRlPyTVaBXqass8ZCBaLvwHmaAn0WL3wDvZLvPDQ5eKTp
Y6FCrLysovLd6Eg6ioV2HkQLSfBdgg==
=oXm3
-----END PGP SIGNATURE-----

--xz4EeMhth/eSiNsR--

