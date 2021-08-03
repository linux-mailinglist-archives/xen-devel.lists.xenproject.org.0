Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79063DEF20
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 15:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163488.299473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuUz-0004ep-2Z; Tue, 03 Aug 2021 13:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163488.299473; Tue, 03 Aug 2021 13:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuUy-0004bd-Un; Tue, 03 Aug 2021 13:30:24 +0000
Received: by outflank-mailman (input) for mailman id 163488;
 Tue, 03 Aug 2021 13:30:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXgv=M2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mAuUx-0004bX-7Q
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 13:30:23 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c1a54ea-2dae-4866-a66e-4f27d75ddee9;
 Tue, 03 Aug 2021 13:30:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BD7A35C0189;
 Tue,  3 Aug 2021 09:30:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 03 Aug 2021 09:30:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 09:30:20 -0400 (EDT)
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
X-Inumbo-ID: 2c1a54ea-2dae-4866-a66e-4f27d75ddee9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=njCeVW
	Hkp3+kQIDTRaLIg71XMaVis2WbAirdeXdxvAU=; b=MVVHjQpfLoRbR04Ne5OM1w
	Khp4xyRd4mNpPbZqSBPzsxbQwPVhkjoXCj6MrH7g/fcf4T+i3v54NATxr1+oJxV2
	V7VSBSp4FkN1V3iXYJSiQulurvE5BD8oQihJjcYfu5HoYM8Vui79q0nXNGYqJMYq
	HnktnetKzfXVhgv1Ksdtt6ZSgq89yuuJpwSODA6cp6ZeAxvxbHIk4kquppEHBiZK
	yjOblYuDtMtHBArrQu6eG5BDBmLBwqEkDMCjiOMrBlM0f8nPLgUvaAVF1K73OcyT
	31S6PBFtojwjFjMPrV9KZ8/mEHcI8zinxO00HDjm133qxO6ONppM0UA7quLgXf0g
	==
X-ME-Sender: <xms:7UQJYdj3Zi-aq8eafrXjBCFcve9sD6QNYRPNfoVKd3Cb1L_kVnhnIA>
    <xme:7UQJYSCzmcTMHhDsOwVD62Kz4hGh9HJbGG-i7-v0JxsvER3kK_-lu40MVnN0t_4hO
    lylaZpzhJBbXQ>
X-ME-Received: <xmr:7UQJYdFcQKUw977hojUnN3I8FQmHhgClrY3dIifSeNAdwzQ8xkYbLbvPrSSMOb0iBKy-_Mu7CeCs_Z1mo5l2avgk2S2rqr_7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:7UQJYSS3WkPjjLEvIza84JsSVWMY4ZMPtM0QFTdFzq1wecQrT0A3wQ>
    <xmx:7UQJYawWnndbU7q3hyBHhHDR2v1zrua0Vyf2HOAFFEJGySUYDgCWwQ>
    <xmx:7UQJYY7LJIb9E7oqJ0IBxppecd3qKgvp5qQP5gnYc2VtNk89BGJanQ>
    <xmx:7UQJYfoC_PWxDdZicAU7RpWB-uqGoq9I2eKCpEP5dEC6LIrt2rUOpw>
Date: Tue, 3 Aug 2021 15:30:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
Message-ID: <YQlE6XgSK207emw/@mail-itl>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <YQk0vrH5Oe62ozbW@mail-itl>
 <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>
 <YQk+I2FglGrnuyPw@mail-itl>
 <10425176-438f-370b-9d60-183d6e0f5441@suse.com>
 <YQlAsAneiMOD+SMq@mail-itl>
 <b7b0c929-26d8-c1de-7658-a58ed31ee9be@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1nzrRTmZWqHMh/1X"
Content-Disposition: inline
In-Reply-To: <b7b0c929-26d8-c1de-7658-a58ed31ee9be@suse.com>


--1nzrRTmZWqHMh/1X
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Aug 2021 15:30:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings

On Tue, Aug 03, 2021 at 03:16:14PM +0200, Jan Beulich wrote:
> On 03.08.2021 15:12, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Aug 03, 2021 at 03:06:50PM +0200, Jan Beulich wrote:
> >> On 03.08.2021 15:01, Marek Marczykowski-G=C3=B3recki wrote:
> >>> Ok, then, just setting iommu_intremap=3Dfalse should do the right thi=
ng,
> >>
> >> ... if "iommu=3Dforce" is in use (but not otherwise), ...
> >=20
> > But that's the purpose of iommu=3Dforce, no?
> > With "iommu=3Dforce": strictly require IOMMU
> > Without "iommu=3Dforce": use IOMMU on best-effort basis
> >=20
> > It makes sense to refuse the boot if intremap is broken in the first
> > case. But also, it makes sense to allow using IOMMU without intremp in
> > the second case.
>=20
> I agree with both statements. What I disagree with is that the latter
> happens by default (instead of only upon admin override), including
> the case of intremap being unavailable in the first place.

"upon admin override" - do I read the code right, that iommu=3Dno-intremap
will actually achieve this effect? Will that allow to use IOMMU without
interrupt remapping on a hardware where it's broken? In that case, maybe
at least add this info to the log message?

IMO an option to strictly require interrupt remapping would be useful
thing to have, but that's getting even more unrelated to this bug fix.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1nzrRTmZWqHMh/1X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEJROkACgkQ24/THMrX
1yyYigf9GhHUnocbjQxWGp5xyepJV7B/P4bsjRH9H0ZFKFCqV35sqr3D5W4UwkIu
1pQtXLuTC657U6WeSCoe3tlgKkVwYm/vQ++XRnUqwqBYpvcQgBODgKmGBl8oEif1
Qn8R2WgpYaqUFIdOJvIH01tI8nKzZrU1pL9hE7fsfKLTeUQt/wOScAUJqqUV1trh
DqtD0YAytv9zNiuVXBmREMrfR0tqk3mkRWxR2I1q08yh+UsftOXJFwXGhe72dxiB
zYsJFECUSp/1JOTd+xEGOKN+kqFx5zCaS1NcgFJP5ziTDpWS4aHxyAb+4xKEeok3
VDM9ta4BuHUwBlTOnLe0jFrW1AUMaw==
=e2X7
-----END PGP SIGNATURE-----

--1nzrRTmZWqHMh/1X--

