Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927B3F027C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 13:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168189.307067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJYa-0002MV-9P; Wed, 18 Aug 2021 11:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168189.307067; Wed, 18 Aug 2021 11:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJYa-0002Kh-6W; Wed, 18 Aug 2021 11:16:28 +0000
Received: by outflank-mailman (input) for mailman id 168189;
 Wed, 18 Aug 2021 11:16:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWQ4=NJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGJYY-0002KK-Hv
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 11:16:26 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b96dd032-0015-11ec-a544-12813bfff9fa;
 Wed, 18 Aug 2021 11:16:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8180E3200912;
 Wed, 18 Aug 2021 07:16:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 18 Aug 2021 07:16:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 07:16:21 -0400 (EDT)
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
X-Inumbo-ID: b96dd032-0015-11ec-a544-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OQ4J5y
	c0ZEZ0U17OcF/gNXoEhsN0/jdJ+xsl6mwX2BA=; b=fyxigPprggWLxDIXjgaO+Q
	hPgN+OcgYdSd5IE6OPoO9ttntQUG6JYVlo4IV3AolvnTuRf6uZ6xa41WpM0FgCXl
	tEw7gov5S59UeAoj4Zdbmlfzonq0xrhT5vOQsShJYVwIMCHpIQvAHk3h9uIQEcn0
	nRIZfDmu5AHJFL+mutKFw1oTHW9Wp9QWrqQ3h4vBR9880PUjt/LGLSRCQX6NUJrw
	+MzpHd3hPrw2OJomyiXlYbp4s+4h32Je+dUIA+zZjGtIi7LkfBLx54gReJpRTDT5
	apmWS4cQEYZ/xIAWqaE1F0A+YTdPqJz4coUlixgfkU+e4Xf+B5N7RH3Bq7zYSbcg
	==
X-ME-Sender: <xms:BuwcYfCg9nFjFy3KnxbXCXR0rHIoDIFjUCHndjvA3mKdGV3LJV1Usg>
    <xme:BuwcYVhC0N99UFMeUFTqw07tN1HTv44pTYUcrvCHDOPQFfkMoatLJi_YYiLqZz1Pa
    AFsyq0aaXHKPw>
X-ME-Received: <xmr:BuwcYamnx9eBBOtlssP5UQWl8Mp5enEZDAru4Jja7CsRTVUvImXcBfu8gBKQver40HZ2WO2KUdQFw6Ob_HaCZmqey9XamZHD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:BuwcYRylU6OgETmWQuUy4_20jehu5O5xz3jOllDmKa4xJ4rDr6rJIw>
    <xmx:BuwcYUQ5CGsz9ajKPeIv96WG2vHabe8zgoQGR5HCRv3W4ImpUTiwsg>
    <xmx:BuwcYUYWijl19seTWLem1cRw6QplAzYncige9ZfS0Xb4JT6mZe3YSw>
    <xmx:B-wcYTEiDnVB5Msm1JyiMQ3UEkCOqbBgALtrGIR6JFfxC0ppK_50AQ>
Date: Wed, 18 Aug 2021 13:16:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	committers@xenproject.org
Subject: Re: [PATCH] RFC: Version support policy
Message-ID: <YRzsAvOU5G2O1X2+@mail-itl>
References: <20210813113727.6028-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3pbOh7j+9i1JsfMm"
Content-Disposition: inline
In-Reply-To: <20210813113727.6028-1-iwj@xenproject.org>


--3pbOh7j+9i1JsfMm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Aug 2021 13:16:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	committers@xenproject.org
Subject: Re: [PATCH] RFC: Version support policy

On Fri, Aug 13, 2021 at 12:37:27PM +0100, Ian Jackson wrote:
> The current policy for minimum supported versions of tools, compilers,
> etc. is unsatisfactory: For many dependencies no minimum version is
> specified.  For those where a version is stated, updating it is a
> decision that has to be explicitly taken for that tool.
>=20
> The result is persistent debates over what is good to support,
> conducted in detail in the context of individual patches.
>=20
> Decisions about support involve tradeoffs, often tradeoffs between the
> interests of different people.  Currently we don't have anything
> resembling a guideline.  The result is that the individual debates are
> inconclusive; and also, this framework does not lead to good feelings
> amongst participants.
>=20
> I suggest instead that we adopt a date-based policy: we define a
> maximum *age* of dependencies that we will support.

I wonder about another approach: specify supported toolchain version(s)
based on environments we choose to care about. That would be things like
"Debian, including LTS (or even ELTS) one", "RHEL/CentOS until X...",
etc. Based on this, it's easy to derive what's the oldest version that
needs to be supported.
This would be also much friendlier for testing - a clear definition
what environments should be used (in gitlab-ci, I guess).

Thoughts?

> The existing documentation about actually known working versions
> then becomes a practical consequence of that policy.
>=20
> In this patch I propose a cutoff of 6 years.
> Obviously there will be debate about the precise value.
>=20
> It will also be necessary to make exceptions, and/or to make different
> rules for different architectures.  In particular, new architectures,
> new configurations, or new features, may need an absolute earliest
> tooling date which is considerably less than the usual limit.
>=20
> I have tried to transcribe the current compiler version info into this
> format.  The dates in the exceptions are all more recent than my
> suggested 6 year cutoff, so if this patch is applied to staging and
> not applied retrospectively, they could be removed.
>=20
> I'm not sure if this policy should be here in README (where the
> version support was until now) or in SUPPORT.md.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3pbOh7j+9i1JsfMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEc7AEACgkQ24/THMrX
1yxRNgf+POqWHLaA4MXugyydRzeLhkX/HGZKvVsfWwUTPjZ9pwYYTPH6+Q8VzxW1
9mYMTJICLgTjp6h1x3xopR9IkdbPRRO3+iQ98ado55Y0PuVhxxNnp7QfyKnxeVk0
g7zlnls07pPZO1jbDjN+79QaWmnHBJebLXyaGrnYq2seGtpxvV/A9posgdoh+1vy
iS38YsIxhwg0vhzkfx7XKru6dz6dELeJ8FwLWKdPKTIR2fSgm3+Ez83zLpX2Iwzv
S3SxButXbHp2VHVKx0eVrwrLsD4jN4rIWyiPkC+/Da+1kKfMBn3AnU81PdbC5oH9
BkG03rAWxF0K8rFUWpYs4ydvOxT4Kw==
=K8hm
-----END PGP SIGNATURE-----

--3pbOh7j+9i1JsfMm--

