Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF7158C6C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 11:11:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1SSE-0002q4-3Q; Tue, 11 Feb 2020 10:07:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H8PB=37=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j1SSC-0002pz-NL
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 10:07:40 +0000
X-Inumbo-ID: 55d154a4-4cb6-11ea-b54d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55d154a4-4cb6-11ea-b54d-12813bfff9fa;
 Tue, 11 Feb 2020 10:07:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97E8CAE54;
 Tue, 11 Feb 2020 10:07:37 +0000 (UTC)
Message-ID: <4a22b68a38e2198c3747f9da2a86d72af2d82e7b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Tue, 11 Feb 2020 11:07:36 +0100
In-Reply-To: <d3ef20e2-82c5-5b60-3bde-b3093565980d@suse.com>
References: <20200210164533.29549-1-jgross@suse.com>
 <042afa6eee4bc8e9316e636bf30f0a2190f7ee11.camel@suse.com>
 <d3ef20e2-82c5-5b60-3bde-b3093565980d@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: remove pointless ASSERT() in
 credit2
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2271151525795094830=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2271151525795094830==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MW3clZOP26fVrw7a7Q0Y"


--=-MW3clZOP26fVrw7a7Q0Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-02-11 at 10:36 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 11.02.20 10:29, Dario Faggioli wrote:
> >=20
> > TBH, though, considering the nature of the check, I'd rather keep
> > the
> > ASSERT() and kill the BUG_ON().
> >=20
> > I can do the patch myself if you don't want to respin it that way.
>=20
> I'll respin.
>
Thanks!

On an not so related note... I have that other patch of yours, the one
about Credit2 runqueues on my list.

Sorry it's taking a while to review it properly. I'll try to get to it
ASAP.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-MW3clZOP26fVrw7a7Q0Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5CfOgACgkQFkJ4iaW4
c+5pOQ/+P3wEF7jdBOhHbRBeR90NIGY6uoZHyQ/K7xxXgDFqzkxZlzQUqC/78ljb
lqVvxGY8cH+Zfg9TgzKpGE+HgNpoSGHZbF6b1UIwJp3fvdSDBkkxIKgobwto27Sz
uIFAA7GtBVw44kod/rFdshB9AJMQzsFugDmX9qiqETsxN/boqFK3fcFGLNNo8xOo
fFB7FZOg8aMbe1xsgHlIUvxYpQAfpxaOQb9LwCu4AOSIftrJR6T+FEU0oZKm3VXl
IbYMqM/F1CjBYYu+sMpe7zZhvgv5dOsIg1CtkC3tWMgD2+f0pTsuuXsHURk70bQu
SiYwZQJr6+89dO/jnftkKoQ1EwfVaZLNDBR69TBZVvD6R1dAgG3Hv+6Y8CiD5cDd
Hw5Ufwm1pdRUZ9zxH/3oMX9/EmgV+05m6aVd5IoADa7espdmGlQ8BACpYoyDLr+M
WQGVvIN7orTFnfxkI1wSWqqHzanLVLBRMvhyQWzj36RMNxiKokw7ffHrSm3SNh69
tQK3S8dqvIll7UYha6V43FBu/YDTz8Y/f1DYyOIVHWu2CQXji2Zv55gatngwwPAS
F1LiEtYuiAKiHSqHegtqb66rdVc8VfPIMQcmQMlyq0PRu713oc+Oefqj9Dh6ojuC
GB0gH4/Tb3uAvlNCiVbLs98a/OrquRIHEk2lRnDTK31bB4TaF4w=
=acPh
-----END PGP SIGNATURE-----

--=-MW3clZOP26fVrw7a7Q0Y--



--===============2271151525795094830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2271151525795094830==--


