Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EAB3BC340
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 21:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150671.278561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Ud1-0001lK-W7; Mon, 05 Jul 2021 19:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150671.278561; Mon, 05 Jul 2021 19:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Ud1-0001j9-Sq; Mon, 05 Jul 2021 19:51:39 +0000
Received: by outflank-mailman (input) for mailman id 150671;
 Mon, 05 Jul 2021 19:51:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYQ2=L5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1m0Ud0-0001ix-Bx
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:51:38 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ce90abd-ea61-4516-ac18-d2476dffe446;
 Mon, 05 Jul 2021 19:51:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 90A2F5C00E5;
 Mon,  5 Jul 2021 15:51:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 05 Jul 2021 15:51:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jul 2021 15:51:35 -0400 (EDT)
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
X-Inumbo-ID: 9ce90abd-ea61-4516-ac18-d2476dffe446
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GcAJb1
	3oZBcAKhzUAGxOSPnGwgvzqoE1IRidewX0hco=; b=u8ir7vI0gZ28dMsA9I3elM
	gvJkKc7FYqqosmpLrgN1FmxXwwktdFo+4uPeMV7bVAoc8eRvV68Luz2XdR9kmAgu
	Kf4iUvC6PojzG9PtdBgoeGKJzKF7y3brqU39KKzsPz4phgDrKr9Cjc82zjK7VkOd
	VwsiA6R8zJNeEUhKqYa7OcDipYSZoHLpk0jtXIamOSQcw1tuaAIv/5NpB+Lv1f9f
	ROqYn9peZlZdnVTOf3/z0uEVoPAjZP37XEeK/gSQtPITC3E25EHGBdNtAD2cN71R
	7vvKFXU2DNasp+d8GJ5rmPAUtGFMT0emedQnyHayIv+ifUuthAa0vkDUpfanJ/Ug
	==
X-ME-Sender: <xms:yGLjYH1EdpONcsXm15NsGV5AsRMEepv7mnuZf0vbOBxxAcQMtkfo2A>
    <xme:yGLjYGGTFdzdxRw999MWoVEMfjKZUMTpjB5ClbuCS5Rnjb6LOVk29UsN5mOqpdq5L
    5Ay5LuZ5PUwZQ>
X-ME-Received: <xmr:yGLjYH4-ZQpnltj0VJOYlAe4A5MvjzMqDDHCX51xDOseXXf9s4ME_agyNBVGS_XOdTdggY69j8bY4XGYuHDM_wk5u-YSL-BR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgedgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteev
    ffeigffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:yGLjYM07TIi9JR6mc0xj-k40iHYq3Tu-jy4DlcYHrbtkWjUX2yTh-A>
    <xmx:yGLjYKFob6lP6uNFNTl5mUklApIe3xq6h2jo1kmy1VyFQpAGJKHRCQ>
    <xmx:yGLjYN_Ows-mB-Kbh92oBCUf70H5CwjXEjyhuQOkxJa4R9qGyGsN7w>
    <xmx:yWLjYGCRfBOc02Q0rWyQsafK3k72SHve6VCg4vgsqhvbLIanyXXNiQ>
Date: Mon, 5 Jul 2021 21:51:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/5] tools/python: fix Python3.4 TypeError in format
 string
Message-ID: <YONixKb69bK/PdMX@mail-itl>
References: <20210705191027.15107-1-andrew.cooper3@citrix.com>
 <20210705191027.15107-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Md0eUoqfxzWY0I/5"
Content-Disposition: inline
In-Reply-To: <20210705191027.15107-3-andrew.cooper3@citrix.com>


--Md0eUoqfxzWY0I/5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 5 Jul 2021 21:51:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/5] tools/python: fix Python3.4 TypeError in format
 string

On Mon, Jul 05, 2021 at 08:10:24PM +0100, Andrew Cooper wrote:
> From: Olaf Hering <olaf@aepfle.de>
>=20
> Using the first element of a tuple for a format specifier fails with
> python3.4 as included in SLE12:
>     b =3D b"string/%x" % (i, )
> TypeError: unsupported operand type(s) for %: 'bytes' and 'tuple'
>=20
> It happens to work with python 2.7 and 3.6.
> To support older Py3, format as strings and explicitly encode as ASCII.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  tools/python/scripts/convert-legacy-stream | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/sc=
ripts/convert-legacy-stream
> index 227e1b5c3fd3..7fe375a66810 100755
> --- a/tools/python/scripts/convert-legacy-stream
> +++ b/tools/python/scripts/convert-legacy-stream
> @@ -346,9 +346,9 @@ def read_libxl_toolstack(vm, data):
>          if bytearray(name)[-1] !=3D 0:
>              raise StreamError("physmap name not NUL terminated")
> =20
> -        root =3D b"physmap/%x" % (phys, )
> -        kv =3D [root + b"/start_addr", b"%x" % (start, ),
> -              root + b"/size",       b"%x" % (size, ),
> +        root =3D ("physmap/%x" % (phys, )).encode('ascii')
> +        kv =3D [root + b"/start_addr", ("%x" % (start, )).encode('ascii'=
),
> +              root + b"/size",       ("%x" % (size, )).encode('ascii'),
>                root + b"/name",       name[:-1]]
> =20
>          for key, val in zip(kv[0::2], kv[1::2]):
> --=20
> 2.11.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Md0eUoqfxzWY0I/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmDjYsUACgkQ24/THMrX
1yzVhwf9G8Boxg811OmgffjkUk7meSDmzPsGU6pL4l15jUZYyeFPQ4uuhtvmZAOz
MmoHUEnEKk1SNIFllEvcz5tHH0Bj5zRhoiD4mvwthiKh4QIWA50KpXm//k4tU/K3
4vn3wktPau9+r49q+73u7uCc1CVm4efEfHPhHPyRsI87657jF/8rH5GoB/Mc+1Kd
PCdjVfm0dlPcPPFuGa07Xfw7v+ZGWP8GIdFHwtF/iv8UTzwRJG+inVJiZ1x0SAwp
p3aZdvFPNH8yPz/BxZOrsH0E7qmPAYL+6C22RcxXmb5e/ldTTZoMHiVlogDoOoCb
FAcxECPDcLwptVM74sReJm8TTSNrmg==
=uWS4
-----END PGP SIGNATURE-----

--Md0eUoqfxzWY0I/5--

