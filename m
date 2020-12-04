Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E6A2CEDF9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 13:21:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44702.80102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klA5D-0002iT-EW; Fri, 04 Dec 2020 12:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44702.80102; Fri, 04 Dec 2020 12:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klA5D-0002i4-BQ; Fri, 04 Dec 2020 12:21:07 +0000
Received: by outflank-mailman (input) for mailman id 44702;
 Fri, 04 Dec 2020 12:21:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCoV=FI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1klA5B-0002hz-Iu
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 12:21:05 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 620de4c1-82bf-405d-ae61-514d1f481482;
 Fri, 04 Dec 2020 12:21:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7D48F378;
 Fri,  4 Dec 2020 07:21:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Dec 2020 07:21:02 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id F371E1080059;
 Fri,  4 Dec 2020 07:20:57 -0500 (EST)
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
X-Inumbo-ID: 620de4c1-82bf-405d-ae61-514d1f481482
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DCUEX7
	nYunDYFqZ66Iy4I5yxcBSzLhwsOOKi4sQNbxE=; b=jkuCdY3OXTe4z6HTv8gsMK
	THIBhv0L3s3BJ4huVkWib64+kuNu8WHLfpjA0c+/LqoJcYj8kqr1ucQrbPZDKIxU
	Bb+2rMa79seYtfrVKbTLx99//zM00bAiaqvffwGjri9ErlN2e0uUv8JqlNXJt/k7
	/TicAtQY+/pASlRra/Rf8gA5ZH/H3D/J20HiVsrEngoZzbby1B8u6VdrH+cfnzvc
	KAY0eN0nUC92VHywjbcRoq8DLlpaPTgcYjGk5HgN2gB+iNBqk8GrZKaj5dwhPIwG
	66iD1UeCqagDxaQ1DurXfXyFPlo6p/LLl9gKXEl3prXBp/+3WtmYxysfT2HF8mkg
	==
X-ME-Sender: <xms:qynKXwSjrZx3CdVygWImNiUIt-H-1Ix-BMYv95GxLB56kORMrG9F6g>
    <xme:qynKX9wcCr6HqR-LcjbyfJZ3cO2prBEEO2IsewewuNErBOe-o5zu7sJ3ODY-r2GNj
    09eSZmCWVMxWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:qynKX91JbFohpmDykhajFlzyB76jBqEP8gkQAto8mwKVZ-yXuapycA>
    <xmx:qynKX0BtF81arDY7PNYsEhYxzS3CHV_fVY3rVjxGSXqzT5--J3j6tg>
    <xmx:qynKX5jIZNJH9z_bWhR6LSEZco6vjtZbk0bhU2GQuPT10QLMkSLdpA>
    <xmx:rSnKX5ciGKP_FiNkCvScwmc82ipCUF4NANsxLL3CxUikpTnih9X_kQ>
Date: Fri, 4 Dec 2020 13:20:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9
Message-ID: <20201204122054.GV201140@mail-itl>
References: <20201129035639.GW2532@mail-itl>
 <20201130164010.GA23494@redsun51.ssa.fujisawa.hgst.com>
 <20201202000642.GJ201140@mail-itl>
 <20201204110847.GU201140@mail-itl>
 <20201204120803.GA20727@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0vPiNU+Cgjd3emdO"
Content-Disposition: inline
In-Reply-To: <20201204120803.GA20727@lst.de>


--0vPiNU+Cgjd3emdO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9

On Fri, Dec 04, 2020 at 01:08:03PM +0100, Christoph Hellwig wrote:
> On Fri, Dec 04, 2020 at 12:08:47PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > culprit:=20
> >=20
> > commit 9e2369c06c8a181478039258a4598c1ddd2cadfa
> > Author: Roger Pau Monne <roger.pau@citrix.com>
> > Date:   Tue Sep 1 10:33:26 2020 +0200
> >=20
> >     xen: add helpers to allocate unpopulated memory
> >    =20
> > I'm adding relevant people and xen-devel to the thread.
> > For completeness, here is the original crash message:
>=20
> That commit definitively adds a new ZONE_DEVICE user, so it does look
> related.  But you are not running on Xen, are you?

I am. It is Xen dom0.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--0vPiNU+Cgjd3emdO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl/KKacACgkQ24/THMrX
1yyQigf/Ummc+PwREciQfLShPK41N+ndzLA5XCtY+J8j4jCaXFLTiLe0qmJ+dbio
TiB1PJ4wUlJ5A6OA2nE69SG+xBCSeBkO/uaMOTNdkqjTMadsTbgZwC8eNOLNqmmp
LHN8g6+Z+nT1A1v5vpNdHb9mFb7kCSNuTlqMMbUSGspw9LDPXGhpHB/r+6AZSS4v
DXXb+ZKK82wI01M7lLDzpBtAYNRI5EOoRNK3RC5DlBLjd0ZYzOAtckZ6TKPSm22K
QMo1CWOuCeE6so2nH3aIcEiHI076PVSy0WqCmjskFb3zxZ5YW4VL7695mg7Vhr/E
HU6X5ein1vG+FyxHWtI1jMNQpGk1Sg==
=6oGg
-----END PGP SIGNATURE-----

--0vPiNU+Cgjd3emdO--

