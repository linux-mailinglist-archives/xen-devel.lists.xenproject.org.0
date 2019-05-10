Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1919BAF
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 12:32:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP2mp-0005C2-M6; Fri, 10 May 2019 10:29:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=stwM=TK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hP2mn-0005Bx-Lp
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 10:29:53 +0000
X-Inumbo-ID: 8aeda7b1-730e-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8aeda7b1-730e-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 10:29:51 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Fri, 10 May 2019 12:29:50 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Fri, 10 May 2019 11:29:43 +0100
Message-ID: <4426eec2811962e9acd1808579bd3ccd6ba52769.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Date: Fri, 10 May 2019 12:29:41 +0200
In-Reply-To: <46968660-ea39-1ee0-2aee-c4a22f135ddb@suse.com>
References: =?UTF-8?B?PDIwMTkwNTA2MDY1NjQ0Ljc0MTXvv70x77+9amdyb3NzQHN1c2Uu?=
 =?UTF-8?B?Y29tPiA8MjAxOTA1MDYwNjU2NDQuNzQxNe+/vTQ277+9amdyb3NzQHN1c2UuY29t?=
 =?UTF-8?Q?=3e_=3c5CCFF6F1020000780022C12B=40suse=2ecom=3e_=3cac57c420?=
 =?UTF-8?B?77+9YTcyZe+/vTc1NzDvv71kYjhm77+9MjdlNDY5M2MyNzU1QHN1c2UuY29tPiA8?=
 =?UTF-8?Q?5CD005E7020000780022C1B5=40prv1=ef=bf=bdmh=2eprovo=2enovell=2ecom?=
 =?UTF-8?Q?=3e_=3cf7692c11-ab14-4d7d-4b7a-72e9c58e8f30=40suse=2ecom=3e_=3c5C?=
 =?UTF-8?Q?D53C1C020000780022D706=40suse=2ecom=3e?=
 <46968660-ea39-1ee0-2aee-c4a22f135ddb@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC V2 45/45] xen/sched: add scheduling
 granularity enum
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0276803082933909596=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0276803082933909596==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Wuvg7z0tfK9/A2wMCTUe"


--=-Wuvg7z0tfK9/A2wMCTUe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-05-10 at 11:00 +0200, Juergen Gross wrote:
> On 10/05/2019 10:53, Jan Beulich wrote:
> > > > > On 08.05.19 at 16:36, <jgross@suse.com> wrote:
> > >=20
> > > With sched-gran=3Dcore or sched-gran=3Dsocket offlining a single cpu
> > > results
> > > in moving the complete core or socket to cpupool_free_cpus and
> > > then
> > > offlining from there. Only complete cores/sockets can be moved to
> > > any
> > > cpupool. When onlining a cpu it is added to cpupool_free_cpus and
> > > if
> > > the core/socket is completely online it will automatically be
> > > added to
> > > Pool-0 (as today any single onlined cpu).
> >=20
> > Well, this is in line with what was discussed on the call
> > yesterday, so
> > I think it's an acceptable initial state to end up in. Albeit, just
> > for
> > completeness, I'm not convinced there's no use for "smt-
> > {dis,en}able"
> > anymore with core-aware scheduling implemented just in Xen - it
> > may still be considered useful as long as we don't expose proper
> > topology to guests, for them to be able to do something similar.
>=20
> As the extra complexity for supporting that is significant I'd like
> to
> at least postpone it. And with the (later) introduction of per-
> cpupool
> smt on/off I guess this would be even less important.
>=20
I agree.

Isn't it the case that (but note that I'm just thinking out loud here),
if we make smt=3D and sched-gran=3D per-cpupool, the user gains the chance
to use both, if he/she wants (e.g., for testing)?

If yes, is such a thing valuable enough that it'd it make sense to work
on that, as a first thing, I mean?

We'd still forbid moving things from pools with different
configuration, at least at the beginning, of course.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Wuvg7z0tfK9/A2wMCTUe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzVUpUACgkQFkJ4iaW4
c+5EZxAArkhSMDiWdnIUJ8B1JE21MDmS+ZqCKik4KsTOve+p8/By+Lpmj1u3GJ+1
LhcpBldz1bvtz4cm4h0lTBLXQJeQ3P4e2dW0GctQiS0vxMblysuiUOVrYMp6Nt7Z
gtw2Ub1KaKtSVlSJDZAc83K2dENEYzxyc7FauzyKID5tnvPV32BiR+0KRv4l1SFz
MbLT3lgS/oOn6rIxYDSlGXL26HRN3BmrZMEv1/73kCpkcib3AC/9VqbY14bbAHgK
Owl9kDwaJexjdVP52LGHle8LLRdYJOKkasTWhNNE49kMfpWTpsuHwa9RvN4iT3cI
bZMJ7weKT9H56vHmftJ1im1wL7m0k70moF91OEwier3Jc7GWh+bq+2TY2+t3aSSE
2/thBfDeqeUaWeaGhJi/hrCHJcGSzYdDG9/Mnf5gQijrOwp211zeHeIaIgQ4j1z3
MR5O6LCsWrit6WhfIz+Tlr/W5+mqSDW6PiJoZ2LDuVyhSEP8JLi3ccUhvlygQU/O
Qwtw0o7o7Xc1AWLZxtKkdQnZHujZffv19R8Qkm2Tnre3M2OUUwbt9By19tNB415c
fxDu1mX5rxo0ytX1KNVcrvt//NDkPYtk6rW/KzRUyxs7xj3BvSBWUSnuS8gwXEsV
gQGofCzwzwGCCbG3iURm+j6Rd1XSLPl+OgZbMhZ4YkJYnBw/ZV8=
=gy0X
-----END PGP SIGNATURE-----

--=-Wuvg7z0tfK9/A2wMCTUe--



--===============0276803082933909596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0276803082933909596==--


