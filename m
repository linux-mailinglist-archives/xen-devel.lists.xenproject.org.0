Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C220714CAF7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:46:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmgz-0002cS-DE; Wed, 29 Jan 2020 12:43:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W0R6=3S=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iwmgx-0002cL-T6
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:43:36 +0000
X-Inumbo-ID: f6f5a604-4294-11ea-8396-bc764e2007e4
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6f5a604-4294-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 12:43:35 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4AAC021F8E;
 Wed, 29 Jan 2020 07:43:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 29 Jan 2020 07:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3kBeIO
 S8sQSiV109aMty5bC36GicmEgW0LcjhyOBdMg=; b=jJvgoNr5drbQ7UJkLALSD3
 yeb88gl6yVLMU7dQXKyKvzDXNrD0joEORANgSoTO/6yDVp47mdBkK/0dku+Vwq/E
 RWbMf/H2UWcH+9OQ6sVE4IIuvXWXc3Ws0UY4Yd5ITCcsjPbsBHGUuBzox1pNOMcp
 pQ5n4iPEPfvTzv/RxKBvhR4DJVHEukWyIVWpTWMAXlg2/2VLgFEGx+gxw4AX0/Dc
 VlvOvEkGqi90q/jSKF5YBIUDnNz1C39wIMX9yOjeLhPPoHjFCYN8lQUUnGl1rzFF
 T6bqqMrW5bryiKae1gRGxxjf+OowxhiMWzTehO3XS+2uLCF8+TZGwMuy4pXg8TUw
 ==
X-ME-Sender: <xms:9n0xXiTvQTKXvO-fAkNuHHgjf6BG9tj3hV5JL4p0HBGzlXM-xQxZHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
 ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
 enucfkphepledurdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
 hgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:930xXjwo1TB97PTey_bJrLLcSCgyKqPZAxrOL6SGR2W51lnIhcMdAg>
 <xmx:930xXiBa--4Gkq57U_UEsjUOgn7bkeYCg7kDkYNNfK6LIvUMLrvr0A>
 <xmx:930xXvH_MZwHm7Q9kyqqxOZ8eKrrpHqO3t26niErMnQqJQTMTl7A4A>
 <xmx:930xXpWFNYzQaLkZv_jEAr41rYmsjQLMO326tT-FHkkj77pWGqzv9Q>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 289C43060BE4;
 Wed, 29 Jan 2020 07:43:34 -0500 (EST)
Date: Wed, 29 Jan 2020 13:43:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org, pdurrant@amazon.com
Message-ID: <20200129124330.GG15453@mail-itl>
References: <20200129123618.1202-1-pdurrant@amazon.com>
MIME-Version: 1.0
In-Reply-To: <20200129123618.1202-1-pdurrant@amazon.com>
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, luwei.kang@intel.com,
 dwmw@amazon.com
Content-Type: multipart/mixed; boundary="===============7573729113744913529=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7573729113744913529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JbKQpFqZXJ2T76Sg"
Content-Disposition: inline


--JbKQpFqZXJ2T76Sg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [ANNOUNCE] Xen 4.14 Development Update

On Wed, Jan 29, 2020 at 12:36:18PM +0000, Paul Durrant wrote:
> *  Linux stub domains (RFC v2)
>   -  Marek Marczykowski-G=C3=B3recki

There is v4 series already.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--JbKQpFqZXJ2T76Sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4xffMACgkQ24/THMrX
1yzjWwf+MqAhLO++F8pw8kxRVTnQjmROAlug3FOUCVjcIJvJQ9BASscUAWmpV39l
ylguh2DvUk2NuqczPbDq5Go3blRWkWN5XjgJ9agve/4qdu7XMpF+BY0ymHfmUXGi
lxrUlDhuDbF16LlCmpSikCrgytZWGp/A81/+SgXmPJQ2TKeTPQRgwg/FvdJmrB9n
dtuLftl6drMNY/XTS8ML9qv/DyxMiP6wqWXtXgpmjvHl04e97YEP+s2ufjkySWVx
vKtnKRunR5kz35WBImJ3RessrzSxD50q+Tir2IAvf9/qvHWT5iMfn6RJ1NF3iI6s
ffFeZNDN6o3JWPs7SUb77gNSApG1SQ==
=pc76
-----END PGP SIGNATURE-----

--JbKQpFqZXJ2T76Sg--


--===============7573729113744913529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7573729113744913529==--

