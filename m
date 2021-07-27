Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD9F3D7532
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 14:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161160.295914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8MNW-00016o-UJ; Tue, 27 Jul 2021 12:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161160.295914; Tue, 27 Jul 2021 12:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8MNW-00014q-Qq; Tue, 27 Jul 2021 12:40:10 +0000
Received: by outflank-mailman (input) for mailman id 161160;
 Tue, 27 Jul 2021 12:40:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1m8MNU-00014k-PU
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 12:40:08 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5b0a653-eed7-11eb-96eb-12813bfff9fa;
 Tue, 27 Jul 2021 12:40:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 640175C00C2;
 Tue, 27 Jul 2021 08:40:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 27 Jul 2021 08:40:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jul 2021 08:40:05 -0400 (EDT)
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
X-Inumbo-ID: c5b0a653-eed7-11eb-96eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GeHdCL
	Kd6U7IHr2/i8PQ97U5z5Gb/Y+p+ZiJBa9jqvU=; b=vVQZD33mbQWq2Tu7DSBcLi
	9y8kPlU5X+Je5I/UFy0RmEJV+Ns0I01ClBgiUxXcKFOXpjkWwoAl2bl3qpOkKfX8
	Km7Xxg+vz1UNfG4mKRFOHpLs9dzxp/nOTRz8wsQJ7BOgcCumtXHPyNTZ+GbbXoLG
	7z0/yDLL7pz2sANfi6rT86zBrD21w/BllvIqGJCN5iy9h7/kRxoIdS4zXdMMtnfe
	Mt/aA1wX111QOVOSlpT7tRXp0KambRfyJWS5QHFJUUfpFPcDOWSdt/qKD543WmAE
	NckAvMWf6nT75xmkXaXxiPDpLL3+ZT4habAsBrBblC1IrHtYhb8SHisXjEl6zZEg
	==
X-ME-Sender: <xms:pv7_YKKNorSZ00MALD-H0cBVs01PChgOk6lnkKlHtMQROf7G3yRP6Q>
    <xme:pv7_YCL2w0ljhY6XCFtX3DAYFL4VeeXqBQxOPKvfYg-YPBVhHdGNwnmIdak9zqDqe
    nsFTSaf-zfJtw>
X-ME-Received: <xmr:pv7_YKuwStKC8LHavsxGtRmgwo4cE0lhoXdHVTQ_XA9FR1Y2kaHhh4GrsO8XrY6Gr8CqXR4gPpvhIRJjDnYp1F3E-h35eqFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeejgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:pv7_YPZGDhHHGI3w8iMc-ew3uai02pV6Ns-2TkLraPCDB8nhkEVhPA>
    <xmx:pv7_YBb_4BHLUw6Z14oQYIk1CAr14Pcx6mHndML-KR9W6jkofK0Lag>
    <xmx:pv7_YLD8KH91ft6wfR1lovEGLoyvk6lYomz7xyTvwbh8h7e_TXjlDw>
    <xmx:pv7_YCAYX2VEfCilB7_4ozLiFA48CxKiZe9jXVm9kcB5XoWYT8eIIA>
Date: Tue, 27 Jul 2021 14:40:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] autoconf: fix handling absolute $PYTHON path
Message-ID: <YP/+oXbFMkUzyHZ2@mail-itl>
References: <20210602033206.720860-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xX8hYgWXFLEHe9VQ"
Content-Disposition: inline
In-Reply-To: <20210602033206.720860-1-marmarek@invisiblethingslab.com>


--xX8hYgWXFLEHe9VQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Jul 2021 14:40:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] autoconf: fix handling absolute $PYTHON path

On Wed, Jun 02, 2021 at 05:32:06AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Don't strip full path from $PYTHON variable. This is especially
> relevant, if it points outside of $PATH. This is the case
> for RPM build on CentOS 8 (%{python3} macro points at
> /usr/libexec/platform-python).
>=20
> For this reason, adjust also python-config handling - AC_PATH_PROG
> doesn't work on already absolute path, so make it conditional.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Ping?

> ---
>  m4/python_devel.m4 | 6 +++++-
>  tools/configure.ac | 1 -
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/m4/python_devel.m4 b/m4/python_devel.m4
> index bbf1e0354b2b..676489b8e978 100644
> --- a/m4/python_devel.m4
> +++ b/m4/python_devel.m4
> @@ -2,7 +2,11 @@ AC_DEFUN([AX_CHECK_PYTHON_DEVEL], [
>  ac_previous_cppflags=3D$CPPFLAGS
>  ac_previous_ldflags=3D$LDFLAGS
>  ac_previous_libs=3D$LIBS
> -AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
> +AS_IF([echo "$PYTHON" | grep -q "^/"], [
> +    pyconfig=3D"$PYTHON-config"
> +], [
> +    AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
> +])
>  AS_IF([test x"$pyconfig" =3D x"no"], [
>      dnl For those that don't have python-config
>      CPPFLAGS=3D"$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 6414fcbb445e..ebf1265643b3 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -368,7 +368,6 @@ AS_IF([test -z "$PYTHON"], [AC_CHECK_PROGS([PYTHON], =
[python3 python python2], e
>  AS_IF([test "$PYTHON" =3D "err"], [AC_MSG_ERROR([No python interpreter f=
ound])])
>  AS_IF([echo "$PYTHON" | grep -q "^/"], [], [AC_PATH_PROG([PYTHON], [$PYT=
HON])])
>  PYTHONPATH=3D$PYTHON
> -PYTHON=3D`basename $PYTHONPATH`
> =20
>  AX_PATH_PROG_OR_FAIL([PYTHONPATH], [$PYTHON])
>  AX_CHECK_PYTHON_VERSION([2], [6])
> --=20
> 2.26.3
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xX8hYgWXFLEHe9VQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmD//qIACgkQ24/THMrX
1ywpMgf/WxBNeUiYw0/b/d5/thLz8fojQDG3Z0YhpUHo83M2g66LyDmivXwWvgwK
trxsiZhUoMsvD/rCClXlYNhd/5p/bvR0JPEh1Bb6h9XmlJdfQtKc2CBX+ThsWKUd
qPzaMtkCuU606I5ZXSU77oVsObuuPdACE/sbsFYK+qBOo5lUS4GLP6nPJsySWN0d
Bbf/g3Oduu5+Heip5Sw9vYrg32A216T/G/vK0zDEpIR3cgi53tpQkxnJrcUaKZ+0
LHY6T+6YFCQzdg2hAPvhY7dELKnQGX8GrBzSxIkZtKpW/wVKCtSIJzx9+ZX9/8hb
uxZUZLz/c1XF8iZBfQSOTTwGdsHblA==
=Xqs9
-----END PGP SIGNATURE-----

--xX8hYgWXFLEHe9VQ--

