Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC51ECE78
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 13:34:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgRfI-0001AI-M6; Wed, 03 Jun 2020 11:34:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnGI=7Q=redhat.com=phrdina@srs-us1.protection.inumbo.net>)
 id 1jgRfG-0001AD-SA
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 11:34:35 +0000
X-Inumbo-ID: 3179963a-a58e-11ea-ace8-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3179963a-a58e-11ea-ace8-12813bfff9fa;
 Wed, 03 Jun 2020 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591184072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jbak0LTaAnQiiMFNvn9Gt/Y2OHMAg9Z1OTjz5g3/Lb8=;
 b=U0gB0G6A4jI9OAogEgZF9zROw4s0dsmsGsOQYE5+73fJ+TF3ljCYjhBjIzFUVB48TjA+ED
 LZ0MrER/ng8TvywB6Ns5l90nCQKB6avkK9UJnSlxgILWpLTU05XpwdjA64XcU2+/eypJyz
 UEyyZ2gpbHyKjiKR7QvC0c71KiECIEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-Bepr0SE1PoO1ikwAqzQbEA-1; Wed, 03 Jun 2020 07:34:26 -0400
X-MC-Unique: Bepr0SE1PoO1ikwAqzQbEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EF7C107ACCD;
 Wed,  3 Jun 2020 11:34:25 +0000 (UTC)
Received: from antique-laptop (unknown [10.40.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B7F7E7F1;
 Wed,  3 Jun 2020 11:34:21 +0000 (UTC)
Date: Wed, 3 Jun 2020 13:34:18 +0200
From: Pavel Hrdina <phrdina@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)
Message-ID: <20200603113418.GB11390@antique-laptop>
References: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
 <20200603103109.GA11390@antique-laptop>
 <20200603103708.GB2892653@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200603103708.GB2892653@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: libvir-list@redhat.com, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2020 at 11:37:08AM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Jun 03, 2020 at 12:31:09PM +0200, Pavel Hrdina wrote:
> > On Tue, Jun 02, 2020 at 04:47:45PM +0100, Ian Jackson wrote:
> > > Prior to 2621d48f005a "gnulib: delete all gnulib integration",
> > > one could pass ./autogen.sh --no-git to prevent the libvirt build
> > > system from running git submodule update.
> > >=20
> > > This feature is needed by systems like the Xen Project CI which want
> > > to explicitly control the revisions of every tree.  These will
> > > typically arrange to initialise the submodules check out the right
> > > version of everything, and then expect the build system not to mess
> > > with it any more.
> >=20
> > To be honest I don't understand why would anyone want to keep track of
> > all submodules of all projects for any CI and update it manually every
> > time the upstream project changes these submodules. Sounds like a lot
> > of unnecessary work but maybe I'm missing something.
>=20
> Two possible scenarios that I think are valid
>=20
>  - The CI job script does not have network access
>  - The CI job script sees the source dir as read-only
>=20
> In both cases the CI harness would have to initialize the submodule
> before runing the CI job.
>=20
> I don't know if this is what Xen CI is hitting, but I think the
> request is reasonable none the less.
>=20
> Both Jenkins and GitLab CI have option to make the harness init
> submodules prior to the job running.

My point was that running 'git submodule update --init' will not change
anything if all submodules are updated to the correct revision and if
the repository was pre-created with submodules and is read-only when the
test is executed the git command will not fail as well and everything
will be fine.

If the submodules are not updated to the correct revision then it will
fail and notify the CI users that something is broken.

There should not be any need to disable this explicitly unless you want
to build libvirt with different revisions of submodules.

> > > Despite to the old documentation comments referring only to gnulib,
> > > the --no-git feature is required not only because of gnulib but also
> > > because of the other submodule, src/keycodemapdb.
> > >=20
> > > (And in any case, even if it were no longer required because all the
> > > submodules were removed, it ought ideally to have been retained as a
> > > no-op for compaibility reasons.)
> >=20
> > Well, we will break a lot more by switching to Meson build system where
> > everyone building libvirt will have to change their scripts as it will
> > not be compatible at all.
>=20
> Yes, but I think that's tangential, as the two above reasons will
> still apply, and Meson will cope with having submodules pre-initialized.

Yes, these are unrelated and I just wanted to point out that
compaibility reasons are in most cases not valid to changes to build
system or moving files around in git repository and so on.

Pavel

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcbzs91ho/coWWY7aUi1kczAH4YwFAl7XiroACgkQUi1kczAH
4Yy+UxAAqbVqkN2Cc0PyW3DI637tUGNiPTgO4rdD4D9sL4IVgRVGBDQvJxk8+qv/
ifbVs139Amrn5ELB2comrvsWFF5PVjbbQMYH0DnuIz3AHGvjKb7uUzcmx0HgWLbE
uhMqPkD1ClzzeNJXd73eFcSJPn72UZP1Opsm6KZOhIb1KXA1BDC4v5V96GvY0N69
W9j2L+uuMiiWtBJWBCsTBKxd1Eokq38djuoaaHzup87+jCwkmGEnNqLTdVIYqSPt
D9WffH/9RA5KT92PPccpNfl8CuOn0lGf2H6JY+F7Q8PonC9vVNWlS2mB+NymErLf
Hihs216IiGs4I58TJ2hkEpj8rfxIa4ygUg6DgUBgsnS+HICcr6xehyYchgfv6nhC
rhn0flQDa39ib/jKscRagkL6Wkbb872EDGDn85LaLz3kzOVmrBn6CmjaKXTlfJkJ
HqnJ/OpEySQUt2SjPBdalLkAebjr8CF1jCogkd8XzyTFpTSdOr+l164jBBMXdZy+
RGN3wskVv0bk6q9RZik3rE3Ivdc8WMABX4gvJN2I9ZwXwjSpjkMBWMWV1WYi1XaV
CoVFKzWY/LaVcQU+f2jLOXVxe6rIW+qxaYhA2J50E2zl2gM7Xu0EFP+KEenH2sw7
Kx60uvc7aAK0XZdQ5W3IOKlsr2HzzaYtvew26EQPCqv/1kDjDys=
=TnYM
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--


