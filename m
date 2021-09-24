Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F51A417E7D
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 01:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195730.348569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTv6J-0000Ox-SO; Fri, 24 Sep 2021 23:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195730.348569; Fri, 24 Sep 2021 23:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTv6J-0000N3-PV; Fri, 24 Sep 2021 23:59:31 +0000
Received: by outflank-mailman (input) for mailman id 195730;
 Fri, 24 Sep 2021 23:59:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=03IS=OO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mTv6I-0000Mv-Gm
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 23:59:30 +0000
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f726a939-066d-47d4-b114-0ea74bd941e5;
 Fri, 24 Sep 2021 23:59:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4251A580E9D;
 Fri, 24 Sep 2021 19:59:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 24 Sep 2021 19:59:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 19:59:26 -0400 (EDT)
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
X-Inumbo-ID: f726a939-066d-47d4-b114-0ea74bd941e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=D3+aV5
	pdnNgiVBKhSk9fIgGRiazPjnt4ThMKaQG4k6Y=; b=SpyX4SqT3VyudFwA/TLXma
	xC6kmBiBViHTKXLD6n2o9iABbnceZyRegDybfOXiazh3LawiM2lPS2oxcgqyaYTH
	akHqSgmeG6AVcR96mxERYS2DlbpOrkg0YLwGposQIm4u04sk4uEMBkmS3HcYrP9G
	ZYAT5c670xxVbSi0SGq+DrfOma/RD0rFWFOpvuRDjja+yqb12SNxLIx9bpVwG7h/
	gaII18IwQKs8PwOnjVnzVPgs0moy1B3+kjdxMO7WYWwUeSzrPqjxEjKfC7qsmAyS
	cqgSGHb1dnI+ANP8FrHqGtKw+aJwM+LRjbJ+Wcbv4qkzhl/zb6NEadwvZY96GM/Q
	==
X-ME-Sender: <xms:YGZOYSY9873HBPvfzRw_c-fmno2y3AZFzqYvjhAxKHd_NOa-iXi5-A>
    <xme:YGZOYVZJfwSo12W8Jy9r_Mv1yQj9c6MARwAxAZKqEo9SwfkLJs-tpgGD-_siLGkJH
    z9vujofXMmHkA>
X-ME-Received: <xmr:YGZOYc_VvWynAvgFu3kstJImC6Mro2NFT9n21AROOQRoLbBfHcIpj5IB3phD61eNhNL122eb-PEH1-bb0Z1NZVOOyTBGujfi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejvddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegudfg
    hfegfeeigfegtdetgefghfekgfeihfduhefhleeuvddvvdetiedvudeltdenucffohhmrg
    hinheprghtlhgrshhsihgrnhdrnhgvthdpgigvnhhprhhojhgvtghtrdhorhhgnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvg
    hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:YGZOYUpvo7zhNFwpLBgm1J9Ps-U-CeeZbEts9bZU9mVxU22St44i_w>
    <xmx:YGZOYdqiDihTu2dpOsRxCqbIkElRP1kknFVT3hgQx-d5E4icgjVKug>
    <xmx:YGZOYSTPaeKkwav6FQaPJhCh__vo-MD2RXc0urhdVknKYOXW6vodmg>
    <xmx:YWZOYYCVNzoM6m7c_ew43nGtiGsDvZ7cFQnSzfiiePWnX7k1577plQ>
Date: Sat, 25 Sep 2021 01:59:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel@lists.xenproject.org, wl@xen.org,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
	Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: Xen Rust VirtIO demos work breakdown for Project Stratos
Message-ID: <YU5mW396S04IsCBr@mail-itl>
References: <87pmsylywy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AHnRrpNF9QyKNyZE"
Content-Disposition: inline
In-Reply-To: <87pmsylywy.fsf@linaro.org>


--AHnRrpNF9QyKNyZE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Sep 2021 01:59:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel@lists.xenproject.org, wl@xen.org,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
	Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: Xen Rust VirtIO demos work breakdown for Project Stratos

On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Benn=C3=A9e wrote:
> Hi,

Hi,

> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>=20
>   Currently the foreign memory mapping support only works for dom0 due
>   to reference counting issues. If we are to support backends running in
>   their own domains this will need to get fixed.
>=20
>   Estimate: 8w
>=20
>=20
> [STR-57] <https://linaro.atlassian.net/browse/STR-57>

I'm pretty sure it was discussed before, but I can't find relevant
(part of) thread right now: does your model assumes the backend (running
outside of dom0) will gain ability to map (or access in other way)
_arbitrary_ memory page of a frontend domain? Or worse: any domain?
That is a significant regression in terms of security model Xen
provides. It would give the backend domain _a lot more_ control over the
system that it normally has with Xen PV drivers - negating significant
part of security benefits of using driver domains.

So, does the above require frontend agreeing (explicitly or implicitly)
for accessing specific pages by the backend? There were several
approaches to that discussed, including using grant tables (as PV
drivers do), vIOMMU(?), or even drastically different model with no
shared memory at all (Argo). Can you clarify which (if any) approach
your attempt of VirtIO on Xen will use?

A more general idea: can we collect info on various VirtIO on Xen
approaches (since there is more than one) in a single place, including:
 - key characteristics, differences
 - who is involved
 - status
 - links to relevant threads, maybe

I'd propose to revive https://wiki.xenproject.org/wiki/Virtio_On_Xen

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--AHnRrpNF9QyKNyZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFOZlsACgkQ24/THMrX
1yznCgf+PxWtKZFIkMoii7nrqq1zsVOOz1nD0JyDJ6nL66bRTK2L2IH4kZkZaCZF
hSwGSjPU2ulafdtyDwNbMkezDqREjfQ2QfNwZ9s/d/J7i+kujFlWrbNyf8EOvADy
BFTafXlE6wv0BwLHu5qNx9QrJ1rhK1pFFqWXr8+bgTlkyJ1XdYg6QCbK8+Z2lGFD
IMhLIfUOkzYJzCjSgQrDUh0GIejgEs5XtZGJkJOg+5oto3sGk941Ypf1f0137HE+
KQEi8PB949kdDq6AiSQ6WohylBu4crSYqDjKSqB8mdmC06JWEzDumfPsx18TU/TM
JWvdlcY04hj37zcN+MEmA1La+B/Rbw==
=hcgf
-----END PGP SIGNATURE-----

--AHnRrpNF9QyKNyZE--

