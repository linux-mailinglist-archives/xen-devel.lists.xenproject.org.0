Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BF3BC33F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 21:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150666.278551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0UbQ-0000TK-KX; Mon, 05 Jul 2021 19:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150666.278551; Mon, 05 Jul 2021 19:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0UbQ-0000Qw-HA; Mon, 05 Jul 2021 19:50:00 +0000
Received: by outflank-mailman (input) for mailman id 150666;
 Mon, 05 Jul 2021 19:49:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYQ2=L5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1m0UbP-0000Qq-E4
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:49:59 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e61e831b-fc03-4178-b258-a45428858db9;
 Mon, 05 Jul 2021 19:49:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 597665C00F0;
 Mon,  5 Jul 2021 15:49:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Jul 2021 15:49:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jul 2021 15:49:56 -0400 (EDT)
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
X-Inumbo-ID: e61e831b-fc03-4178-b258-a45428858db9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=G7DY70
	Grx+0a8Dm8h5ZrFNCmadOBGwqFg2YnRI1MFUw=; b=ao4EuSMK7v8/ssNxhSzg/w
	wSePPC5SC+vLWDnrKYk8oKHVEhSumR9AQCat4wxtM+bpXYl6EshsRYjlk6IEuOth
	VpTkxFSROEdwY9Kc4pryBzz00J0Pz1OYBTgBFiXzjTAwFAsSW7ITMrZm+5RUT4Nt
	atWzbqftTnyki6LHnpkisKEGATGB7B8F4M3iSUZ/+w/19bIL9AO29mu7SQ725XVv
	grjgRlUjDNZo0iNy4Haz91HQOMjUWL+aQ8N3OoLdFYZ6EcC4IJrg68ZhA+qh1UAR
	e7O7Q6wSunlEQbM/cNZJURziIIEefQD3ZmdBAXX/fMjgOsgAzG9a7rqsb6epdSJw
	==
X-ME-Sender: <xms:ZWLjYIwLoq_Rsvg-lEeyJj0-UfKgoFNu0aRm5oVbnmXVJyqLi4-AwQ>
    <xme:ZWLjYMTOZLPO1HF5eyDVsDHVp9QXgWoKcp7k8GlHPfHVvX7zQT7jgKndnMLq-mAaI
    TkK8uSZXiewlw>
X-ME-Received: <xmr:ZWLjYKV5wH-vSkZ7qR5IwRydJbsqgsvcEbOWccsWXytS28Ir5Ff9CO_TgW45VW1nxYjbEIKHl2OzvSK-ziJhCavzlbsd8xfy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgedgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteev
    ffeigffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ZWLjYGh1PdEAhi5XS1RkEPSYu_rnLMHBczRA1sdwvCC_7Ez2Zg-inQ>
    <xmx:ZWLjYKAxyva1GZHiznK3LEXzwxkQB56Y_N-3wxK5vHwpvTgmsja1Qg>
    <xmx:ZWLjYHJ9E70s-VxvMfdcrkwLaM3lRYQYtrefPBup-AxdlWlDrt-jlA>
    <xmx:ZmLjYFNfj08aXOs9LBbNepnX-EzvmPnuG8U4BxmjBjrGc3Ahi9I3qA>
Date: Mon, 5 Jul 2021 21:49:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/5] tools/python: handle libxl__physmap_info.name
 properly in convert-legacy-stream
Message-ID: <YONiYGQAaj9oSHnt@mail-itl>
References: <20210705191027.15107-1-andrew.cooper3@citrix.com>
 <20210705191027.15107-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fsnkhmf9WWev5GLc"
Content-Disposition: inline
In-Reply-To: <20210705191027.15107-2-andrew.cooper3@citrix.com>


--fsnkhmf9WWev5GLc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 5 Jul 2021 21:49:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/5] tools/python: handle libxl__physmap_info.name
 properly in convert-legacy-stream

On Mon, Jul 05, 2021 at 08:10:23PM +0100, Andrew Cooper wrote:
> From: Olaf Hering <olaf@aepfle.de>
>=20
> The trailing member name[] in libxl__physmap_info is written as a
> cstring into the stream. The current code does a sanity check if the
> last byte is zero. This attempt fails with python3 because name[-1]
> returns a type int. As a result the comparison with byte(\00) fails:
>=20
>   File "/usr/lib/xen/bin/convert-legacy-stream", line 347, in read_libxl_=
toolstack
>     raise StreamError("physmap name not NUL terminated")
>   StreamError: physmap name not NUL terminated
>=20
> To handle both python variants, cast to bytearray().
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  tools/python/scripts/convert-legacy-stream | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/sc=
ripts/convert-legacy-stream
> index 66ee3d2f5d29..227e1b5c3fd3 100755
> --- a/tools/python/scripts/convert-legacy-stream
> +++ b/tools/python/scripts/convert-legacy-stream
> @@ -343,7 +343,7 @@ def read_libxl_toolstack(vm, data):
>          if twidth =3D=3D 64:
>              name =3D name[:-4]
> =20
> -        if name[-1] !=3D b'\x00':
> +        if bytearray(name)[-1] !=3D 0:
>              raise StreamError("physmap name not NUL terminated")
> =20
>          root =3D b"physmap/%x" % (phys, )
> --=20
> 2.11.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fsnkhmf9WWev5GLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmDjYmAACgkQ24/THMrX
1yyYqAf/QTmKsert72icwDsQSxGNQMOTfTSY4078x9/EW21JzXXKvf+UCfeTeanM
1kqvhM63SatAutj1zGxhXLaMUgVnnPKCUY4ujncsIRwIyhTuUO9/7rCC+cuavS/y
daXg+REYhovvxXFHzAocscyh8OmseHHUnIKJggV64J17b8Zn0Quq/UvZ/R9E/jRj
fmi2k1uqt/IFVIgvYjJQycX6V8g8ybDFBe7tN1gf7OC/sWd/tCcWuUhJqaJ083sr
1N/XD1HJ8mLPntP7DYq5JQf7tMPt8rkR5w86P7xHYLuHQybHsERyuzuwbO6/Wvhg
JLENqN9o3l+sC08skJuCdZzC9j2JdA==
=ORhh
-----END PGP SIGNATURE-----

--fsnkhmf9WWev5GLc--

