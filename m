Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FD28E99C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 03:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7058.18487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSreW-0004ru-TO; Thu, 15 Oct 2020 01:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7058.18487; Thu, 15 Oct 2020 01:01:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSreW-0004pB-Q6; Thu, 15 Oct 2020 01:01:56 +0000
Received: by outflank-mailman (input) for mailman id 7058;
 Thu, 15 Oct 2020 01:01:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4/f=DW=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kSreV-0004CO-3T
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 01:01:55 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9241f8c4-067c-4d17-b3b5-6a5452a79212;
 Thu, 15 Oct 2020 01:01:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F0D65C025E;
 Wed, 14 Oct 2020 21:01:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 14 Oct 2020 21:01:54 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id C13313064680;
 Wed, 14 Oct 2020 21:01:52 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=G4/f=DW=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kSreV-0004CO-3T
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 01:01:55 +0000
X-Inumbo-ID: 9241f8c4-067c-4d17-b3b5-6a5452a79212
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9241f8c4-067c-4d17-b3b5-6a5452a79212;
	Thu, 15 Oct 2020 01:01:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 0F0D65C025E;
	Wed, 14 Oct 2020 21:01:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 14 Oct 2020 21:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=G0Pr9n
	ntlC0D3sjshW6GfCqIRmEwByZ7HF0jalDeOv0=; b=fxRqBEyE3bghPSDBRdggqh
	Hm7teyboKGQvCcWILupKJPYGqESFh8iw/dABMsiqP3hCWOKX9ynQApUeDLFwPb2l
	EQVxWpUfjULr8JJX2zXPDW2CY9pnftuwPCW+xxZzGiFmOMao1/MwygS5Q12IRERX
	awDl/dd4df4quXcxrTkQhR+5jN0KSUk6ZJ1iiTFveFiDTC4kphLCPmfrjZZUZLc8
	kQh7HANOj8GyX2YwkMI5qcnJxIj/+nLlaN+oCTTIqhsnGwKTXRX2uaeH5aBpaE1I
	HCOu7nJRN7VVke1XJWkctrALhcyzQyaXkzdirrsfYwJ02RIaDv2efs0mqD2jWdjA
	==
X-ME-Sender: <xms:gZ-HX6GjDS1o4FutSUJJq2Ybg02a0oui-MFUCrtRhcfNHn2xLNsawA>
    <xme:gZ-HX7VtMy5zvHgkut_7Q090rjbX0BXL-WLFGxspOZrGW8W6Z2iwRiZ3exMDRkI-e
    Ovmhbu3no9SmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedvgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:gZ-HX0KssvB_IR3yxMyKkcOmP1SSCgQHRCp1DApKjC6H7NfHWLn22A>
    <xmx:gZ-HX0EQklAIyhJCZd0eH7pM3gCwDruciI0G8LYjaNvEyCvTBbt2kQ>
    <xmx:gZ-HXwUW-x7l76Siw3BjU3XxdqMI2u2A0oF7MuenON1R1fklr0DCLw>
    <xmx:gp-HX5dP3AvOmoFCuzgMmRGhHCoBcU2UkXXxTb15J2V1ATu6FFVUQQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id C13313064680;
	Wed, 14 Oct 2020 21:01:52 -0400 (EDT)
Date: Thu, 15 Oct 2020 03:01:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [SECOND RESEND] [PATCH] tools/python: Pass linker to Python
 build process
Message-ID: <20201015010148.GQ151766@mail-itl>
References: <20201012011139.GA82449@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="THYEXwetZJOK3OLY"
Content-Disposition: inline
In-Reply-To: <20201012011139.GA82449@mattapan.m5p.com>


--THYEXwetZJOK3OLY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [SECOND RESEND] [PATCH] tools/python: Pass linker to Python
 build process

On Sun, Oct 11, 2020 at 06:11:39PM -0700, Elliott Mitchell wrote:
> Unexpectedly the environment variable which needs to be passed is
> $LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
> of the host `ld`.
>=20
> Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
> it can load at runtime, not executables.
>=20
> This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
> to $LDFLAGS which breaks many linkers.
>=20
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> This is now the *third* time this has been sent to the list.  Mark Pryor
> has tested and confirms Python cross-building is working.  There is one
> wart left which I'm unsure of the best approach for.
>=20
> Having looked around a bit, I believe this is a Python 2/3 compatibility
> issue.  "distutils" for Python 2 likely lacked a separate $LDSHARED or
> $LD variable, whereas Python 3 does have this.  Alas this is pointless
> due to the above (unless you can cause distutils.py to do the final link
> step separately).
> ---
>  tools/pygrub/Makefile | 9 +++++----
>  tools/python/Makefile | 9 +++++----
>  2 files changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> index 3063c4998f..37b2146214 100644
> --- a/tools/pygrub/Makefile
> +++ b/tools/pygrub/Makefile
> @@ -3,20 +3,21 @@ XEN_ROOT =3D $(CURDIR)/../..
>  include $(XEN_ROOT)/tools/Rules.mk
> =20
>  PY_CFLAGS =3D $(CFLAGS) $(PY_NOOPT_CFLAGS)
> -PY_LDFLAGS =3D $(LDFLAGS) $(APPEND_LDFLAGS)
> +PY_LDFLAGS =3D $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
>  INSTALL_LOG =3D build/installed_files.txt
> =20
>  .PHONY: all
>  all: build
>  .PHONY: build
>  build:
> -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON=
) setup.py build
> +	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY=
_LDFLAGS)" $(PYTHON) setup.py build
> =20
>  .PHONY: install
>  install: all
>  	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
> -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON=
) \
> -		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
> +		LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> +		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>  		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
>  	set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
>  	             "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
> diff --git a/tools/python/Makefile b/tools/python/Makefile
> index 8d22c03676..b675f5b4de 100644
> --- a/tools/python/Makefile
> +++ b/tools/python/Makefile
> @@ -5,19 +5,20 @@ include $(XEN_ROOT)/tools/Rules.mk
>  all: build
> =20
>  PY_CFLAGS =3D $(CFLAGS) $(PY_NOOPT_CFLAGS)
> -PY_LDFLAGS =3D $(LDFLAGS) $(APPEND_LDFLAGS)
> +PY_LDFLAGS =3D $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
>  INSTALL_LOG =3D build/installed_files.txt
> =20
>  .PHONY: build
>  build:
> -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build
> +	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY=
_LDFLAGS)" $(PYTHON) setup.py build
> =20
>  .PHONY: install
>  install:
>  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> =20
> -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON=
) \
> -		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
> +		LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> +		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>  		--root=3D"$(DESTDIR)" --force
> =20
>  	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXE=
C_BIN)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--THYEXwetZJOK3OLY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+Hn30ACgkQ24/THMrX
1yxhaQf/awop0fQWRMmFPdIBwi05jVpCYh875R2Mwx9MLy1KTRyVBp0fRU5wwsTh
MpYvnvGgudQQ5TPk1zyUnmStqojuKSeoviaCNHSu+5bUqd/dh3X9UI/MKtM5wrvA
gyDprYFa3Mg7FSQga8P5YOgGBN01HxUk8X5lWB9D6wvesWh7W4tlndXdWlX+RBzk
Jumrjaak2J/vhp9SbHnitDkHI73DtrxXzl0+LDcWja9xKc7pqddywG6OTImHYSZJ
fvHKe+5784/u8YNXD6+MUqFWRzJzdcYUFhufyev8qKY3kYKQZRx/YdbWJWSWm1jj
Ep5GfE6vn4nhBQ0eHE8jG4a+iJNFgA==
=YZgd
-----END PGP SIGNATURE-----

--THYEXwetZJOK3OLY--

