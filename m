Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3C810D24
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:15:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653794.1020363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLL8-0001uq-M5; Wed, 13 Dec 2023 09:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653794.1020363; Wed, 13 Dec 2023 09:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLL8-0001ro-JQ; Wed, 13 Dec 2023 09:15:38 +0000
Received: by outflank-mailman (input) for mailman id 653794;
 Wed, 13 Dec 2023 09:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zJ/P=HY=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rDLL7-0001ri-A6
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 09:15:37 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c249dea-9998-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 10:15:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id ACBC820157;
 Wed, 13 Dec 2023 10:15:34 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zC7K8fMlobKP; Wed, 13 Dec 2023 10:15:34 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 55CC020101;
 Wed, 13 Dec 2023 10:15:34 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rDLL3-0000000DMvq-3xUM; Wed, 13 Dec 2023 10:15:33 +0100
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
X-Inumbo-ID: 2c249dea-9998-11ee-98e9-6d05b1d4d9a1
Date: Wed, 13 Dec 2023 10:15:33 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] MAINTAINERS: add me as Mini-OS maintainer
Message-ID: <20231213091533.fmtbldd27dx7novc@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231207073012.25730-1-jgross@suse.com>
 <cbce8db0-bda5-4973-a105-7d5b2703b64d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jg26aeftgvflkdsg"
Content-Disposition: inline
In-Reply-To: <cbce8db0-bda5-4973-a105-7d5b2703b64d@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)


--jg26aeftgvflkdsg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jan Beulich, le mer. 13 d=C3=A9c. 2023 10:02:43 +0100, a ecrit:
> On 07.12.2023 08:30, Juergen Gross wrote:
> > I've been the main contributor to Mini-OS since several years now.
> > Add me as a maintainer.
> >=20
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> No matter what ./MAINTAINERS says about the file itself, I think this cha=
nge
> primarily wants approving by you, Samuel, as the only present maintainer.

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -439,8 +439,8 @@ F:	xen/test/livepatch/*
> > =20
> >  MINI-OS
> >  M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
> > +M:	Juergen Gross <jgross@suse.com>
> >  R:	Wei Liu <wl@xen.org>
> > -R:	Juergen Gross <jgross@suse.com>
> >  S:	Supported
> >  L:	minios-devel@lists.xenproject.org
> >  T:	git https://xenbits.xenproject.org/git-http/mini-os.git

--jg26aeftgvflkdsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEqpLrvfAUiqYaQ7iu5IlMrEVBS7AFAmV5di0ACgkQ5IlMrEVB
S7D4phAAhvVSKSN7GiqDsz/uOgVGm4l7kyIYo426GdIWGFIp/nBHOjuu0KJGtm/7
QeGCvr+gZW3TcgOpmYxkoACCEYTF/i8rrhqXpqhdkQwQjYnfx5ChQ1D3MTZAPTSx
rpoPyyiFDJ6I+F+8t0ieQ/UVBgMJROUJTUxk8gAyjkzAG/FqeqvMzgzys4kLJJsb
B6F4yi1YfrctcHftzpJVChzwj2V28JsOwMYo3DQyVF4MZVHnybl7J5TJnzE2c1JC
A5sIJCKTJoCJVagFHIQ/VJGcPen0X/cukm53hmnoazYWAFL9f3wAJCPqrUXDKn/O
o4n5jeas1e89Gp7Kiy8YCJ3Baz5NsXmZbf1eSzuhEZxOAIdXuCEViZ3ZbW0oB4bU
EppFtYD0hoUJCA4y5FDhSJ9veoJV49YmRzZUd3Oav7ApqUxVAY9t39SdB8W/kTQJ
La5i2/cCBl6pDeroQDVM7Qc5oJgnetazgDarnwzGHUUuDFvbSH3AmWu7iqkKKRb5
xNfg55XZ4aYSCP/aOB9kO2EgfkxqqfqykGPyT4mJn2D2SHunBA0pw5nZLKDrEknn
eq91g7Yyv86xUa5w6LTk5Lm7YpDVEUAJ3DaZ4b8KG7D2ilWz14be6vD6vrtXNQ8S
HfPXfJCY73+xWSz8NC15y3VH6CAU+izNJwWVF/LMpOaAvJvTqRE=
=E+Uq
-----END PGP SIGNATURE-----

--jg26aeftgvflkdsg--

