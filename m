Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63313D79D3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 17:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161242.296074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8P1U-00055Q-LX; Tue, 27 Jul 2021 15:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161242.296074; Tue, 27 Jul 2021 15:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8P1U-00053c-IT; Tue, 27 Jul 2021 15:29:36 +0000
Received: by outflank-mailman (input) for mailman id 161242;
 Tue, 27 Jul 2021 15:29:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1m8P1T-00053W-Jt
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 15:29:35 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 706f7ade-eeef-11eb-970d-12813bfff9fa;
 Tue, 27 Jul 2021 15:29:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E34F5C01A0;
 Tue, 27 Jul 2021 11:29:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 27 Jul 2021 11:29:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jul 2021 11:29:30 -0400 (EDT)
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
X-Inumbo-ID: 706f7ade-eeef-11eb-970d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N4gzOZ
	bo8wFoTf8pRZoe2SsD9NWuOiXRnS4UcOVoslU=; b=tYbc3G9IqLJ8lBo6rVx0DE
	mFaaJEChw/vtu2IoiROElLA6Zpr1IKAhNbp1yq2ZiBf2dq/XszZe/RcOXa+x6KWF
	RczKwqmZEKXwtvtf/JifJ65vqfn7ShpmeTSu2nP0ELawN/urPQY9Kt54f9cp0prP
	offQflbFGBVymTHhJER0da4NayofOpTO9ujuILyBN0smDZ/rl2pjS5sEmQN7J84Y
	kjsZ2NW2ERfuSboLo62QTXekrRYZPjhlcBuLwz/yid3xcuhvO7xmv2D5axKn4jEA
	gxx+sKzcBvZ237tZ8pzzmVn1bv35pH9o/xdxpXyfofhkeFyVZH/QKeJwqQdHPtkA
	==
X-ME-Sender: <xms:WiYAYd7SdNx6Al-F7LZD1-iZXUSoiPHF__MzCAY7_y9C7uz7u0gyTQ>
    <xme:WiYAYa5YzwNPAbr6bx9_rC1lTC4uCOCCUxzahlEE4VJpV57jpcm24h4RU3zK7lvPw
    weIz76ATPzZLg>
X-ME-Received: <xmr:WiYAYUduvYQioxtZXqwOf7gx5aNzS50aZbeOfSdVlgeIAsD95nUXy781OCBvkRom9ajop-4E3pEymEQourxAZhbWvRbPhLUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeejgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:WiYAYWIqEzYVTiYiUPnfKmR3b1VIbH_cC-0v8gyql6SRNo4PiKlNhA>
    <xmx:WiYAYRLc2IhCzHwOWrpV16SX7D6AQyQ1KSIPF4fqSg7tb6aXR4D9dA>
    <xmx:WiYAYfx7jBcaJsMjXeOKLtuOCQDVQWm7mGuD3bA2uC0uuHZzVIpD0Q>
    <xmx:WyYAYTxtefVKK0oDdjfJRiHKkHjZ0Y8fM9NJmoqDiA-cEDFst5Ajpw>
Date: Tue, 27 Jul 2021 17:29:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] autoconf: fix handling absolute $PYTHON path
Message-ID: <YQAmVs+hOSr22M69@mail-itl>
References: <20210602033206.720860-1-marmarek@invisiblethingslab.com>
 <24832.4209.469293.942341@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XjXH3CRnpRDmd6tX"
Content-Disposition: inline
In-Reply-To: <24832.4209.469293.942341@mariner.uk.xensource.com>


--XjXH3CRnpRDmd6tX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Jul 2021 17:29:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] autoconf: fix handling absolute $PYTHON path

On Tue, Jul 27, 2021 at 02:56:01PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[PATCH] autoconf: fix handling a=
bsolute $PYTHON path"):
> > Don't strip full path from $PYTHON variable. This is especially
> > relevant, if it points outside of $PATH. This is the case
> > for RPM build on CentOS 8 (%{python3} macro points at
> > /usr/libexec/platform-python).
> >=20
> > For this reason, adjust also python-config handling - AC_PATH_PROG
> > doesn't work on already absolute path, so make it conditional.
>=20
> Sorry for the delay replying and thanks for trying to improve this
> area.
>=20
> > -AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
> > +AS_IF([echo "$PYTHON" | grep -q "^/"], [
> > +    pyconfig=3D"$PYTHON-config"
> > +], [
> > +    AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
> > +])
>=20
> I'm not sure this logic is right.  I haven't looked at this area in
> detail but it seems confusing to me.  I don't quite understand why the
> preexisting code calls AC_CHECK_PROG followed by AC_PATH_PROG.

I think it tires to get absolute path into $PYTHON, also in case it was
autodetected (the AC_CHECK_PROGS call). Which I think it another place
that is too magic (see below). I'll try to simplify it further.

> I also don't understand why we ever need an absolute path for
> $PYTHON-config.  Why don't we just rely on PATH lookups when in invoke
> it ?

This is a good question. I tried to preserve AC_PATH_PROG to keep
existence check there, but that's rather misused.

> > --- a/tools/configure.ac
> > +++ b/tools/configure.ac
> > @@ -368,7 +368,6 @@ AS_IF([test -z "$PYTHON"], [AC_CHECK_PROGS([PYTHON]=
, [python3 python python2], e
> >  AS_IF([test "$PYTHON" =3D "err"], [AC_MSG_ERROR([No python interpreter=
 found])])
> >  AS_IF([echo "$PYTHON" | grep -q "^/"], [], [AC_PATH_PROG([PYTHON], [$P=
YTHON])])
> >  PYTHONPATH=3D$PYTHON
> > -PYTHON=3D`basename $PYTHONPATH`
>=20
> I'm not sure this is right.  I think we sometimes try to look at
> PTYHON to see if we should be doing python-3-like things or
> python-2-like things, and maybe that logic depends on PYTHON just
> being the basename.

If that's the case, those should be fixed too. PYTHON variable can
accept way more possibilities than just "python" and "python3". And
furthermore "python", depending on distribution, may point at python2 or
python3.
That said, few test builds work with this change, so it's unlikely
something important relies on PYTHON being just the basename.

BTW, are patches sent to xen-devel automatically built on gitlab-ci now?
How can I find such test build results?

> Contrary to what I said about leaving $PYTHON-config unresolved and
> expecting it to be looked up at the time of use, maybe the right fix
> is simply to change python_devel.m4 to use $PYTHONPATH-config instead.

Actually, the only place that needs full path to python, is filling
shebang. Everything else can rely on $PATH and use whatever is given in
$PYTHON (either absolute or just the basename). Especially, there is no
place that needs absolute python-config path, if $PYTHON points just at
the base name.

> Also using echo | grep -q ^/ seems poor style when case is available.
> I think we can rely on case.  But I see that's in the old code
> already.

Yes, I've copied it from there. autoconf macros are not my strong
side...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XjXH3CRnpRDmd6tX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEAJlYACgkQ24/THMrX
1yz3Xgf/ftUWzJE9Pd+IsuNYwNryXepClK3QJRj0KQ7NZ6JZCEJcuRrZx3NBZ3Gj
/pslavS3SQxnf8HgjOCweZDsqCx/7r1kqRO+X2XLJ+pb4sD5mco4OZvb5SFpKud1
h8o07Wk0TjA0Ly1GEU/CAR5fMyhW8i/nt283Pq+8ZkesLS9aEE4Op7nHiI3d4Nfs
SYFcR+UBAf2c9U2b4Z3wzRfo0Mlp2dZKZg08te77re7tcmgbX4Ya10oTMzt20LKd
ON46twIG1SV1z889XTMGdsAIdso20lAiQqe3LXGMUG7BIzCpeDjQFHXoWmq50nhp
21RM/ePfsf39CmfnX1D/ERQCxteOpw==
=n/u6
-----END PGP SIGNATURE-----

--XjXH3CRnpRDmd6tX--

