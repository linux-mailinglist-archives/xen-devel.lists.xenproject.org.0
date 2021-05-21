Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55038C52B
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 12:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131223.245374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk2cc-0006ct-3f; Fri, 21 May 2021 10:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131223.245374; Fri, 21 May 2021 10:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk2cb-0006aS-WA; Fri, 21 May 2021 10:43:13 +0000
Received: by outflank-mailman (input) for mailman id 131223;
 Fri, 21 May 2021 10:43:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8sL1=KQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lk2ca-0006aM-Dz
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 10:43:12 +0000
Received: from wnew3-smtp.messagingengine.com (unknown [64.147.123.17])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23f00bdc-7a37-44e7-9975-26e58d976214;
 Fri, 21 May 2021 10:43:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id CFA6C127F;
 Fri, 21 May 2021 06:43:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 21 May 2021 06:43:09 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 06:43:05 -0400 (EDT)
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
X-Inumbo-ID: 23f00bdc-7a37-44e7-9975-26e58d976214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5uODI0
	1Xgq6m2Hs1jcEGX2rKBKwRaYcR9su+Lfn8v9I=; b=COtRV+F19cAeQdDNk/rVdC
	Qog2aXIYdX+hhTJoJ4wkbuDGi2XXAs2fj64hX1SwUyQGyNDPi/ojfU4lekj+OXZs
	4TvLBsWR76nVhlvLZZAddWhltadoEGkD1yCVvjIBiWlDAN7zsUvWUdLHF1gCbe0x
	TsiKlgOVLiscgkDk4i1yYCsyUBF79psshPwSVqkzVnTCVyFteOpt5yHpwbgaRBwR
	LHp5egybXYWTXKHMNXIqx7c8uR1RyXHtV/A1mWKSPBRw4nxdCgxgi3gi/iUG5VEa
	qxHcORBLPHHNNQaMhgk/1QI+r21ijf3nurUINMh0WQKdpUDjX9b7A+EJiCTiMCDw
	==
X-ME-Sender: <xms:u46nYEyh3wZwvMGTA5vBI3zdj3e24axeVBi9PJUqCruMlycdv-ZsHA>
    <xme:u46nYIQRKLpp5zCZkG_RpbHBThveg62q3e0EYoFeY2RcvKd5_bHRRS24lABixvm3J
    8Z0aLg7UPvxjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejfedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegjeej
    jefftdefgffghfeujedvheffhedtjeejgfevhfefgfeigfelkeegjeejgfenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmpdigvghnphhrohhjvggtthdrohhrghenucfkphepledu
    rdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:u46nYGVl3NcSG603U5Dc6sPvTEae_YeRemGaz37WpHxU-8JMgw_mjA>
    <xmx:u46nYChW7z_JLjaA6qqYp-56HzvX5LPXftyI6zGPcw63_D6vVTgzVw>
    <xmx:u46nYGBjc5kymt7v0TJG_QYkdllTG-gwfaYOchOpMqFUHsSx9dEMFg>
    <xmx:vI6nYHKvcbgLVUghBWSNPmANdv41Y8Bys2iYHcL9bJIpBipIRFdYWJyKg10>
Date: Fri, 21 May 2021 12:43:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 0/8] xen: harden frontends against malicious backends
Message-ID: <YKeOtbXkFz7JTMn0@mail-itl>
References: <20210513100302.22027-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bxyuzBoNLlcC9wan"
Content-Disposition: inline
In-Reply-To: <20210513100302.22027-1-jgross@suse.com>


--bxyuzBoNLlcC9wan
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 May 2021 12:43:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 0/8] xen: harden frontends against malicious backends

On Thu, May 13, 2021 at 12:02:54PM +0200, Juergen Gross wrote:
> Xen backends of para-virtualized devices can live in dom0 kernel, dom0
> user land, or in a driver domain. This means that a backend might
> reside in a less trusted environment than the Xen core components, so
> a backend should not be able to do harm to a Xen guest (it can still
> mess up I/O data, but it shouldn't be able to e.g. crash a guest by
> other means or cause a privilege escalation in the guest).
>=20
> Unfortunately many frontends in the Linux kernel are fully trusting
> their respective backends. This series is starting to fix the most
> important frontends: console, disk and network.
>=20
> It was discussed to handle this as a security problem, but the topic
> was discussed in public before, so it isn't a real secret.

Is it based on patches we ship in Qubes[1] and also I've sent here some
years ago[2]? I see a lot of similarities. If not, you may want to
compare them.

[1] https://github.com/QubesOS/qubes-linux-kernel/
[2] https://lists.xenproject.org/archives/html/xen-devel/2018-04/msg02336.h=
tml


> Juergen Gross (8):
>   xen: sync include/xen/interface/io/ring.h with Xen's newest version
>   xen/blkfront: read response from backend only once
>   xen/blkfront: don't take local copy of a request from the ring page
>   xen/blkfront: don't trust the backend response data blindly
>   xen/netfront: read response from backend only once
>   xen/netfront: don't read data from request on the ring page
>   xen/netfront: don't trust the backend response data blindly
>   xen/hvc: replace BUG_ON() with negative return value
>=20
>  drivers/block/xen-blkfront.c    | 118 +++++++++-----
>  drivers/net/xen-netfront.c      | 184 ++++++++++++++-------
>  drivers/tty/hvc/hvc_xen.c       |  15 +-
>  include/xen/interface/io/ring.h | 278 ++++++++++++++++++--------------
>  4 files changed, 369 insertions(+), 226 deletions(-)
>=20
> --=20
> 2.26.2
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bxyuzBoNLlcC9wan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCnjrUACgkQ24/THMrX
1yyaAgf/V30jyv6uv6+F7OW2zOfe72gfIS/EQrm6baOF7VkhumGU3/xVm5uGtf0c
MRInt992m2TocU3i807K9juNN42uowicJQMofvWIo0DmU+SFLO7skFDIy1doVZwf
V57we8V1xtULjiW9LFB5gtjyypfD9BnuP+UJczQ1GkvVW0tbrnt9yOnt/RkkbPTo
8Iv+fhPOv/nfH07j2IFmfKTVQXLgpIXEDQjRocpMU9aqx4QxXjLwrV8X5Kl/dDHU
YPTiLLy/lORMJ4YzapwnQSSrIt8ta/i5ZD8RzICPFDqDA9UoHwTXt8AbeBvM7wsm
ts5+9qugZ3Ea/gKhq2VN7t6OKAHw0Q==
=YEbr
-----END PGP SIGNATURE-----

--bxyuzBoNLlcC9wan--

