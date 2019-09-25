Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F36BE369
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 19:35:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDB8k-0006SE-JO; Wed, 25 Sep 2019 17:31:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDB8j-0006S8-D7
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 17:31:45 +0000
X-Inumbo-ID: 578efb8e-dfba-11e9-9638-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 578efb8e-dfba-11e9-9638-12813bfff9fa;
 Wed, 25 Sep 2019 17:31:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 38DC2AE2F;
 Wed, 25 Sep 2019 17:31:43 +0000 (UTC)
Message-ID: <6fc8d0ec1a819fdd0e15ec8ea72ef3a7d8f7287c.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?ISO-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>
Date: Wed, 25 Sep 2019 19:31:42 +0200
In-Reply-To: <d23fd6a3-9d37-90eb-3837-6fed5a1189ad@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-37-jgross@suse.com>
 <c0f32c90-843a-c5c0-66ff-fe3d5ff879ae@suse.com>
 <a790d1ec-c2f4-f964-d18f-50dfe9acde69@suse.com>
 <d23fd6a3-9d37-90eb-3837-6fed5a1189ad@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 36/47] xen/sched: carve out freeing
 sched_unit memory into dedicated function
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1138602274191316160=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1138602274191316160==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-IPlgQ82Gx/YbC1ltdHej"


--=-IPlgQ82Gx/YbC1ltdHej
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 15:16 +0200, Jan Beulich wrote:
> On 25.09.2019 15:09, J=C3=BCrgen Gro=C3=9F wrote:
> >=20
> There are cases where this is indeed the better approach; perhaps
> that even the typical case. But here you spend an entire patch on
> re-doing what you've done before. So ...
>=20
> > I can merge this patch into patch 3 if you like that better.
>=20
> ... yes, personally I'd prefer this, but in the end it's the call
> of the scheduler maintainers.
>
Yes, I think I like it better too for the patches to be merged.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-IPlgQ82Gx/YbC1ltdHej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LpH4ACgkQFkJ4iaW4
c+7HLxAAjWNsWl8FWkU8JlXtXzcAo1DSmXGn8QbfgAWytRAIN3EiPgt0rh92XuWS
iNghn7GZsf2PvqOEhHxDNrUaHqEVcy/LcvjKASWV1skL+xWbmVFSqcIdL6/Og/Us
Ed0krfiajvFMOuFuvdTR+nkJBpyzjWyV7FaMcBml6/w8s+rr1OwdXpUsOfBXqyOa
+kD7XidfzJFm0sTCJ/HJlj2NsLL95/ZH9MtZfpv3vQx/tx7emhhVYTa6vRxvvFZH
Xhg8WkaXArOw7mvOrZbVtlCijCGpP39t/eKG8Wzy+Kf6u16rFByxDVGVSZD2TpDZ
4fcIf8Qmf9awKdJFj1d0QhOpOdNauc46j1pObFpTx9GQFdgB+H8gFVhSqs/5Xdqp
6xaEAhqcpziNEeumztrISVo1hROPNIAfCFfyV4ctsnAKSDSoT3qfuVt5aXD+WDe+
RvcFBzpOwSNvLS7bYwgjQgsXQjPkUPw6W1Z0S9JwFEcorqHbVz+u5sAg+ZlNfvtU
GlhdOzeGnEAAKAbv70P7IUNVwuyvRD7h3l7TPvXnk2hSCjbUffb+fVT3QpU3+7BB
LpJjFh43/ty6SXLGvwKz8MUTQgpc2WFn4ORQ1qzTOv3aez/Z6oqgmajG9aukBVb4
nNHKhCsFemBh3GHQflKVr5VMeE6mqlG0PWL0GErdlygVvULz8s0=
=L/Jg
-----END PGP SIGNATURE-----

--=-IPlgQ82Gx/YbC1ltdHej--



--===============1138602274191316160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1138602274191316160==--


