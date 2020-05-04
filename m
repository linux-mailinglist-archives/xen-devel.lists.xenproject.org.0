Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED11C3D72
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 16:47:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVcMb-0003iZ-Du; Mon, 04 May 2020 14:46:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZT0=6S=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jVcMa-0003iU-KT
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 14:46:32 +0000
X-Inumbo-ID: 0a6fa942-8e16-11ea-9d2c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a6fa942-8e16-11ea-9d2c-12813bfff9fa;
 Mon, 04 May 2020 14:46:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 926DDAA7C;
 Mon,  4 May 2020 14:46:31 +0000 (UTC)
Message-ID: <598252160488c067b65c51bb91bdd5446ba67989.camel@suse.com>
Subject: Re: [PATCH v3] sched: print information about scheduling granularity
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
Date: Mon, 04 May 2020 16:46:28 +0200
In-Reply-To: <b8f74570-fc9f-61c5-7e52-c2a50e8350dc@suse.com>
References: <20200422093010.12940-1-sergey.dyasli@citrix.com>
 <b8f74570-fc9f-61c5-7e52-c2a50e8350dc@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-kjjKoyzQMaEXrnSEV1t0"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-kjjKoyzQMaEXrnSEV1t0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-22 at 12:50 +0200, Jan Beulich wrote:
> On 22.04.2020 11:30, Sergey Dyasli wrote:
> > +struct sched_gran_name {
> > +    enum sched_gran mode;
> > +    const char *name;
> > +};
> > +
> > +static const struct sched_gran_name sg_name[] =3D {
> > +    {SCHED_GRAN_cpu, "cpu"},
> > +    {SCHED_GRAN_core, "core"},
> > +    {SCHED_GRAN_socket, "socket"},
> > +};
>=20
> Personally I think that in cases like this one it is more
> (space) efficient to use char[8] or so for the second
> struct member.
>
Yeah, I think that is actually better.

Sergey, can you do it like this?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-kjjKoyzQMaEXrnSEV1t0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6wKsQACgkQFkJ4iaW4
c+72HA//Zg6x3lTdZhoTyGvdeUnZkkcw+m93Vweer8vXzK5OUDEVgB1gaZWrtdkc
0kxeCASHzFXSqAUXEOa9tkyUlXR9Exez3nyvJZGPx//2FMxemrlSZ55X+Cy7kKgZ
DucE9LNF+AXr3NbxdU0x8sJECaH8Ke34GyAYWdDDHpt0HHelbiKWXradPdZsiZzu
kIz2cLXOajNaQebaCfMcklB/0I8sdZCUrvVhkW/UnKyl8oYSyurcoRUOOgMe3bVN
TpNaKZau43hSzpyDZ6KhxrR+em7SyaglHZQ01gyV/wfFDsIfwaB/qvBVu0rOyt1F
2q17KMWlY0MGJQ/e0tzTBbDE/uu3E1I9CnyL81lNhxpR84hSPv/5WWJQG2idl6Ik
KNCTNaeWhmYb4xqShHj4P9bjcsXSQn0B1c6jOxojlsAalFq2KFC6XSjY+jFnx7ZE
9Tq3pGl3uasmVx+LoJVL28kkht+B5OpwoIjZjH53rp0Bq9Y2Ei52HsaQ+arJdjyP
HK3VV33Jt2BL14Sqd08+T5oiPy9hJ3VrpXMJAit2DzWLNlsjH/uICMh6EeItBPzN
WKOvsXJ0ZUpWbIm86/q9oEIa6xKZKLGchXniB8gJlyq9vJ7DNJp8T524u7tYKVPN
f+XHDAFg4c4xvUddGMsLwury7X5kLpDkon0jT4r6O9TTCOyeKmg=
=yrbM
-----END PGP SIGNATURE-----

--=-kjjKoyzQMaEXrnSEV1t0--


