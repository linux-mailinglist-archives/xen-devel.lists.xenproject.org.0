Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB9313BA2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 18:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83005.153661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Ak8-0005dv-8q; Mon, 08 Feb 2021 17:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83005.153661; Mon, 08 Feb 2021 17:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Ak8-0005dY-50; Mon, 08 Feb 2021 17:54:36 +0000
Received: by outflank-mailman (input) for mailman id 83005;
 Mon, 08 Feb 2021 17:54:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pnXs=HK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9Ak6-0005dR-OY
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:54:34 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b8f5b53-62bb-442d-bbd2-92689106d9ba;
 Mon, 08 Feb 2021 17:54:33 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 005e38x18HsU5Wx
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Feb 2021 18:54:30 +0100 (CET)
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
X-Inumbo-ID: 1b8f5b53-62bb-442d-bbd2-92689106d9ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612806873;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=zSF1VrDFjjcc7/koq7ymPiGui/6k9P9w6E9VMq44wfM=;
	b=YJl8DQ3EGFMrfwwU6QSHPdW/HDbk56UXxbt/UO7fY3oZ4L230zmFUc+y43CUxnitQ+
	ptAMeR4ocYKpnToAyAh2aOiKazkA5IiImIGPUrtk+Ziinhys78kychkazN0y2zLt2iAK
	gGze4hqVYNb6XZTt7I/MLY4FIPMDB+GTkOgCNAmXgOk0Dh6FvvmxVpFveWr4yhFr6SpG
	/vatai07y7J29zNxbB6VFN4Cp+JqRziGi4eNsq13UT5Y7wHavuj7DjytZhxLCseg4TOr
	5HiLPmFt+8ENDmCGw+9lu/bi1MjtnmTR/SqIm7xtfeHIf7SbwqRarHDa9xtl5gin3lgQ
	wLnQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Mon, 8 Feb 2021 18:54:13 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210111 05/39] tools: add with-xen-scriptdir configure
 option
Message-ID: <20210208185413.51acc99b.olaf@aepfle.de>
In-Reply-To: <24609.31087.818313.780529@mariner.uk.xensource.com>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-6-olaf@aepfle.de>
	<24609.24785.791060.128298@mariner.uk.xensource.com>
	<20210208182311.53dac1a3.olaf@aepfle.de>
	<24609.31087.818313.780529@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mt4jlHxIO8tJEBwOoQxy5oi"; protocol="application/pgp-signature"

--Sig_/mt4jlHxIO8tJEBwOoQxy5oi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 8 Feb 2021 17:48:31 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> > It seems the assignments for CONFIG_DIR and XEN_CONFIG_DIR can be moved=
 up, because $sysconfdir is expected to be set already. As a result the new=
 AC_ARG_WITH=3D can continue to use "$XEN_CONFIG_DIR/scripts" for the defau=
lt case. =20
>=20
> That would be best I think.

I will split this into individual changes and send a separate series.


Olaf

--Sig_/mt4jlHxIO8tJEBwOoQxy5oi
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAhesUACgkQ86SN7mm1
DoB8ihAAlh8D0Q0aePy2ionL6S/Rmggi7ATrEdlkw4FCrz4BtjVQlR26S3twLknN
KqanqAl9dvdZI3gIelJ9ZYT0DWxtvIJo9AnBnrI6hgHEN+sqeiZipGL7EClwv4Kd
xdl27R/RUgBNxjfTXwG84uV5o/AuoMGJaCyY/S7/Hqq30qLel56dXrWOMonJpJuO
sh0dnBnfYjPtHilzIG2uNrzAfi+BoX9Qu1oN66hoc9s4Kd7SAemj/gLJ+k0OtfS1
0eM2JQExa4BmlKbpUrVx7HQmc0uIsT2tBJHivTlV5bYk/GCEUMx+qSQzLTXEkG+6
wz9/Uhcqz0pgydVkoGCEq9HpDz7BbrtfRKB9LU0EWA5zy8KynE3WFNVHBSPZUGTz
CVU8GjwphO+4Nvv5qEPrTxECA+n7EC7TC/eDPDjkA21g8zneZHpKQ/jyeAKeB2dH
xjC3ld1JoYpoKUQrBWbe/LZS1o6zeF/lcxaYCDVLO8XhZrGLPXs9E+2WaUwQG0ez
/rlDMXiwMEgsc7eQlcdieSLYRi7WidL6xrfIIYr3ixuS9E0/rzHxnnQuVgYW7GWW
LGjgvpuZlagotjcvwG32vrmF5b/qyw9dNpAvQrqbp6W7MsIV2BWf7gMWgbVDXz36
gigw9qrGLq+7AFwN79FcqyMVaUtn+62zFtj+ehRVfskLcN46Gsc=
=HJJA
-----END PGP SIGNATURE-----

--Sig_/mt4jlHxIO8tJEBwOoQxy5oi--

