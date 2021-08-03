Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27BD3DEDCC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 14:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163423.299365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtQD-0001lg-Jd; Tue, 03 Aug 2021 12:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163423.299365; Tue, 03 Aug 2021 12:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtQD-0001js-Fp; Tue, 03 Aug 2021 12:21:25 +0000
Received: by outflank-mailman (input) for mailman id 163423;
 Tue, 03 Aug 2021 12:21:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXgv=M2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mAtQB-0001jm-Qq
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 12:21:24 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 508da7cb-f455-11eb-9ab9-12813bfff9fa;
 Tue, 03 Aug 2021 12:21:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A6AA5C005E;
 Tue,  3 Aug 2021 08:21:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 03 Aug 2021 08:21:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 08:21:21 -0400 (EDT)
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
X-Inumbo-ID: 508da7cb-f455-11eb-9ab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fdfVUJ
	IjHKOFhvc1n+5ZCW19S3YLW3ybRKC0frijbBs=; b=NfQhBp8jItpXmGtKPzDAf+
	GJJFiC0j1t2XhY5ARHiKoSGgUfdi4g7NJo2l6ePLSH3lFJ82+A9yZ7MsiG2QAeCz
	YE6GBmhHzT7CzvuDT8/vyIIhL7pOmCMT/dE105FcsrY7KEZCt4NwLMRejU95MhKu
	Q1V+v+uyLZefNcUKyoLTpZmF85/0ByEKFwU4SeAClp66LoAaFO/dYE1PHFH5RkgJ
	+75JiU+lTUfx2h6GJY9pDta/2iyMCERsE47ecQT0wncYDaI0L+4KESjtxM8Cgyll
	d8oSCOa2am3Cp0eeTHuDlh07Vvwmgsf6FhaOGxgzgr1BOeTWK0UA9HZZ3kaHeFLg
	==
X-ME-Sender: <xms:wTQJYcdzhTvJLYjw2b-ZNp2PD18Rt1y42P745ZR-BvmYBJX0n35Cew>
    <xme:wTQJYeMxQdOudpldI_f3eQgJ6Xmwc5mV1FBAvS2EJTFhSWAp_0kCg02mILOvyF4uS
    sVgUJUFMVuW-A>
X-ME-Received: <xmr:wTQJYdiHOFRtxofKQCqnJ1f1wP6Yy1vMLtokRfYHLpmYqWj1rzdm6lFrhMlboZAf5qARoKEkF7EnB0xv5F-pQEmcSktq78_R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueejhfeh
    vdfhgeeijeeuhffftdetgeeigfehgffgjeehheeiudekjeduveefteefnecuffhomhgrih
    hnpehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:wTQJYR9TIXaqUae3ZExwTwzJ2JgdW93IyMgqGJou2KlK5CBagG40Ng>
    <xmx:wTQJYYsCtvvN3e9P7vGTrgxb8IoPN1-rNVpp_7ntrdhU80Ui2-XHfA>
    <xmx:wTQJYYGT0hWQk64HWq97XotRDaPXWnnZv4qnWkIR1NgQwnE8nlZf2A>
    <xmx:wjQJYVUDvkzqneEAM9GqD7UXz9vaVv8Vbu3yyl0JnPRwISzeWo5IXg>
Date: Tue, 3 Aug 2021 14:21:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
Message-ID: <YQk0vrH5Oe62ozbW@mail-itl>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bzZg33faU1lyKtW4"
Content-Disposition: inline
In-Reply-To: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>


--bzZg33faU1lyKtW4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Aug 2021 14:21:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings

On Tue, Aug 03, 2021 at 01:13:40PM +0200, Jan Beulich wrote:
> While for 5500 and 5520 chipsets only B3 and C2 are mentioned in the
> spec update, X58's also mentions B2, and searching the internet suggests
> systems with this stepping are actually in use. Even worse, for X58
> erratum #69 is marked applicable even to C2. Split the check to cover
> all applicable steppings and to also report applicable errata numbers in
> the log message. The splitting requires using the DMI port instead of
> the System Management Registers device, but that's then in line (also
> revision checking wise) with the spec updates.
>=20
> Fixes: 6890cebc6a98 ("VT-d: deal with 5500/5520/X58 errata")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> As to disabling just interrupt remapping (as the initial version of the
> original patch did) vs disabling the IOMMU as a whole: Using a less
> heavy workaround would of course be desirable, but then we need to
> ensure not to misguide the tool stack about the state of the system. It
> uses the PHYSCAP_directio sysctl output to determine whether PCI pass-
> through can be made use of, yet that flag is driven by "iommu_enabled"
> alone, without regard to the setting of "iommu_intremap".

How does it differ from the situation where interrupt remapping actually
isn't supported at all? Toolstack will use IOMMU then, in a way that is
supported on a given platform. Sure, missing interrupt remapping makes
it less robust[1]. But really, broken and missing interrupt remapping
should be treated the same way. If we would have an option (in
toolstack, or Xen) to force interrupt remapping, then indeed when it's
broken, PCI passthrough should be refused (or maybe even system should
refuse to boot if we'd have something like iommu=3Dintremap=3Drequire). But
none of those actually exists. And disabling the whole IOMMU in some
cases of unusable intremap, but not the others, is not exactly useful
thing to do (it breaks some cases, but still doesn't allow to reason
about intremap in toolstack).

So, I propose to disable just iommu_intremap if it's broken as part of
this bug fix. But, independently (and _not_ as a pre-requisite) do
either:
 - let the toolstack know if intremap is used, or
 - add iommu=3Dintremap=3Drequire to refuse boot if intremap is
   missing/broken

[1] https://invisiblethingslab.com/resources/2011/Software%20Attacks%20on%2=
0Intel%20VT-d.pdf

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bzZg33faU1lyKtW4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEJNL0ACgkQ24/THMrX
1ywlbQgAlFY4ZBKwafArzNZosvEtrwr/ybCWbPZOnqLp8MPKyyyGcnu5wPjyW7F4
L5BjgOatVcnLMlQHY5yeSbLC0urdHzRmi3vQeYnlkY7aHyIcQfr0+VWha0wJ8h06
zynJTLWIxbuvb0v7TEGjyiMi4FcTGtiFWgtP/smg1tAlEStmWiN4LBPl+TxsqPa5
yOqutwr7ahqZfPYghiCQ4I0W3YSi/DFYrvVCCFp/jCKcvjmuOqp3/e7gmVCu5rrh
J9vSoG36GHHnYLta4GaMny5F5ZO+dguCMPTa08aoDMFfAIqYrnGjWmikrw+4854y
srWVeq0LtPRVZdGB1xQZGsDbHd5TQQ==
=RWff
-----END PGP SIGNATURE-----

--bzZg33faU1lyKtW4--

