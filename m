Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37998313AC0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 18:24:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82992.153589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9AFw-0002Jf-Cx; Mon, 08 Feb 2021 17:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82992.153589; Mon, 08 Feb 2021 17:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9AFw-0002JG-9i; Mon, 08 Feb 2021 17:23:24 +0000
Received: by outflank-mailman (input) for mailman id 82992;
 Mon, 08 Feb 2021 17:23:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pnXs=HK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9AFv-0002JB-J2
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:23:23 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b8e438d-457f-4613-a8df-d374274a324f;
 Mon, 08 Feb 2021 17:23:22 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 005e38x18HNI5Qc
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Feb 2021 18:23:18 +0100 (CET)
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
X-Inumbo-ID: 3b8e438d-457f-4613-a8df-d374274a324f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612805001;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=/PVjxoVd9QfON2M8su6lMcKonZepM1EeGXkK66OwFUk=;
	b=bzXum8gnHzG9TBxO3tHbLbd8ElvBaR4E8M5RopOT2CE54xwTzqLq5FjHgyVcTIVvkv
	AwLsBv6S58BDO4ZfysJGRjki52k/tM8KjHL+JDd4xY4syimiFEBZM0mp/TtLHdpEgXDK
	aXOioFYB79nq4iZKkthbwQO9Z6Vih2Q9/k3IPkkT+wTl3tu6wH9aAtrVPqObtetwhY9N
	Q2eTEMvvueV822mAZLPBz2nCn/eAQ+vmDlF8uIj5eqMQn3onUerLfKD9AYA0RGLH+VDA
	jNjFJj8DWuim6w591NYz1RoL0zY3JfoiCeC7zxhhxx8BD1anKsxv+Ju4P7fgLpogJjwN
	+eEw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Mon, 8 Feb 2021 18:23:11 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210111 05/39] tools: add with-xen-scriptdir configure
 option
Message-ID: <20210208182311.53dac1a3.olaf@aepfle.de>
In-Reply-To: <24609.24785.791060.128298@mariner.uk.xensource.com>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-6-olaf@aepfle.de>
	<24609.24785.791060.128298@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KRediBe/B+uUOAS09ebVvfq"; protocol="application/pgp-signature"

--Sig_/KRediBe/B+uUOAS09ebVvfq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 8 Feb 2021 16:03:29 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> I suggest this commit message as a compromise:
>=20
>   Some distros plan for fresh installations will have an empty /etc,
>   whose content will not be controlled by the package manager
>   anymore.
>=20
>   To make this possible, add a knob to configure to allow storing the
>   hotplug scripts to libexec instead of /etc/xen/scripts.
>=20
> Olaf, would that be OK with you ?

Yes, this is fine. Thanks.


> As for detailed review:
>=20
> > diff --git a/m4/paths.m4 b/m4/paths.m4
> > index 89d3bb8312..0cec2bb190 100644
> > --- a/m4/paths.m4
> > +++ b/m4/paths.m4 =20
> ...
> > +AC_ARG_WITH([xen-scriptdir],
> > +    AS_HELP_STRING([--with-xen-scriptdir=3DDIR],
> > +    [Path to directory for dom0 hotplug scripts. [SYSCONFDIR/xen/scrip=
ts]]),
> > +    [xen_scriptdir_path=3D$withval],
> > +    [xen_scriptdir_path=3D$sysconfdir/xen/scripts]) =20
> ...
> > -XEN_SCRIPT_DIR=3D$XEN_CONFIG_DIR/scripts
> > +XEN_SCRIPT_DIR=3D$xen_scriptdir_path
> >  AC_SUBST(XEN_SCRIPT_DIR) =20
>=20
> It is not clear to me why the deefault is changed from
> "$XEN_CONFIG_DIR/scripts" to "$sysconfdir/xen/scripts" and there isn't
> any explanation for this in the commit message.  I think this may make
> no difference but an explanation is called for.

The reason is the ordering of assignments in the file:
AC_ARG_WITH comes early in the file, XEN_CONFIG_DIR=3D is assigned much lat=
er.

It seems the assignments for CONFIG_DIR and XEN_CONFIG_DIR can be moved up,=
 because $sysconfdir is expected to be set already. As a result the new AC_=
ARG_WITH=3D can continue to use "$XEN_CONFIG_DIR/scripts" for the default c=
ase. I assume the current ordering is to have a separate AC_ARG_WITH and AC=
_SUBST section.

Olaf

--Sig_/KRediBe/B+uUOAS09ebVvfq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAhc38ACgkQ86SN7mm1
DoDXZw//TixZZSjh6sLj7ASOkbUTN3HQ0Bft6GNfUaRv47tL+XbeST+tNPbTF65h
Oz4Pi1M/QdkLtGony0s84B6AQDQSzYys1AH0Ew083Hcn5jQTyktTSgCQEAUxqc7E
2Rw0NmMURSYcpsDMmhxSwS0vLOkG2zcryM9DvsSuE62zfoorE09GJY+MGX4O2CbL
CszVovz0RS4J8SwrhVejCpL4Ol1FJVHQlt6wP0RAbt3CqKnqcWlXsfpyJds6jbrD
tu053fNtQQ0/FJx17Mn3qf63e0DWKlXKPP4txfx8x0JCX7OI4MNen6JmyfMp/Evy
0y+CxfZ/ctyzwYLAURWpBfYgcvWFtV2Pudzcu7hOSnoLwLNT05suRFQbAnOuQII+
8N15nudQzgPMia4WOd9H9NhC5tz6FsjJNK0DNBl5+KMAuLX0x5OL/WyaqqDPSjGS
r7IWH4HVJHgKZwt8j6sI1owR94njRF7cjQ3qxwhRrMexHKMnuSdsccc1ne9EFANb
qkfhes5dKhYk9rR+0PbBo7ZbYNeYHQsNH+VbzXB+8/dAZ9tbQ8RUYnjJy98AE+1K
YBecK4K6XfvwB5a3NexZ6J7XowkLzJyZZtO/7RTKYM4j+Pq40tvpwoYzOry0Lt8V
nfUr63QiblrMsr/3XxDHZiPDb5bQT/dD7+qO1bcT1mflnSIwbj0=
=5Ypn
-----END PGP SIGNATURE-----

--Sig_/KRediBe/B+uUOAS09ebVvfq--

