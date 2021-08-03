Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415463DEF56
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 15:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163512.299524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuqK-0008UK-RR; Tue, 03 Aug 2021 13:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163512.299524; Tue, 03 Aug 2021 13:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuqK-0008RE-Nt; Tue, 03 Aug 2021 13:52:28 +0000
Received: by outflank-mailman (input) for mailman id 163512;
 Tue, 03 Aug 2021 13:52:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXgv=M2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mAuqI-0008Q5-LA
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 13:52:26 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25dfe777-96a1-45da-9ac5-5cf27872cf15;
 Tue, 03 Aug 2021 13:52:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B31DA5C00E1;
 Tue,  3 Aug 2021 09:52:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 03 Aug 2021 09:52:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 09:52:24 -0400 (EDT)
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
X-Inumbo-ID: 25dfe777-96a1-45da-9ac5-5cf27872cf15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ltLepX
	ykxxHhw3LwO+AcN+PFeuahYfjI3GmCX08PcUs=; b=OxobtOMDmPj604kZcSOLO3
	b+m7tuwVqZzxg7WETKCdaqWuGYt2TB3wqsMTJIW8SVBIThHj4CnshkhvrO1bQYYn
	EAn/MD+5sK+gl5vInI8yC0PbQRoJJ+31V7/JOCyEctGlFMkZP4vmydHK6RZ4/Vx7
	Be5Cd6GRbm3v6Eq8ne3Vf3dv6nolTItS2jzFNNbeinZKBMfbuJ/pGpoOpnPZpMLF
	O7k7U+vbwjE1JCdAYZ6MH4IfMV6Bsem2d+mnz3QQcQZJRiXShEhBTtoutPZctOog
	CQj0UUuch1i1Jh+IE4oKDECjv9/ORttTlFkdQB2q70J5jhcWA3opQExt0JCfUf3Q
	==
X-ME-Sender: <xms:GUoJYSc84_P-nFjshh1r0utbtwCQ1JJrfXL-Lw3nQOr0NUoyaGoXyg>
    <xme:GUoJYcPCtY3A0o_DvhwFcF7XzbwaStPUcEiT8vu7gsws19o3tHHvzc4QgWSHNvAMq
    Tv0zL44Om9nJg>
X-ME-Received: <xmr:GUoJYTh3g0D2dVENo6xpUFIOJ9Tc1rFkNLogBUJYlUCfAe13swdb6NXSbll4REHqSoQrKx0IjpMwCeMOlXd6gxoqa3_iMKl2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieeiheej
    geetgeegiefghfekkeeifeejudehvdffhfeigfekhfdvveefjeffvdefnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:GUoJYf9-mVGgOzhyWSPu0Ldo1JQaCYPBwcHJZfKdzllrCPFEbclq8w>
    <xmx:GUoJYevwyxdXsFBIrJUtcflRD0c7nV0naaKDXnA1nYuZDIjRAYtyAw>
    <xmx:GUoJYWFS07_nt3_53z9Auwe55qkMY7lMoxcMid-ddo52hM7O-rKAwQ>
    <xmx:GUoJYTXL27H-dpe6uoP-2DLAjVcKZg69JHPQZW1qPD4AIRtF02anCg>
Date: Tue, 3 Aug 2021 15:52:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
Message-ID: <YQlKFVOFOjevmIXO@mail-itl>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <YQk0vrH5Oe62ozbW@mail-itl>
 <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>
 <YQk+I2FglGrnuyPw@mail-itl>
 <10425176-438f-370b-9d60-183d6e0f5441@suse.com>
 <YQlAsAneiMOD+SMq@mail-itl>
 <b7b0c929-26d8-c1de-7658-a58ed31ee9be@suse.com>
 <YQlE6XgSK207emw/@mail-itl>
 <f9f613a6-cf27-8432-c877-95a8516216c6@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yRbA9OzDeI5UJ5Nl"
Content-Disposition: inline
In-Reply-To: <f9f613a6-cf27-8432-c877-95a8516216c6@suse.com>


--yRbA9OzDeI5UJ5Nl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Aug 2021 15:52:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings

On Tue, Aug 03, 2021 at 03:44:10PM +0200, Jan Beulich wrote:
> On 03.08.2021 15:30, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Aug 03, 2021 at 03:16:14PM +0200, Jan Beulich wrote:
> >> On 03.08.2021 15:12, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Tue, Aug 03, 2021 at 03:06:50PM +0200, Jan Beulich wrote:
> >>>> On 03.08.2021 15:01, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> Ok, then, just setting iommu_intremap=3Dfalse should do the right t=
hing,
> >>>>
> >>>> ... if "iommu=3Dforce" is in use (but not otherwise), ...
> >>>
> >>> But that's the purpose of iommu=3Dforce, no?
> >>> With "iommu=3Dforce": strictly require IOMMU
> >>> Without "iommu=3Dforce": use IOMMU on best-effort basis
> >>>
> >>> It makes sense to refuse the boot if intremap is broken in the first
> >>> case. But also, it makes sense to allow using IOMMU without intremp in
> >>> the second case.
> >>
> >> I agree with both statements. What I disagree with is that the latter
> >> happens by default (instead of only upon admin override), including
> >> the case of intremap being unavailable in the first place.
> >=20
> > "upon admin override" - do I read the code right, that iommu=3Dno-intre=
map
> > will actually achieve this effect?
>=20
> In the case of this quirk - yes, as the call to the checking function is
> gated by a check of iommu_intremap. But by "admin override" I meant a
> per-guest attribute, not a host-wide one that isn't explicitly meant to
> cover all guests.
>=20
> > Will that allow to use IOMMU without
> > interrupt remapping on a hardware where it's broken? In that case, maybe
> > at least add this info to the log message?
>=20
> You mean to suggest the use of this option? I'd rather not, to be honest.
> I don't think options like this should be suggested to be used. I'd
> prefer if we had less of such options, i.e. if they went away after some
> initial integration phase.

Indeed, in fact I agree, this should be per-guest configurable option
(and in some cases, it kind of is - toolstack will refuse to boot a=20
domain with PCI devices if IOMMU is missing). But, as you noted earlier,
there is no way to require intremap, on per-domain basis (regardless of
what the default behavior would be).

As for optionally requiring IOMMU host-wide, this still makes sense, as
IOMMU could be used not only for PCI passthrough, but also to protect
dom0 from some (possibly hot-plugged) devices - using quarantine
feature. There may be also some desired interactions with Intel TXT
(which AFAIR itself requires working VT-d).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yRbA9OzDeI5UJ5Nl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEJShQACgkQ24/THMrX
1yw4sgf/YiTQchoSReND5JD2iSCV1ssEQeWCy0Z315lOwTVxwpAZmi5m2o09n9ku
iGFKNlayXk5k+rdeDv5DCgUo2cJy6U/mxy2O6f/Gl/8maPxxTJRAb+JYSIDVqGsm
bOuLT0Thd7SQt+2OiQhocMmDqUT5nBoiya+FzWPLLthXl8gFQEMKIAe2rOntTqsD
5Pt1JAm0i3yuBbcEdAQCTcXNW31hENUSkSvZsJatU9+bMKL78wR9KXCCTGtK1bX5
9zWO2mIVpV7Ddm0+dQF+syZRkSRN+cdTVcVjvt1hRyoMoRUjfOACNSnPWknNy2Vp
By8MmSrlH0EEvFLAFSKLm6QLbZ93vA==
=0MRW
-----END PGP SIGNATURE-----

--yRbA9OzDeI5UJ5Nl--

