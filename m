Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4312D44FC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 16:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48384.85551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0yE-0003ko-1U; Wed, 09 Dec 2020 15:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48384.85551; Wed, 09 Dec 2020 15:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0yD-0003jx-Uc; Wed, 09 Dec 2020 15:01:33 +0000
Received: by outflank-mailman (input) for mailman id 48384;
 Wed, 09 Dec 2020 15:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mlr=FN=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kn0yC-0003jr-FK
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 15:01:32 +0000
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a802157-34fe-463e-9be6-18d48d0d6f00;
 Wed, 09 Dec 2020 15:01:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D83E5AFB;
 Wed,  9 Dec 2020 10:01:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 09 Dec 2020 10:01:29 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 11C831080063;
 Wed,  9 Dec 2020 10:01:25 -0500 (EST)
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
X-Inumbo-ID: 2a802157-34fe-463e-9be6-18d48d0d6f00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Jc/F6i
	K7o3PUb9Iz+/A5vMzJfnPabacuo83uCpBn6y0=; b=EWQksCubZPK5tzGqR9z1aB
	19JQFgBR7bbwgcoSiNDOk4+LXxOLkZq0zL9awtR8Zcxe/WgdxQeLtJ/DI437/tmW
	yFudNwDoOGZeWXM6qPLGvFyGaRdW/kXls1VCDUzJHTsYGVZEvKB/zUXvTyVX3kMW
	Qa0F5r3MYUdqsjE4XVoLCncx4ODHF6SpTrlMio9AEieVvF0vQYRkPcTEG3npa0Pk
	0FneNkf4CF1QPQ/y3vGKVcV3a4iaCSLoultj9dKLvtdBb9rpmvxN/scqFJFZEEgo
	1j1t4SKCzmL3VqRNEY38bjiB7mMS4qvsQkfrnCF0w+ToGcAARTJMzq1ro4a4rIMg
	==
X-ME-Sender: <xms:xubQX3DlpGN_uwJpsJon-ywhUfffnAPOtSgIkpWC8P6GNiqrMQwS9Q>
    <xme:xubQX9hsjn6KQ73-_JoO89htyFfpp-yWuCow3VtNoD9jRwdaeCJzRyxFTGLb8-SU3
    6LUNJjDDob3wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:xubQXynA7nbRAsarVjEJgTrMGdAPmrnjNsJEw8SkbajH0aC0Q1n_sA>
    <xmx:xubQX5wT_BwoY_5DC_7bwpru8kKmrKm_YQYC7CzcDywxh_mnYsi7IQ>
    <xmx:xubQX8RFBmmHTUlswgWNOHgv91iiXOYBCcdAzRIheWZ7IpgmBhAMZg>
    <xmx:yObQX15ZWgPYMiTQIR3ySsPaF8G9vWP-7AJ9qKspxJ7BTM7FIPV6Qg>
Date: Wed, 9 Dec 2020 16:01:21 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libxl: cleanup remaining backend xs dirs after driver
 domain
Message-ID: <20201209150121.GM1244@mail-itl>
References: <20201108145942.3089012-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+nG9yj4eE4W6Oba0"
Content-Disposition: inline
In-Reply-To: <20201108145942.3089012-1-marmarek@invisiblethingslab.com>


--+nG9yj4eE4W6Oba0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] libxl: cleanup remaining backend xs dirs after driver
 domain

On Sun, Nov 08, 2020 at 03:59:42PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> When device is removed, backend domain (which may be a driver domain) is
> responsible for removing backend entries from xenstore. But in case of
> driver domain, it has no access to remove all of them - specifically the
> directory named after frontend-id remains. This may accumulate enough to
> exceed xenstore quote of the driver domain, breaking further devices.
>=20
> Fix this by calling libxl__xs_path_cleanup() on the backend path from
> libxl__device_destroy() in the toolstack domain too. Note
> libxl__device_destroy() is called when the driver domain already removed
> what it can (see device_destroy_be_watch_cb()->device_hotplug_done()).
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Ping?

> ---
>  tools/libs/light/libxl_device.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_dev=
ice.c
> index e081faf9a94e..f131a6c822c6 100644
> --- a/tools/libs/light/libxl_device.c
> +++ b/tools/libs/light/libxl_device.c
> @@ -763,6 +763,12 @@ int libxl__device_destroy(libxl__gc *gc, libxl__devi=
ce *dev)
>               * from the backend path.
>               */
>              libxl__xs_path_cleanup(gc, t, be_path);
> +        } else if (domid =3D=3D LIBXL_TOOLSTACK_DOMID && !libxl_only) {
> +            /*
> +             * Then, toolstack domain is in charge of removing the parent
> +             * directory if empty already.
> +             */
> +            libxl__xs_path_cleanup(gc, t, be_path);
>          }
> =20
>          rc =3D libxl__xs_transaction_commit(gc, &t);

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+nG9yj4eE4W6Oba0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl/Q5sEACgkQ24/THMrX
1yxqPAgAgDxlOEfg0KtsT1B3Kyx/oFwD3mJAGzzu8Bz3HJrOXVGW4HnVtnY1ivMk
bA1m3Eb6omGTEVym61QntXx36ZJgcI9fk/xOxfbvzP5UkANI3f7gHxWGhoJ0ADEo
i3OZn7/Qhu540kmFn6sW2U4lqNHozota8iRfsDy2LJKtsUyfL2YpsCdkEN9EBOxf
yy8vo5AVcWQuFKofqheJLzTrugttOlH8dQaXXOeBjN0j5uaY4AxJnfPzE9+2rK9C
Ssyy2XdRYQbmIdykcSFtPdv0GN05Fk8RamvJhkFOiJK2VFTlN7OKtRkcKJiTM6u7
grzMP/aE1c9rY5U5fXgu8T2c+nTAcw==
=dy9n
-----END PGP SIGNATURE-----

--+nG9yj4eE4W6Oba0--

